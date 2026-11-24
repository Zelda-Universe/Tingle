#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 7e6a1ad1b7a28272
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
UNIFORM_BUFFER_LAYOUT(1, 0, 2) uniform uniformBlockVS1
{
vec4 uf_blockVS1[11];
};


UNIFORM_BUFFER_LAYOUT(2, 0, 3) uniform uniformBlockVS2
{
vec4 uf_blockVS2[4096];
};


UNIFORM_BUFFER_LAYOUT(4, 0, 4) uniform uniformBlockVS4
{
vec4 uf_blockVS4[1];
};


UNIFORM_BUFFER_LAYOUT(6, 0, 5) uniform uniformBlockVS6
{
vec4 uf_blockVS6[35];
};


UNIFORM_BUFFER_LAYOUT(8, 0, 6) uniform uniformBlockVS8
{
vec4 uf_blockVS8[13];
};


TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
TEXTURE_LAYOUT(33, 0, 1) uniform sampler2D textureUnitVS1;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem2;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem4;
ATTR_LAYOUT(0, 4) in uvec4 attrDataSem6;
ATTR_LAYOUT(0, 5) in uvec4 attrDataSem8;
ATTR_LAYOUT(0, 6) in uvec4 attrDataSem12;

out vec4 passParameterSem5;
out vec4 passParameterSem4;
out vec4 passParameterSem3;
out vec4 passParameterSem1;
out vec4 passParameterSem0;
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
R0i.x = R1i.x * 0x3;
// 1
R0i.z = R0i.x + 0x2;
R0i.w = R0i.x + int(1);
R0i.y = R1i.y * 0x3;
// 2
R1i.x = R0i.y + int(1);
R1i.w = R0i.y + 0x2;
R1i.z = R1i.z * 0x3;
R11i.xyzw = floatBitsToInt(uf_blockVS2[R0i.x].xyzw);
R13i.xyzw = floatBitsToInt(uf_blockVS2[R0i.w].xyzw);
R16i.xyzw = floatBitsToInt(uf_blockVS2[R0i.z].xyzw);
R9i.xyzw = floatBitsToInt(uf_blockVS2[R0i.y].xyzw);
R12i.xyzw = floatBitsToInt(uf_blockVS2[R1i.x].xyzw);
R15i.xyzw = floatBitsToInt(uf_blockVS2[R1i.w].xyzw);
R8i.xyzw = floatBitsToInt(uf_blockVS2[R1i.z].xyzw);
// 0
R1i.x = R1i.z + 0x2;
R0i.y = R1i.z + int(1);
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R9i.y)));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R11i.y)));
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R8i.z)));
R10i.xyzw = floatBitsToInt(uf_blockVS2[R0i.y].xyzw);
R14i.xyzw = floatBitsToInt(uf_blockVS2[R1i.x].xyzw);
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R8i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R8i.y)) + intBitsToFloat(R0i.x));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R9i.x)) + intBitsToFloat(R1i.z));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R12i.y)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV0ix)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R8i.x)) + intBitsToFloat(R122i.x));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R10i.y)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R9i.z),intBitsToFloat(R9i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R9i.z)) + intBitsToFloat(R123i.x));
// 3
backupReg0i = R127i.x;
backupReg1i = R127i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV0ix)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R10i.z)) + intBitsToFloat(backupReg0i));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R12i.x)) + intBitsToFloat(backupReg1i));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R11i.z)) + intBitsToFloat(R1i.w));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R11i.x)) + intBitsToFloat(R122i.x));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R122i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R10i.x)) + intBitsToFloat(R127i.y));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV0ix)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R12i.z)) + intBitsToFloat(R127i.z));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R13i.y)));
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R13i.z)) + intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R15i.x)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R126i.z)) + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R14i.y)));
// 7
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R13i.x)) + intBitsToFloat(R123i.x));
R1i.z = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV0iy));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R15i.y)) + intBitsToFloat(PV0iz));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R14i.x)) + intBitsToFloat(PS0i));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(R10i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.y)));
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R16i.y)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R14i.z)) + intBitsToFloat(R127i.x));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R126i.w)) + intBitsToFloat(PS0i));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R8i.x)));
// 10
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.z),intBitsToFloat(R6i.y),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R8i.z),intBitsToFloat(R8i.y),1.0,0.0)));
PV0iy = R126i.x;
PV0iz = R126i.x;
PV0iw = R126i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R16i.x)) + intBitsToFloat(PV1ix));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R9i.y)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R127i.y)) + intBitsToFloat(R125i.z));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R10i.x)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R11i.x)));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.z),intBitsToFloat(PV1ix),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.z),1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R126i.w = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R11i.y)) + intBitsToFloat(PS1i));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.z),intBitsToFloat(R6i.y),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R10i.z),intBitsToFloat(R10i.y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R10i.w = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R12i.y)));
// 14
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R12i.z)) + intBitsToFloat(PS1i));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R14i.y)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R11i.z)) + intBitsToFloat(backupReg0i));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R15i.x)));
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R13i.y)));
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),intBitsToFloat(R12i.z),intBitsToFloat(R12i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.z)));
// 16
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R126i.w)) + intBitsToFloat(PS1i));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV1ix)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R15i.z)) + intBitsToFloat(R127i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R12i.x)) + intBitsToFloat(R127i.x));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R15i.y)) + intBitsToFloat(R125i.w));
// 17
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.x));
R4i.y = floatBitsToInt(-(intBitsToFloat(R3i.w)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R16i.z)) + intBitsToFloat(R125i.x));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R16i.y)));
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R13i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.w)));
// 19
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R13i.z)) + intBitsToFloat(R124i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R125i.z)) + intBitsToFloat(PS0i));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), uf_blockVS8[0].x));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV0ix)));
// 20
backupReg0i = R13i.x;
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R126i.y)) + intBitsToFloat(R123i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(backupReg0i)) + intBitsToFloat(R123i.x));
PV0iz = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV1iw));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R14i.z)) + intBitsToFloat(R125i.y));
// 21
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.y)));
R12i.y = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(PV0iz));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R14i.x)) + intBitsToFloat(R122i.x));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.x), intBitsToFloat(R13i.x)));
// 22
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R16i.z)) + intBitsToFloat(R126i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R15i.z)) + intBitsToFloat(R127i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R127i.w)) + intBitsToFloat(PV1ix));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R8i.y)) + intBitsToFloat(PS1i));
// 23
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R16i.x)) + intBitsToFloat(R123i.x));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R10i.w)) + intBitsToFloat(R123i.w));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R0i.x)) + intBitsToFloat(R122i.x));
// 24
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(R14i.z),intBitsToFloat(R14i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.x)));
// 25
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV0ix)));
R14i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R127i.y)) + intBitsToFloat(PS0i));
tempResultf = 1.0 / sqrt(intBitsToFloat(R125i.z));
R14i.y = floatBitsToInt(tempResultf);
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R14i.y)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(R14i.y)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R13i.z)) + intBitsToFloat(R14i.w));
R10i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.x), intBitsToFloat(R14i.y)));
R127i.y = floatBitsToInt(uf_blockVS4[0].w * intBitsToFloat(0x3ed413cd));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),intBitsToFloat(R15i.z),intBitsToFloat(R15i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R126i.z)));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y),intBitsToFloat(R13i.y)) + intBitsToFloat(PS1i));
R127i.y = floatBitsToInt(uf_blockVS4[0].x + intBitsToFloat(R127i.y));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV1ix)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R16i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R4i.x)) + intBitsToFloat(R123i.x));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV1ix)));
R5i.z = floatBitsToInt(intBitsToFloat(R4i.y) + -(uf_blockVS8[0].z));
R5i.z = clampFI32(R5i.z);
R2i.w = floatBitsToInt(fract(intBitsToFloat(R127i.y)));
tempResultf = 1.0 / sqrt(intBitsToFloat(R122i.x));
PS0i = floatBitsToInt(tempResultf);
// 5
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PS0i)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y), intBitsToFloat(PS0i)));
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV0ix));
R4i.y = R4i.y;
R4i.y = floatBitsToInt(intBitsToFloat(R4i.y) / 2.0);
// 6
R5i.x = floatBitsToInt(intBitsToFloat(R14i.x) + intBitsToFloat(PV1iw));
// 7
R14i.x = floatBitsToInt(intBitsToFloat(R2i.w) * intBitsToFloat(0x3e65a5dd));
// 0
PV0ix = floatBitsToInt(uf_blockVS6[32].w + intBitsToFloat(R4i.y));
R4i.y = floatBitsToInt(uf_blockVS6[32].x + -(0.5));
R4i.y = clampFI32(R4i.y);
PV0iz = floatBitsToInt(uf_blockVS6[32].w + intBitsToFloat(R2i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), uf_blockVS6[32].z));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), uf_blockVS6[32].y));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) * 3.0);
PV1iy = floatBitsToInt(uf_blockVS6[32].w * intBitsToFloat(0x43c9d6c7));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), uf_blockVS6[33].z));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) * 100.0);
// 2
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40490e56));
R126i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x431d1463));
R127i.z = floatBitsToInt(intBitsToFloat(R14i.x) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(fract(intBitsToFloat(PV1ix)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), uf_blockVS6[33].y));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) * 7.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) * 3.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) * 5.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iw) + -(0.5));
PS1i = R126i.y;
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 4.0);
// 4
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iz = floatBitsToInt(max(intBitsToFloat(PV1iw), -(intBitsToFloat(PV1iw))));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
R122i.x = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3e22f983) + 0.5);
// 5
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + 0.5);
PS1i = floatBitsToInt(fract(intBitsToFloat(R122i.x)));
// 6
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R126i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS6[32].x, intBitsToFloat(PV1iw)));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.y = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R124i.y = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
R125i.z = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
PV1iw = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
PS1i = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(0xbe99999a));
PS1i = clampFI32(PS1i);
// 8
R127i.x = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(min(intBitsToFloat(R126i.z), intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
PV0iy = clampFI32(PV0iy);
R126i.z = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3d6a0fd3));
R123i.w = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(0x3e22f983) + 0.5);
R124i.w = floatBitsToInt(sin((intBitsToFloat(PV1ix))/0.1591549367));
// 9
R126i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3ca3d70a));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV1iz = floatBitsToInt(-(intBitsToFloat(R125i.y)) + intBitsToFloat(R127i.z));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(R124i.z)));
R125i.y = floatBitsToInt(sin((intBitsToFloat(R125i.z))/0.1591549367));
// 10
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.w)) + intBitsToFloat(PV1iz));
PV0iy = floatBitsToInt(-(intBitsToFloat(R2i.z)) + intBitsToFloat(PV1iw));
R2i.z = floatBitsToInt(uf_blockVS6[32].x);
R123i.w = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS0i = floatBitsToInt(sin((intBitsToFloat(R124i.y))/0.1591549367));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R2i.y = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3cb6a401));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PS0i)));
R14i.w = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3cb6a401));
PS1i = floatBitsToInt(sin((intBitsToFloat(R127i.x))/0.1591549367));
// 12
R14i.x = floatBitsToInt(uf_blockVS6[32].x);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(PV1iz)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1ix))/0.1591549367));
// 13
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3d4ccccd));
// 14
R2i.x = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV1ix));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(PV1iy)));
// 15
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PV0iw)));
// 16
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), uf_blockVS6[34].x));
R13i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS8[0].y, intBitsToFloat(R4i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), uf_blockVS6[34].y));
PV0iw = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(PV1iz));
R5i.z = 0;
// 17
R4i.x = floatBitsToInt(uf_blockVS6[34].z + intBitsToFloat(PV0ix));
R4i.y = floatBitsToInt(uf_blockVS6[34].w + intBitsToFloat(PV0iz));
R4i.z = floatBitsToInt(intBitsToFloat(PV0iw) * 20.0);
R16i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS8[0].z, uf_blockVS8[0].z));
R2i.w = floatBitsToInt(texture(textureUnitVS1, vec2(intBitsToFloat(R2i.y),intBitsToFloat(R2i.z))).x);
R2i.z = floatBitsToInt(texture(textureUnitVS1, vec2(intBitsToFloat(R14i.w),intBitsToFloat(R14i.x))).x);
R4i.xy = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y))).xy);
// export
passParameterSem5 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
// 0
PV0ix = R4i.x;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
PV0iy = R4i.y;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
R126i.z = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(R2i.z));
R124i.w = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(R2i.w));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.z), uf_blockVS1[0].z));
// 1
R126i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS6[32].y, intBitsToFloat(R124i.w)));
PV1iy = floatBitsToInt(-(intBitsToFloat(R124i.w)) + intBitsToFloat(R126i.z));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(1.0));
PV1iw = floatBitsToInt(mul_nonIEEE(uf_blockVS6[33].y, intBitsToFloat(R126i.z)));
PS1i = floatBitsToInt(intBitsToFloat(PV0iy) + -(1.0));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),uf_blockVS6[33].x) + intBitsToFloat(R124i.w));
R125i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS6[32].z, intBitsToFloat(R124i.w)));
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.x)) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(-(intBitsToFloat(PS1i)));
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(R13i.y)));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockVS6[33].z, intBitsToFloat(R126i.z)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(R4i.z)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),uf_blockVS6[33].x) + intBitsToFloat(R126i.x));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R13i.y)));
R2i.w = 0x3f800000;
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R123i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R124i.y)));
R126i.z = R124i.w;
PV0iw = floatBitsToInt(-(intBitsToFloat(R125i.y)) + intBitsToFloat(PV1ix));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),uf_blockVS1[0].y) + intBitsToFloat(R127i.x));
// 5
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.x),uf_blockVS1[0].x) + intBitsToFloat(R122i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),uf_blockVS6[33].x) + intBitsToFloat(R125i.y));
PV1iz = PV0ix;
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PV0iy)));
R3i.w = 0x3f800000;
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV1iz));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.z), uf_blockVS1[2].z));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e23d70a));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R123i.y)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.z), uf_blockVS1[1].z));
// 7
PV1ix = floatBitsToInt(max(intBitsToFloat(PV0iz), 0.0));
PV1iy = PV0iw;
R4i.z = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R124i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),uf_blockVS1[2].y) + intBitsToFloat(PV0iy));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),uf_blockVS1[1].y) + intBitsToFloat(PS0i));
// 8
PV0ix = floatBitsToInt(-(intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV1iy));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.x),uf_blockVS1[2].x) + intBitsToFloat(R123i.w));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), uf_blockVS1[1].y));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.x),uf_blockVS1[1].x) + intBitsToFloat(R122i.x));
// 9
R5i.x = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(R126i.z));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), uf_blockVS1[0].z));
R1i.z = floatBitsToInt(intBitsToFloat(R12i.y) + intBitsToFloat(PV0ix));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w),uf_blockVS1[1].z) + intBitsToFloat(PV0iw));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R124i.w),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R124i.w),intBitsToFloat(R124i.w),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),uf_blockVS1[0].y) + intBitsToFloat(PV1iy));
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),uf_blockVS1[0].x) + intBitsToFloat(R122i.x));
PV1iy = floatBitsToInt(-(intBitsToFloat(PV0ix)) + intBitsToFloat(R16i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),uf_blockVS1[1].x) + intBitsToFloat(R127i.x));
R13i.w = R6i.w;
R16i.z = R7i.x;
// 12
PV0ix = floatBitsToInt(max(intBitsToFloat(PV1iy), 0.0));
R10i.y = R123i.z;
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), uf_blockVS1[2].z));
R10i.w = R123i.x;
R16i.w = R7i.y;
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R8i.y),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[2].x,uf_blockVS1[2].y,1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R6i.z = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 14
R10i.z = PV1ix;
// export
passParameterSem4 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R10i.w), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w));
// 0
PV0iw = floatBitsToInt(uf_blockVS8[0].z + -(intBitsToFloat(R6i.z)));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),uf_blockVS8[9].y) + uf_blockVS8[10].y);
PV1iy = floatBitsToInt(-(intBitsToFloat(PV0iw)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),uf_blockVS8[9].x) + uf_blockVS8[10].x);
// 2
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),uf_blockVS8[9].z) + intBitsToFloat(R123i.w));
R125i.y = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV1iy));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),uf_blockVS8[9].w) + intBitsToFloat(backupReg0i));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.z),intBitsToFloat(R125i.y),intBitsToFloat(R5i.x),intBitsToFloat(R2i.w)),vec4(uf_blockVS1[0].x,uf_blockVS1[0].y,uf_blockVS1[0].z,uf_blockVS1[0].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R7i.z = R123i.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.z),intBitsToFloat(R125i.y),intBitsToFloat(R5i.x),intBitsToFloat(R2i.w)),vec4(uf_blockVS1[1].x,uf_blockVS1[1].y,uf_blockVS1[1].z,uf_blockVS1[1].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R1i.x = PV1ix;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.z),intBitsToFloat(R125i.y),intBitsToFloat(R5i.x),intBitsToFloat(R2i.w)),vec4(uf_blockVS1[2].x,uf_blockVS1[2].y,uf_blockVS1[2].z,uf_blockVS1[2].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R1i.y = PV0ix;
// 6
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),uf_blockVS8[11].y) + uf_blockVS8[12].y);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),uf_blockVS8[11].x) + uf_blockVS8[12].x);
R1i.z = PV1ix;
R7i.w = R126i.z;
// 7
R2i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS1[7].x,uf_blockVS1[7].y,uf_blockVS1[7].z,uf_blockVS1[7].w)));
PV1iy = R2i.x;
PV1iz = R2i.x;
PV1iw = R2i.x;
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS1[8].x,uf_blockVS1[8].y,uf_blockVS1[8].z,uf_blockVS1[8].w)));
PV0ix = tempi.x;
R2i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS1[9].x,uf_blockVS1[9].y,uf_blockVS1[9].z,uf_blockVS1[9].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R2i.z = tempi.x;
PV1iw = tempi.x;
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS1[10].x,uf_blockVS1[10].y,uf_blockVS1[10].z,uf_blockVS1[10].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R2i.w = tempi.x;
// 11
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),uf_blockVS8[11].z) + intBitsToFloat(R125i.y));
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),uf_blockVS8[11].w) + intBitsToFloat(R127i.x));
// export
SET_POSITION(vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w)));
// export
passParameterSem1 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem0 = vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.y), intBitsToFloat(R7i.z), intBitsToFloat(R7i.w));
// export
// skipped export to semanticId 255
}
