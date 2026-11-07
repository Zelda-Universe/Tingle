# Source-coordinate staging (not live map data)

Source: https://github.com/MrCheeze/oot-switch2-tools

`report.json` records the source revision and MapParam hash. Reproduce with:

```
node dev/assets/oot/extract-scene-data.cjs /path/to/oot-switch2-tools
node dev/assets/oot/calibrate-scene-data.cjs /path/to/oot-switch2-tools
node dev/assets/oot/audit-projection.cjs /path/to/oot-switch2-tools
```

The extractor retains 64-bit actor IDs as strings. Never parse them as JS
numbers. Child and Adult records often share an ID: these are variants of
the same collectible, not new collectibles. The current snapshot has 36
distinct Heart Piece IDs and 100 distinct Gold Skulltula IDs, plus 10 Big
Poe actors. Actor records also include non-playable museum/boss-rush copies;
these must not be imported as overworld POIs.

`map-points.json` contains the game's map-facing coordinates, including
floor membership, entrances and collectible anchors. `actors.json` contains
selected physical actor placements and links. `locations.json` preserves
location-label anchors. These files are not loaded by the website.

## Coordinate calibration gate

Source X/Y/Z is **not** a Zelda Maps coordinate. Artwork is trimmed, scaled
and placed independently by scene. Dungeon artwork is also independent by
floor/state. Interior objects may use MapIconOffsetAnchor or OriginTrans,
so raw actor coordinates are not a safe substitute for map icon positions.

`calibration-report.json` fits the existing annotated exit points to source
entrance anchors. This is a diagnostic, not an authoritative transform.
Three anchors can fit an affine transform perfectly without proving it is
correct. Four or more permit held-out error checks. All fits remain marked
`verified: false` until checked against independent artwork landmarks or
the game's actual map-projection parameters.

Before generating database migrations:

1. Establish verified transforms per scene/age/floor/artwork state.
2. Resolve offset anchors and scripted/interior rewards.
3. Match source actor IDs to existing marker IDs; preserve bookmark and
   completion identities. Do not use nearest-distance matches unreviewed.
4. Separate age variants and exclude debug/museum/alternate-state copies.
5. Add new categories and markers only for reviewed, projected records.
6. Generate guarded SQL updates with old-coordinate checks, not an overwrite
   of user-edited marker text or live data.

No current marker positions or database rows have been changed by this staging work.

`projection-audit.json` inventories the actual center/zoom fields per scene
and compares axis-aligned versus affine fits with held-out entrances. It
distinguishes minimap-room framing from a verified full-texture transform.
