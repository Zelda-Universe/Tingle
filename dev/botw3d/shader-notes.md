# BotW's own shaders (from Cemu)

Dumped with Cemu 2.6 (Debug > Dump > Shaders) while playing BotW 1.5.0 on the Mac:
`~/Library/Application Support/Cemu/dump/shaders/` holds 1,014 shaders (402 pixel, 612 vertex) as
GLSL, named `<hash>_<variant>_<ps|vs>.txt`. `tools/shader_catalog.py` lists each one's textures,
outputs and constant blocks.

A frame capture (Xcode GPU trace) is at `~/Library/Application Support/Cemu/captures/field-day.gputrace`
(Great Plateau, daytime): 49 render passes, 873 draws, 19 copies, 1280x720. Made with
`tools/cemu_capture.py` on Cemu started with `MTL_CAPTURE_ENABLED=1`. Xcode ignores synthetic
clicks, so reading it needs a person at the mouse.

## How a frame is drawn

Deferred: surfaces first write 3 to 4 images (colour, normal, material) instead of a lit colour;
lighting passes then read those plus the shadow map (2D array shadow), an environment cubemap
array (reflections and ambient light) and a 3D lookup texture, and write the lit image. About 70
forward-lit shaders (water, glass, effects) share the same five constant blocks [4096, 7, 54, 38, 4].

## Shaders we know (names from the cemu_graphic_packs repo, which replaces them by hash)

| Shader | What it does | Source |
|---|---|---|
| `bec68ec6f40a864f` ps | World lighting: ground lighting, distance lighting, distant fog colour | RemoveFog pack |
| `fb2e18ae56397ca7` ps | Same lighting for trees, bushes and vines | RemoveFog pack |
| `1c7db40ff5d693ab` ps | Link and NPC lighting, their shadows and distant fog | RemoveFog / CelShading packs |
| `2e2543216c04766d` ps | Water colour, edges and distant water fog | RemoveFog pack |
| `8d24f32f18e6de47` ps | Lighting variant the cel shading mod rewrites | CelShading pack |
| `340382e6fbbb3951` ps | Screen-space pass with a sample count (likely ambient occlusion) | Enhancements pack |
| `37040a485a29d54e` ps | Final colour grading ("Clarity" hooks here) | Enhancements pack |
| `cb0e6e8cbec4502a` ps | Depth of field blur (battle, camera, scope) | Enhancements pack |
| `8ff2cf86e789335f` ps | Shrine wall reflections | Enhancements pack |
| `7fb9a62472e80c0f` ps | Grass (flattening) | GrassWorkaround pack |
| `fb2d0efc923bf516`, `583ea8604da62310` ps | Terrain: four texture arrays plus material and height maps, writes 4 images | our reading of the code |

Other packs worth knowing: Mods/DayLength and Mods/Weather (change time and weather, useful for
captures at other times of day), Graphics (horizon, night stars, shadows, reflections).

## The world lighting pass (`bec68ec6`), read so far

`tools/shader_clean.py` makes the dump readable (no bit casts, decimal constants, `C[n]` for
`uf_remappedPS[n]`). It's a full-screen pass that writes 5 images; the RemoveFog pack shows
image 0 holds shadow sharpness (x) and distant-area light (z), image 1 the fog colour (xyz) and amount.

- Texture 6 is depth; `depth * C[0].x + C[1].x` is the linear view distance.
- Texture 3 is the normal (xyz * 2 - 1); its alpha * 255 is a material ID (bit 0 and the top 6 bits are used).
- C[2..4] are the camera-to-world rows (w = camera position), so the world position is rebuilt per pixel.
- C[5], C[6], C[8] turn the normal into the space of the ambient cubemap array (texture 7), sampled twice.
- C[9] maps world x/z to a world-space map (texture 12); C[7], C[13], C[19]/C[20] are distance ramps
  (fog); C[15] (+ C[16].w as strength) behaves like the sun direction; C[21].xyz - 1 are colour offsets.
- There's an arc-cosine polynomial (-0.0187293, 0.074261, -0.212114, 1.57073), the usual sky-scattering angle trick.

## Constants found in the capture's buffers

In `MTLBuffer-7` and `MTLBuffer-1283` (raw little-endian floats, read with numpy):
- camera at world (-669.28, 174.89, 1516.15), facing about 51 degrees from north;
- projection x/y scale 1.2063 / 2.1445 (a 50-degree vertical field of view at 16:9), near/far 1 / 25000;
- `MTLBuffer-1283` vec4 9838 + 19: a unit vector (-0.304, 0.673, -0.675), 42 degrees above the horizon,
  likely the sun direction, but not yet tied to a draw.

Which block belongs to which draw is in the capture's command stream, which only Xcode reads.

## The game's lighting settings (`env.sgenvb`)

`tools/build_env_params.py <update content> images/3d/botw/streetview` writes `env.json` from
Bootup.pack's `Env/env.sgenvb` (64 AAMP files). Names: `tools/env-names.json`, the 533 of 661
hashes found among `U-King.rpx`'s strings. The field uses the `master_field` set:

- sun (`dir_main`): colour (1, 0.922, 0.749), intensity 9; the file's direction is a default,
  the game moves the sun with the time of day.
- hemisphere (`hemi_inner`): sky (0.84, 0.84, 0.96), ground (0.47, 0.35, 0.25), intensity 1.
- fog: `fog_scatter` 5..300 (0.585, 1, 0.806, a 0.1), `fog_world` 20..160 (1, 0.806, 0.394, a 0.6),
  `fog_inner` 5..15 (0.29, 0.34, 0.22, a 0.0175).
- sky (`bksky`): Rayleigh / Mie scattering. sun colour (1, 0.86, 0.68) x 18, Rayleigh base height 24,
  Mie base height 2, Mie coefficient 0.00183, symmetry 0.8 (0.85 rendering), Mie amplifier 8;
  scatter fog -1000..20000, density 0.9, atten 12, horizon 2; ad hoc fog -500..4640, colour
  (0.51, 0.40, 0.29), ground atten 4, sky atten 0.41; envmap amplifier 2.
- colour correction: saturation 1.175, hue 0, brightness 1, gamma 1.
- bloom: intensity 0.1, luminance clamped at 64, warm tints (1, 0.48, 0.3).
- clouds: two layers (`CloudParam0` on), sky dome scale 26500 at height 7895, colours, noise speeds.

The sky and sunset colours come from the scattering model, so a time-of-day slider is mainly the
sun's direction fed through it. `EnvPalette_%d` / `PaletteSel` (in the executable) are area and
event overrides, not the daily cycle.

## How street view uses them (`scripts/controls/StreetView.js`)

