#!/usr/bin/env fish

set SDIR "$PWD/"(dirname (status filename));

test -z "$tilesDir"; and set tilesDir "$argv[1]";
test -z "$tilesDir"; and set tilesDir "$SDIR/";

pushd "$tilesDir";

echo -n "Processing $tilesDir";
find "$tilesDir" -mindepth 1 -maxdepth 1 -type f -iname '*.png' -printf "%f\n" | while read file;
	set zoomDir (echo "$file" | cut -d'_' -f 1);
	test ! -d "$zoomDir"; and mkdir "$zoomDir";
	set newFileName (echo "$file" | cut -d'_' -f 2-);
	mv "$file" "$zoomDir/$newFileName";
	echo -n '.';
end

popd;
