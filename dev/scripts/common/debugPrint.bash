#!/usr/bin/env bash

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

! type -t 'debugPrint' && \
debugPrint() {
  # echo "DEBUG __DEBUG__: $__DEBUG__";
  if [[ "$__DEBUG__" = "true" ]]; then
    # altPrint "DEBUG: $argv";
    altPrint -n "DEBUG: ";
    altPrint "$@";
  fi
}