- Sky: single-scattering Rayleigh + Mie (+ ozone) with the game's heights (read as thirds of a km:
  Rayleigh 24 -> 8 km, Mie 2 -> 667 m), Mie coefficient x amplifier, symmetry 0.85, and sun strength
  18 x `amplifier_for_envmap` 2. White sunlight goes into the air (the game's warm `sun_color` turned
  the sky teal); the air reddens it. Drawn into a 256x128 panorama on each time change, which also
  feeds `scene.environment` (as the game's sky cubemap feeds its ambient light).
- Sun light: `dir_main`'s colour x the air's transmittance against noon's, intensity 9 x 0.2. Moon
  (pale blue, 0.22) at night.
- Ambient: `hemi_inner`'s sky / ground colours, tinted and scaled by the sky's light against noon's.
- Haze: half the horizon's colour, half `adhoc_fog_color` lit; distance^`adhoc_fog_atten_grd` (4) from
  -500 to 4640, approximated by three's smoothstep fog starting where the game's reaches 5%.
- Colour: saturation 1.175 after tone mapping (OutputPass), bloom 0.12. Exposure eases up as the sky
  dims (our addition, standing in for the eye's adjustment).
- Clouds: the game's `CloudParam0` with its own textures (`tex/clouds.png`: CloudTexture02, 03, 04 from
  `collect.genvres` in red, green, blue). A sky plane `mSkyHeight` (7.9 km) up, `mSkyScale` (26.5 km)
  per texture, base x `mBaseTexScale`, blended 02 -> 04 by `mCloudTexBlendRate`, broken up by noise 03 at
  `mNoiseScale1/2` x `mNoiseDensity1/2` drifting at `mNoiseSpeed*` x `mNoiseSpeedMaster`, distorted by
  `mDistotion`. Cover is measured in spreads from the textures' mean, with the threshold set so
  `mDensity` is the share of sky covered; alpha x `mAlphaMul`, faded `mFarAlphaChgStart..End` toward the
  horizon, lit with an emboss toward the sun (`mEmbossWidth`), the sky's colour x `mCloudColorScale`,
  the ambient light and the sun. The exact combination is ours: the game's cloud shader isn't decoded.
- Our guesses, not the game's: the sun's path (east -> high south -> west), the moon, the exposure,
  and how the cloud settings combine.
- Cloud shadows: `p_shadow_clouds` (`tex/cloud-shadow.png`), tiled every `shadowTex_Projector.height`
  (1000 m) as the game's projector covers, drifting east about 4 m/s. Each lit material's sunlight
  (the directional light, in three's `lights_fragment_begin`) is multiplied by it at the point where
  the line toward the sun crosses 1000 m up, at 75% strength; the sky's light is untouched.

## Comparing with the game (`compare.js`, `reference/`)

`reference/field-day.png` is the game's own final frame (before its HUD; `field-day-hud.png` with it),
decoded from the capture: `MTLTexture-233451` (and `-5549`), RGB10A2, 1280x720, after a 4096-byte
header, the pixels starting 320 in (rolled). The same capture holds the frame's other images:
`49009` lit HDR (RG11B10 float), `49261` normals, `49270` albedo, `49011` depth, `74742` sky.

Its camera (MTLBuffer-7's view matrix and projection): at (-669.284, 174.891, 1516.154), facing
(0.7833, 0, 0.6217) level, 50 degrees vertical field of view. HUD clock: 3:35 PM, sunny. Its sun:
(-0.3038, 0.6727, -0.6746), 42 degrees up in the north-west (the lit faces in the frame agree), so
BotW's sun crosses the northern sky.

`compare.js` renders street view from that camera with that sun, at 1280x720, and shows the game's
frame, ours and the difference, with mean colours and the sky's and ground's colour bias. First
run (lighting from env.json, clouds and shadows): mean luma difference 47.9 / 255; sky bias
(+101, +52, +22) (ours far too pale and grey), ground bias (0, -20, +5) (grass too dull).

## Reading the game's constants (probe pack)

`tools/build_probe_pack.py` builds a Cemu graphic pack (`graphicPacks/ZeldaMapsProbe`) that makes
shaders write their `uf_remappedPS` constants into a pixel row (4-bit pieces, exact in every format);
`tools/read_probe.py` reads them from a frame capture. It works (probe-4: 9 shaders reported, e.g.
the colour grade `37040a48`: C[0] = (0.99, 0.18, 0.875, 0.0625)), but only for passes whose image
keeps its contents to the end of the frame: a capture saves each image as it was when the capture
began, and the lighting passes draw into short-lived buffers that later passes reuse. Their rows
are gone by then. (Cemu matches pack shaders by hash and variant exactly; the variants dumped in
the first session are the ones in use, checked with a fresh shader cache.)

Fixed by chaining: every pixel shader copies probe rows it finds in its inputs into its output and
leaves the rest of the probe area alone (discard), so the rows reach the final image. probe-5 (3:25 PM,
sunny, at the field-day spot; reference/probe-5.json) read 12 shaders, the world lighting pass among
them. (While the pack is on, much of the picture is broken: the probe area is in each buffer's own
pixels, larger on half-resolution ones; the frames aren't references.)

The world lighting pass `bec68ec6` at 3:25 PM:
- C[0], C[1]: depth 0.1 .. 25000; C[2..4]: camera to world (the field-day camera); C[11..14]: world to camera.
- C[15] = (0.2859, -0.6176, -0.7327, 9): the sun's light direction in view space, and its intensity 9.
  In world space (shader `53422d4f` C[1]): toward the sun (-0.3962, 0.6176, -0.6794): 38 degrees up,
  north-west. (The vector picked from the buffers for the field-day frame was a guess; replaced.)
- C[32] = (9, 8.294, 6.741): the sun's colour, `dir_main` DiffuseColor x Intensity, unchanged by the hour.
- C[25] = (0.585, 1, 0.806, 0.153): `fog_scatter`'s colour and an amount the game works out per frame;
  C[26] = (0.2925, 0.275, 0.1874, 0.1071).
- C[22..24]: the cloud shadow projector (from 8000 m, 5 degree field of view: covers ~700 m), C[9] its
  offsets and 1000 (its height).
- C[10] = (40, 2.5, 0.85, -0.0074), C[18] = (4, 0, 0.7585, 0.7), C[21] = (0.5, 0.275, 0.2325, 0.7),
  C[31] = (1.388, 0.994, 0.297, 0.4): not yet identified.
Shader `250cb5a0` (a 3D lookup texture, scattering-like coefficients (0.00411, 0.01128, 0.02836) in C[6])
is likely the sky.

## Running the game's shaders in the browser (`tools/cemu_to_webgl.py`, `webgl/`)

BotW draws with a light pre-pass: normals and depth first; then the light pass (`bec68ec6`, trees
`fb2e18ae`, Link `1c7db40f`) works out each pixel's light, shadow and fog into buffers; then each
material's own shader draws the geometry again, reading those buffers (the ~70 single-output shaders
with shadow, cubemap and 3D textures). There's no separate composite pass.

So the faithful port is the game's own shaders, run as they are (as noclip.website does), not
rewritten. `cemu_to_webgl.py` turns Cemu's GLSL into WebGL 2 without touching the game's maths:
OpenGL path, layouts WebGL can't take dropped, cube map arrays as 2D arrays (`zmCube`, six layers a
cube), `textureGather` as four exact texel reads (`zmGather`), desktop GLSL's implicit int / uint /
float conversions written out. All 1,171 dumped shaders translated into `webgl/<hash>_<ps|vs>.glsl`
(+ `index.json`): 1,170 compile in WebGL 2 (all 468 pixel shaders; the one left uses a transform
feedback buffer).

Next: feed them what the game does. Each needs its inputs (varyings passParameterSemN from its vertex
shader, or ours producing the same), its textures by unit (G-buffer in the game's encodings, shadow
map, cubemap, lookup textures) and its constants (uf_remappedPS from the probe; uf_blockPS blocks too,
not probed yet). First target: the light pass as a full-screen pass over street view's own G-buffer,
then the terrain's material shader.

## The light pass running on street view (`lightpass.js`)

probe-6 (the probe's second stretch, row 241x) gave the light pass's interface: it runs at 640 x 360;
passParameterSem0 = (u, v, -(2u - 1) / P[0][0], (2v_down - 1) / P[1][1]) (the camera ray), Sem6 =
(u, u, u, v), Sem2 = (9.875, 0.5, 0.797, 0.0266) from its vertex shader. Its images, by size and
centre value: PS2 albedo, PS3 view normal * 0.5 + 0.5 (alpha: material id 65 / 255), PS4 black (all
1280 x 720); PS6 linear depth and PS14 white (AO / shadow mask) at 640 x 360; PS5 1024 x 1024 (the
clouds' shadow, through the projector constants); PS0 64 x 64 noise; PS11 (256), PS12 (96, world
space at 2 m a pixel via C[9]), PS15 (160 x 90), PS17 (4 x 1) black at the centre.

`lightpass.js` makes every street view material also write albedo and view normal into a G-buffer,
turns the depth into the game's linear depth, and runs `webgl/bec68ec6_ps.glsl` (the game's own
shader) at 640 x 360 with the probed constants (camera rows and sun replaced by ours each frame).
It works: output 0 shadow / parameters (sky apart), output 1 the fog (thickening with distance, the
probed colour), output 2 the sky's light (flat for now: one sky colour in place of the game's cube
map), output 3 the scene lit, output 4 the albedo's brightness.

Output 3 is the lit scene itself (BotW lights its opaque surfaces in this pass, deferred), output 1
the fog. The rest of the game's chain, from probe-6's second stretches:
- `b4a72958`: a depth-aware upsample (Sem0 = (u, v, u * 640, v * 360); PS0 the half-resolution
  image, PS1 full-resolution linear depth, PS2 half's; it compares depths with a texture gather and
  steps toward the closest) to 1280 x 720.
- `37040a48`: the tone map. HDR (PS1) + bloom (PS0, 320 x 180), `1 - exp(-x)`, mixed between per
  channel and by luminance with C[0] = (0.99, 0.18, ...). Its output is the final image.
- the sky: `250cb5a0` renders a scattering lookup table (256 wide, half float); `53422d4f` /
  `4e21d093` read it (with the sun, ground colour (0.5, 0.4, 0.3), the scatter fog colour) into the
  faces of the sky's cube map array. The sky in the picture is drawn after the light pass, where
  nothing else is.

`lightpass.js` now runs light pass -> upsample -> sky -> tone map, all but the sky with the game's own
shaders, and `ZCompare.run('field-day', ZLightPass.frame)` scores it against the game's frame:
- street view's own lighting: mean luma difference 47.9 (later 53.4 with the real sun);
- the game's light pass + upsample + tone map, street view's sky: **33.7**; sky bias (+11, -13, -4),
  ground (+28, +3, +6).
The sky cube the light pass reads (PS7) is street view's scattering sky in the shader's own layout
(world (x, y, -z), faces +a -a +b -b +c -c at minor / 2|major| + 0.5); three r160 can't draw into a
layer of an array target, so faces are drawn into a plain target and read back.

Checked against the game's own G-buffer for the field-day frame (`reference/field-day-albedo.png`,
`-normal.png`, decoded from the capture's `49270` / `49261`; their alpha channels split off into
`-albedo-id.png` / `-normal-a.png`): street view's albedo on the ground matches the game's within
(+4.5, -1.4, -0.6) and its normals within (-0.5, +3.8, -0.6). The game's albedo alpha is the surface
type (0 ground, 1 objects, 2 foliage; the light pass reads its upper bits as specular); its normal
alpha a gloss (ground ~17..33 / 255; the light pass picks the cube's mip level by it).

Feeding the light pass street view's own sun shadow as its shadow mask (PS14, from a fourth G-buffer
output) and a gloss from each material's roughness: **27.1** (ground bias (+9.6, -12.7, -3.6)).
Adding output 1 (fog) on top made no difference here (+3 on the ground) and how the game blends it
isn't known yet, so it's left out. The bloom chain starts with `10584c6f` (a bright pass: 2x2
average, luminance 10 x (0.2989, 0.5866, 0.1144), threshold); `38d70ed9` tints it.

