#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

# debugPrint '3-generateTile START';

set SDIR (readlink -f (dirname (status filename)));

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

# pwd;

# debugPrint "filePath: $filePath";

if test -z "$label"
  set labelOpts '';
else
  set labelOpts "label:$label";
end
# debugPrint "label: $label";
# debugPrint "labelOpts: $labelOpts";
# debugPrint "count labelOpts: "(count $labelOpts);

if test -n "$tileSize" -a -n "$bordersize"
  set tileSize (
    echo "$tileSize - ($bordersize * 2)" | bc
  );
end

# Since fish shell is not preserving array variables........
if test -n "$inputOptsJSON"
  set inputOpts (
    echo "$inputOptsJSON" \
    | jq -r '.[]'
  );

  # echo "$inputOptsJSON" \
  # | jq -r '.[]'
end

for inputOpt in $inputOpts
  test -n "$inputOpt";
  and set -a trailingOpts "$inputOpt";
end

for labelOpt in $labelOpts
  test -n "$labelOpt";
  and set -a trailingOpts "$labelOpt";
end

# debugPrint "inputOpts: $inputOpts";
# debugPrint "inputOpts[-2]: $inputOpts[-2]";
# debugPrint "inputOpts[-1]: $inputOpts[-1]";
# debugPrint "count inputOpts: "(count $inputOpts);
# for inputOpt in $inputOpts
#   debugPrint "inputOpt: $inputOpt";
# end
# pwd

set -a trailingOpts "$filePath";

# debugPrint convert                      \
#   -background   "$background"           \
#   -font         "$font"                 \
#   -fill         "$fill"                 \
#   -size         {$tileSize}x{$tileSize} \
#   -pointsize    "$pointsize"            \
#   -gravity      "$gravity"              \
#   -bordercolor  "$bordercolor"          \
#   -border       "$bordersize"           \
#   $trailingOpts                         \
# ;
convert                                 \
  -background   "$background"           \
  -font         "$font"                 \
  -fill         "$fill"                 \
  -size         {$tileSize}x{$tileSize} \
  -pointsize    "$pointsize"            \
  -gravity      "$gravity"              \
  -bordercolor  "$bordercolor"          \
  -border       "$bordersize"           \
  $trailingOpts                         \
;

# debugPrint '3-generateTile END';
