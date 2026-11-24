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
// shader 2e2543216c04766d
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[14];
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
R1i = floatBitsToInt(passParameterSem4);
R2i = floatBitsToInt(passParameterSem6);
R3i.w = floatBitsToInt(texture(textureUnitPS4, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R6i.xyzw = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R2i.z),intBitsToFloat(R2i.w))).xyzw);
R4i.xyzw = floatBitsToInt(zmGather(textureUnitPS6, vec2(0.0001) + vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)), 0).xyzw);
R5i.xyzw = floatBitsToInt(zmGather(textureUnitPS7, vec2(0.0001) + vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)), 0).xyzw);
R7i.xyzw = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R2i.z),intBitsToFloat(R2i.w))).xyzw);
// 0
R126i.x = floatBitsToInt(intBitsToFloat(R6i.x) * 2.0 + -(1.0));
R127i.y = floatBitsToInt(intBitsToFloat(R6i.y) * 2.0 + -(1.0));
R127i.z = floatBitsToInt(intBitsToFloat(R6i.z) * 2.0 + -(1.0));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(uf_remappedPS[0].x)) + intBitsToFloat(uf_remappedPS[1].x));
R126i.z = floatBitsToInt(-(intBitsToFloat(R3i.w)) + intBitsToFloat(R4i.x));
// 1
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), -(intBitsToFloat(R123i.w))));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), -(intBitsToFloat(R123i.w))));
R124i.z = floatBitsToInt(-(intBitsToFloat(R123i.w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(uf_remappedPS[2].y)));
R125i.x = floatBitsToInt(-(intBitsToFloat(R3i.w)) + intBitsToFloat(R4i.y));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R124i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R124i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R2i.z = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.x = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 4
R124i.x = floatBitsToInt(intBitsToFloat(R2i.x) + -(intBitsToFloat(uf_remappedPS[3].x)));
R126i.y = floatBitsToInt(intBitsToFloat(R2i.y) + -(intBitsToFloat(uf_remappedPS[3].y)));
R125i.z = floatBitsToInt(intBitsToFloat(R124i.z) + -(intBitsToFloat(uf_remappedPS[3].z)));
R125i.w = floatBitsToInt(intBitsToFloat(R127i.x) + 200.0);
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 5
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS0i)));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
R127i.w = R2i.z;
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 6
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PS1i)));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PS1i)));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(PS1i)));
R126i.w = floatBitsToInt(-(intBitsToFloat(R3i.w)) + intBitsToFloat(R4i.z));
R127i.y = floatBitsToInt(-(intBitsToFloat(R3i.w)) + intBitsToFloat(R4i.w));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R11i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R12i.z),0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) * 2.0);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), intBitsToFloat(R127i.w)));
// 8
backupReg0i = R126i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(R10i.x)) + intBitsToFloat(R11i.x));
R124i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(R10i.y)) + intBitsToFloat(R11i.y));
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(R11i.z)) + intBitsToFloat(R12i.z));
R127i.w = floatBitsToInt(max(intBitsToFloat(backupReg0i), -(intBitsToFloat(backupReg0i))));
R125i.x = floatBitsToInt(max(intBitsToFloat(R125i.x), -(intBitsToFloat(R125i.x))));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.w = floatBitsToInt(max(intBitsToFloat(R126i.w), -(intBitsToFloat(R126i.w))));
// 10
R126i.x = floatBitsToInt(fract(intBitsToFloat(R1i.y)));
R127i.y = floatBitsToInt(max(intBitsToFloat(R127i.y), -(intBitsToFloat(R127i.y))));
R127i.z = floatBitsToInt(fract(intBitsToFloat(R1i.x)));
R125i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.w)),intBitsToFloat(R125i.w)) + intBitsToFloat(PV1ix));
R8i.w = 0x40400000;
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R124i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),0.0)));
PV1ix = tempi.x;
R126i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R3i.z = floatBitsToInt(roundEven(1.0));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3eaaaaab),intBitsToFloat(0x3eaaaaab),intBitsToFloat(0x3eaaaaab),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(PV1ix)) + -(intBitsToFloat(R125i.w)));
// 13
PV1ix = floatBitsToInt(-(intBitsToFloat(PV0ix)) + intBitsToFloat(R5i.y));
PV1iy = floatBitsToInt(-(intBitsToFloat(PV0ix)) + intBitsToFloat(R5i.w));
PV1iz = floatBitsToInt(-(intBitsToFloat(PV0ix)) + intBitsToFloat(R5i.x));
PV1iw = floatBitsToInt(-(intBitsToFloat(PV0ix)) + intBitsToFloat(R5i.z));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(R122i.x)));
// 14
R124i.x = floatBitsToInt(-(intBitsToFloat(R126i.y)) + intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(max(intBitsToFloat(PV1ix), -(intBitsToFloat(PV1ix))));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 4.0);
PV0iz = floatBitsToInt(max(intBitsToFloat(PV1iz), -(intBitsToFloat(PV1iz))));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 4.0);
PV0iw = floatBitsToInt(max(intBitsToFloat(PV1iw), -(intBitsToFloat(PV1iw))));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 4.0);
PS0i = floatBitsToInt(max(intBitsToFloat(PV1iy), -(intBitsToFloat(PV1iy))));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 4.0);
// 15
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R125i.x)) + intBitsToFloat(PV0iy));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R127i.y)) + intBitsToFloat(PS0i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iz));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R126i.w)) + intBitsToFloat(PV0iw));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R124i.x)) + intBitsToFloat(R2i.x));
// 16
backupReg0i = R123i.z;
PV0ix = floatBitsToInt(-(intBitsToFloat(R123i.x)) + intBitsToFloat(R123i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R124i.x)) + intBitsToFloat(R124i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(R124i.x)) + intBitsToFloat(R2i.y));
PV0iw = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(R123i.w)));
R2i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[3].x)) + intBitsToFloat(R122i.x));
// 17
R124i.x = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
R2i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[3].y)) + intBitsToFloat(R123i.z));
R5i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[3].z)) + intBitsToFloat(R123i.y));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iw));
R9i.w = floatBitsToInt(-(intBitsToFloat(R6i.w)) * 3.0 + 3.0);
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R5i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R127i.z));
PS0i = clampFI32(PS0i);
// 19
R5i.x = uf_remappedPS[4].y;
PV1iy = floatBitsToInt(intBitsToFloat(R124i.x) + intBitsToFloat(R126i.x));
PV1iy = clampFI32(PV1iy);
R10i.z = uf_remappedPS[5].y;
R3i.w = floatBitsToInt(-(intBitsToFloat(R127i.z)) + intBitsToFloat(PS0i));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
R5i.w = floatBitsToInt(tempResultf);
// 20
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R11i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[6].x),intBitsToFloat(uf_remappedPS[6].y),intBitsToFloat(uf_remappedPS[6].z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R4i.w = floatBitsToInt(-(intBitsToFloat(R126i.x)) + intBitsToFloat(PV1iy));
// 21
R4i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R11i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[7].x),intBitsToFloat(uf_remappedPS[7].y),intBitsToFloat(uf_remappedPS[7].z),0.0)));
PV1iy = R4i.x;
PV1iz = R4i.x;
PV1iw = R4i.x;
R4i.z = floatBitsToInt(-(intBitsToFloat(PV0ix)));
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R11i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[8].x),intBitsToFloat(uf_remappedPS[8].y),intBitsToFloat(uf_remappedPS[8].z),0.0)));
PV0ix = tempi.x;
R4i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R5i.w)));
// 1
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(R3i.w)) + intBitsToFloat(R0i.x));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R5i.w)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R5i.w)));
R3i.w = uf_remappedPS[9].y;
PS1i = floatBitsToInt(intBitsToFloat(R2i.z) * 25.0);
PS1i = clampFI32(PS1i);
// 2
R0i.x = floatBitsToInt(intBitsToFloat(R11i.x) + intBitsToFloat(uf_remappedPS[10].x));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(R4i.w)) + intBitsToFloat(R0i.y));
R0i.z = floatBitsToInt(intBitsToFloat(R11i.y) + intBitsToFloat(uf_remappedPS[10].y));
R0i.w = floatBitsToInt(intBitsToFloat(PS1i) * 0.5 + 0.5);
R1i.z = floatBitsToInt(intBitsToFloat(R12i.z) + intBitsToFloat(uf_remappedPS[10].z));
// 3
redcCUBE(vec4(intBitsToFloat(R4i.z),intBitsToFloat(R4i.z),intBitsToFloat(R4i.x),intBitsToFloat(R4i.y)),vec4(intBitsToFloat(R4i.y),intBitsToFloat(R4i.x),intBitsToFloat(R4i.z),intBitsToFloat(R4i.z)),cubeMapSTM,cubeMapFaceId);
R125i.x = floatBitsToInt(cubeMapSTM.x);
R125i.y = floatBitsToInt(cubeMapSTM.y);
R125i.z = floatBitsToInt(cubeMapSTM.z);
R125i.w = cubeMapFaceId;
R127i.w = floatBitsToInt(-(intBitsToFloat(R6i.w)) + 1.0);
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedPS[6].x),intBitsToFloat(uf_remappedPS[6].y),intBitsToFloat(uf_remappedPS[6].z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R124i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R124i.x = floatBitsToInt(1.0 / abs(intBitsToFloat(R125i.z)));
// 5
R4i.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedPS[7].x),intBitsToFloat(uf_remappedPS[7].y),intBitsToFloat(uf_remappedPS[7].z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R124i.y),intBitsToFloat(R127i.z),0.0)));
PV1iy = R4i.x;
PV1iz = R4i.x;
PV1iw = R4i.x;
R4i.z = floatBitsToInt(-(intBitsToFloat(PV0ix)));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedPS[8].x),intBitsToFloat(uf_remappedPS[8].y),intBitsToFloat(uf_remappedPS[8].z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R124i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
R4i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R124i.x)) + 1.5);
// 7
backupReg0i = R125i.w;
R125i.x = floatBitsToInt(intBitsToFloat(R127i.w) * 0.5 + 0.5);
R8i.y = R122i.x;
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R124i.x)) + 1.5);
R125i.w = floatBitsToInt(intBitsToFloat(R7i.w) * 255.0);
R8i.z = backupReg0i;
// 8
redcCUBE(vec4(intBitsToFloat(R4i.z),intBitsToFloat(R4i.z),intBitsToFloat(R4i.x),intBitsToFloat(R4i.y)),vec4(intBitsToFloat(R4i.y),intBitsToFloat(R4i.x),intBitsToFloat(R4i.z),intBitsToFloat(R4i.z)),cubeMapSTM,cubeMapFaceId);
R124i.x = floatBitsToInt(cubeMapSTM.x);
R124i.y = floatBitsToInt(cubeMapSTM.y);
R124i.z = floatBitsToInt(cubeMapSTM.z);
R124i.w = cubeMapFaceId;
R8i.x = R123i.z;
// 9
R6i.x = floatBitsToInt(intBitsToFloat(R7i.x) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R6i.x = clampFI32(R6i.x);
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R125i.x)));
R6i.y = floatBitsToInt(intBitsToFloat(R6i.y) / 2.0);
R9i.z = R124i.w;
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.w)),intBitsToFloat(R127i.w)) + intBitsToFloat(R127i.w));
PS1i = floatBitsToInt(1.0 / abs(intBitsToFloat(R124i.z)));
// 10
R7i.x = floatBitsToInt(intBitsToFloat(R7i.y) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R7i.x = clampFI32(R7i.x);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(PS1i)) + 1.5);
PV0iz = floatBitsToInt(intBitsToFloat(R123i.w) + intBitsToFloat(0x3c23d70a));
PV0iz = clampFI32(PV0iz);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(PS1i)) + 1.5);
R6i.z = floatBitsToInt(intBitsToFloat(R7i.z) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R6i.z = clampFI32(R6i.z);
// 11
R9i.x = R123i.w;
R9i.y = R123i.y;
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(PV0iz)));
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R11i.z)));
R7i.y = int(intBitsToFloat(R125i.w));
R2i.xzw = floatBitsToInt(texture(textureUnitPS11, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y))).xzw);
R8i.xyz = floatBitsToInt(zmCube(textureUnitPS8, intBitsToFloat(R8i.xy), R8i.z, cubeMapArrayIndex8, intBitsToFloat(R8i.w)).xyz);
R9i.xyz = floatBitsToInt(zmCube(textureUnitPS8, intBitsToFloat(R9i.xy), R9i.z, cubeMapArrayIndex8, intBitsToFloat(R9i.w)).xyz);
R4i.xyz = floatBitsToInt(texture(textureUnitPS10, vec3(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z))).xyz);
R3i.xyz = floatBitsToInt(texture(textureUnitPS13, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y))).xyz);
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R10i.z),intBitsToFloat(R7i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[10].x)), intBitsToFloat(uf_remappedPS[11].w)));
// 1
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[10].y)), intBitsToFloat(uf_remappedPS[11].w)));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.w)),intBitsToFloat(PV0ix)) + intBitsToFloat(PV0ix));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R2i.w)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[11].w), intBitsToFloat(uf_remappedPS[11].w)));
R125i.x = R7i.y & int(1);
// 2
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),-(intBitsToFloat(R123i.y))) + intBitsToFloat(R10i.x));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z),-(intBitsToFloat(R123i.y))) + intBitsToFloat(R10i.y));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),-(intBitsToFloat(R123i.y))) + intBitsToFloat(R11i.z));
R124i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[10].z)), intBitsToFloat(uf_remappedPS[11].w)));
R10i.x = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(0x3f4ccccd));
R10i.x = clampFI32(R10i.x);
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R124i.y),intBitsToFloat(R124i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R124i.y),intBitsToFloat(R124i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[12].x), intBitsToFloat(R125i.z)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.z),intBitsToFloat(R1i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.z),intBitsToFloat(R1i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 5
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PS0i)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(PS0i)));
R127i.w = floatBitsToInt(intBitsToFloat(R125i.z) + 0.25);
R127i.w = clampFI32(R127i.w);
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
R125i.z = floatBitsToInt(tempResultf);
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R12i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R5i.x),intBitsToFloat(R127i.y),intBitsToFloat(R124i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R125i.z)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R125i.z)));
R124i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(uf_remappedPS[11].w)));
PV1iz = floatBitsToInt(max(-(intBitsToFloat(PV0ix)), 0.0));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R125i.z)));
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R125i.w)));
// 8
R124i.x = floatBitsToInt(min(intBitsToFloat(PV1iz), 1.0));
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iw)), intBitsToFloat(uf_remappedPS[11].w)));
R125i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1ix)), intBitsToFloat(uf_remappedPS[11].w)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R2i.z)));
R127i.z = floatBitsToInt(float(R125i.x));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.x),intBitsToFloat(R124i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.y),intBitsToFloat(R125i.y),intBitsToFloat(R125i.z),0.0)));
tempi.x = clampFI32(tempi.x);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R125i.w = tempi.x;
R125i.x = floatBitsToInt(-(intBitsToFloat(R124i.x)) + 1.0);
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.y),intBitsToFloat(R125i.y),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R5i.x),intBitsToFloat(R127i.y),intBitsToFloat(R124i.z),0.0)));
tempi.x = clampFI32(tempi.x);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(-(intBitsToFloat(PV1ix)) + 1.0);
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(PV0ix)));
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.x)),intBitsToFloat(R125i.x)) + intBitsToFloat(R125i.x));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R124i.z)));
R124i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.w)),intBitsToFloat(PS0i)) + intBitsToFloat(PS0i));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),-(intBitsToFloat(R6i.y))) + intBitsToFloat(R124i.x));
// 12
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y)) + intBitsToFloat(PV1iz));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.x)),intBitsToFloat(R125i.y)) + intBitsToFloat(R125i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.w)),intBitsToFloat(R124i.w)) + intBitsToFloat(R124i.w));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z),intBitsToFloat(PV1ix)) + -(intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(R122i.x));
// 13
backupReg0i = R125i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R5i.x)) + intBitsToFloat(R123i.x));
R123i.x = clampFI32(R123i.x);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R123i.z)));
PV1iz = floatBitsToInt(intBitsToFloat(R125i.w) + 1.0);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R123i.y)));
R124i.z = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 14
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),-(intBitsToFloat(R6i.y))) + intBitsToFloat(backupReg0i));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(PV1iz)) + intBitsToFloat(PV1iz));
R123i.z = floatBitsToInt(-(intBitsToFloat(R125i.y)) * intBitsToFloat(0x3ca3d70a) + intBitsToFloat(0x3ca3d70a));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R10i.x)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(backupReg0i)));
// 15
backupReg0i = R124i.z;
PV1ix = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(R123i.x));
R126i.y = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(R123i.z));
R124i.z = floatBitsToInt(-(intBitsToFloat(R124i.w)) * intBitsToFloat(0x3ca3d70a) + intBitsToFloat(0x3ca3d70a));
R125i.w = floatBitsToInt(0.25 * intBitsToFloat(backupReg0i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.y));
// 16
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),-(intBitsToFloat(R125i.y))) + intBitsToFloat(R127i.w));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),-(intBitsToFloat(R124i.w))) + intBitsToFloat(R8i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),-(intBitsToFloat(R124i.w))) + intBitsToFloat(R8i.x));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 17
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z),-(intBitsToFloat(R124i.w))) + intBitsToFloat(R8i.z));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R125i.w)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R0i.x)));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[13].x),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.z));
// 18
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(PV1iz)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[13].z),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[13].y),intBitsToFloat(R127i.x)) + intBitsToFloat(R125i.y));
PV0iw = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(R124i.z));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R122i.x), intBitsToFloat(R6i.x)));
// 19
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),intBitsToFloat(PV0iw)) + intBitsToFloat(R4i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(PV0iw)) + intBitsToFloat(R4i.x));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(R7i.x)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z),intBitsToFloat(PV0iw)) + intBitsToFloat(R4i.z));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R6i.z)));
// 20
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[13].x), intBitsToFloat(R126i.y)));
R4i.y = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[13].z), intBitsToFloat(R126i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[13].y), intBitsToFloat(R126i.y)));
R8i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
// 21
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R126i.x)) + intBitsToFloat(R124i.w));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R126i.x)) + intBitsToFloat(R127i.x));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R126i.x)) + intBitsToFloat(R127i.y));
R3i.w = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R126i.w)));
// 22
PV0iy = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(R3i.w));
PV0iz = floatBitsToInt(intBitsToFloat(R9i.y) + intBitsToFloat(R8i.y));
PV0iw = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(R4i.y));
// 23
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(PV0iw)) + intBitsToFloat(R3i.x));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(PV0iz)) + intBitsToFloat(R3i.y));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(PV0iy)) + intBitsToFloat(R3i.z));
// export
passPixelColor0 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.z), intBitsToFloat(R6i.w));
}
