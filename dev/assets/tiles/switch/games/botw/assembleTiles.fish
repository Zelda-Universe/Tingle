#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

## Info

# MapTex#      - resolution levels (4)
# Categories    - ?                 (108 + 5?)
# ZABCDEFGHIJK  - horizontal index  (12)
# 0123456789    - vertical index    (10)
# So 120 files per map, plus odd state suffixes that overlap/replace those same places/spots/slots I guess.
# Weird BotW horizontal map axis expression order.
# By comparison, the smallest resolution level with an index of 3 took 283s on my
# machine when assembling it individally, versus the much faster at once / batch
# mosaic tile single process method time of 2.57s..
# From highest to lowest res level: 56.73min , 43.13s, 5.63s, 3.57s

## General Function Library

set timeStart -1;
set timeEnd -1;
function timerStart
  set timeStart (date "+%s");
end
function timerStop
  set timeEnd (date "+%s");
end
function timerDuration
  if test "$timeStart" -lt 0 -o "$timeEnd" -lt 0
    echo 'Error: Time start or stop was not set yet; returning...' 1>&2;
    return;
  end

  echo "$timeEnd" - "$timeStart" | bc;
end

function setupTemplateFiles --argument-names outDir fileName numXTiles numYTiles tileWidth tileHeight
  set totalDimensions (expr "$tileWidth" '*' "$numXTiles")x(expr "$tileHeight" '*' "$numYTiles");
  set blankFile "$outDir/$fileName-Blank.png";
  set workingFile "$outDir/$fileName-Working.png";

  # PNG Color Type: https://www.w3.org/TR/PNG/#11IHDR
  # Took ling enough to solve that issue....
  if test ! -e "$blankFile"
    convert -define png:color-type=6 -size "$totalDimensions" "canvas:black" "$blankFile";
  end

  if test ! -e "$workingFile"
    cp "$blankFile" "$workingFile";
  end

  echo "$workingFile";
end

function getTileOffsets --argument-names tileFile tileWidth tileHeight
  # Could implement auto tile dimension detection, just seems more expensive
  # especially for a lot of files, but maybe as a fallback later
  # but definitely prime the system to find it for 1 tile to cache
  # that value and pass that around as the mainm approach.
  set coords (echo "$tileFile" | cut -d'_' -f2 | cut -d'.' -f 1);
  set coordXLetter (echo "$coords" | sed 's|-[0-9]||g');
  set coordXCharCode (echo 'ibase=16; '(echo -n "$coordXLetter" | xxd -u -p) | bc);
  if test "$coordXLetter" = 'Z'
    set coordXCharCode 65; # 'A'
  else
    set coordXCharCode (expr "$coordXCharCode" + 1);
  end
  set coordXOffset (echo "($coordXCharCode - 65) * $tileWidth" | bc);
  set coordYNumber (echo "$coords" | sed 's|[A-Z]-||g');

  # if test "$coordYNumbersCount" -gt 1
  #   echo "\"$tileFile\" contains multiple floors; not currently supported; skipping...";
  #   return;
  # else
  echo "$coordXOffset,$coordYOffset";
  # end
end

function placeTile --argument-names tileFile outFile tileWidth tileHeight
  set offsets (getTileOffsets "$tileFile" "$tileWidth" "$tileHeight");
  set offsetX (echo "$offsets" | cut -d',' -f1);
  set offsetY (echo "$offsets" | cut -d',' -f2);

  if test -z "$offsetX" -o -z "$offsetY"
    echo "Error: Unsupported or broken offset encountered: ($offsetX, $offsetY); exiting...";
    exit;
  else
    composite -geometry '+'{$offsetX}'+'{$offsetY} "$tileFile" "$outFile" "$outFile";
  end
end

# Strategy 1 - 1 Process per tile
# The first way that I learned with geometric placing.
# Could maybe be combined but a lot of extra work if the other
# less flexible methods like montage tiling are enough anyway
# that I am learning now.
function assembleMapIndividually --argument-names outDir fileName numXTiles numYTiles tileWidth tileHeight trialsDir
  set completedFile "$outDir/$resLevel/$fileName.png";
  if test -e "$completedFile" -a "$force" != "true"
    echo "\"$completedFile\" already exists, and force has not been specified; exiting...";
    return;
  end

  echo "Generating result file with source tile files numbered:";
  set workingFile (
    setupTemplateFiles \
      "$outDir" "$fileName" \
      "$tileWidth" "$tileHeight" \
      "$numXTiles" "$numYTiles" \
    ;
  );

  set fileNum "0";
  timerStart;
  find -maxdepth 1 -type f -iname "MapTex*_?1-?.*" | while read tileFile
    set fileNum (echo "$fileNum + 1" | bc);
    echo -n "$fileNum, ";
    # could add switch for dot progress display instead too, but this seems more informative..

    placeTile "$tileFile" "$workingFile" "$tileWidth" "$tileHeight";
  end
  timerStop;
  echo timerDuration > "$trialsDir/2a - Assembling.txt";

  mv "$workingFile" "$completedFile";
  echo "done!";
