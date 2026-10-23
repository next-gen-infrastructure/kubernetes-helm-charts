{{/*
Renders a NetworkPolicy, or a CiliumNetworkPolicy when .Values.networkPolicy.cilium is true.
Usage:
{{ include "common.networkpolicy" . }}

Ingress is always restricted (default deny) to the peers namespaces; ports come from service.ports
(and sidecar service.ports). Egress is left open unless egress.fqdns or extraEgress is set.
extraIngress / extraEgress are raw rules in the native format of the selected kind.
*/}}
{{- define "common.networkpolicy" -}}
{{- $np := .Values.networkPolicy -}}
{{- if $np.enabled -}}
{{- $ctx := . -}}
{{- $cilium := $np.cilium -}}
{{- $ns := include "common.names.namespace" . -}}

{{- /* ports: cilium wants strings, NetworkPolicy ints */ -}}
{{- $ports := list -}}
{{- $byName := dict -}}
{{- $svcs := concat (list (dict "service" .Values.service)) (default (list) .Values.sidecarContainers) -}}
{{- range $svcs -}}
  {{- range $k, $v := default (dict) (.service | default (dict)).ports -}}
    {{- $p := include "common.ports.containerPort" $v | int -}}
    {{- $spec := dict "port" (ternary (toString $p) $p $cilium) "protocol" (include "common.ports.protocol" $v) -}}
    {{- $ports = append $ports $spec -}}
    {{- $_ := set $byName $k $spec -}}
  {{- end -}}
{{- end -}}

{{- /* ingress */ -}}
{{- $nss := list -}}
{{- if $np.allowIngressFromIngressController }}{{ $nss = append $nss $np.ingressControllerNamespace }}{{ end -}}
{{- if $np.allowSameNamespace }}{{ $nss = append $nss $ns }}{{ end -}}
{{- $nss = concat $nss (default (list) $np.allowedNamespaces) | uniq -}}
{{- $ingress := list -}}
{{- if $nss -}}
  {{- $ingress = append $ingress (include "common.networkpolicy.ingressRule" (dict "cilium" $cilium "namespaces" $nss "ports" $ports) | fromYaml) -}}
{{- end -}}
{{- /* prometheus may scrape the metrics port only */ -}}
{{- if and (.Values.metrics).enabled (.Values.metrics).prometheusNamespace -}}
  {{- $mports := list -}}
  {{- with get $byName (toString .Values.metrics.port) }}{{ $mports = list . }}{{ end -}}
  {{- $ingress = append $ingress (include "common.networkpolicy.ingressRule" (dict "cilium" $cilium "namespaces" (list .Values.metrics.prometheusNamespace) "ports" $mports) | fromYaml) -}}
{{- end -}}
{{- with $np.extraIngress -}}
  {{- $ingress = concat $ingress (include "common.tplvalues.render" (dict "value" . "context" $ctx) | fromYamlArray) -}}
{{- end -}}

{{- /* egress: restricted only when fqdns or extraEgress is set */ -}}
{{- $egress := list -}}
{{- $fqdns := default (list) ($np.egress).fqdns -}}
{{- if and $fqdns (not $cilium) -}}
  {{- fail "networkPolicy.egress.fqdns requires networkPolicy.cilium=true" -}}
{{- end -}}
{{- if or $fqdns $np.extraEgress -}}
  {{- if ($np.egress).allowDNS -}}
    {{- if $cilium -}}
      {{- $egress = append $egress (dict "toEndpoints" (list (dict "matchLabels" (dict "k8s:io.kubernetes.pod.namespace" "kube-system" "k8s-app" "kube-dns"))) "toPorts" (list (dict "ports" (list (dict "port" "53" "protocol" "ANY")) "rules" (dict "dns" (list (dict "matchPattern" "*")))))) -}}
    {{- else -}}
      {{- $egress = append $egress (dict "to" (list (dict "namespaceSelector" (dict "matchLabels" (dict "kubernetes.io/metadata.name" "kube-system")) "podSelector" (dict "matchLabels" (dict "k8s-app" "kube-dns")))) "ports" (list (dict "port" 53 "protocol" "UDP") (dict "port" 53 "protocol" "TCP"))) -}}
    {{- end -}}
  {{- end -}}
  {{- if $fqdns -}}
    {{- $names := list -}}
    {{- range $fqdns -}}
      {{- $names = append $names (ternary (dict "matchPattern" .) (dict "matchName" .) (contains "*" .)) -}}
    {{- end -}}
    {{- $egress = append $egress (dict "toFQDNs" $names) -}}
  {{- end -}}
  {{- with $np.extraEgress -}}
    {{- $egress = concat $egress (include "common.tplvalues.render" (dict "value" . "context" $ctx) | fromYamlArray) -}}
  {{- end -}}
{{- end -}}

{{- /* an empty rule is default-deny for Cilium; NetworkPolicy uses policyTypes */ -}}
{{- $spec := dict -}}
{{- if $cilium -}}
  {{- $_ := set $spec "endpointSelector" (dict "matchLabels" (include "common.labels.matchLabels" . | fromYaml)) -}}
  {{- $_ := set $spec "ingress" (default (list (dict)) $ingress) -}}
  {{- if $egress }}{{ $_ := set $spec "egress" $egress }}{{ end -}}
{{- else -}}
  {{- $_ := set $spec "podSelector" (dict "matchLabels" (include "common.labels.matchLabels" . | fromYaml)) -}}
  {{- $_ := set $spec "policyTypes" (ternary (list "Ingress" "Egress") (list "Ingress") (not (empty $egress))) -}}
  {{- if $ingress }}{{ $_ := set $spec "ingress" $ingress }}{{ end -}}
  {{- if $egress }}{{ $_ := set $spec "egress" $egress }}{{ end -}}
{{- end -}}
apiVersion: {{ ternary "cilium.io/v2" (include "common.capabilities.networkPolicy.apiVersion" .) $cilium }}
kind: {{ ternary "CiliumNetworkPolicy" "NetworkPolicy" $cilium }}
metadata:
  name: {{ include "common.names.fullname" . }}
  namespace: {{ $ns | quote }}
  labels: {{ include "common.labels.standard" . | nindent 4 }}
spec: {{ toYaml $spec | nindent 2 }}
{{- end -}}
{{- end -}}

{{/*
One ingress rule allowing the given namespaces to the given ports (all ports when empty).
*/}}
{{- define "common.networkpolicy.ingressRule" -}}
{{- $peers := list -}}
{{- range .namespaces -}}
  {{- if $.cilium -}}
    {{- $peers = append $peers (dict "matchLabels" (dict "k8s:io.kubernetes.pod.namespace" .)) -}}
  {{- else -}}
    {{- $peers = append $peers (dict "namespaceSelector" (dict "matchLabels" (dict "kubernetes.io/metadata.name" .))) -}}
  {{- end -}}
{{- end -}}
{{- $rule := dict (ternary "fromEndpoints" "from" .cilium) $peers -}}
{{- if .ports -}}
  {{- $_ := set $rule (ternary "toPorts" "ports" .cilium) (ternary (list (dict "ports" .ports)) .ports .cilium) -}}
{{- end -}}
{{- toYaml $rule -}}
{{- end -}}
