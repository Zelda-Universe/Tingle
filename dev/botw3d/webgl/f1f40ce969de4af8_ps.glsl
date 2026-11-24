#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader f1f40ce969de4af8
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[2];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(3, 1, 0) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 1) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(6, 1, 2) uniform sampler2DArray textureUnitPS6;
TEXTURE_LAYOUT(7, 1, 3) uniform sampler2DArray textureUnitPS7;
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
R5f.xyz = (texture(textureUnitPS4, vec2(R0f.x,R0f.y)).xyz);
R7f.xyz = (texture(textureUnitPS3, vec2(R0f.x,R0f.y)).xyz);
// 0
R0f.x = R0f.z;
R0f.y = R0f.w;
R127f.z = intBitsToFloat(uf_remappedPS[0].z);
PV0fw = intBitsToFloat(uf_remappedPS[1].z);
R1f.y = R5f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
// 1
R6f.x = R5f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R6f.y = -(R1f.w) + 1.0;
R0f.z = roundEven(PV0fw);
PV1fw = mul_nonIEEE(R1f.y, R1f.y);
PS1f = mul_nonIEEE(R2f.y, R3f.z);
// 2
PV0fx = mul_nonIEEE(R2f.z, R3f.x);
R8f.y = mul_nonIEEE(-(R3f.y),R2f.z) + PS1f;
R123f.z = mul_nonIEEE(R6f.x,R6f.x) + PV1fw;
R123f.z = clamp(R123f.z, 0.0, 1.0);
PV0fw = mul_nonIEEE(R2f.x, R3f.y);
R9f.w = 1.0;
// 3
R9f.x = mul_nonIEEE(-(R3f.z),R2f.x) + PV0fx;
PV1fy = -(R123f.z) + 1.0;
R9f.z = intBitsToFloat(0x3c808081);
R0f.w = mul_nonIEEE(-(R3f.x),R2f.y) + PV0fw;
R9f.y = 0.0;
// 4
R4f.x = R0f.x;
R4f.y = R0f.y;
R4f.z = roundEven(R127f.z);
R10f.w = 0.0;
R8f.x = sqrt(PV1fy);
R0f.xyz = (texture(textureUnitPS7, vec3(R0f.x,R0f.y,R0f.z)).xyz);
R4f.xyz = (texture(textureUnitPS6, vec3(R4f.x,R4f.y,R4f.z)).xyz);
// 0
PV0fx = -(R5f.z) + R0f.z;
R127f.y = -(R7f.x) + R4f.x;
R127f.z = R0f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R123f.w = R0f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R127f.x = -(R7f.y) + R4f.y;
// 1
PV1fx = -(R1f.y) + R123f.w;
PV1fy = mul_nonIEEE(R123f.w, R123f.w);
PV1fz = -(R6f.x) + R127f.z;
R123f.w = mul_nonIEEE(PV0fx,R6f.y) + R5f.z;
R127f.w = -(R7f.z) + R4f.z;
// 2
backupReg0f = R127f.y;
R123f.x = mul_nonIEEE(R127f.z,R127f.z) + PV1fy;
R123f.x = clamp(R123f.x, 0.0, 1.0);
R127f.y = mul_nonIEEE(PV1fx,R6f.y) + R1f.y;
R127f.z = mul_nonIEEE(PV1fz,R6f.y) + R6f.x;
PV0fw = R123f.w * 63.75;
R122f.x = mul_nonIEEE(backupReg0f,R6f.y) + R7f.x;
// 3
backupReg0f = R123f.x;
R123f.x = mul_nonIEEE(R127f.w,R6f.y) + R7f.z;
R123f.y = mul_nonIEEE(R127f.x,R6f.y) + R7f.y;
PV1fz = floor(PV0fw);
PV1fz *= 4.0;
PV1fw = -(backupReg0f) + 1.0;
R10f.x = mul_nonIEEE(R1f.x, R122f.x);
// 4
R10f.y = mul_nonIEEE(R1f.x, R123f.y);
R10f.z = mul_nonIEEE(R1f.x, R123f.x);
R1f.w = PV1fz * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081);
PS0f = sqrt(PV1fw);
// 5
PV1fw = -(R8f.x) + PS0f;
// 6
R126f.z = mul_nonIEEE(PV1fw,R6f.y) + R8f.x;
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
PV1fx = mul_nonIEEE(R9f.x, PV0fw);
PV1fy = mul_nonIEEE(R8f.y, PV0fw);
PV1fz = mul_nonIEEE(R0f.w, PV0fw);
// 12
R123f.x = mul_nonIEEE(R3f.z,R127f.y) + PV1fz;
R123f.y = mul_nonIEEE(R3f.y,R127f.y) + PV1fx;
R123f.w = mul_nonIEEE(R3f.x,R127f.y) + PV1fy;
// 13
R123f.x = (mul_nonIEEE(R2f.z,R127f.z) + R123f.x)/2.0;
R123f.z = (mul_nonIEEE(R2f.x,R127f.z) + R123f.w)/2.0;
R123f.w = (mul_nonIEEE(R2f.y,R127f.z) + R123f.y)/2.0;
// 14
R1f.x = R123f.z + 0.5;
R1f.y = R123f.w + 0.5;
R1f.z = R123f.x + 0.5;
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
R0f.x = R9f.z;
R0f.y = R9f.y;
R0f.z = R9f.z;
R0f.w = R9f.w;
// export
passPixelColor0 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
passPixelColor1 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
passPixelColor3 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
}
