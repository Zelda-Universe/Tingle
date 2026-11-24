#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 1d2195d33a479d61
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
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
R4f.xyz = (texture(textureUnitPS6, vec2(R0f.z,R0f.w)).xyz);
R6f.xyzw = (texture(textureUnitPS5, vec2(R0f.z,R0f.w)).xyzw);
R0f.xyz = (texture(textureUnitPS3, vec2(R0f.x,R0f.y)).xyz);
// 0
R126f.x = R5f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R126f.y = R5f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R127f.z = R4f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R127f.w = R4f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
PS0f = R1f.w + -(0.5);
PS0f *= 2.0;
PS0f = clamp(PS0f, 0.0, 1.0);
// 1
PV1fx = -(PS0f) + 1.0;
PV1fy = mul_nonIEEE(R127f.w, R127f.w);
PV1fz = R6f.w + -(1.0);
PV1fw = mul_nonIEEE(R126f.y, R126f.y);
R126f.z = R1f.w;
R126f.z *= 2.0;
R126f.z = clamp(R126f.z, 0.0, 1.0);
// 2
R123f.x = mul_nonIEEE(R127f.z,R127f.z) + PV1fy;
R123f.x = clamp(R123f.x, 0.0, 1.0);
R127f.y = -(R126f.y) + R127f.w;
R123f.z = mul_nonIEEE(R126f.x,R126f.x) + PV1fw;
R123f.z = clamp(R123f.z, 0.0, 1.0);
R123f.w = mul_nonIEEE(PV1fz,PV1fx) + 1.0;
R127f.x = -(R126f.x) + R127f.z;
// 3
PV1fx = mul_nonIEEE(R2f.y, R3f.z);
PV1fy = -(R123f.z) + 1.0;
R127f.z = mul_nonIEEE(R126f.z, R123f.w);
R127f.w = -(R123f.x) + 1.0;
R126f.z = mul_nonIEEE(R2f.z, R3f.x);
// 4
backupReg0f = R126f.x;
R126f.x = mul_nonIEEE(R127f.y,R127f.z) + R126f.y;
R127f.y = mul_nonIEEE(R127f.x,R127f.z) + backupReg0f;
R125f.z = mul_nonIEEE(-(R3f.y),R2f.z) + PV1fx;
PV0fw = mul_nonIEEE(R2f.x, R3f.y);
R127f.x = sqrt(PV1fy);
// 5
backupReg0f = R127f.w;
R125f.x = mul_nonIEEE(-(R3f.z),R2f.x) + R126f.z;
PV1fy = -(R0f.y) + R6f.y;
R7f.z = 1.0;
R127f.w = mul_nonIEEE(-(R3f.x),R2f.y) + PV0fw;
PS1f = sqrt(backupReg0f);
// 6
PV0fx = -(R5f.z) + R4f.z;
PV0fy = -(R0f.x) + R6f.x;
R123f.z = mul_nonIEEE(PV1fy,R127f.z) + R0f.y;
PV0fw = -(R127f.x) + PS1f;
R7f.x = intBitsToFloat(0x3c808081);
// 7
backupReg0f = R127f.x;
R127f.x = mul_nonIEEE(PV0fx,R127f.z) + R5f.z;
R126f.y = mul_nonIEEE(PV0fy,R127f.z) + R0f.x;
R126f.z = mul_nonIEEE(PV0fw,R127f.z) + backupReg0f;
R7f.w = 0.0;
R5f.y = mul_nonIEEE(R1f.x, R123f.z);
// 8
tempf.x = dot(vec4(R126f.x,R127f.y,R126f.z,intBitsToFloat(0x80000000)),vec4(R126f.x,R127f.y,R126f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = -(R0f.z) + R6f.z;
// 9
backupReg0f = R127f.x;
R127f.x = mul_nonIEEE(PS0f,R127f.z) + R0f.z;
PV1fy = backupReg0f * 63.75;
R5f.w = 0.0;
tempResultf = 1.0 / sqrt(PV0fx);
PS1f = tempResultf;
// 10
PV0fx = mul_nonIEEE(R127f.y, PS1f);
R127f.y = mul_nonIEEE(R126f.x, PS1f);
R126f.z = mul_nonIEEE(R126f.z, PS1f);
PV0fw = floor(PV1fy);
PV0fw *= 4.0;
R5f.x = mul_nonIEEE(R1f.x, R126f.y);
// 11
R5f.z = mul_nonIEEE(R1f.x, R127f.x);
PV1fw = mul_nonIEEE(R3f.w, PV0fx);
R1f.w = PV0fw * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081);
// 12
PV0fx = mul_nonIEEE(R125f.x, PV1fw);
PV0fy = mul_nonIEEE(R125f.z, PV1fw);
PV0fz = mul_nonIEEE(R127f.w, PV1fw);
// 13
R123f.x = mul_nonIEEE(R3f.z,R127f.y) + PV0fz;
R123f.y = mul_nonIEEE(R3f.y,R127f.y) + PV0fx;
R123f.w = mul_nonIEEE(R3f.x,R127f.y) + PV0fy;
// 14
R123f.x = (mul_nonIEEE(R2f.z,R126f.z) + R123f.x)/2.0;
R123f.z = (mul_nonIEEE(R2f.x,R126f.z) + R123f.w)/2.0;
R123f.w = (mul_nonIEEE(R2f.y,R126f.z) + R123f.y)/2.0;
// 15
R1f.x = R123f.z + 0.5;
R1f.y = R123f.w + 0.5;
R1f.z = R123f.x + 0.5;
// 16
R2f.x = R1f.x;
R2f.y = R1f.y;
R2f.z = R1f.z;
R2f.w = R1f.w;
// 17
R1f.x = R5f.x;
R1f.y = R5f.y;
R1f.z = R5f.z;
R1f.w = R5f.w;
// 18
R0f.x = R7f.x;
R0f.y = R7f.w;
R0f.z = R7f.z;
R0f.w = R7f.z;
// export
passPixelColor0 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
passPixelColor1 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
passPixelColor3 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
}
