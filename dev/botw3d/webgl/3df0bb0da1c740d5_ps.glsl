#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 3df0bb0da1c740d5
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[1];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(9, 1, 0) uniform sampler2D textureUnitPS9;
in vec4 passParameterSem0;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem7;
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
R3f = passParameterSem7;
// 0
R3f.x = mul_nonIEEE(R0f.y, R3f.w);
R2f.y = mul_nonIEEE(R0f.x, R3f.w);
R1f.z = mul_nonIEEE(R0f.z, R3f.w);
PV0fw = R3f.w * 1.0;
PS0f = 1.0 / R1f.w;
// 1
R0f.x = mul_nonIEEE(R1f.x, PS0f);
R0f.y = mul_nonIEEE(R1f.y, PS0f);
R0f.z = mul_nonIEEE(R0f.w, PV0fw);
R0f.z = clamp(R0f.z, 0.0, 1.0);
R1f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), intBitsToFloat(uf_remappedPS[0].w));
R1f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].y), intBitsToFloat(uf_remappedPS[0].w));
R0f.w = (texture(textureUnitPS9, vec2(R0f.x,R0f.y)).x);
// 0
PV0fx = mul_nonIEEE(R2f.x, R0f.z);
R0f.y = mul_nonIEEE(R3f.x, R1f.x);
PV0fz = R0f.w;
PV0fz /= 2.0;
PV0fz = clamp(PV0fz, 0.0, 1.0);
PV0fw = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].z), intBitsToFloat(uf_remappedPS[0].w));
R0f.x = mul_nonIEEE(R2f.y, R1f.w);
// 1
R0f.z = mul_nonIEEE(R1f.z, PV0fw);
R0f.w = mul_nonIEEE(PV0fx, PV0fz);
// export
if( ((vec4(R0f.x, R0f.y, R0f.z, R0f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
}
