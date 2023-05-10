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
#   - read
#   - pushd
#   - popd
#   - cut
#   - sort
#   - uniq
#   - exit
#   - function
#   - functions
# - $srcDir/<tileFormat><dgnName>_<coords>.tga

# Overwrites functions:
# - assembleDgnLayer

set SDIR "$PWD/"(dirname (status filename));

# Direct (Required) Input
test -z "$srcDir"; and set srcDir "$argv[1]";

# Flags
test -z "$force"; and set force "false";

# Other Settings
test -z "$gameTilesDir"; and set gameTilesDir "tiles/lafs";
test -z "$processLayers"; and set processLayers "LvNorm LvMask PanLvNorm PanLvMask";

# Required settings validation
if test -z "$srcDir" -o ! -e "$srcDir"
  echo "Error: Source directory must be provided as the first argument and exist.";
  exit;
end

pushd "$SDIR/../../../$gameTilesDir" > /dev/null;


## First, source file hierarchy set-up for easier script writing..
# to get around technical limitations..
pushd "$srcDir" > /dev/null;

if test ! -d PanLv
  mkdir PanLv;
  
  if test ! -d PanLv/Mask
    mkdir PanLv/Mask;
    mv PanelLv*_Mask*.tga PanLv/Mask/;
  end

  if test ! -d PanLv/Norm
    mkdir PanLv/Norm;
    mv PanelLv*.tga PanLv/Norm/;
  end
end

if test ! -d Lv
  mkdir Lv;

  if test ! -d Lv/Mask
    mkdir Lv/Mask;
    mv Lv*_Mask*.tga Lv/Mask/;
  end

  if test ! -d Lv/Norm
    mkdir Lv/Norm;
    mv Lv*.tga Lv/Norm/;
  end
end

popd > /dev/null;

## Now assemble each map layer..
# Using arbitrary starting folder for name list

# All the images need a v.flip first..
# find "$srcDir" -type f -exec mogrify -flip '{}' \;

find -maxdepth 1 -iname 'DgnMapGrid*' | read dgnMapGrid;

function assembleDgnLayer --argument-names srcDir dgnName outFile
  if test -e "$outFile" -a "$force" != "true"
    echo "\"$outFile\" already exists, and force has not been specified; exiting...";
    return;
  end

  echo -n "Processing layer file \"$outFile\" with files numbered ";

  test -n "$dgnMapGrid";
  and convert -size 1308x1040 "../$dgnMapGrid" "$outFile"; 
  or convert -size 1308x1040 "canvas:black" "$outFile";

  set fileNum "0";
  find "$srcDir" -maxdepth 1 -type f -iname "*$dgnName*" -printf '%f\n' | while read file
    set fileNum (echo "$fileNum + 1" | bc);
    echo -n "$fileNum, ";
    # TODO: could add switch for dot display instead too..

    set coords (echo "$file" | cut -d'_' -f2 | cut -d'.' -f 1);
    set coordY (echo '(('(echo "$coords" | sed 's|[A-Z]||g')' - 1) * 128) + 8' | bc);
    set coordXLetters (echo "$coords" | sed 's|[0-9]||g');
    set coordXLettersCount (echo -n "$coordXLetters" | wc -c);
    set coordX (echo '(('(echo 'ibase=16; '(echo -n "$coordXLetters" | xxd -p) | bc)' - 65) * 160) + 14' | bc)
    
    # echo;
    # echo "coords: $coords";
    # echo "coordX: $coordX";
    # echo "coordXLetters: $coordXLetters";
    # echo "coordXLettersCount: $coordXLettersCount";
    # echo "coordY: $coordY";
    # echo;

    if test "$coordXLettersCount" -gt 1
      echo "\"$file\" contains multiple floors; not currently supported; skipping...";
      continue;
    else
      composite -geometry '+'{$coordX}'+'{$coordY} "$srcDir/$file" "$outFile" "$outFile";
    end
  end
  echo "done!";
end

test -z "$dgnNames"; and set dgnNames (
  find "$srcDir/Lv/Norm" -maxdepth 1 -type f -printf '%f\n' | \
  cut -d'_' -f1 | \
  sort | \
  uniq
);
# echo dgnNames: $dgnNames;

echo "$processLayers" | grep -qE "\bLvNorm\b"; and set processLvNorm "true";
echo "$processLayers" | grep -qE "\bLvMask\b"; and set processLvMask "true";
echo "$processLayers" | grep -qE "\bPanLvNorm\b"; and set processPanLvNorm "true";
echo "$processLayers" | grep -qE "\bPanLvMask\b"; and set processPanLvMask "true";

for dgnName in $dgnNames
  echo;
  echo "Processing $dgnName...";

  if test -d "$dgnName"
    echo "\"$dgnName\" dungeon directory already exists; skipping...";
    continue;
  else
    mkdir "$dgnName";
    pushd "$dgnName" > /dev/null;
    
    test "$processLvNorm" = "true"; and assembleDgnLayer "$srcDir/Lv/Norm" "$dgnName" {$dgnName}".png";
    test "$processLvMask" = "true"; and assembleDgnLayer "$srcDir/Lv/Mask" "$dgnName" {$dgnName}"Mask.png";
    test "$processPanLvNorm" = "true"; and assembleDgnLayer "$srcDir/PanLv/Norm" "$dgnName" "Panel"{$dgnName}".png";
    test "$processPanLvMask" = "true"; and assembleDgnLayer "$srcDir/PanLv/Mask" "$dgnName" "Panel"{$dgnName}"Mask.png";
    
    popd > /dev/null;
  end
end

# Clean up the self-declared function
functions -e assembleDgnLayer;

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