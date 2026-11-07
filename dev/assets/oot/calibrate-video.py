"""Diagnostic video-frame registration. Requires OpenCV + NumPy; no DB writes."""
import argparse, json, itertools
from pathlib import Path
import cv2
import numpy as np

ROOT=Path(__file__).resolve().parent

def register(frame,texture):
    gray=cv2.cvtColor(frame,cv2.COLOR_BGR2GRAY)
    art=cv2.cvtColor(texture[:,:,:3],cv2.COLOR_BGR2GRAY)
    mask=np.full(art.shape,255,np.uint8)
    if texture.shape[2]==4: mask=texture[:,:,3]
    mask=cv2.erode(mask,np.ones((7,7),np.uint8))
    detector=cv2.SIFT_create(nfeatures=12000)
    k1,d1=detector.detectAndCompute(gray,None)
    k2,d2=detector.detectAndCompute(art,mask)
    matches=cv2.BFMatcher().knnMatch(d1,d2,k=2)
    good=[a for a,b in matches if a.distance<.7*b.distance]
    if len(good)<60:
        # Faded maps such as the Wasteland have very little high-contrast terrain.
        detector=cv2.SIFT_create(nfeatures=16000,contrastThreshold=.01)
        k1,d1=detector.detectAndCompute(gray,None)
        k2,d2=detector.detectAndCompute(art,mask)
        matches=cv2.BFMatcher().knnMatch(d1,d2,k=2)
        good=[a for a,b in matches if a.distance<.7*b.distance]
    if len(good)<8:return None
    src=np.float32([k1[m.queryIdx].pt for m in good])
    dst=np.float32([k2[m.trainIdx].pt for m in good])
    # Reserve every fifth feature match: these do not influence the transform.
    train=np.arange(len(src))%5!=0
    model,inliers=cv2.estimateAffine2D(src[train],dst[train],method=cv2.RANSAC,ransacReprojThreshold=3,maxIters=10000)
    if model is None:return None
    valid=inliers.ravel().astype(bool)
    errors=np.linalg.norm(src[train]@model[:,:2].T+model[:,2]-dst[train],axis=1)
    held=np.linalg.norm(src[~train]@model[:,:2].T+model[:,2]-dst[~train],axis=1)
    consistent=held[held<5]
    return {'matrix':model.tolist(),'matches':len(good),'inliers':int(valid.sum()),
            'medianInlierErrorTexturePixels':float(np.median(errors[valid])),
            'p95InlierErrorTexturePixels':float(np.percentile(errors[valid],95)),
            'heldOutMatchCount':int(len(held)),'heldOutConsistentCount':int(len(consistent)),
            'heldOutMedianTexturePixels':float(np.median(consistent)) if len(consistent) else None,
            'heldOutP95TexturePixels':float(np.percentile(consistent,95)) if len(consistent) else None}

def detect(frame,templates):
    gray=cv2.cvtColor(frame,cv2.COLOR_BGR2GRAY)
    out=[]
    for kind,template in templates.items():
        result=cv2.matchTemplate(gray,template,cv2.TM_CCOEFF_NORMED)
        h,w=template.shape
        while True:
            _,score,_,(x,y)=cv2.minMaxLoc(result)
            if score<.77:break
            if y>160 and y<1250 and x>500 and x<2150:
                out.append({'kind':kind,'pixel':[x+w/2,y+h/2],'confidence':score})
            result[max(0,y-25):y+26,max(0,x-25):x+26]=0
    return out

def source_fit(scene,icons,points):
    names={p['scene'] for p in points}
    source_scene=scene if scene in names else scene.removesuffix('_Child').removesuffix('_Adult')
    source=[dict(p) for p in points if p['scene']==source_scene and p['kind'] in ('CollectHeart','CollectSign')]
    for p in source:
        if p.get('properties',{}).get('IsUseOriginTrans'):
            p['position']=p['properties']['OriginTrans']
    groups=[]
    for kind in ('CollectHeart','CollectSign'):
        observed=[p for p in icons if p['kind']==kind]
        candidates=[p for p in source if p['kind']==kind]
        if len(observed)>len(candidates):return {'status':'unmatched-icons; manual review required'}
        groups.append((observed,list(itertools.permutations(candidates,len(observed)))))
    if len(icons)<2:return {'status':'insufficient-collectibles', 'sourceCount':len(source),'visibleCount':len(icons)}
    best=None
    for choices in itertools.product(*(g[1] for g in groups)):
        pairs=[(s,o) for (observed,_),chosen in zip(groups,choices) for s,o in zip(chosen,observed)]
        src=np.array([p[0]['position'] for p in pairs])[:,[0,2]]
        dst=np.array([p[1]['texturePixel'] for p in pairs])
        model=[];pred=np.zeros_like(dst)
        for k in range(2):
            design=np.column_stack([src[:,k],np.ones(len(src))])
            coeff=np.linalg.lstsq(design,dst[:,k],rcond=None)[0]
            model.append(coeff);pred[:,k]=design@coeff
        if model[0][0]<=0 or model[1][0]<=0:continue
        errors=np.linalg.norm(pred-dst,axis=1); rms=float(np.sqrt(np.mean(errors**2)))
        if best is None or rms<best['rmsTexturePixels']:
            held=[]
            for i in range(len(src)):
                keep=np.arange(len(src))!=i;xy=[]
                for k in range(2):
                    design=np.column_stack([src[keep,k],np.ones(sum(keep))])
                    if np.linalg.matrix_rank(design)<2:xy=[];break
                    coeff=np.linalg.lstsq(design,dst[keep,k],rcond=None)[0]
                    xy.append(float(np.array([src[i,k],1])@coeff))
                held.append(float(np.linalg.norm(np.array(xy)-dst[i])) if xy else None)
            best={'model':'axis-aligned X/Z to original Mini texture pixels',
                  'coefficients':[m.tolist() for m in model],'rmsTexturePixels':rms,
                  'heldOutTexturePixels':held,'maxErrorTexturePixels':float(max(errors)),
                  'pairs':[{'id':s['id'],'kind':s['kind'],'sourcePosition':s['position'],
                            'observedTexturePixel':o['texturePixel'],'predictedTexturePixel':p.tolist()}
                           for (s,o),p in zip(pairs,pred)]}
    if not best:return {'status':'no-valid-axis-fit'}
    maxheld=max(best['heldOutTexturePixels']) if all(x is not None for x in best['heldOutTexturePixels']) else float('inf')
    best['status']='candidate-passes-numeric-checks; identity review still required' if len(icons)>=3 and maxheld<5 and best['maxErrorTexturePixels']<3 else 'provisional-or-inconsistent; do not apply'
    best['independentValidationPossible']=len(icons)>=3 and all(x is not None for x in best['heldOutTexturePixels'])
    return best

