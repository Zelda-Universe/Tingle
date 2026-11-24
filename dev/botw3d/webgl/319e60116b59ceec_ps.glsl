#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 319e60116b59ceec
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
in vec4 passParameterSem6;
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
vec4 R8f = vec4(0.0);
vec4 R9f = vec4(0.0);
vec4 R122f = vec4(0.0);
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
R4f = passParameterSem6;
R5f.xyz = (texture(textureUnitPS4, vec2(R0f.x,R0f.y)).xyz);
R0f.w = (texture(textureUnitPS5, vec2(R0f.x,R0f.y)).x);
R0f.xyz = (texture(textureUnitPS3, vec2(R0f.x,R0f.y)).xyz);
// 0
R126f.x = R5f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
PV0fy = mul_nonIEEE(R2f.y, R3f.z);
PV0fz = mul_nonIEEE(R2f.z, R3f.x);
PV0fw = mul_nonIEEE(R2f.x, R3f.y);
R127f.w = R5f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
// 1
R127f.x = mul_nonIEEE(-(R3f.y),R2f.z) + PV0fy;
R127f.y = mul_nonIEEE(-(R3f.z),R2f.x) + PV0fz;
PV1fz = mul_nonIEEE(R126f.x, R126f.x);
R126f.w = mul_nonIEEE(-(R3f.x),R2f.y) + PV0fw;
R122f.x = mul_nonIEEE(-(R4f.z),intBitsToFloat(uf_remappedPS[0].x)) + -(intBitsToFloat(uf_remappedPS[0].y));
R122f.x = clamp(R122f.x, 0.0, 1.0);
// 2
R125f.x = R5f.z * 63.75;
R123f.y = mul_nonIEEE(R127f.w,R127f.w) + PV1fz;
R123f.y = clamp(R123f.y, 0.0, 1.0);
PV0fz = mul_nonIEEE(R3f.w, R127f.w);
R127f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].z),R122f.x) + 1.0;
R5f.x = mul_nonIEEE(R1f.x, R0f.x);
// 3
backupReg0f = R127f.x;
R127f.x = -(R123f.y) + 1.0;
PV1fy = mul_nonIEEE(backupReg0f, PV0fz);
PV1fz = mul_nonIEEE(R127f.y, PV0fz);
PV1fw = mul_nonIEEE(R126f.w, PV0fz);
R127f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].x), R127f.w);
// 4
backupReg0f = R126f.x;
R126f.x = (mul_nonIEEE(R3f.z,backupReg0f) + PV1fw)/2.0;
R127f.y = (mul_nonIEEE(R3f.y,backupReg0f) + PV1fz)/2.0;
R126f.z = (mul_nonIEEE(R3f.x,backupReg0f) + PV1fy)/2.0;
PV0fw = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].y), R127f.w);
PS0f = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z), R127f.w);
// 5
backupReg0f = R127f.x;
R127f.x = floor(R125f.x);
R127f.x *= 4.0;
R126f.y = mul_nonIEEE(R0f.w, PS0f);
PV1fz = mul_nonIEEE(R0f.w, R127f.z);
PV1fw = mul_nonIEEE(R0f.w, PV0fw);
PS1f = sqrt(backupReg0f);
PS1f /= 2.0;
// 6
backupReg0f = R2f.y;
backupReg1f = R126f.z;
R126f.x = mul_nonIEEE(R2f.z,PS1f) + R126f.x;
R2f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w), PV1fw);
R126f.z = mul_nonIEEE(backupReg0f,PS1f) + R127f.y;
R127f.w = mul_nonIEEE(R2f.x,PS1f) + backupReg1f;
R2f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w), PV1fz);
// 7
backupReg0f = R1f.x;
R1f.x = intBitsToFloat(0x3c808081);
R5f.y = mul_nonIEEE(backupReg0f, R0f.y);
R2f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w), R126f.y);
R1f.w = 1.0;
R5f.z = mul_nonIEEE(backupReg0f, R0f.z);
// 8
R0f.x = R127f.w + 0.5;
R1f.y = 0.0;
R0f.z = R126f.x + 0.5;
R2f.w = 1.0;
R0f.y = R126f.z + 0.5;
// 9
R5f.w = intBitsToFloat(0x3b808081);
R0f.w = R127f.x * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081);
// 10
R9f.x = R2f.x;
R9f.y = R2f.y;
R9f.z = R2f.z;
R9f.w = R2f.w;
// 11
R8f.x = R0f.x;
R8f.y = R0f.y;
R8f.z = R0f.z;
R8f.w = R0f.w;
// 12
R7f.x = R5f.x;
R7f.y = R5f.y;
R7f.z = R5f.z;
R7f.w = R5f.w;
// 13
R6f.x = R1f.x;
R6f.y = R1f.y;
R6f.z = R1f.z;
R6f.w = R1f.w;
// export
passPixelColor0 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
passPixelColor1 = vec4(R7f.x, R7f.y, R7f.z, R7f.w);
passPixelColor3 = vec4(R8f.x, R8f.y, R8f.z, R8f.w);
passPixelColor5 = vec4(R9f.x, R9f.y, R9f.z, R9f.w);
}
