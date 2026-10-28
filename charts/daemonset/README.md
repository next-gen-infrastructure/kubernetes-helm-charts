# daemonset

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Typical Daemon Set application

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../common | common | 2.0.0   |

## Upgrading

## Parameters

### Global parameters

| Name                       | Description                                                                                | Value          |
| -------------------------- | ------------------------------------------------------------------------------------------ | -------------- |
| `global.enabled`           | Skips the install when the parent chart sets `condition: global.enabled` on the dependency | `true`         |
| `global.project`           | The project of the service                                                                 | `""`           |
| `global.serviceName`       | Name of the service. Affects public DNS.                                                   | `example`      |
| `global.secretStore`       | Name of the ClusterSecretStore used by ExternalSecrets for Vault secrets                   | `vault`        |
| `global.environment`       | Type of the environment, one of "dev", "stage", "prod".                                    | `dev`          |
| `global.domain`            | Company Root-level domain, expects                                                         | `""`           |
| `global.image.registry`    | Image registry, E.g. 1234567890.dkr.ecr.eu-central-1.amazonaws.com                         | `""`           |
| `global.image.repository`  | Image repository, E.g. k8s/example-service                                                 | `""`           |
| `global.image.tag`         | Tag of the image                                                                           | `latest`       |
| `global.image.pullPolicy`  | The default pull policy is IfNotPresent which causes                                       | `IfNotPresent` |
| `global.image.pullSecrets` | Optionally specify an array of imagePullSecrets.                                           | `[]`           |

### Common parameters

| Name                                       | Description                                                                 | Value   |
| ------------------------------------------ | --------------------------------------------------------------------------- | ------- |
| `nameOverride`                             | By default, name uses '{{ .Chart.Name }}'.                                  | `""`    |
| `fullnameOverride`                         | By default, fullname uses '{{ .Release.Name }}-{{ .Chart.Name }}'.          | `""`    |
| `commonLabels`                             | Labels to add to all deployed objects                                       | `{}`    |
| `commonAnnotations`                        | Annotations to add to all deployed objects                                  | `{}`    |
| `podLabels`                                | Additional labels for the pod                                               | `{}`    |
| `podAnnotations`                           | Additional annotations for the pod.                                         | `{}`    |
| `priorityClassName`                        | priorityClassName                                                           | `""`    |
| `podSecurityContext`                       | Pod security context                                                        |         |
| `podSecurityContext.runAsUser`             | The UID to run the entrypoint of the container process                      | `1000`  |
| `podSecurityContext.runAsNonRoot`          | Indicates that the container must run as a non-root user                    | `true`  |
| `podSecurityContext.runAsGroup`            | The GID to run the entrypoint of the container process                      | `65534` |
| `podSecurityContext.fsGroup`               | A special supplemental group that applies to all containers in a pod        | `65534` |
| `securityContext`                          | Container security context                                                  |         |
| `securityContext.allowPrivilegeEscalation` | Controls whether a process can gain more privileges than its parent process | `false` |
| `securityContext.readOnlyRootFilesystem`   | Mounts the container's root filesystem as read-only                         | `true`  |
| `securityContext.runAsUser`                | The UID to run the entrypoint of the container process                      | `1000`  |
| `securityContext.runAsNonRoot`             | Indicates that the container must run as a non-root user                    | `true`  |
| `securityContext.runAsGroup`               | The GID to run the entrypoint of the container process                      | `65534` |

### securityContext.capabilities Grant certain privileges to a process without granting all the privileges of the root user

| Name                                | Description                                                                                                                        | Value                    |
| ----------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `securityContext.capabilities.drop` | Drop all capabilities by default                                                                                                   | `["ALL"]`                |
| `vaultVolumesSupport`               | support for vault secrets as files. Defaults false.                                                                                | `false`                  |
| `volumes`                           | Container volumes configuration                                                                                                    | `{}`                     |
| `command`                           | You can set a custom entrypoint for your docker container                                                                          | `[]`                     |
| `args`                              | You can set a custom arguments for your docker container                                                                           | `[]`                     |
| `nodeSelector`                      | Node labels for pod assignment                                                                                                     | `{}`                     |
| `tolerations`                       | Tolerations for pod assignment                                                                                                     | `[]`                     |
| `podAffinity`                       | Pod affinity. Ignored if `affinity` is set                                                                                         |                          |
| `podAffinity.preset`                | Preset type: soft (preferred), hard (required) or disabled                                                                         | `disabled`               |
| `podAffinity.topologyKey`           | Topology key of the affinity term                                                                                                  | `kubernetes.io/hostname` |
| `podAntiAffinity`                   | Pod anti-affinity. Ignored if `affinity` is set                                                                                    |                          |
| `podAntiAffinity.preset`            | Preset type: soft (preferred), hard (required) or disabled                                                                         | `soft`                   |
| `podAntiAffinity.topologyKey`       | Topology key of the affinity term                                                                                                  | `kubernetes.io/hostname` |
| `resourcesPreset`                   | Set container resources according to one common preset (allowed values: none, nano, micro, small, medium, large, xlarge, 2xlarge). | `none`                   |
| `resources`                         | Container resource requests and limits                                                                                             | `{}`                     |
| `nodeAffinityPreset`                | Node affinity preset                                                                                                               |                          |
| `nodeAffinityPreset.type`           | Node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                          | `""`                     |
| `nodeAffinityPreset.key`            | Node label key to match Ignored if `affinity` is set.                                                                              | `""`                     |
| `nodeAffinityPreset.values`         | Node label values to match. Ignored if `affinity` is set.                                                                          | `[]`                     |
| `affinity`                          | Affinity for pod assignment                                                                                                        | `{}`                     |
| `revisionHistoryLimit`              | Number of old revisions to retain for rollback                                                                                     | `2`                      |

