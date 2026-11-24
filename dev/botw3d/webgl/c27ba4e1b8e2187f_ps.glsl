#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader c27ba4e1b8e2187f
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[5];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 2) uniform sampler2D textureUnitPS2;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem7;
in vec4 passParameterSem8;
in vec4 passParameterSem9;
in vec4 passParameterSem11;
in vec4 passParameterSem12;
in vec4 passParameterSem14;
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
vec4 R122f = vec4(0.0);
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
R2f = passParameterSem3;
R3f = passParameterSem4;
R4f = passParameterSem7;
R5f = passParameterSem8;
R6f = passParameterSem9;
R7f = passParameterSem11;
R8f = passParameterSem12;
R9f = passParameterSem14;
R8f.xw = (texture(textureUnitPS1, vec2(R5f.z,R5f.w)).xw);
R5f.xw = (texture(textureUnitPS0, vec2(R5f.x,R5f.y)).xw);
R6f.xyz = (texture(textureUnitPS2, vec2(R6f.x,R6f.y)).xyz);
// 0
PV0fx = -(R8f.w) + 1.0;
PV0fy = R8f.x + R6f.x;
PV0fz = max(R8f.y, 960.0);
R127f.w = R0f.x + intBitsToFloat(0xbcf5c28f);
PS0f = 1.0 / R2f.w;
// 1
R126f.x = mul_nonIEEE(PV0fy, R5f.x);
PV1fy = min(PV0fz, 1233.0);
PV1fz = R2f.z * PS0f;
PV1fw = R5f.w + PV0fx;
R127f.x = R0f.y + intBitsToFloat(0xbcf5c28f);
// 2
PV0fx = PV1fy + -960.0;
R123f.y = mul_nonIEEE(PV1fz,intBitsToFloat(uf_remappedPS[0].w)) + -(intBitsToFloat(uf_remappedPS[0].y));
R127f.z = mul_nonIEEE(R5f.w, PV1fw);
PV0fw = R0f.z + intBitsToFloat(0xbcf5c28f);
R126f.z = mul_nonIEEE(R127f.w,R126f.x) + intBitsToFloat(0x3cf5c28f);
// 3
R125f.x = mul_nonIEEE(R127f.x,R126f.x) + intBitsToFloat(0x3cf5c28f);
R127f.y = mul_nonIEEE(R127f.z, R127f.z);
R127f.y = clamp(R127f.y, 0.0, 1.0);
R125f.z = mul_nonIEEE(PV0fw,R126f.x) + intBitsToFloat(0x3cf5c28f);
PV1fw = PV0fx * intBitsToFloat(0x3b700f01);
PV1fw = clamp(PV1fw, 0.0, 1.0);
PS1f = 1.0 / R123f.y;
// 4
PV0fx = intBitsToFloat(uf_remappedPS[1].z) * 0.99609375;
R125f.y = -(R7f.z) * -(1.0);
PV0fz = -(PV1fw) + 1.0;
PV0fw = -(intBitsToFloat(uf_remappedPS[0].z)) * PS1f;
PS0f = mul_nonIEEE(R0f.w, R127f.z);
// 5
PV1fx = intBitsToFloat(uf_remappedPS[1].y) * 64.0;
PV1fy = mul_nonIEEE(PV0fz, PV0fz);
PV1fz = max(PV0fw, 2000.0);
PV1fw = PV0fx * 64.0;
R127f.x = mul_nonIEEE(R1f.w, PS0f);
// 6
R126f.x = mul_nonIEEE(PV1fy, PV1fy);
PV0fy = min(PV1fz, intBitsToFloat(0x459c4000));
R123f.z = PV1fy * 2.0 + -(1.0);
PV0fw = PV1fx * 0.99609375;
PS0f = floor(PV1fw);
PS0f *= 4.0;
// 7
PV1fx = PV0fy + -2000.0;
R126f.y = R127f.y + R123f.z;
R126f.y = clamp(R126f.y, 0.0, 1.0);
PV1fz = floor(PV0fw);
PV1fz *= 4.0;
PV1fw = PS0f + 0.0;
PS1f = mul_nonIEEE(R4f.w, R127f.x);
PS1f = clamp(PS1f, 0.0, 1.0);
// 8
PV0fx = PV1fw + 1.0;
PV0fy = PV1fz + 0.0;
R0f.z = 0.0;
PV0fw = PV1fx * intBitsToFloat(0x39aec33e);
R0f.w = mul_nonIEEE(R3f.x, PS1f);
// 9
PV1fx = PV0fy + 0.0;
R0f.y = intBitsToFloat(0x3ec0c0c1);
R123f.z = 9.0 * PV0fw + 1.0;
R4f.w = PV0fx * intBitsToFloat(0x3b808081);
R0f.x = intBitsToFloat(0x3c808081);
// 10
PV0fx = mul_nonIEEE(R1f.y, R123f.z);
PV0fy = mul_nonIEEE(R1f.x, R123f.z);
PV0fz = mul_nonIEEE(R125f.y, intBitsToFloat(uf_remappedPS[2].z));
PV0fw = mul_nonIEEE(R1f.z, R123f.z);
R3f.w = PV1fx * intBitsToFloat(0x3b808081);
// 11
R123f.x = mul_nonIEEE(R7f.y,intBitsToFloat(uf_remappedPS[2].y)) + PV0fz;
PV1fy = mul_nonIEEE(PV0fw, R126f.x);
PV1fz = mul_nonIEEE(PV0fx, R126f.x);
PV1fw = mul_nonIEEE(PV0fy, R126f.x);
R1f.w = 0.0;
// 12
backupReg0f = R127f.y;
PV0fx = mul_nonIEEE(PV1fw, backupReg0f);
R127f.y = mul_nonIEEE(R7f.x,intBitsToFloat(uf_remappedPS[2].x)) + R123f.x;
PV0fz = mul_nonIEEE(PV1fy, backupReg0f);
PV0fw = mul_nonIEEE(PV1fz, backupReg0f);
PS0f = mul_nonIEEE(R125f.y, intBitsToFloat(uf_remappedPS[3].z));
// 13
R123f.x = mul_nonIEEE(R7f.y,intBitsToFloat(uf_remappedPS[3].y)) + PS0f;
PV1fy = mul_nonIEEE(PV0fz, R126f.y);
PV1fz = mul_nonIEEE(PV0fw, R126f.y);
PV1fw = mul_nonIEEE(PV0fx, R126f.y);
PS1f = mul_nonIEEE(R125f.y, intBitsToFloat(uf_remappedPS[4].z));
// 14
backupReg0f = R123f.x;
R123f.x = mul_nonIEEE(R6f.x,PV1fw) + R126f.z;
R124f.y = mul_nonIEEE(R7f.x,intBitsToFloat(uf_remappedPS[3].x)) + backupReg0f;
R126f.z = mul_nonIEEE(R6f.z,PV1fy) + R125f.z;
R127f.w = mul_nonIEEE(R6f.y,PV1fz) + R125f.x;
R122f.x = mul_nonIEEE(R7f.y,intBitsToFloat(uf_remappedPS[4].y)) + PS1f;
// 15
PV1fx = R126f.z + -(intBitsToFloat(uf_remappedPS[1].w));
PV1fy = R127f.w + -(intBitsToFloat(uf_remappedPS[1].w));
PV1fz = R123f.x + -(intBitsToFloat(uf_remappedPS[1].w));
R126f.w = mul_nonIEEE(R7f.x,intBitsToFloat(uf_remappedPS[4].x)) + R122f.x;
R125f.y = max(R123f.x, 0.0);
// 16
backupReg0f = R126f.z;
R125f.x = max(R127f.w, 0.0);
R126f.y = max(PV1fx, 0.0);
R126f.z = max(PV1fy, 0.0);
PV0fw = max(PV1fz, 0.0);
R127f.w = max(backupReg0f, 0.0);
// 17
tempf.x = dot(vec4(R127f.y,R124f.y,R126f.w,intBitsToFloat(0x80000000)),vec4(R127f.y,R124f.y,R126f.w,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
R125f.z = tempf.x;
PV1fw = tempf.x;
R126f.x = min(PV0fw, intBitsToFloat(0x47c34f80));
// 18
R4f.x = min(intBitsToFloat(uf_remappedPS[1].w), R125f.y);
R4f.y = min(intBitsToFloat(uf_remappedPS[1].w), R125f.x);
PV0fz = min(R126f.y, intBitsToFloat(0x47c34f80));
PV0fw = min(R126f.z, intBitsToFloat(0x47c34f80));
R4f.z = min(intBitsToFloat(uf_remappedPS[1].w), R127f.w);
// 19
R1f.x = mul_nonIEEE(R9f.w, R126f.x);
R1f.y = mul_nonIEEE(R9f.w, PV0fw);
R1f.z = mul_nonIEEE(R9f.w, PV0fz);
tempResultf = 1.0 / sqrt(R125f.z);
PS1f = tempResultf;
PS1f /= 2.0;
// 20
R3f.x = mul_nonIEEE(R127f.y,PS1f) + 0.5;
R3f.y = mul_nonIEEE(R124f.y,PS1f) + 0.5;
R3f.z = mul_nonIEEE(R126f.w,PS1f) + 0.5;
// 21
R8f.x = R1f.x;
R8f.y = R1f.y;
R8f.z = R1f.z;
R8f.w = R1f.w;
// 22
R7f.x = R3f.x;
R7f.y = R3f.y;
R7f.z = R3f.z;
R7f.w = R3f.w;
// 0
R6f.x = R4f.x;
R6f.y = R4f.y;
R6f.z = R4f.z;
R6f.w = R4f.w;
// 1
R5f.x = R0f.x;
R5f.y = R0f.y;
R5f.z = R0f.z;
R5f.w = R0f.w;
// export
if( ((vec4(R5f.x, R5f.y, R5f.z, R5f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R5f.x, R5f.y, R5f.z, R5f.w);
passPixelColor1 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
passPixelColor3 = vec4(R7f.x, R7f.y, R7f.z, R7f.w);
passPixelColor5 = vec4(R8f.x, R8f.y, R8f.z, R8f.w);
}
