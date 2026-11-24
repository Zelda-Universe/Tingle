#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader b3e3d136733af997
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[2];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(1, 1, 0) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 1) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(3, 1, 2) uniform sampler2D textureUnitPS3;
in vec4 passParameterSem0;
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
vec4 R122f = vec4(0.0);
vec4 R123f = vec4(0.0);
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
R3f.xy = (texture(textureUnitPS3, vec2(R0f.x,R0f.y)).xy);
R0f.w = (texture(textureUnitPS2, vec2(R0f.x,R0f.y)).x);
R0f.xyz = (texture(textureUnitPS1, vec2(R0f.x,R0f.y)).xyz);
// 0
PV0fx = mul_nonIEEE(R1f.y, R2f.z);
PV0fy = mul_nonIEEE(R1f.x, R2f.y);
R127f.z = R3f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
PV0fw = mul_nonIEEE(R1f.z, R2f.x);
R127f.w = R3f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
// 1
R123f.x = mul_nonIEEE(-(R2f.y),R1f.z) + PV0fx;
PV1fy = mul_nonIEEE(R127f.z, R127f.z);
R123f.z = mul_nonIEEE(-(R2f.z),R1f.x) + PV0fw;
R123f.w = mul_nonIEEE(-(R2f.x),R1f.y) + PV0fy;
PS1f = mul_nonIEEE(R2f.w, R127f.w);
// 2
backupReg0f = R123f.x;
R123f.x = mul_nonIEEE(R127f.w,R127f.w) + PV1fy;
R123f.x = clamp(R123f.x, 0.0, 1.0);
PV0fy = mul_nonIEEE(backupReg0f, PS1f);
PV0fz = mul_nonIEEE(R123f.z, PS1f);
PV0fw = mul_nonIEEE(R123f.w, PS1f);
R122f.x = mul_nonIEEE(R0f.w,-(intBitsToFloat(uf_remappedPS[0].w))) + R0f.w;
// 3
R127f.x = mul_nonIEEE(R2f.y,R127f.z) + PV0fz;
R127f.y = mul_nonIEEE(R2f.x,R127f.z) + PV0fy;
R126f.z = -(R123f.x) + 1.0;
R126f.w = mul_nonIEEE(R2f.z,R127f.z) + PV0fw;
PS1f = R122f.x * 63.75;
// 4
R3f.x = mul_nonIEEE(R0f.x,-(intBitsToFloat(uf_remappedPS[0].w))) + R0f.x;
PV0fy = floor(PS1f);
PV0fy *= 4.0;
R127f.z = intBitsToFloat(uf_remappedPS[1].z);
R127f.w = intBitsToFloat(0x3d20a0a1);
R3f.y = mul_nonIEEE(R0f.y,-(intBitsToFloat(uf_remappedPS[0].w))) + R0f.y;
// 5
PV1fx = PV0fy + 2.0;
R0f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].y), intBitsToFloat(uf_remappedPS[0].w));
R3f.z = mul_nonIEEE(R0f.z,-(intBitsToFloat(uf_remappedPS[0].w))) + R0f.z;
R4f.w = 1.0;
R0f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), intBitsToFloat(uf_remappedPS[0].w));
// 6
R4f.x = R127f.w;
R4f.y = R127f.z;
R0f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].z), intBitsToFloat(uf_remappedPS[0].w));
R0f.w = 1.0;
R2f.w = PV1fx * intBitsToFloat(0x3b808081);
// 7
R3f.w = intBitsToFloat(0x3ebababb);
PS1f = sqrt(R126f.z);
// 8
backupReg0f = R127f.x;
R127f.x = mul_nonIEEE(R1f.x,PS1f) + R127f.y;
R127f.y = mul_nonIEEE(R1f.y,PS1f) + backupReg0f;
R126f.z = mul_nonIEEE(R1f.z,PS1f) + R126f.w;
// 9
tempf.x = dot(vec4(R127f.x,R127f.y,R126f.z,intBitsToFloat(0x80000000)),vec4(R127f.x,R127f.y,R126f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
// 10
tempResultf = 1.0 / sqrt(PV1fx);
PS0f = tempResultf;
PS0f /= 2.0;
// 11
R2f.x = mul_nonIEEE(R127f.x,PS0f) + 0.5;
R2f.y = mul_nonIEEE(R127f.y,PS0f) + 0.5;
R2f.z = mul_nonIEEE(R126f.z,PS0f) + 0.5;
// 12
R8f.x = R0f.x;
R8f.y = R0f.y;
R8f.z = R0f.z;
R8f.w = R0f.w;
// 13
R7f.x = R2f.x;
R7f.y = R2f.y;
R7f.z = R2f.z;
R7f.w = R2f.w;
// 14
R6f.x = R3f.x;
R6f.y = R3f.y;
R6f.z = R3f.z;
R6f.w = R3f.w;
// 15
R5f.x = R4f.x;
R5f.y = R4f.y;
R5f.z = R4f.z;
R5f.w = R4f.w;
// export
passPixelColor0 = vec4(R5f.x, R5f.y, R5f.z, R5f.w);
passPixelColor1 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
passPixelColor3 = vec4(R7f.x, R7f.y, R7f.z, R7f.w);
passPixelColor5 = vec4(R8f.x, R8f.y, R8f.z, R8f.w);
}
