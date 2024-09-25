#!/usr/bin/env fish

# MIT Licensed
# by Pysis(868)
# https://choosealicense.com/licenses/mit/

set -l SDIR (readlink -f (dirname (status filename)));

source "$SDIR/../../../scripts/common/altPushd.fish";

test -z "$tilesDir"; and set tilesDir "$argv[1]";
test -z "$tilesDir"; and set tilesDir (readlink -f "$SDIR/../../../../tiles");

if not altPushd "$tilesDir"
	errorPrint "Could not enter directory \"$tilesDir\"; exiting...";
	exit;
end

source "$SDIR/setImageProg.fish";

if test "$imageProgGM" = 'true'
  set cmd "$imageProg" identify;
else if test "$imageProgIM" = 'true'
  set cmd "$imageProg" identify -regard-warnings;
end

if test -z "$imageProg"
  errorPrint 'Image program not set; exiting...';
  return 1;
end

echo "Processing $tilesDir...";
echo;
find -type f -iname '*.png' \
| while read file;
	if test -f "$file"
		if set info ($cmd "$file" 2>&1)
			echo "Good file: $file";
		else
			echo "Removing bad file \"$file\"...";
			# debugPrint "info: $info";
			rm "$file";
		end
	end
end

popd;