### Pod disruption budget configuration

| Name                            | Description                                                 | Value   |
| ------------------------------- | ----------------------------------------------------------- | ------- |
| `pdb`                           | Pod disruption budget configuration                         |         |
| `pdb.create`                    | Specifies whether a Pod disruption budget should be created | `false` |
| `terminationGracePeriodSeconds` | Seconds the pod needs to gracefully terminate               | `""`    |

### Image for the deployment

| Name                | Description                                                        | Value |
| ------------------- | ------------------------------------------------------------------ | ----- |
| `image.registry`    | Image registry, E.g. 1234567890.dkr.ecr.eu-central-1.amazonaws.com | `""`  |
| `image.repository`  | Image repository, E.g. k8s/example-service                         | `""`  |
| `image.tag`         | Tag of the image                                                   | `""`  |
| `image.pullPolicy`  | The default pull policy is IfNotPresent which causes               | `""`  |
| `image.pullSecrets` | Optionally specify an array of imagePullSecrets.                   | `[]`  |

### Configure Service Accounts for Pod

| Name                         | Description                                           | Value   |
| ---------------------------- | ----------------------------------------------------- | ------- |
| `serviceAccount.create`      | Specifies whether a service account should be created | `false` |
| `serviceAccount.annotations` | Annotations to add to the service account             | `{}`    |
| `serviceAccount.name`        | The name of the service account to use.               | `""`    |

### Environment variables that get added to the container

| Name              | Description                                                                                            | Value |
| ----------------- | ------------------------------------------------------------------------------------------------------ | ----- |
| `env.values`      | generic Environment variables that get added to the container                                          | `{}`  |
| `env.refs`        | Environment variables as references to the pod                                                         | `{}`  |
| `env.configmap`   | Environment variables that get added to the container from ConfigMap                                   | `{}`  |
| `env.secret`      | Kubernetes secrets that get added to the container                                                     | `{}`  |
| `env.vaultSecret` | Kubernetes secrets that get added to the container from Hashicorp Vault                                | `{}`  |
| `envFrom`         | Sources of environment variables for the container (configMapRef / secretRef). Supports helm templates | `[]`  |

### ConfigMap with environment variables for the container

| Name                | Description                                                                       | Value   |
| ------------------- | --------------------------------------------------------------------------------- | ------- |
| `configMap.enabled` | Create a ConfigMap from configMap.data and load it into the container via envFrom | `false` |
| `configMap.data`    | Key-value pairs of the ConfigMap                                                  | `{}`    |

### Network policy

| Name                                              | Description                                                                                                                                    | Value         |
| ------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- | ------------- |
| `networkPolicy.enabled`                           | Create a network policy for the pods                                                                                                           | `false`       |
| `networkPolicy.cilium`                            | Render a CiliumNetworkPolicy (cilium.io/v2) instead of a NetworkPolicy. Requires the Cilium CRDs                                               | `true`        |
| `networkPolicy.allowIngressFromIngressController` | Allow traffic from the namespace in ingressControllerNamespace                                                                                 | `true`        |
| `networkPolicy.ingressControllerNamespace`        | Namespace of the ingress controller                                                                                                            | `kube-system` |
| `networkPolicy.allowSameNamespace`                | Allow traffic from the release namespace                                                                                                       | `true`        |
| `networkPolicy.allowPodSelectors`                 | Pods of the release namespace allowed in, as label maps, e.g. [{app.kubernetes.io/name: frontend}]. Used only when allowSameNamespace is false | `[]`          |
| `networkPolicy.allowedNamespaces`                 | Additional namespaces allowed to reach the pods                                                                                                | `[]`          |
| `networkPolicy.egress.allowDNS`                   | Allow DNS to kube-dns when egress is restricted                                                                                                | `true`        |
| `networkPolicy.egress.fqdns`                      | Hostnames pods may reach, e.g. ["api.stripe.com", "*.amazonaws.com"]. Cilium only                                                              | `[]`          |
| `networkPolicy.extraIngress`                      | Raw ingress rules in the native format of the selected kind (supports templating)                                                              | `[]`          |
| `networkPolicy.extraEgress`                       | Raw egress rules in the native format of the selected kind (supports templating)                                                               | `[]`          |

