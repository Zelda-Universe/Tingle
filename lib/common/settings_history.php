<?php
include_once(__DIR__.'/map_settings.php');
function settingsHistoryKinds() {return ['game','map','category','layout','map_order'];}
function settingsHistoryColumns($kind) {
  if($kind==='game') return ['name'=>'name','page_title'=>'page_title','seo_description'=>'seo_description'];
  if($kind==='map') return ['name'=>'name','description'=>'description','seo_description'=>'seo_description','always_show_categories'=>'always_show_categories'];
  if($kind==='category') return ['name'=>'name','slug'=>'slug','description'=>'description','seo_description'=>'seo_description','img'=>'img','color'=>'color','glyphColor'=>'glyph_color','shape'=>'shape','visible'=>'visible','visible_zoom'=>'visible_zoom','parentId'=>'parent_id','customStyle'=>'custom_style'];
  return [];
}
function settingsHistoryState($db,$prefix,$revision) {
  $kind=$revision['kind'];$game=(int)$revision['container_id'];
  if($kind==='layout') return mapSettingsLayout($db,$prefix,$game);
  if($kind==='map_order') return array_map('intval',$db->fetchFirstColumn("SELECT id FROM `{$prefix}map` WHERE container_id=? AND visible=1 ORDER BY map_order,id",[$game]));
  $table=['game'=>'container','map'=>'map','category'=>'marker_category'][$kind];
  $columns=settingsHistoryColumns($kind);
  $select=implode(',',array_map(function($column,$alias) {return "`$column` AS `$alias`";},array_values($columns),array_keys($columns)));
  return $db->fetchAssociative("SELECT $select FROM `{$prefix}{$table}` WHERE id=?".($kind==='game'?'':' AND container_id=?'),$kind==='game'?[$game]:[$revision['target_id'],$game]);
}
function settingsHistorySnapshot($db,$prefix,$revision,$current) {
  $state=$current;
  $later=$db->fetchAllAssociative("SELECT data FROM `{$prefix}map_revision` WHERE container_id=? AND kind=? AND target_id=? AND id>? ORDER BY id DESC",[$revision['container_id'],$revision['kind'],$revision['target_id'],$revision['id']]);
  foreach($later as $row) {
    $data=json_decode($row['data'],true) ?: [];
    if(!isset($data['before'])) continue;
    if(in_array($revision['kind'],['layout','map_order'],true)) $state=$data['before'];
    else {
      $state=array_replace($state,$data['before']);
      // Older style revisions predate explicit customStyle snapshots.
      if($revision['kind']==='category' && !array_key_exists('customStyle',$data['before']) && array_key_exists('shape',$data['before'])) $state['customStyle']=$data['before']['shape']===null?0:1;
    }
  }
  return $state;
}
