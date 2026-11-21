-- The merged enemy markers shown again, and the completions copied from them gone.

DELETE u FROM user_completed_marker u JOIN marker_merge_backup b ON b.user_id = u.user_id AND b.marker_id = u.marker_id;
DELETE FROM marker_merge_backup;
DELETE FROM marker_revision WHERE marker_id = 40 AND user_id = 15 AND action = 'edit' AND summary = 'Hidden: the same as #19611178, which has its completions';
DELETE FROM marker_revision WHERE marker_id = 49 AND user_id = 15 AND action = 'edit' AND summary = 'Hidden: the same as #19611160, which has its completions';
DELETE FROM marker_revision WHERE marker_id = 234 AND user_id = 15 AND action = 'edit' AND summary = 'Hidden: the same as #19611182, #19611186, which have its completions';
DELETE FROM marker_revision WHERE marker_id = 235 AND user_id = 15 AND action = 'edit' AND summary = 'Hidden: the same as #19611198, #19611196, which have its completions';
DELETE FROM marker_revision WHERE marker_id = 368 AND user_id = 15 AND action = 'edit' AND summary = 'Hidden: the same as #19613264, which has its completions';
DELETE FROM marker_revision WHERE marker_id = 369 AND user_id = 15 AND action = 'edit' AND summary = 'Hidden: the same as #19613245, #19613251, #19613252, #19613263, #19613268, #19613269, which have its completions';
DELETE FROM marker_revision WHERE marker_id = 370 AND user_id = 15 AND action = 'edit' AND summary = 'Hidden: the same as #19613238, #19613243, #19613255, #19613258, #19613271, which have its completions';
DELETE FROM marker_revision WHERE marker_id = 254 AND user_id = 15 AND action = 'edit' AND summary = 'Hidden: the same as #4370, which has its completions';
DELETE FROM marker_revision WHERE marker_id = 474 AND user_id = 15 AND action = 'edit' AND summary = 'Hidden: the same as #4372, which has its completions';
UPDATE marker SET visible = 1 WHERE id IN (40, 49, 234, 235, 368, 369, 370, 254, 474) AND visible = 0;
