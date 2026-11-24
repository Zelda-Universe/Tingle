#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 5a5d903ced34d3a3
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[15];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
TEXTURE_LAYOUT(33, 0, 1) uniform sampler2D textureUnitVS1;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem12;

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
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem12.xyzw)/255.0));
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
// 0
R125i.x = R2i.x;
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(R2i.x))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(R2i.x) > 0.0)?1.0:0.0);
R126i.w = R2i.z;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R2i.z));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PS0i)));
R125i.y = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iy)));
R127i.z = 0;
PV1iw = ((intBitsToFloat(R2i.x) == 0.0)?-1:0);
PS1i = ((0.0 > intBitsToFloat(R2i.z))?-1:0);
// 2
R127i.x = floatBitsToInt(max(intBitsToFloat(PV1ix), -(intBitsToFloat(PV1ix))));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PV1ix))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(PV1ix) > 0.0)?1.0:0.0);
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), intBitsToFloat(uf_remappedVS[1].z)));
// 3
R124i.x = ((intBitsToFloat(R2i.z) == 0.0)?-1:0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
R125i.z = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(0x3fc90fdb));
R127i.w = ((intBitsToFloat(R127i.x) > 1.0)?-1:0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 4
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(((R127i.w == 0)?(intBitsToFloat(PV1iy)):(-(intBitsToFloat(PV1iy)))));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3fc90fdb));
R0i.z = 0x3e000000;
R123i.w = ((R127i.w == 0)?(R127i.x):(PS1i));
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(0xbf8ccccd));
PV1iy = floatBitsToInt(min(intBitsToFloat(R123i.w), 1.0));
R126i.z = ((R127i.w == 0)?(0):(PV0iy));
R3i.w = floatBitsToInt(-(intBitsToFloat(R1i.w)) + 1.0);
R4i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].z) + -(1.0));
// 6
R127i.x = floatBitsToInt(max(intBitsToFloat(PV1iy), -(1.0)));
R3i.y = R3i.w;
R3i.y = floatBitsToInt(intBitsToFloat(R3i.y) / 2.0);
PV0iz = floatBitsToInt(abs(intBitsToFloat(PV1ix)) * abs(2.5));
PV0iw = floatBitsToInt(max(intBitsToFloat(PV1ix), -(intBitsToFloat(PV1ix))));
R5i.x = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[1].z));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(uf_remappedVS[2].w)));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x402aaaab));
PV1iz = floatBitsToInt(min(intBitsToFloat(PV0iz), 1.0));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R127i.x)));
R5i.w = 0x3f800000;
// 8
R123i.x = floatBitsToInt(intBitsToFloat(0x3d6ee04d) * intBitsToFloat(R127i.w) + intBitsToFloat(0x3f43b24e));
R1i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x461c4000));
R1i.y = clampFI32(R1i.y);
R123i.z = floatBitsToInt(intBitsToFloat(0x3edcf805) * intBitsToFloat(R127i.w) + 1.0);
PV0iw = floatBitsToInt(-(intBitsToFloat(PV1iy)) + 1.0);
PV0iw = clampFI32(PV0iw);
R0i.w = floatBitsToInt(-(intBitsToFloat(PV1iz)) + 1.0);
// 9
R3i.x = floatBitsToInt(-(intBitsToFloat(R1i.y)) + 1.0);
R127i.y = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R127i.x)), intBitsToFloat(R123i.z)));
R3i.z = floatBitsToInt(intBitsToFloat(PV0iw) * 0.375);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R123i.x)) + 1.0);
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].x), intBitsToFloat(R3i.w)));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.w),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.z),intBitsToFloat(R2i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R123i.w));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(0x3c23d70a));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R5i.z = 0x3f800000;
R7i.w = 0x3f800000;
// 12
R123i.x = ((intBitsToFloat(R127i.x) > 0.0)?(PV1iy):(floatBitsToInt(-(intBitsToFloat(PV1iy)))));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 13
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) / 2.0);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R123i.x)) + intBitsToFloat(R126i.z));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 14
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS1i)));
R4i.x = clampFI32(R4i.x);
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + 0.5);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(R126i.w))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(R126i.w) > 0.0)?1.0:0.0);
// 15
PV1ix = R4i.x;
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) / 2.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
tempResultf = max(0.0, intBitsToFloat(PV0iy));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 16
R0i.y = floatBitsToInt(intBitsToFloat(PV1ix) + 0.375);
PV0iw = floatBitsToInt(-(intBitsToFloat(R125i.y)) + intBitsToFloat(PV1iy));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 17
R1i.x = floatBitsToInt(intBitsToFloat(PS0i) + 0.5);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3fc90fdb));
// 18
PV0iy = floatBitsToInt(intBitsToFloat(R126i.w) + -(intBitsToFloat(PV1iz)));
// 19
R123i.x = ((R124i.y == 0)?(PV0iy):(0x40490fdb));
// 20
R123i.w = ((R124i.x == 0)?(R123i.x):(R125i.z));
// 21
PV1iz = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
// 22
R0i.x = floatBitsToInt(intBitsToFloat(PV1iz) + 0.5);
R1i.z = floatBitsToInt(texture(textureUnitVS1, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R1i.w = floatBitsToInt(texture(textureUnitVS1, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.z))).x);
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R1i.w)) + 1.0);
PV0iy = R1i.z;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[3].w) * intBitsToFloat(0x3ed413cd));
R126i.w = floatBitsToInt(intBitsToFloat(R1i.z) * intBitsToFloat(0x461c4000));
R126i.w = clampFI32(R126i.w);
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].w) * intBitsToFloat(0x43c9d6c7));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) + -(1.0));
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x461c4000));
PV1iy = clampFI32(PV1iy);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R1i.y)) + intBitsToFloat(R1i.w));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[3].x) + intBitsToFloat(PV0iz));
R0i.y = uf_remappedVS[4].x;
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(PV1iy)) + 1.0);
R124i.y = floatBitsToInt(fract(intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.z)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R123i.z)));
// 3
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PV0ix)));
R1i.y = PV0iw;
R1i.z = PS0i;
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(intBitsToFloat(R124i.y) * intBitsToFloat(0x3e65a5dd));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].w) + intBitsToFloat(R3i.y));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PV1iw)));
R127i.z = floatBitsToInt(intBitsToFloat(PS1i) + intBitsToFloat(R127i.w));
R4i.w = uf_remappedVS[4].x;
PS0i = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].w) + intBitsToFloat(R124i.y));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) * 3.0);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R3i.z)));
R3i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].x) + -(0.5));
R3i.z = clampFI32(R3i.z);
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) * 100.0);
// 6
PV0ix = floatBitsToInt(fract(intBitsToFloat(PV1ix)));
R125i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x431d1463));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40490e56));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R124i.x)));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) * 5.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) * 3.0);
R125i.z = floatBitsToInt(intBitsToFloat(R2i.y) + -(intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) * 7.0);
PS1i = floatBitsToInt(intBitsToFloat(PV0ix) + -(0.5));
// 8
R123i.x = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R4i.z)));
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.w = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
R124i.y = floatBitsToInt(max(intBitsToFloat(PS1i), -(intBitsToFloat(PS1i))));
// 9
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
PV1iy = R125i.y;
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) * 4.0);
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R5i.x)));
R126i.z = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
// 10
R126i.x = floatBitsToInt(intBitsToFloat(R124i.y) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV1iw)));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.w = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
// 11
R124i.x = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(0x3e22f983) + 0.5);
R5i.y = floatBitsToInt(intBitsToFloat(R125i.z) + -(intBitsToFloat(PV0iz)));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R126i.w = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R127i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.y),intBitsToFloat(R5i.y),intBitsToFloat(R1i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),intBitsToFloat(uf_remappedVS[3].w))));
PV0ix = tempi.x;
R3i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.z = floatBitsToInt(fract(intBitsToFloat(R127i.w)));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.y),intBitsToFloat(R5i.y),intBitsToFloat(R1i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedVS[5].x),intBitsToFloat(uf_remappedVS[5].y),intBitsToFloat(uf_remappedVS[5].z),intBitsToFloat(uf_remappedVS[5].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R6i.w = tempi.x;
R124i.x = floatBitsToInt(fract(intBitsToFloat(R124i.x)));
// 14
R5i.x = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(uf_remappedVS[4].y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(uf_remappedVS[6].y)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].x), intBitsToFloat(R126i.x)));
R125i.y = floatBitsToInt(sin((intBitsToFloat(R126i.w))/0.1591549367));
// 15
PV1ix = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt(-(intBitsToFloat(PV0iy)) + intBitsToFloat(R127i.z));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(uf_remappedVS[4].z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(uf_remappedVS[6].z)));
R126i.w = floatBitsToInt(sin((intBitsToFloat(R127i.x))/0.1591549367));
// 16
PV0ix = floatBitsToInt(-(intBitsToFloat(PV1iz)) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
PV0iz = floatBitsToInt(-(intBitsToFloat(PV1iw)) + intBitsToFloat(PV1ix));
R1i.w = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R0i.w = floatBitsToInt(intBitsToFloat(R124i.x) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 17
R0i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3cb6a401));
R2i.y = floatBitsToInt(min(intBitsToFloat(R127i.w), intBitsToFloat(PV0iy)));
R2i.y = floatBitsToInt(intBitsToFloat(R2i.y) * 2.0);
R2i.y = clampFI32(R2i.y);
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R126i.w)));
R2i.w = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(0xbe99999a));
R2i.w = clampFI32(R2i.w);
R4i.x = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3cb6a401));
R0i.y = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R4i.x = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.w))).x);
// 0
R124i.x = floatBitsToInt(intBitsToFloat(R1i.w) * intBitsToFloat(0x3e22f983));
R125i.y = floatBitsToInt(intBitsToFloat(R2i.y) * intBitsToFloat(0x3ca3d70a));
PV0iz = floatBitsToInt(intBitsToFloat(R0i.w) * intBitsToFloat(0x3e22f983));
R127i.w = floatBitsToInt(intBitsToFloat(R2i.w) * intBitsToFloat(0x3d6a0fd3));
PS0i = floatBitsToInt(sin((intBitsToFloat(R5i.x))/0.1591549367));
// 1
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R4i.z)));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0iz))/0.1591549367));
// 2
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3d4ccccd));
PS0i = floatBitsToInt(sin((intBitsToFloat(backupReg0i))/0.1591549367));
// 3
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(PV0iy)));
// 4
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R124i.x));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV0iz));
R125i.z = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R4i.x));
R127i.w = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R0i.y));
// 6
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), intBitsToFloat(R127i.w)));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.w)) + intBitsToFloat(R125i.z));
R127i.z = floatBitsToInt(intBitsToFloat(PV1ix) * 20.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].y), intBitsToFloat(R125i.z)));
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(uf_remappedVS[6].x)) + intBitsToFloat(R127i.w));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), intBitsToFloat(R127i.w)));
PV1iz = floatBitsToInt(-(intBitsToFloat(R124i.x)) + intBitsToFloat(PV0iw));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].z), intBitsToFloat(R125i.z)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(R127i.z)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(uf_remappedVS[6].x)) + intBitsToFloat(R124i.x));
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R125i.y)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R123i.z)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R124i.y)) + intBitsToFloat(PV0ix));
// 10
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(uf_remappedVS[6].x)) + intBitsToFloat(R124i.y));
PV0iz = PV1iy;
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV1ix)));
// 11
R4i.x = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e23d70a));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R123i.y)));
// 12
R124i.x = PV1iw;
PV0iy = floatBitsToInt(max(intBitsToFloat(PV1iz), 0.0));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.y),intBitsToFloat(R5i.y),intBitsToFloat(R1i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(-(intBitsToFloat(PV0iy)));
// 14
R1i.y = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PS1i));
R1i.z = floatBitsToInt(intBitsToFloat(R6i.w) + intBitsToFloat(R124i.x));
// 0
R124i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R7i.w)),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w))));
PV0iy = R124i.x;
PV0iz = R124i.x;
PV0iw = R124i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R7i.w)),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w))));
PV1ix = tempi.x;
R125i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R7i.w)),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R127i.z = tempi.x;
PV0iw = tempi.x;
// 3
R1i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(PV0ix),intBitsToFloat(R5i.z)),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w))));
PV1iy = R1i.x;
PV1iz = R1i.x;
PV1iw = R1i.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),intBitsToFloat(R5i.z)),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w))));
PV0ix = tempi.x;
R1i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),intBitsToFloat(R5i.z)),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),intBitsToFloat(uf_remappedVS[13].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R1i.z = tempi.x;
PV1iw = tempi.x;
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),intBitsToFloat(R5i.z)),vec4(intBitsToFloat(uf_remappedVS[14].x),intBitsToFloat(uf_remappedVS[14].y),intBitsToFloat(uf_remappedVS[14].z),intBitsToFloat(uf_remappedVS[14].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R1i.w = tempi.x;
// export
SET_POSITION(vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w)));
// export
// skipped export to semanticId 255
}
