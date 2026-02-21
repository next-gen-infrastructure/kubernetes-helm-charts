{{/* vim: set filetype=mustache: */}}

{{- define "common.annotations.podAnnotations" -}}
{{- if .Values.podAnnotations }}
{{ toYaml .Values.podAnnotations }}
{{- end }}
{{- if .Values.metrics.podAnnotations }}
{{ toYaml .Values.metrics.podAnnotations }}
{{- end }}
{{- end -}}
