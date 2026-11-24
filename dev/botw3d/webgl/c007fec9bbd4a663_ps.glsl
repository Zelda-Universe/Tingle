#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader c007fec9bbd4a663
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2DArray textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2DArray textureUnitPS1;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem2;
in vec4 passParameterSem3;
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
ivec4 R122i = ivec4(0);
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
R1i = floatBitsToInt(passParameterSem1);
R2i = floatBitsToInt(passParameterSem2);
R3i = floatBitsToInt(passParameterSem3);
// 0
R123i.x = floatBitsToInt(intBitsToFloat(R0i.z) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(R1i.x) * intBitsToFloat(0x3e22f983) + 0.5);
R3i.z = floatBitsToInt(roundEven(intBitsToFloat(R3i.z)));
R123i.w = floatBitsToInt(intBitsToFloat(R0i.x) * intBitsToFloat(0x3e22f983) + 0.5);
R2i.z = floatBitsToInt(roundEven(intBitsToFloat(R2i.z)));
// 1
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(intBitsToFloat(R1i.z) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV1iw = floatBitsToInt(fract(intBitsToFloat(backupReg0i)));
R127i.w = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(0x3e22f983) + 0.5);
// 2
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.w = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R4i.x = floatBitsToInt(intBitsToFloat(R0i.w) * intBitsToFloat(0x3e22f983) + 0.5);
// 3
R0i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R0i.y = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
R0i.z = floatBitsToInt(fract(intBitsToFloat(R127i.w)));
R0i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R4i.z = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R5i.z = floatBitsToInt(textureLodOffset(textureUnitPS1, vec3(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z)),intBitsToFloat(R3i.w),ivec2(1,0)).w);
R5i.x = floatBitsToInt(textureLodOffset(textureUnitPS1, vec3(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z)),intBitsToFloat(R3i.w),ivec2(1,1)).w);
R4i.w = floatBitsToInt(textureLod(textureUnitPS1, vec3(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z)),intBitsToFloat(R3i.w)).w);
R3i.y = floatBitsToInt(textureLodOffset(textureUnitPS1, vec3(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z)),intBitsToFloat(R3i.w),ivec2(0,1)).w);
R2i.xyz = floatBitsToInt(textureLod(textureUnitPS0, vec3(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z)),intBitsToFloat(R2i.w)).xyz);
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R0i.z) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(R1i.y) * intBitsToFloat(0x3e22f983) + 0.5);
R127i.z = floatBitsToInt(intBitsToFloat(R0i.w) * intBitsToFloat(0x3e22f983));
PV0iw = floatBitsToInt(fract(intBitsToFloat(R4i.x)));
PS0i = floatBitsToInt(cos((intBitsToFloat(R0i.x))/0.1591549367));
// 1
R123i.x = floatBitsToInt(intBitsToFloat(R1i.w) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(PS0i)));
R127i.w = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS1i = floatBitsToInt(cos((intBitsToFloat(R0i.y))/0.1591549367));
// 2
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(PV1iz)));
R126i.z = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
R126i.w = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS0i = floatBitsToInt(cos((intBitsToFloat(R4i.z))/0.1591549367));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 3
backupReg0i = R127i.z;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(PV0iy)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x3e22f983));
R127i.z = ((intBitsToFloat(R4i.w) == intBitsToFloat(R5i.x))?-1:0);
R127i.w = ((intBitsToFloat(R5i.z) == intBitsToFloat(R5i.x))?-1:0);
PS1i = floatBitsToInt(sin((intBitsToFloat(backupReg0i))/0.1591549367));
// 4
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R126i.y = ((intBitsToFloat(R5i.z) == intBitsToFloat(R3i.y))?-1:0);
R126i.z = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0x3e22f983));
R123i.w = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3ca3d70a) + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(sin((intBitsToFloat(backupReg0i))/0.1591549367));
// 5
R126i.x = floatBitsToInt(intBitsToFloat(R123i.w) * 16.0);
R125i.y = ((R127i.z == 0)?(0):(0x3f800000));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(PS0i)));
R126i.w = ((R127i.w == 0)?(0):(0x3f800000));
PS1i = floatBitsToInt(sin((intBitsToFloat(R127i.y))/0.1591549367));
// 6
backupReg0i = R126i.z;
PV0ix = ((intBitsToFloat(R3i.y) == intBitsToFloat(R5i.x))?-1:0);
PV0iy = ((intBitsToFloat(R4i.w) == intBitsToFloat(R3i.y))?-1:0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(PV1iz)));
R127i.w = ((intBitsToFloat(R4i.w) == intBitsToFloat(R5i.z))?-1:0);
R127i.y = floatBitsToInt(sin((intBitsToFloat(backupReg0i))/0.1591549367));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) / 2.0);
// 7
backupReg0i = R127i.x;
R127i.x = ((R126i.y == 0)?(0):(0x3f800000));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R126i.x)));
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) * 2.0);
R127i.z = ((PV0iy == 0)?(0):(0x3f800000));
PV1iw = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3e22f983));
R126i.x = ((PV0ix == 0)?(0):(0x3f800000));
// 8
backupReg0i = R126i.z;
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) + -(1.0));
PV0iy = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(R126i.w));
R126i.z = ((R127i.w == 0)?(0):(0x3f800000));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(backupReg0i)));
PS0i = floatBitsToInt(cos((intBitsToFloat(PV1iw))/0.1591549367));
// 9
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(backupReg0i));
R125i.z = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x35cccd9a));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(backupReg0i));
R122i.x = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3ca3d70a) + intBitsToFloat(PV0iw));
// 10
backupReg0i = R126i.x;
backupReg1i = R127i.z;
R126i.x = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(R127i.x));
R127i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(backupReg1i));
PS0i = floatBitsToInt(intBitsToFloat(R122i.x) * 16.0);
// 11
backupReg0i = R125i.z;
PV1ix = ((intBitsToFloat(R127i.z) > intBitsToFloat(PV0iy))?-1:0);
PV1iy = floatBitsToInt(fract(intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) * 2.0);
R125i.z = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(R126i.x));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) + -(1.0));
R123i.y = ((PV1ix == 0)?(R127i.x):(R127i.z));
PV0iz = ((intBitsToFloat(R125i.z) > intBitsToFloat(PV1iw))?-1:0);
R126i.w = ((PV1ix == 0)?(R5i.x):(R3i.y));
// 13
backupReg0i = R126i.x;
backupReg1i = R123i.y;
R126i.x = ((PV0iz == 0)?(R5i.z):(R4i.w));
R123i.y = ((PV0iz == 0)?(backupReg0i):(R125i.z));
R123i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x35cccd9a) + intBitsToFloat(backupReg1i));
// 14
PV0iz = ((intBitsToFloat(R123i.y) > intBitsToFloat(R123i.w))?-1:0);
// 15
R123i.y = ((PV0iz == 0)?(R126i.w):(R126i.x));
// 16
PV0ix = floatBitsToInt(intBitsToFloat(R123i.y) * 255.0);
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
// 17
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + 0.25);
// 18
PV0iz = floatBitsToInt(floor(intBitsToFloat(PV1iw)));
// 19
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) * 0.5);
// 20
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(0x3c23d70a));
// 21
R2i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3b808081));
// export
passPixelColor0 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
}
