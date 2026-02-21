{{/* vim: set filetype=mustache: */}}
{{/*
Generate environment variables.
{{- include "common.envvar.value" . -}}
*/}}
{{- define "common.envvar.value" -}}
{{- $allExtraEnv := default (dict) .Values.env.values -}}
{{- range $key, $value := $allExtraEnv }}
- name: {{ $key }}
  value: {{ include "common.tplvalues.render" (dict "value" $value "context" $) | quote }}
{{- end -}}
{{- end -}}

{{/*
Generate environment variables as refs.
{{- include "common.envvar.ref" . -}}
*/}}
{{- define "common.envvar.ref" -}}
{{- $allExtraEnv := default (dict) .Values.env.refs -}}
{{- range $key, $value := $allExtraEnv }}
- name: {{ $key }}
  valueFrom:
    fieldRef:
      fieldPath: {{ $value }}
{{- end -}}
{{- if .Values.datadogIntegration }}
- name: DD_AGENT_HOST
  valueFrom:
    fieldRef:
      fieldPath: status.hostIP
- name: DD_ENV
  valueFrom:
    fieldRef:
      fieldPath: metadata.labels['tags.datadoghq.com/env']
- name: DD_SERVICE
  valueFrom:
    fieldRef:
      fieldPath: metadata.labels['tags.datadoghq.com/service']
- name: DD_VERSION
  valueFrom:
    fieldRef:
      fieldPath: metadata.labels['tags.datadoghq.com/version']
{{- end -}}
{{- end -}}

{{/*
Generate ConfigMap based variables.
{{- include "common.envvar.configmap" . -}}
*/}}
{{- define "common.envvar.configmap" -}}
{{- $allEnvConfigMaps := default (dict) .Values.env.configmap -}}
{{- range $key, $value := $allEnvConfigMaps }}
- name: {{ $key }}
  valueFrom:
    configMapKeyRef:
      name: {{ $value.name }}
      key: {{ $value.key | quote }}
{{- end -}}
{{- end -}}

{{/*
Generate Secret based variables.
{{- include "common.envvar.secret" . -}}
*/}}
{{- define "common.envvar.secret" -}}
{{- $allEnvSecrets := default (dict) .Values.env.secret -}}
{{- range $key, $value := $allEnvSecrets }}
- name: {{ $key }}
  valueFrom:
    secretKeyRef:
      name: {{ $value.name }}
      key: {{ $value.secret | quote }}
{{- end -}}
{{- end -}}

{{/*
Generate Secrets based on Vault secrets.
{{- include "common.envvar.vaultSecret" . -}}
*/}}
{{- define "common.envvar.vaultSecret" -}}
{{- $allVaultSecrets := default (dict) .Values.env.vaultSecret -}}
{{- range $key, $value := $allVaultSecrets }}
- name: {{ $key }}
  valueFrom:
    secretKeyRef:
      name: {{ include "common.names.fullname" $ }}-vault
      key: {{ $key }}
{{- end -}}
{{- end -}}
