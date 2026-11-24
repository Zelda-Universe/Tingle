#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 3f3264b305b0a43a
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(3, 1, 0) uniform sampler2D textureUnitPS3;
in vec4 passParameterSem6;
layout(location = 0) out vec4 passPixelColor0;
layout(location = 1) out vec4 passPixelColor1;
layout(location = 2) out vec4 passPixelColor2;
layout(location = 3) out vec4 passPixelColor3;
layout(location = 4) out vec4 passPixelColor4;
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
float backupReg0f, backupReg1f, backupReg2f, backupReg3f, backupReg4f;
float PV0fx = 0.0, PV0fy = 0.0, PV0fz = 0.0, PV0fw = 0.0, PV1fx = 0.0, PV1fy = 0.0, PV1fz = 0.0, PV1fw = 0.0;
float PS0f = 0.0, PS1f = 0.0;
vec4 tempf = vec4(0.0);
float tempResultf;
int tempResulti;
ivec4 ARi = ivec4(0);
bool predResult = true;
R0f = passParameterSem6;
R1f.xyz = (texture(textureUnitPS3, vec2(R0f.z,R0f.w)).xyz);
// 0
R0f.x = 1.0;
R0f.y = 0.0;
R0f.z = 0.0;
R1f.w = 1.0;
// 1
R2f.x = R0f.x;
R2f.y = R0f.y;
R2f.z = R0f.y;
R2f.w = R0f.x;
// 2
R6f.x = R0f.z;
R6f.y = R0f.z;
R6f.z = R0f.z;
R6f.w = R0f.z;
// 3
R5f.x = R1f.x;
R5f.y = R1f.y;
R5f.z = R1f.z;
R5f.w = R1f.w;
// 4
R4f.x = R1f.x;
R4f.y = R1f.y;
R4f.z = R1f.z;
R4f.w = R1f.w;
// 5
R3f.x = R1f.x;
R3f.y = R1f.y;
R3f.z = R1f.z;
R3f.w = R1f.w;
// export
passPixelColor0 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
passPixelColor1 = vec4(R3f.x, R3f.y, R3f.z, R3f.w);
passPixelColor2 = vec4(R4f.x, R4f.y, R4f.z, R4f.w);
passPixelColor3 = vec4(R5f.x, R5f.y, R5f.z, R5f.w);
passPixelColor4 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
}
