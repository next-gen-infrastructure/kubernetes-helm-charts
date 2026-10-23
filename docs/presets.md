# Presets

Presets give sane scheduling and sizing defaults from a single word. Each one is ignored when you set the explicit value it stands in for (`resources`, `affinity`, ...). Implementation: `charts/common/templates/_resources.tpl`, `_affinities.tpl`, `_spread.tpl`.

## Resources: `resourcesPreset`

Allowed: `none`, `nano`, `micro`, `small`, `medium`, `large`, `xlarge`, `2xlarge`.

| Preset | CPU req / limit | Memory req / limit | Ephemeral storage req / limit |
|---|---|---|---|
| none | not set | not set | not set |
| nano | 100m / 150m | 128Mi / 192Mi | 50Mi / 2Gi |
| micro | 250m / 375m | 256Mi / 384Mi | 50Mi / 2Gi |
| small | 500m / 750m | 512Mi / 768Mi | 50Mi / 2Gi |
| medium | 500m / 750m | 1024Mi / 1536Mi | 50Mi / 2Gi |
| large | 1 / 1.5 | 2048Mi / 3072Mi | 50Mi / 2Gi |
| xlarge | 1 / 3 | 3072Mi / 6144Mi | 50Mi / 2Gi |
| 2xlarge | 1 / 6 | 3072Mi / 12288Mi | 50Mi / 2Gi |

- **Precedence:** a non-empty `resources` always wins; the preset is used only when `resources` is empty. `none` renders no `resources` block.
- **Defaults:** `deployment` = `none`; `statefulset`, `daemonset` = `nano`. `cronjobs` has no preset, use `resources` (per job or chart-wide).
- Sidecar/init containers do not inherit the chart-level preset: each item reads its own `resources` / `resourcesPreset`, and gets no resources block if neither is set.
- Presets are for testing and quick starts; set `resources` explicitly in production. An unknown value fails the render.

```yaml
deployment:
  resourcesPreset: small      # or:
  resources:
    requests: { cpu: 200m, memory: 256Mi }
    limits: { memory: 512Mi }
```

## Affinity

If `affinity` is set (templatable, rendered as is), all affinity presets below are ignored.

### Pod affinity / anti-affinity

Matches pods of the same release (chart match labels) on a topology key.

| Preset | Kubernetes rule |
|---|---|
| `soft` | `preferredDuringSchedulingIgnoredDuringExecution`, weight 1 |
| `hard` | `requiredDuringSchedulingIgnoredDuringExecution` |
| `disabled` / empty | nothing rendered |

Anti-affinity is what spreads replicas over nodes; affinity co-locates them.

Value shape differs between charts:

| Chart | Pod affinity | Pod anti-affinity |
|---|---|---|
| deployment | `podAffinity.preset` (default `disabled`), `podAffinity.topologyKey` | `podAntiAffinity.preset` (default `soft`), `podAntiAffinity.topologyKey` |
| statefulset, daemonset, cronjobs | `podAffinityPreset` (default empty) | `podAntiAffinityPreset` (default `soft`) |

`topologyKey` defaults to `kubernetes.io/hostname` (one pod per node). Only `deployment` lets you change it.

```yaml
deployment:
  podAntiAffinity:
    preset: hard
    topologyKey: topology.kubernetes.io/zone   # at most one pod per zone, needs replicas <= zones
```

### Node affinity: `nodeAffinityPreset`

Same in every chart. Matches nodes by label.

```yaml
nodeAffinityPreset:
  type: hard                       # soft | hard | "" (off)
  key: topology.kubernetes.io/zone
  values: [eu-central-1a, eu-central-1b]
```

`soft` is preferred (weight 1), `hard` is required. For plain label matching, `nodeSelector` is simpler.

## Topology spread: `topologySpread` (deployment only, Deployment and Rollout)

| Value | Default | Meaning |
|---|---|---|
| `preset` | `soft` | `soft` = `ScheduleAnyway`, `hard` = `DoNotSchedule`, `custom` = use `constraints`, `disabled` = none |
| `topologyKey` | `topology.kubernetes.io/zone` | domain to spread across |
| `maxSkew` | auto | `1`; for `soft` with `autoscaling.minReplicas >= 10` it is `2`. Setting it overrides |
| `constraints` | `[]` | raw `topologySpreadConstraints`, only for `custom`, supports `{{ }}` |

Any other `preset` value fails the render. The label selector is the release's match labels (plus `podLabels`).

```yaml
deployment:
  topologySpread:
    preset: hard
    topologyKey: kubernetes.io/hostname
    maxSkew: 1
```

## Defaults at a glance

| Setting | deployment | statefulset | daemonset | cronjobs |
|---|---|---|---|---|
| `resourcesPreset` | none | nano | nano | n/a |
| pod anti-affinity | soft | soft | soft | soft |
| pod affinity | disabled | off | off | off |
| node affinity | off | off | off | off |
| topology spread | soft (zone) | n/a | n/a | n/a |
