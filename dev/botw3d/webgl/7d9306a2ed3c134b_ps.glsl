#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 7d9306a2ed3c134b
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[3];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(3, 1, 0) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 1) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(5, 1, 2) uniform sampler2D textureUnitPS5;
TEXTURE_LAYOUT(7, 1, 3) uniform sampler2D textureUnitPS7;
in vec4 passParameterSem0;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem5;
in vec4 passParameterSem7;
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
vec4 R10f = vec4(0.0);
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
R4f.x = (texture(textureUnitPS7, vec2(R4f.x,R4f.y)).x);
R0f.w = (texture(textureUnitPS5, vec2(R0f.x,R0f.y)).x);
R6f.xyzw = (texture(textureUnitPS3, vec2(R0f.x,R0f.y)).xyzw);
// 0
PV0fx = mul_nonIEEE(R1f.x, R2f.y);
PV0fy = mul_nonIEEE(R1f.y, R2f.z);
PV0fz = mul_nonIEEE(R1f.z, R2f.x);
R127f.w = R5f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R127f.z = R5f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
// 1
PV1fx = mul_nonIEEE(R127f.w, R127f.w);
R123f.y = mul_nonIEEE(-(R2f.z),R1f.x) + PV0fz;
R123f.z = mul_nonIEEE(-(R2f.x),R1f.y) + PV0fx;
R123f.w = mul_nonIEEE(-(R2f.y),R1f.z) + PV0fy;
PS1f = mul_nonIEEE(R2f.w, R127f.z);
// 2
backupReg0f = R123f.y;
PV0fx = mul_nonIEEE(R123f.w, PS1f);
R123f.y = mul_nonIEEE(R127f.z,R127f.z) + PV1fx;
R123f.y = clamp(R123f.y, 0.0, 1.0);
PV0fz = mul_nonIEEE(R123f.z, PS1f);
PV0fw = mul_nonIEEE(backupReg0f, PS1f);
R126f.y = R5f.z * 63.75;
// 3
R127f.x = (mul_nonIEEE(R2f.x,R127f.w) + PV0fx)/2.0;
R127f.y = (mul_nonIEEE(R2f.y,R127f.w) + PV0fw)/2.0;
R127f.z = (mul_nonIEEE(R2f.z,R127f.w) + PV0fz)/2.0;
PV1fw = -(R123f.y) + 1.0;
R126f.w = mul_nonIEEE(R3f.x, R4f.x);
// 4
R126f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), R0f.w);
R125f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].z), R0f.w);
R126f.z = intBitsToFloat(0x3c808081);
R127f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].y), R0f.w);
PS0f = sqrt(PV1fw);
PS0f /= 2.0;
// 5
backupReg0f = R127f.x;
R127f.x = mul_nonIEEE(R1f.y,PS0f) + R127f.y;
R127f.y = mul_nonIEEE(R1f.z,PS0f) + R127f.z;
R127f.z = mul_nonIEEE(R1f.x,PS0f) + backupReg0f;
R125f.w = intBitsToFloat(uf_remappedPS[1].z);
R125f.x = floor(R126f.y);
R125f.x *= 4.0;
// 6
R1f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].x), R126f.x);
R1f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].x), R127f.w);
R1f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].x), R125f.y);
R2f.w = R6f.w;
R0f.x = mul_nonIEEE(R6f.x, R126f.w);
// 7
R2f.x = R126f.z;
R0f.y = mul_nonIEEE(R6f.y, R126f.w);
R0f.z = mul_nonIEEE(R6f.z, R126f.w);
R1f.w = 1.0;
R2f.y = R125f.w;
// 8
R6f.x = R127f.z + 0.5;
R6f.y = R127f.x + 0.5;
R6f.z = R127f.y + 0.5;
R0f.w = intBitsToFloat(0x3b808081);
R6f.w = R125f.x * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081);
// 9
R10f.x = R1f.x;
R10f.y = R1f.y;
R10f.z = R1f.z;
R10f.w = R1f.w;
// 10
R9f.x = R6f.x;
R9f.y = R6f.y;
R9f.z = R6f.z;
R9f.w = R6f.w;
// 11
R8f.x = R0f.x;
R8f.y = R0f.y;
R8f.z = R0f.z;
R8f.w = R0f.w;
// 12
R7f.x = R2f.x;
R7f.y = R2f.y;
R7f.z = R2f.z;
R7f.w = R2f.w;
// export
if( ((vec4(R7f.x, R7f.y, R7f.z, R7f.w)).a >= uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R7f.x, R7f.y, R7f.z, R7f.w);
passPixelColor1 = vec4(R8f.x, R8f.y, R8f.z, R8f.w);
passPixelColor3 = vec4(R9f.x, R9f.y, R9f.z, R9f.w);
passPixelColor5 = vec4(R10f.x, R10f.y, R10f.z, R10f.w);
}
