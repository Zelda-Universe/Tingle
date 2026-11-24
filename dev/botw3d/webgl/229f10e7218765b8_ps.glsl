#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 229f10e7218765b8
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[13];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(3, 1, 0) uniform sampler2DArray textureUnitPS3;
TEXTURE_LAYOUT(4, 1, 1) uniform sampler2DArray textureUnitPS4;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem2;
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
// 0
R5f.x = R2f.z;
R5f.y = R2f.w;
PV0fz = intBitsToFloat(uf_remappedPS[0].z);
PV0fw = intBitsToFloat(uf_remappedPS[1].z);
R6f.x = R0f.z;
// 1
R0f.x = intBitsToFloat(uf_remappedPS[2].z);
R6f.y = R0f.w;
R5f.z = roundEven(PV0fw);
R6f.w = roundEven(PV0fz);
R0f.z = intBitsToFloat(uf_remappedPS[3].z);
R5f.xy = (texture(textureUnitPS4, vec3(R5f.x,R5f.y,R5f.z)).xy);
R6f.xy = (texture(textureUnitPS4, vec3(R6f.x,R6f.y,R6f.w)).xy);
// 0
backupReg0f = R0f.x;
R0f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].x),R5f.x) + R1f.z;
R0f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].y),R5f.y) + R1f.w;
R2f.z = roundEven(R0f.z);
PV0fw = intBitsToFloat(uf_remappedPS[4].z);
R1f.z = roundEven(backupReg0f);
// 1
backupReg0f = R6f.x;
R6f.x = R6f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R5f.y = intBitsToFloat(uf_remappedPS[5].x) + 1.0;
R5f.y = clamp(R5f.y, 0.0, 1.0);
R0f.z = roundEven(PV0fw);
R6f.w = backupReg0f * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R6f.y = intBitsToFloat(uf_remappedPS[5].y) + 1.0;
R6f.y = clamp(R6f.y, 0.0, 1.0);
R1f.xy = (texture(textureUnitPS4, vec3(R1f.x,R1f.y,R1f.z)).xy);
R2f.xy = (texture(textureUnitPS4, vec3(R2f.x,R2f.y,R2f.z)).xy);
R7f.xyz = (texture(textureUnitPS3, vec3(R0f.x,R0f.y,R0f.z)).xyz);
// 0
PV0fx = mul_nonIEEE(R6f.w, R6f.w);
R123f.y = R1f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R124f.z = R2f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R123f.w = R1f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R124f.x = R2f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
// 1
R125f.x = R6f.w + R123f.y;
R125f.y = R6f.x + R123f.w;
R0f.z = intBitsToFloat(uf_remappedPS[6].x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R123f.w = mul_nonIEEE(R6f.x,R6f.x) + PV0fx;
R123f.w = clamp(R123f.w, 0.0, 1.0);
PS1f = intBitsToFloat(uf_remappedPS[5].z) + 1.0;
PS1f = clamp(PS1f, 0.0, 1.0);
// 2
R127f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].x),-(PS1f)) + intBitsToFloat(uf_remappedPS[7].x);
R126f.y = -(R6f.y) + 1.0;
PV0fz = -(R123f.w) + 1.0;
R123f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].z),R5f.y) + intBitsToFloat(uf_remappedPS[8].w);
tempResultf = max(0.0, R5f.y);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R125f.z = tempResultf;
// 3
R126f.x = mul_nonIEEE(R3f.y, R4f.z);
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].x), R123f.w);
R127f.y = clamp(R127f.y, 0.0, 1.0);
R127f.z = mul_nonIEEE(R3f.z, R4f.x);
R127f.w = mul_nonIEEE(R3f.x, R4f.y);
R126f.z = sqrt(PV0fz);
// 4
tempf.x = dot(vec4(R125f.x,R125f.y,R126f.z,intBitsToFloat(0x80000000)),vec4(R125f.x,R125f.y,R126f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R2f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].y),R127f.y) + R127f.x;
R2f.z = clamp(R2f.z, 0.0, 1.0);
// 5
backupReg0f = R126f.x;
backupReg1f = R127f.z;
R126f.x = -(intBitsToFloat(uf_remappedPS[7].y)) + intBitsToFloat(uf_remappedPS[8].x);
R127f.y = R127f.y + R126f.y;
R127f.z = mul_nonIEEE(-(R4f.y),R3f.z) + backupReg0f;
R125f.w = mul_nonIEEE(-(R4f.z),R3f.x) + backupReg1f;
tempResultf = 1.0 / sqrt(PV0fx);
PS1f = tempResultf;
// 6
backupReg0f = R125f.y;
PV0fx = mul_nonIEEE(R125f.x, PS1f);
R125f.y = mul_nonIEEE(R7f.x,R127f.y) + R2f.z;
R125f.y = clamp(R125f.y, 0.0, 1.0);
PV0fz = mul_nonIEEE(backupReg0f, PS1f);
PV0fw = mul_nonIEEE(R126f.z, PS1f);
R126f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].w), R125f.z);
// 7
backupReg0f = R124f.x;
R124f.x = mul_nonIEEE(R124f.z,R0f.z) + PV0fx;
R126f.y = mul_nonIEEE(backupReg0f,R0f.z) + PV0fz;
R124f.z = PV0fw;
R127f.w = mul_nonIEEE(-(R4f.x),R3f.y) + R127f.w;
R0f.z = intBitsToFloat(uf_remappedPS[5].w) + 1.0;
R0f.z = clamp(R0f.z, 0.0, 1.0);
// 8
tempf.x = dot(vec4(R124f.x,R126f.y,R124f.z,intBitsToFloat(0x80000000)),vec4(R124f.x,R126f.y,R124f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R126f.x = mul_nonIEEE(R126f.x,R125f.y) + intBitsToFloat(uf_remappedPS[7].y);
// 9
R125f.x = intBitsToFloat(0x3db0b0b1);
R125f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].z), R125f.y);
R123f.z = mul_nonIEEE(R7f.y,R127f.y) + R2f.z;
R123f.z = clamp(R123f.z, 0.0, 1.0);
R124f.w = mul_nonIEEE(R7f.z,R127f.y) + R2f.z;
R124f.w = clamp(R124f.w, 0.0, 1.0);
tempResultf = 1.0 / sqrt(PV0fx);
R127f.y = tempResultf;
// 10
backupReg0f = R126f.x;
backupReg1f = R126f.y;
R126f.x = mul_nonIEEE(R124f.x, R127f.y);
R126f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].z), R123f.z);
R126f.z = mul_nonIEEE(R0f.z, backupReg0f);
R126f.z = clamp(R126f.z, 0.0, 1.0);
PV0fw = mul_nonIEEE(backupReg1f, R127f.y);
PS0f = exp2(R126f.w);
PS0f = clamp(PS0f, 0.0, 1.0);
// 11
backupReg0f = R124f.z;
R124f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].x), PS0f);
PV1fy = mul_nonIEEE(R4f.w, PV0fw);
R124f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].y), PS0f);
R126f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].z), PS0f);
R125f.z = mul_nonIEEE(backupReg0f, R127f.y);
// 12
PV0fx = mul_nonIEEE(R127f.z, PV1fy);
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].z), R124f.w);
PV0fz = mul_nonIEEE(R127f.w, PV1fy);
PV0fw = mul_nonIEEE(R125f.w, PV1fy);
R127f.w = intBitsToFloat(uf_remappedPS[11].x) + -(R124f.x);
// 13
backupReg0f = R126f.x;
R126f.x = mul_nonIEEE(R4f.y,backupReg0f) + PV0fw;
R123f.y = mul_nonIEEE(R4f.x,backupReg0f) + PV0fx;
PV1fz = intBitsToFloat(uf_remappedPS[11].y) + -(R124f.z);
R125f.w = mul_nonIEEE(R4f.z,backupReg0f) + PV0fz;
PS1f = intBitsToFloat(uf_remappedPS[11].z) + -(R126f.w);
// 14
backupReg0f = R124f.x;
R124f.x = mul_nonIEEE(PS1f,R127f.y) + R126f.w;
PV0fy = R126f.z * 63.75;
R123f.z = mul_nonIEEE(R127f.w,R125f.y) + backupReg0f;
R127f.w = mul_nonIEEE(PV1fz,R126f.y) + R124f.z;
R126f.z = (mul_nonIEEE(R3f.x,R125f.z) + R123f.y)/2.0;
// 15
backupReg0f = R126f.x;
R126f.x = (mul_nonIEEE(R3f.z,R125f.z) + R125f.w)/2.0;
R127f.y = (mul_nonIEEE(R3f.y,R125f.z) + backupReg0f)/2.0;
PV1fz = intBitsToFloat(uf_remappedPS[12].z);
R125f.w = floor(PV0fy);
R125f.w *= 4.0;
R3f.x = mul_nonIEEE(R0f.z, R123f.z);
// 16
R4f.x = R125f.x;
R3f.y = mul_nonIEEE(R0f.z, R127f.w);
R3f.z = mul_nonIEEE(R0f.z, R124f.x);
R4f.w = 1.0;
R4f.y = PV1fz;
// 17
R0f.x = R126f.z + 0.5;
R0f.y = R127f.y + 0.5;
R0f.z = R126f.x + 0.5;
R3f.w = 0.0;
R0f.w = R125f.w * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081);
// 18
R2f.x = R0f.x;
R2f.y = R0f.y;
R2f.z = R0f.z;
R2f.w = R0f.w;
// 19
R1f.x = R3f.x;
R1f.y = R3f.y;
R1f.z = R3f.z;
R1f.w = R3f.w;
// 20
R0f.x = R4f.x;
R0f.y = R4f.y;
R0f.z = R4f.z;
R0f.w = R4f.w;
// export
passPixelColor0 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
passPixelColor1 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
passPixelColor3 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
}
