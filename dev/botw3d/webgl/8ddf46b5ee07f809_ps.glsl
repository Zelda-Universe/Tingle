#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 8ddf46b5ee07f809
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[8];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(4, 1, 0) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(5, 1, 1) uniform sampler2D textureUnitPS5;
TEXTURE_LAYOUT(7, 1, 2) uniform sampler2D textureUnitPS7;
in vec4 passParameterSem1;
in vec4 passParameterSem6;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
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
R0f = passParameterSem1;
R1f = passParameterSem6;
R2f = passParameterSem3;
R3f = passParameterSem4;
R4f.xy = (texture(textureUnitPS5, vec2(R0f.z,R0f.w)).xy);
// 0
PV0fx = mul_nonIEEE(R2f.y, R3f.z);
PV0fy = mul_nonIEEE(R2f.z, R3f.x);
R123f.z = R4f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R123f.w = R4f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
PS0f = mul_nonIEEE(R2f.x, R3f.y);
// 1
R0f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x),R123f.w) + R0f.x;
R0f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].y),R123f.z) + R0f.y;
R0f.z = mul_nonIEEE(-(R3f.y),R2f.z) + PV0fx;
R1f.w = mul_nonIEEE(-(R3f.z),R2f.x) + PV0fy;
R5f.y = mul_nonIEEE(-(R3f.x),R2f.y) + PS0f;
R4f.xyz = (texture(textureUnitPS4, vec2(R0f.x,R0f.y)).xyz);
R0f.w = (texture(textureUnitPS7, vec2(R0f.x,R0f.y)).z);
// 0
R127f.x = R4f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R127f.y = R4f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R125f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].x), R4f.z);
R124f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].y), R4f.z);
R2f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z), R4f.z);
// 1
R126f.x = mul_nonIEEE(R3f.w, R127f.x);
R125f.y = intBitsToFloat(uf_remappedPS[2].z) * 63.75;
R124f.z = mul_nonIEEE(R0f.w, R0f.w);
PV1fw = mul_nonIEEE(R127f.y, R127f.y);
R126f.w = intBitsToFloat(0x3c808081);
// 2
tempf.x = dot(vec4(R1f.x,R1f.y,R1f.z,intBitsToFloat(0x80000000)),vec4(R1f.x,R1f.y,R1f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R122f.x = mul_nonIEEE(R127f.x,R127f.x) + PV1fw;
R122f.x = clamp(R122f.x, 0.0, 1.0);
// 3
PV1fx = mul_nonIEEE(R1f.w, R126f.x);
R126f.y = -(R122f.x) + 1.0;
PV1fz = mul_nonIEEE(R0f.z, R126f.x);
PV1fw = mul_nonIEEE(R5f.y, R126f.x);
PS1f = sqrt(PV0fx);
// 4
backupReg0f = R127f.y;
R126f.x = mul_nonIEEE(R3f.z,backupReg0f) + PV1fw;
R127f.y = intBitsToFloat(uf_remappedPS[3].z);
R127f.z = mul_nonIEEE(R3f.y,backupReg0f) + PV1fx;
R127f.w = mul_nonIEEE(R3f.x,backupReg0f) + PV1fz;
PS0f = 1.0 / PS1f;
// 5
backupReg0f = R126f.y;
R127f.x = mul_nonIEEE(R1f.x, PS0f);
R126f.y = mul_nonIEEE(R1f.y, PS0f);
R126f.z = mul_nonIEEE(R1f.z, PS0f);
R125f.w = floor(R125f.y);
R125f.w *= 4.0;
PS1f = sqrt(backupReg0f);
// 6
backupReg0f = R126f.x;
R126f.x = mul_nonIEEE(R2f.x,PS1f) + R127f.w;
R125f.y = mul_nonIEEE(R2f.y,PS1f) + R127f.z;
R127f.z = mul_nonIEEE(R2f.z,PS1f) + backupReg0f;
R5f.w = 1.0;
R5f.x = R126f.w;
// 7
tempf.x = dot(vec4(R127f.x,R126f.y,R126f.z,intBitsToFloat(0x80000000)),vec4(R126f.x,R125f.y,R127f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R5f.y = R127f.y;
// 8
PV0fx = PV1fx + 1.0;
PV0fx = clamp(PV0fx, 0.0, 1.0);
R3f.y = R125f.y * 0.5 + 0.5;
R3f.z = R127f.z * 0.5 + 0.5;
R1f.w = 1.0;
R3f.x = R126f.x * 0.5 + 0.5;
// 9
R0f.x = intBitsToFloat(uf_remappedPS[4].x);
R0f.y = intBitsToFloat(uf_remappedPS[4].y);
R0f.z = intBitsToFloat(uf_remappedPS[4].z);
R0f.w = intBitsToFloat(0x3b808081);
tempResultf = max(0.0, PV0fx);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1f = tempResultf;
// 10
PV0fw = mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].w), PS1f);
R3f.w = R125f.w * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081);
// 11
PS1f = exp2(PV0fw);
// 12
PV0fx = mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].y), PS1f);
PV0fy = mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].x), PS1f);
PV0fz = mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].z), PS1f);
// 13
R123f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].x),R2f.w) + PV0fz;
R123f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].x),R124f.w) + PV0fx;
R123f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].x),R125f.z) + PV0fy;
// 14
R1f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].x),R124f.z) + R123f.w;
R1f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].y),R124f.z) + R123f.y;
R1f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].z),R124f.z) + R123f.x;
// 15
R9f.x = R1f.x;
R9f.y = R1f.y;
R9f.z = R1f.z;
R9f.w = R1f.w;
// 16
R8f.x = R3f.x;
R8f.y = R3f.y;
R8f.z = R3f.z;
R8f.w = R3f.w;
// 17
R7f.x = R0f.x;
R7f.y = R0f.y;
R7f.z = R0f.z;
R7f.w = R0f.w;
// 18
R6f.x = R5f.x;
R6f.y = R5f.y;
R6f.z = R5f.z;
R6f.w = R5f.w;
// export
passPixelColor0 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
passPixelColor1 = vec4(R7f.x, R7f.y, R7f.z, R7f.w);
passPixelColor3 = vec4(R8f.x, R8f.y, R8f.z, R8f.w);
passPixelColor5 = vec4(R9f.x, R9f.y, R9f.z, R9f.w);
}
