#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 7c30471f9e581d31
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[4];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
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
vec4 R8f = vec4(0.0);
vec4 R9f = vec4(0.0);
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
R1f = passParameterSem1;
R2f = passParameterSem4;
R3f = passParameterSem7;
R4f = passParameterSem8;
R5f = passParameterSem11;
R4f.xyzw = (texture(textureUnitPS0, vec2(R4f.x,R4f.y)).xyzw);
// 0
PV0fx = intBitsToFloat(uf_remappedPS[0].y) * 64.0;
R127f.y = -(R5f.z) * -(1.0);
PV0fz = intBitsToFloat(uf_remappedPS[0].z) * 0.99609375;
R127f.w = mul_nonIEEE(R3f.w, R4f.w);
PS0f = R0f.x + -(R1f.x);
// 1
PV1fx = PV0fx * 0.99609375;
PV1fy = R0f.y + -(R1f.y);
PV1fz = R0f.z + -(R1f.z);
PV1fw = PV0fz * 64.0;
R126f.w = mul_nonIEEE(PS0f,R4f.x) + R1f.x;
// 2
backupReg0f = R127f.w;
R126f.x = mul_nonIEEE(PV1fy,R4f.y) + R1f.y;
PV0fy = floor(PV1fw);
PV0fy *= 4.0;
R127f.z = floor(PV1fx);
R127f.z *= 4.0;
R127f.w = mul_nonIEEE(PV1fz,R4f.z) + R1f.z;
R125f.x = mul_nonIEEE(R0f.w, backupReg0f);
R125f.x = clamp(R125f.x, 0.0, 1.0);
// 3
R124f.x = dot(vec4(R5f.x,R5f.y,R127f.y,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[1].x),intBitsToFloat(uf_remappedPS[1].y),intBitsToFloat(uf_remappedPS[1].z),0.0));
PV1fy = R124f.x;
PV1fz = R124f.x;
PV1fw = R124f.x;
R127f.x = PV0fy + 0.0;
// 4
tempf.x = dot(vec4(R5f.x,R5f.y,R127f.y,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[2].x),intBitsToFloat(uf_remappedPS[2].y),intBitsToFloat(uf_remappedPS[2].z),0.0));
PV0fx = tempf.x;
R125f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R126f.y = R127f.z + 0.0;
// 5
tempf.x = dot(vec4(R5f.x,R5f.y,R127f.y,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(uf_remappedPS[3].y),intBitsToFloat(uf_remappedPS[3].z),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
R126f.z = tempf.x;
PV1fw = tempf.x;
R125f.w = R127f.x + 0.0;
// 6
tempf.x = dot(vec4(R124f.x,R125f.y,PV1fx,intBitsToFloat(0x80000000)),vec4(R124f.x,R125f.y,PV1fx,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
R127f.z = tempf.x;
PV0fw = tempf.x;
R127f.x = R126f.y + 0.0;
// 7
R3f.x = mul_nonIEEE(R3f.x, R126f.w);
R3f.y = mul_nonIEEE(R3f.y, R126f.x);
R3f.z = mul_nonIEEE(R3f.z, R127f.w);
R0f.w = 0.0;
R3f.w = R125f.w * intBitsToFloat(0x3b808081);
// 8
R5f.x = intBitsToFloat(0x3c808081);
R5f.y = intBitsToFloat(0x3ec0c0c1);
R5f.z = 0.0;
R5f.w = mul_nonIEEE(R2f.x, R125f.x);
R2f.w = R127f.x * intBitsToFloat(0x3b808081);
// 9
tempResultf = 1.0 / sqrt(R127f.z);
PS1f = tempResultf;
PS1f /= 2.0;
// 10
R2f.x = mul_nonIEEE(R124f.x,PS1f) + 0.5;
R2f.y = mul_nonIEEE(R125f.y,PS1f) + 0.5;
R2f.z = mul_nonIEEE(R126f.z,PS1f) + 0.5;
// 11
R8f.x = R2f.x;
R8f.y = R2f.y;
R8f.z = R2f.z;
R8f.w = R2f.w;
// 12
R7f.x = R3f.x;
R7f.y = R3f.y;
R7f.z = R3f.z;
R7f.w = R3f.w;
// 13
R6f.x = R5f.x;
R6f.y = R5f.y;
R6f.z = R5f.z;
R6f.w = R5f.w;
// 14
R9f.x = R0f.w;
R9f.y = R0f.w;
R9f.z = R0f.w;
R9f.w = R0f.w;
// export
if( ((vec4(R6f.x, R6f.y, R6f.z, R6f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
passPixelColor1 = vec4(R7f.x, R7f.y, R7f.z, R7f.w);
passPixelColor3 = vec4(R8f.x, R8f.y, R8f.z, R8f.w);
passPixelColor5 = vec4(R9f.x, R9f.y, R9f.z, R9f.w);
}
