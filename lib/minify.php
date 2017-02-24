<?php
include_once("$path/lib/JSMin.php");
include_once("$path/lib/CSSmin.php");

$php_limits = array(
    'memory_limit' => 128 * 1048576,
    'max_execution_time' => 60,
    'pcre.backtrack_limit' => 1000 * 1000,
    'pcre.recursion_limit' =>  500 * 1000
);

// If current settings are higher respect them.
foreach ($php_limits as $name => $suggested) {
    $current = (int) ini_get($name);
    // memory_limit exception: allow -1 for "no memory limit".
    if ($current > -1 && ($suggested == -1 || $current < $suggested)) {
        ini_set($name, $suggested);
    }
}

function minify_js($js) {
    $jsmin = new JSMin($js);
    return $jsmin->min();
}

function minify_css($css) {
    $minifier = new CSSmin(false);
    return $minifier->run($css);
}