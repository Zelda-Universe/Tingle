#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader a959c1a210b5294e
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[3];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(4, 1, 2) uniform sampler2D textureUnitPS4;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem2;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem8;
in vec4 passParameterSem11;
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
vec4 R7f = vec4(0.0);
vec4 R8f = vec4(0.0);
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
R2f = passParameterSem2;
R3f = passParameterSem3;
R4f = passParameterSem4;
R5f = passParameterSem8;
R6f = passParameterSem11;
R2f.w = (texture(textureUnitPS0, vec2(R5f.x,R5f.y)).y);
R4f.z = (texture(textureUnitPS1, vec2(R5f.z,R5f.w)).z);
// 0
R7f.x = R5f.z;
R8f.y = R0f.w * 2.0 + -(1.0);
PV0fz = mul_nonIEEE(R4f.y, R4f.z);
R123f.w = R2f.w * 2.0 + -(1.0);
PS0f = 1.0 / R3f.w;
// 1
R5f.x = mul_nonIEEE(R3f.x, PS0f);
R7f.y = mul_nonIEEE(R123f.w,PV0fz) + R5f.w;
R5f.z = mul_nonIEEE(R3f.y, PS0f);
R5f.w = -(intBitsToFloat(uf_remappedPS[0].z)) + intBitsToFloat(uf_remappedPS[0].w);
PS1f = 1.0 / R3f.w;
// 2
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(R2f.x,R2f.y,R2f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = R3f.z * PS1f;
// 3
R0f.x = R0f.x + -(R1f.x);
R3f.y = R0f.y + -(R1f.y);
R3f.z = mul_nonIEEE(PS0f,intBitsToFloat(uf_remappedPS[1].w)) + -(intBitsToFloat(uf_remappedPS[1].y));
R0f.w = R0f.z + -(R1f.z);
tempResultf = 1.0 / sqrt(PV0fx);
R0f.z = tempResultf;
R0f.y = (texture(textureUnitPS4, vec2(R5f.x,R5f.z)).x);
R7f.xyw = (texture(textureUnitPS1, vec2(R7f.x,R7f.y)).xyw);
// 0
PV0fx = mul_nonIEEE(R2f.x, R0f.z);
PV0fy = mul_nonIEEE(R2f.y, R0f.z);
PV0fz = mul_nonIEEE(R2f.z, R0f.z);
R127f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].w),R0f.y) + intBitsToFloat(uf_remappedPS[1].x);
R127f.y = 1.0 / R3f.z;
// 1
tempf.x = dot(vec4(R6f.x,R6f.y,R6f.z,intBitsToFloat(0x80000000)),vec4(PV0fx,PV0fy,PV0fz,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R126f.y = 1.0 / R5f.w;
// 2
backupReg0f = R127f.y;
PV0fx = max(PV1fx, -(PV1fx));
R127f.y = mul_nonIEEE(R7f.w,R7f.w) + R7f.x;
PV0fw = -(intBitsToFloat(uf_remappedPS[1].z)) * backupReg0f;
R127f.z = 1.0 / intBitsToFloat(uf_remappedPS[2].y);
// 3
PV1fx = R7f.y + R8f.y;
PV1fy = -(PV0fw) + R127f.w;
R0f.z = mul_nonIEEE(R0f.w,R127f.y) + R1f.z;
PV1fw = PV0fx + -(intBitsToFloat(uf_remappedPS[0].z));
R0f.x = mul_nonIEEE(R0f.x,R127f.y) + R1f.x;
// 4
PV0fx = PV1fw * R126f.y;
PV0fx = clamp(PV0fx, 0.0, 1.0);
R126f.y = PV1fy * R127f.z;
R126f.y = clamp(R126f.y, 0.0, 1.0);
PV0fz = mul_nonIEEE(R7f.y, PV1fx);
// 5
R123f.y = mul_nonIEEE(R1f.w,PV0fz) + intBitsToFloat(0xbd4ccccd);
R123f.y = clamp(R123f.y, 0.0, 1.0);
R123f.z = -2.0 * PV0fx + 3.0;
PV1fw = mul_nonIEEE(PV0fx, PV0fx);
R0f.y = mul_nonIEEE(R3f.y,R127f.y) + R1f.y;
// 6
PV0fx = mul_nonIEEE(R123f.y, R126f.y);
PV0fy = mul_nonIEEE(PV1fw, R123f.z);
// 7
PV1fx = mul_nonIEEE(PV0fx, PV0fy);
// 8
R0f.w = mul_nonIEEE(R4f.x, PV1fx);
// export
if( ((vec4(R0f.x, R0f.y, R0f.z, R0f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
}
