#!/usr/bin/env bash

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

! type -t 'errorPrint' && \
errorPrint() {
  altPrint "ERROR: $@";
}
