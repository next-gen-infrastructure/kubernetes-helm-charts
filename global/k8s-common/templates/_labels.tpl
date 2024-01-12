{{/*
Copyright VMware, Inc.
SPDX-License-Identifier: APACHE-2.0
*/}}

{{/* vim: set filetype=mustache: */}}

{{/*
Kubernetes standard labels
{{ include "k8s-common.labels.standard" (dict "customLabels" .Values.commonLabels "context" $) -}}
*/}}
{{- define "k8s-common.labels.standard" -}}
{{- if and (hasKey . "customLabels") (hasKey . "context") -}}
{{- $default := dict "app.kubernetes.io/name" (include "k8s-common.names.name" .context) "helm.sh/chart" (include "k8s-common.names.chart" .context) "app.kubernetes.io/instance" .context.Release.Name "app.kubernetes.io/managed-by" .context.Release.Service -}}
{{- with .context.Chart.AppVersion -}}
{{- $_ := set $default "app.kubernetes.io/version" . -}}
{{- end -}}
{{ template "k8s-common.tplvalues.merge" (dict "values" (list .customLabels $default) "context" .context) }}
{{- if .context.Values.datadogIntegration }}
tags.datadoghq.com/env: {{ .context.Values.global.environment }}
tags.datadoghq.com/service: {{ include "k8s-common.names.fullname" .context }}
tags.datadoghq.com/version: {{ .context.Values.global.image.tag }}
{{- end -}}
{{- else -}}
app: {{ include "k8s-common.names.fullname" . }}
app.kubernetes.io/name: {{ include "k8s-common.names.name" . }}
helm.sh/chart: {{ include "k8s-common.names.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- with .Chart.AppVersion }}
app.kubernetes.io/version: {{ . | quote }}
{{- end -}}
{{- if .Values.datadogIntegration }}
tags.datadoghq.com/env: {{ .Values.global.environment }}
tags.datadoghq.com/service: {{ include "k8s-common.names.fullname" . }}
tags.datadoghq.com/version: {{ .Values.global.image.tag }}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Labels used on immutable fields such as deploy.spec.selector.matchLabels or svc.spec.selector
{{ include "k8s-common.labels.matchLabels" (dict "customLabels" .Values.podLabels "context" $) -}}

We don't want to loop over custom labels appending them to the selector
since it's very likely that it will break deployments, services, etc.
However, it's important to overwrite the standard labels if the user
overwrote them on metadata.labels fields.
*/}}
{{- define "k8s-common.labels.matchLabels" -}}
{{- if and (hasKey . "customLabels") (hasKey . "context") -}}
{{ merge (pick (include "k8s-common.tplvalues.render" (dict "value" .customLabels "context" .context) | fromYaml) "app.kubernetes.io/name" "app.kubernetes.io/instance") (dict "app.kubernetes.io/name" (include "k8s-common.names.name" .context) "app.kubernetes.io/instance" .context.Release.Name ) | toYaml }}
{{- else -}}
app.kubernetes.io/name: {{ include "k8s-common.names.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
{{- end -}}
