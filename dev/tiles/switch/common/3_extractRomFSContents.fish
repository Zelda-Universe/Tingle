#!/usr/bin/env fish

mkdir -p (echo "$argv[1]" | sed -r 's|\.[^.]+$||')"/romfs";
set tikFile (find (dirname "$argv[1]") -mindepth 1 -maxdepth 1 -type f -iname '*.tik');
test -z "$tikFile"; and set titlekeyOption "--titlekey="(dd if="$tikFile" bs=1 count=16 skip=384 status=none | xxd -p);
hactool \
  -k "$HOME/.switch/prod.keys" \
  $titlekeyOption \
  --romfsdir=(echo "$argv[1]" | sed -r 's|\.[^.]+$||')"/romfs" -x "$argv[1]"
;