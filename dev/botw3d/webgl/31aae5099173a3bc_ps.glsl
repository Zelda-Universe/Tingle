#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 31aae5099173a3bc
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
R1f = passParameterSem1;
R2f = passParameterSem2;
R3f = passParameterSem3;
// 0
PV0fx = R0f.z;
R2f.y = R2f.w;
PV0fz = intBitsToFloat(0x3c808081);
R2f.w = R2f.z;
PS0f = intBitsToFloat(uf_remappedPS[0].z);
// 1
R6f.x = PV0fz;
R6f.y = PS0f;
R2f.z = roundEven(PV0fx);
R5f.w = 0.0;
R4f.x = R3f.x * 0.5 + 0.5;
R2f.xyzw = (texture(textureUnitPS3, vec3(R2f.w,R2f.y,R2f.z)).xyzw);
// 0
R127f.x = mul_nonIEEE(R2f.z, R2f.z);
R127f.y = mul_nonIEEE(R2f.y, R2f.y);
R6f.z = mul_nonIEEE(R0f.x, R2f.w);
R127f.w = mul_nonIEEE(R2f.x, R2f.x);
R4f.y = R3f.y * 0.5 + 0.5;
// 1
PV1fy = R1f.z + -(R127f.x);
PV1fz = R1f.x + -(R127f.w);
PV1fw = R1f.y + -(R127f.y);
R4f.z = R3f.z * 0.5 + 0.5;
// 2
R5f.x = mul_nonIEEE(PV1fz,R0f.w) + R127f.w;
R5f.y = mul_nonIEEE(PV1fw,R0f.w) + R127f.y;
R5f.z = mul_nonIEEE(PV1fy,R0f.w) + R127f.x;
R4f.w = 0.0;
// 3
R2f.x = R4f.x;
R2f.y = R4f.y;
R2f.z = R4f.z;
R2f.w = R4f.w;
// 4
R1f.x = R5f.x;
R1f.y = R5f.y;
R1f.z = R5f.z;
R1f.w = R5f.w;
// 5
R0f.x = R6f.x;
R0f.y = R6f.y;
R0f.z = R6f.z;
R0f.w = R6f.z;
// export
if( ((vec4(R0f.x, R0f.y, R0f.z, R0f.w)).a >= uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
passPixelColor1 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
passPixelColor3 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
}
