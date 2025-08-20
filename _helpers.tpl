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


