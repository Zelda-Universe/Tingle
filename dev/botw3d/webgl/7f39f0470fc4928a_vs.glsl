#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 7f39f0470fc4928a
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[22];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
TEXTURE_LAYOUT(33, 0, 1) uniform sampler2D textureUnitVS1;
TEXTURE_LAYOUT(34, 0, 2) uniform sampler2D textureUnitVS2;
TEXTURE_LAYOUT(35, 0, 3) uniform sampler2D textureUnitVS3;
TEXTURE_LAYOUT(36, 0, 4) uniform sampler2D textureUnitVS4;
TEXTURE_LAYOUT(37, 0, 5) uniform sampler2D textureUnitVS5;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem2;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem8;

out vec4 passParameterSem3;
out vec4 passParameterSem0;
out vec4 passParameterSem2;
out vec4 passParameterSem1;
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
attrDecoder.xy = uvec2(floatBitsToUint(vec2(attrDataSem0.xy)/255.0));
attrDecoder.zw = uvec2(uvec2(0));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), 0, 0x3f800000);
attrDecoder.xy = attrDataSem1.xy;
if( (attrDecoder.x&0x80u) != 0u ) attrDecoder.x |= 0xFFFFFF00u;
if( (attrDecoder.y&0x80u) != 0u ) attrDecoder.y |= 0xFFFFFF00u;
attrDecoder.x = uint(floatBitsToUint(max(float(int(attrDecoder.x))/127.0,-1.0)));
attrDecoder.y = uint(floatBitsToUint(max(float(int(attrDecoder.y))/127.0,-1.0)));
attrDecoder.zw = uvec2(uvec2(0));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), 0, 0x3f800000);
attrDecoder.xy = uvec2(floatBitsToUint(vec2(attrDataSem2.xy)));
attrDecoder.zw = uvec2(uvec2(0));
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), 0, 0x3f800000);
attrDecoder.xy = uvec2(floatBitsToUint(vec2(attrDataSem8.xy)/255.0));
attrDecoder.zw = uvec2(uvec2(0));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), 0, 0x3f800000);
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(uf_remappedVS[0].y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(uf_remappedVS[0].x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(uf_remappedVS[1].y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(uf_remappedVS[1].x)));
R127i.x = floatBitsToInt(intBitsToFloat(R2i.x) * intBitsToFloat(0x3e65a5dd));
// 1
R7i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].z) + intBitsToFloat(PV0iw));
R7i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].w) + intBitsToFloat(PV0iz));
R3i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].z) + intBitsToFloat(PV0iy));
R5i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(PV0ix));
R1i.w = 0x3f800000;
// 2
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(uf_remappedVS[2].y)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(uf_remappedVS[3].z)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(uf_remappedVS[2].x)));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[3].w) * intBitsToFloat(0x43c9d6c7));
R125i.z = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(uf_remappedVS[3].w));
// 3
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(uf_remappedVS[4].y)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(uf_remappedVS[3].y)));
R126i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV0iw));
R0i.w = uf_remappedVS[3].x;
R5i.y = uf_remappedVS[3].x;
// 4
R4i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[2].z) + intBitsToFloat(R127i.z));
R4i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[2].w) + intBitsToFloat(R126i.x));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(uf_remappedVS[5].x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(uf_remappedVS[5].y)));
PS0i = floatBitsToInt(-(intBitsToFloat(PV1iy)) + intBitsToFloat(R126i.z));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R126i.z) + -(intBitsToFloat(R127i.x)));
PV1iy = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(PS0i));
R0i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].z) + intBitsToFloat(PV0iz));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(uf_remappedVS[4].z)));
R0i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].w) + intBitsToFloat(PV0iw));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(uf_remappedVS[6].x)));
R8i.y = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(0x439d1463));
PV0iz = floatBitsToInt(-(intBitsToFloat(PV1iw)) + intBitsToFloat(PV1ix));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(uf_remappedVS[6].y)));
R0i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3cb6a401));
// 7
R6i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].z) + intBitsToFloat(PV0ix));
R6i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].w) + intBitsToFloat(PV0iw));
R5i.z = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3cb6a401));
R2i.w = R3i.z;
R1i.z = R5i.w;
R9i.xyzw = floatBitsToInt(texture(textureUnitVS3, vec2(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y))).xyzw);
R4i.xy = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y))).xy);
R10i.xy = floatBitsToInt(texture(textureUnitVS2, vec2(intBitsToFloat(R0i.z),intBitsToFloat(R0i.y))).zw);
R0i.x = floatBitsToInt(texture(textureUnitVS5, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.w))).x);
R5i.x = floatBitsToInt(texture(textureUnitVS5, vec2(intBitsToFloat(R5i.z),intBitsToFloat(R5i.y))).x);
R6i.xy = floatBitsToInt(texture(textureUnitVS1, vec2(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y))).xy);
R7i.yzw = floatBitsToInt(texture(textureUnitVS4, vec2(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y))).xyz);
// 0
backupReg0i = R8i.y;
PV0ix = backupReg0i;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 4.0);
R8i.y = floatBitsToInt(intBitsToFloat(R9i.z) * 800.0);
R125i.z = floatBitsToInt(intBitsToFloat(R2i.w) + -(intBitsToFloat(uf_remappedVS[7].x)));
R127i.w = floatBitsToInt(intBitsToFloat(R1i.z) + -(intBitsToFloat(uf_remappedVS[7].z)));
R122i.x = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3e22f983) + 0.5);
// 1
R127i.x = floatBitsToInt(fract(intBitsToFloat(R122i.x)));
R127i.y = floatBitsToInt(intBitsToFloat(R8i.y) + -(intBitsToFloat(uf_remappedVS[7].y)));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[3].x)) + 1.0);
R123i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e22f983) + 0.5);
R126i.y = R4i.y;
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) * 2.0);
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.w),intBitsToFloat(R8i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.z = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.z),intBitsToFloat(R127i.y),intBitsToFloat(R127i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.z),intBitsToFloat(R127i.y),intBitsToFloat(R127i.w),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(max(intBitsToFloat(PV0ix), -(intBitsToFloat(PV0ix))));
// 4
R123i.x = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3f4ccccd));
PV0iy = clampFI32(PV0iy);
R127i.z = floatBitsToInt(min(intBitsToFloat(uf_remappedVS[3].x), intBitsToFloat(R127i.z)));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 2.0);
R127i.z = clampFI32(R127i.z);
R123i.w = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R7i.x = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 5
PV1ix = floatBitsToInt(-(intBitsToFloat(PV0iy)) + 1.0);
PV1iy = floatBitsToInt(-(intBitsToFloat(R7i.x)) + 7.5);
R126i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[3].x) + intBitsToFloat(0xbe99999a));
R126i.z = clampFI32(R126i.z);
R127i.w = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
R125i.z = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
// 6
R127i.x = floatBitsToInt(intBitsToFloat(R126i.y) + -(1.0));
R126i.y = R10i.y;
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) / 2.0);
PV0iz = R4i.x;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(uf_remappedVS[9].w)));
R126i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3de38e39));
R126i.x = clampFI32(R126i.x);
// 7
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0x3ca3d70a));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iz) + -(1.0));
PV1iw = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0x3d6a0fd3));
PS1i = floatBitsToInt(sin((intBitsToFloat(R127i.w))/0.1591549367));
// 8
backupReg0i = R126i.y;
backupReg1i = R125i.z;
R127i.x = floatBitsToInt(-(intBitsToFloat(R127i.x)));
R126i.y = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(PS1i)));
R126i.w = floatBitsToInt(intBitsToFloat(backupReg0i) + 0.5);
PS0i = floatBitsToInt(sin((intBitsToFloat(backupReg1i))/0.1591549367));
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R127i.y = R0i.x;
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
R126i.z = R2i.y;
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) / 2.0);
PV1iw = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
R125i.y = R5i.x;
R125i.y = floatBitsToInt(intBitsToFloat(R125i.y) * 2.0);
// 10
backupReg0i = R127i.x;
backupReg1i = R126i.y;
backupReg2i = R126i.w;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(backupReg2i)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(backupReg2i)));
PV0iz = floatBitsToInt(max(intBitsToFloat(backupReg1i), intBitsToFloat(PV1iw)));
R126i.w = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg2i), intBitsToFloat(R125i.x)));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(uf_remappedVS[9].y)));
PV1iy = floatBitsToInt(intBitsToFloat(R126i.z) + 0.75);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].y), intBitsToFloat(R127i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].y), intBitsToFloat(R125i.y)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(PV0iz)));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R126i.y)));
R125i.y = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R127i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV1iw));
// 13
backupReg0i = R127i.y;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(uf_remappedVS[10].z)));
R127i.y = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iz));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(uf_remappedVS[10].x)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(uf_remappedVS[10].w)));
// 14
R125i.x = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PV1iw));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(uf_remappedVS[10].y)));
PV0iz = R3i.x;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
PV0iw = R3i.y;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
R125i.y = R127i.z;
R125i.y = floatBitsToInt(intBitsToFloat(R125i.y) / 2.0);
// 15
PV1ix = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].z) + intBitsToFloat(0xbf1eb852));
PV1iz = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV0iy));
R0i.w = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0iz));
R2i.y = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV0iw));
// 16
PV0ix = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(0x38d1b717));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R10i.y)) + intBitsToFloat(0x3f1eb852));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(R125i.x)));
PV0iw = floatBitsToInt(max(intBitsToFloat(PV1ix), intBitsToFloat(0x3e4ccccd)));
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(PV1iz)));
// 17
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV0ix)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iw)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.z)), intBitsToFloat(R123i.y)));
PS1i = PV0iz;
// 18
R3i.x = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PS1i));
R3i.y = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(PV1iw));
PV0iz = R125i.x;
PV0iw = floatBitsToInt(intBitsToFloat(PS1i) * 1.5);
PS0i = floatBitsToInt(intBitsToFloat(PV1iw) * 1.5);
// 19
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) * 1.5);
R6i.y = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV0iw));
R0i.z = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0iz));
R3i.w = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(PS0i));
R1i.w = floatBitsToInt(intBitsToFloat(R127i.z) * 1.5);
// 20
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R0i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R5i.z = tempi.x;
PV0iw = tempi.x;
R2i.z = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV1ix));
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R9i.w)) + 2.0);
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
R127i.y = ((intBitsToFloat(R1i.y) > 2.0)?-1:0);
R127i.z = ((intBitsToFloat(R1i.y) > 0.0)?-1:0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(uf_remappedVS[9].x)));
tempResultf = 1.0 / sqrt(intBitsToFloat(R5i.z));
PS0i = floatBitsToInt(tempResultf);
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PS0i)));
R4i.y = 0x3f800000;
R126i.z = 0x3f800000;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(PV0iw)));
R124i.y = floatBitsToInt(intBitsToFloat(R9i.x) * 2.0 + -(1.0));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.y),intBitsToFloat(R3i.w),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R6i.y),intBitsToFloat(R3i.w),intBitsToFloat(R2i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.x)));
// 3
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(backupReg0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(backupReg0i)));
PV1iz = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(0x38d1b717));
PV1iw = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(PS0i));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 4
R125i.x = ((R127i.z == 0)?(R2i.w):(PV1iw));
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.y)), intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV1iy));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV1iz)));
// 5
backupReg0i = R127i.x;
R127i.x = ((R127i.z == 0)?(R1i.z):(PV0iw));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(intBitsToFloat(R8i.y) + intBitsToFloat(backupReg0i));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV0iz)));
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(PV0iz)));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(R127i.x));
R126i.y = ((R127i.z == 0)?(R8i.y):(PV1iz));
PV0iz = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(R125i.x));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R125i.y)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R126i.x)));
// 7
PV1ix = floatBitsToInt(-(intBitsToFloat(R125i.y)) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(-(intBitsToFloat(R126i.x)) + intBitsToFloat(PS0i));
R123i.z = ((R127i.y == 0)?(R127i.x):(PV0ix));
R123i.w = ((R127i.y == 0)?(R125i.x):(PV0iz));
R125i.x = floatBitsToInt(intBitsToFloat(R9i.y) * 2.0 + -(1.0));
// 8
R127i.x = floatBitsToInt(intBitsToFloat(R123i.w) + intBitsToFloat(PV1ix));
PV0iy = floatBitsToInt(intBitsToFloat(R124i.x) + intBitsToFloat(R126i.y));
R127i.z = floatBitsToInt(intBitsToFloat(R123i.z) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R124i.y)));
PS0i = floatBitsToInt(intBitsToFloat(uf_remappedVS[11].x) + -(1.0));
// 9
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R125i.x)) + intBitsToFloat(PV0iw));
R126i.x = clampFI32(R126i.x);
R127i.y = ((R127i.y == 0)?(R126i.y):(PV0iy));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.x)),intBitsToFloat(uf_remappedVS[11].y)) + intBitsToFloat(uf_remappedVS[11].x));
R126i.w = floatBitsToInt(intBitsToFloat(R1i.y) * intBitsToFloat(0x3eaaaaab));
R126i.w = clampFI32(R126i.w);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 10
R9i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R4i.y)),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w))));
PV0iy = R9i.x;
PV0iz = R9i.x;
PV0iw = R9i.x;
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(PS1i)) + -(intBitsToFloat(PS1i)));
R7i.x = clampFI32(R7i.x);
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R4i.y)),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),intBitsToFloat(uf_remappedVS[13].w))));
PV1ix = tempi.x;
R9i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.w = R124i.y;
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R4i.y)),vec4(intBitsToFloat(uf_remappedVS[14].x),intBitsToFloat(uf_remappedVS[14].y),intBitsToFloat(uf_remappedVS[14].z),intBitsToFloat(uf_remappedVS[14].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R9i.z = tempi.x;
PV0iw = tempi.x;
R125i.w = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
// 13
R4i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(PV0ix),intBitsToFloat(R126i.z)),vec4(intBitsToFloat(uf_remappedVS[15].x),intBitsToFloat(uf_remappedVS[15].y),intBitsToFloat(uf_remappedVS[15].z),intBitsToFloat(uf_remappedVS[15].w))));
PV1iy = R4i.x;
PV1iz = R4i.x;
PV1iw = R4i.x;
R126i.w = floatBitsToInt(intBitsToFloat(0x3e99999a) * intBitsToFloat(R126i.w));
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R9i.z),intBitsToFloat(R126i.z)),vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),intBitsToFloat(uf_remappedVS[16].w))));
PV0ix = tempi.x;
R4i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R6i.y)) + intBitsToFloat(R127i.w));
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R9i.z),intBitsToFloat(R126i.z)),vec4(intBitsToFloat(uf_remappedVS[17].x),intBitsToFloat(uf_remappedVS[17].y),intBitsToFloat(uf_remappedVS[17].z),intBitsToFloat(uf_remappedVS[17].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R4i.z = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(sqrt(intBitsToFloat(R125i.w)));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R9i.z),intBitsToFloat(R126i.z)),vec4(intBitsToFloat(uf_remappedVS[18].x),intBitsToFloat(uf_remappedVS[18].y),intBitsToFloat(uf_remappedVS[18].z),intBitsToFloat(uf_remappedVS[18].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R4i.w = tempi.x;
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R124i.x)) + intBitsToFloat(PS1i));
// 17
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[12].x)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(R10i.x)) + intBitsToFloat(0xbdc0b780));
PV1iz = R125i.x;
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[13].x)));
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z),intBitsToFloat(R10i.x)) + intBitsToFloat(0xbe50e560));
// 18
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(R10i.x)) + intBitsToFloat(0xbd009d49));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R124i.w)) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[14].x)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(uf_remappedVS[12].y)) + intBitsToFloat(PV1ix));
R8i.x = R1i.x;
R8i.x = floatBitsToInt(intBitsToFloat(R8i.x) / 2.0);
// 19
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(uf_remappedVS[13].y)) + intBitsToFloat(R125i.w));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(uf_remappedVS[14].y)) + intBitsToFloat(PV0iz));
R7i.z = R10i.y;
R10i.w = floatBitsToInt(intBitsToFloat(R10i.x) * 4.0 + -(1.0));
R10i.w = clampFI32(R10i.w);
R8i.y = floatBitsToInt(intBitsToFloat(R1i.y) * intBitsToFloat(0xbeaaaa3b) + 1.0);
// 20
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(uf_remappedVS[12].z)) + intBitsToFloat(R126i.w));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(uf_remappedVS[13].z)) + intBitsToFloat(R123i.x));
// 21
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(uf_remappedVS[14].z)) + intBitsToFloat(R124i.y));
// export
SET_POSITION(vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.z), intBitsToFloat(R4i.w)));
// export
passParameterSem3 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
// export
// skipped export to semanticId 255
// 0
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),-(intBitsToFloat(uf_remappedVS[19].y))) + intBitsToFloat(R6i.y));
PV0iy = floatBitsToInt(-(intBitsToFloat(R7i.x)) + intBitsToFloat(uf_remappedVS[20].w));
PV0iy = clampFI32(PV0iy);
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),-(intBitsToFloat(uf_remappedVS[19].y))) + intBitsToFloat(R3i.x));
// 1
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),-(intBitsToFloat(uf_remappedVS[19].y))) + intBitsToFloat(R0i.x));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(PV0iy)));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),-(intBitsToFloat(uf_remappedVS[19].y))) + intBitsToFloat(PV1iw));
// 3
R7i.w = R123i.x;
// export
passParameterSem0 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w));
// export
passParameterSem2 = vec4(intBitsToFloat(R7i.z), intBitsToFloat(R7i.y), intBitsToFloat(R7i.y), intBitsToFloat(R7i.w));
// 0
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),intBitsToFloat(uf_remappedVS[21].y)) + intBitsToFloat(uf_remappedVS[21].w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(uf_remappedVS[21].x)) + intBitsToFloat(uf_remappedVS[21].z));
// 1
R8i.z = R123i.z;
R8i.w = R123i.y;
// export
passParameterSem1 = vec4(intBitsToFloat(R8i.x), intBitsToFloat(R8i.y), intBitsToFloat(R8i.z), intBitsToFloat(R8i.w));
}
