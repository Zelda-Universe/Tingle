#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/../../scripts/common/altPushd.fish";

test -z "$tilesDir"; and set tilesDir "$argv[1]";
test -z "$tilesDir"; and set tilesDir (readlink -f "$SDIR/../../../tiles");

if not altPushd "$tilesDir"
	errorPrint "Could not enter directory \"$tilesDir\"; exiting...";
	exit;
end

echo "Processing $tilesDir...";
echo;
find -type f -iname '*.png' \
| while read file;
	if test -f "$file"
		if set info (magick identify -regard-warnings "$file" 2>&1)
			echo "Good file: $file";
		else
			echo "Removing bad file \"$file\"...";
			# debugPrint "info: $info";
			rm "$file";
		end
	end
end

popd;
