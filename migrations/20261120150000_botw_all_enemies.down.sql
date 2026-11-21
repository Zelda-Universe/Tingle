-- Every-enemy import gone, and the rare section named as it was.

DELETE FROM marker_tab WHERE marker_id BETWEEN 19610001 AND 19613280;
DELETE FROM marker_revision WHERE marker_id BETWEEN 19610001 AND 19613280;
DELETE FROM marker WHERE id BETWEEN 19610001 AND 19613280;
DELETE c FROM marker_category c WHERE c.id IN (2293, 2294, 2295, 2296, 2297, 2298, 2299, 2300) AND NOT EXISTS (SELECT 1 FROM marker m WHERE m.marker_category_id = c.id);
UPDATE marker_category SET menu_section = 'Enemies & Bosses' WHERE container_id = 19 AND menu_section = 'Rare Enemies & Bosses';
