# Breath of the Wild: place names and regions

BotW's place names and tower regions come from the game's own data, as the
ZeldaMods community extracted it for their object map
([objmap.zeldamods.org](https://objmap.zeldamods.org),
[github.com/zeldamods/objmap](https://github.com/zeldamods/objmap)).

- **Place names:** 622 label markers, from the game's `Location.mubin`, in the
  four label categories TotK uses:
  - Region Labels: 8 (Hebra, Eldin, Central Hyrule…);
  - Area Labels: 24;
  - Places Labels: 483;
  - Places Labels - Close: 107.

  They're ordinary markers, so they can be edited on the site. Each keeps its
  source in `game_data` (`{"source":"BotW LocationMarker","messageId":…}`),
  so real game data can replace them later.
- **Regions:** the 15 tower regions, from `MapTower`, as polygons in the
  `map_region` table. `get_map` sends each submap's regions. They give:
  - an area page per region (`?area=hebra-tower-region`), listing the
    markers inside its borders;
  - the region a marker is in (`getMarkerAreaName`), used by search;
  - the region's outline while its page is open, and every region's when
    **Show Region Borders** is on in Settings.

- **Named areas:** the game's own area borders (`FieldMapArea` with
  `area_data`), 23 of them ("West Necluda", "Hyrule Field"…), in the same
  table with `kind = 'area'` (tower regions are `kind = 'tower'`). Each gives
  its border to the "Area Labels" name of the same name, so that name's page
  lists exactly the markers inside it, and the marker's area pill and search
  line come from the border it's in. The game puts the Great Plateau inside
  Hyrule Field.

All of it arrives by migration, and the site works without any of it: no
labels, no regions, no area borders.

## Tears of the Kingdom

TotK's place names were already on the site (696 names; the game's main map
has 692). From [objmap-totk](https://github.com/zeldamods/objmap-totk)'s game
files it gets, by the same area-borders migration:

- the Surface's 15 Skyview Tower regions ("Lookout Landing Skyview Tower
  Region", pill "Lookout Landing");
- 23 named areas on each of the Surface, Sky and Depths. The Surface's match
  its "Area Labels" names. The Sky's and Depths' ("Eldin Mountains Sky")
  have no names on the map (the Sky's area names are archipelagos), so they
  get pages of their own; their pills drop "Sky" or "Depths".

TotK's site coordinates are the game's: `x = X`, `y = −Z`.

## Coordinates

The game's X and Z map onto the site's BotW map exactly:
`x = X / 64 + 128`, `y = −Z / 64 − 128`. This puts all 15 towers on the
site's existing tower markers.

## Regenerating

Only needed if the source data or the import changes.

1. Download the three files, each keeping its path, into an empty folder:

   ```sh
   mkdir -p botw/map_summary/MainField botw/text/StaticMsg botw/ecosystem
   curl -o botw/map_summary/MainField/static.json https://objmap.zeldamods.org/game_files/map_summary/MainField/static.json
   curl -o botw/text/StaticMsg/LocationMarker.json https://objmap.zeldamods.org/game_files/text/StaticMsg/LocationMarker.json
   curl -o botw/ecosystem/MapTower.json https://objmap.zeldamods.org/game_files/ecosystem/MapTower.json
   ```

2. Rewrite the two migrations:

   ```sh
   node dev/assets/botw/labels-and-regions.cjs botw
   ```

   The region borders are simplified to within 2 game units (4 pixels at
   the deepest zoom), about 12,700 points in all.

3. Run the tests (`npm test`; `tests/botw-regions.test.js` checks every
   tower lands in its own region).

For the area borders, also download BotW's `ecosystem/FieldMapArea.json`
and `ecosystem/area_data.json`, and objmap-totk's `public/game_files`
(`ecosystem/MapTower.json`, `Ground.json`, `Sky.json`, `MinusField.json`,
`area_data.json`, `map_summary/MainField/static.json`,
`text/StaticMsg/LocationMarker.json`), then:

```sh
node dev/assets/area-borders.cjs botw totk
```

Borders are simplified to within 6 (BotW) or 8 (TotK) game units, about
9,500 points per map, so `get_map` stays around 40 KB compressed per map.

A migration that has already run won't run again, so a changed import needs
new migration files (new timestamps) rather than edits to these.
