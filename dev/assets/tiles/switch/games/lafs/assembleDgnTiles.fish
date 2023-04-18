#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

## Info

# ABCDEFGH    - horizontal index  (8)
# 12345678    - vertical index    (8)
# Dimensions:
# - Dungeon Tiles:    160   x 128
# - Dungeon Map Grid: 1,308 x 1,040

## General Function Library

function getTileOffsets --argument-names excludesFile tileFile tileWidth tileHeight
  # TODO: this or placeTile is slow, about 2 seconds per tile.
  # Not sure how to make it faster..  I don't want to batch rename the
  # source tiles, mostly preserce them, just organize.
  # Also want to keep the code readable with the multiple variables.

  # Could implement auto tile dimension detection, just seems more expensive
  # especially for a lot of files, but maybe as a fallback later
  # but definitely prime the system to find it for 1 tile to cache
  # that value and pass that around as the mainm approach.
  set coords (echo "$tileFile" | cut -d'_' -f2 | cut -d'.' -f 1);
  if begin
    test -e "$excludesFile"; and \
    grep -q "$coords" "$excludesFile"
  end
    return;
  end
  set coordXLetters (echo "$coords" | sed 's|[0-9]||g');
  set coordXLettersCount (echo -n "$coordXLetters" | wc -c);
  if test "$coordXLettersCount" -gt 1
    echo "\"$tileFile\" contains multiple floors; not currently supported; skipping...";
    return;
  end
  set coordXCharCode (echo 'ibase=16; '(echo -n "$coordXLetters" | xxd -u -p) | bc);
  set coordXOffset (echo "(($coordXCharCode - 65) * $tileWidth) + 14" | bc)
  set coordY (echo "$coords" | sed 's|[A-Z]||g');
  set coordYOffset (echo "(($coordY - 1) * $tileHeight) + 8" | bc);

  echo "$coordXOffset,$coordYOffset";
end

function placeTile --argument-names mode excludesFile tileFile tileWidth tileHeight outFile
  # TODO: Maybe slow.  See comment in getTileOffsets.
  set offsets (getTileOffsets "$excludesFile" "$tileFile" "$tileWidth" "$tileHeight");
  test -z "$offsets"; and return;
  set offsetX (echo "$offsets" | cut -d',' -f1);
  set offsetY (echo "$offsets" | cut -d',' -f2);

  if test -z "$offsetX" -o -z "$offsetY"
    echo "Error: Unsupported or broken offset encountered: ($offsetX, $offsetY); exiting..." 1>&2;
    exit;
  else
    if test "$mode" = 'individual'
      composite -geometry '+'{$offsetX}'+'{$offsetY} "$tileFile" "$outFile" "$outFile";
    else if test "$mode" = 'batch'
      echo "\"$tileFile\" -geometry +$offsetX+$offsetY -composite";
    end
  end
end

function createMagickScript --argument-names background excludesFile dgnName outDir
  set srcGenericScript "$outDir/Script.txt";

  if test ! -e "$srcGenericScript" -o "$force" = "true"
    echo '#!/usr/bin/env magick-script' > "$srcGenericScript";
    echo >> "$srcGenericScript";
    echo '-define png:color-type=6' >> "$srcGenericScript";
    echo >> "$srcGenericScript";

    test -n "$background";
    and echo "-size 1308x1040 \"$background\"" >> "$srcGenericScript";
    or "-size 1308x1040 \"canvas:transparent\"" >> "$srcGenericScript";

    find -mindepth 1 -maxdepth 1 -type f \
      \( -iname "*$dgnName""_???.*" -o -iname "*$dgnName""_???_Mask.*" \) \
      -printf '%f\n' | while read tileFile
      placeTile 'batch' "$excludesFile" "$tileFile" "160" "128" >> "$srcGenericScript";
    end
  end

  echo "$srcGenericScript";
end

# TODO: Could add ability to save intermediate dungeon map and switch
# background easily using that cached file, when that becomes desired of course.
# Also if image magic can use a transparent color for the blank canvas
# when building the map.  Think from "canvas:blank" to "canvas:none" or
# "canvas:transparent".
function assembleDgnLayerIndividually --argument-names background dgnName outDir
  set outFile "$outDir/Map.png";

  if test -e "$outFile" -a "$force" != "true"
    echo "\"$outFile\" already exists, and force has not been specified; exiting...";
    return;
  end

  echo -n "Generating result file \"$outFile\" with source tile files numbered ";

  test -n "$background";
  and convert -size 1308x1040 "$background" "$outFile";
  or convert -size 1308x1040 "canvas:transparent" "$outFile";

  set fileNum "0";
  find -maxdepth 1 -type f -iname "*$dgnName*" -printf '%f\n' | while read tileFile
    set fileNum (echo "$fileNum + 1" | bc);
    echo -n "$fileNum, ";
    # could add switch for dot progress display instead too, but this seems more informative..

    placeTile 'individual' "$tileFile" "$outFile" "160" "128";
  end
end

