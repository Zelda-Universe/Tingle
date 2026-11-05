# Ocarina of Time asset preview

Open `http://127.0.0.1:8080/?game=OoT` after generating the assets.
This is an isolated, read-only content pack (container ID 64), not a database
migration. Existing games and accounts are not changed. Nothing is deployed
automatically.

## What is imported

- Illustrated Hyrule overview.
- 21 regional map sets, preserving all 51 child/adult and scene variants.
- 10 dungeon sets, preserving all 64 main floor/water-level/room-state variants.
- 129 item/equipment icons; the category menu uses the corresponding supplied icons.
- 540 CSV text tables, with English, Japanese and German columns preserved in
  `data/OoT/text-catalog.json`.
- 116 previews and tile pyramids (10,116 WebP tiles).

`data/OoT/import-report.json` records the source image, SHA-256, original
dimensions, padding, native zoom, and tile directory for every variant.
Map groups are in `maps.json`; the live map selector exposes every variant.
`unplaced-content.json` indexes item, NPC, enemy and location definitions from
the text tables, with available icon matches and explicit null coordinates.
These are definitions, not claims about the number of actual spawn locations.

## Important limits

The supplied folder consists of images, dialogue/localisation CSVs, and UI
translation JSON. It does **not** include actor placements, scene coordinates,
collectible spawn tables, dungeon chest positions, or transforms between the
illustrated overview and regional textures. Therefore `markers.json` is
deliberately empty. Categories are prepared, but zero placed POIs is not a
claim that those categories have no locations in the game.

Mini textures are alternate-size thumbnails, not additional maps. Dungeon
`Back`, `Alpha`, `Grad` and `All` images are supporting texture/mask layers;
the visible `Main` textures provide the selectable floor variants. These
source files remain untouched in the supplied dump. UI welcome graphics and
translation-only UI strings are not turned into fake POIs.

Location labels without a matching map texture are listed in the report.
Adding every POI requires an actor/scene-placement dump or a separately
verified coordinate dataset. Existing in-game artwork alone is not enough to
infer precise item positions. Database-backed editing, completion and account
sync for this preview require a later real database import with stable IDs.

## Rebuild

The importer needs Node.js and Sharp. Point `SHARP_MODULE` at an existing
Sharp installation if it is not on Node's normal module search path:

```sh
SHARP_MODULE=/path/to/node_modules/sharp node dev/assets/oot/import-assets.cjs /path/to/oot
```

Unchanged source images reuse their existing tile pyramids. Source files are
never edited. Output is confined to `data/OoT`, `tiles/oot`, and
`images/social-oot.webp`. This preview branch includes `tiles/oot` in Git so
other developers can pull and run it without the original dump or Sharp.
The other games' tiles remain ignored. OoT tiles are served locally at
`/tiles/oot/`; a deployment must preserve that directory at the same URL.

## Other developers

Check out `codex/oot-asset-preview`, install the site's normal dependencies,
and run the local site as usual. Open `/?game=OoT`. The prebuilt tiles,
previews, icons and JSON content pack are all included; no OoT database
migration or asset-generation step is needed.

Coordinates use a 256×256 local map canvas, north at y=0 and south at y=-256.
Sources are centered in the next power-of-two tile canvas. At native zoom z:
`x = (pixelX + offsetX) / 2^z`, `y = -(pixelY + offsetY) / 2^z`.

## Backend integration

`lib/common/oot_pack.php` only reads allowlisted JSON filenames. The public
game/map/category/marker endpoints recognise `OoT` and `64`. The game list
appends OoT only when its generated container exists. The offline-download
manifest includes the local OoT tile directories and content assets, while
retaining its existing login check. This deliberately does not insert preview
IDs into existing production tables.
