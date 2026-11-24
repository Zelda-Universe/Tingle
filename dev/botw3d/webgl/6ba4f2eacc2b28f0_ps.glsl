#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 6ba4f2eacc2b28f0
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[2];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(3, 1, 0) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 1) uniform sampler2DArray textureUnitPS4;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem2;
in vec4 passParameterSem3;
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
ivec4 R7i = ivec4(0);
ivec4 R122i = ivec4(0);
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
R2i = floatBitsToInt(passParameterSem2);
R3i = floatBitsToInt(passParameterSem3);
R5i.xyz = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R1i.z),intBitsToFloat(R1i.w))).xyz);
// 0
PV0ix = 0x3e19999a;
R2i.y = ((0.0 > intBitsToFloat(R0i.y))?-1:0);
PV0iz = 0x3d23d70a;
PV0iw = uf_remappedPS[0].y;
PS0i = 0x3da5e354;
// 1
R6i.x = ((R2i.y == 0)?(0x3e19999a):(PV0ix));
R6i.y = ((R2i.y == 0)?(0x3db851ec):(PS0i));
R1i.z = floatBitsToInt(roundEven(intBitsToFloat(PV0iw)));
R4i.w = ((R2i.y == 0)?(0x3d23d70a):(PV0iz));
R3i.w = 0x3c808081;
R4i.xyz = floatBitsToInt(texture(textureUnitPS4, vec3(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z))).xyz);
// 0
R127i.x = floatBitsToInt(-(intBitsToFloat(R5i.z)) + intBitsToFloat(R4i.z));
R127i.y = floatBitsToInt(-(intBitsToFloat(R5i.y)) + intBitsToFloat(R4i.y));
PV0iz = floatBitsToInt(-(intBitsToFloat(R4i.y)) + intBitsToFloat(0x3de147ae));
R127i.w = floatBitsToInt(-(intBitsToFloat(R5i.x)) + intBitsToFloat(R4i.x));
R122i.x = floatBitsToInt(-(intBitsToFloat(R1i.y)) * 20.0 + 10.0);
// 1
PV1ix = uf_remappedPS[1].z;
R1i.y = floatBitsToInt(intBitsToFloat(R3i.y) * 0.5 + 0.5);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R122i.x)) + -3.0);
R123i.z = clampFI32(R123i.z);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R2i.w)) + intBitsToFloat(R4i.y));
R7i.w = 0x3f800000;
// 2
R7i.x = R3i.w;
PV0iy = floatBitsToInt(intBitsToFloat(R123i.z) * 25.5);
R7i.z = PV1ix;
R123i.w = ((R2i.y == 0)?(R4i.y):(R123i.w));
R1i.x = floatBitsToInt(intBitsToFloat(R3i.x) * 0.5 + 0.5);
// 3
PV1ix = floatBitsToInt(intBitsToFloat(R123i.w) * 10.0);
R126i.y = floatBitsToInt(intBitsToFloat(R123i.w) * 6.0 + intBitsToFloat(0xbd75c28f));
PV1iz = floatBitsToInt(floor(intBitsToFloat(PV0iy)));
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 4.0);
R3i.w = 0;
R1i.z = floatBitsToInt(intBitsToFloat(R3i.z) * 0.5 + 0.5);
// 4
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),-(intBitsToFloat(R2i.x))) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedPS[0].y) + intBitsToFloat(PV1ix));
PV0iz = clampFI32(PV0iz);
R1i.w = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3b808081));
// 5
backupReg0i = R127i.y;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PV0iz)) + intBitsToFloat(R5i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV0iz)) + intBitsToFloat(R5i.x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(PV0iz)) + intBitsToFloat(R5i.y));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R6i.y) + -(intBitsToFloat(R127i.z)));
PV0iz = floatBitsToInt(intBitsToFloat(R6i.x) + -(intBitsToFloat(R127i.w)));
PV0iw = floatBitsToInt(intBitsToFloat(R4i.w) + -(intBitsToFloat(R127i.y)));
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R2i.w)) + intBitsToFloat(R127i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R2i.w)) + intBitsToFloat(R127i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R2i.w)) + intBitsToFloat(R127i.y));
// 8
backupReg0i = R123i.x;
backupReg1i = R123i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R126i.y)) + intBitsToFloat(R123i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R126i.y)) + intBitsToFloat(backupReg0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R126i.y)) + intBitsToFloat(backupReg1i));
// 9
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R123i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R123i.w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R123i.y)));
// 10
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),-(intBitsToFloat(R126i.x))) + intBitsToFloat(PV1iy));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),-(intBitsToFloat(R126i.x))) + intBitsToFloat(PV1iz));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),-(intBitsToFloat(R126i.x))) + intBitsToFloat(PV1iw));
// 11
R3i.x = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(0x3cac0831) + intBitsToFloat(R123i.z));
R3i.y = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(0x3cbc6a7f) + intBitsToFloat(R123i.w));
R3i.z = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(0xbda1cac1) + intBitsToFloat(R123i.y));
// 12
R2i.x = R1i.x;
R2i.y = R1i.y;
R2i.z = R1i.z;
R2i.w = R1i.w;
// 13
R1i.x = R3i.x;
R1i.y = R3i.y;
R1i.z = R3i.z;
R1i.w = R3i.w;
// 14
R0i.x = R7i.x;
R0i.y = R7i.z;
R0i.z = R7i.z;
R0i.w = R7i.w;
// export
passPixelColor0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
passPixelColor1 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
passPixelColor3 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
}