function assembleDgnLayerAtOnce --argument-names background excludesFile dgnName outDir
  set outFile "$outDir/Map.png";
  set srcGenericScript (createMagickScript "$background" "$excludesFile" "$dgnName" "$outDir");

  if test -e "$outFile" -a "$force" != "true"
    echo "Map file already exists, and force has not been specified; skipping...";
    return;
  end

  set workingFile "$outDir/Working.png";
  test -e "$workingFile"; and rm "$workingFile";

  # Adding the annoying output parameter that could not be
  # recognized from the transient command line....
  set tempUniqueScript (mktemp);
  cp "$srcGenericScript" "$tempUniqueScript";
  echo "-write \"$workingFile\"" >> "$tempUniqueScript";

  echo "Generating result file \"$outFile\"...";
  if time magick -script "$tempUniqueScript" "$workingFile"
    mv "$workingFile" "$outFile";
  else
    echo 'Error: Unknown error occured; exiting...';
    exit;
  end

  rm "$tempUniqueScript";
end

## Step Function Library

# List dungeon names
function stepListDgnNames
  echo 'Generating dungeon name list...' 1>&2;
  echo 1>&2;

  test -d "Lv" -a -d "Lv/Norm"; and set folderList (ls -1 "Lv/Norm");
  if test -n "$folderList"
    echo "Parsing folder names from already organized files in sub directories..." 1>&2;
    echo 1>&2;

    string join \n $folderList;
  else
    echo "Parsing tile files in root directory..." 1>&2;
    echo 1>&2;

    find -maxdepth 1 -type f -iname 'Lv*_???.*' -printf '%f\n' | \
    cut -d'_' -f1 | \
    sed -r 's|^.*?Lv||' | \
    sort | \
    uniq
  end
end

function stepListCompletedDgns --argument-names outDir
  pushd "$outDir";

  find -mindepth 1 -type f -iname 'Map.png';

  popd;
end

# Organize source tile files
function step1 --argument-names dgnNames
  echo "Sorting source tiles...";
  echo;

  for tileType in $processTypes
    echo "Tile type \"$tileType\"..."
    test ! -d "$tileType"; and mkdir "$tileType";
    for tileState in $processStates
      echo "Tile state \"$tileState\"..."
      test ! -d "$tileType/$tileState"; and mkdir "$tileType/$tileState";
      for dgnName in $processDgns
        if test ! -d "$tileType/$tileState/$dgnName"
          echo "Dungeon \"$dgnName\"..."
          mkdir "$tileType/$tileState/$dgnName";

          test "$tileType" = "PanLv"; and set tilePrefix "PanelLv"; or set tilePrefix "$tileType";
          test "$tileState" = "Norm"; and set tileStateString ""; or set tileStateString "_$tileState";

          find -mindepth 1 -maxdepth 1 \
            -iname "$tilePrefix$dgnName""_???$tileStateString.*" \
            -exec mv -t "$tileType/$tileState/$dgnName/" '{}' + \
          ;
        end
      end
    end
  end

  echo;
end

# Assemble tiles into larger cohesive map files
function step2 --argument-names background outDir
  echo 'Assembling map files...';

  for tileType in $processTypes
    echo;
    echo "Tile type \"$tileType\"..."
    for tileState in $processStates
      echo;
      echo "Tile state \"$tileState\"..."
      for dgnName in $processDgns
        echo "Processing \"$dgnName\"...";

        if test -d "$dgnName" -a "$force" != "true"
          echo "\"$dgnName\" dungeon directory already exists; skipping...";
          continue;
        end
        set subDirPath "$tileType/$tileState/$dgnName";
        set outPath "$outDir/$subDirPath";

        mkdir -p "$outPath";
        pushd "$subDirPath";

        assembleDgnLayerAtOnce "$background" "$outDir/_excludes/$dgnName.txt" "$dgnName" "$outPath";

        popd;
      end
    end
  end

  echo;
end

set SDIR (readlink -f (dirname (status filename)));

# Direct (Required) Input

test -z "$srcDir"; and set srcDir "$argv[1]";
test -z "$dgnMapGridSrcPath"; and set dgnMapGridSrcPath "$argv[2]";

# Flags

test -z "$force"; and set force "false";

# Other Settings

set allSteps      "listDgnNames" "listCompletedDgns" "1" "2";
set defaultSteps  "1" "2";
set defaultTypes  "Lv" "PanLv";
set defaultStates "Norm" "Mask";
set defaultDgns \
  "01TailCave" \
  "02BottleGrotto" \
  "03KeyCavern" \
  "04AnglersTunnel" \
  "05CatfishsMaw" \
  "06FaceShrine" \
  "07EagleTower" \
  "08TurtleRock" \
  "10ClothesDungeon" \
  "11PanelOnlyDungeon" \
;
test -z "$continueWithoutBackground"; and set continueWithoutBackground "false";
test -z "$processSteps"; and set processSteps   $defaultSteps;
test -z "$processTypes"; and set processTypes   $defaultTypes;
test -z "$processStates"; and set processStates $defaultStates;
test -z "$processDgns"; and set processDgns     $defaultDgns;

