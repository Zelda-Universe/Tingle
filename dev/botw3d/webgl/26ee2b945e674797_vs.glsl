#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 26ee2b945e674797
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


UNIFORM_BUFFER_LAYOUT(8, 0, 2) uniform uniformBlockVS8
{
vec4 uf_blockVS8[32];
};


ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem2;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem4;
ATTR_LAYOUT(0, 4) in uvec4 attrDataSem6;
ATTR_LAYOUT(0, 5) in uvec4 attrDataSem12;

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
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem12.xyzw)/255.0));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem4.xyzw)/255.0));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyzw = attrDataSem6.xyzw;
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R3i.x)) + 1.0);
PV0iy = floatBitsToInt(-(intBitsToFloat(R3i.y)) + 1.0);
PV0iz = floatBitsToInt(-(intBitsToFloat(R3i.z)) + 1.0);
R5i.w = 0x3f800000;
R0i.w = R1i.x * 0x3;
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), uf_blockVS8[31].z));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), uf_blockVS8[31].z));
R0i.z = R0i.w + int(1);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), uf_blockVS8[31].z));
R0i.y = R0i.w + 0x2;
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(uf_blockVS8[29].z, intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockVS8[29].y, intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockVS8[29].x, intBitsToFloat(PV1iy)));
R0i.x = R1i.y * 0x3;
// 3
R5i.x = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV0iz));
R5i.y = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(PV0iy));
R18i.z = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(PV0ix));
R4i.w = R0i.x + int(1);
R5i.z = R0i.x + 0x2;
R13i.xyzw = floatBitsToInt(uf_blockVS2[R0i.w].xyzw);
R14i.xyzw = floatBitsToInt(uf_blockVS2[R0i.z].xyzw);
R19i.xyzw = floatBitsToInt(uf_blockVS2[R0i.y].xyzw);
R12i.xyzw = floatBitsToInt(uf_blockVS2[R0i.x].xyzw);
R9i.xyzw = floatBitsToInt(uf_blockVS2[R4i.w].xyzw);
R17i.xyzw = floatBitsToInt(uf_blockVS2[R5i.z].xyzw);
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R18i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),intBitsToFloat(R12i.z),intBitsToFloat(R12i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.y = R1i.z * 0x3;
// 1
backupReg0i = R1i.w;
R1i.x = R0i.y + int(1);
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R12i.z)));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV0ix)));
R1i.w = R0i.y + 0x2;
R1i.z = backupReg0i * 0x3;
R11i.xyzw = floatBitsToInt(uf_blockVS2[R0i.y].xyzw);
R8i.xyzw = floatBitsToInt(uf_blockVS2[R1i.x].xyzw);
R16i.xyzw = floatBitsToInt(uf_blockVS2[R1i.w].xyzw);
R10i.xyzw = floatBitsToInt(uf_blockVS2[R1i.z].xyzw);
// 0
backupReg0i = R1i.y;
R1i.x = R1i.z + 0x2;
R1i.y = R1i.z + int(1);
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R10i.z)));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R11i.x)));
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R12i.y)) + intBitsToFloat(backupReg0i));
R7i.xyzw = floatBitsToInt(uf_blockVS2[R1i.y].xyzw);
R15i.xyzw = floatBitsToInt(uf_blockVS2[R1i.x].xyzw);
// export
// skipped export to semanticId 255
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R18i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(R10i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R10i.y)) + intBitsToFloat(R1i.z));
// 1
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R10i.x)) + intBitsToFloat(R122i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R13i.z)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PV0ix)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R7i.z)));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R11i.y)) + intBitsToFloat(R1i.w));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R18i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R11i.z)) + intBitsToFloat(R122i.x));
// 3
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV0ix)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R12i.x)) + intBitsToFloat(R0i.x));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R8i.z)));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R7i.y)) + intBitsToFloat(R127i.w));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R18i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R13i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R13i.x)) + intBitsToFloat(R127i.y));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV0ix)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R9i.z)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R13i.y)) + intBitsToFloat(R122i.x));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R8i.x)) + intBitsToFloat(R127i.z));
// 6
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R8i.y)) + intBitsToFloat(R122i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R14i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.w)));
PV0iw = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(PV1ix));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R9i.y)) + intBitsToFloat(PV1iy));
// 7
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R9i.x)) + intBitsToFloat(R122i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R126i.y)) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV0iw));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R16i.z)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R15i.z)));
// 8
R1i.x = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV1iz));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R125i.y)) + intBitsToFloat(R123i.y));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R7i.x)) + intBitsToFloat(R126i.x));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R15i.y)) + intBitsToFloat(PS1i));
// 9
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R125i.x)) + intBitsToFloat(R123i.y));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R15i.x)) + intBitsToFloat(R122i.x));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R17i.z)));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R19i.z)));
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R14i.y)) + intBitsToFloat(R127i.y));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R18i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z),intBitsToFloat(R7i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R7i.z)));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R7i.z = tempi.x;
PV1iw = tempi.x;
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PV0ix)));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R18i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R8i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R8i.z)));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),1.0,0.0)));
PV1ix = tempi.x;
R8i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV0ix)));
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R18i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R9i.z),intBitsToFloat(R9i.w))));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R9i.z)));
// 15
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),1.0,0.0)));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R10i.z)));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),1.0,0.0)));
PV0ix = tempi.x;
R10i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R11i.z)));
// 17
R11i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),1.0,0.0)));
PV1iy = R11i.x;
PV1iz = R11i.x;
PV1iw = R11i.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R12i.z)));
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R126i.w = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R13i.z)));
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R126i.z = tempi.x;
PV1iw = tempi.x;
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R14i.z)));
// 20
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R127i.y)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R14i.x)) + intBitsToFloat(backupReg0i));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R16i.z)));
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R15i.z)));
// 21
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R18i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(R14i.z),intBitsToFloat(R14i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.y)));
// 22
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R126i.z)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R127i.x)) + intBitsToFloat(PS1i));
R13i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R17i.z)));
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R16i.y)) + intBitsToFloat(R127i.w));
// 23
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R124i.x)) + intBitsToFloat(R123i.z));
R13i.y = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(PV0ix));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R126i.w)) + intBitsToFloat(PV0iy));
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R17i.y)) + intBitsToFloat(R127i.z));
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R8i.z) + intBitsToFloat(R13i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R1i.w)) + intBitsToFloat(R13i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R11i.x)) + intBitsToFloat(R13i.z));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R19i.y)) + intBitsToFloat(R3i.w));
// 1
backupReg0i = R7i.x;
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R10i.y)) + intBitsToFloat(R123i.w));
R126i.y = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV0ix));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R19i.x)) + intBitsToFloat(R122i.x));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R19i.z)));
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R16i.y)) + intBitsToFloat(R12i.z));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R18i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),intBitsToFloat(R15i.z),intBitsToFloat(R15i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.z)));
// 3
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R17i.y)) + intBitsToFloat(R13i.w));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PV0ix)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R16i.x)) + intBitsToFloat(R12i.x));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R18i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R16i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 5
backupReg0i = R4i.x;
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV0ix)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R17i.x)) + intBitsToFloat(R10i.x));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R19i.y)) + intBitsToFloat(R126i.w));
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R14i.y)) + intBitsToFloat(R9i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R123i.z)) + intBitsToFloat(R125i.x));
// 7
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R15i.y)) + intBitsToFloat(R8i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R14i.x)) + intBitsToFloat(backupReg0i));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.w)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R3i.y)) + intBitsToFloat(R123i.z));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R15i.x)) + intBitsToFloat(R123i.x));
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R124i.z)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R0i.x)) + intBitsToFloat(PV0ix));
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R8i.y)) + intBitsToFloat(R123i.y));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R16i.x)) + intBitsToFloat(R124i.x));
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R127i.y)) + intBitsToFloat(PV1ix));
// 11
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R17i.x)) + intBitsToFloat(R127i.x));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R7i.z)) + intBitsToFloat(R123i.x));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R18i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(R17i.x),intBitsToFloat(R17i.y),intBitsToFloat(R17i.z),intBitsToFloat(R17i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 13
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R19i.x)) + intBitsToFloat(R126i.x));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV0ix)));
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R18i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(R19i.x),intBitsToFloat(R19i.y),intBitsToFloat(R19i.z),intBitsToFloat(R19i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.x)));
// 15
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV0ix)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R127i.x)) + intBitsToFloat(PS0i));
// 16
PV0ix = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV1ix));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R3i.x)) + intBitsToFloat(R124i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.z));
// 17
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.w));
PV1iw = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV0ix));
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.y));
PS1i = floatBitsToInt(tempResultf);
// 18
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PS1i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS1i)));
R125i.z = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV1iw));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.z)));
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R125i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R7i.x),intBitsToFloat(R125i.y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.w = 0x3f800000;
// 20
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.w),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[0].x,uf_blockVS1[0].y,uf_blockVS1[0].z,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 21
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(PS0i)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
R2i.w = 0x3f800000;
R7i.x = PV0ix;
// 22
R6i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[0].x,uf_blockVS1[0].y,uf_blockVS1[0].z,0.0)));
PV0iy = R6i.x;
PV0iz = R6i.x;
PV0iw = R6i.x;
R6i.w = R6i.w;
// 23
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[1].x,uf_blockVS1[1].y,uf_blockVS1[1].z,0.0)));
PV1ix = tempi.x;
R6i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), uf_blockVS1[1].z));
// 24
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[2].x,uf_blockVS1[2].y,uf_blockVS1[2].z,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R6i.z = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), uf_blockVS1[2].z));
// 25
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.x),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[1].x,uf_blockVS1[1].y,1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),uf_blockVS1[2].y) + intBitsToFloat(PS0i));
// 26
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),uf_blockVS1[2].x) + intBitsToFloat(R122i.x));
R7i.y = PV1ix;
// 27
R3i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),intBitsToFloat(R126i.w)),vec4(uf_blockVS1[0].x,uf_blockVS1[0].y,uf_blockVS1[0].z,uf_blockVS1[0].w)));
PV1iy = R3i.x;
PV1iz = R3i.x;
PV1iw = R3i.x;
R7i.z = R123i.x;
// 28
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),intBitsToFloat(R126i.w)),vec4(uf_blockVS1[1].x,uf_blockVS1[1].y,uf_blockVS1[1].z,uf_blockVS1[1].w)));
PV0ix = tempi.x;
R2i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 29
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),intBitsToFloat(R126i.w)),vec4(uf_blockVS1[2].x,uf_blockVS1[2].y,uf_blockVS1[2].z,uf_blockVS1[2].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R2i.z = tempi.x;
PV1iw = tempi.x;
// export
// skipped export to semanticId 255
// export
// skipped export to semanticId 255
// 0
R7i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS1[7].x,uf_blockVS1[7].y,uf_blockVS1[7].z,uf_blockVS1[7].w)));
PV0iy = R7i.x;
PV0iz = R7i.x;
PV0iw = R7i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS1[8].x,uf_blockVS1[8].y,uf_blockVS1[8].z,uf_blockVS1[8].w)));
PV1ix = tempi.x;
R7i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS1[9].x,uf_blockVS1[9].y,uf_blockVS1[9].z,uf_blockVS1[9].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R7i.z = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS1[10].x,uf_blockVS1[10].y,uf_blockVS1[10].z,uf_blockVS1[10].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R7i.w = tempi.x;
// export
SET_POSITION(vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.y), intBitsToFloat(R7i.z), intBitsToFloat(R7i.w)));
}