end

function createMagickScript --argument-names tilePrefix tileSuffix folderPathAndName trialsDir
  set srcGenericScript "$folderPathAndName/Script.txt";
  if test ! -e "$srcGenericScript" -o "$force" = "true"
    timerStart;
    echo '#!/usr/bin/env magick-script' > "$srcGenericScript";
    echo >> "$srcGenericScript";
    echo '-define png:color-type=6' >> "$srcGenericScript";
    echo >> "$srcGenericScript";

    for vertialIndex in (seq 0 1 9)
      echo '( '(
        for horizontalIndex in $indiciesHorizontal
          echo -n "$tilePrefix$horizontalIndex-$vertialIndex$tileSuffix.png ";
        end
      )'+append ) -append' >> "$srcGenericScript";
    end
    echo '+repage' >> "$srcGenericScript";
    timerStop;
    echo (timerDuration) > "$trialsDir/1 - Scripting.txt";
  end

  echo "$srcGenericScript";
end

# Strategy 2 - 1 Process call
# Could be large and even invalid command line lengths,
# but hopefully much more efficient.
# Known as montage using the tile option.
# I could have also used +/-append with arrays, but
# that is more manual, and we don't need that level of flexibility.
function assembleMapAtOnce --argument-names tilePrefix tileSuffix outDir folderName trialsDir
  set completeFolderPath "$outDir/$folderName";
  set completedFile "$completeFolderPath/Map.png";
  set srcGenericScript (createMagickScript "$tilePrefix" "$tileSuffix" "$completeFolderPath" "$trialsDir");

  test ! -e "$completeFolderPath"; and mkdir "$completeFolderPath";

  if test -e "$completedFile" -a "$force" != "true"
    echo "\""(realpath "$completedFile" )"\" already exists, and force has not been specified; exiting...";
    return;
  end

  set workingFile "$completeFolderPath/Map-Working.png";
  test -e "$workingFile"; and rm "$workingFile";

  # Adding the annoying output parameter that could not be
  # recognized from the transient command line....
  set tempUniqueScript (mktemp);
  cp "$srcGenericScript" "$tempUniqueScript";
  echo "-write \"$workingFile\"" >> "$tempUniqueScript";

  echo "Generating result file \"$completedFile\"...";
  timerStart;
  if time magick -script "$tempUniqueScript" "$workingFile"
    timerStop;
    echo (timerDuration) > "$trialsDir/2b - Assembling.txt";
    mv "$workingFile" "$completedFile";
    echo "done!";
  else
    echo 'Error: Unknown error occured; exiting...';
    exit;
  end

  rm "$tempUniqueScript";
end

## Step Function Library

function step1
  echo;
  echo 'Step 1 - Sort to MapTex-suffixed resolution level folders';
  for resLevel in $processResLevels
    echo "Processing resolution level \"$resLevel\"...";

    test $resLevel = "0"; and set folderSuffix ''; or set folderSuffix "$resLevel";
    set folderName "$folderPrefix$folderSuffix";

    if test -d "$folderName" -a "$force" != "true"
      echo "Resolution level folder \"$folderName\" already exists, and force has not been specified; skipping...";
      continue;
    end

    mkdir "$folderName";
    set resultOutputPath "$outputPath/$resLevel";
    mkdir -p "$resultOutputPath";
    set outTrialsDir "$outTrialsBaseDir/$resLevel/Trials/1 - Sorting";
    mkdir -p "$outTrialsDir";

    timerStart;
    find -maxdepth 1 -type f -name "$folderName""_*" -exec mv -t "$folderName/" '{}' +;
    timerStop;
    echo (timerDuration) > "$trialsDir/1 - By Res Level.txt";
  end
end

