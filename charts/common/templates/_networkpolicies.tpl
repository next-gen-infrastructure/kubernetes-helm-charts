{{/*
Rule lists for the network policy templates of the application charts. Each helper returns a YAML list
(empty string when there are no rules); the chart template wraps it in the policy skeleton:

  common.networkpolicy.ingress / .egress                 rules of a NetworkPolicy
  common.networkpolicy-cilium.ingress / .egress          rules of a CiliumNetworkPolicy

Usage:
{{- $ingress := include "common.networkpolicy.ingress" . | trim }}

Ingress peers: ingress controller / same namespace / allowedNamespaces, allowPodSelectors (when the whole namespace
is not allowed) and the Prometheus namespace (metrics port only). Ports come from service.ports and sidecar service.ports;
none listed means all ports. Egress is empty (open) unless egress.fqdns or extraEgress is set.
extraIngress / extraEgress are raw rules in the native format of the kind.
*/}}

{{/* NetworkPolicy ingress rules */}}
{{- define "common.networkpolicy.ingress" -}}
{{- $np := .Values.networkPolicy }}
{{- $ns := include "common.names.namespace" . }}

{{- $ports := list }}
{{- $portsByName := dict }}
{{- range concat (list (dict "service" .Values.service)) (default (list) .Values.sidecarContainers) }}
  {{- range $name, $port := default (dict) (.service | default (dict)).ports }}
    {{- $spec := dict "port" (include "common.ports.containerPort" $port | int) "protocol" (include "common.ports.protocol" $port) }}
    {{- $ports = append $ports $spec }}
    {{- $_ := set $portsByName $name $spec }}
  {{- end }}
{{- end }}

{{- $allowedNamespaces := list }}
{{- if $np.allowIngressFromIngressController }}{{ $allowedNamespaces = append $allowedNamespaces $np.ingressControllerNamespace }}{{ end }}
{{- if $np.allowSameNamespace }}{{ $allowedNamespaces = append $allowedNamespaces $ns }}{{ end }}
{{- $allowedNamespaces = concat $allowedNamespaces (default (list) $np.allowedNamespaces) | uniq }}

{{- /* specific pods of the release namespace, only when the whole namespace is not allowed */}}
{{- $allowedPods := ternary (list) (default (list) $np.allowPodSelectors) $np.allowSameNamespace }}

{{- /* empty unless metrics are enabled; Prometheus may scrape the metrics port only */}}
{{- $prometheusNamespace := and (.Values.metrics).enabled (.Values.metrics).prometheusNamespace }}

