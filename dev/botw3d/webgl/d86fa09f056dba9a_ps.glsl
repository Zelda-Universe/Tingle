#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader d86fa09f056dba9a
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
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
vec4 R5f = vec4(0.0);
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
R0f.xyz = (texture(textureUnitPS3, vec2(R0f.x,R0f.y)).xyz);
// 0
PV0fx = mul_nonIEEE(R2f.y, R3f.z);
R127f.y = R4f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
PV0fz = mul_nonIEEE(R2f.z, R3f.x);
PV0fw = mul_nonIEEE(R2f.x, R3f.y);
R127f.x = R4f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
// 1
R123f.x = mul_nonIEEE(-(R3f.x),R2f.y) + PV0fw;
R123f.y = mul_nonIEEE(-(R3f.z),R2f.x) + PV0fz;
PV1fz = mul_nonIEEE(R127f.y, R127f.y);
R123f.w = mul_nonIEEE(-(R3f.y),R2f.z) + PV0fx;
PS1f = mul_nonIEEE(R3f.w, R127f.x);
// 2
PV0fx = mul_nonIEEE(R123f.w, PS1f);
PV0fy = mul_nonIEEE(R123f.y, PS1f);
PV0fz = mul_nonIEEE(R123f.x, PS1f);
R123f.w = mul_nonIEEE(R127f.x,R127f.x) + PV1fz;
R123f.w = clamp(R123f.w, 0.0, 1.0);
PS0f = R1f.x * 63.75;
// 3
R127f.x = (mul_nonIEEE(R3f.z,R127f.y) + PV0fz)/2.0;
PV1fy = -(R123f.w) + 1.0;
R127f.z = (mul_nonIEEE(R3f.x,R127f.y) + PV0fx)/2.0;
R127f.w = (mul_nonIEEE(R3f.y,R127f.y) + PV0fy)/2.0;
PS1f = mul_nonIEEE(PS0f, R4f.z);
// 4
PV0fx = mul_nonIEEE(R1f.x, R0f.x);
R127f.y = floor(PS1f);
R127f.y *= 4.0;
PV0fz = mul_nonIEEE(R1f.y, R0f.y);
R126f.w = mul_nonIEEE(R1f.z, R0f.z);
PS0f = sqrt(PV1fy);
PS0f /= 2.0;
// 5
backupReg0f = R2f.y;
R123f.x = mul_nonIEEE(R2f.x,PS0f) + R127f.z;
R2f.y = mul_nonIEEE(R1f.x, PV0fz);
R127f.z = mul_nonIEEE(backupReg0f,PS0f) + R127f.w;
R127f.w = mul_nonIEEE(R2f.z,PS0f) + R127f.x;
R2f.x = mul_nonIEEE(R1f.x, PV0fx);
// 6
R0f.x = intBitsToFloat(0x3c808081);
R0f.y = 0.0;
R2f.z = mul_nonIEEE(R1f.x, R126f.w);
R0f.w = 1.0;
R1f.x = R123f.x + 0.5;
// 7
R1f.y = R127f.z + 0.5;
R1f.z = R127f.w + 0.5;
R2f.w = 0.0;
R1f.w = R127f.y * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081);
// 8
R5f.x = R1f.x;
R5f.y = R1f.y;
R5f.z = R1f.z;
R5f.w = R1f.w;
// 9
R4f.x = R2f.x;
R4f.y = R2f.y;
R4f.z = R2f.z;
R4f.w = R2f.w;
// 10
R3f.x = R0f.x;
R3f.y = R0f.y;
R3f.z = R0f.z;
R3f.w = R0f.w;
// export
passPixelColor0 = vec4(R3f.x, R3f.y, R3f.z, R3f.w);
passPixelColor1 = vec4(R4f.x, R4f.y, R4f.z, R4f.w);
passPixelColor3 = vec4(R5f.x, R5f.y, R5f.z, R5f.w);
}
