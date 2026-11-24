#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 3c8a748cdc2235ac
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[3];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(3, 1, 0) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(5, 1, 1) uniform sampler2DArray textureUnitPS5;
TEXTURE_LAYOUT(6, 1, 2) uniform sampler2DArray textureUnitPS6;
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
vec4 R12f = vec4(0.0);
vec4 R122f = vec4(0.0);
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
R6f.xyz = (texture(textureUnitPS3, vec2(R0f.x,R0f.y)).xyz);
// 0
R4f.x = R0f.z;
R4f.y = R0f.w;
PV0fz = intBitsToFloat(uf_remappedPS[0].z);
PV0fw = intBitsToFloat(uf_remappedPS[1].z);
R1f.y = R6f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
// 1
R7f.x = R6f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
PV1fy = mul_nonIEEE(R1f.y, R1f.y);
R4f.z = roundEven(PV0fw);
R127f.w = intBitsToFloat(uf_remappedPS[2].z);
R0f.z = roundEven(PV0fz);
// 2
R8f.x = -(R1f.w) + 1.0;
PV0fy = mul_nonIEEE(R2f.z, R3f.x);
R123f.z = mul_nonIEEE(R7f.x,R7f.x) + PV1fy;
R123f.z = clamp(R123f.z, 0.0, 1.0);
PV0fw = mul_nonIEEE(R2f.y, R3f.z);
PS0f = mul_nonIEEE(R2f.x, R3f.y);
// 3
R10f.x = mul_nonIEEE(-(R3f.z),R2f.x) + PV0fy;
PV1fy = -(R123f.z) + 1.0;
R1f.z = mul_nonIEEE(-(R3f.x),R2f.y) + PS0f;
R2f.w = mul_nonIEEE(-(R3f.y),R2f.z) + PV0fw;
R12f.w = 1.0;
// 4
R12f.x = intBitsToFloat(0x3c808081);
R12f.y = 0.0;
R5f.z = roundEven(R127f.w);
R11f.w = 0.0;
R9f.x = sqrt(PV1fy);
// 5
R5f.x = R4f.x;
R5f.y = R4f.y;
R4f.xyz = (texture(textureUnitPS6, vec3(R4f.x,R4f.y,R4f.z)).xyz);
R0f.xyz = (texture(textureUnitPS5, vec3(R0f.x,R0f.y,R0f.z)).xyz);
R5f.xyz = (texture(textureUnitPS5, vec3(R5f.x,R5f.y,R5f.z)).xyz);
// 0
PV0fx = -(R6f.z) + R4f.z;
R127f.y = -(R0f.x) + R5f.x;
R127f.z = R4f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R123f.w = R4f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R127f.x = -(R0f.y) + R5f.y;
// 1
PV1fx = -(R1f.y) + R123f.w;
PV1fy = mul_nonIEEE(R123f.w, R123f.w);
PV1fz = -(R7f.x) + R127f.z;
R123f.w = mul_nonIEEE(PV0fx,R8f.x) + R6f.z;
R127f.w = -(R0f.z) + R5f.z;
// 2
backupReg0f = R127f.y;
R123f.x = mul_nonIEEE(R127f.z,R127f.z) + PV1fy;
R123f.x = clamp(R123f.x, 0.0, 1.0);
R127f.y = mul_nonIEEE(PV1fx,R8f.x) + R1f.y;
R127f.z = mul_nonIEEE(PV1fz,R8f.x) + R7f.x;
PV0fw = R123f.w * 63.75;
R122f.x = mul_nonIEEE(backupReg0f,R8f.x) + R0f.x;
// 3
backupReg0f = R123f.x;
R123f.x = mul_nonIEEE(R127f.w,R8f.x) + R0f.z;
R123f.y = mul_nonIEEE(R127f.x,R8f.x) + R0f.y;
PV1fz = floor(PV0fw);
PV1fz *= 4.0;
PV1fw = -(backupReg0f) + 1.0;
R11f.x = mul_nonIEEE(R1f.x, R122f.x);
// 4
R11f.y = mul_nonIEEE(R1f.x, R123f.y);
R11f.z = mul_nonIEEE(R1f.x, R123f.x);
R0f.w = PV1fz * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081);
PS0f = sqrt(PV1fw);
// 5
PV1fw = -(R9f.x) + PS0f;
// 6
R126f.z = mul_nonIEEE(PV1fw,R8f.x) + R9f.x;
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
PV1fx = mul_nonIEEE(R127f.z, PS0f);
R127f.y = mul_nonIEEE(R127f.y, PS0f);
R127f.z = mul_nonIEEE(R126f.z, PS0f);
// 10
PV0fw = mul_nonIEEE(R3f.w, PV1fx);
// 11
PV1fx = mul_nonIEEE(R10f.x, PV0fw);
PV1fy = mul_nonIEEE(R2f.w, PV0fw);
PV1fz = mul_nonIEEE(R1f.z, PV0fw);
// 12
R123f.x = mul_nonIEEE(R3f.z,R127f.y) + PV1fz;
R123f.y = mul_nonIEEE(R3f.y,R127f.y) + PV1fx;
R123f.w = mul_nonIEEE(R3f.x,R127f.y) + PV1fy;
// 13
R123f.x = (mul_nonIEEE(R2f.z,R127f.z) + R123f.x)/2.0;
R123f.z = (mul_nonIEEE(R2f.x,R127f.z) + R123f.w)/2.0;
R123f.w = (mul_nonIEEE(R2f.y,R127f.z) + R123f.y)/2.0;
// 14
R0f.x = R123f.z + 0.5;
R0f.y = R123f.w + 0.5;
R0f.z = R123f.x + 0.5;
// 15
R2f.x = R0f.x;
R2f.y = R0f.y;
R2f.z = R0f.z;
R2f.w = R0f.w;
// 16
R1f.x = R11f.x;
R1f.y = R11f.y;
R1f.z = R11f.z;
R1f.w = R11f.w;
// 17
R0f.x = R12f.x;
R0f.y = R12f.y;
R0f.z = R12f.z;
R0f.w = R12f.w;
// export
passPixelColor0 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
passPixelColor1 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
passPixelColor3 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
}