function step2
  echo;
  echo 'Step 2 - Sort map tiles type/state by category folder suffix';
  for resLevel in $processResLevels
    echo "Processing resolution level \"$resLevel\"...";
    test $resLevel = "0"; and set folderSuffix ''; or set folderSuffix "$resLevel";
    set mapTexFolder "$folderPrefix$folderSuffix";
    pushd "$mapTexFolder";

    ## Strategy 1 - By single, last number suffix (Disabled)
    # Seemed wrong once I found many of the different compound suffixes.

    # set suffixes (find -maxdepth 1 -type f -iregex '.+_[0-9]+\..+$' | sed -r 's|^.+?([0-9])\..+$|\1|' | sort | uniq);
    # for suffix in $suffixes
    #   mkdir -p "$suffix";
    #   find -maxdepth 1 -type f -iregex '.+_[0-9]*'"$suffix"'\..+$' -exec mv -t "$suffix" '{}' \+;
    # end
    # find -maxdepth 1 -type f -iregex '.+[A-Z]-[0-9]\..+$' -exec mv -t "Default" '{}' \+;
    ## test (find "Default" -mindepth 1 | wc -l) -eq 0; and rmdir "Default"; # Probably never necessary.

    ## Strategy 2 - By entire number suffix (Enabled)
    # Seems ok, maybe not great for future flexible work, but should work ok for Default and 0 folders as complete contiguous sets.
    # There are some very few HIJ files still not properly placed that seem to lack the undersore, instead replaced with another hyphen.
    # I wonder if this was a typo or intentional, even since the trailing numbers seem to fit in the list's gaps well enough, and will leave them alone in the root of each MapTex folder for now..

    # By each file, sorting them all and discovering all/most of the possible categories
    # find -mindepth 1 -maxdepth 1 -type f -name '*_*-*_*' | while read filePath
    #   set suffix (echo "$filePath" | sed -r -e 's|^.+?_||' -e 's|\..+$||');
    #   mkdir -p "$suffix";
    #   mv "$filePath" "$suffix/";
    # end
    # By each enabled category
    for category in $processCategories
      echo "Processing category sub-folder \"$mapTexFolder/$category\"...";
      if test -d "$category" -a "$force" != "true"
        echo "Folder already exists, and force has not been specified; skipping...";
        continue;
      end
      mkdir "$category";
      test "$category" = "Default"; and set filter '*_?-?.*'; or set filter "*_?-?_$category.*";
      set outTrialsDir "$outTrialsBaseDir/$resLevel/$category/Trials/1 - Sorting";
      mkdir -p "$outTrialsDir";

      timerStart;
      find -mindepth 1 -maxdepth 1 -type f -name "$filter" -exec mv -t "$category/" '{}' +;
      timerStop;
      echo (timerDuration) > "$trialsDir/2 - Scripting.txt";
    end

    popd;
  end
end

function step3 --argument-names outputPath
  echo;
  echo 'Step 3 - Create single large images in each complete category'
  for resLevel in $processResLevels
    echo "Processing resolution level \"$resLevel\"...";
    test $resLevel = "0"; and set resName ''; or set resName "$resLevel";
    set mapTexFolder "$folderPrefix$resName";
    set filePrefix "$folderPrefix";
    pushd "$mapTexFolder";
    for category in $processCategories
      echo "Processing category \"$category\"...";
      pushd "$category";
      set outTrialsDir "$outTrialsBaseDir/$resLevel/$category/Trials/2 - Assembling";
      mkdir -p "$outTrialsDir";

      test $category = "Default"; and set tileSuffix ''; or set tileSuffix "_$category";
      set resultOutputPath "$outputPath/$resLevel";
      mkdir -p "$resultOutputPath";

      # set nextIndex (expr "$resLevel" + 1);
      # time assembleMapIndividually \
      #   "$resultOutputPath/$resLevel" "$category" \
      #   "12" "10" \
      #   "$tileDims[$nextIndex]" "$tileDims[$nextIndex]" \
      # ;
      assembleMapAtOnce \
        "$filePrefix$resName""_" "$tileSuffix" \
        "$resultOutputPath" "$category" \
        "$outTrialsDir" \
      ;

      popd;
    end
    popd;
  end;
end

set SDIR (readlink -f (dirname (status filename)));

set indiciesHorizontal  "Z" "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K"
set tileDims            "3000"   "840"  "300"  "135";
set totalWidths         "36000" "10080" "3600" "1620";
set totalHeights        "30000"  "8400" "3000" "1350";
set folderPrefix        "MapTex";

# Direct (Required) Input
test -z "$srcDir"; and set srcDir "$argv[1]";

# Flags
test -z "$force"; and set force "false";

# Other Settings
set defaultSteps      "1" "2" "3";
set defaultResLevels  "0" "1" "2" "3";
set defaultCategories "Default" "0";
test -z "$processSteps"; and set processResLevels       $defaultSteps;
test -z "$processResLevels"; and set processResLevels   $defaultResLevels;
test -z "$processCategories"; and set processCategories $defaultCategories;
test -z "$outputPath"; and set outputPath               "$SDIR/Maps";
test -z "$outTrialsBaseDir"; and set outTrialsBaseDir   "$outputPath";

# Required input validation
if test -z "$srcDir" -o ! -e "$srcDir"
  echo "Error: Source directory must be provided as the first argument and exist.";
  exit;
end

if test ! -e "$outputPath"
  mkdir "$outputPath";
else
  if ! test -d "$outputPath"
    echo "Output path \"$outputPath\" exists and is unusble not being a directory; exiting...";
    exit;
  else
    set outputPath (realpath "$outputPath");
  end
end

for resLevel in $processResLevels
  if echo "$defaultResLevels" | grep -vq "$resLevel"
    echo "Error: Resolution Level \"$resLevel\" not supported; exiting...";
    exit;
  end
end

for category in $processCategories
  if echo "$defaultCategories" | grep -vq "$category"
    echo "Error: Category \"$category\" not supported; exiting...";
    exit;
  end
end

pushd "$srcDir";

echo "$processSteps" | grep -qE "\b1\b"; and step1;
echo "$processSteps" | grep -qE "\b2\b"; and step2;
echo "$processSteps" | grep -qE "\b3\b"; and step3 "$outputPath";

popd;
