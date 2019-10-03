Backend API in `.env`.  Should be self-explanatory.

Map Viewer URL-only Query Parameters:
- game: `string`, default: `BotW`
- map: `integer`, default: `null`
- submap: `integer`, default: `null`
- marker: `integer`, default: `null`

- zoom: `integer`, default: `<container defaultZoom setting>`, `4`
- zoomSnap: `integer`, default: `1`
- zoomDelta: `integer`, default: `1`
- x (centerX): `integer`, default: `<container centerX setting>`
- y (centerY): `integer`, default: `<container centerY setting>`
- startArea: `<integer>,<integer>,<integer>,<integer>`, default: `-168,102,-148,122`

- showMapControl: `boolean`, default: `<container setting>`
- collapsed: `boolean`, default: `<is mobile>`
- showCategoryControl: `boolean`, default: `true`
- showCategoryControlOpened: `boolean`, default: `<isCategoryOpen>`
- showZoomControl: `boolean`, default: `<container setting>`
- showInfoControls: `boolean`, default: `<container showInfoControls setting>`
- hideOthers: `boolean`, default: `false`
- hidePin: `boolean`, default: `false`

- bgColor: `CSS color`, default: `<container bgColor setting>`
- help: `boolean`, default: `true`

Map Viewer Cookie-only Settings:
- isCategoryOpen: `boolean`, default: `true`
  - Affects showCategoryControlOpened.
- showCompleted: `boolean`, default: `true`
- completedMarkers: `[integer, ...]`, default: `null`

Map Viewer General Settings:
- categorySelectionMethod: `[exact, focus]`, default: `focus`

- tilesBaseURL: `string`, default: `https://zeldamaps.com/tiles/`
- zoomDirectories: `boolean`, default: `false`
- tileNameFormat: `boolean`, default: `{z}_{x}_{y}`/`{z}/{x}_{y}`

These can be configured via:
- URL-only Query Parameters
- Local Storage
- Cookie
