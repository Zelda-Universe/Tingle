"""Audit replacement map artwork against original full textures without moving POIs.

python align-map-upgrade.py <dump> <report.json>
Transforms map replacement pixels to original texture pixels; no assets are edited.
"""
import sys, json
from pathlib import Path
import cv2
import numpy as np

source, output = Path(sys.argv[1]), Path(sys.argv[2])
sift = cv2.SIFT_create(nfeatures=6000)
results = []
for new in sorted((source / 'maps').glob('*.webp')):
    name = new.stem
    folder = 'OoTR-110-UI-CustomTex-Map-Dungeon' if name.endswith(('_Main', '_Back', '_All')) else 'OoTR-110-CustomTex-Map-Field'
    old = source / folder / (name + '.png')
    entry = {'name': name, 'source': str(new), 'reference': str(old)}
    replacement = cv2.imread(str(new), cv2.IMREAD_GRAYSCALE)
    entry['newSize'] = [replacement.shape[1], replacement.shape[0]]
    if not old.exists():
        entry['status'] = 'no-reference'
        results.append(entry)
        continue
    reference = cv2.imread(str(old), cv2.IMREAD_GRAYSCALE)
    entry['oldSize'] = [reference.shape[1], reference.shape[0]]
    ka, da = sift.detectAndCompute(replacement, None)
    kb, db = sift.detectAndCompute(reference, None)
    if da is None or db is None:
        entry['status'] = 'no-features'
        results.append(entry)
        continue
    matches = cv2.BFMatcher().knnMatch(da, db, k=2)
    good = [a for a, b in matches if a.distance < .7 * b.distance]
    entry['matches'] = len(good)
    if len(good) >= 8:
        a = np.float32([ka[m.queryIdx].pt for m in good])
        b = np.float32([kb[m.trainIdx].pt for m in good])
        matrix, mask = cv2.estimateAffinePartial2D(a, b, method=cv2.RANSAC, ransacReprojThreshold=2, maxIters=10000)
        if matrix is not None:
            kept = mask.ravel().astype(bool)
            errors = np.linalg.norm(a @ matrix[:, :2].T + matrix[:, 2] - b, axis=1)
            entry.update(transform=matrix.tolist(), inliers=int(kept.sum()), medianError=float(np.median(errors[kept])), p95Error=float(np.percentile(errors[kept],95)))
            entry['status'] = 'aligned' if kept.sum() >= 12 and entry['medianError'] < 1.5 else 'review'
    entry.setdefault('status', 'unmatched')
    results.append(entry)
output.write_text(json.dumps({'assets': results}, indent=2) + '\n')
from collections import Counter
print(json.dumps(dict(Counter(e['status'] for e in results))))
