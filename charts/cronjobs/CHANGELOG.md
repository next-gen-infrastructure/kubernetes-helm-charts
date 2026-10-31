# Changelog

## [4.9.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/cronjobs-4.8.0...cronjobs-4.9.0) (2026-10-31)


### Features

* add argocd sync-wave -1 annotation to ExternalSecrets ([7097e67](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/7097e67eab70b211e53d61bbd777850983ce37fc))
* add argocd sync-wave -1 annotation to ExternalSecrets ([35d78c7](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/35d78c7ac991c817060eddc4fbc88ea2810e3d75))

## [4.8.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/cronjobs-4.7.0...cronjobs-4.8.0) (2026-10-28)


### Features

* **common:** let explicit resources override resourcesPreset per key ([57b7acd](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/57b7acd28733591a2222517a873ef470cec6c2ba))
* **common:** let explicit resources override resourcesPreset per key ([32a1cf4](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/32a1cf4f87010046b4a19ef3cb5ce7ea6e137fc9))

## [4.7.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/cronjobs-4.6.2...cronjobs-4.7.0) (2026-10-28)


### Features

* **deployment:** KEDA ScaledObject; split network policy templates; capabilities for CRD apiVersions ([3f4e55e](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/3f4e55e73e49a69179d460c6f172fb637beddd9f))

## [4.6.2](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/cronjobs-4.6.1...cronjobs-4.6.2) (2026-10-28)


### Bug Fixes

* **cronjobs:** honour backoffLimit and concurrencyPolicy in every environment ([#57](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/issues/57)) ([d77f3d1](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/d77f3d10ac90af959299306fbd0dbd35f9093f6f))

## [4.6.1](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/cronjobs-4.6.0...cronjobs-4.6.1) (2026-10-28)


### Bug Fixes

* **deployment,cronjobs:** env secrets before values, bundle common &gt;= 4.10.1 ([#53](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/issues/53)) ([b23b721](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/b23b721873e9f5e197c1e18e98f93d736412b361))

## [4.6.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/cronjobs-4.5.0...cronjobs-4.6.0) (2026-10-28)


### Features

* **cronjobs,daemonset,statefulset,vaultsecrets:** render ExternalSecret as external-secrets.io/v1 ([#50](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/issues/50)) ([e000199](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/e0001999fe6ebaf0c403068d22cc8db8529d1967))

## [4.5.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/cronjobs-4.4.0...cronjobs-4.5.0) (2026-10-28)


### Features

* **cronjobs:** add serviceAccount.automountServiceAccountToken ([#48](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/issues/48)) ([dfcb876](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/dfcb8763e175cf51b9065f94d1fb90358ddeafe7))

## [4.4.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/cronjobs-4.3.0...cronjobs-4.4.0) (2026-10-28)


### Features

* add global.enabled to chart values ([#43](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/issues/43)) ([396587d](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/396587db869ac79a4bb48a9d47d31f8d1917f238))
* **cronjobs,deployment,common:** job deadline, termination grace period, statefulset storage fixes ([#42](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/issues/42)) ([f0f06f5](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/f0f06f5ea4db66bc2d7e3f9f1658ff24441e8ac9))

## [4.3.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/cronjobs-4.2.0...cronjobs-4.3.0) (2026-10-23)


### Features

* add networkPolicy support (Cilium by default) ([e9091f0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/e9091f0ca8e264bbccd17e048cb0b610e916e255))
* **cronjobs:** add egress networkPolicy support and label job pods ([d66d73b](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/d66d73bf3dfa466793a07597943f5a2f80ffbb1a))

## [4.2.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/cronjobs-4.1.0...cronjobs-4.2.0) (2026-10-23)


### Features

* align defaults across workload charts and add cronjobs presets ([58d3e83](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/58d3e83c201774f6cc0020f910268b0dcb262b0c))
* align pod affinity blocks with deployment and add topologySpread to statefulset ([b8cea29](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/b8cea295f61c2f912cca93a9b7937b7140aa0455))
* align pod affinity blocks with deployment and add topologySpread to statefulset ([605d71e](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/605d71ebd4146527cf929edd8c3747482c4e2526))
* **cronjobs:** add resourcesPreset and non-root security defaults ([3a91acc](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/3a91acc57933b517ee1307201f87a17ca4f456f6))

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
