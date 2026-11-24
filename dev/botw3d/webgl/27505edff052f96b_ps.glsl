#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 27505edff052f96b
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
PV0ix = ((0.0 > intBitsToFloat(R0i.y))?-1:0);
PV0iy = uf_remappedPS[0].x;
PV0iz = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(0x3f733333));
PV0iw = floatBitsToInt(intBitsToFloat(R0i.x) * intBitsToFloat(0x3f933333));
R4i.x = 0x3c808081;
// 1
backupReg0i = R0i.x;
R0i.x = ((PV0ix == 0)?(R0i.y):(PV0iz));
R0i.y = ((PV0ix == 0)?(backupReg0i):(PV0iw));
R1i.z = floatBitsToInt(roundEven(intBitsToFloat(PV0iy)));
R0i.w = R0i.z;
R0i.z = uf_remappedPS[1].z;
R1i.w = floatBitsToInt(texture(textureUnitPS3, vec3(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z))).x);
// 0
R1i.x = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(0x3f19999a) + intBitsToFloat(R2i.x));
R1i.y = floatBitsToInt(intBitsToFloat(R0i.x) * intBitsToFloat(0x3f19999a) + intBitsToFloat(R2i.y));
R1i.z = floatBitsToInt(intBitsToFloat(R0i.w) * intBitsToFloat(0x3f19999a) + intBitsToFloat(R2i.z));
R2i.w = floatBitsToInt(-(intBitsToFloat(R2i.w)) + intBitsToFloat(R1i.w));
R2i.w = clampFI32(R2i.w);
R2i.x = R4i.x;
// 1
R0i.x = floatBitsToInt(intBitsToFloat(R3i.x) * 0.5 + 0.5);
R2i.y = R0i.z;
R0i.z = floatBitsToInt(intBitsToFloat(R3i.z) * 0.5 + 0.5);
R1i.w = 0;
R0i.y = floatBitsToInt(intBitsToFloat(R3i.y) * 0.5 + 0.5);
// 2
R0i.w = 0;
// 3
R5i.x = R0i.x;
R5i.y = R0i.y;
R5i.z = R0i.z;
R5i.w = R0i.w;
// 4
R4i.x = R1i.x;
R4i.y = R1i.y;
R4i.z = R1i.z;
R4i.w = R1i.w;
// 5
R3i.x = R2i.x;
R3i.y = R2i.y;
R3i.z = R2i.z;
R3i.w = R2i.w;
// export
if( ((vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w))).a >= uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
passPixelColor1 = vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.z), intBitsToFloat(R4i.w));
passPixelColor3 = vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.z), intBitsToFloat(R5i.w));
}
