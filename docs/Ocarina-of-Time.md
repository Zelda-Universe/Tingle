# Ocarina of Time (2026)

The OoT remake is in the database like every other game: container 64,
short name `OoTR` (`OoT` is the old N64 map, container 5, hidden). Its map
tiles are in `tiles/oot/`, built by `dev/assets/oot/import-assets.cjs`.

- **IDs never change:** completions, bookmarks and shared links use them.
  Maps 64022–64031 (dungeons) and 65000 (Hyrule); submaps 64xxxx, Hyrule
  Child 650000 and Adult 650001. Markers: 641xxxxx Heart Pieces, 642xxxxx
  Gold Skulltulas, 643xxxxx Big Poes, 6440xxxx/6441xxxx place names (Child,
  Adult), 645xxxxx treasure chests, 646xxxxx shops, fountains, minigames,
  NPCs and boss doors.
- `map.kind` (`world` or `dungeon`) makes each submap (age, floor, water
  level, room state) its own layer, chosen with the floor and age switch
  (`scripts/controls/OotFloors.js`). `submap.tile_version` versions tile
  addresses; `submap.connections` holds Hyrule's connector lines.
- Wherever code needs to know it's the remake, it uses `isOcarina()` (in
  `scripts/util/general.js` and `lib/common/game_order.php`), which accepts
  `OoTR`, `OoT` and `64`. Offline downloads still call it `OoT`.

## Where positions come from

Markers are placed from the game's own data, converted exactly onto our
artwork by `dev/assets/oot/game-to-map.cjs`:

1. Each field area's full map texture (2000×1440) covers a fixed rectangle of
   game coordinates (`scene-data/field-map-bounds.json`, from zeldamods' Owl
   Object Map, https://objmap-oot.zeldamods.org).
2. Our Hyrule artwork is built from the minimap textures (`Mini_*.png`), each
   the full texture shrunk to its width and centred in a square:
   `mini = (full + [0, 280]) × miniWidth / 2000`.
3. `compose-world.cjs` trims each minimap and places it in its box
   (`world-boxes.json`, from `world-layout.json`); map units are canvas
   pixels / 32.

Dungeon floors are simpler: each floor's tiles are its full texture, centred
on a 2048px square, and a dungeon's floors share one game rectangle
(`scene-data/dungeon-map-bounds.json`). Map units are pixels / 8. The game
numbers floors 0 = 1F, −1 = B1.

The game data is in `dev/assets/oot/scene-data/` (from
https://github.com/MrCheeze/oot-switch2-tools; see its README):
`map-points.json` holds the game's map icons (`MapParam`: Heart Pieces,
Gold Skulltulas, chests, facilities, entrances) and `actors.json` placed
actors such as Big Poes.

## Changing markers

Markers are database rows: edit them on the site, or for a batch, write a
migration. The generators in `dev/assets/oot/` show how; each writes a guarded
migration (it only changes a row that is still as it was) and its undo:

- `compare-collectibles.cjs` / `collectibles-to-sql.cjs`: collectible
  positions. Dungeon Gold Skulltulas are matched by hand in
  `scene-data/dungeon-skulltula-matches.json`, with reasons.
- `compare-connections.cjs` / `connections-to-sql.cjs`: connector ends, on
  the game's exits (`scene-data/lost-woods-exits.json` names the Lost Woods').
- `places-to-sql.cjs`: chests (contents in `scene-data/chest-contents.json`)
  and the places in `scene-data/facility-names.json`.
- `extract-items.cjs <radar scene audit.json> <oot-switch2-tools directory>`
  audits chest objects, equipment shop stock and verified event rewards.
  `items-to-sql.cjs maps.json markers.json <new migration>` splits existing
  chests by contents without changing IDs, and adds missing item sources.
  Allocations are in `item-ids.json` (64704xxx chests, 64705xxx rewards/stock).
  `item-import-report.json` records unplaced items; never silently treat an
  unmapped dungeon as the overworld. Important off-map rewards explicitly
  use an entrance reference. Starting equipment/hatching items are not
  invented as independent geographic pickups.
- `fetch-objects.cjs` / `objects-to-sql.cjs --only=bottle`: placed objects
  and verified bottle rewards. Never regenerate an already shipped migration.
