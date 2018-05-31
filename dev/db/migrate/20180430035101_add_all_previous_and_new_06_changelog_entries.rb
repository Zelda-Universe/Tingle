class AddAllPreviousAndNew06ChangelogEntries < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      INSERT INTO `changelog` (
        `version_major`,
        `version_minor`,
        `version_patch`,
        `content`
        )
      VALUES
        (0, 0, 0, 'The fabled start of the project!'),
        (0, 0, 1, 'Finally, an app to work with :).'),
        (0, 2, 0, 'You can now add your own markers! Right click on the map and log in / create an account to start adding (best suited for desktop).'),
        (0, 2, 0, 'Optimizations for mobile devices.'),
        (0, 2, 0, 'Tons of new markers everyday!'),
        (0, 3, 0, 'Mark as complete! You can now right-click a marker (desktop only) to hide a marker indefinitely. You can undo this by using ctrl + z in case of a mistake. This shall help you in the quest to get all koroks, making it much easier to see what you\\\'re missing. This feature uses cookies, so please don\\\'t clean it.'),
        (0, 3, 0, 'Don\\\'t show this again has been fixed. Sorry if you read the intro everytime :).'),
        (0, 3, 0, '(Admins only) Ability to draw lines and polygons. Soon, we will have paths for Koroks, side-quests, etc.'),
        (0, 3, 0, 'The following markers were extracted from the game files and their position are considered final: Koroks, Shrines, Towers, Villages, Stables, Great Fairies! More to come...'),
        (0, 4, 0, 'Remember to right-click (Desktop) or long press (Mobile) to set a marker as complete!'),
        (0, 4, 0, '1400+ new markers! This time we added Treasure Chests (with contents), Blupees, Goddess Statues, Memories, Diaries & Books and Cooking Pots. These markers were extracted from the game files and their position are considered final, along with Koroks, Shrines, Towers, Villages, Stables, Great Fairies!'),
        (0, 5, 0, 'Completed markers are tied to your account!'),
        (0, 5, 0, 'You can now select multiple categories at the same type.'),
        (0, 5, 0, 'The top left box can now be collapsed.'),
        (0, 5, 0, 'Marker clustering has been disabled (experimental?).'),
        (0, 5, 0, 'Markers now show up according to zoom.'),
        (0, 5, 0, 'Usability fixes and improvements all over the place.'),
        (0, 6, 0, 'Added login button for more obvious accessibility.'),
        (0, 6, 0, 'Incremental search with type icons, visual and textual relevancy, jump-to navigation, auto-focus, and quick clear!\nWatch out, the first release of this may be wonky.\nMobile gets a separate-looking search bar.'),
        (0, 6, 0, 'Slippery fast \\\'Escape\\\' hotkey now works for clearing the drawer and toggling its presence.\nThe undo marker completion hotkey was updated to be more intelligent per-OS.'),
        (0, 6, 0, 'More account features such as recovering a lost password through a reset email, and changing an existing password.'),
        (0, 6, 0, 'Able to set a starting area to focus the map on page load!\nDynamic controls available upon request to help identify the intended coordinates.\nAlso comes with some new configurable zoom parameters for snap enforcement and change interval amount.'),
        (0, 6, 0, 'Made top drawer buttons have a larger link area and with highlighting background for representing the current state.'),
        (0, 6, 0, 'Stylistic updates to more closely match final vision.'),
        (0, 6, 0, 'A lot of internal system, documentation, and tooling updates!!')
      ;
    SQL
  end

  def down
    execute 'TRUNCATE `changelog`;'
  end
end