def main():
    cv2.setRNGSeed(0)
    parser=argparse.ArgumentParser()
    parser.add_argument('--frames',default='/tmp/zm-child-frames')
    parser.add_argument('--age',choices=['child','adult'],default='child')
    parser.add_argument('--reference-frames',default='/tmp/zm-child-frames')
    parser.add_argument('--assets',default='/Users/Jess/Desktop/oot/OoTR-110-CustomTex-Map-Field')
    args=parser.parse_args()
    index=json.loads((ROOT/f'scene-data/{args.age}-video-index.json').read_text())
    ref=cv2.imread(str(Path(args.reference_frames)/'frame-24.png'),0)
    templates={'CollectHeart':ref[594:624,832:860], 'CollectSign':ref[893:923,1501:1529]}
    output=[]
    points=json.loads((ROOT/'scene-data/map-points.json').read_text())
    manual={
      'ZoraFountain_Child':[('CollectSign',912,830),('CollectSign',1318,704)],
      'GerudoValley_Child':[('CollectSign',962,697)],
      'HyruleField_Adult':[('CollectSign',1154,870)]
    }
    previews=ROOT/('scene-data/video-previews' if args.age=='child' else 'scene-data/adult-video-previews');previews.mkdir(exist_ok=True)
    for entry in index['regions']:
        scene=entry['scene']; frame=cv2.imread(str(Path(args.frames)/f"frame-{entry['second']}.png"))
        file=Path(args.assets)/f'Mini_{scene}_00.png'
        if not file.exists():
            output.append({**entry,'status':'missing-artwork'});continue
        texture=cv2.imread(str(file),cv2.IMREAD_UNCHANGED)
        registration=register(frame,texture)
        icons=detect(frame,templates)
        for kind,x,y in manual.get(scene,[]):
            pixel=[x*1.25,y*1.25]
            if not any(np.linalg.norm(np.array(p['pixel'])-pixel)<25 for p in icons):
                icons.append({'kind':kind,'pixel':pixel,'method':'manual center measured on 2048px preview','confidence':None})
        if registration:
            model=np.array(registration['matrix'])
            for icon in icons:icon['texturePixel']=(model[:,:2]@icon['pixel']+model[:,2]).tolist()
        calibration=source_fit(scene,icons,points) if registration else None
        skulls=[p for p in icons if p['kind']=='CollectSign']
        skull_calibration=source_fit(scene,skulls,points) if registration and len(skulls)>=3 else None
        preview=frame.copy()
        for icon in icons:
            cv2.circle(preview,tuple(map(round,icon['pixel'])),22,(0,0,255),2)
        cv2.imwrite(str(previews/f'{scene}.jpg'),preview,[cv2.IMWRITE_JPEG_QUALITY,85])
        art_preview=texture[:,:,:3].copy()
        if texture.shape[2]==4:art_preview[texture[:,:,3]==0]=0
        for icon in icons:
            if 'texturePixel' in icon:
                cv2.circle(art_preview,tuple(map(round,icon['texturePixel'])),10,
                           (110,80,240) if icon['kind']=='CollectHeart' else (80,230,255),2)
        cv2.imwrite(str(previews/f'{scene}-artwork.jpg'),art_preview,[cv2.IMWRITE_JPEG_QUALITY,90])
        aligned=registration and registration['inliers']>=20 and registration['heldOutConsistentCount']>=10 and registration['heldOutP95TexturePixels']<2
        output.append({**entry,'registration':registration,'detectedIcons':icons,
                       'sourceCalibration':calibration,
                       'skullOnlyCalibration':skull_calibration,
                       'status':'artwork-aligned; source identities not yet verified' if aligned else 'registration-needs-review'})
        print(scene,'inliers',registration['inliers'] if registration else 0,'icons',len(icons),flush=True)
    (ROOT/f'scene-data/{args.age}-video-calibration.json').write_text(json.dumps(output,indent=2)+'\n')
    board=np.zeros((5*300,4*300,3),np.uint8)
    for i,row in enumerate(output):
        image=cv2.imread(str(previews/f"{row['scene']}-artwork.jpg"))
        if image is None:continue
        x=(i%4)*300;y=(i//4)*300
        board[y:y+270,x:x+300]=cv2.resize(image,(300,270))
        cv2.putText(board,row['scene'].replace('_Child','').replace('_Adult',''),(x+4,y+290),cv2.FONT_HERSHEY_SIMPLEX,.42,(255,255,255),1,cv2.LINE_AA)
    cv2.imwrite(str(previews/f'all-{args.age}-calibrations.jpg'),board,[cv2.IMWRITE_JPEG_QUALITY,90])

if __name__=='__main__':main()
