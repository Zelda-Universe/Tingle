#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 22b839a35656f449
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[5];
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
R6i.xy = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xy);
R5i.xw = floatBitsToInt(texture(textureUnitPS4, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xw);
R0i.xyz = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
// 0
PV0ix = floatBitsToInt(fract(intBitsToFloat(R3i.x)));
R126i.y = floatBitsToInt(intBitsToFloat(R4i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PV0iz = floatBitsToInt(fract(intBitsToFloat(R3i.y)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R2i.z)));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R2i.x)));
// 1
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R2i.y)));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + -(0.5));
R127i.z = floatBitsToInt(intBitsToFloat(R4i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + -(0.5));
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R126i.y)));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iw)),intBitsToFloat(PV1iw)) + 1.0);
R123i.x = clampFI32(R123i.x);
PV0iy = floatBitsToInt(intBitsToFloat(R6i.y) * intBitsToFloat(0x3dcccccd));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 4.0);
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iy)),intBitsToFloat(PV1iy)) + 1.0);
R123i.z = clampFI32(R123i.z);
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.y)),intBitsToFloat(R1i.z)) + intBitsToFloat(R127i.w));
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.z)),intBitsToFloat(R1i.x)) + intBitsToFloat(R127i.x));
// 3
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.x)),intBitsToFloat(R1i.y)) + intBitsToFloat(R126i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R127i.z)) + intBitsToFloat(R125i.x));
R123i.y = clampFI32(R123i.y);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R127i.z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R123i.z)));
R127i.y = floatBitsToInt(intBitsToFloat(PV0iy) * 255.0);
// 4
backupReg0i = R123i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV1iz)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(PV1iw)) + intBitsToFloat(R6i.y));
R123i.y = clampFI32(R123i.y);
R126i.z = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV1iz)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(PV1iz)));
// 5
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R123i.y)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R126i.y)) + intBitsToFloat(PV0iw));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R126i.y)) + intBitsToFloat(PS0i));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R126i.y)) + intBitsToFloat(PV0ix));
PS1i = int(intBitsToFloat(backupReg0i));
// 6
backupReg0i = R126i.z;
R125i.x = PS1i & 0xe0;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].z), intBitsToFloat(R5i.x)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].y), intBitsToFloat(R5i.x)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), intBitsToFloat(R5i.x)));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(backupReg0i)));
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),-(intBitsToFloat(uf_remappedPS[1].w))) + intBitsToFloat(R126i.x));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.y));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.w));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].x), intBitsToFloat(R5i.w)));
// 8
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].z), intBitsToFloat(R5i.w)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].y), intBitsToFloat(R5i.w)));
PV0iz = floatBitsToInt(intBitsToFloat(R123i.x) * 63.75);
PV0iw = backupReg0i >> 0x3;
R127i.w = ((intBitsToFloat(R6i.y) > 0.5)?-1:0);
// 9
backupReg0i = R126i.y;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].y), intBitsToFloat(R126i.w)));
R126i.y = floatBitsToInt(floor(intBitsToFloat(PV0iz)));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) * 4.0);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].y), intBitsToFloat(backupReg0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].y), intBitsToFloat(R126i.z)));
R125i.y = floatBitsToInt(float(PV0iw));
// 10
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(R127i.y)) + intBitsToFloat(PV1iw));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(R127i.z)) + intBitsToFloat(PV1ix));
R127i.z = ((R127i.w == 0)?(0x3d008081):(0x3d30b0b1));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV1iz));
R126i.w = uf_remappedPS[4].z;
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.y),intBitsToFloat(R125i.z),intBitsToFloat(R2i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.y),intBitsToFloat(R125i.z),intBitsToFloat(R2i.w),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R124i.w = tempi.x;
PS1i = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(uf_remappedPS[1].x));
// 12
R126i.x = floatBitsToInt(intBitsToFloat(R126i.y) + 2.0);
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.w)) + intBitsToFloat(uf_remappedPS[1].z));
PV0iz = floatBitsToInt(-(intBitsToFloat(R125i.x)) + intBitsToFloat(uf_remappedPS[1].y));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.y) + 65.0);
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i),intBitsToFloat(uf_remappedPS[1].w)) + intBitsToFloat(R127i.y));
// 13
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),-(intBitsToFloat(uf_remappedPS[1].w))) + intBitsToFloat(R0i.x));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(uf_remappedPS[1].w)) + intBitsToFloat(R125i.x));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(uf_remappedPS[1].w)) + intBitsToFloat(R127i.w));
R1i.w = floatBitsToInt(1.0);
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),-(intBitsToFloat(uf_remappedPS[1].w))) + intBitsToFloat(R0i.y));
// 14
R1i.x = R127i.z;
R1i.y = R126i.w;
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),-(intBitsToFloat(uf_remappedPS[1].w))) + intBitsToFloat(R0i.z));
R5i.w = 0x3f800000;
R0i.w = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(0x3b808081));
// 15
R6i.w = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(0x3b808081));
tempResultf = 1.0 / sqrt(intBitsToFloat(R124i.w));
PS1i = floatBitsToInt(tempResultf);
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 16
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(PS1i)) + 0.5);
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(PS1i)) + 0.5);
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(PS1i)) + 0.5);
// 17
R5i.x = R5i.x;
R5i.y = R5i.y;
R5i.z = R5i.z;
R5i.w = R5i.w;
// 18
R4i.x = R0i.x;
R4i.y = R0i.y;
R4i.z = R0i.z;
R4i.w = R0i.w;
// 19
R3i.x = R6i.x;
R3i.y = R6i.y;
R3i.z = R6i.z;
R3i.w = R6i.w;
// 20
R2i.x = R1i.x;
R2i.y = R1i.y;
R2i.z = R1i.z;
R2i.w = R1i.w;
// export
passPixelColor0 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
passPixelColor1 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
passPixelColor3 = vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.z), intBitsToFloat(R4i.w));
passPixelColor5 = vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.z), intBitsToFloat(R5i.w));
}
