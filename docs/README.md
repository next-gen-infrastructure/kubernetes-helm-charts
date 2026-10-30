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

## ExternalSecret sync wave

Every `ExternalSecret` rendered by these charts carries `argocd.argoproj.io/sync-wave: "-1"`, so Argo CD applies it before workloads (default wave `0`). Reasoning:

- **The secret must exist before the pod starts.** An `ExternalSecret` only creates the target `Secret` once the External Secrets Operator reconciles it. A pod referencing that `Secret` through `env.vaultSecret` (or a `vaultPath` volume) cannot start until it exists.
- **Without ordering, rollouts race.** Argo CD would apply the workload and the `ExternalSecret` in the same wave; new pods hit `CreateContainerConfigError` (`secret not found`) and wait for kubelet retries until the operator catches up. On first install this is noisy; on updates that add or rename a secret key, the new ReplicaSet can fail its rollout.
- **Waves wait for health.** Argo CD runs a wave only after the previous one is healthy. The `ExternalSecret` becomes healthy once it is `Ready` (the `Secret` is synced), so workloads in wave `0` start with their secrets in place.
- **Fail early.** A bad Vault path or missing store shows up as a failed `ExternalSecret` in wave `-1` and blocks the sync, rather than as crash-looping pods.

The annotation is ignored outside Argo CD (plain `helm install`), where ordering is not enforced.

## Testing

```bash
scripts/test-examples.sh [chart]   # render + kubeconform every examples/ case
```
