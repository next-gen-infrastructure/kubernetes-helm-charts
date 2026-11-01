{{/* vim: set filetype=mustache: */}}
{{/*
Render the enableServiceLinks pod spec field. Renders nothing when .Values.enableServiceLinks is unset (null),
so the cluster default applies; renders the field for both true and false.
{{- with include "common.pod.enableServiceLinks" . }}
{{ . }}
{{- end }}
*/}}
{{- define "common.pod.enableServiceLinks" -}}
{{- if kindIs "bool" .Values.enableServiceLinks -}}
enableServiceLinks: {{ .Values.enableServiceLinks }}
{{- end -}}
{{- end -}}
