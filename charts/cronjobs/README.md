# cronjobs

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Kubernetes Cron Jobs

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../common | common | 2.0.0   |

## Parameters

### Global parameters

| Name                       | Description                                                                                | Value          |
| -------------------------- | ------------------------------------------------------------------------------------------ | -------------- |
| `global.enabled`           | Skips the install when the parent chart sets `condition: global.enabled` on the dependency | `true`         |
| `global.project`           | The project of the service                                                                 | `""`           |
| `global.serviceName`       | Name of the service. Affects public DNS.                                                   | `""`           |
| `global.secretStore`       | Name of the ClusterSecretStore used by ExternalSecrets for Vault secrets                   | `vault`        |
| `global.environment`       | Name of the environment, one of "dev", "stage", "prod".                                    | `dev`          |
| `global.image.registry`    | Image registry, E.g. 1234567890.dkr.ecr.eu-central-1.amazonaws.com                         | `""`           |
| `global.image.repository`  | Image repository, E.g. k8s/example-service                                                 | `""`           |
| `global.image.tag`         | Tag of the image                                                                           | `latest`       |
| `global.image.pullPolicy`  | The default pull policy is IfNotPresent which causes                                       | `IfNotPresent` |
| `global.image.pullSecrets` | Optionally specify an array of imagePullSecrets.                                           | `[]`           |

### Common parameters

| Name               | Description                                                                                                                                                                                                                                  | Value |
| ------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----- |
| `nameOverride`     | By default, name uses '{{ .Chart.Name }}'. When set, global.serviceName no longer names the workload, which keeps init and sidecar containers apart from the main container.                                                                 | `""`  |
| `fullnameOverride` | By default, fullname is global.serviceName when set, else '{{ .Release.Name }}-{{ .Chart.Name }}'. It is also the value of the `app.kubernetes.io/name` label and of the pod selector, so it must differ between the workloads of a release. | `""`  |

### Security context

| Name                                       | Description                                                                                                                     | Value            |
| ------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------- | ---------------- |
| `podSecurityContext`                       | Pod security context                                                                                                            |                  |
| `podSecurityContext.runAsUser`             | The UID to run the entrypoint of the container process                                                                          | `1000`           |
| `podSecurityContext.runAsNonRoot`          | Indicates that the container must run as a non-root user                                                                        | `true`           |
| `podSecurityContext.runAsGroup`            | The GID to run the entrypoint of the container process                                                                          | `1000`           |
| `podSecurityContext.fsGroup`               | A special supplemental group that applies to all containers in a pod                                                            | `1000`           |
| `podSecurityContext.fsGroupChangePolicy`   | When the kubelet changes the volume ownership to fsGroup: OnRootMismatch only if the volume root differs, Always on every mount | `OnRootMismatch` |
| `securityContext`                          | Container security context                                                                                                      |                  |
| `securityContext.allowPrivilegeEscalation` | Controls whether a process can gain more privileges than its parent process                                                     | `false`          |
| `securityContext.readOnlyRootFilesystem`   | Mounts the container's root filesystem as read-only                                                                             | `true`           |
| `securityContext.runAsUser`                | The UID to run the entrypoint of the container process                                                                          | `1000`           |
| `securityContext.runAsNonRoot`             | Indicates that the container must run as a non-root user                                                                        | `true`           |
| `securityContext.runAsGroup`               | The GID to run the entrypoint of the container process                                                                          | `1000`           |
| `securityContext.capabilities`             | Grant certain privileges to a process without granting all the privileges of the root user                                      |                  |
| `securityContext.capabilities.drop`        | Drop all capabilities by default                                                                                                | `["ALL"]`        |

### Pod configuration

