#!/usr/bin/env bash

set -e

# A typical helm chart directory structure looks as follows:
#
# └── root
#     ├── README.md
#     ├── Chart.yaml
#     ├── charts
#     │   └── postgres-9.5.6.tar.gz
#     └── templates
#         ├── deployment.yaml
#         ├── service.yaml
#         └── _helpers.tpl
#
# The `Chart.yaml` file is metadata that helm uses to index the chart, and is added to the release info. It includes things
# like `name`, `version`, and `maintainers`.
# The `charts` directory are subcharts / dependencies that are deployed with the chart.
# The `templates` directory is what contains the go templates to render the Kubernetes resource yaml. Also includes
# helper template definitions (suffix `.tpl`).
#
# Note that pre-commit will only feed this the files that changed in the commit, so we can't do the filtering at the
# hook setting level (e.g `files: Chart.yaml` will not work if no changes are made in the Chart.yaml file).

# OSX GUI apps do not pick up environment variables the same way as Terminal apps and there are no easy solutions,
# especially as Apple changes the GUI app behavior every release (see https://stackoverflow.com/q/135688/483528). As a
# workaround to allow GitHub Desktop to work, add this (hopefully harmless) setting here.
export PATH=$PATH:/usr/local/bin

# Take the current working directory to know when to stop walking up the tree
readonly cwd_abspath="$(realpath "$PWD")"

# https://stackoverflow.com/a/8574392
# Usage: contains_element "val" "${array[@]}"
# Returns: 0 if there is a match, 1 otherwise
contains_element() {
  local -r match="$1"
  shift

  for e in "$@"; do
    if [[ "$e" == "$match" ]]; then
      return 0
    fi
  done
  return 1
}

# Only log debug statements if PRECOMMIT_DEBUG environment variable is set.
# Log to stderr.
debug() {
  if [[ ! -z $PRECOMMIT_DEBUG ]]; then
    >&2 echo "$@"
  fi
}

# Recursively walk up the tree until the current working directory and check if the changed file is part of a helm
# chart. Helm charts have a Chart.yaml file.
chart_path() {
  local -r changed_file="$1"

  # We check both the current dir as well as the parent dir, in case the current dir is a file
  local -r changed_file_abspath="$(realpath "$changed_file")"
  local -r changed_file_dir="$(dirname "$changed_file_abspath")"

  debug "Checking directory $changed_file_abspath and $changed_file_dir for Chart.yaml"

  # Base case: we have walked to the top of dir tree
  if [[ "$changed_file_abspath" == "$cwd_abspath" ]]; then
    debug "No chart path found"
    echo ""
    return 0
  fi

  # The changed file is itself the helm chart indicator, Chart.yaml
  if [[ "$(basename "$changed_file_abspath")" == "Chart.yaml" ]]; then
    debug "Chart path found: $changed_file_dir"
    echo "$changed_file_dir"
    return 0
  fi

  # The changed_file is the directory containing the helm chart package file
  if [[ -f "$changed_file_abspath/Chart.yaml" ]]; then
    debug "Chart path found: $changed_file_abspath"
    echo "$changed_file_abspath"
    return 0
  fi

  # The directory of changed_file is the directory containing the helm chart package file
  if [[ -f "$changed_file_dir/Chart.yaml" ]]; then
    debug "Chart path found: $changed_file_dir"
    echo "$changed_file_dir"
    return 0
  fi

  # None of the above, so recurse and do again in the parent dir
  chart_path "$changed_file_dir"
}

# An array to keep track of which charts we already processed
seen_chart_paths=()

for file in "$@"; do
  debug "Checking $file"
  file_chart_path=$(chart_path "$file")
  debug "Resolved $file to chart path $file_chart_path"

  if [[ ! -z "$file_chart_path" ]]; then
    if contains_element "$file_chart_path" "${seen_chart_paths[@]}"; then
      debug "Already linted $file_chart_path"
    else
      pushd $file_chart_path > /dev/null
      # Installation: https://github.com/karuppiah7890/helm-schema-gen#install
      helm schema-gen values.yaml > values.schema.json
      # Installation: https://github.com/bitnami-labs/readme-generator-for-helm#install
      readme-generator \
        --values values.yaml \
        --readme README.md \
        --schema values.schema.json
      popd > /dev/null
      seen_chart_paths+=( "$file_chart_path" )
    fi
  fi
done
