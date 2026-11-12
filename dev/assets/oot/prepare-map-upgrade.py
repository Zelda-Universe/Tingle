"""Normalize cropped HQ textures onto existing map coordinates; compose shared backs.
Usage: python prepare-map-upgrade.py <dump> <alignment.json> <output-folder>
"""
import json, sys, re
from pathlib import Path
import cv2
import numpy as np
from PIL import Image, ImageOps

root=Path(__file__).resolve().parent
source,audit,output=Path(sys.argv[1]),Path(sys.argv[2]),Path(sys.argv[3])
output.mkdir(parents=True,exist_ok=True)
entries=json.loads(audit.read_text())['assets']
byname={e['name']:e for e in entries}
layout=json.loads((root/'world-boxes.json').read_text())
textures=json.loads((root/'minimap-textures.json').read_text())['textures']
report={'assets':[],'alignment':[]}
selected=set(sys.argv[4].split(',')) if len(sys.argv)>4 else None
if selected:
    report=json.loads((output/'prepared.json').read_text())
    report['assets']=[e for e in report['assets'] if e.get('dungeon') not in selected]
    report['alignment']=[e for e in report['alignment'] if e['name'].split('_')[0] not in selected]
outline_registration=json.loads((root/'scene-data/dungeon-silhouette-registration.json').read_text())
paper=Image.open(root.parents[2]/'images/oot-map-paper.png').convert('RGBA')
paper_cache={}

def paper_background(size, crop=False):
    key=(size,crop)
    if key not in paper_cache:
        paper_cache[key]=(ImageOps.fit(paper,size,method=Image.Resampling.LANCZOS)
                          if crop else paper.resize(size,Image.Resampling.LANCZOS))
    return paper_cache[key].copy()

def image(name):
    return np.array(Image.open(source/'maps'/(name+'.webp')).convert('RGBA'))

def matrix(e):
    if e['status']=='aligned':
        return np.array(e['transform'],dtype=np.float64)
    # Uniform silhouettes have no texture features. Their alpha extents are
    # symmetric around the same crop; use the measured 1.5x source scale.
    old=Path(e['reference'])
    if not old.exists():
        raise ValueError('No reference for '+e['name'])
    box=Image.open(old).convert('RGBA').getchannel('A').getbbox()
    w,h=e['newSize']
    return np.array([[2/3,0,(box[0]+box[2]-w*2/3)/2],[0,2/3,(box[1]+box[3]-h*2/3)/2]])

def warp(name,m,size):
    pixels=image(name)
    box=Image.fromarray(pixels[:,:,3]).getbbox()
    if box:
        x0,y0,x1,y1=box
        corners=np.array([[x0,y0],[x1,y0],[x0,y1],[x1,y1]])@m[:,:2].T+m[:,2]
        if (corners.min(axis=0)<-1).any() or (corners.max(axis=0)>np.array(size)+1).any():
            raise ValueError('Nontransparent artwork would be clipped: '+name)
    return Image.fromarray(cv2.warpAffine(pixels,m,size,flags=cv2.INTER_LANCZOS4,borderMode=cv2.BORDER_CONSTANT,borderValue=(0,0,0,0)))

def slug(name):
    return re.sub(r'([a-z])([A-Z])',r'\1-\2',name).replace('_','-').lower()

# Hyrule: transform directly into the already calibrated boxes. Never trim
# the replacement and lay it out again, which would move all existing POIs.
for age in ([] if selected else ['Child','Adult']):
    canvas=Image.new('RGBA',(layout['canvas'],layout['canvas']))
    x0,y0,x1,y1=layout['extent']
    # Preserve the full paper at its native aspect ratio. Widen only its
    # bounds around the calibrated region layout; never move the regions.
    paper_height=y1-y0
    paper_width=round(paper_height*paper.width/paper.height)
    paper_left=round((x0+x1-paper_width)/2)
    if paper_left<0 or paper_left+paper_width>layout['canvas']:
        raise ValueError('Proportional paper exceeds world canvas')
    report['paper']={'sourceSize':list(paper.size),'worldBounds':[paper_left,y0,paper_left+paper_width,y1],
                     'worldFit':'proportional-full-image','dungeonFit':'proportional-center-crop'}
    canvas.alpha_composite(paper_background((paper_width,paper_height)),(paper_left,y0))
    for region,box in layout['boxes'][age].items():
        key=region+'_'+age+'_00'
        if key not in byname: key=region+'_Adult_00'
        e=byname[key];m=matrix(e)
        texture=textures.get(region+'_'+age+'_00',textures.get(region+'_Adult_00'))
        left,top,w,h=box;tx,ty,tw,th=texture['trim'];s=texture['width']/2000
        transform=np.array([[s*w/tw,0,-tx*w/tw],[0,s*h/th,(280*s-ty)*h/th],[0,0,1]])
        full=np.vstack([m,[0,0,1]])
        # The new crop can extend beyond the old Mini texture's trim.
        # Allocate its complete transformed canvas, without changing origin.
        local=(transform@full)[:2]
        sw,sh=e['newSize']
        corners=np.array([[0,0],[sw,0],[0,sh],[sw,sh]])@local[:,:2].T+local[:,2]
        lo=np.floor(corners.min(axis=0)).astype(int)-4
        hi=np.ceil(corners.max(axis=0)).astype(int)+4
        local[:,2]-=lo
        dest=(int(left+lo[0]),int(top+lo[1]))
        size=tuple(int(v) for v in hi-lo)
        if min(dest)<0 or dest[0]+size[0]>layout['canvas'] or dest[1]+size[1]>layout['canvas']:
            raise ValueError('Artwork exceeds world canvas: '+key)
        art=warp(key,local,size)
        canvas.alpha_composite(art,dest)
        report['alignment'].append({'name':key,'method':e['status'],'transform':m.tolist(),'medianError':e.get('medianError')})
    name='hyrule-'+age.lower();canvas.save(output/(name+'.png'),compress_level=1)
    report['assets'].append({'name':name,'kind':'world','file':name+'.png'})

