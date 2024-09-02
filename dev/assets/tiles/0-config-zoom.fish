#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/../../scripts/common/debugPrint.fish";
source "$SDIR/../../scripts/common/errorPrint.fish";

test -z "$allowWildcardZoomLevel";
and set allowWildcardZoomLevel 'true';

## Input Validation

if test -z "$processZoomLevels"
  if test                         \
        -z "$processZoomLevel"    \
    -a  -z "$processZoomLevelMax"
    # errorPrint 'None of the following variables specified; exiting...';
    # errorPrint "processZoomLevels   : $processZoomLevels"   ;
    # errorPrint "processZoomLevel    : $processZoomLevel"    ;
    # errorPrint "processZoomLevelMax : $processZoomLevelMax" ;
    # exit 3;
    set processZoomLevel '*';
  end

  ## Input cleaning?
  # Eliminates a mostly empty processZoomLevels value?
  # How would that happen though?..  Bad input array parsing/transforming?
  if test -n "$processZoomLevel"
    # debugPrint "processZoomLevel: $processZoomLevel";
    if test "$allowWildcardZoomLevel" = 'true'
      set grepString '[-0-9*]+';
      set errorString "Zoom level \"$processZoomLevel\" is invalid; only enter integers with optional hyphens, or an asterisk; exiting...";
    else
      set grepString '[-0-9]+';
      set errorString "Zoom level \"$processZoomLevel\" is invalid; only enter integers with optional hyphens; exiting...";
    end
    if not echo "$processZoomLevel" | grep -qP "$grepString"
      errorPrint "$errorString";
      exit;
    end
    set -x processZoomLevels "$processZoomLevel";
  else if test -n "$processZoomLevelMax"
    # debugPrint "processZoomLevelMax: $processZoomLevelMax";
    if not echo "$processZoomLevelMax" | grep -qP '[0-9]+'
      echo "Error: Zoom level maximum \"$processZoomLevelMax\" is invalid; only enter integerss; exiting...";
      exit;
    end
    set processZoomLevels (seq 0 1 "$processZoomLevelMax");
  end

  # debugPrint "zoomLevels: $zoomLevels";
  test -z "$processZoomLevels";
  and read -P 'Zoom Levels to process: ';
else
  # Processing conditions that only appear from user input,
  # not the above autofill/derivation.

  # Space and comma separate a single value into multiple values.
  if begin
    test (count $processZoomLevels) -eq 1;
    and begin
          echo "$processZoomLevels" | grep -q ' ';
      or  echo "$processZoomLevels" | grep -q ',';
    end
  end
    set processZoomLevels (
      string split ' ' (echo "$processZoomLevels" | tr ',' ' ')
    );
  end
  # debugPrint "processZoomLevels: $processZoomLevels";
  # debugPrint "count processZoomLevels: "(count $processZoomLevels);

  # Wild card and range processing.
  for processZoomLevel in $processZoomLevels
    if test "$processZoomLevel" = '*'
      if test "$allowWildcardZoomLevel" = 'true'
        set newProcessZoomLevels "$processZoomLevel"
        break;
      else
        errorPrint 'Zoom level given as an asterisk when the script does not allow wildcard tokens by default; exiting...';
        return 3;
      end
    else if echo "$processZoomLevel" | grep -q '-'
      set processZoomLevelRange (string split '-' $processZoomLevel);
      set -l range $processZoomLevelRange;
      if test (count $range) -gt 1
        set expandedRange "";
        if test "$range[1]" -gt "$range[2]"
          set expandedRange (seq "$range[2]" 1 "$range[1]");
        else
          set expandedRange (seq "$range[1]" 1 "$range[2]");
        end
        set -a newProcessZoomLevels $expandedRange;
      end
    else
      set -a newProcessZoomLevels "$processZoomLevel";
    end
  end
  set processZoomLevels $newProcessZoomLevels;
  # debugPrint "newProcessZoomLevels: $newProcessZoomLevels";
end
# debugPrint "processZoomLevels: $processZoomLevels";

# debugPrint "processZoomLevels: $processZoomLevels";
# debugPrint "count processZoomLevels: "(count $processZoomLevels);
if test -z "$processZoomLevels"
  errorPrint 'Possible invalid value given, exiting...';
  errorPrint "processZoomLevels: $processZoomLevels";
  errorPrint "processZoomLevelMax: $processZoomLevelMax";
  return 4;
else
  # set -x processZoomLevelsJSON (echo "$processZoomLevels" | jq -s);
  set -x processZoomLevelsJSON (
    string join \n $processZoomLevels \
    | sed 's|*|"*"|'\
    | jq -s
  );
  # debugPrint "processZoomLevelsJSON: $processZoomLevelsJSON";
end
