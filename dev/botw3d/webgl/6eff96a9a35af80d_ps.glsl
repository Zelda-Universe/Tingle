#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 6eff96a9a35af80d
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[1];
uniform vec2 uf_fragCoordScale;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
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
float backupReg0f, backupReg1f, backupReg2f, backupReg3f, backupReg4f;
float PV0fx = 0.0, PV0fy = 0.0, PV0fz = 0.0, PV0fw = 0.0, PV1fx = 0.0, PV1fy = 0.0, PV1fz = 0.0, PV1fw = 0.0;
float PS0f = 0.0, PS1f = 0.0;
vec4 tempf = vec4(0.0);
float tempResultf;
int tempResulti;
ivec4 ARi = ivec4(0);
bool predResult = true;
R0f = passParameterSem0;
R1f = passParameterSem1;
// 0
PV0fx = intBitsToFloat(0x3c808081);
PV0fy = R0f.w;
PV0fz = intBitsToFloat(uf_remappedPS[0].z);
PV0fw = R0f.w * 64.0;
PV0fw /= 2.0;
R3f.w = 1.0;
// 1
R3f.x = PV0fx;
R3f.y = PV0fz;
PV1fz = mul_nonIEEE(PV0fw, PV0fy);
R0f.w = 0.0;
R2f.x = R1f.x * 0.5 + 0.5;
// 2
PV0fy = PV1fz * 0.99609375;
R2f.z = R1f.z * 0.5 + 0.5;
R2f.y = R1f.y * 0.5 + 0.5;
// 3
PV1fx = floor(PV0fy);
PV1fx *= 4.0;
// 4
R2f.w = PV1fx * intBitsToFloat(0x3b808081);
// 5
R6f.x = R2f.x;
R6f.y = R2f.y;
R6f.z = R2f.z;
R6f.w = R2f.w;
// 6
R5f.x = R0f.x;
R5f.y = R0f.y;
R5f.z = R0f.z;
R5f.w = R0f.w;
// 7
R4f.x = R3f.x;
R4f.y = R3f.y;
R4f.z = R3f.z;
R4f.w = R3f.w;
// export
passPixelColor0 = vec4(R4f.x, R4f.y, R4f.z, R4f.w);
passPixelColor1 = vec4(R5f.x, R5f.y, R5f.z, R5f.w);
passPixelColor3 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
}
