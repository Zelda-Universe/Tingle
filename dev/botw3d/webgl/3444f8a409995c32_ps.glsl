#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 3444f8a409995c32
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[1];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(1, 1, 0) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 1) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(3, 1, 2) uniform sampler2D textureUnitPS3;
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
R5f.xyz = (texture(textureUnitPS1, vec2(R0f.x,R0f.y)).xyz);
// 0
PV0fx = fract(R3f.x);
R125f.y = R4f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
PV0fz = fract(R3f.y);
R127f.w = mul_nonIEEE(R1f.y, R2f.z);
R126f.w = mul_nonIEEE(R1f.z, R2f.x);
// 1
R127f.x = R4f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
PV1fy = PV0fz + -(0.5);
PV1fz = mul_nonIEEE(R1f.x, R2f.y);
PV1fw = PV0fx + -(0.5);
R127f.y = mul_nonIEEE(R125f.y, R125f.y);
// 2
R123f.x = mul_nonIEEE(-(PV1fw),PV1fw) + 1.0;
R123f.x = clamp(R123f.x, 0.0, 1.0);
R126f.y = mul_nonIEEE(-(R2f.y),R1f.z) + R127f.w;
R123f.z = mul_nonIEEE(-(PV1fy),PV1fy) + 1.0;
R123f.z = clamp(R123f.z, 0.0, 1.0);
R127f.w = mul_nonIEEE(-(R2f.z),R1f.x) + R126f.w;
R126f.w = mul_nonIEEE(-(R2f.x),R1f.y) + PV1fz;
// 3
backupReg0f = R123f.x;
R123f.x = mul_nonIEEE(R127f.x,R127f.x) + R127f.y;
R123f.x = clamp(R123f.x, 0.0, 1.0);
PV1fy = mul_nonIEEE(R2f.w, R127f.x);
R127f.z = intBitsToFloat(0x3d008081);
PV1fw = mul_nonIEEE(backupReg0f, R123f.z);
R125f.w = intBitsToFloat(uf_remappedPS[0].z);
// 4
PV0fx = mul_nonIEEE(R126f.y, PV1fy);
PV0fy = mul_nonIEEE(R127f.w, PV1fy);
PV0fz = -(R123f.x) + 1.0;
PV0fw = mul_nonIEEE(R126f.w, PV1fy);
PS0f = mul_nonIEEE(PV1fw, PV1fw);
// 5
R123f.x = mul_nonIEEE(R2f.y,R125f.y) + PV0fy;
R123f.y = mul_nonIEEE(R2f.x,R125f.y) + PV0fx;
PV1fz = mul_nonIEEE(R0f.w, PS0f);
R123f.w = mul_nonIEEE(R2f.z,R125f.y) + PV0fw;
PS1f = sqrt(PV0fz);
// 6
R127f.x = mul_nonIEEE(R1f.x,PS1f) + R123f.y;
R125f.y = mul_nonIEEE(R1f.y,PS1f) + R123f.x;
R125f.z = mul_nonIEEE(R1f.z,PS1f) + R123f.w;
PV0fw = PV1fz * 63.75;
R0f.w = 1.0;
// 7
tempf.x = dot(vec4(R127f.x,R125f.y,R125f.z,intBitsToFloat(0x80000000)),vec4(R127f.x,R125f.y,R125f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
R126f.z = tempf.x;
PV1fw = tempf.x;
PS1f = floor(PV0fw);
PS1f *= 4.0;
// 8
PV0fx = PS1f + 2.0;
R0f.y = R125f.w;
R5f.w = intBitsToFloat(0x3e008081);
R0f.x = R127f.z;
// 9
R1f.w = PV0fx * intBitsToFloat(0x3b808081);
tempResultf = 1.0 / sqrt(R126f.z);
PS1f = tempResultf;
PS1f /= 2.0;
// 10
R1f.x = mul_nonIEEE(R127f.x,PS1f) + 0.5;
R1f.y = mul_nonIEEE(R125f.y,PS1f) + 0.5;
R1f.z = mul_nonIEEE(R125f.z,PS1f) + 0.5;
// 11
R3f.x = R1f.x;
R3f.y = R1f.y;
R3f.z = R1f.z;
R3f.w = R1f.w;
// 12
R2f.x = R5f.x;
R2f.y = R5f.y;
R2f.z = R5f.z;
R2f.w = R5f.w;
// 13
R1f.x = R0f.x;
R1f.y = R0f.y;
R1f.z = R0f.z;
R1f.w = R0f.w;
// export
passPixelColor0 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
passPixelColor1 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
passPixelColor3 = vec4(R3f.x, R3f.y, R3f.z, R3f.w);
}
