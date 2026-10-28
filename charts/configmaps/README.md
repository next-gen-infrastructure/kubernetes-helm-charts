# configmaps

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

The chart for creating configmaps.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../common | common | 2.0.0   |

## Parameters

### Global parameters

| Name             | Description                                                                                                                                                                                | Value  |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------ |
| `global.enabled` | Install switch for parent charts: set `condition: global.enabled` on the dependency in the parent Chart.yaml and set this to false to skip the install. The chart templates do not read it | `true` |

### Configuration for custom configmaps

| Name         | Description                         | Value |
| ------------ | ----------------------------------- | ----- |
| `configmaps` | Configuration for custom configmaps | `{}`  |

