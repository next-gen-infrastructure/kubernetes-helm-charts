# Labels and selectors

`deployment`, `statefulset`, `daemonset` and `cronjobs` label every resource and select pods with the same two labels (`charts/common/templates/_labels.tpl`):

| Label | Value | Notes |
|---|---|---|
| `app.kubernetes.io/name` | the full name of the workload (`global.serviceName`, or `fullnameOverride`, or `<release>-<chart>`) | pod selector |
| `app.kubernetes.io/instance` | the Helm release name | pod selector |

Plus `app.kubernetes.io/managed-by`, `helm.sh/chart` and `app.kubernetes.io/version` (when `appVersion` is set). Add `app.kubernetes.io/part-of` or any other label through `commonLabels` (it is not part of the selector).

## Several workloads in one release

A wrapper chart can hold several aliases of the same chart in one release, e.g. an API and its worker. They share `instance` (one release) and are told apart by `name`, which follows the full name of each workload:

| Workload | `app.kubernetes.io/name` | `app.kubernetes.io/instance` |
|---|---|---|
| API (`global.serviceName: marketplace`) | `marketplace` | `osint-core-marketplace` |
| worker (`fullnameOverride: marketplace-worker`) | `marketplace-worker` | `osint-core-marketplace` |

Workloads of one namespace cannot share a full name (their Deployments would collide), so `name` plus `instance` is unique for every workload. Always give the second and later workloads of a release a `fullnameOverride`.

Select a workload in a policy or a `podSelector` with both labels, never with `name` alone:

```yaml
matchLabels:
  app.kubernetes.io/name: marketplace-worker
  app.kubernetes.io/instance: osint-core-marketplace
```

## Changed in the major release

The non-standard `app` label is no longer set. Log pipelines that read `app.kubernetes.io/name` first and `app` second (the Alloy log pipeline here) keep the same value, because `name` now equals the old `app`. A tool that needs `app` can still get it with `commonLabels: {app: <name>}`.

Before, `app.kubernetes.io/name` was the chart (or its alias in the wrapper chart: `deployment`, `osint-deployment`, `osint-worker`), identical for every application. Now it is the workload name, so tools that show `name` (Hubble UI, Grafana, `kubectl get -L`) list each application separately.

Migration:

- A Deployment, StatefulSet or DaemonSet selector is immutable. Upgrading a running workload fails with `field is immutable`; delete the workload (keep PVCs of StatefulSets) and let the release recreate it, or use `kubectl replace --force` / Argo CD `Replace=true`.
- Update every hand-written selector that used `app.kubernetes.io/name: <chart or alias>` (network policy `podSelector`, `allowPodSelectors`, `extraIngress` / `extraEgress`, ServiceMonitors, PDBs created outside the chart) to the workload name, together with `app.kubernetes.io/instance`.
- `nameOverride` still changes the generated name and container names, and so the label when `fullnameOverride` is not set; `common.names.name` is no longer used for labels.
