# Changelog

## [5.6.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/statefulset-5.5.0...statefulset-5.6.0) (2026-11-05)


### Features

* **deployment,statefulset,daemonset:** default allowIngressFromIngressController to false ([5198463](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/519846369f95b9555eb190eae73128fea7ac695a))
* **deployment,statefulset,daemonset:** default allowIngressFromIngressController to false ([af13c9d](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/af13c9da263ca5d4be8dd48e582f478aad141ed9))

## [5.5.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/statefulset-5.4.0...statefulset-5.5.0) (2026-11-05)


### Features

* **daemonset,deployment,statefulset:** switch default ingress namespace ([eb31b18](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/eb31b18702591645763443437097708327abb56f))
* **daemonset,deployment,statefulset:** switch default ingress namespace ([c4692a2](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/c4692a28fb2762b39cad8bd04f279ef9b5ed9564))


### Bug Fixes

* **common,deployment,statefulset:** use monitoring.grafana.com/podlogs pod label ([e157b63](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/e157b63e2dd1a9b318b6f7c0de80fc9a103bacc0))
* **common,deployment,statefulset:** use monitoring.grafana.com/podlogs pod label ([b2cf83c](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/b2cf83c7cc7346b798852ccdcdf74931e4c740a4))


### Reverts

* **common,deployment,statefulset:** remove Grafana Alloy PodLogs support ([8a3290d](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/8a3290d2e202f836c0b783339f20dfe83f0a4741))
* **common,deployment,statefulset:** remove Grafana Alloy PodLogs support ([b819908](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/b81990838094eccf88d25ed83579ac6836083a73))

## [5.4.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/statefulset-5.3.2...statefulset-5.4.0) (2026-11-04)


### Features

* **common,deployment,statefulset:** add Grafana Alloy PodLogs support ([f7c1d73](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/f7c1d7327e0d9a8226e6cec01d554d701a7794bc))
* **common,deployment,statefulset:** add Grafana Alloy PodLogs support ([2018534](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/20185349ef88d5f19261ffc42f868c89bbd48d86))

## [5.3.2](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/statefulset-5.3.1...statefulset-5.3.2) (2026-11-02)


### Bug Fixes

* **deployment,statefulset:** allow both standard traefik EntryPoints by default ([b197cfc](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/b197cfc91c185d71ec7206a407d84e057a6f8e3b))

## [5.3.1](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/statefulset-5.3.0...statefulset-5.3.1) (2026-11-01)


### Bug Fixes

* keep init and sidecar containers off the serviceName-based full name ([2847e8b](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/2847e8b5f8f9d44069eba7b7757efdb9b41d2e21))
* keep init and sidecar containers off the serviceName-based full name ([ba1dbc7](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/ba1dbc7ecc15c0c7758b07b0ca9a039a20ea38cd))

## [5.3.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/statefulset-5.2.0...statefulset-5.3.0) (2026-11-01)


### Features

* document the default app label and serviceName-based full name ([80fd449](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/80fd4493befc05f503335097a676bf11eded5f7e))
* document the default app label and serviceName-based full name ([c583ddd](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/c583ddd86494bcfd2adaaa048f351d3a5c14cd26))

## [5.2.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/statefulset-5.1.0...statefulset-5.2.0) (2026-11-01)


### Features

* name workloads after global.serviceName ([3969ad4](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/3969ad497e9cd7dda80db3c450b73f10071affa2))
* name workloads after global.serviceName ([4c429c7](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/4c429c7a7c33a5c84e7da4c89d79505b117f45fb))

## [5.1.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/statefulset-5.0.0...statefulset-5.1.0) (2026-11-01)


### Features

* **common:** build the Traefik IngressRoute routes in a shared helper ([b7c4953](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/b7c4953995481a543b79a24c10eaa8293400fd74))
* **ingress:** create Traefik Middleware objects from ingress.traefik.middlewares ([9ca6a78](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/9ca6a78f4b8ea2e7aa0133dfcd16f4d08ac39bd2))
* **statefulset:** add a Traefik IngressRoute configured with routes ([e326ffb](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/e326ffb17f1d54ba51d33d5fd35091852e123e81))
* **statefulset:** name the Services like the deployment chart ([ec44b60](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/ec44b6091cc8cc54261faa9ff2f731b78b7a7bbc))
* Traefik IngressRoute routes and Middlewares, consistent Service names (deployment, statefulset) ([0f5dc22](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/0f5dc2233116828d8cee6c149e58d6240a28094c))

## [5.0.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/statefulset-4.11.0...statefulset-5.0.0) (2026-11-01)


### ⚠ BREAKING CHANGES

