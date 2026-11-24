#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 1cf547117d229e00
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[1];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(3, 1, 0) uniform sampler2DArray textureUnitPS3;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem2;
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
// 0
R2f.x = R2f.z;
R2f.y = R2f.w;
R2f.z = roundEven(0.0);
R2f.w = -(R2f.w) * 2.0 + 1.0;
R2f.w = clamp(R2f.w, 0.0, 1.0);
R3f.w = intBitsToFloat(0x3c808081);
R0f.w = (texture(textureUnitPS3, vec3(R2f.x,R2f.y,R2f.z)).w);
// 0
PV0fx = R0f.w + intBitsToFloat(0x3e4ccccd);
PV0fy = R2f.w * 19.125;
PV0fz = intBitsToFloat(uf_remappedPS[0].z);
R1f.w = 0.0;
R2f.x = R3f.w;
// 1
PV1fx = floor(PV0fy);
PV1fx *= 4.0;
R2f.y = PV0fz;
R0f.z = R3f.z * 0.5 + 0.5;
R2f.w = mul_nonIEEE(R0f.x, PV0fx);
R0f.x = R3f.x * 0.5 + 0.5;
// 2
R0f.y = R3f.y * 0.5 + 0.5;
R0f.w = PV1fx * intBitsToFloat(0x3b808081);
// 3
R5f.x = R0f.x;
R5f.y = R0f.y;
R5f.z = R0f.z;
R5f.w = R0f.w;
// 4
R4f.x = R1f.x;
R4f.y = R1f.y;
R4f.z = R1f.z;
R4f.w = R1f.w;
// 5
R3f.x = R2f.x;
R3f.y = R2f.y;
R3f.z = R2f.z;
R3f.w = R2f.w;
// export
if( ((vec4(R3f.x, R3f.y, R3f.z, R3f.w)).a >= uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R3f.x, R3f.y, R3f.z, R3f.w);
passPixelColor1 = vec4(R4f.x, R4f.y, R4f.z, R4f.w);
passPixelColor3 = vec4(R5f.x, R5f.y, R5f.z, R5f.w);
}
