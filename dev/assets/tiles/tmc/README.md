# The Minish Cap: maps from the game

Rebuilds tiles/tmc/v1, images/icons/tmc/v1 and the TMC migrations from a US
cartridge dump (SHA-1 b4bd50e4131b027c334547b4524e2dbbd4227130). The dump is
read only; never add it to the repo.

Needs, outside the repo: zeldaret/tmc (data/map/*.s, include/item.h; the
item enum numbered into items.json by hand: see tmc_items.py) and
LagoLunatic/MCEdit with its mclib submodule, plus Pillow and PyYAML.

1. render_rooms.py <mcedit> <rom> <scratch>/rom-render: every room, as PNG.
2. build_rom_maps.py <scratch> <repo>: stitches maps and floors, cuts tiles
   and thumbnails, places items and Hyrule's areas (spec.json).
   tmc_floors.json says which floor each dungeon room is on.
3. gen_tmc_rom.py <scratch>/rom-build/spec.json migrations: the maps,
   places and items migrations (names in tmc_item_names.json).
