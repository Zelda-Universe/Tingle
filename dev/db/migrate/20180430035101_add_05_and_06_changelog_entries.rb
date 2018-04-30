class Add05And06ChangelogEntries < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      INSERT INTO `changelog` (
        `id`,
        `version_major`,
        `version_minor`,
        `version_patch`,
        `content`
        )
      VALUES
        (1, 0, 5, 0, 'Completed markers are tied to your account!'),
        (2, 0, 5, 0, 'You can now select multiple categories at the same type.'),
        (3, 0, 5, 0, 'The top left box can now be collapsed.'),
        (4, 0, 5, 0, 'Marker clustering has been disabled (experimental?).'),
        (5, 0, 5, 0, 'Markers now show up according to zoom.'),
        (6, 0, 5, 0, 'Usability fixes and improvements all over the place.'),
        (7, 0, 6, 0, 'Added login button for more obvious accessibility.'),
        (8, 0, 6, 0, 'Search with type icons, visual and textual relevancy, jump-to navigation, auto-focus, and quick clear!\nWatch out, the first release of this may be wonky.\nMobile gets a separate-looking search bar.'),
        (9, 0, 6, 0, 'Slippery fast \\\'Escape\\\' hotkey now works for clearing the drawer and toggling its presence.\nThe undo marker completion hotkey was updated to be more intelligent per-OS.'),
        (10, 0, 6, 0, 'More account features such as recovering a lost password through a reset email, and changing an existing password.'),
        (11, 0, 6, 0, 'Able to set a starting area to focus the map on page load!\nDynamic controls available upon request to help identify the intended coordinates.\nAlso comes with some new configurable zoom parameters for snap enforcement and change interval amount.'),
        (12, 0, 6, 0, 'Made top drawer buttons have a larger link area and with highlighting background for representing the current state.'),
        (13, 0, 6, 0, 'A lot of internal system, documentation, and tooling updates!!')
      ;
    SQL
  end

  def down
    execute 'TRUNCATE `changelog`;'
  end
end
