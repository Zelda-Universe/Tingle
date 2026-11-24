#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 3534ec2c0c2ab5aa
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[3];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(3, 1, 0) uniform sampler2DArray textureUnitPS3;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem2;
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
// 0
R1f.x = R1f.z;
R1f.y = R1f.w;
PV0fz = intBitsToFloat(0x3c808081);
PV0fw = intBitsToFloat(uf_remappedPS[0].w);
PS0f = intBitsToFloat(uf_remappedPS[1].z);
// 1
R4f.x = PV0fz;
R4f.y = PS0f;
R1f.z = roundEven(PV0fw);
R4f.w = 1.0;
R3f.x = R2f.x * 0.5 + 0.5;
R1f.xyz = (texture(textureUnitPS3, vec3(R1f.x,R1f.y,R1f.z)).xyz);
// 0
R0f.x = mul_nonIEEE(R0f.x, R1f.x);
R0f.y = mul_nonIEEE(R0f.y, R1f.y);
R0f.z = mul_nonIEEE(R0f.z, R1f.z);
R0f.w = 0.0;
R3f.y = R2f.y * 0.5 + 0.5;
// 1
tempf.x = dot(vec4(R0f.x,R0f.y,R0f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e990afe),intBitsToFloat(0x3f162c23),intBitsToFloat(0x3dea7371),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R3f.z = R2f.z * 0.5 + 0.5;
// 2
PV0fz = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedPS[2].w));
// 3
PV1fy = PV0fz * 191.25;
// 4
PV0fx = floor(PV1fy);
PV0fx *= 4.0;
// 5
R3f.w = PV0fx * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081);
// 6
R3f.x = R3f.x;
R3f.y = R3f.y;
R3f.z = R3f.z;
R3f.w = R3f.w;
// 7
R1f.x = R4f.x;
R1f.y = R4f.y;
R1f.z = R4f.z;
R1f.w = R4f.w;
// 8
R2f.x = R0f.x;
R2f.y = R0f.y;
R2f.z = R0f.z;
R2f.w = R0f.w;
// export
passPixelColor0 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
passPixelColor1 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
passPixelColor3 = vec4(R3f.x, R3f.y, R3f.z, R3f.w);
}
