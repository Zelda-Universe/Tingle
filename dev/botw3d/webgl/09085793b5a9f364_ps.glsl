#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;

vec4 zmCube(sampler2DArray s, vec2 st, int face, float cubeIndex, float lod) {
	return textureLod(s, vec3(st - 1.0, float(face) + cubeIndex * 6.0), lod);
}

vec4 zmGather(sampler2D s, vec2 uv, int c) {
	vec2 sz = vec2(textureSize(s, 0)); vec2 p = uv * sz - 0.5; ivec2 i = ivec2(floor(p));
	ivec2 m = textureSize(s, 0) - 1;
	vec4 a = texelFetch(s, clamp(i + ivec2(0, 1), ivec2(0), m), 0), b = texelFetch(s, clamp(i + ivec2(1, 1), ivec2(0), m), 0);
	vec4 d = texelFetch(s, clamp(i + ivec2(1, 0), ivec2(0), m), 0), e = texelFetch(s, clamp(i, ivec2(0), m), 0);
	return vec4(a[c], b[c], d[c], e[c]);
}
vec4 zmGather(sampler2DArray s, vec3 uv, int c) {
	ivec3 t = textureSize(s, 0); vec2 p = uv.xy * vec2(t.xy) - 0.5; ivec2 i = ivec2(floor(p)); ivec2 m = t.xy - 1; int l = int(uv.z + 0.5);
	vec4 a = texelFetch(s, ivec3(clamp(i + ivec2(0, 1), ivec2(0), m), l), 0), b = texelFetch(s, ivec3(clamp(i + ivec2(1, 1), ivec2(0), m), l), 0);
	vec4 d = texelFetch(s, ivec3(clamp(i + ivec2(1, 0), ivec2(0), m), l), 0), e = texelFetch(s, ivec3(clamp(i, ivec2(0), m), l), 0);
	return vec4(a[c], b[c], d[c], e[c]);
}
// shader 09085793b5a9f364
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


UNIFORM_BUFFER_LAYOUT(38, 1, 13) uniform uniformBlockPS6
{
vec4 uf_blockPS6[54];
};


UNIFORM_BUFFER_LAYOUT(42, 1, 14) uniform uniformBlockPS10
{
vec4 uf_blockPS10[4];
};


TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(2, 1, 1) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(4, 1, 2) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(5, 1, 3) uniform sampler2D textureUnitPS5;
TEXTURE_LAYOUT(6, 1, 4) uniform sampler2DArray textureUnitPS6;
TEXTURE_LAYOUT(7, 1, 5) uniform sampler2DArrayShadow textureUnitPS7;
TEXTURE_LAYOUT(10, 1, 6) uniform sampler2D textureUnitPS10;
TEXTURE_LAYOUT(11, 1, 7) uniform sampler2D textureUnitPS11;
TEXTURE_LAYOUT(14, 1, 8) uniform sampler2D textureUnitPS14;
TEXTURE_LAYOUT(15, 1, 9) uniform sampler2D textureUnitPS15;
TEXTURE_LAYOUT(16, 1, 10) uniform sampler2D textureUnitPS16;
in vec4 passParameterSem0;
in vec4 passParameterSem2;
in vec4 passParameterSem5;
in vec4 passParameterSem6;
layout(location = 0) out vec4 passPixelColor0;
layout(location = 1) out vec4 passPixelColor1;
layout(location = 2) out vec4 passPixelColor2;
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
bool activeMaskStack[3];
bool activeMaskStackC[4];
activeMaskStack[0] = false;
activeMaskStack[1] = false;
activeMaskStackC[0] = false;
activeMaskStackC[1] = false;
activeMaskStackC[2] = false;
activeMaskStack[0] = true;
activeMaskStackC[0] = true;
activeMaskStackC[1] = true;
vec3 cubeMapSTM;
int cubeMapFaceId;
float cubeMapArrayIndex6 = 0.0;
R0i = floatBitsToInt(passParameterSem0);
R1i = floatBitsToInt(passParameterSem2);
R2i = floatBitsToInt(passParameterSem5);
R3i = floatBitsToInt(passParameterSem6);
if( activeMaskStackC[1] == true ) {
R4i.w = floatBitsToInt(texture(textureUnitPS5, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R5i.xzw = floatBitsToInt(zmGather(textureUnitPS5, vec2(0.0001) + vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)), 0).xzw);
R3i.xyzw = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R3i.z),intBitsToFloat(R3i.w))).xyzw);
R12i.xy = floatBitsToInt(texture(textureUnitPS14, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xy);
}
if( activeMaskStackC[1] == true ) {
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS1[16].x,intBitsToFloat(R5i.w)) + uf_blockPS1[14].x);
R126i.y = floatBitsToInt(intBitsToFloat(R3i.x) * 2.0 + -(1.0));
R125i.z = floatBitsToInt(intBitsToFloat(R3i.y) * 2.0 + -(1.0));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),uf_blockPS1[16].x) + uf_blockPS1[14].x);
R124i.z = floatBitsToInt(intBitsToFloat(R3i.z) * 2.0 + -(1.0));
// 1
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), -(intBitsToFloat(R123i.w))));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), -(intBitsToFloat(R123i.w))));
R12i.z = floatBitsToInt(-(intBitsToFloat(R123i.x)));
PV1iw = floatBitsToInt(intBitsToFloat(R3i.w) * 255.0);
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS1[16].x,intBitsToFloat(R5i.z)) + uf_blockPS1[14].x);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), uf_blockPS6[45].x));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), -(intBitsToFloat(R127i.z))));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), -(intBitsToFloat(R127i.z))));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), uf_blockPS6[43].x));
PS0i = int(intBitsToFloat(PV1iw));
// 3
PV1ix = PS0i & int(1);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),uf_blockPS6[43].y) + intBitsToFloat(PV0iw));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),uf_blockPS6[45].y) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(-(intBitsToFloat(R127i.z)));
R4i.w = floatBitsToInt(-(intBitsToFloat(R4i.x)) + intBitsToFloat(PV0iy));
// 4
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z),uf_blockPS6[45].z) + intBitsToFloat(R123i.z));
R3i.y = floatBitsToInt(-(intBitsToFloat(R8i.y)) + intBitsToFloat(R126i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z),uf_blockPS6[43].z) + intBitsToFloat(R123i.y));
R5i.w = ((PV1ix == 0)?(0):(0x3f800000));
R3i.x = floatBitsToInt(-(intBitsToFloat(R12i.z)) + intBitsToFloat(PV1iw));
// 5
R15i.x = floatBitsToInt(uf_blockPS6[43].w + intBitsToFloat(R123i.z));
R127i.y = floatBitsToInt(-(intBitsToFloat(R12i.z)) * intBitsToFloat(0x3d4ccccd));
R0i.z = floatBitsToInt(-(intBitsToFloat(R12i.z)) * intBitsToFloat(0x3d4ccccd) + -3.5);
R0i.z = clampFI32(R0i.z);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), uf_blockPS6[44].x));
R7i.w = 0x3f800000;
// 6
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.x),uf_blockPS6[39].z) + -(uf_blockPS6[39].x));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R124i.z)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z), intBitsToFloat(R12i.z)));
R12i.w = R12i.x;
R12i.w = clampFI32(R12i.w);
R13i.w = floatBitsToInt(-(intBitsToFloat(R12i.z)) * intBitsToFloat(0x3c23d70a) + -(0.5));
R13i.w = clampFI32(R13i.w);
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),intBitsToFloat(PV0iy),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),uf_blockPS6[44].y) + intBitsToFloat(R127i.w));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z),uf_blockPS6[44].z) + intBitsToFloat(R122i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R8i.y)) + intBitsToFloat(R126i.z));
R13i.z = floatBitsToInt(-(uf_blockPS6[53].z) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(R127i.y));
R13i.z = clampFI32(R13i.z);
R6i.w = floatBitsToInt(-(uf_blockPS6[53].w) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(R127i.y));
R6i.w = clampFI32(R6i.w);
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 9
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS0i)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PS0i)));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(PS0i)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R4i.x)) + intBitsToFloat(R123i.y));
R14i.z = floatBitsToInt(uf_blockPS6[44].w + intBitsToFloat(R123i.x));
// 10
R12i.x = floatBitsToInt(uf_blockPS1[0].y);
R13i.y = R14i.z;
R15i.z = floatBitsToInt(uf_blockPS6[45].w + intBitsToFloat(R127i.x));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(R123i.w)));
// 11
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.z),uf_blockPS6[39].z) + -(uf_blockPS6[39].y));
R3i.w = floatBitsToInt(-(intBitsToFloat(R13i.y)) + uf_blockPS6[39].w);
R0i.w = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
}
if( activeMaskStackC[1] == true ) {
R0i.y = floatBitsToInt(textureLod(textureUnitPS11, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)),0.0).x);
}
if( activeMaskStackC[1] == true ) {
// 0
R13i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(uf_blockPS1[11].x,uf_blockPS1[11].y,uf_blockPS1[11].z,0.0)));
PV0iy = R13i.x;
PV0iz = R13i.x;
PV0iw = R13i.x;
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R0i.w)));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(uf_blockPS1[12].x,uf_blockPS1[12].y,uf_blockPS1[12].z,0.0)));
PV1ix = tempi.x;
R14i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(R0i.w)));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS1[16].x,intBitsToFloat(R5i.x)) + uf_blockPS1[14].x);
R123i.y = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0 + -(1.0));
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z), intBitsToFloat(R0i.w)));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R15i.y)),intBitsToFloat(R15i.y)) + 1.0);
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), -(intBitsToFloat(R123i.x))));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), -(intBitsToFloat(R123i.x))));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.w)),intBitsToFloat(R123i.y)) + intBitsToFloat(R3i.w));
PV1iw = floatBitsToInt(-(intBitsToFloat(R123i.x)));
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.w));
R4i.y = floatBitsToInt(tempResultf);
// 4
R2i.x = floatBitsToInt(intBitsToFloat(R123i.z) + intBitsToFloat(0x3fa66666));
R126i.y = floatBitsToInt(-(intBitsToFloat(R4i.x)) + intBitsToFloat(PV1ix));
R125i.z = floatBitsToInt(-(intBitsToFloat(R12i.z)) + intBitsToFloat(PV1iw));
R127i.w = floatBitsToInt(-(intBitsToFloat(R8i.y)) + intBitsToFloat(PV1iy));
R2i.y = floatBitsToInt(intBitsToFloat(R0i.z) + uf_blockPS10[3].y);
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R125i.z)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R126i.y)));
PV1iz = floatBitsToInt(uf_blockPS10[2].z + 1.0);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(R127i.w)));
R16i.y = floatBitsToInt(uf_blockPS1[1].y);
// 6
backupReg0i = R3i.y;
R0i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)),intBitsToFloat(R3i.x)) + intBitsToFloat(PV1ix));
R3i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.z)),intBitsToFloat(R4i.w)) + intBitsToFloat(PV1iy));
R0i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.y)),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV1iw));
R0i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.z)), uf_blockPS1[17].y));
R17i.y = floatBitsToInt(-(intBitsToFloat(R6i.w)) + intBitsToFloat(PV1iz));
R17i.y = clampFI32(R17i.y);
// 7
tempi.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R0i.x)),-(intBitsToFloat(R3i.y)),-(intBitsToFloat(R0i.z)),intBitsToFloat(0x80000000)),vec4(-(intBitsToFloat(R0i.x)),-(intBitsToFloat(R3i.y)),-(intBitsToFloat(R0i.z)),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R17i.z = floatBitsToInt(uf_blockPS1[2].y);
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(uf_blockPS1[13].x,uf_blockPS1[13].y,uf_blockPS1[13].z,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R18i.z = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
R2i.w = floatBitsToInt(tempResultf);
}
if( activeMaskStackC[1] == true ) {
// 0
R123i.w = floatBitsToInt(mul_nonIEEE(-(uf_blockPS6[39].w),intBitsToFloat(R0i.y)) + intBitsToFloat(R2i.x));
// 1
R126i.y = floatBitsToInt(intBitsToFloat(R123i.w) * 0.25);
R126i.y = clampFI32(R126i.y);
// 2
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.y)),intBitsToFloat(PV0iz)) + intBitsToFloat(PV0iz));
// 4
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.y)),intBitsToFloat(R123i.x)) + intBitsToFloat(R123i.x));
// 5
PV1iz = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
// 6
R14i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R2i.y)) + intBitsToFloat(R127i.w));
R14i.w = clampFI32(R14i.w);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R8i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].x, uf_blockPS10[2].w));
R9i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].y, uf_blockPS10[2].w));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.y)),intBitsToFloat(R9i.y)) + 1.0);
R10i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[4].z, uf_blockPS10[2].w));
R3i.w = 0;
R2i.x = R8i.x;
// 2
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.z), intBitsToFloat(R10i.z)));
R0i.y = R10i.z;
R2i.z = 0;
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.x));
PS0i = floatBitsToInt(tempResultf);
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R16i.z),intBitsToFloat(R16i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R0i.y),intBitsToFloat(R2i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R4i.y)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R15i.y),intBitsToFloat(R127i.x),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R9i.y),1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R15i.w = tempi.x;
R18i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(PV1ix)));
// 5
predResult = (1.0 > intBitsToFloat(R13i.z));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R127i.x = ((-(intBitsToFloat(R12i.z)) > uf_blockPS1[58].y)?-1:0);
PV0iy = floatBitsToInt(intBitsToFloat(R6i.x) * 1.5);
PV0iz = floatBitsToInt(intBitsToFloat(R5i.y) * 1.5);
PV0iw = ((-(intBitsToFloat(R12i.z)) > uf_blockPS1[58].x)?-1:0);
PS0i = floatBitsToInt(intBitsToFloat(R5i.z) * 1.5);
// 1
R2i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.x)),intBitsToFloat(R2i.w)) + intBitsToFloat(PV0iy));
R2i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.y)),intBitsToFloat(R2i.w)) + intBitsToFloat(PV0iz));
PV1iz = PV0iw & int(1);
R2i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.z)),intBitsToFloat(R2i.w)) + intBitsToFloat(PS0i));
R122i.x = floatBitsToInt(intBitsToFloat(R0i.w) * 0.25 + 1.0);
// 2
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(R122i.x)));
R19i.y = PV1iz - R127i.x;
R3i.z = floatBitsToInt(uf_blockPS6[53].x);
R3i.z = floatBitsToInt(intBitsToFloat(R3i.z) / 2.0);
R4i.w = floatBitsToInt(uf_blockPS6[53].y);
R4i.w = floatBitsToInt(intBitsToFloat(R4i.w) / 2.0);
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R2i.w)));
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R2i.y)) + intBitsToFloat(PS0i));
R4i.y = floatBitsToInt(-(intBitsToFloat(R4i.w)));
R4i.z = floatBitsToInt(-(intBitsToFloat(R3i.z)));
PV1iw = R19i.y << 0x2;
R2i.z = floatBitsToInt(float(R19i.y));
// 4
R0i.x = PV1iw + 0x2c;
R0i.y = PV1iw + 0x2a;
R0i.z = PV1iw + 0x2b;
R0i.w = PV1iw + 0x2d;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R2i.x)) + intBitsToFloat(R123i.x));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R5i.z)),vec4(-(intBitsToFloat(R8i.x)),-(intBitsToFloat(R9i.y)),-(intBitsToFloat(R10i.z)),-(intBitsToFloat(R3i.w)))));
tempi.x = clampFI32(tempi.x);
PV1ix = tempi.x;
R3i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(R122i.x));
R3i.w = floatBitsToInt(tempResultf);
}
if( activeMaskStackC[2] == true ) {
R5i.xyzw = floatBitsToInt(uf_blockPS1[R0i.w].xyzw);
R6i.xyzw = floatBitsToInt(uf_blockPS1[R0i.x].xyzw);
R7i.xyzw = floatBitsToInt(uf_blockPS1[R0i.y].xyzw);
R0i.xyzw = floatBitsToInt(uf_blockPS1[R0i.z].xyzw);
}
if( activeMaskStackC[2] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R3i.w)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R3i.w)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R3i.w)));
R127i.w = R4i.w;
R8i.z = floatBitsToInt(roundEven(intBitsToFloat(R2i.z)));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R9i.y),intBitsToFloat(R10i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R9i.z = R8i.z;
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R10i.z)),intBitsToFloat(PV1ix)) + intBitsToFloat(R127i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(PV1ix)) + 1.0);
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.y)),intBitsToFloat(PV1ix)) + intBitsToFloat(R127i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R8i.x)),intBitsToFloat(PV1ix)) + intBitsToFloat(R127i.x));
R10i.z = R8i.z;
// 3
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R123i.w)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R123i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R123i.z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R3i.y)));
R11i.z = R8i.z;
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3da1ff2e));
// 5
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PV0ix)) + intBitsToFloat(R4i.x));
R20i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV0ix)) + intBitsToFloat(R8i.y));
R19i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PV0ix)) + intBitsToFloat(R12i.z));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.x), intBitsToFloat(R6i.x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.x), intBitsToFloat(R5i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.x), intBitsToFloat(R7i.x)));
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R20i.y),intBitsToFloat(R6i.y)) + intBitsToFloat(PV0ix));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.x), intBitsToFloat(R0i.x)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R20i.y),intBitsToFloat(R5i.y)) + intBitsToFloat(PV0iy));
// 8
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.z),intBitsToFloat(R5i.z)) + intBitsToFloat(R123i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.z),intBitsToFloat(R6i.z)) + intBitsToFloat(backupReg0i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R20i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(PV1iy));
// 9
R127i.x = floatBitsToInt(intBitsToFloat(R6i.w) + intBitsToFloat(R123i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.z),intBitsToFloat(R0i.z)) + intBitsToFloat(R123i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R20i.y),intBitsToFloat(R7i.y)) + intBitsToFloat(R127i.z));
PV1iw = floatBitsToInt(intBitsToFloat(R5i.w) + intBitsToFloat(R123i.x));
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.z),intBitsToFloat(R7i.z)) + intBitsToFloat(R123i.z));
PV0iw = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(R123i.y));
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(R7i.w) + intBitsToFloat(R123i.x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R127i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R127i.y)));
// 12
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(0xbb03126f));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.y)));
R8i.y = floatBitsToInt(uf_blockPS6[53].y * 0.5 + intBitsToFloat(R126i.y));
// 13
R8i.x = floatBitsToInt(uf_blockPS6[53].x * 0.5 + intBitsToFloat(R127i.z));
R9i.y = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(R4i.y));
R126i.z = floatBitsToInt(-(intBitsToFloat(R2i.z)) * intBitsToFloat(0x3a03126f) + intBitsToFloat(PV0iy));
R126i.z = clampFI32(R126i.z);
R9i.x = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(R3i.z));
// 14
R10i.x = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(R4i.z));
R10i.y = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(R127i.w));
R8i.w = R126i.z;
R9i.w = R126i.z;
// 15
R11i.x = floatBitsToInt(-(uf_blockPS6[53].x) * 0.5 + intBitsToFloat(R127i.z));
R11i.y = floatBitsToInt(-(uf_blockPS6[53].y) * 0.5 + intBitsToFloat(R126i.y));
R10i.w = R126i.z;
R11i.w = R126i.z;
}
if( activeMaskStackC[2] == true ) {
R8i.y = floatBitsToInt(texture(textureUnitPS7, vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R8i.w))));
R9i.x = floatBitsToInt(texture(textureUnitPS7, vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R9i.z),intBitsToFloat(R9i.w))));
R10i.w = floatBitsToInt(texture(textureUnitPS7, vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(R10i.w))));
R11i.z = floatBitsToInt(texture(textureUnitPS7, vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.w))));
}
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
PV0iw = floatBitsToInt(intBitsToFloat(R8i.y) + intBitsToFloat(R9i.x));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
// 1
R123i.y = floatBitsToInt(intBitsToFloat(R10i.w) * 0.5 + intBitsToFloat(PV0iw));
// 2
R5i.w = floatBitsToInt((intBitsToFloat(R11i.z) * 0.5 + intBitsToFloat(R123i.y))/2.0);
// 3
PV1ix = ((1.0 > intBitsToFloat(R5i.w))?-1:0);
// 4
R0i.y = ((R19i.y > 0)?(PV1ix):(0));
// 5
predResult = (R0i.y != 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iz = int(-1) + R19i.y;
// 1
PV1ix = PV0iz << 0x2;
R5i.x = floatBitsToInt(float(PV0iz));
// 2
R0i.x = PV1ix + 0x2d;
R0i.y = PV1ix + 0x2b;
R0i.z = PV1ix + 0x2c;
R0i.w = PV1ix + 0x2a;
R6i.z = floatBitsToInt(roundEven(intBitsToFloat(R5i.x)));
}
if( activeMaskStackC[3] == true ) {
R2i.xyzw = floatBitsToInt(uf_blockPS1[R0i.x].xyzw);
R3i.xyzw = floatBitsToInt(uf_blockPS1[R0i.z].xyzw);
R4i.xyzw = floatBitsToInt(uf_blockPS1[R0i.w].xyzw);
R0i.xyzw = floatBitsToInt(uf_blockPS1[R0i.y].xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.x), intBitsToFloat(R3i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.x), intBitsToFloat(R2i.x)));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R20i.y),intBitsToFloat(R3i.y)) + intBitsToFloat(PV0ix));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R20i.y),intBitsToFloat(R2i.y)) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.x), intBitsToFloat(R0i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.x), intBitsToFloat(R4i.x)));
// 2
backupReg0i = R123i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.z),intBitsToFloat(R3i.z)) + intBitsToFloat(R123i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R20i.y),intBitsToFloat(R4i.y)) + intBitsToFloat(PV1iw));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.z),intBitsToFloat(R2i.z)) + intBitsToFloat(backupReg0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R20i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(PV1iz));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(R123i.z));
R127i.y = floatBitsToInt(intBitsToFloat(R3i.w) + intBitsToFloat(R123i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.z),intBitsToFloat(R4i.z)) + intBitsToFloat(R123i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.z),intBitsToFloat(R0i.z)) + intBitsToFloat(R123i.w));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R4i.w) + intBitsToFloat(R123i.z));
PV0iy = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(R123i.w));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 5
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(PS0i)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(0xbb03126f));
// 7
R6i.w = floatBitsToInt(-(intBitsToFloat(R5i.x)) * intBitsToFloat(0x3a03126f) + intBitsToFloat(PV0iy));
R6i.w = clampFI32(R6i.w);
}
if( activeMaskStackC[3] == true ) {
R6i.y = floatBitsToInt(texture(textureUnitPS7, vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z),intBitsToFloat(R6i.w))));
}
if( activeMaskStackC[3] == true ) {
// 0
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(R6i.y)));
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R5i.w)) + 1.0);
// 1
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R13i.z)) + intBitsToFloat(R5i.w));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.z)),uf_blockPS6[26].x) + -(uf_blockPS6[26].y));
R123i.x = clampFI32(R123i.x);
R2i.y = floatBitsToInt(intBitsToFloat(R15i.z) * intBitsToFloat(0x3a83126f));
R0i.z = floatBitsToInt(-(intBitsToFloat(R18i.z)));
R0i.w = 0x40400000;
R2i.x = floatBitsToInt(intBitsToFloat(R15i.x) * intBitsToFloat(0x3a83126f));
// 1
redcCUBE(vec4(intBitsToFloat(R0i.z),intBitsToFloat(R0i.z),intBitsToFloat(R13i.x),intBitsToFloat(R14i.y)),vec4(intBitsToFloat(R14i.y),intBitsToFloat(R13i.x),intBitsToFloat(R0i.z),intBitsToFloat(R0i.z)),cubeMapSTM,cubeMapFaceId);
R127i.x = floatBitsToInt(cubeMapSTM.x);
R127i.y = floatBitsToInt(cubeMapSTM.y);
R127i.z = floatBitsToInt(cubeMapSTM.z);
R127i.w = cubeMapFaceId;
R126i.z = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
// 2
R3i.x = floatBitsToInt(intBitsToFloat(R15i.x) * intBitsToFloat(0x38d1b717) + 0.5);
R3i.y = floatBitsToInt(intBitsToFloat(R15i.z) * intBitsToFloat(0x3903126f) + 0.5);
R0i.z = R127i.w;
PV0iw = floatBitsToInt(intBitsToFloat(R15i.w) + -(intBitsToFloat(R18i.y)));
PS0i = floatBitsToInt(1.0 / abs(intBitsToFloat(R127i.z)));
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PS0i)) + 1.5);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PS0i)) + 1.5);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R126i.z)) + intBitsToFloat(R18i.y));
R2i.w = 0x3f800000;
tempResultf = max(0.0, intBitsToFloat(R126i.z));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R127i.y = floatBitsToInt(tempResultf);
// 4
R0i.x = R123i.x;
R0i.y = R123i.y;
PV0iz = floatBitsToInt(max(-(intBitsToFloat(R123i.z)), intBitsToFloat(0xbf7d70a4)));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].y, intBitsToFloat(R127i.y)));
R127i.z = floatBitsToInt(-(uf_blockPS6[27].w) + 1.0);
// 5
R123i.x = floatBitsToInt(-(intBitsToFloat(R14i.y)) * 0.5 + 0.5);
R5i.y = 0;
R6i.z = floatBitsToInt(-(intBitsToFloat(R12i.z)) * intBitsToFloat(0x3ba3d70a));
R127i.w = floatBitsToInt(intBitsToFloat(PV0iz) + 0.5);
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
// 6
backupReg0i = R123i.x;
R123i.x = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PS1i)) + uf_blockPS6[27].w)/2.0);
R123i.y = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
PV0iw = floatBitsToInt(intBitsToFloat(backupReg0i) + 2.5);
R122i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.z)),uf_blockPS6[28].x) + -(uf_blockPS6[28].y));
R122i.x = clampFI32(R122i.x);
// 7
R5i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3daaaaab));
R4i.y = floatBitsToInt(intBitsToFloat(R123i.x) + 0.5);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R123i.y)) + intBitsToFloat(0xbe593484));
PV1iw = floatBitsToInt(-(intBitsToFloat(R122i.x)) + 1.0);
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0iz)));
// 8
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3f22f983));
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].x, intBitsToFloat(R127i.y)));
R3i.z = floatBitsToInt(intBitsToFloat(R14i.w) * intBitsToFloat(0xbdcccccd) + intBitsToFloat(0x3dcccccd));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R123i.z)) + intBitsToFloat(0x3fc90da4));
tempResultf = max(0.0, intBitsToFloat(PV1iw));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R127i.w = floatBitsToInt(tempResultf);
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R15i.x),intBitsToFloat(R13i.y),intBitsToFloat(R15i.z),intBitsToFloat(R2i.w)),vec4(uf_blockPS1[37].x,uf_blockPS1[37].y,uf_blockPS1[37].z,uf_blockPS1[37].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),-(intBitsToFloat(R123i.w))) + 1.0);
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R15i.x),intBitsToFloat(R13i.y),intBitsToFloat(R15i.z),intBitsToFloat(R2i.w)),vec4(uf_blockPS1[35].x,uf_blockPS1[35].y,uf_blockPS1[35].z,uf_blockPS1[35].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R15i.x),intBitsToFloat(R13i.y),intBitsToFloat(R15i.z),intBitsToFloat(R2i.w)),vec4(uf_blockPS1[36].x,uf_blockPS1[36].y,uf_blockPS1[36].z,uf_blockPS1[36].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R127i.z)));
// 12
R7i.x = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(0xbe99999a));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.z)));
R2i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[29].x, intBitsToFloat(R127i.w)));
R2i.w = floatBitsToInt(intBitsToFloat(0xbf59999a) * intBitsToFloat(R12i.y) + 1.0);
R7i.y = floatBitsToInt(exp2(intBitsToFloat(R127i.y)));
}
if( activeMaskStackC[1] == true ) {
R0i.xyz = floatBitsToInt(zmCube(textureUnitPS6, intBitsToFloat(R0i.xy), R0i.z, cubeMapArrayIndex6, intBitsToFloat(R0i.w)).xyz);
R0i.w = floatBitsToInt(textureLod(textureUnitPS0, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y)),0.0).x);
R8i.xyz = floatBitsToInt(textureLod(textureUnitPS15, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y)),0.0).xyz);
R4i.xyz = floatBitsToInt(texture(textureUnitPS10, vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y))).xyz);
R5i.xyz = floatBitsToInt(texture(textureUnitPS16, vec2(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y))).xyz);
R6i.x = floatBitsToInt(textureLod(textureUnitPS4, vec2(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y)),intBitsToFloat(R6i.z)).x);
}
if( activeMaskStackC[1] == true ) {
// 0
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.z)),uf_blockPS6[18].x) + uf_blockPS6[17].w);
R126i.x = clampFI32(R126i.x);
PV0iy = floatBitsToInt(max(intBitsToFloat(R0i.y), intBitsToFloat(R0i.z)));
R123i.z = floatBitsToInt(intBitsToFloat(R0i.w) * 2.0 + -(1.0));
PV0iw = floatBitsToInt(min(intBitsToFloat(R0i.y), intBitsToFloat(R0i.z)));
R126i.y = floatBitsToInt(exp2(intBitsToFloat(R2i.z)));
// 1
R124i.x = floatBitsToInt(max(intBitsToFloat(R0i.x), intBitsToFloat(PV0iy)));
R127i.y = floatBitsToInt(intBitsToFloat(R123i.z) * 25.0 + intBitsToFloat(R14i.z));
R127i.z = floatBitsToInt(min(intBitsToFloat(R0i.x), intBitsToFloat(PV0iw)));
R126i.w = floatBitsToInt(intBitsToFloat(R7i.x) * intBitsToFloat(0x40200001));
R126i.w = clampFI32(R126i.w);
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[27].z,-(intBitsToFloat(R7i.y))) + uf_blockPS6[27].z);
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R12i.x),intBitsToFloat(R16i.y),intBitsToFloat(R17i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R14i.x),intBitsToFloat(R15i.y),intBitsToFloat(R16i.z),0.0)));
tempi.x = clampFI32(tempi.x);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.w = floatBitsToInt(intBitsToFloat(R124i.x) + intBitsToFloat(0x2edbe6ff));
// 3
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(R127i.y)) + uf_blockPS6[52].x);
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R2i.w)));
R123i.z = floatBitsToInt(-(intBitsToFloat(R12i.z)) * intBitsToFloat(0x3ba3d70a) + intBitsToFloat(0xbfe66666));
PV1iw = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0x3dcccccd));
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 4
R125i.x = floatBitsToInt(-(intBitsToFloat(R124i.y)) + 1.0);
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iw)),intBitsToFloat(R123i.z)) + intBitsToFloat(R123i.z));
R123i.y = clampFI32(R123i.y);
R124i.z = R1i.x;
R124i.z = floatBitsToInt(intBitsToFloat(R124i.z) / 2.0);
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockPS6[29].z, intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 5
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0x3dcccccd) + intBitsToFloat(R123i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.z)),intBitsToFloat(PS0i)) + 1.0);
R2i.z = floatBitsToInt(intBitsToFloat(R0i.x) + -(intBitsToFloat(R124i.x)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),uf_blockPS6[15].x) + uf_blockPS6[14].w);
R123i.w = clampFI32(R123i.w);
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(-(uf_blockPS6[29].w),intBitsToFloat(PS1i)) + 1.0);
PV0iy = floatBitsToInt(intBitsToFloat(R123i.y) + intBitsToFloat(R3i.z));
PV0iy = clampFI32(PV0iy);
R126i.z = floatBitsToInt(intBitsToFloat(R123i.y) + intBitsToFloat(0x2edbe6ff));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), uf_blockPS6[13].w));
tempResultf = max(0.0, intBitsToFloat(R126i.x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockPS6[18].y, intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R2i.w)));
R3i.z = floatBitsToInt(intBitsToFloat(R0i.y) + -(intBitsToFloat(R124i.x)));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.y)),intBitsToFloat(R123i.x)) + intBitsToFloat(R123i.x));
tempResultf = max(0.0, intBitsToFloat(PV0iy));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 8
R126i.x = floatBitsToInt(intBitsToFloat(R0i.z) + -(intBitsToFloat(R124i.x)));
R126i.y = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), uf_blockPS6[30].w));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PS1i)));
R125i.z = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(0x80000000)),vec4(uf_blockPS6[42].x,uf_blockPS6[42].y,uf_blockPS6[42].z,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PS1i)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R2i.w)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R12i.w)) + intBitsToFloat(R127i.x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.z));
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.z)),intBitsToFloat(R125i.x)) + intBitsToFloat(R125i.x));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), uf_blockPS6[16].w));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(PS0i)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(PV0ix)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.w),intBitsToFloat(R124i.z)) + intBitsToFloat(R124i.z));
// 12
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(PV1iy)));
R1i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)),intBitsToFloat(R123i.x)) + intBitsToFloat(R123i.x));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R125i.z)) + intBitsToFloat(R124i.x));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R123i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R125i.z)) + intBitsToFloat(R124i.x));
// 13
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R125i.z)) + intBitsToFloat(R124i.x));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R1i.y)));
R125i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].x, intBitsToFloat(R126i.w)));
PV1iw = floatBitsToInt(intBitsToFloat(R7i.w) + -(intBitsToFloat(R125i.w)));
R126i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].y, intBitsToFloat(R126i.w)));
// 14
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[13].z, intBitsToFloat(R126i.w)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R123i.x)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(backupReg0i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R124i.z)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(R17i.y)) + intBitsToFloat(R125i.w));
// 15
backupReg0i = R126i.y;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R124i.w)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R124i.w)));
R124i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].x,intBitsToFloat(R125i.y)) + intBitsToFloat(R125i.z));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R124i.w)));
R125i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].y,intBitsToFloat(R125i.y)) + intBitsToFloat(backupReg0i));
// 16
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),-(intBitsToFloat(R1i.z))) + intBitsToFloat(R124i.y));
R125i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[16].z,intBitsToFloat(R125i.y)) + intBitsToFloat(backupReg0i));
R127i.z = floatBitsToInt(intBitsToFloat(R5i.x) + -(intBitsToFloat(R127i.w)));
R126i.w = floatBitsToInt(uf_blockPS6[1].x + -(1.0));
R125i.x = floatBitsToInt(uf_blockPS6[1].y + -(1.0));
// 17
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), uf_blockPS6[1].w));
R124i.y = floatBitsToInt(uf_blockPS6[1].z + -(1.0));
PV1iz = floatBitsToInt(intBitsToFloat(R5i.z) + -(intBitsToFloat(R127i.y)));
PV1iw = floatBitsToInt(intBitsToFloat(R5i.y) + -(intBitsToFloat(R126i.z)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R126i.x)) + intBitsToFloat(R125i.z));
// 18
backupReg0i = R126i.x;
backupReg1i = R127i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(backupReg0i)) + intBitsToFloat(R125i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R13i.w)) + intBitsToFloat(R127i.w));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(R13i.w)) + intBitsToFloat(R126i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(backupReg0i)) + intBitsToFloat(R124i.z));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R13i.w)) + intBitsToFloat(backupReg1i));
// 19
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(R124i.x)) + 1.0);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R124i.x)) + 1.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R124i.x)) + 1.0);
R2i.w = R14i.w;
R4i.x = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].x,intBitsToFloat(R1i.z)) + intBitsToFloat(R123i.w));
// 20
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R123i.z)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R123i.y)));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R123i.x)));
R5i.w = 0x3f800000;
R4i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].y,intBitsToFloat(R1i.z)) + intBitsToFloat(R125i.z));
// 21
R2i.y = 0;
R4i.z = floatBitsToInt(mul_nonIEEE(uf_blockPS6[30].z,intBitsToFloat(R1i.z)) + intBitsToFloat(R126i.x));
R4i.w = 0x3f800000;
R2i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.x)),intBitsToFloat(R1i.y)) + intBitsToFloat(R1i.y));
}
if( activeMaskStackC[1] == true ) {
// 0
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockPS10[3].z,intBitsToFloat(R8i.y)) + uf_blockPS10[1].y);
R127i.y = clampFI32(R127i.y);
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R6i.x) + uf_blockPS10[1].z);
PV1ix = clampFI32(PV1ix);
// 2
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.y)));
// 3
R7i.x = R5i.x;
R7i.y = R5i.y;
R7i.z = R5i.z;
R7i.w = R5i.w;
// 4
R6i.x = R4i.x;
R6i.y = R4i.y;
R6i.z = R4i.z;
R6i.w = R4i.w;
// 5
R5i.x = R2i.x;
R5i.y = R2i.y;
R5i.z = R2i.z;
R5i.w = R2i.w;
}
// export
passPixelColor0 = vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.z), intBitsToFloat(R5i.w));
passPixelColor1 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.z), intBitsToFloat(R6i.w));
passPixelColor2 = vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.y), intBitsToFloat(R7i.z), intBitsToFloat(R7i.w));
}
