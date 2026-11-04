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
| HPA / KEDA ScaledObject | `autoscaling.enabled` / plus `autoscaling.keda.enabled` (uses `keda.triggers`, not `metrics`) |
| PodDisruptionBudget | `pdb.create` |
| PVC | `persistence.enabled` |
| ServiceMonitor / PrometheusRule | `metrics.serviceMonitor.enabled` / `metrics.rules.enabled` |
| ServiceAccount, Role, RoleBinding | `serviceAccount.create`, `rbac.create` |
| ConfigMap (env) | `configMap.enabled` |
| ExternalSecret | `env.vaultSecret` entries |
| Secret (basic auth) | `basicAuth.enabled` |

## Notable behaviours

- **Security defaults:** non-root (uid 1000 / gid 1000), read-only root FS, all capabilities dropped.
- **Scheduling:** soft pod anti-affinity and soft zone topology spread by default (`podAntiAffinity`, `topologySpread`); `affinity` overrides presets.
- **Resources:** `resourcesPreset` defaults to `none`; `resources` wins when set.
- **Probes:** liveness/readiness enabled, HTTP on `service.healthCheckPath` unless `healthCheckPath` / `tcpSocket` is set; `startupProbe` is opt-in.
- **Service session affinity:** off (`service.sessionAffinity: None`). Set `ClientIP` to pin a client IP to one pod; behind an ingress controller that is the controller's IP, so prefer sticky cookies at the ingress.
- **Extra containers:** `initContainers` / `sidecarContainers`; set `inheritEnv: true` to merge the main container's `env` (including `vaultSecret`) into them.
- **Traefik IngressRoute:** `ingress.traefik.enabled` renders an IngressRoute. `ingress.traefik.middlewares` creates Middleware objects (key is the name, value is the spec, templates allowed) that routes use by name. `ingress.traefik.routes` lists the routes; each one matches any of its hosts (the generated host unless `defaultHost: false`, plus `extraHosts`, which may use `{{ }}` templates such as `www.{{ .Values.global.domain }}`) and any of its `paths` (default `ingress.path`) and has its own `middlewares`, given as names of Middleware objects in the release namespace (`ratelimit`). Without `routes` there is one route for the generated host and `ingress.path`, without middlewares; the blue-green preview host reuses the middlewares of the first route. `ingress.extraHosts` only applies to the plain Ingress. The route sets `spec.ingressClassName` from `ingress.className`.
- **Service links:** unset by default, so the cluster default applies and Kubernetes injects `<SERVICE>_PORT=tcp://...` style variables for every Service in the namespace. Set `enableServiceLinks: false` when an app reads an env var with the same name as one of those (for example a Service named `yente` and `YENTE_PORT`).
- **Graceful shutdown:** `preStopDelaySeconds`, `lifecycle.*`.
- **Integrations:** `githubActionsIntegration`, `basicAuth`.
- **Temp directory:** an `emptyDir` is mounted at `/tmp` by default (`tmpDir.enabled`), because the root filesystem is read-only. `tmpDir` is the only thing that manages `/tmp`: set `tmpDir.enabled: false` before mounting `/tmp` through `volumes`, or the pod gets a duplicate mount. `tmpDir.inMemory` and `tmpDir.sizeLimit` tune it.

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
