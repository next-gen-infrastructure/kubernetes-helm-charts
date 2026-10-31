{{/*
Copyright VMware, Inc.
SPDX-License-Identifier: APACHE-2.0
*/}}

{{/* vim: set filetype=mustache: */}}
{{/*
Renders a value that contains template perhaps with scope if the scope is present.
Usage:
{{ include "common.tplvalues.render" ( dict "value" .Values.path.to.the.Value "context" $ ) }}
{{ include "common.tplvalues.render" ( dict "value" .Values.path.to.the.Value "context" $ "scope" $app ) }}
*/}}
{{- define "common.tplvalues.render" -}}
{{- $value := typeIs "string" .value | ternary .value (.value | toYaml) }}
{{- if contains "{{" (toJson .value) }}
  {{- if .scope }}
      {{- tpl (cat "{{- with $.RelativeScope -}}" $value "{{- end }}") (merge (dict "RelativeScope" .scope) .context) }}
  {{- else }}
    {{- tpl $value .context }}
  {{- end }}
{{- else }}
    {{- $value }}
{{- end }}
{{- end -}}

{{/*
Merge a list of values that contains template after rendering them.
Merge precedence is consistent with http://masterminds.github.io/sprig/dicts.html#merge-mustmerge
Usage:
{{ include "common.tplvalues.merge" ( dict "values" (list .Values.path.to.the.Value1 .Values.path.to.the.Value2) "context" $ ) }}
*/}}
{{- define "common.tplvalues.merge" -}}
{{- $dst := dict -}}
{{- range .values -}}
{{- $dst = include "common.tplvalues.render" (dict "value" . "context" $.context "scope" $.scope) | fromYaml | merge $dst -}}
{{- end -}}
{{ $dst | toYaml }}
{{- end -}}

{{/*
Merge a list of values that contains template after rendering them.
Merge precedence is consistent with https://masterminds.github.io/sprig/dicts.html#mergeoverwrite-mustmergeoverwrite
Usage:
{{ include "common.tplvalues.merge-overwrite" ( dict "values" (list .Values.path.to.the.Value1 .Values.path.to.the.Value2) "context" $ ) }}
*/}}
{{- define "common.tplvalues.merge-overwrite" -}}
{{- $dst := dict -}}
{{- range .values -}}
{{- $dst = include "common.tplvalues.render" (dict "value" . "context" $.context "scope" $.scope) | fromYaml | mergeOverwrite $dst -}}
{{- end -}}
{{ $dst | toYaml }}
{{- end -}}

{{/*
Renders every string of a value (map, list or string) with tpl, then returns the value as YAML.
Unlike common.tplvalues.render, tpl runs on each string and not on toYaml output: toYaml folds long strings
at ~80 columns, which can split an escape such as {{ "{{ $labels.pod }}" }} and break tpl.
Usage:
{{ include "common.tplvalues.toYaml" ( dict "value" .Values.path.to.the.Value "context" $ ) }}
*/}}
{{- define "common.tplvalues.toYaml" -}}
{{- if kindIs "map" .value -}}
  {{- include "common.tplvalues.toJson" . | fromJson | toYaml -}}
{{- else if kindIs "slice" .value -}}
  {{- include "common.tplvalues.toJson" . | fromJsonArray | toYaml -}}
{{- else if kindIs "string" .value -}}
  {{- tpl .value .context -}}
{{- else -}}
  {{- .value | toYaml -}}
{{- end -}}
{{- end -}}

{{/*
Internal: JSON of a value with tpl applied to every string. See common.tplvalues.toYaml.
*/}}
{{- define "common.tplvalues.toJson" -}}
{{- $ctx := .context -}}
{{- $items := list -}}
{{- if kindIs "map" .value -}}
  {{- range $k, $v := .value -}}
    {{- $items = append $items (printf "%s:%s" ($k | toJson) (include "common.tplvalues.toJson" (dict "value" $v "context" $ctx))) -}}
  {{- end -}}
  {{- printf "{%s}" (join "," $items) -}}
{{- else if kindIs "slice" .value -}}
  {{- range .value -}}
    {{- $items = append $items (include "common.tplvalues.toJson" (dict "value" . "context" $ctx)) -}}
  {{- end -}}
  {{- printf "[%s]" (join "," $items) -}}
{{- else if kindIs "string" .value -}}
  {{- tpl .value $ctx | toJson -}}
{{- else -}}
  {{- .value | toJson -}}
{{- end -}}
{{- end -}}
