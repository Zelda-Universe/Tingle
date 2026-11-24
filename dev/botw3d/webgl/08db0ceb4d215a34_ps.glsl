#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 08db0ceb4d215a34
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
TEXTURE_LAYOUT(2, 1, 2) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(4, 1, 3) uniform sampler2D textureUnitPS4;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem2;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem7;
in vec4 passParameterSem8;
in vec4 passParameterSem9;
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
vec4 R9f = vec4(0.0);
vec4 R10f = vec4(0.0);
vec4 R123f = vec4(0.0);
vec4 R125f = vec4(0.0);
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
R5f = passParameterSem7;
R6f = passParameterSem8;
R7f = passParameterSem9;
R8f = passParameterSem11;
R9f.xyzw = (texture(textureUnitPS1, vec2(R6f.z,R6f.w)).xyzw);
R10f.xyzw = (texture(textureUnitPS2, vec2(R7f.x,R7f.y)).xyzw);
R7f.xyz = (texture(textureUnitPS0, vec2(R6f.x,R6f.y)).xyz);
// 0
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(R2f.x,R2f.y,R2f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
R127f.w = tempf.x;
PS0f = 1.0 / R3f.w;
// 1
R6f.x = mul_nonIEEE(R3f.x, PS0f);
R6f.y = mul_nonIEEE(R3f.y, PS0f);
R6f.z = -(intBitsToFloat(uf_remappedPS[0].z)) + intBitsToFloat(uf_remappedPS[0].w);
PV1fw = R9f.w * 1.0;
PS1f = 1.0 / R3f.w;
// 2
R3f.x = mul_nonIEEE(R9f.x, R9f.x);
R3f.y = mul_nonIEEE(PV1fw, R10f.w);
R4f.z = mul_nonIEEE(R9f.y, R9f.y);
R3f.w = R3f.z * PS1f;
tempResultf = 1.0 / sqrt(R127f.w);
R3f.z = tempResultf;
R6f.x = (texture(textureUnitPS4, vec2(R6f.x,R6f.y)).x);
// 0
PV0fx = mul_nonIEEE(R2f.x, R3f.z);
PV0fy = mul_nonIEEE(R2f.y, R3f.z);
PV0fz = mul_nonIEEE(R2f.z, R3f.z);
R123f.w = mul_nonIEEE(R3f.w,intBitsToFloat(uf_remappedPS[1].w)) + -(intBitsToFloat(uf_remappedPS[1].y));
R127f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].w),R6f.x) + intBitsToFloat(uf_remappedPS[1].x);
// 1
tempf.x = dot(vec4(R8f.x,R8f.y,R8f.z,intBitsToFloat(0x80000000)),vec4(PV0fx,PV0fy,PV0fz,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
PS1f = 1.0 / R123f.w;
// 2
PV0fx = max(PV1fx, -(PV1fx));
R126f.y = mul_nonIEEE(R7f.x,R7f.x) + R3f.x;
PV0fz = mul_nonIEEE(R9f.z, R9f.z);
PV0fw = -(intBitsToFloat(uf_remappedPS[1].z)) * PS1f;
R127f.y = 1.0 / R6f.z;
// 3
PV1fx = -(PV0fw) + R127f.x;
R125f.y = mul_nonIEEE(R7f.y,R7f.y) + R4f.z;
R127f.z = mul_nonIEEE(R7f.z,R7f.z) + PV0fz;
PV1fw = PV0fx + -(intBitsToFloat(uf_remappedPS[0].z));
PS1f = 1.0 / intBitsToFloat(uf_remappedPS[2].y);
// 4
PV0fx = PV1fw * R127f.y;
PV0fx = clamp(PV0fx, 0.0, 1.0);
R127f.y = mul_nonIEEE(R0f.w, R3f.y);
R127f.y = clamp(R127f.y, 0.0, 1.0);
R126f.z = PV1fx * PS1f;
R126f.z = clamp(R126f.z, 0.0, 1.0);
PV0fw = mul_nonIEEE(R10f.x, R10f.x);
PS0f = mul_nonIEEE(R10f.y, R10f.y);
// 5
R127f.x = mul_nonIEEE(R126f.y, PV0fw);
PV1fy = mul_nonIEEE(R10f.z, R10f.z);
R123f.z = -2.0 * PV0fx + 3.0;
PV1fw = mul_nonIEEE(PV0fx, PV0fx);
R126f.x = mul_nonIEEE(R125f.y, PS0f);
// 6
PV0fx = mul_nonIEEE(R127f.y, R126f.z);
PV0fy = mul_nonIEEE(PV1fw, R123f.z);
PV0fz = R0f.x + -(R1f.x);
R127f.w = mul_nonIEEE(R127f.z, PV1fy);
PS0f = R0f.y + -(R1f.y);
// 7
PV1fx = mul_nonIEEE(PV0fx, PV0fy);
R123f.y = mul_nonIEEE(PV0fz,R127f.x) + R1f.x;
R123f.z = mul_nonIEEE(PS0f,R126f.x) + R1f.y;
PV1fw = R0f.z + -(R1f.z);
// 8
R1f.x = mul_nonIEEE(R5f.x, R123f.y);
R1f.y = mul_nonIEEE(R5f.y, R123f.z);
R123f.w = mul_nonIEEE(PV1fw,R127f.w) + R1f.z;
R1f.w = mul_nonIEEE(R4f.x, PV1fx);
// 9
R1f.z = mul_nonIEEE(R5f.z, R123f.w);
// export
if( ((vec4(R1f.x, R1f.y, R1f.z, R1f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
}
