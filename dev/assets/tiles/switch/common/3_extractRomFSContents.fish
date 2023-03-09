#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

set SDIR "$PWD/"(dirname (status filename));

source "$SDIR/../../../../scripts/common/filenameRemoveExtension.fish";

test -z "$keyPath"; and set keyPath "$HOME/.switch/prod.keys";
set ncaPath "$argv[1]";
if test -z
  echo 'Error: No NCA path provided; exiting...';
  return 1;
end
set ncaName (filenameRemoveExtension "$ncaPath");
set ncaDir (dirname "$ncaPath");

mkdir -p "$ncaName/romfs";

set tikFile (find "$ncaDir" -mindepth 1 -maxdepth 1 -type f -iname '*.tik');

if test -z "$tikFile"
  echo 'Error: Tik file not found; exiting...';
  return 2;
end

set titleKey (dd if="$tikFile" bs=1 count=16 skip=384 status=none | xxd -p);
set titlekeyOption "--titlekey=$titleKey";

hactool \
  -k "$keyPath" \
  $titlekeyOption \
  --romfsdir=(echo "$ncaName" | sed -r 's|\.[^.]+$||')"/romfs" -x "$ncaPath"
;
