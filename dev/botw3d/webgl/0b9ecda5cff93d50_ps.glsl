#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 0b9ecda5cff93d50
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[4];
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
vec4 R8f = vec4(0.0);
vec4 R123f = vec4(0.0);
vec4 R124f = vec4(0.0);
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
R4f.xyz = (texture(textureUnitPS4, vec2(R0f.x,R0f.y)).xyz);
R5f.xw = (texture(textureUnitPS5, vec2(R0f.x,R0f.y)).xw);
R0f.xyz = (texture(textureUnitPS3, vec2(R0f.x,R0f.y)).xyz);
// 0
PV0fx = mul_nonIEEE(R2f.x, R3f.y);
PV0fy = mul_nonIEEE(R2f.y, R3f.z);
R127f.z = R4f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
PV0fw = mul_nonIEEE(R2f.z, R3f.x);
R127f.y = R4f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
// 1
PV1fx = mul_nonIEEE(R127f.z, R127f.z);
R123f.y = mul_nonIEEE(-(R3f.y),R2f.z) + PV0fy;
R123f.z = mul_nonIEEE(-(R3f.z),R2f.x) + PV0fw;
R123f.w = mul_nonIEEE(-(R3f.x),R2f.y) + PV0fx;
PS1f = mul_nonIEEE(R3f.w, R127f.y);
// 2
PV0fx = mul_nonIEEE(R123f.y, PS1f);
PV0fy = mul_nonIEEE(R123f.w, PS1f);
PV0fz = mul_nonIEEE(R123f.z, PS1f);
R123f.w = mul_nonIEEE(R127f.y,R127f.y) + PV1fx;
R123f.w = clamp(R123f.w, 0.0, 1.0);
R126f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), R5f.w);
// 3
R127f.x = (mul_nonIEEE(R3f.x,R127f.z) + PV0fx)/2.0;
R127f.y = (mul_nonIEEE(R3f.z,R127f.z) + PV0fy)/2.0;
PV1fz = -(R123f.w) + 1.0;
R127f.w = (mul_nonIEEE(R3f.y,R127f.z) + PV0fz)/2.0;
R127f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].y), R5f.w);
// 4
R125f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].y), R5f.x);
R126f.y = R4f.z * 63.75;
R126f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].x), R5f.x);
R126f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].z), R5f.w);
PS0f = sqrt(PV1fz);
PS0f /= 2.0;
// 5
backupReg0f = R127f.y;
backupReg1f = R127f.z;
R124f.x = mul_nonIEEE(R2f.y,PS0f) + R127f.w;
R127f.y = mul_nonIEEE(R2f.x,PS0f) + R127f.x;
R127f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z), R5f.x);
R127f.w = mul_nonIEEE(R2f.z,PS0f) + backupReg0f;
R127f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].y), backupReg1f);
// 6
backupReg0f = R126f.x;
R126f.x = intBitsToFloat(uf_remappedPS[3].z);
PV0fy = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].y), backupReg0f);
R125f.z = intBitsToFloat(0x3c808081);
PV0fw = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].y), R126f.w);
R2f.x = floor(R126f.y);
R2f.x *= 4.0;
// 7
R5f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].x),R126f.z) + PV0fy;
R5f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].x),R125f.x) + R127f.x;
R5f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].x),R127f.z) + PV0fw;
R3f.w = 1.0;
R4f.y = mul_nonIEEE(R1f.x, R0f.y);
// 8
R4f.x = mul_nonIEEE(R1f.x, R0f.x);
R3f.y = R126f.x;
R4f.z = mul_nonIEEE(R1f.x, R0f.z);
R5f.w = 1.0;
R3f.x = R125f.z;
// 9
backupReg0f = R2f.x;
R2f.x = R127f.y + 0.5;
R2f.y = R124f.x + 0.5;
R2f.z = R127f.w + 0.5;
R4f.w = intBitsToFloat(0x3b808081);
R2f.w = backupReg0f * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081);
// 10
R8f.x = R5f.x;
R8f.y = R5f.y;
R8f.z = R5f.z;
R8f.w = R5f.w;
// 11
R7f.x = R2f.x;
R7f.y = R2f.y;
R7f.z = R2f.z;
R7f.w = R2f.w;
// 12
R6f.x = R4f.x;
R6f.y = R4f.y;
R6f.z = R4f.z;
R6f.w = R4f.w;
// 13
R5f.x = R3f.x;
R5f.y = R3f.y;
R5f.z = R3f.z;
R5f.w = R3f.w;
// export
passPixelColor0 = vec4(R5f.x, R5f.y, R5f.z, R5f.w);
passPixelColor1 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
passPixelColor3 = vec4(R7f.x, R7f.y, R7f.z, R7f.w);
passPixelColor5 = vec4(R8f.x, R8f.y, R8f.z, R8f.w);
}
