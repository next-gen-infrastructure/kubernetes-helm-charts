{{/*
Copyright VMware, Inc.
SPDX-License-Identifier: APACHE-2.0
*/}}

{{/* vim: set filetype=mustache: */}}

{{/*
Generate backend entry that is compatible with all Kubernetes API versions.

Usage:
{{ include "common.ingress.backend" (dict "serviceName" "backendName" "servicePort" "backendPort" "context" $) }}

Params:
  - serviceName - String. Name of an existing service backend
  - servicePort - String/Int. Port name (or number) of the service. It will be translated to different yaml depending if it is a string or an integer.
  - context - Dict - Required. The context for the template evaluation.
*/}}
{{- define "common.ingress.backend" -}}
service:
  name: {{ .serviceName }}
  port:
    {{- if typeIs "string" .servicePort }}
    name: {{ .servicePort }}
    {{- else if or (typeIs "int" .servicePort) (typeIs "float64" .servicePort) }}
    number: {{ .servicePort | int }}
    {{- end }}
{{- end -}}

{{- define "common.ingress.serviceName" -}}
{{- if .Values.service.name -}}
{{ include "common.tplvalues.render" ( dict "value" .Values.service.name "context" $) }}
{{- else -}}
{{- required "global.serviceName is missing" .Values.global.serviceName }}
{{- if .Values.service.suffix -}}
-{{ .Values.service.suffix }}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Returns the ingress name: the rendered "name" override if set, else the default.
Usage:
{{ include "common.ingress.name" (dict "name" .Values.ingress.name "default" (include "common.names.fullname" .) "context" $) }}
*/}}
{{- define "common.ingress.name" -}}
{{- if .name -}}
{{- include "common.tplvalues.render" (dict "value" .name "context" .context) -}}
{{- else -}}
{{- .default -}}
{{- end -}}
{{- end -}}

{{- define "common.ingress.previewServiceName" -}}
preview-{{- include  "common.ingress.serviceName" . -}}
{{- end -}}

{{- define "common.ingress.host" -}}
{{- default (include "common.ingress.serviceName" .) .Values.ingress.hostPrefix -}}
{{- if .Values.ingress.subDomain }}.{{ required "global.environment is missing" .Values.global.environment }}{{ end -}}
.{{ .Values.global.domain }}
{{- end -}}

{{/*
Returns true if the ingressClassname field is supported
Usage:
{{ include "common.ingress.supportsIngressClassname" . }}
*/}}
{{- define "common.ingress.supportsIngressClassname" -}}
{{- print "true" -}}
{{- end -}}

{{/*
Return true if cert-manager required annotations for TLS signed
certificates are set in the Ingress annotations
Ref: https://cert-manager.io/docs/usage/ingress/#supported-annotations
Usage:
{{ include "common.ingress.certManagerRequest" ( dict "annotations" .Values.path.to.the.ingress.annotations ) }}
*/}}
{{- define "common.ingress.certManagerRequest" -}}
{{ if or (hasKey .annotations "cert-manager.io/cluster-issuer") (hasKey .annotations "cert-manager.io/issuer") (hasKey .annotations "kubernetes.io/tls-acme") }}
    {{- true -}}
{{- end -}}
{{- end -}}

{{/*
Print "true" if the API pathType field is supported
Usage:
{{ include "k8s-common.ingress.supportsPathType" . }}
*/}}
{{- define "k8s-common.ingress.supportsPathType" -}}
{{- print "true" -}}
{{- end -}}

{{/*
Returns the routes of a Traefik IngressRoute from ingress.traefik.routes (one route for the generated
host and ingress.path when the list is empty). A route matches any of its hosts (defaultHost, default
true, adds the generated host; extraHosts adds more and may use templates) and any of its paths
(default ingress.path) and carries its own middlewares (names of Middleware objects in the release
namespace). The routes target the Service named by common.ingress.serviceName plus the optional
serviceSuffix (statefulset: "-http"). With an enabled blue-green rollout an extra rule for preview-<host>
targets the preview Service and reuses the first route's middlewares.
Usage:
routes: {{- include "common.ingress.traefik.routes" (dict "context" $) | trim | nindent 4 }}
routes: {{- include "common.ingress.traefik.routes" (dict "serviceSuffix" "-http" "context" $) | trim | nindent 4 }}
*/}}
{{- define "common.ingress.traefik.routes" -}}
{{- $ctx := .context -}}
{{- $host := include "common.ingress.host" $ctx -}}
{{- $match := ternary "Path" "PathPrefix" (eq $ctx.Values.ingress.pathType "Exact") -}}
{{- $routes := $ctx.Values.ingress.traefik.routes | default (list (dict)) -}}
{{- $service := print (include "common.ingress.serviceName" $ctx) (.serviceSuffix | default "") -}}
{{- $rollouts := $ctx.Values.rollouts | default (dict) -}}
{{- range $routes }}
{{- $hosts := ternary (list $host) (list) (or (not (hasKey . "defaultHost")) .defaultHost) }}
{{- $hosts = concat $hosts (include "common.tplvalues.render" (dict "value" (.extraHosts | default list) "context" $ctx) | fromYamlArray) }}
{{- if not $hosts }}{{- fail "ingress.traefik.routes[] needs defaultHost or at least one extraHosts entry" }}{{- end }}
{{- $paths := .paths | default (list $ctx.Values.ingress.path) }}
- kind: Rule
  match: (Host(`{{ join "`) || Host(`" $hosts }}`)) && ({{ $match }}(`{{ join (printf "`) || %s(`" $match) $paths }}`))
  {{- with .middlewares }}
  middlewares:
    {{- range . }}
    - name: {{ . }}
      namespace: {{ include "common.names.namespace" $ctx | quote }}
    {{- end }}
  {{- end }}
  services:
    - name: {{ $service }}
      port: http
{{- end }}
{{- if and (eq ($rollouts.strategy | default "") "blueGreen") $rollouts.enabled }}
- kind: Rule
  match: Host(`preview-{{ $host }}`) && {{ $match }}(`{{ $ctx.Values.ingress.path }}`)
  {{- with (first $routes).middlewares }}
  middlewares:
    {{- range . }}
    - name: {{ . }}
      namespace: {{ include "common.names.namespace" $ctx | quote }}
    {{- end }}
  {{- end }}
  services:
    - name: {{ include "common.ingress.previewServiceName" $ctx }}
      port: http
{{- end }}
{{- end -}}
