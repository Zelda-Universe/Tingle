#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 03a0c40611a5ffc5
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[3];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(3, 1, 0) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 1) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(5, 1, 2) uniform sampler2D textureUnitPS5;
TEXTURE_LAYOUT(6, 1, 3) uniform sampler2D textureUnitPS6;
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
vec4 R125f = vec4(0.0);
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
R5f.xyz = (texture(textureUnitPS4, vec2(R0f.x,R0f.y)).xyz);
R4f.x = (texture(textureUnitPS5, vec2(R0f.x,R0f.y)).x);
R0f.w = (texture(textureUnitPS6, vec2(R0f.x,R0f.y)).x);
R0f.xyz = (texture(textureUnitPS3, vec2(R0f.x,R0f.y)).xyz);
// 0
PV0fx = mul_nonIEEE(R2f.y, R3f.z);
R127f.y = R5f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
PV0fz = mul_nonIEEE(R2f.x, R3f.y);
PV0fw = mul_nonIEEE(R2f.z, R3f.x);
R127f.w = R5f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
// 1
R123f.x = mul_nonIEEE(-(R3f.y),R2f.z) + PV0fx;
R123f.y = mul_nonIEEE(-(R3f.z),R2f.x) + PV0fw;
PV1fz = mul_nonIEEE(R127f.y, R127f.y);
R123f.w = mul_nonIEEE(-(R3f.x),R2f.y) + PV0fz;
PS1f = mul_nonIEEE(R3f.w, R127f.w);
// 2
backupReg0f = R123f.x;
R123f.x = mul_nonIEEE(R127f.w,R127f.w) + PV1fz;
R123f.x = clamp(R123f.x, 0.0, 1.0);
PV0fy = mul_nonIEEE(backupReg0f, PS1f);
PV0fz = mul_nonIEEE(R123f.y, PS1f);
PV0fw = mul_nonIEEE(R123f.w, PS1f);
R126f.x = 63.75 * R4f.x;
// 3
R127f.x = (mul_nonIEEE(R3f.y,R127f.y) + PV0fz)/2.0;
PV1fy = -(R123f.x) + 1.0;
R127f.z = (mul_nonIEEE(R3f.x,R127f.y) + PV0fy)/2.0;
R127f.w = (mul_nonIEEE(R3f.z,R127f.y) + PV0fw)/2.0;
R127f.y = 63.75 * R5f.z;
// 4
R125f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].y), R0f.w);
R126f.y = intBitsToFloat(0x3c808081);
R126f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), R0f.w);
R126f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].z), R0f.w);
PS0f = sqrt(PV1fy);
PS0f /= 2.0;
// 5
backupReg0f = R127f.x;
backupReg1f = R127f.z;
R127f.x = intBitsToFloat(uf_remappedPS[1].z);
R125f.y = mul_nonIEEE(R2f.z,PS0f) + R127f.w;
R127f.z = mul_nonIEEE(R2f.y,PS0f) + backupReg0f;
R127f.w = mul_nonIEEE(R2f.x,PS0f) + backupReg1f;
R125f.z = floor(R126f.x);
R125f.z *= 4.0;
// 6
backupReg0f = R125f.x;
R125f.x = floor(R127f.y);
R125f.x *= 4.0;
R2f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].x), backupReg0f);
R2f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].x), R126f.w);
R3f.w = 1.0;
R2f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].x), R126f.z);
// 7
backupReg0f = R1f.x;
R1f.x = mul_nonIEEE(backupReg0f, R0f.x);
R1f.y = mul_nonIEEE(backupReg0f, R0f.y);
R1f.z = mul_nonIEEE(backupReg0f, R0f.z);
R2f.w = 1.0;
R3f.x = R126f.y;
// 8
R0f.x = R127f.w + 0.5;
R3f.y = R127f.x;
R0f.z = R125f.y + 0.5;
R1f.w = R125f.z * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081);
R0f.y = R127f.z + 0.5;
// 9
R0f.w = R125f.x * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081);
// 10
R7f.x = R2f.x;
R7f.y = R2f.y;
R7f.z = R2f.z;
R7f.w = R2f.w;
// 11
R6f.x = R0f.x;
R6f.y = R0f.y;
R6f.z = R0f.z;
R6f.w = R0f.w;
// 12
R5f.x = R1f.x;
R5f.y = R1f.y;
R5f.z = R1f.z;
R5f.w = R1f.w;
// 13
R4f.x = R3f.x;
R4f.y = R3f.y;
R4f.z = R3f.z;
R4f.w = R3f.w;
// export
passPixelColor0 = vec4(R4f.x, R4f.y, R4f.z, R4f.w);
passPixelColor1 = vec4(R5f.x, R5f.y, R5f.z, R5f.w);
passPixelColor3 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
passPixelColor5 = vec4(R7f.x, R7f.y, R7f.z, R7f.w);
}
