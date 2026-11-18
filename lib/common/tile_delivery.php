<?php
// Bundled, versioned artwork (OoT's, ALttP's, Minish Cap's) ships with each checkout. Do
// not ask the production tile host for files that have only been deployed
// to staging.
function bundledMapTileBaseURL($directory) {
    foreach (['oot/hq-v1/', 'alttp/v1/', 'tmc/v1/'] as $bundled) {
        if (strpos((string) $directory, $bundled) === 0) return '/tiles/';
    }
    return null;
}
