# Changelog

## [4.1.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/statefulset-4.0.0...statefulset-4.1.0) (2026-10-23)


### Features

* add Traefik IngressRoute, ingress name override and service port options ([c900616](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/c900616c18989557b02274ec571da75d3acdebfb))
* add Traefik IngressRoute, ingress name override and service port options ([b41d4b6](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/b41d4b6ca52084f1472c21c56a2e7774c4ba8da1))

## [4.0.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/statefulset-3.0.1...statefulset-4.0.0) (2026-10-22)


### ⚠ BREAKING CHANGES

* image.name and global.image.name are replaced by image.registry/image.repository and global.image.registry/repository.

### Features

* add envFrom, configMap and image registry/repository to cronjobs, daemonset and statefulset ([710ca14](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/710ca1468322b6f29b42ab7aaf13c12661fbfa3a))


### Bug Fixes

* relax chart dependency constraint in examples to &gt;=2 ([4ee1e5a](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/4ee1e5a5be2b9842eac4486df24d01976713cab9))

## [3.0.1](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/statefulset-3.0.0...statefulset-3.0.1) (2026-10-22)


### Bug Fixes

* relax common dependency constraint and update actions ([10850d9](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/10850d967d293e8bda8258e422892316dc492577))
* relax common dependency constraint to &gt;=2.0.0 ([b438591](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/b438591feb787c34c7409949d89bb2b5ab791a80))

## [3.0.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/statefulset-2.1.0...statefulset-3.0.0) (2026-10-22)


### ⚠ BREAKING CHANGES

* remove global.project and add global.secretStore
* remove global.org
* remove ALB ingress annotation support

### Features

* remove ALB ingress annotation support ([2f25d40](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/2f25d402bd7a3259f85dd4b9f4b834f70260cba6))
* remove global.org ([868e93d](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/868e93df8cb9eefa7a2873c9abad705db9ca4615))
* remove global.project and add global.secretStore ([3d735e3](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/3d735e32a375b955f928697b80cbb78f1bbf7202))

## [2.1.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/statefulset-2.0.1...statefulset-2.1.0) (2026-07-04)


### Features

* remove `values.schema.json` files from example folders ([17ae197](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/17ae1972dfd2604497289b3856846ca767f4840f))


### Bug Fixes

* enhance configmap, external-secret, and statefulset templates ([85dc5a5](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/85dc5a59653efa62b738827e98b057e25e141860))

## [2.0.1](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/statefulset-2.0.0...statefulset-2.0.1) (2026-02-21)


### Bug Fixes

* bump common chart dependency to ^2.0.0 across all charts ([301eca2](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/301eca2108d000f2a1ed2b2e2405ec81effc022b))

## [2.0.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/statefulset-1.1.8...statefulset-2.0.0) (2026-02-21)


### ⚠ BREAKING CHANGES

* Rename common chart

### Features

* Rename common chart ([d39753f](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/d39753f39db3877beea14da7ab0d9621e97f03e0))

## [1.1.8](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/charts/statefulset-1.1.7...charts/statefulset-1.1.8) (2026-01-10)


### Bug Fixes

* Correct chart paths ([0c511bb](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/0c511bb7fb5963b97c24c2c9068f9acb8746e020))

## [1.1.9](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/charts/statefulset-1.1.8...charts/statefulset-1.1.9) (2026-01-09)


### Bug Fixes

* Correct chart paths ([0c511bb](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/0c511bb7fb5963b97c24c2c9068f9acb8746e020))

## [1.1.8](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/charts/statefulset-1.1.7...charts/statefulset-1.1.8) (2026-01-09)


### Bug Fixes

* Correct chart paths ([0c511bb](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/0c511bb7fb5963b97c24c2c9068f9acb8746e020))
