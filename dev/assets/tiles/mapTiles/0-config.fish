#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/../../../scripts/common/debugPrint.fish";
source "$SDIR/../../../scripts/common/errorPrint.fish";

# debugPrint "srcFile: $srcFile"
if test -z "$srcFile"
  if not read -P 'Source file: ' srcFile
    return 1;
  end
end
# debugPrint "srcFile: $srcFile"
if test \
        -z "$srcFile" \
  -o !  -e "$srcFile" \
  -o !  -f "$srcFile"
  errorPrint "Source file must be provided as the first argument, exist, and be a file; exiting...";
  return 2;
end

# debugPrint "outDir: $outDir"
if test -z "$outDir"
  if not read -P 'Output Directory: ' outDir
    return 3;
  end
end
# debugPrint "outDir: $outDir"
# I intentionally check this instead of creating it for the user in case
# they provide the wrong argument by accident.  Don't want to create a mess
# for them somewhere in some unintentional place.
if test \
        -z "$outDir" \
  -o !  -e "$outDir" \
  -o !  -d "$outDir"
  errorPrint "Output directory must be provided as the first argument, exist, and be a directory; exiting...";
  return 4;
end

test -z "$tileSize"; and set -x tileSize "256";
# debugPrint "tileSize: $tileSize";

set srcFileDir (dirname "$srcFile");
# set srcFileDir (readlink -f (dirname "$srcPaddedFile/.."));
test -z "$outWorkDir";
and set -x outWorkDir      "$srcFileDir/Work";
test -z "$outTrialsDir";
and set -x outTrialsDir "$srcFileDir/Trials";

set srcFileNameSuffix (
  basename "$srcFile" \
  | sed -r 's|(\.[^.]*?)$| - Extented - Zoom %s\1|g'
);

test -z "$tmpFitFileMask";
and set -x tmpFitFileMask  "$outWorkDir/$srcFileNameSuffix";

# debugPrint "srcFileDir: $srcFileDir";
# debugPrint "outWorkDir: $outWorkDir";
# debugPrint "outTrialsDir: $outTrialsDir";
# debugPrint "srcFileNameSuffix: $srcFileNameSuffix";
# debugPrint "tmpFitFileMask: $tmpFitFileMask";

mkdir -p "$outWorkDir";
mkdir -p "$outTrialsDir";