#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;

vec4 zmCube(sampler2DArray s, vec2 st, int face, float cubeIndex, float lod) {
	return textureLod(s, vec3(st - 1.0, float(face) + cubeIndex * 6.0), lod);
}
// shader cfd06acea1c69c58
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
TEXTURE_LAYOUT(4, 1, 3) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(5, 1, 4) uniform sampler2D textureUnitPS5;
TEXTURE_LAYOUT(6, 1, 5) uniform sampler2D textureUnitPS6;
TEXTURE_LAYOUT(7, 1, 6) uniform sampler2D textureUnitPS7;
TEXTURE_LAYOUT(8, 1, 7) uniform sampler2D textureUnitPS8;
TEXTURE_LAYOUT(9, 1, 8) uniform sampler3D textureUnitPS9;
TEXTURE_LAYOUT(10, 1, 9) uniform sampler2DArray textureUnitPS10;
TEXTURE_LAYOUT(11, 1, 10) uniform sampler2D textureUnitPS11;
in vec4 passParameterSem0;
in vec4 passParameterSem2;
in vec4 passParameterSem4;
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
R3i = floatBitsToInt(passParameterSem6);
R4i = floatBitsToInt(passParameterSem7);
if( activeMaskStackC[1] == true ) {
R10i.xw = floatBitsToInt(texture(textureUnitPS11, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xw);
}
if( activeMaskStackC[1] == true ) {
// 0
R127i.x = ((-(intBitsToFloat(R3i.z)) > uf_blockPS1[58].y)?-1:0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), uf_blockPS6[44].x));
R10i.z = floatBitsToInt(-(intBitsToFloat(R3i.z)) * intBitsToFloat(0x3d4ccccd));
PV0iw = ((-(intBitsToFloat(R3i.z)) > uf_blockPS1[58].x)?-1:0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R4i.w));
// 1
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PS0i)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(PS0i)));
PV1iz = PV0iw & int(1);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), uf_blockPS6[43].x));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),uf_blockPS6[44].y) + intBitsToFloat(PV0iy));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R3i.z)));
R6i.y = PV1iz - R127i.x;
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),uf_blockPS6[43].y) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), uf_blockPS6[45].x));
R11i.z = floatBitsToInt(-(intBitsToFloat(R3i.z)) * intBitsToFloat(0x3d4ccccd) + -3.5);
R11i.z = clampFI32(R11i.z);
// 3
PV1ix = R6i.y << 0x2;
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),uf_blockPS6[44].z) + intBitsToFloat(R127i.z));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),uf_blockPS6[45].y) + intBitsToFloat(PV0iw));
R6i.w = floatBitsToInt(-(intBitsToFloat(R3i.z)) * intBitsToFloat(0x3c23d70a) + -(0.5));
R6i.w = clampFI32(R6i.w);
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R3i.y)) + intBitsToFloat(PV0ix));
// 4
R4i.x = PV1ix + 0x2d;
R4i.y = PV1ix + 0x2b;
R4i.z = PV1ix + 0x2a;
R4i.w = PV1ix + 0x2c;
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R3i.x)) + intBitsToFloat(R122i.x));
}
if( activeMaskStackC[1] == true ) {
R7i.xyzw = floatBitsToInt(uf_blockPS1[R4i.x].xyzw);
R9i.xyzw = floatBitsToInt(uf_blockPS1[R4i.w].xyzw);
R8i.xyzw = floatBitsToInt(uf_blockPS1[R4i.y].xyzw);
R4i.xyzw = floatBitsToInt(uf_blockPS1[R4i.z].xyzw);
R11i.w = floatBitsToInt(texture(textureUnitPS6, vec2(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y))).y);
}
if( activeMaskStackC[1] == true ) {
// 0
R127i.x = floatBitsToInt(uf_blockPS8[23].x + -(uf_blockPS8[24].x));
R125i.y = floatBitsToInt(uf_blockPS8[23].y + -(uf_blockPS8[24].y));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R9i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R7i.x)));
R13i.z = floatBitsToInt(float(R6i.y));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R8i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R4i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R7i.y)) + intBitsToFloat(PV0iw));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R9i.y)) + intBitsToFloat(PV0iz));
R126i.z = floatBitsToInt(uf_blockPS8[23].z + -(uf_blockPS8[24].z));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R126i.w = tempi.x;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R8i.y)) + intBitsToFloat(PV1ix));
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R7i.z)) + intBitsToFloat(R127i.z));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R4i.y)) + intBitsToFloat(R127i.y));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R10i.x)) + uf_blockPS8[24].x);
R13i.x = floatBitsToInt(uf_blockPS1[0].y);
// 4
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R9i.z)) + intBitsToFloat(R127i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R8i.z)) + intBitsToFloat(R126i.y));
R125i.z = floatBitsToInt(intBitsToFloat(R7i.w) + intBitsToFloat(backupReg0i));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R10i.x)) + uf_blockPS8[24].y);
R16i.y = floatBitsToInt(uf_blockPS1[1].y);
// 5
backupReg0i = R123i.x;
backupReg1i = R126i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R4i.z)) + intBitsToFloat(R127i.y));
R127i.y = floatBitsToInt(intBitsToFloat(R9i.w) + intBitsToFloat(backupReg0i));
R126i.z = floatBitsToInt(intBitsToFloat(R8i.w) + intBitsToFloat(R123i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i),intBitsToFloat(R10i.x)) + uf_blockPS8[24].z);
R9i.z = floatBitsToInt(uf_blockPS1[2].y);
// 6
R18i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS8[31].x, intBitsToFloat(R127i.z)));
R18i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS8[31].x, intBitsToFloat(R127i.w)));
R18i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS8[31].x, intBitsToFloat(R123i.w)));
R127i.w = floatBitsToInt(intBitsToFloat(R4i.w) + intBitsToFloat(R123i.x));
R6i.y = floatBitsToInt(fract(uf_blockPS8[36].w));
// 7
PS1i = floatBitsToInt(sqrt(intBitsToFloat(R6i.x)));
// 8
R6i.x = floatBitsToInt(uf_blockPS8[37].x);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 9
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PS0i)));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(PS0i)));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(PS0i)));
tempResultf = 1.0 / sqrt(intBitsToFloat(R126i.w));
PS1i = floatBitsToInt(tempResultf);
// 10
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PS1i)));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PS1i)));
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PS1i)));
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(R125i.z));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R12i.y),intBitsToFloat(R14i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R12i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R1i.w = tempi.x;
PS1i = R11i.x;
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 12
backupReg0i = R127i.w;
R7i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(PS1i)) + intBitsToFloat(R3i.x));
PV0iy = R12i.y;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.z), uf_blockPS1[11].z));
R127i.w = R14i.z;
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R126i.w)));
// 13
R5i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R12i.y),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(uf_blockPS1[11].x,uf_blockPS1[11].y,1.0,0.0)));
PV1iy = R5i.x;
PV1iz = R5i.x;
PV1iw = R5i.x;
R7i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.w)),intBitsToFloat(PV0iy)) + intBitsToFloat(R3i.y));
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.z), uf_blockPS1[12].z));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R126i.w)));
R8i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.w)),intBitsToFloat(R127i.w)) + intBitsToFloat(R12i.z));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R126i.w)));
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R12i.y),intBitsToFloat(PV0ix),intBitsToFloat(0x80000000)),vec4(uf_blockPS1[12].x,uf_blockPS1[12].y,1.0,0.0)));
PV1ix = tempi.x;
R5i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.z), uf_blockPS1[13].z));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R12i.y),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(uf_blockPS1[13].x,uf_blockPS1[13].y,1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R7i.z = tempi.x;
PV0iw = tempi.x;
}
if( activeMaskStackC[1] == true ) {
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R3i.x) + uf_blockPS6[4].x);
R127i.y = floatBitsToInt(intBitsToFloat(R3i.y) + uf_blockPS6[4].y);
R126i.z = floatBitsToInt(intBitsToFloat(R12i.z) + uf_blockPS6[4].z);
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),uf_blockPS6[43].z) + intBitsToFloat(R5i.z));
// 2
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),uf_blockPS6[45].z) + intBitsToFloat(R6i.z));
R13i.y = floatBitsToInt(uf_blockPS6[44].w + intBitsToFloat(R10i.y));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 3
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS0i)));
R2i.w = floatBitsToInt(-(uf_blockPS6[53].z) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(R10i.z));
R2i.w = clampFI32(R2i.w);
R8i.x = floatBitsToInt(uf_blockPS6[43].w + intBitsToFloat(R126i.y));
// 4
R9i.x = floatBitsToInt(-(uf_blockPS6[53].w) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(R10i.z));
R9i.x = clampFI32(R9i.x);
R8i.y = R13i.y;
R2i.z = floatBitsToInt(uf_blockPS6[45].w + intBitsToFloat(R126i.x));
}
if( activeMaskStackC[1] == true ) {
// 0
R12i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].x, uf_blockPS10[2].w));
R14i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].y, uf_blockPS10[2].w));
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), uf_blockPS10[2].w));
// 1
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), uf_blockPS10[2].w));
R5i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].z, uf_blockPS10[2].w));
R3i.w = 0;
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), uf_blockPS10[2].w));
// 2
R5i.w = 0;
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R8i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS4[6].x, intBitsToFloat(R6i.x)));
// 1
predResult = (intBitsToFloat(R6i.y) > 0.0);
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
R17i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R0i.x)));
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R0i.y)));
R17i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R0i.z)));
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R17i.x = 0;
R17i.y = 0;
R17i.z = 0;
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
R0i.z = floatBitsToInt(texture(textureUnitPS9, vec3(intBitsToFloat(R0i.y),intBitsToFloat(R0i.y),intBitsToFloat(R0i.y))).x);
}
if( activeMaskStackC[2] == true ) {
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R1i.w) + 1.0);
R127i.x = clampFI32(R127i.x);
PV0iy = floatBitsToInt(intBitsToFloat(R17i.z) * intBitsToFloat(0x3dea4a8c));
PV0iw = floatBitsToInt(-(intBitsToFloat(R0i.z)) + 1.0);
R12i.w = floatBitsToInt(uf_blockPS8[33].w * intBitsToFloat(0x3f666666));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R17i.x),intBitsToFloat(R17i.y),intBitsToFloat(PV0iy),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R127i.z = tempi.x;
PV1iw = tempi.x;
tempResultf = max(0.0, intBitsToFloat(PV0iw));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(0.5 * intBitsToFloat(PV1ix) + intBitsToFloat(0x3dcccccd));
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3fa66666));
R126i.z = floatBitsToInt(intBitsToFloat(0x3f19999a) * intBitsToFloat(PV1ix) + intBitsToFloat(0x3e4ccccd));
tempResultf = max(0.0, intBitsToFloat(backupReg0i));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 3
backupReg0i = R127i.z;
PV1iy = floatBitsToInt(intBitsToFloat(PS0i) * 2.5);
R127i.z = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(0x3e23d70a));
R127i.w = floatBitsToInt(intBitsToFloat(0x3f266666) * intBitsToFloat(backupReg0i) + intBitsToFloat(0x3eb33333));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iy)));
// 4
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 0.25);
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.z)) + intBitsToFloat(0x3e851eb8));
PV0iw = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3e4ccccd));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(PV0iw));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(PV0iw)) + intBitsToFloat(R127i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(PV0iw)) + intBitsToFloat(R126i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV0iw)) + intBitsToFloat(R127i.x));
// 6
R127i.y = floatBitsToInt(intBitsToFloat(R123i.y) + intBitsToFloat(PV1ix));
R127i.y = clampFI32(R127i.y);
PV0iz = floatBitsToInt(intBitsToFloat(R123i.z) + intBitsToFloat(PV1ix));
PV0iz = clampFI32(PV0iz);
PV0iw = floatBitsToInt(intBitsToFloat(R123i.w) + intBitsToFloat(PV1ix));
PV0iw = clampFI32(PV0iw);
// 7
PV1ix = floatBitsToInt(-(intBitsToFloat(R17i.x)) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(-(intBitsToFloat(R18i.x)) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(-(intBitsToFloat(R17i.z)) + intBitsToFloat(R127i.y));
PV1iw = floatBitsToInt(-(intBitsToFloat(R17i.y)) + intBitsToFloat(PV0iz));
R127i.x = floatBitsToInt(-(intBitsToFloat(R18i.y)) + intBitsToFloat(PV0iz));
// 8
R17i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),uf_blockPS8[33].w) + intBitsToFloat(R17i.x));
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),uf_blockPS8[33].w) + intBitsToFloat(R17i.y));
R17i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),uf_blockPS8[33].w) + intBitsToFloat(R17i.z));
PV0iw = floatBitsToInt(-(intBitsToFloat(R18i.z)) + intBitsToFloat(R127i.y));
R18i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),uf_blockPS8[33].w) + intBitsToFloat(R18i.x));
// 9
R18i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),uf_blockPS8[33].w) + intBitsToFloat(R18i.y));
R18i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),uf_blockPS8[33].w) + intBitsToFloat(R18i.z));
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R12i.w = 0;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),uf_blockPS6[39].z) + -(uf_blockPS6[39].x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),uf_blockPS6[39].z) + -(uf_blockPS6[39].y));
R0i.z = floatBitsToInt(intBitsToFloat(R5i.y) * 2.0 + -(1.0));
R0i.w = floatBitsToInt(-(intBitsToFloat(R8i.y)) + uf_blockPS6[39].w);
}
if( activeMaskStackC[1] == true ) {
R0i.y = floatBitsToInt(textureLod(textureUnitPS4, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)),0.0).x);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(uf_blockPS6[39].w, intBitsToFloat(R0i.y)));
R127i.y = floatBitsToInt(intBitsToFloat(R0i.w) + -(intBitsToFloat(R0i.z)));
R126i.z = floatBitsToInt(intBitsToFloat(R11i.z) + uf_blockPS10[3].y);
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(PV0ix)) + intBitsToFloat(0x3fa66666));
PV1iy = floatBitsToInt(uf_blockPS10[2].z + 1.0);
// 2
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R127i.y));
R9i.w = floatBitsToInt(-(intBitsToFloat(R9i.x)) + intBitsToFloat(PV1iy));
R9i.w = clampFI32(R9i.w);
// 3
R127i.z = floatBitsToInt(intBitsToFloat(PV0iw) * 0.25);
R127i.z = clampFI32(R127i.z);
// 4
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.z)),intBitsToFloat(PV0iy)) + intBitsToFloat(PV0iy));
// 6
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.z)),intBitsToFloat(R123i.x)) + intBitsToFloat(R123i.x));
// 7
PV1iy = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
// 8
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R126i.z)) + intBitsToFloat(R127i.w));
R10i.z = clampFI32(R10i.z);
// 9
R19i.y = floatBitsToInt(intBitsToFloat(R10i.z) * 0.75 + 0.25);
// 10
predResult = (1.0 > intBitsToFloat(R2i.w));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R0i.z = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(0xbb03126f));
R4i.z = floatBitsToInt(roundEven(intBitsToFloat(R13i.z)));
// 1
R4i.w = floatBitsToInt(-(intBitsToFloat(R13i.z)) * intBitsToFloat(0x3a03126f) + intBitsToFloat(R0i.z));
R4i.w = clampFI32(R4i.w);
}
if( activeMaskStackC[2] == true ) {
R0i.x = floatBitsToInt(texture(textureUnitPS2, vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R4i.w))));
}
if( activeMaskStackC[2] == true ) {
// 0
PV0iy = floatBitsToInt(-(intBitsToFloat(R0i.x)) + 1.0);
// 1
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R2i.w)) + intBitsToFloat(R0i.x));
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R15i.x = 0x3f800000;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R2i.x = floatBitsToInt(intBitsToFloat(R8i.x) * intBitsToFloat(0x38d1b717) + 0.5);
R2i.y = floatBitsToInt(intBitsToFloat(R2i.z) * intBitsToFloat(0x3903126f) + 0.5);
R0i.z = floatBitsToInt(-(intBitsToFloat(R7i.z)));
R0i.w = 0x40400000;
R13i.w = 0x3f800000;
// 1
redcCUBE(vec4(intBitsToFloat(R0i.z),intBitsToFloat(R0i.z),intBitsToFloat(R5i.x),intBitsToFloat(R5i.y)),vec4(intBitsToFloat(R5i.y),intBitsToFloat(R5i.x),intBitsToFloat(R0i.z),intBitsToFloat(R0i.z)),cubeMapSTM,cubeMapFaceId);
R127i.x = floatBitsToInt(cubeMapSTM.x);
R127i.y = floatBitsToInt(cubeMapSTM.y);
R127i.z = floatBitsToInt(cubeMapSTM.z);
R127i.w = cubeMapFaceId;
R4i.w = floatBitsToInt(-(intBitsToFloat(R3i.z)) * intBitsToFloat(0x3ba3d70a));
// 2
backupReg0i = R5i.y;
R5i.x = floatBitsToInt(intBitsToFloat(R8i.x) * intBitsToFloat(0x3a83126f));
R5i.y = floatBitsToInt(intBitsToFloat(R2i.z) * intBitsToFloat(0x3a83126f));
R0i.z = R127i.w;
R123i.w = floatBitsToInt(-(intBitsToFloat(backupReg0i)) * 0.5 + 0.5);
PS0i = floatBitsToInt(1.0 / abs(intBitsToFloat(R127i.z)));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(R123i.w) + 2.5);
R6i.y = 0;
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PS0i)) + 1.5);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PS0i)) + 1.5);
R7i.w = floatBitsToInt(-(intBitsToFloat(R12i.w)) * 3.0 + 3.0);
// 4
R0i.x = R123i.w;
R0i.y = R123i.z;
R6i.z = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3daaaaab));
R2i.w = floatBitsToInt(intBitsToFloat(R10i.z) * intBitsToFloat(0xbdcccccd) + intBitsToFloat(0x3dcccccd));
R126i.z = floatBitsToInt(max(-(intBitsToFloat(R1i.w)), 0.0));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R2i.z),intBitsToFloat(R13i.w)),vec4(uf_blockPS1[37].x,uf_blockPS1[37].y,uf_blockPS1[37].z,uf_blockPS1[37].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.z = floatBitsToInt(-(intBitsToFloat(R12i.w)) + 1.0);
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R2i.z),intBitsToFloat(R13i.w)),vec4(uf_blockPS1[35].x,uf_blockPS1[35].y,uf_blockPS1[35].z,uf_blockPS1[35].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R2i.z),intBitsToFloat(R13i.w)),vec4(uf_blockPS1[36].x,uf_blockPS1[36].y,uf_blockPS1[36].z,uf_blockPS1[36].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R127i.z)));
// 8
R126i.x = floatBitsToInt(min(intBitsToFloat(R126i.z), 1.0));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.z)));
R126i.z = floatBitsToInt(intBitsToFloat(R125i.z) * 0.5 + 0.5);
R126i.w = R1i.x;
R126i.w = floatBitsToInt(intBitsToFloat(R126i.w) / 2.0);
R122i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.w)),intBitsToFloat(R125i.z)) + intBitsToFloat(R125i.z));
// 9
tempi.x = floatBitsToInt(dot(vec4(uf_blockPS1[13].x,uf_blockPS1[13].y,uf_blockPS1[13].z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R8i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.y = floatBitsToInt(intBitsToFloat(R122i.x) + intBitsToFloat(0x3c23d70a));
R126i.y = clampFI32(R126i.y);
// 10
R127i.x = floatBitsToInt(dot(vec4(uf_blockPS1[11].x,uf_blockPS1[11].y,uf_blockPS1[11].z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R8i.z),0.0)));
PV0iy = R127i.x;
PV0iz = R127i.x;
PV0iw = R127i.x;
R127i.z = floatBitsToInt(-(intBitsToFloat(PV1ix)));
// 11
tempi.x = floatBitsToInt(dot(vec4(uf_blockPS1[12].x,uf_blockPS1[12].y,uf_blockPS1[12].z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R8i.z),0.0)));
PV1ix = tempi.x;
R127i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.w = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
// 12
redcCUBE(vec4(intBitsToFloat(R127i.z),intBitsToFloat(R127i.z),intBitsToFloat(R127i.x),intBitsToFloat(PV1ix)),vec4(intBitsToFloat(PV1ix),intBitsToFloat(R127i.x),intBitsToFloat(R127i.z),intBitsToFloat(R127i.z)),cubeMapSTM,cubeMapFaceId);
R125i.x = floatBitsToInt(cubeMapSTM.x);
R125i.y = floatBitsToInt(cubeMapSTM.y);
R125i.z = floatBitsToInt(cubeMapSTM.z);
R125i.w = cubeMapFaceId;
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R126i.y)));
// 13
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.x)),intBitsToFloat(R127i.w)) + intBitsToFloat(R127i.w));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R126i.z)));
R11i.y = floatBitsToInt(intBitsToFloat(R11i.y) / 2.0);
R7i.z = R125i.w;
R127i.w = floatBitsToInt(-(intBitsToFloat(R12i.w)) * 3.0 + 4.0);
PS1i = floatBitsToInt(1.0 / abs(intBitsToFloat(R125i.z)));
// 14
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z),intBitsToFloat(R126i.w)) + intBitsToFloat(R126i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.x)),intBitsToFloat(R127i.x)) + intBitsToFloat(R127i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(PS1i)) + 1.5);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(PS1i)) + 1.5);
R9i.y = floatBitsToInt(intBitsToFloat(R10i.z) * 0.5 + 0.5);
// 15
R7i.x = R123i.w;
R7i.y = R123i.z;
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R123i.y)));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),-(intBitsToFloat(R11i.y))) + intBitsToFloat(R126i.x));
R4i.z = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
}
if( activeMaskStackC[1] == true ) {
R0i.xyz = floatBitsToInt(zmCube(textureUnitPS1, intBitsToFloat(R0i.xy), R0i.z, cubeMapArrayIndex1, intBitsToFloat(R0i.w)).xyz);
R8i.xyz = floatBitsToInt(textureLod(textureUnitPS7, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y)),0.0).xyz);
R4i.w = floatBitsToInt(textureLod(textureUnitPS0, vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y)),intBitsToFloat(R4i.w)).x);
R5i.x = floatBitsToInt(textureLod(textureUnitPS5, vec2(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y)),0.0).x);
R10i.xyz = floatBitsToInt(texture(textureUnitPS8, vec2(intBitsToFloat(R6i.z),intBitsToFloat(R6i.y))).xyz);
R7i.xyz = floatBitsToInt(zmCube(textureUnitPS1, intBitsToFloat(R7i.xy), R7i.z, cubeMapArrayIndex1, intBitsToFloat(R7i.w)).xyz);
}
if( activeMaskStackC[1] == true ) {
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.z)),uf_blockPS6[28].x) + -(uf_blockPS6[28].y));
R123i.x = clampFI32(R123i.x);
PV0iy = floatBitsToInt(min(intBitsToFloat(R0i.y), intBitsToFloat(R0i.z)));
R127i.z = floatBitsToInt(intBitsToFloat(R4i.w) + uf_blockPS10[1].z);
R127i.z = clampFI32(R127i.z);
PV0iw = floatBitsToInt(max(intBitsToFloat(R0i.y), intBitsToFloat(R0i.z)));
R122i.x = floatBitsToInt(intBitsToFloat(R5i.x) * 2.0 + -(1.0));
// 1
backupReg0i = R2i.z;
R127i.x = floatBitsToInt(min(intBitsToFloat(R0i.x), intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
R2i.z = floatBitsToInt(max(intBitsToFloat(R0i.x), intBitsToFloat(PV0iw)));
R4i.w = floatBitsToInt(intBitsToFloat(R122i.x) * 25.0 + intBitsToFloat(R13i.y));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R4i.z)));
// 2
R126i.x = floatBitsToInt(intBitsToFloat(R0i.z) + -(intBitsToFloat(R2i.z)));
PV0iy = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(0x2edbe6ff));
R124i.z = floatBitsToInt(intBitsToFloat(R0i.y) + -(intBitsToFloat(R2i.z)));
R126i.w = floatBitsToInt(intBitsToFloat(R0i.x) + -(intBitsToFloat(R2i.z)));
tempResultf = max(0.0, intBitsToFloat(PV1iy));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R127i.w = floatBitsToInt(tempResultf);
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(0x80000000)),vec4(uf_blockPS6[42].x,uf_blockPS6[42].y,uf_blockPS6[42].z,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(PV1ix)));
R124i.y = floatBitsToInt(intBitsToFloat(R11i.y) + intBitsToFloat(R1i.w));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockPS6[29].x, intBitsToFloat(R127i.w)));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.x)),intBitsToFloat(PS1i)) + 1.0);
R125i.z = floatBitsToInt(-(intBitsToFloat(R125i.y)) * intBitsToFloat(0x3d23d70a) + intBitsToFloat(0x3d23d70a));
// 5
R127i.x = floatBitsToInt(intBitsToFloat(R123i.w) + intBitsToFloat(0x2edbe6ff));
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockPS10[2].w, uf_blockPS10[2].w));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(intBitsToFloat(R123i.w) + intBitsToFloat(R2i.w));
PV1iw = clampFI32(PV1iw);
R126i.y = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(R125i.z));
PV0iy = floatBitsToInt(intBitsToFloat(R15i.x) + -(intBitsToFloat(R126i.z)));
R8i.z = floatBitsToInt(intBitsToFloat(0xbf59999a) * intBitsToFloat(R11i.w) + 1.0);
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(PV1iy)));
tempResultf = max(0.0, intBitsToFloat(PV1iw));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 7
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R9i.w)) + intBitsToFloat(R126i.z));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PS0i)));
R0i.z = floatBitsToInt(intBitsToFloat(R17i.x) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R0i.z = clampFI32(R0i.z);
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.y), intBitsToFloat(PV0ix)));
R125i.y = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 8
tempi.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R12i.x)),-(intBitsToFloat(R14i.y)),-(intBitsToFloat(R5i.z)),intBitsToFloat(0x80000000)),vec4(-(intBitsToFloat(R14i.x)),-(intBitsToFloat(R15i.y)),-(intBitsToFloat(R15i.z)),0.0)));
tempi.x = clampFI32(tempi.x);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R125i.w = tempi.x;
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R12i.y),intBitsToFloat(R14i.z),intBitsToFloat(R14i.z)),vec4(-(intBitsToFloat(R14i.x)),-(intBitsToFloat(R15i.y)),-(intBitsToFloat(R15i.z)),-(intBitsToFloat(R5i.w)))));
tempi.x = clampFI32(tempi.x);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PS0i)));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R16i.y),intBitsToFloat(R9i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R12i.z),0.0)));
tempi.x = clampFI32(tempi.x);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(PV1ix)));
// 11
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R125i.y)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(PS0i)) + -(intBitsToFloat(PS0i)));
R123i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS10[3].z,intBitsToFloat(backupReg0i)) + uf_blockPS10[1].y);
R123i.z = clampFI32(R123i.z);
PV1iw = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 12
R125i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[29].z, intBitsToFloat(PS1i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R123i.z)));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.w)),intBitsToFloat(PV1iw)) + intBitsToFloat(PV1iw));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R127i.x)) + intBitsToFloat(R2i.z));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R127i.x)) + intBitsToFloat(R2i.z));
// 13
R124i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R12i.y),intBitsToFloat(R14i.z),intBitsToFloat(R14i.z)),vec4(-(intBitsToFloat(R12i.x)),-(intBitsToFloat(R14i.y)),-(intBitsToFloat(R5i.z)),-(intBitsToFloat(R3i.w)))));
R124i.x = clampFI32(R124i.x);
PV1iy = R124i.x;
PV1iz = R124i.x;
PV1iw = R124i.x;
PS1i = floatBitsToInt(intBitsToFloat(R125i.y) + 1.0);
// 14
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(PS1i)) + intBitsToFloat(PS1i));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.w)),intBitsToFloat(R127i.z)) + intBitsToFloat(R127i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R127i.x)) + intBitsToFloat(R2i.z));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R127i.y)));
R124i.z = floatBitsToInt(exp2(intBitsToFloat(R125i.x)));
// 15
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R123i.y)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R126i.w)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R127i.w)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R123i.z)));
R127i.x = floatBitsToInt(intBitsToFloat(R124i.x) + intBitsToFloat(R9i.y));
R127i.x = clampFI32(R127i.x);
// 16
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),-(intBitsToFloat(R11i.y))) + intBitsToFloat(R124i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(-(uf_blockPS6[29].w),intBitsToFloat(R124i.z)) + 1.0);
R124i.z = floatBitsToInt(intBitsToFloat(R10i.x) + -(intBitsToFloat(R127i.y)));
R127i.w = floatBitsToInt(intBitsToFloat(R10i.y) + -(intBitsToFloat(R127i.z)));
R124i.x = floatBitsToInt(intBitsToFloat(R10i.z) + -(intBitsToFloat(R126i.w)));
// 17
backupReg0i = R126i.y;
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R127i.x)));
R126i.y = floatBitsToInt(-(intBitsToFloat(R125i.x)) * intBitsToFloat(0x3d23d70a) + intBitsToFloat(0x3d23d70a));
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)),intBitsToFloat(R123i.y)) + intBitsToFloat(R123i.y));
R124i.w = floatBitsToInt(intBitsToFloat(R11i.y) + intBitsToFloat(R123i.x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 18
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(PS1i)));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R6i.w)) + intBitsToFloat(R126i.w));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R6i.w)) + intBitsToFloat(R127i.z));
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R6i.w)) + intBitsToFloat(R127i.y));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R124i.y));
// 19
PV1ix = floatBitsToInt(0.25 * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockPS10[1].x, intBitsToFloat(R125i.w)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), uf_blockPS6[30].w));
PV1iw = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(R126i.y));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R124i.w));
// 20
R9i.x = floatBitsToInt(intBitsToFloat(R17i.y) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R9i.x = clampFI32(R9i.x);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R124i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R2i.w)));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(PV1ix)));
R6i.x = floatBitsToInt(intBitsToFloat(R17i.z) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R6i.x = clampFI32(R6i.x);
// 21
backupReg0i = R7i.x;
backupReg1i = R7i.y;
backupReg2i = R7i.z;
backupReg3i = R1i.w;
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(PV0iy)));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R8i.z)));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(backupReg3i)));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), intBitsToFloat(backupReg3i)));
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg2i), intBitsToFloat(backupReg3i)));
}
if( activeMaskStackC[1] == true ) {
// 0
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.w), uf_blockPS6[1].w));
PV0iy = floatBitsToInt(uf_blockPS6[1].z + -(1.0));
R126i.z = floatBitsToInt(-(intBitsToFloat(R4i.w)) + uf_blockPS6[52].x);
R124i.w = floatBitsToInt(-(intBitsToFloat(R7i.y)) + 1.0);
R10i.y = ((1.0 > intBitsToFloat(R8i.w))?-1:0);
// 1
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R124i.x)) + 1.0);
R126i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].x, intBitsToFloat(R10i.x)));
PV1iz = floatBitsToInt(uf_blockPS6[1].y + -(1.0));
PV1iw = floatBitsToInt(uf_blockPS6[1].x + -(1.0));
R125i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].y, intBitsToFloat(R10i.x)));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(R124i.x)) + 1.0);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),uf_blockPS6[15].x) + uf_blockPS6[14].w);
R123i.y = clampFI32(R123i.y);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R124i.x)) + 1.0);
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(R10i.w)));
// 3
backupReg0i = R123i.x;
backupReg1i = R123i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z),intBitsToFloat(R123i.w)) + intBitsToFloat(R125i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(backupReg0i)) + intBitsToFloat(R126i.y));
PV1iz = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].z, intBitsToFloat(R10i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), uf_blockPS6[13].w));
// 4
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R8i.z)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R0i.z)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(R9i.x)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV1iz));
PS0i = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].x, intBitsToFloat(R2i.w)));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].y, intBitsToFloat(R2i.w)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R6i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].z, intBitsToFloat(R2i.w)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i),intBitsToFloat(R7i.x)) + intBitsToFloat(R7i.z));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),-(intBitsToFloat(R7i.y))) + intBitsToFloat(R125i.x));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].x, intBitsToFloat(R7i.y)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R7i.x)) + intBitsToFloat(R1i.x));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(R7i.x)) + intBitsToFloat(R1i.w));
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].y, intBitsToFloat(R7i.y)));
R124i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].z, intBitsToFloat(R7i.y)));
// 7
backupReg0i = R127i.y;
R123i.x = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].x,intBitsToFloat(R125i.y)) + intBitsToFloat(PV0ix));
R123i.z = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R123i.w = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R124i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].y,intBitsToFloat(R125i.y)) + intBitsToFloat(PV0iw));
// 8
PV0ix = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(R123i.w));
PV0iy = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(R123i.x));
PV0iz = floatBitsToInt(intBitsToFloat(R124i.y) + intBitsToFloat(R123i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].z,intBitsToFloat(R125i.y)) + intBitsToFloat(R124i.z));
R122i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.x)),intBitsToFloat(R124i.w)) + intBitsToFloat(R124i.w));
// 9
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R122i.x),intBitsToFloat(PV0iy)) + intBitsToFloat(R127i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R122i.x), intBitsToFloat(R122i.x)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R122i.x),intBitsToFloat(PV0iz)) + intBitsToFloat(R123i.w));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R122i.x),intBitsToFloat(PV0ix)) + intBitsToFloat(R124i.x));
// 10
PV0ix = floatBitsToInt(-(intBitsToFloat(R125i.w)) * 0.25);
PV0iy = floatBitsToInt(-(intBitsToFloat(R125i.x)) * 0.25);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.x), intBitsToFloat(R127i.y)));
PV0iw = floatBitsToInt(-(intBitsToFloat(R124i.z)) * 0.25);
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.y), intBitsToFloat(R127i.y)));
// 11
backupReg0i = R127i.y;
R124i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3fb8aa3b));
R127i.y = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3fb8aa3b));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3fb8aa3b));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.z), intBitsToFloat(backupReg0i)));
R127i.z = floatBitsToInt(-(intBitsToFloat(R125i.z)) * intBitsToFloat(0x3fb8aa3b));
// 12
R127i.x = floatBitsToInt(-(intBitsToFloat(R126i.x)) * intBitsToFloat(0x3fb8aa3b));
R126i.z = floatBitsToInt(-(intBitsToFloat(R124i.w)) * intBitsToFloat(0x3fb8aa3b));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iz)));
// 13
PV1ix = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 4.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(R124i.x)));
// 14
R125i.x = ((R10i.y == 0)?(R125i.x):(PV1ix));
PV0iw = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 4.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(R127i.y)));
// 15
PV1iz = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 4.0);
R125i.w = ((R10i.y == 0)?(R125i.w):(PV0iw));
PS1i = floatBitsToInt(exp2(intBitsToFloat(R127i.z)));
// 16
PV0ix = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
R124i.z = ((R10i.y == 0)?(R124i.z):(PV1iz));
PS0i = floatBitsToInt(exp2(intBitsToFloat(R127i.x)));
// 17
R123i.y = ((R10i.y == 0)?(R125i.z):(PV0ix));
PV1iw = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(R126i.z)));
// 18
R123i.x = ((R10i.y == 0)?(R126i.x):(PV1iw));
PV0iz = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
R4i.x = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(R123i.y));
// 19
R4i.y = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(R123i.x));
R123i.w = ((R10i.y == 0)?(R124i.w):(PV0iz));
// 20
R4i.z = floatBitsToInt(intBitsToFloat(R124i.z) + intBitsToFloat(R123i.w));
}
// export
passPixelColor0 = vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.z), intBitsToFloat(R4i.w));
}
