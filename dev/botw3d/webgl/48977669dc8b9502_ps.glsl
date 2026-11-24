#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 48977669dc8b9502
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[4];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(4, 1, 0) uniform sampler2D textureUnitPS4;
in vec4 passParameterSem0;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem7;
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
R1f = passParameterSem3;
R2f = passParameterSem4;
R3f = passParameterSem7;
R4f = passParameterSem15;
R5f = passParameterSem16;
// 0
R7f.x = mul_nonIEEE(R0f.y, R3f.y);
R2f.y = mul_nonIEEE(R0f.x, R3f.x);
R2f.z = mul_nonIEEE(R0f.z, R3f.z);
R2f.w = R3f.w * 1.0;
PS0f = 1.0 / R1f.w;
// 1
R3f.x = mul_nonIEEE(R1f.x, PS0f);
R3f.y = mul_nonIEEE(R1f.y, PS0f);
R3f.z = -(R2f.y) + intBitsToFloat(uf_remappedPS[0].x);
R3f.w = -(R7f.x) + intBitsToFloat(uf_remappedPS[0].y);
R6f.x = 1.0 / R1f.w;
R5f.w = (texture(textureUnitPS4, vec2(R3f.x,R3f.y)).x);
// 0
R127f.x = mul_nonIEEE(R3f.z,R5f.y) + R2f.y;
R127f.y = mul_nonIEEE(R3f.w,R5f.y) + R7f.x;
R1f.z = R1f.z * R6f.x;
PV0fw = -(R2f.z) + intBitsToFloat(uf_remappedPS[0].z);
R1f.y = 1.0 / intBitsToFloat(uf_remappedPS[1].y);
// 1
R126f.x = mul_nonIEEE(PV0fw,R5f.y) + R2f.z;
R0f.y = mul_nonIEEE(R0f.w, R2f.w);
R0f.y = clamp(R0f.y, 0.0, 1.0);
PV1fz = R4f.y + -(R127f.y);
PV1fw = R4f.x + -(R127f.x);
// 2
R127f.x = mul_nonIEEE(PV1fw,R4f.w) + R127f.x;
PV0fy = R4f.z + -(R126f.x);
R127f.w = mul_nonIEEE(PV1fz,R4f.w) + R127f.y;
// 3
PV1fx = -(R127f.w) + intBitsToFloat(uf_remappedPS[2].y);
PV1fy = -(R127f.x) + intBitsToFloat(uf_remappedPS[2].x);
R127f.z = mul_nonIEEE(PV0fy,R4f.w) + R126f.x;
// 4
R4f.x = mul_nonIEEE(PV1fy,R5f.x) + R127f.x;
R4f.y = mul_nonIEEE(PV1fx,R5f.x) + R127f.w;
PV0fw = -(R127f.z) + intBitsToFloat(uf_remappedPS[2].z);
// 5
R4f.z = mul_nonIEEE(PV0fw,R5f.x) + R127f.z;
// 0
R127f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].w),R5f.w) + intBitsToFloat(uf_remappedPS[3].x);
R123f.w = mul_nonIEEE(R1f.z,intBitsToFloat(uf_remappedPS[3].w)) + -(intBitsToFloat(uf_remappedPS[3].y));
// 1
PS1f = 1.0 / R123f.w;
// 2
PV0fx = -(intBitsToFloat(uf_remappedPS[3].z)) * PS1f;
// 3
PV1fz = -(PV0fx) + R127f.x;
// 4
PV0fx = PV1fz * R1f.y;
PV0fx = clamp(PV0fx, 0.0, 1.0);
// 5
PV1fz = mul_nonIEEE(R0f.y, PV0fx);
// 6
R4f.w = mul_nonIEEE(R2f.x, PV1fz);
// export
if( ((vec4(R4f.x, R4f.y, R4f.z, R4f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R4f.x, R4f.y, R4f.z, R4f.w);
}
