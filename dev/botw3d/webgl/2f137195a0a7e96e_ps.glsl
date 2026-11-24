#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 2f137195a0a7e96e
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[6];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(1, 1, 0) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 1) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(3, 1, 2) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 3) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(5, 1, 4) uniform sampler2D textureUnitPS5;
TEXTURE_LAYOUT(6, 1, 5) uniform sampler2D textureUnitPS6;
in vec4 passParameterSem0;
in vec4 passParameterSem3;
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
vec4 R8f = vec4(0.0);
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
R1f = passParameterSem3;
R2f = passParameterSem4;
R3f = passParameterSem5;
R4f = passParameterSem7;
R5f.xy = (texture(textureUnitPS3, vec2(R0f.z,R0f.w)).xy);
R3f.z = (texture(textureUnitPS1, vec2(R0f.x,R0f.y)).x);
R6f.xw = (texture(textureUnitPS4, vec2(R0f.x,R0f.y)).xw);
R8f.xw = (texture(textureUnitPS2, vec2(R0f.z,R0f.w)).xw);
R7f.xyzw = (texture(textureUnitPS5, vec2(R0f.x,R0f.y)).xyzw);
R0f.z = (texture(textureUnitPS6, vec2(R0f.z,R0f.w)).x);
// 0
R124f.x = R5f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R127f.y = -(intBitsToFloat(uf_remappedPS[0].y)) + intBitsToFloat(uf_remappedPS[1].y);
R127f.z = -(intBitsToFloat(uf_remappedPS[0].x)) + intBitsToFloat(uf_remappedPS[1].x);
R127f.w = fract(R4f.x);
R127f.x = fract(R4f.y);
// 1
PV1fx = -(intBitsToFloat(uf_remappedPS[0].z)) + intBitsToFloat(uf_remappedPS[1].z);
R126f.y = mul_nonIEEE(R1f.z, R2f.x);
R126f.z = mul_nonIEEE(R1f.y, R2f.z);
R125f.w = mul_nonIEEE(R1f.x, R2f.y);
R126f.x = -(R6f.w) + 1.0;
// 2
backupReg0f = R127f.y;
backupReg1f = R127f.z;
R125f.x = R5f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R127f.y = mul_nonIEEE(PV1fx,R3f.z) + intBitsToFloat(uf_remappedPS[0].z);
R127f.z = mul_nonIEEE(backupReg0f,R3f.z) + intBitsToFloat(uf_remappedPS[0].y);
R126f.w = mul_nonIEEE(backupReg1f,R3f.z) + intBitsToFloat(uf_remappedPS[0].x);
R125f.z = mul_nonIEEE(R124f.x, R124f.x);
// 3
backupReg0f = R127f.x;
R127f.x = R127f.w + -(0.5);
PV1fy = intBitsToFloat(uf_remappedPS[2].z) + -(R127f.y);
PV1fz = intBitsToFloat(uf_remappedPS[2].y) + -(R127f.z);
PV1fw = intBitsToFloat(uf_remappedPS[2].x) + -(R126f.w);
R124f.z = backupReg0f + -(0.5);
// 4
backupReg0f = R126f.x;
backupReg1f = R127f.y;
backupReg2f = R127f.z;
R126f.x = mul_nonIEEE(PV1fw,backupReg0f) + R126f.w;
R127f.y = mul_nonIEEE(-(R2f.y),R1f.z) + R126f.z;
R127f.z = mul_nonIEEE(PV1fy,backupReg0f) + backupReg1f;
R126f.w = mul_nonIEEE(PV1fz,backupReg0f) + backupReg2f;
R125f.y = mul_nonIEEE(-(R2f.x),R1f.y) + R125f.w;
// 5
backupReg0f = R127f.x;
R127f.x = mul_nonIEEE(R2f.w, R125f.x);
R123f.y = mul_nonIEEE(R125f.x,R125f.x) + R125f.z;
R123f.y = clamp(R123f.y, 0.0, 1.0);
R125f.z = mul_nonIEEE(-(R2f.z),R1f.x) + R126f.y;
R123f.w = mul_nonIEEE(-(backupReg0f),backupReg0f) + 1.0;
R123f.w = clamp(R123f.w, 0.0, 1.0);
R122f.x = mul_nonIEEE(-(R124f.z),R124f.z) + 1.0;
R122f.x = clamp(R122f.x, 0.0, 1.0);
// 6
PV0fx = intBitsToFloat(uf_remappedPS[3].y) + -(R126f.w);
PV0fy = intBitsToFloat(uf_remappedPS[3].x) + -(R126f.x);
R124f.z = intBitsToFloat(uf_remappedPS[3].z) + -(R127f.z);
R125f.w = mul_nonIEEE(R123f.w, R122f.x);
R125f.x = -(R123f.y) + 1.0;
// 7
PV1fx = mul_nonIEEE(R125f.z, R127f.x);
PV1fy = mul_nonIEEE(R127f.y, R127f.x);
R125f.z = mul_nonIEEE(PV0fy,R6f.x) + R126f.x;
PV1fw = mul_nonIEEE(R125f.y, R127f.x);
R125f.y = mul_nonIEEE(PV0fx,R6f.x) + R126f.w;
// 8
backupReg0f = R124f.x;
backupReg1f = R125f.w;
R124f.x = mul_nonIEEE(R124f.z,R6f.x) + R127f.z;
R127f.y = mul_nonIEEE(R2f.y,backupReg0f) + PV1fx;
R127f.z = mul_nonIEEE(R2f.x,backupReg0f) + PV1fy;
R125f.w = mul_nonIEEE(R2f.z,backupReg0f) + PV1fw;
PS0f = mul_nonIEEE(backupReg1f, backupReg1f);
// 9
backupReg0f = R125f.x;
R125f.x = intBitsToFloat(uf_remappedPS[4].z) + -(R124f.x);
R126f.y = mul_nonIEEE(R8f.x, PS0f);
PV1fz = intBitsToFloat(uf_remappedPS[4].y) + -(R125f.y);
PV1fw = intBitsToFloat(uf_remappedPS[4].x) + -(R125f.z);
PS1f = sqrt(backupReg0f);
// 10
backupReg0f = R125f.z;
R127f.x = mul_nonIEEE(R1f.x,PS1f) + R127f.z;
R127f.y = mul_nonIEEE(R1f.y,PS1f) + R127f.y;
R125f.z = mul_nonIEEE(R1f.z,PS1f) + R125f.w;
R125f.w = mul_nonIEEE(PV1fw,R3f.x) + backupReg0f;
R126f.w = mul_nonIEEE(PV1fz,R3f.x) + R125f.y;
// 11
backupReg0f = R125f.x;
R125f.x = R126f.y * 63.75;
R126f.y = R7f.y + -(R126f.w);
R127f.z = mul_nonIEEE(backupReg0f,R3f.x) + R124f.x;
R127f.w = intBitsToFloat(0x3d008081);
R126f.z = intBitsToFloat(uf_remappedPS[5].z);
// 12
tempf.x = dot(vec4(R127f.x,R127f.y,R125f.z,intBitsToFloat(0x80000000)),vec4(R127f.x,R127f.y,R125f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = R7f.x + -(R125f.w);
// 13
backupReg0f = R125f.x;
R125f.x = (R0f.z * 0.25 + 0.75)/2.0;
R125f.y = floor(backupReg0f);
R125f.y *= 4.0;
R124f.z = mul_nonIEEE(PS0f,R7f.w) + R125f.w;
PV1fw = R7f.z + -(R127f.z);
tempResultf = 1.0 / sqrt(PV0fx);
PS1f = tempResultf;
// 14
backupReg0f = R127f.z;
R127f.x = mul_nonIEEE(R127f.x, PS1f);
R123f.y = mul_nonIEEE(R126f.y,R7f.w) + R126f.w;
R127f.z = mul_nonIEEE(R127f.y, PS1f);
R123f.w = mul_nonIEEE(PV1fw,R7f.w) + backupReg0f;
R126f.w = mul_nonIEEE(R125f.z, PS1f);
// 15
PV1fx = R125f.y + 2.0;
R7f.y = mul_nonIEEE(R8f.w, R123f.y);
R7f.z = mul_nonIEEE(R8f.w, R123f.w);
R3f.w = 1.0;
R7f.x = mul_nonIEEE(R8f.w, R124f.z);
// 16
R3f.x = R127f.w;
R3f.y = R126f.z;
R8f.z = mul_nonIEEE(R126f.w,R125f.x) + 0.5;
R8f.w = PV1fx * intBitsToFloat(0x3b808081);
R8f.x = mul_nonIEEE(R127f.x,R125f.x) + 0.5;
// 17
R8f.y = mul_nonIEEE(R127f.z,R125f.x) + 0.5;
R7f.w = intBitsToFloat(0x3e808081);
// 18
R2f.x = R8f.x;
R2f.y = R8f.y;
R2f.z = R8f.z;
R2f.w = R8f.w;
// 19
R1f.x = R7f.x;
R1f.y = R7f.y;
R1f.z = R7f.z;
R1f.w = R7f.w;
// 20
R0f.x = R3f.x;
R0f.y = R3f.y;
R0f.z = R3f.z;
R0f.w = R3f.w;
// export
passPixelColor0 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
passPixelColor1 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
passPixelColor3 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
}
