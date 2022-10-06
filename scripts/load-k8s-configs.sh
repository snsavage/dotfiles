#!/usr/bin/env bash

set -eo pipefail

[[ "$DEBUG" == true ]] && set -x

# Ref: https://medium.com/@alexgued3s/multiple-kubeconfigs-no-problem-f6be646fc07d

kubeconfig=
default_config="$HOME/.kube/config"
extra_configs="$HOME/.kube/contexts"

if test -f "$default_config"
then
  kubeconfig="$default_config"
fi

mkdir -p "${extra_configs}"

OIFS="$IFS"
IFS=$'\n'

for extra_config in `find "${extra_configs}" -type f -name "*.yml" -o -name "*.yaml"`
do
  kubeconfig="${extra_config}:${kubeconfig}"
done

IFS="$OIFS"

printf "$kubeconfig"
