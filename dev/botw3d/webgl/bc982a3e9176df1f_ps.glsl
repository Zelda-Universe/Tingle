#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader bc982a3e9176df1f
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
in vec4 passParameterSem11;
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
R4f = passParameterSem11;
R1f.w = (texture(textureUnitPS1, vec2(R3f.z,R3f.w)).w);
R3f.xyzw = (texture(textureUnitPS0, vec2(R3f.x,R3f.y)).xyzw);
// 0
PV0fx = -(R4f.x) + 0.0;
R127f.y = -(R4f.z) * -(1.0);
PV0fz = intBitsToFloat(uf_remappedPS[0].z) * 0.99609375;
PV0fw = -(R4f.y) + 1.0;
PS0f = intBitsToFloat(uf_remappedPS[0].y) * 64.0;
// 1
R127f.x = PV0fx * intBitsToFloat(0x3f4ccccd) + R4f.x;
R126f.y = PV0fw * intBitsToFloat(0x3f4ccccd) + R4f.y;
PV1fz = PV0fz * 64.0;
PV1fw = -(R127f.y) + 0.0;
PS1f = PS0f * 0.99609375;
// 2
backupReg0f = R127f.y;
R126f.x = floor(PV1fz);
R126f.x *= 4.0;
R127f.y = floor(PS1f);
R127f.y *= 4.0;
R127f.z = PV1fw * intBitsToFloat(0x3f4ccccd) + backupReg0f;
R127f.w = mul_nonIEEE(R3f.w, R1f.w);
R126f.z = R3f.x * 1.0;
// 3
R124f.x = dot(vec4(R127f.x,R126f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[1].x),intBitsToFloat(uf_remappedPS[1].y),intBitsToFloat(uf_remappedPS[1].z),0.0));
PV1fy = R124f.x;
PV1fz = R124f.x;
PV1fw = R124f.x;
R125f.y = R3f.y * 1.0;
// 4
tempf.x = dot(vec4(R127f.x,R126f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[2].x),intBitsToFloat(uf_remappedPS[2].y),intBitsToFloat(uf_remappedPS[2].z),0.0));
PV0fx = tempf.x;
R124f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R125f.x = R3f.z * 1.0;
// 5
tempf.x = dot(vec4(R127f.x,R126f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(uf_remappedPS[3].y),intBitsToFloat(uf_remappedPS[3].z),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
R125f.z = tempf.x;
PV1fw = tempf.x;
R126f.w = R126f.x + 0.0;
// 6
tempf.x = dot(vec4(R124f.x,R124f.y,PV1fx,intBitsToFloat(0x80000000)),vec4(R124f.x,R124f.y,PV1fx,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
R127f.z = tempf.x;
PV0fw = tempf.x;
R127f.y = R127f.y + 0.0;
// 7
PV1fx = mul_nonIEEE(R0f.z, R125f.x);
PV1fy = mul_nonIEEE(R0f.y, R125f.y);
PV1fz = mul_nonIEEE(R0f.x, R126f.z);
PV1fw = mul_nonIEEE(R0f.w, R127f.w);
PV1fw = clamp(PV1fw, 0.0, 1.0);
R126f.z = R126f.w + 0.0;
// 8
R125f.x = R127f.y + 0.0;
R2f.y = mul_nonIEEE(R2f.y, PV1fy);
R2f.z = mul_nonIEEE(R2f.z, PV1fx);
R0f.w = mul_nonIEEE(R1f.x, PV1fw);
R2f.x = mul_nonIEEE(R2f.x, PV1fz);
// 9
R0f.x = intBitsToFloat(0x3c808081);
R0f.y = intBitsToFloat(0x3ec0c0c1);
R0f.z = 0.0;
R3f.w = 0.0;
R2f.w = R126f.z * intBitsToFloat(0x3b808081);
// 10
R1f.w = R125f.x * intBitsToFloat(0x3b808081);
tempResultf = 1.0 / sqrt(R127f.z);
PS0f = tempResultf;
PS0f /= 2.0;
// 11
R1f.x = mul_nonIEEE(R124f.x,PS0f) + 0.5;
R1f.y = mul_nonIEEE(R124f.y,PS0f) + 0.5;
R1f.z = mul_nonIEEE(R125f.z,PS0f) + 0.5;
// 12
R6f.x = R1f.x;
R6f.y = R1f.y;
R6f.z = R1f.z;
R6f.w = R1f.w;
// 13
R5f.x = R2f.x;
R5f.y = R2f.y;
R5f.z = R2f.z;
R5f.w = R2f.w;
// 14
R4f.x = R0f.x;
R4f.y = R0f.y;
R4f.z = R0f.z;
R4f.w = R0f.w;
// 15
R7f.x = R3f.w;
R7f.y = R3f.w;
R7f.z = R3f.w;
R7f.w = R3f.w;
// export
if( ((vec4(R4f.x, R4f.y, R4f.z, R4f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R4f.x, R4f.y, R4f.z, R4f.w);
passPixelColor1 = vec4(R5f.x, R5f.y, R5f.z, R5f.w);
passPixelColor3 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
passPixelColor5 = vec4(R7f.x, R7f.y, R7f.z, R7f.w);
}
