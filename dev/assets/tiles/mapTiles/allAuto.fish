#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

echo "Not updated or able to be generalized properly; exiting...";
exit;

set -l SDIR (readlink -f (dirname (status filename)));

pushd "$SDIR";

find -mindepth 1 -maxdepth 1 -type d -printf '%f\n' \
| while read platform
  echo "Processing platform \"$platform\"";
  if test ! -e "$platform/games";
    echo "No games found; skipping...";
    continue;
  end
  pushd "$platform/games";

  find -mindepth 1 -maxdepth 1 -type d -printf '%f\n' \
  | while read game
    echo "Processing game \"$game\"";
    if test ! -e "$game/Maps";
      echo "No Maps found; skipping...";
      continue;
    end
    pushd "$game/Maps";

    find -mindepth 1 -maxdepth 1 -type d -printf '%f\n' \
    | sort -n   \
    | head -n 1 \
    | while read map
      echo "Processing map \"$map\"";
      pushd "$map";

      find -mindepth 1 -maxdepth 1 -type f -iname '*.png' -printf '%f\n' \
      | sort -n   \
      | head -n 1 \
      | read srcFile;
      if test -e "$srcFile";
        echo "$SDIR/run.fish" "$srcFile" .;
      else
        echo "Source file for $game $map not found; skipping...";
      end
      popd;
    end
    popd;
  end

end
popd;
