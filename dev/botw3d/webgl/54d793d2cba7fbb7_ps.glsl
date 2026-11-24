#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 54d793d2cba7fbb7
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[18];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
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
PV0fx = R0f.x + -(R4f.z);
R125f.y = R0f.x + -(R4f.x);
R126f.z = R0f.y + -(R4f.y);
PV0fw = R0f.y + -(R4f.w);
PS0f = 1.0 / intBitsToFloat(uf_remappedPS[0].w);
// 1
R127f.x = PV0fw * PS0f;
R127f.y = PV0fx * PS0f;
PV1fz = mul_nonIEEE(R125f.y, R125f.y);
PV1fw = intBitsToFloat(uf_remappedPS[1].y) + intBitsToFloat(uf_remappedPS[1].z);
R127f.z = 0.0;
// 2
R124f.x = mul_nonIEEE(R126f.z,R126f.z) + PV1fz;
R124f.y = mul_nonIEEE(R3f.x, R5f.x);
R125f.z = R5f.x;
R125f.z = clamp(R125f.z, 0.0, 1.0);
PV0fw = mul_nonIEEE(R127f.y, R127f.y);
R2f.z = 1.0 / PV1fw;
// 3
R9f.x = -(intBitsToFloat(uf_remappedPS[2].w)) + 0.0;
PV1fy = mul_nonIEEE(R127f.z, R127f.z);
R127f.z = mul_nonIEEE(R127f.x,R127f.x) + PV0fw;
R126f.x = 1.0 / intBitsToFloat(uf_remappedPS[3].w);
// 4
R3f.x = dot(vec4(R125f.y,R126f.z,PV1fy,intBitsToFloat(0x80000000)),vec4(R125f.y,R126f.z,1.0,0.0));
PV0fy = R3f.x;
PV0fz = R3f.x;
PV0fw = R3f.x;
tempResultf = max(0.0, R127f.z);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0f = tempResultf;
// 5
PV1fw = mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].x), PS0f);
R126f.y = sqrt(R127f.z);
// 6
R125f.x = R126f.y + -(intBitsToFloat(uf_remappedPS[4].z));
PV0fy = R126f.y + -(intBitsToFloat(uf_remappedPS[3].z));
PS0f = exp2(PV1fw);
// 7
PV1fx = mul_nonIEEE(R127f.x, PS0f);
PV1fy = mul_nonIEEE(R127f.y, PS0f);
R6f.z = R126f.y + -(intBitsToFloat(uf_remappedPS[5].y));
PV1fw = PV0fy * R126f.x;
PV1fw = clamp(PV1fw, 0.0, 1.0);
PS1f = 1.0 / intBitsToFloat(uf_remappedPS[4].w);
// 8
R7f.x = mul_nonIEEE(PV1fw,intBitsToFloat(uf_remappedPS[6].x)) + 1.0;
R127f.y = R125f.x * PS1f;
R127f.y = clamp(R127f.y, 0.0, 1.0);
R5f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].y),PV1fx) + R0f.y;
R0f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].y),PV1fy) + R0f.x;
R1f.w = sqrt(R124f.x);
// 9
R6f.x = mul_nonIEEE(R126f.z,-(intBitsToFloat(uf_remappedPS[1].w))) + R5f.z;
R2f.y = mul_nonIEEE(R125f.y,-(intBitsToFloat(uf_remappedPS[1].w))) + R0f.w;
R126f.z = mul_nonIEEE(R0f.w, intBitsToFloat(uf_remappedPS[7].w));
R126f.w = mul_nonIEEE(R5f.z, intBitsToFloat(uf_remappedPS[7].w));
R2f.w = sqrt(R3f.x);
// 10
R125f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].x), R2f.y);
R125f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].x), R6f.x);
PV0fz = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].w), R2f.y);
R127f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].w), R6f.x);
R127f.z = mul_nonIEEE(R0f.w, intBitsToFloat(uf_remappedPS[1].x));
// 11
R3f.x = intBitsToFloat(uf_remappedPS[8].w) + PV0fz;
R4f.z = R126f.z + intBitsToFloat(uf_remappedPS[8].w);
R125f.w = mul_nonIEEE(R5f.z, intBitsToFloat(uf_remappedPS[1].x));
tempResultf = max(0.0, R124f.y);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R126f.z = tempResultf;
// 12
R0f.x = intBitsToFloat(uf_remappedPS[7].y) + R125f.x;
R3f.y = intBitsToFloat(uf_remappedPS[7].x) + R127f.w;
R0f.z = intBitsToFloat(uf_remappedPS[7].z) + R125f.y;
R4f.w = intBitsToFloat(uf_remappedPS[7].x) + R126f.w;
R5f.x = intBitsToFloat(uf_remappedPS[7].y) + R127f.z;
// 13
R8f.x = R126f.z * 0.25;
R5f.y = intBitsToFloat(uf_remappedPS[7].z) + R125f.w;
R3f.z = mul_nonIEEE(R127f.y, intBitsToFloat(uf_remappedPS[5].x));
tempResultf = max(0.0, R125f.z);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R8f.y = tempResultf;
R3f.xy = (texture(textureUnitPS1, vec2(R3f.x,R3f.y)).xw);
R0f.xy = (texture(textureUnitPS1, vec2(R0f.z,R0f.x)).xw);
R4f.xy = (texture(textureUnitPS1, vec2(R4f.z,R4f.w)).xw);
R5f.xy = (texture(textureUnitPS1, vec2(R5f.y,R5f.x)).xw);
// 0
R124f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z), R0f.x);
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].y), R3f.y);
R126f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].y), R3f.x);
R125f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z), R0f.y);
R125f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].y), R4f.x);
// 1
PV1fx = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z), R5f.y);
PV1fy = R126f.z + R124f.x;
PV1fz = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].y), R4f.y);
PV1fw = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z), R5f.x);
PS1f = R127f.y + R125f.w;
// 2
PV0fx = PV1fz + PV1fx;
PV0fy = R125f.x + PV1fw;
PV0fz = R2f.z * PV1fy;
PV0fw = R2f.z * PS1f;
R122f.x = -(intBitsToFloat(uf_remappedPS[9].x)) * 4.0 + R3f.z;
// 3
PV1fx = PV0fx * R2f.z;
PV1fy = PV0fy * R2f.z;
PV1fz = PV0fz + -(0.5);
PV1fw = PV0fw + -(0.5);
R2f.z = intBitsToFloat(uf_remappedPS[8].z) + R122f.x;
// 4
PV0fx = mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].y), PV1fz);
PV0fy = mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].y), PV1fw);
PV0fz = PV1fx + -(0.5);
PV0fw = PV1fy + -(0.5);
R4f.w = R3f.z + intBitsToFloat(uf_remappedPS[8].z);
// 5
backupReg0f = R6f.x;
R6f.x = mul_nonIEEE(R7f.x,PV0fx) + R2f.y;
R6f.y = mul_nonIEEE(R7f.x,PV0fy) + backupReg0f;
PV1fz = mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].y), PV0fw);
PV1fw = mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].y), PV0fz);
R2f.y = R127f.y + R124f.x;
// 6
backupReg0f = R7f.x;
R7f.x = mul_nonIEEE(backupReg0f,PV1fz) + R0f.w;
R7f.y = mul_nonIEEE(backupReg0f,PV1fw) + R5f.z;
R3f.z = R126f.z + R125f.w;
R3f.z *= 2.0;
R1f.w = intBitsToFloat(uf_remappedPS[0].x) + -(R1f.w);
R8f.x = exp2(R8f.x);
R5f.z = (texture(textureUnitPS0, vec2(R6f.x,R6f.y)).x);
R0f.w = (texture(textureUnitPS0, vec2(R7f.x,R7f.y)).x);
// 0
R123f.x = R2f.y * 6.0 + R3f.z;
PV0fy = intBitsToFloat(uf_remappedPS[9].w) + -(R2f.w);
PV0fy = clamp(PV0fy, 0.0, 1.0);
PV0fz = R0f.w + R4f.w;
PV0fw = R5f.z + R2f.z;
R127f.w = max(R8f.x, 0.0);
// 1
R127f.x = mul_nonIEEE(R2f.x, PV0fz);
R127f.x = clamp(R127f.x, 0.0, 1.0);
R127f.y = mul_nonIEEE(R2f.x, PV0fw);
R127f.y = clamp(R127f.y, 0.0, 1.0);
PV1fz = max(R1f.w, 0.0);
PV1fw = R123f.x + -(1.0);
R126f.y = mul_nonIEEE(PV0fy,PV0fy) + intBitsToFloat(uf_remappedPS[10].x);
// 2
PV0fx = R127f.y;
PV0fx = clamp(PV0fx, 0.0, 1.0);
PV0fy = R127f.x;
PV0fy = clamp(PV0fy, 0.0, 1.0);
R125f.z = mul_nonIEEE(PV1fw,intBitsToFloat(uf_remappedPS[11].x)) + 1.0;
PV0fw = intBitsToFloat(uf_remappedPS[9].z) + R127f.y;
R126f.x = min(PV1fz, 0.5);
// 3
R123f.x = R125f.z * 0.5 + intBitsToFloat(0x3f19999a);
PV1fy = R127f.x + intBitsToFloat(uf_remappedPS[9].y);
PV1fz = -(intBitsToFloat(uf_remappedPS[10].z)) + PV0fx;
PV1fw = PV0fy + -(intBitsToFloat(uf_remappedPS[10].z));
R125f.y = -(R127f.x) + PV0fw;
// 4
R124f.x = R123f.x + -(1.0);
PV0fy = -(R127f.y) + PV1fy;
R126f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].y), PV1fw);
R126f.z = clamp(R126f.z, 0.0, 1.0);
PV0fw = max(PV1fz, 0.0);
R125f.x = mul_nonIEEE(R127f.x, intBitsToFloat(uf_remappedPS[12].x));
// 5
PV1fx = R125f.y * 9.0;
PV1fy = min(PV0fw, intBitsToFloat(0x3f733333));
R127f.z = mul_nonIEEE(R127f.x, intBitsToFloat(uf_remappedPS[12].y));
R125f.w = mul_nonIEEE(R127f.x, intBitsToFloat(uf_remappedPS[12].z));
R2f.y = PV0fy * 10.0;
R2f.y = clamp(R2f.y, 0.0, 1.0);
// 6
backupReg0f = R124f.x;
R124f.x = PV1fy * intBitsToFloat(0x3e4ccccd) + R126f.z;
R125f.y = mul_nonIEEE(R127f.x, intBitsToFloat(uf_remappedPS[13].x));
R126f.z = mul_nonIEEE(R127f.x, intBitsToFloat(uf_remappedPS[13].y));
R123f.w = mul_nonIEEE(backupReg0f,intBitsToFloat(uf_remappedPS[11].y)) + 1.0;
R125f.z = mul_nonIEEE(R125f.z, PV1fx);
R125f.z = clamp(R125f.z, 0.0, 1.0);
// 7
backupReg0f = R125f.x;
R125f.x = mul_nonIEEE(R127f.z, R123f.w);
R124f.y = mul_nonIEEE(backupReg0f, R123f.w);
R127f.z = mul_nonIEEE(R125f.w, R123f.w);
R125f.w = mul_nonIEEE(R127f.x, intBitsToFloat(uf_remappedPS[13].z));
R127f.y = mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[0].y)),R124f.x) + 0.25;
// 8
backupReg0f = R126f.z;
R123f.x = mul_nonIEEE(R127f.x,intBitsToFloat(uf_remappedPS[14].z)) + -(R127f.z);
R123f.y = mul_nonIEEE(R127f.x,intBitsToFloat(uf_remappedPS[14].y)) + -(R125f.x);
R126f.z = mul_nonIEEE(R2f.y, R125f.y);
R123f.w = mul_nonIEEE(R127f.x,intBitsToFloat(uf_remappedPS[14].x)) + -(R124f.y);
R127f.x = mul_nonIEEE(R2f.y, backupReg0f);
// 9
backupReg0f = R127f.z;
PV1fx = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].z), R127f.y);
R127f.y = mul_nonIEEE(R123f.y,R125f.z) + R125f.x;
R127f.z = mul_nonIEEE(R123f.w,R125f.z) + R124f.y;
PV1fw = mul_nonIEEE(R2f.y, R125f.w);
R124f.y = mul_nonIEEE(R123f.x,R125f.z) + backupReg0f;
// 10
PV0fx = mul_nonIEEE(R126f.y, PV1fw);
PV0fy = mul_nonIEEE(R126f.y, R127f.x);
PV0fz = mul_nonIEEE(R126f.y, R126f.z);
PV0fw = mul_nonIEEE(R126f.x, R126f.x);
PS0f = max(PV1fx, 0.0);
// 11
R126f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].w), PV0fw);
PV1fy = max(R124f.y, PV0fx);
PV1fz = max(R127f.y, PV0fy);
PV1fw = max(R127f.z, PV0fz);
R126f.z = min(PS0f, 100.0);
// 12
R127f.x = R2f.y * 10.0;
R127f.x = clamp(R127f.x, 0.0, 1.0);
R126f.y = -(R124f.y) + PV1fy;
PV0fz = -(R127f.y) + PV1fz;
PV0fw = -(R127f.z) + PV1fw;
R125f.y = mul_nonIEEE(R126f.z, intBitsToFloat(uf_remappedPS[15].x));
// 13
PV1fx = mul_nonIEEE(R126f.z, intBitsToFloat(uf_remappedPS[15].y));
R123f.y = -(R126f.x) * 5.0 + 1.0;
R127f.z = mul_nonIEEE(PV0fw,R127f.x) + R127f.z;
PV1fw = mul_nonIEEE(R126f.z, intBitsToFloat(uf_remappedPS[15].z));
R125f.w = mul_nonIEEE(PV0fz,R127f.x) + R127f.y;
// 14
PV0fx = mul_nonIEEE(R126f.x, R125f.y);
PV0fy = mul_nonIEEE(R126f.x, PV1fx);
R123f.z = mul_nonIEEE(R126f.y,R127f.x) + R124f.y;
PV0fw = mul_nonIEEE(R126f.x, PV1fw);
PS0f = max(R123f.y, intBitsToFloat(0x3f4ccccd));
// 15
PV1fx = min(PS0f, 1.0);
R123f.y = PV0fw * 55.0 + R123f.z;
R123f.z = PV0fy * 55.0 + R125f.w;
R123f.w = PV0fx * 55.0 + R127f.z;
PS1f = min(intBitsToFloat(uf_remappedPS[3].x), R127f.w);
// 16
backupReg0f = R123f.y;
backupReg1f = R123f.z;
R123f.x = mul_nonIEEE(R123f.w,PV1fx) + -(R1f.x);
R123f.y = R126f.x * intBitsToFloat(0x3e4ccccd) + PS1f;
R123f.y = clamp(R123f.y, 0.0, 1.0);
R123f.z = mul_nonIEEE(backupReg0f,PV1fx) + -(R1f.z);
R123f.w = mul_nonIEEE(backupReg1f,PV1fx) + -(R1f.y);
PS0f = mul_nonIEEE(intBitsToFloat(uf_remappedPS[16].y), R8f.y);
// 17
backupReg0f = R126f.x;
R126f.x = mul_nonIEEE(R123f.w,R123f.y) + R1f.y;
R126f.y = mul_nonIEEE(R123f.x,R123f.y) + R1f.x;
PV1fz = mul_nonIEEE(R124f.x, backupReg0f);
R127f.w = mul_nonIEEE(R123f.z,R123f.y) + R1f.z;
PS1f = exp2(PS0f);
// 18
R124f.x = PV1fz * 6.0 + R124f.x;
R125f.y = mul_nonIEEE(R9f.x,PS1f) + intBitsToFloat(uf_remappedPS[2].w);
R123f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].z),intBitsToFloat(uf_remappedPS[17].z)) + -(R127f.w);
// 19
R123f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].x),intBitsToFloat(uf_remappedPS[17].z)) + -(R126f.y);
R123f.y = mul_nonIEEE(R123f.z,R125f.y) + R127f.w;
R123f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].y),intBitsToFloat(uf_remappedPS[17].z)) + -(R126f.x);
// 20
backupReg0f = R123f.x;
backupReg1f = R123f.y;
R123f.x = mul_nonIEEE(R123f.w,R125f.y) + R126f.x;
R123f.y = mul_nonIEEE(backupReg0f,R125f.y) + R126f.y;
R9f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[17].y), backupReg1f);
PS0f = 1.0 / intBitsToFloat(uf_remappedPS[5].z);
// 21
PV1fx = R6f.z * PS0f;
PV1fx = clamp(PV1fx, 0.0, 1.0);
R9f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[17].y), R123f.x);
R9f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[17].y), R123f.y);
// 22
R9f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].w),PV1fx) + R124f.x;
R9f.w = clamp(R9f.w, 0.0, 1.0);
// export
passPixelColor0 = vec4(R9f.x, R9f.y, R9f.z, R9f.w);
}
