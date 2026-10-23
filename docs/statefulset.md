# statefulset

StatefulSet application with stable network identity and persistent storage.

## Resources

StatefulSet, Service (+ headless Service `service-headless.yaml`, + LoadBalancer Service `service-lb.yaml`), PVC, Ingress / extra Ingress, PodDisruptionBudget, ServiceMonitor, PrometheusRule, ServiceAccount, Role / RoleBinding, ConfigMap, ExternalSecret.

## Differences from `deployment`

- No HPA, no Rollouts; `replicaCount` is fixed.
- `persistence.*` drives the volume claim; data survives pod rescheduling.
- `resourcesPreset` defaults to `nano`; `podAffinityPreset` / `podAntiAffinityPreset` / `nodeAffinityPreset` use the flat preset style.
- `terminationGracePeriodSeconds`, `pdb.*` available.
- Shares `env`, `envFrom`, `configMap`, `volumes`, probes, `initContainers` / `sidecarContainers`, `rbac`, `metrics`, `lifecycle`, `ingress` with `deployment`.

Examples: `charts/statefulset/examples/{full,sidecar}`. Values reference: [charts/statefulset/README.md](../charts/statefulset/README.md).
