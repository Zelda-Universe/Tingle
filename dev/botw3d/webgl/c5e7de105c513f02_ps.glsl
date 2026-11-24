#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;

vec4 zmCube(sampler2DArray s, vec2 st, int face, float cubeIndex, float lod) {
	return textureLod(s, vec3(st - 1.0, float(face) + cubeIndex * 6.0), lod);
}
// shader c5e7de105c513f02
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform vec2 uf_fragCoordScale;
UNIFORM_BUFFER_LAYOUT(33, 1, 16) uniform uniformBlockPS1
{
vec4 uf_blockPS1[4096];
};


UNIFORM_BUFFER_LAYOUT(38, 1, 17) uniform uniformBlockPS6
{
vec4 uf_blockPS6[54];
};


UNIFORM_BUFFER_LAYOUT(40, 1, 18) uniform uniformBlockPS8
{
vec4 uf_blockPS8[38];
};


UNIFORM_BUFFER_LAYOUT(42, 1, 19) uniform uniformBlockPS10
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
TEXTURE_LAYOUT(8, 1, 8) uniform sampler2D textureUnitPS8;
TEXTURE_LAYOUT(9, 1, 9) uniform sampler3D textureUnitPS9;
TEXTURE_LAYOUT(10, 1, 10) uniform sampler2DArray textureUnitPS10;
TEXTURE_LAYOUT(11, 1, 11) uniform sampler2D textureUnitPS11;
TEXTURE_LAYOUT(12, 1, 12) uniform sampler2D textureUnitPS12;
TEXTURE_LAYOUT(13, 1, 13) uniform sampler2D textureUnitPS13;
TEXTURE_LAYOUT(14, 1, 14) uniform sampler2D textureUnitPS14;
in vec4 passParameterSem0;
in vec4 passParameterSem2;
in vec4 passParameterSem4;
in vec4 passParameterSem5;
in vec4 passParameterSem6;
in vec4 passParameterSem7;
in vec4 passParameterSem8;
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
ivec4 R20i = ivec4(0);
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
R6i = floatBitsToInt(passParameterSem8);
if( activeMaskStackC[1] == true ) {
R17i.xyz = floatBitsToInt(texture(textureUnitPS12, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
R13i.z = floatBitsToInt(texture(textureUnitPS14, vec2(intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))).x);
R16i.xyzw = floatBitsToInt(texture(textureUnitPS11, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyzw);
R13i.w = floatBitsToInt(texture(textureUnitPS13, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
}
if( activeMaskStackC[1] == true ) {
// 0
R127i.x = ((-(intBitsToFloat(R5i.z)) > uf_blockPS1[58].y)?-1:0);
R8i.y = floatBitsToInt(intBitsToFloat(R17i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R3i.z)));
PV0iw = ((-(intBitsToFloat(R5i.z)) > uf_blockPS1[58].x)?-1:0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R6i.w));
// 1
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(PS0i)));
PV1iy = PV0iw & int(1);
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R3i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R3i.y)));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(R8i.y)));
R4i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.y)),intBitsToFloat(R2i.z)) + intBitsToFloat(R127i.z));
R8i.z = PV1iy - R127i.x;
R123i.w = floatBitsToInt(intBitsToFloat(R17i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R6i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.z)),intBitsToFloat(R2i.x)) + intBitsToFloat(PV1iw));
// 3
PV1ix = R8i.z << 0x2;
R7i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.x)),intBitsToFloat(R2i.y)) + intBitsToFloat(R127i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R123i.w)) + intBitsToFloat(PV0ix));
R123i.z = clampFI32(R123i.z);
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R123i.w)));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), uf_blockPS6[44].x));
// 4
R6i.x = PV1ix + 0x2d;
R6i.y = PV1ix + 0x2b;
R4i.z = PV1ix + 0x2a;
R6i.w = PV1ix + 0x2c;
R8i.x = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
}
if( activeMaskStackC[1] == true ) {
R9i.xyzw = floatBitsToInt(uf_blockPS1[R6i.x].xyzw);
R10i.xyzw = floatBitsToInt(uf_blockPS1[R6i.w].xyzw);
R11i.xyzw = floatBitsToInt(uf_blockPS1[R6i.y].xyzw);
R12i.xyzw = floatBitsToInt(uf_blockPS1[R4i.z].xyzw);
R14i.xy = floatBitsToInt(texture(textureUnitPS6, vec2(intBitsToFloat(R7i.x),intBitsToFloat(R7i.z))).xy);
}
if( activeMaskStackC[1] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R2i.w)));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R2i.w)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R9i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R8i.y)) + intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(R2i.w)));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 2
R15i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].x, uf_blockPS10[2].w));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R8i.y)) + intBitsToFloat(PV1ix));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R10i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R8i.y)) + intBitsToFloat(PV1iw));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 3
R17i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PS0i)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PS0i)));
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PS0i)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R9i.y)) + intBitsToFloat(R127i.y));
R9i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].y, uf_blockPS10[2].w));
// 4
R124i.x = floatBitsToInt(intBitsToFloat(R17i.x) + uf_blockPS6[4].x);
R125i.y = floatBitsToInt(intBitsToFloat(R8i.y) + uf_blockPS6[4].y);
R124i.z = floatBitsToInt(intBitsToFloat(R14i.z) + uf_blockPS6[4].z);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R11i.x)));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(R8i.x)));
// 5
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.z));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(PS0i)) + intBitsToFloat(R126i.y));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R12i.x)));
R15i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].z, uf_blockPS10[2].w));
// 6
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV0iy = R126i.x;
PV0iz = R126i.x;
PV0iw = R126i.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R10i.y)) + intBitsToFloat(R126i.z));
// 7
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R12i.y)) + intBitsToFloat(R127i.w));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R9i.z)) + intBitsToFloat(R125i.w));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R11i.y)) + intBitsToFloat(R126i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R10i.z)) + intBitsToFloat(R122i.x));
R2i.x = R15i.x;
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R124i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R124i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R125i.z = tempi.x;
PV0iw = tempi.x;
R2i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.y)),intBitsToFloat(R9i.y)) + 1.0);
// 9
backupReg0i = R126i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R11i.z)) + intBitsToFloat(R126i.z));
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R8i.y)),intBitsToFloat(R8i.y)) + 1.0);
R126i.z = floatBitsToInt(intBitsToFloat(R9i.w) + intBitsToFloat(backupReg0i));
R9i.w = floatBitsToInt(intBitsToFloat(R10i.w) + intBitsToFloat(R127i.w));
R9i.x = floatBitsToInt(-(intBitsToFloat(R5i.z)) * intBitsToFloat(0x3d4ccccd));
// 10
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R12i.z)) + intBitsToFloat(R127i.x));
R2i.y = R15i.z;
R3i.z = 0;
R124i.w = floatBitsToInt(intBitsToFloat(R11i.w) + intBitsToFloat(backupReg0i));
R6i.w = 0;
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R17i.x),intBitsToFloat(R14i.z),intBitsToFloat(R14i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R3i.z),0.0)));
PV1ix = tempi.x;
R124i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.w = floatBitsToInt(intBitsToFloat(R12i.w) + intBitsToFloat(R123i.x));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R17i.x),intBitsToFloat(R8i.y),intBitsToFloat(R14i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R15i.x),intBitsToFloat(R9i.y),intBitsToFloat(R15i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R6i.z = tempi.x;
PV0iw = tempi.x;
R18i.z = R14i.x;
R18i.z = clampFI32(R18i.z);
// 13
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R16i.x)));
R11i.y = floatBitsToInt(-(intBitsToFloat(R5i.z)) * intBitsToFloat(0x3c23d70a) + -(0.5));
R11i.y = clampFI32(R11i.y);
R2i.w = floatBitsToInt(-(intBitsToFloat(R5i.z)) * intBitsToFloat(0x3d4ccccd) + -3.5);
R2i.w = clampFI32(R2i.w);
R7i.w = R17i.z;
// 14
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R16i.y)));
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R16i.z)));
tempResultf = 1.0 / sqrt(intBitsToFloat(R126i.x));
PS0i = floatBitsToInt(tempResultf);
// 15
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PS0i)));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
tempResultf = 1.0 / sqrt(intBitsToFloat(R125i.z));
PS1i = floatBitsToInt(tempResultf);
// 16
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(PS1i)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PS1i)));
R124i.z = R14i.x;
R124i.z = floatBitsToInt(intBitsToFloat(R124i.z) * 2.0);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PS1i)));
R127i.w = R10i.y;
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R17i.x),intBitsToFloat(R8i.y),intBitsToFloat(R14i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R14i.x),intBitsToFloat(R10i.y),intBitsToFloat(R11i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R3i.z = tempi.x;
PV1iw = tempi.x;
PS1i = R11i.z;
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 18
R18i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(R124i.z)) + intBitsToFloat(R17i.x));
R15i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(R127i.w)) + intBitsToFloat(R8i.y));
R19i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(PS1i)) + intBitsToFloat(R14i.z));
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), uf_blockPS10[2].w));
// 19
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), uf_blockPS10[2].w));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), uf_blockPS10[2].w));
R5i.w = 0;
tempResultf = 1.0 / sqrt(intBitsToFloat(R2i.z));
R124i.x = floatBitsToInt(tempResultf);
// 20
tempResultf = 1.0 / sqrt(intBitsToFloat(R126i.y));
PS0i = floatBitsToInt(tempResultf);
// 21
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.z));
// 22
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PS1i)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(PS1i)));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(PS1i)));
R8i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R124i.y)));
R3i.y = floatBitsToInt(float(R8i.z));
}
if( activeMaskStackC[1] == true ) {
// 0
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),uf_blockPS6[44].y) + intBitsToFloat(R4i.w));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), uf_blockPS6[43].x));
// 1
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),uf_blockPS6[43].y) + intBitsToFloat(PV0iz));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), uf_blockPS6[45].x));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),uf_blockPS6[44].z) + intBitsToFloat(R124i.x));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),uf_blockPS6[45].y) + intBitsToFloat(PV1iw));
// 3
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),uf_blockPS6[43].z) + intBitsToFloat(R124i.y));
R12i.y = floatBitsToInt(uf_blockPS6[44].w + intBitsToFloat(R123i.x));
// 4
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),uf_blockPS6[45].z) + intBitsToFloat(R126i.z));
R126i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS8[23].y, intBitsToFloat(R13i.z)));
R125i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS8[23].x, intBitsToFloat(R13i.z)));
// 5
R7i.x = floatBitsToInt(uf_blockPS6[43].w + intBitsToFloat(R124i.x));
R126i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS8[23].z, intBitsToFloat(R13i.z)));
R7i.y = R12i.y;
// 6
R8i.z = floatBitsToInt(uf_blockPS6[45].w + intBitsToFloat(R124i.y));
R3i.w = floatBitsToInt(-(uf_blockPS6[53].w) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(R9i.x));
R3i.w = clampFI32(R3i.w);
R10i.z = floatBitsToInt(-(uf_blockPS6[53].z) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(R9i.x));
R10i.z = clampFI32(R10i.z);
// 7
R13i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS8[31].x, intBitsToFloat(R125i.w)));
R13i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS8[31].x, intBitsToFloat(R126i.z)));
R13i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS8[31].x, intBitsToFloat(R126i.y)));
R3i.x = floatBitsToInt(fract(uf_blockPS8[36].w));
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R5i.x = floatBitsToInt(uf_blockPS1[0].y);
R5i.y = floatBitsToInt(uf_blockPS1[1].y);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), uf_blockPS1[11].z));
R9i.z = floatBitsToInt(uf_blockPS1[2].y);
// 2
R4i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R10i.y),intBitsToFloat(PV1ix),intBitsToFloat(0x80000000)),vec4(uf_blockPS1[11].x,uf_blockPS1[11].y,1.0,0.0)));
PV0iy = R4i.x;
PV0iz = R4i.x;
PV0iw = R4i.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), uf_blockPS1[12].z));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R10i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(uf_blockPS1[12].x,uf_blockPS1[12].y,1.0,0.0)));
PV1ix = tempi.x;
R4i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), uf_blockPS1[13].z));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R10i.y),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(uf_blockPS1[13].x,uf_blockPS1[13].y,1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R4i.z = tempi.x;
PV0iw = tempi.x;
// 5
predResult = (intBitsToFloat(R3i.x) > 0.0);
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
R0i.xyz = floatBitsToInt(texture(textureUnitPS10, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z))).xyz);
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R16i.y)) + intBitsToFloat(R0i.y));
PV0iy = floatBitsToInt(-(intBitsToFloat(R16i.x)) + intBitsToFloat(R0i.x));
PV0iw = floatBitsToInt(-(intBitsToFloat(R16i.z)) + intBitsToFloat(R0i.z));
R13i.w = 0;
// 1
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R3i.x)) + intBitsToFloat(R16i.x));
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R3i.x)) + intBitsToFloat(R16i.y));
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R3i.x)) + intBitsToFloat(R16i.z));
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
R0i.y = 0;
}
if( activeMaskStackC[2] == true ) {
R0i.y = floatBitsToInt(texture(textureUnitPS9, vec3(intBitsToFloat(R0i.y),intBitsToFloat(R0i.y),intBitsToFloat(R0i.y))).x);
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R0i.y)) + 1.0);
R127i.y = floatBitsToInt(intBitsToFloat(R3i.z) + 1.0);
R127i.y = clampFI32(R127i.y);
R127i.z = floatBitsToInt(-(intBitsToFloat(R17i.z)) + intBitsToFloat(0x3f666666));
PS0i = floatBitsToInt(intBitsToFloat(R16i.z) * intBitsToFloat(0x3dea4a8c));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R127i.w = tempi.x;
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
backupReg0i = R127i.y;
R127i.x = floatBitsToInt(0.5 * intBitsToFloat(PV1ix) + intBitsToFloat(0x3dcccccd));
R127i.y = floatBitsToInt(intBitsToFloat(0x3f19999a) * intBitsToFloat(PV1ix) + intBitsToFloat(0x3e4ccccd));
PV0iz = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3fa66666));
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),uf_blockPS8[33].w) + intBitsToFloat(R17i.z));
tempResultf = max(0.0, intBitsToFloat(backupReg0i));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 3
R126i.x = floatBitsToInt(intBitsToFloat(0x3f266666) * intBitsToFloat(R127i.w) + intBitsToFloat(0x3eb33333));
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * 2.5);
R127i.w = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(0x3e23d70a));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3e4ccccd));
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 0.25);
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(0x3e851eb8));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iz)));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV0ix)) + intBitsToFloat(R127i.x));
PV1iy = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(PV0ix));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(PV0ix)) + intBitsToFloat(R126i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(PV0ix)) + intBitsToFloat(R127i.y));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R123i.x) + intBitsToFloat(PV1iy));
PV0ix = clampFI32(PV0ix);
R127i.z = floatBitsToInt(intBitsToFloat(R123i.z) + intBitsToFloat(PV1iy));
R127i.z = clampFI32(R127i.z);
PV0iw = floatBitsToInt(intBitsToFloat(R123i.w) + intBitsToFloat(PV1iy));
PV0iw = clampFI32(PV0iw);
// 7
PV1ix = floatBitsToInt(-(intBitsToFloat(R16i.y)) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(-(intBitsToFloat(R16i.x)) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(-(intBitsToFloat(R13i.x)) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(-(intBitsToFloat(R16i.z)) + intBitsToFloat(R127i.z));
R127i.x = floatBitsToInt(-(intBitsToFloat(R13i.y)) + intBitsToFloat(PV0iw));
// 8
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),uf_blockPS8[33].w) + intBitsToFloat(R16i.x));
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),uf_blockPS8[33].w) + intBitsToFloat(R16i.y));
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),uf_blockPS8[33].w) + intBitsToFloat(R16i.z));
PV0iw = floatBitsToInt(-(intBitsToFloat(R13i.z)) + intBitsToFloat(R127i.z));
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),uf_blockPS8[33].w) + intBitsToFloat(R13i.x));
// 9
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),uf_blockPS8[33].w) + intBitsToFloat(R13i.y));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),uf_blockPS8[33].w) + intBitsToFloat(R13i.z));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),uf_blockPS6[39].z) + -(uf_blockPS6[39].x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z),uf_blockPS6[39].z) + -(uf_blockPS6[39].y));
R0i.z = floatBitsToInt(intBitsToFloat(R4i.y) * 2.0 + -(1.0));
R0i.w = floatBitsToInt(-(intBitsToFloat(R7i.y)) + uf_blockPS6[39].w);
R2i.z = floatBitsToInt(intBitsToFloat(R13i.w) * 0.25 + 0.25);
}
if( activeMaskStackC[1] == true ) {
R0i.x = floatBitsToInt(textureLod(textureUnitPS4, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)),0.0).x);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R0i.w) + -(intBitsToFloat(R0i.z)));
R126i.y = floatBitsToInt(intBitsToFloat(R2i.w) + uf_blockPS10[3].y);
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockPS6[39].w, intBitsToFloat(R0i.x)));
// 1
PV1ix = floatBitsToInt(uf_blockPS10[2].z + 1.0);
PV1iz = floatBitsToInt(-(intBitsToFloat(PV0iz)) + intBitsToFloat(0x3fa66666));
// 2
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R127i.x));
R11i.w = floatBitsToInt(-(intBitsToFloat(R3i.w)) + intBitsToFloat(PV1ix));
R11i.w = clampFI32(R11i.w);
// 3
R127i.y = floatBitsToInt(intBitsToFloat(PV0iw) * 0.25);
R127i.y = clampFI32(R127i.y);
// 4
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
// 5
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)),intBitsToFloat(PV0ix)) + intBitsToFloat(PV0ix));
// 6
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)),intBitsToFloat(R123i.z)) + intBitsToFloat(R123i.z));
// 7
PV1ix = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
// 8
R20i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(R126i.y)) + intBitsToFloat(R127i.w));
R20i.z = clampFI32(R20i.z);
// 9
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R20i.z),-(intBitsToFloat(R2i.z))) + intBitsToFloat(R20i.z));
// 10
R10i.w = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(R123i.y));
// 11
predResult = (1.0 > intBitsToFloat(R10i.z));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R0i.x = floatBitsToInt(intBitsToFloat(R7i.z) + intBitsToFloat(0xbb03126f));
R2i.z = floatBitsToInt(roundEven(intBitsToFloat(R3i.y)));
// 1
R2i.w = floatBitsToInt(-(intBitsToFloat(R3i.y)) * intBitsToFloat(0x3a03126f) + intBitsToFloat(R0i.x));
R2i.w = clampFI32(R2i.w);
}
if( activeMaskStackC[2] == true ) {
R0i.w = floatBitsToInt(texture(textureUnitPS2, vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w))));
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R0i.w)) + 1.0);
// 1
R17i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R10i.z)) + intBitsToFloat(R0i.w));
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R17i.z = 0x3f800000;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R3i.x = floatBitsToInt(intBitsToFloat(R7i.x) * intBitsToFloat(0x38d1b717) + 0.5);
R3i.y = floatBitsToInt(intBitsToFloat(R8i.z) * intBitsToFloat(0x3903126f) + 0.5);
R0i.z = floatBitsToInt(-(intBitsToFloat(R4i.z)));
R4i.w = 0x40400000;
R0i.w = 0x3f800000;
// 1
redcCUBE(vec4(intBitsToFloat(R0i.z),intBitsToFloat(R0i.z),intBitsToFloat(R4i.x),intBitsToFloat(R4i.y)),vec4(intBitsToFloat(R4i.y),intBitsToFloat(R4i.x),intBitsToFloat(R0i.z),intBitsToFloat(R0i.z)),cubeMapSTM,cubeMapFaceId);
R127i.x = floatBitsToInt(cubeMapSTM.x);
R127i.y = floatBitsToInt(cubeMapSTM.y);
R127i.z = floatBitsToInt(cubeMapSTM.z);
R127i.w = cubeMapFaceId;
R122i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.z)),uf_blockPS6[26].x) + -(uf_blockPS6[26].y));
R122i.x = clampFI32(R122i.x);
// 2
R0i.x = floatBitsToInt(-(intBitsToFloat(R5i.z)) * intBitsToFloat(0x3ba3d70a));
R6i.y = floatBitsToInt(intBitsToFloat(R8i.z) * intBitsToFloat(0x3a83126f));
R4i.z = R127i.w;
R126i.w = floatBitsToInt(-(intBitsToFloat(R122i.x)) + 1.0);
PS0i = floatBitsToInt(1.0 / abs(intBitsToFloat(R127i.z)));
// 3
R6i.x = floatBitsToInt(intBitsToFloat(R7i.x) * intBitsToFloat(0x3a83126f));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PS0i)) + 1.5);
R7i.z = R0i.x;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PS0i)) + 1.5);
PS1i = floatBitsToInt(intBitsToFloat(R6i.z) + -(intBitsToFloat(R8i.w)));
// 4
backupReg0i = R4i.y;
R4i.x = R123i.w;
R4i.y = R123i.y;
R126i.z = floatBitsToInt(-(intBitsToFloat(backupReg0i)) * 0.5 + 0.5);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i),intBitsToFloat(R126i.w)) + intBitsToFloat(R8i.w));
tempResultf = max(0.0, intBitsToFloat(R126i.w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R124i.z = floatBitsToInt(tempResultf);
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R8i.z),intBitsToFloat(R0i.w)),vec4(uf_blockPS1[37].x,uf_blockPS1[37].y,uf_blockPS1[37].z,uf_blockPS1[37].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.z = floatBitsToInt(max(-(intBitsToFloat(R123i.w)), intBitsToFloat(0xbf7d70a4)));
R125i.z = floatBitsToInt(intBitsToFloat(R125i.z) / 2.0);
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R8i.z),intBitsToFloat(R0i.w)),vec4(uf_blockPS1[35].x,uf_blockPS1[35].y,uf_blockPS1[35].z,uf_blockPS1[35].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R8i.z),intBitsToFloat(R0i.w)),vec4(uf_blockPS1[36].x,uf_blockPS1[36].y,uf_blockPS1[36].z,uf_blockPS1[36].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R127i.z)));
// 8
R127i.x = floatBitsToInt(-(uf_blockPS6[27].w) + 1.0);
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.z)));
R8i.z = 0;
PV0iw = floatBitsToInt(intBitsToFloat(R126i.z) + 2.5);
R9i.w = floatBitsToInt(-(intBitsToFloat(R7i.w)) * 3.0 + 3.0);
// 9
R8i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3daaaaab));
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].y, intBitsToFloat(R124i.z)));
R6i.z = floatBitsToInt(intBitsToFloat(R20i.z) * intBitsToFloat(0xbdcccccd) + intBitsToFloat(0x3dcccccd));
R126i.w = floatBitsToInt(intBitsToFloat(R125i.z) + 0.5);
R127i.y = floatBitsToInt(-(intBitsToFloat(R7i.w)) + 1.0);
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.z)),uf_blockPS6[28].x) + -(uf_blockPS6[28].y));
R123i.x = clampFI32(R123i.x);
PV0iy = floatBitsToInt(max(-(intBitsToFloat(R3i.z)), 0.0));
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
R123i.w = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 11
backupReg0i = R123i.x;
R123i.x = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PS0i)) + uf_blockPS6[27].w)/2.0);
PV1iy = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R123i.w)) + intBitsToFloat(0xbe593484));
R3i.w = floatBitsToInt(min(intBitsToFloat(PV0iy), 1.0));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0iz)));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3f22f983));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R123i.z)) + intBitsToFloat(0x3fc90da4));
R10i.z = floatBitsToInt(intBitsToFloat(R123i.x) + 0.5);
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.w)),intBitsToFloat(R127i.y)) + intBitsToFloat(R127i.y));
tempResultf = max(0.0, intBitsToFloat(PV1iy));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 13
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),-(intBitsToFloat(R123i.y))) + 1.0);
R126i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[29].x, intBitsToFloat(PS0i)));
R124i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].x, intBitsToFloat(R124i.z)));
R126i.w = floatBitsToInt(intBitsToFloat(R123i.w) + intBitsToFloat(0x3c23d70a));
R126i.w = clampFI32(R126i.w);
R125i.z = floatBitsToInt(-(intBitsToFloat(R3i.w)) + 1.0);
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R9i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R17i.x),intBitsToFloat(R8i.y),intBitsToFloat(R14i.z),0.0)));
tempi.x = clampFI32(tempi.x);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.y = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(0xbe99999a));
// 15
tempi.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R15i.x)),-(intBitsToFloat(R9i.y)),-(intBitsToFloat(R15i.z)),intBitsToFloat(0x80000000)),vec4(-(intBitsToFloat(R11i.x)),-(intBitsToFloat(R17i.y)),-(intBitsToFloat(R12i.z)),0.0)));
tempi.x = clampFI32(tempi.x);
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 16
R127i.x = floatBitsToInt(intBitsToFloat(R127i.y) * 0.5 + 0.5);
R127i.y = R1i.x;
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) / 2.0);
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockPS6[29].z, intBitsToFloat(PS1i)));
R8i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R126i.w)));
R124i.y = floatBitsToInt(exp2(intBitsToFloat(R124i.z)));
// 17
tempi.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R11i.x)),-(intBitsToFloat(R17i.y)),-(intBitsToFloat(R12i.z)),-(intBitsToFloat(R5i.w))),vec4(intBitsToFloat(R14i.x),intBitsToFloat(R10i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.z))));
tempi.x = clampFI32(tempi.x);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
// 18
backupReg0i = R125i.z;
backupReg1i = R126i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(-(uf_blockPS6[29].w),intBitsToFloat(PS1i)) + 1.0);
R126i.y = floatBitsToInt(-(intBitsToFloat(R0i.z)) + 1.0);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(PV1ix)));
R0i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.w)),intBitsToFloat(backupReg0i)) + intBitsToFloat(backupReg0i));
PS0i = floatBitsToInt(exp2(intBitsToFloat(backupReg1i)));
// 19
R11i.x = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(0x40200001));
R11i.x = clampFI32(R11i.x);
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.z)),uf_blockPS6[18].x) + uf_blockPS6[17].w);
R123i.y = clampFI32(R123i.y);
R12i.z = floatBitsToInt(intBitsToFloat(0xbf59999a) * intBitsToFloat(R14i.y) + 1.0);
R2i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)),intBitsToFloat(R123i.x)) + intBitsToFloat(R123i.x));
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R20i.z),intBitsToFloat(R127i.y)) + intBitsToFloat(R127i.y));
// 20
R2i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].z,-(intBitsToFloat(R124i.y))) + uf_blockPS6[27].z);
R5i.y = floatBitsToInt(intBitsToFloat(R20i.z) * 0.5 + 0.5);
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),intBitsToFloat(R125i.z)) + -(intBitsToFloat(R125i.z)));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R127i.x)));
R5i.w = floatBitsToInt(intBitsToFloat(R5i.w) / 2.0);
tempResultf = max(0.0, intBitsToFloat(R123i.y));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R5i.x = floatBitsToInt(tempResultf);
// 21
tempi.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R15i.x)),-(intBitsToFloat(R9i.y)),-(intBitsToFloat(R15i.z)),-(intBitsToFloat(R6i.w))),vec4(intBitsToFloat(R14i.x),intBitsToFloat(R10i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.z))));
tempi.x = clampFI32(tempi.x);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R6i.w = tempi.x;
R0i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.z)),intBitsToFloat(R126i.y)) + intBitsToFloat(R126i.y));
}
if( activeMaskStackC[1] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(uf_blockPS1[13].x,uf_blockPS1[13].y,uf_blockPS1[13].z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R18i.x),intBitsToFloat(R15i.y),intBitsToFloat(R19i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.w)),intBitsToFloat(R0i.w)) + intBitsToFloat(R0i.w));
// 1
R126i.x = floatBitsToInt(dot(vec4(uf_blockPS1[11].x,uf_blockPS1[11].y,uf_blockPS1[11].z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R18i.x),intBitsToFloat(R15i.y),intBitsToFloat(R19i.z),0.0)));
PV1iy = R126i.x;
PV1iz = R126i.x;
PV1iw = R126i.x;
R126i.z = floatBitsToInt(-(intBitsToFloat(PV0ix)));
// 2
tempi.x = floatBitsToInt(dot(vec4(uf_blockPS1[12].x,uf_blockPS1[12].y,uf_blockPS1[12].z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R18i.x),intBitsToFloat(R15i.y),intBitsToFloat(R19i.z),0.0)));
PV0ix = tempi.x;
R126i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R5i.z = floatBitsToInt(-(intBitsToFloat(R7i.w)) * 3.0 + 4.0);
// 3
backupReg0i = R127i.x;
redcCUBE(vec4(intBitsToFloat(R126i.z),intBitsToFloat(R126i.z),intBitsToFloat(R126i.x),intBitsToFloat(PV0ix)),vec4(intBitsToFloat(PV0ix),intBitsToFloat(R126i.x),intBitsToFloat(R126i.z),intBitsToFloat(R126i.z)),cubeMapSTM,cubeMapFaceId);
R127i.x = floatBitsToInt(cubeMapSTM.x);
R127i.y = floatBitsToInt(cubeMapSTM.y);
R127i.z = floatBitsToInt(cubeMapSTM.z);
R127i.w = cubeMapFaceId;
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(backupReg0i)));
// 4
R0i.x = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(0xbfe66666));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), uf_blockPS6[30].w));
R9i.z = R127i.w;
R2i.w = floatBitsToInt(intBitsToFloat(R11i.x) * intBitsToFloat(0x3dcccccd));
PS0i = floatBitsToInt(1.0 / abs(intBitsToFloat(R127i.z)));
// 5
R5i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[18].y, intBitsToFloat(R5i.x)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PS0i)) + 1.5);
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R12i.z)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PS0i)) + 1.5);
R7i.w = floatBitsToInt(intBitsToFloat(R6i.w) + intBitsToFloat(R5i.y));
R7i.w = clampFI32(R7i.w);
// 6
backupReg0i = R0i.z;
R9i.x = R123i.w;
R9i.y = R123i.y;
R0i.z = floatBitsToInt(intBitsToFloat(R2i.z) + 1.0);
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),-(intBitsToFloat(R5i.w))) + intBitsToFloat(R3i.w));
R2i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)),intBitsToFloat(R0i.y)) + intBitsToFloat(R0i.y));
}
if( activeMaskStackC[1] == true ) {
R4i.xyz = floatBitsToInt(zmCube(textureUnitPS1, intBitsToFloat(R4i.xy), R4i.z, cubeMapArrayIndex1, intBitsToFloat(R4i.w)).xyz);
R3i.xyz = floatBitsToInt(textureLod(textureUnitPS7, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y)),0.0).xyz);
R6i.y = floatBitsToInt(textureLod(textureUnitPS5, vec2(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y)),0.0).x);
R4i.w = floatBitsToInt(textureLod(textureUnitPS0, vec2(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y)),intBitsToFloat(R7i.z)).x);
R8i.xyz = floatBitsToInt(texture(textureUnitPS8, vec2(intBitsToFloat(R8i.x),intBitsToFloat(R8i.z))).xyz);
R9i.xyz = floatBitsToInt(zmCube(textureUnitPS1, intBitsToFloat(R9i.xy), R9i.z, cubeMapArrayIndex1, intBitsToFloat(R9i.w)).xyz);
R10i.xyz = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R10i.x),intBitsToFloat(R10i.z))).xyz);
}
if( activeMaskStackC[1] == true ) {
// 0
PV0ix = floatBitsToInt(min(intBitsToFloat(R4i.y), intBitsToFloat(R4i.z)));
R123i.y = floatBitsToInt(intBitsToFloat(R6i.y) * 2.0 + -(1.0));
PV0iz = floatBitsToInt(max(intBitsToFloat(R4i.y), intBitsToFloat(R4i.z)));
R126i.w = floatBitsToInt(intBitsToFloat(R4i.w) + uf_blockPS10[1].z);
R126i.w = clampFI32(R126i.w);
R127i.z = floatBitsToInt(-(intBitsToFloat(R13i.w)) * intBitsToFloat(0x3d23d70a) + intBitsToFloat(0x3d23d70a));
// 1
R123i.x = floatBitsToInt(intBitsToFloat(R123i.y) * 25.0 + intBitsToFloat(R12i.y));
R124i.y = floatBitsToInt(max(intBitsToFloat(R4i.x), intBitsToFloat(PV0iz)));
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.w)),intBitsToFloat(R0i.x)) + intBitsToFloat(R0i.x));
R126i.z = clampFI32(R126i.z);
R127i.w = floatBitsToInt(min(intBitsToFloat(R4i.x), intBitsToFloat(PV0ix)));
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R5i.z));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R124i.y) + intBitsToFloat(0x2edbe6ff));
R126i.y = floatBitsToInt(intBitsToFloat(R4i.y) + -(intBitsToFloat(R124i.y)));
R125i.z = floatBitsToInt(intBitsToFloat(R4i.x) + -(intBitsToFloat(R124i.y)));
R124i.w = floatBitsToInt(intBitsToFloat(R4i.z) + -(intBitsToFloat(R124i.y)));
R4i.x = floatBitsToInt(-(intBitsToFloat(R123i.x)) + uf_blockPS6[52].x);
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(0x80000000)),vec4(uf_blockPS6[42].x,uf_blockPS6[42].y,uf_blockPS6[42].z,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(PV1ix)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R2i.x)));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)),intBitsToFloat(PS1i)) + 1.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R0i.z)) + intBitsToFloat(R0i.z));
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R127i.y)));
// 5
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(PV0ix)));
R127i.y = floatBitsToInt(intBitsToFloat(R123i.z) + intBitsToFloat(0x2edbe6ff));
PV1iz = floatBitsToInt(intBitsToFloat(R123i.z) + intBitsToFloat(R6i.z));
PV1iz = clampFI32(PV1iz);
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R12i.z)));
R0i.z = floatBitsToInt(exp2(intBitsToFloat(R5i.x)));
// 6
R126i.x = floatBitsToInt(intBitsToFloat(R5i.w) + intBitsToFloat(R3i.w));
PV0iy = floatBitsToInt(intBitsToFloat(R17i.z) + -(intBitsToFloat(R127i.x)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.w),intBitsToFloat(R16i.x)) + intBitsToFloat(R127i.z));
R125i.w = floatBitsToInt(-(intBitsToFloat(R11i.z)) + 1.0);
tempResultf = max(0.0, intBitsToFloat(PV1iz));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 7
backupReg0i = R127i.z;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PS0i)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R11i.w)) + intBitsToFloat(R127i.x));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.w),intBitsToFloat(R16i.y)) + intBitsToFloat(backupReg0i));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.w),intBitsToFloat(R16i.z)) + intBitsToFloat(backupReg0i));
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 8
R11i.x = floatBitsToInt(intBitsToFloat(R11i.x) * intBitsToFloat(0x3dcccccd) + intBitsToFloat(R126i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS10[3].z,intBitsToFloat(R123i.y)) + uf_blockPS10[1].y);
R123i.y = clampFI32(R123i.y);
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),-(intBitsToFloat(R125i.y))) + intBitsToFloat(R124i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w),-(intBitsToFloat(R5i.w))) + intBitsToFloat(R6i.w));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
// 9
backupReg0i = R127i.w;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R123i.y)));
R127i.y = floatBitsToInt(intBitsToFloat(R5i.w) + intBitsToFloat(R123i.w));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PS0i)));
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS10[2].w, uf_blockPS10[2].w));
R126i.z = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 10
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1ix)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),-(intBitsToFloat(R125i.x))) + intBitsToFloat(R127i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),-(intBitsToFloat(R125i.y))) + intBitsToFloat(R127i.z));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(backupReg0i)));
R1i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.w)),intBitsToFloat(R125i.w)) + intBitsToFloat(R125i.w));
// 11
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R7i.w)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(PV0iw)) + intBitsToFloat(R124i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(PV0iw)) + intBitsToFloat(R124i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(PV0iw)) + intBitsToFloat(R124i.y));
R124i.x = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 12
backupReg0i = R124i.z;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.x), intBitsToFloat(R123i.w)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),-(intBitsToFloat(R125i.y))) + intBitsToFloat(R3i.w));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.x), intBitsToFloat(R123i.y)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.x), intBitsToFloat(R123i.z)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),-(intBitsToFloat(R125i.x))) + intBitsToFloat(backupReg0i));
// 13
backupReg0i = R126i.z;
PV1ix = floatBitsToInt(intBitsToFloat(R8i.y) + -(intBitsToFloat(R124i.w)));
PV1iy = floatBitsToInt(intBitsToFloat(R8i.x) + -(intBitsToFloat(R126i.x)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),-(intBitsToFloat(R125i.x))) + intBitsToFloat(R3i.w));
PV1iw = floatBitsToInt(intBitsToFloat(R8i.z) + -(intBitsToFloat(R124i.z)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(backupReg0i)));
// 14
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(R11i.y)) + intBitsToFloat(R124i.z));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(R11i.y)) + intBitsToFloat(R124i.w));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R11i.y)) + intBitsToFloat(R126i.x));
R124i.w = floatBitsToInt(-(intBitsToFloat(R11i.x)) + 1.0);
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS10[1].x, intBitsToFloat(R127i.x)));
// 15
backupReg0i = R127i.z;
R126i.x = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(R6i.z));
R126i.y = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(R126i.y));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R127i.w)));
R127i.w = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(backupReg0i));
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 16
backupReg0i = R125i.x;
backupReg1i = R124i.y;
R125i.x = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(R126i.z));
R124i.y = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(R1i.y));
R126i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(backupReg1i));
PV0iw = floatBitsToInt(0.25 * intBitsToFloat(R124i.x));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(R18i.z)) + intBitsToFloat(R11i.x));
// 17
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R8i.y)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R127i.z)));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV0iw)));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0iw)));
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV0iw)));
// 18
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(R126i.z)));
R8i.y = floatBitsToInt(intBitsToFloat(R16i.x) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R8i.y = clampFI32(R8i.y);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(R125i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(R124i.y)));
R1i.y = floatBitsToInt(intBitsToFloat(R16i.y) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R1i.y = clampFI32(R1i.y);
// 19
backupReg0i = R9i.x;
backupReg1i = R9i.y;
backupReg2i = R9i.z;
R9i.x = floatBitsToInt(intBitsToFloat(R16i.z) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R9i.x = clampFI32(R9i.x);
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0ix)));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), intBitsToFloat(PV0iw)));
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R127i.x)));
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg2i), intBitsToFloat(PV0iz)));
// 20
backupReg0i = R10i.x;
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(R124i.z)));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R124i.z)));
R8i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(R124i.z)));
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z),-(intBitsToFloat(R0i.w))) + intBitsToFloat(R11i.z));
}
if( activeMaskStackC[1] == true ) {
// 0
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),uf_blockPS6[15].x) + uf_blockPS6[14].w);
R123i.w = clampFI32(R123i.w);
// 1
PV1ix = floatBitsToInt(uf_blockPS6[1].z + -(1.0));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), uf_blockPS6[13].w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y), uf_blockPS6[1].w));
// 2
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(R12i.z)));
PV0iy = floatBitsToInt(uf_blockPS6[1].y + -(1.0));
PV0iz = floatBitsToInt(uf_blockPS6[1].x + -(1.0));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), uf_blockPS6[16].w));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(R127i.w)) + 1.0);
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].x, intBitsToFloat(R1i.x)));
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].y, intBitsToFloat(R1i.x)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R127i.w)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R127i.w)) + 1.0);
PS1i = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].z, intBitsToFloat(R1i.x)));
// 4
backupReg0i = R123i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z),intBitsToFloat(R123i.w)) + intBitsToFloat(PV1ix));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y), intBitsToFloat(R124i.w)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R127i.y)) + intBitsToFloat(PS1i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV1iy));
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.x)),intBitsToFloat(R1i.z)) + intBitsToFloat(R1i.z));
// 5
backupReg0i = R127i.x;
backupReg1i = R123i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R125i.y)));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R13i.w)),intBitsToFloat(R123i.x)) + intBitsToFloat(R123i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R13i.w)),intBitsToFloat(R123i.w)) + intBitsToFloat(R123i.w));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R1i.z)));
R124i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R13i.w)),intBitsToFloat(backupReg1i)) + intBitsToFloat(backupReg1i));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].z, intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].y, intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].x, intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R8i.y)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(R1i.y)));
// 7
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].z,intBitsToFloat(backupReg0i)) + intBitsToFloat(PV0ix));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R9i.x)));
R123i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].y,intBitsToFloat(backupReg0i)) + intBitsToFloat(PV0iy));
R123i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].x,intBitsToFloat(backupReg0i)) + intBitsToFloat(PV0iz));
R125i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
// 8
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(R12i.x)) + intBitsToFloat(R123i.w));
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].z, intBitsToFloat(R11i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].y, intBitsToFloat(R3i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].x, intBitsToFloat(R6i.z)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x),intBitsToFloat(R12i.x)) + intBitsToFloat(R123i.z));
// 9
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R7i.w)) + intBitsToFloat(R9i.z));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),intBitsToFloat(R12i.x)) + intBitsToFloat(R127i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R7i.w)) + intBitsToFloat(R9i.y));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R7i.w)) + intBitsToFloat(R6i.w));
R122i.x = floatBitsToInt(intBitsToFloat(R124i.z) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
// 10
backupReg0i = R127i.y;
backupReg1i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(R123i.x) + intBitsToFloat(R122i.x));
R127i.y = floatBitsToInt(intBitsToFloat(R123i.z) + intBitsToFloat(R125i.x));
R123i.z = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].x,intBitsToFloat(R0i.w)) + intBitsToFloat(backupReg1i));
R125i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].y,intBitsToFloat(R0i.w)) + intBitsToFloat(R126i.z));
// 11
backupReg0i = R126i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].z,intBitsToFloat(R0i.w)) + intBitsToFloat(R124i.y));
R126i.y = ((1.0 > uf_blockPS8[37].x)?-1:0);
PV1iz = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(R123i.z));
R122i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)),intBitsToFloat(R125i.y)) + intBitsToFloat(R125i.y));
// 12
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R122i.x),intBitsToFloat(R127i.y)) + intBitsToFloat(R127i.w));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R122i.x), intBitsToFloat(R122i.x)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R122i.x),intBitsToFloat(PV1iz)) + intBitsToFloat(R123i.x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R122i.x),intBitsToFloat(R126i.x)) + intBitsToFloat(R125i.w));
R0i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS8[37].x, intBitsToFloat(R16i.w)));
// 13
PV1ix = floatBitsToInt(-(intBitsToFloat(R127i.w)) * 0.25);
PV1iy = floatBitsToInt(-(intBitsToFloat(R125i.x)) * 0.25);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.x), intBitsToFloat(R127i.y)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R124i.z)) * 0.25);
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y), intBitsToFloat(R127i.y)));
// 14
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3fb8aa3b));
R127i.y = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3fb8aa3b));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3fb8aa3b));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.z), intBitsToFloat(backupReg0i)));
R126i.z = floatBitsToInt(-(intBitsToFloat(R125i.z)) * intBitsToFloat(0x3fb8aa3b));
// 15
R127i.x = floatBitsToInt(-(intBitsToFloat(R124i.x)) * intBitsToFloat(0x3fb8aa3b));
R127i.z = floatBitsToInt(-(intBitsToFloat(R125i.w)) * intBitsToFloat(0x3fb8aa3b));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
// 16
PV0ix = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 4.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(R126i.x)));
// 17
R125i.x = ((R126i.y == 0)?(R125i.x):(PV0ix));
PV1iw = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 4.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(R127i.y)));
// 18
PV0iz = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 4.0);
R127i.w = ((R126i.y == 0)?(R127i.w):(PV1iw));
PS0i = floatBitsToInt(exp2(intBitsToFloat(R126i.z)));
// 19
PV1ix = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R124i.z = ((R126i.y == 0)?(R124i.z):(PV0iz));
PS1i = floatBitsToInt(exp2(intBitsToFloat(R127i.x)));
// 20
R123i.y = ((R126i.y == 0)?(R125i.z):(PV1ix));
PV0iw = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(R127i.z)));
// 21
R123i.x = ((R126i.y == 0)?(R124i.x):(PV0iw));
PV1iz = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R0i.x = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(R123i.y));
// 22
R0i.y = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R123i.x));
R123i.w = ((R126i.y == 0)?(R125i.w):(PV1iz));
// 23
R0i.z = floatBitsToInt(intBitsToFloat(R124i.z) + intBitsToFloat(R123i.w));
}
// export
passPixelColor0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
}
