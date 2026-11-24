#!/usr/bin/env python3
"""BotW's own lighting settings for the field, for street view to light the world
the way the game does (images/3d/botw/streetview/env.json):

- sun: the main directional light (colour, intensity, direction);
- hemisphere: the sky / ground ambient light;
- fog: the three field fogs (scatter, world, inner);
- sky: the Rayleigh / Mie scattering sky, its sun colour and scatter / ad hoc fog;
- color: colour correction (hue, saturation, brightness, gamma);
- bloom, clouds: the post effect and cloud layer settings;
and tex/clouds.png, the cloud layer's own textures.

They come from Env/env.sgenvb in Bootup.pack (a SARC of AAMP parameter files). AAMP
keeps names as CRC32 hashes; env-names.json holds the names found among the game
executable's strings (533 of 661).

python3 build_env_params.py <update content> <output folder>
"""
import json, os, sys
sys.path.insert(0, os.path.dirname(__file__))
import nin, aamp

U, OUT = sys.argv[1:3]
NAMES = json.load(open(os.path.join(os.path.dirname(__file__), 'env-names.json')))

env = nin.sarc(nin.sarc(open(os.path.join(U, 'Pack', 'Bootup.pack'), 'rb').read())['Env/env.sgenvb'])
read = lambda name: aamp.parse(env[name], NAMES)


def plain(x):
    """JSON-friendly: tuples to lists, floats rounded, hashed or unread values left out."""
    if isinstance(x, dict):
        return {k: plain(v) for k, v in x.items() if not (len(k) == 8 and all(c in '0123456789abcdef' for c in k)) and not (isinstance(v, str) and v.startswith('<'))}
    if isinstance(x, tuple): return [round(c, 5) for c in x]
    if isinstance(x, float): return round(x, 5)
    return x


lights = read('envobj/master_field.baglenv')['lists']
out = dict(
    sun=plain(lights['DirectionalLight']['DirectionalLight0']),
    hemisphere=plain(next(iter(lights['HemisphereLight'].values()))),
    fog={v['name']: plain(v) for v in lights['Fog'].values()},
    sky=plain(read('postfx/master_field.bksky')['sky']),
    color=plain(read('postfx/master_field.baglccr')['color_correction']),
    bloom=plain(read('postfx/master_field.baglblm')['bloom']),
    clouds=plain(read('postfx/master_field.baglclwd')),
)
os.makedirs(os.path.join(OUT, 'tex'), exist_ok=True)
json.dump(out, open(os.path.join(OUT, 'env.json'), 'w'), indent=1)
print('env.json:', ', '.join(out))

# The cloud layer's textures (collect.genvres: CloudTexture02..04, which the
# clouds' texture numbers 2..4 name), one per channel of tex/clouds.png.
import tempfile
import numpy as np
from gltf_writer import Textures, magick
tmp = tempfile.mkdtemp()
res = os.path.join(tmp, 'collect.genvres'); open(res, 'wb').write(env['collect.genvres'])
T = Textures([res])
chans = [T.decode('cloudtexture%02d' % n, tmp)[0][..., 0] for n in (2, 3, 4)]
img = np.dstack(chans)
magick('-size', '%dx%d' % (img.shape[1], img.shape[0]), '-depth', '8', 'rgb:-', '-define', 'png:compression-level=9',
       os.path.join(OUT, 'tex/clouds.png'), data=img.tobytes())
print('tex/clouds.png: cloud textures 2, 3, 4 in red, green, blue')

# The clouds' shadows on the ground (p_shadow_clouds: light where it's white),
# which the game projects from above (master_field.baglenv's shadowTex_Projector).
sh = T.decode('p_shadow_clouds', tmp)[0][..., 0]
magick('-size', '%dx%d' % (sh.shape[1], sh.shape[0]), '-depth', '8', 'gray:-', '-define', 'png:compression-level=9',
       os.path.join(OUT, 'tex/cloud-shadow.png'), data=np.ascontiguousarray(sh).tobytes())
out['cloud_shadow'] = plain(lights['Projector']['Projector0'])
json.dump(out, open(os.path.join(OUT, 'env.json'), 'w'), indent=1)
print('tex/cloud-shadow.png: the clouds\' shadows')
