#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;

vec4 zmCube(sampler2DArray s, vec2 st, int face, float cubeIndex, float lod) {
	return textureLod(s, vec3(st - 1.0, float(face) + cubeIndex * 6.0), lod);
}
// shader fb2e18ae56397ca7
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[33];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(2, 1, 1) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(3, 1, 2) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 3) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(5, 1, 4) uniform sampler2D textureUnitPS5;
TEXTURE_LAYOUT(6, 1, 5) uniform sampler2D textureUnitPS6;
TEXTURE_LAYOUT(7, 1, 6) uniform sampler2DArray textureUnitPS7;
TEXTURE_LAYOUT(11, 1, 7) uniform sampler2D textureUnitPS11;
TEXTURE_LAYOUT(12, 1, 8) uniform sampler2D textureUnitPS12;
TEXTURE_LAYOUT(14, 1, 9) uniform sampler2D textureUnitPS14;
TEXTURE_LAYOUT(15, 1, 10) uniform sampler2D textureUnitPS15;
TEXTURE_LAYOUT(16, 1, 11) uniform sampler2D textureUnitPS16;
in vec4 passParameterSem0;
in vec4 passParameterSem2;
in vec4 passParameterSem6;
layout(location = 0) out vec4 passPixelColor0;
layout(location = 1) out vec4 passPixelColor1;
layout(location = 2) out vec4 passPixelColor2;
layout(location = 3) out vec4 passPixelColor3;
layout(location = 4) out vec4 passPixelColor4;
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
ivec4 R21i = ivec4(0);
ivec4 R22i = ivec4(0);
ivec4 R23i = ivec4(0);
ivec4 R24i = ivec4(0);
ivec4 R25i = ivec4(0);
ivec4 R26i = ivec4(0);
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
vec3 cubeMapSTM;
int cubeMapFaceId;
float cubeMapArrayIndex7 = 0.0;
R0i = floatBitsToInt(passParameterSem0);
R1i = floatBitsToInt(passParameterSem2);
R2i = floatBitsToInt(passParameterSem6);
R3i.w = floatBitsToInt(texture(textureUnitPS6, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R11i.xyzw = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R2i.z),intBitsToFloat(R2i.w))).xyzw);
R10i.xyzw = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R2i.z),intBitsToFloat(R2i.w))).xyzw);
R2i.xy = floatBitsToInt(texture(textureUnitPS14, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xw);
R8i.xy = floatBitsToInt(texture(textureUnitPS15, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xy);
R23i.xyz = floatBitsToInt(texture(textureUnitPS4, vec2(intBitsToFloat(R2i.z),intBitsToFloat(R2i.w))).xyz);
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R11i.x) * 2.0 + -(1.0));
R127i.y = floatBitsToInt(intBitsToFloat(R11i.y) * 2.0 + -(1.0));
R127i.z = floatBitsToInt(intBitsToFloat(R11i.z) * 2.0 + -(1.0));
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(uf_remappedPS[0].x)) + intBitsToFloat(uf_remappedPS[1].x));
R14i.w = 0x40400000;
// 1
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), -(intBitsToFloat(R7i.w))));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), -(intBitsToFloat(R7i.w))));
R126i.z = floatBitsToInt(-(intBitsToFloat(R7i.w)));
R6i.w = 0x3f800000;
R2i.z = 0;
// 2
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedPS[2].x)));
R3i.y = floatBitsToInt(-(intBitsToFloat(R11i.w)) * 0.5 + 1.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedPS[3].x)));
R15i.w = floatBitsToInt(-(intBitsToFloat(R126i.z)) * intBitsToFloat(0x3ba3d70a));
R16i.y = 0;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(uf_remappedPS[3].y)) + intBitsToFloat(PV0iz));
// 4
R125i.x = floatBitsToInt(intBitsToFloat(R11i.w) * 255.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedPS[4].x)));
R0i.z = floatBitsToInt(intBitsToFloat(R7i.w) * intBitsToFloat(0x3d4ccccd) + -3.5);
R0i.z = clampFI32(R0i.z);
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.w)),intBitsToFloat(uf_remappedPS[3].z)) + intBitsToFloat(R122i.x));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 5
backupReg0i = R123i.w;
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(uf_remappedPS[2].y)) + intBitsToFloat(R126i.x));
R13i.z = floatBitsToInt(intBitsToFloat(uf_remappedPS[3].w) + intBitsToFloat(backupReg0i));
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(uf_remappedPS[4].y)) + intBitsToFloat(R126i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.w)),intBitsToFloat(uf_remappedPS[2].z)) + intBitsToFloat(R123i.w));
R8i.z = R13i.z;
R0i.w = R5i.x;
R0i.w = floatBitsToInt(intBitsToFloat(R0i.w) * 2.0);
R3i.x = R6i.y;
R3i.x = floatBitsToInt(intBitsToFloat(R3i.x) * 2.0);
// 7
R6i.x = floatBitsToInt(intBitsToFloat(uf_remappedPS[2].w) + intBitsToFloat(R123i.y));
R0i.y = R7i.z;
R0i.y = floatBitsToInt(intBitsToFloat(R0i.y) * 2.0);
R125i.z = floatBitsToInt(intBitsToFloat(R10i.w) * 255.0);
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.w)),intBitsToFloat(uf_remappedPS[4].z)) + intBitsToFloat(R123i.x));
R17i.w = floatBitsToInt(intBitsToFloat(R3i.y) * 3.0);
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R6i.y),intBitsToFloat(R7i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[5].x),intBitsToFloat(uf_remappedPS[5].y),intBitsToFloat(uf_remappedPS[5].z),0.0)));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R12i.x = floatBitsToInt(intBitsToFloat(R6i.x) * intBitsToFloat(0x3a83126f));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R6i.y),intBitsToFloat(R7i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[6].x),intBitsToFloat(uf_remappedPS[6].y),intBitsToFloat(uf_remappedPS[6].z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R124i.y = floatBitsToInt(intBitsToFloat(PV0ix) + 1.0);
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(uf_remappedPS[7].x)) + -(intBitsToFloat(uf_remappedPS[7].y)));
R123i.x = clampFI32(R123i.x);
R126i.y = floatBitsToInt(-(intBitsToFloat(R127i.y)) * 0.5 + 0.5);
R9i.z = floatBitsToInt(intBitsToFloat(uf_remappedPS[4].w) + intBitsToFloat(R127i.w));
R124i.w = floatBitsToInt(-(intBitsToFloat(PV1ix)));
R127i.z = int(intBitsToFloat(R125i.x));
// 11
R124i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R6i.y),intBitsToFloat(R7i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[8].x),intBitsToFloat(uf_remappedPS[8].y),intBitsToFloat(uf_remappedPS[8].z),0.0)));
PV1iy = R124i.x;
PV1iz = R124i.x;
PV1iw = R124i.x;
R3i.z = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
// 12
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(uf_remappedPS[9].z)) + -(intBitsToFloat(uf_remappedPS[9].x)));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z),intBitsToFloat(uf_remappedPS[9].z)) + -(intBitsToFloat(uf_remappedPS[9].y)));
R12i.z = floatBitsToInt(intBitsToFloat(R9i.z) * intBitsToFloat(0x3a83126f));
PV0iw = floatBitsToInt(intBitsToFloat(R126i.y) + 2.5);
tempResultf = max(0.0, intBitsToFloat(R3i.z));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R4i.y = floatBitsToInt(tempResultf);
// 13
backupReg0i = R124i.x;
backupReg1i = R124i.y;
redcCUBE(vec4(intBitsToFloat(R124i.w),intBitsToFloat(R124i.w),intBitsToFloat(backupReg0i),intBitsToFloat(backupReg1i)),vec4(intBitsToFloat(backupReg1i),intBitsToFloat(backupReg0i),intBitsToFloat(R124i.w),intBitsToFloat(R124i.w)),cubeMapSTM,cubeMapFaceId);
R124i.x = floatBitsToInt(cubeMapSTM.x);
R124i.y = floatBitsToInt(cubeMapSTM.y);
R124i.z = floatBitsToInt(cubeMapSTM.z);
R124i.w = cubeMapFaceId;
R16i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3daaaaab));
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].y), intBitsToFloat(R4i.y)));
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[10].w)) + 1.0);
R14i.z = R124i.w;
PV0iw = R127i.z & int(1);
PS0i = floatBitsToInt(1.0 / abs(intBitsToFloat(R124i.z)));
// 15
backupReg0i = R124i.x;
R124i.x = ((PV0iw == 0)?(0):(0x3f800000));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(PS0i)) + 1.5);
R127i.z = floatBitsToInt(-(intBitsToFloat(R8i.z)) + intBitsToFloat(uf_remappedPS[9].w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(PS0i)) + 1.5);
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 16
R14i.x = R123i.y;
R14i.y = R123i.w;
R124i.z = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0 + -(1.0));
R123i.w = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(PS1i)) + intBitsToFloat(uf_remappedPS[10].w))/2.0);
R4i.x = uf_remappedPS[11].y;
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R18i.y = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
// 18
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.x)),intBitsToFloat(R124i.z)) + intBitsToFloat(R127i.z));
R5i.y = uf_remappedPS[12].y;
R5i.z = uf_remappedPS[13].y;
R3i.w = floatBitsToInt(min(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y)));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 19
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(uf_remappedPS[14].x)) + -(intBitsToFloat(uf_remappedPS[14].y)));
R123i.x = clampFI32(R123i.x);
R19i.y = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(0x3fa66666));
R4i.z = floatBitsToInt(intBitsToFloat(R2i.y) + -(intBitsToFloat(R3i.w)));
R5i.w = 0;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 20
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PS1i)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PS1i)));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS1i)));
R2i.w = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
R9i.y = int(intBitsToFloat(R125i.z));
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[15].x), intBitsToFloat(uf_remappedPS[16].w)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[15].y), intBitsToFloat(uf_remappedPS[16].w)));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.y)),intBitsToFloat(R2i.y)) + 1.0);
R125i.w = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(uf_remappedPS[15].x));
R126i.y = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(uf_remappedPS[15].y));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.y)),intBitsToFloat(R124i.y)) + 1.0);
R125i.y = R127i.x;
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[15].z), intBitsToFloat(uf_remappedPS[16].w)));
R4i.w = floatBitsToInt(intBitsToFloat(R6i.z) + intBitsToFloat(uf_remappedPS[15].z));
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.z));
R127i.y = floatBitsToInt(tempResultf);
// 2
R126i.x = 0;
PV0iy = R127i.z;
R0i.z = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(uf_remappedPS[17].y));
R124i.w = R9i.y & 0x2;
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.x));
PS0i = floatBitsToInt(tempResultf);
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R6i.z),intBitsToFloat(R6i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.y),intBitsToFloat(PV0iy),intBitsToFloat(R2i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R127i.y)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R6i.y),intBitsToFloat(R7i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R2i.y),intBitsToFloat(R6i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R127i.w = tempi.x;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(PV1ix)));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R2i.y),intBitsToFloat(R6i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R124i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R2i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0ix)),intBitsToFloat(R0i.w)) + intBitsToFloat(R0i.x));
// 6
PV0ix = floatBitsToInt(max(-(intBitsToFloat(R127i.w)), 0.0));
R12i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)),intBitsToFloat(R3i.x)) + intBitsToFloat(R2i.y));
R2i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)),intBitsToFloat(R0i.y)) + intBitsToFloat(R6i.z));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(R126i.w)));
R124i.w = floatBitsToInt(float(R124i.w));
R124i.w = floatBitsToInt(intBitsToFloat(R124i.w) / 2.0);
// 7
PV1ix = R9i.y & 0xfc;
R20i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R124i.w)) + intBitsToFloat(R3i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R3i.z)) + intBitsToFloat(R126i.w));
R3i.w = floatBitsToInt(min(intBitsToFloat(PV0ix), 1.0));
tempResultf = max(0.0, intBitsToFloat(R2i.w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R126i.z = floatBitsToInt(tempResultf);
// 8
PV0ix = floatBitsToInt(max(-(intBitsToFloat(R123i.z)), intBitsToFloat(0xbf7d70a4)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
R21i.y = R1i.x;
R21i.y = floatBitsToInt(intBitsToFloat(R21i.y) / 2.0);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].x), intBitsToFloat(R4i.y)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R3i.y)) + intBitsToFloat(0x3c23d70a));
R123i.w = clampFI32(R123i.w);
PS0i = floatBitsToInt(float(PV1ix));
// 9
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[18].x), intBitsToFloat(R126i.z)));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R123i.w)));
R126i.z = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
R126i.w = floatBitsToInt(-(intBitsToFloat(R3i.w)) + 1.0);
R7i.x = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3b820821));
// 10
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(uf_remappedPS[19].x)) + intBitsToFloat(uf_remappedPS[20].w));
R125i.x = clampFI32(R125i.x);
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R123i.z = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
PV0iw = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(0xbe99999a));
R127i.w = floatBitsToInt(exp2(intBitsToFloat(R125i.z)));
// 11
R3i.x = R11i.w;
R3i.x = floatBitsToInt(intBitsToFloat(R3i.x) / 2.0);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(0xbe593484));
R15i.z = floatBitsToInt(intBitsToFloat(R7i.w) * intBitsToFloat(0x3c23d70a) + -(0.5));
R15i.z = clampFI32(R15i.z);
R8i.w = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x40200001));
R8i.w = clampFI32(R8i.w);
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0iy)));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3f22f983));
R22i.y = floatBitsToInt(intBitsToFloat(0xbf59999a) * intBitsToFloat(R8i.y) + 1.0);
R3i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.w)),intBitsToFloat(R126i.w)) + intBitsToFloat(R126i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R123i.y)) + intBitsToFloat(0x3fc90da4));
R2i.w = floatBitsToInt(exp2(intBitsToFloat(R124i.x)));
// 13
R18i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),-(intBitsToFloat(R123i.w))) + 1.0);
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].z),-(intBitsToFloat(R127i.w))) + intBitsToFloat(uf_remappedPS[10].z));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(uf_remappedPS[21].w)));
R0i.w = floatBitsToInt(intBitsToFloat(uf_remappedPS[21].z) + -(1.0));
tempResultf = max(0.0, intBitsToFloat(R125i.x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R3i.y = floatBitsToInt(tempResultf);
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.w),intBitsToFloat(R126i.y),intBitsToFloat(R4i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.w),intBitsToFloat(R126i.y),intBitsToFloat(R4i.w),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.y = floatBitsToInt(intBitsToFloat(uf_remappedPS[21].x) + -(1.0));
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R2i.y),intBitsToFloat(R6i.z),0.0)));
tempi.x = clampFI32(tempi.x);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 16
R0i.x = floatBitsToInt(intBitsToFloat(uf_remappedPS[21].y) + -(1.0));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS1i)));
tempResultf = max(0.0, intBitsToFloat(PV1ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 17
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(uf_remappedPS[16].w)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedPS[16].w)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(uf_remappedPS[16].w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[18].z), intBitsToFloat(PS0i)));
R4i.w = floatBitsToInt(intBitsToFloat(R124i.w) * intBitsToFloat(0x3e19999a));
// 18
tempi.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R127i.x)),-(intBitsToFloat(R124i.y)),-(intBitsToFloat(R127i.z)),intBitsToFloat(0x80000000)),vec4(-(intBitsToFloat(R125i.x)),-(intBitsToFloat(R126i.y)),-(intBitsToFloat(R126i.z)),0.0)));
tempi.x = clampFI32(tempi.x);
PV0ix = tempi.x;
PV0iy = tempi.x;
R6i.z = tempi.x;
PV0iw = tempi.x;
R5i.z = floatBitsToInt(exp2(intBitsToFloat(PV1iw)));
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R6i.y),intBitsToFloat(R7i.z),intBitsToFloat(R7i.z)),vec4(-(intBitsToFloat(R125i.x)),-(intBitsToFloat(R126i.y)),-(intBitsToFloat(R126i.z)),-(intBitsToFloat(R5i.w)))));
tempi.x = clampFI32(tempi.x);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R5i.w = floatBitsToInt(-(intBitsToFloat(PV0ix)) + 1.0);
// 20
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R6i.y),intBitsToFloat(R7i.z),intBitsToFloat(R7i.z)),vec4(-(intBitsToFloat(R127i.x)),-(intBitsToFloat(R124i.y)),-(intBitsToFloat(R127i.z)),-(intBitsToFloat(R126i.x)))));
tempi.x = clampFI32(tempi.x);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R9i.w = tempi.x;
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(PV1ix)));
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R8i.z),intBitsToFloat(R9i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(uf_remappedPS[22].x),intBitsToFloat(uf_remappedPS[22].y),intBitsToFloat(uf_remappedPS[22].z),intBitsToFloat(uf_remappedPS[22].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(R6i.y)) + -(intBitsToFloat(R6i.y)));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R8i.z),intBitsToFloat(R9i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(uf_remappedPS[23].x),intBitsToFloat(uf_remappedPS[23].y),intBitsToFloat(uf_remappedPS[23].z),intBitsToFloat(uf_remappedPS[23].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R8i.z),intBitsToFloat(R9i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(uf_remappedPS[24].x),intBitsToFloat(uf_remappedPS[24].y),intBitsToFloat(uf_remappedPS[24].z),intBitsToFloat(uf_remappedPS[24].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.z)));
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[18].w)),intBitsToFloat(R5i.z)) + 1.0);
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R127i.z)));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.z)),intBitsToFloat(R5i.w)) + intBitsToFloat(R5i.w));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.x) + 1.0);
R124i.y = floatBitsToInt(-(intBitsToFloat(R7i.x)) * intBitsToFloat(0x3d23d70a) + intBitsToFloat(0x3d23d70a));
// 4
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.w)),intBitsToFloat(R3i.z)) + intBitsToFloat(R3i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.z)),intBitsToFloat(R127i.z)) + intBitsToFloat(R127i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.w)),intBitsToFloat(backupReg0i)) + intBitsToFloat(backupReg0i));
R124i.w = floatBitsToInt(-(intBitsToFloat(R3i.x)) * 3.0 + 4.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PV1iw)) + intBitsToFloat(PV1iw));
// 5
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R123i.y)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R123i.x)));
R127i.z = floatBitsToInt(intBitsToFloat(R8i.w) * intBitsToFloat(0x3dcccccd));
R125i.w = floatBitsToInt(intBitsToFloat(R7i.w) * intBitsToFloat(0x3ba3d70a) + intBitsToFloat(0xbfe66666));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(uf_remappedPS[25].w)));
// 6
backupReg0i = R0i.x;
backupReg1i = R3i.y;
backupReg2i = R124i.w;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R4i.z)) + 1.0);
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R4i.z)) + 1.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[19].y), intBitsToFloat(backupReg1i)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R22i.y)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(backupReg2i));
// 7
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x),intBitsToFloat(R7i.x)) + intBitsToFloat(R124i.y));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS0i)));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R4i.z)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.z)),intBitsToFloat(R125i.w)) + intBitsToFloat(R125i.w));
R123i.w = clampFI32(R123i.w);
R125i.x = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
// 8
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R22i.y)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),-(intBitsToFloat(R126i.x))) + intBitsToFloat(R124i.x));
PV0iz = floatBitsToInt(-(intBitsToFloat(R124i.w)) + 1.0);
R125i.w = floatBitsToInt(intBitsToFloat(R8i.w) * intBitsToFloat(0x3dcccccd) + intBitsToFloat(R123i.w));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.z));
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(uf_remappedPS[26].w)));
R3i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.x)),intBitsToFloat(PV0iz)) + intBitsToFloat(PV0iz));
R0i.w = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(R123i.y));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),-(intBitsToFloat(R126i.y))) + intBitsToFloat(R124i.x));
// 10
backupReg0i = R8i.x;
R8i.x = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(R122i.x));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PV1iy)));
PV0iz = backupReg0i;
PV0iz = clampFI32(PV0iz);
PV0iw = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
R8i.w = floatBitsToInt(intBitsToFloat(PV1ix) * 0.25);
// 11
backupReg0i = R9i.y;
R10i.x = floatBitsToInt(intBitsToFloat(R10i.x) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R10i.x = clampFI32(R10i.x);
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(PV0iz)) + intBitsToFloat(R125i.w));
R10i.z = floatBitsToInt(intBitsToFloat(R10i.z) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R10i.z = clampFI32(R10i.z);
R10i.w = floatBitsToInt(intBitsToFloat(R10i.y) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R10i.w = clampFI32(R10i.w);
PS1i = backupReg0i & int(1);
// 12
PV0ix = floatBitsToInt(intBitsToFloat(R11i.z) * intBitsToFloat(0x3eaaaaab));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),-(intBitsToFloat(R3i.x))) + intBitsToFloat(R124i.w));
R26i.w = 0x3f800000;
R6i.z = floatBitsToInt(float(PS1i));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(PV0ix),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3eaaaaab),intBitsToFloat(0x3eaaaaab),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R11i.w = tempi.x;
R25i.y = 0;
// 14
R5i.w = 0x3f800000;
R24i.w = 0x3f800000;
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedPS[6].x),intBitsToFloat(uf_remappedPS[6].y),intBitsToFloat(uf_remappedPS[6].z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R12i.y),intBitsToFloat(R2i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedPS[8].x),intBitsToFloat(uf_remappedPS[8].y),intBitsToFloat(uf_remappedPS[8].z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R12i.y),intBitsToFloat(R2i.z),0.0)));
PV1iy = R126i.x;
PV1iz = R126i.x;
PV1iw = R126i.x;
R126i.z = floatBitsToInt(-(intBitsToFloat(PV0ix)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedPS[5].x),intBitsToFloat(uf_remappedPS[5].y),intBitsToFloat(uf_remappedPS[5].z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R12i.y),intBitsToFloat(R2i.z),0.0)));
PV0ix = tempi.x;
R126i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
backupReg0i = R126i.x;
backupReg1i = R126i.z;
redcCUBE(vec4(intBitsToFloat(backupReg1i),intBitsToFloat(backupReg1i),intBitsToFloat(backupReg0i),intBitsToFloat(PV0ix)),vec4(intBitsToFloat(PV0ix),intBitsToFloat(backupReg0i),intBitsToFloat(backupReg1i),intBitsToFloat(backupReg1i)),cubeMapSTM,cubeMapFaceId);
R126i.x = floatBitsToInt(cubeMapSTM.x);
R126i.y = floatBitsToInt(cubeMapSTM.y);
R126i.z = floatBitsToInt(cubeMapSTM.z);
R126i.w = cubeMapFaceId;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[16].w), intBitsToFloat(uf_remappedPS[16].w)));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(PS1i)));
R17i.z = R126i.w;
PS0i = floatBitsToInt(1.0 / abs(intBitsToFloat(R126i.z)));
// 5
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R8i.w)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PS0i)) + 1.5);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(PS0i)) + 1.5);
// 6
R17i.x = R123i.w;
R17i.y = R123i.z;
R2i.z = floatBitsToInt(textureLod(textureUnitPS12, vec2(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y)),0.0).x);
R14i.xyz = floatBitsToInt(zmCube(textureUnitPS7, intBitsToFloat(R14i.xy), R14i.z, cubeMapArrayIndex7, intBitsToFloat(R14i.w)).xyz);
R15i.y = floatBitsToInt(textureLod(textureUnitPS5, vec2(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y)),intBitsToFloat(R15i.w)).x);
R12i.x = floatBitsToInt(textureLod(textureUnitPS0, vec2(intBitsToFloat(R12i.x),intBitsToFloat(R12i.z)),0.0).x);
R16i.xyz = floatBitsToInt(texture(textureUnitPS16, vec2(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y))).xyz);
R17i.xyz = floatBitsToInt(zmCube(textureUnitPS7, intBitsToFloat(R17i.xy), R17i.z, cubeMapArrayIndex7, intBitsToFloat(R17i.w)).xyz);
R18i.xyz = floatBitsToInt(texture(textureUnitPS11, vec2(intBitsToFloat(R18i.x),intBitsToFloat(R18i.y))).xyz);
// export
passPixelColor4 = vec4(intBitsToFloat(R11i.w), intBitsToFloat(R11i.w), intBitsToFloat(R11i.w), intBitsToFloat(R11i.w));
// 0
PV0ix = floatBitsToInt(min(intBitsToFloat(R14i.y), intBitsToFloat(R14i.z)));
PV0iy = floatBitsToInt(intBitsToFloat(R15i.y) + intBitsToFloat(uf_remappedPS[27].z));
PV0iy = clampFI32(PV0iy);
PV0iz = floatBitsToInt(max(intBitsToFloat(R14i.y), intBitsToFloat(R14i.z)));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[9].w)),intBitsToFloat(R2i.z)) + intBitsToFloat(R19i.y));
R122i.x = floatBitsToInt(intBitsToFloat(R12i.x) * 2.0 + -(1.0));
// 1
R126i.x = floatBitsToInt(min(intBitsToFloat(R14i.x), intBitsToFloat(PV0ix)));
R127i.y = floatBitsToInt(max(intBitsToFloat(R14i.x), intBitsToFloat(PV0iz)));
R126i.z = floatBitsToInt(intBitsToFloat(R123i.w) * 0.25);
R126i.z = clampFI32(R126i.z);
R126i.w = floatBitsToInt(intBitsToFloat(R122i.x) * 25.0 + intBitsToFloat(R13i.z));
R25i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R20i.y)));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R124i.y = floatBitsToInt(intBitsToFloat(R14i.x) + -(intBitsToFloat(R127i.y)));
R127i.z = floatBitsToInt(intBitsToFloat(R14i.y) + -(intBitsToFloat(R127i.y)));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(0x2edbe6ff));
R124i.x = floatBitsToInt(intBitsToFloat(R14i.z) + -(intBitsToFloat(R127i.y)));
// 3
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(R25i.x)));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.z)),intBitsToFloat(PV0ix)) + intBitsToFloat(PV0ix));
R14i.z = floatBitsToInt(-(intBitsToFloat(R126i.w)) + intBitsToFloat(uf_remappedPS[28].x));
R11i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.x), intBitsToFloat(R8i.x)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 4
backupReg0i = R126i.z;
PV0ix = floatBitsToInt(-(intBitsToFloat(R125i.x)) + 1.0);
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R0i.w)));
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.x)),intBitsToFloat(PS1i)) + 1.0);
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)),intBitsToFloat(R123i.y)) + intBitsToFloat(R123i.y));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.y), intBitsToFloat(R8i.x)));
// 5
PV1ix = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R4i.w)) + intBitsToFloat(R125i.x));
R17i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.z), intBitsToFloat(R8i.x)));
PV1iw = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(0x2edbe6ff));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.x), intBitsToFloat(R9i.y)));
// 6
R18i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.y), intBitsToFloat(R9i.y)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(R0i.z)) + intBitsToFloat(R126i.w));
R123i.y = clampFI32(R123i.y);
R18i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.z), intBitsToFloat(R9i.y)));
R125i.x = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 7
backupReg0i = R123i.y;
R123i.x = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0xbdcccccd) + intBitsToFloat(0x3dcccccd));
R123i.y = floatBitsToInt(intBitsToFloat(backupReg0i) * 0.5 + 0.5);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R21i.y)) + intBitsToFloat(R21i.y));
R25i.w = backupReg0i;
// 8
PV0iz = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(R123i.x));
PV0iz = clampFI32(PV0iz);
PV0iw = floatBitsToInt(intBitsToFloat(R9i.w) + intBitsToFloat(R123i.y));
PV0iw = clampFI32(PV0iw);
// 9
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV0iw)));
tempResultf = max(0.0, intBitsToFloat(PV0iz));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PS1i)));
// 11
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 12
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PS1i)));
// 13
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R125i.x)));
// 14
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV1iz)) + intBitsToFloat(R127i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(PV1iz)) + intBitsToFloat(R127i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(PV1iz)) + intBitsToFloat(R127i.y));
// 15
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R123i.z)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R123i.w)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R123i.y)));
// 16
PV0ix = floatBitsToInt(intBitsToFloat(R16i.y) + -(intBitsToFloat(R127i.z)));
PV0iz = floatBitsToInt(intBitsToFloat(R16i.z) + -(intBitsToFloat(R127i.y)));
PV0iw = floatBitsToInt(intBitsToFloat(R16i.x) + -(intBitsToFloat(R124i.x)));
// 17
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R15i.z)) + intBitsToFloat(R127i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R15i.z)) + intBitsToFloat(R124i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R15i.z)) + intBitsToFloat(R127i.z));
// 18
R26i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R4i.z)));
R26i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R3i.y)));
R26i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(R0i.x)));
// 0
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.z),intBitsToFloat(uf_remappedPS[29].x)) + intBitsToFloat(uf_remappedPS[30].w));
R123i.z = clampFI32(R123i.z);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(uf_remappedPS[31].w)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[32].y),intBitsToFloat(R0i.z)) + intBitsToFloat(R26i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[32].x),intBitsToFloat(R0i.z)) + intBitsToFloat(R26i.x));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[32].x), intBitsToFloat(R14i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[32].y), intBitsToFloat(R14i.y)));
// 2
backupReg0i = R123i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[32].z),intBitsToFloat(R0i.z)) + intBitsToFloat(R26i.z));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R22i.y)));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.x)),intBitsToFloat(R123i.y)) + intBitsToFloat(R123i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.x)),intBitsToFloat(backupReg0i)) + intBitsToFloat(backupReg0i));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[32].z), intBitsToFloat(R14i.y)));
// 3
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R10i.x)));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.x)),intBitsToFloat(R123i.x)) + intBitsToFloat(R123i.x));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R3i.z)));
R125i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iy)),intBitsToFloat(R3i.z)) + intBitsToFloat(R3i.z));
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(R10i.w)));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[31].x), intBitsToFloat(PV1iz)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(R125i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[31].y), intBitsToFloat(PV1iz)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R10i.z)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[31].z), intBitsToFloat(PV1iz)));
// 5
backupReg0i = R127i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R2i.x)) + intBitsToFloat(R0i.w));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R2i.x)) + intBitsToFloat(R11i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[26].x),intBitsToFloat(R124i.y)) + intBitsToFloat(PV0ix));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R2i.x)) + intBitsToFloat(R17i.z));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[26].y),intBitsToFloat(R124i.y)) + intBitsToFloat(PV0iz));
// 6
backupReg0i = R123i.z;
R123i.x = floatBitsToInt(intBitsToFloat(R124i.w) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R123i.y = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R123i.z = floatBitsToInt(intBitsToFloat(R124i.x) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[26].z),intBitsToFloat(R124i.y)) + intBitsToFloat(R126i.y));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(R10i.y)) + intBitsToFloat(backupReg0i));
// 7
backupReg0i = R127i.x;
backupReg1i = R126i.w;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.x),intBitsToFloat(R10i.y)) + intBitsToFloat(R126i.x));
PV1iy = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(R123i.y));
PV1iz = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(R123i.z));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.z),intBitsToFloat(R10i.y)) + intBitsToFloat(R123i.w));
PS1i = floatBitsToInt(intBitsToFloat(backupReg1i) + intBitsToFloat(R123i.x));
// 8
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R23i.x),intBitsToFloat(R6i.z)) + intBitsToFloat(PV1iz));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R23i.y),intBitsToFloat(R6i.z)) + intBitsToFloat(PV1iy));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R23i.z),intBitsToFloat(R6i.z)) + intBitsToFloat(PS1i));
R24i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[25].x),intBitsToFloat(R3i.x)) + intBitsToFloat(R127i.z));
// 9
R24i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[25].y),intBitsToFloat(R3i.x)) + intBitsToFloat(R127i.x));
R24i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[25].z),intBitsToFloat(R3i.x)) + intBitsToFloat(R126i.w));
R25i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R8i.y)),intBitsToFloat(R125i.w)) + intBitsToFloat(R125i.w));
// 10
R3i.x = R5i.x;
R3i.y = R5i.y;
R3i.z = R5i.z;
R3i.w = R5i.w;
// 11
R1i.x = R24i.x;
R1i.y = R24i.y;
R1i.z = R24i.z;
R1i.w = R24i.w;
// 12
R0i.x = R25i.x;
R0i.y = R25i.y;
R0i.z = R25i.z;
R0i.w = R25i.w;
// 13
R2i.x = R26i.x;
R2i.y = R26i.y;
R2i.z = R26i.z;
R2i.w = R26i.w;
// export
passPixelColor0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
passPixelColor1 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
passPixelColor2 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
passPixelColor3 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
}
