#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/../../../../scripts/common/filenameRemoveExtension.fish";

set ncaPath "$argv[1]";
if test -z "$ncaPath"
  echo 'Error: No NCA path provided; exiting...';
  return 1;
end

set ncaName ( filenameRemoveExtension "$ncaPath");
set ncaDir  (                 dirname "$ncaPath");

mkdir -p "$ncaName/romfs";

set tikFile (
  find "$ncaDir"  \
  -mindepth 1     \
  -maxdepth 1     \
  -type f         \
  -iname '*.tik'
);

if test -n "$tikFile"
  set titleKey (
    dd              \
      if="$tikFile" \
      bs=1          \
      count=16      \
      skip=384      \
      status=none   \
    | xxd -p
  );
  set titlekeyOption "--titlekey=$titleKey";
end

hactool                       \
  --disablekeywarns           \
  -t'pfs0'                    \
  $titlekeyOption             \
  --romfsdir="$ncaName"'_romfs' \
  --extract                   \
  "$ncaPath"                  \
;

# --exefsdir="$ncaName"'_exefs' \