- `extract-songs.cjs <oot-switch2-tools directory>` extracts song lesson
  anchors/cutscene positions to `scene-data/song-sources.json`.
  `guidance-to-sql.cjs maps.json <new migration>` imports those and
  `HrlField_Note_*` Fairy Thoughts. `guidance-ids.json` preserves allocated
  IDs (64702xxx Thoughts, 64703xxx songs). Interior lessons/Thoughts without
  artwork are explicitly marked at their mapped entrances.
- Fairy Thoughts are **not** `Obj_FairySpirit` healing spawns. The Zelda
  Notes localization (`notes-default_oot/en-US.json`, `OotGossipResearch`)
  lists 100 Gossip Quests (60 Actor, 40 Stone). These are separate from
  ordinary Gossip Stones. Localization gives names/hints but no target
  coordinates; do not import NPC `InterestSpotActor` schedule stops as
  Gossip Quest targets or invent exact positions from the names.
- `preview-collectibles.cjs` draws comparisons on the artwork for review.

These read the site's own data saved to files, for example:

```
curl -s 'http://localhost:8080/ajax.php?command=get_markers&game=64' > markers.json
curl -s 'http://localhost:8080/ajax.php?command=get_map&game=64' > maps.json
node dev/assets/oot/compare-collectibles.cjs markers.json maps.json
```

Markers' game data records which game record they are (`gameId`,
`gameRecord`), so later imports can find them.

## Changing the artwork

```
node dev/assets/oot/import-assets.cjs /path/to/oot-dump
```

It builds the tiles for every dungeon floor and for Hyrule (composed by
`compose-world.cjs` from `world-layout.json`), the Switch Map thumbnails
(`images/icons/oot/<folder>/icon.webp`), and `tile-report.json`. Textures
already built from the same file are skipped. Different versions of sharp
compose Hyrule slightly differently, so check what it rebuilt before
committing. When a texture changes, its submap's `tile_version` (the first 16
characters of its SHA-256 in `tile-report.json`) needs a migration.

Moving an area in `world-layout.json` moves its artwork: the Hyrule markers
in that area, its place name and border (`map_region`), and the connector
ends all need moving with it, and `minimap-textures.json` and the game
conversion depend on `world-boxes.json`. Re-run the comparisons above
afterwards.
# Higher-quality map artwork (November 2026)

The new `oot/maps/*.webp` dump uses cropped canvases at approximately 1.5×
the original full textures. Do not replace or re-trim existing maps directly:
doing so breaks the calibrated marker positions. The upgrade pipeline is:

1. `python align-map-upgrade.py <dump> <audit.json>` (OpenCV + NumPy).
2. `python prepare-map-upgrade.py <dump> <audit.json> <prepared-folder>`
   (also requires Pillow).
3. `OOT_TILE_PREFIX=oot/hq-v1/ node import-assets.cjs <prepared-folder>`
   (requires Sharp; `SHARP_MODULE` can select an isolated installation).

These scripts live in `dev/assets/oot/`. Hyrule is composed into the unchanged
`world-boxes.json` layout. Existing dungeon art is registered to its original
2000×1440 canvas, then placed on a 4096-square pyramid at twice the old pixel
resolution. This raises native zoom from 3 to 4 without moving map coordinates.
Floor Back images are registered into that same frame and combined beneath
each active floor. Existing marker positions and calibration files are untouched.
The supplied paper texture (`images/oot-map-paper.png`) replaces the flat
brown fill during preparation. Hyrule's paper bounds are widened symmetrically
at the source aspect ratio, preserving the full torn edges without moving the
regions; dungeon paper is center-cropped (not stretched) to a square.
The separately registered `_All` texture supplies each dungeon's enclosing
silhouette beneath the floor Back images. It is baked underneath the artwork and
shared silhouettes, so it pans, zooms, and downloads offline with the map.
New dungeon silhouettes use the measured floor origins in
`scene-data/dungeon-silhouette-registration.json`; do not center their crops,
because the outline's extra margins are asymmetric. Pass a comma-separated
dungeon list as the optional fourth preparation argument to rebuild only those
dungeons while retaining the other prepared maps.
`hq-alignment.json` records the transforms and image-matching residuals. Lost
Woods and Haunted Wasteland lack enough reliable texture features: their crops
use alpha-extent centering at the measured 2/3 scale, rather than claiming a
feature-verified alignment.

World boxes define alignment, not clipping rectangles. Each replacement is
rendered into the bounds of its complete transformed canvas, including artwork
outside the old Mini texture trim. The preparation step rejects dungeon images
whose nontransparent bounds would fall outside the tile canvas.

