#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 458f7a6468318a49
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[8];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(4, 1, 0) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(5, 1, 1) uniform sampler2D textureUnitPS5;
TEXTURE_LAYOUT(6, 1, 2) uniform sampler2D textureUnitPS6;
TEXTURE_LAYOUT(7, 1, 3) uniform sampler2D textureUnitPS7;
TEXTURE_LAYOUT(8, 1, 4) uniform sampler2D textureUnitPS8;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem6;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem5;
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
vec4 R10f = vec4(0.0);
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
R1f = passParameterSem1;
R2f = passParameterSem6;
R3f = passParameterSem3;
R4f = passParameterSem4;
R5f = passParameterSem5;
R6f.xy = (texture(textureUnitPS5, vec2(R1f.z,R1f.w)).xy);
R9f.xyz = (texture(textureUnitPS6, vec2(R0f.z,R0f.w)).xyz);
R7f.z = (texture(textureUnitPS8, vec2(R0f.x,R0f.y)).z);
// 0
R123f.x = R6f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R6f.y = R9f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R0f.z = R9f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R123f.w = R6f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R6f.z = mul_nonIEEE(R3f.y, R4f.z);
// 1
R1f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x),R123f.w) + R1f.x;
R1f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].y),R123f.x) + R1f.y;
R1f.z = mul_nonIEEE(R6f.y, R6f.y);
R1f.w = mul_nonIEEE(R3f.z, R4f.x);
R6f.x = mul_nonIEEE(R3f.x, R4f.y);
R8f.xyz = (texture(textureUnitPS4, vec2(R1f.x,R1f.y)).xyz);
R0f.w = (texture(textureUnitPS7, vec2(R1f.x,R1f.y)).z);
// 0
R123f.x = mul_nonIEEE(R0f.z,R0f.z) + R1f.z;
R123f.x = clamp(R123f.x, 0.0, 1.0);
R127f.y = R8f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R127f.z = R8f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R1f.w = mul_nonIEEE(-(R4f.z),R3f.x) + R1f.w;
R125f.w = mul_nonIEEE(R0f.w, R0f.w);
// 1
PV1fx = mul_nonIEEE(R127f.z, R127f.z);
PV1fy = -(R123f.x) + 1.0;
PV1fz = -(R127f.z) + R6f.y;
PV1fw = -(R127f.y) + R0f.z;
R124f.w = mul_nonIEEE(-(R4f.y),R3f.z) + R6f.z;
// 2
R126f.x = mul_nonIEEE(PV1fz,R5f.x) + R127f.z;
R126f.y = mul_nonIEEE(PV1fw,R5f.x) + R127f.y;
R125f.z = mul_nonIEEE(-(R4f.x),R3f.y) + R6f.x;
R123f.w = mul_nonIEEE(R127f.y,R127f.y) + PV1fx;
R123f.w = clamp(R123f.w, 0.0, 1.0);
R127f.w = sqrt(PV1fy);
// 3
R124f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].x), R8f.z);
R124f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].y), R8f.z);
PV1fz = -(R123f.w) + 1.0;
R126f.w = intBitsToFloat(uf_remappedPS[2].y) + R7f.z;
R6f.w = 1.0;
// 4
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(R2f.x,R2f.y,R2f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R127f.y = sqrt(PV1fz);
// 5
PV1fx = -(R127f.y) + R127f.w;
R8f.y = mul_nonIEEE(R0f.w, R126f.w);
R8f.y = clamp(R8f.y, 0.0, 1.0);
PV1fz = -(intBitsToFloat(uf_remappedPS[3].z)) + R9f.z;
R0f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z), R8f.z);
PS1f = sqrt(PV0fx);
// 6
backupReg0f = R127f.y;
R127f.x = mul_nonIEEE(PV1fz,R5f.x) + intBitsToFloat(uf_remappedPS[3].z);
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].x), R125f.w);
R126f.z = mul_nonIEEE(PV1fx,R5f.x) + backupReg0f;
R127f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].y), R125f.w);
R127f.z = 1.0 / PS1f;
// 7
tempf.x = dot(vec4(R126f.x,R126f.y,R126f.z,intBitsToFloat(0x80000000)),vec4(R126f.x,R126f.y,R126f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R125f.x = mul_nonIEEE(R2f.x, R127f.z);
// 8
PV0fx = mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].z), R125f.w);
R125f.y = mul_nonIEEE(R2f.y, R127f.z);
R127f.z = mul_nonIEEE(R2f.z, R127f.z);
R125f.w = R127f.x * 63.75;
tempResultf = 1.0 / sqrt(PV1fx);
PS0f = tempResultf;
// 9
backupReg0f = R127f.y;
PV1fx = mul_nonIEEE(R126f.y, PS0f);
R127f.y = mul_nonIEEE(R126f.x, PS0f);
R124f.z = mul_nonIEEE(-(R5f.x),backupReg0f) + backupReg0f;
R126f.w = mul_nonIEEE(R126f.z, PS0f);
R126f.x = mul_nonIEEE(-(R5f.z),PV0fx) + PV0fx;
// 10
R6f.x = intBitsToFloat(0x3c808081);
R126f.y = mul_nonIEEE(-(R5f.y),R127f.w) + R127f.w;
PV0fz = mul_nonIEEE(R4f.w, PV1fx);
R2f.w = 1.0;
R6f.y = 0.0;
// 11
PV1fx = mul_nonIEEE(R1f.w, PV0fz);
PV1fy = mul_nonIEEE(R124f.w, PV0fz);
R126f.z = floor(R125f.w);
R126f.z *= 4.0;
PV1fw = mul_nonIEEE(R125f.z, PV0fz);
R1f.x = intBitsToFloat(uf_remappedPS[5].x);
// 12
R123f.y = mul_nonIEEE(R4f.y,R127f.y) + PV1fx;
R123f.z = mul_nonIEEE(R4f.x,R127f.y) + PV1fy;
R123f.w = mul_nonIEEE(R4f.z,R127f.y) + PV1fw;
R1f.y = intBitsToFloat(uf_remappedPS[5].y);
// 13
R123f.x = mul_nonIEEE(R3f.x,R126f.w) + R123f.z;
R127f.y = mul_nonIEEE(R3f.y,R126f.w) + R123f.y;
R125f.z = mul_nonIEEE(R3f.z,R126f.w) + R123f.w;
R1f.w = intBitsToFloat(0x3b808081);
R1f.z = intBitsToFloat(uf_remappedPS[5].z);
// 14
tempf.x = dot(vec4(R125f.x,R125f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(R123f.x,R127f.y,R125f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R3f.x = R123f.x * 0.5 + 0.5;
// 15
R3f.y = R127f.y * 0.5 + 0.5;
R3f.z = R125f.z * 0.5 + 0.5;
PV1fw = PV0fx + 1.0;
PV1fw = clamp(PV1fw, 0.0, 1.0);
R3f.w = R126f.z * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081);
// 16
tempResultf = max(0.0, PV1fw);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0f = tempResultf;
// 17
PV1fy = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].w), PS0f);
// 18
PS0f = exp2(PV1fy);
// 19
PV1fx = mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].y), PS0f);
PV1fy = mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].x), PS0f);
PV1fz = mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].z), PS0f);
// 20
backupReg0f = R124f.x;
R124f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].x),R0f.w) + PV1fz;
R124f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].x),R124f.y) + PV1fx;
R126f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].x),backupReg0f) + PV1fy;
// 21
R123f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].z),R8f.y) + -(R124f.x);
R123f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].x),R8f.y) + -(R126f.w);
R123f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].y),R8f.y) + -(R124f.y);
// 22
R123f.x = mul_nonIEEE(R123f.z,R5f.x) + R126f.w;
R123f.z = mul_nonIEEE(R123f.w,R5f.y) + R124f.y;
R123f.w = mul_nonIEEE(R123f.y,R5f.z) + R124f.x;
// 23
R2f.x = R124f.z + R123f.x;
R2f.y = R126f.y + R123f.z;
R2f.z = R126f.x + R123f.w;
// 24
R10f.x = R2f.x;
R10f.y = R2f.y;
R10f.z = R2f.z;
R10f.w = R2f.w;
// 25
R9f.x = R3f.x;
R9f.y = R3f.y;
R9f.z = R3f.z;
R9f.w = R3f.w;
// 26
R8f.x = R1f.x;
R8f.y = R1f.y;
R8f.z = R1f.z;
R8f.w = R1f.w;
// 27
R7f.x = R6f.x;
R7f.y = R6f.y;
R7f.z = R6f.z;
R7f.w = R6f.w;
// export
passPixelColor0 = vec4(R7f.x, R7f.y, R7f.z, R7f.w);
passPixelColor1 = vec4(R8f.x, R8f.y, R8f.z, R8f.w);
passPixelColor3 = vec4(R9f.x, R9f.y, R9f.z, R9f.w);
passPixelColor5 = vec4(R10f.x, R10f.y, R10f.z, R10f.w);
}
