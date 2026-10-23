{{/*
Compile all warnings into a single message, and call fail.
*/}}
{{- define "deployment.validateValues" -}}
{{- $messages := list -}}
{{- if and .Values.ingress.enabled .Values.ingress.traefik.enabled .Values.rollouts.enabled (eq .Values.rollouts.strategy "canary") -}}
{{-   $messages = append $messages "ingress.traefik.enabled is not supported with rollouts.strategy=canary" -}}
{{- end -}}
{{- $messages := without $messages "" -}}
{{- $message := join "\n" $messages -}}

{{- if $message -}}
{{-   printf "\nVALUES VALIDATION:\n%s" $message | fail -}}
{{- end -}}
{{- end -}}
