{{/*
Return TopologySpreadConstraints section
Dict requiers  "customLabels" and "context" to proceed with "labelSelector"
*/}}

{{/*
Generate topology contstraints based on preset.
* hard:
  maxSkew is 1
  DoNotSchedule if condition is unsatisfiable for the kubernetes zone
* soft:
  maxSkew is 2 for autoscalling with more than 10 replicas, else 1
  scheduleAnyway if constraints are unsatisfiable.
{{- include "common.topologySpreadConstraintPreset"  (dict "type" .Values.topologySpreadConstraintPreset "context" $) }}
*/}}
{{- define "common.topologySpreadConstraintPreset" -}}
{{- $maxSkew := 1 }}
{{- if and .context.Values.autoscaling.enabled (ge (.context.Values.autoscaling.minReplicas | int) 10) }}
{{- $maxSkew = 2 }}
{{- end }}
  {{- if eq .type "soft" }}
    {{- include "common.topologySpreadConstraints" (dict "maxSkew" (.maxSkew | default $maxSkew) "topologyKey" .topologyKey "context" .context) -}}
  {{- else if eq .type "hard" }}
    {{- include "common.topologySpreadConstraints" (dict "maxSkew" (.maxSkew | default 1) "whenUnsatisfiable" "DoNotSchedule" "topologyKey" .topologyKey "context" .context) -}}
  {{- end -}}
{{- end -}}

{{/*
Return the pod topologySpreadConstraints list (empty when disabled), driven by .Values.topologySpread:
  preset: soft | hard | custom | disabled   (default soft)
  topologyKey, maxSkew                      (soft/hard only, optional)
  constraints                               (custom only, rendered with tpl)
Usage: {{- include "common.topologySpread" (dict "context" $) }}
*/}}
{{- define "common.topologySpread" -}}
{{- $ts := .context.Values.topologySpread | default dict -}}
{{- $preset := $ts.preset | default "soft" -}}
{{- $custom := ternary $ts.constraints (list) (eq $preset "custom") -}}
{{- if $custom -}}
{{- include "common.tplvalues.render" (dict "value" $custom "context" .context) -}}
{{- else if has $preset (list "soft" "hard") -}}
{{- include "common.topologySpreadConstraintPreset" (dict "type" $preset "maxSkew" $ts.maxSkew "topologyKey" $ts.topologyKey "context" .context) -}}
{{- end -}}
{{- end -}}

{{/*
Generate topology spread constraints
{{- include "common.topologyspreadconstraints"  (dict "maxSkew" 1 "whenUnsatisfiable" "DoNotSchedule" "topologyKey" "topology.kubernetes.io/zone" "context" $) }}
*/}}
{{- define "common.topologySpreadConstraints" -}}
- maxSkew: {{ .maxSkew | default 1 }}
  topologyKey: {{ .topologyKey | default "topology.kubernetes.io/zone" }}
  whenUnsatisfiable: {{ .whenUnsatisfiable | default "ScheduleAnyway" }}
  labelSelector:
    matchLabels: {{- include "common.labels.matchLabels" (dict "customLabels" .context.Values.podLabels "context" .context) | nindent 6 }}
{{- end }}
