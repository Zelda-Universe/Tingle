#!/usr/bin/env fish

# MIT Licensed
# Copyright (c) 2023 Pysis(868)
# https://choosealicense.com/licenses/mit/

# debugPrint "zoomLevels: $zoomLevels";
if test -z "$zoomLevels"
  errorPrint 'Detected zoomLevels for the image is empty; exiting...';
  return 3;
end

set availableZoomLevels (seq 0 1 $zoomLevels);
set -x availableZoomLevelsJSON (
  string join \n $availableZoomLevels \
  | jq -s
);
# debugPrint "availableZoomLevels: $availableZoomLevels";
# debugPrint "availableZoomLevelsJSON: $availableZoomLevelsJSON";
# debugPrint "count availableZoomLevels: "(count $availableZoomLevels);

# debugPrint "processZoomLevels: $processZoomLevels";
# debugPrint "count processZoomLevels: "(count $processZoomLevels);
test -z "$processZoomLevels" -o "$processZoomLevels" = '*';
and set processZoomLevels $availableZoomLevels;
# debugPrint "processZoomLevels: $processZoomLevels";
# debugPrint "count processZoomLevels: "(count $processZoomLevels);

## After Derived/Cleaned / Other Input Validation?
# May have just fixed a bug here where it never would have been triggered originally.
for zoomLevel in $processZoomLevels
  # debugPrint "zoomLevel: $zoomLevel";

  if not echo "$availableZoomLevels" | grep -q "\b$zoomLevel\b"
    echo "Error: Zoom Level \"$zoomLevel\" not valid.";
    echo 'Valid choices for this source image: "'(string join '", "' $availableZoomLevels)'"';
    echo 'Exiting...';
    exit;
  end
end
