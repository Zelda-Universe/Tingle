## Automated

### Unit

Just added Jest.  Similar to Jasmine.
`npm/yarn test [--notify]`
A bit hesitant to add a lot, since the project can still change significantly, and don't want to take time/focus from feature development and problem fixing.
Mostly just focus on the complex areas where there can be that, and many expectations to be forgotten like Search and some Changelog handling.

### Integration

Still Unimplemented.
Could help automate tests from the manual section.
Something explanatory like Cucumber?
Driven by an engine that control a browser as a user would, visually or by parsing, whether we can see it or not, as long as it allows interactivity/JavaScript.  Selenium?

## Manual
- Production settings:
  - minify: true
  - When any setting is missing, make sure it uses an appropriately private default, and does not break.
- Backend/API
  - Each endpoint returns appropriate data.
    - No PHP errors that fill the JSON object's message property.
- Responsive mode:
  - Pull up/open drawer and close/down easily (touch events).
- Features:
  * Accessibility
    - Supports different GUI structure in mobile or other small screen formats.
      - Vertical design, search field at the top, map control at the bottom, that slides up to use.
    - Areas could use improvement, where colors are the only indicator, when changing symbols/shapes, or otherwise could also be used.
  * Account:
    - Shown in map control after clicking associated button.
    - Fields and button to login with username/email, and password.
      - With checkbox to allow persisting the authenticated state,
      - and links to reset account password, or conduct initial registration.
    - Login works, and cookie/session kept upon page refresh, immediately, and after at least a day.
      - API/back-end code shows expiration set to 30 days.
  * Aesthetic/Styles:
    - Retain custom fonts in layers control, map region labels, maybe even for all text.
      - The default Helvetica seems to be larger and sharper, by itself, or by a combination of the other font properties we assign to text from our custom stylesheet.
    - Retain the background, but not sure what this meant.
      - Image? Don't see one behind the map layers tiles.
      - For the layers, and other controls, they all seemed to retain the same level of transparency and black coloring.
        - For reference in better determining the nature of this test, the change was fixed by `9fe17b03d1a2174275b39cdb4d73d9cf82a076ac` from the problem caused in `1602b6bee5f1bdebad51e4901d5efa649c86aaa6`.
  * Configuration
    - Various settings retrieved from default code values, database game/container settings, cookies, and local storage, and URL query parameters, when accessed in the code.
      - May not support hash parameters yet.
    - No GUI yet, only using native browser 
    - Check `ZConfig` for the list, as defaults are recommended to be provided there.
  * Map Control GUI Component:
    - A.K.A. the Category/Map/Games Selector, and main GUI application control.
      - Also presents account management, search results, and marker selection controls and information.
    - Expanded by default.
    - Shows application logo, and switch game and maps buttons.
    - Shows account management area button in the top left corner.
    - Shows button to toggle presence of completed markers.
    - Category selection
      - Simple `flat` flow list presentation.
        - Overflow scrolls vertically.
      - Default, unconfigured, loads all category buttons and markers enabled, but this automatic/`focus` mode shows markers depending on zoom level.
      - Parent category selection is not tested/supported currently I believe.
      - The other `exact` mode by default nothing is enabled.
        - For this mode, there is no automatic behavior when all or none are selected.
          - Only controlling the categories by explicit user interaction.
          - There should only still present the parent-child category automated handling, if supported.
      - Can now also be configured with specific choices, affecting category button states and markers appropriately.
    - Games selection
      - Shows icon buttons.
      - Item selection causes new page navigation to load the newly selected game/container.
      - Does not allow current game/container switch execution.
        - Shows as toggled off, and disabled, without being able to toggle it on.
    - Maps selection
      - Shows map image rectangle buttons.
      - Item selection changes map layer, and could either disable the new current button, and re-enable the old one, or reset the content area back to category selection, or both, since the menu is only built once per page load.
      - Does not allow current map layer switch execution.
        - Shows as toggled off, and disabled, without being able to toggle it on.
    - Switching content in this component should be able to revert to the default category content, after clicking the back arrow in the top left corner of the content area, or pressing the Escape key.
      - Examples include from showing a search results list, the account management area, other available games and maps list, or marker details.
    - Can be minimized by pressing the inward arrows in the top right corner, when configured, default disabled, or pressing the Escape key, after search results and input field is cleared, to be represented by a single logo with slightly transparent background.
    - Can also be disabled completely, and not shown at all.
    - Resizes to ~90% screen height, but only what is detected on page load.
  * Map Area/Layer
    - Tiles loaded from central, public server.
    - No error/missing/unknown tile placeholder?
    - Ability to load locally, or anywhere, with configuration.
    - Explicit viewing parameters can be configured and used.
      - Automatically updates URL so this can be used later.
  * Other GUI components / Leaflet controls
    - Current mouse coords in the bottom right corner.
    - Zoom buttons in the bottom right corner.
    - Other investigative tools are also available.
  * Markers:
    - Present as icons on the map.
    - Can be selected to show details in the main map control component.
      - Name, description(?), and buttons to mark complete, copy link, and copy embed link.
      - Mobile control view opens by a small amount.
    - Can also be set to completed by right-clicking the icon in the map view area.
      - Shows overlaid check mark, when visible.
    - Visibility not only limited by category selection, or the automatic viewing mode requiring a comfortable zoom level, but also it's completed state preference from the user, and the map viewing area's current bounds, to help with performance.
    - Adding:
      - Can't quite test the GUI yet personally from tinymce/tiny.cloud network error, so cover at least in the API section for now.
  * Marketing
    - Automated advertisements overlaid the screen.
      - Should be less than 20% of the available screen area.
  * Search:
    - Shows at the top of the map control.
      - With:
        - an input field,
        - magnifying glass icon to the left there,
        - and background game/container name/title text.
    - Some results, not too many.
      - Has unit tests, but also a search typically returns about 50 +- 25 depending on query.
        - Not around 5 or 500.
        - Document more unique situations in the unit tests.
    - If not configured, be sure to check the more complete search mode, showing icons and search confidence bars and numeric values, over the icon, and to the bottom right of each entry respectively.
    - Clear the input field with the `x` symbol to the right there, or pressing the Escape Key, after clearing the content area showing search results with global focus, or before such with local focus.
