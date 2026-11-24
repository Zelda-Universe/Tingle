#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 2c3ffe175bdf0b61
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
UNIFORM_BUFFER_LAYOUT(1, 0, 1) uniform uniformBlockVS1
{
vec4 uf_blockVS1[11];
};


UNIFORM_BUFFER_LAYOUT(2, 0, 2) uniform uniformBlockVS2
{
vec4 uf_blockVS2[4096];
};


UNIFORM_BUFFER_LAYOUT(8, 0, 3) uniform uniformBlockVS8
{
vec4 uf_blockVS8[13];
};


TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem2;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem4;
ATTR_LAYOUT(0, 4) in uvec4 attrDataSem6;
ATTR_LAYOUT(0, 5) in uvec4 attrDataSem8;

out vec4 passParameterSem0;
out vec4 passParameterSem8;
out vec4 passParameterSem2;
out vec4 passParameterSem5;
out vec4 passParameterSem4;
out vec4 passParameterSem9;
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
ivec4 R18i = ivec4(0);
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
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
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
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyzw = attrDataSem2.xyzw;
if( (attrDecoder.x&0x80u) != 0u ) attrDecoder.x |= 0xFFFFFF00u;
if( (attrDecoder.y&0x80u) != 0u ) attrDecoder.y |= 0xFFFFFF00u;
if( (attrDecoder.z&0x80u) != 0u ) attrDecoder.z |= 0xFFFFFF00u;
if( (attrDecoder.w&0x80u) != 0u ) attrDecoder.w |= 0xFFFFFF00u;
attrDecoder.x = uint(floatBitsToUint(max(float(int(attrDecoder.x))/127.0,-1.0)));
attrDecoder.y = uint(floatBitsToUint(max(float(int(attrDecoder.y))/127.0,-1.0)));
attrDecoder.z = uint(floatBitsToUint(max(float(int(attrDecoder.z))/127.0,-1.0)));
attrDecoder.w = uint(floatBitsToUint(max(float(int(attrDecoder.w))/127.0,-1.0)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xy = attrDataSem8.xy;
attrDecoder.xy = uvec2(((attrDecoder.xy>>8)&0xFFu)|((attrDecoder.xy<<8)&0xFF00u));
attrDecoder.z = uint(0);
attrDecoder.w = uint(0);
attrDecoder.xy = uvec2(floatBitsToUint(vec2(float(attrDecoder.x), float(attrDecoder.y))/65535.0));
attrDecoder.zw = uvec2(uvec2(0));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), 0, 0x3f800000);
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem4.xyzw)/255.0));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyzw = attrDataSem6.xyzw;
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
// 0
R6i.z = floatBitsToInt(1.0);
R3i.w = 0x3f800000;
R0i.y = R1i.x * 0x3;
// 1
backupReg0i = R0i.y;
R0i.x = backupReg0i + int(1);
R0i.w = backupReg0i + 0x2;
R0i.z = R1i.y * 0x3;
R9i.xyzw = floatBitsToInt(uf_blockVS2[R0i.y].xyzw);
R13i.xyzw = floatBitsToInt(uf_blockVS2[R0i.x].xyzw);
R14i.xyzw = floatBitsToInt(uf_blockVS2[R0i.w].xyzw);
R10i.xyzw = floatBitsToInt(uf_blockVS2[R0i.z].xyzw);
// 0
R0i.x = R0i.z + 0x2;
R0i.y = R0i.z + int(1);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R10i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R9i.y)));
R0i.w = R1i.z * 0x3;
// 1
backupReg0i = R1i.w;
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R10i.z)) + intBitsToFloat(PV0iz));
R1i.y = R0i.w + 0x2;
R1i.z = R0i.w + int(1);
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R9i.z)) + intBitsToFloat(PV0iw));
R1i.x = backupReg0i * 0x3;
R12i.xyzw = floatBitsToInt(uf_blockVS2[R0i.y].xyzw);
R15i.xyzw = floatBitsToInt(uf_blockVS2[R0i.x].xyzw);
R8i.xyzw = floatBitsToInt(uf_blockVS2[R0i.w].xyzw);
R11i.xyzw = floatBitsToInt(uf_blockVS2[R1i.z].xyzw);
R16i.xyzw = floatBitsToInt(uf_blockVS2[R1i.y].xyzw);
R0i.xyzw = floatBitsToInt(uf_blockVS2[R1i.x].xyzw);
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R0i.z)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R9i.x)) + intBitsToFloat(R1i.w));
R1i.z = R1i.x + 0x2;
R1i.w = R1i.x + int(1);
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R8i.z)));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(PV0ix));
// 2
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PV1ix)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R0i.x)) + intBitsToFloat(R122i.x));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R11i.z)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R12i.z)));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R8i.y)) + intBitsToFloat(R127i.x));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R8i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R8i.x)) + intBitsToFloat(R122i.x));
// 4
backupReg0i = R127i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R10i.x)) + intBitsToFloat(R7i.x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R12i.y)) + intBitsToFloat(R127i.w));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV1ix)));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R11i.y)) + intBitsToFloat(backupReg0i));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(R10i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R127i.y)));
// 6
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV1ix)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R12i.x)) + intBitsToFloat(R126i.y));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R16i.z)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(backupReg0i)) + intBitsToFloat(PS1i));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R13i.z)));
// 7
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R11i.x)) + intBitsToFloat(R126i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R16i.y)) + intBitsToFloat(PV0iz));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R126i.w)) + intBitsToFloat(R123i.w));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R15i.z)));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R13i.y)) + intBitsToFloat(PS0i));
// 8
R18i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R125i.y)) + intBitsToFloat(R123i.z));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R16i.x)) + intBitsToFloat(R123i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R13i.x)) + intBitsToFloat(R122i.x));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R14i.z)));
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R15i.y)) + intBitsToFloat(PV1iw));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R9i.z),intBitsToFloat(R9i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.z)));
// 10
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R126i.y)) + intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R0i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV1ix)));
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R14i.x)) + intBitsToFloat(R126i.w));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(PV0iy),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R6i.w = tempi.x;
PS1i = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0iz));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PS1i));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R14i.y)) + intBitsToFloat(R124i.x));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R126i.x)) + intBitsToFloat(R125i.x));
// 13
R0i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV0ix));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.y)));
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 15
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV0ix)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R15i.x)) + intBitsToFloat(R7i.x));
// 16
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R123i.y)) + intBitsToFloat(R127i.z));
// 17
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R125i.y)) + intBitsToFloat(R123i.y));
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),intBitsToFloat(R12i.z),intBitsToFloat(R12i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 19
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV0ix)));
// 20
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R13i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 21
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV0ix)));
// 22
PV0iw = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1ix));
// 23
R0i.z = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV0iw));
// 24
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R16i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 25
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV0ix)));
// 26
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),intBitsToFloat(R15i.z),intBitsToFloat(R15i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 27
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV0ix)));
// 28
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(R14i.z),intBitsToFloat(R14i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 29
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV0ix)));
// 30
PV0iy = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV1iz));
// 31
R0i.w = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iy));
R7i.xyzw = floatBitsToInt(uf_blockVS2[R1i.w].xyzw);
R17i.xyzw = floatBitsToInt(uf_blockVS2[R1i.z].xyzw);
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z),intBitsToFloat(R7i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R7i.z)));
// 1
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R7i.y)) + intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R8i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R10i.x)));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R17i.z)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.z),intBitsToFloat(R5i.y),intBitsToFloat(PV1iy),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R8i.z),intBitsToFloat(R8i.y),1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R126i.z = tempi.x;
PV0iw = tempi.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R10i.y)) + intBitsToFloat(PV1iw));
// 3
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R17i.y)) + intBitsToFloat(R126i.x));
R8i.y = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(R0i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R17i.y)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R9i.x)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.z),intBitsToFloat(R5i.y),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R9i.z),intBitsToFloat(R9i.y),1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R10i.z)) + intBitsToFloat(R125i.x));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R17i.x),intBitsToFloat(R17i.y),intBitsToFloat(R17i.z),intBitsToFloat(R17i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV0ix)));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PV1ix)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R7i.x)) + intBitsToFloat(R124i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R125i.y)) + intBitsToFloat(PS1i));
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R17i.z)) + intBitsToFloat(R127i.z));
// 7
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R126i.z)) + intBitsToFloat(R123i.z));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R123i.y)) + intBitsToFloat(R4i.w));
R3i.z = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R0i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R17i.x)) + intBitsToFloat(backupReg0i));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R7i.y)));
// 8
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.z),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.z),1.0,0.0)));
PV0iy = R127i.x;
PV0iz = R127i.x;
PV0iw = R127i.x;
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R123i.w)) + intBitsToFloat(R1i.x));
// 9
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R6i.w)) + intBitsToFloat(R126i.x));
R7i.y = 0x3f800000;
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),uf_blockVS8[11].x) + uf_blockVS8[12].x);
R6i.w = 0x3f800000;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R11i.z)));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R127i.w = tempi.x;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),uf_blockVS8[11].z) + intBitsToFloat(R123i.z));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),intBitsToFloat(R12i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R126i.z = tempi.x;
PV1iw = tempi.x;
R12i.x = R126i.w;
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R12i.y = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0x3f333333));
// 13
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV0ix)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R15i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R14i.y)));
R13i.w = R5i.w;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R16i.z)));
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.z),intBitsToFloat(PV1iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.z),1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R127i.z = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R16i.y)) + intBitsToFloat(PS1i));
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R125i.y),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R126i.w = tempi.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R16i.x)) + intBitsToFloat(R122i.x));
// 16
R15i.x = 0x3d2aaaab;
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R127i.z)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R126i.z)) + intBitsToFloat(R126i.x));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R125i.z)));
// 17
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R126i.w)) + intBitsToFloat(PV0iy));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R17i.x)) + intBitsToFloat(R124i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.w));
R15i.w = 0;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R126i.y)) + intBitsToFloat(PS0i));
// 18
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.x),intBitsToFloat(R18i.x)) + intBitsToFloat(R122i.x));
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.z));
R5i.z = 0x3ec00000;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R125i.x)) + intBitsToFloat(backupReg0i));
R5i.y = 0;
// 19
R2i.x = 0x3eeaaaab;
R2i.y = 0;
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R125i.y)) + intBitsToFloat(R123i.w));
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.x));
PS1i = floatBitsToInt(tempResultf);
// 20
R17i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.x), intBitsToFloat(PS1i)));
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS1i)));
R17i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R2i.z)));
// 21
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R17i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R17i.y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.z), uf_blockVS1[0].z));
// 22
R18i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R17i.x),intBitsToFloat(R15i.y),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[0].x,uf_blockVS1[0].y,1.0,0.0)));
PV0iy = R18i.x;
PV0iz = R18i.x;
PV0iw = R18i.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
R2i.w = floatBitsToInt(tempResultf);
R14i.w = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R15i.x),intBitsToFloat(R15i.w))).y);
R16i.xyz = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R5i.z),intBitsToFloat(R5i.y))).xyz);
R5i.xyz = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y))).xyz);
// export
passParameterSem0 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.x), intBitsToFloat(R6i.y));
// export
passParameterSem8 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.z));
// export
// skipped export to semanticId 255
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R2i.w)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.y), intBitsToFloat(R2i.w)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R2i.w)));
R2i.w = R18i.x;
R125i.y = floatBitsToInt(-(intBitsToFloat(R16i.y)) + intBitsToFloat(R5i.y));
// 1
R13i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[0].x,uf_blockVS1[0].y,uf_blockVS1[0].z,0.0)));
PV1iy = R13i.x;
PV1iz = R13i.x;
PV1iw = R13i.x;
R127i.z = floatBitsToInt(-(intBitsToFloat(R16i.x)) + intBitsToFloat(R5i.x));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[1].x,uf_blockVS1[1].y,uf_blockVS1[1].z,0.0)));
PV0ix = tempi.x;
R13i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.x = floatBitsToInt(-(intBitsToFloat(R16i.z)) + intBitsToFloat(R5i.z));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[2].x,uf_blockVS1[2].y,uf_blockVS1[2].z,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R13i.z = tempi.x;
PV1iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.z), uf_blockVS1[2].z));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R17i.x),intBitsToFloat(R15i.y),intBitsToFloat(R17i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[1].x,uf_blockVS1[1].y,uf_blockVS1[1].z,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R17i.x),intBitsToFloat(R15i.y),intBitsToFloat(R127i.x),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[2].x,uf_blockVS1[2].y,1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R2i.y = PV0ix;
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R8i.y),intBitsToFloat(R3i.z),intBitsToFloat(R6i.w)),vec4(uf_blockVS1[0].x,uf_blockVS1[0].y,uf_blockVS1[0].z,uf_blockVS1[0].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R2i.z = PV1ix;
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R8i.y),intBitsToFloat(R3i.z),intBitsToFloat(R6i.w)),vec4(uf_blockVS1[1].x,uf_blockVS1[1].y,uf_blockVS1[1].z,uf_blockVS1[1].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R15i.x = PV0ix;
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R8i.y),intBitsToFloat(R3i.z),intBitsToFloat(R6i.w)),vec4(uf_blockVS1[2].x,uf_blockVS1[2].y,uf_blockVS1[2].z,uf_blockVS1[2].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R15i.y = PV1ix;
// 9
R15i.z = PV0ix;
// 10
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),intBitsToFloat(R15i.z),intBitsToFloat(R7i.y)),vec4(uf_blockVS1[7].x,uf_blockVS1[7].y,uf_blockVS1[7].z,uf_blockVS1[7].w)));
PV0iy = R0i.x;
PV0iz = R0i.x;
PV0iw = R0i.x;
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),intBitsToFloat(R15i.z),intBitsToFloat(R7i.y)),vec4(uf_blockVS1[8].x,uf_blockVS1[8].y,uf_blockVS1[8].z,uf_blockVS1[8].w)));
PV1ix = tempi.x;
R0i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),intBitsToFloat(R15i.z),intBitsToFloat(R7i.y)),vec4(uf_blockVS1[9].x,uf_blockVS1[9].y,uf_blockVS1[9].z,uf_blockVS1[9].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R0i.z = tempi.x;
PV0iw = tempi.x;
R127i.w = floatBitsToInt(-(intBitsToFloat(PV1ix)));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),intBitsToFloat(R15i.z),intBitsToFloat(R7i.y)),vec4(uf_blockVS1[10].x,uf_blockVS1[10].y,uf_blockVS1[10].z,uf_blockVS1[10].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R0i.w = tempi.x;
R7i.z = PV0ix;
// 14
R7i.x = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV1ix));
R7i.x = floatBitsToInt(intBitsToFloat(R7i.x) / 2.0);
R7i.y = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1ix));
R7i.y = floatBitsToInt(intBitsToFloat(R7i.y) / 2.0);
R7i.w = PV1ix;
// 15
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R7i.w));
// 16
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PS1i)));
// 17
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV0iw)) + intBitsToFloat(R16i.x));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(PV0iw)) + intBitsToFloat(R16i.y));
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(PV0iw)) + intBitsToFloat(R16i.z));
// export
passParameterSem2 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem5 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R2i.w), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
// export
passParameterSem9 = vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.y), intBitsToFloat(R7i.z), intBitsToFloat(R7i.w));
// export
SET_POSITION(vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w)));
// export
passParameterSem7 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
}
