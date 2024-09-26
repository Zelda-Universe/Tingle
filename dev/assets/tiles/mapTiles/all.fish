#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/../../../scripts/common/errorPrint.fish";

test -z "$tilesBasePath";
and set tilesBasePath (
  readlink -e "$SDIR/../../../../tiles"
);

test -n "$srcFile"; and set -e srcFile;
test -n "$outDir" ; and set -e outDir ;

test -z "$resLevelChoice" ;
and set resLevelChoice '0';

set availableGames  'botw' 'lafs' 'la_rmk' 'totk';
# set availableGames  'botw' 'lafs' 'la_rmk' 'totk' 'eow';
set defaultGames    '';
test -z "$processGames";
and set processGames $defaultGames;
# debugPrint "availableGames: $availableGames";
# debugPrint "defaultGames  : $defaultGames"  ;
# debugPrint "processGames  : $processGames"  ;

for game in $processGames
  if echo "$availableGames" | not grep -q "$game"
    echo "Error: Game \"$game\" not supported; exiting...";
    exit;
  end
end

if echo "$processGames" | grep -qE "\bbotw\b"
  echo 'Processing Breath of the Wild...';
  ## BotW
  set game          'botw'        ;
  set area          'hyrule'      ;
  set exploreStates 'Default' '0' ;
  for exploreState in $exploreStates
    set mapSubPath "$game/$area/$exploreState";
    if test -e "$mapSubPath"
      if test -L "$mapSubPath"
        errorPrint 'Tile directory already exists, and is a link; unlink before executing this script; exiting...';
        exit 1;
      end
    else
      mkdir -p "$mapSubPath";
    end

    "$SDIR/run.fish"  \
      "$SDIR/switch/games/$mapSubPath/$resLevelChoice/Map.png" \
      "$mapSubPath"    \
    ;
  end
end # if game botw

if echo "$processGames" | grep -qE "\btotk\b"
  echo 'Processing Tears of the Kingdom...';
  ## TotK
  set game          'totk'                      ;
  set areas         'ground' 'sky' 'underground';
  set eventStates   'before' 'after'            ;
  # set exploreStates 'explored' 'unexplored'     ;
  set exploreStates 'explored'                  ;
  for area in $areas
    for eventState in $eventStates
      for exploreState in $exploreStates
        set mapSubPath "$game/$area/$eventState/$exploreState";

        if test -e "$mapSubPath"
          if test -L "$mapSubPath"
            errorPrint 'Tile directory already exists, and is a link; unlink before executing this script; exiting...';
            exit 1;
          end
        else
          mkdir -p "$mapSubPath";
        end

        "$SDIR/run.fish" \
          "$SDIR/../switch/games/$mapSubPath/$resLevelChoice/Map.png" \
          "$mapSubPath" \
        ;
      end # exploreState
    end # eventState
  end # area
end # if game totk

if begin
  echo "$processGames" | grep -qE "\blafs\b";
  or echo "$processGames" | grep -qE "\bla_rmk\b";
end

  echo 'Processing Link\'s Awakening Remake...';
  ## LAfS
  set game      'la_rmk'    ;
  set areas     'Overworld' ;
  set mapTypes  'Normal'    ;

  for area in $areas
    # debugPrint "area: $area";
    for mapType in $mapTypes
      # debugPrint "mapType: $mapType";

      set mapSubPath "$game/Maps/$area/$mapType";
      set mapPath (
        readlink -e "$SDIR/../switch/games/$mapSubPath/Map.png"
      );
      set tilesSubPath "$game/$area/$mapType";
      set tilesPath "$tilesBasePath/$tilesSubPath";
      # debugPrint "mapSubPath: $mapSubPath";
      # debugPrint "mapPath: $mapPath";
      # debugPrint "tilesSubPath: $tilesSubPath";
      # debugPrint "tilesPath: $tilesPath";

      if test ! -e "$mapPath"
        errorPrint 'Map does not exist; skipping...';
        errorPrint "mapPath: $mapPath";
        break;
      end

      if test -e "$tilesSubPath"
        if test -L "$tilesSubPath"
          errorPrint 'Tile directory already exists, and is a link; unlink before executing this script; exiting...';
          exit 1;
        end
      else
        mkdir -p "$tilesSubPath";
      end

      "$SDIR/run.fish"  \
        "$mapPath"      \
        "$tilesPath"    \
      ;
    end # mapType
  end # area
end # if game lafs

# if echo "$processGames" | grep -qE "\beow\b"
# end # if game eow
