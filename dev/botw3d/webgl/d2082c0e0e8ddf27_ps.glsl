#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader d2082c0e0e8ddf27
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[8];
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
PV0iy = floatBitsToInt(intBitsToFloat(R1i.x) + -(intBitsToFloat(uf_remappedPS[0].x)));
PV0iz = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(0xbc23d70a));
PV0iw = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(0xbc23d70a));
R3i.w = floatBitsToInt(intBitsToFloat(R1i.y) + -(intBitsToFloat(uf_remappedPS[0].y)));
// 1
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(uf_remappedPS[1].z)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedPS[1].w)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R1i.y)) + intBitsToFloat(R123i.x));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(PV0iy)));
R8i.w = 0;
R2i.xyzw = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyzw);
R0i.x = floatBitsToInt(texture(textureUnitPS0, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R2i.x) * 2.0 + -(1.0));
R127i.y = floatBitsToInt(intBitsToFloat(R2i.y) * 2.0 + -(1.0));
R127i.z = floatBitsToInt(intBitsToFloat(R2i.z) * 2.0 + -(1.0));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].y),intBitsToFloat(R0i.x)) + intBitsToFloat(uf_remappedPS[2].x));
R126i.w = floatBitsToInt(intBitsToFloat(R2i.w) * 255.0);
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),-(intBitsToFloat(R127i.w))) + -(intBitsToFloat(uf_remappedPS[3].x)));
// 2
R3i.x = floatBitsToInt(-(intBitsToFloat(R2i.w)) + 1.0);
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),-(intBitsToFloat(R127i.w))) + -(intBitsToFloat(uf_remappedPS[3].y)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),-(intBitsToFloat(R127i.w))) + -(intBitsToFloat(uf_remappedPS[3].z)));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 3
backupReg0i = R126i.w;
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R3i.x)) + intBitsToFloat(0x3d4ccccd));
R126i.w = clampFI32(R126i.w);
PS1i = int(intBitsToFloat(backupReg0i));
// 4
tempi.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R124i.x)),-(intBitsToFloat(R2i.y)),-(intBitsToFloat(R126i.z)),intBitsToFloat(0x80000000)),vec4(-(intBitsToFloat(R124i.x)),-(intBitsToFloat(R2i.y)),-(intBitsToFloat(R126i.z)),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.x = PS1i & 0x2;
// 5
R2i.x = floatBitsToInt(max(intBitsToFloat(PV0ix), intBitsToFloat(0x3a83126f)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R126i.w)));
R127i.z = floatBitsToInt(intBitsToFloat(R3i.x) * 0.5 + 0.5);
R6i.w = floatBitsToInt(0.0 * intBitsToFloat(uf_remappedPS[4].w) + 1.0);
tempResultf = 1.0 / sqrt(intBitsToFloat(R0i.z));
PS1i = floatBitsToInt(tempResultf);
// 6
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PS1i)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PS1i)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PS1i)));
R1i.w = floatBitsToInt(intBitsToFloat(R126i.y) + -(1.0));
tempResultf = 1.0 / sqrt(intBitsToFloat(R2i.x));
R126i.w = floatBitsToInt(tempResultf);
// 7
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R3i.z),0.0)));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.x)), intBitsToFloat(R126i.w)));
// 8
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.z)));
R1i.x = floatBitsToInt(intBitsToFloat(R1i.x) / 2.0);
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.y)), intBitsToFloat(R126i.w)));
R7i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.z)), intBitsToFloat(R126i.w)));
PV0iw = R127i.x;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].w), intBitsToFloat(R126i.w)));
// 9
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(PV0iw)) + -(intBitsToFloat(R4i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(PV0iw)) + -(intBitsToFloat(R4i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(PV0iw)) + -(intBitsToFloat(R3i.z)));
R2i.w = floatBitsToInt(-(intBitsToFloat(R1i.x)) + 1.0);
R124i.y = floatBitsToInt(min(intBitsToFloat(PS0i), 1.0));
// 10
tempi.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R124i.x)),-(intBitsToFloat(R2i.y)),-(intBitsToFloat(R126i.z)),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = R127i.x;
PS0i = clampFI32(PS0i);
// 11
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PV0ix)) + intBitsToFloat(R124i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PV0ix)) + intBitsToFloat(R2i.y));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV0ix)) + intBitsToFloat(R126i.z));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i),intBitsToFloat(R2i.w)) + intBitsToFloat(R1i.x));
R126i.x = floatBitsToInt(1.0 / intBitsToFloat(R124i.y));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R7i.y = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(0x3ea2f983));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R125i.y),intBitsToFloat(R7i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 14
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(backupReg0i) * 3.0);
PV0iy = floatBitsToInt(max(intBitsToFloat(PV1ix), -(1.0)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(uf_remappedPS[6].x)) + intBitsToFloat(uf_remappedPS[6].y));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R124i.y)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 15
PV1ix = floatBitsToInt(min(intBitsToFloat(PV0iy), 1.0));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(uf_remappedPS[7].y)));
R6i.z = ((intBitsToFloat(R1i.z) > intBitsToFloat(uf_remappedPS[7].x))?-1:0);
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedPS[5].w) * intBitsToFloat(PS0i));
PV1iw = clampFI32(PV1iw);
R6i.y = floatBitsToInt(1.0 / intBitsToFloat(R126i.w));
// 16
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PV1iw)) + -(intBitsToFloat(R124i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PV1iw)) + -(intBitsToFloat(R2i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV1iw)) + -(intBitsToFloat(R126i.z)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(uf_remappedPS[6].z)) + intBitsToFloat(uf_remappedPS[6].w));
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R126i.w)));
// 18
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(intBitsToFloat(R3i.x) + intBitsToFloat(R127i.x));
PV0iy = clampFI32(PV0iy);
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(uf_remappedPS[4].y)));
R5i.z = clampFI32(R5i.z);
PV0iw = ((intBitsToFloat(R126i.w) > 0.0)?-1:0);
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 19
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS0i)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
R123i.w = ((PV0iw == 0)?(0):(PV0ix));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 20
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(R2i.x));
R3i.y = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(R2i.y));
R2i.z = floatBitsToInt(intBitsToFloat(R3i.z) + intBitsToFloat(R0i.z));
R0i.w = floatBitsToInt(intBitsToFloat(R3i.x) * intBitsToFloat(PS1i));
R1i.y = ((backupReg0i == 0)?(R126i.w):(R123i.w));
R1i.y = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R1i.z),intBitsToFloat(R1i.y))).x);
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R3i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R3i.y),intBitsToFloat(R2i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R0i.y)));
// 1
R124i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R0i.z),0.0)));
R124i.x = clampFI32(R124i.x);
PV1iy = R124i.x;
PV1iz = R124i.x;
PV1iw = R124i.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 2
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PS1i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(PS1i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PS1i)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R2i.w)) + intBitsToFloat(R1i.x));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R0i.w)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R3i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
tempi.x = clampFI32(tempi.x);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(R123i.w));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
tempi.x = clampFI32(tempi.x);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.y = floatBitsToInt(-(intBitsToFloat(PV1ix)) + 1.0);
// 5
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R127i.y)));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.z)),intBitsToFloat(R5i.z)) + 1.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R126i.w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(PV0ix)));
R127i.z = ((R6i.z == 0)?(R1i.y):(R127i.w));
// 6
backupReg0i = R123i.y;
PV0ix = floatBitsToInt(max(-(intBitsToFloat(R7i.z)), 0.0));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(R3i.w)) + intBitsToFloat(R4i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(PV1iw)) + 1.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R126i.x)));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(backupReg0i)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(R123i.z)));
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[0].z)),intBitsToFloat(R123i.y)) + 1.0);
R125i.y = clampFI32(R125i.y);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV0iw)));
R127i.w = floatBitsToInt(min(intBitsToFloat(PV0ix), 1.0));
R127i.y = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].x), intBitsToFloat(R127i.z)));
R124i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3f75c28f) + intBitsToFloat(0x3d23d70a));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].y), intBitsToFloat(R127i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].z), intBitsToFloat(R127i.z)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 9
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R127i.y)) + intBitsToFloat(R127i.x));
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3ea2f983));
PV1iz = floatBitsToInt(intBitsToFloat(R7i.y) * intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3ea2f983));
PS1i = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3ea2f983));
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(R124i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV1iy)));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV0ix)));
// 12
R8i.x = floatBitsToInt(min(intBitsToFloat(PV1ix), 32.0));
R8i.y = floatBitsToInt(min(intBitsToFloat(PV1iy), 32.0));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) * 0.25);
R8i.z = floatBitsToInt(min(intBitsToFloat(PV1iz), 32.0));
// 13
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(PV0iz)));
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV1iy)));
// 15
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV0ix)));
// 16
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].z), intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].y), intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].x), intBitsToFloat(PV1iw)));
// 17
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV0iz)));
// 18
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV1iz)));
// 19
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV0iz)));
// 20
R7i.x = floatBitsToInt(min(intBitsToFloat(PV1iy), 32.0));
R7i.y = floatBitsToInt(min(intBitsToFloat(PV1ix), 32.0));
R7i.z = floatBitsToInt(min(intBitsToFloat(PV1iw), 32.0));
// 21
R0i.x = R8i.x;
R0i.y = R8i.y;
R0i.z = R8i.z;
R0i.w = R8i.w;
// 22
R1i.x = R7i.x;
R1i.y = R7i.y;
R1i.z = R7i.z;
R1i.w = R7i.w;
// export
passPixelColor0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
passPixelColor1 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
}
