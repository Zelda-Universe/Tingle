#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader e42ea266ae42732c
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[2];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(3, 1, 0) uniform sampler2DArray textureUnitPS3;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem2;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
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
ivec4 R8i = ivec4(0);
ivec4 R9i = ivec4(0);
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
R4i = floatBitsToInt(passParameterSem4);
// 0
PV0ix = uf_remappedPS[0].x;
R5i.y = floatBitsToInt(-(intBitsToFloat(R1i.y)) * 2.0 + 1.0);
R5i.y = clampFI32(R5i.y);
PV0iz = floatBitsToInt(-(intBitsToFloat(R1i.y)) + 1.0);
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
R1i.w = ((0.0 > intBitsToFloat(R0i.y))?-1:0);
R6i.y = floatBitsToInt(-(intBitsToFloat(R3i.x)) + intBitsToFloat(R4i.x));
// 1
R5i.x = floatBitsToInt(intBitsToFloat(PV0iz) + -(1.0));
R7i.y = floatBitsToInt(-(intBitsToFloat(R3i.y)) + intBitsToFloat(R4i.y));
R1i.z = floatBitsToInt(roundEven(intBitsToFloat(PV0ix)));
R0i.w = floatBitsToInt(-(intBitsToFloat(R3i.z)) + intBitsToFloat(R4i.z));
R8i.y = floatBitsToInt(intBitsToFloat(R0i.x) * intBitsToFloat(0x3f933333));
R9i.yw = floatBitsToInt(texture(textureUnitPS3, vec3(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z))).yw);
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(0x3f733333));
R127i.y = floatBitsToInt(intBitsToFloat(R5i.y) * 19.125);
PV0iz = floatBitsToInt(intBitsToFloat(R9i.y) + intBitsToFloat(0xbdb851ec));
PV0iw = floatBitsToInt(min(intBitsToFloat(R4i.w), intBitsToFloat(R5i.x)));
PV0iw = clampFI32(PV0iw);
R126i.z = R0i.z;
// 1
R126i.x = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(PV0iw)) + intBitsToFloat(R3i.x))/2.0);
R126i.y = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(PV0iw)) + intBitsToFloat(R3i.y))/2.0);
R127i.z = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(PV0iw)) + intBitsToFloat(R3i.z))/2.0);
R123i.w = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3dcccccd) + intBitsToFloat(0x3db851ec));
PS1i = 0x3c808081;
// 2
R127i.x = ((R1i.w == 0)?(R0i.y):(R127i.x));
R125i.y = ((R1i.w == 0)?(R0i.x):(R8i.y));
PV0iz = uf_remappedPS[1].z;
R123i.w = ((R1i.w == 0)?(R9i.y):(R123i.w));
R1i.x = PS1i;
// 3
R125i.x = floatBitsToInt(floor(intBitsToFloat(R127i.y)));
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) * 4.0);
R123i.y = floatBitsToInt(intBitsToFloat(R123i.w) * 8.0 + intBitsToFloat(0xbda3d70a));
R9i.z = floatBitsToInt(intBitsToFloat(R127i.z) + 0.5);
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R9i.w)));
R1i.y = PV0iz;
// 4
PV0ix = floatBitsToInt(min(intBitsToFloat(R123i.y), intBitsToFloat(0x3f4ccccd)));
PV0ix = clampFI32(PV0ix);
R9i.y = floatBitsToInt(intBitsToFloat(R126i.y) + 0.5);
R0i.w = 0;
R9i.x = floatBitsToInt(intBitsToFloat(R126i.x) + 0.5);
// 5
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(PV0ix)) + intBitsToFloat(R2i.x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PV0ix)) + intBitsToFloat(R2i.y));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(PV0ix)) + intBitsToFloat(R2i.z));
R9i.w = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(0x3b808081));
// 6
R4i.x = R9i.x;
R4i.y = R9i.y;
R4i.z = R9i.z;
R4i.w = R9i.w;
// 7
R3i.x = R0i.x;
R3i.y = R0i.y;
R3i.z = R0i.z;
R3i.w = R0i.w;
// 8
R2i.x = R1i.x;
R2i.y = R1i.y;
R2i.z = R1i.z;
R2i.w = R1i.w;
// export
if( ((vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w))).a >= uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
passPixelColor1 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
passPixelColor3 = vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.z), intBitsToFloat(R4i.w));
}
