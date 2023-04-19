#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

## Info

# ABCDEFGH    - horizontal index  (8)
# 12345678    - vertical index    (8)
# Overworld Dimensions:
# Normal:   4108  x 2301
# Underlay: 4106  x 2299
# OpenMask:  264  x  124

## General Function Library

function assembleOverworld --argument-names dgnName outDir
  set outFile "$outDir/Map.png";
  set srcGenericScript "$outDir/Script.txt";
  if test ! -e "$srcGenericScript"
    echo 'Script does not exist and is required to be built manually for this map type; skipping...';
    return;
  end

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

# Organize source tile files
function step1
  echo "Sorting source tiles...";
  echo;

  test ! -d "FldChip"; and mkdir "FldChip";

  for ttype in $processTypes
    test "$ttype" = "Normal"; and set fileSuffix ""; or set fileSuffix "$ttype";
    if test -d "FldChip/$ttype"
      echo "Error: Field type \"$ttype\" folder already exists; skipping...";
      continue;
    end

    mkdir "FldChip/$ttype";
    find -mindepth 1 -maxdepth 1 -type f -iname "FldChip$fileSuffix""_??^*.*" -exec mv -t "FldChip/$ttype" '{}' \+;
  end

  echo;
end

# Assemble tiles into larger cohesive map file
function step2 --argument-names outDir
  for ttype in $processTypes
    if test ! -d "FldChip/$ttype"
      echo "Error: Source tiles not found in the \"FldChip/$ttype\" folder; skipping...";
      continue;
    end

    set typeDir "$outDir/$ttype";
    test ! -d "$typeDir"; and mkdir "$typeDir";
    pushd "FldChip/$ttype";
    assembleOverworld "$ttype" "$typeDir";
    popd
  end
end

set -l SDIR (readlink -f (dirname (status filename)));

# Direct (Required) Input

test -z "$srcDir"; and set srcDir "$argv[1]";

# Flags

test -z "$force"; and set force "false";

# Other Settings

set allSteps      "1" "2";
set defaultSteps  "1" "2";
set defaultTypes  "Normal" "OpenMask" "Underlay";

test -z "$processSteps"; and set processSteps $defaultSteps;
test -z "$processTypes"; and set processTypes $defaultTypes;

# Required input validation

if test \( -z "$srcDir" -o ! -e "$srcDir" \)
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
    echo "Error: Type \"$ttype\" not recognized in the accepted list of types \""(string join "\", \"" $defaultTypes)"\"; exiting...";
    exit;
  end
end

# Main Execution Start

test -z "$outDir"; and set outDir (realpath "$SDIR/Maps/Overworld");
mkdir -p "$outDir";

pushd "$srcDir";

# First, source file hierarchy set-up for easier script writing.
echo "$processSteps" | grep -qE "\b1\b"; and step1 "$dgnMapGridPath";

# Now build the map files for each type.
echo "$processSteps" | grep -qE "\b2\b"; and step2 "$outDir";
