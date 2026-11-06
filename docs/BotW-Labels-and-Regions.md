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

Both arrive by migration, and the site works without either: no labels, or
no regions.

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

A migration that has already run won't run again, so a changed import needs
new migration files (new timestamps) rather than edits to these.
