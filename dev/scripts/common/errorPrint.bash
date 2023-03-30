#!/usr/bin/env bash

! type -t 'errorPrint' && \
errorPrint() {
  altPrint "ERROR: $@";
}