Next: the game's fog blend (output 1: which pass applies it), bloom (the tone map's PS0), the sky
from the game's own lookup table and cube shaders, the terrain's colours (the foreground dirt is too
red), and then making this street view's renderer (it's a dev module; the cube read-back only when
the time changes).

## Live: street view draws with the game's shaders (`scripts/controls/StreetViewGame.js`)

`tools/build_streetview_shaders.py` ships `images/3d/botw/streetview/gpu/`: `light_ps.glsl`
(bec68ec6), `upsample_ps.glsl` (b4a72958), `tonemap_ps.glsl` (37040a48), translated, and
`constants.json` (probe-6). `StreetViewGame.js` is lightpass.js made street view's renderer:
G-buffer (every solid material also writes albedo, view normal + gloss, the sun's shadow) -> light
pass at half the window -> upsample (its C[2] the actual half size) -> the sky where nothing else is
-> what you see through (water, layer 1) forward over it, depth tested against the G-buffer ->
tone map to the screen. The shadow map renders once a frame; the sky cube is refilled only when the
time changes. If the shaders don't load, street view draws as before (the composer).

- The tone map passes Sem0.w through as alpha (the game's 0, ignored by its 10-bit output; a page's
  canvas would show nothing), so its vertex shader gives 1.
- The sun's strength and colour are street view's for the hour (C[15].w, C[32]: noon x 5 = the game's
  9 and (9, 8.29, 6.74); reddened at sunset; the moon at night). The probed constants were for 3:25
  PM, so the setting sun kept lighting everything at night before.
- PS5 (the sun's visibility under the clouds, through the projector) is white for now: the game makes
  its own while it runs; the clouds' shadow texture as it is came out far too dark.
- field-day, live: **27.5**. 11.6 ms a frame at 1059 x 940 (the forward path: 12.9).

Back behind a switch (?streetview=game, or localStorage zm-streetview-game = 1): by eye it looked less
like the game than the forward path, though it scored better on the one field-day frame (which is
mostly sunlit ground). Side by side at the field-day spot: the glows are gone (the G-buffer carries
no emission: the Sheikah platform dull gold, the tower's lights out), whatever faces away from the
sun is far too dark (the tower nearly black: the fill light from the sky cube is much weaker than the
game's), and the grass and dirt too saturated and orange. To fix before it's the default again, and
judge by eye at several spots as well as by score; more reference frames (other spots, shade, glow)
so the score can't hide this again.

## Five references (`reference/index.json`, `tools/extract_reference.py`)

From ordinary captures (no probe pack): the frame, its camera and its light come from the capture
itself (the light pass's constants found by their shape in the buffers: C[0].x = 24999.9, unit camera
rows with a world position, unit C[15]). Night and weather are set by eye (clear sun: strength 9,
(9, 8.29, 6.74); overcast 3:45 PM: 4.5, (3.83, 4.5, 3.52); cloudy 4:50 PM: 7, (7, 4.56, 3.15); cloudy
sunset 6:55 PM: 4.09, (3.68, 2.19, 2.20); dusk 8:50 PM: 1, (1, 0.63, 0.64)). A capture can keep a
no-HUD picture from an earlier moment (another place): then the HUD's frame is the reference and
compare.js leaves out its corners (`hud_in_frame`).

- field-day: outside the Shrine of Resurrection, 3:35 PM, clear.
- dusk-temple: the Temple of Time, 8:50 PM (HUD frame).
- glow-shrine: the shrine by the Shrine of Resurrection, 3:45 PM, overcast: its Sheikah glow.
- trees-afternoon: trees and grass, 4:50 PM, cloudy, low sun (HUD frame; Link running).
- wide-sunset: the overlook, 6:55 PM, sunset, looking north (beyond the plateau: horizon only).

Mean luma difference (lower is closer), the forward renderer / the game renderer:
field-day 47.7 / 27.5; dusk-temple 41.1 / 6.6; glow-shrine 72.3 / 55.1; trees-afternoon 44.1 / 46.6;
wide-sunset 85.5 / 39.6. The measure is overall colour and brightness: it barely weighs the glows,
the shade's darkness or the saturation, which is what looked wrong by eye. trees-afternoon (shade) is
the one the game renderer loses. Neither renderer has weather (overcast / cloudy skies).

## Glow and shade fixed in the game renderer

- Glow: the light pass's lit output is lit + PS4 x (bit 0 of the albedo alpha, int(a * 255)). PS4 is the
  emission: every material now writes three's totalEmissiveRadiance into a fifth G-buffer output (PS4)
  and sets that bit (1.5 / 255: half float gives 1 / 255 back as 0.9996, which truncates to 0).
- Shade: PS14's x and w are the sun's shadow (blended into its visibility), its z another occlusion term
  (the game's 1 where lit): shadow there darkened the shade twice. Now (shadow, 1, 1, shadow).
- Scores, the forward renderer / the game renderer now: field-day 47.7 / 26.9, dusk-temple 41.1 / 6.6,
  glow-shrine 72.3 / 55.0, trees-afternoon 44.1 / 42.6, wide-sunset 85.5 / 39.5: closer on all five. By
  eye at field-day: the Sheikah platform glows blue again, the tower lit (no longer black). Still:
  the foreground dirt too bright and red (the ground's shape and colour there), the sky deeper blue,
  no weather; trees-afternoon's mid-distance trees are missing in street view (its hill shows through).

The game renderer is street view's default again (2026-11-22, at the user's word after the glow and
shade fixes); `?streetview=classic` or localStorage `zm-streetview-game = 0` gives the forward renderer.

## Bloom, and how bright the game's glow is

- The bright pass (`10584c6f`, constants C0 = (10 x Rec.601 luma weights, -20), C1 = (640, 0, 0.1, ...))
  averages 2 x 2 HDR pixels, L = 10 x luma, t = clamp(L - 20 x alpha), out = colour x t x
  min(1, 640 / L) x 0.1. The HDR's alpha is a per-pixel bloom threshold: the light pass writes 1 (so lit
  pixels bloom only above luma 2). It matches env.sgenvb's bloom (intensity 0.1, clamped_luminance 64).
  The tone map adds the bloom to the HDR unscaled. Street view: bright at half size, a 9-tap gaussian
  blur H and V at quarter size (the game's own blur chain, `ex_iteration` 2, isn't ported yet).
- With the HDR alpha forced to 0 everything blooms: glow-shrine and wide-sunset got worse (59.9, 45.1),
  so alpha 1 is right.
- Why bloom showed nothing: our glow was ~10x too dim. The glow capture's full-size RG11B10F image (the
  emission and sky before light, `MTLTexture-288623`; decode: 11/11/10-bit floats, rolled -320 px)
  has the shrine's glow as exactly k x (0.0252, 0.25, 1), k up to 36 where its mask is full. The light
  pass adds PS4 as is, so PS4 must hold that. The shrine materials' colour is `uking_emission_color` 205
  (an index the game fills at runtime, not in the material or env.sgenvb; env only has
  `model_scene_light/emission_intensity` 1). StreetViewGame.js now writes mask x (0.9, 9, 36) for
  `Mt_DgnObj_DungeonEntrance_*`. Other glow materials use other indices (202 shutter light, 400 decals,
  ...), and Map3D's `glow` flag also catches non-Sheikah things (Korok pinwheels, Gerudo lamps,
  stable glass), so they keep street view's colour until their colours are measured.
- Scores now: field-day 27.0, dusk-temple 5.1 (was 6.6), glow-shrine 54.5 (was 55.1), trees-afternoon
  43.0, wide-sunset 39.6 (the last two unchanged within noise). glow-shrine's gap is now mostly its weather.
- To do it for every material: carry `uking_emission_color` into the glTF extras (gltf_writer.py) and
  measure each index's HDR colour from captures.

## Still unknown

The constant values (sun direction and colour, ambient, fog, exposure). They're in the capture's
buffers but unlabelled; the lighting shaders read them as `uf_remappedPS[n]` registers.

## Driving the game to reference spots (2026-11-23)

- Cemu has no save states. `tools/botw_save_spot.py` writes Link's position (`PlayerSavePos`, a
  CRC32-hashed flag in `game_data.sav`) into a save slot, so the game's own load puts him there.
  Back up the save folder first; edit only while the game isn't running.
- Backup of the saves before any edit: `~/Library/Application Support/Cemu/save-backups/botw-20261123-015356`.
- Slots now: 0 field-day (moved 15 m out: 4 m ahead of the camera put Link inside the Shrine of
  Resurrection under the pedestal), 1 dusk-temple, 2 glow-shrine, 3 field-day again (the newest
  slot, top of the load list), 4 trees-afternoon, 5 wide-sunset. The list is sorted by save time:
  16:53 = slot 3, 16:47 = 2, 16:46 = 1, 11:27 = 0, 11:24 = 5, 11:22 = 4.
- Boot straight into the game with capture on:
  `open --env MTL_CAPTURE_ENABLED=1 -a /Applications/Cemu.app --args -g ".../code/U-King.rpx"`
  (the game list window opened off-screen and couldn't be captured).
- Keys (Cemu keyboard profile): A e, B q, + return, - m, stick wasd, camera ijkl, d-pad arrows.
  Background key presses arrive as taps too short for the game (it reads input once a frame,
  ~15 fps in game), so about a third register; one key per call works on menus. Held keys need
  full-screen control. Posting CGEvents to Cemu's pid from a script didn't register either.
- Spawned at night (10:15 PM): the save keeps the time of day it was made.

## The display is sRGB-encoded (2026-11-23)

A window screenshot of Cemu at the field-day spot, and a frame capture straight after
(`captures/display-check.gputrace`): the capture's final image (RGB10A2) sRGB-encoded matches the
window to 4.7 levels of 255 (gamma 2.2 also 4.7); as stored, 65 apart. So the game's final image is
linear and the console's video out encodes it. The references are now encoded (re-encoded from
their own frames in the captures; field-day <- field-day.gputrace, dusk-temple <- shade, glow-shrine
<- glow, trees-afternoon <- trees, wide-sunset <- wide), and StreetViewGame.js encodes after the
tone map. Scores in catalog.md. `cemu_capture.py` now waits for Cemu to stop before ending the
capture (a capture that didn't wait took Cemu down).

## The terrain shader (`fb2d0efc`, `583ea860`): what it reads (2026-11-23)

- Inputs: Sem0-5; uniform blocks PS1 (18), PS6 (46), PS8 (33), PS11 (4096: the material table
  from row 9), PS12 (20), PS13 (15). Writes outputs 0, 1, 3, 7 (the G-buffer).
- Textures: PS7, a texture array of per-tile material maps (xy x 255 = the two material indices;
  layer from `uf_blockPS12[17].x`, uv scale/offset `[19]`); PS8, a texture array of per-tile normals
  (layer `uf_blockPS12[12].x`, scale/offset `[14]`; a second tile through `uf_blockPS13[12]`/`[14]`,
  blended by Sem0.w: neighbouring LODs); PS9 and PS10, the material arrays (PS10 sampled four times:
  both materials at their scale and again at x 0.1317 with bias -3.75, a far-off variation; PS9
  twice); PS0, PS1, PS3 2D.
- The material table, `uf_blockPS11[mat + 9]`: (u scale, v scale, layer, w); w's integer part / 4096
  and its fraction are two more per-material parameters (one goes into -3.5 x + 3).
- Rows 0-8 of PS11 before the table: (16000, 800, 1/16000, 1/800), then (1023, 1/1023, ...),
  (511, ...) x2, (63, ...), (255, ...): the world and tile sizes the shader works in.

Porting it as the light pass was (translated, run on street view's terrain) needs its vertex shader,
the blocks' values (found in captures by their shape, or with the probe pack extended to uniform
blocks), and the per-tile arrays (PS7, PS8) built from the `.mate` and `.hght` tiles the way the game
builds them.
- Its vertex shader: `deb54731c50e044d` (24 constants) or `1ea67b0ef250849e` (27; a variant), both
  writing Sem0-5. One attribute, two big-endian u32 per vertex (the vertex's place in a tile's
  grid); heights from texture array VS0 (`textureLod`, by LOD), and two more arrays VS1 (xy) and VS2
  (x). So the game keeps the loaded terrain tiles as GPU texture arrays (heights; material maps;
  normals) and draws a generic grid over them. A frame capture holds those arrays as they were:
  next, find them in field-day.gputrace (array slices of the tile sizes), and compare with the
  `.hght` / `.mate` tiles to learn how the game lays them out; the constants (uf_remappedVS) can be
  read with the probe pack (vertex shaders not yet patched by it).
- The capture's terrain arrays: 179 R16 256 x 256 images (format 20) are the height tiles (one is all
  Hyrule at the coarsest level), but stored GPU-tiled (a shift plus tiling: no exact match after any
  shift), so not readable directly. Not needed: they're the `.hght` / `.mate` tiles, one per layer.
  What a port needs is which layer and region each draw covers: the vertex shader's constants.

## BotW's terrain is a geometry clipmap (2026-11-23)

Each terrain draw's vertex constants are a 17-row block in the field-day capture's uniform buffer
(`MTLBuffer-7`, found by the shared header row (16000, 800, 1/16000, 1/800) at its row 9):

| row | holds |
|---|---|
| 0 | (1, 1, 720, 720) |
| 1 | (layer, lod, layer, 0.7833): the level's layer in the height array, its mip |
| 2 | grid -> local: (scale x, scale y, offset x, offset y); varies per draw (the level's patches) |
| 3 | local -> uv in the array: (0.99902, 0.99902, offset u, offset v) (toroidal: offsets move) |
| 4 | local -> world: (size m, 0, x0, z0) |
| 5 | (0.5, 0.5, ...): centre, for the LOD fade's distance |
| 6 | (0.5, 0.5, 8.533, -3.167): fade = clamp(8.533 d - 3.167), d = max(|x - 0.5|, |z - 0.5|) |
| 7 | the coarser level: (layer, lod, layer, 0.7833) |
| 8 | the coarser level's uv transform |
| 9 | (16000, 800, 1/16000, 1/800): world size, height range |
| 10-12 | camera rotation (view) |
| 13-16 | projection / view rows |

Seven nested levels follow the camera, each snapped to its own grid:

| layer | lod | size | x0, z0 | draws |
|---|---|---|---|---|
| 7 | 1 | 62.5 m | -700.89, 1484.62 | 648 |
| 7 | 2 | 125 m | -732.64, 1453.87 | 408 |
| 6 | 2 | 250 m | -794.15, 1392.36 | 344 |
| 5 | 2 | 500 m | -921.13, 1269.35 | 304 |
| 4 | 2 | 1000 m | -1175.10, 1015.38 | 272 |
| 3 | 2 | 2000 m | -1667.16, 523.31 | 240 |
| 2 | 2 | 4000 m | -2651.29, -492.56 | 240 |

(Camera at -669.29, 1516.15: every level's centre within 0.3-18 m of it. Draw counts include the
shadow passes.) The height array's layers are those levels, refilled from the `.hght` tiles as the
camera moves and written toroidally (why the captured R16 images looked shifted). The finest level
is 62.5 m over 256 samples, 0.244 m apart: the finest `.hght` resolution. The material and normal
arrays (PS7, PS8) are the same clipmap for the `.mate` tiles and the normals.

So to port the ground: build these levels round street view's camera from the `.hght` / `.mate`
tiles (each level sampling the tiles at its own spacing, as the game's areas nest), fill the arrays
the same way, and draw the grid with the game's own vertex and pixel shaders (`deb54731`, `fb2d0efc`)
with these constants per draw. Still to read: the grid's vertex layout (the attribute's two values)
and patch scheme (row 2 per draw), and how the normal array (PS8) and VS1 / VS2 are made.

## Street view's ground drawn with the game's terrain shaders (2026-11-23)

`scripts/controls/StreetViewTerrain.js`, started by StreetViewGame.js (`?streetview-ground=own` for
the old baked ground):
- Tiles: `tools/build_terrain.py` exports every `.tscb` area over the built sections, and every area
  1 km or larger in Hyrule, losslessly: `terrain/h/<area>.png` (height high byte, low byte, the
  .mate flags) and `terrain/m/<area>.png` (the two materials, the blend), plus `terrain/index.json`.
  989 tiles, 89 MB.
- Levels: seven, 62.5 m to 4 km, 256 cells each (257 texels), each snapped to twice its spacing
  round the camera; a level uses the areas at least its own size (the game's detail for that
  spacing), coarsest painted first, bilinear heights, nearest materials. Normals from the heights.
  Arrays: VS0 heights (R32F, / 800), VS1 normals, PS7 materials, PS8 (normal, blend, flags); VS2
  (water) empty for now.
- Shaders: `gpu/terrain_vs.glsl` / `terrain_ps.glsl` from build_streetview_shaders.py; uniform blocks
  as plain arrays (the material table trimmed to 265 rows). Found by drawing them: **PS9 is
  MaterialAlb, PS10 MaterialCmb; the game's output 1 is the albedo, output 3 the normal.**
- Constants made per level from their meanings (the per-draw block, above): C0 layer, C1 grid ->
  local, C2 / C7 / C10 / C13 local -> texel centres, C3 local -> the coarser level's local, C4 local
  -> world, C5 the edge fade (the game's 8.533, -3.167; none for the coarsest), C8 the header,
  C14-16 view rows, C17-20 projection rows, C21-23 the coarser level for water. PS1 the camera block
  (row 17 the game's constant), PS6 rows 43-45 view -> world, PS8 row 28 (wetness) 0, PS11 the
  material table, PS12 / PS13 this and the coarser level's arrays. PS0 / PS1 (the G-buffer under,
  for blending into objects) empty; PS3 far.
- Harness additions (not the game's): a coarser level discards pixels inside the finer level's
  square; the sun's shadow from three's shadow map (3 x 3 samples) into the shadow output; the
  horizon's ground discards within 1.95 km. Street view's own terrain meshes stay for walking,
  raycasts and grass, drawing nothing.
- field-day: frame ΔE 16.6 -> 16.3, albedo ΔE 13.9 -> 12.9 (pixels over 10 apart 30% -> 24%),
  normals 27.8°. Visibly the game's ground: grass, dirt, the path.
- Still: the green mound under the tower (in the terrain data; the game shows ruins there:
  unexplained); water (VS2) and wetness; the game's grass; material textures at 256 px (the game's
  are 1024 / 512); levels refill whole (the game updates toroidally).

## The game's water: its shaders (2026-11-23, porting in progress)

- Pixel shader `2e2543216c04766d` (named by the RemoveFog pack: water colour, edges, distant water
  fog). Register constants (uf_remappedPS[14]: the probe pack reads these); inputs Sem0, Sem4, Sem6;
  one output (drawn over the lit image). Textures: PS1 and PS2 (2D at a screen position: the scene
  behind, for refraction), PS4 (2D .x: depth), PS6 and PS7 (gathered at the screen position: depth /
  shadow), PS8 the sky cube array (as the light pass's PS7: reflections), PS10 a 2D array (the water's
  normal maps: Terrain.Tex1 `WaterNrm`), PS11 and PS13 (2D).
- Vertex shader `7af8fda57eae0289` (outputs Sem0, Sem4, Sem6; uf_remappedVS[13]): real meshes, not a
  grid. Attributes: Sem0 four half floats (position), Sem1 a 10-10-10-2 normal, Sem8 two u16 (uv),
  Sem12 four u8 (per vertex: likely flow or depth). VS0 a 2D texture sampled at world x 0.0223 with
  time (waves), plus sine waves of its own. So the game builds water meshes from the `.water.extm`
  tiles on the CPU (one surface; the terrain hides it where the ground is higher).
- Not in field-day's capture (no water there). Next: a capture by water. A pond 80 m from field-day:
  centre (-633.6, 1575.0), water at 162.84 m, type 6; Link placed on its south shore (-638, 166,
  1558) with botw_save_spot.py, in slot 3 (the newest).
- Pond capture taken (`captures/pond.gputrace`, Link on the pond's south shore at 6:40 PM; window
  screenshot in the scratchpad). The water's vertex buffer couldn't be found by searching memory: the
  capture's big buffer (`MTLBuffer-2155`, Wii U memory) has no run of 20-byte records with up normals
  or with the pond's height (162.84) as a position (the matches are instance-like records with one
  changing field). The trace's own command records (`capture`, `unsorted-capture`: Apple's binary
  format, records like `Ctululul`) would say which buffer and offset each draw binds, and its Metal
  sources (the hex-named files) include the water shaders' Metal versions (several candidates by
  their interface). Not parsed yet.

