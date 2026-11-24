#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;

vec4 zmCube(sampler2DArray s, vec2 st, int face, float cubeIndex, float lod) {
	return textureLod(s, vec3(st - 1.0, float(face) + cubeIndex * 6.0), lod);
}
// shader cd945adca16237b6
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform vec2 uf_fragCoordScale;
UNIFORM_BUFFER_LAYOUT(33, 1, 15) uniform uniformBlockPS1
{
vec4 uf_blockPS1[4096];
};


UNIFORM_BUFFER_LAYOUT(36, 1, 16) uniform uniformBlockPS4
{
vec4 uf_blockPS4[7];
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
TEXTURE_LAYOUT(8, 1, 8) uniform sampler3D textureUnitPS8;
TEXTURE_LAYOUT(9, 1, 9) uniform sampler2DArray textureUnitPS9;
TEXTURE_LAYOUT(10, 1, 10) uniform sampler2D textureUnitPS10;
TEXTURE_LAYOUT(11, 1, 11) uniform sampler2D textureUnitPS11;
TEXTURE_LAYOUT(12, 1, 12) uniform sampler2D textureUnitPS12;
TEXTURE_LAYOUT(13, 1, 13) uniform sampler2D textureUnitPS13;
in vec4 passParameterSem0;
in vec4 passParameterSem2;
in vec4 passParameterSem3;
in vec4 passParameterSem5;
in vec4 passParameterSem6;
in vec4 passParameterSem7;
in vec4 passParameterSem8;
in vec4 passParameterSem9;
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
R2i = floatBitsToInt(passParameterSem3);
R3i = floatBitsToInt(passParameterSem5);
R4i = floatBitsToInt(passParameterSem6);
R5i = floatBitsToInt(passParameterSem7);
R6i = floatBitsToInt(passParameterSem8);
R7i = floatBitsToInt(passParameterSem9);
if( activeMaskStackC[1] == true ) {
R8i.xy = floatBitsToInt(texture(textureUnitPS11, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xy);
R9i.xyz = floatBitsToInt(texture(textureUnitPS12, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
R14i.xyz = floatBitsToInt(texture(textureUnitPS10, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
}
if( activeMaskStackC[1] == true ) {
// 0
R127i.x = ((-(intBitsToFloat(R6i.z)) > uf_blockPS1[58].y)?-1:0);
R127i.y = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(R3i.x));
R127i.z = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(R3i.y));
PV0iw = ((-(intBitsToFloat(R6i.z)) > uf_blockPS1[58].x)?-1:0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R7i.w));
// 1
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(PS0i)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PS0i)));
PV1iz = PV0iw & int(1);
R127i.w = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(R3i.z));
R3i.z = floatBitsToInt(intBitsToFloat(R8i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
// 2
R123i.x = floatBitsToInt(intBitsToFloat(R8i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R11i.y = PV1iz - R127i.x;
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R3i.z)));
R5i.w = 0;
R3i.w = 0;
// 3
PV1ix = R11i.y << 0x2;
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(R123i.x)));
R7i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.z)),uf_blockPS8[31].y) + uf_blockPS8[31].z);
R7i.z = clampFI32(R7i.z);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(R123i.x)) + intBitsToFloat(PV0iz));
R123i.w = clampFI32(R123i.w);
R11i.x = floatBitsToInt(intBitsToFloat(R9i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
// 4
R8i.x = PV1ix + 0x2d;
R8i.y = PV1ix + 0x2b;
R1i.z = PV1ix + 0x2a;
R7i.w = PV1ix + 0x2c;
PS0i = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R7i.y = floatBitsToInt(sqrt(intBitsToFloat(PS0i)));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 7
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R5i.y = floatBitsToInt(intBitsToFloat(R9i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PS0i)));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
R3i.x = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
}
if( activeMaskStackC[1] == true ) {
R10i.xyzw = floatBitsToInt(uf_blockPS1[R8i.x].xyzw);
R13i.xyzw = floatBitsToInt(uf_blockPS1[R7i.w].xyzw);
R8i.xyzw = floatBitsToInt(uf_blockPS1[R8i.y].xyzw);
R12i.xyzw = floatBitsToInt(uf_blockPS1[R1i.z].xyzw);
R15i.xy = floatBitsToInt(texture(textureUnitPS6, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y))).xy);
}
if( activeMaskStackC[1] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R5i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R1i.w)));
R1i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].z, uf_blockPS10[2].w));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R7i.x)));
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(R3i.x));
// 1
backupReg0i = R127i.w;
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.x)),intBitsToFloat(R1i.w)) + intBitsToFloat(PV0iw));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.z)),intBitsToFloat(R7i.x)) + intBitsToFloat(PV0ix));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.y)),intBitsToFloat(R5i.z)) + intBitsToFloat(PV0iy));
R126i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].x, uf_blockPS10[2].w));
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(backupReg0i)));
// 2
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R3i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(R127i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(R127i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R127i.y)));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R127i.w)));
// 3
backupReg0i = R127i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.w)),intBitsToFloat(R127i.x)) + intBitsToFloat(PV0iw));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.x)),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV0iy));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R127i.w)));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.z)),intBitsToFloat(R127i.z)) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R3i.y)));
// 4
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R123i.w)) + intBitsToFloat(PS1i));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(backupReg0i)) + intBitsToFloat(R126i.x));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R3i.y)));
R127i.w = floatBitsToInt(intBitsToFloat(R9i.x) + uf_blockPS6[4].x);
R126i.y = floatBitsToInt(intBitsToFloat(R9i.y) + uf_blockPS6[4].y);
// 5
backupReg0i = R127i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(R7i.x)) + intBitsToFloat(R123i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(R1i.w)) + intBitsToFloat(R123i.x));
R127i.z = floatBitsToInt(intBitsToFloat(R11i.z) + uf_blockPS6[4].z);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV0iz));
R124i.w = floatBitsToInt(intBitsToFloat(R9i.z) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
// 6
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R13i.x)));
R125i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].y, uf_blockPS10[2].w));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(R5i.z)) + intBitsToFloat(R123i.w));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R10i.x)));
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.y)),intBitsToFloat(R9i.y)) + 1.0);
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.w),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.w),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R10i.y)) + intBitsToFloat(PV0iw));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 9
backupReg0i = R127i.z;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R8i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PS0i)));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
R126i.x = floatBitsToInt(tempResultf);
// 10
backupReg0i = R127i.x;
backupReg1i = R127i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), uf_blockPS10[2].w));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), uf_blockPS10[2].w));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), uf_blockPS10[2].w));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R126i.x)));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), intBitsToFloat(R126i.x)));
// 11
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R12i.x)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R8i.y)) + intBitsToFloat(R127i.z));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(backupReg0i)));
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)),intBitsToFloat(R125i.y)) + 1.0);
R7i.x = R126i.w;
// 12
tempi.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R127i.x)),-(intBitsToFloat(R127i.y)),-(intBitsToFloat(R125i.z)),-(intBitsToFloat(R3i.w))),vec4(intBitsToFloat(R1i.w),intBitsToFloat(R7i.y),intBitsToFloat(R5i.z),intBitsToFloat(R5i.z))));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R8i.z)) + intBitsToFloat(R123i.y));
// 13
tempi.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R126i.w)),-(intBitsToFloat(R125i.y)),-(intBitsToFloat(R1i.z)),-(intBitsToFloat(R5i.w))),vec4(intBitsToFloat(R1i.w),intBitsToFloat(R7i.y),intBitsToFloat(R5i.z),intBitsToFloat(R5i.z))));
PV1ix = tempi.x;
R8i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(R125i.x));
R125i.w = floatBitsToInt(tempResultf);
// 14
R8i.x = floatBitsToInt(intBitsToFloat(R8i.w) + intBitsToFloat(R127i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R10i.z)) + intBitsToFloat(R124i.z));
R125i.z = 0;
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.y)));
tempResultf = 1.0 / sqrt(intBitsToFloat(R127i.w));
R127i.y = floatBitsToInt(tempResultf);
// 15
backupReg0i = R126i.x;
backupReg1i = R123i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R13i.y)) + intBitsToFloat(R124i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.z)),intBitsToFloat(PV0iw)) + intBitsToFloat(PV0iw));
R123i.y = clampFI32(R123i.y);
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R12i.y)) + intBitsToFloat(backupReg0i));
R10i.w = floatBitsToInt(intBitsToFloat(R10i.w) + intBitsToFloat(backupReg1i));
R126i.y = R1i.z;
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R11i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.w),intBitsToFloat(R125i.y),intBitsToFloat(R1i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R7i.w = tempi.x;
tempResultf = max(0.0, intBitsToFloat(R123i.y));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R1i.z = floatBitsToInt(tempResultf);
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R11i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.w),intBitsToFloat(R7i.y),intBitsToFloat(R5i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(max(-(intBitsToFloat(PV0ix)), 0.0));
// 18
backupReg0i = R127i.y;
PV0ix = floatBitsToInt(min(intBitsToFloat(PS1i), 1.0));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R13i.z)) + intBitsToFloat(R126i.x));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R125i.w)));
R0i.w = floatBitsToInt(intBitsToFloat(PV1ix) + 1.0);
R0i.w = clampFI32(R0i.w);
R10i.x = floatBitsToInt(-(intBitsToFloat(R6i.z)) * intBitsToFloat(0x3d4ccccd));
// 19
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R0i.w)) + intBitsToFloat(R5i.y));
R123i.x = clampFI32(R123i.x);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(PV0ix)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R0i.w)) + intBitsToFloat(R11i.x));
R123i.z = clampFI32(R123i.z);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R0i.w)) + intBitsToFloat(R124i.w));
R123i.w = clampFI32(R123i.w);
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R12i.z)) + intBitsToFloat(R124i.z));
// 20
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(PV1iy)));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(PV1iy)));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(PV1iy)));
R12i.w = floatBitsToInt(intBitsToFloat(R12i.w) + intBitsToFloat(R122i.x));
R12i.y = floatBitsToInt(intBitsToFloat(R13i.w) + intBitsToFloat(R127i.y));
// 21
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R11i.z),intBitsToFloat(R11i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R7i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R6i.w = 0x3f800000;
// 22
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV1ix)));
R5i.w = R15i.x;
R5i.w = clampFI32(R5i.w);
R3i.w = floatBitsToInt(-(intBitsToFloat(R6i.z)) * intBitsToFloat(0x3d4ccccd) + -3.5);
R3i.w = clampFI32(R3i.w);
}
if( activeMaskStackC[1] == true ) {
// 0
R126i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS8[32].x, intBitsToFloat(R1i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), uf_blockPS6[44].x));
R13i.z = floatBitsToInt(-(intBitsToFloat(R6i.z)) * intBitsToFloat(0x3c23d70a) + -(0.5));
R13i.z = clampFI32(R13i.z);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R10i.w));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), uf_blockPS6[43].x));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(PS0i)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(PS0i)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),uf_blockPS6[44].y) + intBitsToFloat(PV0iy));
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.w), intBitsToFloat(PS0i)));
// 2
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), uf_blockPS6[45].x));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),uf_blockPS6[43].y) + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(exp2(intBitsToFloat(R126i.x)));
// 3
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),uf_blockPS6[44].z) + intBitsToFloat(R124i.w));
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockPS8[32].y, intBitsToFloat(PS0i)));
R4i.z = floatBitsToInt(float(R11i.y));
// 4
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),uf_blockPS6[43].z) + intBitsToFloat(R125i.w));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV1iy)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),uf_blockPS6[45].y) + intBitsToFloat(R127i.z));
// 5
backupReg0i = R12i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS8[31].w,intBitsToFloat(R13i.y)) + intBitsToFloat(PV0iz));
R123i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS8[31].w,intBitsToFloat(R12i.x)) + intBitsToFloat(PV0iz));
R12i.z = floatBitsToInt(uf_blockPS6[44].w + intBitsToFloat(R126i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS8[31].w,intBitsToFloat(backupReg0i)) + intBitsToFloat(PV0iz));
// 6
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),uf_blockPS6[45].z) + intBitsToFloat(R125i.w));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.z),intBitsToFloat(R123i.y)) + intBitsToFloat(R14i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.x),intBitsToFloat(backupReg0i)) + intBitsToFloat(R14i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y),intBitsToFloat(R123i.w)) + intBitsToFloat(R14i.y));
R4i.x = floatBitsToInt(uf_blockPS6[43].w + intBitsToFloat(R124i.x));
// 7
backupReg0i = R10i.x;
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R123i.z)));
R4i.y = R12i.z;
R15i.z = floatBitsToInt(uf_blockPS6[45].w + intBitsToFloat(R123i.x));
R4i.w = floatBitsToInt(-(uf_blockPS6[53].z) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(backupReg0i));
R4i.w = clampFI32(R4i.w);
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R123i.w)));
// 8
backupReg0i = R5i.x;
R5i.x = floatBitsToInt(fract(uf_blockPS8[36].w));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R126i.y)));
}
if( activeMaskStackC[1] == true ) {
// 0
R6i.x = floatBitsToInt(uf_blockPS1[0].y);
R11i.y = floatBitsToInt(uf_blockPS1[1].y);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), uf_blockPS1[11].z));
R8i.z = floatBitsToInt(uf_blockPS1[2].y);
// 2
R7i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.w),intBitsToFloat(R7i.y),intBitsToFloat(PV1ix),intBitsToFloat(0x80000000)),vec4(uf_blockPS1[11].x,uf_blockPS1[11].y,1.0,0.0)));
PV0iy = R7i.x;
PV0iz = R7i.x;
PV0iw = R7i.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), uf_blockPS1[12].z));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.w),intBitsToFloat(R7i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(uf_blockPS1[12].x,uf_blockPS1[12].y,1.0,0.0)));
PV1ix = tempi.x;
R5i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), uf_blockPS1[13].z));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.w),intBitsToFloat(R7i.y),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(uf_blockPS1[13].x,uf_blockPS1[13].y,1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R5i.z = tempi.x;
PV0iw = tempi.x;
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R7i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS4[6].x, uf_blockPS8[37].x));
// 1
predResult = (intBitsToFloat(R5i.x) > 0.0);
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
R1i.xyz = floatBitsToInt(texture(textureUnitPS9, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z))).xyz);
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R10i.y)) + intBitsToFloat(R1i.y));
PV0iy = floatBitsToInt(-(intBitsToFloat(R10i.x)) + intBitsToFloat(R1i.x));
PV0iw = floatBitsToInt(-(intBitsToFloat(R10i.z)) + intBitsToFloat(R1i.z));
// 1
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R5i.x)) + intBitsToFloat(R10i.x));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R5i.x)) + intBitsToFloat(R10i.y));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R5i.x)) + intBitsToFloat(R10i.z));
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
R1i.w = 0;
}
if( activeMaskStackC[2] == true ) {
R1i.w = floatBitsToInt(texture(textureUnitPS8, vec3(intBitsToFloat(R1i.w),intBitsToFloat(R1i.w),intBitsToFloat(R1i.w))).x);
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R1i.w)) + 1.0);
PV0iy = floatBitsToInt(intBitsToFloat(R10i.z) * intBitsToFloat(0x3dea4a8c));
tempResultf = max(0.0, intBitsToFloat(R0i.w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R127i.w = floatBitsToInt(tempResultf);
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(PV0iy),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R126i.w = tempi.x;
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
R127i.x = floatBitsToInt(intBitsToFloat(R127i.w) * 2.5);
R127i.y = floatBitsToInt(0.5 * intBitsToFloat(PV1ix) + intBitsToFloat(0x3dcccccd));
PV0iz = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3fa66666));
// 3
R126i.x = floatBitsToInt(intBitsToFloat(0x3f266666) * intBitsToFloat(R126i.w) + intBitsToFloat(0x3eb33333));
R126i.y = floatBitsToInt(intBitsToFloat(0x3f19999a) * intBitsToFloat(R126i.w) + intBitsToFloat(0x3e4ccccd));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3e4ccccd));
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 0.25);
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.y)) + intBitsToFloat(0x3e851eb8));
PV0iw = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(0x3e23d70a));
PS0i = floatBitsToInt(exp2(intBitsToFloat(R127i.x)));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(PV0ix)) + intBitsToFloat(R127i.y));
PV1iy = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(PV0ix));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(PV0ix)) + intBitsToFloat(R126i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(PV0ix)) + intBitsToFloat(R126i.y));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R123i.x) + intBitsToFloat(PV1iy));
PV0ix = clampFI32(PV0ix);
PV0iz = floatBitsToInt(intBitsToFloat(R123i.z) + intBitsToFloat(PV1iy));
PV0iz = clampFI32(PV0iz);
PV0iw = floatBitsToInt(intBitsToFloat(R123i.w) + intBitsToFloat(PV1iy));
PV0iw = clampFI32(PV0iw);
// 7
PV1ix = floatBitsToInt(-(intBitsToFloat(R10i.y)) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(-(intBitsToFloat(R10i.x)) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(-(intBitsToFloat(R10i.z)) + intBitsToFloat(PV0iz));
// 8
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),uf_blockPS8[33].w) + intBitsToFloat(R10i.x));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),uf_blockPS8[33].w) + intBitsToFloat(R10i.y));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),uf_blockPS8[33].w) + intBitsToFloat(R10i.z));
// 9
R1i.w = R6i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R1i.w = 0;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
R14i.z = floatBitsToInt(texture(textureUnitPS13, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).w);
}
if( activeMaskStackC[1] == true ) {
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),uf_blockPS6[39].z) + -(uf_blockPS6[39].x));
R123i.y = floatBitsToInt(intBitsToFloat(R5i.y) * 2.0 + -(1.0));
PV0iz = floatBitsToInt(-(intBitsToFloat(R4i.y)) + uf_blockPS6[39].w);
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.z),uf_blockPS6[39].z) + -(uf_blockPS6[39].y));
// 1
R1i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.w)),intBitsToFloat(R123i.y)) + intBitsToFloat(PV0iz));
R1i.y = floatBitsToInt(intBitsToFloat(R3i.w) + uf_blockPS10[3].y);
}
if( activeMaskStackC[1] == true ) {
R0i.y = floatBitsToInt(textureLod(textureUnitPS4, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.w)),0.0).x);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
PV0iw = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(0x3fa66666));
// 1
R123i.z = floatBitsToInt(mul_nonIEEE(-(uf_blockPS6[39].w),intBitsToFloat(R0i.y)) + intBitsToFloat(PV0iw));
// 2
R127i.y = floatBitsToInt(intBitsToFloat(R123i.z) * 0.25);
R127i.y = clampFI32(R127i.y);
// 3
PV1ix = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
// 4
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)),intBitsToFloat(PV1ix)) + intBitsToFloat(PV1ix));
// 5
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)),intBitsToFloat(R123i.w)) + intBitsToFloat(R123i.w));
// 6
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
// 7
R8i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R1i.y)) + intBitsToFloat(R127i.z));
R8i.w = clampFI32(R8i.w);
// 8
predResult = (1.0 > intBitsToFloat(R4i.w));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R0i.z = floatBitsToInt(intBitsToFloat(R3i.z) + intBitsToFloat(0xbb03126f));
R3i.z = floatBitsToInt(roundEven(intBitsToFloat(R4i.z)));
// 1
R3i.w = floatBitsToInt(-(intBitsToFloat(R4i.z)) * intBitsToFloat(0x3a03126f) + intBitsToFloat(R0i.z));
R3i.w = clampFI32(R3i.w);
}
if( activeMaskStackC[2] == true ) {
R0i.x = floatBitsToInt(texture(textureUnitPS2, vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w))));
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R0i.x)) + 1.0);
// 1
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R4i.w)) + intBitsToFloat(R0i.x));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.z)),uf_blockPS6[26].x) + -(uf_blockPS6[26].y));
R127i.x = clampFI32(R127i.x);
R0i.y = floatBitsToInt(intBitsToFloat(R5i.y) + 1.0);
R0i.z = floatBitsToInt(-(intBitsToFloat(R5i.z)));
R0i.w = 0x40400000;
R1i.w = 0x3f800000;
// 1
redcCUBE(vec4(intBitsToFloat(R0i.z),intBitsToFloat(R0i.z),intBitsToFloat(R7i.x),intBitsToFloat(R0i.y)),vec4(intBitsToFloat(R0i.y),intBitsToFloat(R7i.x),intBitsToFloat(R0i.z),intBitsToFloat(R0i.z)),cubeMapSTM,cubeMapFaceId);
R126i.x = floatBitsToInt(cubeMapSTM.x);
R126i.y = floatBitsToInt(cubeMapSTM.y);
R126i.z = floatBitsToInt(cubeMapSTM.z);
R126i.w = cubeMapFaceId;
R1i.z = floatBitsToInt(-(intBitsToFloat(R6i.z)) * intBitsToFloat(0x3ba3d70a));
// 2
R1i.x = floatBitsToInt(intBitsToFloat(R4i.x) * intBitsToFloat(0x3a83126f));
R1i.y = floatBitsToInt(intBitsToFloat(R15i.z) * intBitsToFloat(0x3a83126f));
R0i.z = R126i.w;
R127i.w = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
PS0i = floatBitsToInt(1.0 / abs(intBitsToFloat(R126i.z)));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(R7i.w) + -(intBitsToFloat(R9i.z)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PS0i)) + 1.5);
R3i.z = R1i.z;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(PS0i)) + 1.5);
tempResultf = max(0.0, intBitsToFloat(R127i.w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R125i.z = floatBitsToInt(tempResultf);
// 4
R0i.x = R123i.w;
R0i.y = R123i.y;
R127i.z = floatBitsToInt(-(intBitsToFloat(R5i.y)) * 0.5 + 0.5);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(R127i.w)) + intBitsToFloat(R9i.z));
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].y, intBitsToFloat(R125i.z)));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R15i.z),intBitsToFloat(R1i.w)),vec4(uf_blockPS1[37].x,uf_blockPS1[37].y,uf_blockPS1[37].z,uf_blockPS1[37].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.z = floatBitsToInt(max(-(intBitsToFloat(R123i.w)), intBitsToFloat(0xbf7d70a4)));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) / 2.0);
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R15i.z),intBitsToFloat(R1i.w)),vec4(uf_blockPS1[35].x,uf_blockPS1[35].y,uf_blockPS1[35].z,uf_blockPS1[35].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R15i.z),intBitsToFloat(R1i.w)),vec4(uf_blockPS1[36].x,uf_blockPS1[36].y,uf_blockPS1[36].z,uf_blockPS1[36].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R126i.y)));
// 8
PV0ix = floatBitsToInt(intBitsToFloat(R127i.z) + 2.5);
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R126i.y)));
PV0iz = floatBitsToInt(-(uf_blockPS6[27].w) + 1.0);
R127i.w = floatBitsToInt(intBitsToFloat(R126i.z) + 0.5);
PS0i = floatBitsToInt(exp2(intBitsToFloat(R127i.y)));
// 9
R4i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3daaaaab));
R4i.y = 0;
PV1iz = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
R123i.w = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
R122i.x = floatBitsToInt((mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(PS0i)) + uf_blockPS6[27].w)/2.0);
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.z)),uf_blockPS6[28].x) + -(uf_blockPS6[28].y));
R123i.x = clampFI32(R123i.x);
R5i.y = floatBitsToInt(intBitsToFloat(R122i.x) + 0.5);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R123i.w)) + intBitsToFloat(0xbe593484));
R3i.w = floatBitsToInt(intBitsToFloat(R8i.w) * intBitsToFloat(0xbdcccccd) + intBitsToFloat(0x3dcccccd));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1iz)));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f22f983));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R123i.z)) + intBitsToFloat(0x3fc90da4));
PV1iz = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
R1i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].x, intBitsToFloat(R125i.z)));
PS1i = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(0xbe99999a));
// 12
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),-(intBitsToFloat(R123i.y))) + 1.0);
R7i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.z)),uf_blockPS6[18].x) + uf_blockPS6[17].w);
R7i.y = clampFI32(R7i.y);
R6i.z = floatBitsToInt(intBitsToFloat(0xbf59999a) * intBitsToFloat(R15i.y) + 1.0);
R4i.w = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x40200001));
R4i.w = clampFI32(R4i.w);
tempResultf = max(0.0, intBitsToFloat(PV1iz));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R6i.y = floatBitsToInt(tempResultf);
}
if( activeMaskStackC[1] == true ) {
R0i.xyz = floatBitsToInt(zmCube(textureUnitPS1, intBitsToFloat(R0i.xy), R0i.z, cubeMapArrayIndex1, intBitsToFloat(R0i.w)).xyz);
R1i.x = floatBitsToInt(textureLod(textureUnitPS5, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y)),0.0).x);
R0i.w = floatBitsToInt(textureLod(textureUnitPS0, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y)),intBitsToFloat(R3i.z)).x);
R4i.xyz = floatBitsToInt(texture(textureUnitPS7, vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y))).xyz);
R5i.xyz = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y))).xyz);
}
if( activeMaskStackC[1] == true ) {
// 0
PV0ix = floatBitsToInt(min(intBitsToFloat(R0i.y), intBitsToFloat(R0i.z)));
R123i.y = floatBitsToInt(intBitsToFloat(R1i.x) * 2.0 + -(1.0));
PV0iz = floatBitsToInt(max(intBitsToFloat(R0i.y), intBitsToFloat(R0i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockPS6[29].x, intBitsToFloat(R6i.y)));
R126i.x = floatBitsToInt(exp2(intBitsToFloat(R1i.w)));
// 1
R1i.x = floatBitsToInt(intBitsToFloat(R123i.y) * 25.0 + intBitsToFloat(R12i.z));
R124i.y = floatBitsToInt(max(intBitsToFloat(R0i.x), intBitsToFloat(PV0iz)));
R125i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS10[3].z,intBitsToFloat(R6i.w)) + uf_blockPS10[1].y);
R125i.z = clampFI32(R125i.z);
R127i.w = floatBitsToInt(min(intBitsToFloat(R0i.x), intBitsToFloat(PV0ix)));
R127i.x = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R124i.y) + intBitsToFloat(0x2edbe6ff));
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].z,-(intBitsToFloat(R126i.x))) + uf_blockPS6[27].z);
R127i.z = R8i.y;
R127i.z = clampFI32(R127i.z);
R126i.w = floatBitsToInt(intBitsToFloat(R0i.w) + uf_blockPS10[1].z);
R126i.w = clampFI32(R126i.w);
tempResultf = max(0.0, intBitsToFloat(R7i.y));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R125i.w = floatBitsToInt(tempResultf);
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R11i.y),intBitsToFloat(R8i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R11i.z),0.0)));
tempi.x = clampFI32(tempi.x);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 4
R126i.x = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(0xbfe66666));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R6i.z)));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)),intBitsToFloat(PS1i)) + 1.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R125i.z)));
tempResultf = max(0.0, intBitsToFloat(PV1ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 5
backupReg0i = R125i.w;
R125i.x = floatBitsToInt(intBitsToFloat(R123i.z) + intBitsToFloat(0x2edbe6ff));
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[29].z, intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(intBitsToFloat(R123i.z) + intBitsToFloat(R3i.w));
PV1iz = clampFI32(PV1iz);
R125i.w = floatBitsToInt(intBitsToFloat(R4i.w) * intBitsToFloat(0x3dcccccd));
R125i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[18].y, intBitsToFloat(backupReg0i)));
// 6
R124i.x = floatBitsToInt(intBitsToFloat(R0i.y) + -(intBitsToFloat(R124i.y)));
R126i.y = R2i.x;
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) / 2.0);
R124i.z = floatBitsToInt(intBitsToFloat(R0i.x) + -(intBitsToFloat(R124i.y)));
R126i.w = floatBitsToInt(intBitsToFloat(R0i.z) + -(intBitsToFloat(R124i.y)));
tempResultf = max(0.0, intBitsToFloat(PV1iz));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 7
backupReg0i = R127i.y;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.w)));
R125i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.w)),intBitsToFloat(R126i.x)) + intBitsToFloat(R126i.x));
R125i.z = clampFI32(R125i.z);
R127i.w = floatBitsToInt(-(intBitsToFloat(R7i.y)) + 1.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(backupReg0i)));
// 8
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),intBitsToFloat(R126i.y)) + intBitsToFloat(R126i.y));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
R126i.z = floatBitsToInt(intBitsToFloat(R8i.w) * 0.5 + 0.5);
R123i.w = floatBitsToInt(mul_nonIEEE(-(uf_blockPS6[29].w),intBitsToFloat(PS1i)) + 1.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
// 9
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3e19999a) + intBitsToFloat(R127i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)),intBitsToFloat(R123i.w)) + intBitsToFloat(R123i.w));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PS0i)));
R125i.w = floatBitsToInt(intBitsToFloat(R4i.w) * intBitsToFloat(0x3dcccccd) + intBitsToFloat(R125i.z));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R125i.x));
// 10
backupReg0i = R125i.y;
R125i.x = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(R126i.z));
R125i.x = clampFI32(R125i.x);
R125i.y = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), uf_blockPS6[30].w));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(exp2(intBitsToFloat(backupReg0i)));
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(PV0iw)) + intBitsToFloat(R124i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PV0iw)) + intBitsToFloat(R124i.y));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(R6i.z)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(PV0iw)) + intBitsToFloat(R124i.y));
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), uf_blockPS6[16].w));
// 12
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R123i.w)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R123i.y)));
R2i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.z)),intBitsToFloat(R127i.w)) + intBitsToFloat(R127i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R123i.x)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R125i.x)));
// 13
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(intBitsToFloat(R4i.y) + -(intBitsToFloat(R127i.w)));
PV1iy = floatBitsToInt(intBitsToFloat(R4i.x) + -(intBitsToFloat(R127i.x)));
R124i.z = floatBitsToInt(intBitsToFloat(R4i.z) + -(intBitsToFloat(R124i.y)));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.y), intBitsToFloat(backupReg0i)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.y), uf_blockPS6[1].w));
// 14
PV0ix = floatBitsToInt(uf_blockPS6[1].z + -(1.0));
PV0iy = floatBitsToInt(uf_blockPS6[1].y + -(1.0));
PV0iz = floatBitsToInt(uf_blockPS6[1].x + -(1.0));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R5i.w)) + intBitsToFloat(R125i.w));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R13i.z)) + intBitsToFloat(R127i.x));
// 15
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R13i.z)) + intBitsToFloat(R124i.y));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R13i.z)) + intBitsToFloat(R127i.w));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R126i.w)) + 1.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R126i.w)) + 1.0);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R126i.w)) + 1.0);
// 16
PV0ix = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].z, intBitsToFloat(R124i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].y, intBitsToFloat(R124i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].x, intBitsToFloat(R124i.w)));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),-(intBitsToFloat(R0i.z))) + intBitsToFloat(R7i.y));
R127i.x = floatBitsToInt(intBitsToFloat(R10i.x) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R127i.x = clampFI32(R127i.x);
// 17
R123i.x = floatBitsToInt(intBitsToFloat(R10i.y) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R123i.x = clampFI32(R123i.x);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y)) + intBitsToFloat(PV0ix));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(R124i.z)) + intBitsToFloat(PV0iy));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iz));
R127i.z = floatBitsToInt(intBitsToFloat(R10i.z) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R127i.z = clampFI32(R127i.z);
// 18
backupReg0i = R5i.y;
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R125i.w)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R125i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R127i.x)));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R125i.w)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(R123i.x)));
// 19
R2i.x = ((1.0 > intBitsToFloat(R7i.z))?-1:0);
R7i.y = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R5i.z = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R127i.z)));
R8i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R14i.z)));
// 20
R4i.x = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
}
if( activeMaskStackC[1] == true ) {
// 0
PV0iw = floatBitsToInt(-(intBitsToFloat(R1i.x)) + uf_blockPS6[52].x);
// 1
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),uf_blockPS6[15].x) + uf_blockPS6[14].w);
R123i.y = clampFI32(R123i.y);
// 2
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), uf_blockPS6[13].w));
// 3
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(R6i.z)));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iw)),intBitsToFloat(R2i.z)) + intBitsToFloat(R2i.z));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R2i.z)));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].y, intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].z, intBitsToFloat(PV0iy)));
PV1iz = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].x, intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R123i.x)));
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.w)),intBitsToFloat(R123i.x)) + intBitsToFloat(R123i.x));
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].z,intBitsToFloat(PV1iw)) + intBitsToFloat(PV1iy));
R123i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].x,intBitsToFloat(PV1iw)) + intBitsToFloat(PV1iz));
R123i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].y,intBitsToFloat(PV1iw)) + intBitsToFloat(PV1ix));
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R3i.w)) + intBitsToFloat(R123i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R3i.w)) + intBitsToFloat(R123i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(R3i.w)) + intBitsToFloat(R123i.z));
// 8
backupReg0i = R123i.y;
R123i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].y,intBitsToFloat(R0i.z)) + intBitsToFloat(R123i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].z,intBitsToFloat(R0i.z)) + intBitsToFloat(R123i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].x,intBitsToFloat(R0i.z)) + intBitsToFloat(backupReg0i));
// 9
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R4i.x)) + intBitsToFloat(R123i.z));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R7i.y)) + intBitsToFloat(R123i.y));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R5i.z)) + intBitsToFloat(R123i.w));
// 10
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.x)) * 0.25);
PV0iz = floatBitsToInt(-(intBitsToFloat(R124i.y)) * 0.25);
PV0iw = floatBitsToInt(-(intBitsToFloat(R124i.z)) * 0.25);
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3fb8aa3b));
R125i.y = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3fb8aa3b));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3fb8aa3b));
// 12
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
// 13
PV1iz = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 4.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(R127i.z)));
// 14
R8i.x = ((R2i.x == 0)?(R124i.z):(PV1iz));
PV0iy = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 4.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(R125i.y)));
// 15
PV1ix = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 4.0);
R8i.y = ((R2i.x == 0)?(R124i.y):(PV0iy));
// 16
R8i.z = ((R2i.x == 0)?(R127i.x):(PV1ix));
}
// export
passPixelColor0 = vec4(intBitsToFloat(R8i.x), intBitsToFloat(R8i.y), intBitsToFloat(R8i.z), intBitsToFloat(R8i.w));
}
