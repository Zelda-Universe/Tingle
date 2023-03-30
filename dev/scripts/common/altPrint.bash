#!/usr/bin/env bash

! type -t 'altPrint' && \
altPrint() {
  echo "$@" 1>&2;
}
