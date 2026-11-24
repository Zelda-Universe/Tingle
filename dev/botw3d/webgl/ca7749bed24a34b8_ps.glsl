#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader ca7749bed24a34b8
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[1];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(3, 1, 0) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 1) uniform sampler2D textureUnitPS4;
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
R4f.xyz = (texture(textureUnitPS4, vec2(R0f.x,R0f.y)).xyz);
R0f.xyzw = (texture(textureUnitPS3, vec2(R0f.x,R0f.y)).xyzw);
// 0
PV0fx = mul_nonIEEE(R2f.y, R3f.z);
PV0fy = mul_nonIEEE(R2f.x, R3f.y);
PV0fz = mul_nonIEEE(R2f.z, R3f.x);
R127f.w = R4f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R127f.y = R4f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
// 1
PV1fx = mul_nonIEEE(R127f.w, R127f.w);
R123f.y = mul_nonIEEE(-(R3f.y),R2f.z) + PV0fx;
R123f.z = mul_nonIEEE(-(R3f.x),R2f.y) + PV0fy;
R123f.w = mul_nonIEEE(-(R3f.z),R2f.x) + PV0fz;
PS1f = mul_nonIEEE(R3f.w, R127f.y);
// 2
PV0fx = mul_nonIEEE(R123f.y, PS1f);
PV0fy = mul_nonIEEE(R123f.z, PS1f);
R123f.z = mul_nonIEEE(R127f.y,R127f.y) + PV1fx;
R123f.z = clamp(R123f.z, 0.0, 1.0);
PV0fw = mul_nonIEEE(R123f.w, PS1f);
R127f.y = R4f.z * 63.75;
// 3
R127f.x = (mul_nonIEEE(R3f.x,R127f.w) + PV0fx)/2.0;
R126f.y = (mul_nonIEEE(R3f.z,R127f.w) + PV0fy)/2.0;
R127f.z = (mul_nonIEEE(R3f.y,R127f.w) + PV0fw)/2.0;
PV1fw = -(R123f.z) + 1.0;
R127f.w = intBitsToFloat(0x3c808081);
// 4
R126f.x = floor(R127f.y);
R126f.x *= 4.0;
R3f.y = mul_nonIEEE(R1f.x, R0f.y);
R126f.z = intBitsToFloat(uf_remappedPS[0].z);
R4f.w = mul_nonIEEE(R1f.w, R0f.w);
PS0f = sqrt(PV1fw);
PS0f /= 2.0;
// 5
backupReg0f = R127f.x;
backupReg1f = R126f.y;
R127f.x = mul_nonIEEE(R2f.y,PS0f) + R127f.z;
R126f.y = mul_nonIEEE(R2f.x,PS0f) + backupReg0f;
R123f.z = mul_nonIEEE(R2f.z,PS0f) + backupReg1f;
R3f.w = 0.0;
R3f.z = mul_nonIEEE(R1f.x, R0f.z);
// 6
R3f.x = mul_nonIEEE(R1f.x, R0f.x);
R4f.y = R126f.z;
R0f.z = R123f.z + 0.5;
R0f.w = R126f.x * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081);
R4f.x = R127f.w;
// 7
R0f.x = R126f.y + 0.5;
R0f.y = R127f.x + 0.5;
// 8
R2f.x = R0f.x;
R2f.y = R0f.y;
R2f.z = R0f.z;
R2f.w = R0f.w;
// 9
R1f.x = R3f.x;
R1f.y = R3f.y;
R1f.z = R3f.z;
R1f.w = R3f.w;
// 10
R0f.x = R4f.x;
R0f.y = R4f.y;
R0f.z = R4f.z;
R0f.w = R4f.w;
// export
if( ((vec4(R0f.x, R0f.y, R0f.z, R0f.w)).a >= uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
passPixelColor1 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
passPixelColor3 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
}
