# https://stackoverflow.com/questions/48659937/remove-rows-in-migration-rails-way
# Can't use Rails classes to add or remove data for this project that includes
# minimal libraries from that package, so just use raw SQL then.

class ChangelogAddRevised06AndNew07 < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      DELETE FROM `changelog`
      WHERE
      	`version_major` = 0 AND
        `version_minor` = 6 AND
        `version_patch` = 0
      ;
    SQL
    execute <<-SQL
      INSERT INTO `changelog` (
        `version_major`,
        `version_minor`,
        `version_patch`,
        `content`
        )
      VALUES
        (0,6,0,'New logo by the Zelda Universe design team!'),
        (0,6,0,'Added Login/Account button'),
        (0,6,0,'Added Lost Password and Change Password functionality'),
        (0,6,0,'Added search with live results, category icons, relevancy indicators, jump-to navigation, auto-focus, and quick clear!'),
        (0,6,0,'Removed button to collapse the sidebar on desktop in favor of hotkey (esc)'),
        (0,6,0,'Made marker completion hotkeys more intelligent per-OS'),
        (0,6,0,'Lots of small interface improvements'),
        (0,6,0,'Internal prep work and documentation for the upcoming Zelda Maps open source project'),
        (0,7,0,'<b>Multi-game support with Link\\\'s Awakening:</b> More maps for more Zelda games are on the way.'),
        (0,7,0,'<b>Sub-map support:</b> Sub-maps cover areas like dungeons. You can view a list of all sub-maps for a given game by clicking on \"Switch Maps\". For LA, we\\\'ve got maps for every dungeon. We\\\'re looking into ways to incorporate sub-maps into the Breath of the Wild side of things, too.'),
        (0,7,0,'<b>Reset completed markers:</b> You can now reset your completed marker progress from your account settings. Super useful if you\\\'re starting a new run.'),
        (0,7,0,'<b>Category completion progress:</b> Hovering over marker categories will now show you how many markers you\\\'ve completed out of the category total.'),
        (0,7,0,'<b>Embed codes for markers:</b> In addition to being able to get a permalink for each marker, you can now get an iframe embed code. Embeds show a nice zoomed in view of the selected marker.')
      ;
    SQL
  end
  
  def down
    execute <<-SQL
      DELETE FROM `changelog`
      WHERE
      	`version_major` = 0 AND
        (`version_minor` = 6 OR `version_minor` = 7) AND
        `version_patch` = 0
      ;
    SQL
    execute <<-SQL
      INSERT INTO `changelog` (
        `version_major`,
        `version_minor`,
        `version_patch`,
        `content`
        )
      VALUES
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
end
