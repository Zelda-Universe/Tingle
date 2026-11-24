#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 5a64a75f64d7e6f0
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(3, 1, 0) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 1) uniform sampler2D textureUnitPS4;
in vec4 passParameterSem0;
in vec4 passParameterSem5;
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
vec4 R0f = vec4(0.0);
vec4 R1f = vec4(0.0);
vec4 R2f = vec4(0.0);
vec4 R3f = vec4(0.0);
vec4 R4f = vec4(0.0);
vec4 R123f = vec4(0.0);
vec4 R126f = vec4(0.0);
vec4 R127f = vec4(0.0);
float backupReg0f, backupReg1f, backupReg2f, backupReg3f, backupReg4f;
float PV0fx = 0.0, PV0fy = 0.0, PV0fz = 0.0, PV0fw = 0.0, PV1fx = 0.0, PV1fy = 0.0, PV1fz = 0.0, PV1fw = 0.0;
float PS0f = 0.0, PS1f = 0.0;
vec4 tempf = vec4(0.0);
float tempResultf;
int tempResulti;
ivec4 ARi = ivec4(0);
bool predResult = true;
R0f = passParameterSem0;
R1f = passParameterSem5;
R2f = passParameterSem3;
R3f = passParameterSem4;
R4f.xyz = (texture(textureUnitPS4, vec2(R0f.x,R0f.y)).xyz);
R0f.xyzw = (texture(textureUnitPS3, vec2(R0f.x,R0f.y)).xyzw);
// 0
R127f.x = R4f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
PV0fy = mul_nonIEEE(R2f.y, R3f.z);
PV0fz = mul_nonIEEE(R2f.z, R3f.x);
PV0fw = mul_nonIEEE(R2f.x, R3f.y);
R127f.z = R4f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
// 1
R123f.x = mul_nonIEEE(-(R3f.x),R2f.y) + PV0fw;
R123f.y = mul_nonIEEE(-(R3f.z),R2f.x) + PV0fz;
R123f.z = mul_nonIEEE(-(R3f.y),R2f.z) + PV0fy;
PV1fw = mul_nonIEEE(R127f.x, R127f.x);
PS1f = mul_nonIEEE(R3f.w, R127f.z);
// 2
backupReg0f = R123f.y;
PV0fx = mul_nonIEEE(R123f.z, PS1f);
R123f.y = mul_nonIEEE(R127f.z,R127f.z) + PV1fw;
R123f.y = clamp(R123f.y, 0.0, 1.0);
PV0fz = mul_nonIEEE(backupReg0f, PS1f);
PV0fw = mul_nonIEEE(R123f.x, PS1f);
PS0f = R4f.z * 63.75;
// 3
backupReg0f = R127f.x;
R127f.x = -(R123f.y) + 1.0;
R127f.y = (mul_nonIEEE(R3f.y,backupReg0f) + PV0fz)/2.0;
R127f.z = (mul_nonIEEE(R3f.z,backupReg0f) + PV0fw)/2.0;
R127f.w = (mul_nonIEEE(R3f.x,backupReg0f) + PV0fx)/2.0;
R126f.x = floor(PS0f);
R126f.x *= 4.0;
// 4
R0f.x = mul_nonIEEE(R1f.x, R0f.x);
R0f.y = mul_nonIEEE(R1f.x, R0f.y);
R0f.z = mul_nonIEEE(R1f.x, R0f.z);
R1f.w = R0f.w;
R1f.x = intBitsToFloat(0x3c808081);
// 5
R1f.y = 0.0;
R0f.w = 0.0;
PS1f = sqrt(R127f.x);
PS1f /= 2.0;
// 6
R123f.x = mul_nonIEEE(R2f.z,PS1f) + R127f.z;
R123f.z = mul_nonIEEE(R2f.x,PS1f) + R127f.w;
R123f.w = mul_nonIEEE(R2f.y,PS1f) + R127f.y;
R2f.w = R126f.x * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081);
// 7
R2f.x = R123f.z + 0.5;
R2f.y = R123f.w + 0.5;
R2f.z = R123f.x + 0.5;
// 8
R4f.x = R2f.x;
R4f.y = R2f.y;
R4f.z = R2f.z;
R4f.w = R2f.w;
// 9
R3f.x = R0f.x;
R3f.y = R0f.y;
R3f.z = R0f.z;
R3f.w = R0f.w;
// 10
R2f.x = R1f.x;
R2f.y = R1f.y;
R2f.z = R1f.z;
R2f.w = R1f.w;
// export
if( ((vec4(R2f.x, R2f.y, R2f.z, R2f.w)).a >= uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
passPixelColor1 = vec4(R3f.x, R3f.y, R3f.z, R3f.w);
passPixelColor3 = vec4(R4f.x, R4f.y, R4f.z, R4f.w);
}
