<?php
  // Serves an uploaded marker video (uploads/marker-videos) with byte ranges.
  // iPhones won't play a video unless a request for part of it gets just that
  // part (206), and the web server compresses these files on the way out,
  // which loses their length and ranges. So they come through here, marked
  // no-transform so nothing in between compresses them.
  //   marker-video.php?f=15-7d2603eaf847aeb9c0de11dd.mov
  $name = is_string($_GET['f'] ?? null) ? $_GET['f'] : '';
  if (!preg_match('/^\d+-[0-9a-f]+\.(mp4|mov|webm)$/', $name, $match)) {
    http_response_code(404);
    return;
  }
  $path = __DIR__ . '/uploads/marker-videos/' . $name;
  if (!is_file($path)) {
    http_response_code(404);
    return;
  }
  $types = array('mp4' => 'video/mp4', 'mov' => 'video/quicktime', 'webm' => 'video/webm');

  @ini_set('zlib.output_compression', '0');
  if (function_exists('apache_setenv')) {
    @apache_setenv('no-gzip', '1');
    @apache_setenv('no-brotli', '1');
  }
  while (ob_get_level()) ob_end_clean();

  $size = filesize($path);
  $start = 0;
  $end = $size - 1;
  $partial = false;
  // One range ("bytes=0-1", "bytes=100-", "bytes=-500"); anything else gets
  // the whole file, which a server may always answer with.
  if (preg_match('/^bytes=(\d*)-(\d*)$/', trim($_SERVER['HTTP_RANGE'] ?? ''), $range) && ($range[1] !== '' || $range[2] !== '')) {
    if ($range[1] === '') {
      $start = max(0, $size - (int) $range[2]);
    } else {
      $start = (int) $range[1];
      if ($range[2] !== '') $end = min((int) $range[2], $size - 1);
    }
    if ($start > $end || $start >= $size) {
      http_response_code(416);
      header("Content-Range: bytes */$size");
      return;
    }
    $partial = true;
  }

  // The names are random and a file never changes.
  header('Content-Type: ' . $types[$match[1]]);
  header('Accept-Ranges: bytes');
  header('Cache-Control: public, max-age=31536000, immutable, no-transform');
  header('Content-Length: ' . ($end - $start + 1));
  if ($partial) {
    http_response_code(206);
    header("Content-Range: bytes $start-$end/$size");
  }
  if (($_SERVER['REQUEST_METHOD'] ?? 'GET') === 'HEAD') return;

  set_time_limit(0);
  $file = fopen($path, 'rb');
  fseek($file, $start);
  $left = $end - $start + 1;
  while ($left > 0 && !feof($file) && !connection_aborted()) {
    $chunk = fread($file, min(65536, $left));
    if ($chunk === false || $chunk === '') break;
    echo $chunk;
    flush();
    $left -= strlen($chunk);
  }
  fclose($file);
?>
