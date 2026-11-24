#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 3186c63c4eacd1d9
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[15];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
TEXTURE_LAYOUT(33, 0, 1) uniform sampler2D textureUnitVS1;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem2;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem8;
ATTR_LAYOUT(0, 4) in uvec4 attrDataSem12;

out vec4 passParameterSem6;
out vec4 passParameterSem2;
out vec4 passParameterSem0;
out vec4 passParameterSem5;
out vec4 passParameterSem4;
out vec4 passParameterSem7;
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
ivec4 R5i = ivec4(0);
ivec4 R6i = ivec4(0);
ivec4 R7i = ivec4(0);
ivec4 R8i = ivec4(0);
ivec4 R9i = ivec4(0);
ivec4 R10i = ivec4(0);
ivec4 R11i = ivec4(0);
ivec4 R12i = ivec4(0);
ivec4 R13i = ivec4(0);
ivec4 R14i = ivec4(0);
ivec4 R15i = ivec4(0);
ivec4 R122i = ivec4(0);
ivec4 R123i = ivec4(0);
ivec4 R124i = ivec4(0);
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
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
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
attrDecoder.xyzw = attrDataSem2.xyzw;
if( (attrDecoder.x&0x80u) != 0u ) attrDecoder.x |= 0xFFFFFF00u;
if( (attrDecoder.y&0x80u) != 0u ) attrDecoder.y |= 0xFFFFFF00u;
if( (attrDecoder.z&0x80u) != 0u ) attrDecoder.z |= 0xFFFFFF00u;
if( (attrDecoder.w&0x80u) != 0u ) attrDecoder.w |= 0xFFFFFF00u;
attrDecoder.x = uint(floatBitsToUint(max(float(int(attrDecoder.x))/127.0,-1.0)));
attrDecoder.y = uint(floatBitsToUint(max(float(int(attrDecoder.y))/127.0,-1.0)));
attrDecoder.z = uint(floatBitsToUint(max(float(int(attrDecoder.z))/127.0,-1.0)));
attrDecoder.w = uint(floatBitsToUint(max(float(int(attrDecoder.w))/127.0,-1.0)));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xy = attrDataSem8.xy;
attrDecoder.xy = uvec2(((attrDecoder.xy>>8)&0xFFu)|((attrDecoder.xy<<8)&0xFF00u));
attrDecoder.z = uint(0);
attrDecoder.w = uint(0);
attrDecoder.xy = uvec2(floatBitsToUint(unpackHalf2x16(attrDecoder.x|(attrDecoder.y<<16))));
attrDecoder.zw = uvec2(uvec2(0));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), 0, 0x3f800000);
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem12.xyzw)/255.0));
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
// 0
R126i.x = R3i.x;
R125i.y = R3i.z;
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(R3i.x))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(R3i.x) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R3i.z));
// 1
R124i.x = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PS0i)));
R127i.z = 0;
PV1iw = ((intBitsToFloat(R3i.x) == 0.0)?-1:0);
PS1i = ((0.0 > intBitsToFloat(R3i.z))?-1:0);
// 2
PV0ix = floatBitsToInt((intBitsToFloat(PV1iy) > 0.0)?1.0:0.0);
R127i.y = floatBitsToInt(max(intBitsToFloat(PV1iy), -(intBitsToFloat(PV1iy))));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PV1iy))?1.0:0.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), intBitsToFloat(uf_remappedVS[1].z)));
// 3
R127i.x = ((intBitsToFloat(R127i.y) > 1.0)?-1:0);
R124i.y = ((intBitsToFloat(R3i.z) == 0.0)?-1:0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
R125i.w = floatBitsToInt(intBitsToFloat(R124i.x) * intBitsToFloat(0x3fc90fdb));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 4
backupReg0i = R126i.y;
R123i.x = ((R127i.x == 0)?(R127i.y):(PS1i));
R126i.y = floatBitsToInt(((R127i.x == 0)?(intBitsToFloat(PV1iz)):(-(intBitsToFloat(PV1iz)))));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3fc90fdb));
R0i.w = 0x3e000000;
R125i.x = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(0xbf8ccccd));
R7i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].z) + -(1.0));
PV1iz = floatBitsToInt(min(intBitsToFloat(R123i.x), 1.0));
R127i.w = ((R127i.x == 0)?(0):(PV0iz));
R8i.z = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[1].z));
// 6
PV0ix = floatBitsToInt(abs(intBitsToFloat(PV1ix)) * abs(2.5));
R127i.y = floatBitsToInt(max(intBitsToFloat(PV1iz), -(1.0)));
R10i.z = 0x3f800000;
PV0iw = floatBitsToInt(max(intBitsToFloat(PV1ix), -(intBitsToFloat(PV1ix))));
R3i.w = floatBitsToInt(-(intBitsToFloat(R1i.w)) + 1.0);
// 7
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R127i.y)));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(uf_remappedVS[2].w)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x402aaaab));
PV1iw = floatBitsToInt(min(intBitsToFloat(PV0ix), 1.0));
R7i.z = R3i.w;
R7i.z = floatBitsToInt(intBitsToFloat(R7i.z) / 2.0);
// 8
PV0ix = floatBitsToInt(-(intBitsToFloat(PV1iz)) + 1.0);
PV0ix = clampFI32(PV0ix);
R123i.y = floatBitsToInt(intBitsToFloat(0x3d6ee04d) * intBitsToFloat(R127i.x) + intBitsToFloat(0x3f43b24e));
R5i.z = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x461c4000));
R5i.z = clampFI32(R5i.z);
R123i.w = floatBitsToInt(intBitsToFloat(0x3edcf805) * intBitsToFloat(R127i.x) + 1.0);
R8i.y = floatBitsToInt(-(intBitsToFloat(PV1iw)) + 1.0);
// 9
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R123i.y)) + 1.0);
R6i.y = floatBitsToInt(-(intBitsToFloat(R5i.z)) + 1.0);
R126i.z = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R127i.y)), intBitsToFloat(R123i.w)));
R2i.w = floatBitsToInt(intBitsToFloat(PV0ix) * 0.375);
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].x), intBitsToFloat(R3i.w)));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.z),intBitsToFloat(R3i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R123i.x));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(0x3c23d70a));
R14i.y = 0x3f800000;
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS0i)));
R7i.w = 0x3f800000;
R15i.w = R4i.w;
// 12
R123i.y = ((intBitsToFloat(R127i.y) > 0.0)?(PV1iz):(floatBitsToInt(-(intBitsToFloat(PV1iz)))));
R5i.w = R5i.y;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
R126i.w = floatBitsToInt(tempResultf);
// 13
backupReg0i = R126i.w;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R123i.y)) + intBitsToFloat(R127i.w));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(backupReg0i)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 14
PV0ix = floatBitsToInt((intBitsToFloat(R126i.x) > 0.0)?1.0:0.0);
PV0iy = R12i.y;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PS1i)));
R6i.z = clampFI32(R6i.z);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(R126i.x))?1.0:0.0);
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R126i.w)));
// 15
PV1ix = R6i.z;
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) / 2.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iy) + 0.5);
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
// 16
PV0ix = floatBitsToInt(-(intBitsToFloat(R124i.x)) + intBitsToFloat(PV1iz));
R0i.y = floatBitsToInt(intBitsToFloat(PV1ix) + 0.375);
tempResultf = max(0.0, intBitsToFloat(PV1iy));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 17
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3fc90fdb));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 18
R6i.x = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
PV0iz = floatBitsToInt(intBitsToFloat(R126i.x) + -(intBitsToFloat(PV1iw)));
// 19
R123i.y = ((R125i.z == 0)?(PV0iz):(0x40490fdb));
// 20
R123i.x = ((R124i.y == 0)?(R123i.y):(R125i.w));
// 21
PV1iz = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 22
R0i.x = floatBitsToInt(intBitsToFloat(PV1iz) + 0.5);
R0i.z = floatBitsToInt(texture(textureUnitVS1, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R0i.w = floatBitsToInt(texture(textureUnitVS1, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.w))).x);
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R0i.w)) + 1.0);
PV0iy = R0i.z;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[3].w) * intBitsToFloat(0x3ed413cd));
R125i.w = floatBitsToInt(intBitsToFloat(R0i.z) * intBitsToFloat(0x461c4000));
R125i.w = clampFI32(R125i.w);
R124i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].w) * intBitsToFloat(0x43c9d6c7));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[3].x) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x461c4000));
PV1iy = clampFI32(PV1iy);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) + -(1.0));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R5i.z)) + intBitsToFloat(R0i.w));
R0i.y = uf_remappedVS[4].x;
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV1iz)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R126i.w)));
PV0iz = floatBitsToInt(-(intBitsToFloat(PV1iy)) + 1.0);
R125i.w = floatBitsToInt(fract(intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R126i.w)));
// 3
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(PV0iz)));
R10i.y = PV0iy;
R0i.z = PS0i;
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(0x3e65a5dd));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].w) + intBitsToFloat(R7i.z));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(PV1iw)));
R6i.z = uf_remappedVS[4].x;
R127i.w = floatBitsToInt(intBitsToFloat(PS1i) + intBitsToFloat(R124i.y));
PS0i = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].w) + intBitsToFloat(R125i.w));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) * 100.0);
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R2i.w)));
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * 3.0);
R2i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].x) + -(0.5));
R2i.w = clampFI32(R2i.w);
R12i.z = R126i.w;
// 6
R126i.x = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x431d1463));
PV0iy = floatBitsToInt(fract(intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(R7i.x)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40490e56));
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(uf_remappedVS[3].z)));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) * 3.0);
R124i.y = floatBitsToInt(intBitsToFloat(R3i.y) + -(intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) * 7.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iw) * 5.0);
PS1i = floatBitsToInt(intBitsToFloat(PV0iy) + -(0.5));
// 8
R123i.x = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R7i.y)));
R125i.z = floatBitsToInt(max(intBitsToFloat(PS1i), -(intBitsToFloat(PS1i))));
// 9
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R8i.z)));
PV1iz = R126i.x;
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 4.0);
PV1iw = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R126i.w = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
// 10
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PV1iy)));
R123i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.z) + 0.5);
R126i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
// 11
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R11i.y = floatBitsToInt(intBitsToFloat(R124i.y) + -(intBitsToFloat(R3i.x)));
R125i.z = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3e22f983) + 0.5);
R126i.w = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R124i.x = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.y),intBitsToFloat(R11i.y),intBitsToFloat(R0i.z),intBitsToFloat(R10i.z)),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),intBitsToFloat(uf_remappedVS[3].w))));
PV0ix = tempi.x;
R13i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R124i.w = floatBitsToInt(fract(intBitsToFloat(R126i.y)));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.y),intBitsToFloat(R11i.y),intBitsToFloat(R0i.z),intBitsToFloat(R10i.z)),vec4(intBitsToFloat(uf_remappedVS[5].x),intBitsToFloat(uf_remappedVS[5].y),intBitsToFloat(uf_remappedVS[5].z),intBitsToFloat(uf_remappedVS[5].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R0i.w = tempi.x;
R125i.x = floatBitsToInt(fract(intBitsToFloat(R125i.z)));
// 14
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(0x3e22f983));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].x), intBitsToFloat(R125i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y), intBitsToFloat(uf_remappedVS[4].y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y), intBitsToFloat(uf_remappedVS[6].y)));
R125i.z = floatBitsToInt(sin((intBitsToFloat(R126i.w))/0.1591549367));
// 15
PV1ix = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[6].z)));
PV1iz = floatBitsToInt(-(intBitsToFloat(PV0iz)) + intBitsToFloat(R127i.w));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[4].z)));
R126i.y = floatBitsToInt(sin((intBitsToFloat(R124i.x))/0.1591549367));
// 16
PV0ix = floatBitsToInt(-(intBitsToFloat(PV1iw)) + intBitsToFloat(PV1iz));
PV0iy = floatBitsToInt(-(intBitsToFloat(R8i.y)) + 1.0);
R8i.z = floatBitsToInt(intBitsToFloat(R124i.w) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV0iw = floatBitsToInt(-(intBitsToFloat(PV1iy)) + intBitsToFloat(PV1ix));
R7i.y = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 17
R0i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3cb6a401));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R126i.y)));
R3i.z = floatBitsToInt(min(intBitsToFloat(R8i.y), intBitsToFloat(PV0iy)));
R3i.z = floatBitsToInt(intBitsToFloat(R3i.z) * 2.0);
R3i.z = clampFI32(R3i.z);
R6i.w = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3cb6a401));
R3i.y = floatBitsToInt(sin((intBitsToFloat(R126i.x))/0.1591549367));
R0i.y = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R0i.x = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R6i.w),intBitsToFloat(R6i.z))).x);
// export
passParameterSem6 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R8i.z) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(intBitsToFloat(R8i.y) + intBitsToFloat(0xbe99999a));
PV0iy = clampFI32(PV0iy);
R125i.z = floatBitsToInt(intBitsToFloat(R3i.z) * intBitsToFloat(0x3ca3d70a));
R124i.w = floatBitsToInt(intBitsToFloat(R7i.y) * intBitsToFloat(0x3e22f983));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(uf_remappedVS[3].y)) + intBitsToFloat(R6i.x));
// 1
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(uf_remappedVS[3].x)) + intBitsToFloat(R122i.x));
PV1iy = R3i.x;
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) / 2.0);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R6i.y)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3d6a0fd3));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 2
backupReg0i = R124i.w;
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3d4ccccd));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].y), intBitsToFloat(R9i.y)));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].y), intBitsToFloat(PV1iy)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(sin((intBitsToFloat(backupReg0i))/0.1591549367));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PV0ix)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(PV0iy)) + intBitsToFloat(PV0iz));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(uf_remappedVS[5].z)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(uf_remappedVS[7].z)));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(uf_remappedVS[7].y)) + intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(PV1ix));
R5i.z = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(R125i.z));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(PV1iy)));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(uf_remappedVS[5].y)) + intBitsToFloat(PV1iw));
// 5
R0i.x = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(R0i.x));
PV1iy = floatBitsToInt(intBitsToFloat(R9i.z) + intBitsToFloat(PV0iw));
R2i.z = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(R0i.y));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(uf_remappedVS[7].x)) + intBitsToFloat(R123i.x));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(uf_remappedVS[5].x)) + intBitsToFloat(R122i.x));
// 6
R2i.x = floatBitsToInt(intBitsToFloat(PV1iy) * 20.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(uf_remappedVS[3].z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(uf_remappedVS[7].z)));
R3i.w = floatBitsToInt(-(intBitsToFloat(R2i.z)) + intBitsToFloat(R0i.x));
R12i.w = R125i.z;
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.y),intBitsToFloat(R11i.y),intBitsToFloat(R0i.z),intBitsToFloat(R10i.z)),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R2i.w = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(uf_remappedVS[7].y)) + intBitsToFloat(PV0iz));
// 8
R125i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R126i.y),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),1.0,0.0)));
PV0iy = R125i.x;
PV0iz = R125i.x;
PV0iw = R125i.x;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(uf_remappedVS[7].x)) + intBitsToFloat(R122i.x));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[5].x),intBitsToFloat(uf_remappedVS[5].y),intBitsToFloat(uf_remappedVS[5].z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R125i.z = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R126i.z)));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R124i.w),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R124i.w),1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(PV1ix)));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 12
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS1i)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(PS1i)));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS1i)));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 13
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PS0i)));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS0i)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PS0i)));
// export
passParameterSem2 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
// export
passParameterSem0 = vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.z), intBitsToFloat(R5i.x), intBitsToFloat(R5i.w));
// 0
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), intBitsToFloat(R2i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].y), intBitsToFloat(R0i.x)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(uf_remappedVS[6].x)) + intBitsToFloat(R2i.z));
// 1
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), intBitsToFloat(R2i.z)));
PV1iy = floatBitsToInt(-(intBitsToFloat(R125i.x)) + intBitsToFloat(PV0iy));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].z), intBitsToFloat(R0i.x)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(R2i.x)));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(uf_remappedVS[6].x)) + intBitsToFloat(R125i.x));
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.x)) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R124i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[8].z)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(uf_remappedVS[8].z)));
// 3
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(uf_remappedVS[8].y)) + intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(backupReg0i)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(uf_remappedVS[6].x)) + intBitsToFloat(R126i.x));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(uf_remappedVS[8].y)) + intBitsToFloat(PV0iw));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e23d70a));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.w)));
PV0iz = PV1iz;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(uf_remappedVS[8].x)) + intBitsToFloat(R123i.x));
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(uf_remappedVS[8].x)) + intBitsToFloat(R122i.x));
// 5
PV1ix = PV0iy;
R126i.y = floatBitsToInt(intBitsToFloat(R13i.y) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(uf_remappedVS[9].z)));
PV1iw = floatBitsToInt(max(intBitsToFloat(PV0ix), 0.0));
R13i.x = R123i.w;
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(uf_remappedVS[9].y)) + intBitsToFloat(PV1iz));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(uf_remappedVS[9].y)));
R125i.z = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(PV1ix));
PV0iw = floatBitsToInt(-(intBitsToFloat(PV1iw)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(uf_remappedVS[10].z)));
// 7
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(uf_remappedVS[10].y)) + intBitsToFloat(PS0i));
R124i.y = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(PV0iw));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(uf_remappedVS[9].x)) + intBitsToFloat(R123i.x));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(uf_remappedVS[10].y)));
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(uf_remappedVS[9].x)) + intBitsToFloat(PV0iy));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.y),intBitsToFloat(R124i.y),intBitsToFloat(R125i.z),intBitsToFloat(R7i.w)),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R13i.y = R123i.z;
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.y),intBitsToFloat(R124i.y),intBitsToFloat(R125i.z),intBitsToFloat(R7i.w)),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R10i.x = PV0ix;
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.y),intBitsToFloat(R124i.y),intBitsToFloat(R125i.z),intBitsToFloat(R7i.w)),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R10i.y = PV1ix;
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(uf_remappedVS[10].x)) + intBitsToFloat(R126i.x));
R10i.z = PV0ix;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(uf_remappedVS[10].z)) + intBitsToFloat(R124i.w));
// 12
R4i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(R14i.y)),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w))));
PV0iy = R4i.x;
PV0iz = R4i.x;
PV0iw = R4i.x;
R13i.z = R123i.x;
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(R14i.y)),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w))));
PV1ix = tempi.x;
R4i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(R14i.y)),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),intBitsToFloat(uf_remappedVS[13].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R4i.z = tempi.x;
PV0iw = tempi.x;
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(R14i.y)),vec4(intBitsToFloat(uf_remappedVS[14].x),intBitsToFloat(uf_remappedVS[14].y),intBitsToFloat(uf_remappedVS[14].z),intBitsToFloat(uf_remappedVS[14].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R4i.w = tempi.x;
// 16
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(uf_remappedVS[9].z)) + intBitsToFloat(R125i.x));
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(uf_remappedVS[10].x)) + intBitsToFloat(R126i.x));
// export
SET_POSITION(vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.z), intBitsToFloat(R4i.w)));
// export
passParameterSem5 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w));
}
