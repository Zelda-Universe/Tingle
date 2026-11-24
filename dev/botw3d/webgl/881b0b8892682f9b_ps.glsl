#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 881b0b8892682f9b
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[2];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2DArray textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2DArray textureUnitPS1;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem2;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem5;
layout(location = 0) out vec4 passPixelColor0;
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
R1f = passParameterSem1;
R2f = passParameterSem2;
R3f = passParameterSem3;
R4f = passParameterSem4;
R5f = passParameterSem5;
// 0
PV0fx = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].z), intBitsToFloat(uf_remappedPS[1].w));
R1f.z = roundEven(R1f.z);
R0f.w = roundEven(R0f.z);
R4f.z = roundEven(R4f.z);
// 1
R2f.y = mul_nonIEEE(R2f.w, PV0fx);
R3f.z = roundEven(R3f.z);
R5f.w = roundEven(R5f.z);
R2f.w = (textureLod(textureUnitPS0, vec3(R1f.x,R1f.y,R1f.z),0.0).x);
R0f.z = (textureLod(textureUnitPS0, vec3(R0f.x,R0f.y,R0f.w),0.0).x);
R4f.y = (textureLod(textureUnitPS0, vec3(R4f.x,R4f.y,R4f.z),0.0).x);
R3f.x = (textureLod(textureUnitPS0, vec3(R3f.x,R3f.y,R3f.z),0.0).x);
R5f.zw = (textureLod(textureUnitPS1, vec3(R5f.x,R5f.y,R5f.w),0.0).zw);
// 0
R127f.x = R0f.z + -(R4f.y);
R127f.x /= 2.0;
R127f.z = R2f.w + -(R3f.x);
R127f.z /= 2.0;
// 1
tempf.x = dot(vec4(R127f.x,R2f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(R127f.x,R2f.y,R127f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
// 2
tempResultf = 1.0 / sqrt(PV1fx);
PS0f = tempResultf;
PS0f /= 2.0;
// 3
R5f.x = mul_nonIEEE(R127f.x,PS0f) + 0.5;
R5f.y = mul_nonIEEE(R127f.z,PS0f) + 0.5;
// export
passPixelColor0 = vec4(R5f.x, R5f.y, R5f.z, R5f.w);
}
