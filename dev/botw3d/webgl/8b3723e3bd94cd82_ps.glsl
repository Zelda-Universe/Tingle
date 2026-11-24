#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 8b3723e3bd94cd82
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
TEXTURE_LAYOUT(6, 1, 3) uniform sampler2D textureUnitPS6;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem5;
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
R1f = passParameterSem1;
R2f = passParameterSem3;
R3f = passParameterSem4;
R4f = passParameterSem5;
R5f.xyz = (texture(textureUnitPS4, vec2(R0f.x,R0f.y)).xyz);
R1f.w = (texture(textureUnitPS5, vec2(R0f.z,R0f.w)).x);
R1f.xyz = (texture(textureUnitPS6, vec2(R1f.x,R1f.y)).xyz);
R0f.xyz = (texture(textureUnitPS3, vec2(R0f.x,R0f.y)).xyz);
// 0
R126f.x = R5f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
PV0fy = mul_nonIEEE(R2f.y, R3f.z);
PV0fz = mul_nonIEEE(R2f.z, R3f.x);
PV0fw = mul_nonIEEE(R2f.x, R3f.y);
R127f.w = R5f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
// 1
backupReg0f = R127f.w;
R127f.x = mul_nonIEEE(-(R3f.x),R2f.y) + PV0fw;
R127f.y = mul_nonIEEE(-(R3f.z),R2f.x) + PV0fz;
PV1fz = mul_nonIEEE(R126f.x, R126f.x);
R123f.w = mul_nonIEEE(-(R3f.y),R2f.z) + PV0fy;
R127f.z = mul_nonIEEE(R3f.w, backupReg0f);
// 2
PV0fx = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), R1f.w);
R123f.y = mul_nonIEEE(R127f.w,R127f.w) + PV1fz;
R123f.y = clamp(R123f.y, 0.0, 1.0);
R126f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].y), R1f.w);
R127f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].z), R1f.w);
PS0f = mul_nonIEEE(R123f.w, R127f.z);
// 3
backupReg0f = R127f.z;
PV1fx = -(R123f.y) + 1.0;
PV1fy = mul_nonIEEE(R127f.y, backupReg0f);
R127f.z = (mul_nonIEEE(R3f.x,R126f.x) + PS0f)/2.0;
PV1fw = mul_nonIEEE(R127f.x, backupReg0f);
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].x), PV0fx);
// 4
backupReg0f = R126f.x;
R126f.x = (mul_nonIEEE(R3f.z,backupReg0f) + PV1fw)/2.0;
R123f.y = (mul_nonIEEE(R3f.y,backupReg0f) + PV1fy)/2.0;
PV0fz = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].x), R126f.z);
PV0fw = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].x), R127f.w);
R127f.w = sqrt(PV1fx);
R127f.w /= 2.0;
// 5
backupReg0f = R127f.w;
backupReg1f = R127f.z;
R127f.x = mul_nonIEEE(-(R4f.y),PV0fz) + PV0fz;
R126f.y = R5f.z * 63.75;
R127f.z = mul_nonIEEE(-(R4f.z),PV0fw) + PV0fw;
R126f.w = mul_nonIEEE(R2f.x,backupReg0f) + backupReg1f;
R126f.z = mul_nonIEEE(R2f.y,backupReg0f) + R123f.y;
// 6
PV0fx = intBitsToFloat(uf_remappedPS[1].y) + R1f.x;
PV0fy = intBitsToFloat(uf_remappedPS[1].y) + R1f.y;
R125f.z = mul_nonIEEE(R2f.z,R127f.w) + R126f.x;
R123f.w = mul_nonIEEE(-(R4f.x),R127f.y) + R127f.y;
PS0f = intBitsToFloat(uf_remappedPS[1].y) + R1f.z;
// 7
backupReg0f = R127f.x;
R127f.x = floor(R126f.y);
R127f.x *= 4.0;
R1f.y = mul_nonIEEE(backupReg0f, PV0fy);
R1f.z = mul_nonIEEE(R127f.z, PS0f);
R2f.w = 1.0;
R1f.x = mul_nonIEEE(R123f.w, PV0fx);
// 8
backupReg0f = R4f.x;
R4f.x = mul_nonIEEE(backupReg0f, R0f.x);
R4f.y = mul_nonIEEE(backupReg0f, R0f.y);
R4f.z = mul_nonIEEE(backupReg0f, R0f.z);
R1f.w = 1.0;
R2f.x = intBitsToFloat(0x3c808081);
// 9
R0f.x = R126f.w + 0.5;
R2f.y = 0.0;
R0f.z = R125f.z + 0.5;
R4f.w = intBitsToFloat(0x3b808081);
R0f.y = R126f.z + 0.5;
// 10
R0f.w = R127f.x * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081);
// 11
R8f.x = R1f.x;
R8f.y = R1f.y;
R8f.z = R1f.z;
R8f.w = R1f.w;
// 12
R7f.x = R0f.x;
R7f.y = R0f.y;
R7f.z = R0f.z;
R7f.w = R0f.w;
// 13
R6f.x = R4f.x;
R6f.y = R4f.y;
R6f.z = R4f.z;
R6f.w = R4f.w;
// 14
R5f.x = R2f.x;
R5f.y = R2f.y;
R5f.z = R2f.z;
R5f.w = R2f.w;
// export
passPixelColor0 = vec4(R5f.x, R5f.y, R5f.z, R5f.w);
passPixelColor1 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
passPixelColor3 = vec4(R7f.x, R7f.y, R7f.z, R7f.w);
passPixelColor5 = vec4(R8f.x, R8f.y, R8f.z, R8f.w);
}
