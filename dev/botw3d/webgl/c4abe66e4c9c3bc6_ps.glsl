#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader c4abe66e4c9c3bc6
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[7];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(1, 1, 0) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 1) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(3, 1, 2) uniform sampler2D textureUnitPS3;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem6;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
layout(location = 0) out vec4 passPixelColor0;
layout(location = 1) out vec4 passPixelColor1;
layout(location = 3) out vec4 passPixelColor3;
layout(location = 5) out vec4 passPixelColor5;
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
ivec4 R123i = ivec4(0);
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
R2i = floatBitsToInt(passParameterSem6);
R3i = floatBitsToInt(passParameterSem3);
R4i = floatBitsToInt(passParameterSem4);
R1i.xy = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xy);
R5i.xyz = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
R7i.xyz = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
// 0
backupReg0i = R1i.w;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), intBitsToFloat(uf_remappedPS[1].w)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].y), intBitsToFloat(uf_remappedPS[1].w)));
PV0iz = 0;
R1i.w = floatBitsToInt(intBitsToFloat(R1i.z) * 2.0 + -(1.0));
R0i.x = floatBitsToInt(intBitsToFloat(backupReg0i) * 2.0 + -(1.0));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.y = floatBitsToInt(intBitsToFloat(R1i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
// 2
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R4i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R4i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R4i.z)));
R127i.w = floatBitsToInt(intBitsToFloat(R1i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 3
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R126i.y)));
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.y)),intBitsToFloat(R3i.z)) + intBitsToFloat(PV0iz));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.z)),intBitsToFloat(R3i.x)) + intBitsToFloat(PV0iy));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R127i.w)) + intBitsToFloat(PV1iz));
R123i.x = clampFI32(R123i.x);
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.x)),intBitsToFloat(R3i.y)) + intBitsToFloat(R126i.x));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(R127i.w)));
PV0iw = ((intBitsToFloat(R127i.x) > 0.0)?-1:0);
R126i.z = floatBitsToInt(63.75 * intBitsToFloat(R5i.x));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
R1i.z = floatBitsToInt(((PV0iw == 0)?(-(intBitsToFloat(R127i.x))):(intBitsToFloat(R127i.x))));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(PV0iz)));
// 6
PV0ix = floatBitsToInt(floor(intBitsToFloat(R126i.z)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 4.0);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R126i.y)) + intBitsToFloat(PS1i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R126i.y)) + intBitsToFloat(PV1iw));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R126i.y)) + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1iy)));
// 7
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(PS0i)) + intBitsToFloat(R123i.z));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(PS0i)) + intBitsToFloat(R123i.w));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(PS0i)) + intBitsToFloat(R123i.y));
R126i.w = 0x3d60e0e1;
R126i.x = floatBitsToInt(intBitsToFloat(PV0ix) + 2.0);
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R126i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R2i.w = floatBitsToInt(1.0);
// 9
R2i.x = R126i.w;
R4i.w = 0x3f800000;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 10
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PS1i)) + 0.5);
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(PS1i)) + 0.5);
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(PS1i)) + 0.5);
R6i.w = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(0x3b808081));
R3i.y = uf_remappedPS[1].y;
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.z)), intBitsToFloat(uf_remappedPS[2].y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x), intBitsToFloat(R0i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x), intBitsToFloat(R1i.w)));
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].y),intBitsToFloat(R1i.z)) + intBitsToFloat(PV0iz));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].y),intBitsToFloat(R1i.y)) + intBitsToFloat(PV0iw));
PV1iz = uf_remappedPS[4].z;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(uf_remappedPS[5].w)));
PV0ix = clampFI32(PV0ix);
R2i.y = PV1iz;
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R123i.y)));
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].x),-(intBitsToFloat(PV0ix))) + intBitsToFloat(uf_remappedPS[5].x));
R123i.x = clampFI32(R123i.x);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R127i.x)) + intBitsToFloat(PV0iw));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].x), intBitsToFloat(R123i.x)));
PV0iy = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
PV0iy = clampFI32(PV0iy);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].y), intBitsToFloat(R123i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].z), intBitsToFloat(R123i.x)));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(0xbf2aaae3));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].z), intBitsToFloat(PV0ix)));
R126i.z = PV0iy;
R126i.z = clampFI32(R126i.z);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].z), intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].z), intBitsToFloat(PV0iw)));
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.y)),intBitsToFloat(PV1iy)) + intBitsToFloat(PV1iy));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.y)),intBitsToFloat(PS1i)) + intBitsToFloat(PS1i));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.y)),intBitsToFloat(PV1iw)) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) * 12.0);
PV0iw = clampFI32(PV0iw);
// 7
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R123i.x)));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e99999a));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R123i.y)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R123i.z)));
// 8
R123i.x = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0x3e4ccccd) + intBitsToFloat(PV1iy));
R123i.x = clampFI32(R123i.x);
// 9
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].z), intBitsToFloat(R123i.x)));
// 10
PV0ix = floatBitsToInt(63.75 * intBitsToFloat(PV1iz));
// 11
PV1iw = floatBitsToInt(floor(intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 4.0);
// 12
R7i.w = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081));
// 13
R11i.x = R4i.x;
R11i.y = R4i.y;
R11i.z = R4i.z;
R11i.w = R4i.w;
// 14
R10i.x = R6i.x;
R10i.y = R6i.y;
R10i.z = R6i.z;
R10i.w = R6i.w;
// 15
R9i.x = R7i.x;
R9i.y = R7i.y;
R9i.z = R7i.z;
R9i.w = R7i.w;
// 16
R8i.x = R2i.x;
R8i.y = R2i.y;
R8i.z = R2i.z;
R8i.w = R2i.w;
// export
passPixelColor0 = vec4(intBitsToFloat(R8i.x), intBitsToFloat(R8i.y), intBitsToFloat(R8i.z), intBitsToFloat(R8i.w));
passPixelColor1 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w));
passPixelColor3 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w));
passPixelColor5 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));
}
