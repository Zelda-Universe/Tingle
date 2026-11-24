#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 87f7d27254bcba22
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
in vec4 passParameterSem0;
in vec4 passParameterSem1;
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
vec4 R5f = vec4(0.0);
vec4 R6f = vec4(0.0);
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
R2f = passParameterSem4;
R3f = passParameterSem7;
R4f = passParameterSem8;
R5f.xw = (texture(textureUnitPS0, vec2(R4f.x,R4f.y)).xw);
// 0
PV0fx = mul_nonIEEE(R2f.y, intBitsToFloat(uf_remappedPS[0].x));
PV0fy = mul_nonIEEE(R2f.y, intBitsToFloat(uf_remappedPS[0].y));
R123f.z = R5f.w * 2.0 + -(1.0);
R123f.w = R5f.x * 2.0 + -(1.0);
R2f.z = -(R3f.w) + 1.0;
// 1
R4f.x = mul_nonIEEE(PV0fx,R123f.w) + R4f.z;
R4f.y = mul_nonIEEE(PV0fy,R123f.z) + R4f.w;
R5f.z = R0f.x + -(R1f.x);
R5f.w = R0f.y + -(R1f.y);
R6f.z = R0f.z + -(R1f.z);
R4f.xyzw = (texture(textureUnitPS1, vec2(R4f.x,R4f.y)).xyzw);
// 0
PV0fx = mul_nonIEEE(R4f.z, R4f.z);
PV0fy = R4f.w + -(R2f.z);
PV0fz = mul_nonIEEE(R4f.y, R4f.y);
PV0fw = mul_nonIEEE(R4f.x, R4f.x);
// 1
R123f.x = mul_nonIEEE(R5f.w,PV0fz) + R1f.y;
R123f.y = mul_nonIEEE(R5f.z,PV0fw) + R1f.x;
PV1fz = mul_nonIEEE(R0f.w, PV0fy);
PV1fz = clamp(PV1fz, 0.0, 1.0);
R123f.w = mul_nonIEEE(R6f.z,PV0fx) + R1f.z;
// 2
backupReg0f = R2f.x;
R2f.x = mul_nonIEEE(R3f.x, R123f.y);
R2f.y = mul_nonIEEE(R3f.y, R123f.x);
R2f.z = mul_nonIEEE(R3f.z, R123f.w);
R2f.w = mul_nonIEEE(backupReg0f, PV1fz);
// export
if( ((vec4(R2f.x, R2f.y, R2f.z, R2f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
}
