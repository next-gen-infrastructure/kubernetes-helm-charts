# Chart documentation

Per-chart guides. Full value reference lives in each chart's generated `charts/<chart>/README.md`; these pages cover purpose, rendered resources, key behaviours and examples.

| Chart | Renders | Guide |
|---|---|---|
| common | (library, nothing) | [common.md](common.md) |
| deployment | Deployment / Argo Rollout, Service, Ingress, HPA, PDB, ... | [deployment.md](deployment.md) |
| statefulset | StatefulSet, Services, PVCs, Ingress, PDB | [statefulset.md](statefulset.md) |
| daemonset | DaemonSet, PVC, RBAC | [daemonset.md](daemonset.md) |
| cronjobs | CronJobs | [cronjobs.md](cronjobs.md) |
| configmaps | ConfigMaps | [configmaps.md](configmaps.md) |
| vaultsecrets | ExternalSecrets | [vaultsecrets.md](vaultsecrets.md) |

Cross-chart topics: [presets.md](presets.md) (resources, affinity, topology spread), [networkpolicy.md](networkpolicy.md) (Cilium / Kubernetes network policies).

## Using a chart

Charts are meant to be used as a dependency of a thin wrapper chart (see `charts/*/examples/*`), so the chart's values go under a key named after the chart:

```yaml
# Chart.yaml
dependencies:
  - name: deployment
    version: ">=2.0.0"
    repository: https://next-gen-infrastructure.github.io/kubernetes-helm-charts
```

```yaml
# values.yaml
global:
  serviceName: my-service
  environment: dev
  domain: example.com
deployment:
  replicaCount: 2
```

`global` is shared by the chart and `common`; everything else is scoped to the subchart.

## Shared conventions

- **Required globals:** `global.serviceName` and `global.domain` (CI renders with both set).
- **Naming:** `<release>-<chart>` unless `nameOverride` / `fullnameOverride`.
- **Hosts:** `<serviceName>.[<environment>].<domain>` (see `ingress.subDomain`, `ingress.hostPrefix`).
- **Images:** built from `global.image.*`, overridable per chart via `image.*` (`registry/repository:tag`).
- **Env sources** (`env.*`): `values` (templatable), `refs` (downward API), `configmap`, `secret`, `vaultSecret` (via ExternalSecret, Vault path `<environment>/<path>`, store `global.secretStore`).
- **Templating in values:** strings may contain `{{ ... }}`, rendered with `common.tplvalues.render`.
- **`volumes`:** map of name → `mountPath` plus one of `emptyDir`, `hostPath`, `configMap`, `secretName`, `vaultPath` (+ `items`; needs `vaultVolumesSupport: true`), `configMapName` (an existing ConfigMap, optional `items`), `projected` (native projected spec); `readOnly: true` makes the mount read-only.

## Testing

```bash
scripts/test-examples.sh [chart]   # render + kubeconform every examples/ case
```
