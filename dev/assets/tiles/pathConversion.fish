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

if test -z "$reverse" -o "$reverse" != 'true'
  set reverse 'false';
  set depth '1';
else
  # Only from axis for now..
  set depth '3';
end
# debugPrint "depth: $depth";
# debugPrint "reverse: $reverse";

altPushd "$tilesDir";

echo "Processing \"$tilesDir\"...";

# -printf "%f\n" \
find                  \
  -mindepth "$depth"  \
  -maxdepth "$depth"  \
  -type f             \
  -iname '*.png'      \
| while read file
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

  if test "$reverse" = 'true'
    # Only to root for now..
    # When improving, could add delim vars for efficiency
    set newFilePath {$z}_{$x}_{$y};
    # debugPrint "newFilePath: $newFilePath";
  else
    if test \
          "$outputZoomFolders" = 'true' \
      -o  "$outputAxisFolders" = 'true'

      if test "$reverse" != 'true'
        test ! -d "$z";
        and mkdir "$z";

        if test "$outputAxisFolders" = 'true'
          test ! -d "$z/$x";
          and mkdir "$z/$x";

          set newFilePath {$z}/{$x}/{$y};
          # debugPrint "newFilePath: $newFilePath";
        else
          set newFilePath {$z}/{$x}_{$y};
          # debugPrint "newFilePath: $newFilePath";
        end
      end
    end
  end
  set newFilePath "$newFilePath.png";
  # debugPrint "newFilePath: $newFilePath";

  # echo mv "$file" "$newFilePath";

  if not mv -n "$file" "$newFilePath"
    errorPrint 'Move operation failed; preventing possible further problems with other files; exiting...';
    return 2;
  end
	echo -n '.';

  # popd;
end

popd;
