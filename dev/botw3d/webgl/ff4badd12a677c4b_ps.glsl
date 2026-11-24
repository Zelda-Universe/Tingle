#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader ff4badd12a677c4b
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[3];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(3, 1, 0) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 1) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(5, 1, 2) uniform sampler2D textureUnitPS5;
TEXTURE_LAYOUT(6, 1, 3) uniform sampler2D textureUnitPS6;
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
vec4 R7f = vec4(0.0);
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
R1f = passParameterSem5;
R2f = passParameterSem3;
R3f = passParameterSem4;
R4f = passParameterSem6;
R5f.xyz = (texture(textureUnitPS4, vec2(R0f.x,R0f.y)).xyz);
R6f.xyz = (texture(textureUnitPS6, vec2(R0f.z,R0f.w)).xyz);
R7f.xyz = (texture(textureUnitPS3, vec2(R0f.x,R0f.y)).xyz);
R0f.xyz = (texture(textureUnitPS5, vec2(R0f.z,R0f.w)).xyz);
// 0
R127f.x = R6f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R127f.y = R5f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R127f.z = R6f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R123f.w = R5f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R127f.w = mul_nonIEEE(R2f.y, R3f.z);
// 1
PV1fx = mul_nonIEEE(R123f.w, R123f.w);
PV1fy = -(R127f.x) + R123f.w;
PV1fz = -(R127f.z) + R127f.y;
PV1fw = mul_nonIEEE(R127f.x, R127f.x);
R126f.z = mul_nonIEEE(R2f.z, R3f.x);
// 2
R127f.x = mul_nonIEEE(PV1fy,R1f.w) + R127f.x;
R123f.y = mul_nonIEEE(R127f.z,R127f.z) + PV1fw;
R123f.y = clamp(R123f.y, 0.0, 1.0);
R123f.z = mul_nonIEEE(R127f.y,R127f.y) + PV1fx;
R123f.z = clamp(R123f.z, 0.0, 1.0);
R125f.w = mul_nonIEEE(PV1fz,R1f.w) + R127f.z;
PS0f = mul_nonIEEE(R2f.x, R3f.y);
// 3
PV1fx = -(R123f.y) + 1.0;
R125f.y = mul_nonIEEE(-(R3f.y),R2f.z) + R127f.w;
R127f.z = mul_nonIEEE(-(R3f.z),R2f.x) + R126f.z;
R127f.w = -(R123f.z) + 1.0;
R125f.z = mul_nonIEEE(-(R3f.x),R2f.y) + PS0f;
// 4
tempf.x = dot(vec4(R4f.x,R4f.y,R4f.z,intBitsToFloat(0x80000000)),vec4(R4f.x,R4f.y,R4f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
R126f.w = tempf.x;
R126f.z = sqrt(PV1fx);
// 5
PV1fx = R7f.x + -(R0f.x);
R127f.y = -(R1f.w) + 1.0;
PV1fz = R7f.y + -(R0f.y);
PV1fw = R5f.z + -(R6f.z);
PS1f = sqrt(R127f.w);
// 6
R124f.x = mul_nonIEEE(PV1fx,R127f.y) + R0f.x;
R123f.y = mul_nonIEEE(PV1fw,R127f.y) + R6f.z;
R6f.z = mul_nonIEEE(PV1fz,R127f.y) + R0f.y;
PV0fw = -(R126f.z) + PS1f;
PS0f = sqrt(R126f.w);
// 7
R126f.x = intBitsToFloat(0x3c808081);
R126f.y = R123f.y * 63.75;
R126f.z = mul_nonIEEE(PV0fw,R1f.w) + R126f.z;
R127f.w = R7f.z + -(R0f.z);
R126f.w = 1.0 / PS0f;
// 8
tempf.x = dot(vec4(R127f.x,R125f.w,R126f.z,intBitsToFloat(0x80000000)),vec4(R127f.x,R125f.w,R126f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R125f.x = mul_nonIEEE(R4f.x, R126f.w);
// 9
R0f.x = mul_nonIEEE(R127f.w,R127f.y) + R0f.z;
R127f.y = mul_nonIEEE(R4f.y, R126f.w);
R124f.z = mul_nonIEEE(R4f.z, R126f.w);
R127f.w = intBitsToFloat(uf_remappedPS[0].z);
tempResultf = 1.0 / sqrt(PV0fx);
PS1f = tempResultf;
// 10
PV0fx = floor(R126f.y);
PV0fx *= 4.0;
R126f.y = mul_nonIEEE(R126f.z, PS1f);
PV0fz = mul_nonIEEE(R125f.w, PS1f);
R125f.w = mul_nonIEEE(R127f.x, PS1f);
R0f.w = 1.0;
// 11
PV1fx = mul_nonIEEE(R3f.w, PV0fz);
R0f.y = R127f.w;
R0f.z = R126f.x;
R7f.w = 0.0;
R4f.w = PV0fx * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081);
// 12
PV0fy = mul_nonIEEE(R125f.z, PV1fx);
PV0fz = mul_nonIEEE(R127f.z, PV1fx);
PV0fw = mul_nonIEEE(R125f.y, PV1fx);
// 13
R123f.x = mul_nonIEEE(R3f.x,R125f.w) + PV0fw;
R123f.z = mul_nonIEEE(R3f.z,R125f.w) + PV0fy;
R123f.w = mul_nonIEEE(R3f.y,R125f.w) + PV0fz;
// 14
backupReg0f = R126f.y;
R123f.x = mul_nonIEEE(R2f.x,backupReg0f) + R123f.x;
R126f.y = mul_nonIEEE(R2f.y,backupReg0f) + R123f.w;
R127f.z = mul_nonIEEE(R2f.z,backupReg0f) + R123f.z;
// 15
tempf.x = dot(vec4(R125f.x,R127f.y,R124f.z,intBitsToFloat(0x80000000)),vec4(R123f.x,R126f.y,R127f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R4f.x = R123f.x * 0.5 + 0.5;
// 16
PV0fy = PV1fx + 1.0;
PV0fy = clamp(PV0fy, 0.0, 1.0);
R4f.z = R127f.z * 0.5 + 0.5;
R4f.y = R126f.y * 0.5 + 0.5;
// 17
tempResultf = max(0.0, PV0fy);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1f = tempResultf;
// 18
PV0fz = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].x), PS1f);
// 19
PS1f = exp2(PV0fz);
// 20
R123f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].y),PS1f) + R6f.z;
R123f.x = clamp(R123f.x, 0.0, 1.0);
R123f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].x),PS1f) + R124f.x;
R123f.y = clamp(R123f.y, 0.0, 1.0);
R123f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].z),PS1f) + R0f.x;
R123f.z = clamp(R123f.z, 0.0, 1.0);
// 21
R7f.x = mul_nonIEEE(R1f.x, R123f.y);
R7f.y = mul_nonIEEE(R1f.x, R123f.x);
R7f.z = mul_nonIEEE(R1f.x, R123f.z);
// 22
R3f.x = R4f.x;
R3f.y = R4f.y;
R3f.z = R4f.z;
R3f.w = R4f.w;
// 23
R2f.x = R7f.x;
R2f.y = R7f.y;
R2f.z = R7f.z;
R2f.w = R7f.w;
// 24
R1f.x = R0f.z;
R1f.y = R0f.y;
R1f.z = R0f.z;
R1f.w = R0f.w;
// export
passPixelColor0 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
passPixelColor1 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
passPixelColor3 = vec4(R3f.x, R3f.y, R3f.z, R3f.w);
}
