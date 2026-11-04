<?php
  // Browser push notifications (Web Push with VAPID). Pushes carry no
  // payload, so nothing needs encrypting: the service worker wakes up and
  // asks notifications_push_latest what's new, as the signed-in account.
  // The app makes its own VAPID keys the first time and keeps them in
  // app_setting, so there's nothing to configure.

  function pushAvailable($db, $prefix) {
    static $available = null;
    if ($available === null) {
      $available = function_exists('openssl_pkey_new') && function_exists('curl_init')
        && (bool) $db->fetchOne("SHOW TABLES LIKE '{$prefix}push_subscription'")
        && (bool) $db->fetchOne("SHOW TABLES LIKE '{$prefix}app_setting'");
    }
    return $available;
  }

  function pushBase64Url($bytes) {
    return rtrim(strtr(base64_encode($bytes), '+/', '-_'), '=');
  }

  // ['private' => PEM, 'public' => base64url of the uncompressed P-256 point].
  function pushVapidKeys($db, $prefix) {
    static $keys = null;
    if ($keys !== null) return $keys;
    $stored = $db->fetchOne("SELECT `value` FROM `{$prefix}app_setting` WHERE `name` = 'vapid_keys'");
    if ($stored) return $keys = json_decode($stored, true);
    $key = openssl_pkey_new(['curve_name' => 'prime256v1', 'private_key_type' => OPENSSL_KEYTYPE_EC]);
    if (!$key || !openssl_pkey_export($key, $pem)) throw new \RuntimeException('Could not make push keys.');
    $ec = openssl_pkey_get_details($key)['ec'];
    $public = "\x04" . str_pad($ec['x'], 32, "\0", STR_PAD_LEFT) . str_pad($ec['y'], 32, "\0", STR_PAD_LEFT);
    $made = ['private' => $pem, 'public' => pushBase64Url($public)];
    // Another request may have made them first; theirs win.
    $db->executeStatement(
      "INSERT IGNORE INTO `{$prefix}app_setting` (`name`, `value`) VALUES ('vapid_keys', ?)",
      [json_encode($made)]
    );
    return $keys = json_decode($db->fetchOne("SELECT `value` FROM `{$prefix}app_setting` WHERE `name` = 'vapid_keys'"), true);
  }

  // A DER ECDSA signature as the 64 raw bytes JWTs use.
  function pushRawSignature($der) {
    $offset = 2;
    $parts = [];
    for ($i = 0; $i < 2; $i++) {
      $offset++; // INTEGER tag
      $length = ord($der[$offset++]);
      $parts[] = str_pad(ltrim(substr($der, $offset, $length), "\0"), 32, "\0", STR_PAD_LEFT);
      $offset += $length;
    }
    return $parts[0] . $parts[1];
  }

  function pushVapidHeader($keys, $endpoint) {
    global $siteBaseURL, $mailReplyToAddress;
    $url = parse_url($endpoint);
    $audience = $url['scheme'] . '://' . $url['host'] . (isset($url['port']) ? ':' . $url['port'] : '');
    $subject = !empty($mailReplyToAddress) ? 'mailto:' . $mailReplyToAddress : ($siteBaseURL ?: 'https://zeldamaps.com');
    $input = pushBase64Url(json_encode(['typ' => 'JWT', 'alg' => 'ES256'])) . '.' .
      pushBase64Url(json_encode(['aud' => $audience, 'exp' => time() + 12 * 3600, 'sub' => $subject]));
    if (!openssl_sign($input, $der, $keys['private'], OPENSSL_ALGO_SHA256)) return null;
    return 'vapid t=' . $input . '.' . pushBase64Url(pushRawSignature($der)) . ', k=' . $keys['public'];
  }

  // Wakes every browser the person has subscribed. Gone subscriptions (404,
  // 410) are removed.
  function pushNotifyUser($db, $prefix, $userId) {
    if (!pushAvailable($db, $prefix)) return;
    $subscriptions = $db->fetchAllAssociative(
      "SELECT `id`, `endpoint` FROM `{$prefix}push_subscription` WHERE `user_id` = ?",
      [(int) $userId]
    );
    if (!$subscriptions) return;
    $keys = pushVapidKeys($db, $prefix);
    $multi = curl_multi_init();
    $handles = [];
    foreach ($subscriptions as $subscription) {
      $authorization = pushVapidHeader($keys, $subscription['endpoint']);
      if (!$authorization) continue;
      $handle = curl_init($subscription['endpoint']);
      curl_setopt_array($handle, [
        CURLOPT_POST => true,
        CURLOPT_POSTFIELDS => '',
        CURLOPT_HTTPHEADER => ['Authorization: ' . $authorization, 'TTL: 86400', 'Urgency: normal', 'Content-Length: 0'],
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_CONNECTTIMEOUT => 5,
        CURLOPT_TIMEOUT => 10
      ]);
      curl_multi_add_handle($multi, $handle);
      $handles[$subscription['id']] = $handle;
    }
    do {
      $status = curl_multi_exec($multi, $running);
      if ($running) curl_multi_select($multi, 1);
    } while ($running && $status === CURLM_OK);
    foreach ($handles as $id => $handle) {
      $code = curl_getinfo($handle, CURLINFO_RESPONSE_CODE);
      if ($code === 404 || $code === 410) {
        $db->executeStatement("DELETE FROM `{$prefix}push_subscription` WHERE `id` = ?", [$id]);
      } elseif ($code >= 200 && $code < 300) {
        $db->executeStatement("UPDATE `{$prefix}push_subscription` SET `last_used` = NOW() WHERE `id` = ?", [$id]);
      } else {
        error_log("push: {$code} from subscription {$id}: " . substr((string) curl_multi_getcontent($handle), 0, 200));
      }
      curl_multi_remove_handle($multi, $handle);
      curl_close($handle);
    }
    curl_multi_close($multi);
  }
?>
