<?php
  // Notifications: in the app (with browser push), by email, or both, per
  // kind, as each person chooses. For now only editors (level 5+) get them,
  // like the Talk pages and History they're about. Tables from the
  // create_notifications migration; without them nothing is sent.
  //
  // Email and push go out after the response has been sent, so posting a
  // comment doesn't wait on SMTP or push services.

  include_once(__DIR__ . '/wiki.php');

  // Kinds, highest priority first: someone a comment concerns in more than
  // one way gets one notification, the first of these they haven't turned off.
  function notificationTypes() {
    return array(
      'user_talk'        => array('label' => 'Messages on your talk page', 'group' => 'Talk', 'inApp' => true, 'email' => true),
      'comment_reply'    => array('label' => 'Replies to your comments', 'group' => 'Talk', 'inApp' => true, 'email' => true),
      'like'             => array('label' => 'Yeahs on your comments and edits', 'group' => 'Yeahs', 'inApp' => true, 'email' => false),
      'mention'          => array('label' => 'Mentions of you', 'hint' => 'When someone links to you with [[user:name]].', 'group' => 'Talk', 'inApp' => true, 'email' => false),
      'marker_comment'   => array('label' => 'Comments on your markers', 'group' => 'Your markers', 'inApp' => true, 'email' => false),
      'marker_edit'      => array('label' => 'Changes to your markers', 'hint' => 'Edits, restores and deletions by others.', 'group' => 'Your markers', 'inApp' => true, 'email' => false),
      // Paths (lib/common/paths.php): for admins only while they're built.
      'path_comment'     => array('label' => 'Comments on your paths', 'group' => 'Your paths', 'inApp' => true, 'email' => false, 'admin' => true),
      'path_edit'        => array('label' => 'Changes to your paths', 'hint' => 'Edits, restores and deletions by others.', 'group' => 'Your paths', 'inApp' => true, 'email' => false, 'admin' => true),
      'followed_comment' => array('label' => 'Comments on markers you follow', 'group' => 'Markers you follow', 'inApp' => true, 'email' => false),
      'followed_edit'    => array('label' => 'Changes to markers you follow', 'group' => 'Markers you follow', 'inApp' => true, 'email' => false),
      // Reports of problem edits (ajax/report_edit.php), for admins only.
      'edit_report'      => array('label' => 'Reports of problem edits', 'group' => 'Admin', 'inApp' => true, 'email' => true, 'admin' => true),
      // An admin's warning about an edit (ajax/admin_report_action.php).
      'warning'          => array('label' => 'Warnings from moderators', 'group' => 'Your account', 'inApp' => true, 'email' => true)
    );
  }

  function notificationsAvailable($db, $prefix) {
    static $available = null;
    if ($available === null) {
      $available = (bool) $db->fetchOne("SHOW TABLES LIKE '{$prefix}notification'")
        && (bool) $db->fetchOne("SHOW TABLES LIKE '{$prefix}notification_setting'")
        && (bool) $db->fetchOne("SHOW TABLES LIKE '{$prefix}talk_follow'");
    }
    return $available;
  }

  // Every kind's [inApp, email] for a person, defaults filled in.
  function notificationSettings($db, $prefix, $userId) {
    $settings = array();
    foreach (notificationTypes() as $type => $info) {
      $settings[$type] = array('inApp' => $info['inApp'], 'email' => $info['email']);
    }
    $rows = $db->fetchAllAssociative(
      "SELECT `type`, `in_app`, `email` FROM `{$prefix}notification_setting` WHERE `user_id` = ?",
      [(int) $userId]
    );
    foreach ($rows as $row) {
      if (isset($settings[$row['type']])) {
        $settings[$row['type']] = array('inApp' => (bool) $row['in_app'], 'email' => (bool) $row['email']);
      }
    }
    return $settings;
  }

  function notificationUserOptions($db, $prefix, $userId) {
    $row = $db->fetchAssociative(
      "SELECT `notify_follows_paused` AS `paused`, `notify_auto_follow` AS `autoFollow` FROM `{$prefix}user` WHERE `id` = ?",
      [(int) $userId]
    );
    return array(
      'followsPaused' => $row ? (bool) $row['paused'] : false,
      'autoFollow' => $row ? (bool) $row['autoFollow'] : true
    );
  }

  // Editors who can still use their accounts, out of $userIds.
  function notificationRecipients($db, $prefix, $userIds) {
    $userIds = array_values(array_unique(array_filter(array_map('intval', $userIds))));
    if (!$userIds) return array();
    $marks = implode(',', array_fill(0, count($userIds), '?'));
    return array_map('intval', $db->fetchFirstColumn(
      "SELECT `id` FROM `{$prefix}user` WHERE `id` IN ({$marks}) AND " . accountLevelSql($db, $prefix) . " >= ? AND " . accountUsableSql($db, $prefix),
      array_merge($userIds, [WIKI_EDITOR_LEVEL])
    ));
  }

  function notificationExcerpt($text, $length = 160) {
    // Link codes read as what they show: [[marker:5]] as "marker #5".
    $text = preg_replace_callback('/\[\[(rev|pathrev|settingsrev|marker|user):([^\]|]+)(?:\|([^\]]+))?\]\]/i', function($m) {
      if (isset($m[3]) && trim($m[3]) !== '') return trim($m[3]);
      $kind = strtolower($m[1]);
      return in_array($kind, ['rev', 'pathrev', 'settingsrev'], true) ? 'revision ' . trim($m[2]) : ($kind === 'marker' ? 'marker #' . trim($m[2]) : trim($m[2]));
    }, (string) $text);
    $text = trim(preg_replace('/\s+/u', ' ', $text));
    return mb_strlen($text) > $length ? rtrim(mb_substr($text, 0, $length - 1)) . '…' : $text;
  }

  // A path's name, link and owner, for its notifications.
  function notificationPathInfo($db, $prefix, $pathId) {
    $row = $db->fetchAssociative("SELECT p.name, p.slug, p.user_id, c.short_name FROM `{$prefix}path` p
      JOIN `{$prefix}container` c ON c.id = p.container_id WHERE p.id = ?", [(int) $pathId]);
    return $row ? array('name' => $row['name'], 'slug' => $row['slug'], 'ownerId' => (int) $row['user_id'], 'game' => $row['short_name']) : null;
  }

  function notificationMarkerInfo($db, $prefix, $markerId) {
    $row = $db->fetchAssociative(
      "SELECT `user_id`, `name`, " . wikiMarkerGamesSql($prefix, '?') . " AS `game` FROM `{$prefix}marker` WHERE `id` = ?",
      [(int) $markerId, (int) $markerId]
    );
    if (!$row) return null;
    return array('ownerId' => (int) $row['user_id'], 'title' => wikiDecode($row['name']), 'game' => $row['game']);
  }

  // Sends notifications for one event. $candidates is [userId => [types]],
  // each person's kinds in no particular order.
  function notificationDeliver($db, $prefix, $actorId, $candidates, $fields, $data, $silent = false) {
    if (!notificationsAvailable($db, $prefix)) return;
    unset($candidates[(int) $actorId]);
    $recipients = notificationRecipients($db, $prefix, array_keys($candidates));
    $order = array_keys(notificationTypes());
    $emails = array();
    $pushUsers = array();
    foreach ($recipients as $userId) {
      $settings = notificationSettings($db, $prefix, $userId);
      $types = array_values(array_intersect($order, $candidates[$userId]));
      $chosen = null;
      foreach ($types as $type) {
        if ($settings[$type]['inApp'] || $settings[$type]['email']) { $chosen = $type; break; }
      }
      if ($chosen === null) continue;
      $db->executeStatement("
        INSERT INTO `{$prefix}notification`
          (`user_id`, `type`, `actor_id`, `page_type`, `page_id`, `marker_id`, `comment_id`, `revision_id`, `data`, `in_app`, `created`, `read_at`)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), " . ($settings[$chosen]['inApp'] ? 'NULL' : 'NOW()') . ")
      ", [
        $userId, $chosen, (int) $actorId ?: null, $fields['pageType'] ?? null, $fields['pageId'] ?? null,
        $fields['markerId'] ?? null, $fields['commentId'] ?? null, $fields['revisionId'] ?? null, json_encode($data),
        $settings[$chosen]['inApp'] ? 1 : 0
      ]);
      $id = (int) $db->lastInsertId();
      if (!$silent && $settings[$chosen]['email']) $emails[] = $id;
      if (!$silent && $settings[$chosen]['inApp']) $pushUsers[$userId] = true;
    }
    if (!$emails && !$pushUsers) return;
    // After the response: SMTP and push services can be slow.
    register_shutdown_function(function() use ($db, $prefix, $emails, $pushUsers) {
      if (function_exists('fastcgi_finish_request')) @fastcgi_finish_request();
      try {
        foreach ($emails as $id) notificationEmail($db, $prefix, $id);
        if ($pushUsers) {
          include_once(__DIR__ . '/push.php');
          foreach (array_keys($pushUsers) as $userId) pushNotifyUser($db, $prefix, $userId);
        }
      } catch (\Throwable $e) {
        error_log('notifications: ' . $e->getMessage());
      }
    });
  }

  // A new Talk comment: the talk page's owner, whoever it replies to, people
  // it mentions, the marker's owner and its followers.
  function notifyTalkComment($db, $prefix, $actor, $commentId, $pageType, $pageId, $parentId, $body) {
    if (!notificationsAvailable($db, $prefix)) return;
    $candidates = array();
    $add = function($userId, $type) use (&$candidates) {
      if ($userId) $candidates[(int) $userId][] = $type;
    };
    $data = array('excerpt' => notificationExcerpt($body));
    $fields = array('pageType' => $pageType, 'pageId' => (int) $pageId, 'commentId' => (int) $commentId);
    if ($pageType === 'user') {
      $add($pageId, 'user_talk');
      $data['pageTitle'] = (string) $db->fetchOne("SELECT `username` FROM `{$prefix}user` WHERE `id` = ?", [(int) $pageId]);
    } elseif ($pageType === 'path') {
      // A path's Talk: its owner hears, and it opens at the comment.
      $path = notificationPathInfo($db, $prefix, $pageId);
      if (!$path) return;
      $data['pageTitle'] = $data['pathTitle'] = $path['name'];
      $data['link'] = array('game' => $path['game'], 'path' => $path['slug'], 'talk' => 1, 'comment' => (int) $commentId);
      $add($path['ownerId'], 'path_comment');
    } else {
      $marker = notificationMarkerInfo($db, $prefix, $pageId);
      if (!$marker) return;
      $fields['markerId'] = (int) $pageId;
      $data['markerTitle'] = $data['pageTitle'] = $marker['title'];
      $data['game'] = $marker['game'];
      $add($marker['ownerId'], 'marker_comment');
      foreach (notificationFollowers($db, $prefix, 'marker', $pageId) as $follower) $add($follower, 'followed_comment');
    }
    if ($parentId) {
      $add($db->fetchOne("SELECT `user_id` FROM `{$prefix}talk_comment` WHERE `id` = ?", [(int) $parentId]), 'comment_reply');
    }
    if (preg_match_all('/\[\[user:([^\]|]{1,64})(?:\|[^\]]*)?\]\]/i', $body, $mentions)) {
      $names = array_slice(array_unique(array_map('trim', $mentions[1])), 0, 20);
      $marks = implode(',', array_fill(0, count($names), '?'));
      foreach ($db->fetchFirstColumn("SELECT `id` FROM `{$prefix}user` WHERE `username` IN ({$marks})", $names) as $id) {
        $add($id, 'mention');
      }
    }
    $data['actor'] = $actor['username'];
    notificationDeliver($db, $prefix, $actor['id'], $candidates, $fields, $data);
  }

  // An edit, restore or deletion: the marker's owner and its followers.
  function notifyMarkerChange($db, $prefix, $actorId, $markerId, $revisionId, $action) {
    if (!notificationsAvailable($db, $prefix) || !in_array($action, ['edit', 'revert', 'delete'], true)) return;
    $marker = notificationMarkerInfo($db, $prefix, $markerId);
    if (!$marker) return;
    $candidates = array();
    $candidates[$marker['ownerId']][] = 'marker_edit';
    foreach (notificationFollowers($db, $prefix, 'marker', $markerId) as $follower) $candidates[$follower][] = 'followed_edit';
    $summary = $revisionId ? $db->fetchOne("SELECT `summary` FROM `{$prefix}marker_revision` WHERE `id` = ?", [(int) $revisionId]) : null;
    notificationDeliver($db, $prefix, $actorId, $candidates,
      array('pageType' => 'marker', 'pageId' => (int) $markerId, 'markerId' => (int) $markerId, 'revisionId' => $revisionId ? (int) $revisionId : null),
      array(
        'actor' => (string) $db->fetchOne("SELECT `username` FROM `{$prefix}user` WHERE `id` = ?", [(int) $actorId]),
        'action' => $action, 'markerTitle' => $marker['title'], 'game' => $marker['game'],
        'excerpt' => $summary ? notificationExcerpt($summary) : null
      )
    );
  }

  // Followers of a page, except those who've paused followed markers.
  function notificationFollowers($db, $prefix, $pageType, $pageId) {
    return array_map('intval', $db->fetchFirstColumn("
      SELECT `f`.`user_id` FROM `{$prefix}talk_follow` `f`
        JOIN `{$prefix}user` `u` ON `u`.`id` = `f`.`user_id`
       WHERE `f`.`page_type` = ? AND `f`.`page_id` = ? AND `u`.`notify_follows_paused` = 0
    ", [$pageType, (int) $pageId]));
  }

  function notificationFollow($db, $prefix, $userId, $pageType, $pageId, $follow) {
    if ($follow) {
      $db->executeStatement(
        "INSERT IGNORE INTO `{$prefix}talk_follow` (`user_id`, `page_type`, `page_id`, `created`) VALUES (?, ?, ?, NOW())",
        [(int) $userId, $pageType, (int) $pageId]
      );
    } else {
      $db->executeStatement(
        "DELETE FROM `{$prefix}talk_follow` WHERE `user_id` = ? AND `page_type` = ? AND `page_id` = ?",
        [(int) $userId, $pageType, (int) $pageId]
      );
    }
  }

  function notificationIsFollowing($db, $prefix, $userId, $pageType, $pageId) {
    if (!notificationsAvailable($db, $prefix)) return false;
    return (bool) $db->fetchOne(
      "SELECT 1 FROM `{$prefix}talk_follow` WHERE `user_id` = ? AND `page_type` = ? AND `page_id` = ?",
      [(int) $userId, $pageType, (int) $pageId]
    );
  }

  function notifyLike($db,$prefix,$actor,$type,$id,$silent=false) {
    if(!notificationsAvailable($db,$prefix)) return;
    $fields=[];$data=['actor'=>$actor['username']];
    if($type==='comment') {
      $target=$db->fetchAssociative("SELECT user_id,page_type,page_id,body FROM `{$prefix}talk_comment` WHERE id=? AND deleted IS NULL",[$id]);
      if(!$target) return;
      $fields=['pageType'=>$target['page_type'],'pageId'=>(int)$target['page_id'],'commentId'=>$id];
      $data['excerpt']=notificationExcerpt($target['body']);
      if($target['page_type']==='marker') {
        $marker=notificationMarkerInfo($db,$prefix,$target['page_id']);
        if(!$marker) return;
        $fields['markerId']=(int)$target['page_id'];
        $data['pageTitle']=$data['markerTitle']=$marker['title'];$data['game']=$marker['game'];
      } elseif($target['page_type']==='path') {
        $path=notificationPathInfo($db,$prefix,$target['page_id']);
        if(!$path) return;
        $data['pageTitle']=$path['name'];
        $data['link']=['game'=>$path['game'],'path'=>$path['slug'],'talk'=>1,'comment'=>$id];
      } else $data['pageTitle']=$db->fetchOne("SELECT username FROM `{$prefix}user` WHERE id=?",[$target['page_id']]).'’s Talk';
    } elseif($type==='revision') {
      $target=$db->fetchAssociative("SELECT user_id,marker_id,summary FROM `{$prefix}marker_revision` WHERE id=?",[$id]);
      if(!$target) return;
      $marker=notificationMarkerInfo($db,$prefix,$target['marker_id']);
      if(!$marker) return;
      $fields=['markerId'=>(int)$target['marker_id'],'revisionId'=>$id];
      $data+=['markerTitle'=>$marker['title'],'game'=>$marker['game'],'excerpt'=>notificationExcerpt($target['summary'])];
    } elseif($type==='settings') {
      $target=$db->fetchAssociative("SELECT r.user_id,r.summary,c.short_name FROM `{$prefix}map_revision` r JOIN `{$prefix}container` c ON c.id=r.container_id WHERE r.id=?",[$id]);
      if(!$target) return;
      $data+=['markerTitle'=>'Game Settings','excerpt'=>notificationExcerpt($target['summary']),'link'=>['game'=>$target['short_name'],'page'=>'game-settings-revision','settings-rev'=>$id]];
    } elseif($type==='pathrev') {
      // A save in a path's history: "gave your edit to <path> a Yeah!".
      $target=$db->fetchAssociative("SELECT r.user_id,r.summary,r.path_id FROM `{$prefix}path_revision` r WHERE r.id=?",[$id]);
      $path=$target ? notificationPathInfo($db,$prefix,$target['path_id']) : null;
      if(!$path) return;
      $data+=['markerTitle'=>$path['name'],'excerpt'=>notificationExcerpt($target['summary']),'link'=>['game'=>$path['game'],'path'=>$path['slug'],'pathrev'=>$id]];
    } elseif($type==='path') {
      $target=$db->fetchAssociative("SELECT p.user_id,p.name,p.slug,c.short_name FROM `{$prefix}path` p JOIN `{$prefix}container` c ON c.id=p.container_id WHERE p.id=?",[$id]);
      if(!$target) return;
      $data+=['pathTitle'=>$target['name'],'link'=>['game'=>$target['short_name'],'path'=>$target['slug']]];
    } else return;
    $owner=(int)$target['user_id'];
    if($owner===(int)$actor['id']) return;
    $kind='like';
    $data['likeTarget']=$type.':'.$id;
    // Undo/re-Yeah must not repeatedly notify the same author.
    if($db->fetchOne("SELECT id FROM `{$prefix}notification` WHERE user_id=? AND actor_id=? AND type=? AND JSON_UNQUOTE(JSON_EXTRACT(data,'$.likeTarget'))=? LIMIT 1",[$owner,$actor['id'],$kind,$data['likeTarget']])) return;
    notificationDeliver($db,$prefix,$actor['id'],[$owner=>[$kind]],$fields,$data,$silent);
  }

  // What a notification says, and where it leads, for the app, email and push.
  function notificationRender($row, $baseURL = '') {
    $data = is_array($row['data']) ? $row['data'] : (json_decode((string) $row['data'], true) ?: array());
    $actor = $data['actor'] ?? 'Someone';
    $marker = $data['markerTitle'] ?? 'a marker';
    $page = $data['pageTitle'] ?? $marker;
    $pathTitle = $data['pathTitle'] ?? 'a path';
    $verb = array('edit' => 'edited', 'revert' => 'restored an earlier version of', 'delete' => 'deleted')[$data['action'] ?? 'edit'] ?? 'changed';
    switch ($row['type']) {
      case 'like':            $title = strpos($data['likeTarget'] ?? '','path:')===0 ? "{$actor} gave your path {$pathTitle} a Yeah!" : (($data['likeTarget'] ?? '') && strpos($data['likeTarget'],'comment:')===0 ? "{$actor} gave your comment on {$page} a Yeah!" : "{$actor} gave your edit to {$marker} a Yeah!"); break;
      case 'path_edit':        $title = "{$actor} {$verb} your path {$pathTitle}"; break;
      case 'path_comment':     $title = "{$actor} commented on your path {$pathTitle}"; break;
      case 'user_talk':        $title = "{$actor} left a message on your talk page"; break;
      case 'comment_reply':    $title = "{$actor} replied to your comment on {$page}"; break;
      case 'comment_like':     $title = "{$actor} gave your comment on {$page} a Yeah!"; break;
      case 'edit_like':        $title = "{$actor} gave your edit to {$marker} a Yeah!"; break;
      case 'mention':          $title = "{$actor} mentioned you on {$page}"; break;
      case 'marker_comment':   $title = "{$actor} commented on your marker {$marker}"; break;
      case 'followed_comment': $title = "{$actor} commented on {$marker}"; break;
      case 'marker_edit':      $title = "{$actor} {$verb} your marker {$marker}"; break;
      case 'followed_edit':    $title = "{$actor} {$verb} {$marker}"; break;
      case 'edit_report':      $title = "{$actor} reported an edit to {$marker}"; break;
      case 'warning':          $title = "A moderator warned you about your edit to {$marker} (strike " . (int) ($data['strikes'] ?? 1) . " of 3)"; break;
      default:                 $title = 'New activity';
    }
    $query = array();
    if (!empty($data['game'])) $query['game'] = $data['game'];
    if (!empty($row['revision_id']) || !empty($row['revisionId'])) {
      $query['marker'] = $row['marker_id'] ?? $row['markerId'];
      $query['rev'] = $row['revision_id'] ?? $row['revisionId'];
    } elseif (($row['page_type'] ?? $row['pageType'] ?? '') === 'user') {
      $query['user'] = $row['page_id'] ?? $row['pageId'];
      $query['talk'] = 1;
    } else {
      $query['marker'] = $row['marker_id'] ?? $row['markerId'] ?? $row['page_id'] ?? $row['pageId'] ?? null;
      $query['talk'] = 1;
    }
    $comment = $row['comment_id'] ?? $row['commentId'] ?? null;
    if ($comment) $query['comment'] = $comment;
    // Some lead elsewhere: a report opens its own page.
    if (!empty($data['link']) && is_array($data['link'])) $query = $data['link'];
    if (($row['type'] ?? '') === 'edit_report' && !empty($data['reportId'])) {
      $query = array('page' => 'report', 'report' => (int) $data['reportId']);
    }
    return array(
      'title' => $title,
      'body' => (string) ($data['excerpt'] ?? ''),
      'url' => ($baseURL === '' ? '' : rtrim($baseURL, '/') . '/') . '?' . http_build_query($query)
    );
  }

  // What a notification's email button says.
  function notificationEmailButton($type) {
    switch ($type) {
      case 'user_talk': case 'comment_reply': case 'mention':
      case 'marker_comment': case 'path_comment': case 'followed_comment': return 'Read and Reply';
      case 'marker_edit': case 'path_edit': case 'followed_edit': return 'See the Changes';
      case 'edit_report': return 'Review the Report';
      case 'warning': return 'See Your Edit';
      default: return 'See It on Zelda Maps';
    }
  }

  // A notification's email: its subject, plain text, and HTML in the
  // password reset email's design (content/notificationEmailTemplate.html,
  // when it's there). Also used to preview them.
  function notificationEmailText($row, $baseURL) {
    $text = notificationRender($row, $baseURL);
    $settingsURL = rtrim($baseURL, '/') . "/?page=notification-settings";
    $body = "Hi " . ($row['name'] ?: $row['username']) . ",\n\n" .
      $text['title'] . ".\n\n" .
      ($text['body'] !== '' ? "“" . $text['body'] . "”\n\n" : '') .
      "See it on Zelda Maps:\n" . $text['url'] . "\n\n" .
      "—\nYou're getting this because of your notification settings. Choose which emails you get here:\n" .
      $settingsURL . "\n";
    $html = null;
    $template = dirname(__DIR__, 2) . '/content/notificationEmailTemplate.html';
    if (is_file($template)) {
      $e = function ($value) { return htmlspecialchars((string) $value, ENT_QUOTES | ENT_HTML5, 'UTF-8'); };
      $quote = $text['body'] === '' ? '' :
        '<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="margin:0 0 24px;"><tr>' .
        '<td width="3" bgcolor="#4a4a50" style="background-color:#4a4a50;border-radius:2px;font-size:0;line-height:0;">&nbsp;</td>' .
        '<td style="padding:2px 0 2px 14px;font-size:16px;line-height:1.55;color:#e6e6e8;">' . nl2br($e($text['body'])) . '</td>' .
        '</tr></table>';
      // (In one pass: what's filled in is never filled in again.)
      $html = strtr(file_get_contents($template), array(
        '{{title}}' => $e($text['title']),
        '{{preheader}}' => $e($text['body'] !== '' ? $text['body'] : $text['title']),
        '{{quote}}' => $quote,
        '{{url}}' => $e($text['url']),
        '{{button}}' => $e(notificationEmailButton($row['type'])),
        '{{settingsURL}}' => $e($settingsURL),
        '{{siteBaseURL}}' => $e(rtrim($baseURL, '/'))
      ));
    }
    return array('subject' => mb_substr($text['title'], 0, 140), 'body' => $body, 'html' => $html);
  }

  function notificationEmail($db, $prefix, $notificationId) {
    global $mailEnabled, $siteBaseURL, $mailReplyToAddress, $mailReplyToName;
    if (empty($mailEnabled)) return false;
    $row = $db->fetchAssociative("
      SELECT `n`.*, `u`.`email`, `u`.`name`, `u`.`username`
        FROM `{$prefix}notification` `n` JOIN `{$prefix}user` `u` ON `u`.`id` = `n`.`user_id`
       WHERE `n`.`id` = ?
    ", [(int) $notificationId]);
    if (!$row || !$row['email']) return false;
    $text = notificationEmailText($row, $siteBaseURL);
    include_once(dirname(__DIR__) . '/zmailer.php');
    try {
      $message = (new \Symfony\Component\Mime\Email())
        ->from(new \Symfony\Component\Mime\Address($mailReplyToAddress, $mailReplyToName))
        ->to(new \Symfony\Component\Mime\Address($row['email'], $row['name'] ?: $row['username']))
        ->subject($text['subject'])
        ->text($text['body']);
      if ($text['html'] !== null) $message->html($text['html']);
    } catch (\Throwable $e) {
      error_log('notificationEmail: ' . $e->getMessage());
      return false;
    }
    return sendMail($message);
  }

  function notificationUnreadCount($db, $prefix, $userId) {
    if (!notificationsAvailable($db, $prefix)) return 0;
    return (int) $db->fetchOne(
      "SELECT COUNT(*) FROM `{$prefix}notification` WHERE `user_id` = ? AND `in_app` = 1 AND `read_at` IS NULL",
      [(int) $userId]
    );
  }
?>
