<?php
  // Saves the category list's layout from Map Settings (its Save Changes
  // button): its sections, in order, and the categories in each, with what
  // changed in words. Saved as each category's menu_section and
  // menu_order (lib/common/map_settings.php), with the layouts before and
  // after in the map's history.
  include_once(dirname(__DIR__) . '/lib/common/map_settings.php');
  $editor = mapSettingsRequire($db, $map_prefix);
  if ($editor === null) return;
  if (!mapSettingsAvailable($db, $map_prefix)) {
    echo json_encode(array('success' => false, 'msg' => 'Run the map_settings_and_reports migration first.'));
    return;
  }
  $fail = function($msg) { echo json_encode(array('success' => false, 'msg' => $msg)); };
  $game = mapSettingsGame($db, $map_prefix, $_POST['game'] ?? '');
  if (!$game) return $fail('That game was not found.');
  $containerId = (int) $game['id'];
  $name=isset($_POST['name']) && is_string($_POST['name']) ? trim($_POST['name']) : null;
  if($name!==null && ($name==='' || mb_strlen($name)>45 || strip_tags($name)!==$name)) return $fail('Enter a name of 1 to 45 characters, without HTML.');
  $pageTitle=isset($_POST['page_title']) && is_string($_POST['page_title']) ? trim($_POST['page_title']) : null;
  if($pageTitle!==null && (mb_strlen($pageTitle)>100 || strip_tags($pageTitle)!==$pageTitle)) return $fail('Page titles must be plain text, up to 100 characters.');
  $hasLayout=isset($_POST['layout']);
  $layout = $hasLayout ? mapSettingsCleanLayout($db, $map_prefix, $containerId, $_POST['layout']) : null;
  if (is_string($layout)) return $fail($layout);
  // What changed, in words, from the page (for the history).
  $changes = json_decode(is_string($_POST['changes'] ?? null) ? $_POST['changes'] : '[]', true);
  $changes = array_slice(array_values(array_filter(is_array($changes) ? $changes : array(), 'is_string')), 0, 50);
  $changes = array_map(function($text) { return mb_substr(trim($text), 0, 200); }, $changes);
  $summary=trim(is_string($_POST['summary'] ?? null) ? $_POST['summary'] : '');
  if(mb_strlen($summary)>255) return $fail('Keep the summary under 255 characters.');
  $seo=isset($_POST['seo_description']) && is_string($_POST['seo_description']) ? strip_tags(trim($_POST['seo_description'])) : null;
  if($seo!==null && mb_strlen($seo)>5000) return $fail('Descriptions must be 5,000 characters or fewer.');
  $ids=isset($_POST['ids']) ? json_decode(is_string($_POST['ids']) ? $_POST['ids'] : '',true) : null;
  if(isset($_POST['ids']) && (!is_array($ids) || !array_is_list($ids))) return $fail('Invalid map order.');

  begin();
  if($ids!==null) {
    $mapOrder=array_map('intval',$db->fetchFirstColumn("SELECT id FROM `{$map_prefix}map` WHERE container_id=? AND visible=1 ORDER BY map_order,id FOR UPDATE",[$containerId]));
    $expected=$mapOrder;$actual=$ids;sort($expected);sort($actual);
    if($expected!==$actual) {rollback();return $fail('The maps changed. Reload Game Settings and try again.');}
  }
  $oldGame=$db->fetchAssociative("SELECT name,page_title,seo_description FROM `{$map_prefix}container` WHERE id=? FOR UPDATE",[$containerId]);
  $oldSeo=(string)$oldGame['seo_description'];
  $before = mapSettingsLayout($db, $map_prefix, $containerId);
  if(!$hasLayout) $layout=$before;
  if ($before === $layout && ($ids===null || $ids===$mapOrder) && ($seo===null || $seo===$oldSeo) && ($name===null || $name===$oldGame['name']) && ($pageTitle===null || $pageTitle===($oldGame['page_title'] ?? ''))) {
    rollback();
    echo json_encode(array('success' => true, 'msg' => 'Nothing changed.', 'changed' => false));
    return;
  }
  $gameBefore=[];$gameAfter=[];$sets=[];$params=[];
  foreach(['name'=>$name,'page_title'=>$pageTitle,'seo_description'=>$seo] as $field=>$value) {
    if($value===null || $value===($oldGame[$field] ?? '')) continue;
    $gameBefore[$field]=$oldGame[$field];$gameAfter[$field]=$value;
    $sets[]="`$field`=?";$params[]=$value;
  }
  if($sets) {
    $params[]=$containerId;
    $db->executeStatement("UPDATE `{$map_prefix}container` SET ".implode(',',$sets)." WHERE id=?",$params);
    mapSettingsRecord($db,$map_prefix,$containerId,$editor['id'],'game',$containerId,$summary,
      ['name'=>$name ?? $game['name'],'before'=>$gameBefore,'after'=>$gameAfter]);
  }
  if($ids!==null && $ids!==$mapOrder) {
    foreach($ids as $position=>$id) $db->executeStatement("UPDATE `{$map_prefix}map` SET map_order=? WHERE id=? AND container_id=?",[$position,$id,$containerId]);
    mapSettingsRecord($db,$map_prefix,$containerId,$editor['id'],'map_order',0,$summary,['name'=>'Maps','changes'=>['reordered maps'],'before'=>$mapOrder,'after'=>$ids]);
  }
  if($before!==$layout) {
  mapSettingsApplyLayout($db, $map_prefix, $containerId, $layout);
  // (A category moved to another section belongs to it too.)
  mapSettingsSyncParents($db, $map_prefix, $containerId, $before, $layout);
  mapSettingsRecord($db, $map_prefix, $containerId, $editor['id'], 'layout', 0, $summary,
    array('name' => 'Category list', 'changes' => $changes, 'before' => $before, 'after' => $layout));
  }
  commit();
  echo json_encode(array('success' => true, 'msg' => 'Saved.', 'changed' => true));
?>
