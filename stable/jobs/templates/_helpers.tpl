{{- define "jobs.job.value" -}}
{{- $allExtraEnv := default dict (default dict .env).values -}}
{{- range $key, $value := $allExtraEnv }}
- name: {{ $key }}
  value: {{ default "" $value | quote }}
{{- end -}}
{{- end -}}

{{- define "jobs.job.vaultSecret" -}}
{{- $localVaultSecrets := default dict (default dict $.job.env).vaultSecret -}}
{{- range $key, $value := $localVaultSecrets }}
- name: {{ $key }}
  valueFrom:
    secretKeyRef:
      name: {{ $.global.Release.Name }}-{{ $.global.Chart.Name }}-{{ $.jobName }}-vault
      key: {{ $key }}
{{- end -}}
{{- end -}}