| Name                          | Description                                                                                                                                     | Value                    |
| ----------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `enableServiceLinks`          | Set to false to stop Kubernetes injecting the Service environment variables (e.g. YENTE_PORT=tcp://...), unset keeps the cluster default (true) | `nil`                    |
| `hostPid`                     | Use the host’s pid namespace                                                                                                                    | `false`                  |
| `nodeSelector`                | Node labels for pod assignment                                                                                                                  | `{}`                     |
| `tolerations`                 | Tolerations for pod assignment                                                                                                                  | `[]`                     |
| `podAffinity`                 | Pod affinity. Ignored if `affinity` is set                                                                                                      |                          |
| `podAffinity.preset`          | Preset type: soft (preferred), hard (required) or disabled                                                                                      | `disabled`               |
| `podAffinity.topologyKey`     | Topology key of the affinity term                                                                                                               | `kubernetes.io/hostname` |
| `podAntiAffinity`             | Pod anti-affinity. Ignored if `affinity` is set                                                                                                 |                          |
| `podAntiAffinity.preset`      | Preset type: soft (preferred), hard (required) or disabled                                                                                      | `soft`                   |
| `podAntiAffinity.topologyKey` | Topology key of the affinity term                                                                                                               | `kubernetes.io/hostname` |
| `nodeAffinityPreset`          | Node affinity preset                                                                                                                            |                          |
| `nodeAffinityPreset.type`     | Node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                                       | `""`                     |
| `nodeAffinityPreset.key`      | Node label key to match Ignored if `affinity` is set.                                                                                           | `""`                     |
| `nodeAffinityPreset.values`   | Node label values to match. Ignored if `affinity` is set.                                                                                       | `[]`                     |
| `affinity`                    | Affinity for pod assignment                                                                                                                     | `{}`                     |
| `resources`                   | Container resource requests and limits                                                                                                          |                          |
| `resources.limits`            | The resources limits for the container                                                                                                          | `{}`                     |
| `resources.requests`          | The requests resources for the container                                                                                                        | `{}`                     |
| `resourcesPreset`             | Set container resources according to one common preset (allowed values: none, nano, micro, small, medium, large, xlarge, 2xlarge).              | `none`                   |

### Configure Service Accounts for Pod

| Name                                          | Description                                                      | Value   |
| --------------------------------------------- | ---------------------------------------------------------------- | ------- |
| `serviceAccount.create`                       | Specifies whether a service account should be created            | `false` |
| `serviceAccount.annotations`                  | Annotations to add to the service account                        | `{}`    |
| `serviceAccount.name`                         | The name of the service account to use.                          | `""`    |
| `serviceAccount.automountServiceAccountToken` | Set to false to not mount the API token, unset keeps the default | `nil`   |

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

| Name                            | Description                                                                                      | Value   |
| ------------------------------- | ------------------------------------------------------------------------------------------------ | ------- |
| `networkPolicy.enabled`         | Create a network policy for the pods                                                             | `false` |
| `networkPolicy.cilium`          | Render a CiliumNetworkPolicy (cilium.io/v2) instead of a NetworkPolicy. Requires the Cilium CRDs | `true`  |
| `networkPolicy.egress.allowDNS` | Allow DNS to kube-dns when egress is restricted                                                  | `true`  |
| `networkPolicy.egress.fqdns`    | Hostnames pods may reach, e.g. ["api.stripe.com", "*.amazonaws.com"]. Cilium only                | `[]`    |
| `networkPolicy.extraEgress`     | Raw egress rules in the native format of the selected kind (supports templating)                 | `[]`    |

### Cronjobs configuration

| Name       | Description                                                                                                          | Value |
| ---------- | -------------------------------------------------------------------------------------------------------------------- | ----- |
| `cronjobs` | Cronjobs configuration, keyed by job name (see `values.yaml` for the per-job options, incl. `activeDeadlineSeconds`) | `{}`  |

### Volumes

| Name               | Description                                                          | Value   |
| ------------------ | -------------------------------------------------------------------- | ------- |
| `tmpDir`           | Writable emptyDir mounted at /tmp, for the read-only root filesystem |         |
| `tmpDir.enabled`   | Mount an emptyDir at /tmp, do not also mount /tmp through volumes    | `true`  |
| `tmpDir.inMemory`  | Back the /tmp emptyDir with memory (tmpfs)                           | `false` |
| `tmpDir.sizeLimit` | Size limit of the /tmp emptyDir, e.g. 512Mi                          | `""`    |
| `volumes`          | Container volumes configuration                                      | `{}`    |

