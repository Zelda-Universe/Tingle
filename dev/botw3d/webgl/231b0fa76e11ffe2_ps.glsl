#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 231b0fa76e11ffe2
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[4];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(3, 1, 0) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 1) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(5, 1, 2) uniform sampler2D textureUnitPS5;
TEXTURE_LAYOUT(6, 1, 3) uniform sampler2D textureUnitPS6;
TEXTURE_LAYOUT(7, 1, 4) uniform sampler2D textureUnitPS7;
in vec4 passParameterSem0;
in vec4 passParameterSem2;
in vec4 passParameterSem6;
in vec4 passParameterSem4;
in vec4 passParameterSem5;
in vec4 passParameterSem7;
layout(location = 0) out vec4 passPixelColor0;
layout(location = 1) out vec4 passPixelColor1;
layout(location = 3) out vec4 passPixelColor3;
layout(location = 5) out vec4 passPixelColor5;
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
R6f.xy = (texture(textureUnitPS6, vec2(R0f.z,R0f.w)).xx);
R7f.xyz = (texture(textureUnitPS5, vec2(R0f.z,R0f.w)).xyz);
R8f.xyz = (texture(textureUnitPS4, vec2(R0f.z,R0f.w)).xyz);
// 0
PV0fx = mul_nonIEEE(R3f.x, R4f.y);
R127f.y = R7f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
PV0fz = mul_nonIEEE(R3f.z, R4f.x);
PV0fw = mul_nonIEEE(R3f.y, R4f.z);
R127f.x = R7f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
// 1
R126f.x = mul_nonIEEE(-(R4f.y),R3f.z) + PV0fw;
R125f.y = mul_nonIEEE(-(R4f.z),R3f.x) + PV0fz;
R127f.z = mul_nonIEEE(-(R4f.x),R3f.y) + PV0fx;
PV1fw = mul_nonIEEE(R127f.y, R127f.y);
R127f.w = mul_nonIEEE(R4f.w, R127f.x);
// 2
tempf.x = dot(vec4(R5f.x,R5f.y,R5f.z,intBitsToFloat(0x80000000)),vec4(R5f.x,R5f.y,R5f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R122f.x = mul_nonIEEE(R127f.x,R127f.x) + PV1fw;
R122f.x = clamp(R122f.x, 0.0, 1.0);
// 3
PV1fx = mul_nonIEEE(R125f.y, R127f.w);
R126f.y = -(R122f.x) + 1.0;
PV1fz = mul_nonIEEE(R126f.x, R127f.w);
PV1fw = mul_nonIEEE(R127f.z, R127f.w);
PS1f = sqrt(PV0fx);
// 4
backupReg0f = R127f.y;
R9f.x = 0.0;
R127f.y = mul_nonIEEE(R4f.z,backupReg0f) + PV1fw;
R126f.z = mul_nonIEEE(R4f.y,backupReg0f) + PV1fx;
R127f.w = mul_nonIEEE(R4f.x,backupReg0f) + PV1fz;
PS0f = 1.0 / PS1f;
// 5
R5f.x = mul_nonIEEE(R5f.x, PS0f);
R5f.y = mul_nonIEEE(R5f.y, PS0f);
R5f.z = mul_nonIEEE(R5f.z, PS0f);
R3f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), intBitsToFloat(uf_remappedPS[0].x));
R127f.x = sqrt(R126f.y);
// 6
tempf.x = dot(vec4(R4f.x,R4f.y,R4f.z,intBitsToFloat(0x80000000)),vec4(R5f.x,R5f.y,R5f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R4f.x = mul_nonIEEE(R3f.x,R127f.x) + R127f.w;
// 7
tempf.x = dot(vec4(R126f.x,R125f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(R5f.x,R5f.y,R5f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
PS1f = mul_nonIEEE(PV0fx, R6f.x);
// 8
backupReg0f = R6f.y;
R3f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].x),PS1f) + R0f.x;
R6f.y = mul_nonIEEE(R3f.y,R127f.x) + R126f.z;
R2f.z = mul_nonIEEE(R3f.z,R127f.x) + R127f.y;
PV0fw = mul_nonIEEE(PV1fx, backupReg0f);
R3f.z = R5f.x * 1.5;
// 9
R0f.x = R5f.z * 1.5;
R3f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].y),PV0fw) + R0f.y;
R4f.z = R7f.z * 63.75;
R0f.w = R5f.y * 1.5;
R0f.z = 1.0 / intBitsToFloat(uf_remappedPS[0].x);
R7f.xyzw = (texture(textureUnitPS3, vec2(R3f.x,R3f.y)).xyzw);
R4f.w = (texture(textureUnitPS7, vec2(R3f.x,R3f.y)).x);
// 0
R127f.x = dot(vec4(R5f.x,R5f.y,R5f.z,intBitsToFloat(0x80000000)),vec4(R4f.x,R6f.y,R2f.z,0.0));
PV0fy = R127f.x;
PV0fz = R127f.x;
PV0fw = R127f.x;
PS0f = mul_nonIEEE(R1f.w, R0f.z);
// 1
PV1fx = mul_nonIEEE(R127f.x, R127f.x);
PV1fy = mul_nonIEEE(PS0f, PS0f);
R124f.z = -(R7f.x) + R8f.x;
PV1fw = R127f.x + 1.0;
PV1fw = clamp(PV1fw, 0.0, 1.0);
R127f.w = 1.0 / R3f.w;
// 2
R126f.x = mul_nonIEEE(PV1fw,PV1fw) + intBitsToFloat(uf_remappedPS[2].x);
R126f.x = clamp(R126f.x, 0.0, 1.0);
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x), R127f.w);
R126f.z = PV1fx * 2.25 + -1.25;
R125f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].y), R127f.w);
R124f.w = 1.0 / PV1fy;
R124f.w = clamp(R124f.w, 0.0, 1.0);
// 3
tempf.x = dot(vec4(R1f.x,R1f.y,R1f.z,intBitsToFloat(0x80000000)),vec4(R1f.x,R1f.y,R1f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
PS1f = sqrt(R126f.z);
// 4
R127f.x = 1.5 * -(R127f.x) + -(PS1f);
R5f.y = mul_nonIEEE(R2f.w,R7f.w) + R126f.x;
R5f.y = clamp(R5f.y, 0.0, 1.0);
R127f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].z), R127f.w);
R127f.w = (R126f.z >= 0.0)?1.0:0.0;
tempResultf = 1.0 / sqrt(PV1fx);
PS0f = tempResultf;
// 5
R126f.x = mul_nonIEEE(R1f.x, PS0f);
R125f.y = mul_nonIEEE(R1f.y, PS0f);
R125f.z = mul_nonIEEE(R1f.z, PS0f);
R126f.w = mul_nonIEEE(R4f.x,R127f.x) + R3f.z;
R126f.z = mul_nonIEEE(R6f.y,R127f.x) + R0f.w;
// 6
PV0fx = -(abs(R127f.w));
R126f.y = mul_nonIEEE(R1f.w, R126f.x);
R1f.z = mul_nonIEEE(R1f.w, R125f.y);
R123f.w = mul_nonIEEE(R2f.z,R127f.x) + R0f.x;
R3f.z = mul_nonIEEE(R1f.w, R125f.z);
// 7
R125f.x = intBitsToFloat(((PV0fx >= 0.0)?(0):(floatBitsToInt(R126f.w))));
R124f.y = intBitsToFloat(((PV0fx >= 0.0)?(0):(floatBitsToInt(R126f.z))));
R0f.z = intBitsToFloat(((PV0fx >= 0.0)?(0):(floatBitsToInt(R123f.w))));
R126f.w = -(R7f.y) + R8f.y;
R126f.z = -(R7f.z) + R8f.z;
// 8
tempf.x = dot(vec4(R125f.x,R124f.y,R0f.z,intBitsToFloat(0x80000000)),vec4(R126f.y,R1f.z,R3f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R127f.w = mul_nonIEEE(R127f.y, intBitsToFloat(uf_remappedPS[0].z));
// 9
R127f.x = mul_nonIEEE(R125f.x,PV0fx) + -(R126f.y);
R127f.y = mul_nonIEEE(R124f.y,PV0fx) + -(R1f.z);
R5f.z = mul_nonIEEE(R125f.w, intBitsToFloat(uf_remappedPS[0].z));
R8f.w = 1.0;
R8f.z = mul_nonIEEE(R0f.z,PV0fx) + -(R3f.z);
// 10
tempf.x = dot(vec4(R127f.x,R127f.y,R8f.z,intBitsToFloat(0x80000000)),vec4(R127f.x,R127f.y,R8f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R124f.x = mul_nonIEEE(R127f.z, intBitsToFloat(uf_remappedPS[0].z));
// 11
tempf.x = dot(vec4(-(R4f.x),-(R6f.y),-(R2f.z),-(R9f.x)),vec4(R126f.x,R125f.y,R125f.z,R125f.z));
tempf.x = clamp(tempf.x, 0.0, 1.0);
PV1fx = tempf.x;
R125f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
PS1f = sqrt(PV0fx);
// 12
R123f.x = mul_nonIEEE(R126f.w,R5f.y) + R7f.y;
R123f.y = mul_nonIEEE(R124f.z,R5f.y) + R7f.x;
R123f.z = mul_nonIEEE(R126f.z,R5f.y) + R7f.z;
R7f.w = 1.0;
PS0f = 1.0 / PS1f;
// 13
R126f.x = floor(R4f.z);
R126f.x *= 4.0;
R9f.y = mul_nonIEEE(R2f.x, R123f.x);
R9f.z = mul_nonIEEE(R2f.x, R123f.z);
PV1fw = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), PS0f);
PV1fw = clamp(PV1fw, 0.0, 1.0);
R9f.x = mul_nonIEEE(R2f.x, R123f.y);
// 14
R127f.x = mul_nonIEEE(R127f.x,PV1fw) + R126f.y;
R127f.y = mul_nonIEEE(R127f.y,PV1fw) + R1f.z;
R126f.z = mul_nonIEEE(R8f.z,PV1fw) + R3f.z;
R9f.w = intBitsToFloat(0x3b808081);
R8f.x = intBitsToFloat(0x3c808081);
// 15
tempf.x = dot(vec4(R127f.x,R127f.y,R126f.z,intBitsToFloat(0x80000000)),vec4(R127f.x,R127f.y,R126f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R8f.y = 0.0;
// 16
R2f.x = R4f.x * 0.5 + 0.5;
R2f.y = R6f.y * 0.5 + 0.5;
R2f.z = R2f.z * 0.5 + 0.5;
R2f.w = R126f.x * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081);
tempResultf = 1.0 / sqrt(PV1fx);
PS0f = tempResultf;
// 17
PV1fx = mul_nonIEEE(R127f.x, PS0f);
PV1fy = mul_nonIEEE(R127f.y, PS0f);
PV1fz = mul_nonIEEE(R126f.z, PS0f);
// 18
tempf.x = dot(vec4(R125f.x,R124f.y,R0f.z,intBitsToFloat(0x80000000)),vec4(PV1fx,PV1fy,PV1fz,0.0));
tempf.x = clamp(tempf.x, 0.0, 1.0);
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 19
PV1fz = mul_nonIEEE(PV0fx, PV0fx);
// 20
PV0fy = mul_nonIEEE(PV1fz, PV1fz);
// 21
PV1fx = mul_nonIEEE(PV0fy, PV0fy);
// 22
R123f.w = mul_nonIEEE(PV1fx,-(intBitsToFloat(uf_remappedPS[0].y))) + PV1fx;
// 23
R123f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].y),R125f.y) + R123f.w;
// 24
PV0fy = mul_nonIEEE(R124f.w, R123f.z);
// 25
PV1fw = mul_nonIEEE(R4f.w, PV0fy);
// 26
PV0fx = mul_nonIEEE(R124f.x, PV1fw);
PV0fz = mul_nonIEEE(R127f.w, PV1fw);
PV0fw = mul_nonIEEE(R5f.z, PV1fw);
// 27
R7f.x = mul_nonIEEE(-(PV0fz),R5f.y) + PV0fz;
R7f.y = mul_nonIEEE(-(PV0fw),R5f.y) + PV0fw;
R7f.z = mul_nonIEEE(-(PV0fx),R5f.y) + PV0fx;
// 28
R6f.x = R7f.x;
R6f.y = R7f.y;
R6f.z = R7f.z;
R6f.w = R7f.w;
// 29
R5f.x = R2f.x;
R5f.y = R2f.y;
R5f.z = R2f.z;
R5f.w = R2f.w;
// 0
R4f.x = R9f.x;
R4f.y = R9f.y;
R4f.z = R9f.z;
R4f.w = R9f.w;
// 1
R3f.x = R8f.x;
R3f.y = R8f.y;
R3f.z = R8f.z;
R3f.w = R8f.w;
// export
passPixelColor0 = vec4(R3f.x, R3f.y, R3f.z, R3f.w);
passPixelColor1 = vec4(R4f.x, R4f.y, R4f.z, R4f.w);
passPixelColor3 = vec4(R5f.x, R5f.y, R5f.z, R5f.w);
passPixelColor5 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
}
