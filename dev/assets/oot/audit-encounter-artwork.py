"""Read-only alpha-mask audit for projected encounters and map-facing door references.
python audit-encounter-artwork.py <dump> <candidates.json> <maps.json>
"""
import json,sys
from pathlib import Path
import numpy as np
from PIL import Image
root=Path(__file__).resolve().parent
dump=Path(sys.argv[1]);data=json.loads(Path(sys.argv[2]).read_text());maps=json.loads(Path(sys.argv[3]).read_text())
submaps={str(s['id']):s for m in maps for s in m['subMap']}
alignment={a['name']:a['transform'] for a in json.loads((root/'hq-alignment.json').read_text())['assets']}
castle=json.loads((root/'scene-data/ganon-castle-calibration.json').read_text())
cache={}
def source_name(slug):
    files=[p for p in (dump/'maps').glob('*_Main.webp') if p.stem.replace('_','-').lower()==slug]
    # Asset slug also inserts hyphens at camel-case boundaries.
    import re
    files=[p for p in (dump/'maps').glob('*_Main.webp') if re.sub(r'([a-z])([A-Z])',r'\1-\2',p.stem.removesuffix('_Main')).replace('_','-').lower()==slug]
    return files[0].stem if len(files)==1 else None
def check(row):
    w=row.get('where')
    if not w:return {'visible':False,'reason':'unmapped scene'}
    if str(w['mapId'])=='65000':return {'visible':True,'reason':'calibrated overworld projection'}
    sm=submaps[str(w['submapId'])];name=source_name(sm['tileURL'].strip('/').split('/')[-1])
    if not name:return {'visible':False,'reason':'missing source texture'}
    point=np.array([w['x']*8-24,-w['y']*8-304,1])
    if name.startswith('InsideGanonCastle_'):
        pivot=castle['floorPivots'][name.split('_')[1]]
        m=np.array([[2/3,0,1000-pivot[0]*2/3],[0,2/3,720-pivot[1]*2/3],[0,0,1]])
    else:m=np.vstack([alignment[name],[0,0,1]])
    x,y=(np.linalg.inv(m)@point)[:2]
    if name not in cache:cache[name]=np.array(Image.open(dump/'maps'/(name+'.webp')).convert('RGBA'))[:,:,3]
    a=cache[name];ix,iy=round(x),round(y)
    visible=0<=ix<a.shape[1] and 0<=iy<a.shape[0] and bool(a[max(0,iy-3):iy+4,max(0,ix-3):ix+4].max()>128)
    return {'visible':visible,'texture':name,'pixel':[round(x,2),round(y,2)]}
print(json.dumps({r['key']:check(r) for r in data['markers']+data['doorCandidates']},separators=(',',':')))
