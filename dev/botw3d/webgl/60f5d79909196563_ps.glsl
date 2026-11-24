#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 60f5d79909196563
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[3];
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
R2f.x = R2f.z;
PV0fy = R0f.z;
PV0fz = intBitsToFloat(0x3c808081);
PS0f = intBitsToFloat(uf_remappedPS[0].z);
// 1
R5f.x = PV0fz;
R5f.y = PS0f;
R2f.z = roundEven(PV0fy);
R6f.w = 0.0;
R4f.x = R3f.x * 0.5 + 0.5;
R2f.xyzw = (texture(textureUnitPS3, vec3(R2f.x,R2f.w,R2f.z)).xyzw);
// 0
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e990afe),intBitsToFloat(0x3f162c23),intBitsToFloat(0x3dea7371),0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R127f.w = R1f.x + -(R2f.x);
// 1
PV1fx = R1f.z + -(R2f.z);
PV1fy = R1f.y + -(R2f.y);
PV1fz = mul_nonIEEE(R0f.w, PV0fx);
R5f.w = R2f.w;
R4f.y = R3f.y * 0.5 + 0.5;
// 2
R6f.x = mul_nonIEEE(R127f.w,PV1fz) + R2f.x;
R6f.y = mul_nonIEEE(PV1fy,PV1fz) + R2f.y;
R6f.z = mul_nonIEEE(PV1fx,PV1fz) + R2f.z;
R4f.z = R3f.z * 0.5 + 0.5;
// 3
tempf.x = dot(vec4(R6f.x,R6f.y,R6f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e990afe),intBitsToFloat(0x3f162c23),intBitsToFloat(0x3dea7371),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
// 4
PV0fz = -(PV1fx) + 1.0;
// 5
PV1fy = PV0fz + -(intBitsToFloat(uf_remappedPS[1].z));
// 6
PV0fx = PV1fy * 100.0;
PV0fx = clamp(PV0fx, 0.0, 1.0);
// 7
PV1fz = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].x), PV0fx);
// 8
PV0fy = PV1fz * 63.75;
// 9
PV1fx = floor(PV0fy);
PV1fx *= 4.0;
// 10
R4f.w = PV1fx * intBitsToFloat(0x3b808081);
// 11
R2f.x = R4f.x;
R2f.y = R4f.y;
R2f.z = R4f.z;
R2f.w = R4f.w;
// 12
R0f.x = R5f.x;
R0f.y = R5f.y;
R0f.z = R5f.z;
R0f.w = R5f.w;
// 13
R1f.x = R6f.x;
R1f.y = R6f.y;
R1f.z = R6f.z;
R1f.w = R6f.w;
// export
if( ((vec4(R0f.x, R0f.y, R0f.z, R0f.w)).a >= uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
passPixelColor1 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
passPixelColor3 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
}
