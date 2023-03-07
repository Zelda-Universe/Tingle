#!/usr/bin/env fish

echo "Not updated or able to be generalized properly; exiting...";
exit;

set SDIR "$PWD/"(dirname (status filename));

pushd "$SDIR";

find -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | while read platform
  echo "Processing platform \"$platform\"";
  if test ! -e "$platform/games";
    echo "No games found; skipping...";
    continue;
  end
  pushd "$platform/games";

  find -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | while read game
    echo "Processing game \"$game\"";
    if test ! -e "$game/Maps";
      echo "No Maps found; skipping...";
      continue;
    end
    pushd "$game/Maps";

    find -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | while read map
      echo "Processing map \"$map\"";
      pushd "$map";

      find -mindepth 1 -maxdepth 1 -type f -iname '*.png' -printf '%f\n' | head -n 1 | read srcFile;
      if test -e "$srcFile";
        echo env outputZoomFolders=true "$SDIR/generateMapTiles.fish" "$srcFile" .;
      else
        echo "Source file for $game $map not found; skipping...";
      end
      popd;
    end
    popd;
  end

end
popd;
