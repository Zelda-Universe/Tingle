#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

debugPrint '3-generateTile START';

set SDIR (dirname (status filename));

source "$SDIR/1-config.fish";

if test \
      -z "$background"  \
  -o  -z "$font"        \
  -o  -z "$fill"        \
  -o  -z "$tileSize"    \
  -o  -z "$pointsize"   \
  -o  -z "$gravity"     \
  -o  -z "$bordercolor" \
  -o  -z "$bordersize"  \
  -o  -z "$filePath"
  errorPrint 'Missing required parameter; exiting...';
  errorPrint "background: $background";
  errorPrint "font: $font";
  errorPrint "fill: $fill";
  errorPrint "tileSize: $tileSize";
  errorPrint "pointsize: $pointsize";
  errorPrint "gravity: $gravity";
  errorPrint "bordercolor: $bordercolor";
  errorPrint "bordersize: $bordersize";
  errorPrint "filePath: $filePath";

  exit 1;
end

if test -z "$label"
  set labelOpts '';
else
  set labelOpts "label:$label";
end
debugPrint "label: $label";
debugPrint "labelOpts: $labelOpts";
debugPrint "count labelOpts: "(count $labelOpts);

# Since fish shell is ot preserving array variables........
if test -n "$inputOptsJSON"
  set $inputOpts (
    echo "$inputOptsJSON" \
    | jq -r '.[]'
  );
end
set inputOpts $inputOpts $labelOpts;

debugPrint "inputOpts: $inputOpts";
debugPrint "count inputOpts: "(count $inputOpts);
for inputOpt in $inputOpts
  debugPrint "inputOpt: $inputOpt";
end

convert \
  -background   "$background"           \
  -font         "$font"                 \
  -fill         "$fill"                 \
  -size         {$tileSize}x{$tileSize} \
  -pointsize    "$pointsize"            \
  -gravity      "$gravity"              \
  -bordercolor  "$bordercolor"          \
  -border       "$bordersize"           \
  $inputOpts                            \
  "$filePath"                           \
;

debugPrint '3-generateTile END';
