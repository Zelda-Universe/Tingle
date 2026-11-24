#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 702ae499d894be79
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2DArray textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
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
int backupReg0i, backupReg1i, backupReg2i, backupReg3i, backupReg4i;
int PV0ix = 0, PV0iy = 0, PV0iz = 0, PV0iw = 0, PV1ix = 0, PV1iy = 0, PV1iz = 0, PV1iw = 0;
int PS0i = 0, PS1i = 0;
ivec4 tempi = ivec4(0);
float tempResultf;
int tempResulti;
ivec4 ARi = ivec4(0);
bool predResult = true;
R0i = floatBitsToInt(passParameterSem0);
// 0
R1i.x = R0i.x;
R1i.y = R0i.y;
R2i.z = 0;
R1i.z = floatBitsToInt(roundEven(0.0));
R1i.w = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
// 0
PV0iy = floatBitsToInt(intBitsToFloat(R1i.w) * 255.0);
// 1
PS1i = int(intBitsToFloat(PV0iy));
// 2
PV0iw = PS1i & 0x8;
// 3
if(  (PV0iw == 0)) discard;
R1i.xyz = floatBitsToInt(texture(textureUnitPS0, vec3(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z))).xyz);
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),intBitsToFloat(0x3dea4a8c),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV0ix)));
// 2
PV0iy = ((intBitsToFloat(PV1iz) > intBitsToFloat(R0i.z))?-1:0);
// 3
R0i.x = ((PV0iy == 0)?(0):(0x3f800000));
// 4
backupReg0i = R2i.z;
R2i.x = backupReg0i;
R2i.y = backupReg0i;
R2i.z = backupReg0i;
R2i.w = backupReg0i;
// 5
R1i.x = R0i.x;
R1i.y = R0i.x;
R1i.z = R0i.x;
R1i.w = R0i.x;
// export
passPixelColor0 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
passPixelColor1 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
}
