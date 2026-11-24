#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader cbd035555226f181
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
UNIFORM_BUFFER_LAYOUT(1, 0, 3) uniform uniformBlockVS1
{
vec4 uf_blockVS1[11];
};


UNIFORM_BUFFER_LAYOUT(2, 0, 4) uniform uniformBlockVS2
{
vec4 uf_blockVS2[4096];
};


UNIFORM_BUFFER_LAYOUT(4, 0, 5) uniform uniformBlockVS4
{
vec4 uf_blockVS4[1];
};


UNIFORM_BUFFER_LAYOUT(6, 0, 6) uniform uniformBlockVS6
{
vec4 uf_blockVS6[35];
};


UNIFORM_BUFFER_LAYOUT(8, 0, 7) uniform uniformBlockVS8
{
vec4 uf_blockVS8[13];
};


TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
TEXTURE_LAYOUT(33, 0, 1) uniform sampler2D textureUnitVS1;
TEXTURE_LAYOUT(34, 0, 2) uniform sampler2D textureUnitVS2;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem2;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem4;
ATTR_LAYOUT(0, 4) in uvec4 attrDataSem6;
ATTR_LAYOUT(0, 5) in uvec4 attrDataSem8;
ATTR_LAYOUT(0, 6) in uvec4 attrDataSem12;

