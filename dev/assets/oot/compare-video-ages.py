"""Compare independent age recordings through terrain-only artwork registration."""
import importlib.util, json, itertools, sys
from pathlib import Path
import cv2
import numpy as np

ROOT=Path(__file__).resolve().parent
sys.dont_write_bytecode=True
spec=importlib.util.spec_from_file_location('calibrate_video',ROOT/'calibrate-video.py')
calibrate=importlib.util.module_from_spec(spec);spec.loader.exec_module(calibrate)

def transfer_model(base,target,points,matrix):
    coefficients=np.array(base['coefficients'])
    native=np.array([[coefficients[0,0],0,coefficients[0,1]],[0,coefficients[1,0],coefficients[1,1]],[0,0,1]])
    combined=matrix@native
    checks=[]
    for kind in ('CollectHeart','CollectSign'):
        observed=[p for p in target['detectedIcons'] if p['kind']==kind]
        candidates=[p for p in points if p['scene']==target['scene'] and p['kind']==kind]
        if len(observed)>len(candidates):continue
        best=None
        for choice in itertools.permutations(candidates,len(observed)):
            rows=[]
            for source,icon in zip(choice,observed):
                x,y,z=source['position'];pred=combined@np.array([x,z,1])
                rows.append({'id':source['id'],'kind':kind,'predictedTexturePixel':pred.tolist(),
                             'observedTexturePixel':icon['texturePixel'],
                             'errorTexturePixels':float(np.linalg.norm(pred-icon['texturePixel']))})
            total=sum(p['errorTexturePixels']**2 for p in rows)
            if best is None or total<best[0]:best=(total,rows)
        if best:checks.extend(best[1])
    return {'sourceXZToTargetTexture':combined.tolist(),'checks':checks,
            'status':'diagnostic transfer only; do not apply without reviewing age-specific coordinate frames'}

def main():
    cv2.setRNGSeed(0)
    child=json.loads((ROOT/'scene-data/child-video-calibration.json').read_text())
    adult=json.loads((ROOT/'scene-data/adult-video-calibration.json').read_text())
    points=json.loads((ROOT/'scene-data/map-points.json').read_text())
    assets=Path('/Users/Jess/Desktop/oot/OoTR-110-CustomTex-Map-Field')
    report=[]
    for a in adult:
        region=a['scene'].removesuffix('_Adult')
        c=next((x for x in child if x['scene']==region+'_Child'),None)
        if not c:continue
        ca=cv2.imread(str(assets/f"Mini_{c['scene']}_00.png"),cv2.IMREAD_UNCHANGED)
        aa=cv2.imread(str(assets/f"Mini_{a['scene']}_00.png"),cv2.IMREAD_UNCHANGED)
        registration=calibrate.register(ca[:,:,:3],aa)
        if not registration:report.append({'region':region,'status':'no-shared-terrain-fit'});continue
        matrix=np.array(registration['matrix'])
        common=[];used=set()
        for ci in c['detectedIcons']:
            if 'texturePixel' not in ci:continue
            target=matrix[:,:2]@ci['texturePixel']+matrix[:,2]
            choices=[ai for ai in a['detectedIcons'] if ai['kind']==ci['kind'] and 'texturePixel' in ai and id(ai) not in used]
            if not choices:continue
            nearest=min(choices,key=lambda p:np.linalg.norm(np.array(p['texturePixel'])-target))
            error=float(np.linalg.norm(np.array(nearest['texturePixel'])-target))
            if error<6:
                used.add(id(nearest))
                common.append({'kind':ci['kind'],'childPixel':ci['texturePixel'],'adultPixel':nearest['texturePixel'],'errorTexturePixels':error})
        base=next((m for m in [c.get('sourceCalibration'),c.get('skullOnlyCalibration')] if m and m['status'].startswith('candidate-passes')),None)
        transfer=transfer_model(base,a,points,matrix) if base else None
        adult_base=next((m for m in [a.get('sourceCalibration'),a.get('skullOnlyCalibration')] if m and m['status'].startswith('candidate-passes')),None)
        reverse=transfer_model(adult_base,c,points,cv2.invertAffineTransform(matrix)) if adult_base else None
        report.append({'region':region,'terrainRegistration':registration,'samePlaceObservations':common,
                       'childModelTransfer':transfer,'adultModelTransfer':reverse})
    (ROOT/'scene-data/cross-age-calibration.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps([{'region':r['region'],'sharedObservations':len(r.get('samePlaceObservations',[])),
                       'transferMaxError':max([x['errorTexturePixels'] for x in (r.get('childModelTransfer') or {}).get('checks',[])],default=None)} for r in report],indent=2))

if __name__=='__main__':main()
