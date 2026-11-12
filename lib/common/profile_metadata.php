<?php
include_once(__DIR__.'/wiki.php');

// Apply the same public-profile visibility rule as user_profile.php. Numeric
// names take precedence over IDs; IDs remain a fallback for old links.
function profileMetadataIdentity($db,$prefix,$identifier) {
  if(!is_string($identifier) || $identifier==='' || mb_strlen($identifier)>100) return false;
  $sql="SELECT id,username FROM `{$prefix}user` WHERE deleted IS NULL AND ".accountLevelSql($db,$prefix).">=".WIKI_EDITOR_LEVEL." AND ";
  $user=$db->fetchAssociative($sql.'username=?',[$identifier]);
  if(!$user && ctype_digit($identifier)) $user=$db->fetchAssociative($sql.'id=?',[(int)$identifier]);
  return $user;
}

function profilePageMetadata($username,$talk=false) {
  return [
    'title'=>$username.($talk?' - Talk':' - Profile').' - Zelda Maps',
    'description'=>$talk?'Talk with '.$username.' on Zelda Maps.':'View '.$username.'’s profile and recent activity on Zelda Maps.',
    'url'=>'https://zeldamaps.com/?user='.rawurlencode($username).($talk?'&talk=1':'')
  ];
}
