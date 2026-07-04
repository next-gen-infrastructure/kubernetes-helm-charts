# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository purpose

Monorepo of reusable Helm charts published to https://next-gen-infrastructure.github.io/kubernetes-helm-charts. One library chart, `charts/common`, provides all shared named templates; the application charts (`deployment`, `cronjobs`, `daemonset`, `statefulset`, `configmaps`, `vaultsecrets`) depend on it via `repository: "file://../common"` with a `^2.0.0` version range.

## Commands

Charts do not render without a few global values; CI always sets them. Lint and validate a single chart (this is exactly what the PR workflow `.github/workflows/test.yaml` runs per chart):

```bash
cd charts/deployment
helm dependency update .
helm lint . --strict --with-subcharts \
  --set global.project=core --set global.domain=example.com --set global.serviceName=test
helm template . --debug --generate-name --namespace test --dependency-update \
  --set global.project=core --set global.domain=example.com --set global.serviceName=test \
  --values values.yaml
```

Render the example scenarios of a chart (each of `deployment`, `cronjobs`, `daemonset`, `statefulset` has an `examples/` dir with a runner):

```bash
cd charts/deployment/examples && ./test.sh
```

Pre-commit (config in `.pre-commit-config.yaml`): `pre-commit run --all-files`. Requires `helm-schema` (github.com/dadav/helm-schema) and `readme-generator` (bitnami-labs/readme-generator-for-helm) on PATH.

## Generated files — do not hand-edit

For every chart, `README.md` and `values.schema.json` are generated from `values.yaml` by the pre-commit hook `.pre-commit/process.sh` (runs `helm-schema` and `readme-generator` for each chart whose `Chart.yaml`/`values.yaml` changed). Therefore:

- Document values in `values.yaml` using the Bitnami annotation comments (`## @section ...`, `## @param name Description`, `## @skip`). Every value must have a `@param` line or README generation fails.
- After changing any `values.yaml`, regenerate via pre-commit rather than editing `README.md` or `values.schema.json` directly.

## Releases and versioning

release-please (`release-please-config.json`, manifest in `.release-please-manifest.json`) versions each chart independently based on conventional commit messages (`fix:` → patch, `feat:` → minor). Use scoped conventional commits, e.g. `fix: improve image construction validation in common chart template`. On merge to `main`, `.github/workflows/deploy.yaml` lets release-please bump `Chart.yaml` versions via a release PR, then packages the bumped charts, uploads the `.tgz` to a GitHub Release tagged `<chart>-<version>` (no `v` prefix), and updates the Helm repo `index.yaml` on the `gh-pages` branch. Never bump `Chart.yaml` versions or edit `CHANGELOG.md` by hand.

## Architecture

`charts/common` is `type: library` (not deployable). Its `templates/_*.tpl` files define namespaced helpers: `common.names.*`, `common.labels.*`, `common.images.*`, `common.containers.container` (full container spec: probes, env, resources, volumes), `common.envvar.*` (value/ref/configmap/secret/vaultSecret sources), `common.ingress.*`, `common.affinities.*`, `common.capabilities.*` (K8s API version detection), `common.tplvalues.render` (lets values.yaml contain `{{ }}` expressions), and `common.secrets.*`. `templates/validations/` holds database credential validators. Application chart templates are thin wrappers that assemble these helpers, typically passing context explicitly:

```yaml
labels: {{ include "common.labels.standard" (dict "customLabels" .Values.commonLabels "context" $) | nindent 4 }}
```

Values flow: a shared `global` block (`org`, `project`, `serviceName`, `environment`, `domain`, `image.{name,tag,pullPolicy,pullSecrets}`) drives naming, DNS/ingress hosts (`[<project>.<environment>].<domain>`), and image construction; chart-level values cover the workload specifics. Since `common` is consumed through each chart's `charts/` subdirectory, changes to `common` only take effect in a dependent chart after re-running `helm dependency update` there — stale vendored copies are the usual cause of "my template change did nothing".

The `deployment` chart renders either a standard Deployment or an Argo Rollout depending on `rollouts.enabled` (mutually exclusive templates gated by the same flag).
