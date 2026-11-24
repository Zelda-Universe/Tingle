#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader d562c3cc09c63cd5
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[4];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(3, 1, 0) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 1) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(5, 1, 2) uniform sampler2D textureUnitPS5;
TEXTURE_LAYOUT(6, 1, 3) uniform sampler2D textureUnitPS6;
in vec4 passParameterSem0;
in vec4 passParameterSem2;
in vec4 passParameterSem6;
in vec4 passParameterSem4;
in vec4 passParameterSem5;
in vec4 passParameterSem7;
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
R1f = passParameterSem2;
R2f = passParameterSem6;
R3f = passParameterSem4;
R4f = passParameterSem5;
R5f = passParameterSem7;
R6f.xy = (texture(textureUnitPS4, vec2(R0f.x,R0f.y)).xy);
R7f.xyz = (texture(textureUnitPS5, vec2(R0f.x,R0f.y)).xyz);
R8f.xyz = (texture(textureUnitPS3, vec2(R0f.x,R0f.y)).xyz);
R0f.w = (texture(textureUnitPS6, vec2(R0f.x,R0f.y)).w);
// 0
R127f.x = R1f.x + R3f.x;
R127f.y = R1f.y + R3f.y;
R127f.z = R1f.z + R3f.z;
R124f.w = R6f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R127f.w = R6f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
// 1
tempf.x = dot(vec4(R127f.x,R127f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(R127f.x,R127f.y,R127f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R126f.y = mul_nonIEEE(R124f.w, R124f.w);
// 2
tempf.x = dot(vec4(R5f.x,R5f.y,R5f.z,intBitsToFloat(0x80000000)),vec4(R5f.x,R5f.y,R5f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
tempResultf = 1.0 / sqrt(PV1fx);
PS0f = tempResultf;
// 3
backupReg0f = R127f.x;
backupReg1f = R126f.y;
R127f.x = mul_nonIEEE(R127f.y, PS0f);
R126f.y = mul_nonIEEE(backupReg0f, PS0f);
R124f.z = mul_nonIEEE(R127f.z, PS0f);
R126f.w = mul_nonIEEE(R127f.w,R127f.w) + backupReg1f;
R126f.w = clamp(R126f.w, 0.0, 1.0);
PS1f = sqrt(PV0fx);
// 4
PV0fx = mul_nonIEEE(R4f.y, R126f.y);
PV0fy = mul_nonIEEE(R4f.x, R124f.z);
R126f.z = mul_nonIEEE(R4f.w, R127f.w);
PV0fw = mul_nonIEEE(R4f.z, R127f.x);
R127f.w = 1.0 / PS1f;
// 5
R125f.x = mul_nonIEEE(R5f.x, R127f.w);
R127f.y = mul_nonIEEE(-(R4f.x),R127f.x) + PV0fx;
R127f.z = mul_nonIEEE(-(R4f.y),R124f.z) + PV0fw;
R125f.w = mul_nonIEEE(-(R4f.z),R126f.y) + PV0fy;
R4f.y = mul_nonIEEE(R5f.y, R127f.w);
// 6
PV0fx = mul_nonIEEE(R124f.z, R125f.w);
R1f.y = mul_nonIEEE(R5f.z, R127f.w);
PV0fz = mul_nonIEEE(R126f.y, R127f.y);
PV0fw = mul_nonIEEE(R127f.x, R127f.z);
R125f.z = -(R126f.w) + 1.0;
// 7
backupReg0f = R127f.z;
R123f.x = mul_nonIEEE(-(R124f.z),backupReg0f) + PV0fz;
R123f.y = mul_nonIEEE(-(R127f.x),R127f.y) + PV0fx;
R127f.z = mul_nonIEEE(-(R126f.y),R125f.w) + PV0fw;
PV1fw = mul_nonIEEE(backupReg0f, R126f.z);
PS1f = mul_nonIEEE(R125f.w, R126f.z);
// 8
backupReg0f = R127f.y;
R126f.x = R125f.x + intBitsToFloat(uf_remappedPS[0].x);
R127f.y = mul_nonIEEE(R124f.w,R123f.x) + PS1f;
PV0fz = mul_nonIEEE(backupReg0f, R126f.z);
R125f.w = mul_nonIEEE(R124f.w,R123f.y) + PV1fw;
R125f.y = R4f.y + intBitsToFloat(uf_remappedPS[0].y);
// 9
R123f.x = mul_nonIEEE(R124f.w,R127f.z) + PV0fz;
R124f.y = 0.0;
R127f.z = R1f.y + intBitsToFloat(uf_remappedPS[0].z);
R124f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].z), intBitsToFloat(uf_remappedPS[1].w));
PS1f = sqrt(R125f.z);
// 10
backupReg0f = R127f.x;
R127f.x = mul_nonIEEE(PS1f,R126f.y) + R125f.w;
R127f.y = mul_nonIEEE(PS1f,backupReg0f) + R127f.y;
R124f.z = mul_nonIEEE(PS1f,R124f.z) + R123f.x;
R127f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), intBitsToFloat(uf_remappedPS[1].w));
R126f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].y), intBitsToFloat(uf_remappedPS[1].w));
// 11
tempf.x = dot(vec4(R126f.x,R125f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(R126f.x,R125f.y,R127f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R125f.w = 0.0;
// 12
tempf.x = dot(vec4(R127f.x,R127f.y,R124f.z,intBitsToFloat(0x80000000)),vec4(R127f.x,R127f.y,R124f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
tempResultf = 1.0 / sqrt(PV1fx);
PS0f = tempResultf;
// 13
PV1fx = mul_nonIEEE(R125f.y, PS0f);
PV1fy = mul_nonIEEE(R126f.x, PS0f);
R126f.z = R7f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
PV1fw = mul_nonIEEE(R127f.z, PS0f);
tempResultf = 1.0 / sqrt(PV0fx);
R127f.z = tempResultf;
// 14
backupReg0f = R127f.x;
backupReg1f = R127f.z;
backupReg2f = R127f.y;
R127f.x = mul_nonIEEE(PV1fy, intBitsToFloat(uf_remappedPS[1].w));
R127f.y = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedPS[1].w));
R125f.z = mul_nonIEEE(PV1fw, intBitsToFloat(uf_remappedPS[1].w));
R126f.w = mul_nonIEEE(backupReg0f, backupReg1f);
R125f.y = mul_nonIEEE(backupReg2f, backupReg1f);
// 15
backupReg0f = R0f.w;
R126f.x = R7f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R9f.y = 0.0;
R127f.z = mul_nonIEEE(R124f.z, R127f.z);
R0f.w = R7f.z * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R9f.w = backupReg0f;
// 16
tempf.x = dot(vec4(-(R127f.x),-(R127f.y),-(R125f.z),-(R125f.w)),vec4(R126f.w,R125f.y,R127f.z,R127f.z));
PV0fx = tempf.x;
PV0fy = tempf.x;
R125f.z = tempf.x;
PV0fw = tempf.x;
R9f.x = intBitsToFloat(0x3ce0e0e1);
// 17
tempf.x = dot(vec4(-(R127f.w),-(R126f.y),-(R124f.w),-(R124f.y)),vec4(R126f.w,R125f.y,R127f.z,R127f.z));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R3f.x = R126f.w * 0.5 + 0.5;
// 18
PV0fx = mul_nonIEEE(R1f.y, R124f.w);
R3f.y = R125f.y * 0.5 + 0.5;
R3f.z = R127f.z * 0.5 + 0.5;
R4f.w = mul_nonIEEE(PV1fx, R125f.z);
R6f.w = intBitsToFloat(0x3c008081);
// 19
tempf.x = dot(vec4(R125f.x,R4f.y,PV0fx,intBitsToFloat(0x80000000)),vec4(R127f.w,R126f.y,1.0,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R3f.w = 0.0;
// 20
tempf.x = dot(vec4(R125f.x,R4f.y,R1f.y,intBitsToFloat(0x80000000)),vec4(R126f.w,R125f.y,R127f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = max(-(PV1fx), 0.0);
// 21
R4f.x = PV0fx + 1.0;
R4f.x = clamp(R4f.x, 0.0, 1.0);
PV1fy = min(PS0f, 1.0);
// 22
R7f.x = mul_nonIEEE(R4f.x,R4f.x) + R126f.x;
R7f.x = clamp(R7f.x, 0.0, 1.0);
R1f.y = mul_nonIEEE(R4f.x,R4f.x) + R126f.z;
R1f.y = clamp(R1f.y, 0.0, 1.0);
R7f.z = mul_nonIEEE(R4f.x,R4f.x) + R0f.w;
R7f.z = clamp(R7f.z, 0.0, 1.0);
R0f.w = mul_nonIEEE(PV1fy, PV1fy);
// 0
R126f.x = mul_nonIEEE(R1f.y, R0f.w);
R125f.y = mul_nonIEEE(R7f.x, R0f.w);
R123f.z = mul_nonIEEE(-(R5f.z),intBitsToFloat(uf_remappedPS[2].y)) + intBitsToFloat(uf_remappedPS[2].z);
R123f.z = clamp(R123f.z, 0.0, 1.0);
R126f.w = mul_nonIEEE(R7f.z, R0f.w);
// 1
R123f.z = mul_nonIEEE(-(R123f.z),R4f.w) + R4f.w;
R123f.z = clamp(R123f.z, 0.0, 1.0);
// 2
tempResultf = max(0.0, R123f.z);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0f = tempResultf;
// 3
PV1fx = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x), PS0f);
// 4
PS0f = exp2(PV1fx);
// 5
PV1fz = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].y), PS0f);
// 6
PV0fy = mul_nonIEEE(R4f.x, PV1fz);
// 7
R123f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].w),R126f.x) + PV0fy;
R123f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].w),R126f.w) + PV0fy;
R123f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].w),R125f.y) + PV0fy;
// 8
backupReg0f = R123f.x;
R123f.x = mul_nonIEEE(R8f.y,R123f.w) + R8f.y;
R123f.y = mul_nonIEEE(R8f.x,backupReg0f) + R8f.x;
R123f.z = mul_nonIEEE(R8f.z,R123f.z) + R8f.z;
// 9
R6f.x = mul_nonIEEE(R2f.x, R123f.y);
R6f.y = mul_nonIEEE(R2f.x, R123f.x);
R6f.z = mul_nonIEEE(R2f.x, R123f.z);
// 10
R2f.x = R3f.x;
R2f.y = R3f.y;
R2f.z = R3f.z;
R2f.w = R3f.w;
// 11
R1f.x = R6f.x;
R1f.y = R6f.y;
R1f.z = R6f.z;
R1f.w = R6f.w;
// 12
R0f.x = R9f.x;
R0f.y = R9f.y;
R0f.z = R9f.z;
R0f.w = R9f.w;
// export
if( ((vec4(R0f.x, R0f.y, R0f.z, R0f.w)).a >= uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
passPixelColor1 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
passPixelColor3 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
}
