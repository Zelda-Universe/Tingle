Backend API in `.env`.  Should be self-explanatory.

Map Viewer URL-only Query Parameters:
- game `string`
- map `integer`
- submap `integer`
- marker `integer`

- zoom `integer`
- zoomSnap `integer`
- zoomDelta `integer`
- x `integer`
- y `integer`
- startArea `<integer>,<integer>,<integer>,<integer>`

- showMapControl `boolean`
- collapsed `boolean`
- showCategoryControlOpened `boolean`
- showZoomControl `boolean`

- bgColor `CSS color`
- help `boolean`

Map Viewer General Settings:
- categorySelectionMethod `[exact, focus]``

These can be configured via:
- URL-only Query Parameters
- Local Storage
- Cookie