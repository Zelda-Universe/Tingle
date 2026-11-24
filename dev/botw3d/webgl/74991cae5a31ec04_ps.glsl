#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;

vec4 zmCube(sampler2DArray s, vec2 st, int face, float cubeIndex, float lod) {
	return textureLod(s, vec3(st - 1.0, float(face) + cubeIndex * 6.0), lod);
}
// shader 74991cae5a31ec04
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform vec2 uf_fragCoordScale;
UNIFORM_BUFFER_LAYOUT(33, 1, 12) uniform uniformBlockPS1
{
vec4 uf_blockPS1[4096];
};


UNIFORM_BUFFER_LAYOUT(36, 1, 13) uniform uniformBlockPS4
{
vec4 uf_blockPS4[7];
};


UNIFORM_BUFFER_LAYOUT(38, 1, 14) uniform uniformBlockPS6
{
vec4 uf_blockPS6[54];
};


UNIFORM_BUFFER_LAYOUT(40, 1, 15) uniform uniformBlockPS8
{
vec4 uf_blockPS8[38];
};


UNIFORM_BUFFER_LAYOUT(42, 1, 16) uniform uniformBlockPS10
{
vec4 uf_blockPS10[4];
};


TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2DArray textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 2) uniform sampler2DArrayShadow textureUnitPS2;
TEXTURE_LAYOUT(3, 1, 3) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 4) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(5, 1, 5) uniform sampler2D textureUnitPS5;
TEXTURE_LAYOUT(6, 1, 6) uniform sampler2D textureUnitPS6;
TEXTURE_LAYOUT(7, 1, 7) uniform sampler2D textureUnitPS7;
TEXTURE_LAYOUT(8, 1, 8) uniform sampler3D textureUnitPS8;
TEXTURE_LAYOUT(9, 1, 9) uniform sampler2DArray textureUnitPS9;
TEXTURE_LAYOUT(10, 1, 10) uniform sampler2D textureUnitPS10;
in vec4 passParameterSem0;
in vec4 passParameterSem2;
in vec4 passParameterSem4;
in vec4 passParameterSem5;
in vec4 passParameterSem6;
in vec4 passParameterSem7;
layout(location = 0) out vec4 passPixelColor0;
// end of shader inputs/outputs
void redcCUBE(vec4 src0, vec4 src1, out vec3 stm, out int faceId)
{
// stm -> x .. s, y .. t, z .. MajorAxis*2.0
vec3 inputCoord = normalize(vec3(src1.y, src1.x, src0.x));
float rx = inputCoord.x;
float ry = inputCoord.y;
float rz = inputCoord.z;
if( abs(rx) > abs(ry) && abs(rx) > abs(rz) )
{
stm.z = rx*2.0;
stm.xy = vec2(ry,rz);	
if( rx >= 0.0 )
{
faceId = 0;
}
else
{
faceId = 1;
}
}
else if( abs(ry) > abs(rx) && abs(ry) > abs(rz) )
{
stm.z = ry*2.0;
stm.xy = vec2(rx,rz);	
if( ry >= 0.0 )
{
faceId = 2;
}
else
{
faceId = 3;
}
}
else //if( abs(rz) > abs(ry) && abs(rz) > abs(rx) )
{
stm.z = rz*2.0;
stm.xy = vec2(rx,ry);	
if( rz >= 0.0 )
{
faceId = 4;
}
else
{
faceId = 5;
}
}
}
vec3 redcCUBEReverse(vec2 st, int faceId)
{
st.yx = st.xy;
vec3 v;
float majorAxis = 1.0;
if( faceId == 0 )
{
v.yz = (st-vec2(1.5))*(majorAxis*2.0);
v.x = 1.0;
}
else if( faceId == 1 )
{
v.yz = (st-vec2(1.5))*(majorAxis*2.0);
v.x = -1.0;
}
else if( faceId == 2 )
{
v.xz = (st-vec2(1.5))*(majorAxis*2.0);
v.y = 1.0;
}
else if( faceId == 3 )
{
v.xz = (st-vec2(1.5))*(majorAxis*2.0);
v.y = -1.0;
}
else if( faceId == 4 )
{
v.xy = (st-vec2(1.5))*(majorAxis*2.0);
v.z = 1.0;
}
else
{
v.xy = (st-vec2(1.5))*(majorAxis*2.0);
v.z = -1.0;
}
return v;
}
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
int backupReg0i, backupReg1i, backupReg2i, backupReg3i, backupReg4i;
int PV0ix = 0, PV0iy = 0, PV0iz = 0, PV0iw = 0, PV1ix = 0, PV1iy = 0, PV1iz = 0, PV1iw = 0;
int PS0i = 0, PS1i = 0;
ivec4 tempi = ivec4(0);
float tempResultf;
int tempResulti;
ivec4 ARi = ivec4(0);
bool predResult = true;
bool activeMaskStack[2];
bool activeMaskStackC[3];
activeMaskStack[0] = false;
activeMaskStackC[0] = false;
activeMaskStackC[1] = false;
activeMaskStack[0] = true;
activeMaskStackC[0] = true;
activeMaskStackC[1] = true;
vec3 cubeMapSTM;
int cubeMapFaceId;
float cubeMapArrayIndex1 = 0.0;
R0i = floatBitsToInt(passParameterSem0);
R1i = floatBitsToInt(passParameterSem2);
R2i = floatBitsToInt(passParameterSem4);
R3i = floatBitsToInt(passParameterSem5);
R4i = floatBitsToInt(passParameterSem6);
R5i = floatBitsToInt(passParameterSem7);
if( activeMaskStackC[1] == true ) {
R16i.xyzw = floatBitsToInt(texture(textureUnitPS10, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyzw);
}
if( activeMaskStackC[1] == true ) {
// 0
PV0ix = ((-(intBitsToFloat(R4i.z)) > uf_blockPS1[58].x)?-1:0);
R127i.y = ((-(intBitsToFloat(R4i.z)) > uf_blockPS1[58].y)?-1:0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), uf_blockPS6[44].x));
R3i.w = floatBitsToInt(-(intBitsToFloat(R4i.z)) * intBitsToFloat(0x3d4ccccd));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R5i.w));
// 1
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PS0i)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), uf_blockPS6[43].x));
PV1iw = PV0ix & int(1);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),uf_blockPS6[44].y) + intBitsToFloat(PV0iz));
// 2
backupReg0i = R127i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), uf_blockPS6[45].x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),uf_blockPS6[43].y) + intBitsToFloat(PV1iz));
PV0iz = PV1iw - backupReg0i;
R10i.w = 0x3f800000;
R10i.x = floatBitsToInt(-(intBitsToFloat(R4i.z)) * intBitsToFloat(0x3d4ccccd) + -3.5);
R10i.x = clampFI32(R10i.x);
// 3
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),uf_blockPS6[44].z) + intBitsToFloat(R127i.w));
PV1iy = PV0iz << 0x2;
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),uf_blockPS6[45].y) + intBitsToFloat(PV0ix));
R11i.w = floatBitsToInt(-(intBitsToFloat(R4i.z)) * intBitsToFloat(0x3c23d70a) + -(0.5));
R11i.w = clampFI32(R11i.w);
R4i.w = floatBitsToInt(float(PV0iz));
// 4
R5i.x = PV1iy + 0x2c;
R5i.y = PV1iy + 0x2d;
R3i.z = PV1iy + 0x2b;
R5i.w = PV1iy + 0x2a;
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),uf_blockPS6[43].z) + intBitsToFloat(R127i.y));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R2i.w = tempi.x;
R12i.z = floatBitsToInt(uf_blockPS6[44].w + intBitsToFloat(R127i.x));
}
if( activeMaskStackC[1] == true ) {
R7i.xyzw = floatBitsToInt(uf_blockPS1[R5i.y].xyzw);
R9i.xyzw = floatBitsToInt(uf_blockPS1[R5i.x].xyzw);
R8i.xyzw = floatBitsToInt(uf_blockPS1[R3i.z].xyzw);
R5i.xyzw = floatBitsToInt(uf_blockPS1[R5i.w].xyzw);
R15i.xy = floatBitsToInt(texture(textureUnitPS6, vec2(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y))).xy);
}
if( activeMaskStackC[1] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.y = floatBitsToInt(sqrt(intBitsToFloat(R2i.w)));
// 1
R11i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].x, uf_blockPS10[2].w));
R17i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].y, uf_blockPS10[2].w));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R7i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R9i.x)));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 2
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PS1i)));
R18i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PS1i)));
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PS1i)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R8i.x)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 3
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PS0i)));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(PS0i)));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PS0i)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R7i.y)) + intBitsToFloat(R127i.z));
R15i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].z, uf_blockPS10[2].w));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R12i.x),intBitsToFloat(R18i.y),intBitsToFloat(R14i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R7i.x),intBitsToFloat(R11i.y),intBitsToFloat(R13i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R10i.z = tempi.x;
PV0iw = tempi.x;
R126i.x = floatBitsToInt(intBitsToFloat(R7i.x) + uf_blockPS6[4].x);
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R11i.y),intBitsToFloat(R13i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R11i.x),intBitsToFloat(R17i.y),intBitsToFloat(R15i.z),0.0)));
PV1ix = tempi.x;
R6i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(intBitsToFloat(PV0ix) + 1.0);
PS1i = clampFI32(PS1i);
// 6
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R5i.x)));
R126i.y = floatBitsToInt(intBitsToFloat(R11i.y) + uf_blockPS6[4].y);
R126i.z = floatBitsToInt(intBitsToFloat(R13i.z) + uf_blockPS6[4].z);
PV0iw = floatBitsToInt(max(-(intBitsToFloat(PV1ix)), 0.0));
tempResultf = max(0.0, intBitsToFloat(PS1i));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R10i.y = floatBitsToInt(tempResultf);
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R9i.y)) + intBitsToFloat(R127i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R8i.y)) + intBitsToFloat(R126i.w));
PV1iz = floatBitsToInt(min(intBitsToFloat(PV0iw), 1.0));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R7i.z)) + intBitsToFloat(R125i.w));
R2i.x = R11i.x;
// 8
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R17i.y)),intBitsToFloat(R17i.y)) + 1.0);
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(PV1iz)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R5i.y)) + intBitsToFloat(R127i.x));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R9i.z)) + intBitsToFloat(R123i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R8i.z)) + intBitsToFloat(R123i.y));
// 9
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R126i.z),0.0)));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R11i.y)),intBitsToFloat(R11i.y)) + 1.0);
// 10
R124i.x = floatBitsToInt(intBitsToFloat(R7i.w) + intBitsToFloat(R127i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R5i.z)) + intBitsToFloat(R127i.z));
R127i.z = R12i.x;
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 2.0);
R125i.w = floatBitsToInt(intBitsToFloat(R8i.w) + intBitsToFloat(R127i.y));
R127i.w = R18i.y;
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
// 11
R5i.x = floatBitsToInt(intBitsToFloat(R5i.w) + intBitsToFloat(R123i.y));
R4i.y = R15i.z;
R0i.z = 0;
R124i.w = floatBitsToInt(intBitsToFloat(R9i.w) + intBitsToFloat(R126i.w));
R126i.w = R14i.z;
R126i.w = floatBitsToInt(intBitsToFloat(R126i.w) * 2.0);
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R13i.z),intBitsToFloat(R13i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R4i.y),intBitsToFloat(R0i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R125i.z = tempi.x;
PV0iw = tempi.x;
R12i.w = 0;
// 13
R9i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R10i.z)),intBitsToFloat(R127i.z)) + intBitsToFloat(R7i.x));
R7i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R10i.z)),intBitsToFloat(R127i.w)) + intBitsToFloat(R11i.y));
R11i.z = R15i.x;
R11i.z = clampFI32(R11i.z);
R8i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R10i.z)),intBitsToFloat(R126i.w)) + intBitsToFloat(R13i.z));
// 14
tempResultf = 1.0 / sqrt(intBitsToFloat(R127i.x));
PS0i = floatBitsToInt(tempResultf);
// 15
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS0i)));
tempResultf = 1.0 / sqrt(intBitsToFloat(R125i.x));
R126i.z = floatBitsToInt(tempResultf);
// 16
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), uf_blockPS10[2].w));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), uf_blockPS10[2].w));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), uf_blockPS10[2].w));
R8i.w = 0;
tempResultf = 1.0 / sqrt(intBitsToFloat(R125i.y));
PS0i = floatBitsToInt(tempResultf);
// 17
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R124i.x));
// 18
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PS1i)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PS1i)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(PS1i)));
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R125i.z)));
}
if( activeMaskStackC[1] == true ) {
// 0
R124i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS8[32].w, intBitsToFloat(R16i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockPS8[31].y, intBitsToFloat(R10i.y)));
R125i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS8[32].w, intBitsToFloat(R16i.y)));
R125i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS8[32].w, intBitsToFloat(R16i.x)));
// 1
R6i.x = floatBitsToInt(uf_blockPS6[43].w + intBitsToFloat(R3i.y));
R3i.y = R12i.z;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),uf_blockPS6[45].z) + intBitsToFloat(R6i.z));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iy)));
PS1i = clampFI32(PS1i);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R2i.y)));
R6i.z = floatBitsToInt(uf_blockPS6[45].w + intBitsToFloat(R123i.w));
R18i.z = floatBitsToInt(-(uf_blockPS6[53].z) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(R3i.w));
R18i.z = clampFI32(R18i.z);
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(PV0ix)) + intBitsToFloat(R16i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(PV0ix)) + intBitsToFloat(R16i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(PV0ix)) + intBitsToFloat(R16i.y));
R0i.w = floatBitsToInt(fract(uf_blockPS8[36].w));
// 4
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R123i.x)));
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R123i.w)));
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R123i.z)));
R3i.x = floatBitsToInt(uf_blockPS8[37].x);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R13i.x = floatBitsToInt(uf_blockPS1[0].y);
R9i.y = floatBitsToInt(uf_blockPS1[1].y);
// 1
R9i.z = floatBitsToInt(uf_blockPS1[2].y);
R13i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS4[6].x, intBitsToFloat(R3i.x)));
// 2
R2i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R12i.x),intBitsToFloat(R18i.y),intBitsToFloat(R14i.z),intBitsToFloat(0x80000000)),vec4(uf_blockPS1[11].x,uf_blockPS1[11].y,uf_blockPS1[11].z,0.0)));
PV0iy = R2i.x;
PV0iz = R2i.x;
PV0iw = R2i.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R12i.x),intBitsToFloat(R18i.y),intBitsToFloat(R14i.z),intBitsToFloat(0x80000000)),vec4(uf_blockPS1[12].x,uf_blockPS1[12].y,uf_blockPS1[12].z,0.0)));
PV1ix = tempi.x;
R8i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R12i.x),intBitsToFloat(R18i.y),intBitsToFloat(R14i.z),intBitsToFloat(0x80000000)),vec4(uf_blockPS1[13].x,uf_blockPS1[13].y,uf_blockPS1[13].z,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R19i.z = tempi.x;
PV0iw = tempi.x;
// 5
predResult = (intBitsToFloat(R0i.w) > 0.0);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R0i.z = floatBitsToInt(floor(uf_blockPS8[36].w));
// 1
R0i.z = floatBitsToInt(roundEven(intBitsToFloat(R0i.z)));
}
if( activeMaskStackC[2] == true ) {
R0i.xyz = floatBitsToInt(texture(textureUnitPS9, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z))).xyz);
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R16i.y)) + intBitsToFloat(R0i.y));
PV0iy = floatBitsToInt(-(intBitsToFloat(R16i.x)) + intBitsToFloat(R0i.x));
PV0iw = floatBitsToInt(-(intBitsToFloat(R16i.z)) + intBitsToFloat(R0i.z));
// 1
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R0i.w)) + intBitsToFloat(R16i.x));
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R0i.w)) + intBitsToFloat(R16i.y));
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R0i.w)) + intBitsToFloat(R16i.z));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (uf_blockPS8[33].w > 0.0);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R0i.x = 0;
}
if( activeMaskStackC[2] == true ) {
R0i.w = floatBitsToInt(texture(textureUnitPS8, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.x),intBitsToFloat(R0i.x))).x);
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R16i.z) * intBitsToFloat(0x3dea4a8c));
PV0iy = floatBitsToInt(-(intBitsToFloat(R0i.w)) + 1.0);
R127i.w = floatBitsToInt(intBitsToFloat(R10i.y) * 2.5);
R6i.w = floatBitsToInt(uf_blockPS8[33].w * intBitsToFloat(0x3f666666));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(PV0ix),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R126i.w = tempi.x;
tempResultf = max(0.0, intBitsToFloat(PV0iy));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
R126i.y = floatBitsToInt(intBitsToFloat(0x3f19999a) * intBitsToFloat(PV1ix) + intBitsToFloat(0x3e4ccccd));
R127i.z = floatBitsToInt(0.5 * intBitsToFloat(PV1ix) + intBitsToFloat(0x3dcccccd));
PV0iw = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3fa66666));
R126i.z = floatBitsToInt(exp2(intBitsToFloat(R127i.w)));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) / 2.0);
// 3
R127i.x = floatBitsToInt(intBitsToFloat(0x3f266666) * intBitsToFloat(R126i.w) + intBitsToFloat(0x3eb33333));
R127i.y = floatBitsToInt(-(intBitsToFloat(R127i.z)) + intBitsToFloat(0x3e23d70a));
R126i.w = floatBitsToInt(-(intBitsToFloat(R126i.y)) + intBitsToFloat(0x3e851eb8));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3e4ccccd));
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 0.25);
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PV0iy)) + intBitsToFloat(R126i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PV0iy)) + intBitsToFloat(R127i.z));
PV1iz = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV0iy));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(PV0iy)) + intBitsToFloat(R127i.x));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R123i.x) + intBitsToFloat(PV1iz));
PV0ix = clampFI32(PV0ix);
PV0iy = floatBitsToInt(intBitsToFloat(R123i.y) + intBitsToFloat(PV1iz));
PV0iy = clampFI32(PV0iy);
PV0iw = floatBitsToInt(intBitsToFloat(R123i.w) + intBitsToFloat(PV1iz));
PV0iw = clampFI32(PV0iw);
// 7
PV1ix = floatBitsToInt(-(intBitsToFloat(R16i.z)) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(-(intBitsToFloat(R16i.y)) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(-(intBitsToFloat(R16i.x)) + intBitsToFloat(PV0iy));
// 8
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),uf_blockPS8[33].w) + intBitsToFloat(R16i.x));
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),uf_blockPS8[33].w) + intBitsToFloat(R16i.y));
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),uf_blockPS8[33].w) + intBitsToFloat(R16i.z));
// 9
R2i.w = R10i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R2i.w = 0;
// 1
R6i.w = R2i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),uf_blockPS6[39].z) + -(uf_blockPS6[39].x));
R0i.y = floatBitsToInt(intBitsToFloat(R8i.y) * 2.0 + -(1.0));
R0i.z = floatBitsToInt(-(intBitsToFloat(R3i.y)) + uf_blockPS6[39].w);
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),uf_blockPS6[39].z) + -(uf_blockPS6[39].y));
}
if( activeMaskStackC[1] == true ) {
R2i.z = floatBitsToInt(textureLod(textureUnitPS4, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.w)),0.0).x);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.w)),intBitsToFloat(R0i.y)) + intBitsToFloat(R0i.z));
R126i.y = floatBitsToInt(intBitsToFloat(R10i.x) + uf_blockPS10[3].y);
// 1
PV1iw = floatBitsToInt(intBitsToFloat(R123i.x) + intBitsToFloat(0x3fa66666));
// 2
R123i.z = floatBitsToInt(mul_nonIEEE(-(uf_blockPS6[39].w),intBitsToFloat(R2i.z)) + intBitsToFloat(PV1iw));
// 3
R127i.y = floatBitsToInt(intBitsToFloat(R123i.z) * 0.25);
R127i.y = clampFI32(R127i.y);
// 4
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
// 5
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)),intBitsToFloat(PV0ix)) + intBitsToFloat(PV0ix));
// 6
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)),intBitsToFloat(R123i.w)) + intBitsToFloat(R123i.w));
// 7
PV1ix = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
// 8
R14i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(R126i.y)) + intBitsToFloat(R127i.z));
R14i.w = clampFI32(R14i.w);
// 9
R17i.z = floatBitsToInt(intBitsToFloat(R14i.w) * 0.75 + 0.25);
// 10
predResult = (1.0 > intBitsToFloat(R18i.z));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R0i.y = floatBitsToInt(intBitsToFloat(R3i.z) + intBitsToFloat(0xbb03126f));
R5i.z = floatBitsToInt(roundEven(intBitsToFloat(R4i.w)));
// 1
R5i.w = floatBitsToInt(-(intBitsToFloat(R4i.w)) * intBitsToFloat(0x3a03126f) + intBitsToFloat(R0i.y));
R5i.w = clampFI32(R5i.w);
}
if( activeMaskStackC[2] == true ) {
R0i.y = floatBitsToInt(texture(textureUnitPS2, vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R5i.w))));
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R0i.y)) + 1.0);
// 1
R10i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R18i.z)) + intBitsToFloat(R0i.y));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.z)),uf_blockPS6[26].x) + -(uf_blockPS6[26].y));
R123i.x = clampFI32(R123i.x);
R0i.y = floatBitsToInt(intBitsToFloat(R8i.y) + 1.0);
R0i.z = floatBitsToInt(-(intBitsToFloat(R19i.z)));
R5i.w = 0x40400000;
R0i.w = 0x3f800000;
// 1
redcCUBE(vec4(intBitsToFloat(R0i.z),intBitsToFloat(R0i.z),intBitsToFloat(R2i.x),intBitsToFloat(R0i.y)),vec4(intBitsToFloat(R0i.y),intBitsToFloat(R2i.x),intBitsToFloat(R0i.z),intBitsToFloat(R0i.z)),cubeMapSTM,cubeMapFaceId);
R127i.x = floatBitsToInt(cubeMapSTM.x);
R127i.y = floatBitsToInt(cubeMapSTM.y);
R127i.z = floatBitsToInt(cubeMapSTM.z);
R127i.w = cubeMapFaceId;
R126i.z = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
// 2
R2i.x = floatBitsToInt(intBitsToFloat(R6i.x) * intBitsToFloat(0x3a83126f));
R2i.y = floatBitsToInt(intBitsToFloat(R6i.z) * intBitsToFloat(0x3a83126f));
R5i.z = R127i.w;
R2i.w = floatBitsToInt(-(intBitsToFloat(R4i.z)) * intBitsToFloat(0x3ba3d70a));
PS0i = floatBitsToInt(1.0 / abs(intBitsToFloat(R127i.z)));
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PS0i)) + 1.5);
PV1iy = floatBitsToInt(intBitsToFloat(R6i.y) + -(intBitsToFloat(R7i.w)));
R3i.z = R2i.w;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PS0i)) + 1.5);
tempResultf = max(0.0, intBitsToFloat(R126i.z));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R126i.x = floatBitsToInt(tempResultf);
// 4
R5i.x = R123i.w;
R5i.y = R123i.x;
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R126i.z)) + intBitsToFloat(R7i.w));
R127i.w = floatBitsToInt(-(intBitsToFloat(R8i.y)) * 0.5 + 0.5);
R126i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].y, intBitsToFloat(R126i.x)));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R3i.y),intBitsToFloat(R6i.z),intBitsToFloat(R0i.w)),vec4(uf_blockPS1[37].x,uf_blockPS1[37].y,uf_blockPS1[37].z,uf_blockPS1[37].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.x = floatBitsToInt(max(-(intBitsToFloat(R123i.z)), intBitsToFloat(0xbf7d70a4)));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) / 2.0);
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R3i.y),intBitsToFloat(R6i.z),intBitsToFloat(R0i.w)),vec4(uf_blockPS1[35].x,uf_blockPS1[35].y,uf_blockPS1[35].z,uf_blockPS1[35].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.z = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R3i.y),intBitsToFloat(R6i.z),intBitsToFloat(R0i.w)),vec4(uf_blockPS1[36].x,uf_blockPS1[36].y,uf_blockPS1[36].z,uf_blockPS1[36].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R126i.z)));
// 8
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(uf_blockPS6[27].w) + 1.0);
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R126i.z)));
R126i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + 0.5);
PV0iw = floatBitsToInt(intBitsToFloat(R127i.w) + 2.5);
R6i.y = 0;
// 9
R6i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3daaaaab));
PV1iy = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R123i.z = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
R7i.w = floatBitsToInt(-(intBitsToFloat(R6i.w)) * 3.0 + 3.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(R126i.w)));
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.z)),uf_blockPS6[28].x) + -(uf_blockPS6[28].y));
R123i.x = clampFI32(R123i.x);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(0xbe593484));
R2i.z = floatBitsToInt(intBitsToFloat(R14i.w) * intBitsToFloat(0xbdcccccd) + intBitsToFloat(0x3dcccccd));
R123i.w = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PS1i)) + uf_blockPS6[27].w)/2.0);
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1iy)));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f22f983));
R8i.y = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
PV1iz = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R123i.y)) + intBitsToFloat(0x3fc90da4));
PS1i = floatBitsToInt(max(-(intBitsToFloat(R10i.z)), 0.0));
// 12
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),-(intBitsToFloat(R123i.w))) + 1.0);
R0i.y = floatBitsToInt(min(intBitsToFloat(PS1i), 1.0));
R126i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].x, intBitsToFloat(R126i.x)));
R126i.w = floatBitsToInt(-(intBitsToFloat(R6i.w)) + 1.0);
tempResultf = max(0.0, intBitsToFloat(PV1iz));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R127i.y = floatBitsToInt(tempResultf);
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R9i.y),intBitsToFloat(R9i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R7i.x),intBitsToFloat(R11i.y),intBitsToFloat(R13i.z),0.0)));
tempi.x = clampFI32(tempi.x);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.w)),intBitsToFloat(R126i.w)) + intBitsToFloat(R126i.w));
// 14
PV0ix = floatBitsToInt(intBitsToFloat(R122i.x) + intBitsToFloat(0x3c23d70a));
PV0ix = clampFI32(PV0ix);
PV0iy = floatBitsToInt(-(intBitsToFloat(R0i.y)) + 1.0);
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[29].x, intBitsToFloat(R127i.y)));
R127i.w = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(0xbe99999a));
tempResultf = max(0.0, intBitsToFloat(PV1ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 15
R125i.x = floatBitsToInt(intBitsToFloat(R126i.w) * 0.5 + 0.5);
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt(mul_nonIEEE(uf_blockPS6[29].z, intBitsToFloat(PS0i)));
R0i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.y)),intBitsToFloat(PV0iy)) + intBitsToFloat(PV0iy));
R126i.x = floatBitsToInt(exp2(intBitsToFloat(R126i.z)));
// 16
tempi.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R11i.x)),-(intBitsToFloat(R17i.y)),-(intBitsToFloat(R15i.z)),intBitsToFloat(0x80000000)),vec4(-(intBitsToFloat(R4i.x)),-(intBitsToFloat(R4i.y)),-(intBitsToFloat(R7i.z)),0.0)));
tempi.x = clampFI32(tempi.x);
PV0ix = tempi.x;
PV0iy = tempi.x;
R0i.z = tempi.x;
PV0iw = tempi.x;
R127i.y = floatBitsToInt(exp2(intBitsToFloat(PV1iz)));
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R12i.x),intBitsToFloat(R18i.y),intBitsToFloat(R14i.z),intBitsToFloat(R14i.z)),vec4(-(intBitsToFloat(R4i.x)),-(intBitsToFloat(R4i.y)),-(intBitsToFloat(R7i.z)),-(intBitsToFloat(R8i.w)))));
tempi.x = clampFI32(tempi.x);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.x = floatBitsToInt(exp2(intBitsToFloat(R127i.z)));
// 18
backupReg0i = R127i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(PV1ix)));
R127i.y = floatBitsToInt(-(intBitsToFloat(R0i.z)) + 1.0);
R6i.z = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x40200001));
R6i.z = clampFI32(R6i.z);
R123i.w = floatBitsToInt(mul_nonIEEE(-(uf_blockPS6[29].w),intBitsToFloat(backupReg0i)) + 1.0);
R3i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].z,-(intBitsToFloat(R126i.x))) + uf_blockPS6[27].z);
// 19
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.z)),uf_blockPS6[18].x) + uf_blockPS6[17].w);
R123i.x = clampFI32(R123i.x);
R4i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.x)),intBitsToFloat(R123i.w)) + intBitsToFloat(R123i.w));
R9i.z = floatBitsToInt(intBitsToFloat(0xbf59999a) * intBitsToFloat(R15i.y) + 1.0);
R4i.w = R1i.x;
R4i.w = floatBitsToInt(intBitsToFloat(R4i.w) / 2.0);
R8i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y),intBitsToFloat(PV0ix)) + -(intBitsToFloat(PV0ix)));
// 20
R4i.x = floatBitsToInt(-(intBitsToFloat(R6i.w)) * 3.0 + 4.0);
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R125i.x)));
R11i.y = floatBitsToInt(intBitsToFloat(R11i.y) / 2.0);
R4i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.y)),intBitsToFloat(R0i.w)) + intBitsToFloat(R0i.w));
R9i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.z)),intBitsToFloat(R127i.y)) + intBitsToFloat(R127i.y));
tempResultf = max(0.0, intBitsToFloat(R123i.x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R6i.w = floatBitsToInt(tempResultf);
}
if( activeMaskStackC[1] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(uf_blockPS1[13].x,uf_blockPS1[13].y,uf_blockPS1[13].z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R9i.x),intBitsToFloat(R7i.y),intBitsToFloat(R8i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R4i.z)));
// 1
R127i.x = floatBitsToInt(dot(vec4(uf_blockPS1[11].x,uf_blockPS1[11].y,uf_blockPS1[11].z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R9i.x),intBitsToFloat(R7i.y),intBitsToFloat(R8i.z),0.0)));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
R127i.z = floatBitsToInt(-(intBitsToFloat(PV0ix)));
// 2
tempi.x = floatBitsToInt(dot(vec4(uf_blockPS1[12].x,uf_blockPS1[12].y,uf_blockPS1[12].z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R9i.x),intBitsToFloat(R7i.y),intBitsToFloat(R8i.z),0.0)));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R9i.y = floatBitsToInt(intBitsToFloat(R6i.z) * intBitsToFloat(0x3dcccccd));
// 3
backupReg0i = R127i.x;
backupReg1i = R127i.z;
redcCUBE(vec4(intBitsToFloat(backupReg1i),intBitsToFloat(backupReg1i),intBitsToFloat(backupReg0i),intBitsToFloat(PV0ix)),vec4(intBitsToFloat(PV0ix),intBitsToFloat(backupReg0i),intBitsToFloat(backupReg1i),intBitsToFloat(backupReg1i)),cubeMapSTM,cubeMapFaceId);
R127i.x = floatBitsToInt(cubeMapSTM.x);
R127i.y = floatBitsToInt(cubeMapSTM.y);
R127i.z = floatBitsToInt(cubeMapSTM.z);
R127i.w = cubeMapFaceId;
R0i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS10[3].z,intBitsToFloat(R10i.w)) + uf_blockPS10[1].y);
R0i.x = clampFI32(R0i.x);
// 4
R9i.x = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(0xbfe66666));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R9i.z)));
R7i.z = R127i.w;
R3i.w = floatBitsToInt(intBitsToFloat(R14i.w) * 0.5 + 0.5);
PS0i = floatBitsToInt(1.0 / abs(intBitsToFloat(R127i.z)));
// 5
backupReg0i = R0i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PS0i)) + 1.5);
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.w),intBitsToFloat(R4i.w)) + intBitsToFloat(R4i.w));
R4i.z = floatBitsToInt(-(intBitsToFloat(R14i.y)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PS0i)) + 1.5);
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),-(intBitsToFloat(R11i.y))) + intBitsToFloat(backupReg0i));
// 6
backupReg0i = R0i.z;
R7i.x = R123i.x;
R7i.y = R123i.w;
R0i.z = floatBitsToInt(intBitsToFloat(R8i.w) + 1.0);
R4i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)),intBitsToFloat(R9i.w)) + intBitsToFloat(R9i.w));
R2i.w = floatBitsToInt(1.0 / intBitsToFloat(R4i.x));
}
if( activeMaskStackC[1] == true ) {
R5i.xyz = floatBitsToInt(zmCube(textureUnitPS1, intBitsToFloat(R5i.xy), R5i.z, cubeMapArrayIndex1, intBitsToFloat(R5i.w)).xyz);
R5i.w = floatBitsToInt(textureLod(textureUnitPS5, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y)),0.0).x);
R3i.x = floatBitsToInt(textureLod(textureUnitPS0, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y)),intBitsToFloat(R3i.z)).x);
R13i.xyz = floatBitsToInt(texture(textureUnitPS7, vec2(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y))).xyz);
R7i.xyz = floatBitsToInt(zmCube(textureUnitPS1, intBitsToFloat(R7i.xy), R7i.z, cubeMapArrayIndex1, intBitsToFloat(R7i.w)).xyz);
R8i.xyz = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y))).xyz);
}
if( activeMaskStackC[1] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R3i.x) + uf_blockPS10[1].z);
PV0ix = clampFI32(PV0ix);
PV0iy = floatBitsToInt(max(intBitsToFloat(R5i.y), intBitsToFloat(R5i.z)));
R123i.z = floatBitsToInt(intBitsToFloat(R5i.w) * 2.0 + -(1.0));
PV0iw = floatBitsToInt(min(intBitsToFloat(R5i.y), intBitsToFloat(R5i.z)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), uf_blockPS6[30].w));
// 1
R124i.x = floatBitsToInt(max(intBitsToFloat(R5i.x), intBitsToFloat(PV0iy)));
R4i.y = floatBitsToInt(intBitsToFloat(R123i.z) * 25.0 + intBitsToFloat(R12i.z));
R127i.z = floatBitsToInt(min(intBitsToFloat(R5i.x), intBitsToFloat(PV0iw)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R0i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[18].y, intBitsToFloat(R6i.w)));
// 2
R126i.x = floatBitsToInt(intBitsToFloat(R5i.x) + -(intBitsToFloat(R124i.x)));
R125i.y = floatBitsToInt(intBitsToFloat(R5i.y) + -(intBitsToFloat(R124i.x)));
R124i.z = floatBitsToInt(intBitsToFloat(R5i.z) + -(intBitsToFloat(R124i.x)));
PV0iw = floatBitsToInt(intBitsToFloat(R124i.x) + intBitsToFloat(0x2edbe6ff));
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.y)),intBitsToFloat(R9i.x)) + intBitsToFloat(R9i.x));
R127i.x = clampFI32(R127i.x);
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R12i.x),intBitsToFloat(R18i.y),intBitsToFloat(R14i.z),intBitsToFloat(R14i.z)),vec4(-(intBitsToFloat(R11i.x)),-(intBitsToFloat(R17i.y)),-(intBitsToFloat(R15i.z)),-(intBitsToFloat(R12i.w)))));
tempi.x = clampFI32(tempi.x);
PV1ix = tempi.x;
R126i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 4
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),intBitsToFloat(R0i.z)) + intBitsToFloat(R0i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.z)),intBitsToFloat(PS1i)) + 1.0);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(R4i.w)));
R126i.w = floatBitsToInt(intBitsToFloat(R11i.y) + intBitsToFloat(R10i.x));
R127i.z = floatBitsToInt(exp2(intBitsToFloat(R127i.y)));
// 5
backupReg0i = R127i.w;
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R9i.z)));
PV1iy = floatBitsToInt(intBitsToFloat(R123i.y) + intBitsToFloat(R2i.z));
PV1iy = clampFI32(PV1iy);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(R2i.w)));
R127i.w = floatBitsToInt(intBitsToFloat(R123i.y) + intBitsToFloat(0x2edbe6ff));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(backupReg0i)));
// 6
backupReg0i = R6i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),-(intBitsToFloat(R11i.y))) + intBitsToFloat(R126i.y));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(R3i.w));
R126i.y = clampFI32(R126i.y);
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), uf_blockPS6[16].w));
R3i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3dcccccd) + intBitsToFloat(R127i.x));
tempResultf = max(0.0, intBitsToFloat(PV1iy));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 7
R10i.x = floatBitsToInt(intBitsToFloat(R11i.y) + intBitsToFloat(R123i.x));
R11i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.x)),intBitsToFloat(R4i.z)) + intBitsToFloat(R4i.z));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PS0i)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.y), uf_blockPS6[1].w));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 8
R127i.x = floatBitsToInt(uf_blockPS6[1].x + -(1.0));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R126i.y)));
R4i.z = floatBitsToInt(uf_blockPS6[1].z + -(1.0));
R127i.w = floatBitsToInt(uf_blockPS6[1].y + -(1.0));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iz)));
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PS0i)));
R126i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS10[2].w, uf_blockPS10[2].w));
R123i.z = floatBitsToInt(-(intBitsToFloat(R125i.z)) * intBitsToFloat(0x3d23d70a) + intBitsToFloat(0x3d23d70a));
R123i.w = floatBitsToInt(-(intBitsToFloat(R126i.z)) * intBitsToFloat(0x3d23d70a) + intBitsToFloat(0x3d23d70a));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R125i.x));
// 10
backupReg0i = R126i.w;
R125i.x = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(R123i.z));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.z)));
R125i.z = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(R123i.w));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(PS1i)));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(PV0iy)) + intBitsToFloat(R124i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PV0iy)) + intBitsToFloat(R124i.x));
R126i.z = floatBitsToInt(-(intBitsToFloat(R3i.w)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(PV0iy)) + intBitsToFloat(R124i.x));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.y), intBitsToFloat(R6i.z)));
// 12
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R123i.w)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R123i.x)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R123i.y)));
R1i.w = floatBitsToInt(intBitsToFloat(R17i.z) * 0.75);
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R125i.w)) + 1.0);
// 13
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R125i.w)) + 1.0);
PV1iy = floatBitsToInt(intBitsToFloat(R13i.z) + -(intBitsToFloat(R127i.x)));
PV1iz = floatBitsToInt(intBitsToFloat(R13i.y) + -(intBitsToFloat(R125i.y)));
PV1iw = floatBitsToInt(intBitsToFloat(R13i.x) + -(intBitsToFloat(R124i.z)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R125i.w)) + 1.0);
// 14
backupReg0i = R127i.x;
backupReg1i = R126i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(R11i.w)) + intBitsToFloat(R124i.z));
R126i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS10[1].x, intBitsToFloat(R124i.w)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R11i.w)) + intBitsToFloat(backupReg0i));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R11i.w)) + intBitsToFloat(R125i.y));
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), intBitsToFloat(backupReg1i)));
// 15
backupReg0i = R127i.y;
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].x, intBitsToFloat(backupReg0i)));
R127i.y = floatBitsToInt(0.25 * intBitsToFloat(R127i.z));
PV1iz = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].y, intBitsToFloat(backupReg0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].z, intBitsToFloat(backupReg0i)));
R125i.w = floatBitsToInt(1.0 / intBitsToFloat(R10i.x));
// 16
backupReg0i = R126i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R124i.y)) + intBitsToFloat(PV1ix));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(R126i.x)) + intBitsToFloat(PV1iz));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R11i.z)) + intBitsToFloat(R3i.w));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(PV1iw));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R124i.x)));
// 17
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R127i.y)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(R125i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R126i.w)));
R123i.w = floatBitsToInt(intBitsToFloat(R16i.x) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R123i.w = clampFI32(R123i.w);
R122i.x = floatBitsToInt(intBitsToFloat(R16i.y) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R122i.x = clampFI32(R122i.x);
// 18
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV1iz)));
R123i.y = floatBitsToInt(intBitsToFloat(R16i.z) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R123i.y = clampFI32(R123i.y);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R123i.w)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R122i.x)));
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(R126i.z)));
// 19
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(R126i.z)));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R126i.z)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R123i.y)));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y),-(intBitsToFloat(R5i.x))) + intBitsToFloat(R14i.y));
R124i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].x, intBitsToFloat(R125i.x)));
// 20
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(R127i.y)));
R7i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].z, intBitsToFloat(R125i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].y, intBitsToFloat(R125i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(R127i.y)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R127i.y)));
// 21
R7i.x = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R14i.y = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(R10i.x)) + intBitsToFloat(PV0iw));
R3i.w = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R10i.x)) + intBitsToFloat(PV0ix));
}
if( activeMaskStackC[1] == true ) {
// 0
R127i.x = ((1.0 > intBitsToFloat(R13i.w))?-1:0);
R127i.y = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(R7i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(R10i.x)) + intBitsToFloat(R8i.y));
PV0iw = floatBitsToInt(-(intBitsToFloat(R4i.y)) + uf_blockPS6[52].x);
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.w), intBitsToFloat(R16i.w)));
// 1
R125i.x = floatBitsToInt(intBitsToFloat(R123i.z) + intBitsToFloat(R3i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),uf_blockPS6[15].x) + uf_blockPS6[14].w);
R123i.y = clampFI32(R123i.y);
R126i.z = floatBitsToInt(intBitsToFloat(R7i.z) + intBitsToFloat(R14i.y));
// 2
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), uf_blockPS6[13].w));
// 3
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(R9i.z)));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iw)),intBitsToFloat(R11i.y)) + intBitsToFloat(R11i.y));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R11i.y)));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].z, intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].y, intBitsToFloat(PV0iy)));
PV1iz = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].x, intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R123i.x)));
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.w)),intBitsToFloat(R123i.x)) + intBitsToFloat(R123i.x));
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].z,intBitsToFloat(PV1iw)) + intBitsToFloat(PV1ix));
R123i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].x,intBitsToFloat(PV1iw)) + intBitsToFloat(PV1iz));
R123i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].y,intBitsToFloat(PV1iw)) + intBitsToFloat(PV1iy));
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y),intBitsToFloat(R4i.w)) + intBitsToFloat(R123i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.x),intBitsToFloat(R4i.w)) + intBitsToFloat(R123i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R4i.w)) + intBitsToFloat(R123i.z));
// 8
backupReg0i = R123i.y;
R123i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].y,intBitsToFloat(R5i.x)) + intBitsToFloat(R123i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].z,intBitsToFloat(R5i.x)) + intBitsToFloat(R123i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].x,intBitsToFloat(R5i.x)) + intBitsToFloat(backupReg0i));
// 9
backupReg0i = R126i.y;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R125i.x)) + intBitsToFloat(R123i.z));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.y));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R126i.z)) + intBitsToFloat(R123i.w));
// 10
PV0iy = floatBitsToInt(-(intBitsToFloat(R125i.x)) * 0.25);
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.y)) * 0.25);
PV0iw = floatBitsToInt(-(intBitsToFloat(R125i.z)) * 0.25);
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3fb8aa3b));
R127i.y = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3fb8aa3b));
R126i.z = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3fb8aa3b));
// 12
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
// 13
PV1iz = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 4.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(R126i.z)));
// 14
R1i.x = ((R127i.x == 0)?(R125i.z):(PV1iz));
PV0iy = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 4.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(R127i.y)));
// 15
PV1ix = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 4.0);
R1i.y = ((R127i.x == 0)?(R126i.y):(PV0iy));
// 16
R1i.z = ((R127i.x == 0)?(R125i.x):(PV1ix));
}
// export
passPixelColor0 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
}
