<?php
// Bundled, versioned OoT artwork ships with each checkout. Do not ask the
// production tile host for files that have only been deployed to staging.
function bundledMapTileBaseURL($directory) {
    return strpos((string) $directory, 'oot/hq-v1/') === 0 ? '/tiles/' : null;
}
