#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/../../scripts/common/errorPrint.fish";

test -z "$processZoomLevels"; and set -x processZoomLevels '*';
# debugPrint "processZoomLevels: $processZoomLevels";

pushd "$SDIR/../../../tiles";

test -z "$resLevelChoice"; and set resLevelChoice '0';

set availableGames  'botw' 'lafs' 'totk';
set defaultGames    'totk'              ;
test -z "$processGames"; and set processGames $defaultGames;
# debugPrint "availableGames: $availableGames";
# debugPrint "defaultGames  : $defaultGames"  ;
# debugPrint "processGames  : $processGames"  ;

for game in $processGames
  if echo "$availableGames" | grep -vq "$game"
    echo "Error: Game \"$game\" not supported; exiting...";
    exit;
  end
end

if echo "$processGames" | grep -qE "\bbotw\b"
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
end # if

if echo "$processGames" | grep -qE "\btotk\b"
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
end # if

# if echo "$processGames" | grep -qE "\blafs\b"
# end # if
