#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

# TODO: Only to folders for now..

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/../../scripts/common/altPushd.fish";
source "$SDIR/../../scripts/common/debugPrint.fish";

test -z "$tilesDir"; and set tilesDir "$argv[1]";
test -z "$tilesDir"; and set tilesDir "$SDIR/../../../tiles";
# debugPrint "tilesDir: $tilesDir";

altPushd "$tilesDir";

echo "Processing \"$tilesDir\"...";

find \
  "$tilesDir" \
  -mindepth 1 \
  -maxdepth 1 \
  -type f \
  -iname '*.png' \
  -printf "%f\n" \
| while read file;
  # debugPrint "file: $file";

	echo "$file" \
  | tr '_.' '\n' \
  | read -L z x y;
  # debugPrint "x: $x";
  # debugPrint "y: $y";
  # debugPrint "z: $z";

  if test \
        "$outputZoomFolders" = 'true' \
    -o  "$outputAxisFolders" = 'true'

    test ! -d "$z"; and mkdir "$z";

    if test "$outputAxisFolders" = 'true'
      test ! -d "$z/$x"; and mkdir "$z/$x";

      set newFilePath {$z}/{$x}/{$y};
    else
      set newFilePath {$z}/{$x}_{$y};
    end
  else
    # set newFilePath {$z}_{$x}_{$y}; # Rest NIY..
  end
  set newFilePath "$newFilePath.png";
  # debugPrint "newFilePath: $newFilePath";

	mv "$file" "$newFilePath";
	echo -n '.';
end

popd;
