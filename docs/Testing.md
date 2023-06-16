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
  - Account:
    - Login works, and cookie/session kept upon page refresh, immediately, and after a day.
  - Aesthetic/Styles:
    - Retain custom fonts in layers control, map region labels, maybe even for all text.
      - The default Helvetica seems to be larger and sharper, by itself, or by a combination of the other font properties we assign to text from our custom stylesheet.
    - Retain the background, but not sure what this meant.
      - Image? Don't see one behind the map layers tiles.
      - For the layers, and other controls, they all seemed to retain the same level of transparency and black coloring.
        - For reference in better determining the nature of this test, the change was fixed by `9fe17b03d1a2174275b39cdb4d73d9cf82a076ac` from the problem caused in `1602b6bee5f1bdebad51e4901d5efa649c86aaa6`.
  - Search:
    - Some results.
      - Has unit tests, but also a search typically returns about 50 +- 25 depending on query.
      - Not around 5 or 500.
      - Document more unique situations in the unit tests.
  - Add marker
    - Can't quite test the GUI yet personally from tinymce/tiny.cloud network error, so cover at least in the API section for now.
