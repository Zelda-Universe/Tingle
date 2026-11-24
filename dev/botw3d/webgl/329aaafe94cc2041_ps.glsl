#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 329aaafe94cc2041
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[10];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(7, 1, 0) uniform sampler2D textureUnitPS7;
TEXTURE_LAYOUT(8, 1, 1) uniform sampler2D textureUnitPS8;
TEXTURE_LAYOUT(12, 1, 2) uniform sampler2DArray textureUnitPS12;
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
vec4 R11f = vec4(0.0);
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
R4f.xyz = (texture(textureUnitPS8, vec2(R0f.x,R0f.y)).xyz);
// 0
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(R2f.x,R2f.y,R2f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = intBitsToFloat(uf_remappedPS[0].z);
// 1
R7f.x = intBitsToFloat(uf_remappedPS[1].y);
R3f.y = 0.0;
R0f.z = roundEven(PS0f);
R0f.w = intBitsToFloat(uf_remappedPS[2].y);
tempResultf = 1.0 / sqrt(PV0fx);
PS1f = tempResultf;
// 2
R8f.x = mul_nonIEEE(R2f.x, PS1f);
R7f.y = mul_nonIEEE(R2f.y, PS1f);
R7f.z = mul_nonIEEE(R2f.z, PS1f);
R1f.w = intBitsToFloat(uf_remappedPS[3].y);
R6f.x = intBitsToFloat(uf_remappedPS[1].x);
// 3
tempf.x = dot(vec4(R8f.x,R7f.y,R7f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[4].x),intBitsToFloat(uf_remappedPS[4].y),intBitsToFloat(uf_remappedPS[4].z),0.0));
tempf.x /= 2.0;
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R6f.z = -(R3f.w) + 1.0;
// 4
R9f.x = 0.0;
R2f.y = intBitsToFloat(uf_remappedPS[1].y);
R2f.z = intBitsToFloat(uf_remappedPS[1].z);
PV0fw = -(PV1fx) + 0.5;
PV0fw = clamp(PV0fw, 0.0, 1.0);
R11f.w = 1.0;
// 5
R5f.x = intBitsToFloat(uf_remappedPS[2].x);
R5f.y = intBitsToFloat(uf_remappedPS[2].y);
R3f.z = intBitsToFloat(uf_remappedPS[2].z);
PV1fw = PV0fw + 6.5;
PS1f = mul_nonIEEE(R1f.z, R1f.z);
// 6
R3f.x = PV1fw * intBitsToFloat(0x3daaaaab);
R6f.y = intBitsToFloat(uf_remappedPS[3].x);
R5f.z = intBitsToFloat(uf_remappedPS[3].y);
R3f.w = intBitsToFloat(uf_remappedPS[3].z);
R2f.x = mul_nonIEEE(R1f.y,R1f.y) + PS1f;
R0f.xyz = (texture(textureUnitPS12, vec3(R0f.x,R0f.y,R0f.z)).xyz);
R10f.xyz = (texture(textureUnitPS7, vec2(R3f.x,R3f.y)).xyz);
// 0
R123f.x = mul_nonIEEE(R1f.x,R1f.x) + R2f.x;
R123f.y = mul_nonIEEE(-(R1f.z),intBitsToFloat(uf_remappedPS[5].x)) + -(intBitsToFloat(uf_remappedPS[5].y));
R123f.y = clamp(R123f.y, 0.0, 1.0);
PV0fz = -(R0f.y) + R4f.y;
R126f.w = -(R0f.z) + R4f.z;
PS0f = mul_nonIEEE(R2f.y, intBitsToFloat(uf_remappedPS[6].y));
// 1
R127f.x = mul_nonIEEE(R2f.z,intBitsToFloat(uf_remappedPS[6].z)) + PS0f;
R127f.y = mul_nonIEEE(PV0fz,R6f.z) + R0f.y;
R127f.z = -(R123f.y) + 1.0;
R127f.w = -(R0f.x) + R4f.x;
PS1f = sqrt(R123f.x);
// 2
tempf.x = dot(vec4(R5f.x,R5f.y,R3f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[6].x),intBitsToFloat(uf_remappedPS[6].y),intBitsToFloat(uf_remappedPS[6].z),0.0));
PV0fx = tempf.x;
R126f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = 1.0 / PS1f;
// 3
PV1fx = mul_nonIEEE(R1f.x, PS0f);
PV1fy = mul_nonIEEE(R1f.y, PS0f);
PV1fz = mul_nonIEEE(R1f.z, PS0f);
R124f.w = mul_nonIEEE(R6f.x,intBitsToFloat(uf_remappedPS[6].x)) + R127f.x;
tempResultf = max(0.0, R127f.z);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R125f.w = tempResultf;
// 4
tempf.x = dot(vec4(R7f.x,R0f.w,R1f.w,intBitsToFloat(0x80000000)),vec4(PV1fx,PV1fy,PV1fz,0.0));
tempf.x = clamp(tempf.x, 0.0, 1.0);
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R127f.z = mul_nonIEEE(R127f.w,R6f.z) + R0f.x;
// 5
tempf.x = dot(vec4(R6f.y,R5f.z,R3f.w,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[6].x),intBitsToFloat(uf_remappedPS[6].y),intBitsToFloat(uf_remappedPS[6].z),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
R126f.z = tempf.x;
PV1fw = tempf.x;
tempResultf = max(0.0, PV0fx);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1f = tempResultf;
// 6
backupReg0f = R127f.z;
backupReg1f = R127f.y;
PV0fx = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].z), PS1f);
R127f.y = mul_nonIEEE(R126f.w,R6f.z) + R0f.z;
R127f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].x), R125f.w);
R126f.w = backupReg0f * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8);
R126f.w = clamp(R126f.w, 0.0, 1.0);
R125f.z = backupReg1f * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8);
R125f.z = clamp(R125f.z, 0.0, 1.0);
// 7
R127f.x = dot(vec4(R8f.x,R7f.y,R7f.z,R7f.z),vec4(-(R124f.w),-(R126f.y),-(R126f.z),-(R9f.x)));
R127f.x = clamp(R127f.x, 0.0, 1.0);
PV1fy = R127f.x;
PV1fz = R127f.x;
PV1fw = R127f.x;
PS1f = exp2(PV0fx);
// 8
R126f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].x),R127f.x) + R10f.x;
R123f.y = R127f.y * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8);
R123f.y = clamp(R123f.y, 0.0, 1.0);
R123f.z = mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[7].w)),PS1f) + 1.0;
R124f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].y),R127f.x) + R10f.y;
PS0f = exp2(R127f.z);
// 9
backupReg0f = R123f.z;
backupReg1f = R123f.y;
R123f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].z),R127f.x) + R10f.z;
R123f.y = R126f.w * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e);
R123f.z = R125f.z * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e);
R123f.w = mul_nonIEEE(-(PS0f),backupReg0f) + backupReg0f;
R122f.x = backupReg1f * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e);
// 10
PV0fx = mul_nonIEEE(R124f.w, R123f.z);
PV0fy = mul_nonIEEE(R126f.x, R123f.y);
PV0fz = mul_nonIEEE(R123f.x, R122f.x);
R124f.w = mul_nonIEEE(R123f.w, intBitsToFloat(uf_remappedPS[9].w));
// 11
R123f.x = mul_nonIEEE(-(R124f.w),PV0fx) + PV0fx;
R123f.y = mul_nonIEEE(-(R124f.w),PV0fy) + PV0fy;
R123f.w = mul_nonIEEE(-(R124f.w),PV0fz) + PV0fz;
// 12
R11f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].x),R124f.w) + R123f.y;
R11f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].y),R124f.w) + R123f.x;
R11f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].z),R124f.w) + R123f.w;
// export
passPixelColor0 = vec4(R11f.x, R11f.y, R11f.z, R11f.w);
}
