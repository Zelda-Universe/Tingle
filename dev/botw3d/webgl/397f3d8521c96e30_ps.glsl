#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 397f3d8521c96e30
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
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem4;
in vec4 passParameterSem5;
in vec4 passParameterSem7;
in vec4 passParameterSem8;
in vec4 passParameterSem9;
in vec4 passParameterSem12;
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
R2f = passParameterSem4;
R3f = passParameterSem5;
R4f = passParameterSem7;
R5f = passParameterSem8;
R6f = passParameterSem9;
R7f = passParameterSem12;
R8f = passParameterSem14;
R9f = passParameterSem15;
R10f = passParameterSem16;
R3f.xw = (texture(textureUnitPS0, vec2(R5f.x,R5f.y)).xw);
// 0
R123f.x = R3f.x * 2.0 + -(1.0);
PV0fy = 1.0;
R123f.w = R3f.w * 2.0 + -(1.0);
// 1
PV1fx = mul_nonIEEE(PV0fy, intBitsToFloat(uf_remappedPS[0].w));
PV1fy = mul_nonIEEE(R3f.y, R123f.w);
PV1fz = mul_nonIEEE(R2f.y, R123f.x);
// 2
R3f.x = mul_nonIEEE(R3f.z,PV1fz) + R6f.x;
R3f.y = mul_nonIEEE(R3f.z,PV1fy) + R6f.y;
R3f.z = R5f.z + PV1fz;
R3f.w = R5f.w + PV1fy;
R5f.x = mul_nonIEEE(R7f.z,intBitsToFloat(uf_remappedPS[0].z)) + PV1fx;
R6f.xw = (texture(textureUnitPS2, vec2(R3f.x,R3f.y)).xw);
R3f.x = (texture(textureUnitPS1, vec2(R3f.z,R3f.w)).w);
// 0
tempf.x = dot(vec4(R7f.x,R7f.y,R5f.x,0.0),vec4(intBitsToFloat(uf_remappedPS[0].x),intBitsToFloat(uf_remappedPS[0].y),1.0,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = mul_nonIEEE(R6f.w, R6f.w);
// 1
PV1fx = mul_nonIEEE(R6f.x, R6f.x);
R127f.y = mul_nonIEEE(R4f.w, R3f.x);
PV1fz = mul_nonIEEE(R4f.w, PS0f);
PV1fw = -(PV0fx) + -100.0;
// 2
R127f.x = mul_nonIEEE(PV1fz, R127f.y);
R126f.y = -(R0f.w) + R127f.y;
R126f.y = clamp(R126f.y, 0.0, 1.0);
R127f.z = PV1fw * intBitsToFloat(0x3ba3d70a);
R127f.z = clamp(R127f.z, 0.0, 1.0);
PV0fw = mul_nonIEEE(R4f.w, PV1fx);
// 3
PV1fx = mul_nonIEEE(R0f.z, R127f.z);
PV1fy = mul_nonIEEE(R0f.x, R127f.z);
PV1fz = mul_nonIEEE(R0f.y, R127f.z);
R126f.w = mul_nonIEEE(PV0fw, R127f.y);
R127f.w = mul_nonIEEE(R1f.x, R127f.z);
// 4
R123f.x = mul_nonIEEE(PV1fx,R127f.x) + intBitsToFloat(0x3d23d70a);
R123f.y = mul_nonIEEE(PV1fz,R127f.x) + intBitsToFloat(0x3c75c28f);
R123f.z = mul_nonIEEE(PV1fy,R127f.x) + intBitsToFloat(0x3c75c28f);
PV0fw = mul_nonIEEE(R1f.y, R127f.z);
PS0f = mul_nonIEEE(R1f.z, R127f.z);
// 5
R127f.x = mul_nonIEEE(R126f.w,R127f.w) + R123f.z;
PV1fy = mul_nonIEEE(R1f.w, R126f.y);
PV1fy = clamp(PV1fy, 0.0, 1.0);
R127f.z = mul_nonIEEE(R126f.w,PS0f) + R123f.x;
R127f.w = mul_nonIEEE(R126f.w,PV0fw) + R123f.y;
// 6
PV0fx = -(R127f.z) + intBitsToFloat(uf_remappedPS[1].z);
PV0fy = -(R127f.w) + intBitsToFloat(uf_remappedPS[1].y);
PV0fz = -(R127f.x) + intBitsToFloat(uf_remappedPS[1].x);
PV0fw = mul_nonIEEE(R2f.x, PV1fy);
// 7
R126f.y = mul_nonIEEE(PV0fx,R10f.y) + R127f.z;
R127f.z = mul_nonIEEE(PV0fy,R10f.y) + R127f.w;
R127f.w = mul_nonIEEE(PV0fz,R10f.y) + R127f.x;
R8f.w = mul_nonIEEE(R8f.w, PV0fw);
// 8
PV0fx = R9f.x + -(R127f.w);
PV0fz = R9f.z + -(R126f.y);
PV0fw = R9f.y + -(R127f.z);
// 9
backupReg0f = R126f.y;
R127f.x = mul_nonIEEE(PV0fw,R9f.w) + R127f.z;
R126f.y = mul_nonIEEE(PV0fx,R9f.w) + R127f.w;
R127f.w = mul_nonIEEE(PV0fz,R9f.w) + backupReg0f;
// 10
PV0fx = -(R127f.w) + intBitsToFloat(uf_remappedPS[2].z);
PV0fy = -(R127f.x) + intBitsToFloat(uf_remappedPS[2].y);
PV0fz = -(R126f.y) + intBitsToFloat(uf_remappedPS[2].x);
// 11
R8f.x = mul_nonIEEE(PV0fz,R10f.x) + R126f.y;
R8f.y = mul_nonIEEE(PV0fy,R10f.x) + R127f.x;
R8f.z = mul_nonIEEE(PV0fx,R10f.x) + R127f.w;
// export
if( ((vec4(R8f.x, R8f.y, R8f.z, R8f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R8f.x, R8f.y, R8f.z, R8f.w);
}
