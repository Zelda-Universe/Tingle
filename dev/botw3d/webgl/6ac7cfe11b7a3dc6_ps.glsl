#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 6ac7cfe11b7a3dc6
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[1];
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
vec4 R122f = vec4(0.0);
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
R5f.xyz = (texture(textureUnitPS4, vec2(R0f.x,R0f.y)).xyz);
R4f.xyz = (texture(textureUnitPS6, vec2(R0f.z,R0f.w)).xyz);
R6f.xyzw = (texture(textureUnitPS5, vec2(R0f.z,R0f.w)).xyzw);
R0f.xyz = (texture(textureUnitPS3, vec2(R0f.x,R0f.y)).xyz);
// 0
R127f.x = R4f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R127f.y = R4f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R126f.z = R5f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R126f.w = R5f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
PS0f = R1f.w + -(0.5);
PS0f *= 2.0;
PS0f = clamp(PS0f, 0.0, 1.0);
// 1
PV1fx = -(PS0f) + 1.0;
PV1fy = mul_nonIEEE(R126f.w, R126f.w);
PV1fz = R6f.w + -(1.0);
PV1fw = mul_nonIEEE(R127f.y, R127f.y);
R126f.x = R1f.w;
R126f.x *= 2.0;
R126f.x = clamp(R126f.x, 0.0, 1.0);
// 2
R123f.x = mul_nonIEEE(R126f.z,R126f.z) + PV1fy;
R123f.x = clamp(R123f.x, 0.0, 1.0);
R123f.y = mul_nonIEEE(PV1fz,PV1fx) + 1.0;
R123f.z = mul_nonIEEE(R127f.x,R127f.x) + PV1fw;
R123f.z = clamp(R123f.z, 0.0, 1.0);
R127f.w = -(R126f.w) + R127f.y;
R127f.z = -(R126f.z) + R127f.x;
// 3
R126f.x = mul_nonIEEE(R126f.x, R123f.y);
R127f.y = -(R123f.z) + 1.0;
PV1fz = mul_nonIEEE(R2f.y, R3f.z);
PV1fw = -(R123f.x) + 1.0;
R126f.y = mul_nonIEEE(R2f.z, R3f.x);
// 4
R125f.x = mul_nonIEEE(R127f.w,R126f.x) + R126f.w;
R125f.y = mul_nonIEEE(R127f.z,R126f.x) + R126f.z;
PV0fz = mul_nonIEEE(R2f.x, R3f.y);
R125f.w = mul_nonIEEE(-(R3f.y),R2f.z) + PV1fz;
R127f.z = sqrt(PV1fw);
// 5
R124f.x = mul_nonIEEE(-(R3f.x),R2f.y) + PV0fz;
PV1fy = -(R5f.z) + R4f.z;
R126f.z = intBitsToFloat(0x3c808081);
R124f.w = mul_nonIEEE(-(R3f.z),R2f.x) + R126f.y;
PS1f = sqrt(R127f.y);
// 6
R123f.x = mul_nonIEEE(PV1fy,R126f.x) + R5f.z;
PV0fy = -(R0f.x) + R6f.x;
PV0fz = -(R0f.y) + R6f.y;
PV0fw = -(R127f.z) + PS1f;
R125f.z = intBitsToFloat(uf_remappedPS[0].z);
// 7
R127f.x = R123f.x * 63.75;
PV1fy = -(R0f.z) + R6f.z;
R127f.z = mul_nonIEEE(PV0fw,R126f.x) + R127f.z;
R126f.w = mul_nonIEEE(PV0fy,R126f.x) + R0f.x;
R127f.w = mul_nonIEEE(PV0fz,R126f.x) + R0f.y;
// 8
tempf.x = dot(vec4(R125f.x,R125f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(R125f.x,R125f.y,R127f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R122f.x = mul_nonIEEE(PV1fy,R126f.x) + R0f.z;
// 9
R127f.x = floor(R127f.x);
R127f.x *= 4.0;
R0f.y = mul_nonIEEE(R1f.x, R127f.w);
R0f.z = mul_nonIEEE(R1f.x, R122f.x);
R6f.w = 1.0;
tempResultf = 1.0 / sqrt(PV0fx);
PS1f = tempResultf;
// 10
backupReg0f = R125f.y;
R0f.x = mul_nonIEEE(R1f.x, R126f.w);
R125f.y = mul_nonIEEE(R127f.z, PS1f);
R127f.z = mul_nonIEEE(R125f.x, PS1f);
PV0fw = mul_nonIEEE(backupReg0f, PS1f);
R6f.x = R126f.z;
// 11
PV1fx = mul_nonIEEE(R3f.w, PV0fw);
R6f.y = R125f.z;
R0f.w = 0.0;
R1f.w = R127f.x * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081);
// 12
PV0fy = mul_nonIEEE(R124f.x, PV1fx);
PV0fz = mul_nonIEEE(R125f.w, PV1fx);
PV0fw = mul_nonIEEE(R124f.w, PV1fx);
// 13
R123f.x = mul_nonIEEE(R3f.x,R127f.z) + PV0fz;
R123f.z = mul_nonIEEE(R3f.y,R127f.z) + PV0fw;
R123f.w = mul_nonIEEE(R3f.z,R127f.z) + PV0fy;
// 14
backupReg0f = R123f.x;
R123f.x = (mul_nonIEEE(R2f.y,R125f.y) + R123f.z)/2.0;
R123f.y = (mul_nonIEEE(R2f.x,R125f.y) + backupReg0f)/2.0;
R123f.z = (mul_nonIEEE(R2f.z,R125f.y) + R123f.w)/2.0;
// 15
R1f.x = R123f.y + 0.5;
R1f.y = R123f.x + 0.5;
R1f.z = R123f.z + 0.5;
// 16
R3f.x = R1f.x;
R3f.y = R1f.y;
R3f.z = R1f.z;
R3f.w = R1f.w;
// 17
R2f.x = R0f.x;
R2f.y = R0f.y;
R2f.z = R0f.z;
R2f.w = R0f.w;
// 18
R1f.x = R6f.x;
R1f.y = R6f.y;
R1f.z = R6f.z;
R1f.w = R6f.w;
// export
passPixelColor0 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
passPixelColor1 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
passPixelColor3 = vec4(R3f.x, R3f.y, R3f.z, R3f.w);
}
