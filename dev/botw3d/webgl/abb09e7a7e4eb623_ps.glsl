#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader abb09e7a7e4eb623
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[4];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(1, 1, 0) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 1) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(3, 1, 2) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 3) uniform sampler2D textureUnitPS4;
in vec4 passParameterSem0;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem7;
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
R1i = floatBitsToInt(passParameterSem3);
R2i = floatBitsToInt(passParameterSem4);
R3i = floatBitsToInt(passParameterSem7);
R4i.xy = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xy);
R5i.xy = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xy);
R6i.xw = floatBitsToInt(texture(textureUnitPS4, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xw);
R0i.xyz = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
// 0
PV0ix = floatBitsToInt(fract(intBitsToFloat(R3i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R2i.z)));
R126i.z = floatBitsToInt(intBitsToFloat(R4i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PV0iw = floatBitsToInt(fract(intBitsToFloat(R3i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R2i.x)));
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R2i.y)));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(0.5));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(0.5));
R127i.w = floatBitsToInt(intBitsToFloat(R4i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R126i.z)));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iz)),intBitsToFloat(PV1iz)) + 1.0);
R123i.x = clampFI32(R123i.x);
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.y)),intBitsToFloat(R1i.z)) + intBitsToFloat(R127i.y));
PV0iz = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(0x3dcccccd));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 4.0);
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iy)),intBitsToFloat(PV1iy)) + 1.0);
R123i.w = clampFI32(R123i.w);
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.z)),intBitsToFloat(R1i.x)) + intBitsToFloat(R127i.z));
// 3
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.x)),intBitsToFloat(R1i.y)) + intBitsToFloat(R127i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R127i.w)) + intBitsToFloat(R126i.y));
R123i.y = clampFI32(R123i.y);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R123i.w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R127i.w)));
R126i.y = floatBitsToInt(intBitsToFloat(PV0iz) * 255.0);
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV1iw)));
R127i.z = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(PV1iw)));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(PV1iz)) + intBitsToFloat(R5i.y));
R122i.x = clampFI32(R122i.x);
// 5
backupReg0i = R126i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R126i.z)) + intBitsToFloat(PV0iy));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R126i.z)) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R122i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R126i.z)) + intBitsToFloat(PV0iw));
PS1i = int(intBitsToFloat(backupReg0i));
// 6
backupReg0i = R127i.z;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), intBitsToFloat(R6i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].y), intBitsToFloat(R6i.x)));
R127i.z = floatBitsToInt(intBitsToFloat(PV1iz) * 63.75);
PV0iw = PS1i & 0xe0;
PS0i = floatBitsToInt(sqrt(intBitsToFloat(backupReg0i)));
// 7
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(PS0i)) + intBitsToFloat(R126i.y));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.x));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.w));
R127i.w = PV0iw >> 0x3;
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].z), intBitsToFloat(R6i.x)));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R124i.y),intBitsToFloat(R1i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R124i.y),intBitsToFloat(R1i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R125i.z = tempi.x;
PV0iw = tempi.x;
R124i.z = ((intBitsToFloat(R5i.y) > 0.5)?-1:0);
// 9
backupReg0i = R127i.w;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z), intBitsToFloat(R6i.w)));
R126i.y = floatBitsToInt(floor(intBitsToFloat(R127i.z)));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) * 4.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].y), intBitsToFloat(R6i.w)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].x), intBitsToFloat(R6i.w)));
R125i.y = floatBitsToInt(float(backupReg0i));
// 10
backupReg0i = R126i.x;
backupReg1i = R126i.z;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].y), intBitsToFloat(R127i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].y), intBitsToFloat(backupReg0i)));
R126i.z = ((R124i.z == 0)?(0x3d008081):(0x3d30b0b1));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].y), intBitsToFloat(backupReg1i)));
tempResultf = 1.0 / sqrt(intBitsToFloat(R125i.z));
R127i.y = floatBitsToInt(tempResultf);
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) / 2.0);
// 11
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R126i.y) + 2.0);
R126i.y = floatBitsToInt(intBitsToFloat(R125i.y) + 65.0);
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].x),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV0iw));
PV1iw = uf_remappedPS[3].z;
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].x),intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iy));
// 12
R2i.x = R126i.z;
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].x),intBitsToFloat(R127i.z)) + intBitsToFloat(R126i.x));
R2i.z = PV1iw;
R2i.w = floatBitsToInt(1.0);
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y)) + 0.5);
// 13
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(R127i.y)) + 0.5);
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(R127i.y)) + 0.5);
R6i.w = 0x3f800000;
R5i.w = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0x3b808081));
// 14
R0i.w = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(0x3b808081));
// 15
R9i.x = R6i.x;
R9i.y = R6i.y;
R9i.z = R6i.z;
R9i.w = R6i.w;
// 16
R8i.x = R5i.x;
R8i.y = R5i.y;
R8i.z = R5i.z;
R8i.w = R5i.w;
// 17
R7i.x = R0i.x;
R7i.y = R0i.y;
R7i.z = R0i.z;
R7i.w = R0i.w;
// 18
R6i.x = R2i.x;
R6i.y = R2i.z;
R6i.z = R2i.z;
R6i.w = R2i.w;
// export
passPixelColor0 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.z), intBitsToFloat(R6i.w));
passPixelColor1 = vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.y), intBitsToFloat(R7i.z), intBitsToFloat(R7i.w));
passPixelColor3 = vec4(intBitsToFloat(R8i.x), intBitsToFloat(R8i.y), intBitsToFloat(R8i.z), intBitsToFloat(R8i.w));
passPixelColor5 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w));
}
