#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;

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
// shader 1f8a651427ddb2a8
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[9];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(1, 1, 0) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 1) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(4, 1, 2) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(6, 1, 3) uniform sampler2D textureUnitPS6;
TEXTURE_LAYOUT(8, 1, 4) uniform sampler2DArray textureUnitPS8;
TEXTURE_LAYOUT(9, 1, 5) uniform sampler2D textureUnitPS9;
TEXTURE_LAYOUT(11, 1, 6) uniform sampler2D textureUnitPS11;
TEXTURE_LAYOUT(12, 1, 7) uniform sampler2D textureUnitPS12;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem2;
in vec4 passParameterSem4;
in vec4 passParameterSem6;
layout(location = 0) out vec4 passPixelColor0;
// end of shader inputs/outputs
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
R0i = floatBitsToInt(passParameterSem0);
R1i = floatBitsToInt(passParameterSem1);
R2i = floatBitsToInt(passParameterSem2);
R3i = floatBitsToInt(passParameterSem4);
R4i = floatBitsToInt(passParameterSem6);
R19i.xyzw = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R4i.z),intBitsToFloat(R4i.w))).xyzw);
R6i.xyzw = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R4i.z),intBitsToFloat(R4i.w))).xyzw);
R4i.w = floatBitsToInt(texture(textureUnitPS12, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R5i.xyzw = floatBitsToInt(zmGather(textureUnitPS6, vec2(0.0001) + vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)), 0).xyzw);
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R6i.x) * 2.0 + -(1.0));
R126i.y = floatBitsToInt(intBitsToFloat(R6i.y) * 2.0 + -(1.0));
PV0iz = floatBitsToInt(intBitsToFloat(R19i.w) * 255.0);
R124i.w = floatBitsToInt(intBitsToFloat(R6i.z) * 2.0 + -(1.0));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.w)),intBitsToFloat(uf_remappedPS[0].w)) + 1.0);
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R124i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R124i.w),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R21i.y = int(intBitsToFloat(PV0iz));
// 2
PV0ix = R21i.y >> 0x5;
R4i.y = 0;
R127i.z = 0x358637bd;
R4i.w = floatBitsToInt(fract(intBitsToFloat(R3i.x)));
R8i.w = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 3
R126i.x = floatBitsToInt(fract(intBitsToFloat(R3i.y)));
PV1iy = R21i.y >> int(1);
R10i.z = floatBitsToInt(roundEven(0.0));
R127i.w = PV0ix & 0x7;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 4
R125i.x = PV1iy & 0xf;
R13i.y = floatBitsToInt(intBitsToFloat(0x3df5c28f) * intBitsToFloat(uf_remappedPS[1].z));
R13i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[0].x)), intBitsToFloat(PS1i)));
R7i.w = 0;
R125i.z = floatBitsToInt(1.0 / intBitsToFloat(R8i.w));
// 5
backupReg0i = R127i.w;
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R125i.z)));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R125i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R13i.z)), intBitsToFloat(uf_remappedPS[1].y)));
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedPS[0].x) + intBitsToFloat(R13i.z));
PS1i = floatBitsToInt(float(backupReg0i));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) + -2.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(uf_remappedPS[2].x)) + intBitsToFloat(R5i.x));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(uf_remappedPS[2].x)) + intBitsToFloat(R5i.z));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(uf_remappedPS[2].x)) + intBitsToFloat(R5i.y));
R124i.y = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R7i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R7i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 8
backupReg0i = R126i.y;
PV0ix = floatBitsToInt(intBitsToFloat(R124i.y) * 10.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(uf_remappedPS[2].x)) + intBitsToFloat(R5i.w));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PS1i)));
R127i.w = floatBitsToInt(max(intBitsToFloat(backupReg0i), -(intBitsToFloat(backupReg0i))));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedPS[3].x)));
PV1iz = floatBitsToInt(min(intBitsToFloat(R8i.z), 2.0));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PS0i)));
R126i.w = floatBitsToInt(max(intBitsToFloat(R126i.w), -(intBitsToFloat(R126i.w))));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) * 6.0);
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[4].w)), intBitsToFloat(PV1iw)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].z), intBitsToFloat(PV1ix)));
R125i.w = floatBitsToInt(max(intBitsToFloat(R126i.z), -(intBitsToFloat(R126i.z))));
R126i.y = floatBitsToInt(max(intBitsToFloat(R126i.y), -(intBitsToFloat(R126i.y))));
// 11
R127i.x = R8i.z;
R127i.x = clampFI32(R127i.x);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0ix)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R127i.w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV0ix)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R126i.w)));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R125i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R126i.y)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e4ccccd));
PV0iw = R127i.x;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
R8i.x = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV1iy));
// 13
PV1ix = floatBitsToInt(-(intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iy));
R8i.y = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(PV0iz));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV0iw)) + intBitsToFloat(R0i.x));
PV1iw = floatBitsToInt(intBitsToFloat(R126i.z) + -(intBitsToFloat(PV0ix)));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(PV0iw)) + intBitsToFloat(R0i.y));
// 14
R5i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 3.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PV1iw));
R9i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R13i.z)));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R13i.z)));
// 15
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(R126i.x));
PV1ix = clampFI32(PV1ix);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(R4i.w));
PV1iy = clampFI32(PV1iy);
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R125i.z)));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R8i.x)) + intBitsToFloat(R1i.z));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R8i.y)) + intBitsToFloat(R1i.w));
// 16
PV0ix = floatBitsToInt(-(intBitsToFloat(R126i.x)) + intBitsToFloat(PV1ix));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R9i.z)) + intBitsToFloat(R1i.z));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R9i.y)) + intBitsToFloat(R1i.w));
PV0iw = floatBitsToInt(-(intBitsToFloat(R4i.w)) + intBitsToFloat(PV1iy));
PS0i = floatBitsToInt(float(R125i.x));
// 17
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(PV0iw)) + intBitsToFloat(R0i.x));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(PV0ix)) + intBitsToFloat(R0i.y));
R4i.z = floatBitsToInt(intBitsToFloat(R8i.z) * 6.0);
R4i.w = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3d888889));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(R6i.w)));
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.w),intBitsToFloat(R12i.y),intBitsToFloat(R13i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R9i.w),intBitsToFloat(R12i.y),intBitsToFloat(R13i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R124i.w = floatBitsToInt(intBitsToFloat(R4i.z) * intBitsToFloat(0x3e4ccccd));
R124i.w = clampFI32(R124i.w);
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R7i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[5].x),intBitsToFloat(uf_remappedPS[5].y),intBitsToFloat(uf_remappedPS[5].z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 20
R3i.x = floatBitsToInt(max(-(intBitsToFloat(PV1ix)), 0.0));
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R127i.w)));
R6i.z = floatBitsToInt(intBitsToFloat(R124i.y) * intBitsToFloat(0x3dcccccd) + 1.0);
R6i.w = floatBitsToInt(max(intBitsToFloat(R19i.y), intBitsToFloat(R19i.z)));
R3i.w = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 0
backupReg0i = R3i.w;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].x), intBitsToFloat(uf_remappedPS[6].w)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].y), intBitsToFloat(uf_remappedPS[6].w)));
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(backupReg0i)));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(backupReg0i)));
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.z), intBitsToFloat(backupReg0i)));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R126i.y),intBitsToFloat(R4i.y),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R126i.y),intBitsToFloat(R4i.y),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].z), intBitsToFloat(uf_remappedPS[6].w)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R7i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R14i.z),intBitsToFloat(R3i.w),intBitsToFloat(R15i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 3
R6i.x = floatBitsToInt(intBitsToFloat(PV0ix) + 1.0);
R6i.x = clampFI32(R6i.x);
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS0i)));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(PS0i)));
R127i.w = floatBitsToInt(intBitsToFloat(R14i.z) * intBitsToFloat(0xbe99999a) + -(intBitsToFloat(R124i.x)));
R124i.y = floatBitsToInt(intBitsToFloat(R3i.w) * intBitsToFloat(0xbe99999a) + -(intBitsToFloat(R126i.y)));
// 4
R127i.x = floatBitsToInt(intBitsToFloat(R14i.z) + intBitsToFloat(R124i.x));
PV0iy = floatBitsToInt(-(intBitsToFloat(R6i.x)) + 1.0);
R127i.z = floatBitsToInt(intBitsToFloat(R15i.z) * intBitsToFloat(0xbe99999a) + -(intBitsToFloat(R3i.z)));
R125i.w = floatBitsToInt(intBitsToFloat(R3i.w) + intBitsToFloat(R126i.y));
R126i.z = floatBitsToInt(intBitsToFloat(R15i.z) + intBitsToFloat(R3i.z));
// 5
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.w),intBitsToFloat(R124i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.w),intBitsToFloat(R124i.y),intBitsToFloat(R127i.z),0.0)));
PV1iy = R126i.x;
PV1iz = R126i.x;
PV1iw = R126i.x;
tempResultf = max(0.0, intBitsToFloat(PV0iy));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R125i.x = floatBitsToInt(tempResultf);
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.w),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.w),intBitsToFloat(R126i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R125i.z = tempi.x;
PV0iw = tempi.x;
R124i.w = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(0x3e4ccccd));
// 7
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(intBitsToFloat(R124i.x) * intBitsToFloat(0xbf4ccccd) + intBitsToFloat(R14i.z));
R127i.y = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(0xbf4ccccd) + intBitsToFloat(R3i.w));
R124i.z = floatBitsToInt(intBitsToFloat(R3i.z) * intBitsToFloat(0xbf4ccccd) + intBitsToFloat(R15i.z));
R126i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * 8.0);
tempResultf = 1.0 / sqrt(intBitsToFloat(R126i.x));
PS1i = floatBitsToInt(tempResultf);
// 8
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PS1i)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PS1i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS1i)));
R10i.w = floatBitsToInt(min(intBitsToFloat(R3i.x), 1.0));
tempResultf = 1.0 / sqrt(intBitsToFloat(R125i.z));
R127i.w = floatBitsToInt(tempResultf);
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R124i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R124i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R12i.z = floatBitsToInt(exp2(intBitsToFloat(R124i.w)));
// 10
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R127i.w)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R127i.w)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R127i.w)));
R6i.w = floatBitsToInt(max(intBitsToFloat(R19i.x), intBitsToFloat(R6i.w)));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
R127i.w = floatBitsToInt(tempResultf);
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R7i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R124i.y),intBitsToFloat(R127i.z),0.0)));
tempi.x = clampFI32(tempi.x);
PV1ix = tempi.x;
PV1iy = tempi.x;
R127i.z = tempi.x;
PV1iw = tempi.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R127i.w)));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R7i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R127i.w)));
// 13
R127i.x = floatBitsToInt(max(-(intBitsToFloat(PV0ix)), 0.0));
R14i.y = R8i.z;
R14i.y = floatBitsToInt(intBitsToFloat(R14i.y) * 4.0);
R14i.y = clampFI32(R14i.y);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R127i.w)));
R125i.w = floatBitsToInt(intBitsToFloat(R6i.w) + intBitsToFloat(0x2edbe6ff));
tempResultf = max(0.0, intBitsToFloat(R127i.z));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R127i.z = floatBitsToInt(tempResultf);
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R7i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV1iz),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R124i.z = tempi.x;
PV0iw = tempi.x;
R3i.y = floatBitsToInt(exp2(intBitsToFloat(R126i.w)));
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.z),intBitsToFloat(R3i.w),intBitsToFloat(R15i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R126i.y),intBitsToFloat(R3i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R127i.w = tempi.x;
R126i.w = floatBitsToInt(min(intBitsToFloat(R127i.x), 1.0));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R7i.y),intBitsToFloat(R5i.z),intBitsToFloat(R5i.z)),vec4(-(intBitsToFloat(R124i.x)),-(intBitsToFloat(R126i.y)),-(intBitsToFloat(R3i.z)),-(intBitsToFloat(R7i.w)))));
tempi.x = clampFI32(tempi.x);
PV0ix = tempi.x;
R7i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(intBitsToFloat(R127i.z) * 20.0);
// 17
PV1ix = floatBitsToInt(max(-(intBitsToFloat(R127i.w)), 0.0));
R6i.y = floatBitsToInt(intBitsToFloat(R124i.z) + 1.0);
R6i.y = clampFI32(R6i.y);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(R126i.w)) + -(0.5));
R4i.w = floatBitsToInt(-(intBitsToFloat(R127i.w)) * 5.0 + 5.0);
R4i.w = clampFI32(R4i.w);
R3i.x = floatBitsToInt(exp2(intBitsToFloat(PS0i)));
// 18
backupReg0i = R4i.z;
PV0ix = floatBitsToInt(intBitsToFloat(R123i.z) * 40.0);
PV0ix = clampFI32(PV0ix);
R18i.y = floatBitsToInt(min(intBitsToFloat(PV1ix), 1.0));
R4i.z = floatBitsToInt(intBitsToFloat(R6i.z) * 75.0);
PV0iw = floatBitsToInt(min(intBitsToFloat(R19i.y), intBitsToFloat(R19i.z)));
R7i.x = backupReg0i;
R7i.x = clampFI32(R7i.x);
// 19
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.y), intBitsToFloat(PV0ix)));
R17i.y = floatBitsToInt(intBitsToFloat(R2i.y) * intBitsToFloat(0x3f4ccccd));
R3i.z = floatBitsToInt(intBitsToFloat(R2i.x) * intBitsToFloat(0x3f4ccccd));
R123i.w = floatBitsToInt(intBitsToFloat(R8i.w) * 4.0 + -3.0);
R123i.w = clampFI32(R123i.w);
R4i.x = floatBitsToInt(min(intBitsToFloat(R19i.x), intBitsToFloat(PV0iw)));
// 20
R9i.x = floatBitsToInt(intBitsToFloat(R123i.w) + -(0.5));
R9i.x = floatBitsToInt(intBitsToFloat(R9i.x) * 4.0);
R9i.x = clampFI32(R9i.x);
R16i.y = floatBitsToInt(intBitsToFloat(uf_remappedPS[7].y) + -(intBitsToFloat(R17i.y)));
R6i.z = floatBitsToInt(intBitsToFloat(uf_remappedPS[7].x) + -(intBitsToFloat(R3i.z)));
R8i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e19999a));
R11i.x = floatBitsToInt(1.0 / intBitsToFloat(R125i.w));
// 0
backupReg0i = R4i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].z), intBitsToFloat(R7i.z)));
R4i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.x)),intBitsToFloat(R11i.x)) + 1.0);
R7i.z = R8i.z;
R7i.z = floatBitsToInt(intBitsToFloat(R7i.z) * 2.0);
R7i.z = clampFI32(R7i.z);
PV0iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[4].w)), intBitsToFloat(backupReg0i)));
tempResultf = max(0.0, intBitsToFloat(R6i.w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R5i.x)) + intBitsToFloat(R0i.x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R5i.x)) + intBitsToFloat(R0i.y));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R18i.y)));
R7i.w = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f19999a));
R5i.x = floatBitsToInt(intBitsToFloat(R2i.z) * intBitsToFloat(0x3f4ccccd));
R8i.y = floatBitsToInt(texture(textureUnitPS4, vec2(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y))).x);
R0i.w = floatBitsToInt(texture(textureUnitPS4, vec2(intBitsToFloat(R9i.z),intBitsToFloat(R9i.y))).x);
R8i.x = floatBitsToInt(texture(textureUnitPS4, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R22i.xyzw = floatBitsToInt(texture(textureUnitPS9, vec2(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y))).xyzw);
R20i.xyz = floatBitsToInt(texture(textureUnitPS8, vec3(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z))).xyz);
R10i.xyz = floatBitsToInt(texture(textureUnitPS11, vec2(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y))).xyz);
// 0
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R0i.x)) + intBitsToFloat(R1i.z));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(R0i.w)) + intBitsToFloat(uf_remappedPS[0].x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(R8i.y)) + intBitsToFloat(uf_remappedPS[0].x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(R1i.w));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(R8i.x)) + intBitsToFloat(uf_remappedPS[0].x));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R123i.z)), intBitsToFloat(R5i.y)));
R127i.y = floatBitsToInt(-(intBitsToFloat(R126i.y)));
PV1iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R123i.z)), intBitsToFloat(R5i.w)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R123i.z)));
PS1i = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.y)), intBitsToFloat(R11i.y)));
// 2
backupReg0i = R126i.y;
R127i.x = floatBitsToInt(-(intBitsToFloat(R9i.w)) + intBitsToFloat(PV1iz));
R126i.y = floatBitsToInt(-(intBitsToFloat(R12i.y)) + intBitsToFloat(PV1ix));
R124i.z = floatBitsToInt(-(intBitsToFloat(R13i.z)) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)), intBitsToFloat(R11i.z)));
R126i.x = floatBitsToInt(-(intBitsToFloat(R9i.w)) + intBitsToFloat(PS1i));
// 3
backupReg0i = R127i.y;
backupReg1i = R124i.x;
R124i.x = floatBitsToInt(-(intBitsToFloat(R125i.w)));
R127i.y = floatBitsToInt(-(intBitsToFloat(R12i.y)) + intBitsToFloat(PV0iw));
R126i.z = floatBitsToInt(-(intBitsToFloat(R13i.z)) + intBitsToFloat(backupReg0i));
PV1iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.w)), intBitsToFloat(backupReg1i)));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.w)), intBitsToFloat(R127i.w)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.z),intBitsToFloat(R3i.w),intBitsToFloat(R15i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R124i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R127i.w = tempi.x;
R0i.x = floatBitsToInt(-(intBitsToFloat(R9i.w)) + intBitsToFloat(PV1iw));
// 5
R1i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.z),intBitsToFloat(R3i.w),intBitsToFloat(R15i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),0.0)));
PV1iy = R1i.x;
PV1iz = R1i.x;
PV1iw = R1i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R14i.z)),intBitsToFloat(PV0ix)) + intBitsToFloat(R127i.x));
// 6
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R22i.w), intBitsToFloat(R12i.z)));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.w)),intBitsToFloat(R127i.w)) + intBitsToFloat(R126i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R15i.z)),intBitsToFloat(R127i.w)) + intBitsToFloat(R124i.z));
R125i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.w)),intBitsToFloat(R1i.x)) + intBitsToFloat(R127i.y));
R127i.y = floatBitsToInt(intBitsToFloat(R22i.x) + intBitsToFloat(0xbecccccd));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R123i.y),intBitsToFloat(R123i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R123i.y),intBitsToFloat(R123i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.y = floatBitsToInt(-(intBitsToFloat(R12i.y)) + intBitsToFloat(R127i.z));
// 8
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R14i.z)),intBitsToFloat(R1i.x)) + intBitsToFloat(R126i.x));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.y) * 10.0);
PV0iy = clampFI32(PV0iy);
R127i.z = floatBitsToInt(-(intBitsToFloat(R13i.z)) + intBitsToFloat(R124i.x));
R9i.w = floatBitsToInt(intBitsToFloat(R7i.z) * 0.25);
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R125i.x) + -0.75);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PS0i)));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R15i.z)),intBitsToFloat(R1i.x)) + intBitsToFloat(R126i.z));
R127i.w = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(0x3e99999a) + intBitsToFloat(0xbecccccd));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R22i.y), intBitsToFloat(PV0iy)));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R125i.w),intBitsToFloat(R123i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R125i.w),intBitsToFloat(R123i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R5i.w = floatBitsToInt(intBitsToFloat(PV1ix) * 16.0);
R5i.w = clampFI32(R5i.w);
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.z),intBitsToFloat(R3i.w),intBitsToFloat(R15i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R126i.w = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 12
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R14i.z)),intBitsToFloat(PV1ix)) + intBitsToFloat(R0i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.w)),intBitsToFloat(PV1ix)) + intBitsToFloat(R126i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R15i.z)),intBitsToFloat(PV1ix)) + intBitsToFloat(R127i.z));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PS1i)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(0x3c23d70a));
R127i.y = clampFI32(R127i.y);
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R123i.x),intBitsToFloat(R123i.y),intBitsToFloat(R123i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R123i.x),intBitsToFloat(R123i.y),intBitsToFloat(R123i.z),0.0)));
PV1ix = tempi.x;
R126i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(R3i.y)));
R3i.w = clampFI32(R3i.w);
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R6i.y)));
PV0iy = floatBitsToInt(intBitsToFloat(R3i.w) + intBitsToFloat(R3i.x));
PV0iy = clampFI32(PV0iy);
R127i.z = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R10i.w));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R7i.y));
R126i.x = floatBitsToInt(intBitsToFloat(R124i.w) + -(1.0));
// 15
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y), intBitsToFloat(R125i.w)));
PV1ix = clampFI32(PV1ix);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R18i.y)) + intBitsToFloat(0xbecccccd));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) * 75.0);
PV1iz = clampFI32(PV1iz);
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(PV0iy)));
tempResultf = 1.0 / sqrt(intBitsToFloat(R126i.y));
PS1i = floatBitsToInt(tempResultf);
// 16
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(PV1iz)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(intBitsToFloat(R123i.y) * 75.0);
PV0iz = clampFI32(PV0iz);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PS1i)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R15i.y)) + intBitsToFloat(0xbd4ccccd));
// 17
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(PV0ix)) + intBitsToFloat(0xbecccccd));
PV1iy = floatBitsToInt(intBitsToFloat(R2i.w) + -(intBitsToFloat(R5i.w)));
PV1iy = clampFI32(PV1iy);
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y),intBitsToFloat(PV0iz)) + intBitsToFloat(R8i.w));
R14i.z = clampFI32(R14i.z);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y), intBitsToFloat(PV0iw)));
PV1iw = clampFI32(PV1iw);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R4i.z)));
R126i.w = clampFI32(R126i.w);
// 18
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R15i.y)) + intBitsToFloat(0xbc23d70a));
PV0iy = floatBitsToInt(intBitsToFloat(R126i.z) * 20.0);
PV0iy = clampFI32(PV0iy);
PV0iz = floatBitsToInt(intBitsToFloat(backupReg0i) * 75.0);
PV0iz = clampFI32(PV0iz);
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PV1iy)) + 1.0);
R126i.z = floatBitsToInt(intBitsToFloat(PV1iw) + -(0.5));
// 19
backupReg0i = R7i.x;
R7i.x = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(0x3da3d70a));
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iz)));
R15i.y = floatBitsToInt(intBitsToFloat(R15i.y) * 2.0);
PV1iz = floatBitsToInt(intBitsToFloat(R123i.x) * 50.0);
PV1iz = clampFI32(PV1iz);
R4i.w = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(R124i.w));
R4i.w = clampFI32(R4i.w);
PS1i = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3df5c28f));
// 20
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y),intBitsToFloat(R4i.w)) + intBitsToFloat(R17i.y));
R16i.y = floatBitsToInt(intBitsToFloat(R126i.z) * 40.0);
R16i.y = clampFI32(R16i.y);
R4i.z = floatBitsToInt(-(intBitsToFloat(R14i.z)) + intBitsToFloat(R125i.w));
R8i.w = floatBitsToInt(intBitsToFloat(R5i.w) + intBitsToFloat(R126i.w));
R8i.w = clampFI32(R8i.w);
R17i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3d4ccccd) + intBitsToFloat(PS1i));
R17i.y = clampFI32(R17i.y);
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R15i.y) * intBitsToFloat(0x3e4ccccd));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R8i.w)) + intBitsToFloat(R14i.z));
PV0iz = floatBitsToInt(intBitsToFloat(R16i.y) * 8.0);
PV0iw = floatBitsToInt(intBitsToFloat(R3i.w) + intBitsToFloat(R7i.x));
PV0iw = clampFI32(PV0iw);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(uf_remappedPS[8].y)));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R17i.y)) + intBitsToFloat(PV0ix));
R123i.x = clampFI32(R123i.x);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(R123i.y)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PV0iz)));
PV1iz = clampFI32(PV1iz);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R4i.w)) + intBitsToFloat(R3i.z));
R126i.w = floatBitsToInt(-(intBitsToFloat(R4i.y)) * 3.0 + 3.0);
// 2
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(uf_remappedPS[8].x)));
R126i.y = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(0x3f4ccccd));
R126i.y = clampFI32(R126i.y);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R9i.w)) + intBitsToFloat(R123i.x));
R127i.z = clampFI32(R127i.z);
R125i.w = floatBitsToInt(intBitsToFloat(uf_remappedPS[7].z) + -(intBitsToFloat(R5i.x)));
PS0i = floatBitsToInt(exp2(intBitsToFloat(R7i.w)));
// 3
R126i.x = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(0x2edbe6ff));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),-(intBitsToFloat(R125i.y))) + intBitsToFloat(R2i.w));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PS0i)) + intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(0x3da3d70a));
R126i.w = floatBitsToInt(intBitsToFloat(R18i.y) * 5.0);
R126i.w = clampFI32(R126i.w);
// 4
backupReg0i = R126i.y;
PV0ix = floatBitsToInt(intBitsToFloat(R124i.w) * intBitsToFloat(0x3d23d70a));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R4i.w)) + intBitsToFloat(R5i.x));
R126i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + -(1.0));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PV1iw)) + intBitsToFloat(R2i.x));
R0i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.y)),intBitsToFloat(R127i.z)) + intBitsToFloat(R4i.y));
R0i.z = clampFI32(R0i.z);
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),intBitsToFloat(0x3dea4a8c),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R125i.z = tempi.x;
PV1iw = tempi.x;
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PV0ix)) + intBitsToFloat(R2i.y));
// 6
backupReg0i = R126i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R124i.z)) + intBitsToFloat(R6i.w));
R123i.x = clampFI32(R123i.x);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R126i.w)) + 1.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedPS[8].z)));
R126i.w = floatBitsToInt(intBitsToFloat(R19i.x) + -(intBitsToFloat(R6i.w)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 7
backupReg0i = R125i.z;
R126i.x = floatBitsToInt(intBitsToFloat(R19i.y) + -(intBitsToFloat(R6i.w)));
PV1iy = ((intBitsToFloat(backupReg0i) > 0.0)?-1:0);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PS0i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(R123i.x)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 8
R124i.x = floatBitsToInt(intBitsToFloat(R19i.z) + -(intBitsToFloat(R6i.w)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].w), intBitsToFloat(R125i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R126i.y)));
R123i.w = ((PV1iy == 0)?(0):(PS1i));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R126i.y)));
// 9
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(R125i.y)) + intBitsToFloat(PS0i));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R125i.y)) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R126i.y)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(R123i.w)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R125i.z)) + intBitsToFloat(R6i.w));
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R125i.z)) + intBitsToFloat(R6i.w));
PV0iy = floatBitsToInt(intBitsToFloat(0x3f895ef0) * intBitsToFloat(R127i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R125i.z)) + intBitsToFloat(R6i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R125i.y)) + intBitsToFloat(PV1iz));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R20i.x),intBitsToFloat(R124i.w)) + intBitsToFloat(R123i.y));
// 11
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R20i.y),intBitsToFloat(R124i.w)) + intBitsToFloat(R126i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R123i.z)) + intBitsToFloat(0xba0a8ec8));
R123i.y = clampFI32(R123i.y);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R126i.y)) + intBitsToFloat(0xba0a8ec8));
R123i.z = clampFI32(R123i.z);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R20i.z),intBitsToFloat(R124i.w)) + intBitsToFloat(R123i.w));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(backupReg0i)) + intBitsToFloat(0xba0a8ec8));
R122i.x = clampFI32(R122i.x);
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R122i.x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(R123i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R123i.y)));
PV0iw = R21i.y & int(1);
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R22i.z), intBitsToFloat(R22i.z)));
// 13
R123i.y = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
PS1i = floatBitsToInt(float(PV0iw));
// 14
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R22i.z),intBitsToFloat(R123i.w)) + intBitsToFloat(R10i.x));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R22i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(R10i.y));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R22i.z),intBitsToFloat(R123i.y)) + intBitsToFloat(R10i.z));
R10i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R126i.x)));
// export
passPixelColor0 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w));
}
