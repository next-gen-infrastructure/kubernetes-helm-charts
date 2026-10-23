# deployment

Typical microservice: a Deployment **or** an Argo Rollout, plus Service, Ingress and friends.

## Resources

| Template | Condition |
|---|---|
| Deployment | `rollouts.enabled: false` |
| Rollout | `rollouts.enabled: true` (`strategy: canary` or `blueGreen`) |
| Service | `service.enabled` (default true) |
| Ingress / extra Ingress | `ingress.enabled` / `ingressExtra.enabled` |
| Traefik IngressRoute | `ingress.traefik.enabled` (not allowed with canary rollouts, fails validation) |
| HPA | `autoscaling.enabled` |
| PodDisruptionBudget | `pdb.create` |
| PVC | `persistence.enabled` |
| ServiceMonitor / PrometheusRule | `metrics.serviceMonitor.enabled` / `metrics.rules.enabled` |
| ServiceAccount, Role, RoleBinding | `serviceAccount.create`, `rbac.create` |
| ConfigMap (env) | `configMap.enabled` |
| ExternalSecret | `env.vaultSecret` entries |
| Secret (basic auth) | `basicAuth.enabled` |

## Notable behaviours

- **Security defaults:** non-root (uid 1000 / gid 65534), read-only root FS, all capabilities dropped.
- **Scheduling:** soft pod anti-affinity and soft zone topology spread by default (`podAntiAffinity`, `topologySpread`); `affinity` overrides presets.
- **Resources:** `resourcesPreset` defaults to `none`; `resources` wins when set.
- **Probes:** liveness/readiness enabled, HTTP on `service.healthCheckPath` unless `healthCheckPath` / `tcpSocket` is set; `startupProbe` is opt-in.
- **Extra containers:** `initContainers` / `sidecarContainers`; set `inheritEnv: true` to merge the main container's `env` (including `vaultSecret`) into them.
- **Graceful shutdown:** `preStopDelaySeconds`, `lifecycle.*`.
- **Integrations:** `datadogIntegration`, `githubActionsIntegration`, `basicAuth`.

## Minimal values

```yaml
global:
  serviceName: my-service
  domain: example.com
  image: { registry: 123.dkr.ecr.eu-central-1.amazonaws.com, repository: k8s/my-service, tag: "1.2.3" }
deployment:
  service:
    ports:
      http: { port: 80, containerPort: 3000 }
  ingress:
    enabled: true
  env:
    vaultSecret:
      DB_PASSWORD: { path: my-service, secret: db_password }
```

Examples: `charts/deployment/examples/{full,php,rollouts}`. Values reference: [charts/deployment/README.md](../charts/deployment/README.md).
