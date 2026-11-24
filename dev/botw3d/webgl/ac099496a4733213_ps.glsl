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
// shader ac099496a4733213
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
TEXTURE_LAYOUT(13, 1, 8) uniform sampler2D textureUnitPS13;
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
R8i.xyzw = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R4i.z),intBitsToFloat(R4i.w))).xyzw);
R6i.xyzw = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R4i.z),intBitsToFloat(R4i.w))).xyzw);
R4i.w = floatBitsToInt(texture(textureUnitPS12, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R5i.xyzw = floatBitsToInt(zmGather(textureUnitPS6, vec2(0.0001) + vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)), 0).xyzw);
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R6i.x) * 2.0 + -(1.0));
PV0iy = floatBitsToInt(intBitsToFloat(R8i.w) * 255.0);
R126i.z = floatBitsToInt(intBitsToFloat(R6i.y) * 2.0 + -(1.0));
R126i.w = floatBitsToInt(intBitsToFloat(R6i.z) * 2.0 + -(1.0));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.w)),intBitsToFloat(uf_remappedPS[0].w)) + 1.0);
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.z),intBitsToFloat(R126i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.z),intBitsToFloat(R126i.w),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R4i.w = int(intBitsToFloat(PV0iy));
// 2
PV0ix = R4i.w >> 0x5;
R4i.y = 0;
R125i.z = 0x358637bd;
R125i.w = floatBitsToInt(fract(intBitsToFloat(R3i.x)));
R4i.z = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 3
R125i.x = R4i.w & 0x1c;
R125i.y = floatBitsToInt(fract(intBitsToFloat(R3i.y)));
R127i.z = PV0ix & 0x7;
R10i.w = floatBitsToInt(roundEven(0.0));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 4
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(R6i.w)));
R124i.y = R4i.w & 0x2;
R10i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[0].x)), intBitsToFloat(PS1i)));
R124i.w = floatBitsToInt(max(intBitsToFloat(R8i.y), intBitsToFloat(R8i.z)));
R126i.x = floatBitsToInt(1.0 / intBitsToFloat(R4i.z));
// 5
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R126i.x)));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R126i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R10i.z)), intBitsToFloat(uf_remappedPS[1].y)));
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedPS[0].x) + intBitsToFloat(R10i.z));
PS1i = floatBitsToInt(float(R127i.z));
// 6
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(uf_remappedPS[2].x)) + intBitsToFloat(R5i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(uf_remappedPS[2].x)) + intBitsToFloat(R5i.y));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(uf_remappedPS[2].x)) + intBitsToFloat(R5i.z));
PV0iw = floatBitsToInt(intBitsToFloat(PS1i) + -2.0);
R4i.x = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R125i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
// 8
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PS1i)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(uf_remappedPS[2].x)) + intBitsToFloat(R5i.w));
PV0iz = floatBitsToInt(intBitsToFloat(R4i.x) * 10.0);
R127i.w = floatBitsToInt(max(intBitsToFloat(R127i.x), -(intBitsToFloat(R127i.x))));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 9
PV1ix = floatBitsToInt(min(intBitsToFloat(R5i.x), 2.0));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PS0i)));
PV1iw = R5i.x;
PV1iw = clampFI32(PV1iw);
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(uf_remappedPS[3].x)));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(PV1ix) * 6.0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].z), intBitsToFloat(PV1iy)));
R5i.z = floatBitsToInt(intBitsToFloat(PV1iw) * 3.0);
PV0iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[4].w)), intBitsToFloat(PV1iz)));
R127i.y = floatBitsToInt(max(intBitsToFloat(R127i.y), -(intBitsToFloat(R127i.y))));
// 11
PV1ix = floatBitsToInt(max(intBitsToFloat(R126i.y), -(intBitsToFloat(R126i.y))));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt(max(intBitsToFloat(R127i.z), -(intBitsToFloat(R127i.z))));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(PV0ix)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R127i.w)));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e4ccccd));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R127i.y)));
R9i.z = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV1iz)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV1ix)));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(PV0iw)));
R9i.y = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(PV0ix));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R10i.z)));
PV1iw = floatBitsToInt(-(intBitsToFloat(PV0iy)) + intBitsToFloat(PS0i));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R10i.z)));
// 14
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1ix)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R126i.x)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(PV1ix));
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R9i.z)) + intBitsToFloat(R1i.z));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R9i.y)) + intBitsToFloat(R1i.w));
// 15
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R125i.y));
PV1ix = clampFI32(PV1ix);
R127i.y = floatBitsToInt(intBitsToFloat(R6i.w) * 255.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(R125i.w));
PV1iz = clampFI32(PV1iz);
R9i.w = floatBitsToInt(intBitsToFloat(R124i.x) * 1.5 + 1.0);
PS1i = floatBitsToInt(float(R125i.x));
// 16
PV0ix = floatBitsToInt(-(intBitsToFloat(R125i.y)) + intBitsToFloat(PV1ix));
R16i.y = floatBitsToInt(max(intBitsToFloat(R8i.x), intBitsToFloat(R124i.w)));
R15i.z = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3d124925));
PV0iw = floatBitsToInt(-(intBitsToFloat(R125i.w)) + intBitsToFloat(PV1iz));
R14i.w = floatBitsToInt(float(R124i.y));
R14i.w = floatBitsToInt(intBitsToFloat(R14i.w) / 2.0);
// 17
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(PV0iw)) + intBitsToFloat(R0i.x));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(PV0ix)) + intBitsToFloat(R0i.y));
R127i.z = floatBitsToInt(intBitsToFloat(R4i.x) * intBitsToFloat(0x3dcccccd) + 1.0);
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.z),-(intBitsToFloat(R14i.w))) + intBitsToFloat(R15i.z));
R3i.w = int(intBitsToFloat(R127i.y));
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.z),intBitsToFloat(R12i.y),intBitsToFloat(R10i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R7i.z),intBitsToFloat(R12i.y),intBitsToFloat(R10i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R4i.x = floatBitsToInt(min(intBitsToFloat(R8i.y), intBitsToFloat(R8i.z)));
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R5i.y),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[5].x),intBitsToFloat(uf_remappedPS[5].y),intBitsToFloat(uf_remappedPS[5].z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 20
R3i.x = floatBitsToInt(max(-(intBitsToFloat(PV1ix)), 0.0));
R6i.y = floatBitsToInt(intBitsToFloat(R16i.y) + intBitsToFloat(0x2edbe6ff));
R13i.z = R5i.x;
R13i.z = floatBitsToInt(intBitsToFloat(R13i.z) * 4.0);
R13i.z = clampFI32(R13i.z);
R12i.w = floatBitsToInt(intBitsToFloat(R127i.z) * 75.0);
R3i.y = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 0
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].x), intBitsToFloat(uf_remappedPS[6].w)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].y), intBitsToFloat(uf_remappedPS[6].w)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R3i.y)));
R11i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(R3i.y)));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(R3i.y)));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R125i.y),intBitsToFloat(R4i.y),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R125i.y),intBitsToFloat(R4i.y),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].z), intBitsToFloat(uf_remappedPS[6].w)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R5i.y),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R3i.z),intBitsToFloat(R11i.w),intBitsToFloat(R6i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 3
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PS0i)));
R124i.y = floatBitsToInt(intBitsToFloat(PV0ix) + 1.0);
R124i.y = clampFI32(R124i.y);
R127i.z = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(0xbf4ccccd) + intBitsToFloat(R3i.z));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(0xbf4ccccd) + intBitsToFloat(R11i.w));
// 4
R125i.x = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(0xbf4ccccd) + intBitsToFloat(R6i.z));
R4i.y = floatBitsToInt(min(intBitsToFloat(R3i.x), 1.0));
PV0iz = floatBitsToInt(-(intBitsToFloat(R124i.y)) + 1.0);
R125i.w = floatBitsToInt(intBitsToFloat(R4i.z) * 4.0 + -3.0);
R125i.w = clampFI32(R125i.w);
R124i.x = R3i.w & int(1);
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.z),intBitsToFloat(R127i.y),intBitsToFloat(R125i.x),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.z),intBitsToFloat(R127i.y),intBitsToFloat(R125i.x),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
tempResultf = max(0.0, intBitsToFloat(PV0iz));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 6
R127i.x = floatBitsToInt(intBitsToFloat(R6i.w) * 0.25);
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3e4ccccd));
R126i.z = floatBitsToInt(min(intBitsToFloat(R8i.x), intBitsToFloat(R4i.x)));
R124i.w = R5i.x;
R124i.w = floatBitsToInt(intBitsToFloat(R124i.w) * 2.0);
R124i.w = clampFI32(R124i.w);
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PS0i)));
R126i.w = ((R124i.x == 0)?(0):(0x3f800000));
R6i.w = floatBitsToInt(exp2(intBitsToFloat(PV0iy)));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R5i.y),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV1ix),intBitsToFloat(PV1iy),intBitsToFloat(PV1iz),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R127i.z = tempi.x;
PV0iw = tempi.x;
R14i.y = floatBitsToInt(1.0 / intBitsToFloat(R6i.y));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.z),intBitsToFloat(R11i.w),intBitsToFloat(R6i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R125i.y),intBitsToFloat(R125i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
tempResultf = max(0.0, intBitsToFloat(R16i.y));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R126i.x = floatBitsToInt(tempResultf);
// 10
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(0x3f4ccccd));
R5i.y = floatBitsToInt(intBitsToFloat(R127i.z) + 1.0);
R5i.y = clampFI32(R5i.y);
R14i.z = floatBitsToInt(intBitsToFloat(R125i.w) + -(0.5));
R14i.z = floatBitsToInt(intBitsToFloat(R14i.z) * 4.0);
R14i.z = clampFI32(R14i.z);
PV0iw = floatBitsToInt(max(-(intBitsToFloat(PV1ix)), 0.0));
R15i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.z)),intBitsToFloat(R14i.y)) + 1.0);
// 11
R4i.x = floatBitsToInt(intBitsToFloat(R124i.w) * 0.25);
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R126i.w)) + intBitsToFloat(R127i.x));
R4i.z = floatBitsToInt(min(intBitsToFloat(PV0iw), 1.0));
PV1iw = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(0x3f19999a));
R13i.w = floatBitsToInt(intBitsToFloat(R2i.x) * intBitsToFloat(0x3f4ccccd));
// 12
R7i.x = floatBitsToInt(intBitsToFloat(R2i.z) * intBitsToFloat(0x3f4ccccd));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R4i.z)));
R12i.z = floatBitsToInt(intBitsToFloat(R2i.y) * intBitsToFloat(0x3f4ccccd));
R123i.w = floatBitsToInt(-(intBitsToFloat(R15i.w)) * 3.0 + 3.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iw)));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(R14i.z) + intBitsToFloat(0x3f4ccccd));
PV1ix = clampFI32(PV1ix);
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(PS0i)) + intBitsToFloat(PS0i));
R11i.z = floatBitsToInt(intBitsToFloat(uf_remappedPS[7].y) + -(intBitsToFloat(R12i.z)));
R3i.w = floatBitsToInt(intBitsToFloat(uf_remappedPS[7].x) + -(intBitsToFloat(R13i.w)));
R6i.y = floatBitsToInt(intBitsToFloat(uf_remappedPS[7].z) + -(intBitsToFloat(R7i.x)));
// 14
PV0ix = floatBitsToInt(intBitsToFloat(R4i.z) * 5.0);
PV0ix = clampFI32(PV0ix);
R15i.y = floatBitsToInt(intBitsToFloat(R8i.x) + -(intBitsToFloat(R16i.y)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + -(1.0));
PV0iw = floatBitsToInt(intBitsToFloat(R15i.w) + intBitsToFloat(0x2edbe6ff));
R16i.w = floatBitsToInt(intBitsToFloat(R8i.y) + -(intBitsToFloat(R16i.y)));
// 15
PV1ix = R4i.w & int(1);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(PV0ix)) + 1.0);
R17i.z = floatBitsToInt(intBitsToFloat(R8i.z) + -(intBitsToFloat(R16i.y)));
R8i.z = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 16
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.y)));
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R123i.y)));
R8i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R123i.y)));
R4i.w = floatBitsToInt(float(PV1ix));
// 0
PV0iy = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[4].w)), intBitsToFloat(R6i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].z), intBitsToFloat(R5i.w)));
// 1
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R5i.z)) + intBitsToFloat(R0i.x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R5i.z)) + intBitsToFloat(R0i.y));
R0i.w = floatBitsToInt(texture(textureUnitPS4, vec2(intBitsToFloat(R9i.z),intBitsToFloat(R9i.y))).x);
R6i.x = floatBitsToInt(texture(textureUnitPS4, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R19i.xyzw = floatBitsToInt(texture(textureUnitPS9, vec2(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y))).xyzw);
R9i.z = floatBitsToInt(texture(textureUnitPS13, vec2(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y))).y);
R18i.xyz = floatBitsToInt(texture(textureUnitPS8, vec3(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.w))).xyz);
R20i.xyz = floatBitsToInt(texture(textureUnitPS11, vec2(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y))).xyz);
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(R0i.w)) + intBitsToFloat(uf_remappedPS[0].x));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(R1i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R0i.x)) + intBitsToFloat(R1i.z));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(R6i.x)) + intBitsToFloat(uf_remappedPS[0].x));
tempResultf = max(0.0, intBitsToFloat(R9i.z));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R127i.z = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R123i.x)), intBitsToFloat(R11i.y)));
R125i.y = floatBitsToInt(-(intBitsToFloat(R126i.w)));
PV1iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R123i.x)), intBitsToFloat(R7i.w)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R123i.x)));
PS1i = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.w)), intBitsToFloat(R123i.z)));
// 2
backupReg0i = R124i.y;
R127i.x = floatBitsToInt(-(intBitsToFloat(R7i.z)) + intBitsToFloat(PV1iz));
R124i.y = floatBitsToInt(-(intBitsToFloat(R12i.y)) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.w)), intBitsToFloat(backupReg0i)));
R126i.w = floatBitsToInt(-(intBitsToFloat(R10i.z)) + intBitsToFloat(PV1iw));
R124i.x = floatBitsToInt(-(intBitsToFloat(R7i.z)) + intBitsToFloat(PS1i));
// 3
backupReg0i = R127i.z;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.w), intBitsToFloat(R6i.w)));
R127i.y = floatBitsToInt(-(intBitsToFloat(R12i.y)) + intBitsToFloat(PV0iz));
R127i.z = floatBitsToInt(-(intBitsToFloat(R10i.z)) + intBitsToFloat(R125i.y));
R124i.w = floatBitsToInt(intBitsToFloat(R19i.x) + intBitsToFloat(0xbecccccd));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(backupReg0i)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.z),intBitsToFloat(R11i.w),intBitsToFloat(R6i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R124i.y),intBitsToFloat(R126i.w),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R125i.w = tempi.x;
R126i.x = floatBitsToInt(intBitsToFloat(R125i.x) + -0.75);
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.z),intBitsToFloat(R11i.w),intBitsToFloat(R6i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R127i.w = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.z)),intBitsToFloat(PV0ix)) + intBitsToFloat(R127i.x));
// 6
backupReg0i = R125i.x;
backupReg1i = R125i.y;
R125i.x = floatBitsToInt(intBitsToFloat(R126i.x) * 16.0);
R125i.x = clampFI32(R125i.x);
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R11i.w)),intBitsToFloat(R125i.w)) + intBitsToFloat(R124i.y));
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.z)),intBitsToFloat(R125i.w)) + intBitsToFloat(R126i.w));
R123i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3e99999a) + intBitsToFloat(R4i.y));
PS0i = floatBitsToInt(exp2(intBitsToFloat(backupReg1i)));
// 7
R124i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.z)),intBitsToFloat(R127i.w)) + intBitsToFloat(R124i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R11i.w)),intBitsToFloat(R127i.w)) + intBitsToFloat(R127i.y));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.z)),intBitsToFloat(R127i.w)) + intBitsToFloat(R127i.z));
R11i.w = floatBitsToInt(intBitsToFloat(R123i.w) + intBitsToFloat(0xbecccccd));
R126i.w = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(0xbecccccd));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.y = floatBitsToInt(intBitsToFloat(R124i.w) * 10.0);
R125i.y = clampFI32(R125i.y);
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 10
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.y), intBitsToFloat(R125i.y)));
R125i.y = floatBitsToInt(intBitsToFloat(R2i.w) + -(intBitsToFloat(R125i.x)));
R125i.y = clampFI32(R125i.y);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PS1i)));
R126i.w = floatBitsToInt(intBitsToFloat(R126i.w) * 75.0);
R126i.w = clampFI32(R126i.w);
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 11
PV1ix = floatBitsToInt(intBitsToFloat(R124i.x) + -(1.0));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3c23d70a));
PV1iy = clampFI32(PV1iy);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.w), intBitsToFloat(R12i.w)));
PV1iz = clampFI32(PV1iz);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PS0i)));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.z), intBitsToFloat(R19i.z)));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z), intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R5i.y)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(R125i.y)) + 1.0);
R125i.w = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(PV1iz));
R125i.w = clampFI32(R125i.w);
R124i.x = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(R124i.x));
R124i.x = clampFI32(R124i.x);
// 13
R126i.x = floatBitsToInt(0.5 * intBitsToFloat(R123i.z) + 0.5);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R4i.z)) + intBitsToFloat(0xbecccccd));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(R124i.x)) + intBitsToFloat(R13i.w));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3df5c28f));
PV1iw = clampFI32(PV1iw);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z),intBitsToFloat(R124i.x)) + intBitsToFloat(R12i.z));
// 14
backupReg0i = R123i.z;
PV0ix = floatBitsToInt(intBitsToFloat(R123i.y) * 75.0);
PV0ix = clampFI32(PV0ix);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R126i.x)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R124i.x)) + intBitsToFloat(R7i.x));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iw) + -(0.5));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedPS[8].x)));
// 15
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(uf_remappedPS[8].y)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(uf_remappedPS[8].z)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) * 40.0);
PV1iz = clampFI32(PV1iz);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.z), intBitsToFloat(PV0ix)));
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(backupReg0i)));
// 16
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) * 8.0);
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.w)) + intBitsToFloat(R126i.x));
PS0i = floatBitsToInt(intBitsToFloat(R18i.z) * intBitsToFloat(0x3dea4a8c));
// 17
R123i.x = floatBitsToInt(intBitsToFloat(R18i.y) * intBitsToFloat(0x3f162b6b) + intBitsToFloat(PS0i));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R125i.w)) + intBitsToFloat(R127i.w));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PV0ix)));
PV1iw = clampFI32(PV1iw);
// 18
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.z), intBitsToFloat(R123i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R4i.x)));
R123i.z = floatBitsToInt(intBitsToFloat(R18i.x) * intBitsToFloat(0x3e99096c) + intBitsToFloat(R123i.x));
// 19
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R125i.y)) + intBitsToFloat(PV0iy));
R123i.x = clampFI32(R123i.x);
PV1iy = ((intBitsToFloat(R123i.z) > 0.0)?-1:0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.z),intBitsToFloat(R14i.w)) + intBitsToFloat(PV0ix));
R123i.w = clampFI32(R123i.w);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.z));
// 20
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R13i.y)) + intBitsToFloat(R16i.y));
R123i.x = clampFI32(R123i.x);
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R15i.w)),intBitsToFloat(backupReg0i)) + intBitsToFloat(R15i.w));
R123i.y = clampFI32(R123i.y);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].w), intBitsToFloat(R123i.w)));
R127i.w = ((PV1iy == 0)?(0):(PS1i));
// 21
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PV0iz)) + intBitsToFloat(R8i.x));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R8i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y), intBitsToFloat(R123i.x)));
R8i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PV0iz)) + intBitsToFloat(R8i.w));
R15i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(PV0iz)) + intBitsToFloat(R16i.z));
// 22
backupReg0i = R17i.z;
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.w),intBitsToFloat(PV1iy)) + intBitsToFloat(R16i.y));
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.y),intBitsToFloat(PV1iy)) + intBitsToFloat(R16i.y));
R17i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R127i.w)));
R16i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(PV1iy)) + intBitsToFloat(R16i.y));
R8i.z = floatBitsToInt(intBitsToFloat(0x3f895ef0) * intBitsToFloat(PV1iz));
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.y),intBitsToFloat(R17i.z)) + intBitsToFloat(R8i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.x),intBitsToFloat(R17i.z)) + intBitsToFloat(R8i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z),intBitsToFloat(R15i.y)) + intBitsToFloat(0xba0a8ec8));
R123i.z = clampFI32(R123i.z);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.z),intBitsToFloat(R17i.z)) + intBitsToFloat(R15i.w));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z),intBitsToFloat(R4i.x)) + intBitsToFloat(0xba0a8ec8));
R122i.x = clampFI32(R122i.x);
// 1
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(R122i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R123i.z)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z),intBitsToFloat(R16i.w)) + intBitsToFloat(0xba0a8ec8));
R123i.w = clampFI32(R123i.w);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R123i.w)));
R123i.z = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R123i.w = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
// 3
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.z),intBitsToFloat(R123i.w)) + intBitsToFloat(R20i.x));
R123i.y = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(R20i.y));
// 4
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.z),intBitsToFloat(R123i.y)) + intBitsToFloat(R20i.z));
// export
passPixelColor0 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.z), intBitsToFloat(R6i.w));
}
