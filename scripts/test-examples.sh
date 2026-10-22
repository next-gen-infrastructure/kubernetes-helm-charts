#!/usr/bin/env bash
# Render every example (charts/<chart>/examples/<case>) against its chart and fail on the first error.
# Usage: scripts/test-examples.sh [chart ...]   (default: every chart that has an examples/ dir)
set -Eeuo pipefail
cd "$(dirname "$0")/.."

charts=("$@")
if [ ${#charts[@]} -eq 0 ]; then
  for d in charts/*/examples; do c=${d#charts/}; charts+=("${c%/examples}"); done
fi

for chart in "${charts[@]}"; do
  echo "== ${chart}"
  # examples depend on the chart (file://../..), which depends on common: refresh both, quietly
  (cd "charts/${chart}" && rm -rf charts Chart.lock && helm dependency update --skip-refresh > /dev/null)
  for dir in "charts/${chart}"/examples/*/; do
    echo "-- $(basename "${dir}")"
    (cd "${dir}" && rm -rf charts Chart.lock && helm dependency update --skip-refresh > /dev/null \
      && helm template . --generate-name --namespace test \
        --set global.domain=example.com --set global.serviceName=test \
        --values values.yaml) | scripts/kubeconform.sh -
  done
done