### Extra Containers

| Name                       | Description                                           | Value   |
| -------------------------- | ----------------------------------------------------- | ------- |
| `initContainers`           | Configuration for the init container                  | `[]`    |
| `sidecarContainers`        | Configuration for the init container                  | `[]`    |
| `datadogIntegration`       | Enable datadog related integration for tracing        | `false` |
| `githubActionsIntegration` | Allow github runners to create resources in namespace | `false` |

### Container liveness configuration.

| Name                                | Description                                    | Value  |
| ----------------------------------- | ---------------------------------------------- | ------ |
| `livenessProbe.enabled`             | Enable livenessProbe                           | `true` |
| `livenessProbe.healthCheckPath`     | Request path for livenessProbe                 | `""`   |
| `livenessProbe.tcpSocket`           | Check availability on transport level via port | `0`    |
| `livenessProbe.initialDelaySeconds` | Initial delay seconds for livenessProbe        | `10`   |
| `livenessProbe.failureThreshold`    | Failure threshold for livenessProbe            | `3`    |
| `livenessProbe.periodSeconds`       | Period seconds for livenessProbe               | `10`   |
| `livenessProbe.successThreshold`    | Success threshold for livenessProbe            | `1`    |
| `livenessProbe.timeoutSeconds`      | Timeout seconds for livenessProbe              | `1`    |

### Container readiness configuration.

| Name                                 | Description                                    | Value  |
| ------------------------------------ | ---------------------------------------------- | ------ |
| `readinessProbe.enabled`             | Enable readinessProbe                          | `true` |
| `readinessProbe.healthCheckPath`     | Request path for readinessProbe                | `""`   |
| `readinessProbe.tcpSocket`           | Check availability on transport level via port | `0`    |
| `readinessProbe.failureThreshold`    | Failure threshold for readinessProbe           | `3`    |
| `readinessProbe.initialDelaySeconds` | Initial delay seconds for readinessProbe       | `10`   |
| `readinessProbe.periodSeconds`       | Period seconds for readinessProbe              | `10`   |
| `readinessProbe.successThreshold`    | Success threshold for readinessProbe           | `1`    |
| `readinessProbe.timeoutSeconds`      | Timeout seconds for readinessProbe             | `1`    |

### RBAC management

| Name          | Description                                        | Value  |
| ------------- | -------------------------------------------------- | ------ |
| `rbac.create` | Specifies whether RBAC resources should be created | `true` |
| `rbac.rules`  | Custom RBAC rules to set                           | `[]`   |

### Prometheus Exporter / Metrics

| Name                                   | Description                                                                                     | Value        |
| -------------------------------------- | ----------------------------------------------------------------------------------------------- | ------------ |
| `metrics.enabled`                      | Enable prometheus to access metrics endpoint                                                    | `false`      |
| `metrics.path`                         | Path to the prometheus metrics endpoint                                                         | `/metrics`   |
| `metrics.port`                         | Name of the service port for metrics                                                            | `http`       |
| `metrics.prometheusNamespace`          | Namespace of Prometheus. When networkPolicy is enabled it may reach the metrics port from there | `monitoring` |
| `metrics.serviceMonitor.enabled`       | Create ServiceMonitor object                                                                    | `false`      |
| `metrics.serviceMonitor.interval`      | Interval at which metrics should be scraped                                                     | `10s`        |
| `metrics.serviceMonitor.scrapeTimeout` | Timeout after which the scrape is ended                                                         | `3s`         |
| `metrics.serviceMonitor.selector`      | Additional labels for ServiceMonitor object                                                     | `{}`         |
| `metrics.rules.enabled`                | Create PrometheusRules object                                                                   | `false`      |
| `metrics.rules.spec`                   | Configuration for the application alerting                                                      | `[]`         |

### Lifecycle configuration

| Name                         | Description                                      | Value   |
| ---------------------------- | ------------------------------------------------ | ------- |
| `lifecycle.enabled`          | Enable lifecycle hooks                           | `false` |
| `lifecycle.postStartCommand` | Command to be executed after the container start | `""`    |
| `lifecycle.preStopCommand`   | Command to be executed before container shutdown | `""`    |

### Persistence Parameters

| Name                       | Description                                       | Value   |
| -------------------------- | ------------------------------------------------- | ------- |
| `persistence.enabled`      | Enable persistence using Persistent Volume Claims | `false` |
| `persistence.path`         | Path to mount persistent volume                   | `""`    |
| `persistence.storageClass` | Persistent Volume storage class                   | `""`    |
| `persistence.annotations`  | Additional custom annotations for the PVC         | `{}`    |
| `persistence.accessModes`  | Persistent Volume access modes                    | `[]`    |
| `persistence.size`         | Persistent Volume size                            | `8Gi`   |

