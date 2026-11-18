#!/usr/bin/env python3
"""Renders every room of The Minish Cap from the user's ROM with MCEdit's mclib.

venv/bin/python render_rooms.py <mcedit dir> <rom path> <out dir> [area hex ...]
Writes <out>/area_XX/room_YY.png and <out>/rooms.json (area, room, x, y, w, h).
The ROM is only read.
"""
import json, os, sys, traceback

MCEDIT, ROM, OUT = sys.argv[1:4]
ONLY = {int(a, 16) for a in sys.argv[4:]}
sys.path.insert(0, MCEDIT)
os.chdir(MCEDIT)
from PIL import Image
from mclib.renderer import Renderer  # first: mclib's modules import each other in a circle
from mclib.data_interface import RomInterface
from mclib.game import Game
from mclib.visual_zone import VisualZone

def render_layer_zoned(room, layer_index):
    """A 16-colour layer whose graphics and palettes change by zone (Minish
    Village, Hyrule Town), tile by tile, as MCEdit's editor draws it
    (mcedit_ui/layer_item.py); its renderer leaves zones out."""
    area = room.area
    base_gfx = area.get_gfx_asset_list(room.gfx_index).gfx_data
    if layer_index in (1, 3):
        base_gfx = base_gfx.read_raw(0x4000, len(base_gfx) - 0x4000)
    base_palettes = renderer.generate_palettes_for_area_by_gfx_index(area, room.gfx_index)
    tileset = area.tilesets_asset_list.tileset_datas[layer_index]
    layer = room.layers_asset_list.layers[layer_index]
    img = Image.new('RGBA', (room.width, room.height), (0, 0, 0, 0))
    if tileset is None or layer is None or not len(layer.data) or layer.data[0] == 0xFFFF:
        return img
    per_zone = {}
    def zone_gfx(zone_ids):
        if zone_ids not in per_zone:
            gfx, palettes = base_gfx, base_palettes
            if zone_ids: gfx = gfx.copy()
            for zone_id in zone_ids:
                data = room.visual_zone_datas[zone_id]
                if data.palette_group_index is not None:
                    palettes = renderer.generate_palettes_from_palette_group_by_index(data.palette_group_index, palettes)
                for ptr, offset in data.gfx_load_datas:
                    if layer_index in (1, 3):
                        offset -= 0x4000
                        if offset < 0: continue
                    gfx.write_raw(offset, game.rom.read_raw(ptr, 0x1000))
            per_zone[zone_ids] = (gfx, palettes, {})
        return per_zone[zone_ids]
    width = room.width // 16
    for i, index in enumerate(layer.data):
        x, y = (i % width) * 16, (i // width) * 16
        gfx, palettes, cache = zone_gfx(tuple(VisualZone.get_zone_ids_overlapping_point(room.zone_lists, x, y)))
        for k in range(4):
            attrs = tileset[index * 4 + k]
            h, v = attrs & 0x0400, attrs & 0x0800
            attrs &= ~0x0C00
            if attrs not in cache: cache[attrs] = renderer.render_tile_by_tile_attrs(attrs, gfx, palettes).convert('RGBA')
            tile = cache[attrs]
            if h: tile = tile.transpose(Image.FLIP_LEFT_RIGHT)
            if v: tile = tile.transpose(Image.FLIP_TOP_BOTTOM)
            img.alpha_composite(tile, (x + (k % 2) * 8, y + (k // 2) * 8))
    return img

with open(ROM, 'rb') as f:
    game = Game(RomInterface(f.read()))
renderer = Renderer(game)

def layer_image(room, layer_index):
    area = room.area
    if area.uses_256_color_bg1s:
        if layer_index == 2:
            return renderer.render_layer_mapped(room, renderer.curr_room_bg_palettes, 2, color_mode=256)
        return None
    if layer_index == 3:
        if area.get_gfx_asset_list(room.gfx_index).tile_mappings_8x8[3] is None:
            return None
        return renderer.render_layer_mapped(room, renderer.curr_room_bg_palettes, 3, color_mode=16)
    if room.layers_asset_list.tile_mappings_8x8[layer_index] is not None:
        return renderer.render_layer_mapped(room, renderer.curr_room_bg_palettes, layer_index, color_mode=16)
    if room.zone_lists:
        return render_layer_zoned(room, layer_index)
    tileset = renderer.curr_room_tileset_images[layer_index]
    if tileset is None:
        return None
    return renderer.render_layer_16_color(room, tileset, layer_index)

meta, errors = [], []
for area in game.areas:
    if ONLY and area.area_index not in ONLY: continue
    for room in area.rooms:
        try:
            if room is None or not room.width or room.layers_asset_list is None: continue
            renderer.update_curr_room_palettes_and_tilesets(room)
            img = Image.new('RGBA', (room.width, room.height), (0, 0, 0, 0))
            for li in (3, 2, 1):  # back to front
                try:
                    layer = layer_image(room, li)
                except Exception as e:
                    errors.append(f'{area.area_index:02X}/{room.room_index:02X} BG{li}: {e}')
                    layer = None
                if layer is not None:
                    img.alpha_composite(layer.convert('RGBA'))
            d = os.path.join(OUT, f'area_{area.area_index:02X}')
            os.makedirs(d, exist_ok=True)
            img.save(os.path.join(d, f'room_{room.room_index:02X}.png'))
            meta.append(dict(area=area.area_index, room=room.room_index, x=room.x_pos, y=room.y_pos,
                             w=room.width, h=room.height))
        except Exception as e:
            errors.append(f'{area.area_index:02X}/{room.room_index:02X}: {e}')
# Rendering only some areas updates their rooms in an existing rooms.json.
path = os.path.join(OUT, 'rooms.json')
if ONLY and os.path.exists(path):
    old = json.load(open(path))
    meta = [r for r in old['rooms'] if r['area'] not in ONLY] + meta
json.dump({'rooms': meta, 'errors': errors}, open(path, 'w'), indent=0)
print(len(meta), 'rooms rendered;', len(errors), 'errors')
for e in errors[:20]: print(' ', e)
