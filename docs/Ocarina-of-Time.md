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
