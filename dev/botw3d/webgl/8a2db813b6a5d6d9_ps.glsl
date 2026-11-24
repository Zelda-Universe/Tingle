#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 8a2db813b6a5d6d9
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[1];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(3, 1, 0) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 1) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(7, 1, 2) uniform sampler2D textureUnitPS7;
in vec4 passParameterSem0;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem5;
in vec4 passParameterSem7;
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
R1f = passParameterSem3;
R2f = passParameterSem4;
R3f = passParameterSem5;
R4f = passParameterSem7;
R5f.xyz = (texture(textureUnitPS4, vec2(R0f.x,R0f.y)).xyz);
R0f.w = (texture(textureUnitPS7, vec2(R4f.x,R4f.y)).x);
R0f.xyz = (texture(textureUnitPS3, vec2(R0f.x,R0f.y)).xyz);
// 0
PV0fx = mul_nonIEEE(R1f.y, R2f.z);
PV0fy = mul_nonIEEE(R1f.z, R2f.x);
PV0fz = mul_nonIEEE(R1f.x, R2f.y);
R127f.w = R5f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R127f.z = R5f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
// 1
R123f.x = mul_nonIEEE(-(R2f.y),R1f.z) + PV0fx;
PV1fy = mul_nonIEEE(R127f.w, R127f.w);
R123f.z = mul_nonIEEE(-(R2f.z),R1f.x) + PV0fy;
R123f.w = mul_nonIEEE(-(R2f.x),R1f.y) + PV0fz;
PS1f = mul_nonIEEE(R2f.w, R127f.z);
// 2
backupReg0f = R123f.x;
R123f.x = mul_nonIEEE(R127f.z,R127f.z) + PV1fy;
R123f.x = clamp(R123f.x, 0.0, 1.0);
PV0fy = mul_nonIEEE(backupReg0f, PS1f);
PV0fz = mul_nonIEEE(R123f.w, PS1f);
PV0fw = mul_nonIEEE(R123f.z, PS1f);
R127f.y = R5f.z * 63.75;
// 3
R127f.x = (mul_nonIEEE(R2f.y,R127f.w) + PV0fw)/2.0;
R126f.y = (mul_nonIEEE(R2f.x,R127f.w) + PV0fy)/2.0;
R127f.z = (mul_nonIEEE(R2f.z,R127f.w) + PV0fz)/2.0;
PV1fw = -(R123f.x) + 1.0;
R126f.z = mul_nonIEEE(R3f.x, R0f.w);
// 4
backupReg0f = R126f.z;
R126f.x = floor(R127f.y);
R126f.x *= 4.0;
R2f.y = mul_nonIEEE(R0f.y, backupReg0f);
R125f.z = intBitsToFloat(uf_remappedPS[0].z);
R127f.w = intBitsToFloat(0x3c808081);
PS0f = sqrt(PV1fw);
PS0f /= 2.0;
// 5
backupReg0f = R127f.x;
backupReg1f = R126f.y;
R127f.x = mul_nonIEEE(R1f.z,PS0f) + R127f.z;
R126f.y = mul_nonIEEE(R1f.y,PS0f) + backupReg0f;
R123f.z = mul_nonIEEE(R1f.x,PS0f) + backupReg1f;
R1f.w = 1.0;
R2f.x = mul_nonIEEE(R0f.x, R126f.z);
// 6
R1f.x = R127f.w;
R1f.y = R125f.z;
R2f.z = mul_nonIEEE(R0f.z, R126f.z);
R2f.w = 0.0;
R0f.x = R123f.z + 0.5;
// 7
R0f.y = R126f.y + 0.5;
R0f.z = R127f.x + 0.5;
R0f.w = R126f.x * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081);
// 8
R5f.x = R0f.x;
R5f.y = R0f.y;
R5f.z = R0f.z;
R5f.w = R0f.w;
// 9
R4f.x = R2f.x;
R4f.y = R2f.y;
R4f.z = R2f.z;
R4f.w = R2f.w;
// 10
R3f.x = R1f.x;
R3f.y = R1f.y;
R3f.z = R1f.z;
R3f.w = R1f.w;
// export
passPixelColor0 = vec4(R3f.x, R3f.y, R3f.z, R3f.w);
passPixelColor1 = vec4(R4f.x, R4f.y, R4f.z, R4f.w);
passPixelColor3 = vec4(R5f.x, R5f.y, R5f.z, R5f.w);
}
