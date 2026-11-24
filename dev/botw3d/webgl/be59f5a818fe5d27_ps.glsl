#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader be59f5a818fe5d27
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[11];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(7, 1, 0) uniform sampler2D textureUnitPS7;
TEXTURE_LAYOUT(9, 1, 1) uniform sampler2DArray textureUnitPS9;
in vec4 passParameterSem0;
in vec4 passParameterSem5;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
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
R1f = passParameterSem5;
R2f = passParameterSem3;
R3f = passParameterSem4;
// 0
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(R2f.x,R2f.y,R2f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = intBitsToFloat(uf_remappedPS[0].z);
// 1
R3f.x = R0f.z;
R3f.y = R0f.w;
R0f.z = roundEven(PS0f);
PV1fw = intBitsToFloat(uf_remappedPS[1].z);
tempResultf = 1.0 / sqrt(PV0fx);
PS1f = tempResultf;
// 2
R6f.x = mul_nonIEEE(R2f.x, PS1f);
R8f.y = mul_nonIEEE(R2f.y, PS1f);
R7f.z = mul_nonIEEE(R2f.z, PS1f);
R2f.w = 0.0;
R3f.z = roundEven(PV1fw);
// 3
tempf.x = dot(vec4(R6f.x,R8f.y,R7f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[2].x),intBitsToFloat(uf_remappedPS[2].y),intBitsToFloat(uf_remappedPS[2].z),0.0));
tempf.x /= 2.0;
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R6f.z = -(R3f.w) + 1.0;
// 4
R5f.x = intBitsToFloat(uf_remappedPS[3].y);
R4f.y = intBitsToFloat(uf_remappedPS[4].y);
R4f.z = intBitsToFloat(uf_remappedPS[3].x);
PV0fw = -(PV1fx) + 0.5;
PV0fw = clamp(PV0fw, 0.0, 1.0);
R2f.y = intBitsToFloat(uf_remappedPS[3].y);
// 5
R4f.x = intBitsToFloat(uf_remappedPS[3].z);
R6f.y = intBitsToFloat(uf_remappedPS[5].x);
R2f.z = intBitsToFloat(uf_remappedPS[5].y);
PV1fw = PV0fw + 6.5;
R7f.y = intBitsToFloat(uf_remappedPS[5].y);
// 6
R2f.x = PV1fw * intBitsToFloat(0x3daaaaab);
R5f.y = intBitsToFloat(uf_remappedPS[4].x);
R5f.z = intBitsToFloat(uf_remappedPS[4].y);
R3f.w = intBitsToFloat(uf_remappedPS[4].z);
R1f.w = 0.0;
R0f.xyz = (texture(textureUnitPS9, vec3(R0f.x,R0f.y,R0f.z)).xyz);
R3f.xyz = (texture(textureUnitPS9, vec3(R3f.x,R3f.y,R3f.z)).xyz);
R9f.xyz = (texture(textureUnitPS7, vec2(R2f.x,R2f.w)).xyz);
// 0
tempf.x = dot(vec4(R1f.x,R1f.y,R1f.z,intBitsToFloat(0x80000000)),vec4(R1f.x,R1f.y,R1f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R122f.x = mul_nonIEEE(-(R1f.z),intBitsToFloat(uf_remappedPS[6].x)) + -(intBitsToFloat(uf_remappedPS[6].y));
R122f.x = clamp(R122f.x, 0.0, 1.0);
// 1
R126f.x = intBitsToFloat(uf_remappedPS[5].z);
PV1fy = -(R0f.y) + R3f.y;
R127f.z = -(R122f.x) + 1.0;
PV1fw = -(R0f.x) + R3f.x;
PS1f = sqrt(PV0fx);
// 2
R127f.x = -(R0f.z) + R3f.z;
PV0fy = mul_nonIEEE(R4f.x, intBitsToFloat(uf_remappedPS[7].z));
R126f.z = mul_nonIEEE(PV1fw,R6f.z) + R0f.x;
R126f.w = mul_nonIEEE(PV1fy,R6f.z) + R0f.y;
PS0f = 1.0 / PS1f;
// 3
PV1fx = mul_nonIEEE(R1f.x, PS0f);
PV1fy = mul_nonIEEE(R1f.y, PS0f);
PV1fz = mul_nonIEEE(R1f.z, PS0f);
R123f.w = mul_nonIEEE(R2f.y,intBitsToFloat(uf_remappedPS[7].y)) + PV0fy;
tempResultf = max(0.0, R127f.z);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R127f.w = tempResultf;
// 4
tempf.x = dot(vec4(R5f.x,R4f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(PV1fx,PV1fy,PV1fz,0.0));
tempf.x = clamp(tempf.x, 0.0, 1.0);
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R125f.x = mul_nonIEEE(R4f.z,intBitsToFloat(uf_remappedPS[7].x)) + R123f.w;
// 5
tempf.x = dot(vec4(R5f.y,R5f.z,R3f.w,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[7].x),intBitsToFloat(uf_remappedPS[7].y),intBitsToFloat(uf_remappedPS[7].z),0.0));
PV1fx = tempf.x;
R127f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
tempResultf = max(0.0, PV0fx);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1f = tempResultf;
// 6
backupReg0f = R126f.z;
PV0fx = mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].z), PS1f);
R126f.y = mul_nonIEEE(R127f.x,R6f.z) + R0f.z;
R126f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].x), R127f.w);
R127f.w = backupReg0f * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8);
R127f.w = clamp(R127f.w, 0.0, 1.0);
R125f.z = R126f.w * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8);
R125f.z = clamp(R125f.z, 0.0, 1.0);
// 7
tempf.x = dot(vec4(R6f.y,R7f.y,R126f.x,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[7].x),intBitsToFloat(uf_remappedPS[7].y),intBitsToFloat(uf_remappedPS[7].z),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R127f.z = exp2(PV0fx);
// 8
R126f.x = dot(vec4(R6f.x,R8f.y,R7f.z,R7f.z),vec4(-(R125f.x),-(R127f.y),-(PV1fx),-(R1f.w)));
R126f.x = clamp(R126f.x, 0.0, 1.0);
PV0fy = R126f.x;
PV0fz = R126f.x;
PV0fw = R126f.x;
R125f.x = exp2(R126f.z);
// 9
backupReg0f = R127f.w;
R123f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].x),R126f.x) + R9f.x;
R123f.y = R126f.y * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8);
R123f.y = clamp(R123f.y, 0.0, 1.0);
R123f.z = mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[8].w)),R127f.z) + 1.0;
R127f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].y),R126f.x) + R9f.y;
R122f.x = backupReg0f * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e);
// 10
backupReg0f = R123f.y;
backupReg1f = R123f.z;
backupReg2f = R123f.x;
R123f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].z),R126f.x) + R9f.z;
R123f.y = R125f.z * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e);
R123f.z = backupReg0f * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e);
R123f.w = mul_nonIEEE(-(R125f.x),backupReg1f) + backupReg1f;
R126f.y = mul_nonIEEE(backupReg2f, R122f.x);
// 11
PV1fx = mul_nonIEEE(R127f.w, R123f.y);
R127f.y = mul_nonIEEE(R123f.w, intBitsToFloat(uf_remappedPS[10].w));
PV1fz = mul_nonIEEE(R123f.x, R123f.z);
R9f.w = 1.0;
// 12
R123f.x = mul_nonIEEE(-(R127f.y),PV1fx) + PV1fx;
R123f.y = mul_nonIEEE(-(R127f.y),R126f.y) + R126f.y;
R123f.w = mul_nonIEEE(-(R127f.y),PV1fz) + PV1fz;
// 13
R9f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].x),R127f.y) + R123f.y;
R9f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].y),R127f.y) + R123f.x;
R9f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].z),R127f.y) + R123f.w;
// export
passPixelColor0 = vec4(R9f.x, R9f.y, R9f.z, R9f.w);
}
