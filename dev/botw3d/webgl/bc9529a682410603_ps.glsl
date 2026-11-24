#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader bc9529a682410603
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[2];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(3, 1, 0) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 1) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(5, 1, 2) uniform sampler2D textureUnitPS5;
in vec4 passParameterSem0;
in vec4 passParameterSem5;
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
vec4 R0f = vec4(0.0);
vec4 R1f = vec4(0.0);
vec4 R2f = vec4(0.0);
vec4 R3f = vec4(0.0);
vec4 R4f = vec4(0.0);
vec4 R5f = vec4(0.0);
vec4 R6f = vec4(0.0);
vec4 R7f = vec4(0.0);
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
R0f.w = (texture(textureUnitPS5, vec2(R0f.x,R0f.y)).x);
R0f.xyz = (texture(textureUnitPS3, vec2(R0f.x,R0f.y)).xyz);
// 0
R127f.x = R4f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
PV0fy = mul_nonIEEE(R2f.y, R3f.z);
PV0fz = mul_nonIEEE(R2f.x, R3f.y);
PV0fw = mul_nonIEEE(R2f.z, R3f.x);
R127f.w = R4f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
// 1
R123f.x = mul_nonIEEE(-(R3f.z),R2f.x) + PV0fw;
R123f.y = mul_nonIEEE(-(R3f.y),R2f.z) + PV0fy;
PV1fz = mul_nonIEEE(R127f.x, R127f.x);
R123f.w = mul_nonIEEE(-(R3f.x),R2f.y) + PV0fz;
PS1f = mul_nonIEEE(R3f.w, R127f.w);
// 2
PV0fx = mul_nonIEEE(R123f.y, PS1f);
R123f.y = mul_nonIEEE(R127f.w,R127f.w) + PV1fz;
R123f.y = clamp(R123f.y, 0.0, 1.0);
PV0fz = mul_nonIEEE(R123f.x, PS1f);
PV0fw = mul_nonIEEE(R123f.w, PS1f);
R127f.y = R4f.z * 63.75;
// 3
backupReg0f = R127f.x;
R127f.x = -(R123f.y) + 1.0;
R126f.y = (mul_nonIEEE(R3f.y,backupReg0f) + PV0fz)/2.0;
R126f.z = (mul_nonIEEE(R3f.x,backupReg0f) + PV0fx)/2.0;
R127f.w = (mul_nonIEEE(R3f.z,backupReg0f) + PV0fw)/2.0;
R127f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), R0f.w);
// 4
R126f.x = floor(R127f.y);
R126f.x *= 4.0;
PV0fy = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].z), R0f.w);
R3f.z = mul_nonIEEE(R1f.x, R0f.z);
PV0fw = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].y), R0f.w);
R3f.x = mul_nonIEEE(R1f.x, R0f.x);
// 5
backupReg0f = R0f.y;
R0f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].x), R127f.z);
R0f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].x), PV0fw);
R0f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].x), PV0fy);
R1f.w = 1.0;
R3f.y = mul_nonIEEE(R1f.x, backupReg0f);
// 6
R1f.x = intBitsToFloat(0x3c808081);
R1f.y = 0.0;
R0f.w = 1.0;
PS0f = sqrt(R127f.x);
PS0f /= 2.0;
// 7
R123f.x = mul_nonIEEE(R2f.z,PS0f) + R127f.w;
R123f.z = mul_nonIEEE(R2f.y,PS0f) + R126f.y;
R123f.w = mul_nonIEEE(R2f.x,PS0f) + R126f.z;
R3f.w = intBitsToFloat(0x3b808081);
// 8
R2f.x = R123f.w + 0.5;
R2f.y = R123f.z + 0.5;
R2f.z = R123f.x + 0.5;
R2f.w = R126f.x * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081);
// 9
R7f.x = R0f.x;
R7f.y = R0f.y;
R7f.z = R0f.z;
R7f.w = R0f.w;
// 10
R6f.x = R2f.x;
R6f.y = R2f.y;
R6f.z = R2f.z;
R6f.w = R2f.w;
// 11
R5f.x = R3f.x;
R5f.y = R3f.y;
R5f.z = R3f.z;
R5f.w = R3f.w;
// 12
R4f.x = R1f.x;
R4f.y = R1f.y;
R4f.z = R1f.z;
R4f.w = R1f.w;
// export
passPixelColor0 = vec4(R4f.x, R4f.y, R4f.z, R4f.w);
passPixelColor1 = vec4(R5f.x, R5f.y, R5f.z, R5f.w);
passPixelColor3 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
passPixelColor5 = vec4(R7f.x, R7f.y, R7f.z, R7f.w);
}