dungeons=sorted({e['name'].split('_')[0] for e in entries if e['name'].endswith('_Main')})
for dungeon in dungeons:
    if selected and dungeon not in selected: continue
    mains=[e for e in entries if e['name'].startswith(dungeon+'_') and e['name'].endswith('_Main')]
    known=all(Path(e['reference']).exists() for e in mains)
    if not known and dungeon not in ['GerudoTrainingGround','InsideGanonCastle']:
        print('Deferred new dungeon without calibrated floor origins:',dungeon,flush=True)
        continue
    if known:
        transforms={e['name']:matrix(e) for e in mains}
    elif dungeon=='InsideGanonCastle':
        calibration=json.loads((root/'scene-data/ganon-castle-calibration.json').read_text())
        transforms={}
        for e in mains:
            pivot=calibration['floorPivots'][e['name'].split('_')[1]]
            transforms[e['name']]=np.array([[2/3,0,1000-pivot[0]*2/3],[0,2/3,720-pivot[1]*2/3]])
    else:
        # New dungeons have no existing marker coordinate system. Preserve
        # source floor canvases at the same 1.5x scale, centred consistently.
        maxw=max(e['newSize'][0] for e in mains);maxh=max(e['newSize'][1] for e in mains)
        transforms={e['name']:np.array([[2/3,0,(2000-maxw*2/3)/2],[0,2/3,(1440-maxh*2/3)/2]]) for e in mains}
    back=Image.new('RGBA',(4096,4096))
    # The All texture is the enclosing dungeon outline, not a floor Back.
    # Keep its own registration: its crop is larger than each floor's crop.
    outlines={}
    allnames=[e['name'] for e in entries if e['name'].startswith(dungeon+'_') and e['name'].endswith('_All')]
    if not allnames:
        raise ValueError('Missing whole-dungeon silhouette: '+dungeon)
    for allname in allnames:
        a=byname[allname]
        if Path(a['reference']).exists():
            am=matrix(a)
            method=a['status']
        else:
            # All crops are not centered on the floor crops: their outline
            # can extend farther in one direction. Use measured origins.
            registration=outline_registration[dungeon]
            reference=next(e for e in mains if e['name'].split('_')[1]==registration['floor'])
            am=transforms[reference['name']].copy()
            am[:,2]-=np.array(registration['offset'])*2/3
            method='measured-outline-origin'
        am*=2;am[:,2]+=[48,608]
        outlines[allname]=warp(allname,am,(4096,4096))
        report['alignment'].append({'name':allname,'method':method,'transform':am.tolist()})
    used=set()
    for e in mains:
        floor=e['name'].split('_')[1]
        backname=e['name'].replace('_Main','_Back')
        if backname not in byname: backname=dungeon+'_'+floor+'_Back'
        if backname not in byname or backname in used: continue
        used.add(backname)
        b=byname[backname]
        # Main and Back use identical cropped canvas for each floor/state.
        if b['newSize']==e['newSize']: m=transforms[e['name']].copy()
        elif Path(b['reference']).exists(): m=matrix(b)
        else: raise ValueError('Uncalibrated background '+backname)
        m*=2;m[:,2]+=[48,608]
        back.alpha_composite(warp(backname,m,(4096,4096)))
    for e in mains:
        m=transforms[e['name']].copy();m*=2;m[:,2]+=[48,608]
        canvas=paper_background((4096,4096),crop=True)
        state=re.search(r'_State(\d+)_',e['name'])
        allname=dungeon+'_State'+state.group(1)+'_All' if state else dungeon+'_All'
        if allname not in outlines:
            allname=dungeon+'_All' if dungeon+'_All' in outlines else sorted(outlines)[0]
        canvas.alpha_composite(outlines[allname])
        canvas.alpha_composite(back);canvas.alpha_composite(warp(e['name'],m,(4096,4096)))
        name=slug(e['name'].removesuffix('_Main'));canvas.save(output/(name+'.png'),compress_level=1)
        report['assets'].append({'name':name,'kind':'dungeon','dungeon':dungeon,'source':e['name'],'file':name+'.png','newDungeon':not known,'silhouette':allname})
        method=e['status'] if known else 'castle-landmarks' if dungeon=='InsideGanonCastle' else 'new-dungeon-canvas'
        report['alignment'].append({'name':e['name'],'method':method,'transform':transforms[e['name']].tolist(),'medianError':e.get('medianError')})
    print(dungeon,len(mains),'floors/states',len(used),'backgrounds',flush=True)
(output/'prepared.json').write_text(json.dumps(report,indent=2)+'\n')
print('Prepared',len(report['assets']),'maps')
