#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;

vec4 zmCube(sampler2DArray s, vec2 st, int face, float cubeIndex, float lod) {
	return textureLod(s, vec3(st - 1.0, float(face) + cubeIndex * 6.0), lod);
}
// shader 1c7db40ff5d693ab
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
float cubeMapArrayIndex7 = 0.0;
R0i = floatBitsToInt(passParameterSem0);
R1i = floatBitsToInt(passParameterSem2);
R2i = floatBitsToInt(passParameterSem6);
if( activeMaskStackC[1] == true ) {
R3i.w = floatBitsToInt(texture(textureUnitPS6, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R7i.xyzw = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R2i.z),intBitsToFloat(R2i.w))).xyzw);
R15i.xyzw = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R2i.z),intBitsToFloat(R2i.w))).xyzw);
R2i.xy = floatBitsToInt(texture(textureUnitPS14, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xw);
R4i.xy = floatBitsToInt(texture(textureUnitPS15, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xy);
R16i.xyz = floatBitsToInt(texture(textureUnitPS4, vec2(intBitsToFloat(R2i.z),intBitsToFloat(R2i.w))).xyz);
R14i.x = floatBitsToInt(texture(textureUnitPS11, vec2(intBitsToFloat(R2i.z),intBitsToFloat(R2i.w))).x);
}
if( activeMaskStackC[1] == true ) {
// 0
R124i.x = floatBitsToInt(intBitsToFloat(R7i.x) * 2.0 + -(1.0));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(uf_remappedPS[0].x)) + intBitsToFloat(uf_remappedPS[1].x));
R3i.z = 0;
R5i.w = 0x3f800000;
R126i.y = floatBitsToInt(intBitsToFloat(R7i.y) * 2.0 + -(1.0));
// 1
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), -(intBitsToFloat(R125i.y))));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), -(intBitsToFloat(R125i.y))));
R127i.z = floatBitsToInt(-(intBitsToFloat(R125i.y)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(uf_remappedPS[2].x)) + -(intBitsToFloat(uf_remappedPS[2].y)));
R127i.w = clampFI32(R127i.w);
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[3].w)) + 1.0);
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(uf_remappedPS[4].x)));
// 3
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(uf_remappedPS[4].y)) + intBitsToFloat(PS0i));
R3i.y = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(uf_remappedPS[5].x)));
R10i.w = floatBitsToInt(-(intBitsToFloat(R127i.z)) * intBitsToFloat(0x3ba3d70a));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 4
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(uf_remappedPS[5].y)) + intBitsToFloat(PV1iz));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(uf_remappedPS[6].x)));
R125i.z = floatBitsToInt(intBitsToFloat(R7i.z) * 2.0 + -(1.0));
R127i.w = floatBitsToInt(max(intBitsToFloat(R15i.y), intBitsToFloat(R15i.z)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 5
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(uf_remappedPS[6].y)) + intBitsToFloat(PV0iy));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)),intBitsToFloat(uf_remappedPS[4].z)) + intBitsToFloat(backupReg0i));
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS0i)));
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.y)),intBitsToFloat(R0i.y)) + 1.0);
R6i.y = floatBitsToInt(max(intBitsToFloat(R15i.x), intBitsToFloat(R127i.w)));
R9i.z = floatBitsToInt(intBitsToFloat(uf_remappedPS[4].w) + intBitsToFloat(R123i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)),intBitsToFloat(uf_remappedPS[5].z)) + intBitsToFloat(R125i.x));
tempResultf = max(0.0, intBitsToFloat(R3i.y));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R127i.y = floatBitsToInt(tempResultf);
// 7
R5i.x = floatBitsToInt(intBitsToFloat(uf_remappedPS[5].w) + intBitsToFloat(R123i.w));
R8i.y = R9i.z;
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)),intBitsToFloat(uf_remappedPS[6].z)) + intBitsToFloat(R127i.x));
R126i.w = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(0xbe99999a));
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.x));
R4i.z = floatBitsToInt(tempResultf);
// 8
R9i.x = floatBitsToInt(intBitsToFloat(R5i.x) * intBitsToFloat(0x3a83126f));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].y), intBitsToFloat(R127i.y)));
R8i.z = floatBitsToInt(intBitsToFloat(uf_remappedPS[6].w) + intBitsToFloat(R123i.z));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x), intBitsToFloat(R127i.y)));
R13i.x = floatBitsToInt(min(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y)));
// 9
R127i.x = uf_remappedPS[7].y;
R9i.y = floatBitsToInt(intBitsToFloat(R8i.z) * intBitsToFloat(0x3a83126f));
R127i.z = uf_remappedPS[8].y;
R125i.w = floatBitsToInt(min(intBitsToFloat(R15i.y), intBitsToFloat(R15i.z)));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iy)));
// 10
backupReg0i = R127i.w;
R123i.x = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(PS1i)) + intBitsToFloat(uf_remappedPS[3].w))/2.0);
R2i.y = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(0x2edbe6ff));
R126i.z = uf_remappedPS[9].y;
R127i.w = floatBitsToInt(intBitsToFloat(R13i.x) + intBitsToFloat(0xbecccccd));
R125i.x = floatBitsToInt(exp2(intBitsToFloat(backupReg0i)));
// 11
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(uf_remappedPS[10].x)) + -(intBitsToFloat(uf_remappedPS[10].y)));
R123i.x = clampFI32(R123i.x);
R11i.y = floatBitsToInt(intBitsToFloat(backupReg0i) + 0.5);
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(uf_remappedPS[11].y)));
R126i.w = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0x40200001));
R126i.w = clampFI32(R126i.w);
R14i.y = floatBitsToInt(intBitsToFloat(0xbf59999a) * intBitsToFloat(R4i.y) + 1.0);
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.z),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R3i.x),intBitsToFloat(R0i.y),intBitsToFloat(R5i.z),0.0)));
tempi.x = clampFI32(tempi.x);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 14
R0i.x = floatBitsToInt(min(intBitsToFloat(R15i.x), intBitsToFloat(R125i.w)));
R12i.y = floatBitsToInt(intBitsToFloat(R127i.w) * 10.0);
R12i.y = clampFI32(R12i.y);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[12].z), intBitsToFloat(PS1i)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].z),-(intBitsToFloat(R125i.x))) + intBitsToFloat(uf_remappedPS[3].z));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 15
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(uf_remappedPS[13].x)) + intBitsToFloat(uf_remappedPS[14].w));
R125i.x = clampFI32(R125i.x);
R127i.y = floatBitsToInt(intBitsToFloat(PS0i) * 4.0 + -3.0);
R127i.y = clampFI32(R127i.y);
R126i.z = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0x3dcccccd));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R14i.y)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 16
R17i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(PS1i)));
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS1i)));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PS1i)));
R127i.w = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(0x3ba3d70a) + intBitsToFloat(0xbfe66666));
tempResultf = max(0.0, intBitsToFloat(R127i.x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 17
R6i.x = floatBitsToInt(intBitsToFloat(R1i.x) * intBitsToFloat(0x3f4ccccd));
R13i.y = floatBitsToInt(intBitsToFloat(R127i.y) + -(0.5));
R13i.y = floatBitsToInt(intBitsToFloat(R13i.y) * 4.0);
R13i.y = clampFI32(R13i.y);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[12].x), intBitsToFloat(PS0i)));
R6i.w = floatBitsToInt(intBitsToFloat(R1i.y) * intBitsToFloat(0x3f4ccccd));
PS1i = floatBitsToInt(exp2(intBitsToFloat(R127i.z)));
// 18
R8i.x = floatBitsToInt(intBitsToFloat(R1i.z) * intBitsToFloat(0x3f4ccccd));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.z)),intBitsToFloat(R127i.w)) + intBitsToFloat(R127i.w));
R123i.y = clampFI32(R123i.y);
R2i.z = floatBitsToInt(-(intBitsToFloat(R2i.w)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[12].w)),intBitsToFloat(PS1i)) + 1.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iz)));
// 19
backupReg0i = R123i.y;
R12i.x = R1i.w;
R12i.x = clampFI32(R12i.x);
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)),intBitsToFloat(R123i.w)) + intBitsToFloat(R123i.w));
R6i.z = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0x3dcccccd) + intBitsToFloat(backupReg0i));
PV1iw = floatBitsToInt(intBitsToFloat(R13i.y) + intBitsToFloat(0x3f4ccccd));
PV1iw = clampFI32(PV1iw);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R124i.z));
// 20
R2i.x = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3dcccccd) + 1.0);
R5i.y = R6i.y;
R5i.y = clampFI32(R5i.y);
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(uf_remappedPS[15].w)));
R3i.w = floatBitsToInt(intBitsToFloat(PV1iw) + -(1.0));
tempResultf = max(0.0, intBitsToFloat(R125i.x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R0i.w = floatBitsToInt(tempResultf);
}
if( activeMaskStackC[1] == true ) {
// 0
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[16].x), intBitsToFloat(uf_remappedPS[17].w)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[16].y), intBitsToFloat(uf_remappedPS[17].w)));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R14i.y)));
R4i.w = floatBitsToInt(intBitsToFloat(R2i.x) * 75.0);
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(R2i.y));
// 1
R125i.x = R126i.x;
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.x)),intBitsToFloat(R126i.w)) + 1.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[16].z), intBitsToFloat(uf_remappedPS[17].w)));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)),intBitsToFloat(R125i.y)) + 1.0);
R0i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R10i.z)),intBitsToFloat(R2i.z)) + intBitsToFloat(R2i.z));
// 2
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[13].y), intBitsToFloat(R0i.w)));
PV0iy = R126i.z;
R2i.z = floatBitsToInt(intBitsToFloat(uf_remappedPS[18].x) + -(intBitsToFloat(R6i.x)));
R0i.w = floatBitsToInt(intBitsToFloat(uf_remappedPS[18].y) + -(intBitsToFloat(R6i.w)));
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.w));
PS0i = floatBitsToInt(tempResultf);
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R5i.z),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(PV0iy),intBitsToFloat(R3i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R4i.z)));
// 4
backupReg0i = R127i.y;
backupReg1i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(0x2edbe6ff));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(PV1ix)));
R124i.z = backupReg0i;
R124i.z = clampFI32(R124i.z);
R8i.w = floatBitsToInt(intBitsToFloat(uf_remappedPS[18].z) + -(intBitsToFloat(R8i.x)));
PS0i = floatBitsToInt(exp2(intBitsToFloat(backupReg1i)));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R0i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(uf_remappedPS[19].w)));
// 6
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(PS1i)));
R126i.y = R4i.x;
R126i.y = clampFI32(R126i.y);
PV0iz = floatBitsToInt(max(-(intBitsToFloat(PV1ix)), 0.0));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(R127i.y)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 7
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(min(intBitsToFloat(PV0iz), 1.0));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R3i.y)) + intBitsToFloat(R127i.y));
R127i.w = floatBitsToInt(intBitsToFloat(R15i.w) * 255.0);
R127i.y = floatBitsToInt(-(intBitsToFloat(R6i.z)) + 1.0);
// 8
R127i.x = floatBitsToInt(intBitsToFloat(R15i.x) + -(intBitsToFloat(R6i.y)));
PV0iy = floatBitsToInt(max(-(intBitsToFloat(R123i.z)), intBitsToFloat(0xbf7d70a4)));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) * 5.0);
PV0iz = clampFI32(PV0iz);
R125i.w = floatBitsToInt(intBitsToFloat(R15i.y) + -(intBitsToFloat(R6i.y)));
R124i.w = floatBitsToInt(intBitsToFloat(R15i.z) + -(intBitsToFloat(R6i.y)));
// 9
backupReg0i = R127i.y;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(PV0iz)) + 1.0);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R5i.y)));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R126i.y)) + intBitsToFloat(R6i.z));
R126i.w = floatBitsToInt(intBitsToFloat(PV0iy) + 0.5);
R3i.w = 0;
// 10
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R125i.x)) + intBitsToFloat(R6i.y));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R125i.x)) + intBitsToFloat(R6i.y));
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
R123i.w = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
R127i.w = int(intBitsToFloat(R127i.w));
// 11
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(R125i.x)) + intBitsToFloat(R6i.y));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R124i.x)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R123i.w)) + intBitsToFloat(0xbe593484));
R9i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R124i.x)));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0iz)));
// 12
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R124i.x)));
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3f22f983));
PV0iz = floatBitsToInt(intBitsToFloat(0x3f895ef0) * intBitsToFloat(R127i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R123i.z)) + intBitsToFloat(0x3fc90da4));
R127i.y = R127i.w & int(1);
// 13
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),-(intBitsToFloat(R123i.w))) + 1.0);
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R127i.x)) + intBitsToFloat(0xba0a8ec8));
R5i.y = clampFI32(R5i.y);
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R126i.y)) + intBitsToFloat(0xba0a8ec8));
R5i.z = clampFI32(R5i.z);
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),-(intBitsToFloat(R10i.z))) + intBitsToFloat(R2i.w));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R125i.x)) + intBitsToFloat(0xba0a8ec8));
R3i.z = clampFI32(R3i.z);
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R17i.x),intBitsToFloat(R17i.y),intBitsToFloat(R13i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[16].x),intBitsToFloat(uf_remappedPS[16].y),intBitsToFloat(uf_remappedPS[16].z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(float(R127i.y));
// 15
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.x), intBitsToFloat(PS0i)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y), intBitsToFloat(PS0i)));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.z), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(max(-(intBitsToFloat(PV0ix)), 0.0));
PS1i = floatBitsToInt(intBitsToFloat(R7i.z) * intBitsToFloat(0x3eaaaaab));
// 16
R123i.x = floatBitsToInt(intBitsToFloat(R7i.y) * intBitsToFloat(0x3eaaaaab) + intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(min(intBitsToFloat(PV1iw), 1.0));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.z), -(intBitsToFloat(R3i.w))));
// 17
R7i.x = floatBitsToInt(intBitsToFloat(R7i.x) * intBitsToFloat(0x3eaaaaab) + intBitsToFloat(R123i.x));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(0xbecccccd));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.z),-(intBitsToFloat(R126i.z))) + intBitsToFloat(PS0i));
// 18
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.y),-(intBitsToFloat(R125i.y))) + intBitsToFloat(R122i.x));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R4i.w)));
R7i.z = clampFI32(R7i.z);
// 19
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.x),-(intBitsToFloat(R126i.x))) + intBitsToFloat(R123i.x));
// 20
PV0iy = R12i.z;
PV0iy = clampFI32(PV0iy);
// 21
R14i.z = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(0xbecccccd));
}
if( activeMaskStackC[1] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedPS[20].x),intBitsToFloat(uf_remappedPS[20].y),intBitsToFloat(uf_remappedPS[20].z),intBitsToFloat(uf_remappedPS[20].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedPS[21].x),intBitsToFloat(uf_remappedPS[21].y),intBitsToFloat(uf_remappedPS[21].z),intBitsToFloat(uf_remappedPS[21].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.z = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedPS[22].x),intBitsToFloat(uf_remappedPS[22].y),intBitsToFloat(uf_remappedPS[22].z),intBitsToFloat(uf_remappedPS[22].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R126i.z)));
// 3
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R126i.z)));
}
if( activeMaskStackC[1] == true ) {
R9i.y = floatBitsToInt(textureLod(textureUnitPS0, vec2(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y)),0.0).x);
R10i.w = floatBitsToInt(textureLod(textureUnitPS5, vec2(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y)),intBitsToFloat(R10i.w)).x);
R11i.xyz = floatBitsToInt(texture(textureUnitPS12, vec2(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y))).xyz);
}
if( activeMaskStackC[1] == true ) {
// 0
backupReg0i = R9i.y;
PV0ix = floatBitsToInt(intBitsToFloat(R10i.w) + intBitsToFloat(uf_remappedPS[23].z));
PV0ix = clampFI32(PV0ix);
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(R6i.z)));
R123i.z = floatBitsToInt(intBitsToFloat(backupReg0i) * 2.0 + -(1.0));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(R6i.z)));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), intBitsToFloat(R6i.z)));
// 1
R123i.x = floatBitsToInt(intBitsToFloat(R123i.z) * 25.0 + intBitsToFloat(R9i.z));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedPS[24].z)));
// 2
R4i.y = R3i.y;
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R12i.y)));
R10i.w = floatBitsToInt(-(intBitsToFloat(R123i.x)) + intBitsToFloat(uf_remappedPS[25].x));
// 3
PV1iz = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(PV0iz));
PV1iz = clampFI32(PV1iz);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + -(1.0));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),intBitsToFloat(PV1iz)) + intBitsToFloat(R8i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(PV1iz)) + intBitsToFloat(R6i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(PV1iz)) + intBitsToFloat(R6i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(R12i.x)) + 1.0);
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R7i.z)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(uf_remappedPS[26].z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(uf_remappedPS[26].y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(uf_remappedPS[26].x)));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[17].w), intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[17].w), intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[17].w), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y), intBitsToFloat(PV1ix)));
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(PV0iw)) + intBitsToFloat(R9i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(PV0iw)) + intBitsToFloat(R4i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(PV0iw)) + intBitsToFloat(R6i.y));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R5i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(R5i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(R3i.z)));
// 9
R0i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R0i.y = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R2i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w),intBitsToFloat(uf_remappedPS[27].x)) + intBitsToFloat(uf_remappedPS[28].w));
R123i.y = clampFI32(R123i.y);
// 1
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(uf_remappedPS[29].w)));
// 2
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(R14i.y)));
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iw)),intBitsToFloat(R0i.z)) + intBitsToFloat(R0i.z));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R0i.z)));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[29].y), intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[29].z), intBitsToFloat(PV1iy)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[29].x), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R123i.x)));
R5i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.x)),intBitsToFloat(R123i.x)) + intBitsToFloat(R123i.x));
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[19].z),intBitsToFloat(PV0iw)) + intBitsToFloat(PV0iy));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[19].x),intBitsToFloat(PV0iw)) + intBitsToFloat(PV0iz));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[19].y),intBitsToFloat(PV0iw)) + intBitsToFloat(PV0ix));
R4i.w = 0;
// 6
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),intBitsToFloat(R2i.w)) + intBitsToFloat(R123i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),intBitsToFloat(R2i.w)) + intBitsToFloat(R123i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y),intBitsToFloat(R2i.w)) + intBitsToFloat(R123i.x));
// 7
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[15].x),intBitsToFloat(R10i.z)) + intBitsToFloat(R123i.y));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[15].y),intBitsToFloat(R10i.z)) + intBitsToFloat(R123i.z));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[15].z),intBitsToFloat(R10i.z)) + intBitsToFloat(R123i.w));
// 8
predResult = (intBitsToFloat(R14i.x) != intBitsToFloat(0x3dc0c0c1));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R3i.x = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(R0i.x));
R3i.y = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(R0i.y));
R3i.z = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(R2i.z));
R3i.w = 0x3f800000;
R0i.x = 0;
// 1
R0i.y = 0;
R0i.z = 0;
R0i.w = 0;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R17i.x),intBitsToFloat(R17i.y),intBitsToFloat(R13i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[30].x),intBitsToFloat(uf_remappedPS[30].y),intBitsToFloat(uf_remappedPS[30].z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.w = 0x40400000;
// 1
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R17i.x),intBitsToFloat(R17i.y),intBitsToFloat(R13i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[31].x),intBitsToFloat(uf_remappedPS[31].y),intBitsToFloat(uf_remappedPS[31].z),0.0)));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
R127i.z = floatBitsToInt(-(intBitsToFloat(PV0ix)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R17i.x),intBitsToFloat(R17i.y),intBitsToFloat(R13i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[32].x),intBitsToFloat(uf_remappedPS[32].y),intBitsToFloat(uf_remappedPS[32].z),0.0)));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z), intBitsToFloat(R13i.x)));
// 3
backupReg0i = R127i.x;
backupReg1i = R127i.z;
redcCUBE(vec4(intBitsToFloat(backupReg1i),intBitsToFloat(backupReg1i),intBitsToFloat(backupReg0i),intBitsToFloat(PV0ix)),vec4(intBitsToFloat(PV0ix),intBitsToFloat(backupReg0i),intBitsToFloat(backupReg1i),intBitsToFloat(backupReg1i)),cubeMapSTM,cubeMapFaceId);
R127i.x = floatBitsToInt(cubeMapSTM.x);
R127i.y = floatBitsToInt(cubeMapSTM.y);
R127i.z = floatBitsToInt(cubeMapSTM.z);
R127i.w = cubeMapFaceId;
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(PS0i)));
R2i.z = clampFI32(R2i.z);
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R14i.z) * 75.0);
PV0ix = clampFI32(PV0ix);
R0i.z = R127i.w;
PS0i = floatBitsToInt(1.0 / abs(intBitsToFloat(R127i.z)));
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PS0i)) + 1.5);
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[18].y),intBitsToFloat(PV0ix)) + intBitsToFloat(R1i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[18].x),intBitsToFloat(PV0ix)) + intBitsToFloat(R1i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PS0i)) + 1.5);
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[18].z),intBitsToFloat(PV0ix)) + intBitsToFloat(R1i.z));
// 6
R0i.x = R123i.w;
R0i.y = R123i.x;
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.x), intBitsToFloat(R123i.z)));
}
if( activeMaskStackC[2] == true ) {
R0i.xyz = floatBitsToInt(zmCube(textureUnitPS7, intBitsToFloat(R0i.xy), R0i.z, cubeMapArrayIndex7, intBitsToFloat(R0i.w)).xyz);
}
if( activeMaskStackC[2] == true ) {
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[18].y),intBitsToFloat(R2i.z)) + intBitsToFloat(R0i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[18].x),intBitsToFloat(R2i.z)) + intBitsToFloat(R0i.x));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.z), intBitsToFloat(R1i.x)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[18].z),intBitsToFloat(R2i.z)) + intBitsToFloat(R0i.z));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y), intBitsToFloat(R1i.y)));
// 1
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.x),intBitsToFloat(R123i.y)) + intBitsToFloat(R2i.x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.y),intBitsToFloat(R123i.x)) + intBitsToFloat(R2i.y));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.z),intBitsToFloat(R123i.w)) + intBitsToFloat(R4i.z));
R0i.w = 0;
R3i.w = 0x3f800000;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R1i.w = 0x3f800000;
// 1
R3i.x = R3i.x;
R3i.y = R3i.y;
R3i.z = R3i.z;
R3i.w = R3i.w;
// 2
R2i.x = R0i.x;
R2i.y = R0i.y;
R2i.z = R0i.z;
R2i.w = R0i.w;
// 3
R1i.x = R4i.x;
R1i.y = R5i.y;
R1i.z = R6i.z;
R1i.w = R1i.w;
// 4
R0i.x = R13i.x;
R0i.y = R4i.y;
R0i.z = R5i.z;
R0i.w = R4i.w;
// 5
R4i.x = R7i.x;
R4i.y = R7i.x;
R4i.z = R7i.x;
R4i.w = R7i.x;
}
// export
passPixelColor0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
passPixelColor1 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
passPixelColor2 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
passPixelColor3 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
passPixelColor4 = vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.z), intBitsToFloat(R4i.w));
}
