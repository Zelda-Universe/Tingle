#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 29c30aaa023dc7e6
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
TEXTURE_LAYOUT(2, 1, 2) uniform sampler2D textureUnitPS2;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem4;
in vec4 passParameterSem5;
in vec4 passParameterSem7;
in vec4 passParameterSem8;
in vec4 passParameterSem9;
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
R1f = passParameterSem1;
R2f = passParameterSem4;
R3f = passParameterSem5;
R4f = passParameterSem7;
R5f = passParameterSem8;
R6f = passParameterSem9;
R7f = passParameterSem14;
R8f = passParameterSem15;
R9f = passParameterSem16;
R3f.xw = (texture(textureUnitPS0, vec2(R5f.x,R5f.y)).xw);
// 0
R123f.z = R3f.w * 2.0 + -(1.0);
R123f.w = R3f.x * 2.0 + -(1.0);
// 1
PV1fy = mul_nonIEEE(R2f.y, R123f.w);
PV1fw = mul_nonIEEE(R3f.y, R123f.z);
// 2
backupReg0f = R3f.z;
R3f.x = R5f.z + PV1fy;
R3f.y = R5f.w + PV1fw;
R3f.z = mul_nonIEEE(backupReg0f,PV1fy) + R6f.x;
R3f.w = mul_nonIEEE(backupReg0f,PV1fw) + R6f.y;
R3f.x = (texture(textureUnitPS1, vec2(R3f.x,R3f.y)).w);
R5f.xw = (texture(textureUnitPS2, vec2(R3f.z,R3f.w)).xw);
// 0
R127f.x = mul_nonIEEE(R5f.x, R5f.x);
R123f.z = mul_nonIEEE(R4f.w,R3f.x) + -(R0f.w);
R127f.w = mul_nonIEEE(R5f.w, R5f.w);
// 1
PV1fy = mul_nonIEEE(R1f.w, R123f.z);
PV1fy = clamp(PV1fy, 0.0, 1.0);
// 2
R127f.x = mul_nonIEEE(R127f.x, PV1fy);
PV0fy = PV1fy;
PV0fy = clamp(PV0fy, 0.0, 1.0);
PV0fw = mul_nonIEEE(R127f.w, PV1fy);
// 3
R123f.x = mul_nonIEEE(R0f.z,PV0fw) + intBitsToFloat(0x3d23d70a);
R123f.y = mul_nonIEEE(R0f.y,PV0fw) + intBitsToFloat(0x3c75c28f);
R123f.z = mul_nonIEEE(R0f.x,PV0fw) + intBitsToFloat(0x3c75c28f);
PV1fw = mul_nonIEEE(R2f.x, PV0fy);
// 4
R127f.y = mul_nonIEEE(R1f.z,R127f.x) + R123f.x;
R127f.z = mul_nonIEEE(R1f.y,R127f.x) + R123f.y;
R127f.w = mul_nonIEEE(R1f.x,R127f.x) + R123f.z;
R1f.w = mul_nonIEEE(R7f.w, PV1fw);
// 5
PV1fx = -(R127f.y) + intBitsToFloat(uf_remappedPS[0].z);
PV1fy = -(R127f.z) + intBitsToFloat(uf_remappedPS[0].y);
PV1fz = -(R127f.w) + intBitsToFloat(uf_remappedPS[0].x);
// 6
R127f.y = mul_nonIEEE(PV1fx,R9f.y) + R127f.y;
R127f.z = mul_nonIEEE(PV1fy,R9f.y) + R127f.z;
R127f.w = mul_nonIEEE(PV1fz,R9f.y) + R127f.w;
// 7
PV1fx = R8f.x + -(R127f.w);
PV1fz = R8f.z + -(R127f.y);
PV1fw = R8f.y + -(R127f.z);
// 8
backupReg0f = R127f.y;
R127f.x = mul_nonIEEE(PV1fw,R8f.w) + R127f.z;
R127f.y = mul_nonIEEE(PV1fx,R8f.w) + R127f.w;
R127f.w = mul_nonIEEE(PV1fz,R8f.w) + backupReg0f;
// 9
PV1fx = -(R127f.w) + intBitsToFloat(uf_remappedPS[1].z);
PV1fy = -(R127f.x) + intBitsToFloat(uf_remappedPS[1].y);
PV1fz = -(R127f.y) + intBitsToFloat(uf_remappedPS[1].x);
// 10
R1f.x = mul_nonIEEE(PV1fz,R9f.x) + R127f.y;
R1f.y = mul_nonIEEE(PV1fy,R9f.x) + R127f.x;
R1f.z = mul_nonIEEE(PV1fx,R9f.x) + R127f.w;
// export
if( ((vec4(R1f.x, R1f.y, R1f.z, R1f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
}