* the default group and fsGroup of deployment, cronjobs, statefulset and daemonset change from 65534 to 1000. Existing volumes are re-chowned to group 1000 on the next mount. Set the values explicitly to keep 65534.

### Features

* default the pod and container group to 1000 ([ef64651](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/ef64651c47befd158b0a2a7455c9163f22a89380))

## [4.11.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/statefulset-4.10.0...statefulset-4.11.0) (2026-11-01)


### Features

* add enableServiceLinks to statefulset, cronjobs and daemonset ([e56b0a4](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/e56b0a498841c5d7ca752673012043ad8f6978ce))
* add enableServiceLinks to statefulset, cronjobs and daemonset ([1937b78](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/1937b78bb0ab0c2180dce759c318e93e29b0f44c))

## [4.10.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/statefulset-4.9.0...statefulset-4.10.0) (2026-11-01)


### Features

* **common:** mount a writable /tmp by default ([d37fb60](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/d37fb6047baeb112062c23ae66e246507cf15dda))
* enableServiceLinks and a writable /tmp by default ([f86c200](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/f86c2005790d4c4d237081552b3f19e87b52f632))

## [4.9.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/statefulset-4.8.0...statefulset-4.9.0) (2026-10-31)


### Features

* add argocd sync-wave -1 annotation to ExternalSecrets ([7097e67](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/7097e67eab70b211e53d61bbd777850983ce37fc))
* add argocd sync-wave -1 annotation to ExternalSecrets ([35d78c7](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/35d78c7ac991c817060eddc4fbc88ea2810e3d75))

## [4.8.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/statefulset-4.7.0...statefulset-4.8.0) (2026-10-28)


### Features

* **deployment:** KEDA ScaledObject; split network policy templates; capabilities for CRD apiVersions ([3f4e55e](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/3f4e55e73e49a69179d460c6f172fb637beddd9f))

## [4.7.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/statefulset-4.6.0...statefulset-4.7.0) (2026-10-28)


### Features

* **deployment,statefulset,daemonset:** add metrics.serviceMonitor.params and tlsConfig ([#55](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/issues/55)) ([c15a08b](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/c15a08baad9094feb12326a284064679b6f9d3f6))

## [4.6.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/statefulset-4.5.0...statefulset-4.6.0) (2026-10-28)


### Features

* **cronjobs,daemonset,statefulset,vaultsecrets:** render ExternalSecret as external-secrets.io/v1 ([#50](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/issues/50)) ([e000199](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/e0001999fe6ebaf0c403068d22cc8db8529d1967))

## [4.5.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/statefulset-4.4.0...statefulset-4.5.0) (2026-10-28)


### Features

* add global.enabled to chart values ([#43](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/issues/43)) ([396587d](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/396587db869ac79a4bb48a9d47d31f8d1917f238))

## [4.4.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/statefulset-4.3.0...statefulset-4.4.0) (2026-10-23)


### Features

* add networkPolicy.allowPodSelectors ([4005eb8](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/4005eb8080cbcf4473cfe2ed1e7277ad5d880268))
* **statefulset:** add networkPolicy.allowPodSelectors ([b5b3031](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/b5b30316662f4e487501b6fe66130787928a561a))

## [4.3.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/statefulset-4.2.0...statefulset-4.3.0) (2026-10-23)


### Features

* add networkPolicy support (Cilium by default) ([e9091f0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/e9091f0ca8e264bbccd17e048cb0b610e916e255))
* **statefulset:** add metrics.namespace for network policy prometheus access ([ac63fa6](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/ac63fa696fa929a685ca21be37061a79b20d1e75))
* **statefulset:** add networkPolicy support (Cilium by default) ([43262bb](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/43262bb6956f65162433116534fdddeeff778b1d))


### Bug Fixes

* **statefulset:** rename metrics.namespace to metrics.prometheusNamespace ([602074c](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/602074c1b988a8dbae27ff2213b2d97fc1438e60))

## [4.2.0](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/compare/statefulset-4.1.0...statefulset-4.2.0) (2026-10-23)


### Features

* align defaults across workload charts and add cronjobs presets ([58d3e83](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/58d3e83c201774f6cc0020f910268b0dcb262b0c))
* align pod affinity blocks with deployment and add topologySpread to statefulset ([b8cea29](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/b8cea295f61c2f912cca93a9b7937b7140aa0455))
* align pod affinity blocks with deployment and add topologySpread to statefulset ([605d71e](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/605d71ebd4146527cf929edd8c3747482c4e2526))
* align resourcesPreset and pdb defaults across statefulset and daemonset with deployment ([2a5bf57](https://github.com/next-gen-infrastructure/kubernetes-helm-charts/commit/2a5bf5755cd3f2a0f1b7a8d41bd4b56223118e0e))

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