out vec4 passParameterSem2;
out vec4 passParameterSem5;
out vec4 passParameterSem6;
out vec4 passParameterSem4;
out vec4 passParameterSem1;
out vec4 passParameterSem8;
out vec4 passParameterSem0;
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
ivec4 R16i = ivec4(0);
ivec4 R17i = ivec4(0);
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
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
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
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyzw = attrDataSem2.xyzw;
if( (attrDecoder.x&0x80u) != 0u ) attrDecoder.x |= 0xFFFFFF00u;
if( (attrDecoder.y&0x80u) != 0u ) attrDecoder.y |= 0xFFFFFF00u;
if( (attrDecoder.z&0x80u) != 0u ) attrDecoder.z |= 0xFFFFFF00u;
if( (attrDecoder.w&0x80u) != 0u ) attrDecoder.w |= 0xFFFFFF00u;
attrDecoder.x = uint(floatBitsToUint(max(float(int(attrDecoder.x))/127.0,-1.0)));
attrDecoder.y = uint(floatBitsToUint(max(float(int(attrDecoder.y))/127.0,-1.0)));
attrDecoder.z = uint(floatBitsToUint(max(float(int(attrDecoder.z))/127.0,-1.0)));
attrDecoder.w = uint(floatBitsToUint(max(float(int(attrDecoder.w))/127.0,-1.0)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xy = attrDataSem8.xy;
attrDecoder.xy = uvec2(((attrDecoder.xy>>8)&0xFFu)|((attrDecoder.xy<<8)&0xFF00u));
attrDecoder.z = uint(0);
attrDecoder.w = uint(0);
attrDecoder.xy = uvec2(floatBitsToUint(unpackHalf2x16(attrDecoder.x|(attrDecoder.y<<16))));
attrDecoder.zw = uvec2(uvec2(0));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), 0, 0x3f800000);
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem12.xyzw)/255.0));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem4.xyzw)/255.0));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyzw = attrDataSem6.xyzw;
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
// 0
R2i.w = 0x3f800000;
R0i.w = R1i.x * 0x3;
// 1
R0i.y = R0i.w + 0x2;
R0i.z = R0i.w + int(1);
R0i.x = R1i.y * 0x3;
// 2
backupReg0i = R1i.z;
R1i.z = R0i.x + 0x2;
R1i.w = R0i.x + int(1);
R1i.y = backupReg0i * 0x3;
R10i.xyzw = floatBitsToInt(uf_blockVS2[R0i.w].xyzw);
R12i.xyzw = floatBitsToInt(uf_blockVS2[R0i.z].xyzw);
R16i.xyzw = floatBitsToInt(uf_blockVS2[R0i.y].xyzw);
R9i.xyzw = floatBitsToInt(uf_blockVS2[R0i.x].xyzw);
R11i.xyzw = floatBitsToInt(uf_blockVS2[R1i.w].xyzw);
R15i.xyzw = floatBitsToInt(uf_blockVS2[R1i.z].xyzw);
R8i.xyzw = floatBitsToInt(uf_blockVS2[R1i.y].xyzw);
// 0
backupReg0i = R1i.y;
R0i.x = backupReg0i + int(1);
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R9i.z)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R10i.y)));
R1i.w = backupReg0i + 0x2;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R8i.z)));
R0i.xyzw = floatBitsToInt(uf_blockVS2[R0i.x].xyzw);
R13i.xyzw = floatBitsToInt(uf_blockVS2[R1i.w].xyzw);
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R8i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R8i.y)) + intBitsToFloat(R1i.x));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R9i.y)) + intBitsToFloat(R1i.y));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV0ix)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R8i.x)) + intBitsToFloat(R122i.x));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R10i.x)) + intBitsToFloat(R1i.z));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R9i.z),intBitsToFloat(R9i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R9i.x)) + intBitsToFloat(R123i.x));
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R10i.z)) + intBitsToFloat(R127i.x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R11i.y)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R12i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV0ix)));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R0i.z)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(R10i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.x)));
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R11i.z)) + intBitsToFloat(R126i.y));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV0ix)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R127i.y)) + intBitsToFloat(PS0i));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R13i.x)));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1iy));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R11i.x)) + intBitsToFloat(R123i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R12i.y)) + intBitsToFloat(R126i.z));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(R127i.x));
// 7
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R0i.x)) + intBitsToFloat(R122i.x));
R17i.y = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(PV0ix));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R15i.z)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R12i.z)) + intBitsToFloat(R123i.w));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R13i.y)) + intBitsToFloat(backupReg0i));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.w)));
// 9
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R15i.y)) + intBitsToFloat(R126i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R127i.z)) + intBitsToFloat(PS0i));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV0ix)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R16i.x)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R16i.x)));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.z),intBitsToFloat(R4i.y),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R16i.z),intBitsToFloat(R16i.y),1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.y));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV0ix)));
// 12
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV1ix)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R13i.z)) + intBitsToFloat(R127i.x));
R1i.z = floatBitsToInt(-(intBitsToFloat(R3i.w)) + 1.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R13i.z)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R8i.x)));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.z),intBitsToFloat(R6i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R8i.z),intBitsToFloat(R8i.y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R125i.w = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R15i.x)) + intBitsToFloat(R125i.x));
// 14
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R122i.x)) + intBitsToFloat(R125i.y));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R16i.z)) + intBitsToFloat(R126i.w));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R9i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R10i.x)));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R13i.x)) + intBitsToFloat(R127i.w));
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R127i.z = tempi.x;
PV1iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R10i.y)) + intBitsToFloat(PV0iw));
// 16
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R13i.y)) + intBitsToFloat(R127i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R10i.z)) + intBitsToFloat(R122i.x));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R127i.y)) + intBitsToFloat(R125i.x));
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),intBitsToFloat(R12i.z),intBitsToFloat(R12i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.y)));
// 18
backupReg0i = R127i.z;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R0i.y)));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), uf_blockVS8[0].x));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV1ix)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(backupReg0i)) + intBitsToFloat(PS1i));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R11i.x)));
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.z),intBitsToFloat(PV0ix),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.z),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R11i.y)) + intBitsToFloat(PS0i));
// 20
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R11i.z)) + intBitsToFloat(R122i.x));
PV0iy = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(R127i.z));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R16i.y)) + intBitsToFloat(R125i.y));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R12i.x)));
// 21
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.z),intBitsToFloat(R6i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R12i.z),intBitsToFloat(R12i.y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R0i.x = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV0iy));
// 22
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R125i.w)) + intBitsToFloat(R127i.w));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y), intBitsToFloat(R14i.y)));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R126i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R15i.z)));
// 23
R12i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),1.0,0.0)));
PV1iy = R12i.x;
PV1iz = R12i.x;
PV1iw = R12i.x;
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R126i.x)) + intBitsToFloat(PV0iw));
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z),intBitsToFloat(R10i.z)) + intBitsToFloat(R12i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R12i.x)) + intBitsToFloat(R12i.z));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R1i.y)) + intBitsToFloat(R123i.x));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R0i.z)) + intBitsToFloat(R11i.z));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R10i.x)) + intBitsToFloat(R123i.w));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R13i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.x));
PS0i = floatBitsToInt(tempResultf);
// 3
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PS0i)));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y), intBitsToFloat(PS0i)));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(PS0i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R126i.z)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),intBitsToFloat(R15i.z),intBitsToFloat(R15i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R125i.y)) + intBitsToFloat(PS1i));
// 5
R126i.x = floatBitsToInt(uf_blockVS4[0].w * intBitsToFloat(0x3ed413cd));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV0ix)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x),intBitsToFloat(R11i.x)) + intBitsToFloat(R122i.x));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R16i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.w));
PS0i = floatBitsToInt(tempResultf);
// 7
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(PS0i)));
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PS0i)));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(uf_blockVS4[0].x + intBitsToFloat(R126i.x));
// 8
R2i.x = floatBitsToInt(fract(intBitsToFloat(PS1i)));
R5i.y = floatBitsToInt(intBitsToFloat(R1i.z) + -(uf_blockVS8[0].z));
R5i.y = clampFI32(R5i.y);
PV0iz = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV1iw));
R2i.w = R1i.z;
R2i.w = floatBitsToInt(intBitsToFloat(R2i.w) / 2.0);
// 9
R15i.w = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0iz));
// 10
R16i.w = floatBitsToInt(intBitsToFloat(R2i.x) * intBitsToFloat(0x3e65a5dd));
// 0
R124i.x = floatBitsToInt(uf_blockVS6[32].x + -(0.5));
R124i.x = clampFI32(R124i.x);
PV0iy = floatBitsToInt(uf_blockVS6[32].w + intBitsToFloat(R2i.x));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.w), uf_blockVS6[32].z));
PV0iw = floatBitsToInt(uf_blockVS6[32].w + intBitsToFloat(R2i.w));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.y), uf_blockVS6[32].y));
// 1
PV1ix = floatBitsToInt(uf_blockVS6[32].w * intBitsToFloat(0x43c9d6c7));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.w), uf_blockVS6[33].z));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) * 100.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) * 3.0);
// 2
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40490e56));
R125i.y = floatBitsToInt(intBitsToFloat(R16i.w) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(fract(intBitsToFloat(PV1iw)));
R126i.w = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x431d1463));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.y), uf_blockVS6[33].y));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) * 3.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) * 5.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iz) + -(0.5));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) * 7.0);
PS1i = R126i.w;
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 4.0);
// 4
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iw = floatBitsToInt(max(intBitsToFloat(PV1iz), -(intBitsToFloat(PV1iz))));
R122i.x = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3e22f983) + 0.5);
// 5
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) + 0.5);
PV1iw = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
PS1i = floatBitsToInt(fract(intBitsToFloat(R122i.x)));
// 6
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS6[32].x, intBitsToFloat(PV1iz)));
R126i.x = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 7
R125i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R127i.y = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
PV1iz = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
PV1iw = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
PS1i = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(0xbe99999a));
PS1i = clampFI32(PS1i);
// 8
PV0ix = floatBitsToInt(min(intBitsToFloat(R127i.w), intBitsToFloat(PV1iz)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
PV0ix = clampFI32(PV0ix);
R2i.y = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3d6a0fd3));
R123i.z = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0x3e22f983) + 0.5);
R127i.w = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(0x3e22f983));
R127i.z = floatBitsToInt(sin((intBitsToFloat(PV1iw))/0.1591549367));
// 9
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV1iy = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(R125i.y));
PV1iz = floatBitsToInt(intBitsToFloat(R125i.y) + -(intBitsToFloat(R126i.y)));
R125i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3ca3d70a));
R127i.x = floatBitsToInt(sin((intBitsToFloat(R127i.y))/0.1591549367));
// 10
R123i.x = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R1i.y = floatBitsToInt(uf_blockVS6[32].x);
PV0iz = floatBitsToInt(-(intBitsToFloat(R124i.y)) + intBitsToFloat(PV1iz));
R126i.w = floatBitsToInt(-(intBitsToFloat(R126i.z)) + intBitsToFloat(PV1iy));
PS0i = floatBitsToInt(sin((intBitsToFloat(R125i.x))/0.1591549367));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
R16i.z = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3cb6a401));
R16i.w = floatBitsToInt(uf_blockVS6[32].x);
PS1i = floatBitsToInt(sin((intBitsToFloat(R127i.w))/0.1591549367));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV1iy)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PS1i)));
R1i.z = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0x3cb6a401));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1ix))/0.1591549367));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3d4ccccd));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PS0i)));
// 14
R11i.x = floatBitsToInt(intBitsToFloat(R124i.y) + intBitsToFloat(PV1iw));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(PV1ix)));
// 15
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PV0iz)));
// 16
backupReg0i = R10i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.w), uf_blockVS6[34].y));
R10i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS8[0].y, intBitsToFloat(backupReg0i)));
PV0iz = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.y), uf_blockVS6[34].x));
R15i.z = 0;
// 17
R2i.x = floatBitsToInt(uf_blockVS6[34].z + intBitsToFloat(PV0iw));
R5i.y = floatBitsToInt(intBitsToFloat(PV0iz) * 20.0);
R2i.z = floatBitsToInt(uf_blockVS6[34].w + intBitsToFloat(PV0ix));
R13i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS8[0].z, uf_blockVS8[0].z));
R2i.w = floatBitsToInt(texture(textureUnitVS1, vec2(intBitsToFloat(R1i.z),intBitsToFloat(R1i.y))).x);
R16i.z = floatBitsToInt(texture(textureUnitVS1, vec2(intBitsToFloat(R16i.z),intBitsToFloat(R16i.w))).x);
R2i.xy = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.z))).xy);
// 0
PV0ix = R2i.x;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
R124i.y = floatBitsToInt(intBitsToFloat(R11i.x) + intBitsToFloat(R16i.z));
PV0iz = R2i.y;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
R125i.w = floatBitsToInt(intBitsToFloat(R11i.x) + intBitsToFloat(R2i.w));
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), uf_blockVS1[0].z));
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(R125i.w)) + intBitsToFloat(R124i.y));
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) + -(1.0));
PV1iz = floatBitsToInt(mul_nonIEEE(uf_blockVS6[33].y, intBitsToFloat(R124i.y)));
R126i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS6[32].y, intBitsToFloat(R125i.w)));
PS1i = floatBitsToInt(intBitsToFloat(PV0iz) + -(1.0));
// 2
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS6[32].z, intBitsToFloat(R125i.w)));
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.w)) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(-(intBitsToFloat(PS1i)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),uf_blockVS6[33].x) + intBitsToFloat(R125i.w));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R10i.y)));
// 3
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R5i.y)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),uf_blockVS6[33].x) + intBitsToFloat(R126i.w));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(R10i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(uf_blockVS6[33].z, intBitsToFloat(R124i.y)));
R16i.w = 0x3f800000;
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R125i.x)));
R124i.y = R127i.z;
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R123i.y)));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y),uf_blockVS1[0].y) + intBitsToFloat(R124i.x));
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),uf_blockVS6[33].x) + intBitsToFloat(R127i.x));
PV1iy = PV0iw;
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PV0ix)));
R12i.w = 0x3f800000;
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),uf_blockVS1[0].x) + intBitsToFloat(R122i.x));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R17i.y) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e23d70a));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R123i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), uf_blockVS1[2].z));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), uf_blockVS1[1].z));
// 7
PV1ix = PV0iz;
PV1iy = floatBitsToInt(max(intBitsToFloat(PV0iy), 0.0));
R5i.z = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R126i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y),uf_blockVS1[2].y) + intBitsToFloat(PV0iw));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y),uf_blockVS1[1].y) + intBitsToFloat(PS0i));
// 8
PV0ix = floatBitsToInt(intBitsToFloat(R15i.w) + intBitsToFloat(PV1ix));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),uf_blockVS1[1].x) + intBitsToFloat(R122i.x));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),uf_blockVS1[2].x) + intBitsToFloat(R123i.w));
PV0iw = floatBitsToInt(-(intBitsToFloat(PV1iy)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y), uf_blockVS1[1].y));
// 9
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z),uf_blockVS1[1].z) + intBitsToFloat(PS0i));
R16i.y = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV0iw));
R16i.z = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R124i.y));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), uf_blockVS1[0].z));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.z),intBitsToFloat(R15i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.z),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y),uf_blockVS1[0].y) + intBitsToFloat(PS1i));
// 11
PV1ix = floatBitsToInt(-(intBitsToFloat(PV0ix)) + intBitsToFloat(R13i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.x),uf_blockVS1[1].x) + intBitsToFloat(R127i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.x),uf_blockVS1[0].x) + intBitsToFloat(R122i.x));
R2i.w = R6i.w;
R0i.z = R7i.x;
// 12
R15i.x = R123i.z;
R15i.y = R123i.y;
PV0iz = floatBitsToInt(max(intBitsToFloat(PV1ix), 0.0));
R0i.w = R7i.y;
R6i.x = 0x3d2aaaab;
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R14i.y),intBitsToFloat(R10i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[2].x,uf_blockVS1[2].y,uf_blockVS1[2].z,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R15i.w = floatBitsToInt(sqrt(intBitsToFloat(PV0iz)));
// 14
R13i.x = 0x3e000000;
R6i.y = 0;
R15i.z = PV1ix;
R13i.w = 0;
R6i.w = floatBitsToInt(texture(textureUnitVS2, vec2(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y))).x);
R6i.xyz = floatBitsToInt(texture(textureUnitVS2, vec2(intBitsToFloat(R13i.x),intBitsToFloat(R13i.w))).xyz);
// export
passParameterSem2 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.z), intBitsToFloat(R6i.w));
// export
passParameterSem5 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
// export
passParameterSem6 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// 0
PV0iy = floatBitsToInt(uf_blockVS8[0].z + -(intBitsToFloat(R15i.w)));
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(PV0iy)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),uf_blockVS8[9].x) + uf_blockVS8[10].x);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),uf_blockVS8[9].y) + uf_blockVS8[10].y);
// 2
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),uf_blockVS8[9].w) + intBitsToFloat(R123i.z));
R124i.y = floatBitsToInt(intBitsToFloat(R16i.y) + intBitsToFloat(PV1ix));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),uf_blockVS8[9].z) + intBitsToFloat(R123i.y));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.z),intBitsToFloat(R124i.y),intBitsToFloat(R16i.z),intBitsToFloat(R16i.w)),vec4(uf_blockVS1[0].x,uf_blockVS1[0].y,uf_blockVS1[0].z,uf_blockVS1[0].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R7i.z = R123i.w;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.z),intBitsToFloat(R124i.y),intBitsToFloat(R16i.z),intBitsToFloat(R16i.w)),vec4(uf_blockVS1[1].x,uf_blockVS1[1].y,uf_blockVS1[1].z,uf_blockVS1[1].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R15i.x = PV1ix;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.z),intBitsToFloat(R124i.y),intBitsToFloat(R16i.z),intBitsToFloat(R16i.w)),vec4(uf_blockVS1[2].x,uf_blockVS1[2].y,uf_blockVS1[2].z,uf_blockVS1[2].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R15i.y = PV0ix;
// 6
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),uf_blockVS8[11].x) + uf_blockVS8[12].x);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),uf_blockVS8[11].y) + uf_blockVS8[12].y);
R15i.z = PV1ix;
R7i.w = backupReg0i;
// 7
R5i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),intBitsToFloat(R15i.z),intBitsToFloat(R12i.w)),vec4(uf_blockVS1[7].x,uf_blockVS1[7].y,uf_blockVS1[7].z,uf_blockVS1[7].w)));
PV1iy = R5i.x;
PV1iz = R5i.x;
PV1iw = R5i.x;
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),intBitsToFloat(R15i.z),intBitsToFloat(R12i.w)),vec4(uf_blockVS1[8].x,uf_blockVS1[8].y,uf_blockVS1[8].z,uf_blockVS1[8].w)));
PV0ix = tempi.x;
R5i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),intBitsToFloat(R15i.z),intBitsToFloat(R12i.w)),vec4(uf_blockVS1[9].x,uf_blockVS1[9].y,uf_blockVS1[9].z,uf_blockVS1[9].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R5i.z = tempi.x;
PV1iw = tempi.x;
R124i.y = floatBitsToInt(-(intBitsToFloat(PV0ix)));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),intBitsToFloat(R15i.z),intBitsToFloat(R12i.w)),vec4(uf_blockVS1[10].x,uf_blockVS1[10].y,uf_blockVS1[10].z,uf_blockVS1[10].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R5i.w = tempi.x;
R12i.z = PV1ix;
// 11
R12i.x = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV0ix));
R12i.x = floatBitsToInt(intBitsToFloat(R12i.x) / 2.0);
R12i.y = floatBitsToInt(intBitsToFloat(R124i.y) + intBitsToFloat(PV0ix));
R12i.y = floatBitsToInt(intBitsToFloat(R12i.y) / 2.0);
R12i.w = PV0ix;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),uf_blockVS8[11].z) + intBitsToFloat(R127i.x));
// 12
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),uf_blockVS8[11].w) + intBitsToFloat(R127i.y));
// export
passParameterSem1 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
// export
passParameterSem0 = vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.y), intBitsToFloat(R7i.z), intBitsToFloat(R7i.w));
// export
SET_POSITION(vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.z), intBitsToFloat(R5i.w)));
// export
passParameterSem7 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
}
