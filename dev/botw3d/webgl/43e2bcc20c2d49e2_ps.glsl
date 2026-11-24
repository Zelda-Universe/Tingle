#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 43e2bcc20c2d49e2
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
in vec4 passParameterSem5;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem6;
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
vec4 R122f = vec4(0.0);
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
R1f = passParameterSem5;
R2f = passParameterSem3;
R3f = passParameterSem4;
R4f = passParameterSem6;
R5f.xy = (texture(textureUnitPS4, vec2(R0f.x,R0f.y)).xy);
R6f.xyz = (texture(textureUnitPS3, vec2(R0f.x,R0f.y)).xyz);
R0f.w = (texture(textureUnitPS6, vec2(R0f.x,R0f.y)).w);
// 0
R126f.x = R5f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
PV0fy = mul_nonIEEE(R2f.y, R3f.z);
PV0fz = mul_nonIEEE(R2f.x, R3f.y);
PV0fw = mul_nonIEEE(R2f.z, R3f.x);
R127f.z = R5f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
// 1
backupReg0f = R127f.z;
R127f.x = mul_nonIEEE(-(R3f.z),R2f.x) + PV0fw;
R127f.y = mul_nonIEEE(-(R3f.y),R2f.z) + PV0fy;
R126f.z = mul_nonIEEE(-(R3f.x),R2f.y) + PV0fz;
PV1fw = mul_nonIEEE(R126f.x, R126f.x);
R127f.w = mul_nonIEEE(R3f.w, backupReg0f);
// 2
tempf.x = dot(vec4(R4f.x,R4f.y,R4f.z,intBitsToFloat(0x80000000)),vec4(R4f.x,R4f.y,R4f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R122f.x = mul_nonIEEE(R127f.z,R127f.z) + PV1fw;
R122f.x = clamp(R122f.x, 0.0, 1.0);
// 3
backupReg0f = R127f.x;
R127f.x = -(R122f.x) + 1.0;
PV1fy = mul_nonIEEE(R127f.y, R127f.w);
PV1fz = mul_nonIEEE(backupReg0f, R127f.w);
PV1fw = mul_nonIEEE(R126f.z, R127f.w);
PS1f = sqrt(PV0fx);
// 4
backupReg0f = R126f.x;
R126f.x = mul_nonIEEE(R3f.z,backupReg0f) + PV1fw;
R127f.y = mul_nonIEEE(R3f.y,backupReg0f) + PV1fz;
R126f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), intBitsToFloat(uf_remappedPS[1].w));
R127f.w = mul_nonIEEE(R3f.x,backupReg0f) + PV1fy;
PS0f = 1.0 / PS1f;
// 5
backupReg0f = R127f.x;
R127f.x = mul_nonIEEE(R4f.x, PS0f);
R126f.y = mul_nonIEEE(R4f.y, PS0f);
R127f.z = mul_nonIEEE(R4f.z, PS0f);
R126f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].y), intBitsToFloat(uf_remappedPS[1].w));
PS1f = sqrt(backupReg0f);
// 6
R125f.x = mul_nonIEEE(R2f.x,PS1f) + R127f.w;
R127f.y = mul_nonIEEE(R2f.y,PS1f) + R127f.y;
R125f.z = mul_nonIEEE(R2f.z,PS1f) + R126f.x;
R127f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].z), intBitsToFloat(uf_remappedPS[1].w));
R126f.x = intBitsToFloat(0x3ce0e0e1);
// 7
tempf.x = dot(vec4(R127f.x,R126f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(R125f.x,R127f.y,R125f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R3f.w = R0f.w;
// 8
tempf.x = dot(vec4(R127f.x,R126f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(R126f.z,R126f.w,R127f.w,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = PV1fx + 1.0;
PS0f = clamp(PS0f, 0.0, 1.0);
// 9
R3f.x = R126f.x;
R0f.y = R127f.y * 0.5 + 0.5;
PV1fz = max(-(PV0fx), 0.0);
R4f.w = intBitsToFloat(0x3c008081);
tempResultf = max(0.0, PS0f);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R2f.y = tempResultf;
// 10
R0f.x = R125f.x * 0.5 + 0.5;
PV0fy = min(PV1fz, 1.0);
R0f.z = R125f.z * 0.5 + 0.5;
R0f.w = 0.0;
// 11
R2f.x = mul_nonIEEE(PV0fy, PV0fy);
// 0
PV0fx = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].y), R2f.y);
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].w), R6f.y);
R125f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].w), R6f.x);
R127f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].w), R6f.z);
// 1
PV1fz = intBitsToFloat(uf_remappedPS[4].z);
PS1f = exp2(PV0fx);
PS1f = clamp(PS1f, 0.0, 1.0);
// 2
R3f.y = PV1fz;
PV0fw = mul_nonIEEE(PS1f, R2f.x);
// 3
R123f.y = mul_nonIEEE(R127f.w,PV0fw) + R6f.z;
R123f.z = mul_nonIEEE(R127f.y,PV0fw) + R6f.y;
R123f.w = mul_nonIEEE(R125f.z,PV0fw) + R6f.x;
// 4
R4f.x = mul_nonIEEE(R1f.x, R123f.w);
R4f.y = mul_nonIEEE(R1f.x, R123f.z);
R4f.z = mul_nonIEEE(R1f.x, R123f.y);
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
