"""Finding things in BotW's files: an actor's model (its model list), the
files a model folder is in (whole, or split: <folder>-01.sbfres...), and its
textures (<folder>.Tex1.sbfres, or split: <folder>.Tex1.1.sbfres...). The
update's files first, then the base game's, then any packs given (a
dungeon's own .pack holds its actors and models)."""
import glob, os
import nin, aamp, bfres
from gltf_writer import Textures, load


def sarc(raw):
    return nin.sarc(nin.yaz0(raw) if raw[:4] == b'Yaz0' else raw)


class Files:
    def __init__(self, update, base, packs=()):
        self.roots = [r for r in (update, base) if r]
        self.packs = [sarc(open(p, 'rb').read()) for p in packs]
        self._models, self._files, self._tex = {}, {}, {}

    def _actor_pack(self, name):
        key = 'Actor/Pack/%s.sbactorpack' % name
        for pk in self.packs:
            if key in pk: return sarc(pk[key])
        for root in self.roots:
            p = os.path.join(root, key)
            if os.path.exists(p): return sarc(open(p, 'rb').read())
        return None

    def actor_model(self, name):
        """{'folder', 'units'} from the actor's model list, or None."""
        s = self._actor_pack(name)
        if not s: return None
        ml = [v for k, v in s.items() if k.endswith('.bmodellist')]
        if not ml: return None
        out = {}
        def walk(x):
            if isinstance(x, dict):
                if 'Folder' in x and 'folder' not in out: out['folder'] = x['Folder']
                if 'UnitName' in x: out.setdefault('units', []).append(x['UnitName'])
                for v in x.values(): walk(v)
        walk(aamp.parse(ml[0], ['Folder', 'UnitName']))
        return out if out.get('folder') not in (None, '', 'Dummy', 'None') else None

    def model_files(self, folder):
        """{model name: (source, path)}, the source a path or a pack."""
        if folder in self._files: return self._files[folder]
        out = {}
        def add(data, src):
            r = bfres.R(data)
            for name, _ in bfres.group(r, r.rel(0x20)): out.setdefault(name, src)
        for root in self.roots:
            base = os.path.join(root, 'Model', folder)
            paths = [p for p in [base + '.sbfres'] + sorted(glob.glob(glob.escape(base) + '-[0-9][0-9].sbfres')) if os.path.exists(p)]
            if paths:
                for p in paths: add(load(p), p)
                break
        if not out:
            for i, pk in enumerate(self.packs):
                k = 'Model/%s.sbfres' % folder
                if k in pk:
                    raw = pk[k]; add(nin.yaz0(raw) if raw[:4] == b'Yaz0' else raw, ('pack', i, k))
        self._files[folder] = out
        return out

    def model(self, folder, name):
        src = self.model_files(folder).get(name)
        if src is None: return None
        if src not in self._models:
            if isinstance(src, tuple):
                raw = self.packs[src[1]][src[2]]; data = nin.yaz0(raw) if raw[:4] == b'Yaz0' else raw
            else:
                data = load(src)
            self._models[src] = {m['name']: m for m in bfres.models(data)}
        return self._models[src].get(name)

    def textures(self, folder):
        if folder not in self._tex:
            paths = []
            for root in self.roots:
                base = os.path.join(root, 'Model', folder)
                paths += ([base + '.Tex1.sbfres'] + sorted(glob.glob(glob.escape(base) + '.Tex1.[0-9]*.sbfres'))
                          + sorted(glob.glob(glob.escape(base) + '-[0-9][0-9].Tex1.sbfres')))
            self._tex[folder] = Textures(paths)
        return self._tex[folder]
