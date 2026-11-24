#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader e7e31b26bbd728fc
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[10];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 2) uniform sampler2D textureUnitPS2;
in vec4 passParameterSem0;
layout(location = 0) out vec4 passPixelColor0;
layout(location = 1) out vec4 passPixelColor1;
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
R0i = floatBitsToInt(GET_FRAGCOORD());
R1i = floatBitsToInt(passParameterSem0);
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R1i.x)) + 1.0);
R7i.y = floatBitsToInt(-(intBitsToFloat(R1i.y)) + intBitsToFloat(uf_remappedPS[0].y));
PV0iz = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(0xbc23d70a));
PV0iw = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(0xbc23d70a));
R1i.w = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedPS[1].w));
// 1
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedPS[2].z)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(uf_remappedPS[2].w)));
R0i.z = 0;
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R1i.y)) + intBitsToFloat(R123i.x));
R4i.x = floatBitsToInt(-(intBitsToFloat(R1i.x)) + intBitsToFloat(uf_remappedPS[0].x));
R2i.xyzw = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyzw);
R0i.x = floatBitsToInt(texture(textureUnitPS0, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R2i.x) * 2.0 + -(1.0));
R127i.y = floatBitsToInt(intBitsToFloat(R2i.y) * 2.0 + -(1.0));
R127i.z = floatBitsToInt(intBitsToFloat(R2i.z) * 2.0 + -(1.0));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].y),intBitsToFloat(R0i.x)) + intBitsToFloat(uf_remappedPS[3].x));
tempResultf = 1.0 / sqrt(intBitsToFloat(R0i.w));
R126i.w = floatBitsToInt(tempResultf);
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.y = floatBitsToInt(-(intBitsToFloat(R127i.w)));
// 2
R124i.x = floatBitsToInt(-(intBitsToFloat(R126i.y)) + intBitsToFloat(uf_remappedPS[4].z));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R126i.w)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), -(intBitsToFloat(R127i.w))));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), -(intBitsToFloat(R127i.w))));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 3
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
R125i.w = floatBitsToInt(-(intBitsToFloat(R126i.z)) + intBitsToFloat(uf_remappedPS[4].x));
R125i.y = floatBitsToInt(-(intBitsToFloat(R127i.w)) + intBitsToFloat(uf_remappedPS[4].y));
// 4
tempi.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R125i.w)),-(intBitsToFloat(R125i.y)),-(intBitsToFloat(R124i.x)),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[1].x),intBitsToFloat(uf_remappedPS[1].y),intBitsToFloat(uf_remappedPS[1].z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R126i.w)));
// 5
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R126i.w)));
R0i.y = floatBitsToInt(-(intBitsToFloat(R2i.w)) + 1.0);
R127i.z = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(R1i.w));
R127i.z = clampFI32(R127i.z);
R3i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[0].x)) + intBitsToFloat(uf_remappedPS[5].x));
R6i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[0].y)) + intBitsToFloat(uf_remappedPS[5].y));
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].x),intBitsToFloat(R127i.z)) + intBitsToFloat(uf_remappedPS[4].x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].y),intBitsToFloat(R127i.z)) + intBitsToFloat(uf_remappedPS[4].y));
R123i.z = floatBitsToInt(intBitsToFloat(R0i.y) * 0.5 + 0.5);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(0x3d4ccccd));
R123i.w = clampFI32(R123i.w);
R14i.w = 0;
// 7
R127i.x = floatBitsToInt(intBitsToFloat(R126i.z) + -(intBitsToFloat(R123i.x)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(R123i.y)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R123i.w)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z),intBitsToFloat(R127i.z)) + intBitsToFloat(uf_remappedPS[4].z));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(R123i.z)));
R9i.y = floatBitsToInt(intBitsToFloat(R9i.y) / 2.0);
// 8
R5i.x = floatBitsToInt(-(intBitsToFloat(R9i.y)) + 1.0);
R13i.y = floatBitsToInt(intBitsToFloat(PV1iz) + -(1.0));
R127i.z = floatBitsToInt(intBitsToFloat(R126i.y) + -(intBitsToFloat(R123i.w)));
R4i.w = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3ea2f983));
R8i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[0].z)) + intBitsToFloat(uf_remappedPS[5].z));
// 9
tempi.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R127i.x)),-(intBitsToFloat(R127i.y)),-(intBitsToFloat(R127i.z)),intBitsToFloat(0x80000000)),vec4(-(intBitsToFloat(R127i.x)),-(intBitsToFloat(R127i.y)),-(intBitsToFloat(R127i.z)),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R126i.z = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R6i.x)));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R12i.y),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R10i.y),intBitsToFloat(R11i.y),1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
R127i.w = floatBitsToInt(tempResultf);
// 11
backupReg0i = R127i.z;
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)), intBitsToFloat(R127i.w)));
PV1iy = PV0ix;
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) * 2.0);
R127i.z = PV0ix;
R127i.z = clampFI32(R127i.z);
R0i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)), intBitsToFloat(R127i.w)));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].w), intBitsToFloat(R127i.w)));
// 12
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(PV1iy)) + -(intBitsToFloat(R10i.y)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y),intBitsToFloat(PV1iy)) + -(intBitsToFloat(R11i.y)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(PV1iy)) + -(intBitsToFloat(R6i.x)));
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.x)), intBitsToFloat(R127i.w)));
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedPS[1].x),intBitsToFloat(uf_remappedPS[1].y),intBitsToFloat(uf_remappedPS[1].z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),0.0)));
PV1ix = tempi.x;
R127i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R5i.x)) + intBitsToFloat(R9i.y));
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.w),intBitsToFloat(R125i.y),intBitsToFloat(R124i.x),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[1].x),intBitsToFloat(uf_remappedPS[1].y),intBitsToFloat(uf_remappedPS[1].z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R127i.w = tempi.x;
R4i.z = floatBitsToInt(1.0 / intBitsToFloat(R122i.x));
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.w),intBitsToFloat(R125i.y),intBitsToFloat(R124i.x),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R127i.z = tempi.x;
PV1iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R127i.y)));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.w),intBitsToFloat(R125i.y),intBitsToFloat(R124i.x),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.w),intBitsToFloat(R125i.y),intBitsToFloat(R124i.x),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV1ix)));
// 17
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R126i.y) * 3.0);
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[1].w)),intBitsToFloat(R127i.z)) + intBitsToFloat(backupReg0i));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0ix)),intBitsToFloat(R127i.y)) + intBitsToFloat(PS0i));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R126i.x)));
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(uf_remappedPS[7].x)) + intBitsToFloat(uf_remappedPS[7].y));
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R12i.y),intBitsToFloat(R3i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.w),intBitsToFloat(R125i.x),intBitsToFloat(R0i.w),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R123i.y));
// 19
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(uf_remappedPS[8].y)));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(uf_remappedPS[9].y)));
R3i.y = clampFI32(R3i.y);
PV1iz = floatBitsToInt(max(intBitsToFloat(PV0ix), -(1.0)));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS0i));
PV1iw = clampFI32(PV1iw);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 20
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].x),intBitsToFloat(PV1iw)) + intBitsToFloat(R125i.w));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].y),intBitsToFloat(PV1iw)) + intBitsToFloat(R125i.y));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z),intBitsToFloat(PV1iw)) + intBitsToFloat(R124i.x));
PV0iw = floatBitsToInt(min(intBitsToFloat(PV1iz), 1.0));
R2i.w = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(PS1i));
R2i.w = clampFI32(R2i.w);
// 21
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R3i.x),intBitsToFloat(R4i.y),intBitsToFloat(R2i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R1i.w = tempi.x;
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(uf_remappedPS[7].z)) + intBitsToFloat(uf_remappedPS[7].w));
R5i.y = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y))).x);
// 0
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R1i.w)) + -(intBitsToFloat(R3i.x)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R1i.w)) + -(intBitsToFloat(R4i.y)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)) + -(intBitsToFloat(R2i.z)));
R126i.w = ((intBitsToFloat(R2i.x) > intBitsToFloat(uf_remappedPS[8].x))?-1:0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R2i.w));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.w = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(PS0i));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.w),intBitsToFloat(R6i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R3i.w),intBitsToFloat(R6i.y),intBitsToFloat(R6i.y),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R127i.z = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 3
tempi.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R4i.x)),-(intBitsToFloat(R7i.y)),-(intBitsToFloat(R7i.y)),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R3i.w),intBitsToFloat(R6i.y),intBitsToFloat(R0i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R125i.w = tempi.x;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 4
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.y)),intBitsToFloat(R3i.y)) + 1.0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R0i.x)));
R125i.z = floatBitsToInt(max(-(intBitsToFloat(R0i.w)), 0.0));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedPS[6].w) * intBitsToFloat(PS1i));
PV0iw = clampFI32(PV0iw);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 5
backupReg0i = R126i.w;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(PV0iw)) + intBitsToFloat(R3i.x));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(PV0iw)) + intBitsToFloat(R4i.y));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(PV0iw)) + intBitsToFloat(R2i.z));
R126i.w = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(PS0i));
R126i.w = clampFI32(R126i.w);
R125i.x = ((backupReg0i == 0)?(R5i.y):(PV0iy));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(R126i.w)) + intBitsToFloat(R4i.x));
// 7
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R126i.w)) + intBitsToFloat(uf_remappedPS[0].z));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(backupReg0i)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R126i.w)) + intBitsToFloat(R7i.y));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R122i.x), intBitsToFloat(R122i.x)));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 8
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(PS1i)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PS1i)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS1i)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(PV1iw));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].x), intBitsToFloat(R125i.x)));
// 9
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R10i.y) + intBitsToFloat(R124i.x));
R127i.y = floatBitsToInt(intBitsToFloat(R11i.y) + intBitsToFloat(R125i.y));
R127i.z = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(R126i.z));
R124i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)),intBitsToFloat(R123i.w)) + 1.0);
R124i.w = clampFI32(R124i.w);
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].y), intBitsToFloat(R125i.x)));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].z), intBitsToFloat(R125i.x)));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R12i.y),intBitsToFloat(R3i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),0.0)));
tempi.x = clampFI32(tempi.x);
PV1ix = tempi.x;
R125i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 12
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS1i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS1i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS1i)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(R5i.x)) + intBitsToFloat(R9i.y));
R125i.w = floatBitsToInt(min(intBitsToFloat(R125i.z), 1.0));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.y),intBitsToFloat(R11i.y),intBitsToFloat(R6i.x),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
tempi.x = clampFI32(tempi.x);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R124i.x = floatBitsToInt(1.0 / intBitsToFloat(R123i.w));
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R12i.y),intBitsToFloat(R3i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
tempi.x = clampFI32(tempi.x);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.z = floatBitsToInt(-(intBitsToFloat(PV1ix)) + 1.0);
// 15
backupReg0i = R126i.w;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(PV0ix)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.z)));
PV1iz = floatBitsToInt(-(intBitsToFloat(R124i.y)) + 1.0);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R124i.x)));
R124i.x = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3ea2f983));
// 16
backupReg0i = R13i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.y)));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(PV1iz)) + intBitsToFloat(R124i.y));
PV0iz = floatBitsToInt(intBitsToFloat(R124i.z) * intBitsToFloat(0x3ea2f983));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(PV1ix)) + 1.0);
PS0i = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(0x3ea2f983));
// 17
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R123i.w)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(backupReg0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PV0iz)));
// 18
R14i.x = floatBitsToInt(min(intBitsToFloat(PV1iz), 32.0));
R14i.y = floatBitsToInt(min(intBitsToFloat(PS1i), 32.0));
R127i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3f75c28f) + intBitsToFloat(0x3d23d70a));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 19
R14i.z = floatBitsToInt(min(intBitsToFloat(R124i.x), 32.0));
PV1iw = floatBitsToInt(intBitsToFloat(R4i.w) * intBitsToFloat(PS0i));
// 20
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R127i.z)));
// 21
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV0iy)));
// 22
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) * 0.25);
// 23
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV0iw)));
// 24
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV1iz)));
// 25
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0iy)));
// 26
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].z), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].y), intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].x), intBitsToFloat(PV1ix)));
// 27
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(PV0iw)));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(PV0iy)));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(PV0iz)));
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y), intBitsToFloat(R5i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y), intBitsToFloat(R7i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y), intBitsToFloat(R4i.z)));
// 1
R4i.x = floatBitsToInt(min(intBitsToFloat(PV0iy), 32.0));
R4i.y = floatBitsToInt(min(intBitsToFloat(PV0ix), 32.0));
R4i.z = floatBitsToInt(min(intBitsToFloat(PV0iw), 32.0));
// 2
R0i.x = R14i.x;
R0i.y = R14i.y;
R0i.z = R14i.z;
R0i.w = R14i.w;
// 3
R1i.x = R4i.x;
R1i.y = R4i.y;
R1i.z = R4i.z;
R1i.w = R4i.w;
// export
passPixelColor0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
passPixelColor1 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
}
