#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader e18dccc65ea69e42
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
R4f.xyz = (texture(textureUnitPS1, vec2(R0f.x,R0f.y)).xyz);
// 0
PV0fx = mul_nonIEEE(R1f.y, R2f.z);
PV0fy = mul_nonIEEE(R1f.x, R2f.y);
PV0fz = mul_nonIEEE(R1f.z, R2f.x);
R127f.w = R3f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R127f.y = R3f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
// 1
PV1fx = mul_nonIEEE(R127f.w, R127f.w);
R123f.y = mul_nonIEEE(-(R2f.y),R1f.z) + PV0fx;
R123f.z = mul_nonIEEE(-(R2f.x),R1f.y) + PV0fy;
R123f.w = mul_nonIEEE(-(R2f.z),R1f.x) + PV0fz;
PS1f = mul_nonIEEE(R2f.w, R127f.y);
// 2
PV0fx = mul_nonIEEE(R123f.y, PS1f);
PV0fy = mul_nonIEEE(R123f.z, PS1f);
R123f.z = mul_nonIEEE(R127f.y,R127f.y) + PV1fx;
R123f.z = clamp(R123f.z, 0.0, 1.0);
PV0fw = mul_nonIEEE(R123f.w, PS1f);
PS0f = R0f.w * 63.75;
// 3
R127f.x = mul_nonIEEE(R2f.x,R127f.w) + PV0fx;
R127f.y = mul_nonIEEE(R2f.z,R127f.w) + PV0fy;
R127f.z = mul_nonIEEE(R2f.y,R127f.w) + PV0fw;
PV1fw = -(R123f.z) + 1.0;
PS1f = floor(PS0f);
PS1f *= 4.0;
// 4
R126f.x = PS1f + 2.0;
PV0fz = intBitsToFloat(0x3d20a0a1);
R127f.w = intBitsToFloat(uf_remappedPS[0].z);
PS0f = sqrt(PV1fw);
// 5
R127f.x = mul_nonIEEE(R1f.x,PS0f) + R127f.x;
R126f.y = mul_nonIEEE(R1f.y,PS0f) + R127f.z;
R127f.z = mul_nonIEEE(R1f.z,PS0f) + R127f.y;
R2f.w = 1.0;
R2f.x = PV0fz;
// 6
tempf.x = dot(vec4(R127f.x,R126f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(R127f.x,R126f.y,R127f.z,0.0));
PV0fx = tempf.x;
R127f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R2f.y = R127f.w;
// 7
R1f.w = R126f.x * intBitsToFloat(0x3b808081);
R4f.w = intBitsToFloat(0x3eb8b8b9);
// 8
tempResultf = 1.0 / sqrt(R127f.y);
PS0f = tempResultf;
PS0f /= 2.0;
// 9
R1f.x = mul_nonIEEE(R127f.x,PS0f) + 0.5;
R1f.y = mul_nonIEEE(R126f.y,PS0f) + 0.5;
R1f.z = mul_nonIEEE(R127f.z,PS0f) + 0.5;
// 10
R7f.x = R1f.x;
R7f.y = R1f.y;
R7f.z = R1f.z;
R7f.w = R1f.w;
// 11
R6f.x = R4f.x;
R6f.y = R4f.y;
R6f.z = R4f.z;
R6f.w = R4f.w;
// 12
R5f.x = R2f.x;
R5f.y = R2f.y;
R5f.z = R2f.z;
R5f.w = R2f.w;
// export
passPixelColor0 = vec4(R5f.x, R5f.y, R5f.z, R5f.w);
passPixelColor1 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
passPixelColor3 = vec4(R7f.x, R7f.y, R7f.z, R7f.w);
}
