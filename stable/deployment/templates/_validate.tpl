{{/*
Compile all warnings into a single message, and call fail.
*/}}
{{- define "deployment.validateValues" -}}
{{- $messages := list -}}
{{- $messages := append $messages (include "deployment.validateValues.project" .) -}}
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
{{- define "deployment.validateValues.project" -}}
{{- if not .Values.global.project -}}
deployment: global.project
    You must set a global.project
{{- end -}}
{{- end -}}
