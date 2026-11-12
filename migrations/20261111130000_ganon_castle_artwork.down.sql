-- Undo marker import first; do not remove floors containing markers.
DELETE FROM submap WHERE map_id=64033 AND id BETWEEN 640130 AND 640137 AND NOT EXISTS (SELECT 1 FROM marker WHERE marker.submap_id=submap.id);
DELETE FROM map WHERE id=64033 AND container_id=64 AND NOT EXISTS (SELECT 1 FROM submap WHERE map_id=64033);
