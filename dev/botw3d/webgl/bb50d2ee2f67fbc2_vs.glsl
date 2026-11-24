#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader bb50d2ee2f67fbc2
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[5];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;

out vec4 passParameterSem6;
// end of shader inputs/outputs
int clampFI32(int v)
{
if( v == 0x7FFFFFFF )
	return floatBitsToInt(1.0);
else if( v == 0xFFFFFFFF )
	return floatBitsToInt(0.0);
return floatBitsToInt(clamp(intBitsToFloat(v), 0.0, 1.0));
}
float mul_nonIEEE(float a, float b){ if( a == 0.0 || b == 0.0 ) return 0.0; return a*b; }
void main()
{
ivec4 R0i = ivec4(0);
ivec4 R1i = ivec4(0);
ivec4 R2i = ivec4(0);
ivec4 R3i = ivec4(0);
ivec4 R4i = ivec4(0);
ivec4 R123i = ivec4(0);
ivec4 R125i = ivec4(0);
ivec4 R126i = ivec4(0);
ivec4 R127i = ivec4(0);
uvec4 attrDecoder;
int backupReg0i, backupReg1i, backupReg2i, backupReg3i, backupReg4i;
int PV0ix = 0, PV0iy = 0, PV0iz = 0, PV0iw = 0, PV1ix = 0, PV1iy = 0, PV1iz = 0, PV1iw = 0;
int PS0i = 0, PS1i = 0;
ivec4 tempi = ivec4(0);
float tempResultf;
int tempResulti;
ivec4 ARi = ivec4(0);
bool predResult = true;
R0i = ivec4(gl_VertexID, 0, 0, gl_InstanceID);
attrDecoder.xyzw = attrDataSem0.xyzw;
attrDecoder = uvec4(((attrDecoder>>8)&0xFFu)|((attrDecoder<<8)&0xFF00u));
attrDecoder.xyzw = uvec4(floatBitsToInt(vec4(unpackHalf2x16(attrDecoder.x|(attrDecoder.y<<16)),unpackHalf2x16(attrDecoder.z|(attrDecoder.w<<16)))));
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.x = attrDataSem1.x;
attrDecoder.x = uint((attrDecoder.x>>24)|((attrDecoder.x>>8)&0xFF00u)|((attrDecoder.x<<8)&0xFF0000u)|((attrDecoder.x<<24)));
attrDecoder.y = uint(0);
attrDecoder.z = uint(0);
attrDecoder.w = uint(0);
attrDecoder.xyzw = uvec4(uvec4((attrDecoder.x>>0)&0x3FFu,(attrDecoder.x>>10)&0x3FFu,(attrDecoder.x>>20)&0x3FFu,(attrDecoder.x>>30)&0x3u));
if( (attrDecoder.x&0x200u) != 0u ) attrDecoder.x |= 0xFFFFFC00u;
if( (attrDecoder.y&0x200u) != 0u ) attrDecoder.y |= 0xFFFFFC00u;
if( (attrDecoder.z&0x200u) != 0u ) attrDecoder.z |= 0xFFFFFC00u;
attrDecoder.x = uint(floatBitsToUint(max(float(int(attrDecoder.x))/511.0,-1.0)));
attrDecoder.y = uint(floatBitsToUint(max(float(int(attrDecoder.y))/511.0,-1.0)));
attrDecoder.z = uint(floatBitsToUint(max(float(int(attrDecoder.z))/511.0,-1.0)));
attrDecoder.w = uint(floatBitsToUint(float(attrDecoder.w)));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
// 0
PV0ix = 0x3f800000;
PV0iy = 0x40400000;
PV0iz = (R0i.x == int(1))?-1:0;
R127i.w = 0x3f800000;
R127i.x = 0xbf800000;
// 1
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].z) * intBitsToFloat(0x3b808081));
R0i.y = 0;
R123i.z = ((PV0iz == 0)?(PV0ix):(0xc0400000));
R123i.w = ((PV0iz == 0)?(PV0iy):(0xbf800000));
R2i.w = 0x3f800000;
// 2
R2i.x = ((R0i.x == 0)?(R127i.x):(R123i.w));
R2i.y = ((R0i.x == 0)?(R127i.w):(R123i.z));
R2i.z = floatBitsToInt(intBitsToFloat(PV1ix) + -(0.5));
R2i.z = floatBitsToInt(intBitsToFloat(R2i.z) * 2.0);
R0i.w = 0x3d2aaaab;
R1i.x = 0x3e000000;
// 3
R3i.x = uf_remappedVS[1].z;
R3i.x = floatBitsToInt(intBitsToFloat(R3i.x) / 2.0);
R1i.y = 0;
R1i.z = floatBitsToInt(-(intBitsToFloat(R2i.y)));
R1i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[2].z)));
R1i.w = floatBitsToInt(intBitsToFloat(R1i.w) / 2.0);
R4i.x = floatBitsToInt(intBitsToFloat(R2i.x) * 0.5 + 0.5);
R0i.w = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R0i.w),intBitsToFloat(R0i.y))).x);
R0i.xyz = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y))).xyz);
// export
SET_POSITION(vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w)));
// export
// skipped export to semanticId 255
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R3i.x) + -(0.5));
R4i.y = floatBitsToInt(intBitsToFloat(R1i.z) * 0.5 + 0.5);
PV0iz = floatBitsToInt(-(intBitsToFloat(R2i.y)));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
PV0iw = R2i.x;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
R126i.x = floatBitsToInt(intBitsToFloat(R1i.w) + -(0.5));
// 1
R125i.x = uf_remappedVS[3].y;
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) * 2.0);
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[3].x)));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) * 2.0);
R123i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].w) * 2.0 + intBitsToFloat(R4i.y));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R3i.x));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(R1i.w));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R123i.z) + intBitsToFloat(R126i.x));
PV0iy = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(R127i.x));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].w)) * intBitsToFloat(0x3c23d70a) + intBitsToFloat(R4i.y));
R123i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].z) * 2.0 + intBitsToFloat(R4i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV1iw)));
// 3
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R127i.z)));
R123i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].z)) * intBitsToFloat(0x3c23d70a) + intBitsToFloat(R4i.x));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV0iy)));
R127i.w = floatBitsToInt(intBitsToFloat(R123i.w) + intBitsToFloat(backupReg0i));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PV0ix)));
// 4
R3i.x = R123i.y;
PV0iz = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(R126i.x));
R3i.w = R126i.z;
R4i.z = R127i.y;
// 5
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R127i.w)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PV0iz)));
R1i.z = R127i.z;
R4i.w = R127i.x;
R1i.w = R125i.z;
// export
// skipped export to semanticId 255
// export
// skipped export to semanticId 255
// export
passParameterSem6 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.x), intBitsToFloat(R3i.x), intBitsToFloat(R3i.w));
}
