# Changelog

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
