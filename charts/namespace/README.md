# namespace

Namespace and namespace objects chart: registry pull secret, default ServiceAccount, Loki alerts, PrometheusRule, ImageUpdater.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../common | common | >=4.10.1 |

## Parameters

### Global parameters

| Name                 | Description                                                                                | Value   |
| -------------------- | ------------------------------------------------------------------------------------------ | ------- |
| `global.enabled`     | Skips the install when the parent chart sets `condition: global.enabled` on the dependency | `true`  |
| `global.environment` | Environment name, used for the ImageUpdater write-back file `values-<environment>.yaml`    | `dev`   |
| `global.secretStore` | Name of the ClusterSecretStore used by the registry ExternalSecret                         | `vault` |

### Namespace

| Name                    | Description                                                     | Value  |
| ----------------------- | --------------------------------------------------------------- | ------ |
| `namespace.create`      | Render the Namespace object (named after the release namespace) | `true` |
| `namespace.labels`      | Labels of the Namespace                                         | `{}`   |
| `namespace.annotations` | Annotations of the Namespace                                    | `{}`   |

### Registry pull secret

| Name                             | Description                                                                                           | Value                    |
| -------------------------------- | ----------------------------------------------------------------------------------------------------- | ------------------------ |
| `registrySecret.enabled`         | Render an ExternalSecret that builds a `kubernetes.io/dockerconfigjson` Secret                        | `false`                  |
| `registrySecret.name`            | Name of the ExternalSecret and of the resulting Secret                                                | `github-registry-secret` |
| `registrySecret.server`          | Registry host in the dockerconfigjson                                                                 | `ghcr.io`                |
| `registrySecret.remoteKey`       | Remote key (absolute, no environment prefix) holding the properties `username`, `password` and `auth` | `ghcr-private-registry`  |
| `registrySecret.refreshInterval` | How often the ExternalSecret is re-synced                                                             | `1h`                     |

### Default ServiceAccount

| Name                                                 | Description                                                                               | Value  |
| ---------------------------------------------------- | ----------------------------------------------------------------------------------------- | ------ |
| `defaultServiceAccount.enabled`                      | Manage the `default` ServiceAccount; rendered only when there is at least one pull secret | `true` |
| `defaultServiceAccount.automountServiceAccountToken` | Value of `automountServiceAccountToken`                                                   | `true` |
| `defaultServiceAccount.imagePullSecrets`             | Names of extra pull secrets (`registrySecret.name` is added automatically when enabled)   | `[]`   |

### Loki alerts

| Name                 | Description                                                                                                                    | Value   |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------ | ------- |
| `lokiAlerts.enabled` | Render a ConfigMap picked up by the Loki ruler (`loki_rule: "true"`)                                                           | `false` |
| `lokiAlerts.tenant`  | Loki tenant annotation                                                                                                         | `fake`  |
| `lokiAlerts.groups`  | Loki rule groups. Rendered with `tpl`: use `{{ .Release.Namespace }}` and escape Loki templates as `{{ "{{ $labels.pod }}" }}` | `[]`    |

### Prometheus rules

| Name                               | Description                                                                                  | Value   |
| ---------------------------------- | -------------------------------------------------------------------------------------------- | ------- |
| `prometheusRules.enabled`          | Render a Prometheus Operator PrometheusRule                                                  | `false` |
| `prometheusRules.additionalLabels` | Extra labels of the PrometheusRule (e.g. the `release` label the Prometheus selects on)      | `{}`    |
| `prometheusRules.groups`           | Rule groups. Rendered with `tpl`: escape Prometheus templates as `{{ "{{ $labels.pod }}" }}` | `[]`    |

### Image updater

| Name                           | Description                                                                                                                     | Value                                                       |
| ------------------------------ | ------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------- |
| `imageUpdater.enabled`         | Render an Argo CD Image Updater `ImageUpdater` for the Applications of this namespace                                           | `false`                                                     |
| `imageUpdater.namespace`       | Namespace of the Argo CD Applications; the ImageUpdater must live there (it only matches Applications in its own namespace)     | `argocd`                                                    |
| `imageUpdater.registry`        | Image registry prefix, e.g. `ghcr.io/tesari-ai`                                                                                 | `""`                                                        |
| `imageUpdater.tagPrefix`       | Only tags matching `^<tagPrefix>-.*` are considered (`dev`, `sha`)                                                              | `""`                                                        |
| `imageUpdater.gitBranch`       | Branch the tag is committed to                                                                                                  | `""`                                                        |
| `imageUpdater.updateStrategy`  | Image Updater update strategy                                                                                                   | `newest-build`                                              |
| `imageUpdater.forceUpdate`     | Update even when the Application is not out of sync                                                                             | `true`                                                      |
| `imageUpdater.writeBackTarget` | Git write-back target, rendered with `tpl`                                                                                      | `helmvalues:./values-{{ .Values.global.environment }}.yaml` |
| `imageUpdater.applications`    | Applications to update: `name` (Application name pattern), `imageRepository` (defaults to `name`), `alias` (defaults to `name`) | `[]`                                                        |

