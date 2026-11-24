#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;

vec4 zmCube(sampler2DArray s, vec2 st, int face, float cubeIndex, float lod) {
	return textureLod(s, vec3(st - 1.0, float(face) + cubeIndex * 6.0), lod);
}
// shader 3ca7392f3e3332f5
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform vec2 uf_fragCoordScale;
UNIFORM_BUFFER_LAYOUT(33, 1, 13) uniform uniformBlockPS1
{
vec4 uf_blockPS1[4096];
};


UNIFORM_BUFFER_LAYOUT(36, 1, 14) uniform uniformBlockPS4
{
vec4 uf_blockPS4[7];
};


UNIFORM_BUFFER_LAYOUT(38, 1, 15) uniform uniformBlockPS6
{
vec4 uf_blockPS6[54];
};


UNIFORM_BUFFER_LAYOUT(40, 1, 16) uniform uniformBlockPS8
{
vec4 uf_blockPS8[38];
};


UNIFORM_BUFFER_LAYOUT(42, 1, 17) uniform uniformBlockPS10
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
in vec4 passParameterSem0;
in vec4 passParameterSem2;
in vec4 passParameterSem4;
in vec4 passParameterSem5;
in vec4 passParameterSem6;
in vec4 passParameterSem7;
in vec4 passParameterSem8;
in vec4 passParameterSem254;
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
R7i = floatBitsToInt(passParameterSem254);
R7i.w = floatBitsToInt(gl_FrontFacing?1.0:0.0);
if( activeMaskStackC[1] == true ) {
R7i.xy = floatBitsToInt(texture(textureUnitPS11, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xy);
R16i.xyzw = floatBitsToInt(texture(textureUnitPS10, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyzw);
}
if( activeMaskStackC[1] == true ) {
// 0
R125i.x = floatBitsToInt(intBitsToFloat(R7i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PV0iy = ((-(intBitsToFloat(R5i.z)) > uf_blockPS1[58].x)?-1:0);
R127i.z = ((-(intBitsToFloat(R5i.z)) > uf_blockPS1[58].y)?-1:0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R3i.z)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R6i.w));
// 1
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(PS0i)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(PS0i)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R3i.x)));
PV1iw = PV0iy & int(1);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R3i.y)));
// 2
R10i.x = PV1iw - R127i.z;
R123i.y = floatBitsToInt(intBitsToFloat(R7i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R127i.z = floatBitsToInt((intBitsToFloat(R7i.w) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R125i.x)));
R127i.x = floatBitsToInt((0.0 > intBitsToFloat(R7i.w))?1.0:0.0);
// 3
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(R123i.y)) + intBitsToFloat(PV0iw));
R126i.x = clampFI32(R126i.x);
R9i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.z)),intBitsToFloat(R2i.x)) + intBitsToFloat(R126i.z));
PV1iz = R10i.x << 0x2;
R6i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.y)),intBitsToFloat(R2i.z)) + intBitsToFloat(R127i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R123i.y)));
// 4
R7i.x = PV1iz + 0x2b;
R7i.y = PV1iz + 0x2c;
R4i.z = PV1iz + 0x2d;
R7i.w = PV1iz + 0x2a;
R8i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.x)),intBitsToFloat(R2i.y)) + intBitsToFloat(R125i.z));
// 5
PV1ix = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(R127i.w)));
PV1iz = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(R127i.x)));
PV1iz = clampFI32(PV1iz);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(R127i.w)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(R127i.w)));
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R125i.x)) + intBitsToFloat(PV1iw));
R10i.y = ((intBitsToFloat(PV1iz) != 0.0)?-1:0);
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R125i.x)) + intBitsToFloat(PS1i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R125i.x)) + intBitsToFloat(PV1iy));
R4i.y = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 7
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R4i.y)) + intBitsToFloat(R123i.w));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R6i.w)));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R8i.x)));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R9i.y)));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R4i.y)) + intBitsToFloat(R123i.x));
}
if( activeMaskStackC[1] == true ) {
R12i.xyzw = floatBitsToInt(uf_blockPS1[R4i.z].xyzw);
R15i.xyzw = floatBitsToInt(uf_blockPS1[R7i.y].xyzw);
R13i.xyzw = floatBitsToInt(uf_blockPS1[R7i.x].xyzw);
R14i.xyzw = floatBitsToInt(uf_blockPS1[R7i.w].xyzw);
R7i.xy = floatBitsToInt(texture(textureUnitPS6, vec2(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y))).xy);
}
if( activeMaskStackC[1] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R4i.y)) + intBitsToFloat(R6i.z));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R8i.x)),intBitsToFloat(R3i.x)) + intBitsToFloat(R8i.y));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.w)),intBitsToFloat(R3i.y)) + intBitsToFloat(R2i.w));
R7i.w = 0x3f800000;
R8i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].x, uf_blockPS10[2].w));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.y)),intBitsToFloat(R3i.z)) + intBitsToFloat(R7i.z));
R126i.y = ((R10i.y == 0)?(0x40000000):(0));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R12i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R15i.x)));
R8i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].y, uf_blockPS10[2].w));
// 2
R125i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R11i.y),intBitsToFloat(R127i.x),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R123i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV0iy = R125i.x;
PV0iz = R125i.x;
PV0iw = R125i.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(R126i.y)));
// 3
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.x)),intBitsToFloat(PS0i)) + intBitsToFloat(R9i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R13i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R126i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R126i.y)));
R8i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].z, uf_blockPS10[2].w));
// 4
backupReg0i = R125i.z;
R2i.x = R8i.x;
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.x)),intBitsToFloat(PV1iw)) + intBitsToFloat(R11i.y));
R125i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.x)),intBitsToFloat(PV1iz)) + intBitsToFloat(R127i.x));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R12i.y)) + intBitsToFloat(backupReg0i));
R2i.y = R8i.z;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R14i.x)));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R124i.w = tempi.x;
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 7
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R15i.y)) + intBitsToFloat(R127i.w));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R14i.y)) + intBitsToFloat(R126i.w));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R12i.z)) + intBitsToFloat(R125i.w));
R2i.w = 0;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 8
backupReg0i = R124i.w;
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PS1i)));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PS1i)));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PS1i)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R13i.y)) + intBitsToFloat(R127i.y));
tempResultf = 1.0 / sqrt(intBitsToFloat(backupReg0i));
PS0i = floatBitsToInt(tempResultf);
// 9
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS0i)));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS0i)));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PS0i)));
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R8i.y)),intBitsToFloat(R8i.y)) + 1.0);
R125i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.y)),intBitsToFloat(R9i.y)) + 1.0);
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R7i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R9i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R15i.z)) + intBitsToFloat(R127i.x));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R7i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R6i.z = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(intBitsToFloat(PV0ix) + 1.0);
PS1i = clampFI32(PS1i);
// 12
PV0iy = floatBitsToInt(max(-(intBitsToFloat(PV1ix)), 0.0));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R13i.z)) + intBitsToFloat(R124i.w));
R8i.w = 0;
tempResultf = max(0.0, intBitsToFloat(PS1i));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R2i.z = floatBitsToInt(tempResultf);
// 13
backupReg0i = R125i.y;
backupReg1i = R123i.z;
PV1ix = floatBitsToInt(min(intBitsToFloat(PV0iy), 1.0));
R125i.y = floatBitsToInt(intBitsToFloat(R12i.w) + intBitsToFloat(R127i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R14i.z)) + intBitsToFloat(backupReg0i));
R124i.w = floatBitsToInt(intBitsToFloat(R13i.w) + intBitsToFloat(backupReg1i));
tempResultf = 1.0 / sqrt(intBitsToFloat(R127i.w));
R127i.w = floatBitsToInt(tempResultf);
// 14
R127i.x = floatBitsToInt(intBitsToFloat(R15i.w) + intBitsToFloat(R126i.z));
R126i.y = floatBitsToInt(intBitsToFloat(R14i.w) + intBitsToFloat(R123i.z));
R0i.z = 0;
R14i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(PV1ix)));
tempResultf = 1.0 / sqrt(intBitsToFloat(R125i.z));
PS0i = floatBitsToInt(tempResultf);
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R7i.z),intBitsToFloat(R7i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R0i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PS0i)));
// 16
R3i.y = floatBitsToInt(-(intBitsToFloat(R5i.z)) * intBitsToFloat(0x3d4ccccd) + -3.5);
R3i.y = clampFI32(R3i.y);
R11i.z = R7i.x;
R11i.z = clampFI32(R11i.z);
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(PV1ix)));
R9i.w = floatBitsToInt(-(intBitsToFloat(R5i.z)) * intBitsToFloat(0x3c23d70a) + -(0.5));
R9i.w = clampFI32(R9i.w);
// 17
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R125i.y));
// 18
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS1i)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(PS1i)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS1i)));
R4i.y = floatBitsToInt(float(R10i.x));
}
if( activeMaskStackC[1] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), uf_blockPS6[44].x));
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockPS8[31].y, intBitsToFloat(R2i.z)));
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),uf_blockPS6[44].y) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), uf_blockPS6[43].x));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
PS1i = clampFI32(PS1i);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), uf_blockPS6[45].x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),uf_blockPS6[43].y) + intBitsToFloat(PV1iw));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R14i.w)));
// 3
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),uf_blockPS6[44].z) + intBitsToFloat(R127i.x));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),uf_blockPS6[45].y) + intBitsToFloat(PV0ix));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(uf_blockPS8[32].w, intBitsToFloat(R16i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockPS8[32].w, intBitsToFloat(R16i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),uf_blockPS6[43].z) + intBitsToFloat(R126i.y));
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockPS8[32].w, intBitsToFloat(R16i.z)));
// 5
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R126i.z)) + intBitsToFloat(R16i.z));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R126i.z)) + intBitsToFloat(R16i.y));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R126i.z)) + intBitsToFloat(R16i.x));
PV1iw = floatBitsToInt(uf_blockPS6[53].z * intBitsToFloat(0x3d4ccccd));
R13i.y = floatBitsToInt(uf_blockPS6[44].w + intBitsToFloat(R125i.z));
// 6
R3i.x = floatBitsToInt(uf_blockPS6[43].w + intBitsToFloat(R127i.z));
R5i.y = R13i.y;
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),uf_blockPS6[45].z) + intBitsToFloat(R124i.w));
R4i.z = floatBitsToInt(-(intBitsToFloat(R5i.z)) * intBitsToFloat(0x3d4ccccd) + -(intBitsToFloat(PV1iw)));
R4i.z = clampFI32(R4i.z);
// 7
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R126i.z)));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R126i.y)));
R13i.z = floatBitsToInt(uf_blockPS6[45].w + intBitsToFloat(R123i.z));
R0i.w = floatBitsToInt(fract(uf_blockPS8[36].w));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R127i.x)));
}
if( activeMaskStackC[1] == true ) {
// 0
R5i.x = floatBitsToInt(uf_blockPS1[0].y);
R12i.y = floatBitsToInt(uf_blockPS1[1].y);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), uf_blockPS1[11].z));
R12i.z = floatBitsToInt(uf_blockPS1[2].y);
// 2
R4i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(PV1ix),intBitsToFloat(0x80000000)),vec4(uf_blockPS1[11].x,uf_blockPS1[11].y,1.0,0.0)));
PV0iy = R4i.x;
PV0iz = R4i.x;
PV0iw = R4i.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), uf_blockPS1[12].z));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(uf_blockPS1[12].x,uf_blockPS1[12].y,1.0,0.0)));
PV1ix = tempi.x;
R6i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), uf_blockPS1[13].z));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(uf_blockPS1[13].x,uf_blockPS1[13].y,1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R14i.z = tempi.x;
PV0iw = tempi.x;
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R10i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS4[6].x, uf_blockPS8[37].x));
// 1
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
PV0ix = floatBitsToInt(-(intBitsToFloat(R10i.y)) + intBitsToFloat(R0i.y));
PV0iy = floatBitsToInt(-(intBitsToFloat(R10i.x)) + intBitsToFloat(R0i.x));
PV0iw = floatBitsToInt(-(intBitsToFloat(R10i.z)) + intBitsToFloat(R0i.z));
// 1
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R0i.w)) + intBitsToFloat(R10i.x));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R0i.w)) + intBitsToFloat(R10i.y));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R0i.w)) + intBitsToFloat(R10i.z));
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
R0i.z = 0;
}
if( activeMaskStackC[2] == true ) {
R0i.w = floatBitsToInt(texture(textureUnitPS8, vec3(intBitsToFloat(R0i.z),intBitsToFloat(R0i.z),intBitsToFloat(R0i.z))).x);
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R0i.w)) + 1.0);
R127i.z = floatBitsToInt(intBitsToFloat(R2i.z) * 2.5);
PS0i = floatBitsToInt(intBitsToFloat(R10i.z) * intBitsToFloat(0x3dea4a8c));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R126i.z = tempi.x;
PV1iw = tempi.x;
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
R126i.x = floatBitsToInt(intBitsToFloat(0x3f19999a) * intBitsToFloat(PV1ix) + intBitsToFloat(0x3e4ccccd));
R127i.y = floatBitsToInt(0.5 * intBitsToFloat(PV1ix) + intBitsToFloat(0x3dcccccd));
PV0iz = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3fa66666));
R126i.y = floatBitsToInt(exp2(intBitsToFloat(R127i.z)));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) / 2.0);
// 3
backupReg0i = R126i.z;
R127i.x = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(0x3e23d70a));
R126i.z = floatBitsToInt(-(intBitsToFloat(R126i.x)) + intBitsToFloat(0x3e851eb8));
R127i.w = floatBitsToInt(intBitsToFloat(0x3f266666) * intBitsToFloat(backupReg0i) + intBitsToFloat(0x3eb33333));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3e4ccccd));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 0.25);
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PV0ix)) + intBitsToFloat(R127i.y));
PV1iy = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV0ix));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(PV0ix)) + intBitsToFloat(R127i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(PV0ix)) + intBitsToFloat(R126i.x));
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
R2i.w = R7i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),uf_blockPS6[39].z) + -(uf_blockPS6[39].x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.z),uf_blockPS6[39].z) + -(uf_blockPS6[39].y));
R0i.z = floatBitsToInt(intBitsToFloat(R6i.y) * 2.0 + -(1.0));
R0i.w = floatBitsToInt(-(intBitsToFloat(R5i.y)) + uf_blockPS6[39].w);
}
if( activeMaskStackC[1] == true ) {
R2i.z = floatBitsToInt(textureLod(textureUnitPS4, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)),0.0).x);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.w)),intBitsToFloat(R0i.z)) + intBitsToFloat(R0i.w));
R126i.z = floatBitsToInt(intBitsToFloat(R3i.y) + uf_blockPS10[3].y);
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R123i.y) + intBitsToFloat(0x3fa66666));
// 2
R123i.w = floatBitsToInt(mul_nonIEEE(-(uf_blockPS6[39].w),intBitsToFloat(R2i.z)) + intBitsToFloat(PV1ix));
// 3
R127i.z = floatBitsToInt(intBitsToFloat(R123i.w) * 0.25);
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
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R126i.z)) + intBitsToFloat(R127i.w));
R7i.x = clampFI32(R7i.x);
// 9
predResult = (1.0 > intBitsToFloat(R4i.z));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R2i.z = floatBitsToInt(roundEven(intBitsToFloat(R4i.y)));
R0i.w = floatBitsToInt(intBitsToFloat(R3i.z) + intBitsToFloat(0xbb03126f));
// 1
R2i.w = floatBitsToInt(-(intBitsToFloat(R4i.y)) * intBitsToFloat(0x3a03126f) + intBitsToFloat(R0i.w));
R2i.w = clampFI32(R2i.w);
}
if( activeMaskStackC[2] == true ) {
R0i.y = floatBitsToInt(texture(textureUnitPS2, vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w))));
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R0i.y)) + 1.0);
// 1
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R4i.z)) + intBitsToFloat(R0i.y));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.z)),uf_blockPS6[26].x) + -(uf_blockPS6[26].y));
R127i.x = clampFI32(R127i.x);
R0i.y = floatBitsToInt(intBitsToFloat(R6i.y) + 1.0);
R0i.z = floatBitsToInt(-(intBitsToFloat(R14i.z)));
R0i.w = 0x40400000;
R5i.w = 0x3f800000;
// 1
redcCUBE(vec4(intBitsToFloat(R0i.z),intBitsToFloat(R0i.z),intBitsToFloat(R4i.x),intBitsToFloat(R0i.y)),vec4(intBitsToFloat(R0i.y),intBitsToFloat(R4i.x),intBitsToFloat(R0i.z),intBitsToFloat(R0i.z)),cubeMapSTM,cubeMapFaceId);
R126i.x = floatBitsToInt(cubeMapSTM.x);
R126i.y = floatBitsToInt(cubeMapSTM.y);
R126i.z = floatBitsToInt(cubeMapSTM.z);
R126i.w = cubeMapFaceId;
R3i.w = floatBitsToInt(-(intBitsToFloat(R5i.z)) * intBitsToFloat(0x3ba3d70a));
// 2
R127i.x = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R2i.y = floatBitsToInt(intBitsToFloat(R13i.z) * intBitsToFloat(0x3a83126f));
R0i.z = R126i.w;
R2i.w = floatBitsToInt(intBitsToFloat(R3i.x) * intBitsToFloat(0x3a83126f));
PS0i = floatBitsToInt(1.0 / abs(intBitsToFloat(R126i.z)));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(R6i.z) + -(intBitsToFloat(R4i.w)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PS0i)) + 1.5);
R3i.z = R3i.w;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(PS0i)) + 1.5);
tempResultf = max(0.0, intBitsToFloat(R127i.x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R126i.x = floatBitsToInt(tempResultf);
// 4
R0i.x = R123i.w;
R0i.y = R123i.y;
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(R127i.x)) + intBitsToFloat(R4i.w));
R126i.w = floatBitsToInt(-(intBitsToFloat(R6i.y)) * 0.5 + 0.5);
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].y, intBitsToFloat(R126i.x)));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R5i.y),intBitsToFloat(R13i.z),intBitsToFloat(R5i.w)),vec4(uf_blockPS1[37].x,uf_blockPS1[37].y,uf_blockPS1[37].z,uf_blockPS1[37].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.x = floatBitsToInt(max(-(intBitsToFloat(R123i.z)), intBitsToFloat(0xbf7d70a4)));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) / 2.0);
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R5i.y),intBitsToFloat(R13i.z),intBitsToFloat(R5i.w)),vec4(uf_blockPS1[35].x,uf_blockPS1[35].y,uf_blockPS1[35].z,uf_blockPS1[35].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.z = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R5i.y),intBitsToFloat(R13i.z),intBitsToFloat(R5i.w)),vec4(uf_blockPS1[36].x,uf_blockPS1[36].y,uf_blockPS1[36].z,uf_blockPS1[36].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R126i.z)));
// 8
PV0ix = floatBitsToInt(-(uf_blockPS6[27].w) + 1.0);
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R126i.z)));
R126i.z = floatBitsToInt(intBitsToFloat(R127i.x) + 0.5);
PV0iw = floatBitsToInt(intBitsToFloat(R126i.w) + 2.5);
PS0i = floatBitsToInt(exp2(intBitsToFloat(R127i.w)));
// 9
R4i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3daaaaab));
PV1iy = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R123i.z = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
R4i.w = 0;
R122i.x = floatBitsToInt((mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(PS0i)) + uf_blockPS6[27].w)/2.0);
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.z)),uf_blockPS6[28].x) + -(uf_blockPS6[28].y));
R123i.x = clampFI32(R123i.x);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(0xbe593484));
R2i.z = floatBitsToInt(intBitsToFloat(R122i.x) + 0.5);
R5i.w = floatBitsToInt(intBitsToFloat(R7i.x) * intBitsToFloat(0xbdcccccd) + intBitsToFloat(0x3dcccccd));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1iy)));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f22f983));
PV1iy = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
R4i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].x, intBitsToFloat(R126i.x)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R123i.y)) + intBitsToFloat(0x3fc90da4));
PS1i = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(0xbe99999a));
// 12
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),-(intBitsToFloat(R123i.w))) + 1.0);
R4i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.z)),uf_blockPS6[18].x) + uf_blockPS6[17].w);
R4i.y = clampFI32(R4i.y);
R5i.z = floatBitsToInt(intBitsToFloat(0xbf59999a) * intBitsToFloat(R7i.y) + 1.0);
R6i.w = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x40200001));
R6i.w = clampFI32(R6i.w);
tempResultf = max(0.0, intBitsToFloat(PV1iy));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R5i.y = floatBitsToInt(tempResultf);
}
if( activeMaskStackC[1] == true ) {
R0i.xyz = floatBitsToInt(zmCube(textureUnitPS1, intBitsToFloat(R0i.xy), R0i.z, cubeMapArrayIndex1, intBitsToFloat(R0i.w)).xyz);
R2i.w = floatBitsToInt(textureLod(textureUnitPS5, vec2(intBitsToFloat(R2i.w),intBitsToFloat(R2i.y)),0.0).x);
R3i.x = floatBitsToInt(textureLod(textureUnitPS0, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y)),intBitsToFloat(R3i.z)).x);
R6i.xyz = floatBitsToInt(texture(textureUnitPS7, vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.w))).xyz);
R2i.xyz = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.z))).xyz);
}
if( activeMaskStackC[1] == true ) {
// 0
PV0ix = floatBitsToInt(min(intBitsToFloat(R0i.y), intBitsToFloat(R0i.z)));
R123i.y = floatBitsToInt(intBitsToFloat(R2i.w) * 2.0 + -(1.0));
PV0iz = floatBitsToInt(max(intBitsToFloat(R0i.y), intBitsToFloat(R0i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockPS6[29].x, intBitsToFloat(R5i.y)));
R126i.x = floatBitsToInt(exp2(intBitsToFloat(R4i.z)));
// 1
R4i.x = floatBitsToInt(intBitsToFloat(R123i.y) * 25.0 + intBitsToFloat(R13i.y));
R5i.y = floatBitsToInt(max(intBitsToFloat(R0i.x), intBitsToFloat(PV0iz)));
R126i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS10[3].z,intBitsToFloat(R7i.w)) + uf_blockPS10[1].y);
R126i.z = clampFI32(R126i.z);
R127i.w = floatBitsToInt(min(intBitsToFloat(R0i.x), intBitsToFloat(PV0ix)));
R125i.x = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(0x2edbe6ff));
R126i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].z,-(intBitsToFloat(R126i.x))) + uf_blockPS6[27].z);
R127i.z = floatBitsToInt(intBitsToFloat(R6i.w) * intBitsToFloat(0x3dcccccd));
R126i.w = floatBitsToInt(intBitsToFloat(R3i.x) + uf_blockPS10[1].z);
R126i.w = clampFI32(R126i.w);
tempResultf = max(0.0, intBitsToFloat(R4i.y));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R125i.w = floatBitsToInt(tempResultf);
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R12i.y),intBitsToFloat(R12i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R7i.z),0.0)));
tempi.x = clampFI32(tempi.x);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 4
R127i.x = floatBitsToInt(intBitsToFloat(R3i.w) + intBitsToFloat(0xbfe66666));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R5i.z)));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)),intBitsToFloat(PS1i)) + 1.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R126i.z)));
tempResultf = max(0.0, intBitsToFloat(PV1ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 5
R126i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[29].z, intBitsToFloat(PS0i)));
R126i.y = floatBitsToInt(intBitsToFloat(R123i.z) + intBitsToFloat(0x2edbe6ff));
PV1iz = floatBitsToInt(intBitsToFloat(R123i.z) + intBitsToFloat(R5i.w));
PV1iz = clampFI32(PV1iz);
R125i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[18].y, intBitsToFloat(R125i.w)));
R127i.y = R1i.x;
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) / 2.0);
// 6
R124i.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R8i.x)),-(intBitsToFloat(R8i.y)),-(intBitsToFloat(R8i.z)),-(intBitsToFloat(R8i.w))),vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R9i.z),intBitsToFloat(R9i.z))));
R124i.x = clampFI32(R124i.x);
PV0iy = R124i.x;
PV0iz = R124i.x;
PV0iw = R124i.x;
tempResultf = max(0.0, intBitsToFloat(PV1iz));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PS0i)));
R124i.y = floatBitsToInt(intBitsToFloat(R0i.y) + -(intBitsToFloat(R5i.y)));
R126i.z = floatBitsToInt(intBitsToFloat(R0i.x) + -(intBitsToFloat(R5i.y)));
R126i.w = floatBitsToInt(intBitsToFloat(R0i.z) + -(intBitsToFloat(R5i.y)));
PS1i = floatBitsToInt(exp2(intBitsToFloat(R126i.x)));
// 8
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R127i.w)));
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.z)),intBitsToFloat(backupReg0i)) + intBitsToFloat(backupReg0i));
R125i.y = clampFI32(R125i.y);
R125i.z = floatBitsToInt(-(intBitsToFloat(R4i.y)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(-(uf_blockPS6[29].w),intBitsToFloat(PS1i)) + 1.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
// 9
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(R127i.y)) + intBitsToFloat(R127i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)),intBitsToFloat(R123i.w)) + intBitsToFloat(R123i.w));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PS0i)));
R127i.w = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.y));
// 10
R126i.x = floatBitsToInt(intBitsToFloat(R6i.w) * intBitsToFloat(0x3dcccccd) + intBitsToFloat(R125i.y));
R125i.y = floatBitsToInt(intBitsToFloat(R7i.x) * 0.5 + 0.5);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), uf_blockPS6[30].w));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(PS1i)));
R127i.z = floatBitsToInt(exp2(intBitsToFloat(R125i.w)));
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(PV0iw)) + intBitsToFloat(R5i.y));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PV0iw)) + intBitsToFloat(R5i.y));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(R5i.z)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(PV0iw)) + intBitsToFloat(R5i.y));
R126i.z = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x3e19999a) + intBitsToFloat(R127i.x));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(R124i.x) + intBitsToFloat(R125i.y));
PV0ix = clampFI32(PV0ix);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), uf_blockPS6[16].w));
R1i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.z)),intBitsToFloat(R125i.z)) + intBitsToFloat(R125i.z));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R123i.w)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R123i.x)));
// 13
backupReg0i = R124i.y;
backupReg1i = R126i.z;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PV0iy)));
R124i.y = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(backupReg0i)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), intBitsToFloat(PV0ix)));
R125i.y = floatBitsToInt(intBitsToFloat(R6i.x) + -(intBitsToFloat(R127i.w)));
// 14
PV0ix = floatBitsToInt(intBitsToFloat(R6i.y) + -(intBitsToFloat(R126i.w)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), uf_blockPS6[1].w));
R127i.z = floatBitsToInt(uf_blockPS6[1].x + -(1.0));
PV0iw = floatBitsToInt(intBitsToFloat(R6i.z) + -(intBitsToFloat(R126i.z)));
R127i.y = floatBitsToInt(uf_blockPS6[1].y + -(1.0));
// 15
backupReg0i = R126i.x;
backupReg1i = R126i.z;
R126i.x = floatBitsToInt(uf_blockPS6[1].z + -(1.0));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R9i.w)) + intBitsToFloat(R127i.w));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(R11i.z)) + intBitsToFloat(backupReg0i));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R9i.w)) + intBitsToFloat(R126i.w));
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R9i.w)) + intBitsToFloat(backupReg1i));
// 16
R124i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].z, intBitsToFloat(R125i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].y, intBitsToFloat(R125i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockPS6[5].x, intBitsToFloat(R125i.w)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R126i.y)) + 1.0);
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R126i.y)) + 1.0);
// 17
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(R10i.x) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R126i.x = clampFI32(R126i.x);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R126i.y)) + 1.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R122i.x)) + intBitsToFloat(PV0iy));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R123i.w)) + intBitsToFloat(PV0iz));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),-(intBitsToFloat(R0i.z))) + intBitsToFloat(R4i.y));
// 18
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R126i.z)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R123i.y)) + intBitsToFloat(R124i.x));
R123i.z = floatBitsToInt(intBitsToFloat(R10i.z) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R123i.z = clampFI32(R123i.z);
R123i.w = floatBitsToInt(intBitsToFloat(R10i.y) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R123i.w = clampFI32(R123i.w);
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R126i.z)));
// 19
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R126i.x)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R126i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R123i.w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R123i.z)));
R5i.w = ((1.0 > intBitsToFloat(R10i.w))?-1:0);
// 20
R2i.x = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R4i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R2i.z = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(R16i.w)));
}
if( activeMaskStackC[1] == true ) {
// 0
PV0iw = floatBitsToInt(-(intBitsToFloat(R4i.x)) + uf_blockPS6[52].x);
// 1
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),uf_blockPS6[15].x) + uf_blockPS6[14].w);
R123i.y = clampFI32(R123i.y);
// 2
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), uf_blockPS6[13].w));
// 3
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(R5i.z)));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iw)),intBitsToFloat(R1i.z)) + intBitsToFloat(R1i.z));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R1i.z)));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].y, intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].z, intBitsToFloat(PV0iy)));
PV1iz = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].x, intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R123i.x)));
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.x)),intBitsToFloat(R123i.x)) + intBitsToFloat(R123i.x));
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].z,intBitsToFloat(PV1iw)) + intBitsToFloat(PV1iy));
R123i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].x,intBitsToFloat(PV1iw)) + intBitsToFloat(PV1iz));
R123i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].y,intBitsToFloat(PV1iw)) + intBitsToFloat(PV1ix));
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R1i.w)) + intBitsToFloat(R123i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R1i.w)) + intBitsToFloat(R123i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w),intBitsToFloat(R1i.w)) + intBitsToFloat(R123i.z));
// 8
backupReg0i = R123i.y;
R123i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].y,intBitsToFloat(R0i.z)) + intBitsToFloat(R123i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].z,intBitsToFloat(R0i.z)) + intBitsToFloat(R123i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].x,intBitsToFloat(R0i.z)) + intBitsToFloat(backupReg0i));
// 9
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R2i.x)) + intBitsToFloat(R123i.z));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R4i.y)) + intBitsToFloat(R123i.y));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R2i.z)) + intBitsToFloat(R123i.w));
// 10
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.x)) * 0.25);
PV0iz = floatBitsToInt(-(intBitsToFloat(R125i.y)) * 0.25);
PV0iw = floatBitsToInt(-(intBitsToFloat(R126i.z)) * 0.25);
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3fb8aa3b));
R126i.y = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3fb8aa3b));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3fb8aa3b));
// 12
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
// 13
PV1iz = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 4.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(R127i.z)));
// 14
R3i.x = ((R5i.w == 0)?(R126i.z):(PV1iz));
PV0iy = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 4.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(R126i.y)));
// 15
PV1ix = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 4.0);
R3i.y = ((R5i.w == 0)?(R125i.y):(PV0iy));
// 16
R3i.z = ((R5i.w == 0)?(R126i.x):(PV1ix));
}
// export
passPixelColor0 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
}
