#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

if test \
  -z "$xStart" \
  -z "$xEnd" \
  -z "$yStart" \
  -z "$yEnd" \
  -z "$zStart" \
  -z "$zEnd"
  errorPrint 'Missing required parameter; exiting...';
  errorPrint "xStart: $xStart";
  errorPrint "xEnd: $xEnd";
  errorPrint "yStart: $yStart";
  errorPrint "yEnd: $yEnd";
  errorPrint "zStart: $zStart";
  errorPrint "zEnd: $zEnd";

  exit 1;
end

for z in (seq "$zStart" "$zEnd")
  test "$outputZoomFolders" = 'true' -a ! -d "$z";
  and mkdir -- "$z";

  for x in (seq "-$xStart" "$xEnd")
    test "$outputAxisFolders" = 'true' -a ! -d "$z/$x";
    and mkdir -- "$z/$x";

    for y in (seq "-$yStart" "$yEnd")
      eval set -l pathName "$pathNameMask";
      # debugPrint "pathName: $pathName";
      set -l filePath "$pathName.$fileExt";
      # debugPrint "filePath: $filePath";

      test -e "$filePath" -a "$force" != 'true'; and continue;

      "$SDIR/3-generateTile.fish";
    end
    # break;
  end
end
