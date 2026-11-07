# Adult calibration and cross-age checks

The Adult recording contains 20 regional views (no dungeon floors). Provenance and
timestamps are in `adult-video-index.json`; all source hashes are strings.

## Artwork alignment

All 20 views have a terrain-derived transform. Nineteen pass the established
acceptance gate (20 training inliers, 10 consistent held-out matches, held-out
95th-percentile error below 2 original-texture pixels). The faded Wasteland has
only eight consistent held-out matches, so it remains flagged for review despite
its low measured error. Do not describe all 20 as independently verified.

45 visible heart/skull observations were recorded. One Hyrule Field skulltula
missed by template matching was measured manually, with provenance in the JSON.
The templates do not identify Big Poes, NPCs, chests, shops, or enemies.

## Scene-coordinate fits

Adult Zora River, Lake Hylia, Gerudo Valley, and Desert Colossus pass numerical
leave-one-out checks. These are candidate identity assignments, not approved DB
imports. Other regions have sparse observations or inconsistent fits.

## Independent age comparisons

`cross-age-calibration.json` registers Child artwork to Adult artwork using terrain
only, then compares observed icons without refitting their positions. Near-location
matches are one-to-one and are not assumed to represent the same source identity.

Diagnostic Child-model transfers predict Adult observations within:

- Death Mountain Crater: 0.90 original-texture pixels (2 hearts).
- Hyrule Field: 3.26 pixels (3 skulltulas).
- Lon Lon Ranch: 1.14 pixels (2 skulltulas).
- Gerudo Valley: 1.74 pixels (4 collectibles).
- Desert Colossus: 1.19 pixels (3 collectibles).

Adult Lake Hylia's model predicts four Child observations within 1.7 pixels. The
Child fishing reward (`MiniGame_Fishing_GetHeartPiece`) is about 35 pixels away.
Adult Zora River's model predicts both Child skulltulas and two Child heart icons
within 1.6 pixels; the two frog-reward icons disagree substantially. These are
reward-specific discrepancies, not grounds to distort the whole region transform.
The exact reason for those map-icon offsets has not been established.

Kakariko similarly has one large heart-placement discrepancy even when the model
is derived from its accurately fitting Child skulltulas. Keep that exception
explicit. No transfer is automatically approved merely because some points agree.

## Reproduce

```sh
python3 dev/assets/oot/calibrate-video.py --age adult --frames /tmp/zm-adult-frames
python3 dev/assets/oot/compare-video-ages.py
```

Requires OpenCV/NumPy, the extracted frames, original assets, and the Child reference
frame used for icon templates. These scripts only generate diagnostic reports and
previews. No runtime data, DB rows, migrations, or deployments are changed.
