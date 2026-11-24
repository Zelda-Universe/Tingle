#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 699b238ae15d113b
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[5];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(4, 1, 1) uniform sampler2D textureUnitPS4;
in vec4 passParameterSem0;
in vec4 passParameterSem2;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem7;
in vec4 passParameterSem8;
in vec4 passParameterSem11;
in vec4 passParameterSem14;
in vec4 passParameterSem15;
in vec4 passParameterSem16;
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
R1f = passParameterSem2;
R2f = passParameterSem3;
R3f = passParameterSem4;
R4f = passParameterSem7;
R5f = passParameterSem8;
R6f = passParameterSem11;
R7f = passParameterSem14;
R8f = passParameterSem15;
R9f = passParameterSem16;
R1f.w = (texture(textureUnitPS0, vec2(R5f.x,R5f.y)).w);
// 0
tempf.x = dot(vec4(R1f.x,R1f.y,R1f.z,intBitsToFloat(0x80000000)),vec4(R1f.x,R1f.y,R1f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
R127f.z = tempf.x;
PV0fw = tempf.x;
PS0f = 1.0 / R2f.w;
// 1
R5f.x = mul_nonIEEE(R2f.x, PS0f);
R5f.y = mul_nonIEEE(R2f.y, PS0f);
R3f.z = -(intBitsToFloat(uf_remappedPS[0].z)) + intBitsToFloat(uf_remappedPS[0].w);
R3f.w = mul_nonIEEE(R0f.x, R4f.x);
PS1f = 1.0 / R2f.w;
// 2
R2f.x = R2f.z * PS1f;
R2f.y = mul_nonIEEE(R0f.y, R4f.y);
R5f.z = -(R3f.w) + intBitsToFloat(uf_remappedPS[1].x);
R2f.w = mul_nonIEEE(R4f.w, R1f.w);
tempResultf = 1.0 / sqrt(R127f.z);
R1f.w = tempResultf;
R2f.z = (texture(textureUnitPS4, vec2(R5f.x,R5f.y)).x);
// 0
PV0fx = mul_nonIEEE(R1f.x, R1f.w);
PV0fy = mul_nonIEEE(R1f.y, R1f.w);
PV0fz = mul_nonIEEE(R1f.z, R1f.w);
R123f.w = mul_nonIEEE(R2f.x,intBitsToFloat(uf_remappedPS[2].w)) + -(intBitsToFloat(uf_remappedPS[2].y));
R1f.x = mul_nonIEEE(R0f.z, R4f.z);
// 1
tempf.x = dot(vec4(R6f.x,R6f.y,R6f.z,intBitsToFloat(0x80000000)),vec4(PV0fx,PV0fy,PV0fz,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
PS1f = 1.0 / R123f.w;
// 2
PV0fx = max(PV1fx, -(PV1fx));
PV0fy = -(intBitsToFloat(uf_remappedPS[2].z)) * PS1f;
R127f.z = mul_nonIEEE(R0f.w, R2f.w);
R127f.z = clamp(R127f.z, 0.0, 1.0);
R123f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].w),R2f.z) + intBitsToFloat(uf_remappedPS[2].x);
R127f.y = 1.0 / R3f.z;
// 3
R127f.x = mul_nonIEEE(R5f.z,R9f.y) + R3f.w;
PV1fz = -(PV0fy) + R123f.w;
PV1fw = PV0fx + -(intBitsToFloat(uf_remappedPS[0].z));
PS1f = 1.0 / intBitsToFloat(uf_remappedPS[3].y);
// 4
PV0fx = PV1fw * R127f.y;
PV0fx = clamp(PV0fx, 0.0, 1.0);
PV0fy = PV1fz * PS1f;
PV0fy = clamp(PV0fy, 0.0, 1.0);
PV0fz = R8f.x + -(R127f.x);
// 5
backupReg0f = R127f.x;
R127f.x = mul_nonIEEE(R127f.z, PV0fy);
R0f.y = mul_nonIEEE(PV0fz,R8f.w) + backupReg0f;
R123f.z = -2.0 * PV0fx + 3.0;
PV1fw = mul_nonIEEE(PV0fx, PV0fx);
// 6
PV0fy = mul_nonIEEE(PV1fw, R123f.z);
// 7
PV1fx = mul_nonIEEE(R127f.x, PV0fy);
// 8
PV0fw = mul_nonIEEE(R3f.x, PV1fx);
// 9
R7f.w = mul_nonIEEE(R7f.w, PV0fw);
// 0
PV0fx = -(R1f.x) + intBitsToFloat(uf_remappedPS[1].z);
PV0fy = -(R2f.y) + intBitsToFloat(uf_remappedPS[1].y);
// 1
PV1fx = -(R0f.y) + intBitsToFloat(uf_remappedPS[4].x);
R127f.y = mul_nonIEEE(PV0fx,R9f.y) + R1f.x;
R127f.z = mul_nonIEEE(PV0fy,R9f.y) + R2f.y;
// 2
R7f.x = mul_nonIEEE(PV1fx,R9f.x) + R0f.y;
PV0fz = R8f.z + -(R127f.y);
PV0fw = R8f.y + -(R127f.z);
// 3
R127f.x = mul_nonIEEE(PV0fw,R8f.w) + R127f.z;
R127f.w = mul_nonIEEE(PV0fz,R8f.w) + R127f.y;
// 4
PV0fx = -(R127f.w) + intBitsToFloat(uf_remappedPS[4].z);
PV0fy = -(R127f.x) + intBitsToFloat(uf_remappedPS[4].y);
// 5
R7f.y = mul_nonIEEE(PV0fy,R9f.x) + R127f.x;
R7f.z = mul_nonIEEE(PV0fx,R9f.x) + R127f.w;
// export
if( ((vec4(R7f.x, R7f.y, R7f.z, R7f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R7f.x, R7f.y, R7f.z, R7f.w);
}
