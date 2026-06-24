SELECT c.name 'Game Name', count(*) as 'Amount'

FROM user_completed_marker AS ucm

JOIN marker mar  ON ucm.marker_id    = mar.id
JOIN submap sm   ON mar.submap_id    = sm.id
JOIN map         ON sm.map_id        = map.id
JOIN container c ON map.container_id = c.id

WHERE ucm.user_id = $userId

GROUP BY c.id
;
