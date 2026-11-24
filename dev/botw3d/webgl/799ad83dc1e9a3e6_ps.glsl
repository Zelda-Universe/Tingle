#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 799ad83dc1e9a3e6
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[1];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(3, 1, 1) uniform sampler2D textureUnitPS3;
in vec4 passParameterSem0;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem7;
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
R1f = passParameterSem3;
R2f = passParameterSem4;
R3f = passParameterSem7;
R4f = passParameterSem8;
R4f.xyw = (texture(textureUnitPS0, vec2(R4f.x,R4f.y)).xyw);
// 0
R123f.x = R4f.y * 2.0 + -(1.0);
R123f.y = R4f.x * 2.0 + -(1.0);
R127f.z = mul_nonIEEE(R2f.y, intBitsToFloat(uf_remappedPS[0].x));
R127f.w = mul_nonIEEE(R2f.y, intBitsToFloat(uf_remappedPS[0].y));
PS0f = 0.0;
// 1
PV1fx = R1f.w + PS0f;
PV1fy = R3f.w * 1.0;
PV1fz = R123f.y * 25.0;
PV1fw = R123f.x * 25.0;
// 2
PV0fx = mul_nonIEEE(PV1fz, R127f.z);
PV0fy = mul_nonIEEE(R0f.w, PV1fy);
PV0fy = clamp(PV0fy, 0.0, 1.0);
PV0fw = mul_nonIEEE(PV1fw, R127f.w);
R127f.w = 1.0 / PV1fx;
// 3
PV1fx = mul_nonIEEE(R4f.w, PV0fw);
PV1fy = mul_nonIEEE(R4f.w, PV0fx);
R2f.w = mul_nonIEEE(R2f.x, PV0fy);
// 4
PV0fy = R1f.y + PV1fx;
PV0fw = R1f.x + PV1fy;
// 5
R1f.x = mul_nonIEEE(PV0fw, R127f.w);
R1f.y = mul_nonIEEE(PV0fy, R127f.w);
R1f.xyz = (texture(textureUnitPS3, vec2(R1f.x,R1f.y)).xyz);
// 0
PV0fx = mul_nonIEEE(R0f.x, R1f.x);
PV0fz = mul_nonIEEE(R0f.z, R1f.z);
PV0fw = mul_nonIEEE(R0f.y, R1f.y);
// 1
R2f.x = mul_nonIEEE(R3f.x, PV0fx);
R2f.y = mul_nonIEEE(R3f.y, PV0fw);
R2f.z = mul_nonIEEE(R3f.z, PV0fz);
// export
if( ((vec4(R2f.x, R2f.y, R2f.z, R2f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
}
