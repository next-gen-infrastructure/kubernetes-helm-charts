# Common charts repository

Reusable Helm charts, published at https://next-gen-infrastructure.github.io/kubernetes-helm-charts.

## Usage

```bash
helm repo add next-gen-infrastructure https://next-gen-infrastructure.github.io/kubernetes-helm-charts
helm repo update
helm search repo next-gen-infrastructure
```

## Charts

| Chart | Description |
|---|---|
| [common](charts/common) | Library chart with shared named templates (used by all charts below) |
| [deployment](charts/deployment) | Deployment or Argo Rollout with service, ingress, HPA, PDB, secrets |
| [statefulset](charts/statefulset) | StatefulSet with services, PVCs, ingress |
| [daemonset](charts/daemonset) | DaemonSet |
| [cronjobs](charts/cronjobs) | One or more CronJobs from a single values map |
| [configmaps](charts/configmaps) | Standalone ConfigMaps |
| [vaultsecrets](charts/vaultsecrets) | ExternalSecrets backed by Vault |

Each chart's `README.md` documents its values (generated — see below).

## Development

- Charts require a few `global` values to render; see the lint/template commands in `.github/workflows/test.yaml`.
- `README.md` and `values.schema.json` per chart are generated from `values.yaml` annotations by `pre-commit run --all-files` (needs [helm-schema](https://github.com/dadav/helm-schema) and [readme-generator](https://github.com/bitnami/readme-generator-for-helm)). Do not edit them by hand.
- Versioning and releases are automated with release-please via conventional commits (`fix:` → patch, `feat:` → minor). Do not bump `Chart.yaml` versions manually.
