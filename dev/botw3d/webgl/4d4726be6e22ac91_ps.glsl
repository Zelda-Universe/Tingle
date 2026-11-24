#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 4d4726be6e22ac91
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[3];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(3, 1, 0) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 1) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(7, 1, 2) uniform sampler2DArray textureUnitPS7;
TEXTURE_LAYOUT(8, 1, 3) uniform sampler2DArray textureUnitPS8;
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
vec4 R8f = vec4(0.0);
vec4 R9f = vec4(0.0);
vec4 R10f = vec4(0.0);
vec4 R11f = vec4(0.0);
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
R5f.xyz = (texture(textureUnitPS4, vec2(R0f.z,R0f.w)).xyz);
R6f.xyz = (texture(textureUnitPS3, vec2(R0f.z,R0f.w)).xyz);
// 0
R127f.x = intBitsToFloat(uf_remappedPS[0].z);
R1f.y = R5f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R1f.z = R5f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
PV0fw = intBitsToFloat(uf_remappedPS[1].z);
R8f.x = -(R1f.w) + 1.0;
// 1
PV1fx = mul_nonIEEE(R2f.y, R3f.z);
PV1fy = mul_nonIEEE(R2f.z, R3f.x);
R0f.z = roundEven(PV0fw);
PV1fw = mul_nonIEEE(R1f.y, R1f.y);
PS1f = mul_nonIEEE(R2f.x, R3f.y);
// 2
R9f.x = mul_nonIEEE(-(R3f.y),R2f.z) + PV1fx;
R7f.y = mul_nonIEEE(-(R3f.x),R2f.y) + PS1f;
R123f.z = mul_nonIEEE(R1f.z,R1f.z) + PV1fw;
R123f.z = clamp(R123f.z, 0.0, 1.0);
R2f.w = mul_nonIEEE(-(R3f.z),R2f.x) + PV1fy;
PS0f = intBitsToFloat(0x3c808081);
// 3
R11f.x = PS0f;
PV1fy = -(R123f.z) + 1.0;
PV1fz = intBitsToFloat(uf_remappedPS[2].z);
R11f.w = 1.0;
R10f.w = 0.0;
// 4
R4f.x = R0f.x;
R11f.y = PV1fz;
R4f.z = roundEven(R127f.x);
R4f.w = R0f.y;
R7f.x = sqrt(PV1fy);
R0f.xyz = (texture(textureUnitPS8, vec3(R0f.x,R0f.y,R0f.z)).xyz);
R4f.xyz = (texture(textureUnitPS7, vec3(R4f.x,R4f.w,R4f.z)).xyz);
// 0
PV0fx = -(R4f.x) + R6f.x;
PV0fy = -(R0f.z) + R5f.z;
R127f.z = R0f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R127f.w = R0f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R126f.z = -(R4f.y) + R6f.y;
// 1
R123f.x = mul_nonIEEE(PV0fy,R8f.x) + R0f.z;
PV1fy = mul_nonIEEE(R127f.w, R127f.w);
PV1fz = -(R127f.z) + R1f.z;
PV1fw = -(R127f.w) + R1f.y;
R127f.x = mul_nonIEEE(PV0fx,R8f.x) + R4f.x;
// 2
backupReg0f = R123f.x;
R123f.x = mul_nonIEEE(R127f.z,R127f.z) + PV1fy;
R123f.x = clamp(R123f.x, 0.0, 1.0);
R127f.y = mul_nonIEEE(PV1fw,R8f.x) + R127f.w;
R127f.z = mul_nonIEEE(PV1fz,R8f.x) + R127f.z;
PV0fw = backupReg0f * 63.75;
PS0f = -(R4f.z) + R6f.z;
// 3
backupReg0f = R123f.x;
R123f.x = mul_nonIEEE(R126f.z,R8f.x) + R4f.y;
PV1fy = floor(PV0fw);
PV1fy *= 4.0;
R123f.z = mul_nonIEEE(PS0f,R8f.x) + R4f.z;
PV1fw = -(backupReg0f) + 1.0;
R10f.x = mul_nonIEEE(R1f.x, R127f.x);
// 4
R10f.y = mul_nonIEEE(R1f.x, R123f.x);
R10f.z = mul_nonIEEE(R1f.x, R123f.z);
R1f.w = PV1fy * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081);
R126f.z = sqrt(PV1fw);
// 5
PV1fw = -(R126f.z) + R7f.x;
// 6
R126f.z = mul_nonIEEE(PV1fw,R8f.x) + R126f.z;
// 7
tempf.x = dot(vec4(R127f.y,R127f.z,R126f.z,intBitsToFloat(0x80000000)),vec4(R127f.y,R127f.z,R126f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
// 8
tempResultf = 1.0 / sqrt(PV1fx);
PS0f = tempResultf;
// 9
backupReg0f = R127f.y;
backupReg1f = R127f.z;
R127f.y = mul_nonIEEE(R126f.z, PS0f);
R127f.z = mul_nonIEEE(backupReg0f, PS0f);
PV1fw = mul_nonIEEE(backupReg1f, PS0f);
// 10
PV0fx = mul_nonIEEE(R3f.w, PV1fw);
// 11
PV1fy = mul_nonIEEE(R7f.y, PV0fx);
PV1fz = mul_nonIEEE(R9f.x, PV0fx);
PV1fw = mul_nonIEEE(R2f.w, PV0fx);
// 12
R123f.x = mul_nonIEEE(R3f.x,R127f.z) + PV1fz;
R123f.z = mul_nonIEEE(R3f.y,R127f.z) + PV1fw;
R123f.w = mul_nonIEEE(R3f.z,R127f.z) + PV1fy;
// 13
backupReg0f = R123f.x;
R123f.x = (mul_nonIEEE(R2f.y,R127f.y) + R123f.z)/2.0;
R123f.y = (mul_nonIEEE(R2f.x,R127f.y) + backupReg0f)/2.0;
R123f.z = (mul_nonIEEE(R2f.z,R127f.y) + R123f.w)/2.0;
// 14
R1f.x = R123f.y + 0.5;
R1f.y = R123f.x + 0.5;
R1f.z = R123f.z + 0.5;
// 15
R2f.x = R1f.x;
R2f.y = R1f.y;
R2f.z = R1f.z;
R2f.w = R1f.w;
// 16
R1f.x = R10f.x;
R1f.y = R10f.y;
R1f.z = R10f.z;
R1f.w = R10f.w;
// 17
R0f.x = R11f.x;
R0f.y = R11f.y;
R0f.z = R11f.z;
R0f.w = R11f.w;
// export
passPixelColor0 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
passPixelColor1 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
passPixelColor3 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
}
