# Child video calibration

Source video and timestamps: `child-video-index.json`. The 18 views are overworld
regions, not all dungeon floors or Adult variants. The video ends with the illustrated
world overview, which is deliberately excluded.

## Two distinct calibration stages

1. **Screenshot to artwork:** all 18 regions aligned using SIFT terrain features
   and robust affine estimation. Every fifth feature match is reserved from fitting.
   All regions have at least 23 consistent held-out matches; the 95th-percentile
   error of consistent held-out matches is below 2 pixels on the original Mini
   texture. Outlier feature matches are counted but excluded from that percentile.
2. **Scene coordinates to artwork:** source identities are proposed by exhaustive
   same-category matching with positive X/Z axis scales. Proposals are not reviewed
   identities and are never applied automatically. Leave-one-out tests reject
   underconstrained or inconsistent models. Two-point exact fits are explicitly
   provisional, not independently verified.

The 67 visible collectible observations are recorded in original 2560x1440 frame
coordinates and original Mini-texture pixel coordinates. Three observations missed
by template matching were added by manual measurement (two Fountain skulltulas,
one Valley skulltula; see the actual `method` fields for the recorded observations).
No missing icon implies absence of a collectible.

## Current findings

- Hyrule Field, Death Mountain Crater, Lon Lon Ranch, Gerudo Valley, and Desert
  Colossus pass the numeric source-model checks with all their observed markers.
- Kakariko's five-skulltula subset passes very closely, but its heart observations
  disagree with that model. Do not bend the skull transform to fit them.
- Lake Hylia's skulls agree closely in-sample but have weaker held-out geometry;
  its heart observations also disagree with a single all-marker axis model.
- Market, Graveyard, Lost Woods, and Zora River have significant discrepancies.
  These could include reward/map-icon offsets or an unsuitable projection model;
  the cause has **not** been established.
- Other regions have too few collectible control points to independently validate
  a general source-coordinate transform, despite accurate artwork registration.

## Reproduction

Extract full-resolution PNGs at integer second + 0.5 to
`/tmp/zm-child-frames/frame-<second>.png`. A working local decoder is
`/Applications/Beamer.app/Contents/Resources/ffmpeg`; the Homebrew ffmpeg installation
currently has a missing library. For each second:

```sh
ffmpeg -ss 24.5 -i '<source video>' -frames:v 1 /tmp/zm-child-frames/frame-24.png
```

Run `calibrate-video.py` with OpenCV and NumPy available; `--frames` and `--assets`
can point at other folders. This regenerates the JSON report and diagnostic JPEGs.
No database writes, migration, runtime changes, commits, or deployment occur.

All numeric candidates still require identity review before an import. Existing
marker IDs, bookmarks, completion state, and edited descriptions must be preserved.
