-- Ocarina of Time Remake's adult trading sequence as a path (Paths): the
-- eleven trades from the Cucco Lady's Pocket Egg to Biggoron's Sword, in the
-- order the remake has them (checked against Polygon's remake guide). Each
-- step's instructions are its marker's own (ootr_trade_marker_text). Official,
-- numbered, made by user 15, and shown as a Trading Sequence category of its
-- own under Items & Equipment: its markers stay in theirs (Tools & Quest Items,
-- Weapons), and the category opens as the path (CategoryPage.js). Paths are
-- admin-only.
INSERT INTO marker_category (parent_id, marker_category_type_id, container_id, name, default_checked, img, color, visible_zoom, visible, custom_style, shape, glyph_color, menu_section, menu_order, description, seo_description, slug)
SELECT 64060, 1, 64, 'Trading Sequence', 1, 'BotW_Side-Quest', '#ffad47', 0, 1, 1, 'circle', '#ffffff', 'Points of Interest', 18, '', '', ''
FROM DUAL WHERE EXISTS (SELECT 1 FROM marker_category WHERE id = 64060 AND container_id = 64) AND NOT EXISTS (SELECT 1 FROM marker_category WHERE container_id = 64 AND name = 'Trading Sequence');
INSERT INTO path (id, container_id, user_id, scope, edit_access, visibility, published_at, name, slug, description, kind, loops, numbered, smooth, always_show, category_id, color, visible)
SELECT 4002, 64, 15, 'official', 'editors', 'public', NOW(), 'Biggoron''s Sword Trading Sequence', 'biggorons-sword-trading-sequence', 'Trade your way from the Cucco Lady''s Pocket Egg to Biggoron''s Sword, the strongest sword in the game.\n\nBefore you start, you''ll need to be Adult Link and get Epona back from Lon Lon Ranch.', 'guide', 0, 1, 0, 1, (SELECT id FROM marker_category WHERE container_id = 64 AND name = 'Trading Sequence' ORDER BY id LIMIT 1), '#e3b341', 1
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM path WHERE id = 4002 OR (container_id = 64 AND slug = 'biggorons-sword-trading-sequence'));
-- Pocket Egg
INSERT INTO path_step (path_id, step_order, marker_id, submap_id, x, y, name, note, shown) SELECT 4002, 1, 64705039, NULL, NULL, NULL, NULL, NULL, 1 FROM DUAL WHERE EXISTS (SELECT 1 FROM path WHERE id = 4002) AND NOT EXISTS (SELECT 1 FROM path_step WHERE path_id = 4002 AND step_order = 1);
-- Cojiro
INSERT INTO path_step (path_id, step_order, marker_id, submap_id, x, y, name, note, shown) SELECT 4002, 2, 64705040, NULL, NULL, NULL, NULL, NULL, 1 FROM DUAL WHERE EXISTS (SELECT 1 FROM path WHERE id = 4002) AND NOT EXISTS (SELECT 1 FROM path_step WHERE path_id = 4002 AND step_order = 2);
-- Odd Mushroom
INSERT INTO path_step (path_id, step_order, marker_id, submap_id, x, y, name, note, shown) SELECT 4002, 3, 64705041, NULL, NULL, NULL, NULL, NULL, 1 FROM DUAL WHERE EXISTS (SELECT 1 FROM path WHERE id = 4002) AND NOT EXISTS (SELECT 1 FROM path_step WHERE path_id = 4002 AND step_order = 3);
-- Odd Poultice
INSERT INTO path_step (path_id, step_order, marker_id, submap_id, x, y, name, note, shown) SELECT 4002, 4, 64705042, NULL, NULL, NULL, NULL, NULL, 1 FROM DUAL WHERE EXISTS (SELECT 1 FROM path WHERE id = 4002) AND NOT EXISTS (SELECT 1 FROM path_step WHERE path_id = 4002 AND step_order = 4);
-- Poacher’s Saw
INSERT INTO path_step (path_id, step_order, marker_id, submap_id, x, y, name, note, shown) SELECT 4002, 5, 64705043, NULL, NULL, NULL, NULL, NULL, 1 FROM DUAL WHERE EXISTS (SELECT 1 FROM path WHERE id = 4002) AND NOT EXISTS (SELECT 1 FROM path_step WHERE path_id = 4002 AND step_order = 5);
-- Broken Goron’s Sword
INSERT INTO path_step (path_id, step_order, marker_id, submap_id, x, y, name, note, shown) SELECT 4002, 6, 64705044, NULL, NULL, NULL, NULL, NULL, 1 FROM DUAL WHERE EXISTS (SELECT 1 FROM path WHERE id = 4002) AND NOT EXISTS (SELECT 1 FROM path_step WHERE path_id = 4002 AND step_order = 6);
-- Prescription
INSERT INTO path_step (path_id, step_order, marker_id, submap_id, x, y, name, note, shown) SELECT 4002, 7, 64705045, NULL, NULL, NULL, NULL, NULL, 1 FROM DUAL WHERE EXISTS (SELECT 1 FROM path WHERE id = 4002) AND NOT EXISTS (SELECT 1 FROM path_step WHERE path_id = 4002 AND step_order = 7);
-- Eyeball Frog
INSERT INTO path_step (path_id, step_order, marker_id, submap_id, x, y, name, note, shown) SELECT 4002, 8, 64705046, NULL, NULL, NULL, NULL, NULL, 1 FROM DUAL WHERE EXISTS (SELECT 1 FROM path WHERE id = 4002) AND NOT EXISTS (SELECT 1 FROM path_step WHERE path_id = 4002 AND step_order = 8);
-- Specialty Eye Drops
INSERT INTO path_step (path_id, step_order, marker_id, submap_id, x, y, name, note, shown) SELECT 4002, 9, 64705047, NULL, NULL, NULL, NULL, NULL, 1 FROM DUAL WHERE EXISTS (SELECT 1 FROM path WHERE id = 4002) AND NOT EXISTS (SELECT 1 FROM path_step WHERE path_id = 4002 AND step_order = 9);
-- Biggoron Receipt
INSERT INTO path_step (path_id, step_order, marker_id, submap_id, x, y, name, note, shown) SELECT 4002, 10, 64705048, NULL, NULL, NULL, NULL, NULL, 1 FROM DUAL WHERE EXISTS (SELECT 1 FROM path WHERE id = 4002) AND NOT EXISTS (SELECT 1 FROM path_step WHERE path_id = 4002 AND step_order = 10);
-- Biggoron’s Sword
INSERT INTO path_step (path_id, step_order, marker_id, submap_id, x, y, name, note, shown) SELECT 4002, 11, 64705014, NULL, NULL, NULL, NULL, NULL, 1 FROM DUAL WHERE EXISTS (SELECT 1 FROM path WHERE id = 4002) AND NOT EXISTS (SELECT 1 FROM path_step WHERE path_id = 4002 AND step_order = 11);
INSERT INTO path_revision (path_id, user_id, action, summary, snapshot) SELECT 4002, 15, 'create', 'Created the path', JSON_SET('{"name":"Biggoron''s Sword Trading Sequence","description":"Trade your way from the Cucco Lady''s Pocket Egg to Biggoron''s Sword, the strongest sword in the game.\\n\\nBefore you start, you''ll need to be Adult Link and get Epona back from Lon Lon Ranch.","kind":"guide","loops":false,"numbered":true,"smooth":false,"alwaysShow":true,"categoryId":0,"color":"#e3b341","scope":"official","visibility":"public","editAccess":"editors","publishedAt":null,"published":true,"steps":[{"markerId":64705039},{"markerId":64705040},{"markerId":64705041},{"markerId":64705042},{"markerId":64705043},{"markerId":64705044},{"markerId":64705045},{"markerId":64705046},{"markerId":64705047},{"markerId":64705048},{"markerId":64705014}]}', '$.categoryId', (SELECT category_id FROM path WHERE id = 4002)) FROM DUAL WHERE EXISTS (SELECT 1 FROM path WHERE id = 4002) AND NOT EXISTS (SELECT 1 FROM path_revision WHERE path_id = 4002);
