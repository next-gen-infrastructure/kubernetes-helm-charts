# Changelog

## [4.12.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/common-4.11.0...common-4.12.0) (2026-10-28)


### Features

* **common:** let explicit resources override resourcesPreset per key ([57b7acd](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/57b7acd28733591a2222517a873ef470cec6c2ba))
* **common:** let explicit resources override resourcesPreset per key ([32a1cf4](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/32a1cf4f87010046b4a19ef3cb5ce7ea6e137fc9))

## [4.11.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/common-4.10.1...common-4.11.0) (2026-10-28)


### Features

* **common:** add apiVersion capabilities for operator CRDs ([dd349da](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/dd349da922e367c6c1b92a0588e59f340f6e5da8))
* **deployment:** KEDA ScaledObject; split network policy templates; capabilities for CRD apiVersions ([3f4e55e](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/3f4e55e73e49a69179d460c6f172fb637beddd9f))

## [4.10.1](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/common-4.10.0...common-4.10.1) (2026-10-28)


### Bug Fixes

* **common:** render env secrets before values so $(VAR) can reference them ([#51](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/issues/51)) ([d015cf1](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/d015cf13a03c1b63b1e5877d97f346fe23f50402))

## [4.10.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/common-4.9.0...common-4.10.0) (2026-10-28)


### Features

* **deployment,common:** existing-ConfigMap and projected volumes, readOnly mounts, automountServiceAccountToken ([#45](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/issues/45)) ([b0032e5](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/b0032e5cd2b88777285812ec11aa98a225ddc662))

## [4.9.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/common-4.8.0...common-4.9.0) (2026-10-28)


### Features

* **cronjobs,deployment,common:** job deadline, termination grace period, statefulset storage fixes ([#42](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/issues/42)) ([f0f06f5](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/f0f06f5ea4db66bc2d7e3f9f1658ff24441e8ac9))

## [4.8.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/common-4.7.0...common-4.8.0) (2026-10-28)


### Features

* **common:** support in-memory emptyDir volumes ([8ce4544](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/8ce45447805f7be0ce732de8bd97f9254fe985d0))
* **common:** support in-memory emptyDir volumes ([a65f0c6](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/a65f0c6ee67d592dcf3966c70ec1fa5d5c9880a0))

## [4.7.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/common-4.6.0...common-4.7.0) (2026-10-23)


### Features

* add networkPolicy.allowPodSelectors ([4005eb8](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/4005eb8080cbcf4473cfe2ed1e7277ad5d880268))
* **common:** allow specific pods in networkpolicy via allowPodSelectors ([1a9705d](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/1a9705d8225c5cef2208dd434cf6984a2721a0d8))

## [4.6.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/common-4.5.0...common-4.6.0) (2026-10-23)


### Features

* add networkPolicy support (Cilium by default) ([e9091f0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/e9091f0ca8e264bbccd17e048cb0b610e916e255))
* **common:** add networkpolicy helper rendering NetworkPolicy or CiliumNetworkPolicy ([e847039](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/e8470399c3d0ecaaf32c62508d9ef20310822382))
* **common:** allow prometheus namespace to scrape the metrics port in networkpolicy ([d2a0cba](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/d2a0cba8631d0bfd3ae5160c7484d3946d106aec))

## [4.5.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/common-4.4.0...common-4.5.0) (2026-10-23)


### Features

* align pod affinity blocks with deployment and add topologySpread to statefulset ([b8cea29](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/b8cea295f61c2f912cca93a9b7937b7140aa0455))
* align pod affinity blocks with deployment and add topologySpread to statefulset ([605d71e](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/605d71ebd4146527cf929edd8c3747482c4e2526))

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
