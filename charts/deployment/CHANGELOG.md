# Changelog

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
