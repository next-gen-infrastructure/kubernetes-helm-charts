# Changelog

## [4.4.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/common-4.3.0...common-4.4.0) (2026-10-23)


### Features

* **deployment:** add inheritEnv for sidecar and init containers ([939c578](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/939c57835b13c92012adcf6ae3e56f5749a73e27))
* **deployment:** add inheritEnv for sidecar and init containers ([32a4fac](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/32a4fac07d27fb5f5765f84ca5b9b5b2da878d71))

## [4.3.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/common-4.2.0...common-4.3.0) (2026-10-23)


### Features

* support imagePullSecrets in rollout, daemonset and cronjobs ([a1af4c5](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/a1af4c5bc344b4947358a1e4d4b8b4599ac72c43))
* support imagePullSecrets in rollout, daemonset and cronjobs ([f8adf93](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/f8adf932f47e988119dc7dd6ac991368600f9dd4))


### Bug Fixes

* accept "none" as resourcesPreset ([fe612bd](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/fe612bd723d4d87c0f9406af73571eceb5d050ce))
* omit empty volumes and volumeMounts when none are configured ([134a38b](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/134a38bfe0d905962f20c97ef9a21f9dd939b27f))

## [4.2.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/common-4.1.0...common-4.2.0) (2026-10-23)


### Features

* add Traefik IngressRoute, ingress name override and service port options ([c900616](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/c900616c18989557b02274ec571da75d3acdebfb))
* add Traefik IngressRoute, ingress name override and service port options ([b41d4b6](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/b41d4b6ca52084f1472c21c56a2e7774c4ba8da1))

## [4.1.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/common-4.0.0...common-4.1.0) (2026-10-22)


### Features

* **deployment:** add ingress.hostPrefix and make ingress.subDomain work ([ccc910a](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/ccc910ac071e010ab846f3a4f4028295f526ba8d))
* **deployment:** add ingress.hostPrefix and make ingress.subDomain work ([a92ebb8](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/a92ebb813756817808e68d8314dead4f103f4c67))

## [4.0.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/common-3.0.0...common-4.0.0) (2026-10-22)


### ⚠ BREAKING CHANGES

* **deployment:** image.name and global.image.name are replaced by image.registry/image.repository and global.image.registry/repository.

### Features

* **deployment:** add envFrom, configMap and revisionHistoryLimit; use image registry/repository ([3aad84c](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/3aad84cd36311e83030161d3811f0f2c16dd2681))

## [3.0.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/common-2.0.6...common-3.0.0) (2026-10-22)


### ⚠ BREAKING CHANGES

* **common:** sanitize label values and derive fullname from release and chart name
* remove ALB ingress annotation support
* **deployment:** replace topologySpread presets with a topologySpread block

### Features

* **deployment:** add namespaceOverride, PDB guard, PrometheusRule namespace and ExternalSecret v1 ([dc2e9e2](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/dc2e9e2b4719d9eaba755835e0cf0d25b46cc546))
* **deployment:** replace topologySpread presets with a topologySpread block ([baac1dd](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/baac1dded9680778baba332f1de3583776ebb267))
* remove ALB ingress annotation support ([2f25d40](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/2f25d402bd7a3259f85dd4b9f4b834f70260cba6))


### Bug Fixes

* **common:** fail on unknown topologySpread.preset ([2fae552](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/2fae552ba8ccbfec9ef344c66fa6f66a0ad7f367))
* **common:** sanitize label values and derive fullname from release and chart name ([aca50f6](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/aca50f673f70fb97a24888c65158b8569dd54d17))

## [2.0.6](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/common-2.0.5...common-2.0.6) (2026-10-22)


### Bug Fixes

* remove unneeded domain ([afb40c6](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/afb40c683fbd38ace780b6698c3b6b245c0073a7))

## [2.0.5](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/common-2.0.4...common-2.0.5) (2026-07-04)


### Bug Fixes

* improve helm chart templates for ingress, volume, and containers ([82c9bd0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/82c9bd04da95503801769933b2527d0ba5714cad))

## [2.0.4](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/common-2.0.3...common-2.0.4) (2026-02-22)


### Bug Fixes

* improve image construction validation in common chart template ([2935917](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/2935917bb66df530b1b6256e309d082fc57eb202))

## [2.0.3](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/common-2.0.2...common-2.0.3) (2026-02-22)


### Bug Fixes

* remove redundant "app" label from common chart template ([3153c97](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/3153c971bbf8de54223ce2bf9a891cdd14ecbd2c))

## [2.0.2](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/common-2.0.1...common-2.0.2) (2026-02-22)


### Bug Fixes

* enhance image tag construction logic in common chart template ([fab67af](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/fab67af95bb05d6edabfbaa48082ba179dbd20bc))
* Support for global.env - short environment name/type ([7c6e100](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/7c6e1000c92394693c892c5e97da39268c921b9c))

## [2.0.1](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/common-2.0.0...common-2.0.1) (2026-02-21)


### Bug Fixes

* bump common chart dependency to ^2.0.0 across all charts ([0e4f94d](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/0e4f94d1392a05f72205bf628bbc98c28da2c9f2))

## [2.0.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/common-1.1.3...common-2.0.0) (2026-02-21)


### ⚠ BREAKING CHANGES

* Rename common chart

### Features

* Rename common chart ([d39753f](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/d39753f39db3877beea14da7ab0d9621e97f03e0))

## [1.1.3](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/common-1.1.2...common-1.1.3) (2026-01-11)


### Bug Fixes

* Correct chart paths ([0c511bb](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/0c511bb7fb5963b97c24c2c9068f9acb8746e020))

## [1.1.3](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/charts/common-1.1.2...charts/common-1.1.3) (2026-01-10)


### Bug Fixes

* Correct chart paths ([0c511bb](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/0c511bb7fb5963b97c24c2c9068f9acb8746e020))

## [1.1.4](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/charts/common-1.1.3...charts/common-1.1.4) (2026-01-09)


### Bug Fixes

* Correct chart paths ([0c511bb](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/0c511bb7fb5963b97c24c2c9068f9acb8746e020))

## [1.1.3](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/charts/common-1.1.2...charts/common-1.1.3) (2026-01-09)


### Bug Fixes

* Correct chart paths ([0c511bb](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/0c511bb7fb5963b97c24c2c9068f9acb8746e020))
