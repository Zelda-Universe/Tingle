# BotW street view: what's broken, missing, ours, or unported

The goal: street view is the game's world, drawn by the game's own data and the game's own
shaders. It should match the game pixel for pixel, with time of day and weather as the only
differences. Anything we baked or invented ourselves is a stand-in, to be replaced by a direct
port.

Each entry has a status, what street view does now, and what the game does (its data and
shaders, as far as we know so far).

- **Broken**: wrong or glitchy as it stands.
- **Missing**: the game has it; street view has none of it.
- **Ours**: street view has its own version, a stand-in to be replaced by the game's.
- **Partial**: the game's own, ported, but incomplete.

Measured on sections D-6, D-7, E-6 and E-7 and the five references in `reference/`
(2026-11-23).

---

## 0. How we check our work (fix this first)

| Status | Now | Should be |
|---|---|---|
| Broken | `compare.js` scores luma (brightness) only. Saturation and hue don't count at all, so oversaturation never showed in a score. | Score per channel and in a perceptual colour space (e.g. CIE ΔE), plus the sky and ground separately. |
| Fixed (2026-11-23) | **The game's display is sRGB-encoded.** Checked against Cemu's own window: the game's final image (RGB10A2) holds linear values (the tone map's 1 - exp(-x)), and what you see is that sRGB-encoded (encoded: within ~5 levels of 255 of Cemu's window; as stored: 65 apart). All five references were saved linear (too dark, too saturated) and the game renderer drew the tone map's output without encoding, matching them, so street view was too dark and too saturated in the same way. Both now encode (`extract_reference.py`, `StreetViewGame.js`); the references were re-encoded from their own frames in the captures (`srgb: true` in their json). | |
| Was broken | The references are the game's final image read from GPU memory. They agree with each other, but were never checked against what Cemu shows on screen. | Take a Cemu screenshot of the same frame and confirm it matches, or fix the decode. |
| Broken | A capture keeps each image as it stood when the capture began, so some "clean" frames come from an earlier moment (dusk-temple, trees-afternoon fall back to the HUD frame). | Capture so the clean frame is the same moment, or always use the HUD frame with its corners masked. |
| Missing | No comparison of the inputs. We compare final pictures only, so texture errors and lighting errors are mixed together. | Compare our G-buffer (albedo, normals) with the game's, which every capture already holds (`-albedo.png`, `-normal.png`). That separates "wrong surface" from "wrong light". |
| Missing | Five references, all on or near the Great Plateau, two of them weather the renderer doesn't model. | References for each problem below: a lake, a river, a forest, grass up close, a town, rain and night. |

### Done so far (2026-11-23)

- `compare.js` now scores colour: mean CIELAB ΔE (whole frame, sky, ground), mean lightness and
  chroma for the game and ours, and the share of pixels more than 10 ΔE apart. `ZCompare.all()`
  returns all of it per reference.
- It now compares the G-buffer too, where a capture's G-buffer is of the same frame (`gbuffer:
  "matches"` in the reference's json, checked by eye): albedo ΔE and chroma, and the mean angle
  between normals. Shown under the pictures.
- Only **field-day**'s G-buffer matches. The other four captures kept albedo and normal images
  from another moment and place, so they need recapturing for input comparisons.

Baselines (game renderer; ΔE: 2.3 is just noticeable, over 20 is a different colour; chroma
game / ours):

| Reference | luma | ΔE | ΔE sky | ΔE ground | chroma | albedo ΔE | normals |
|---|---|---|---|---|---|---|---|
| field-day | 26.8 | 26.3 | 22.0 | 28.2 | 30.9 / 32.3 | 15.2 (chroma 17.8 / 15.0) | 26.6° |
| dusk-temple | 6.7 | 4.8 | - | 4.8 | 1.9 / 4.0 | - | - |
| glow-shrine | 54.5 | 44.0 | 40.1 | 44.2 | 18.8 / 27.0 | - | - |
| trees-afternoon | 42.7 | 34.3 | - | 34.3 | 30.8 / 20.0 | - | - |
| wide-sunset | 39.7 | 38.9 | - | 38.9 | 15.2 / 24.3 | - | - |

The oversaturation shows now: glow-shrine +44% chroma, wide-sunset +60%. (Sky ΔE 0: the sky
mask finds no sky in those frames.)

After the sRGB fix (references and renderer both encoded):

| Reference | luma | ΔE | ΔE sky | ΔE ground | chroma | albedo ΔE | normals |
|---|---|---|---|---|---|---|---|
| field-day | 21.5 | 18.5 | 14.2 | 20.4 | 23.2 / 22.9 | 15.6 | 27.4° |
| dusk-temple | 18.8 | 16.7 | - | 16.7 | 12.3 / 9.7 | - | - |
| glow-shrine | 47.5 | 34.1 | 27.1 | 34.4 | 19.6 / 18.6 | - | - |
| trees-afternoon | 41.5 | 32.0 | - | 32.0 | 29.8 / 18.5 | - | - |
| wide-sunset | 33.9 | 29.8 | - | 29.8 | 12.5 / 18.3 | - | - |

Saturation now matches on field-day and glow-shrine. dusk-temple got worse: encoded, its darks
are visible where before both were near black (night is darker than the game's). What's left on
field-day is content: the ground's material lookup, our sky and clouds, no distance haze, our grass.

## 1. Ground (terrain)

| Status | Now | The game |
|---|---|---|
| Ours | Heights on a 2 m grid (`fieldbake.height_grid`), one mesh per 1 km section with skirts. | `.hght` tiles in a quadtree (`.tscb`): 256 x 256 heights per area, areas from 2000 m down to 62.5 m. That's 0.24 m between heights at the finest, 8x finer than ours. The game picks LODs by distance. |
| Ours | Colour: a baked texture per section (`ground-<section>.webp`, 2048 px over 1 km, about 0.5 m per pixel, "a touch softer" by our own blur). Up close (50-130 m), our own shader multiplies in the game's material textures as "grain" over the baked colour, projected three ways. | `.mate` tiles: per height sample, two material indices and a blend. The game's terrain shader samples `MaterialAlb` and `MaterialCmb` (albedo, normal and more) per material at its own scale, and blends them. |
| Missing | Ground normal maps (`MaterialCmb`): the ground has only its mesh normals. | The terrain shader's normal and detail come from `MaterialCmb`. |
| Ours | Ground textures re-encoded at 256 px per layer into a WebP atlas. | `Terrain.Tex1.sbfres` arrays at their own size and format (BC). |
| Missing | The game's terrain shader. | Its shader is in the Cemu shader dump; port it like the light pass (`cemu_to_webgl.py`), with the game's own vertex layout from `.hght` / `.mate`. |
| Broken | The foreground dirt is too red (field-day). Found with the G-buffer comparison: the heights are right (our grid is within a metre of the finest terrain there). The `.mate` data says that ground is material 45 (blend 255 toward the second material). We draw material 45 as `MaterialAlb` layer 45, a red layered rock, but the game's albedo there is grey-khaki (about 80, 78, 64 sRGB). Where the blend is 0 (pure first material, grass), our colour matches the game's to a few levels, so the blend direction is right. So the material → texture lookup is wrong, at least for 45. There are 88 materials and 83 layers, and the `.tscb` table maps them one to one (index, u/v scale, two unknown values). The real mapping (or a colour or tint per material) must be in the game's terrain shader. | The terrain shader decides. Port it (below), and read how it picks a layer and colour per material. |
| Fixed (2026-11-23) | **The material → texture mapping.** The game maps materials to `MaterialAlb` layers at runtime: the terrain pixel shader (`fb2d0efc`) reads a table, `uf_blockPS11[material + 9]` = (u scale, v scale, layer, packed parameters), found in the field-day capture's buffers by its scales. It's not one to one: materials 29-31 use layers 17, 18, 0; 63 uses 7; 76 uses 0; the rest shift down. Material 45 is layer 42 (grey-khaki), not 45 (red rock). Saved as `tools/terrain-materials.json`, used by `terrain.py`; the atlas, material table, baked ground and horizon rebuilt. field-day: ΔE 18.5 → 16.6, albedo ΔE 15.6 → 13.9 (pixels over 10 apart: 44% → 30%). | |
| Broken | Grass: our grass draws bright green tufts into the G-buffer where the game's albedo has none. | The game's grass is its own pass (section 3). |

**Found (2026-11-23):** the game's terrain is a geometry clipmap: seven nested levels (62.5 m to
4 km) centred on the camera, heights 0.244 m apart in the finest, filled from the `.hght` / `.mate`
tiles into texture arrays and drawn by `deb54731` / `fb2d0efc`. Each draw's constants read from a
capture (shader-notes.md has the table).

**Ported (2026-11-23):** street view's ground is now the game's clipmap drawn by the game's own
terrain shaders (`StreetViewTerrain.js`), from the game's tiles exported losslessly
(`build_terrain.py`, 989 tiles, 89 MB). Scores (ΔE): field-day 16.6 → 15.6 (albedo 12.6, 23% over
10), trees-afternoon 32.0 → 30.7, glow-shrine 34.1 → 33.8, dusk-temple 16.7, wide-sunset 29.8 → 30.7
(beyond the sections only the 1 km+ tiles are exported). ~0.4 ms a frame. Still ours or missing:
water and wetness (VS2 empty); material textures at 256 px (the game's 1024 / 512); levels refilled
whole (the game updates its arrays toroidally); the green mound under the Great Plateau Tower (in
the terrain data; the game shows ruins there, unexplained); the old bake is still built and served
as the fallback (`?streetview-ground=own`).

**Direction (was):** drop the bake. Stream the game's `.hght` / `.mate` tiles (or a lossless repack of
them) and draw them with the game's terrain shader, choosing LODs as the game does.

## 2. Water

| Status | Now | The game |
|---|---|---|
| Ours | `build_streetview.py` cuts water where its height is more than 5 cm above the ground on a 4 m grid, then grows the shoreline outwards by two cells. Our own clipping. | `.water.extm` holds a 64 x 64 grid per terrain area: height, flow x, flow z, and a type byte. It's a heightfield defined in every cell the tile covers. The game draws it as one surface, and the terrain hides it wherever the ground is higher (the depth test does the clipping). |
| Ours | Nearest-sampled at 4 m (`np.rint`). | 64 cells per area: about 1 m per cell on 62.5 m areas. |
| Ours | Material: a see-through PBR material (fixed colour (0.05, 0.16, 0.2), opacity 0.88), with the game's `WaterNrm` normal map scrolled in two fixed directions. | The game's water shader: reflection, refraction, depth colour, foam at the shore, and flow from the flow fields. Its shaders are in the dump. |
| Missing | Flow (rivers move along the flow x/z data). | Per-cell flow in `.water.extm`. |
| Missing | Water types (the type byte: lake, sea, hot spring, poison, lava... meanings not decoded yet). | Per-cell type selects the look. |
| Missing | Waterfalls are the models' own scrolling material ("flow"), with our own animation. | The game's waterfall shader and its texture animation (FMAA/FTXP in the model's animation archive). |
| Broken | Drawn after the light pass as a forward transparent layer, so the light pass's fog and light never touch it. | The game draws water in its own pass with its own lighting. |

**Found (2026-11-23):** the game draws water in two passes: meshes (vertex shaders 7af8fda5 / 7af8fda9,
built on the CPU from the water tiles) that leave each water's type in depth, then a full-screen
shading pass per type (4721609a + 2e2543 or a sibling: refraction, reflection, colour, edges).
The meshes' vertex format is known (half4 position, 10-10-10-2 normal, two 16-bit values, four
bytes); what the game puts in them isn't yet (shader-notes.md).

**Found (later, 2026-11-23):** the pond's surface is a **clipmap**, like the terrain: vertex shader
`4ba8531637df52f4` samples per-level water heights (VS0) and water data (VS1: flow and the water's
type, which picks a row set of per-type parameters), its pixel shader marks the pixels with the
water's type (22 for this pond) in the G-buffer, and the full-screen shading pass shades each type.
(The meshes vertex shader 7af8fda5 noted above isn't the pond's.)

**Ported (2026-11-23):** street view now draws the water the game's way (`scripts/controls/StreetViewWater.js`):
the game's water tiles (`tools/build_water.py`: 283 tiles, lossless) on the terrain's seven clipmap levels, with
the game's own G-buffer water shaders (`gpu/water_vs.glsl`, `water_ps.glsl`: 4ba85316 / e57a8ad2, maths untouched),
the game's WaterNrm / WaterEmm arrays, and the constants the game gives them, read with the water probe
(`gpu/water-constants.json`, `tools/build_water_constants.py`). Street view's own section water is hidden; the
horizon's only shows past the game's levels. At the pond the G-buffer's water now matches the game's (albedo the
same dark teal, the same flat normal; pond albedo deltaE overall 23 -> 19.7).

| Status | Now | The game |
|---|---|---|
| Ported | The full-screen water pass (2e2543216c04766d, `gpu/water_composite_ps.glsl`): over the water, the light through it (the G-buffer pass's output 5: the last frame's picture under the water, refracted, x (1 - fresnel)) plus the sky cube's reflection, times the light pass's output 0, plus the lit surface (output 3). | The game's own; its constants from water-probe3 (the camera's and sun's made each frame). At the pond the water's colour now follows its sky: the game's warm grey (115, 101, 89) against our blue (101, 148, 182), the difference street view's sky (blue, clouded) against the game's 6:40 PM overcast one (section on the sky). |
| Partial | The siblings of the full-screen pass (9fbeb971, 3179b85d, 556c05fb, bede6707: other water types or settings) aren't used; every water draws with 2e2543. | Which type takes which isn't known. |
| Partial | The type table: only type 6 (the pond's) read; other types borrow its rows. | Six rows per type (VS4); a probe at other waters (river, sea, hot spring...) reads them. |
| Partial | Waves, texture scrolling and the flow-map phases are still (the capture's moment). | Time drives VS6[37], the pixel shader's row 3 phases and maybe the texture offsets: two captures a few seconds apart give the rates. |
| Ours | Cells under the ground everywhere are left out (the game also leaves cells out; its rule isn't known). | The capture's draws are grids with cells missing. |

## 3. Trees, plants and grass

| Status | Now | The game |
|---|---|---|
| Missing | Nothing at all is placed outside the four built sections. The horizon (`horizon.glb`) is bare ground and water, so distant forests, ruins and towns are gone. That's the mid-distance trees missing in trees-afternoon. | Every section's map units, with `_Far` actors (the game's own distant models, placed as their own objects) and `FarModelCullingArea`s deciding what shows. |
| Missing | `_Far` models are skipped everywhere (`build_streetview.py`), including inside the built sections, so there's nothing at distance. | The game swaps near models for `_Far` ones by distance. |
| Missing | Tree and plant wind. The models are static. | Material params `uking_wind_vtx_transform_intensity` / `_lie_intensity` and the vertex colours drive the game's wind in its vertex shader. |
| Ours | Leaves are an alpha-test cutout at 0.5, lit as solid surfaces. | The game's foliage shader: translucency (light through leaves) and its own alpha handling. |
| Ours | Grass: our own procedural blade clumps (11 blades), our own sway, grown to 34 m round the camera, coloured from `.grass.extm`. | `.grass.extm` gives density and colour per cell (we read that much right). The game draws its own grass model and shader, out to its own distance. |
| Missing | Items in the world: apples on trees, mushrooms, plants (`Item_Fruit`, `Item_Mushroom`, `Item_Plant`), dropped weapons and barrels: about 200 per section. | They're map-unit actors with models. |

## 4. Objects and models

| Status | Now | The game |
|---|---|---|
| Ours | Textures resized to at most 512 px and re-encoded as lossy WebP. | Each texture at its own size (often 1024-2048) in BC formats. Loss in sharpness and colour. |
| Partial | Materials: albedo, normal, emission and metal mask from the textures' names; alpha cutout; vertex colours as ambient occlusion; a second layer blended by vertex alpha. | Each material names its shader options (`uking_*`) and params (`const_color*`, `uking_emission_color`, specular, etc.). Most aren't read. The G-buffer gloss comes from our roughness guess (0.8), not the game's. |
| Ours | Gloss (G-buffer normal alpha) and specular are guessed: albedo alpha bit 0 only, no specular bits. | The game's G-buffer pass writes these per material. Port the game's G-buffer shaders (one per material variant, all in the dump), or at least read their params. |
| Partial | Glow: shrine entrances use the game's measured colour (index 205). Every other glow is Map3D's "glow" colour (0x4cc3ff × 3), including things that aren't Sheikah at all (Korok pinwheels, Gerudo lamps, stable glass). | Each material's `uking_emission_color` index → a runtime colour. Carry the index into the glTF and measure each colour from captures. |
| Missing | Object filter: `SCENERY` is a fixed list of prefixes. About 1,900 of 4,400 objects in E-6 are filtered out. Most are logic (tags, areas, sound emitters), but some are visible: `RockLayerMoss`, `FldObj_CliffWhite*` (those are `_Far`), and items. | Every actor with a model, decided by its actor data (does it have a model, is it visible), not a name list. |
| Ours | States: one of several overlapping states kept by our own rule (`dedupe`), "after" states forced (towers risen). | Game flags decide which state shows. We want a fixed "world after" state, but chosen from the game's flags, not by name. |
| Missing | Animated parts (spinning, moving, flags) are static. | The models' animation archives. |
| Missing | Decals' blending: moss and sand decals are ordinary meshes. | The game's decal shader blends them into the G-buffer. |

## 5. Lighting and post-processing

| Status | Now | The game |
|---|---|---|
| Partial | The light pass (`bec68ec6`) is the game's own, fed from our G-buffer. | Its constants are fixed from one moment (3:25 PM on the Plateau), except the sun and moon. The game changes them through the day and with the weather (from `env.sgenvb`). |
| Missing | PS11, PS12, PS15 and PS17 are fed black. That's ambient occlusion, light probes or other inputs the game generates (not identified). | Identify each from the probe pack and port the passes that make them. |
| Ours | PS7 (the sky cube the light pass lights with) is filled from our sky, not the game's. | The game's sky shaders (`250cb5a0` LUT → `53422d4f` / `4e21d093` cube faces). |
| Ours | PS5 (cloud visibility) is solid white. | Generated by the game each frame. Not yet identified. |
| Ours | Shadows: three's single 80 m shadow map. | The game's cascaded shadow maps, and their own filtering. |
| Missing | Local lights: torches, lamps, braziers. | The game's point and spot lights (a separate pass). |
| Missing | Fog: the light pass writes fog (output 1), but how the game applies it isn't known, so it's left out. | Find the pass that applies output 1 and port it. |
| Partial | Bloom: the game's bright pass, then our own gaussian blur. | The game's blur chain (`ex_iteration` 2, its own shaders and the tint `38d70ed9`). |
| Missing | Colour correction after the tone map: none in the game renderer. | `master_field.baglccr`: saturation 1.175, toy-cam levels. The game's own pass (not identified yet). Also FXAA / its own anti-aliasing, and any depth of field. |
| Broken | Night is darker than the game's. | Not yet known why (moon light constants, ambient or exposure). |

## 6. Sky, clouds and weather

| Status | Now | The game |
|---|---|---|
| Ported | Sky: the game's own (its precomputed scattering table, its table shader 250cb5a0, its sky shader 4e21d093), checked to 4% against a frame's own sky table. Paints street view's sky dome, the sky cube and the light pass's haze. Field-day ΔE 23.7 -> 17.1. | The game's. |
| Partial | The sky's hour: the game's palettes (set 0, clear weather) blended by the sun's height as probed through a day. Night: street view's own sky. Scores mixed (2 references better, 4 worse). | Each climate's and weather's palette set (not yet known: the pond's reference is overcast), the night sky's own shaders, the game's clouds, the sky cube's ground tint (53422d4f), and the sun's path by the hour (north, not south; timing not pinned). |
| Partial | Clouds: the game's cloud texture and params (`master_field.baglclwd`) drawn by our own shader. | The game's cloud shader. |
| Partial | Cloud shadows: the game's texture and projector, our own scrolling. | Game's own. |
| Missing | Weather: none (rain, storms, fog, snow, overcast). | Weather per climate area (`Climate` data), each its own env set. |
| Missing | Sun and moon discs and stars. | Game's sky. |

## 7. Coverage and glitches

| Status | Now |
|---|---|
| Missing | Four of Hyrule's ~80 sections are built (D-6, D-7, E-6, E-7). |
| Missing | Interiors and the Divine Beasts are outside street view's world (the field only). |
| Broken | Sections load one at a time within 1.5 km, so you can see the edge of the world until they arrive. |
| Broken | The horizon's ground is a 25 m grid with its own coarse bake, and joins the sections with visible steps. |
| Broken | Street view's own forward renderer (`?streetview=classic`) still exists and drifts from the game renderer. Two looks to maintain. |

---

## Order of work (proposal)

1. **Check our work** (section 0): a colour-aware score, references confirmed against Cemu's
   screen, and G-buffer comparisons. Without these, "closer" can't be measured.
2. **Ground:** the game's terrain at full resolution with its own shader.
3. **Water:** the game's heightfield, drawn whole and hidden by the terrain, with its shader.
4. **Materials:** textures at full size and lossless, and the game's G-buffer shaders and params,
   so every surface writes what the game writes.
5. **Distance:** `_Far` models and every section, so the world reaches the horizon.
6. **Foliage and grass:** the game's grass, wind and leaf shading.
7. **Lighting inputs:** PS5/7/11/12/15/17, fog, colour correction, constants through the day.
8. **Sky and weather.**

Steps 2-4 change what the game renderer is fed, so the lighting work (7) is easier to judge
after them.

**Size:** porting the game's own shaders and data at full resolution makes street view's
downloads far bigger. Each 1 km section today is 19-28 MB (plus 44 MB of shared textures) with 512 px WebP textures;
full-size textures and terrain are several times that. Plan for streaming by distance, the way
the game does.
