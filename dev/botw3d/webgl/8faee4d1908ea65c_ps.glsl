#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 8faee4d1908ea65c
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
TEXTURE_LAYOUT(5, 1, 4) uniform sampler2D textureUnitPS5;
TEXTURE_LAYOUT(6, 1, 5) uniform sampler2D textureUnitPS6;
in vec4 passParameterSem0;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
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
R3f = passParameterSem7;
R4f.xy = (texture(textureUnitPS3, vec2(R0f.z,R0f.w)).xy);
R1f.w = (texture(textureUnitPS2, vec2(R0f.z,R0f.w)).x);
R5f.xyz = (texture(textureUnitPS5, vec2(R0f.x,R0f.y)).xyz);
R6f.xyz = (texture(textureUnitPS1, vec2(R0f.x,R0f.y)).xyz);
R7f.xyz = (texture(textureUnitPS4, vec2(R0f.z,R0f.w)).xyz);
R0f.z = (texture(textureUnitPS6, vec2(R0f.z,R0f.w)).x);
// 0
R126f.x = R4f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
PV0fy = fract(R3f.x);
PV0fz = fract(R3f.y);
R127f.w = mul_nonIEEE(R1f.y, R2f.z);
R127f.x = mul_nonIEEE(R1f.z, R2f.x);
// 1
PV1fx = mul_nonIEEE(R126f.x, R126f.x);
R127f.y = PV0fy + -(0.5);
PV1fz = mul_nonIEEE(R1f.x, R2f.y);
R123f.w = R4f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R127f.z = PV0fz + -(0.5);
// 2
backupReg0f = R123f.w;
R123f.x = mul_nonIEEE(-(R2f.z),R1f.x) + R127f.x;
R126f.y = mul_nonIEEE(-(R2f.x),R1f.y) + PV1fz;
R123f.z = mul_nonIEEE(backupReg0f,backupReg0f) + PV1fx;
R123f.z = clamp(R123f.z, 0.0, 1.0);
R123f.w = mul_nonIEEE(-(R2f.y),R1f.z) + R127f.w;
R126f.z = mul_nonIEEE(R2f.w, backupReg0f);
// 3
backupReg0f = R123f.x;
R123f.x = mul_nonIEEE(-(R127f.z),R127f.z) + 1.0;
R123f.x = clamp(R123f.x, 0.0, 1.0);
R123f.y = mul_nonIEEE(-(R127f.y),R127f.y) + 1.0;
R123f.y = clamp(R123f.y, 0.0, 1.0);
PV1fz = -(R123f.z) + 1.0;
PV1fw = mul_nonIEEE(R123f.w, R126f.z);
PS1f = mul_nonIEEE(backupReg0f, R126f.z);
// 4
backupReg0f = R123f.y;
PV0fx = mul_nonIEEE(R126f.y, R126f.z);
R123f.y = mul_nonIEEE(R2f.y,R126f.x) + PS1f;
R123f.z = mul_nonIEEE(R2f.x,R126f.x) + PV1fw;
PV0fw = mul_nonIEEE(backupReg0f, R123f.x);
R127f.w = sqrt(PV1fz);
// 5
R125f.x = mul_nonIEEE(R1f.x,R127f.w) + R123f.z;
R127f.y = mul_nonIEEE(R1f.y,R127f.w) + R123f.y;
PV1fz = mul_nonIEEE(PV0fw, PV0fw);
R123f.w = mul_nonIEEE(R2f.z,R126f.x) + PV0fx;
PS1f = R5f.x + -(1.0);
// 6
R126f.x = R5f.y + -(1.0);
PV0fy = mul_nonIEEE(R1f.w, PV1fz);
R124f.z = mul_nonIEEE(R1f.z,R127f.w) + R123f.w;
R127f.w = R5f.z + -(1.0);
R126f.w = mul_nonIEEE(PS1f,intBitsToFloat(uf_remappedPS[0].y)) + 1.0;
// 7
R127f.x = dot(vec4(R125f.x,R127f.y,R124f.z,intBitsToFloat(0x80000000)),vec4(R125f.x,R127f.y,R124f.z,0.0));
PV1fy = R127f.x;
PV1fz = R127f.x;
PV1fw = R127f.x;
R126f.z = PV0fy * 63.75;
// 8
backupReg0f = R126f.x;
R126f.x = -(intBitsToFloat(uf_remappedPS[1].x)) + R6f.x;
R126f.y = mul_nonIEEE(R127f.w,intBitsToFloat(uf_remappedPS[0].y)) + 1.0;
R127f.z = mul_nonIEEE(backupReg0f,intBitsToFloat(uf_remappedPS[0].y)) + 1.0;
R127f.w = -(intBitsToFloat(uf_remappedPS[1].y)) + R6f.y;
R125f.z = R7f.x + -(1.0);
// 9
backupReg0f = R127f.x;
R127f.x = R7f.z + -(1.0);
R125f.y = R7f.y + -(1.0);
PV1fz = -(intBitsToFloat(uf_remappedPS[1].z)) + R6f.z;
R124f.w = floor(R126f.z);
R124f.w *= 4.0;
tempResultf = 1.0 / sqrt(backupReg0f);
R125f.w = tempResultf;
// 10
backupReg0f = R126f.x;
backupReg1f = R127f.y;
R126f.x = mul_nonIEEE(R127f.w,R127f.z) + intBitsToFloat(uf_remappedPS[1].y);
R127f.y = mul_nonIEEE(backupReg0f,R126f.w) + intBitsToFloat(uf_remappedPS[1].x);
R127f.z = mul_nonIEEE(R125f.x, R125f.w);
R127f.w = mul_nonIEEE(PV1fz,R126f.y) + intBitsToFloat(uf_remappedPS[1].z);
R126f.y = mul_nonIEEE(backupReg1f, R125f.w);
// 11
backupReg0f = R125f.y;
R125f.x = mul_nonIEEE(R124f.z, R125f.w);
R125f.y = mul_nonIEEE(R127f.x,intBitsToFloat(uf_remappedPS[0].x)) + 1.0;
R123f.z = mul_nonIEEE(backupReg0f,intBitsToFloat(uf_remappedPS[0].x)) + 1.0;
R123f.w = mul_nonIEEE(R125f.z,intBitsToFloat(uf_remappedPS[0].x)) + 1.0;
R127f.x = intBitsToFloat(0x3d50d0d1);
// 12
backupReg0f = R126f.x;
R126f.x = R124f.w + 2.0;
R6f.y = mul_nonIEEE(backupReg0f, R123f.z);
PV0fz = intBitsToFloat(uf_remappedPS[2].z);
R124f.w = (R0f.z * 0.25 + 0.75)/2.0;
R6f.x = mul_nonIEEE(R127f.y, R123f.w);
// 13
R7f.x = R127f.x;
R7f.y = PV0fz;
R6f.z = mul_nonIEEE(R127f.w, R125f.y);
R7f.w = 1.0;
R0f.x = mul_nonIEEE(R127f.z,R124f.w) + 0.5;
// 14
R0f.y = mul_nonIEEE(R126f.y,R124f.w) + 0.5;
R0f.z = mul_nonIEEE(R125f.x,R124f.w) + 0.5;
R0f.w = R126f.x * intBitsToFloat(0x3b808081);
R6f.w = intBitsToFloat(0x3e808081);
// 15
R2f.x = R0f.x;
R2f.y = R0f.y;
R2f.z = R0f.z;
R2f.w = R0f.w;
// 16
R1f.x = R6f.x;
R1f.y = R6f.y;
R1f.z = R6f.z;
R1f.w = R6f.w;
// 17
R0f.x = R7f.x;
R0f.y = R7f.y;
R0f.z = R7f.z;
R0f.w = R7f.w;
// export
passPixelColor0 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
passPixelColor1 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
passPixelColor3 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
}
