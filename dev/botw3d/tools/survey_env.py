"""Which field objects stand around a point, and where their models are:
python3 survey_env.py <update content> <base content> <x0> <x1> <z0> <z1> <out.json>"""
import os,sys,json,collections; sys.path.insert(0,os.path.dirname(__file__)); import nin,byml,aamp
U,B=sys.argv[1:3]; X0,X1,Z0,Z1=map(float,sys.argv[3:7]); OUT=sys.argv[7]
def pack(p):
    raw=open(p,'rb').read(); return nin.sarc(nin.yaz0(raw) if raw[:4]==b'Yaz0' else raw)
tb=pack(U+'/Pack/TitleBG.pack')
objs=[]
for k in tb:
    if not (k.startswith('Map/MainField/') and k.endswith(('_Static.smubin','_Dynamic.smubin'))): continue
    sec=k.split('/')[2]
    if len(sec)!=3 or sec[0] not in 'ABCDEFGHIJ': continue
    sx0, sz0 = 'ABCDEFGHIJ'.index(sec[0])*1000-5000, (int(sec[2])-1)*1000-4000
    if sx0>X1 or sx0+1000<X0 or sz0>Z1 or sz0+1000<Z0: continue
    b=tb[k]; b=nin.yaz0(b) if b[:4]==b'Yaz0' else b
    for o in byml.parse(b).get('Objs',[]):
        t=o.get('Translate')
        if isinstance(t,list) and X0<=t[0]<=X1 and Z0<=t[2]<=Z1:
            o['_unit']=k.split('/')[-1]; objs.append(o)
def actor_model(name):
    for root in (U,B):
        p=root+'/Actor/Pack/'+name+'.sbactorpack'
        if os.path.exists(p): break
    else: return None
    s=pack(p)
    ml=[v for k,v in s.items() if k.endswith('.bmodellist')]
    if not ml: return None
    d=aamp.parse(ml[0],['Folder','UnitName'])
    out={}
    def walk(x):
        if isinstance(x,dict):
            if 'Folder' in x and 'folder' not in out: out['folder']=x['Folder']
            if 'UnitName' in x: out.setdefault('units',[]).append(x['UnitName'])
            for v in x.values(): walk(v)
    walk(d); return out
import glob, bfres
# A model folder's files: <folder>.sbfres, or split in parts (<folder>-01.sbfres...),
# the update's first; each with the models (FMDL names) it holds.
_mf={}
def model_files(folder):
    if folder in _mf: return _mf[folder]
    out={}
    for root in (U,B):
        paths=[root+'/Model/'+folder+'.sbfres']+sorted(glob.glob(glob.escape(root+'/Model/'+folder)+'-[0-9][0-9].sbfres'))
        paths=[p for p in paths if os.path.exists(p)]
        if paths:
            for p in paths:
                raw=open(p,'rb').read(); d=nin.yaz0(raw) if raw[:4]==b'Yaz0' else raw
                r=bfres.R(d)
                for name,_ in bfres.group(r, r.rel(0x20)): out.setdefault(name, p)
            break
    _mf[folder]=out
    return out
SCENERY=('FldObj_','TwnObj_','Obj_Tree','Obj_Rock','Obj_Plant_Lotus','DgnObj_IbutsuWaterFall','DgnObj_DungeonEntrance','DgnObj_RemainsLithograph')
names=collections.Counter(o['UnitConfigName'] for o in objs if o['UnitConfigName'].startswith(SCENERY))
actors={}
for n in names:
    m=actor_model(n)
    if not m or not m.get('folder') or m['folder'] in ('','Dummy','None'): continue
    f=m['folder']
    files=model_files(f)
    if files: actors[n]=dict(folder=f, units=m.get('units',[]), files=files, count=names[n])
json.dump(dict(objs=[o for o in objs if o['UnitConfigName'] in actors], actors=actors), open(OUT,'w'), default=str)
print(len(objs),'objects;',len(names),'actor kinds;',len(actors),'with models;',sum(a['count'] for a in actors.values()),'placements with models')
miss=[n for n in names if n not in actors]
print('no model:', miss[:30])
for n,a in sorted(actors.items(), key=lambda kv:-kv[1]['count'])[:80]: print(a['count'], n, a['folder'], a['units'][:2], len(a['files']),'models in folder')
