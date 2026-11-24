#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 30462a38dcb26424
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[2];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(6, 1, 0) uniform sampler2DArray textureUnitPS6;
TEXTURE_LAYOUT(7, 1, 1) uniform sampler2DArray textureUnitPS7;
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
// 0
PV0fx = mul_nonIEEE(R2f.y, R3f.z);
R127f.y = intBitsToFloat(uf_remappedPS[0].z);
PV0fz = mul_nonIEEE(R2f.z, R3f.x);
PV0fw = intBitsToFloat(uf_remappedPS[1].z);
PS0f = mul_nonIEEE(R2f.x, R3f.y);
// 1
R5f.x = mul_nonIEEE(-(R3f.z),R2f.x) + PV0fz;
R1f.y = mul_nonIEEE(-(R3f.y),R2f.z) + PV0fx;
R0f.z = roundEven(PV0fw);
R0f.w = mul_nonIEEE(-(R3f.x),R2f.y) + PS0f;
R7f.w = 1.0;
// 2
R7f.x = intBitsToFloat(0x3c808081);
R7f.y = 0.0;
R4f.z = roundEven(R127f.y);
R6f.w = 0.0;
R4f.y = R0f.y;
// 3
R4f.x = R0f.x;
R0f.xyz = (texture(textureUnitPS7, vec3(R0f.x,R0f.y,R0f.z)).xyz);
R4f.xyz = (texture(textureUnitPS6, vec3(R4f.x,R4f.y,R4f.z)).xyz);
// 0
R127f.x = R0f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
PV0fy = R0f.z * 63.75;
R127f.z = R0f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R6f.x = mul_nonIEEE(R1f.x, R4f.x);
// 1
PV1fx = mul_nonIEEE(R3f.w, R127f.z);
PV1fy = floor(PV0fy);
PV1fy *= 4.0;
R6f.z = mul_nonIEEE(R1f.x, R4f.z);
PV1fw = mul_nonIEEE(R127f.x, R127f.x);
R6f.y = mul_nonIEEE(R1f.x, R4f.y);
// 2
PV0fx = mul_nonIEEE(R1f.y, PV1fx);
R123f.y = mul_nonIEEE(R127f.z,R127f.z) + PV1fw;
R123f.y = clamp(R123f.y, 0.0, 1.0);
PV0fz = mul_nonIEEE(R5f.x, PV1fx);
PV0fw = mul_nonIEEE(R0f.w, PV1fx);
R0f.w = PV1fy * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081);
// 3
PV1fx = -(R123f.y) + 1.0;
R127f.y = (mul_nonIEEE(R3f.y,R127f.x) + PV0fz)/2.0;
R127f.z = (mul_nonIEEE(R3f.z,R127f.x) + PV0fw)/2.0;
R127f.w = (mul_nonIEEE(R3f.x,R127f.x) + PV0fx)/2.0;
// 4
PS0f = sqrt(PV1fx);
PS0f /= 2.0;
// 5
R123f.x = mul_nonIEEE(R2f.z,PS0f) + R127f.z;
R123f.z = mul_nonIEEE(R2f.x,PS0f) + R127f.w;
R123f.w = mul_nonIEEE(R2f.y,PS0f) + R127f.y;
// 6
R0f.x = R123f.z + 0.5;
R0f.y = R123f.w + 0.5;
R0f.z = R123f.x + 0.5;
// 7
R2f.x = R0f.x;
R2f.y = R0f.y;
R2f.z = R0f.z;
R2f.w = R0f.w;
// 8
R1f.x = R6f.x;
R1f.y = R6f.y;
R1f.z = R6f.z;
R1f.w = R6f.w;
// 9
R0f.x = R7f.x;
R0f.y = R7f.y;
R0f.z = R7f.z;
R0f.w = R7f.w;
// export
passPixelColor0 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
passPixelColor1 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
passPixelColor3 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
}
