#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 2d99f8fc71250513
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[4];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(4, 1, 0) uniform sampler2DArray textureUnitPS4;
TEXTURE_LAYOUT(5, 1, 1) uniform sampler2DArray textureUnitPS5;
in vec4 passParameterSem0;
in vec4 passParameterSem5;
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
vec4 R8f = vec4(0.0);
vec4 R9f = vec4(0.0);
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
R1f = passParameterSem5;
R2f = passParameterSem3;
R3f = passParameterSem4;
// 0
PV0fx = intBitsToFloat(uf_remappedPS[0].z);
R5f.y = R0f.w;
R1f.z = -(R1f.w) + 1.0;
PV0fw = intBitsToFloat(uf_remappedPS[1].z);
R5f.x = R0f.z;
// 1
R127f.x = intBitsToFloat(uf_remappedPS[2].z);
PV1fy = intBitsToFloat(uf_remappedPS[3].z);
R0f.z = roundEven(PV0fw);
R5f.w = roundEven(PV0fx);
PS1f = mul_nonIEEE(R2f.y, R3f.z);
// 2
R7f.x = mul_nonIEEE(-(R3f.y),R2f.z) + PS1f;
PV0fy = mul_nonIEEE(R2f.x, R3f.y);
R5f.z = roundEven(PV1fy);
PV0fw = mul_nonIEEE(R2f.z, R3f.x);
R9f.w = 1.0;
// 3
R9f.x = intBitsToFloat(0x3c808081);
R1f.y = mul_nonIEEE(-(R3f.x),R2f.y) + PV0fy;
R9f.z = 0.0;
R2f.w = mul_nonIEEE(-(R3f.z),R2f.x) + PV0fw;
R8f.w = 0.0;
// 4
R4f.x = R0f.x;
R4f.y = R0f.y;
R4f.z = roundEven(R127f.x);
R6f.xyz = (texture(textureUnitPS5, vec3(R0f.x,R0f.y,R0f.z)).xyz);
R0f.xyz = (texture(textureUnitPS5, vec3(R5f.x,R5f.y,R5f.w)).xyz);
R4f.xyz = (texture(textureUnitPS4, vec3(R4f.x,R4f.y,R4f.z)).xyz);
R5f.xyz = (texture(textureUnitPS4, vec3(R5f.x,R5f.y,R5f.z)).xyz);
// 0
R127f.x = R6f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R127f.y = R6f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R127f.z = R0f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R123f.w = R0f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
PS0f = -(R6f.z) + R0f.z;
// 1
PV1fx = -(R127f.y) + R123f.w;
PV1fy = mul_nonIEEE(R123f.w, R123f.w);
PV1fz = -(R127f.x) + R127f.z;
PV1fw = mul_nonIEEE(R127f.y, R127f.y);
R126f.z = mul_nonIEEE(PS0f,R1f.z) + R6f.z;
// 2
R123f.x = mul_nonIEEE(R127f.z,R127f.z) + PV1fy;
R123f.x = clamp(R123f.x, 0.0, 1.0);
R126f.y = mul_nonIEEE(PV1fx,R1f.z) + R127f.y;
R123f.z = mul_nonIEEE(R127f.x,R127f.x) + PV1fw;
R123f.z = clamp(R123f.z, 0.0, 1.0);
R126f.w = mul_nonIEEE(PV1fz,R1f.z) + R127f.x;
R127f.y = -(R4f.x) + R5f.x;
// 3
PV1fx = -(R4f.y) + R5f.y;
PV1fy = -(R123f.z) + 1.0;
PV1fz = -(R4f.z) + R5f.z;
R127f.w = -(R123f.x) + 1.0;
PS1f = R126f.z * 63.75;
// 4
R123f.x = mul_nonIEEE(PV1fz,R1f.z) + R4f.z;
R123f.y = mul_nonIEEE(PV1fx,R1f.z) + R4f.y;
R123f.z = mul_nonIEEE(R127f.y,R1f.z) + R4f.x;
PV0fw = floor(PS1f);
PV0fw *= 4.0;
R127f.x = sqrt(PV1fy);
// 5
R8f.x = mul_nonIEEE(R1f.x, R123f.z);
R8f.y = mul_nonIEEE(R1f.x, R123f.y);
R8f.z = mul_nonIEEE(R1f.x, R123f.x);
R4f.w = PV0fw * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081);
PS1f = sqrt(R127f.w);
// 6
PV0fw = -(R127f.x) + PS1f;
// 7
R126f.z = mul_nonIEEE(PV0fw,R1f.z) + R127f.x;
// 8
tempf.x = dot(vec4(R126f.y,R126f.w,R126f.z,intBitsToFloat(0x80000000)),vec4(R126f.y,R126f.w,R126f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 9
tempResultf = 1.0 / sqrt(PV0fx);
PS1f = tempResultf;
// 10
PV0fx = mul_nonIEEE(R126f.w, PS1f);
R126f.y = mul_nonIEEE(R126f.y, PS1f);
R126f.z = mul_nonIEEE(R126f.z, PS1f);
// 11
PV1fw = mul_nonIEEE(R3f.w, PV0fx);
// 12
PV0fx = mul_nonIEEE(R2f.w, PV1fw);
PV0fy = mul_nonIEEE(R7f.x, PV1fw);
PV0fz = mul_nonIEEE(R1f.y, PV1fw);
// 13
R123f.x = mul_nonIEEE(R3f.z,R126f.y) + PV0fz;
R123f.y = mul_nonIEEE(R3f.y,R126f.y) + PV0fx;
R123f.w = mul_nonIEEE(R3f.x,R126f.y) + PV0fy;
// 14
R123f.x = (mul_nonIEEE(R2f.z,R126f.z) + R123f.x)/2.0;
R123f.z = (mul_nonIEEE(R2f.x,R126f.z) + R123f.w)/2.0;
R123f.w = (mul_nonIEEE(R2f.y,R126f.z) + R123f.y)/2.0;
// 15
R4f.x = R123f.z + 0.5;
R4f.y = R123f.w + 0.5;
R4f.z = R123f.x + 0.5;
// 16
R2f.x = R4f.x;
R2f.y = R4f.y;
R2f.z = R4f.z;
R2f.w = R4f.w;
// 17
R1f.x = R8f.x;
R1f.y = R8f.y;
R1f.z = R8f.z;
R1f.w = R8f.w;
// 18
R0f.x = R9f.x;
R0f.y = R9f.z;
R0f.z = R9f.z;
R0f.w = R9f.w;
// export
passPixelColor0 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
passPixelColor1 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
passPixelColor3 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
}
