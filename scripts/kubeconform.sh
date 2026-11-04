#!/usr/bin/env bash
set -euo pipefail

command -v kubeconform >/dev/null 2>&1 || { echo "kubeconform not found"; exit 1; }

# Pick your k8s version; keep it aligned with cluster/Argo.
K8S_VERSION="${K8S_VERSION:-1.36.0}"

# kubeconform notes:
# -strict: fail on missing/unknown fields (great for typos)
# -ignore-missing-schemas: don't fail if CRDs (e.g., argoproj.io) are missing
# Add custom schema locations if you want stronger CRD checks.
validate() {
  kubeconform \
    -strict \
    -summary \
    -kubernetes-version "$K8S_VERSION" \
    -ignore-missing-schemas \
    -skip IngressRoute,ImageUpdater \
    `# ^ datreeio catalog schemas are stale: IngressRoute lacks ingressClassName, and` \
    `#   ImageUpdater still marks spec.namespace required (dropped in the latest CRD).` \
    `#   helm template still validates their YAML/templating.` \
    -schema-location default \
    -schema-location 'https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json'
}

# Filter mode: `helm template ... | scripts/kubeconform.sh -` validates manifests from stdin.
if [[ "${1:-}" == "-" ]]; then
  validate
  exit
fi

command -v kustomize >/dev/null 2>&1 || { echo "kustomize not found"; exit 1; }

CHANGED="$(git diff --cached --name-only --diff-filter=ACMR)"

dirs=()
while IFS= read -r f; do
  d="$(dirname "$f")"
  [[ "$f" != apps/* && "$f" != argocd/* ]] && continue

  while [[ "$d" != "." && "$d" != "/" ]]; do
    if [[ -f "$d/kustomization.yaml" || -f "$d/kustomization.yml" ]]; then
      dirs+=("$d")
      break
    fi
    d="$(dirname "$d")"
  done
done <<< "$CHANGED"

# De-dupe
uniq_dirs=()
if [ "${#dirs[@]}" -gt 0 ]; then
  while IFS= read -r d; do
    uniq_dirs+=("$d")
  done < <(printf "%s\n" "${dirs[@]}" | sort -u)
fi

if [[ "${#uniq_dirs[@]}" -eq 0 ]]; then
  echo "No changed kustomize overlays detected."
  exit 0
fi

echo "Validating manifests with kubeconform (k8s $K8S_VERSION)"

for d in "${uniq_dirs[@]}"; do
  echo "==> $d"
  kubectl kustomize "$d" | validate
done
