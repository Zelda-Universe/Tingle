-- Puts back the three trading items' old names, with their history entries.
DELETE FROM marker_revision WHERE marker_id = 64705042 AND user_id = 15 AND action = 'edit' AND summary = 'Renamed to the remake''s name, Odd Poultice';
UPDATE marker SET name = 'Odd Potion' WHERE id = 64705042 AND name = 'Odd Poultice';
DELETE FROM marker_revision WHERE marker_id = 64705047 AND user_id = 15 AND action = 'edit' AND summary = 'Renamed to the remake''s name, Specialty Eye Drops';
UPDATE marker SET name = 'World’s Finest Eye Drops' WHERE id = 64705047 AND name = 'Specialty Eye Drops';
DELETE FROM marker_revision WHERE marker_id = 64705048 AND user_id = 15 AND action = 'edit' AND summary = 'Renamed to the remake''s name, Biggoron Receipt';
UPDATE marker SET name = 'Claim Check' WHERE id = 64705048 AND name = 'Biggoron Receipt';
