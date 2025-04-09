#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/../../../scripts/common/altPushd.fish"  ;
source "$SDIR/../../../scripts/common/debugPrint.fish";
source "$SDIR/../../../scripts/common/errorPrint.fish";
source "$SDIR/../../../scripts/common/timing.fish"    ;

# debugPrint "argv: $argv";

if not source "$SDIR/0-config.fish"
  exit 1;
end

if not source "$SDIR/setImageProg.fish"
  exit 2;
end

# set coordIndex '1';

set coordNames 'z' 'x' 'y';

for coordName in $coordNames
  # debugPrint "$coordName: $$coordName";
  if test -n "$argv[1]"
    set $coordName "$argv[1]";
    set -e argv[1];
    # debugPrint "$coordName: $$coordName";
  end
end

for coordName in $coordNames
  # debugPrint "coordName: $coordName";
  # debugPrint "coord: $$coordName";
  # debugPrint "coordIndex: $coordIndex";
  if test -z "$$coordName"
    # debugPrint "argv[$coordIndex]: $argv[$coordIndex]"
    # debugPrint "argv[$coordIndex]: "(eval "echo \$argv[$coordIndex]");
    # set $coord "$argv[$coordIndex]";
    # debugPrint "coord: $$coordName";
    if test -z "$$coordName"
      if not read -P "$coordName: " $coordName
        exit;
      end
    end
  end

  # debugPrint "\$\$coord: $$coord";
  if test -z "$$coordName"
    errorPrint "$coordName must be provided as an argument; exiting...";
    exit 3;
  end

  # set coordIndex (echo "$coordIndex + 1" | bc);
end

set xOffset (echo "$x * $tileSize" | bc);
set yOffset (echo "$y * $tileSize" | bc);
# debugPrint "xOffset: $xOffset";
# debugPrint "yOffset: $yOffset";

if not altPushd "$outDir"
  errorPrint "Could not enter output directory \"$outDir\"; exiting...";
  exit 4;
end

if test "$outputAxisFolders" = "true"
  set tileFileName    {$z}/{$x}/{$y}".png";
  test ! -e "$z"    ;
  and mkdir "$z"    ;
  test ! -e "$z/$x" ;
  and mkdir "$z/$x" ;
else
  if test "$outputZoomFolders" = "true"
    set tileFileName  {$z}/{$x}_{$y}".png";
    test ! -e "$z"  ;
    and mkdir "$z"  ;
  else
    set tileFileName  {$z}_{$x}_{$y}".png";
  end
end
# debugPrint "tileFileName: $tileFileName";

set currentExtFile (printf "$tmpFitFileMask" "$z");
# debugPrint "currentExtFile: $currentExtFile";

# debugPrint 'pwd: '(pwd);

if test "$dryRun" != 'true'
  if test -e "$tileFileName"
    echo "Tile \"$tileFileName\" already exists; exiting...";
    exit 5;
  end

  echo "Cropping tile \"$tileFileName\"...";

  timerStart;
  "$imageProg"        \
    "$currentExtFile" \
    -crop {$tileSize}x{$tileSize}"+$xOffset+$yOffset" \
    "$tileFileName"   \
  ;
  timerStop;
  timerDurationReportAndSave "$timeFilePath";

  if test ! -e "$tileFileName"
    errorPrint 'Could not crop tile; unknown Magick error.';
    errorPrint "tileFileName: $tileFileName";
  end
else
  echo 'Skipping execution and timing due to dry run setting being enabled...';
end

popd;
