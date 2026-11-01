# daemonset

Runs one pod per (selected) node: log shippers, agents, node exporters.

## Resources

DaemonSet, PVC, ServiceAccount, Role / RoleBinding, ConfigMap, ExternalSecret, ServiceMonitor, PrometheusRule. No Service or Ingress.

## Notes

- Target nodes with `nodeSelector`, `tolerations`, `nodeAffinityPreset` / `affinity`.
- Host paths go through `volumes` (`hostPath`); `securityContext` / `podSecurityContext` default to non-root like the other charts, override them for privileged agents.
- Shares `env`, `envFrom`, `configMap`, `volumes`, probes, extra containers, `rbac`, `metrics`, `lifecycle` with the other workload charts.
- **Service links:** unset by default, so the cluster default applies and Kubernetes injects `<SERVICE>_PORT=tcp://...` style variables for every Service in the namespace. Set `enableServiceLinks: false` when an app reads an env var with the same name as one of those (for example a Service named `yente` and `YENTE_PORT`).

Examples: `charts/daemonset/examples/{full,fluent-bit}`. Values reference: [charts/daemonset/README.md](../charts/daemonset/README.md).
