#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 0f82a61688881b12
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[5];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(3, 1, 0) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 1) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(6, 1, 2) uniform sampler2D textureUnitPS6;
in vec4 passParameterSem0;
in vec4 passParameterSem2;
in vec4 passParameterSem6;
in vec4 passParameterSem4;
in vec4 passParameterSem5;
in vec4 passParameterSem7;
layout(location = 0) out vec4 passPixelColor0;
layout(location = 1) out vec4 passPixelColor1;
layout(location = 3) out vec4 passPixelColor3;
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
vec4 R122f = vec4(0.0);
vec4 R123f = vec4(0.0);
vec4 R124f = vec4(0.0);
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
R1f = passParameterSem2;
R2f = passParameterSem6;
R3f = passParameterSem4;
R4f = passParameterSem5;
R5f = passParameterSem7;
R6f.xy = (texture(textureUnitPS4, vec2(R0f.x,R0f.y)).xy);
R7f.xyz = (texture(textureUnitPS3, vec2(R0f.x,R0f.y)).xyz);
R0f.w = (texture(textureUnitPS6, vec2(R0f.x,R0f.y)).w);
// 0
R127f.x = R1f.x + R3f.x;
R126f.y = R1f.y + R3f.y;
R127f.z = R1f.z + R3f.z;
R125f.w = R6f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R127f.y = R6f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
// 1
tempf.x = dot(vec4(R127f.x,R126f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(R127f.x,R126f.y,R127f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
PS1f = mul_nonIEEE(R125f.w, R125f.w);
// 2
R124f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), intBitsToFloat(uf_remappedPS[1].w));
R1f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].y), intBitsToFloat(uf_remappedPS[1].w));
R123f.z = mul_nonIEEE(R127f.y,R127f.y) + PS1f;
R123f.z = clamp(R123f.z, 0.0, 1.0);
R126f.w = mul_nonIEEE(R4f.w, R127f.y);
tempResultf = 1.0 / sqrt(PV1fx);
PS0f = tempResultf;
// 3
R125f.x = mul_nonIEEE(R127f.z, PS0f);
R125f.y = mul_nonIEEE(R126f.y, PS0f);
R125f.z = mul_nonIEEE(R127f.x, PS0f);
PV1fw = -(R123f.z) + 1.0;
R124f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].z), intBitsToFloat(uf_remappedPS[1].w));
// 4
R126f.x = intBitsToFloat(0x3ce0e0e1);
PV0fy = mul_nonIEEE(R4f.y, R125f.z);
PV0fz = mul_nonIEEE(R4f.x, R125f.x);
PV0fw = mul_nonIEEE(R4f.z, R125f.y);
R124f.y = sqrt(PV1fw);
// 5
R127f.x = mul_nonIEEE(-(R4f.y),R125f.x) + PV0fw;
R126f.y = mul_nonIEEE(R5f.z, R5f.z);
R127f.z = mul_nonIEEE(-(R4f.x),R125f.y) + PV0fy;
R127f.w = mul_nonIEEE(-(R4f.z),R125f.z) + PV0fz;
R3f.w = R0f.w;
// 6
PV0fx = mul_nonIEEE(R125f.z, R127f.z);
PV0fy = mul_nonIEEE(R125f.x, R127f.w);
R126f.z = mul_nonIEEE(R127f.x, R126f.w);
PV0fw = mul_nonIEEE(R125f.y, R127f.x);
R127f.y = mul_nonIEEE(R127f.w, R126f.w);
// 7
R123f.x = mul_nonIEEE(-(R125f.z),R127f.w) + PV0fw;
R123f.y = mul_nonIEEE(-(R125f.x),R127f.x) + PV0fx;
R123f.z = mul_nonIEEE(-(R125f.y),R127f.z) + PV0fy;
PV1fw = mul_nonIEEE(R127f.z, R126f.w);
R122f.x = mul_nonIEEE(R5f.y,R5f.y) + R126f.y;
// 8
backupReg0f = R123f.y;
backupReg1f = R123f.z;
R123f.x = mul_nonIEEE(R125f.w,R123f.x) + PV1fw;
R123f.y = mul_nonIEEE(R5f.x,R5f.x) + R122f.x;
R123f.z = mul_nonIEEE(R125f.w,backupReg0f) + R127f.y;
R123f.w = mul_nonIEEE(R125f.w,backupReg1f) + R126f.z;
R3f.x = R126f.x;
// 9
backupReg0f = R125f.x;
R125f.x = mul_nonIEEE(R124f.y,R125f.z) + R123f.w;
R125f.y = mul_nonIEEE(R124f.y,R125f.y) + R123f.z;
R125f.z = mul_nonIEEE(R124f.y,backupReg0f) + R123f.x;
R4f.w = intBitsToFloat(0x3c008081);
PS1f = sqrt(R123f.y);
// 10
tempf.x = dot(vec4(R125f.x,R125f.y,R125f.z,intBitsToFloat(0x80000000)),vec4(R125f.x,R125f.y,R125f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = 1.0 / PS1f;
// 11
R126f.x = mul_nonIEEE(R5f.x, PS0f);
R124f.y = mul_nonIEEE(R5f.y, PS0f);
R126f.z = mul_nonIEEE(R5f.z, PS0f);
R0f.w = 0.0;
tempResultf = 1.0 / sqrt(PV0fx);
PS1f = tempResultf;
// 12
R125f.x = mul_nonIEEE(R125f.x, PS1f);
R125f.y = mul_nonIEEE(R125f.y, PS1f);
R125f.z = mul_nonIEEE(R125f.z, PS1f);
PS0f = mul_nonIEEE(R126f.z, R124f.z);
// 13
tempf.x = dot(vec4(R126f.x,R124f.y,R126f.z,intBitsToFloat(0x80000000)),vec4(R125f.x,R125f.y,R125f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R122f.x = mul_nonIEEE(R124f.y,R1f.y) + PS0f;
// 14
PV0fx = PV1fx + 1.0;
PV0fx = clamp(PV0fx, 0.0, 1.0);
R0f.y = R125f.y * 0.5 + 0.5;
R123f.z = mul_nonIEEE(R126f.x,R124f.x) + R122f.x;
R0f.x = R125f.x * 0.5 + 0.5;
// 15
PV1fz = max(-(R123f.z), 0.0);
tempResultf = max(0.0, PV0fx);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R1f.y = tempResultf;
// 16
PV0fy = min(PV1fz, 1.0);
R0f.z = R125f.z * 0.5 + 0.5;
// 17
R5f.x = mul_nonIEEE(PV0fy, PV0fy);
// 0
PV0fx = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].y), R1f.y);
R125f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].w), R7f.y);
R125f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].w), R7f.x);
R125f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].w), R7f.z);
// 1
PV1fz = intBitsToFloat(uf_remappedPS[4].z);
PS1f = exp2(PV0fx);
PS1f = clamp(PS1f, 0.0, 1.0);
// 2
R3f.y = PV1fz;
PV0fw = mul_nonIEEE(PS1f, R5f.x);
// 3
R123f.y = mul_nonIEEE(R125f.w,PV0fw) + R7f.z;
R123f.z = mul_nonIEEE(R125f.y,PV0fw) + R7f.y;
R123f.w = mul_nonIEEE(R125f.z,PV0fw) + R7f.x;
// 4
R4f.x = mul_nonIEEE(R2f.x, R123f.w);
R4f.y = mul_nonIEEE(R2f.x, R123f.z);
R4f.z = mul_nonIEEE(R2f.x, R123f.y);
// 5
R2f.x = R0f.x;
R2f.y = R0f.y;
R2f.z = R0f.z;
R2f.w = R0f.w;
// 6
R1f.x = R4f.x;
R1f.y = R4f.y;
R1f.z = R4f.z;
R1f.w = R4f.w;
// 7
R0f.x = R3f.x;
R0f.y = R3f.y;
R0f.z = R3f.z;
R0f.w = R3f.w;
// export
if( ((vec4(R0f.x, R0f.y, R0f.z, R0f.w)).a >= uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
passPixelColor1 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
passPixelColor3 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
}
