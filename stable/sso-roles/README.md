# cronjobs

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

Kubernetes Cron Jobs

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../k8s-common | k8s-common | 2.0.0   |

## Parameters

### Global parameters

| Name                 | Description                                             | Value     |
| -------------------- | ------------------------------------------------------- | --------- |
| `global.org`         | The organization of the service                         | `""`      |
| `global.project`     | The project of the service                              | `""`      |
| `global.serviceName` | Name of the service. Affects public DNS.                | `example` |
| `global.environment` | Type of the environment, one of "dev", "stage", "prod". | `dev`     |
| `global.domain`      | Company Root-level domain, expects                      | `""`      |

### Common parameters

| Name                       | Description                                                        | Value   |
| -------------------------- | ------------------------------------------------------------------ | ------- |
| `nameOverride`             | By default, name uses '{{ .Chart.Name }}'.                         | `""`    |
| `fullnameOverride`         | By default, fullname uses '{{ .Release.Name }}-{{ .Chart.Name }}'. | `""`    |
| `commonLabels`             | Labels to add to all deployed objects                              | `{}`    |
| `githubActionsIntegration` | Allow github runners to create resources in namespace              | `false` |

