#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 0d293e24e5be8256
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[9];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(7, 1, 0) uniform sampler2D textureUnitPS7;
TEXTURE_LAYOUT(8, 1, 1) uniform sampler2D textureUnitPS8;
TEXTURE_LAYOUT(10, 1, 2) uniform sampler2D textureUnitPS10;
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
vec4 R10f = vec4(0.0);
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
R1f = passParameterSem5;
R2f = passParameterSem3;
R3f = passParameterSem4;
R8f.xyz = (texture(textureUnitPS8, vec2(R0f.x,R0f.y)).xyz);
R4f.xyz = (texture(textureUnitPS10, vec2(R0f.x,R0f.y)).xyz);
// 0
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(R2f.x,R2f.y,R2f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R0f.y = 0.0;
// 1
tempf.x = dot(vec4(R1f.x,R1f.y,R1f.z,intBitsToFloat(0x80000000)),vec4(R1f.x,R1f.y,R1f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
tempResultf = 1.0 / sqrt(PV0fx);
PS1f = tempResultf;
// 2
R3f.x = mul_nonIEEE(R2f.x, PS1f);
R9f.y = mul_nonIEEE(R2f.y, PS1f);
R3f.z = mul_nonIEEE(R2f.z, PS1f);
R0f.w = intBitsToFloat(uf_remappedPS[0].y);
PS0f = sqrt(PV1fx);
// 3
tempf.x = dot(vec4(R3f.x,R9f.y,R3f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[1].x),intBitsToFloat(uf_remappedPS[1].y),intBitsToFloat(uf_remappedPS[1].z),0.0));
tempf.x /= 2.0;
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R127f.w = 1.0 / PS0f;
// 4
R2f.x = mul_nonIEEE(R1f.x, R127f.w);
R2f.y = intBitsToFloat(uf_remappedPS[2].y);
R2f.z = intBitsToFloat(uf_remappedPS[3].y);
PV0fw = -(PV1fx) + 0.5;
PV0fw = clamp(PV0fw, 0.0, 1.0);
R3f.y = mul_nonIEEE(R1f.y, R127f.w);
// 5
R123f.x = mul_nonIEEE(-(R1f.z),intBitsToFloat(uf_remappedPS[4].x)) + -(intBitsToFloat(uf_remappedPS[4].y));
R123f.x = clamp(R123f.x, 0.0, 1.0);
R1f.y = intBitsToFloat(uf_remappedPS[0].x);
R1f.z = mul_nonIEEE(R1f.z, R127f.w);
PV1fw = PV0fw + 6.5;
R5f.y = intBitsToFloat(uf_remappedPS[0].y);
// 6
R0f.x = PV1fw * intBitsToFloat(0x3daaaaab);
R6f.y = intBitsToFloat(uf_remappedPS[0].z);
R0f.z = -(R123f.x) + 1.0;
R1f.w = intBitsToFloat(uf_remappedPS[2].x);
R7f.y = intBitsToFloat(uf_remappedPS[2].y);
R10f.xyz = (texture(textureUnitPS7, vec2(R0f.x,R0f.y)).xyz);
// 0
tempf.x = dot(vec4(R0f.w,R2f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(R2f.x,R3f.y,R1f.z,0.0));
tempf.x = clamp(tempf.x, 0.0, 1.0);
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R127f.z = intBitsToFloat(uf_remappedPS[2].z);
// 1
R127f.x = intBitsToFloat(uf_remappedPS[3].x);
R126f.y = intBitsToFloat(uf_remappedPS[3].y);
R126f.z = intBitsToFloat(uf_remappedPS[3].z);
R127f.w = -(R3f.w) + 1.0;
tempResultf = max(0.0, PV0fx);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1f = tempResultf;
// 2
R126f.x = -(R8f.z) + R4f.z;
R127f.y = -(R8f.y) + R4f.y;
R125f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].z), PS1f);
PV0fw = -(R8f.x) + R4f.x;
tempResultf = max(0.0, R0f.z);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R126f.w = tempResultf;
// 3
R125f.x = dot(vec4(R1f.y,R5f.y,R6f.y,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[6].x),intBitsToFloat(uf_remappedPS[6].y),intBitsToFloat(uf_remappedPS[6].z),0.0));
PV1fy = R125f.x;
PV1fz = R125f.x;
PV1fw = R125f.x;
R124f.z = mul_nonIEEE(PV0fw,R127f.w) + R8f.x;
// 4
backupReg0f = R127f.y;
tempf.x = dot(vec4(R1f.w,R7f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[6].x),intBitsToFloat(uf_remappedPS[6].y),intBitsToFloat(uf_remappedPS[6].z),0.0));
PV0fx = tempf.x;
R127f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R125f.w = mul_nonIEEE(backupReg0f,R127f.w) + R8f.y;
// 5
tempf.x = dot(vec4(R127f.x,R126f.y,R126f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[6].x),intBitsToFloat(uf_remappedPS[6].y),intBitsToFloat(uf_remappedPS[6].z),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
R126f.z = tempf.x;
PV1fw = tempf.x;
R126f.y = mul_nonIEEE(R126f.x,R127f.w) + R8f.z;
// 6
R127f.x = R124f.z * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8);
R127f.x = clamp(R127f.x, 0.0, 1.0);
PV0fy = mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].x), R126f.w);
R124f.z = R125f.w * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8);
R124f.z = clamp(R124f.z, 0.0, 1.0);
PV0fw = 0.0;
R125f.z = exp2(R125f.z);
// 7
R126f.x = dot(vec4(R3f.x,R9f.y,R3f.z,R3f.z),vec4(-(R125f.x),-(R127f.y),-(R126f.z),-(PV0fw)));
R126f.x = clamp(R126f.x, 0.0, 1.0);
PV1fy = R126f.x;
PV1fz = R126f.x;
PV1fw = R126f.x;
R125f.x = exp2(PV0fy);
// 8
R123f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].x),R126f.x) + R10f.x;
R123f.y = R126f.y * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8);
R123f.y = clamp(R123f.y, 0.0, 1.0);
R123f.z = mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[5].w)),R125f.z) + 1.0;
R126f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].y),R126f.x) + R10f.y;
R122f.x = R127f.x * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e);
// 9
backupReg0f = R123f.y;
backupReg1f = R123f.z;
backupReg2f = R123f.x;
R123f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].z),R126f.x) + R10f.z;
R123f.y = R124f.z * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e);
R123f.z = backupReg0f * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e);
R123f.w = mul_nonIEEE(-(R125f.x),backupReg1f) + backupReg1f;
R126f.y = mul_nonIEEE(backupReg2f, R122f.x);
// 10
PV0fx = mul_nonIEEE(R126f.w, R123f.y);
R127f.y = mul_nonIEEE(R123f.w, intBitsToFloat(uf_remappedPS[8].w));
PV0fz = mul_nonIEEE(R123f.x, R123f.z);
R10f.w = 1.0;
// 11
R123f.x = mul_nonIEEE(-(R127f.y),PV0fx) + PV0fx;
R123f.y = mul_nonIEEE(-(R127f.y),R126f.y) + R126f.y;
R123f.w = mul_nonIEEE(-(R127f.y),PV0fz) + PV0fz;
// 12
R10f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].x),R127f.y) + R123f.y;
R10f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].y),R127f.y) + R123f.x;
R10f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].z),R127f.y) + R123f.w;
// export
passPixelColor0 = vec4(R10f.x, R10f.y, R10f.z, R10f.w);
}
