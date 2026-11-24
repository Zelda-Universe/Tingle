#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 9b4f275d0fd8c16a
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[4];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
in vec4 passParameterSem0;
in vec4 passParameterSem4;
in vec4 passParameterSem7;
in vec4 passParameterSem8;
in vec4 passParameterSem10;
in vec4 passParameterSem11;
in vec4 passParameterSem13;
layout(location = 0) out vec4 passPixelColor0;
layout(location = 1) out vec4 passPixelColor1;
layout(location = 3) out vec4 passPixelColor3;
layout(location = 5) out vec4 passPixelColor5;
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
vec4 R123f = vec4(0.0);
vec4 R124f = vec4(0.0);
vec4 R125f = vec4(0.0);
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
R1f = passParameterSem4;
R2f = passParameterSem7;
R3f = passParameterSem8;
R4f = passParameterSem10;
R5f = passParameterSem11;
R6f = passParameterSem13;
R7f.xy = (texture(textureUnitPS1, vec2(R3f.z,R3f.w)).xy);
R3f.xyzw = (texture(textureUnitPS0, vec2(R3f.x,R3f.y)).xyzw);
// 0
R127f.x = mul_nonIEEE(R6f.y, R7f.x);
R127f.y = mul_nonIEEE(R6f.x, R7f.x);
PV0fz = 0.0;
PV0fw = mul_nonIEEE(R6f.z, R7f.x);
R126f.x = intBitsToFloat(uf_remappedPS[0].z) * 0.99609375;
// 1
tempf.x = dot(vec4(R7f.x,R7f.y,PV0fz,intBitsToFloat(0x80000000)),vec4(R7f.x,R7f.y,R7f.y,0.0));
tempf.x = clamp(tempf.x, 0.0, 1.0);
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R126f.y = mul_nonIEEE(R4f.z,R7f.y) + PV0fw;
// 2
backupReg0f = R127f.x;
R127f.x = mul_nonIEEE(R4f.x,R7f.y) + R127f.y;
PV0fy = intBitsToFloat(uf_remappedPS[0].y) * 64.0;
R127f.z = mul_nonIEEE(R4f.y,R7f.y) + backupReg0f;
PV0fw = -(PV1fx) + 1.0;
PS0f = R126f.x * 64.0;
// 3
PV1fx = PV0fy * 0.99609375;
PV1fy = floor(PS0f);
PV1fy *= 4.0;
R126f.z = mul_nonIEEE(R2f.w, R3f.w);
R127f.w = mul_nonIEEE(R0f.x, R3f.x);
PS1f = sqrt(PV0fw);
// 4
R126f.x = mul_nonIEEE(R5f.x,PS1f) + R127f.x;
R127f.y = mul_nonIEEE(R5f.y,PS1f) + R127f.z;
R123f.z = mul_nonIEEE(R5f.z,PS1f) + R126f.y;
PV0fw = floor(PV1fx);
PV0fw *= 4.0;
R127f.x = PV1fy + 0.0;
// 5
backupReg0f = R126f.z;
R125f.x = mul_nonIEEE(R0f.y, R3f.y);
R126f.y = PV0fw + 0.0;
R126f.z = -(R123f.z) * -(1.0);
R126f.w = mul_nonIEEE(R0f.z, R3f.z);
R125f.y = mul_nonIEEE(R0f.w, backupReg0f);
R125f.y = clamp(R125f.y, 0.0, 1.0);
// 6
R124f.x = dot(vec4(R126f.x,R127f.y,R126f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[1].x),intBitsToFloat(uf_remappedPS[1].y),intBitsToFloat(uf_remappedPS[1].z),0.0));
PV0fy = R124f.x;
PV0fz = R124f.x;
PV0fw = R124f.x;
R125f.w = R127f.x + 0.0;
// 7
backupReg0f = R126f.y;
tempf.x = dot(vec4(R126f.x,R127f.y,R126f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[2].x),intBitsToFloat(uf_remappedPS[2].y),intBitsToFloat(uf_remappedPS[2].z),0.0));
PV1fx = tempf.x;
R126f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R127f.x = backupReg0f + 0.0;
// 8
tempf.x = dot(vec4(R126f.x,R127f.y,R126f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(uf_remappedPS[3].y),intBitsToFloat(uf_remappedPS[3].z),0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
R127f.z = tempf.x;
PV0fw = tempf.x;
R0f.x = mul_nonIEEE(R2f.x, R127f.w);
// 9
tempf.x = dot(vec4(R124f.x,R126f.y,PV0fx,intBitsToFloat(0x80000000)),vec4(R124f.x,R126f.y,PV0fx,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
R126f.z = tempf.x;
PV1fw = tempf.x;
R0f.y = mul_nonIEEE(R2f.y, R125f.x);
// 10
R3f.x = 0.0;
R2f.y = intBitsToFloat(0x3ec0c0c1);
R0f.z = mul_nonIEEE(R2f.z, R126f.w);
R2f.w = mul_nonIEEE(R1f.x, R125f.y);
R2f.x = intBitsToFloat(0x3d008081);
// 11
R2f.z = 0.0;
R0f.w = R125f.w * intBitsToFloat(0x3b808081);
R1f.w = R127f.x * intBitsToFloat(0x3b808081);
// 12
tempResultf = 1.0 / sqrt(R126f.z);
PS0f = tempResultf;
PS0f /= 2.0;
// 13
R1f.x = mul_nonIEEE(R124f.x,PS0f) + 0.5;
R1f.y = mul_nonIEEE(R126f.y,PS0f) + 0.5;
R1f.z = mul_nonIEEE(R127f.z,PS0f) + 0.5;
// 14
R6f.x = R1f.x;
R6f.y = R1f.y;
R6f.z = R1f.z;
R6f.w = R1f.w;
// 15
R5f.x = R0f.x;
R5f.y = R0f.y;
R5f.z = R0f.z;
R5f.w = R0f.w;
// 16
R4f.x = R2f.x;
R4f.y = R2f.y;
R4f.z = R2f.z;
R4f.w = R2f.w;
// 17
R7f.x = R3f.x;
R7f.y = R3f.x;
R7f.z = R3f.x;
R7f.w = R3f.x;
// export
if( ((vec4(R4f.x, R4f.y, R4f.z, R4f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R4f.x, R4f.y, R4f.z, R4f.w);
passPixelColor1 = vec4(R5f.x, R5f.y, R5f.z, R5f.w);
passPixelColor3 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
passPixelColor5 = vec4(R7f.x, R7f.y, R7f.z, R7f.w);
}
