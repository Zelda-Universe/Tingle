#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader d75359842e36b56c
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(3, 1, 0) uniform sampler2DArray textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 1) uniform sampler2D textureUnitPS4;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem3;
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
vec4 R123f = vec4(0.0);
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
// 0
R3f.x = R0f.z;
R3f.y = R0f.w;
R3f.z = roundEven(0.0);
R2f.z = 1.0 / R1f.z;
R2f.w = (texture(textureUnitPS4, vec2(R3f.x,R3f.y)).x);
// 0
R123f.x = -(R2f.w) * 0.25 + R1f.w;
R2f.y = 1.0;
R3f.z = mul_nonIEEE(R2f.x,R2f.w) + -(R2f.x);
// 1
PV1fy = mul_nonIEEE(R123f.x, R2f.z);
// 2
PV0fw = fract(PV1fy);
// 3
R123f.x = mul_nonIEEE(R1f.z,PV0fw) + R1f.y;
// 4
R0f.z = roundEven(R123f.x);
R0f.z = (texture(textureUnitPS3, vec3(R0f.x,R0f.y,R0f.z)).w);
// 0
R123f.y = R0f.z * 4.0 + -3.0;
R123f.y = clamp(R123f.y, 0.0, 1.0);
R123f.w = R0f.z * 2.0 + -(0.5);
// 1
PV1fx = -(R123f.y) + R123f.w;
// 2
R123f.y = mul_nonIEEE(R1f.x,PV1fx) + intBitsToFloat(0x3d8f5c29);
// 3
R2f.w = R3f.z + R123f.y;
// export
if( ((vec4(R2f.y, R2f.y, R2f.y, R2f.w)).a >= uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R2f.y, R2f.y, R2f.y, R2f.w);
}
