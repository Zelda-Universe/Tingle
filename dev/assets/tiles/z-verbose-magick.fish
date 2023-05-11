#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

if test "$includedZVerboseMagick" = 'true'
  exit;
end
set includedZVerboseMagick 'true';

if test                         \
  "$gm" != 'true'               \
  -a \(                         \
        "$monitor"    = 'true'  \
    -o  "$verbose"    = 'true'  \
  \)
  set monitorOpts '-monitor';
  # debugPrint "monitorOpts: $monitorOpts";
end