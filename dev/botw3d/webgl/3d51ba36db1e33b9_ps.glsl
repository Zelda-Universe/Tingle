#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 3d51ba36db1e33b9
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[3];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(3, 1, 0) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 1) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(5, 1, 2) uniform sampler2D textureUnitPS5;
in vec4 passParameterSem0;
in vec4 passParameterSem5;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem6;
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
R6f.xyz = (texture(textureUnitPS4, vec2(R0f.x,R0f.y)).xyz);
R5f.xyz = (texture(textureUnitPS5, vec2(R0f.x,R0f.y)).xyz);
R0f.xyzw = (texture(textureUnitPS3, vec2(R0f.x,R0f.y)).xyzw);
// 0
PV0fx = mul_nonIEEE(R2f.z, R3f.x);
PV0fy = mul_nonIEEE(R2f.x, R3f.y);
PV0fz = mul_nonIEEE(R2f.y, R3f.z);
R126f.w = R6f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R127f.z = R6f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
// 1
backupReg0f = R127f.z;
R127f.x = mul_nonIEEE(-(R3f.y),R2f.z) + PV0fz;
PV1fy = mul_nonIEEE(R126f.w, R126f.w);
R126f.z = mul_nonIEEE(-(R3f.z),R2f.x) + PV0fx;
R127f.w = mul_nonIEEE(-(R3f.x),R2f.y) + PV0fy;
R127f.y = mul_nonIEEE(R3f.w, backupReg0f);
// 2
tempf.x = dot(vec4(R4f.x,R4f.y,R4f.z,intBitsToFloat(0x80000000)),vec4(R4f.x,R4f.y,R4f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R122f.x = mul_nonIEEE(R127f.z,R127f.z) + PV1fy;
R122f.x = clamp(R122f.x, 0.0, 1.0);
// 3
PV1fx = mul_nonIEEE(R127f.x, R127f.y);
PV1fy = mul_nonIEEE(R126f.z, R127f.y);
PV1fz = mul_nonIEEE(R127f.w, R127f.y);
R127f.w = -(R122f.x) + 1.0;
PS1f = sqrt(PV0fx);
// 4
R127f.x = mul_nonIEEE(R3f.y,R126f.w) + PV1fy;
R127f.y = mul_nonIEEE(R3f.x,R126f.w) + PV1fx;
R125f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), R5f.x);
R126f.w = mul_nonIEEE(R3f.z,R126f.w) + PV1fz;
PS0f = 1.0 / PS1f;
// 5
backupReg0f = R127f.w;
R126f.x = mul_nonIEEE(R4f.x, PS0f);
R126f.y = mul_nonIEEE(R4f.y, PS0f);
R126f.z = mul_nonIEEE(R4f.z, PS0f);
R127f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].y), R5f.y);
PS1f = sqrt(backupReg0f);
// 6
backupReg0f = R127f.x;
R127f.x = mul_nonIEEE(R2f.x,PS1f) + R127f.y;
R125f.y = mul_nonIEEE(R2f.y,PS1f) + backupReg0f;
R127f.z = mul_nonIEEE(R2f.z,PS1f) + R126f.w;
R126f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].z), R5f.z);
R127f.y = R6f.z * 63.75;
// 7
tempf.x = dot(vec4(R126f.x,R126f.y,R126f.z,intBitsToFloat(0x80000000)),vec4(R127f.x,R125f.y,R127f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R126f.z = intBitsToFloat(0x3c808081);
// 8
R126f.x = floor(R127f.y);
R126f.x *= 4.0;
R2f.y = mul_nonIEEE(R1f.x, R0f.y);
PV0fz = intBitsToFloat(uf_remappedPS[1].z);
PV0fw = PV1fx + 1.0;
PV0fw = clamp(PV0fw, 0.0, 1.0);
R2f.x = mul_nonIEEE(R1f.x, R0f.x);
// 9
R5f.x = R126f.z;
R127f.y = -(PV0fw) + 1.0;
R2f.z = mul_nonIEEE(R1f.x, R0f.z);
R5f.w = R0f.w;
R5f.y = PV0fz;
// 10
R1f.x = R127f.x * 0.5 + 0.5;
R1f.y = R125f.y * 0.5 + 0.5;
R1f.z = R127f.z * 0.5 + 0.5;
R0f.w = 1.0;
R2f.w = intBitsToFloat(0x3b808081);
// 11
R1f.w = R126f.x * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081);
tempResultf = max(0.0, R127f.y);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1f = tempResultf;
// 12
PV0fz = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].z), PS1f);
// 13
PS1f = exp2(PV0fz);
PS1f = clamp(PS1f, 0.0, 1.0);
// 14
PV0fy = intBitsToFloat(uf_remappedPS[2].w) + PS1f;
PV0fy = clamp(PV0fy, 0.0, 1.0);
// 15
PV1fx = mul_nonIEEE(PV0fy, R127f.w);
PV1fy = mul_nonIEEE(PV0fy, R125f.z);
PV1fw = mul_nonIEEE(PV0fy, R126f.w);
// 16
R0f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].x), PV1fy);
R0f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].x), PV1fx);
R0f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].x), PV1fw);
// 17
R9f.x = R0f.x;
R9f.y = R0f.y;
R9f.z = R0f.z;
R9f.w = R0f.w;
// 18
R8f.x = R1f.x;
R8f.y = R1f.y;
R8f.z = R1f.z;
R8f.w = R1f.w;
// 19
R7f.x = R2f.x;
R7f.y = R2f.y;
R7f.z = R2f.z;
R7f.w = R2f.w;
// 20
R6f.x = R5f.x;
R6f.y = R5f.y;
R6f.z = R5f.z;
R6f.w = R5f.w;
// export
if( ((vec4(R6f.x, R6f.y, R6f.z, R6f.w)).a >= uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
passPixelColor1 = vec4(R7f.x, R7f.y, R7f.z, R7f.w);
passPixelColor3 = vec4(R8f.x, R8f.y, R8f.z, R8f.w);
passPixelColor5 = vec4(R9f.x, R9f.y, R9f.z, R9f.w);
}
