#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 7da34ef3976402d5
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[6];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(1, 1, 0) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 1) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(3, 1, 2) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 3) uniform sampler2D textureUnitPS4;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem2;
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
R3i = floatBitsToInt(passParameterSem3);
R4i = floatBitsToInt(passParameterSem4);
R1i.xy = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xy);
R2i.w = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R2i.xyz = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y))).xyz);
R0i.xyz = floatBitsToInt(texture(textureUnitPS4, vec2(intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))).xyz);
// 0
backupReg0i = R1i.w;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), intBitsToFloat(uf_remappedPS[1].w)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].y), intBitsToFloat(uf_remappedPS[1].w)));
PV0iz = 0;
R1i.w = floatBitsToInt(intBitsToFloat(R1i.z) * 2.0 + -(1.0));
R5i.x = floatBitsToInt(intBitsToFloat(backupReg0i) * 2.0 + -(1.0));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R124i.w = floatBitsToInt(intBitsToFloat(R1i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
// 2
R126i.x = floatBitsToInt(intBitsToFloat(R1i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R4i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R4i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R4i.z)));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 3
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R124i.w)));
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.y)),intBitsToFloat(R3i.z)) + intBitsToFloat(PV0iw));
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.z)),intBitsToFloat(R3i.x)) + intBitsToFloat(PV0iz));
// 4
backupReg0i = R126i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R126i.x)) + intBitsToFloat(PV1iz));
R123i.x = clampFI32(R123i.x);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(R126i.x)));
PV0iz = ((intBitsToFloat(R127i.x) > 0.0)?-1:0);
R125i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.x)),intBitsToFloat(R3i.y)) + intBitsToFloat(backupReg0i));
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R0i.z)));
// 5
PV1ix = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R126i.y)));
R1i.z = floatBitsToInt(((PV0iz == 0)?(-(intBitsToFloat(R127i.x))):(intBitsToFloat(R127i.x))));
R0i.w = floatBitsToInt(((PV0iz == 0)?(-(intBitsToFloat(R127i.x))):(intBitsToFloat(R127i.x))));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R126i.y)));
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R124i.w)) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R126i.y)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R124i.w)) + intBitsToFloat(PS1i));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R0i.x)));
R126i.y = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 7
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R126i.y)) + intBitsToFloat(R123i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R126i.y)) + intBitsToFloat(R123i.z));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R0i.y)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R124i.w)) + intBitsToFloat(PV0iy));
PS1i = 0x3d60e0e1;
// 8
R7i.x = PS1i;
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R126i.y)) + intBitsToFloat(R123i.w));
R7i.w = floatBitsToInt(1.0);
R4i.w = 0x3f800000;
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 10
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 11
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PS0i)) + 0.5);
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PS0i)) + 0.5);
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PS0i)) + 0.5);
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].z), intBitsToFloat(R1i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].z), intBitsToFloat(R5i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].x), intBitsToFloat(R1i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].x), intBitsToFloat(R5i.x)));
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].y),intBitsToFloat(R0i.w)) + intBitsToFloat(PV0iw));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].y),intBitsToFloat(R1i.y)) + intBitsToFloat(PV0iz));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].w),intBitsToFloat(R1i.y)) + intBitsToFloat(PV0ix));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].w),intBitsToFloat(R1i.z)) + intBitsToFloat(PV0iy));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),-(intBitsToFloat(uf_remappedPS[3].w))) + intBitsToFloat(R2i.w));
R127i.y = uf_remappedPS[4].z;
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R123i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(R123i.z)));
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),-(intBitsToFloat(uf_remappedPS[3].w))) + intBitsToFloat(R3i.w));
// 3
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x), intBitsToFloat(uf_remappedPS[3].w)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(R124i.w)) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(63.75 * intBitsToFloat(R123i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R127i.x)) + intBitsToFloat(PV0iz));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),-(intBitsToFloat(uf_remappedPS[3].w))) + intBitsToFloat(R0i.z));
// 4
PV0ix = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
PV0ix = clampFI32(PV0ix);
PV0iy = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
PV0iy = clampFI32(PV0iy);
PV0iz = floatBitsToInt(floor(intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 4.0);
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),-(intBitsToFloat(uf_remappedPS[3].w))) + intBitsToFloat(R1i.x));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(0xbf2aaae3));
R126i.y = PV0ix;
R126i.y = clampFI32(R126i.y);
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(0xbf2aaae3));
R124i.w = PV0iy;
R124i.w = clampFI32(R124i.w);
R127i.x = floatBitsToInt(intBitsToFloat(PV0iz) + 2.0);
// 6
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].y), intBitsToFloat(uf_remappedPS[3].w)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) * 12.0);
PV0iz = clampFI32(PV0iz);
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) * 12.0);
PV0iw = clampFI32(PV0iw);
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].z), intBitsToFloat(uf_remappedPS[3].w)));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e99999a));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e99999a));
R7i.z = R127i.y;
R6i.w = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0x3b808081));
// 8
R123i.x = floatBitsToInt(intBitsToFloat(R124i.w) * intBitsToFloat(0x3e4ccccd) + intBitsToFloat(PV1iy));
R123i.x = clampFI32(R123i.x);
R127i.z = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(0x3e4ccccd) + intBitsToFloat(PV1ix));
R127i.z = clampFI32(R127i.z);
// 9
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].x), intBitsToFloat(R123i.x)));
// 10
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].x),intBitsToFloat(R127i.z)) + intBitsToFloat(PV1iz));
// 11
PV1iy = floatBitsToInt(63.75 * intBitsToFloat(R123i.w));
// 12
PV0ix = floatBitsToInt(floor(intBitsToFloat(PV1iy)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 4.0);
// 13
R2i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081));
// 14
R11i.x = R4i.x;
R11i.y = R4i.y;
R11i.z = R4i.z;
R11i.w = R4i.w;
// 15
R10i.x = R6i.x;
R10i.y = R6i.y;
R10i.z = R6i.z;
R10i.w = R6i.w;
// 16
R9i.x = R2i.x;
R9i.y = R2i.y;
R9i.z = R2i.z;
R9i.w = R2i.w;
// 17
R8i.x = R7i.x;
R8i.y = R7i.z;
R8i.z = R7i.z;
R8i.w = R7i.w;
// export
passPixelColor0 = vec4(intBitsToFloat(R8i.x), intBitsToFloat(R8i.y), intBitsToFloat(R8i.z), intBitsToFloat(R8i.w));
passPixelColor1 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w));
passPixelColor3 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w));
passPixelColor5 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));
}
