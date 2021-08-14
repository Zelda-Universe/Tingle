#!/usr/bin/env fish

## Info

# Author: Pysis

# Dependencies:
# - fish shell
# - Basic shell utilities:
#   - variables
#   - loops
#   - subshell
#   - echo
#   - mkdir
#   - test
#   - set
#   - pushd
#   - popd
#   - mv

test -z "$tilesDir"; and set tilesDir "$argv[1]";

pushd "$tilesDir" > /dev/null;
echo -n "Processing $tilesDir";
find "$tilesDir" -maxdepth 1 -type f -iname '*.png' -printf "%f\n" | while read file;
	set zoomDir (echo "$file" | cut -d'_' -f 1);
	test ! -d "$zoomDir"; and mkdir "$zoomDir";
	set newFileName (echo "$file" | cut -d'_' -f 2-);
	mv "$file" "$zoomDir/$newFileName";
	echo -n '.';
end
popd > /dev/null;
