#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader d0331c4c48898362
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
TEXTURE_LAYOUT(2, 1, 2) uniform sampler2D textureUnitPS2;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem4;
in vec4 passParameterSem7;
in vec4 passParameterSem8;
in vec4 passParameterSem9;
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
vec4 R8f = vec4(0.0);
vec4 R9f = vec4(0.0);
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
R1f = passParameterSem1;
R2f = passParameterSem4;
R3f = passParameterSem7;
R4f = passParameterSem8;
R5f = passParameterSem9;
R6f = passParameterSem10;
R7f = passParameterSem11;
R8f = passParameterSem13;
R9f.xy = (texture(textureUnitPS1, vec2(R4f.z,R4f.w)).xy);
R2f.w = (texture(textureUnitPS2, vec2(R5f.x,R5f.y)).w);
R4f.xyzw = (texture(textureUnitPS0, vec2(R4f.x,R4f.y)).xyzw);
// 0
R127f.x = mul_nonIEEE(R8f.y, R9f.x);
R127f.y = mul_nonIEEE(R8f.x, R9f.x);
PV0fz = 0.0;
PV0fw = mul_nonIEEE(R8f.z, R9f.x);
R127f.z = intBitsToFloat(uf_remappedPS[0].z) * 0.99609375;
// 1
tempf.x = dot(vec4(R9f.x,R9f.y,PV0fz,intBitsToFloat(0x80000000)),vec4(R9f.x,R9f.y,R9f.y,0.0));
tempf.x = clamp(tempf.x, 0.0, 1.0);
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R126f.y = mul_nonIEEE(R6f.z,R9f.y) + PV0fw;
// 2
backupReg0f = R127f.x;
backupReg1f = R127f.z;
R127f.x = mul_nonIEEE(R6f.x,R9f.y) + R127f.y;
PV0fy = intBitsToFloat(uf_remappedPS[0].y) * 64.0;
R127f.z = mul_nonIEEE(R6f.y,R9f.y) + backupReg0f;
PV0fw = -(PV1fx) + 1.0;
PS0f = backupReg1f * 64.0;
// 3
R126f.x = floor(PS0f);
R126f.x *= 4.0;
PV1fy = mul_nonIEEE(R4f.w, R2f.w);
R125f.z = R4f.x * 1.0;
PV1fw = PV0fy * 0.99609375;
PS1f = sqrt(PV0fw);
// 4
R123f.x = mul_nonIEEE(R7f.z,PS1f) + R126f.y;
R126f.y = mul_nonIEEE(R7f.x,PS1f) + R127f.x;
R127f.z = mul_nonIEEE(R7f.y,PS1f) + R127f.z;
R127f.w = floor(PV1fw);
R127f.w *= 4.0;
R7f.z = mul_nonIEEE(R3f.w,PV1fy) + -(R0f.w);
// 5
R127f.x = R4f.y * 1.0;
R127f.y = R0f.x + -(R1f.x);
R126f.z = -(R123f.x) * -(1.0);
R125f.w = R4f.z * 1.0;
R124f.z = R0f.y + -(R1f.y);
// 6
R125f.x = dot(vec4(R126f.y,R127f.z,R126f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[1].x),intBitsToFloat(uf_remappedPS[1].y),intBitsToFloat(uf_remappedPS[1].z),0.0));
PV0fy = R125f.x;
PV0fz = R125f.x;
PV0fw = R125f.x;
R126f.w = R0f.z + -(R1f.z);
// 7
tempf.x = dot(vec4(R126f.y,R127f.z,R126f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[2].x),intBitsToFloat(uf_remappedPS[2].y),intBitsToFloat(uf_remappedPS[2].z),0.0));
PV1fx = tempf.x;
R125f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R126f.x = R126f.x + 0.0;
// 8
tempf.x = dot(vec4(R126f.y,R127f.z,R126f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(uf_remappedPS[3].y),intBitsToFloat(uf_remappedPS[3].z),0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
R127f.z = tempf.x;
PV0fw = tempf.x;
R126f.y = R127f.w + 0.0;
// 9
backupReg0f = R125f.z;
tempf.x = dot(vec4(R125f.x,R125f.y,PV0fx,intBitsToFloat(0x80000000)),vec4(R125f.x,R125f.y,PV0fx,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
R125f.z = tempf.x;
PV1fw = tempf.x;
R127f.y = mul_nonIEEE(R127f.y,backupReg0f) + R1f.x;
// 10
R123f.x = mul_nonIEEE(R124f.z,R127f.x) + R1f.y;
PV0fy = mul_nonIEEE(R1f.w, R7f.z);
PV0fy = clamp(PV0fy, 0.0, 1.0);
R124f.z = R126f.x + 0.0;
R123f.w = mul_nonIEEE(R126f.w,R125f.w) + R1f.z;
R127f.x = R126f.y + 0.0;
// 11
R3f.x = mul_nonIEEE(R3f.x, R127f.y);
R3f.y = mul_nonIEEE(R3f.y, R123f.x);
R3f.z = mul_nonIEEE(R3f.z, R123f.w);
R1f.w = mul_nonIEEE(R2f.x, PV0fy);
R0f.y = 0.0;
// 12
R1f.x = intBitsToFloat(0x3c808081);
R1f.y = intBitsToFloat(0x3ec0c0c1);
R1f.z = 0.0;
R3f.w = R124f.z * intBitsToFloat(0x3b808081);
R2f.w = R127f.x * intBitsToFloat(0x3b808081);
// 13
tempResultf = 1.0 / sqrt(R125f.z);
PS1f = tempResultf;
PS1f /= 2.0;
// 14
R2f.x = mul_nonIEEE(R125f.x,PS1f) + 0.5;
R2f.y = mul_nonIEEE(R125f.y,PS1f) + 0.5;
R2f.z = mul_nonIEEE(R127f.z,PS1f) + 0.5;
// 15
R6f.x = R2f.x;
R6f.y = R2f.y;
R6f.z = R2f.z;
R6f.w = R2f.w;
// 16
R5f.x = R3f.x;
R5f.y = R3f.y;
R5f.z = R3f.z;
R5f.w = R3f.w;
// 17
R4f.x = R1f.x;
R4f.y = R1f.y;
R4f.z = R1f.z;
R4f.w = R1f.w;
// 18
R7f.x = R0f.y;
R7f.y = R0f.y;
R7f.z = R0f.y;
R7f.w = R0f.y;
// export
if( ((vec4(R4f.x, R4f.y, R4f.z, R4f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R4f.x, R4f.y, R4f.z, R4f.w);
passPixelColor1 = vec4(R5f.x, R5f.y, R5f.z, R5f.w);
passPixelColor3 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
passPixelColor5 = vec4(R7f.x, R7f.y, R7f.z, R7f.w);
}
