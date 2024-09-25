#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

# Common options different from script default:
# set -x dlOpts -q --no-check-certificate;

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/../scripts/common/altPrint.fish"  ;
source "$SDIR/../scripts/common/debugPrint.fish";
source "$SDIR/../scripts/common/errorPrint.fish";

test -z "$dlOpts";
and set -a dlOpts '-q';
or set dlOpts (string split -- ' ' "$dlOpts"); # hate doing this, darn fish shell, not like I can use function -V like using set right?....
# debugPrint "dlOpts: $dlOpts";
# debugPrint -n 'count dlOpts: '; and count $dlOpts;

set urlTemplate 'https://dev.local:8443/ajax.php?command=get_%s&game=%s';

set itemsValid      \
  'categories'      \
  'categories_tree' \
  'container'       \
  'container_name'  \
  'games'           \
  'map'             \
  'markers'         \
;

type -q fzf; and set hasFZF 'true';

while true
  if test "$hasFZF" = 'true'
    if test -z $item; and not set item (string join \n $itemsValid | fzf);
      return;
    end
  else
    if test -z $item; and not read -P 'Item: ' item
      return;
    end
    echo;
  end
  # debugPrint "item: $item";

  for itemValid in $itemsValid
    if string match -q $itemValid $item
      set breakOuter 'true';
      break;
    end
  end

  if test "$breakOuter" = 'true'
    break;
  end

  test "$hasFZF" = 'true'; and altPrint;
  errorPrint 'Enter one of the valid item names:';
  for itemValid in $itemsValid
    altPrint $itemValid;
  end
  altPrint;

  set -e item;
end

while test -z $gameId
  if not read -P 'Game Id: ' gameId
    return;
  end
  echo;
  # debugPrint "gameId: $gameId";

  if begin
    string match -r '[0-9]+' $gameId;
    or test "$item" = 'container_name'
  end
    break;
  end

  errorPrint 'Enter a numerical game id.';
  altPrint;

  set -e gameId;
end

set url (printf $urlTemplate "$item" "$gameId");

# debugPrint "item: $item";
# debugPrint "gameId: $gameId";
set cacheFile (readlink -f "$SDIR/../../ajax/static/"{$item}_{$gameId}'.json');
if test -e "$cacheFile" -a "$force" != 'true'
  errorPrint "Cached file already exists \"$cacheFile\", exiting...";
  return 1;
end

if test "$dryRun" = 'true'
  echo wget "$url" -O "$cacheFile";
else
  wget $dlOpts "$url" -O "$cacheFile";
end

if test "$status" -gt 0
  errorPrint 'Removing bad cache file...';
  rm "$cacheFile";
  return 2;
end

set cacheFileSize (stat -c '%s' "$cacheFile");
if test -n "$cacheFileSize" -a "$cacheFileSize" -eq 0
  errorPrint 'Removing empty cache file...';
  rm "$cacheFile";
  return 3;
end
