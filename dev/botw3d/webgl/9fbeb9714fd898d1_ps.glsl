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
// shader 9fbeb9714fd898d1
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[14];
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
float cubeMapArrayIndex9 = 0.0;
R0i = floatBitsToInt(passParameterSem0);
R1i = floatBitsToInt(passParameterSem4);
R2i = floatBitsToInt(passParameterSem6);
R3i.w = floatBitsToInt(texture(textureUnitPS5, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R6i.xyzw = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R2i.z),intBitsToFloat(R2i.w))).xyzw);
R4i.xyzw = floatBitsToInt(zmGather(textureUnitPS7, vec2(0.0001) + vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)), 0).xyzw);
R5i.xyzw = floatBitsToInt(zmGather(textureUnitPS8, vec2(0.0001) + vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)), 0).xyzw);
R7i.xyzw = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R2i.z),intBitsToFloat(R2i.w))).xyzw);
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(uf_remappedPS[0].x)) + intBitsToFloat(uf_remappedPS[1].x));
R127i.y = floatBitsToInt(intBitsToFloat(R6i.x) * 2.0 + -(1.0));
R126i.z = floatBitsToInt(intBitsToFloat(R6i.y) * 2.0 + -(1.0));
R127i.w = floatBitsToInt(intBitsToFloat(R6i.z) * 2.0 + -(1.0));
R126i.w = floatBitsToInt(-(intBitsToFloat(R3i.w)) + intBitsToFloat(R4i.x));
// 1
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), -(intBitsToFloat(R123i.x))));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), -(intBitsToFloat(R123i.x))));
R2i.z = floatBitsToInt(-(intBitsToFloat(R123i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(uf_remappedPS[2].y)));
R125i.z = floatBitsToInt(-(intBitsToFloat(R3i.w)) + intBitsToFloat(R4i.y));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R2i.w = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R127i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R127i.w),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.z = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 4
R126i.x = floatBitsToInt(intBitsToFloat(R2i.x) + -(intBitsToFloat(uf_remappedPS[3].x)));
R126i.y = floatBitsToInt(intBitsToFloat(R2i.y) + -(intBitsToFloat(uf_remappedPS[3].y)));
R124i.z = floatBitsToInt(intBitsToFloat(R2i.z) + -(intBitsToFloat(uf_remappedPS[3].z)));
R124i.w = floatBitsToInt(intBitsToFloat(R127i.z) + 200.0);
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 5
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS0i)));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PS0i)));
R127i.w = R2i.w;
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 6
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PS1i)));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PS1i)));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PS1i)));
R125i.w = floatBitsToInt(-(intBitsToFloat(R3i.w)) + intBitsToFloat(R4i.z));
R127i.x = floatBitsToInt(-(intBitsToFloat(R3i.w)) + intBitsToFloat(R4i.w));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R11i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R11i.y),intBitsToFloat(R12i.z),0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) * 2.0);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), intBitsToFloat(R127i.w)));
// 8
R124i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(R10i.x)) + intBitsToFloat(R4i.x));
R124i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(R10i.y)) + intBitsToFloat(R11i.y));
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(R11i.z)) + intBitsToFloat(R12i.z));
R126i.w = floatBitsToInt(max(intBitsToFloat(R126i.w), -(intBitsToFloat(R126i.w))));
R127i.z = floatBitsToInt(max(intBitsToFloat(R125i.z), -(intBitsToFloat(R125i.z))));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R124i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R124i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.y = floatBitsToInt(max(intBitsToFloat(R125i.w), -(intBitsToFloat(R125i.w))));
// 10
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.w)),intBitsToFloat(R124i.w)) + intBitsToFloat(PV1ix));
R125i.y = floatBitsToInt(max(intBitsToFloat(backupReg0i), -(intBitsToFloat(backupReg0i))));
R4i.z = floatBitsToInt(fract(intBitsToFloat(R1i.y)));
R124i.w = floatBitsToInt(fract(intBitsToFloat(R1i.x)));
R3i.w = 0x40400000;
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3eaaaaab),intBitsToFloat(0x3eaaaaab),intBitsToFloat(0x3eaaaaab),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R125i.z = tempi.x;
PV1iw = tempi.x;
R9i.z = floatBitsToInt(roundEven(1.0));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R124i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R124i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R124i.z = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(R5i.x));
// 13
PV1ix = floatBitsToInt(-(intBitsToFloat(R125i.z)) + intBitsToFloat(R5i.w));
PV1iy = floatBitsToInt(-(intBitsToFloat(R125i.z)) + intBitsToFloat(R5i.z));
PV1iz = floatBitsToInt(-(intBitsToFloat(R125i.z)) + intBitsToFloat(R5i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(PV0ix)) + -(intBitsToFloat(R127i.x)));
PS1i = floatBitsToInt(max(intBitsToFloat(PS0i), -(intBitsToFloat(PS0i))));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 4.0);
// 14
PV0ix = floatBitsToInt(max(intBitsToFloat(PV1ix), -(intBitsToFloat(PV1ix))));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 4.0);
PV0iy = floatBitsToInt(max(intBitsToFloat(PV1iy), -(intBitsToFloat(PV1iy))));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 4.0);
PV0iz = floatBitsToInt(max(intBitsToFloat(PV1iz), -(intBitsToFloat(PV1iz))));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 4.0);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R126i.w)) + intBitsToFloat(PS1i));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(R123i.w)));
// 15
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R125i.y)) + intBitsToFloat(PV0ix));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y)) + intBitsToFloat(PV0iy));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R127i.z)) + intBitsToFloat(PV0iz));
PV1iw = floatBitsToInt(-(intBitsToFloat(R124i.z)) + intBitsToFloat(PS0i));
R8i.w = floatBitsToInt(-(intBitsToFloat(R6i.w)) * 3.0 + 3.0);
// 16
backupReg0i = R123i.y;
backupReg1i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(PV1iw)) + intBitsToFloat(R2i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(PV1iw)) + intBitsToFloat(R2i.y));
PV0iz = floatBitsToInt(intBitsToFloat(R126i.w) + -(intBitsToFloat(backupReg0i)));
PV0iw = floatBitsToInt(-(intBitsToFloat(R123i.z)) + intBitsToFloat(backupReg1i));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(PV1iw)) + intBitsToFloat(R2i.z));
// 17
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0iz));
R2i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[3].x)) + intBitsToFloat(R123i.x));
R5i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[3].y)) + intBitsToFloat(R123i.y));
R5i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[3].z)) + intBitsToFloat(R122i.x));
// 18
R124i.x = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R4i.z));
R124i.x = clampFI32(R124i.x);
PV0iy = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R124i.w));
PV0iy = clampFI32(PV0iy);
R10i.z = uf_remappedPS[4].y;
R4i.w = uf_remappedPS[5].y;
R124i.y = floatBitsToInt(intBitsToFloat(R2i.w) * 25.0);
R124i.y = clampFI32(R124i.y);
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.z),intBitsToFloat(R5i.w),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R2i.z),intBitsToFloat(R5i.w),intBitsToFloat(R5i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(-(intBitsToFloat(R124i.w)) + intBitsToFloat(PV0iy));
// 20
backupReg0i = R4i.z;
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(PS1i)) + intBitsToFloat(R0i.x));
R4i.y = floatBitsToInt(intBitsToFloat(R124i.y) * 0.5 + 0.5);
R4i.z = uf_remappedPS[6].y;
PV0iw = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + intBitsToFloat(R124i.x));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
R2i.w = floatBitsToInt(tempResultf);
// 21
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R11i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[7].x),intBitsToFloat(uf_remappedPS[7].y),intBitsToFloat(uf_remappedPS[7].z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R0i.w = tempi.x;
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(PV0iw)) + intBitsToFloat(R0i.y));
// 0
R124i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R11i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[8].x),intBitsToFloat(uf_remappedPS[8].y),intBitsToFloat(uf_remappedPS[8].z),0.0)));
PV0iy = R124i.x;
PV0iz = R124i.x;
PV0iw = R124i.x;
R124i.z = floatBitsToInt(-(intBitsToFloat(R0i.w)));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R11i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[9].x),intBitsToFloat(uf_remappedPS[9].y),intBitsToFloat(uf_remappedPS[9].z),0.0)));
PV1ix = tempi.x;
R124i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R2i.w)));
// 2
R0i.x = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(uf_remappedPS[10].x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(R2i.w)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R2i.w)));
R5i.w = floatBitsToInt(intBitsToFloat(R11i.y) + intBitsToFloat(uf_remappedPS[10].y));
R0i.z = floatBitsToInt(intBitsToFloat(R12i.z) + intBitsToFloat(uf_remappedPS[10].z));
// 3
redcCUBE(vec4(intBitsToFloat(R124i.z),intBitsToFloat(R124i.z),intBitsToFloat(R124i.x),intBitsToFloat(R124i.y)),vec4(intBitsToFloat(R124i.y),intBitsToFloat(R124i.x),intBitsToFloat(R124i.z),intBitsToFloat(R124i.z)),cubeMapSTM,cubeMapFaceId);
R2i.x = floatBitsToInt(cubeMapSTM.x);
R2i.y = floatBitsToInt(cubeMapSTM.y);
R2i.z = floatBitsToInt(cubeMapSTM.z);
R2i.w = cubeMapFaceId;
R124i.x = floatBitsToInt(-(intBitsToFloat(R6i.w)) + 1.0);
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedPS[7].x),intBitsToFloat(uf_remappedPS[7].y),intBitsToFloat(uf_remappedPS[7].z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R124i.z = floatBitsToInt(1.0 / abs(intBitsToFloat(R2i.z)));
// 5
R5i.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedPS[8].x),intBitsToFloat(uf_remappedPS[8].y),intBitsToFloat(uf_remappedPS[8].z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),0.0)));
PV1iy = R5i.x;
PV1iz = R5i.x;
PV1iw = R5i.x;
R5i.z = floatBitsToInt(-(intBitsToFloat(PV0ix)));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedPS[9].x),intBitsToFloat(uf_remappedPS[9].y),intBitsToFloat(uf_remappedPS[9].z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),0.0)));
PV0ix = tempi.x;
R5i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R124i.z)) + 1.5);
// 7
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.w)),intBitsToFloat(backupReg0i)) + intBitsToFloat(backupReg0i));
R3i.y = R122i.x;
R3i.z = R2i.w;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R124i.z)) + 1.5);
R124i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * 0.5 + 0.5);
// 8
redcCUBE(vec4(intBitsToFloat(R5i.z),intBitsToFloat(R5i.z),intBitsToFloat(R5i.x),intBitsToFloat(R5i.y)),vec4(intBitsToFloat(R5i.y),intBitsToFloat(R5i.x),intBitsToFloat(R5i.z),intBitsToFloat(R5i.z)),cubeMapSTM,cubeMapFaceId);
R127i.x = floatBitsToInt(cubeMapSTM.x);
R127i.y = floatBitsToInt(cubeMapSTM.y);
R127i.z = floatBitsToInt(cubeMapSTM.z);
R127i.w = cubeMapFaceId;
R3i.x = R123i.w;
// 9
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R124i.w)));
R5i.x = floatBitsToInt(intBitsToFloat(R5i.x) / 2.0);
R124i.y = floatBitsToInt(intBitsToFloat(R7i.w) * 255.0);
R8i.z = R127i.w;
PV1iw = floatBitsToInt(intBitsToFloat(R124i.x) + intBitsToFloat(0x3c23d70a));
PV1iw = clampFI32(PV1iw);
PS1i = floatBitsToInt(1.0 / abs(intBitsToFloat(R127i.z)));
// 10
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(PV1iw)));
R2i.y = floatBitsToInt(intBitsToFloat(R7i.x) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R2i.y = clampFI32(R2i.y);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PS1i)) + 1.5);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PS1i)) + 1.5);
R2i.w = floatBitsToInt(intBitsToFloat(R7i.y) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R2i.w = clampFI32(R2i.w);
// 11
R8i.x = R123i.w;
R8i.y = R123i.z;
R7i.z = floatBitsToInt(intBitsToFloat(R7i.z) * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8));
R7i.z = clampFI32(R7i.z);
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R11i.z)));
R7i.y = int(intBitsToFloat(R124i.y));
R1i.xzw = floatBitsToInt(texture(textureUnitPS12, vec2(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y))).xzw);
R3i.xyz = floatBitsToInt(zmCube(textureUnitPS9, intBitsToFloat(R3i.xy), R3i.z, cubeMapArrayIndex9, intBitsToFloat(R3i.w)).xyz);
R5i.y = floatBitsToInt(textureLod(textureUnitPS2, vec2(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y)),0.0).w);
R8i.xyz = floatBitsToInt(zmCube(textureUnitPS9, intBitsToFloat(R8i.xy), R8i.z, cubeMapArrayIndex9, intBitsToFloat(R8i.w)).xyz);
R6i.xyz = floatBitsToInt(texture(textureUnitPS11, vec3(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R9i.z))).xyz);
R9i.xyz = floatBitsToInt(texture(textureUnitPS14, vec2(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y))).xyz);
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.z),intBitsToFloat(R4i.w),intBitsToFloat(R7i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[10].x)), intBitsToFloat(uf_remappedPS[11].w)));
// 1
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[11].w), intBitsToFloat(uf_remappedPS[11].w)));
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[10].y)), intBitsToFloat(uf_remappedPS[11].w)));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.y)),intBitsToFloat(PV0ix)) + intBitsToFloat(PV0ix));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R1i.w)));
R124i.w = R7i.y & int(1);
// 2
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z),-(intBitsToFloat(R123i.z))) + intBitsToFloat(R10i.x));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),-(intBitsToFloat(R123i.z))) + intBitsToFloat(R10i.y));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),-(intBitsToFloat(R123i.z))) + intBitsToFloat(R11i.z));
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[10].z)), intBitsToFloat(uf_remappedPS[11].w)));
R10i.y = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(0x3f4ccccd));
R10i.y = clampFI32(R10i.y);
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R124i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R124i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[12].x), intBitsToFloat(R127i.w)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R5i.w),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R5i.w),intBitsToFloat(R0i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 5
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PS0i)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
R125i.w = floatBitsToInt(intBitsToFloat(R127i.w) + 0.25);
R125i.w = clampFI32(R125i.w);
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
R127i.w = floatBitsToInt(tempResultf);
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R11i.y),intBitsToFloat(R12i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R127i.w)));
// 7
PV1ix = floatBitsToInt(max(-(intBitsToFloat(PV0ix)), 0.0));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(R127i.w)));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(uf_remappedPS[11].w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R127i.w)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R124i.x)));
// 8
R124i.x = floatBitsToInt(min(intBitsToFloat(PV1ix), 1.0));
R124i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iy)), intBitsToFloat(uf_remappedPS[11].w)));
R124i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iw)), intBitsToFloat(uf_remappedPS[11].w)));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R1i.z)));
R0i.x = floatBitsToInt(float(R124i.w));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.y),intBitsToFloat(R126i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.z),intBitsToFloat(R124i.y),intBitsToFloat(R124i.z),0.0)));
tempi.x = clampFI32(tempi.x);
PV1ix = tempi.x;
R11i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.y = floatBitsToInt(-(intBitsToFloat(R124i.x)) + 1.0);
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.z),intBitsToFloat(R124i.y),intBitsToFloat(R124i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),0.0)));
tempi.x = clampFI32(tempi.x);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(-(intBitsToFloat(PV1ix)) + 1.0);
// 11
backupReg0i = R126i.z;
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.x)),intBitsToFloat(R127i.y)) + intBitsToFloat(R127i.y));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(PV0ix)));
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R11i.y)),intBitsToFloat(PS0i)) + intBitsToFloat(PS0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),-(intBitsToFloat(R5i.x))) + intBitsToFloat(R124i.x));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(backupReg0i)));
// 12
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(PV1iy)) + -(intBitsToFloat(PV1iy)));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R11i.y)),intBitsToFloat(R126i.z)) + intBitsToFloat(R126i.z));
PV0iz = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(R123i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)),intBitsToFloat(R126i.x)) + intBitsToFloat(R126i.x));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R125i.y)) + intBitsToFloat(PS1i));
// 13
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R123i.y)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(backupReg0i)) + intBitsToFloat(R122i.x));
R123i.y = clampFI32(R123i.y);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R123i.w)));
PV1iw = floatBitsToInt(intBitsToFloat(R124i.x) + 1.0);
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 14
backupReg0i = R124i.x;
backupReg1i = R123i.y;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(R10i.y)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i),-(intBitsToFloat(R5i.x))) + intBitsToFloat(backupReg1i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(PV1iw)) + intBitsToFloat(PV1iw));
R123i.w = floatBitsToInt(-(intBitsToFloat(R127i.x)) * intBitsToFloat(0x3ca3d70a) + intBitsToFloat(0x3ca3d70a));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(backupReg1i)));
// 15
R123i.x = floatBitsToInt(-(intBitsToFloat(R124i.x)) * intBitsToFloat(0x3ca3d70a) + intBitsToFloat(0x3ca3d70a));
PV1iy = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(R123i.y));
R125i.z = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(R123i.w));
R126i.w = floatBitsToInt(0.25 * intBitsToFloat(R126i.w));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.z));
// 16
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PS1i)));
R126i.y = floatBitsToInt(intBitsToFloat(R124i.x) + intBitsToFloat(R123i.x));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),-(intBitsToFloat(R124i.x))) + intBitsToFloat(R3i.y));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),-(intBitsToFloat(R127i.x))) + intBitsToFloat(R125i.w));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 17
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),-(intBitsToFloat(R124i.x))) + intBitsToFloat(R3i.z));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R4i.y)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),-(intBitsToFloat(R124i.x))) + intBitsToFloat(R3i.x));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(PV0ix)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R126i.w)));
// 18
backupReg0i = R123i.x;
backupReg1i = R126i.y;
backupReg2i = R123i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[13].y),intBitsToFloat(R125i.w)) + intBitsToFloat(R126i.z));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[13].z),intBitsToFloat(R125i.w)) + intBitsToFloat(backupReg0i));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.y)),intBitsToFloat(backupReg1i)) + intBitsToFloat(backupReg1i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[13].x),intBitsToFloat(R125i.w)) + intBitsToFloat(backupReg2i));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(PV1iw)));
// 19
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R123i.z)) + intBitsToFloat(R6i.y));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R123i.z)) + intBitsToFloat(R6i.x));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R2i.y)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(R6i.z));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(R2i.w)));
// 20
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[13].y), intBitsToFloat(R125i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[13].x), intBitsToFloat(R125i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[13].z), intBitsToFloat(R125i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R7i.z)));
R6i.z = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
// 21
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R126i.z)) + intBitsToFloat(R125i.w));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R126i.z)) + intBitsToFloat(R124i.x));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R126i.z)) + intBitsToFloat(R125i.y));
R2i.w = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R8i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
// 0
PV0iy = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(R8i.x));
PV0iz = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(R2i.w));
PV0iw = floatBitsToInt(intBitsToFloat(R7i.z) + intBitsToFloat(R6i.z));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R5i.w)));
// 1
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(PV0iw)) + intBitsToFloat(R9i.x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(PV0iz)) + intBitsToFloat(R9i.y));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(PV0iy)) + intBitsToFloat(R9i.z));
// export
passPixelColor0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
}
