#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 8dd2734f61313316
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[2];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(8, 1, 0) uniform sampler2DArray textureUnitPS8;
in vec4 passParameterSem0;
in vec4 passParameterSem4;
in vec4 passParameterSem3;
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
float backupReg0f, backupReg1f, backupReg2f, backupReg3f, backupReg4f;
float PV0fx = 0.0, PV0fy = 0.0, PV0fz = 0.0, PV0fw = 0.0, PV1fx = 0.0, PV1fy = 0.0, PV1fz = 0.0, PV1fw = 0.0;
float PS0f = 0.0, PS1f = 0.0;
vec4 tempf = vec4(0.0);
float tempResultf;
int tempResulti;
ivec4 ARi = ivec4(0);
bool predResult = true;
R0f = passParameterSem0;
R1f = passParameterSem4;
R2f = passParameterSem3;
// 0
PV0fx = intBitsToFloat(0x3c808081);
PV0fy = mul_nonIEEE(R2f.z, R2f.z);
PV0fz = intBitsToFloat(uf_remappedPS[0].z);
PV0fw = intBitsToFloat(uf_remappedPS[1].z);
R5f.w = 1.0;
// 1
R3f.x = mul_nonIEEE(R2f.y,R2f.y) + PV0fy;
R5f.y = PV0fz;
R0f.z = roundEven(PV0fw);
R4f.w = 0.0;
R5f.x = PV0fx;
R0f.xyz = (texture(textureUnitPS8, vec3(R0f.x,R0f.y,R0f.z)).xyz);
// 0
R4f.y = mul_nonIEEE(R1f.x, R0f.y);
R4f.z = mul_nonIEEE(R1f.x, R0f.z);
R123f.w = mul_nonIEEE(R2f.x,R2f.x) + R3f.x;
R3f.w = intBitsToFloat(0x3b808081);
// 1
R4f.x = mul_nonIEEE(R1f.x, R0f.x);
tempResultf = 1.0 / sqrt(R123f.w);
PS1f = tempResultf;
PS1f /= 2.0;
// 2
R3f.x = mul_nonIEEE(R2f.x,PS1f) + 0.5;
R3f.y = mul_nonIEEE(R2f.y,PS1f) + 0.5;
R3f.z = mul_nonIEEE(R2f.z,PS1f) + 0.5;
// 3
R2f.x = R3f.x;
R2f.y = R3f.y;
R2f.z = R3f.z;
R2f.w = R3f.w;
// 4
R1f.x = R4f.x;
R1f.y = R4f.y;
R1f.z = R4f.z;
R1f.w = R4f.w;
// 5
R0f.x = R5f.x;
R0f.y = R5f.y;
R0f.z = R5f.z;
R0f.w = R5f.w;
// export
passPixelColor0 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
passPixelColor1 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
passPixelColor3 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
}
