#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 860a8791e64a10a0
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[1];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(9, 1, 2) uniform sampler2D textureUnitPS9;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem8;
layout(location = 0) out vec4 passPixelColor0;
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
R1f = passParameterSem1;
R2f = passParameterSem3;
R3f = passParameterSem4;
R4f = passParameterSem8;
R1f.w = (texture(textureUnitPS1, vec2(R4f.z,R4f.w)).w);
R4f.xyzw = (texture(textureUnitPS0, vec2(R4f.x,R4f.y)).xyzw);
// 0
backupReg0f = R4f.y;
PV0fx = mul_nonIEEE(R4f.w, R1f.w);
R4f.y = R4f.z * 1.0;
R3f.z = backupReg0f * 1.0;
R1f.w = R4f.x * 1.0;
PS0f = 1.0 / R2f.w;
// 1
R2f.x = mul_nonIEEE(R2f.x, PS0f);
R2f.y = mul_nonIEEE(R2f.y, PS0f);
R4f.z = mul_nonIEEE(R0f.w, PV0fx);
R4f.z = clamp(R4f.z, 0.0, 1.0);
R2f.w = R0f.x + -(R1f.x);
R2f.z = R0f.y + -(R1f.y);
R5f.z = (texture(textureUnitPS9, vec2(R2f.x,R2f.y)).x);
// 0
R123f.x = mul_nonIEEE(R2f.w,R1f.w) + R1f.x;
PV0fy = R0f.z + -(R1f.z);
R127f.z = mul_nonIEEE(R3f.x, R4f.z);
PV0fw = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), intBitsToFloat(uf_remappedPS[0].w));
R127f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].y), intBitsToFloat(uf_remappedPS[0].w));
// 1
PV1fx = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].z), intBitsToFloat(uf_remappedPS[0].w));
R123f.z = mul_nonIEEE(PV0fy,R4f.y) + R1f.z;
R123f.w = mul_nonIEEE(R2f.z,R3f.z) + R1f.y;
R1f.x = mul_nonIEEE(R123f.x, PV0fw);
// 2
R1f.y = mul_nonIEEE(R123f.w, R127f.x);
PV0fz = R5f.z;
PV0fz /= 2.0;
PV0fz = clamp(PV0fz, 0.0, 1.0);
R1f.z = mul_nonIEEE(R123f.z, PV1fx);
// 3
R1f.w = mul_nonIEEE(R127f.z, PV0fz);
// export
if( ((vec4(R1f.x, R1f.y, R1f.z, R1f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
}