Gerudo Proving Grounds is map 64032, with submaps 640120–640123. Its supplied
floor canvases match, so they share a centered coordinate frame. The marker
projection is in `gerudo-proving-projection.cjs`: eight measured door landmarks
fit the source image, with four independent doors (including 2F) agreeing within
3 source-image pixels. This is a landmark fit, not an authoritative game texture
rectangle. `gerudo-proving-source.json` retains all 917 Radar objects and the
game's MapParam floor data. `gerudo-proving-to-sql.cjs` imports 22 mapped chests,
20 Silver Rupees and Pierre, using MapParam's exact chest positions and floor
membership. IDs 64706001–64706043 are recorded in `gerudo-proving-import.json`.
Do not use pickup height alone to assign floors: floating Silver Rupees stay
in their rooms on 1F. Enemies, mechanisms and engine actors remain staged in
the snapshot rather than being mislabeled as collectible markers.
Inside Ganon's Castle is map 64033, submaps 640130–640137 (two 1F states,
then 2F–7F). `ganon-castle-calibration.json` registers its differently cropped
floors into one tower frame. 1F uses trial-door landmarks; tower floors use
central-room silhouettes. This is approximate artwork calibration, especially
the schematic 7F stairwell: confirm the boss-door marker against an in-game
map capture before treating its placement as exact. No source object bounds
are used as texture bounds. The preparation script rejects clipped artwork.

`ganon-castle-source.json` retains 1,333 Radar objects and MapParam's floor
membership. `ganon-castle-to-sql.cjs` imports all 12 real chests, 20 Silver
Rupees and the 7F boss door. Four attacking trap chests and engine actors are
not collectible chest markers. The Golden Gauntlets retain marker 64704026:
its guarded update moves it off the overworld entrance, preserving bookmarks
and completions, and removes only its obsolete entrance-reference paragraph.
Other new markers use IDs 64707001–64707032. Boss Key is on 5F; remaining
chests and all Silver Rupees are on 1F. These counts deliberately exclude
the separate exterior, escape sequence and final-battle scenes.

Migration `20261111100000_oot_hq_artwork` switches references and native zoom;
its down migration restores old references. Legacy tiles remain available for
rollback. Offline manifests discover the new paths and versions automatically.

## Bosses, minibosses and grotto entrances

`20261112010000_oot_encounters_grottos` adds 10 main bosses, 22 miniboss
encounters, 33 grottos and four graves. Categories are 64071/64072 (under
64070 Enemies & Bosses), 64034 Grottos and 64035 Graves. Encounters use IDs
64708001–64708032; grotto/grave entrances use 64709001–64709037.
The existing Proving Grounds entrance is marker 64600029: it was named
Gerudo Training Ground and categorized as a minigame. It is renamed and
recategorized in place, not duplicated.

`collect-encounter-sources.cjs` collects relevant Radar records, excluding
Dream World, museum, dictionary and auxiliary boss-part copies. Lizalfos pairs
and Stalfos fights are grouped by the source encounter group. `grotto-anchors.json`
comes from the exact `HidingHole_HoleEntrance` anchors in all 37 overworld
Static scene files, extracted by `extract-grotto-anchors.cjs`. This recovers
three holes omitted by the Radar mesh search. Era copies share one completion;
Graveyard tombs are kept separate from grottos. Contents are recorded only where
a scoped AI reference graph establishes them, not from scene-wide Common groups.

`audit-encounter-artwork.py` checks projected points against each floor's actual
foreground alpha mask. The boss arenas are absent from the supplied textures:
boss markers explicitly reference their existing boss-room entrances (Ganon
references the exterior castle entrance). Nabooru's unmapped encounter also
uses the Spirit Temple boss entrance. Reference descriptions and `game_data`
metadata distinguish these from exact encounter positions. Source IDs, original
positions and group membership are retained for future arena artwork.

The import generator prints JSON only and fails closed without the coverage
audit. Run it with `audit` as its final argument to produce raw candidates,
then audit those before generating `up`, `down`, `markers` or `counts`.

Gossip Quest status: the local Zelda Notes dump has 100 localized records
(60 Actor / 40 Stone) with names, hints and solutions. Radar's Gossip search
provides ordinary Gossip Stones, not a verified quest-ID-to-target-object link.
The 37 checked overworld Static scene files contain no explicit
GossipResearch/GossipQuest references. Do not invent quest coordinates or use
NPC schedule points as a substitute.
