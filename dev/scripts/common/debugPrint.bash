#!/usr/bin/env bash

! type -t 'debugPrint' && \
debugPrint() {
  # echo "DEBUG __DEBUG__: $__DEBUG__";
  if [[ "$__DEBUG__" = "true" ]]; then
    # altPrint "DEBUG: $argv";
    altPrint -n "DEBUG: ";
    altPrint "$@";
  fi
}
