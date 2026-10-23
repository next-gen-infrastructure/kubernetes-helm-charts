# cronjobs

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Kubernetes Cron Jobs

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../common | common | 2.0.0   |

## Parameters

### Global parameters

| Name                       | Description                                                              | Value          |
| -------------------------- | ------------------------------------------------------------------------ | -------------- |
| `global.project`           | The project of the service                                               | `""`           |
| `global.serviceName`       | Name of the service. Affects public DNS.                                 | `""`           |
| `global.secretStore`       | Name of the ClusterSecretStore used by ExternalSecrets for Vault secrets | `vault`        |
| `global.environment`       | Name of the environment, one of "dev", "stage", "prod".                  | `dev`          |
| `global.image.registry`    | Image registry, E.g. 1234567890.dkr.ecr.eu-central-1.amazonaws.com       | `""`           |
| `global.image.repository`  | Image repository, E.g. k8s/example-service                               | `""`           |
| `global.image.tag`         | Tag of the image                                                         | `latest`       |
| `global.image.pullPolicy`  | The default pull policy is IfNotPresent which causes                     | `IfNotPresent` |
| `global.image.pullSecrets` | Optionally specify an array of imagePullSecrets.                         | `[]`           |

### Common parameters

| Name                        | Description                                                                               | Value   |
| --------------------------- | ----------------------------------------------------------------------------------------- | ------- |
| `nameOverride`              | By default, name uses '{{ .Chart.Name }}'.                                                | `""`    |
| `fullnameOverride`          | By default, fullname uses '{{ .Release.Name }}-{{ .Chart.Name }}'.                        | `""`    |
| `podSecurityContext`        | Pod security context                                                                      | `{}`    |
| `securityContext`           | Security context for the container                                                        | `{}`    |
| `hostPid`                   | Use the host’s pid namespace                                                              | `false` |
| `nodeSelector`              | Node labels for pod assignment                                                            | `{}`    |
| `tolerations`               | Tolerations for pod assignment                                                            | `[]`    |
| `podAffinityPreset`         | Pod affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`       | `""`    |
| `podAntiAffinityPreset`     | Pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`  | `soft`  |
| `nodeAffinityPreset`        | Node affinity preset                                                                      |         |
| `nodeAffinityPreset.type`   | Node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard` | `""`    |
| `nodeAffinityPreset.key`    | Node label key to match Ignored if `affinity` is set.                                     | `""`    |
| `nodeAffinityPreset.values` | Node label values to match. Ignored if `affinity` is set.                                 | `[]`    |
| `affinity`                  | Affinity for pod assignment                                                               | `{}`    |

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

### Container resource requests and limits

| Name                 | Description                              | Value |
| -------------------- | ---------------------------------------- | ----- |
| `resources.limits`   | The resources limits for the container   | `{}`  |
| `resources.requests` | The requests resources for the container | `{}`  |

### Cronjobs configuration

| Name       | Description                     | Value |
| ---------- | ------------------------------- | ----- |
| `cronjobs` | Cronjobs configuration          | `{}`  |
| `volumes`  | Container volumes configuration | `{}`  |

