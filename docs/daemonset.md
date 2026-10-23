# daemonset

Runs one pod per (selected) node: log shippers, agents, node exporters.

## Resources

DaemonSet, PVC, ServiceAccount, Role / RoleBinding, ConfigMap, ExternalSecret, ServiceMonitor, PrometheusRule. No Service or Ingress.

## Notes

- Target nodes with `nodeSelector`, `tolerations`, `nodeAffinityPreset` / `affinity`.
- Host paths go through `volumes` (`hostPath`); `securityContext` / `podSecurityContext` default to non-root like the other charts, override them for privileged agents.
- Shares `env`, `envFrom`, `configMap`, `volumes`, probes, extra containers, `rbac`, `metrics`, `lifecycle` with the other workload charts.

Examples: `charts/daemonset/examples/{full,fluent-bit}`. Values reference: [charts/daemonset/README.md](../charts/daemonset/README.md).
