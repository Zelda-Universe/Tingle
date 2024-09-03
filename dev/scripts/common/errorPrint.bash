#!/usr/bin/env bash

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

! type -t 'errorPrint' && \
errorPrint() {
  altPrint "ERROR: $@";
}
