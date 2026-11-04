{{/* vim: set filetype=mustache: */}}

{{/*
Pod label that opts the pods out of the cluster-wide log pipeline: the log collector (Grafana Alloy)
drops pods carrying it from its generic discovery, because a PodLogs resource collects them instead.
Renders nothing unless .Values.podLogs.enabled.
Usage:
{{ include "common.logs.podLabels" $ }}
*/}}
{{- define "common.logs.podLabels" -}}
{{- if .Values.podLogs.enabled -}}
monitoring.grafana.com/podlogs: enabled
{{- end -}}
{{- end -}}

{{/*
PodLogs spec.relabelings entries: the default "app" label (as the generic pipeline sets it) followed by .Values.podLogs.relabelings.
Usage:
relabelings: {{- include "common.logs.relabelings" $ | nindent 4 }}
*/}}
{{- define "common.logs.relabelings" -}}
- sourceLabels: [__meta_kubernetes_pod_label_app]
  targetLabel: app
{{- with .Values.podLogs.relabelings }}
{{ include "common.tplvalues.render" (dict "value" . "context" $) }}
{{- end }}
{{- end -}}
