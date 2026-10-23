# configmaps

Standalone ConfigMaps. `configmaps` is a map: key → (file name → content).

```yaml
configmaps:
  config-for-k8s:          # ConfigMap <fullname>-config-for-k8s
    app.yaml: |
      level: info
    other.txt: |
      hello {{ .Release.Name }}   # content is templated
```

- Each key becomes `<fullname>-<key>` with label `tier: configmap`.
- File contents go through `common.tplvalues.render`, so `{{ }}` works.

Values reference: [charts/configmaps/README.md](../charts/configmaps/README.md).
