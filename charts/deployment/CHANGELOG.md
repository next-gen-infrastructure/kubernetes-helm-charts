# Changelog

## [4.11.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/deployment-4.10.0...deployment-4.11.0) (2026-10-28)


### Features

* **deployment:** KEDA ScaledObject; split network policy templates; capabilities for CRD apiVersions ([3f4e55e](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/3f4e55e73e49a69179d460c6f172fb637beddd9f))
* **deployment:** render a KEDA ScaledObject instead of the HPA ([7e52231](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/7e5223139bf49938172d4d6eca595556fd97b970))

## [4.10.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/deployment-4.9.1...deployment-4.10.0) (2026-10-28)


### Features

* **deployment,statefulset,daemonset:** add metrics.serviceMonitor.params and tlsConfig ([#55](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/issues/55)) ([c15a08b](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/c15a08baad9094feb12326a284064679b6f9d3f6))

## [4.9.1](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/deployment-4.9.0...deployment-4.9.1) (2026-10-28)


### Bug Fixes

* **deployment,cronjobs:** env secrets before values, bundle common &gt;= 4.10.1 ([#53](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/issues/53)) ([b23b721](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/b23b721873e9f5e197c1e18e98f93d736412b361))

## [4.9.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/deployment-4.8.0...deployment-4.9.0) (2026-10-28)


### Features

* **deployment,common:** existing-ConfigMap and projected volumes, readOnly mounts, automountServiceAccountToken ([#45](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/issues/45)) ([b0032e5](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/b0032e5cd2b88777285812ec11aa98a225ddc662))

## [4.8.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/deployment-4.7.0...deployment-4.8.0) (2026-10-28)


### Features

* add global.enabled to chart values ([#43](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/issues/43)) ([396587d](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/396587db869ac79a4bb48a9d47d31f8d1917f238))
* **cronjobs,deployment,common:** job deadline, termination grace period, statefulset storage fixes ([#42](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/issues/42)) ([f0f06f5](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/f0f06f5ea4db66bc2d7e3f9f1658ff24441e8ac9))

## [4.7.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/deployment-4.6.0...deployment-4.7.0) (2026-10-28)


### Features

* **common:** support in-memory emptyDir volumes ([8ce4544](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/8ce45447805f7be0ce732de8bd97f9254fe985d0))
* **common:** support in-memory emptyDir volumes ([a65f0c6](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/a65f0c6ee67d592dcf3966c70ec1fa5d5c9880a0))


### Bug Fixes

* **deployment:** default service sessionAffinity to None ([d621ce7](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/d621ce796c830a288972a12dd7d662d5240ee40f))
* **deployment:** default service sessionAffinity to None, make it configurable ([d937d5a](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/d937d5a6a55a7c921cf3505669f5c3ab98a7c9a8))

## [4.6.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/deployment-4.5.0...deployment-4.6.0) (2026-10-23)


### Features

* add networkPolicy.allowPodSelectors ([4005eb8](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/4005eb8080cbcf4473cfe2ed1e7277ad5d880268))
* **deployment:** add networkPolicy.allowPodSelectors ([eecb21a](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/eecb21a643379a07c1ce14df539a45ccf0fab050))

## [4.5.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/deployment-4.4.0...deployment-4.5.0) (2026-10-23)


### Features

* add networkPolicy support (Cilium by default) ([e9091f0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/e9091f0ca8e264bbccd17e048cb0b610e916e255))
* **deployment:** add metrics.namespace for network policy prometheus access ([17e49e5](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/17e49e52d15f28cd5f40186424bdfb5e407e13ec))
* **deployment:** add networkPolicy support (Cilium by default) ([273157e](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/273157e787856d41079e3a1129de499b056f1cd5))


### Bug Fixes

* **deployment:** rename metrics.namespace to metrics.prometheusNamespace ([0b7cc6d](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/0b7cc6daeb20eff6007bc7c1b79c2a6325c5dee2))

## [4.4.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/deployment-4.3.0...deployment-4.4.0) (2026-10-23)


### Features

* **deployment:** add inheritEnv for sidecar and init containers ([939c578](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/939c57835b13c92012adcf6ae3e56f5749a73e27))
* **deployment:** add inheritEnv for sidecar and init containers ([32a4fac](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/32a4fac07d27fb5f5765f84ca5b9b5b2da878d71))

## [4.3.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/deployment-4.2.0...deployment-4.3.0) (2026-10-23)


### Features

* **deployment:** default resourcesPreset to none ([c674967](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/c674967a431ee7f6b301dc30b3310d05c41bde57))
* support imagePullSecrets in rollout, daemonset and cronjobs ([a1af4c5](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/a1af4c5bc344b4947358a1e4d4b8b4599ac72c43))
* support imagePullSecrets in rollout, daemonset and cronjobs ([f8adf93](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/f8adf932f47e988119dc7dd6ac991368600f9dd4))


### Bug Fixes

* omit empty volumes and volumeMounts when none are configured ([134a38b](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/134a38bfe0d905962f20c97ef9a21f9dd939b27f))

## [4.2.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/deployment-4.1.0...deployment-4.2.0) (2026-10-23)


### Features

* add Traefik IngressRoute, ingress name override and service port options ([c900616](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/c900616c18989557b02274ec571da75d3acdebfb))
* add Traefik IngressRoute, ingress name override and service port options ([b41d4b6](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/b41d4b6ca52084f1472c21c56a2e7774c4ba8da1))

## [4.1.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/deployment-4.0.0...deployment-4.1.0) (2026-10-22)


### Features

* **deployment:** add ingress.hostPrefix and make ingress.subDomain work ([ccc910a](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/ccc910ac071e010ab846f3a4f4028295f526ba8d))
* **deployment:** add ingress.hostPrefix and make ingress.subDomain work ([a92ebb8](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/a92ebb813756817808e68d8314dead4f103f4c67))

## [4.0.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/deployment-3.0.1...deployment-4.0.0) (2026-10-22)


### ⚠ BREAKING CHANGES

* **deployment:** image.name and global.image.name are replaced by image.registry/image.repository and global.image.registry/repository.

### Features

* **deployment:** add envFrom, configMap and revisionHistoryLimit; use image registry/repository ([3aad84c](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/3aad84cd36311e83030161d3811f0f2c16dd2681))


### Bug Fixes

* relax chart dependency constraint in examples to &gt;=2 ([4ee1e5a](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/4ee1e5a5be2b9842eac4486df24d01976713cab9))

## [3.0.1](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/deployment-3.0.0...deployment-3.0.1) (2026-10-22)


### Bug Fixes

* relax common dependency constraint and update actions ([10850d9](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/10850d967d293e8bda8258e422892316dc492577))
* relax common dependency constraint to &gt;=2.0.0 ([b438591](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/b438591feb787c34c7409949d89bb2b5ab791a80))

## [3.0.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/deployment-2.1.0...deployment-3.0.0) (2026-10-22)


### ⚠ BREAKING CHANGES

* remove global.project and add global.secretStore
* remove global.org
* remove ALB ingress annotation support
* **deployment:** replace podAffinityPreset and podAntiAffinityPreset with blocks
* **deployment:** replace topologySpread presets with a topologySpread block

### Features

* **deployment:** add namespaceOverride, PDB guard, PrometheusRule namespace and ExternalSecret v1 ([dc2e9e2](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/dc2e9e2b4719d9eaba755835e0cf0d25b46cc546))
* **deployment:** allow number or percent string for pdb.minAvailable and pdb.maxUnavailable ([ca0771e](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/ca0771e2c86c09a2bcccdd7f9fb5b82aae561693))
* **deployment:** replace podAffinityPreset and podAntiAffinityPreset with blocks ([1d28ea6](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/1d28ea65cc30bf8558573e36a771aadd11f9455d))
* **deployment:** replace topologySpread presets with a topologySpread block ([baac1dd](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/baac1dded9680778baba332f1de3583776ebb267))
* remove ALB ingress annotation support ([2f25d40](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/2f25d402bd7a3259f85dd4b9f4b834f70260cba6))
* remove global.org ([868e93d](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/868e93df8cb9eefa7a2873c9abad705db9ca4615))
* remove global.project and add global.secretStore ([3d735e3](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/3d735e32a375b955f928697b80cbb78f1bbf7202))


### Bug Fixes

* **deployment:** default pdb.maxUnavailable to an empty string and regenerate docs ([c79d436](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/c79d436a43ebe0ffc3b6affa0eba858b7f2c0606))
* **deployment:** set only one of minAvailable/maxUnavailable in examples ([2f3d98c](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/2f3d98cb0a80f1c439ee22e634f5c243a69edc99))

## [2.1.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/deployment-2.0.1...deployment-2.1.0) (2026-07-04)


### Features

* remove `values.schema.json` files from example folders ([17ae197](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/17ae1972dfd2604497289b3856846ca767f4840f))


### Bug Fixes

* add `Chart` context to external-secret template ([a71909c](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/a71909c0f7723aeb56f3aa05b2a85cc78c463dc4))

## [2.0.1](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/deployment-2.0.0...deployment-2.0.1) (2026-02-21)


### Bug Fixes

* bump common chart dependency to ^2.0.0 across all charts ([301eca2](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/301eca2108d000f2a1ed2b2e2405ec81effc022b))

## [2.0.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/deployment-1.1.9...deployment-2.0.0) (2026-02-21)


### ⚠ BREAKING CHANGES

* Rename common chart

### Features

* Rename common chart ([d39753f](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/d39753f39db3877beea14da7ab0d9621e97f03e0))

## [1.1.9](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/deployment-1.1.8...deployment-1.1.9) (2026-01-11)


### Bug Fixes

* testing chart releases ([62f3997](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/62f399759c07b270416ad751c95e011e3b9ba594))
* testing chart releases ([9285b5b](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/9285b5b2b0444bfc88a994ed0f0ba3ea269bea5c))
* testing chart releases ([9033f79](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/9033f796cfbd62195ef93638f65b74b2a436b52f))
* testing chart releases ([f1225dd](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/f1225dda99e549481d5d77e219de882105f87df2))

## [1.1.11](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/deployment-1.1.10...deployment-1.1.11) (2026-01-11)


### Bug Fixes

* testing chart releases ([9285b5b](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/9285b5b2b0444bfc88a994ed0f0ba3ea269bea5c))

## [1.1.10](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/deployment-1.1.9...deployment-1.1.10) (2026-01-10)


### Bug Fixes

* Correct chart paths ([0c511bb](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/0c511bb7fb5963b97c24c2c9068f9acb8746e020))
* testing chart releases ([9033f79](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/9033f796cfbd62195ef93638f65b74b2a436b52f))
* testing chart releases ([f1225dd](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/f1225dda99e549481d5d77e219de882105f87df2))
* testing chart releases ([cd4253b](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/cd4253b8ad062b1c12b9dc94ec4522b6c10f6909))
* testing chart releases ([8b72740](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/8b72740d9c1b60e508ae5f569a56e73c1993bd1b))
* update description to clarify usage example ([b57c9ae](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/b57c9aea18a2cfc321ecac0da671f64a18b31344))
* update description to clarify usage example ([0c5105d](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/0c5105d146bba641bedbba792b53532c5450a3dd))
* update description to clarify usage example ([2d603ab](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/2d603abf313d753e3ba71d58afd07857bfae8e56))

## [1.1.9](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/charts/deployment-1.1.8...charts/deployment-1.1.9) (2026-01-10)


### Bug Fixes

* testing chart releases ([f1225dd](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/f1225dda99e549481d5d77e219de882105f87df2))

## [1.1.8](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/charts/deployment-1.1.7...charts/deployment-1.1.8) (2026-01-10)


### Bug Fixes

* Correct chart paths ([0c511bb](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/0c511bb7fb5963b97c24c2c9068f9acb8746e020))
* testing chart releases ([cd4253b](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/cd4253b8ad062b1c12b9dc94ec4522b6c10f6909))
* testing chart releases ([8b72740](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/8b72740d9c1b60e508ae5f569a56e73c1993bd1b))
* update description to clarify usage example ([b57c9ae](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/b57c9aea18a2cfc321ecac0da671f64a18b31344))
* update description to clarify usage example ([0c5105d](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/0c5105d146bba641bedbba792b53532c5450a3dd))
* update description to clarify usage example ([2d603ab](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/2d603abf313d753e3ba71d58afd07857bfae8e56))

## [1.1.9](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/charts/deployment-1.1.8...charts/deployment-1.1.9) (2026-01-09)


### Bug Fixes

* Correct chart paths ([0c511bb](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/0c511bb7fb5963b97c24c2c9068f9acb8746e020))
* update description to clarify usage example ([2d603ab](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/2d603abf313d753e3ba71d58afd07857bfae8e56))

## [1.1.8](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/charts/deployment-1.1.7...charts/deployment-1.1.8) (2026-01-09)


### Bug Fixes

* Correct chart paths ([0c511bb](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/0c511bb7fb5963b97c24c2c9068f9acb8746e020))
