#!/usr/bin/env fish

## Info

# Author: Pysis

# Dependencies:
# - fish shell
# - Basic shell utilities:
#   - variables
#   - subshells
#   - loops
#   - status
#   - dirname
#   - find
#   - echo
#   - tail
#   - read
#   - pushd
#   - popd
#   - env
# - ./generateMapTiles.fish
# - ../tiles/<game>/<map>/<first_file>.png

set SDIR "$PWD/"(dirname (status filename));

pushd "$SDIR/../tiles" > /dev/null;

find -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | while read game
  echo "Processing game \"$game\"";
  pushd "$game" > /dev/null;
  find -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | while read map
    echo "Processing map \"$map\"";
    pushd "$map" > /dev/null;
    find -maxdepth 1 -type f -iname '*.png' -printf '%f\n' | head -n 1 | read srcFile;
    if test -e "$srcFile";
      env outputZoomFolders=true "$SDIR/generateMapTiles.fish" "$srcFile" .;
    else
      echo "Source file for $game $map not found; skipping...";
    end
    popd > /dev/null;
  end
  popd > /dev/null;
end

popd > /dev/null;