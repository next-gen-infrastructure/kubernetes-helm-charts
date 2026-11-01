# statefulset

StatefulSet application with stable network identity and persistent storage.

## Resources

StatefulSet, Service (+ headless Service `<name>-headless` in `service-headless.yaml`, + LoadBalancer Service `service-lb.yaml`), PVC, Ingress / extra Ingress, PodDisruptionBudget, ServiceMonitor, PrometheusRule, ServiceAccount, Role / RoleBinding, ConfigMap, ExternalSecret.

## Differences from `deployment`

- No HPA, no Rollouts; `replicaCount` is fixed. `topologySpread` works as in `deployment` (see [presets.md](presets.md)).
- `persistence.*` drives the volume claim; data survives pod rescheduling.
- `terminationGracePeriodSeconds`, `pdb.*` available.
- **Service links:** unset by default, so the cluster default applies and Kubernetes injects `<SERVICE>_PORT=tcp://...` style variables for every Service in the namespace. Set `enableServiceLinks: false` when an app reads an env var with the same name as one of those (for example a Service named `yente` and `YENTE_PORT`).
- **Traefik IngressRoute:** `ingress.traefik.enabled` renders an IngressRoute instead of an Ingress, configured through `ingress.traefik.routes` and `ingress.traefik.middlewares` exactly as in `deployment` (see [deployment.md](deployment.md)); the route targets the `<name>` Service, like in `deployment`.
- **Temp directory:** an `emptyDir` is mounted at `/tmp` by default (`tmpDir.enabled`), because the root filesystem is read-only. `tmpDir` is the only thing that manages `/tmp`: set `tmpDir.enabled: false` before mounting `/tmp` through `volumes`, or the pod gets a duplicate mount. `tmpDir.inMemory` and `tmpDir.sizeLimit` tune it.
- Shares `env`, `envFrom`, `configMap`, `volumes`, probes, `initContainers` / `sidecarContainers`, `rbac`, `metrics`, `lifecycle`, `ingress` with `deployment`.

Examples: `charts/statefulset/examples/{full,sidecar}`. Values reference: [charts/statefulset/README.md](../charts/statefulset/README.md).
