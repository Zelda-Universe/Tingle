-- Admin's feature graphs count completes by date; 66 million rows with no
-- index on complete_date made every count a full scan. Online in InnoDB;
-- a few minutes on production.
ALTER TABLE `user_completed_marker`
  ADD INDEX IF NOT EXISTS `index_user_completed_marker_on_complete_date` (`complete_date`),
  ALGORITHM=INPLACE, LOCK=NONE;
