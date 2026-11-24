#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 1e5b65a56cff348a
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[18];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 2) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(3, 1, 3) uniform sampler2D textureUnitPS3;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem2;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem6;
layout(location = 0) out vec4 passPixelColor0;
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
vec4 R10f = vec4(0.0);
vec4 R11f = vec4(0.0);
vec4 R12f = vec4(0.0);
vec4 R13f = vec4(0.0);
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
R2f = passParameterSem2;
R3f = passParameterSem3;
R4f = passParameterSem4;
R5f = passParameterSem6;
// 0
PV0fx = R0f.y + -(R4f.w);
PV0fy = R0f.x + -(R4f.z);
R126f.z = R0f.x + -(R4f.x);
R125f.w = R0f.y + -(R4f.y);
PS0f = 1.0 / intBitsToFloat(uf_remappedPS[0].w);
// 1
PV1fx = intBitsToFloat(uf_remappedPS[1].y) + intBitsToFloat(uf_remappedPS[1].z);
R127f.y = PV0fx * PS0f;
PV1fz = mul_nonIEEE(R126f.z, R126f.z);
R127f.w = PV0fy * PS0f;
R127f.z = 0.0;
// 2
PV0fx = mul_nonIEEE(R127f.w, R127f.w);
R125f.y = mul_nonIEEE(R125f.w,R125f.w) + PV1fz;
R124f.z = R5f.x;
R124f.z = clamp(R124f.z, 0.0, 1.0);
R124f.w = mul_nonIEEE(R3f.x, R5f.x);
R5f.y = 1.0 / PV1fx;
// 3
R13f.x = -(intBitsToFloat(uf_remappedPS[2].w)) + 0.0;
PV1fy = mul_nonIEEE(R127f.z, R127f.z);
R127f.z = mul_nonIEEE(R127f.y,R127f.y) + PV0fx;
R126f.y = 1.0 / intBitsToFloat(uf_remappedPS[3].w);
// 4
R126f.x = dot(vec4(R126f.z,R125f.w,PV1fy,intBitsToFloat(0x80000000)),vec4(R126f.z,R125f.w,1.0,0.0));
PV0fy = R126f.x;
PV0fz = R126f.x;
PV0fw = R126f.x;
tempResultf = max(0.0, R127f.z);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0f = tempResultf;
// 5
PV1fx = mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].x), PS0f);
R126f.w = sqrt(R127f.z);
// 6
R127f.x = R126f.w + -(intBitsToFloat(uf_remappedPS[4].z));
PV0fw = R126f.w + -(intBitsToFloat(uf_remappedPS[3].z));
PS0f = exp2(PV1fx);
// 7
PV1fx = PV0fw * R126f.y;
PV1fx = clamp(PV1fx, 0.0, 1.0);
PV1fy = mul_nonIEEE(R127f.y, PS0f);
R5f.z = R126f.w + -(intBitsToFloat(uf_remappedPS[5].y));
PV1fw = mul_nonIEEE(R127f.w, PS0f);
PS1f = 1.0 / intBitsToFloat(uf_remappedPS[4].w);
// 8
R11f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].y),PV1fw) + R0f.x;
R12f.y = mul_nonIEEE(PV1fx,intBitsToFloat(uf_remappedPS[6].x)) + 1.0;
R0f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].y),PV1fy) + R0f.y;
R126f.w = R127f.x * PS1f;
R126f.w = clamp(R126f.w, 0.0, 1.0);
R1f.w = sqrt(R125f.y);
// 9
backupReg0f = R126f.z;
backupReg1f = R126f.x;
R126f.x = mul_nonIEEE(R11f.x, intBitsToFloat(uf_remappedPS[7].w));
R11f.y = mul_nonIEEE(R125f.w,-(intBitsToFloat(uf_remappedPS[1].w))) + R0f.z;
R126f.z = mul_nonIEEE(R0f.z, intBitsToFloat(uf_remappedPS[7].w));
R0f.w = mul_nonIEEE(backupReg0f,-(intBitsToFloat(uf_remappedPS[1].w))) + R11f.x;
R3f.w = sqrt(backupReg1f);
// 10
R127f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].x), R0f.w);
R125f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].x), R11f.y);
PV0fz = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].w), R0f.w);
R125f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].w), R11f.y);
R127f.w = mul_nonIEEE(R11f.x, intBitsToFloat(uf_remappedPS[1].x));
// 11
R0f.x = intBitsToFloat(uf_remappedPS[8].w) + PV0fz;
R127f.z = mul_nonIEEE(R0f.z, intBitsToFloat(uf_remappedPS[1].x));
R4f.w = R126f.x + intBitsToFloat(uf_remappedPS[8].w);
tempResultf = max(0.0, R124f.w);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R125f.z = tempResultf;
// 12
R3f.x = intBitsToFloat(uf_remappedPS[7].y) + R127f.x;
R0f.y = intBitsToFloat(uf_remappedPS[7].x) + R125f.w;
R3f.z = intBitsToFloat(uf_remappedPS[7].z) + R125f.y;
R2f.w = intBitsToFloat(uf_remappedPS[7].y) + R127f.w;
R4f.y = intBitsToFloat(uf_remappedPS[7].x) + R126f.z;
// 13
R5f.x = R125f.z * 0.25;
R2f.y = intBitsToFloat(uf_remappedPS[7].z) + R127f.z;
R4f.z = mul_nonIEEE(R126f.w, intBitsToFloat(uf_remappedPS[5].x));
tempResultf = max(0.0, R124f.z);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R13f.y = tempResultf;
R6f.xy = (texture(textureUnitPS2, vec2(R0f.x,R0f.y)).xw);
R0f.xy = (texture(textureUnitPS3, vec2(R0f.x,R0f.y)).xw);
R7f.xy = (texture(textureUnitPS2, vec2(R3f.z,R3f.x)).xw);
R3f.xy = (texture(textureUnitPS3, vec2(R3f.z,R3f.x)).xw);
R9f.xy = (texture(textureUnitPS2, vec2(R4f.w,R4f.y)).xw);
R4f.xy = (texture(textureUnitPS3, vec2(R4f.w,R4f.y)).xw);
R10f.xy = (texture(textureUnitPS2, vec2(R2f.y,R2f.w)).xw);
R8f.xy = (texture(textureUnitPS3, vec2(R2f.y,R2f.w)).xw);
// 0
backupReg0f = R0f.y;
R123f.x = -(intBitsToFloat(uf_remappedPS[9].x)) * 4.0 + R4f.z;
R0f.y = R4f.z + intBitsToFloat(uf_remappedPS[8].z);
PV0fz = -(R6f.x) + R0f.x;
PV0fw = -(R6f.y) + backupReg0f;
R12f.x = exp2(R5f.x);
// 1
R127f.x = mul_nonIEEE(PV0fw,intBitsToFloat(uf_remappedPS[10].x)) + R6f.y;
R123f.y = mul_nonIEEE(PV0fz,intBitsToFloat(uf_remappedPS[10].x)) + R6f.x;
PV1fz = -(R7f.x) + R3f.x;
PV1fw = -(R7f.y) + R3f.y;
R2f.z = intBitsToFloat(uf_remappedPS[8].z) + R123f.x;
// 2
backupReg0f = R123f.y;
R126f.x = mul_nonIEEE(PV1fw,intBitsToFloat(uf_remappedPS[10].x)) + R7f.y;
R123f.y = mul_nonIEEE(PV1fz,intBitsToFloat(uf_remappedPS[10].x)) + R7f.x;
PV0fz = -(R9f.y) + R4f.y;
PV0fw = -(R9f.x) + R4f.x;
R124f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].y), backupReg0f);
// 3
R123f.x = mul_nonIEEE(PV0fw,intBitsToFloat(uf_remappedPS[10].x)) + R9f.x;
PV1fy = -(R10f.y) + R8f.y;
R123f.z = mul_nonIEEE(PV0fz,intBitsToFloat(uf_remappedPS[10].x)) + R9f.y;
PV1fw = -(R10f.x) + R8f.x;
R127f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z), R123f.y);
// 4
backupReg0f = R123f.x;
backupReg1f = R123f.z;
R123f.x = mul_nonIEEE(PV1fw,intBitsToFloat(uf_remappedPS[10].x)) + R10f.x;
R125f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].y), backupReg0f);
R123f.z = mul_nonIEEE(PV1fy,intBitsToFloat(uf_remappedPS[10].x)) + R10f.y;
R126f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].y), R127f.x);
R125f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].y), backupReg1f);
// 5
PV1fx = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z), R123f.x);
PV1fy = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z), R123f.z);
PV1fz = R124f.z + R127f.z;
PV1fw = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z), R126f.x);
R127f.y = R126f.w + R127f.z;
// 6
PV0fx = R126f.w + PV1fw;
PV0fy = R125f.y + PV1fx;
PV0fz = R125f.z + PV1fy;
PV0fw = R5f.y * PV1fz;
PS0f = R124f.z + PV1fw;
PS0f *= 2.0;
// 7
PV1fx = PV0fy * R5f.y;
PV1fy = PV0fw + -(0.5);
PV1fz = PV0fz * R5f.y;
PV1fw = R5f.y * PV0fx;
R122f.x = R127f.y * 6.0 + PS0f;
// 8
PV0fx = PV1fw + -(0.5);
PV0fy = PV1fz + -(0.5);
PV0fz = mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].y), PV1fy);
PV0fw = PV1fx + -(0.5);
PS0f = R122f.x + -(1.0);
// 9
R5f.x = mul_nonIEEE(R12f.y,PV0fz) + R0f.w;
PV1fy = mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].y), PV0fw);
PV1fz = mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].y), PV0fy);
PV1fw = mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].y), PV0fx);
R10f.y = mul_nonIEEE(PS0f,intBitsToFloat(uf_remappedPS[11].x)) + 1.0;
// 10
R0f.x = mul_nonIEEE(R12f.y,PV1fy) + R11f.x;
R5f.y = mul_nonIEEE(R12f.y,PV1fw) + R11f.y;
R0f.z = mul_nonIEEE(R12f.y,PV1fz) + R0f.z;
R0f.w = R10f.y * 0.5 + intBitsToFloat(0x3f19999a);
R4f.z = intBitsToFloat(uf_remappedPS[0].x) + -(R1f.w);
R3f.z = (texture(textureUnitPS0, vec2(R5f.x,R5f.y)).x);
R1f.w = (texture(textureUnitPS1, vec2(R5f.x,R5f.y)).x);
R2f.w = (texture(textureUnitPS0, vec2(R0f.x,R0f.z)).x);
R0f.z = (texture(textureUnitPS1, vec2(R0f.x,R0f.z)).x);
// 0
PV0fx = max(R4f.z, 0.0);
PV0fy = -(R3f.z) + R1f.w;
PV0fz = R0f.w + -(1.0);
PV0fw = -(R2f.w) + R0f.z;
R126f.w = max(R12f.x, 0.0);
// 1
R123f.x = mul_nonIEEE(PV0fy,intBitsToFloat(uf_remappedPS[10].x)) + R3f.z;
R123f.y = mul_nonIEEE(PV0fw,intBitsToFloat(uf_remappedPS[10].x)) + R2f.w;
PV1fz = min(PV0fx, 0.5);
R127f.w = mul_nonIEEE(PV0fz,intBitsToFloat(uf_remappedPS[11].y)) + 1.0;
// 2
PV0fx = intBitsToFloat(uf_remappedPS[9].w) + -(R3f.w);
PV0fx = clamp(PV0fx, 0.0, 1.0);
PV0fy = mul_nonIEEE(PV1fz, PV1fz);
PV0fz = R123f.y + R0f.y;
PV0fw = R123f.x + R2f.z;
R2f.z = min(intBitsToFloat(uf_remappedPS[3].x), R126f.w);
// 3
R125f.x = mul_nonIEEE(PV0fx,PV0fx) + intBitsToFloat(uf_remappedPS[12].x);
R127f.y = mul_nonIEEE(R2f.x, PV0fw);
R127f.y = clamp(R127f.y, 0.0, 1.0);
R3f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[12].w), PV0fy);
R124f.w = mul_nonIEEE(R2f.x, PV0fz);
R124f.w = clamp(R124f.w, 0.0, 1.0);
// 4
PV0fx = R127f.y;
PV0fx = clamp(PV0fx, 0.0, 1.0);
PV0fy = R124f.w;
PV0fy = clamp(PV0fy, 0.0, 1.0);
PV0fz = R124f.w + intBitsToFloat(uf_remappedPS[9].y);
R126f.w = intBitsToFloat(uf_remappedPS[9].z) + R127f.y;
R124f.x = -(R3f.z) * 5.0 + 1.0;
// 5
PV1fx = PV0fy + -(intBitsToFloat(uf_remappedPS[12].z));
PV1fy = mul_nonIEEE(R124f.w, intBitsToFloat(uf_remappedPS[13].x));
PV1fz = -(intBitsToFloat(uf_remappedPS[12].z)) + PV0fx;
R125f.w = -(R127f.y) + PV0fz;
R125f.z = mul_nonIEEE(R124f.w, intBitsToFloat(uf_remappedPS[13].y));
// 6
PV0fx = mul_nonIEEE(R124f.w, intBitsToFloat(uf_remappedPS[13].z));
PV0fy = -(R124f.w) + R126f.w;
R124f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[12].y), PV1fx);
R124f.z = clamp(R124f.z, 0.0, 1.0);
PV0fw = max(PV1fz, 0.0);
R127f.y = mul_nonIEEE(PV1fy, R127f.w);
// 7
R126f.x = mul_nonIEEE(R125f.z, R127f.w);
PV1fy = min(PV0fw, intBitsToFloat(0x3f733333));
R127f.z = mul_nonIEEE(PV0fx, R127f.w);
PV1fw = PV0fy * 9.0;
R125f.y = R125f.w * 10.0;
R125f.y = clamp(R125f.y, 0.0, 1.0);
// 8
R2f.x = PV1fy * intBitsToFloat(0x3e4ccccd) + R124f.z;
PV0fy = mul_nonIEEE(R124f.w, intBitsToFloat(uf_remappedPS[14].x));
R124f.z = mul_nonIEEE(R124f.w, intBitsToFloat(uf_remappedPS[14].z));
PV0fw = mul_nonIEEE(R124f.w, intBitsToFloat(uf_remappedPS[14].y));
R125f.z = mul_nonIEEE(R10f.y, PV1fw);
R125f.z = clamp(R125f.z, 0.0, 1.0);
// 9
R123f.x = mul_nonIEEE(R124f.w,intBitsToFloat(uf_remappedPS[15].y)) + -(R126f.x);
R123f.y = mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[0].y)),R2f.x) + 0.25;
R126f.z = mul_nonIEEE(R125f.y, PV0fy);
R123f.w = mul_nonIEEE(R124f.w,intBitsToFloat(uf_remappedPS[15].x)) + -(R127f.y);
R127f.x = mul_nonIEEE(R125f.y, PV0fw);
// 10
backupReg0f = R124f.z;
backupReg1f = R123f.x;
R123f.x = mul_nonIEEE(R124f.w,intBitsToFloat(uf_remappedPS[15].z)) + -(R127f.z);
PV0fy = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].z), R123f.y);
R124f.z = mul_nonIEEE(R123f.w,R125f.z) + R127f.y;
PV0fw = mul_nonIEEE(R125f.y, backupReg0f);
R124f.w = mul_nonIEEE(backupReg1f,R125f.z) + R126f.x;
// 11
PV1fx = mul_nonIEEE(R125f.x, R127f.x);
R127f.y = mul_nonIEEE(R123f.x,R125f.z) + R127f.z;
PV1fz = mul_nonIEEE(R125f.x, R126f.z);
PV1fw = mul_nonIEEE(R125f.x, PV0fw);
PS1f = max(PV0fy, 0.0);
// 12
R127f.x = min(PS1f, 100.0);
PV0fy = max(R127f.y, PV1fw);
PV0fz = max(R124f.w, PV1fx);
PV0fw = max(R124f.z, PV1fz);
R125f.x = R125f.y * 10.0;
R125f.x = clamp(R125f.x, 0.0, 1.0);
// 13
PV1fx = mul_nonIEEE(R127f.x, intBitsToFloat(uf_remappedPS[16].x));
PV1fy = -(R127f.y) + PV0fy;
PV1fz = -(R124f.w) + PV0fz;
PV1fw = -(R124f.z) + PV0fw;
R126f.x = mul_nonIEEE(R127f.x, intBitsToFloat(uf_remappedPS[16].y));
// 14
backupReg0f = R127f.y;
R123f.x = mul_nonIEEE(PV1fw,R125f.x) + R124f.z;
R127f.y = mul_nonIEEE(PV1fz,R125f.x) + R124f.w;
R124f.z = mul_nonIEEE(PV1fy,R125f.x) + backupReg0f;
PV0fw = mul_nonIEEE(R127f.x, intBitsToFloat(uf_remappedPS[16].z));
PS0f = mul_nonIEEE(R3f.z, PV1fx);
// 15
PV1fx = mul_nonIEEE(R3f.z, PV0fw);
PV1fy = mul_nonIEEE(R3f.z, R126f.x);
R127f.z = PS0f * 55.0 + R123f.x;
PV1fw = max(R124f.x, intBitsToFloat(0x3f4ccccd));
R125f.y = R3f.z * intBitsToFloat(0x3e4ccccd) + R2f.z;
R125f.y = clamp(R125f.y, 0.0, 1.0);
// 16
PV0fx = min(PV1fw, 1.0);
R123f.y = PV1fx * 55.0 + R124f.z;
R123f.z = PV1fy * 55.0 + R127f.y;
PV0fw = mul_nonIEEE(intBitsToFloat(uf_remappedPS[17].y), R13f.y);
PS0f = mul_nonIEEE(R2f.x, R3f.z);
// 17
backupReg0f = R123f.z;
R123f.x = mul_nonIEEE(R127f.z,PV0fx) + -(R1f.x);
R126f.y = PS0f * 6.0 + R2f.x;
R123f.z = mul_nonIEEE(R123f.y,PV0fx) + -(R1f.z);
R123f.w = mul_nonIEEE(backupReg0f,PV0fx) + -(R1f.y);
PS1f = exp2(PV0fw);
// 18
backupReg0f = R125f.y;
R126f.x = mul_nonIEEE(R123f.w,backupReg0f) + R1f.y;
R125f.y = mul_nonIEEE(R123f.x,backupReg0f) + R1f.x;
R127f.z = mul_nonIEEE(R13f.x,PS1f) + intBitsToFloat(uf_remappedPS[2].w);
R124f.w = mul_nonIEEE(R123f.z,backupReg0f) + R1f.z;
PS0f = 1.0 / intBitsToFloat(uf_remappedPS[5].z);
// 19
R123f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].z),intBitsToFloat(uf_remappedPS[2].x)) + -(R125f.y);
R127f.y = R5f.z * PS0f;
R127f.y = clamp(R127f.y, 0.0, 1.0);
R123f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].z),intBitsToFloat(uf_remappedPS[2].y)) + -(R126f.x);
// 20
backupReg0f = R123f.x;
R123f.x = mul_nonIEEE(R123f.w,R127f.z) + R126f.x;
R123f.y = mul_nonIEEE(backupReg0f,R127f.z) + R125f.y;
R123f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].z),intBitsToFloat(uf_remappedPS[2].z)) + -(R124f.w);
// 21
R5f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].y), R123f.y);
R5f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].y), R123f.x);
R123f.w = mul_nonIEEE(R123f.z,R127f.z) + R124f.w;
R5f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].w),R127f.y) + R126f.y;
R5f.w = clamp(R5f.w, 0.0, 1.0);
// 22
R5f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].y), R123f.w);
// export
passPixelColor0 = vec4(R5f.x, R5f.y, R5f.z, R5f.w);
}