## The game's water is drawn in two passes (2026-11-23, from the water probe)

`tools/build_water_probe.py` (pack `ZeldaMapsWaterProbe`, now off) and `tools/read_water_probe.py`
(reads every image of a capture, any format, by marker). What it showed:
- The shader the RemoveFog pack calls the water's colour (`2e2543216c04766d`) runs in a full-screen
  pass, not on the water's meshes: its vertex shader is `4721609a424e9a1f`, which makes a full-screen
  triangle from the vertex index at depth (C0.z / 255 - 0.5) x 2 (an ID). So the water is drawn
  first as meshes (vertex shaders `7af8fda57eae0289` and its twin `7af8fda99eae0289`, which reads
  Sem8 as two half floats instead of two 16-bit fractions), which leave the water's type / ID in
  depth (and whatever else the shading pass reads: its PS1, PS2, PS4, PS6, PS7 images), then a
  full-screen pass per water type shades the pixels whose depth matches. Siblings of 2e2543 with the
  same inputs: `9fbeb9714fd898d1`, `3179b85d41bfb80d`, `556c05fb25791fec`, `bede6707b02b5fed`.
- The full-screen pass's inputs: Sem4.zw = (1/640, 1/360) (a half-resolution texel), its constants:
  far 24999.3, near / far, the (0.829, 0.466, 0.873) row the terrain has too, the camera's rows.
