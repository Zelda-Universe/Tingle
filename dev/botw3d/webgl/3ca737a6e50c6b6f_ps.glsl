#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 3ca737a6e50c6b6f
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[4];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(2, 1, 0) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(3, 1, 1) uniform sampler2D textureUnitPS3;
in vec4 passParameterSem0;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem6;
layout(location = 0) out vec4 passPixelColor0;
layout(location = 1) out vec4 passPixelColor1;
layout(location = 3) out vec4 passPixelColor3;
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
ivec4 R123i = ivec4(0);
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
R1i = floatBitsToInt(passParameterSem3);
R2i = floatBitsToInt(passParameterSem4);
R3i = floatBitsToInt(passParameterSem6);
R4i.xy = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xy);
R0i.w = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
// 0
R126i.x = floatBitsToInt(intBitsToFloat(R4i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R2i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R2i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R2i.x)));
R127i.z = floatBitsToInt(intBitsToFloat(R4i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.z)),intBitsToFloat(R1i.x)) + intBitsToFloat(PV0iw));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.y)),intBitsToFloat(R1i.z)) + intBitsToFloat(PV0iy));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.x)),intBitsToFloat(R1i.y)) + intBitsToFloat(PV0iz));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R126i.x)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R127i.z)));
// 2
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(PS1i)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R127i.z)) + intBitsToFloat(PV1iw));
R123i.y = clampFI32(R123i.y);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(PS1i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(PS1i)));
R4i.y = floatBitsToInt(200.0 * intBitsToFloat(uf_remappedPS[0].w));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.x = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
// 4
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R126i.x)) + intBitsToFloat(R127i.w));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R126i.x)) + intBitsToFloat(R127i.z));
PV0iz = floatBitsToInt(intBitsToFloat(R0i.w) * 63.75);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R126i.x)) + intBitsToFloat(backupReg0i));
R127i.y = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 5
PV1ix = floatBitsToInt(floor(intBitsToFloat(PV0iz)));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 4.0);
R6i.y = uf_remappedPS[1].y;
R125i.z = 0x3d40c0c1;
R125i.w = uf_remappedPS[2].z;
PS1i = floatBitsToInt(sqrt(intBitsToFloat(R125i.x)));
// 6
backupReg0i = R127i.x;
backupReg1i = R127i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(PS1i)) + intBitsToFloat(R127i.w));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(PS1i)) + intBitsToFloat(R126i.y));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(PS1i)) + intBitsToFloat(backupReg0i));
R126i.w = floatBitsToInt(intBitsToFloat(PV1ix) + 2.0);
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(backupReg1i));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.w)));
// 8
R6i.x = uf_remappedPS[1].x;
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R127i.w)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R127i.w)));
R5i.w = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0x3b808081));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 9
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
R0i.w = floatBitsToInt(1.0);
R6i.z = uf_remappedPS[1].z;
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R127i.w = tempi.x;
PS0i = R127i.x;
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 11
PV1ix = R127i.y;
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0ix)),intBitsToFloat(PS0i)) + intBitsToFloat(R1i.x));
R127i.z = floatBitsToInt(intBitsToFloat(PV0ix) + 1.0);
R127i.z = clampFI32(R127i.z);
PV1iw = R126i.z;
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 2.0);
R5i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 0.5 + 0.5);
// 12
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)),intBitsToFloat(PV1ix)) + intBitsToFloat(R3i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)),intBitsToFloat(PV1iw)) + intBitsToFloat(R3i.z));
R5i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 0.5 + 0.5);
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.y),intBitsToFloat(R123i.y),intBitsToFloat(R123i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R1i.z = tempi.x;
PV1iw = tempi.x;
R0i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.z)),intBitsToFloat(PV0ix)) + intBitsToFloat(PV0ix));
// 14
R0i.x = R125i.z;
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(PV1ix)) + 1.0);
R123i.y = clampFI32(R123i.y);
R5i.z = floatBitsToInt(intBitsToFloat(R126i.z) * 0.5 + 0.5);
R0i.y = R125i.w;
// 15
R3i.x = floatBitsToInt(sqrt(intBitsToFloat(R123i.y)));
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(uf_remappedPS[3].x)) + intBitsToFloat(R1i.x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(uf_remappedPS[3].y)) + intBitsToFloat(R3i.y));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(uf_remappedPS[3].z)) + intBitsToFloat(R3i.z));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R126i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS0i)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV1ix),intBitsToFloat(PV1iy),intBitsToFloat(PV1iz),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R125i.w = tempi.x;
// 5
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0ix)),intBitsToFloat(PV0ix)) + 1.0);
R123i.z = clampFI32(R123i.z);
// 6
PS0i = floatBitsToInt(sqrt(intBitsToFloat(R123i.z)));
// 7
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PS0i)));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.z)),intBitsToFloat(R125i.w)) + intBitsToFloat(PV1iy));
R123i.x = clampFI32(R123i.x);
// 9
tempResultf = max(0.0, intBitsToFloat(R123i.x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 10
PV0iw = floatBitsToInt(intBitsToFloat(PS1i) * 60.0);
// 11
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
// 12
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R0i.z)));
// 13
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) * 255.0);
// 14
PS0i = int(intBitsToFloat(PV1iy));
// 15
PV1iw = PS0i & 0xe0;
// 16
PV0iz = PV1iw >> 0x3;
// 17
PS1i = floatBitsToInt(float(PV0iz));
// 18
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) + 64.0);
// 19
R6i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3b808081));
// 20
R3i.x = R5i.x;
R3i.y = R5i.y;
R3i.z = R5i.z;
R3i.w = R5i.w;
// 21
R2i.x = R6i.x;
R2i.y = R6i.y;
R2i.z = R6i.z;
R2i.w = R6i.w;
// 22
R1i.x = R0i.x;
R1i.y = R0i.y;
R1i.z = R0i.z;
R1i.w = R0i.w;
// export
passPixelColor0 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
passPixelColor1 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
passPixelColor3 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
}