# Required input validation

if test \( -z "$srcDir" -o ! -e "$srcDir" \) -a "$processSteps" != "listCompletedDgns"
  echo "Error: Source directory must be provided as the first argument and exist for most steps.";
  exit;
end

for step in $processSteps
  if echo "$allSteps" | grep -qvP "\b$step\b"
    echo "Error: Step \"$step\" not recognized in the accepted list of steps \""(string join "\", \"" $allSteps)"\"; exiting...";
    exit;
  end
end

for ttype in $processTypes
  if echo "$defaultTypes" | grep -qvP "\b$ttype\b"
    echo "Error: Type \"$ttype\" not recognized in the accepted list of types \""(string join "\", \"" $defaultType)"\"; exiting...";
    exit;
  end
end

for state in $processStates
  if echo "$defaultStates" | grep -qvP "\b$state\b"
    echo "Error: Type \"$state\" not recognized in the accepted list of types \""(string join "\", \"" $defaultStates)"\"; exiting...";
    exit;
  end
end

for dgn in $processDgns
  if echo "$defaultDgns" | grep -qvP "\b$dgn\b"
    echo "Error: Type \"$dgn\" not recognized in the accepted list of types \""(string join "\", \"" $defaultDgns)"\"; exiting...";
    exit;
  end
end

# Main Execution Start

test -z "$outDir"; and set outDir (realpath "$SDIR/Maps/Dungeons");
mkdir -p "$outDir";
set dgnMapGridPath "$srcDir/Background.png";
if test ! -e "$dgnMapGridPath"
  if test -n "$dgnMapGridSrcPath" -a -e "$dgnMapGridSrcPath"
    cp "$dgnMapGridSrcPath" "$dgnMapGridPath";
  else
    if test (string lower "$continueWithoutBackground") != "true"
      echo "Error: Background dungeon map grid not found at internal destination or source path \"$dgnMapGridSrcPath\" and script set to exit without it; exiting...";
      exit;
    end
  end
end

pushd "$srcDir";

# Initial dungeon name list generation to be used in the script.
echo "$processSteps" | grep -qE "\blistDgnNames\b"; and stepListDgnNames;

# First, source file hierarchy set-up for easier script writing.
echo "$processSteps" | grep -qE "\b1\b"; and step1 "$dgnMapGridPath";

# Now assemble each map layer.
echo "$processSteps" | grep -qE "\b2\b"; and step2 "$dgnMapGridPath" "$outDir";

# Manual inquiry to see which dungeons have already been processed.
echo "$processSteps" | grep -qE "\blistCompletedDgns\b"; and stepListCompletedDgns "$outDir";

echo "done!" 1>&2;

popd;

# ------------------------------------------------------------------------------



# Some more notes about determining the max dungeon graph size in tiles
# - Finding the range of numbers:
#   - find "$srcDir/Lv/Norm" -type f -printf '%f\n' | cut -d'_' -f2 | cut -d'.' -f1 | sed 's|[A-Z]*$||g' | sort | uniq
# 01-08
# - Finding the range of letters:
#   - find "$srcDir/Lv/Norm" -type f -printf '%f\n' | cut -d'_' -f2 | cut -d'.' -f1 | sed 's|^[0-9]*||g' | sort | uniq
# A, AL, AU, B, C, D, E, EL, EU, F, G, H, HL, HU
# A-H, so letters corresponding to 1-8
# Pluses should work, but I guess splats also do...?????......
# And manually checked, each tile size is 160x128
# 8x8 squares!!
# so that's 1280x1024
# DgnMapGrid is 1308x1040
# so that's 28 wider, and 16 taller, so +14 and +8 offets??



# Old, early, dysfunctional code for reference..
# find "$srcDir" -maxdepth 1 -type f -printf '%f\n' | \
#   grep -E '^Lv' | \
#   cut -d'_' -f1 | \
#   sort | \
#   uniq | while read dgnName
#   echo "Processing $dgnName...";

#   set files (find "$srcDir" -maxdepth 1 -type f -iname "*$dgnName*" -printf '%f\n');
#   echo "files: $files";
    # won't work because fish does not allow array member split with newline,
    # only space (#3329, #159)..
#   set allLvFiles (echo $files | grep -Ev "^Panel");
#   set allPanLvFiles (echo $files | grep -E "^Panel");

#   echo "allLvFiles: $allLvFiles";
#   echo "allPanLvFiles: $allPanLvFiles";

#   set lvFiles (echo $allLvFiles | grep -v "_Mask");
#   set lvMaskFiles (echo $allLvFiles | grep "_Mask");
#   set panLvFiles (echo $allPanLvFiles | grep -v "_Mask");
#   set panLvMaskFiles (echo $allPanLvFiles | grep "_Mask");

#   echo "lvFiles: $lvFiles";
#   echo "lvMaskFiles: $lvMaskFiles";
#   echo "panLvFiles: $panLvFiles";
#   echo "panLvMaskFiles: $panLvMaskFiles";

#   exit
# end

# popd > /dev/null;
