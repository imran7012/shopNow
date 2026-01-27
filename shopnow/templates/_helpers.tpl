{{- define "shopnow.name" -}}
shopnow
{{- end -}}

{{- define "shopnow.fullname" -}}
{{ include "shopnow.name" . }}-{{ .Release.Name }}
{{- end -}}
