#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 0237195872baadaa
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[2];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(4, 1, 2) uniform sampler2D textureUnitPS4;
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
vec4 R6f = vec4(0.0);
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
R1f = passParameterSem1;
R2f = passParameterSem3;
R3f = passParameterSem4;
R4f = passParameterSem8;
R3f.w = (texture(textureUnitPS0, vec2(R4f.x,R4f.y)).y);
R3f.z = (texture(textureUnitPS1, vec2(R4f.z,R4f.w)).z);
// 0
R5f.x = R4f.z;
R6f.y = R0f.w * 2.0 + -(1.0);
PV0fz = mul_nonIEEE(R3f.y, R3f.z);
R123f.w = R3f.w * 2.0 + -(1.0);
PS0f = 1.0 / R2f.w;
// 1
R4f.x = mul_nonIEEE(R2f.x, PS0f);
R5f.y = mul_nonIEEE(R123f.w,PV0fz) + R4f.w;
R4f.z = mul_nonIEEE(R2f.y, PS0f);
R4f.w = R0f.x + -(R1f.x);
PS1f = 1.0 / R2f.w;
// 2
R0f.x = R2f.z * PS1f;
R2f.y = R0f.z + -(R1f.z);
R0f.z = R0f.y + -(R1f.y);
R2f.z = 1.0 / intBitsToFloat(uf_remappedPS[0].y);
R0f.y = (texture(textureUnitPS4, vec2(R4f.x,R4f.z)).x);
R5f.xyw = (texture(textureUnitPS1, vec2(R5f.x,R5f.y)).xyw);
// 0
PV0fx = R5f.y + R6f.y;
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].w),R0f.y) + intBitsToFloat(uf_remappedPS[1].x);
R123f.z = mul_nonIEEE(R0f.x,intBitsToFloat(uf_remappedPS[1].w)) + -(intBitsToFloat(uf_remappedPS[1].y));
R127f.w = mul_nonIEEE(R5f.w,R5f.w) + R5f.x;
// 1
R0f.x = mul_nonIEEE(R4f.w,R127f.w) + R1f.x;
R0f.y = mul_nonIEEE(R0f.z,R127f.w) + R1f.y;
PV1fz = mul_nonIEEE(R5f.y, PV0fx);
PS1f = 1.0 / R123f.z;
// 2
R126f.y = mul_nonIEEE(R1f.w,PV1fz) + intBitsToFloat(0xbd4ccccd);
R126f.y = clamp(R126f.y, 0.0, 1.0);
R0f.z = mul_nonIEEE(R2f.y,R127f.w) + R1f.z;
PV0fw = -(intBitsToFloat(uf_remappedPS[1].z)) * PS1f;
// 3
PV1fw = -(PV0fw) + R127f.y;
// 4
PV0fy = PV1fw * R2f.z;
PV0fy = clamp(PV0fy, 0.0, 1.0);
// 5
PV1fx = mul_nonIEEE(R126f.y, PV0fy);
// 6
R0f.w = mul_nonIEEE(R3f.x, PV1fx);
// export
if( ((vec4(R0f.x, R0f.y, R0f.z, R0f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
}
