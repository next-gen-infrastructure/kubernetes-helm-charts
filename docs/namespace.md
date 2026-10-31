# namespace

Per-namespace bootstrap, installed with `-n <namespace>` (the release namespace is the namespace that is configured). Every block except the Namespace is off by default.

| Values | Renders |
|---|---|
| `namespace.create` (default `true`) | `Namespace` named after the release namespace |
| `registrySecret.enabled` | `ExternalSecret` building a `kubernetes.io/dockerconfigjson` Secret from the Vault key `registrySecret.remoteKey` (properties `username`, `password`, `auth`), via `global.secretStore` |
| `defaultServiceAccount` | `default` ServiceAccount with `imagePullSecrets` = `registrySecret.name` (when enabled) + `imagePullSecrets`; skipped when the list would be empty |
| `lokiAlerts` | ConfigMap `loki-alerts-<ns>` labelled `loki_rule: "true"` with `groups` |
| `prometheusRules` | `PrometheusRule` `<ns>` with `groups` |
| `imageUpdater` | Argo CD Image Updater `ImageUpdater` `<ns>-image-updater` for the listed Applications |

```yaml
global:
  environment: dev
registrySecret:
  enabled: true
lokiAlerts:
  enabled: true
  groups:
    - name: "{{ .Release.Namespace }}"
      rules:
        - alert: Foo
          expr: 'sum(count_over_time({namespace="{{ .Release.Namespace }}"} |= "x" [10m])) > 5'
          annotations:
            summary: 'on {{ "{{ $labels.pod }}" }}'
imageUpdater:
  enabled: true
  registry: ghcr.io/tesari-ai
  tagPrefix: dev          # allowTags ^dev-.*
  gitBranch: dev
  applications:
    - name: osint-core-gateway          # Application name
      imageRepository: osint-gateway    # defaults to name
```

Notes:

- `groups` of `lokiAlerts` and `prometheusRules` and `imageUpdater.writeBackTarget` are rendered with `tpl`: Loki/Prometheus templates must be escaped as `{{ "{{ $labels.pod }}" }}`.
- The `ImageUpdater` is created in `imageUpdater.namespace` (default `argocd`), not in the release namespace: it only matches Applications in its own namespace (the CRD has no namespace field). The Argo CD project of the installing Application must therefore allow `argocd` as a destination.
- The ExternalSecret carries the `sync-wave: "-1"` annotation like the other charts.

Values reference: [charts/namespace/README.md](../charts/namespace/README.md).
