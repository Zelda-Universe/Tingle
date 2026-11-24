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
// shader 556c05fb25791fec
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[10];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(1, 1, 0) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 1) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(3, 1, 2) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(5, 1, 3) uniform sampler2D textureUnitPS5;
TEXTURE_LAYOUT(7, 1, 4) uniform sampler2D textureUnitPS7;
TEXTURE_LAYOUT(8, 1, 5) uniform sampler2D textureUnitPS8;
TEXTURE_LAYOUT(9, 1, 6) uniform sampler2DArray textureUnitPS9;
TEXTURE_LAYOUT(11, 1, 7) uniform sampler2DArray textureUnitPS11;
TEXTURE_LAYOUT(12, 1, 8) uniform sampler2D textureUnitPS12;
TEXTURE_LAYOUT(14, 1, 9) uniform sampler2D textureUnitPS14;
in vec4 passParameterSem0;
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
float cubeMapArrayIndex9 = 0.0;
R0i = floatBitsToInt(passParameterSem0);
R1i = floatBitsToInt(passParameterSem4);
R2i = floatBitsToInt(passParameterSem6);
R3i.w = floatBitsToInt(texture(textureUnitPS5, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R7i.xyzw = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R2i.z),intBitsToFloat(R2i.w))).xyzw);
R4i.xyzw = floatBitsToInt(zmGather(textureUnitPS7, vec2(0.0001) + vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)), 0).xyzw);
R5i.xyzw = floatBitsToInt(zmGather(textureUnitPS8, vec2(0.0001) + vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)), 0).xyzw);
R9i.xyzw = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R2i.z),intBitsToFloat(R2i.w))).xyzw);
// 0
R124i.x = floatBitsToInt(intBitsToFloat(R7i.x) * 2.0 + -(1.0));
R2i.y = floatBitsToInt(intBitsToFloat(R7i.y) * 2.0 + -(1.0));
R124i.z = floatBitsToInt(intBitsToFloat(R7i.z) * 2.0 + -(1.0));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(uf_remappedPS[0].x)) + intBitsToFloat(uf_remappedPS[1].x));
R126i.z = floatBitsToInt(-(intBitsToFloat(R3i.w)) + intBitsToFloat(R4i.x));
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), -(intBitsToFloat(R123i.w))));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), -(intBitsToFloat(R123i.w))));
R127i.z = floatBitsToInt(-(intBitsToFloat(R123i.w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(uf_remappedPS[2].y)));
R125i.y = floatBitsToInt(-(intBitsToFloat(R3i.w)) + intBitsToFloat(R4i.y));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.x = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) * 2.0);
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3eaaaaab),intBitsToFloat(0x3eaaaaab),intBitsToFloat(0x3eaaaaab),0.0)));
PV1ix = tempi.x;
R127i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 4
R125i.x = floatBitsToInt(-(intBitsToFloat(R3i.w)) + intBitsToFloat(R4i.z));
R124i.y = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(R5i.y));
R125i.z = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(R5i.x));
R127i.w = floatBitsToInt(-(intBitsToFloat(R3i.w)) + intBitsToFloat(R4i.w));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 5
backupReg0i = R127i.x;
backupReg1i = R127i.y;
backupReg2i = R127i.z;
R127i.x = floatBitsToInt(-(intBitsToFloat(backupReg1i)) + intBitsToFloat(R5i.z));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS0i)));
R126i.w = floatBitsToInt(-(intBitsToFloat(backupReg1i)) + intBitsToFloat(R5i.w));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg2i), intBitsToFloat(PS0i)));
// 6
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R2i.y),intBitsToFloat(R124i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R2i.y),intBitsToFloat(R124i.z),0.0)));
PV0iy = R126i.x;
PV0iz = R126i.x;
PV0iw = R126i.x;
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), intBitsToFloat(backupReg0i)));
// 7
R125i.x = floatBitsToInt(max(intBitsToFloat(R125i.x), -(intBitsToFloat(R125i.x))));
R125i.y = floatBitsToInt(max(intBitsToFloat(R125i.y), -(intBitsToFloat(R125i.y))));
PV1iz = floatBitsToInt(max(intBitsToFloat(R126i.z), -(intBitsToFloat(R126i.z))));
R127i.w = floatBitsToInt(max(intBitsToFloat(R127i.w), -(intBitsToFloat(R127i.w))));
PS1i = floatBitsToInt(max(intBitsToFloat(R125i.z), -(intBitsToFloat(R125i.z))));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 4.0);
// 8
PV0ix = floatBitsToInt(max(intBitsToFloat(R127i.x), -(intBitsToFloat(R127i.x))));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 4.0);
PV0iy = floatBitsToInt(max(intBitsToFloat(R124i.y), -(intBitsToFloat(R124i.y))));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 4.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(PV1iz)) + intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(max(intBitsToFloat(R126i.w), -(intBitsToFloat(R126i.w))));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 4.0);
tempResultf = 1.0 / sqrt(intBitsToFloat(R126i.x));
R126i.w = floatBitsToInt(tempResultf);
// 9
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R125i.x)) + intBitsToFloat(PV0ix));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R125i.y)) + intBitsToFloat(PV0iy));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R126i.w)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iw));
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R126i.w)));
// 10
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R126i.w)));
R125i.y = floatBitsToInt(intBitsToFloat(R126i.z) + -(intBitsToFloat(R123i.x)));
R126i.z = floatBitsToInt(-(intBitsToFloat(R123i.y)) + intBitsToFloat(R123i.w));
R126i.w = floatBitsToInt(fract(intBitsToFloat(R1i.x)));
R124i.y = floatBitsToInt(fract(intBitsToFloat(R1i.y)));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R6i.x),intBitsToFloat(R3i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R5i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R127i.w = tempi.x;
PS1i = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(R125i.y));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) + intBitsToFloat(R126i.w));
PV0ix = clampFI32(PV0ix);
PV0iy = R6i.x;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
PV0iz = R3i.x;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
PV0iw = floatBitsToInt(intBitsToFloat(R126i.z) + -(intBitsToFloat(R125i.y)));
PS0i = R3i.z;
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 13
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)),intBitsToFloat(PV0iz)) + intBitsToFloat(R127i.y));
PV1iy = floatBitsToInt(-(intBitsToFloat(R126i.w)) + intBitsToFloat(PV0ix));
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)),intBitsToFloat(PV0iy)) + intBitsToFloat(R127i.z));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R124i.y));
PV1iw = clampFI32(PV1iw);
R124i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)),intBitsToFloat(PS0i)) + intBitsToFloat(R5i.z));
// 14
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(PV1iy)) + intBitsToFloat(R0i.x));
R5i.y = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(uf_remappedPS[3].x));
R4i.z = floatBitsToInt(roundEven(0.0));
PV0iw = floatBitsToInt(-(intBitsToFloat(R124i.y)) + intBitsToFloat(PV1iw));
R2i.w = floatBitsToInt(-(intBitsToFloat(R7i.w)) * 3.0 + 3.0);
// 15
R5i.x = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(uf_remappedPS[3].y));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(PV0iw)) + intBitsToFloat(R0i.y));
R5i.z = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(uf_remappedPS[3].z));
PV1iw = floatBitsToInt(intBitsToFloat(R9i.w) * 255.0);
R127i.w = floatBitsToInt(max(-(intBitsToFloat(R127i.w)), 0.0));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedPS[4].x),intBitsToFloat(uf_remappedPS[4].y),intBitsToFloat(uf_remappedPS[4].z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.z),intBitsToFloat(R124i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R5i.w = int(intBitsToFloat(PV1iw));
// 17
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedPS[5].x),intBitsToFloat(uf_remappedPS[5].y),intBitsToFloat(uf_remappedPS[5].z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.z),intBitsToFloat(R124i.z),0.0)));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
R127i.z = floatBitsToInt(-(intBitsToFloat(PV0ix)));
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedPS[6].x),intBitsToFloat(uf_remappedPS[6].y),intBitsToFloat(uf_remappedPS[6].z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.z),intBitsToFloat(R124i.z),0.0)));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R1i.z = floatBitsToInt(-(intBitsToFloat(R7i.w)) + 1.0);
// 19
redcCUBE(vec4(intBitsToFloat(R127i.z),intBitsToFloat(R127i.z),intBitsToFloat(R127i.x),intBitsToFloat(PV0ix)),vec4(intBitsToFloat(PV0ix),intBitsToFloat(R127i.x),intBitsToFloat(R127i.z),intBitsToFloat(R127i.z)),cubeMapSTM,cubeMapFaceId);
R126i.x = floatBitsToInt(cubeMapSTM.x);
R126i.y = floatBitsToInt(cubeMapSTM.y);
R126i.z = floatBitsToInt(cubeMapSTM.z);
R126i.w = cubeMapFaceId;
R1i.w = 0;
// 20
PV0ix = R5i.w & 0xfc;
R3i.y = floatBitsToInt(min(intBitsToFloat(R127i.w), 1.0));
R2i.z = R126i.w;
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.w)),intBitsToFloat(R1i.z)) + intBitsToFloat(R1i.z));
PS0i = floatBitsToInt(1.0 / abs(intBitsToFloat(R126i.z)));
// 21
R1i.x = floatBitsToInt(intBitsToFloat(R123i.w) + intBitsToFloat(0x3c23d70a));
R1i.x = clampFI32(R1i.x);
R1i.y = 0;
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PS0i)) + 1.5);
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(PS0i)) + 1.5);
R0i.x = floatBitsToInt(float(PV0ix));
// 0
R2i.x = R0i.w;
R2i.y = R0i.z;
R0i.z = floatBitsToInt(-(intBitsToFloat(R3i.y)) + 1.0);
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x), intBitsToFloat(uf_remappedPS[7].w)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].y), intBitsToFloat(uf_remappedPS[7].w)));
R10i.xzw = floatBitsToInt(texture(textureUnitPS12, vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y))).xzw);
R6i.y = floatBitsToInt(textureLod(textureUnitPS2, vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y)),0.0).w);
R8i.xyz = floatBitsToInt(texture(textureUnitPS11, vec3(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z))).xyz);
R2i.xyz = floatBitsToInt(zmCube(textureUnitPS9, intBitsToFloat(R2i.xy), R2i.z, cubeMapArrayIndex9, intBitsToFloat(R2i.w)).xyz);
R4i.xyz = floatBitsToInt(texture(textureUnitPS14, vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y))).xyz);
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.y),intBitsToFloat(R5i.x),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R5i.y),intBitsToFloat(R5i.x),intBitsToFloat(R5i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].z), intBitsToFloat(uf_remappedPS[7].w)));
// 1
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R1i.x)));
R125i.y = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3b820821));
R126i.z = floatBitsToInt(intBitsToFloat(R1i.z) * 0.5 + 0.5);
R126i.w = R5i.w & 0x2;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PS1i)));
R124i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.y)),intBitsToFloat(R0i.z)) + intBitsToFloat(R0i.z));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PS1i)));
R127i.x = floatBitsToInt(intBitsToFloat(R125i.y) * 0.25 + 0.25);
// 3
backupReg0i = R126i.z;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(uf_remappedPS[7].w)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedPS[7].w)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedPS[7].w)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(backupReg0i)));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) / 2.0);
R125i.z = floatBitsToInt(float(R126i.w));
R125i.z = floatBitsToInt(intBitsToFloat(R125i.z) / 2.0);
// 4
tempi.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R0i.w)),-(intBitsToFloat(R0i.y)),-(intBitsToFloat(R127i.z)),intBitsToFloat(0x80000000)),vec4(-(intBitsToFloat(R126i.x)),-(intBitsToFloat(R126i.y)),-(intBitsToFloat(R126i.z)),0.0)));
tempi.x = clampFI32(tempi.x);
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.y)),intBitsToFloat(R124i.z)) + intBitsToFloat(R124i.z));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R6i.x),intBitsToFloat(R3i.z),intBitsToFloat(R3i.z)),vec4(-(intBitsToFloat(R126i.x)),-(intBitsToFloat(R126i.y)),-(intBitsToFloat(R126i.z)),-(intBitsToFloat(R1i.w)))));
tempi.x = clampFI32(tempi.x);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.y = floatBitsToInt(-(intBitsToFloat(PV0ix)) + 1.0);
// 6
R124i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R6i.x),intBitsToFloat(R3i.z),intBitsToFloat(R3i.z)),vec4(-(intBitsToFloat(R0i.w)),-(intBitsToFloat(R0i.y)),-(intBitsToFloat(R127i.z)),-(intBitsToFloat(R1i.y)))));
R124i.x = clampFI32(R124i.x);
PV0iy = R124i.x;
PV0iz = R124i.x;
PV0iw = R124i.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(PV1ix)));
// 7
backupReg0i = R124i.z;
backupReg1i = R126i.w;
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)),intBitsToFloat(R126i.y)) + intBitsToFloat(R126i.y));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(R124i.x)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(PS0i)) + -(intBitsToFloat(PS0i)));
R126i.w = floatBitsToInt(-(intBitsToFloat(R7i.w)) * 3.0 + 4.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(backupReg1i)));
// 8
R126i.x = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(0x3e19999a));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w),-(intBitsToFloat(R127i.x))) + intBitsToFloat(R10i.w));
R126i.z = floatBitsToInt(intBitsToFloat(R10i.w) * 0.5 + 0.5);
R127i.w = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
PS0i = floatBitsToInt(intBitsToFloat(R124i.z) + 1.0);
// 9
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(R125i.y)) * intBitsToFloat(0x3d23d70a) + intBitsToFloat(0x3d23d70a));
R124i.y = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(R123i.y));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(PS0i)) + intBitsToFloat(PS0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),-(intBitsToFloat(R125i.w))) + intBitsToFloat(R3i.y));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.w));
// 10
backupReg0i = R126i.x;
backupReg1i = R126i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS1i)));
R126i.y = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(R123i.w));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(backupReg0i)) + intBitsToFloat(backupReg1i));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)),intBitsToFloat(R125i.x)) + intBitsToFloat(R125i.x));
R127i.y = floatBitsToInt(-(intBitsToFloat(R6i.y)) * 0.75 + 0.75);
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(uf_remappedPS[8].x)));
PV1iy = floatBitsToInt(intBitsToFloat(R124i.x) + intBitsToFloat(R126i.z));
PV1iy = clampFI32(PV1iy);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R123i.w)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),-(intBitsToFloat(R125i.z))) + intBitsToFloat(R124i.y));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),-(intBitsToFloat(R125i.w))) + intBitsToFloat(R124i.x));
// 12
R125i.x = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(R122i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),-(intBitsToFloat(R125i.z))) + intBitsToFloat(PV1ix));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(R125i.y)) + intBitsToFloat(R127i.x));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV1iy)));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].w), intBitsToFloat(uf_remappedPS[7].w)));
// 13
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),-(intBitsToFloat(R126i.x))) + intBitsToFloat(R123i.z));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R127i.w)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),-(intBitsToFloat(R126i.z))) + intBitsToFloat(R123i.z));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R123i.y)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R124i.z));
// 14
backupReg0i = R126i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R127i.x)));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(R123i.z));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PS1i)));
R126i.w = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(R123i.x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 15
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].x),intBitsToFloat(R125i.w)) + intBitsToFloat(R8i.x));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].y),intBitsToFloat(R125i.w)) + intBitsToFloat(R8i.y));
PV1iz = floatBitsToInt(0.25 * intBitsToFloat(PS0i));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].z),intBitsToFloat(R125i.w)) + intBitsToFloat(R8i.z));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R125i.x));
// 16
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV1iz)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R126i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(backupReg0i)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R126i.w)));
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)),intBitsToFloat(R123i.x)) + intBitsToFloat(R123i.x));
// 17
R123i.x = floatBitsToInt(intBitsToFloat(R9i.x) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R123i.x = clampFI32(R123i.x);
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)),intBitsToFloat(R125i.w)) + intBitsToFloat(R125i.w));
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)),intBitsToFloat(R124i.y)) + intBitsToFloat(R124i.y));
R123i.w = floatBitsToInt(intBitsToFloat(R9i.z) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R123i.w = clampFI32(R123i.w);
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(PV0iy)));
// 18
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R123i.w)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R123i.x)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].x), intBitsToFloat(R127i.x)));
R123i.w = floatBitsToInt(intBitsToFloat(R9i.y) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R123i.w = clampFI32(R123i.w);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].y), intBitsToFloat(R127i.x)));
// 19
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R123i.w)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R126i.w)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].z), intBitsToFloat(backupReg0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R126i.w)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R126i.w)));
// 20
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R125i.x)) + intBitsToFloat(PV1iw));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R125i.x)) + intBitsToFloat(PV1iy));
PV0iz = R5i.w & int(1);
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R125i.x)) + intBitsToFloat(PS1i));
R122i.x = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
// 21
R9i.x = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R2i.y = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(R10i.z)));
R9i.w = floatBitsToInt(intBitsToFloat(R123i.y) + intBitsToFloat(R122i.x));
R7i.w = floatBitsToInt(float(PV0iz));
// 0
backupReg0i = R2i.x;
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z),intBitsToFloat(R9i.w)) + intBitsToFloat(R4i.x));
PV0iy = floatBitsToInt(intBitsToFloat(R5i.w) + intBitsToFloat(R9i.x));
PV0iz = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(R2i.y));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(R2i.z)));
// 1
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z),intBitsToFloat(PV0iz)) + intBitsToFloat(R4i.y));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z),intBitsToFloat(PV0iy)) + intBitsToFloat(R4i.z));
// export
passPixelColor0 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
}