{{- if $allowedNamespaces }}
- from:
    {{- range $allowedNamespaces }}
    - namespaceSelector:
        matchLabels:
          kubernetes.io/metadata.name: {{ . | quote }}
    {{- end }}
  {{- with $ports }}
  ports: {{ toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
{{- if $allowedPods }}
- from:
    {{- range $allowedPods }}
    - podSelector:
        matchLabels: {{ toYaml . | nindent 10 }}
    {{- end }}
  {{- with $ports }}
  ports: {{ toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
{{- if $prometheusNamespace }}
- from:
    - namespaceSelector:
        matchLabels:
          kubernetes.io/metadata.name: {{ $prometheusNamespace | quote }}
  {{- with get $portsByName (toString .Values.metrics.port) }}
  ports: {{ toYaml (list .) | nindent 4 }}
  {{- end }}
{{- end }}
{{- with $np.extraIngress }}
{{ include "common.tplvalues.render" (dict "value" . "context" $) }}
{{- end }}
{{- end -}}

{{/* NetworkPolicy egress rules. Fails on egress.fqdns, which only Cilium supports */}}
{{- define "common.networkpolicy.egress" -}}
{{- $np := .Values.networkPolicy }}
{{- if ($np.egress).fqdns }}
  {{- fail "networkPolicy.egress.fqdns requires networkPolicy.cilium=true" }}
{{- end }}
{{- if $np.extraEgress }}
  {{- if ($np.egress).allowDNS }}
- to:
    - namespaceSelector:
        matchLabels:
          kubernetes.io/metadata.name: kube-system
      podSelector:
        matchLabels:
          k8s-app: kube-dns
  ports:
    - port: 53
      protocol: UDP
    - port: 53
      protocol: TCP
  {{- end }}
{{ include "common.tplvalues.render" (dict "value" $np.extraEgress "context" $) }}
{{- end }}
{{- end -}}

{{/* CiliumNetworkPolicy ingress rules. Empty when nothing is allowed: the chart renders `- {}` (default deny) */}}
{{- define "common.networkpolicy-cilium.ingress" -}}
{{- $np := .Values.networkPolicy }}
{{- $ns := include "common.names.namespace" . }}

{{- /* Cilium wants string ports */}}
{{- $ports := list }}
{{- $portsByName := dict }}
{{- range concat (list (dict "service" .Values.service)) (default (list) .Values.sidecarContainers) }}
  {{- range $name, $port := default (dict) (.service | default (dict)).ports }}
    {{- $spec := dict "port" (include "common.ports.containerPort" $port | toString) "protocol" (include "common.ports.protocol" $port) }}
    {{- $ports = append $ports $spec }}
    {{- $_ := set $portsByName $name $spec }}
  {{- end }}
{{- end }}

{{- $allowedNamespaces := list }}
{{- if $np.allowIngressFromIngressController }}{{ $allowedNamespaces = append $allowedNamespaces $np.ingressControllerNamespace }}{{ end }}
{{- if $np.allowSameNamespace }}{{ $allowedNamespaces = append $allowedNamespaces $ns }}{{ end }}
{{- $allowedNamespaces = concat $allowedNamespaces (default (list) $np.allowedNamespaces) | uniq }}

{{- /* specific pods of the release namespace, only when the whole namespace is not allowed */}}
{{- $allowedPods := ternary (list) (default (list) $np.allowPodSelectors) $np.allowSameNamespace }}

{{- /* empty unless metrics are enabled; Prometheus may scrape the metrics port only */}}
{{- $prometheusNamespace := and (.Values.metrics).enabled (.Values.metrics).prometheusNamespace }}

{{- if $allowedNamespaces }}
- fromEndpoints:
    {{- range $allowedNamespaces }}
    - matchLabels:
        "k8s:io.kubernetes.pod.namespace": {{ . | quote }}
    {{- end }}
  {{- with $ports }}
  toPorts:
    - ports: {{ toYaml . | nindent 8 }}
  {{- end }}
{{- end }}
{{- if $allowedPods }}
- fromEndpoints:
    {{- range $allowedPods }}
    - matchLabels: {{ toYaml (merge (dict "k8s:io.kubernetes.pod.namespace" $ns) .) | nindent 10 }}
    {{- end }}
  {{- with $ports }}
  toPorts:
    - ports: {{ toYaml . | nindent 8 }}
  {{- end }}
{{- end }}
{{- if $prometheusNamespace }}
- fromEndpoints:
    - matchLabels:
        "k8s:io.kubernetes.pod.namespace": {{ $prometheusNamespace | quote }}
  {{- with get $portsByName (toString .Values.metrics.port) }}
  toPorts:
    - ports: {{ toYaml (list .) | nindent 8 }}
  {{- end }}
{{- end }}
{{- with $np.extraIngress }}
{{ include "common.tplvalues.render" (dict "value" . "context" $) }}
{{- end }}
{{- end -}}

{{/* CiliumNetworkPolicy egress rules. Empty (open) unless egress.fqdns or extraEgress is set */}}
{{- define "common.networkpolicy-cilium.egress" -}}
{{- $np := .Values.networkPolicy }}
{{- $fqdns := default (list) ($np.egress).fqdns }}
{{- if or $fqdns $np.extraEgress }}
  {{- if ($np.egress).allowDNS }}
- toEndpoints:
    - matchLabels:
        "k8s:io.kubernetes.pod.namespace": kube-system
        k8s-app: kube-dns
  toPorts:
    - ports:
        - port: "53"
          protocol: ANY
      rules:
        dns:
          - matchPattern: "*"
  {{- end }}
  {{- with $fqdns }}
- toFQDNs:
    {{- range . }}
    - {{ ternary "matchPattern" "matchName" (contains "*" .) }}: {{ . | quote }}
    {{- end }}
  {{- end }}
  {{- with $np.extraEgress }}
{{ include "common.tplvalues.render" (dict "value" . "context" $) }}
  {{- end }}
{{- end }}
{{- end -}}
