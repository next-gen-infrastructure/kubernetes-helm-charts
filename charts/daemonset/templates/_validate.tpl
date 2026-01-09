{{/*
Compile all warnings into a single message, and call fail.
*/}}
{{- define "daemonset.validateValues" -}}
{{- $messages := list -}}
{{- $messages := append $messages (include "daemonset.validateValues.project" .) -}}
{{- $messages := without $messages "" -}}
{{- $message := join "\n" $messages -}}

{{- if $message -}}
{{-   printf "\nVALUES VALIDATION:\n%s" $message | fail -}}
{{- end -}}
{{- end -}}

{{/*
Validate values of Deployment:
- must set a org
*/}}
{{- define "daemonset.validateValues.project" -}}
{{- if not .Values.global.project -}}
deployment: global.project
    You must set a global.project
{{- end -}}
{{- end -}}
