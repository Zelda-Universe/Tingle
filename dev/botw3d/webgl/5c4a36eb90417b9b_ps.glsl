#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 5c4a36eb90417b9b
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[8];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
in vec4 passParameterSem0;
layout(location = 0) out vec4 passPixelColor0;
layout(location = 1) out vec4 passPixelColor1;
layout(location = 2) out vec4 passPixelColor2;
layout(location = 3) out vec4 passPixelColor3;
layout(location = 4) out vec4 passPixelColor4;
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
vec4 R10f = vec4(0.0);
vec4 R11f = vec4(0.0);
vec4 R12f = vec4(0.0);
vec4 R13f = vec4(0.0);
vec4 R14f = vec4(0.0);
vec4 R15f = vec4(0.0);
vec4 R16f = vec4(0.0);
vec4 R17f = vec4(0.0);
vec4 R18f = vec4(0.0);
vec4 R19f = vec4(0.0);
vec4 R20f = vec4(0.0);
vec4 R21f = vec4(0.0);
vec4 R22f = vec4(0.0);
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
R3f.xyz = (texture(textureUnitPS1, vec2(R0f.x,R0f.y)).xyz);
// 0
R127f.x = -(R3f.x);
R127f.y = R3f.y;
R127f.z = -(R3f.z);
R127f.w = R3f.y;
R126f.z = R3f.z;
// 1
R2f.x = -(R3f.z);
R126f.y = R3f.x;
R125f.z = R3f.y;
R0f.w = R3f.y;
R0f.z = -(R3f.x);
// 2
tempf.x = dot(vec4(R3f.x,R127f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[0].x),intBitsToFloat(uf_remappedPS[0].y),intBitsToFloat(uf_remappedPS[0].z),0.0));
tempf.x /= 2.0;
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = mul_nonIEEE(R126f.z, intBitsToFloat(uf_remappedPS[0].z));
// 3
tempf.x = dot(vec4(R127f.x,R127f.w,PS0f,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[0].x),intBitsToFloat(uf_remappedPS[0].y),1.0,0.0));
tempf.x /= 2.0;
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R0f.x = -(PV0fx) + 0.5;
// 4
tempf.x = dot(vec4(R2f.x,R126f.y,R125f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[0].x),intBitsToFloat(uf_remappedPS[0].y),intBitsToFloat(uf_remappedPS[0].z),0.0));
tempf.x /= 2.0;
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R1f.x = -(PV1fx) + 0.5;
// 5
tempf.x = dot(vec4(-(R3f.z),-(R3f.x),-(R3f.y),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[0].x),intBitsToFloat(uf_remappedPS[0].y),intBitsToFloat(uf_remappedPS[0].z),0.0));
tempf.x /= 2.0;
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R4f.x = -(PV0fx) + 0.5;
// 6
tempf.x = dot(vec4(R2f.x,R0f.w,R0f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[0].x),intBitsToFloat(uf_remappedPS[0].y),intBitsToFloat(uf_remappedPS[0].z),0.0));
tempf.x /= 2.0;
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R5f.x = -(PV1fx) + 0.5;
// 7
tempf.x = dot(vec4(R3f.z,R3f.y,R3f.x,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[0].x),intBitsToFloat(uf_remappedPS[0].y),intBitsToFloat(uf_remappedPS[0].z),0.0));
tempf.x /= 2.0;
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R6f.x = -(PV0fx) + 0.5;
// 8
R7f.x = -(PV1fx) + 0.5;
R0f.y = intBitsToFloat(uf_remappedPS[1].x);
R4f.z = intBitsToFloat(uf_remappedPS[1].x);
R1f.w = intBitsToFloat(uf_remappedPS[1].x);
R5f.y = intBitsToFloat(uf_remappedPS[1].x);
// 9
R8f.x = R0f.x;
R6f.y = intBitsToFloat(uf_remappedPS[1].x);
R7f.z = intBitsToFloat(uf_remappedPS[1].x);
R16f.w = intBitsToFloat(uf_remappedPS[2].x);
R18f.y = intBitsToFloat(uf_remappedPS[2].x);
// 10
tempf.x = dot(vec4(R3f.x,R127f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(uf_remappedPS[3].y),intBitsToFloat(uf_remappedPS[3].z),0.0));
tempf.x /= 2.0;
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R1f.z = R1f.x;
// 11
tempf.x = dot(vec4(R127f.x,R127f.w,R126f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(uf_remappedPS[3].y),intBitsToFloat(uf_remappedPS[3].z),0.0));
tempf.x /= 2.0;
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R16f.x = -(PV0fx) + 0.5;
// 12
tempf.x = dot(vec4(R2f.x,R126f.y,R125f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(uf_remappedPS[3].y),intBitsToFloat(uf_remappedPS[3].z),0.0));
tempf.x /= 2.0;
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
R2f.w = tempf.x;
R18f.x = -(PV1fx) + 0.5;
R9f.xyz = (texture(textureUnitPS0, vec2(R0f.x,R0f.y)).xxx);
R10f.xyz = (texture(textureUnitPS0, vec2(R1f.x,R1f.w)).xxx);
R11f.xyz = (texture(textureUnitPS0, vec2(R4f.x,R4f.z)).xxx);
R12f.xyz = (texture(textureUnitPS0, vec2(R5f.x,R5f.y)).xxx);
R13f.xyz = (texture(textureUnitPS0, vec2(R6f.x,R6f.y)).xxx);
R14f.xyz = (texture(textureUnitPS0, vec2(R7f.x,R7f.z)).xxx);
R15f.xyz = (texture(textureUnitPS0, vec2(R16f.x,R16f.w)).xxx);
R17f.xyz = (texture(textureUnitPS0, vec2(R18f.x,R18f.y)).xxx);
// 0
tempf.x = dot(vec4(R2f.x,R0f.w,R0f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(uf_remappedPS[3].y),intBitsToFloat(uf_remappedPS[3].z),0.0));
tempf.x /= 2.0;
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R2f.x = -(R2f.w) + 0.5;
// 1
tempf.x = dot(vec4(-(R3f.z),-(R3f.x),-(R3f.y),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(uf_remappedPS[3].y),intBitsToFloat(uf_remappedPS[3].z),0.0));
tempf.x /= 2.0;
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R1f.x = -(PV0fx) + 0.5;
// 2
tempf.x = dot(vec4(R3f.z,R3f.y,R3f.x,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(uf_remappedPS[3].y),intBitsToFloat(uf_remappedPS[3].z),0.0));
tempf.x /= 2.0;
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R19f.x = -(PV1fx) + 0.5;
// 3
R22f.x = -(PV0fx) + 0.5;
R2f.y = intBitsToFloat(uf_remappedPS[2].x);
R19f.z = intBitsToFloat(uf_remappedPS[2].x);
R1f.w = intBitsToFloat(uf_remappedPS[2].x);
R22f.y = intBitsToFloat(uf_remappedPS[2].x);
R3f.xyz = (texture(textureUnitPS0, vec2(R2f.x,R2f.y)).xxx);
R0f.xyz = (texture(textureUnitPS0, vec2(R19f.x,R19f.z)).xxx);
R20f.xyz = (texture(textureUnitPS0, vec2(R1f.x,R1f.w)).xxx);
R21f.xyz = (texture(textureUnitPS0, vec2(R22f.x,R22f.y)).xxx);
// 0
PV0fx = R4f.x;
R5f.y = R5f.x;
R125f.z = intBitsToFloat(uf_remappedPS[4].x) + -(intBitsToFloat(uf_remappedPS[5].x));
R127f.w = intBitsToFloat(uf_remappedPS[4].y) + -(intBitsToFloat(uf_remappedPS[5].y));
R4f.z = R6f.x;
// 1
backupReg0f = R1f.z;
R126f.y = intBitsToFloat(uf_remappedPS[4].z) + -(intBitsToFloat(uf_remappedPS[5].z));
R1f.z = 0.0 + R8f.x;
R0f.w = 0.0 + backupReg0f;
R2f.w = 0.0 + PV0fx;
// 2
R127f.x = mul_nonIEEE(R125f.z,R9f.x) + intBitsToFloat(uf_remappedPS[5].x);
R127f.y = mul_nonIEEE(R125f.z,R10f.x) + intBitsToFloat(uf_remappedPS[5].x);
R126f.z = mul_nonIEEE(R127f.w,R9f.y) + intBitsToFloat(uf_remappedPS[5].y);
R126f.w = mul_nonIEEE(R126f.y,R9f.z) + intBitsToFloat(uf_remappedPS[5].z);
R126f.x = mul_nonIEEE(R127f.w,R10f.y) + intBitsToFloat(uf_remappedPS[5].y);
// 3
R125f.x = mul_nonIEEE(R127f.w,R11f.y) + intBitsToFloat(uf_remappedPS[5].y);
R125f.y = mul_nonIEEE(R125f.z,R11f.x) + intBitsToFloat(uf_remappedPS[5].x);
R127f.z = mul_nonIEEE(R126f.y,R11f.z) + intBitsToFloat(uf_remappedPS[5].z);
R125f.w = mul_nonIEEE(R126f.y,R10f.z) + intBitsToFloat(uf_remappedPS[5].z);
R124f.z = mul_nonIEEE(R125f.z,R12f.x) + intBitsToFloat(uf_remappedPS[5].x);
// 4
R124f.x = mul_nonIEEE(R126f.y,R12f.z) + intBitsToFloat(uf_remappedPS[5].z);
R124f.y = mul_nonIEEE(R127f.w,R12f.y) + intBitsToFloat(uf_remappedPS[5].y);
R12f.z = mul_nonIEEE(R127f.w,R13f.y) + intBitsToFloat(uf_remappedPS[5].y);
R124f.w = mul_nonIEEE(R125f.z,R13f.x) + intBitsToFloat(uf_remappedPS[5].x);
R12f.x = mul_nonIEEE(R126f.y,R13f.z) + intBitsToFloat(uf_remappedPS[5].z);
// 5
backupReg0f = R126f.z;
R127f.x = 0.0 + R127f.x;
R126f.y = mul_nonIEEE(R126f.y,R14f.z) + intBitsToFloat(uf_remappedPS[5].z);
R126f.z = mul_nonIEEE(R127f.w,R14f.y) + intBitsToFloat(uf_remappedPS[5].y);
R127f.w = mul_nonIEEE(R125f.z,R14f.x) + intBitsToFloat(uf_remappedPS[5].x);
R14f.z = 0.0 + backupReg0f;
// 6
backupReg0f = R126f.x;
R126f.x = 0.0 + R126f.w;
R127f.y = 0.0 + R127f.y;
R125f.z = intBitsToFloat(uf_remappedPS[6].x) + -(intBitsToFloat(uf_remappedPS[7].x));
R126f.w = intBitsToFloat(uf_remappedPS[6].y) + -(intBitsToFloat(uf_remappedPS[7].y));
R14f.x = 0.0 + backupReg0f;
// 7
backupReg0f = R125f.x;
R125f.x = 0.0 + R125f.y;
R125f.y = intBitsToFloat(uf_remappedPS[6].z) + -(intBitsToFloat(uf_remappedPS[7].z));
R13f.z = 0.0 + backupReg0f;
R125f.w = 0.0 + R125f.w;
R10f.z = 0.0 + R127f.z;
// 8
backupReg0f = R5f.y;
R13f.x = 0.0 + R124f.x;
R5f.y = 0.0 + R124f.y;
R11f.z = 0.0 + R124f.z;
R4f.w = 0.0 + backupReg0f;
R6f.w = 0.0 + R124f.w;
// 9
R12f.x = 0.0 + R12f.x;
R14f.y = 0.0 + R12f.z;
R4f.z = 0.0 + R4f.z;
R7f.w = 0.0 + R127f.w;
R12f.z = 0.0 + R126f.z;
// 10
backupReg0f = R15f.y;
R7f.x = 0.0 + R7f.x;
R15f.y = 0.0 + R126f.y;
R126f.z = mul_nonIEEE(R125f.z,R15f.x) + intBitsToFloat(uf_remappedPS[7].x);
R127f.w = mul_nonIEEE(R126f.w,backupReg0f) + intBitsToFloat(uf_remappedPS[7].y);
R124f.w = mul_nonIEEE(R125f.y,R15f.z) + intBitsToFloat(uf_remappedPS[7].z);
// 11
R124f.x = mul_nonIEEE(R126f.w,R17f.y) + intBitsToFloat(uf_remappedPS[7].y);
R126f.y = mul_nonIEEE(R125f.z,R17f.x) + intBitsToFloat(uf_remappedPS[7].x);
R127f.z = R16f.x;
R16f.w = mul_nonIEEE(R125f.y,R17f.z) + intBitsToFloat(uf_remappedPS[7].z);
R124f.z = R18f.x;
// 12
backupReg0f = R2f.x;
R2f.x = mul_nonIEEE(R126f.w,R3f.y) + intBitsToFloat(uf_remappedPS[7].y);
R124f.y = mul_nonIEEE(R125f.z,R3f.x) + intBitsToFloat(uf_remappedPS[7].x);
R3f.z = mul_nonIEEE(R125f.y,R3f.z) + intBitsToFloat(uf_remappedPS[7].z);
R3f.w = backupReg0f;
R17f.z = mul_nonIEEE(R125f.z,R0f.x) + intBitsToFloat(uf_remappedPS[7].x);
// 13
R0f.x = mul_nonIEEE(R125f.y,R0f.z) + intBitsToFloat(uf_remappedPS[7].z);
R0f.y = mul_nonIEEE(R126f.w,R0f.y) + intBitsToFloat(uf_remappedPS[7].y);
R0f.z = mul_nonIEEE(R125f.z,R20f.x) + intBitsToFloat(uf_remappedPS[7].x);
R5f.w = R19f.x;
R2f.y = mul_nonIEEE(R126f.w,R20f.y) + intBitsToFloat(uf_remappedPS[7].y);
// 14
backupReg0f = R1f.x;
backupReg1f = R125f.z;
backupReg2f = R125f.y;
R1f.x = mul_nonIEEE(backupReg2f,R20f.z) + intBitsToFloat(uf_remappedPS[7].z);
R125f.y = mul_nonIEEE(R126f.w,R21f.y) + intBitsToFloat(uf_remappedPS[7].y);
R125f.z = backupReg0f;
R126f.w = mul_nonIEEE(backupReg1f,R21f.x) + intBitsToFloat(uf_remappedPS[7].x);
R20f.y = mul_nonIEEE(backupReg2f,R21f.z) + intBitsToFloat(uf_remappedPS[7].z);
// 15
backupReg0f = R127f.x;
R127f.x = R22f.x;
R21f.y = R14f.z + R127f.w;
R21f.z = R126f.x + R124f.w;
R22f.w = R0f.w + R124f.z;
R21f.x = backupReg0f + R126f.z;
// 16
R22f.x = R127f.y + R126f.y;
R22f.y = R14f.x + R124f.x;
R22f.z = R125f.w + R16f.w;
R21f.w = R1f.z + R127f.z;
R16f.x = R125f.x + R124f.y;
// 17
R16f.y = R13f.z + R2f.x;
R16f.z = R10f.z + R3f.z;
R16f.w = R2f.w + R3f.w;
R3f.y = R5f.y + R0f.y;
// 18
R3f.x = R11f.z + R17f.z;
R0f.y = R14f.y + R2f.y;
R3f.z = R13f.x + R0f.x;
R3f.w = R4f.w + R5f.w;
R0f.x = R6f.w + R0f.z;
// 19
backupReg0f = R1f.x;
R1f.x = R7f.w + R126f.w;
R1f.y = R12f.z + R125f.y;
R0f.z = R12f.x + backupReg0f;
R0f.w = R4f.z + R125f.z;
R1f.z = R15f.y + R20f.y;
// 20
R1f.w = R7f.x + R127f.x;
// 21
R9f.x = R1f.x;
R9f.y = R1f.y;
R9f.z = R1f.z;
R9f.w = R1f.w;
// 22
R8f.x = R0f.x;
R8f.y = R0f.y;
R8f.z = R0f.z;
R8f.w = R0f.w;
// 23
R7f.x = R3f.x;
R7f.y = R3f.y;
R7f.z = R3f.z;
R7f.w = R3f.w;
// 24
R6f.x = R16f.x;
R6f.y = R16f.y;
R6f.z = R16f.z;
R6f.w = R16f.w;
// 25
R5f.x = R22f.x;
R5f.y = R22f.y;
R5f.z = R22f.z;
R5f.w = R22f.w;
// 26
R4f.x = R21f.x;
R4f.y = R21f.y;
R4f.z = R21f.z;
R4f.w = R21f.w;
// export
passPixelColor0 = vec4(R4f.x, R4f.y, R4f.z, R4f.w);
passPixelColor1 = vec4(R5f.x, R5f.y, R5f.z, R5f.w);
passPixelColor2 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
passPixelColor3 = vec4(R7f.x, R7f.y, R7f.z, R7f.w);
passPixelColor4 = vec4(R8f.x, R8f.y, R8f.z, R8f.w);
passPixelColor5 = vec4(R9f.x, R9f.y, R9f.z, R9f.w);
}
