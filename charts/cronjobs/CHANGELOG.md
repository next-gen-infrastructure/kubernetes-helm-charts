# Changelog

## [4.1.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/cronjobs-4.0.0...cronjobs-4.1.0) (2026-10-23)


### Features

* support imagePullSecrets in rollout, daemonset and cronjobs ([a1af4c5](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/a1af4c5bc344b4947358a1e4d4b8b4599ac72c43))
* support imagePullSecrets in rollout, daemonset and cronjobs ([f8adf93](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/f8adf932f47e988119dc7dd6ac991368600f9dd4))

## [4.0.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/cronjobs-3.0.1...cronjobs-4.0.0) (2026-10-22)


### ⚠ BREAKING CHANGES

* image.name and global.image.name are replaced by image.registry/image.repository and global.image.registry/repository.

### Features

* add envFrom, configMap and image registry/repository to cronjobs, daemonset and statefulset ([710ca14](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/710ca1468322b6f29b42ab7aaf13c12661fbfa3a))


### Bug Fixes

* relax chart dependency constraint in examples to &gt;=2 ([4ee1e5a](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/4ee1e5a5be2b9842eac4486df24d01976713cab9))

## [3.0.1](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/cronjobs-3.0.0...cronjobs-3.0.1) (2026-10-22)


### Bug Fixes

* relax common dependency constraint and update actions ([10850d9](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/10850d967d293e8bda8258e422892316dc492577))
* relax common dependency constraint to &gt;=2.0.0 ([b438591](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/b438591feb787c34c7409949d89bb2b5ab791a80))

## [3.0.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/cronjobs-2.1.0...cronjobs-3.0.0) (2026-10-22)


### ⚠ BREAKING CHANGES

* remove global.project and add global.secretStore
* remove global.org

### Features

* remove global.org ([868e93d](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/868e93df8cb9eefa7a2873c9abad705db9ca4615))
* remove global.project and add global.secretStore ([3d735e3](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/3d735e32a375b955f928697b80cbb78f1bbf7202))

## [2.1.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/cronjobs-2.0.1...cronjobs-2.1.0) (2026-07-04)


### Features

* remove `values.schema.json` files from example folders ([17ae197](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/17ae1972dfd2604497289b3856846ca767f4840f))


### Bug Fixes

* enhance cronjob template with namespace, timezone, and ttl support ([1e5940f](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/1e5940f909e1b11eded8bdc046d835e2ae3ab2e7))

## [2.0.1](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/cronjobs-2.0.0...cronjobs-2.0.1) (2026-02-21)


### Bug Fixes

* bump common chart dependency to ^2.0.0 across all charts ([301eca2](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/301eca2108d000f2a1ed2b2e2405ec81effc022b))

## [2.0.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/cronjobs-1.1.3...cronjobs-2.0.0) (2026-02-21)


### ⚠ BREAKING CHANGES

* Rename common chart

### Features

* Rename common chart ([d39753f](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/d39753f39db3877beea14da7ab0d9621e97f03e0))

## [1.1.3](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/cronjobs-1.1.2...cronjobs-1.1.3) (2026-01-11)


### Bug Fixes

* Correct chart paths ([0c511bb](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/0c511bb7fb5963b97c24c2c9068f9acb8746e020))

## [1.1.3](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/charts/cronjobs-1.1.2...charts/cronjobs-1.1.3) (2026-01-10)


### Bug Fixes

* Correct chart paths ([0c511bb](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/0c511bb7fb5963b97c24c2c9068f9acb8746e020))

## [1.1.4](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/charts/cronjobs-1.1.3...charts/cronjobs-1.1.4) (2026-01-09)


### Bug Fixes

* Correct chart paths ([0c511bb](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/0c511bb7fb5963b97c24c2c9068f9acb8746e020))

## [1.1.3](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/charts/cronjobs-1.1.2...charts/cronjobs-1.1.3) (2026-01-09)


### Bug Fixes

* Correct chart paths ([0c511bb](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/0c511bb7fb5963b97c24c2c9068f9acb8746e020))
