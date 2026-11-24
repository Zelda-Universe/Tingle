#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 5dc289b5c80f8c41
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
UNIFORM_BUFFER_LAYOUT(1, 0, 0) uniform uniformBlockVS1
{
vec4 uf_blockVS1[11];
};


UNIFORM_BUFFER_LAYOUT(2, 0, 1) uniform uniformBlockVS2
{
vec4 uf_blockVS2[4096];
};


ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem2;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem4;
ATTR_LAYOUT(0, 4) in uvec4 attrDataSem6;
ATTR_LAYOUT(0, 5) in uvec4 attrDataSem8;
ATTR_LAYOUT(0, 6) in uvec4 attrDataSem12;

out vec4 passParameterSem5;
out vec4 passParameterSem0;
out vec4 passParameterSem4;
out vec4 passParameterSem3;
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
ivec4 R19i = ivec4(0);
ivec4 R20i = ivec4(0);
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
attrDecoder.xy = uvec2(floatBitsToUint(vec2(attrDataSem8.xy)/255.0));
attrDecoder.zw = uvec2(uvec2(0));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), 0, 0x3f800000);
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem12.xyzw)/255.0));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem4.xyzw)/255.0));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyzw = attrDataSem6.xyzw;
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
// 0
R4i.w = 0x3f800000;
R0i.z = R1i.x * 0x3;
// 1
backupReg0i = R0i.z;
R0i.x = backupReg0i + 0x2;
R0i.y = backupReg0i + int(1);
R0i.w = R1i.y * 0x3;
R12i.xyzw = floatBitsToInt(uf_blockVS2[R0i.z].xyzw);
R16i.xyzw = floatBitsToInt(uf_blockVS2[R0i.y].xyzw);
R20i.xyzw = floatBitsToInt(uf_blockVS2[R0i.x].xyzw);
R11i.xyzw = floatBitsToInt(uf_blockVS2[R0i.w].xyzw);
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R11i.z)));
R0i.y = R0i.w + 0x2;
R0i.z = R0i.w + int(1);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R12i.y)));
R0i.x = R1i.z * 0x3;
// 1
backupReg0i = R1i.w;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R11i.y)) + intBitsToFloat(PV0ix));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R12i.z)) + intBitsToFloat(PV0iw));
R1i.z = R0i.x + 0x2;
R1i.w = R0i.x + int(1);
R1i.y = backupReg0i * 0x3;
R15i.xyzw = floatBitsToInt(uf_blockVS2[R0i.z].xyzw);
R19i.xyzw = floatBitsToInt(uf_blockVS2[R0i.y].xyzw);
R10i.xyzw = floatBitsToInt(uf_blockVS2[R0i.x].xyzw);
R14i.xyzw = floatBitsToInt(uf_blockVS2[R1i.w].xyzw);
R18i.xyzw = floatBitsToInt(uf_blockVS2[R1i.z].xyzw);
R9i.xyzw = floatBitsToInt(uf_blockVS2[R1i.y].xyzw);
// 0
backupReg0i = R1i.x;
backupReg1i = R1i.y;
R1i.x = backupReg1i + int(1);
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R11i.x)) + intBitsToFloat(backupReg0i));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R10i.z)));
R1i.w = backupReg1i + 0x2;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R9i.z)));
R13i.xyzw = floatBitsToInt(uf_blockVS2[R1i.x].xyzw);
R17i.xyzw = floatBitsToInt(uf_blockVS2[R1i.w].xyzw);
// export
passParameterSem5 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
// export
passParameterSem0 = vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.y), intBitsToFloat(R7i.x), intBitsToFloat(R7i.y));
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R9i.z),intBitsToFloat(R9i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R9i.y)) + intBitsToFloat(R0i.x));
// 1
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R9i.x)) + intBitsToFloat(R122i.x));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PV0ix)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R12i.x)) + intBitsToFloat(R8i.y));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R10i.y)) + intBitsToFloat(R1i.z));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(R10i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R10i.x)) + intBitsToFloat(R122i.x));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R13i.y)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R127i.z)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R15i.x)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R14i.y)));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R1i.y)) + intBitsToFloat(PV1iy));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R14i.z)) + intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R16i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R17i.x)));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R13i.z)) + intBitsToFloat(PV1ix));
// 5
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R15i.y)) + intBitsToFloat(R127i.z));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R13i.x)) + intBitsToFloat(R122i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R127i.x)) + intBitsToFloat(backupReg0i));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R16i.y)) + intBitsToFloat(PV0iz));
// 6
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.w));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R14i.x)) + intBitsToFloat(R127i.y));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R15i.z)) + intBitsToFloat(R123i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R16i.z)) + intBitsToFloat(R122i.x));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R17i.y)) + intBitsToFloat(R127i.w));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.w)));
// 8
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV1ix)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R127i.z)) + intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R19i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R20i.x)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R18i.y)));
// 9
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R19i.y)) + intBitsToFloat(PV0iz));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R17i.z)) + intBitsToFloat(R126i.x));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R18i.x)) + intBitsToFloat(PS0i));
// 10
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R20i.y)) + intBitsToFloat(R127i.w));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R126i.z)) + intBitsToFloat(R123i.x));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R18i.z)) + intBitsToFloat(R122i.x));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R10i.x)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R9i.x)));
// 11
R9i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.z),intBitsToFloat(R6i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R9i.z),intBitsToFloat(R9i.y),1.0,0.0)));
PV1iy = R9i.x;
PV1iz = R9i.x;
PV1iw = R9i.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R10i.y)) + intBitsToFloat(PV0iw));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R11i.z)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R13i.y)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R14i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R10i.z)) + intBitsToFloat(R122i.x));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R12i.y)));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(PV0ix),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R127i.z = tempi.x;
PV1iw = tempi.x;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R19i.z)) + intBitsToFloat(R127i.y));
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),intBitsToFloat(R12i.z),intBitsToFloat(R12i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R12i.z)) + intBitsToFloat(R126i.x));
// 15
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R13i.z)) + intBitsToFloat(R126i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R12i.x)) + intBitsToFloat(R122i.x));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV0ix)));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R14i.y)) + intBitsToFloat(R126i.z));
// 16
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R20i.z)) + intBitsToFloat(R125i.x));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.y)));
PV0iz = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV1iw));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R16i.y)));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R15i.y)));
// 17
backupReg0i = R127i.z;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.x)));
PV1iy = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV0iz));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R14i.z)) + intBitsToFloat(R126i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV0iy));
// 18
R4i.x = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(PV1iy));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R127i.y)) + intBitsToFloat(PV1ix));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R13i.x)) + intBitsToFloat(R124i.x));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R16i.z)) + intBitsToFloat(R125i.w));
// 19
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R9i.x)) + intBitsToFloat(R123i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R125i.z)) + intBitsToFloat(R123i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R16i.x)) + intBitsToFloat(R122i.x));
// 20
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R15i.z)) + intBitsToFloat(R127i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.z)));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R124i.w)) + intBitsToFloat(R123i.y));
// 21
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R13i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 22
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R15i.x)) + intBitsToFloat(R127i.x));
R13i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R17i.z)));
// 23
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R123i.x)) + intBitsToFloat(R127i.y));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R18i.z)));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R17i.x)) + intBitsToFloat(PS0i));
// 24
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R18i.y)) + intBitsToFloat(PV1iy));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R17i.y)) + intBitsToFloat(R122i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R127i.z)) + intBitsToFloat(backupReg0i));
// 25
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R18i.x)) + intBitsToFloat(R123i.x));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.w));
// 26
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(R14i.z),intBitsToFloat(R14i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 27
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R19i.y)));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV0ix)));
// 28
R15i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),intBitsToFloat(R15i.z),intBitsToFloat(R15i.w))));
PV0iy = R15i.x;
PV0iz = R15i.x;
PV0iw = R15i.x;
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R19i.z)) + intBitsToFloat(R14i.x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R15i.x)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R20i.z)));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R19i.x)) + intBitsToFloat(R123i.x));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R16i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV1ix)));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV0ix)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R127i.x)) + intBitsToFloat(PS0i));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1ix));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R13i.x)) + intBitsToFloat(R123i.y));
// 5
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R13i.z)) + intBitsToFloat(R123i.w));
PV1iw = floatBitsToInt(intBitsToFloat(R14i.y) + intBitsToFloat(PV0ix));
// 6
R126i.y = floatBitsToInt(intBitsToFloat(R13i.w) + intBitsToFloat(PV1iw));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(R17i.x),intBitsToFloat(R17i.y),intBitsToFloat(R17i.z),intBitsToFloat(R17i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R4i.z)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PV1ix)));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(R18i.x),intBitsToFloat(R18i.y),intBitsToFloat(R18i.z),intBitsToFloat(R18i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R1i.y)) + intBitsToFloat(PV0ix));
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R0i.x)) + intBitsToFloat(R122i.x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV1ix)));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(R19i.x),intBitsToFloat(R19i.y),intBitsToFloat(R19i.z),intBitsToFloat(R19i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.x));
PS1i = floatBitsToInt(tempResultf);
// 12
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PS1i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV1ix)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PS1i)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PS1i)));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(R20i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.z)));
// 14
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y),intBitsToFloat(R13i.y)) + intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV1ix)));
// 15
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(R9i.x)) + intBitsToFloat(R123i.x));
PV1iz = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV0iw));
// 16
PV0iw = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1iz));
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.x));
PS0i = floatBitsToInt(tempResultf);
// 17
backupReg0i = R125i.y;
backupReg1i = R127i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(PS0i)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y), intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV0iw));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), intBitsToFloat(PS0i)));
// 18
R9i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.w),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[0].x,uf_blockVS1[0].y,uf_blockVS1[0].z,0.0)));
PV0iy = R9i.x;
PV0iz = R9i.x;
PV0iw = R9i.x;
R125i.w = 0x3f800000;
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.w),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[1].x,uf_blockVS1[1].y,uf_blockVS1[1].z,0.0)));
PV1ix = tempi.x;
R9i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R2i.w = 0x3f800000;
// 20
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.w),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[2].x,uf_blockVS1[2].y,uf_blockVS1[2].z,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R9i.z = tempi.x;
PV0iw = tempi.x;
R9i.w = R6i.w;
// 21
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.z),intBitsToFloat(R124i.w),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[0].x,uf_blockVS1[0].y,uf_blockVS1[0].z,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 22
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.z),intBitsToFloat(R124i.w),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[1].x,uf_blockVS1[1].y,uf_blockVS1[1].z,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R6i.x = PV1ix;
// 23
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.z),intBitsToFloat(R124i.w),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[2].x,uf_blockVS1[2].y,uf_blockVS1[2].z,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R6i.y = PV0ix;
// 24
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R125i.w)),vec4(uf_blockVS1[0].x,uf_blockVS1[0].y,uf_blockVS1[0].z,uf_blockVS1[0].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R6i.z = PV1ix;
// 25
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R125i.w)),vec4(uf_blockVS1[1].x,uf_blockVS1[1].y,uf_blockVS1[1].z,uf_blockVS1[1].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R13i.x = PV0ix;
// 26
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R125i.w)),vec4(uf_blockVS1[2].x,uf_blockVS1[2].y,uf_blockVS1[2].z,uf_blockVS1[2].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R13i.y = PV1ix;
// 27
R13i.z = PV0ix;
// 28
R4i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS1[7].x,uf_blockVS1[7].y,uf_blockVS1[7].z,uf_blockVS1[7].w)));
PV0iy = R4i.x;
PV0iz = R4i.x;
PV0iw = R4i.x;
// 29
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS1[8].x,uf_blockVS1[8].y,uf_blockVS1[8].z,uf_blockVS1[8].w)));
PV1ix = tempi.x;
R4i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 30
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS1[9].x,uf_blockVS1[9].y,uf_blockVS1[9].z,uf_blockVS1[9].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R4i.z = tempi.x;
PV0iw = tempi.x;
// export
passParameterSem4 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.z), intBitsToFloat(R6i.w));
// export
// skipped export to semanticId 255
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS1[10].x,uf_blockVS1[10].y,uf_blockVS1[10].z,uf_blockVS1[10].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R4i.w = tempi.x;
// export
SET_POSITION(vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.z), intBitsToFloat(R4i.w)));
}
