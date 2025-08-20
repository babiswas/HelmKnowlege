_helpers.tpl use cases
========================
{{- define "mychart.labels" }}
    labels:
       name1: hello
       name2: bello
{{- end }}

namespace.yaml

labels:
  {{- template "mychart.labels" }}

How to name the templates
--------------------------
{{ define "mychart.v1.labels" }}

Sample named templates
======================
{{- define "mychart.labels" }}
  labels:
    generator: helm
    date: {{ now | htmlDate }}
{{- end }}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-configmap
  {{- template "mychart.labels" }}
data:
  myvalue: "Hello World"
  {{- range $key, $val := .Values.favorite }}
  {{ $key }}: {{ $val | quote }}
  {{- end }}


This is how it looks like if defined in helpers.tpl
====================================================
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-configmap
  {{- template "mychart.labels" }}
data:
  myvalue: "Hello World"
  {{- range $key, $val := .Values.favorite }}
  {{ $key }}: {{ $val | quote }}
  {{- end }}



