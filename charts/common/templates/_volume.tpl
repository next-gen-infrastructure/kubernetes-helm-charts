{{/* vim: set filetype=mustache: */}}
{{/*
Return generated volume mounts.
{{- include "common.volume.mounts" . }}
*/}}
{{- define "common.volume.mounts" -}}
{{- $allVolumes := default (dict) .Values.volumes -}}
{{- range $key, $value := $allVolumes }}
{{- if $value.mountPath }}
- name: {{ $key }}
  mountPath: {{ $value.mountPath }}
  {{ if $value.subPath -}}
  subPath: {{ $value.subPath }}
  {{ end -}}
  {{ if or $value.readOnly $value.secretName $value.vaultPath $value.hostPath -}}
  readOnly: true
  {{- end -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Return generated volume definitions.
{{- include "common.volume.definitions" . }}
*/}}
{{- define "common.volume.definitions" -}}
{{- $allVolumes := default (dict) .Values.volumes -}}
{{- range $key, $value := $allVolumes }}
{{- if not $value.storage }}
- name: {{ $key }}
  {{ if $value.emptyDir -}}
  emptyDir: {{- if $value.inMemory }}
    medium: Memory
  {{- else }} {}
  {{- end }}
  {{- else if $value.configMap -}}
  configMap:
    name: {{ include "common.names.fullname" $ }}-{{ $key }}
  {{- else if $value.configMapName -}}
  configMap:
    name: {{ $value.configMapName }}
    {{- with $value.items }}
    items: {{- toYaml . | nindent 6 }}
    {{- end }}
  {{- else if $value.projected -}}
  projected: {{- toYaml $value.projected | nindent 4 }}
  {{- else if $value.secretName -}}
  secret:
    secretName: {{ $value.secretName }}
  {{- else if $value.hostPath -}}
  hostPath:
    path: {{ $value.hostPath }}
    {{- with $value.hostPathType }}
    type: {{ . }}
    {{- end }}
  {{- else if $value.vaultPath -}}
  secret:
    secretName: {{ include "common.names.fullname" $ }}-vault-{{ $key }}
  {{- end -}}
{{- end }}
{{- end -}}
{{- range .Values.sidecarContainers }}
{{- $allVolumes := default (dict) .volumes -}}
{{- range $key, $value := $allVolumes }}
- name: {{ $key }}
  {{ if $value.emptyDir -}}
  emptyDir: {{- if $value.inMemory }}
    medium: Memory
  {{- else }} {}
  {{- end }}
  {{- else if $value.configMap -}}
  configMap:
    name: {{ include "common.names.fullname" $ }}-{{ $key }}
  {{- else if $value.configMapName -}}
  configMap:
    name: {{ $value.configMapName }}
    {{- with $value.items }}
    items: {{- toYaml . | nindent 6 }}
    {{- end }}
  {{- else if $value.projected -}}
  projected: {{- toYaml $value.projected | nindent 4 }}
  {{- else if $value.secretName -}}
  secret:
    secretName: {{ $value.secretName }}
  {{- else if $value.vaultPath -}}
  secret:
    secretName: {{ include "common.names.fullname" $ }}-vault-{{ $key }}
  {{- end -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Return generated volume definitions.
{{- include "common.volume.claims" . }}
*/}}
{{- define "common.volume.claims" -}}
{{- $allVolumes := default (dict) .Values.volumes -}}
{{- range $key, $value := $allVolumes }}
{{- if $value.storage -}}
- metadata:
    name: {{ $key }}
  spec:
    accessModes: [ "ReadWriteOnce" ]
    {{- with $value.storageClass }}
    storageClassName: {{ . }}
    {{- end }}
    resources:
      requests:
        storage: {{ $value.storage }}
{{- end -}}
{{- end -}}
{{- end -}}
