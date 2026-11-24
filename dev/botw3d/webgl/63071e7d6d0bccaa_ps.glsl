#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 63071e7d6d0bccaa
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[3];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(1, 1, 0) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 1) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(3, 1, 2) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 3) uniform sampler2D textureUnitPS4;
in vec4 passParameterSem0;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
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
R3f = passParameterSem7;
R4f.xy = (texture(textureUnitPS3, vec2(R0f.x,R0f.y)).xy);
R0f.w = (texture(textureUnitPS2, vec2(R0f.x,R0f.y)).x);
R5f.xyz = (texture(textureUnitPS4, vec2(R0f.x,R0f.y)).xyz);
R6f.xyzw = (texture(textureUnitPS1, vec2(R0f.x,R0f.y)).xyzw);
// 0
PV0fx = fract(R3f.y);
PV0fy = fract(R3f.x);
R126f.z = R4f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R127f.w = mul_nonIEEE(R1f.y, R2f.z);
R127f.z = mul_nonIEEE(R1f.z, R2f.x);
// 1
R127f.x = R4f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
PV1fy = mul_nonIEEE(R1f.x, R2f.y);
PV1fz = PV0fy + -(0.5);
PV1fw = PV0fx + -(0.5);
R126f.w = mul_nonIEEE(R126f.z, R126f.z);
// 2
backupReg0f = R127f.z;
R123f.x = mul_nonIEEE(-(PV1fw),PV1fw) + 1.0;
R123f.x = clamp(R123f.x, 0.0, 1.0);
R123f.y = mul_nonIEEE(-(PV1fz),PV1fz) + 1.0;
R123f.y = clamp(R123f.y, 0.0, 1.0);
R127f.z = mul_nonIEEE(-(R2f.y),R1f.z) + R127f.w;
R127f.w = mul_nonIEEE(-(R2f.z),R1f.x) + backupReg0f;
R125f.w = mul_nonIEEE(-(R2f.x),R1f.y) + PV1fy;
// 3
backupReg0f = R127f.x;
backupReg1f = R123f.y;
R127f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), R5f.x);
R123f.y = mul_nonIEEE(backupReg0f,backupReg0f) + R126f.w;
R123f.y = clamp(R123f.y, 0.0, 1.0);
PV1fz = mul_nonIEEE(backupReg1f, R123f.x);
PV1fw = mul_nonIEEE(R2f.w, backupReg0f);
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].y), R5f.y);
// 4
PV0fx = -(R123f.y) + 1.0;
PV0fy = mul_nonIEEE(R127f.z, PV1fw);
PV0fz = mul_nonIEEE(R127f.w, PV1fw);
PV0fw = mul_nonIEEE(R125f.w, PV1fw);
PS0f = mul_nonIEEE(PV1fz, PV1fz);
// 5
R123f.x = mul_nonIEEE(R2f.z,R126f.z) + PV0fw;
R123f.y = mul_nonIEEE(R2f.y,R126f.z) + PV0fz;
PV1fz = mul_nonIEEE(R0f.w, PS0f);
R123f.w = mul_nonIEEE(R2f.x,R126f.z) + PV0fy;
PS1f = sqrt(PV0fx);
// 6
R126f.x = mul_nonIEEE(R1f.x,PS1f) + R123f.w;
R126f.y = mul_nonIEEE(R1f.y,PS1f) + R123f.y;
R126f.z = mul_nonIEEE(R1f.z,PS1f) + R123f.x;
PV0fw = PV1fz * 63.75;
R127f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].z), R5f.z);
// 7
tempf.x = dot(vec4(R126f.x,R126f.y,R126f.z,intBitsToFloat(0x80000000)),vec4(R126f.x,R126f.y,R126f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
R125f.w = tempf.x;
PS1f = floor(PV0fw);
PS1f *= 4.0;
// 8
backupReg0f = R127f.x;
R127f.x = PS1f + 2.0;
R1f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].x), R127f.y);
PV0fz = intBitsToFloat(uf_remappedPS[2].z);
PV0fw = intBitsToFloat(0x3d008081);
R1f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].x), backupReg0f);
// 9
R0f.x = PV0fw;
R0f.y = PV0fz;
R1f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].x), R127f.w);
R0f.w = R6f.w;
R1f.w = 1.0;
// 10
R5f.w = R127f.x * intBitsToFloat(0x3b808081);
R6f.w = intBitsToFloat(0x3e828283);
// 11
tempResultf = 1.0 / sqrt(R125f.w);
PS1f = tempResultf;
PS1f /= 2.0;
// 12
R5f.x = mul_nonIEEE(R126f.x,PS1f) + 0.5;
R5f.y = mul_nonIEEE(R126f.y,PS1f) + 0.5;
R5f.z = mul_nonIEEE(R126f.z,PS1f) + 0.5;
// 13
R4f.x = R1f.x;
R4f.y = R1f.y;
R4f.z = R1f.z;
R4f.w = R1f.w;
// 14
R3f.x = R5f.x;
R3f.y = R5f.y;
R3f.z = R5f.z;
R3f.w = R5f.w;
// 15
R2f.x = R6f.x;
R2f.y = R6f.y;
R2f.z = R6f.z;
R2f.w = R6f.w;
// 16
R1f.x = R0f.x;
R1f.y = R0f.y;
R1f.z = R0f.z;
R1f.w = R0f.w;
// export
if( ((vec4(R1f.x, R1f.y, R1f.z, R1f.w)).a >= uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
passPixelColor1 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
passPixelColor3 = vec4(R3f.x, R3f.y, R3f.z, R3f.w);
passPixelColor5 = vec4(R4f.x, R4f.y, R4f.z, R4f.w);
}
