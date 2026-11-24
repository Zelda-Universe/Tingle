#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader bede6707b02b5fed
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[11];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(6, 1, 0) uniform sampler2D textureUnitPS6;
TEXTURE_LAYOUT(7, 1, 1) uniform sampler2D textureUnitPS7;
TEXTURE_LAYOUT(9, 1, 2) uniform sampler2D textureUnitPS9;
TEXTURE_LAYOUT(10, 1, 3) uniform sampler2D textureUnitPS10;
in vec4 passParameterSem0;
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
R1f = passParameterSem4;
R2f = passParameterSem6;
R4f.xyz = (texture(textureUnitPS9, vec2(R0f.x,R0f.y)).xyz);
R7f.xyz = (texture(textureUnitPS7, vec2(R0f.x,R0f.y)).xyz);
R9f.w = (texture(textureUnitPS10, vec2(R0f.x,R0f.y)).w);
// 0
tempf.x = dot(vec4(R1f.x,R1f.y,R1f.z,intBitsToFloat(0x80000000)),vec4(R1f.x,R1f.y,R1f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R0f.y = 0.0;
// 1
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(R2f.x,R2f.y,R2f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
tempResultf = 1.0 / sqrt(PV0fx);
PS1f = tempResultf;
// 2
R5f.x = mul_nonIEEE(R1f.x, PS1f);
R5f.y = mul_nonIEEE(R1f.y, PS1f);
R3f.z = mul_nonIEEE(R1f.z, PS1f);
R126f.w = intBitsToFloat(uf_remappedPS[0].x);
PS0f = sqrt(PV1fx);
// 3
tempf.x = dot(vec4(R5f.x,R5f.y,R3f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[1].x),intBitsToFloat(uf_remappedPS[1].y),intBitsToFloat(uf_remappedPS[1].z),0.0));
tempf.x /= 2.0;
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R127f.w = 1.0 / PS0f;
// 4
R8f.x = mul_nonIEEE(R2f.x, R127f.w);
R127f.y = intBitsToFloat(uf_remappedPS[0].y);
R127f.z = intBitsToFloat(uf_remappedPS[0].z);
PV0fw = -(PV1fx) + 0.5;
PV0fw = clamp(PV0fw, 0.0, 1.0);
R8f.y = mul_nonIEEE(R2f.y, R127f.w);
// 5
R1f.x = intBitsToFloat(uf_remappedPS[2].x);
R1f.y = intBitsToFloat(uf_remappedPS[2].y);
R1f.z = intBitsToFloat(uf_remappedPS[2].z);
PV1fw = PV0fw + 6.5;
R5f.z = mul_nonIEEE(R2f.z, R127f.w);
// 6
R0f.x = PV1fw * intBitsToFloat(0x3daaaaab);
R3f.y = intBitsToFloat(uf_remappedPS[3].x);
R0f.z = intBitsToFloat(uf_remappedPS[3].y);
R0f.w = intBitsToFloat(uf_remappedPS[3].z);
R1f.w = 0.0;
// 7
R3f.x = dot(vec4(R126f.w,R127f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[4].x),intBitsToFloat(uf_remappedPS[4].y),intBitsToFloat(uf_remappedPS[4].z),0.0));
PV1fy = R3f.x;
PV1fz = R3f.x;
PV1fw = R3f.x;
R2f.w = 0.0;
R6f.xyz = (texture(textureUnitPS6, vec2(R0f.x,R0f.y)).xyz);
// 0
tempf.x = dot(vec4(R1f.x,R1f.y,R1f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[4].x),intBitsToFloat(uf_remappedPS[4].y),intBitsToFloat(uf_remappedPS[4].z),0.0));
PV0fx = tempf.x;
R127f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R127f.x = R8f.x + R3f.x;
// 1
tempf.x = dot(vec4(R3f.y,R0f.z,R0f.w,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[4].x),intBitsToFloat(uf_remappedPS[4].y),intBitsToFloat(uf_remappedPS[4].z),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
R127f.z = tempf.x;
PV1fw = tempf.x;
R126f.y = R8f.y + PV0fx;
// 2
R125f.x = mul_nonIEEE(-(R2f.z),intBitsToFloat(uf_remappedPS[5].y)) + intBitsToFloat(uf_remappedPS[5].z);
R125f.x = clamp(R125f.x, 0.0, 1.0);
R125f.y = R4f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R126f.z = R5f.z + PV1fx;
R126f.w = R4f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
PS0f = mul_nonIEEE(R5f.z, PV1fx);
// 3
tempf.x = dot(vec4(R127f.x,R126f.y,R126f.z,intBitsToFloat(0x80000000)),vec4(R127f.x,R126f.y,R126f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R126f.x = mul_nonIEEE(R8f.y,R127f.y) + PS0f;
// 4
tempf.x = dot(vec4(R5f.x,R5f.y,R3f.z,R3f.z),vec4(-(R3f.x),-(R127f.y),-(R127f.z),-(R1f.w)));
PV0fx = tempf.x;
R127f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
tempResultf = 1.0 / sqrt(PV1fx);
PS0f = tempResultf;
// 5
PV1fx = mul_nonIEEE(R127f.x, PS0f);
PV1fy = mul_nonIEEE(R126f.y, PS0f);
PV1fz = mul_nonIEEE(R126f.z, PS0f);
R127f.w = R4f.z * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R122f.x = mul_nonIEEE(-(R2f.z),intBitsToFloat(uf_remappedPS[6].x)) + -(intBitsToFloat(uf_remappedPS[6].y));
R122f.x = clamp(R122f.x, 0.0, 1.0);
// 6
tempf.x = dot(vec4(R5f.x,R5f.y,R3f.z,R3f.z),vec4(-(PV1fx),-(PV1fy),-(PV1fz),-(R2f.w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = -(R122f.x) + 1.0;
// 7
backupReg0f = R126f.x;
R126f.x = R127f.y;
R126f.x = clamp(R126f.x, 0.0, 1.0);
PV1fy = mul_nonIEEE(R127f.y, PV0fx);
PV1fz = mul_nonIEEE(R3f.z, R5f.z);
R123f.w = mul_nonIEEE(R8f.x,R3f.x) + backupReg0f;
tempResultf = max(0.0, PS0f);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1f = tempResultf;
// 8
R123f.x = mul_nonIEEE(-(R125f.x),PV1fy) + PV1fy;
R123f.x = clamp(R123f.x, 0.0, 1.0);
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].x), PS1f);
PV0fz = max(-(R123f.w), 0.0);
R125f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].x),R126f.x) + R6f.x;
R122f.x = mul_nonIEEE(R5f.y,R8f.y) + PV1fz;
// 9
PV1fx = min(PV0fz, 1.0);
R126f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].y),R126f.x) + R6f.y;
R127f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[8].z),R126f.x) + R6f.z;
R123f.w = mul_nonIEEE(R5f.x,R8f.x) + R122f.x;
tempResultf = max(0.0, R123f.x);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1f = tempResultf;
// 10
backupReg0f = R127f.y;
R126f.x = R123f.w + 1.0;
R126f.x = clamp(R126f.x, 0.0, 1.0);
R127f.y = mul_nonIEEE(PV1fx, PV1fx);
PV0fw = mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].x), PS1f);
R5f.x = exp2(backupReg0f);
// 11
R123f.y = mul_nonIEEE(R126f.x,R126f.x) + R127f.w;
R123f.y = clamp(R123f.y, 0.0, 1.0);
R123f.z = mul_nonIEEE(R126f.x,R126f.x) + R125f.y;
R123f.z = clamp(R123f.z, 0.0, 1.0);
R123f.w = mul_nonIEEE(R126f.x,R126f.x) + R126f.w;
R123f.w = clamp(R123f.w, 0.0, 1.0);
PS1f = exp2(PV0fw);
// 12
backupReg0f = R127f.y;
PV0fx = mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].y), PS1f);
R127f.y = mul_nonIEEE(R123f.z, backupReg0f);
R126f.z = mul_nonIEEE(R123f.w, backupReg0f);
R127f.w = mul_nonIEEE(R123f.y, backupReg0f);
// 13
PV1fz = mul_nonIEEE(R126f.x, PV0fx);
// 14
R123f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].w),R127f.w) + PV1fz;
R123f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].w),R126f.z) + PV1fz;
R123f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].w),R127f.y) + PV1fz;
// 15
backupReg0f = R123f.y;
R123f.y = mul_nonIEEE(R7f.z,R123f.x) + R7f.z;
R123f.z = mul_nonIEEE(R7f.x,R123f.w) + R7f.x;
R123f.w = mul_nonIEEE(R7f.y,backupReg0f) + R7f.y;
// 16
backupReg0f = R123f.z;
R123f.y = R123f.y * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8);
R123f.y = clamp(R123f.y, 0.0, 1.0);
R123f.z = R123f.w * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8);
R123f.z = clamp(R123f.z, 0.0, 1.0);
R123f.w = backupReg0f * intBitsToFloat(0x3f895ef0) + intBitsToFloat(0xba0a8ec8);
R123f.w = clamp(R123f.w, 0.0, 1.0);
// 17
backupReg0f = R123f.z;
R123f.x = R123f.w * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e);
R123f.z = R123f.y * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e);
R123f.w = backupReg0f * intBitsToFloat(0x3f6e896b) + intBitsToFloat(0x3a011b1e);
// 18
R7f.x = mul_nonIEEE(R126f.y, R123f.w);
R7f.y = mul_nonIEEE(R125f.w, R123f.x);
R7f.z = mul_nonIEEE(R127f.z, R123f.z);
// 0
R126f.x = intBitsToFloat(uf_remappedPS[0].y);
R126f.y = intBitsToFloat(uf_remappedPS[2].y);
// 1
PV1fz = intBitsToFloat(uf_remappedPS[3].y);
// 2
tempf.x = dot(vec4(R126f.x,R126f.y,PV1fz,intBitsToFloat(0x80000000)),vec4(R8f.x,R8f.y,R5f.z,0.0));
tempf.x = clamp(tempf.x, 0.0, 1.0);
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 3
tempResultf = max(0.0, PV0fx);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1f = tempResultf;
// 4
PV0fx = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].z), PS1f);
// 5
PS1f = exp2(PV0fx);
// 6
R123f.z = mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[7].w)),PS1f) + 1.0;
// 7
R123f.w = mul_nonIEEE(-(R5f.x),R123f.z) + R123f.z;
// 8
R126f.y = mul_nonIEEE(R123f.w, intBitsToFloat(uf_remappedPS[10].w));
// 9
R123f.x = mul_nonIEEE(-(R126f.y),R7f.x) + R7f.x;
R123f.y = mul_nonIEEE(-(R126f.y),R7f.y) + R7f.y;
R123f.w = mul_nonIEEE(-(R126f.y),R7f.z) + R7f.z;
// 10
R9f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].x),R126f.y) + R123f.y;
R9f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].y),R126f.y) + R123f.x;
R9f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].z),R126f.y) + R123f.w;
// export
if( ((vec4(R9f.x, R9f.y, R9f.z, R9f.w)).a >= uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R9f.x, R9f.y, R9f.z, R9f.w);
}
