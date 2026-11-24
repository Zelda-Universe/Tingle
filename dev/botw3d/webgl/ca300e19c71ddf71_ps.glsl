#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader ca300e19c71ddf71
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[3];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(1, 1, 0) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 1) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(3, 1, 2) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 3) uniform sampler2D textureUnitPS4;
in vec4 passParameterSem0;
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
R1f = passParameterSem3;
R2f = passParameterSem4;
R3f = passParameterSem6;
R3f.xy = (texture(textureUnitPS3, vec2(R0f.x,R0f.y)).xy);
R4f.xyz = (texture(textureUnitPS4, vec2(R0f.x,R0f.y)).xyz);
R0f.w = (texture(textureUnitPS2, vec2(R0f.x,R0f.y)).x);
R5f.xyz = (texture(textureUnitPS1, vec2(R0f.x,R0f.y)).xyz);
// 0
PV0fx = mul_nonIEEE(R1f.z, R2f.x);
PV0fy = mul_nonIEEE(R1f.y, R2f.z);
R127f.z = R3f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
PV0fw = mul_nonIEEE(R1f.x, R2f.y);
R127f.y = R3f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
// 1
PV1fx = mul_nonIEEE(R127f.z, R127f.z);
R123f.y = mul_nonIEEE(-(R2f.z),R1f.x) + PV0fx;
R123f.z = mul_nonIEEE(-(R2f.y),R1f.z) + PV0fy;
R123f.w = mul_nonIEEE(-(R2f.x),R1f.y) + PV0fw;
PS1f = mul_nonIEEE(R2f.w, R127f.y);
// 2
PV0fx = mul_nonIEEE(R123f.z, PS1f);
PV0fy = mul_nonIEEE(R123f.w, PS1f);
PV0fz = mul_nonIEEE(R123f.y, PS1f);
R123f.w = mul_nonIEEE(R127f.y,R127f.y) + PV1fx;
R123f.w = clamp(R123f.w, 0.0, 1.0);
R125f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), R4f.x);
// 3
R127f.x = mul_nonIEEE(R2f.x,R127f.z) + PV0fx;
R127f.y = mul_nonIEEE(R2f.z,R127f.z) + PV0fy;
PV1fz = -(R123f.w) + 1.0;
R127f.w = mul_nonIEEE(R2f.y,R127f.z) + PV0fz;
R126f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].y), R4f.y);
// 4
R126f.x = mul_nonIEEE(R125f.x, R125f.x);
R123f.y = mul_nonIEEE(-(R3f.z),intBitsToFloat(uf_remappedPS[1].x)) + -(intBitsToFloat(uf_remappedPS[1].y));
R123f.y = clamp(R123f.y, 0.0, 1.0);
R127f.z = R0f.w * 63.75;
R126f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].z), R4f.z);
PS0f = sqrt(PV1fz);
// 5
R127f.x = mul_nonIEEE(R1f.x,PS0f) + R127f.x;
R125f.y = mul_nonIEEE(R1f.y,PS0f) + R127f.w;
R125f.z = mul_nonIEEE(R1f.z,PS0f) + R127f.y;
R127f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].w), R123f.y);
PS1f = mul_nonIEEE(R126f.z, R126f.z);
// 6
backupReg0f = R126f.x;
R126f.x = floor(R127f.z);
R126f.x *= 4.0;
PV0fy = mul_nonIEEE(R126f.w, R126f.w);
R127f.z = mul_nonIEEE(R127f.w, backupReg0f);
R125f.w = mul_nonIEEE(R127f.w, PS1f);
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z), R125f.x);
// 7
tempf.x = dot(vec4(R127f.x,R125f.y,R125f.z,intBitsToFloat(0x80000000)),vec4(R127f.x,R125f.y,R125f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R127f.w = mul_nonIEEE(R127f.w, PV0fy);
// 8
PV0fx = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z), R126f.z);
R126f.y = intBitsToFloat(uf_remappedPS[2].z);
R126f.z = intBitsToFloat(0x3d30b0b1);
PV0fw = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z), R126f.w);
tempResultf = 1.0 / sqrt(PV1fx);
R125f.x = tempResultf;
R125f.x /= 2.0;
// 9
R126f.x = R126f.x + 2.0;
R1f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z),R125f.w) + PV0fx;
R1f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z),R127f.w) + PV0fw;
R4f.w = 1.0;
R1f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z),R127f.z) + R127f.y;
// 10
R4f.x = R126f.z;
R4f.y = R126f.y;
R0f.z = mul_nonIEEE(R125f.z,R125f.x) + 0.5;
R1f.w = 1.0;
R0f.x = mul_nonIEEE(R127f.x,R125f.x) + 0.5;
// 11
R0f.y = mul_nonIEEE(R125f.y,R125f.x) + 0.5;
R0f.w = R126f.x * intBitsToFloat(0x3b808081);
R5f.w = intBitsToFloat(0x3ea2a2a3);
// 12
R9f.x = R1f.x;
R9f.y = R1f.y;
R9f.z = R1f.z;
R9f.w = R1f.w;
// 13
R8f.x = R0f.x;
R8f.y = R0f.y;
R8f.z = R0f.z;
R8f.w = R0f.w;
// 14
R7f.x = R5f.x;
R7f.y = R5f.y;
R7f.z = R5f.z;
R7f.w = R5f.w;
// 15
R6f.x = R4f.x;
R6f.y = R4f.y;
R6f.z = R4f.z;
R6f.w = R4f.w;
// export
passPixelColor0 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
passPixelColor1 = vec4(R7f.x, R7f.y, R7f.z, R7f.w);
passPixelColor3 = vec4(R8f.x, R8f.y, R8f.z, R8f.w);
passPixelColor5 = vec4(R9f.x, R9f.y, R9f.z, R9f.w);
}
