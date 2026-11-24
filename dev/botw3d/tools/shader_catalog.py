#!/usr/bin/env python3
"""Catalog the shaders Cemu dumped (Debug > Dump > Shaders) from BotW: per shader,
its texture kinds, how many images it writes, inputs, constant blocks and length.

python3 shader_catalog.py <out.json>
"""
import os, re, sys, collections, json
D = os.path.expanduser('~/Library/Application Support/Cemu/dump/shaders')
rows = []
for f in sorted(os.listdir(D)):
    if not f.endswith('.txt'): continue
    t = open(os.path.join(D, f)).read()
    kind = f[-6:-4]
    samp = re.findall(r'uniform (sampler\w+) textureUnit', t)
    outs = len(re.findall(r'out vec4 passPixelColor\d', t))
    ins = len(re.findall(r'^layout\(location = \d+\) in ', t, re.M)) + len(re.findall(r'ATTR_LAYOUT\(\d+, ?\d+\) in ', t))
    blocks = [int(x) for x in re.findall(r'vec4 uf_block\w+\[(\d+)\]', t)]
    lines = t.count('\n')
    disc = 'discard' in t
    rows.append(dict(f=f, kind=kind, samp=samp, outs=outs, ins=ins, blocks=blocks, lines=lines, discard=disc))
json.dump(rows, open(sys.argv[1], 'w'))
ps = [r for r in rows if r['kind'] == 'ps']
print('pixel shaders by output count:', collections.Counter(r['outs'] for r in ps))
print('sampler types used:', collections.Counter(s for r in ps for s in set(r['samp'])))
print('array-texture shaders (terrain candidates):', sum('sampler2DArray' in r['samp'] for r in ps))
