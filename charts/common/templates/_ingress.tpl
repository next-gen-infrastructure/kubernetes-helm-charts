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

{{- define "common.ingress.domain" -}}
{{- if eq .Values.global.environment "prod" -}}
{{ .Values.global.domain }}
{{- else -}}
{{ substr 0 4 .Values.global.project }}.{{ .Values.global.env }}.{{ .Values.global.domain }}
{{- end -}}
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

{{- define "common.ingress.previewServiceName" -}}
preview-{{- include  "common.ingress.serviceName" . -}}
{{- end -}}

{{- define "common.ingress.host" -}}
{{- include  "common.ingress.serviceName" . -}}.{{- include  "common.ingress.domain" . -}}
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
Labels to use on deploy.spec.selector.matchLabels and svc.spec.selector
*/}}
{{- define "common.ingress.annotations" -}}
{{- if eq .Values.ingress.className "alb" -}}
kubernetes.io/ingress.class: "alb"

alb.ingress.kubernetes.io/actions.ssl-redirect: "{\"Type\":\"redirect\",\"RedirectConfig\":{\"Protocol\":\"HTTPS\",\"Port\":\"443\",\"StatusCode\":\"HTTP_301\"}}"
alb.ingress.kubernetes.io/backend-protocol: "HTTP"
# group name as cluster-name and optional '-public'
alb.ingress.kubernetes.io/group.name: {{ .Values.global.project }}-{{ .Values.global.environment }}{{ if .Values.ingress.public -}}-public{{- end }}
alb.ingress.kubernetes.io/healthcheck-path: "{{ .Values.service.healthCheckPath | default "/" }}"
alb.ingress.kubernetes.io/listen-ports: "[{\"HTTP\":80},{\"HTTPS\":443}]"
alb.ingress.kubernetes.io/scheme: {{ if .Values.ingress.public -}}internet-facing{{- else -}}internal{{- end }}
alb.ingress.kubernetes.io/security-groups: "generic-web{{ if .Values.ingress.public -}} ,generic-public-web{{- end -}}"
alb.ingress.kubernetes.io/ssl-policy: "ELBSecurityPolicy-TLS-1-2-2017-01"
alb.ingress.kubernetes.io/success-codes: "200"
alb.ingress.kubernetes.io/target-type: "ip"
{{- end -}}
{{- end -}}

{{- define "common.ingressExtra.annotations" -}}
{{- if eq .Values.ingressExtra.className "alb" -}}
kubernetes.io/ingress.class: "alb"

alb.ingress.kubernetes.io/actions.ssl-redirect: "{\"Type\":\"redirect\",\"RedirectConfig\":{\"Protocol\":\"HTTPS\",\"Port\":\"443\",\"StatusCode\":\"HTTP_301\"}}"
alb.ingress.kubernetes.io/backend-protocol: "HTTP"
alb.ingress.kubernetes.io/group.name: {{ .Release.Namespace }}-extra
alb.ingress.kubernetes.io/healthcheck-path: "{{ .Values.service.healthCheckPath | default "/" }}"
alb.ingress.kubernetes.io/listen-ports: "[{\"HTTP\":80},{\"HTTPS\":443}]"
alb.ingress.kubernetes.io/scheme: {{ if .Values.ingressExtra.public -}}internet-facing{{- else -}}internal{{- end }}
alb.ingress.kubernetes.io/security-groups: "generic-web{{ if .Values.ingressExtra.public -}} ,generic-public-web{{- end -}}"
alb.ingress.kubernetes.io/ssl-policy: "{{ .Values.ingressExtra.tlsPolicy | default "ELBSecurityPolicy-TLS-1-2-2017-01"}}"
alb.ingress.kubernetes.io/success-codes: "200"
alb.ingress.kubernetes.io/target-type: "ip"
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
