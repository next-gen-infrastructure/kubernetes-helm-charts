# Changelog

## [4.3.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/daemonset-4.2.0...daemonset-4.3.0) (2026-10-23)


### Features

* add networkPolicy support (Cilium by default) ([e9091f0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/e9091f0ca8e264bbccd17e048cb0b610e916e255))
* **daemonset:** add metrics.namespace for network policy prometheus access ([90e471c](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/90e471ce713d1193884a452adb18fe390cd7af9d))
* **daemonset:** add networkPolicy support (Cilium by default) ([10dfc22](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/10dfc22dea92a4368bb13e3dc3e4b606021f43b1))


### Bug Fixes

* **daemonset:** rename metrics.namespace to metrics.prometheusNamespace ([60343e6](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/60343e6d56dfb771b26167064d00dd8af51cea64))

## [4.2.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/daemonset-4.1.0...daemonset-4.2.0) (2026-10-23)


### Features

* align defaults across workload charts and add cronjobs presets ([58d3e83](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/58d3e83c201774f6cc0020f910268b0dcb262b0c))
* align pod affinity blocks with deployment and add topologySpread to statefulset ([b8cea29](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/b8cea295f61c2f912cca93a9b7937b7140aa0455))
* align pod affinity blocks with deployment and add topologySpread to statefulset ([605d71e](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/605d71ebd4146527cf929edd8c3747482c4e2526))
* align resourcesPreset and pdb defaults across statefulset and daemonset with deployment ([2a5bf57](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/2a5bf5755cd3f2a0f1b7a8d41bd4b56223118e0e))

## [4.1.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/daemonset-4.0.0...daemonset-4.1.0) (2026-10-23)


### Features

* support imagePullSecrets in rollout, daemonset and cronjobs ([a1af4c5](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/a1af4c5bc344b4947358a1e4d4b8b4599ac72c43))
* support imagePullSecrets in rollout, daemonset and cronjobs ([f8adf93](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/f8adf932f47e988119dc7dd6ac991368600f9dd4))

## [4.0.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/daemonset-3.0.1...daemonset-4.0.0) (2026-10-22)


### ⚠ BREAKING CHANGES

* image.name and global.image.name are replaced by image.registry/image.repository and global.image.registry/repository.

### Features

* add envFrom, configMap and image registry/repository to cronjobs, daemonset and statefulset ([710ca14](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/710ca1468322b6f29b42ab7aaf13c12661fbfa3a))


### Bug Fixes

* relax chart dependency constraint in examples to &gt;=2 ([4ee1e5a](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/4ee1e5a5be2b9842eac4486df24d01976713cab9))

## [3.0.1](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/daemonset-3.0.0...daemonset-3.0.1) (2026-10-22)


### Bug Fixes

* relax common dependency constraint and update actions ([10850d9](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/10850d967d293e8bda8258e422892316dc492577))
* relax common dependency constraint to &gt;=2.0.0 ([b438591](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/b438591feb787c34c7409949d89bb2b5ab791a80))

## [3.0.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/daemonset-2.1.0...daemonset-3.0.0) (2026-10-22)


### ⚠ BREAKING CHANGES

* remove global.project and add global.secretStore
* remove global.org

### Features

* remove global.org ([868e93d](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/868e93df8cb9eefa7a2873c9abad705db9ca4615))
* remove global.project and add global.secretStore ([3d735e3](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/3d735e32a375b955f928697b80cbb78f1bbf7202))

## [2.1.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/daemonset-2.0.1...daemonset-2.1.0) (2026-07-04)


### Features

* remove `values.schema.json` files from example folders ([17ae197](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/17ae1972dfd2604497289b3856846ca767f4840f))


### Bug Fixes

* enhance daemonset and configmap templates ([adcff10](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/adcff1020947faca0629d42bdef0abb9af2e854f))
* update daemonset defaults and clean up stale schema files ([84340f9](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/84340f9d6fcd1bee90ab6c3dea2060a8121eeb63))

## [2.0.1](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/daemonset-2.0.0...daemonset-2.0.1) (2026-02-21)


### Bug Fixes

* bump common chart dependency to ^2.0.0 across all charts ([301eca2](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/301eca2108d000f2a1ed2b2e2405ec81effc022b))

## [2.0.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/daemonset-1.1.3...daemonset-2.0.0) (2026-02-21)


### ⚠ BREAKING CHANGES

* Rename common chart

### Features

* Rename common chart ([d39753f](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/d39753f39db3877beea14da7ab0d9621e97f03e0))

## [1.1.3](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/daemonset-1.1.2...daemonset-1.1.3) (2026-01-11)


### Bug Fixes

* Correct chart paths ([0c511bb](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/0c511bb7fb5963b97c24c2c9068f9acb8746e020))

## [1.1.3](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/charts/daemonset-1.1.2...charts/daemonset-1.1.3) (2026-01-10)


### Bug Fixes

* Correct chart paths ([0c511bb](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/0c511bb7fb5963b97c24c2c9068f9acb8746e020))

## [1.1.4](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/charts/daemonset-1.1.3...charts/daemonset-1.1.4) (2026-01-09)


### Bug Fixes

* Correct chart paths ([0c511bb](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/0c511bb7fb5963b97c24c2c9068f9acb8746e020))

## [1.1.3](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/charts/daemonset-1.1.2...charts/daemonset-1.1.3) (2026-01-09)


### Bug Fixes

* Correct chart paths ([0c511bb](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/0c511bb7fb5963b97c24c2c9068f9acb8746e020))
