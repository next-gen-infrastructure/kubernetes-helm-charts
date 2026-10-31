# common

Library chart (`type: library`), not installable. Provides the named templates every other chart uses.

| Template group | Purpose |
|---|---|
| `common.names.*` | name / fullname / namespace |
| `common.labels.*`, `common.annotations.*` | standard labels, common annotations |
| `common.images.*` | image reference + pull secrets from `global.image` / `image` |
| `common.containers.container` | full container spec: probes, env, resources, volumes, lifecycle |
| `common.envvar.*` | env from value / ref / configmap / secret / vaultSecret |
| `common.ingress.*` | host construction, Ingress objects |
| `common.affinities.*`, `common.spread.*` | affinity presets, topology spread |
| `common.resources.*` | `resourcesPreset` (`none`, `nano` ... `2xlarge`) |
| `common.capabilities.*` | API version detection |
| `common.tplvalues.render` | render `{{ }}` inside values |
| `common.tplvalues.toYaml` | render `{{ }}` in every string of a map/list, return YAML (safe for long strings) |
| `common.secrets.*`, `common.storage.*`, `common.volume.*`, `common.serviceaccount.*` | helpers |
| `templates/validations/` | database credential validators |

Application charts consume it via `file://../common` (`>=2.0.0`). After changing `common`, run `helm dependency update` in the dependent chart, otherwise the stale vendored copy in `charts/` is used.
