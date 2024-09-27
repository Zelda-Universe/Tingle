#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

# TODO: Only to axis folders from root for now..
# not zoom to axis, or reverse to zoom or root from axis or zoom....

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/../../scripts/common/altPushd.fish";
source "$SDIR/../../scripts/common/debugPrint.fish";

test -z "$tilesDir"         ; # TODO: Make specific to fileRootDir
and set tilesDir "$argv[1]" ;
# test -z "$tilesDir";
# and set tilesDir (readlink -e "$SDIR/../../../tiles");
# debugPrint "tilesDir: $tilesDir";

test -z "$tilesDir";
and return 1;

test -z "$reverse"      ;
and set reverse 'false' ;

altPushd "$tilesDir";

echo "Processing \"$tilesDir\"...";

# -printf "%f\n" \
find              \
  -mindepth 1     \
  -maxdepth 1     \
  -type f         \
  -iname '*.png'  \
| while read file;
  # debugPrint "file: $file";

  # debugPrint (
  #   echo "$file" \
  #   | sed -r 's|./[^/]+/[^/]+/||' \
  #   | tr '_.' '\n'
  # );

  # echo "$file"    \
  # | sed -r 's|^./[^/]+/[^/]+/||' \
  # | tr '_.' '\n'  \
  # | read -L z x y;
  echo "$file"    \
  | sed -r 's|^./||' \
  | tr '_./' '\n'  \
  | read -L z x y;
  # debugPrint "x: $x";
  # debugPrint "y: $y";
  # debugPrint "z: $z";

  # set subDir (
  #   echo "$file"    \
  #   | grep -oP 's|^./[^/]+/[^/]+(?=/)||'
  # );
  # # debugPrint "subDir: $subDir";

  # set fileName (
  #   echo "$file"    \
  #   | sed -r "s|^$subDir/||"
  # );
  # # debugPrint "fileName: $fileName";

  # altPushd "$subDir";

  if test \
        "$outputZoomFolders" = 'true' \
    -o  "$outputAxisFolders" = 'true'

    if test "$reverse" != 'true'
      test ! -d "$z";
      and mkdir "$z";
    end

    if test "$outputAxisFolders" = 'true'

      if test "$reverse" = 'true'
        set newFilePath {$z}_{$x}_{$y};
        # debugPrint "newFilePath: $newFilePath";
      else
        test ! -d "$z/$x";
        and mkdir "$z/$x";

        set newFilePath {$z}/{$x}/{$y};
        # debugPrint "newFilePath: $newFilePath";
      end
    else
      set newFilePath {$z}/{$x}_{$y};
      # debugPrint "newFilePath: $newFilePath";
    end
  else
    # set newFilePath {$z}_{$x}_{$y}; # Rest NIY..
  end
  set newFilePath "$newFilePath.png";
  # debugPrint "newFilePath: $newFilePath";

  # echo mv "$subDir/$fileName" "$newFilePath";
  mv "$file" "$newFilePath";
	echo -n '.';

  # popd;
end

popd;
