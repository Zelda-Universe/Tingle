#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 1750a8878be6ea5a
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[5];
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
vec4 R10f = vec4(0.0);
vec4 R11f = vec4(0.0);
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
R5f = passParameterSem8;
R6f = passParameterSem11;
R7f = passParameterSem14;
R8f = passParameterSem15;
R9f = passParameterSem16;
R10f.xw = (texture(textureUnitPS0, vec2(R5f.x,R5f.y)).xw);
// 0
PV0fx = R0f.w + 0.5;
R123f.y = R10f.w * 2.0 + -(1.0);
R123f.z = R10f.x * 2.0 + -(1.0);
R10f.w = R0f.w * 2.0 + -(1.0);
PS0f = 1.0 / R3f.w;
// 1
PV1fx = fract(PV0fx);
R10f.y = mul_nonIEEE(R3f.y, PS0f);
PV1fz = mul_nonIEEE(R4f.y, R123f.y);
PV1fw = mul_nonIEEE(R4f.y, R123f.z);
R10f.x = mul_nonIEEE(R3f.x, PS0f);
// 2
R5f.x = mul_nonIEEE(R0f.w,PV1fw) + R5f.z;
R5f.y = mul_nonIEEE(R0f.w,PV1fz) + R5f.w;
R5f.z = mul_nonIEEE(PV1fw,PV1fx) + R5f.z;
R5f.w = mul_nonIEEE(PV1fz,PV1fx) + R5f.w;
R11f.y = 0.0;
R5f.x = (texture(textureUnitPS1, vec2(R5f.x,R5f.y)).x);
R5f.z = (texture(textureUnitPS1, vec2(R5f.z,R5f.w)).x);
R10f.y = (texture(textureUnitPS4, vec2(R10f.x,R10f.y)).x);
// 0
tempf.x = dot(vec4(R10f.w,R11f.y,R11f.y,intBitsToFloat(0x80000000)),vec4(R10f.w,R11f.y,R11f.y,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R127f.w = -(R5f.x) + R5f.z;
// 1
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(R2f.x,R2f.y,R2f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
R127f.z = tempf.x;
PV1fw = tempf.x;
PS1f = sqrt(PV0fx);
// 2
R127f.x = mul_nonIEEE(R127f.w,PS1f) + R5f.x;
R127f.y = R0f.y + -(R1f.y);
R126f.z = R0f.x + -(R1f.x);
R127f.w = R0f.z + -(R1f.z);
PS0f = 1.0 / R3f.w;
// 3
backupReg0f = R127f.z;
R126f.x = R7f.x + 0.0;
R126f.y = R7f.y + 0.0;
R127f.z = R3f.z * PS0f;
R126f.w = R7f.z + 0.0;
tempResultf = 1.0 / sqrt(backupReg0f);
PS1f = tempResultf;
// 4
PV0fx = mul_nonIEEE(R2f.x, PS1f);
PV0fy = mul_nonIEEE(R2f.y, PS1f);
PV0fz = mul_nonIEEE(R2f.z, PS1f);
R125f.w = mul_nonIEEE(R126f.z,R127f.x) + R1f.x;
R126f.z = mul_nonIEEE(R127f.y,R127f.x) + R1f.y;
// 5
tempf.x = dot(vec4(R6f.x,R6f.y,R6f.z,intBitsToFloat(0x80000000)),vec4(PV0fx,PV0fy,PV0fz,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R127f.y = mul_nonIEEE(R127f.w,R127f.x) + R1f.z;
// 6
PV0fx = R126f.w + 0.0;
R123f.y = mul_nonIEEE(R127f.z,intBitsToFloat(uf_remappedPS[0].w)) + -(intBitsToFloat(uf_remappedPS[0].y));
PV0fz = R126f.y + 0.0;
PV0fw = R126f.x + 0.0;
R126f.x = max(PV1fx, -(PV1fx));
// 7
R6f.x = mul_nonIEEE(R125f.w, PV0fw);
PV1fy = -(intBitsToFloat(uf_remappedPS[1].z)) + intBitsToFloat(uf_remappedPS[1].w);
R6f.z = mul_nonIEEE(R127f.y, PV0fx);
R3f.w = mul_nonIEEE(R126f.z, PV0fz);
PS1f = 1.0 / R123f.y;
// 8
PV0fx = -(intBitsToFloat(uf_remappedPS[0].z)) * PS1f;
R126f.y = R1f.w;
R126f.y = clamp(R126f.y, 0.0, 1.0);
R123f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w),R10f.y) + intBitsToFloat(uf_remappedPS[0].x);
R127f.y = 1.0 / PV1fy;
// 9
PV1fz = -(PV0fx) + R123f.w;
PV1fw = R126f.x + -(intBitsToFloat(uf_remappedPS[1].z));
PS1f = 1.0 / intBitsToFloat(uf_remappedPS[2].y);
// 10
PV0fx = PV1fw * R127f.y;
PV0fx = clamp(PV0fx, 0.0, 1.0);
PV0fy = PV1fz * PS1f;
PV0fy = clamp(PV0fy, 0.0, 1.0);
// 11
R126f.x = mul_nonIEEE(R126f.y, PV0fy);
R123f.z = -2.0 * PV0fx + 3.0;
PV1fw = mul_nonIEEE(PV0fx, PV0fx);
// 12
PV0fy = mul_nonIEEE(PV1fw, R123f.z);
// 13
PV1fx = mul_nonIEEE(R126f.x, PV0fy);
// 14
R4f.w = mul_nonIEEE(R4f.x, PV1fx);
// 0
PV0fx = -(R3f.w) + intBitsToFloat(uf_remappedPS[3].y);
PV0fy = -(R6f.x) + intBitsToFloat(uf_remappedPS[3].x);
PV0fw = -(R6f.z) + intBitsToFloat(uf_remappedPS[3].z);
// 1
R126f.x = mul_nonIEEE(PV0fw,R9f.y) + R6f.z;
R126f.y = mul_nonIEEE(PV0fx,R9f.y) + R3f.w;
R126f.z = mul_nonIEEE(PV0fy,R9f.y) + R6f.x;
// 2
PV0fy = R8f.z + -(R126f.x);
PV0fz = R8f.y + -(R126f.y);
PV0fw = R8f.x + -(R126f.z);
// 3
backupReg0f = R126f.x;
R126f.x = mul_nonIEEE(PV0fw,R8f.w) + R126f.z;
R126f.z = mul_nonIEEE(PV0fy,R8f.w) + backupReg0f;
R125f.w = mul_nonIEEE(PV0fz,R8f.w) + R126f.y;
// 4
PV0fx = -(R125f.w) + intBitsToFloat(uf_remappedPS[4].y);
PV0fy = -(R126f.x) + intBitsToFloat(uf_remappedPS[4].x);
PV0fw = -(R126f.z) + intBitsToFloat(uf_remappedPS[4].z);
// 5
R4f.x = mul_nonIEEE(PV0fy,R9f.x) + R126f.x;
R4f.y = mul_nonIEEE(PV0fx,R9f.x) + R125f.w;
R4f.z = mul_nonIEEE(PV0fw,R9f.x) + R126f.z;
// export
if( ((vec4(R4f.x, R4f.y, R4f.z, R4f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R4f.x, R4f.y, R4f.z, R4f.w);
}
