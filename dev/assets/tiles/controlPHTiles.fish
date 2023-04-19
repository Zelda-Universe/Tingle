#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));

test -z "$container"; and set container "$argv[1]";
test -z "$container"; and begin
  read container -P 'Game/Container shortname: ' container;
  or exit 1;
end

test -z "$submap"; and set submap "$argv[2]";
test -z "$submap"; and begin
  read submap -P 'Submap name: ' submap;
  or exit 1;
end

test -z "$action"; and set action "$argv[3]";
test -z "$action"; and begin
  read action -P 'Action (link, unlink): ' action;
  or exit 1;
end

if test "$action" != 'link' -a "$action" != 'unlink'
  errorPrint "Unsupported action \"$action\"; exiting...";
  exit 2;
end

set tilesRootDir (readlink -f "$SDIR/../../../tiles");
set disabledDir "$tilesRootDir/_disabled";
test ! -e "$disabledDir"; and mkdir "$disabledDir";
set placeholderDir "$tilesRootDir/_placeholder";

if test ! -e "$placeholderDir"
  errorPrint 'placeholderDir does not exist; exiting...';
  exit 3;
end

set realTilesContainerDir         "$tilesRootDir/$container";
set realTilesSubmapDir            "$realTilesContainerDir/$submap";
set realTilesContainerDisabledDir "$disabledDir/$container";
set realTilesSubmapDisabledDir    "$realTilesContainerDisabledDir/$submap";

# debugPrint "container: $container";
# debugPrint "submap: $submap";
# debugPrint "action: $action";
#
# debugPrint "tilesRootDir: $tilesRootDir";
# debugPrint "disabledDir: $disabledDir";
# debugPrint "placeholderDir: $placeholderDir";
#
# debugPrint "realTilesSubmapDir: $realTilesSubmapDir";
# debugPrint "realTilesSubmapDisabledDir: $realTilesSubmapDisabledDir";
# debugPrint;

if test "$action" = 'link'
  if test -e "$realTilesSubmapDir"
    if test -L "$realTilesSubmapDir"
      errorPrint 'realTilesSubmapDir is already linked; exiting...';
      exit 4;
    end
    if test -e "$realTilesSubmapDisabledDir"
      errorPrint 'Unable to link since realTilesSubmapDisabledDir already exists, and cannot backup the existing realTilesSubmapDir; exiting...';
      exit 5;
    else
      echo 'Moving/Disabling realTilesSubmapDir to realTilesSubmapDisabledDir as a backup...';

      test ! -e "$realTilesContainerDisabledDir";
      and mkdir "$realTilesContainerDisabledDir";
      if not mv "$realTilesSubmapDir" "$realTilesSubmapDisabledDir";
        errorPrint 'During moving; exiting...';
        exit 6;
      end
    end
  end

  test ! -e "$realTilesContainerDir";
  and mkdir "$realTilesContainerDir";

  echo 'Linking realTilesSubmapDir to placeholderDir...';
  ln -s "$placeholderDir" "$realTilesSubmapDir";
else if test "$action" = 'unlink'
  if test ! -e "$realTilesSubmapDir"
    errorPrint 'realTilesSubmapDir does not exist, so nothing to unlink; exiting...';
    exit 7;
  end

  if test -L "$realTilesSubmapDir"
    echo 'Removing active link...';
    if not rm "$realTilesSubmapDir";
      errorPrint 'During removing; exiting...';
      exit 8;
    end
  else
    errorPrint 'Unable to unlink since realTilesSubmapDir exists as real files, not a link to remove; exiting...';
    exit 9;
  end

  if test -e "$realTilesSubmapDisabledDir"
    echo 'Moving/Enabled realTilesSubmapDisabledDir to realTilesSubmapDir from being a backup...';

    mv "$realTilesSubmapDisabledDir" "$realTilesSubmapDir";
  end
end
