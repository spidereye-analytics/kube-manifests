
{{- define "timekeeper.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "timekeeper.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}


{{- define "timekeeper.labels" -}}
{{ include "timekeeper.name" . }}: {{ include "timekeeper.name" . }}
app.kubernetes.io/name: {{ include "timekeeper.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "timekeeper.selectorLabels" -}}
app.kubernetes.io/name: {{ include "timekeeper.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}