- Not found: the pixel shader the water meshes are drawn with. None of the five above wrote the
  probe when the meshes' vertex shaders were patched (it may write depth only, or take fewer
  inputs). Any added varying between 7af8fda5 and a pixel shader left the water undrawn (a
  mismatched pair: the twin wasn't patched then).
- Next, without the game: the trace's command records (`capture` / `unsorted-capture`) name each
  draw's pipeline, buffers and offsets: decoding them gives the water draw's vertex buffer exactly,
  from `captures/pond.gputrace` (no probe, the pond in view).

## Reading a frame capture's commands (2026-11-23)

The `.gputrace` bundle's `capture` and `unsorted-capture` are lists of records: `u32 size`, `i32 function
id`, 0x18 bytes, then a type signature string (`C` the encoder, `t` an object, `ul` an 8-byte value,
`U` a string...), 4-aligned, then the arguments as 8-byte values, then a backtrace. Decoded so far:

| id | signature | call |
|---|---|---|
| -16279 | `Ct` | set render pipeline (pipeline object) |
| -15275 | `Ctululul` | set vertex buffer: buffer, offset, stride (-1), index (30, 28, 27, 25, 22, 21, 15... the vertex streams) |
| -15274 | `Cululul` | set a vertex buffer's offset: offset, stride, index |
| -16263 / -16222 | `Ctulul` / `Culul` | uniform buffer: buffer, offset, index / offset, index |
| -16217 | `Cululultulullul` | indexed draw: primitive (3 triangles), index count, index type (1: u32), index buffer, offset, instances... |
| -16261 / -16259, -16276 / -16274 | `Ctul` | textures / samplers: object, index |

`device-resources-*`: `-10237 CU<b>ulul` names each buffer file (`MTLBuffer-N-0`) and gives its object
(after a `t`); `-16305 CU<b>Ut` makes a library from a Metal source file (the hex-named files),
`-16290 CS` its function `main0` (the object after `t`); `-16303 CUt` makes pipelines (named by a
descriptor that isn't in the bundle: pipelines made before the capture can't be tied to their shaders
this way). `store0` is zlib chunks of resource data, not commands.

In `pond.gputrace`: buffers `MTLBuffer-2155` (the guest memory: every vertex stream), `6327` (indices,
u32 little-endian), `7` (uniforms). Only ~300 draws were captured (141 in `capture`), a slice of the
frame; none has a mesh whose normals all face up, so the pond's water draws aren't in it. The two
water vertex shaders used that frame: Metal sources `32036B58C786D8D1` and `CDC0FE82F0D22EEF`
(functions `0x7fba2b475d10`, `0x7fba2b476480`).
- A 2-second capture (`captures/pond-long.gputrace`, the pond in view, no packs): 11,378 indexed draws,
  377 pipelines; `tools/read_capture_draws.py` lists them with their bindings. Pipelines are tied to
  their interfaces by `device-resources` reflection records (-12272 after each pipeline: its binding
  names; `Ciululbbbulb` after `uf_remappedVS` / `uf_remappedPS` gives the constant count): 24
  pipelines have 13 vertex constants (the water vertex shader's count), but other shaders share it,
  and the pipeline records don't name their shader functions.
- What stops it: the trace keeps a buffer as it was at the capture's start, plus numbered versions
  for buffers rewritten during it (`MTLBuffer-7-0` .. `-7-23`, the uniforms ring; `MTLBuffer-8-*`);
  which version a draw's bindings read isn't known, so per-draw constants and index data come out
  mixed. (The memory mirror is `MTLBuffer-2169` in this capture, `2155` in the first; the index
  buffer `6684`.) Metal keeps vertex-buffer bindings across pipeline changes (the reader's per-
  pipeline reset is wrong). Next, if picked up: tie buffer versions to command buffers (the
  records' command-buffer boundaries), then read each candidate draw's constants from its version.
- **Buffer versions (solved):** a `-10240 CtU<b>ulul` record in `capture` marks where each version of a
  rewritten buffer starts (the buffer's object, its file name `MTLBuffer-N-v`); a draw reads the latest
  version named before it. read_capture_draws.py follows this.
- **Index type:** `-16217`'s index type 1 reads as 16-bit indices here.
- **Textures:** `-16276` / `-16261` bind vertex / fragment textures (object, index); `-16274` / `-16259`
  their samplers.
- **Render passes (solved):** `-16353 CU` begins a pass and names its descriptor; descriptors (and other
  blobs) are in `store0` (zlib) by the `index` file ('xdic': hash table, then per name a 24-byte record:
  size, compressed size, offset into store0, flags; then the names' lengths (u16), then the names).
  A pass descriptor's colour attachment 0 is the texture object at byte 0x18, depth at 0xa0. 1,611
  passes in pond-long.
- **Pipelines to shaders:** pipeline reflection (`-12272` after each `-16303`) lists binding names; the
  uniform buffer's parameter name (`_536`...) is the Metal source's `constant ufBlock& _536`, so a
  pipeline can be matched to its vertex / fragment Metal sources by those names plus the declared
  `int4 uf_remapped?S[n];` (the declaration, not code reading entry n). In pond-long no vertex shader
  has 7af8fda5's interface (Sem0, 1, 8, 12, 13 constants): it isn't what draws the pond.
- **The water shading pass in pond-long:** pipeline `7f8013ee0800` (pixel shader param `_417`, vertex
  5 constants), draws 3696 and 7570, one full-screen triangle a frame, in pass `8AD648716493BA90`
  (colour `7f8006b0a520`, depth `7f8006af0e50`). Its depth is written just before by draw 3693
  (pipeline `7f8005caf200`: a full-screen draw sampling texture `7f80255328a0` in both stages and
  writing depth: a depth copy). That source texture is never drawn into during the capture (made
  earlier: its descriptor `3AA49A42F111D4C8` in the index isn't a plain texture description). Next:
  what fills `7f80255328a0` (an earlier frame, or a copy: Cemu's `vkCmdCopyImage` blit records), and
  the passes that write the shading pass's other inputs (its fragment textures).
- **Where the water IDs come from:** the depth copy's source `7f80255328a0` is a texture *view*
  (`texture-views`, then `-15775`: format 30, RG8) of `7f7ff18808b0`, a 1280 x 720 target that most of
  the frame's main G-buffer passes draw into (depth `7f7ff1be3c70`). So water pixels are marked in a
  G-buffer channel (a material / type ID) by whatever draws the water surface inside the ordinary
  G-buffer passes; the depth copy turns that ID into depth for the per-type full-screen shading.
- **Searching those draws:** `read_capture_draws.py --up [--loose]` now tests only the vertex streams
  bound fresh for each draw (others are left over from earlier draws). Flat meshes found and decoded
  so far (draws 170, 173, 338, 594, 1254, 1504, 2157, 2166) are small objects or camera-relative
  meshes, not the pond: e.g. 1504 a 9 x 2 m flat piece at (-465, 120, 1844); 338 a vertical strip
  (float x, y, z = 2.12, then normal, tangent, colour: 24-byte records). The pond's surface draw is
  still unidentified.
- Ideas not yet tried: decode the captured `7f7ff18808b0` image (its file from the index) to see which
  value marks the pond's pixels; then the draws in the G-buffer passes whose pixel shader writes that
  value (by pipeline, each pipeline's fragment source); or a probe pack patching the G-buffer pixel
  shaders that write the ID channel.

## Found: the game's water surface is a clipmap, like the terrain (2026-11-23)

- **The pond's pixels:** the G-buffer target `7f7ff18808b0` (file `MTLTexture-141398`, RG8, rolled by 640
  pixels as stored) holds a material ID in red: the pond is **22** (green 1 there); the ground 4, Link
  8 / 12 / 10 / 13, sky 0. That channel, viewed as RG8 and copied to depth, is what the full-screen
  water shading tests against (one draw per water type).
- **What writes 22:** fragment shaders writing the constant 22 / 255 (`0x3db0b0b1`) into G-buffer
  outputs 0, 1, 3, 5: param `_145` (20 constants), `_207` (11), `_199` (14). Pipelines with `_145`:
  `7f8007254200` (403 draws in the capture, ~134 a frame), `7f8007253200` and `7f802f8aae00` (48 each,
  16 a frame): clipmap patches, in the main G-buffer passes (colour `7f7ff18808b0`, depth
  `7f7ff1be3c70`).
- **Their vertex shader:** Cemu `4ba8531637df52f4` (twins `4ba954d077db66b9`, `7b5b9f2fd4a624a6`):
  one attribute (the grid position, two big-endian floats, as the terrain's), uniform blocks VS1, 3,
  4, 5, 6, 8, 11, 12, 13, two texture arrays: **VS0 the water's heights per level** (`textureLod`), **VS1
  per-level water data** (xyzw; w x 255.996 = the water's type, which indexes `uf_blockVS4`, 6 rows per
  type: the per-type parameters). Blocks 12 and 13 are this level's and the coarser level's
  transforms (rows 5, 7, 9, 25-29: world origin, layer / lod, uv, grid -> local, the edge fade at row
  28), as the terrain's C0-C7. 11 outputs to its pixel shader.
- So the water is the `.water.extm` tiles laid into clipmap levels (heights; flow and type) and drawn
  as one surface over the whole field, the terrain in front where the ground is higher: exactly
  "one large mesh clipped by the ground". The port is the terrain's again: water arrays filled from
  the water tiles, this vertex shader and its `_145` pixel shader into the G-buffer (writing ID 22
  per type), then the ID-to-depth copy and the full-screen shading (4721609a + 2e2543 family).
- Not yet: the blocks' values (the reflection's binding order isn't the buffer index order: block 3
  reads as camera / light rows, others don't decode; they're in guest memory, `MTLBuffer-2169`); the
  pixel shader's Cemu hash (11 inputs: Sem 0, 1, 2, 3, 4, 5, 7, 8, 9, 10, 11).

## The water ported: G-buffer pass (2026-11-23)

**The water tiles, as the shader reads them.** Each `.water.extm` texel (8 bytes) is four little-endian
u16s, which the vertex shader reads from VS1 (RGBA16 unorm) directly: x height (x 800 m: VS11[0].y = 800),
y / z flow (x 2 - 1, then x VS6[38].x x VS6[38].w = 40 on the screen-side Sem9.zw), w = flags | type << 8
(w x 255.996: the type as its whole part, its row (x 6) in the type table VS4 and its layer of the water
textures; the flags byte as the fraction, which with VS11[7] picks a depth bias). **Every texel has a height:**
where there's no water it lies ~0.4 m under the ground, and the depth test hides it. The flags byte is *not*
a water mask (a 125 m tile at the pond has it set on exactly its left half).

**The textures.** `Terrain.Tex1`'s `WaterNrm` (BC5, read as R, G, 1, 1: PS7, 8, 10, 11) and `WaterEmm` (BC4,
read as R, R, R, R: PS9), 512 px, 8 layers (one per type); their channel selects are the FTEX's compSel
(`00010505`, `00000000`). PS0 the scene's linear depth before the water, PS2 / PS3 the previous colour and the
G-buffer IDs (not ours: dummies).

**The constants (water probe, `pond-probe12`).** The probe (`build_water_probe.py --gbuffer`) writes the pixel
shader's inputs and constants a byte a pixel (red / green nibbles: the G-buffer targets are 2-channel), and the
water's full-screen passes copy their pictures raw into their output, because a Metal capture keeps every
picture as it was when the frame began: the G-buffer is overwritten by then, the full-screen pass's output
isn't. A block's 44 words are from 44 x 4 different pixels, so each word's world position is rebuilt from
its own pixel (screen x = raw x - 320). Results (`gpu/water-constants.json`):
- pixel shader rows: 0, 1 the view -> world **z** and **x** rows (that order); 2 (tan x, tan y, fovy rad);
  3.yz the flow phases (time); 4.x, 5.x, 6.x the depth's range; 6.zw aspect, 1 / aspect; 7, 8 refraction /
  colour offsets (0.15, 0.25); 9 the screen; 10 world up in view space (w: the camera's height); 11-18 the
  game's water values; 19 world x in view space;
- type 6 (the pond): rows (0.001, 0.00853, 0.00913, 0.99023), (0.015, 0.6499, 0.7998, 0), (0, 1.5, 1, 0),
  (1, 1, 1, 0.19995), (0.0075, 0.5, 1), waves (0, 0): a still pond;
- texture coordinates (VS8): Sem0.zw ~ world / 26, Sem1.xy rotated ~ / 16, Sem1.zw world / 20, Sem4 ~ / 400
  and / 250 (fitted; offsets 0 at the capture's moment).

**Port** (`StreetViewWater.js`): the terrain's seven levels (same squares; VS0 is the terrain's height array,
VS12 / VS13 [5, 7, 9] its level), a 65 x 65 grid per level (VS3 = (0, 0, 0.5, 0.5), VS5 = (2, 2, 0, 0): the
grid's 0-1 straight through; the shader's "x > 0.5" coarse-snap branch never taken), each level's water a
layer of an RGBA32F array filled from the tiles (height and flow bilinear, the type word nearest). Drawn
after the terrain into the G-buffer, depth tested; the pixel shader must keep an output at location 0 (a
draw without one fails: INVALID_OPERATION). Cells whose water lies under the terrain's lowest point in the
cell are left out.

Next: the full-screen shading pass (4721609a + 2e2543216c04766d), the other types' rows, the time rates.

## The water ported: the full-screen pass (2026-11-23)

`2e2543216c04766d` ("water colour, edges and distant water fog") after vertex shader `4721609a` (a full-screen
triangle: Sem0 = (u, v, the camera ray x, y: view x, y = -distance x them), Sem4 = (u x halfW + 0.5, v x halfH + 0.5,
1 / halfW, 1 / halfH: an edge-aware upsample's weights), Sem6.zw = (u, v)). Reads: PS1 albedo (w x 255, bit 0 a
flag), PS2 normal (x 2 - 1; w gloss), PS4 the linear depth (x C0.x + C1.x), PS6 / PS7 half-resolution depth and the
light pass's output 4 (gathered: edges), PS8 the sky cube (reflection: lod 3 and 3 - 3 x gloss), PS10 layer 1 the
light through the water (the G-buffer pass's output 5), PS11 the light pass's output 0 (x, z, w; z scales everything
but the lit surface), PS13 output 3 (the lit surface, added). Constants (water-probe3): 0, 1 the depth's range;
2 the field of view; 3 where the sky cube was made, in view space (a sphere of radius |p| + 200 round it: parallax
for the reflection); 4, 5, 9 world -> view rows; 6, 7, 8 view -> world rows z, x, y; 10 the sun in view space
and its strength (4 at the pond); 11 (0, 1, 0, 1); 12 (1, 0, 1, 0); 13 the sun's colour, 16.

The G-buffer pass's output 5 (R16 = PS2 layer 1 at the refracted screen point x (1 - fresnel), w 1) went straight
into the frame's full-size RG11B10 picture in pond-probe12 (the probe's pattern there, x ~0.99): the light through
the water. Street view draws it with the same shader into a picture of its own (waterT, sharing the G-buffer's
depth: less-or-equal, no depth write; what's under the water the last frame's picture, hdr2, as the game's is a
picture of before), then the full-screen pass over the light pass's upsampled picture where waterT's alpha is set.
