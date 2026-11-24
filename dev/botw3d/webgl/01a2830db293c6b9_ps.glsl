#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 01a2830db293c6b9
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(3, 1, 0) uniform sampler2D textureUnitPS3;
in vec4 passParameterSem0;
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
vec4 R6f = vec4(0.0);
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
R2f.xyz = (texture(textureUnitPS3, vec2(R0f.x,R0f.y)).xyz);
// 0
R127f.x = dot(vec4(R1f.x,R1f.y,R1f.z,intBitsToFloat(0x80000000)),vec4(R1f.x,R1f.y,R1f.z,0.0));
PV0fy = R127f.x;
PV0fz = R127f.x;
PV0fw = R127f.x;
R3f.w = 1.0;
// 1
R3f.x = intBitsToFloat(0x3c808081);
R3f.y = 0.0;
R2f.w = 0.0;
R0f.w = intBitsToFloat(0x3b808081);
// 2
tempResultf = 1.0 / sqrt(R127f.x);
PS0f = tempResultf;
PS0f /= 2.0;
// 3
R0f.x = mul_nonIEEE(R1f.x,PS0f) + 0.5;
R0f.y = mul_nonIEEE(R1f.y,PS0f) + 0.5;
R0f.z = mul_nonIEEE(R1f.z,PS0f) + 0.5;
// 4
R6f.x = R0f.x;
R6f.y = R0f.y;
R6f.z = R0f.z;
R6f.w = R0f.w;
// 5
R5f.x = R2f.x;
R5f.y = R2f.y;
R5f.z = R2f.z;
R5f.w = R2f.w;
// 6
R4f.x = R3f.x;
R4f.y = R3f.y;
R4f.z = R3f.z;
R4f.w = R3f.w;
// export
passPixelColor0 = vec4(R4f.x, R4f.y, R4f.z, R4f.w);
passPixelColor1 = vec4(R5f.x, R5f.y, R5f.z, R5f.w);
passPixelColor3 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
}
