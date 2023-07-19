#!/bin/bash
#
set -eo pipefail

[[ "$DEBUG" == true ]] && set -x


usage() {
  cat <<EOF

Utility for turning caffeinate on and off.

Commands:

  $0 caffeinate
      Start caffeinate in background.

  $0 caffeinated
      Test is caffeinate is running in background.

  $0 decaf
      Stop caffeinate.
EOF
}

main() {
  local cmd

  cmd="$1"

  case "$cmd" in
    caffeinate)
      ;;
    caffeinated)
      ;;
    decaf)
      ;;
    "" | *)
      usage
      exit 1
      ;;
  esac

  submit_workflow $pr_url $merge
}

main "$@"

