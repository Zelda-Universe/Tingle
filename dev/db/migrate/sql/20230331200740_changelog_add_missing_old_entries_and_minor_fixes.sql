UPDATE `changelog` SET `content` = '1400+ new markers! This time we added Treasure Chests (with contents), Blupees, Goddess Statues, Memories, Diaries & Books, and Cooking Pots. These markers were extracted from the game files and their position are considered final, along with Koroks, Shrines, Towers, Villages, Stables, Great Fairies!' WHERE `id` = '11';
UPDATE `changelog` SET `content` = 'You can now select multiple categories at the same time.' WHERE `id` = '13';

INSERT INTO `changelog` VALUES (18,0,6,0,'Added login button for more obvious accessibility.');
INSERT INTO `changelog` VALUES (19,0,6,0,'Incremental search with type icons, visual and textual relevancy, jump-to navigation, auto-focus, and quick clear!\nWatch out, the first release of this may be wonky.\nMobile gets a separate-looking search bar.');
INSERT INTO `changelog` VALUES (20,0,6,0,'Slippery fast \'Escape\' hotkey now works for clearing the drawer and toggling its presence.\nThe undo marker completion hotkey was updated to be more intelligent per-OS.');
INSERT INTO `changelog` VALUES (21,0,6,0,'More account features such as recovering a lost password through a reset email, and changing an existing password.');
INSERT INTO `changelog` VALUES (22,0,6,0,'Able to set a starting area to focus the map on page load!\nDynamic controls available upon request to help identify the intended coordinates.\nAlso comes with some new configurable zoom parameters for snap enforcement and change interval amount.');
INSERT INTO `changelog` VALUES (23,0,6,0,'Made top drawer buttons have a larger link area and with highlighting background for representing the current state.');
INSERT INTO `changelog` VALUES (24,0,6,0,'Stylistic updates to more closely match final vision.');
INSERT INTO `changelog` VALUES (25,0,6,0,'A lot of internal system, documentation, and tooling updates!!');
