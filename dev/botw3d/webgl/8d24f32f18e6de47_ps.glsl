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
// shader 8d24f32f18e6de47
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[10];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(1, 1, 0) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 1) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(4, 1, 2) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(6, 1, 3) uniform sampler2D textureUnitPS6;
TEXTURE_LAYOUT(7, 1, 4) uniform sampler2D textureUnitPS7;
TEXTURE_LAYOUT(8, 1, 5) uniform sampler2DArray textureUnitPS8;
TEXTURE_LAYOUT(10, 1, 6) uniform sampler2DArray textureUnitPS10;
TEXTURE_LAYOUT(11, 1, 7) uniform sampler2D textureUnitPS11;
TEXTURE_LAYOUT(13, 1, 8) uniform sampler2D textureUnitPS13;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem6;
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
float cubeMapArrayIndex8 = 0.0;
R0i = floatBitsToInt(passParameterSem0);
R1i = floatBitsToInt(passParameterSem1);
R2i = floatBitsToInt(passParameterSem3);
R3i = floatBitsToInt(passParameterSem4);
R4i = floatBitsToInt(passParameterSem6);
R7i.xyzw = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R4i.z),intBitsToFloat(R4i.w))).xyzw);
R2i.w = floatBitsToInt(texture(textureUnitPS4, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R5i.xyzw = floatBitsToInt(zmGather(textureUnitPS6, vec2(0.0001) + vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)), 0).xyzw);
R6i.xyzw = floatBitsToInt(zmGather(textureUnitPS7, vec2(0.0001) + vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)), 0).xyzw);
R8i.xyzw = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R4i.z),intBitsToFloat(R4i.w))).xyzw);
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R7i.x) * 2.0 + -(1.0));
R127i.y = floatBitsToInt(intBitsToFloat(R7i.y) * 2.0 + -(1.0));
R126i.z = floatBitsToInt(intBitsToFloat(R7i.z) * 2.0 + -(1.0));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(uf_remappedPS[0].x)) + intBitsToFloat(uf_remappedPS[1].x));
R127i.z = floatBitsToInt(-(intBitsToFloat(R2i.w)) + intBitsToFloat(R5i.x));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R9i.z = floatBitsToInt(-(intBitsToFloat(R127i.w)));
// 2
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), -(intBitsToFloat(R127i.w))));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), -(intBitsToFloat(R127i.w))));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(uf_remappedPS[2].y)));
R125i.w = floatBitsToInt(max(intBitsToFloat(R127i.z), -(intBitsToFloat(R127i.z))));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
R126i.y = floatBitsToInt(tempResultf);
// 3
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R126i.y)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R126i.y)));
R127i.z = floatBitsToInt(-(intBitsToFloat(R2i.w)) + intBitsToFloat(R5i.y));
R126i.w = floatBitsToInt(-(intBitsToFloat(R2i.w)) + intBitsToFloat(R5i.z));
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R9i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R9i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R4i.x)) + intBitsToFloat(R0i.x));
// 5
backupReg0i = R127i.z;
R126i.x = floatBitsToInt(-(intBitsToFloat(R2i.w)) + intBitsToFloat(R5i.w));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R4i.y)) + intBitsToFloat(R0i.y));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), intBitsToFloat(R127i.w)));
R127i.w = floatBitsToInt(max(intBitsToFloat(backupReg0i), -(intBitsToFloat(backupReg0i))));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 6
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3eaaaaab),intBitsToFloat(0x3eaaaaab),intBitsToFloat(0x3eaaaaab),0.0)));
PV0iy = R127i.x;
PV0iz = R127i.x;
PV0iw = R127i.x;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 7
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(PS0i)));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(PS0i)));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(R6i.x));
R125i.x = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(R6i.y));
// 8
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(max(intBitsToFloat(R126i.w), -(intBitsToFloat(R126i.w))));
PV0iy = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + intBitsToFloat(R6i.w));
R125i.z = floatBitsToInt(max(intBitsToFloat(R126i.x), -(intBitsToFloat(R126i.x))));
PV0iw = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + intBitsToFloat(R6i.z));
PS0i = floatBitsToInt(max(intBitsToFloat(PV1iw), -(intBitsToFloat(PV1iw))));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 4.0);
// 9
backupReg0i = R126i.z;
PV1ix = floatBitsToInt(max(intBitsToFloat(R125i.x), -(intBitsToFloat(R125i.x))));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 4.0);
PV1iy = floatBitsToInt(max(intBitsToFloat(PV0iy), -(intBitsToFloat(PV0iy))));
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) * 4.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R125i.w)) + intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(max(intBitsToFloat(PV0iw), -(intBitsToFloat(PV0iw))));
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 4.0);
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R126i.y)));
// 10
backupReg0i = R127i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R127i.w)) + intBitsToFloat(PV1ix));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R125i.z)) + intBitsToFloat(PV1iy));
R127i.z = floatBitsToInt(fract(intBitsToFloat(R3i.x)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R127i.x)) + intBitsToFloat(PV1iw));
R125i.x = floatBitsToInt(fract(intBitsToFloat(R3i.y)));
// 11
R127i.x = floatBitsToInt(intBitsToFloat(R126i.z) + -(intBitsToFloat(R123i.w)));
R126i.y = R4i.x;
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) * 2.0);
R126i.z = floatBitsToInt(-(intBitsToFloat(R123i.x)) + intBitsToFloat(R123i.y));
R127i.w = R4i.y;
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
R125i.w = R5i.z;
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) * 2.0);
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R5i.x),intBitsToFloat(R12i.y),intBitsToFloat(R11i.z),0.0)));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(R127i.x));
// 13
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0ix)),intBitsToFloat(R126i.y)) + intBitsToFloat(R5i.x));
PV1iy = floatBitsToInt(intBitsToFloat(R126i.z) + -(intBitsToFloat(backupReg0i)));
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0ix)),intBitsToFloat(R127i.w)) + intBitsToFloat(R12i.y));
PV1iw = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(R127i.z));
PV1iw = clampFI32(PV1iw);
R125i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0ix)),intBitsToFloat(R125i.w)) + intBitsToFloat(R11i.z));
// 14
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R9i.x)) + intBitsToFloat(R1i.z));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R125i.x));
PV0iy = clampFI32(PV0iy);
R10i.z = floatBitsToInt(roundEven(0.0));
PV0iw = floatBitsToInt(-(intBitsToFloat(R127i.z)) + intBitsToFloat(PV1iw));
R2i.w = floatBitsToInt(-(intBitsToFloat(R7i.w)) * 3.0 + 3.0);
// 15
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(PV0iw)) + intBitsToFloat(R0i.x));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R9i.y)) + intBitsToFloat(R1i.w));
R1i.z = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(uf_remappedPS[3].x));
PV1iw = floatBitsToInt(-(intBitsToFloat(R125i.x)) + intBitsToFloat(PV0iy));
R1i.y = floatBitsToInt(intBitsToFloat(R12i.y) + intBitsToFloat(uf_remappedPS[3].y));
// 16
R125i.x = floatBitsToInt(max(-(intBitsToFloat(R127i.y)), 0.0));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(PV1iw)) + intBitsToFloat(R0i.y));
R3i.z = floatBitsToInt(intBitsToFloat(R11i.z) + intBitsToFloat(uf_remappedPS[3].z));
R127i.w = floatBitsToInt(intBitsToFloat(R8i.w) * 255.0);
R6i.z = floatBitsToInt(-(intBitsToFloat(R7i.w)) + 1.0);
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedPS[4].x),intBitsToFloat(uf_remappedPS[4].y),intBitsToFloat(uf_remappedPS[4].z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.z),intBitsToFloat(R125i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R1i.w = 0;
// 18
R124i.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedPS[5].x),intBitsToFloat(uf_remappedPS[5].y),intBitsToFloat(uf_remappedPS[5].z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.z),intBitsToFloat(R125i.z),0.0)));
PV0iy = R124i.x;
PV0iz = R124i.x;
PV0iw = R124i.x;
R124i.z = floatBitsToInt(-(intBitsToFloat(PV1ix)));
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedPS[6].x),intBitsToFloat(uf_remappedPS[6].y),intBitsToFloat(uf_remappedPS[6].z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.z),intBitsToFloat(R125i.z),0.0)));
PV1ix = tempi.x;
R124i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R4i.z = int(intBitsToFloat(R127i.w));
// 20
redcCUBE(vec4(intBitsToFloat(R124i.z),intBitsToFloat(R124i.z),intBitsToFloat(R124i.x),intBitsToFloat(PV1ix)),vec4(intBitsToFloat(PV1ix),intBitsToFloat(R124i.x),intBitsToFloat(R124i.z),intBitsToFloat(R124i.z)),cubeMapSTM,cubeMapFaceId);
R0i.x = floatBitsToInt(cubeMapSTM.x);
R0i.y = floatBitsToInt(cubeMapSTM.y);
R0i.z = floatBitsToInt(cubeMapSTM.z);
R0i.w = cubeMapFaceId;
R6i.y = floatBitsToInt(min(intBitsToFloat(R125i.x), 1.0));
// 21
R1i.x = 0;
R3i.y = floatBitsToInt(intBitsToFloat(R7i.w) * 255.0);
R2i.z = R0i.w;
R3i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.w)),intBitsToFloat(R6i.z)) + intBitsToFloat(R6i.z));
R3i.x = floatBitsToInt(1.0 / abs(intBitsToFloat(R0i.z)));
// 0
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x), intBitsToFloat(uf_remappedPS[7].w)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].y), intBitsToFloat(uf_remappedPS[7].w)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R3i.x)) + 1.5);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R3i.x)) + 1.5);
R124i.y = R4i.z & 0xfc;
// 1
R2i.x = R123i.w;
R2i.y = R123i.z;
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].z), intBitsToFloat(uf_remappedPS[7].w)));
R127i.w = floatBitsToInt(intBitsToFloat(R3i.w) + intBitsToFloat(0x3c23d70a));
R127i.w = clampFI32(R127i.w);
R125i.w = floatBitsToInt(-(intBitsToFloat(R6i.y)) + 1.0);
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.z),intBitsToFloat(R1i.y),intBitsToFloat(R3i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.z),intBitsToFloat(R1i.y),intBitsToFloat(R3i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.y = int(intBitsToFloat(R3i.y));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R5i.z),intBitsToFloat(R5i.z)),vec4(-(intBitsToFloat(R125i.x)),-(intBitsToFloat(R126i.y)),-(intBitsToFloat(R124i.z)),-(intBitsToFloat(R1i.x)))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R126i.w = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PS1i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R127i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(PS1i)));
R127i.x = floatBitsToInt(float(R124i.y));
// 5
backupReg0i = R125i.w;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedPS[7].w)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(uf_remappedPS[7].w)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedPS[7].w)));
R125i.w = floatBitsToInt(intBitsToFloat(R6i.z) * 0.5 + 0.5);
R125i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.y)),intBitsToFloat(backupReg0i)) + intBitsToFloat(backupReg0i));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R5i.z),intBitsToFloat(R5i.z)),vec4(-(intBitsToFloat(R124i.x)),-(intBitsToFloat(R124i.y)),-(intBitsToFloat(R126i.z)),-(intBitsToFloat(R1i.w)))));
tempi.x = clampFI32(tempi.x);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.x = R127i.y & int(1);
// 7
tempi.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R125i.x)),-(intBitsToFloat(R126i.y)),-(intBitsToFloat(R124i.z)),intBitsToFloat(0x80000000)),vec4(-(intBitsToFloat(R124i.x)),-(intBitsToFloat(R124i.y)),-(intBitsToFloat(R126i.z)),0.0)));
tempi.x = clampFI32(tempi.x);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R127i.w = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(PV0ix)));
// 8
R1i.x = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0x3b820821));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R125i.w)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) / 2.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PS1i)) + -(intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(-(intBitsToFloat(PV1ix)) + 1.0);
R122i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.y)),intBitsToFloat(R125i.z)) + intBitsToFloat(R125i.z));
// 9
backupReg0i = R126i.x;
R126i.x = R126i.w;
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) * 2.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R122i.x)));
R125i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)),intBitsToFloat(PV0iw)) + intBitsToFloat(PV0iw));
R125i.w = floatBitsToInt(-(intBitsToFloat(R7i.w)) * 3.0 + 4.0);
R124i.y = ((backupReg0i == 0)?(0):(0x3f800000));
// 10
backupReg0i = R127i.w;
R7i.x = R126i.w;
R7i.x = clampFI32(R7i.x);
PV0iy = floatBitsToInt(intBitsToFloat(R126i.z) + 1.0);
R124i.z = floatBitsToInt(-(intBitsToFloat(R1i.x)) * intBitsToFloat(0x3d23d70a) + intBitsToFloat(0x3d23d70a));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),-(intBitsToFloat(R127i.y))) + intBitsToFloat(R6i.y));
R122i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)),intBitsToFloat(R125i.z)) + intBitsToFloat(R125i.z));
// 11
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(PV0iy)) + intBitsToFloat(PV0iy));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R122i.x)));
R7i.z = floatBitsToInt(intBitsToFloat(R1i.x) * 0.25 + 0.25);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(backupReg0i)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R125i.w));
// 12
backupReg0i = R124i.y;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(R127i.w));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS1i)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1iw)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),-(intBitsToFloat(R127i.y))) + intBitsToFloat(R7i.x));
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z),intBitsToFloat(R1i.x)) + intBitsToFloat(R124i.z));
// 13
backupReg0i = R127i.y;
backupReg1i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].w), intBitsToFloat(uf_remappedPS[7].w)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R1i.x)) + intBitsToFloat(R124i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R1i.x)) + intBitsToFloat(R124i.z));
R126i.w = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(R123i.w));
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(backupReg1i));
// 14
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),-(intBitsToFloat(R125i.y))) + intBitsToFloat(R123i.z));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),-(intBitsToFloat(R124i.y))) + intBitsToFloat(R123i.z));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),-(intBitsToFloat(R125i.y))) + intBitsToFloat(R125i.x));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),-(intBitsToFloat(R125i.y))) + intBitsToFloat(R127i.y));
R6i.y = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 15
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),-(intBitsToFloat(R124i.y))) + intBitsToFloat(R125i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),-(intBitsToFloat(R124i.y))) + intBitsToFloat(R127i.y));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.w)));
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(backupReg0i)));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R126i.w));
// 16
backupReg0i = R127i.x;
backupReg1i = R126i.y;
R127i.x = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(R125i.w));
R126i.y = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(backupReg0i));
R5i.z = floatBitsToInt(intBitsToFloat(R124i.y) + intBitsToFloat(backupReg1i));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(R124i.z));
R6i.z = floatBitsToInt(intBitsToFloat(R124i.y) + intBitsToFloat(R123i.y));
// 17
PV1ix = floatBitsToInt(0.25 * intBitsToFloat(R6i.y));
R6i.y = floatBitsToInt(intBitsToFloat(R124i.y) + intBitsToFloat(R126i.x));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R126i.z)));
R3i.w = floatBitsToInt(intBitsToFloat(R8i.x) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R3i.w = clampFI32(R3i.w);
R0i.w = floatBitsToInt(intBitsToFloat(R8i.y) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R0i.w = clampFI32(R0i.w);
// 18
R0i.x = floatBitsToInt(intBitsToFloat(R8i.z) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R0i.x = clampFI32(R0i.x);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV1ix)));
PS0i = R4i.z & int(1);
// 19
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].x), intBitsToFloat(PV0iw)));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].z), intBitsToFloat(PV0iy)));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].y), intBitsToFloat(PV0iz)));
R3i.z = floatBitsToInt(float(PS0i));
// 20
R4i.x = R10i.x;
R4i.y = R10i.y;
R4i.z = floatBitsToInt(roundEven(1.0));
R8i.w = floatBitsToInt(texture(textureUnitPS4, vec2(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y))).x);
R12i.xzw = floatBitsToInt(texture(textureUnitPS11, vec2(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y))).xzw);
R13i.xyz = floatBitsToInt(texture(textureUnitPS10, vec3(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z))).xyz);
R4i.xyz = floatBitsToInt(texture(textureUnitPS10, vec3(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z))).xyz);
R2i.xyz = floatBitsToInt(zmCube(textureUnitPS8, intBitsToFloat(R2i.xy), R2i.z, cubeMapArrayIndex8, intBitsToFloat(R2i.w)).xyz);
R10i.xyz = floatBitsToInt(texture(textureUnitPS13, vec2(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y))).xyz);
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.w),-(intBitsToFloat(R7i.z))) + intBitsToFloat(R12i.w));
R123i.y = floatBitsToInt(intBitsToFloat(R12i.w) * 0.5 + 0.5);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x),intBitsToFloat(R8i.w)) + intBitsToFloat(uf_remappedPS[1].x));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.x), intBitsToFloat(R7i.x)));
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z), intBitsToFloat(R12i.z)));
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(R123i.z)));
PV1iy = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(R123i.y));
PV1iy = clampFI32(PV1iy);
PV1iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R123i.z)), intBitsToFloat(R5i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R123i.z)), intBitsToFloat(R6i.x)));
R126i.x = floatBitsToInt(intBitsToFloat(R7i.z) + intBitsToFloat(R123i.x));
// 2
R127i.x = floatBitsToInt(-(intBitsToFloat(R11i.x)) + intBitsToFloat(PV1iw));
R126i.y = floatBitsToInt(-(intBitsToFloat(R11i.y)) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(-(intBitsToFloat(R9i.z)) + intBitsToFloat(PV1ix));
R8i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV1iy)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].x), intBitsToFloat(R125i.w)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R12i.y),intBitsToFloat(R11i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
R127i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R5i.z)));
// 4
backupReg0i = R126i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.x)),intBitsToFloat(PV1ix)) + intBitsToFloat(R127i.x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R6i.z)));
R125i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.y)),intBitsToFloat(PV1ix)) + intBitsToFloat(backupReg0i));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R7i.w)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R125i.y)) + intBitsToFloat(R4i.x));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(R123i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R6i.y)));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R1i.z)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R125i.w)) + intBitsToFloat(PV1iz));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R126i.y)) + intBitsToFloat(R4i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(PV1iw)) + intBitsToFloat(R4i.z));
// 7
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z),intBitsToFloat(PV0ix)) + intBitsToFloat(R123i.w));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(PV0ix)) + intBitsToFloat(R123i.z));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(PV0ix)) + intBitsToFloat(R125i.y));
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.y));
PS1i = floatBitsToInt(tempResultf);
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS1i)));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R125i.x)));
// 9
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].z), intBitsToFloat(PV0iw)));
// 10
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3ced9168));
PV0iy = clampFI32(PV0iy);
// 11
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R0i.z)) + 1.0);
// 12
R1i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.x)),intBitsToFloat(R123i.y)) + intBitsToFloat(R123i.y));
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].x),intBitsToFloat(R8i.w)) + intBitsToFloat(R13i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].z),intBitsToFloat(R8i.w)) + intBitsToFloat(R13i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].y),intBitsToFloat(R8i.w)) + intBitsToFloat(R13i.y));
// 1
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(R1i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R1i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(R1i.x)));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(R0i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R3i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R0i.x)));
// 3
R123i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R123i.y = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(R123i.x));
PV0iz = floatBitsToInt(intBitsToFloat(R8i.z) + intBitsToFloat(R123i.y));
PV0iw = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(R123i.z));
// 5
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z),intBitsToFloat(PV0iw)) + intBitsToFloat(R10i.x));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z),intBitsToFloat(PV0iz)) + intBitsToFloat(R10i.y));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z),intBitsToFloat(PV0iy)) + intBitsToFloat(R10i.z));
// export
passPixelColor0 = vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.z), intBitsToFloat(R4i.w));
}
