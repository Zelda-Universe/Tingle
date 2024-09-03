#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

if test "$includedZVerboseMagick" = 'true'
  exit;
end
set includedZVerboseMagick 'true';

if test                         \
  "$imageProgGM" != 'true'      \
  -a \(                         \
        "$monitor"    = 'true'  \
    -o  "$verbose"    = 'true'  \
  \)
  set monitorOpts '-monitor';
  # debugPrint "monitorOpts: $monitorOpts";
end
