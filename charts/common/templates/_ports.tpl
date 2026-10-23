{{/*
Service port values may be a plain number or a map {port, protocol, containerPort}.
Usage:
{{ include "common.ports.port" $value }}
{{ include "common.ports.protocol" $value }}
{{ include "common.ports.containerPort" $value }}
*/}}
{{- define "common.ports.port" -}}
{{- if kindIs "map" . -}}{{ required "service port: 'port' is required" .port | int }}{{- else -}}{{ . | int }}{{- end -}}
{{- end -}}

{{- define "common.ports.protocol" -}}
{{- if kindIs "map" . -}}{{ default "TCP" .protocol }}{{- else -}}TCP{{- end -}}
{{- end -}}

{{- define "common.ports.containerPort" -}}
{{- if kindIs "map" . -}}{{ default .port .containerPort | int }}{{- else -}}{{ . | int }}{{- end -}}
{{- end -}}
