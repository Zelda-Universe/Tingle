#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader cd24daf7cd4b71c6
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[10];
uniform vec2 uf_fragCoordScale;
in vec4 passParameterSem0;
layout(location = 0) out vec4 passPixelColor0;
layout(location = 1) out vec4 passPixelColor1;
layout(location = 2) out vec4 passPixelColor2;
layout(location = 3) out vec4 passPixelColor3;
layout(location = 4) out vec4 passPixelColor4;
layout(location = 5) out vec4 passPixelColor5;
layout(location = 6) out vec4 passPixelColor6;
layout(location = 7) out vec4 passPixelColor7;
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
// 0
PV0fx = intBitsToFloat(uf_remappedPS[0].z) * 1.0;
R127f.y = R0f.y;
R127f.y = clamp(R127f.y, 0.0, 1.0);
R127f.z = R0f.x;
R127f.z = clamp(R127f.z, 0.0, 1.0);
PV0fw = 0.0;
R9f.z = 1.0;
// 1
PV1fx = -(R127f.z) + 1.0;
PV1fy = PV0fw + PV0fx;
R126f.z = intBitsToFloat(0x3f5b6db7) * intBitsToFloat(uf_remappedPS[0].z) + intBitsToFloat(0x3e124925);
PV1fw = -(R127f.y) + 1.0;
R127f.x = max(R0f.x, R0f.y);
// 2
PV0fx = mul_nonIEEE(PV1fw, intBitsToFloat(uf_remappedPS[0].y));
PV0fy = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedPS[0].x));
R125f.z = intBitsToFloat(0x3f36db6e) * intBitsToFloat(uf_remappedPS[0].z) + intBitsToFloat(0x3e924925);
R125f.w = intBitsToFloat(0x3f124924) * intBitsToFloat(uf_remappedPS[0].z) + intBitsToFloat(0x3edb6db8);
tempResultf = max(0.0, PV1fy);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R127f.w = tempResultf;
// 3
backupReg0f = R127f.y;
R126f.x = intBitsToFloat(0x3edb6db6) * intBitsToFloat(uf_remappedPS[0].z) + intBitsToFloat(0x3f124925);
R127f.y = intBitsToFloat(0x3e924924) * intBitsToFloat(uf_remappedPS[0].z) + intBitsToFloat(0x3f36db6e);
PV1fz = backupReg0f + PV0fx;
R126f.w = R127f.z + PV0fy;
tempResultf = max(0.0, R126f.z);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1f = tempResultf;
// 4
R124f.x = mul_nonIEEE(R127f.w, intBitsToFloat(uf_remappedPS[1].z));
R126f.y = mul_nonIEEE(PS1f, intBitsToFloat(uf_remappedPS[1].z));
R127f.z = intBitsToFloat(0x3e124924) * intBitsToFloat(uf_remappedPS[0].z) + intBitsToFloat(0x3f5b6db7);
R9f.w = max(R127f.x, 0.0);
tempResultf = max(0.0, PV1fz);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0f = tempResultf;
// 5
R125f.x = mul_nonIEEE(PS0f, intBitsToFloat(uf_remappedPS[1].y));
R8f.y = max(R127f.x, intBitsToFloat(0x3e124925));
R12f.z = max(R127f.x, intBitsToFloat(0x3e924925));
R10f.w = max(R127f.x, intBitsToFloat(0x3edb6db8));
tempResultf = max(0.0, R126f.w);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1f = tempResultf;
// 6
backupReg0f = R125f.z;
R9f.x = max(R127f.x, intBitsToFloat(0x3f124925));
R9f.y = max(R127f.x, intBitsToFloat(0x3f36db6e));
R125f.z = mul_nonIEEE(PS1f, intBitsToFloat(uf_remappedPS[1].x));
R11f.w = max(R127f.x, intBitsToFloat(0x3f5b6db7));
tempResultf = max(0.0, backupReg0f);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0f = tempResultf;
// 7
R10f.x = max(R127f.x, 1.0);
R125f.y = mul_nonIEEE(PS0f, intBitsToFloat(uf_remappedPS[1].z));
tempResultf = max(0.0, R125f.w);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1f = tempResultf;
// 8
R125f.w = mul_nonIEEE(PS1f, intBitsToFloat(uf_remappedPS[1].z));
tempResultf = max(0.0, R126f.x);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0f = tempResultf;
// 9
R126f.x = mul_nonIEEE(PS0f, intBitsToFloat(uf_remappedPS[1].z));
tempResultf = max(0.0, R127f.y);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1f = tempResultf;
// 10
R127f.x = mul_nonIEEE(PS1f, intBitsToFloat(uf_remappedPS[1].z));
tempResultf = max(0.0, R127f.z);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0f = tempResultf;
// 11
R127f.y = mul_nonIEEE(PS0f, intBitsToFloat(uf_remappedPS[1].z));
R124f.y = exp2(R125f.x);
// 12
R0f.x = R124f.y;
R0f.y = R124f.y;
R3f.z = R124f.y;
R0f.w = R124f.y;
R2f.x = exp2(R125f.z);
// 13
R1f.x = R124f.y;
R1f.y = R124f.y;
R8f.z = R124f.y;
R0f.z = exp2(R124f.x);
// 14
tempf.x = dot(vec4(R2f.x,R124f.y,R0f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),intBitsToFloat(0x3dea4a8c),0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
R10f.z = tempf.x;
PV0fw = tempf.x;
R1f.z = exp2(R126f.y);
// 15
tempf.x = dot(vec4(R2f.x,R0f.y,R1f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),intBitsToFloat(0x3dea4a8c),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
R2f.w = tempf.x;
R2f.z = exp2(R125f.y);
// 16
tempf.x = dot(vec4(R2f.x,R0f.x,R2f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),intBitsToFloat(0x3dea4a8c),0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
R3f.w = tempf.x;
R4f.z = exp2(R125f.w);
// 17
tempf.x = dot(vec4(R2f.x,R3f.z,R4f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),intBitsToFloat(0x3dea4a8c),0.0));
PV1fx = tempf.x;
R3f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R5f.z = exp2(R126f.x);
// 18
tempf.x = dot(vec4(R2f.x,R0f.w,R5f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),intBitsToFloat(0x3dea4a8c),0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
R11f.z = tempf.x;
PV0fw = tempf.x;
R6f.z = exp2(R127f.x);
// 19
tempf.x = dot(vec4(R2f.x,R1f.y,R6f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),intBitsToFloat(0x3dea4a8c),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
R4f.w = tempf.x;
R7f.z = exp2(R127f.y);
// 20
tempf.x = dot(vec4(R2f.x,R1f.x,R7f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),intBitsToFloat(0x3dea4a8c),0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
R5f.w = tempf.x;
R2f.y = R2f.x + -(R10f.z);
// 21
R3f.x = dot(vec4(R2f.x,R8f.z,R9f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),intBitsToFloat(0x3dea4a8c),0.0));
PV1fy = R3f.x;
PV1fz = R3f.x;
PV1fw = R3f.x;
R1f.w = R124f.y + -(R10f.z);
// 0
R127f.x = R0f.z + -(R10f.z);
R124f.y = R0f.y + -(R2f.w);
R125f.z = R2f.x + -(R2f.w);
R125f.w = R1f.z + -(R2f.w);
R126f.x = R2f.x + -(R3f.w);
// 1
R124f.x = R2f.x + -(R3f.y);
R127f.y = R2f.z + -(R3f.w);
R127f.z = R0f.x + -(R3f.w);
R126f.w = R3f.z + -(R3f.y);
R126f.z = R4f.z + -(R3f.y);
// 2
R125f.x = R5f.z + -(R11f.z);
R125f.y = R2f.x + -(R11f.z);
R124f.z = R2f.x + -(R4f.w);
R127f.w = R0f.w + -(R11f.z);
R126f.y = R1f.y + -(R4f.w);
// 3
backupReg0f = R1f.x;
R1f.x = R6f.z + -(R4f.w);
R1f.y = R2f.x + -(R5f.w);
R6f.z = backupReg0f + -(R5f.w);
R124f.w = R7f.z + -(R5f.w);
R0f.w = R2f.x + -(R3f.x);
// 4
backupReg0f = R127f.x;
R127f.x = mul_nonIEEE(R2f.y,intBitsToFloat(uf_remappedPS[2].x)) + R10f.z;
R127f.x = clamp(R127f.x, 0.0, 1.0);
R2f.y = R9f.z + -(R3f.x);
R8f.z = R8f.z + -(R3f.x);
R1f.w = mul_nonIEEE(R1f.w,intBitsToFloat(uf_remappedPS[2].x)) + R10f.z;
R1f.w = clamp(R1f.w, 0.0, 1.0);
R6f.w = mul_nonIEEE(backupReg0f,intBitsToFloat(uf_remappedPS[2].x)) + R10f.z;
R6f.w = clamp(R6f.w, 0.0, 1.0);
// 5
backupReg0f = R124f.y;
backupReg1f = R127f.z;
R126f.x = mul_nonIEEE(R126f.x,intBitsToFloat(uf_remappedPS[2].x)) + R3f.w;
R126f.x = clamp(R126f.x, 0.0, 1.0);
R124f.y = mul_nonIEEE(R125f.w,intBitsToFloat(uf_remappedPS[2].x)) + R2f.w;
R124f.y = clamp(R124f.y, 0.0, 1.0);
R127f.z = mul_nonIEEE(backupReg0f,intBitsToFloat(uf_remappedPS[2].x)) + R2f.w;
R127f.z = clamp(R127f.z, 0.0, 1.0);
R125f.w = mul_nonIEEE(R125f.z,intBitsToFloat(uf_remappedPS[2].x)) + R2f.w;
R125f.w = clamp(R125f.w, 0.0, 1.0);
R2f.x = mul_nonIEEE(backupReg1f,intBitsToFloat(uf_remappedPS[2].x)) + R3f.w;
R2f.x = clamp(R2f.x, 0.0, 1.0);
// 6
backupReg0f = R125f.y;
R0f.x = mul_nonIEEE(R126f.w,intBitsToFloat(uf_remappedPS[2].x)) + R3f.y;
R0f.x = clamp(R0f.x, 0.0, 1.0);
R125f.y = mul_nonIEEE(R124f.x,intBitsToFloat(uf_remappedPS[2].x)) + R3f.y;
R125f.y = clamp(R125f.y, 0.0, 1.0);
R9f.z = mul_nonIEEE(R127f.y,intBitsToFloat(uf_remappedPS[2].x)) + R3f.w;
R9f.z = clamp(R9f.z, 0.0, 1.0);
R3f.w = mul_nonIEEE(R126f.z,intBitsToFloat(uf_remappedPS[2].x)) + R3f.y;
R3f.w = clamp(R3f.w, 0.0, 1.0);
R125f.z = mul_nonIEEE(backupReg0f,intBitsToFloat(uf_remappedPS[2].x)) + R11f.z;
R125f.z = clamp(R125f.z, 0.0, 1.0);
// 7
backupReg0f = R11f.z;
backupReg1f = R4f.w;
R6f.x = mul_nonIEEE(R124f.z,intBitsToFloat(uf_remappedPS[2].x)) + backupReg1f;
R6f.x = clamp(R6f.x, 0.0, 1.0);
R3f.y = mul_nonIEEE(R127f.w,intBitsToFloat(uf_remappedPS[2].x)) + backupReg0f;
R3f.y = clamp(R3f.y, 0.0, 1.0);
R11f.z = mul_nonIEEE(R126f.y,intBitsToFloat(uf_remappedPS[2].x)) + backupReg1f;
R11f.z = clamp(R11f.z, 0.0, 1.0);
R4f.w = mul_nonIEEE(R125f.x,intBitsToFloat(uf_remappedPS[2].x)) + backupReg0f;
R4f.w = clamp(R4f.w, 0.0, 1.0);
R0f.y = mul_nonIEEE(R1f.x,intBitsToFloat(uf_remappedPS[2].x)) + backupReg1f;
R0f.y = clamp(R0f.y, 0.0, 1.0);
// 8
R7f.x = mul_nonIEEE(R6f.z,intBitsToFloat(uf_remappedPS[2].x)) + R5f.w;
R7f.x = clamp(R7f.x, 0.0, 1.0);
R6f.y = mul_nonIEEE(R0f.w,intBitsToFloat(uf_remappedPS[2].x)) + R3f.x;
R6f.y = clamp(R6f.y, 0.0, 1.0);
R10f.z = mul_nonIEEE(R124f.w,intBitsToFloat(uf_remappedPS[2].x)) + R5f.w;
R10f.z = clamp(R10f.z, 0.0, 1.0);
R5f.w = mul_nonIEEE(R1f.y,intBitsToFloat(uf_remappedPS[2].x)) + R5f.w;
R5f.w = clamp(R5f.w, 0.0, 1.0);
R7f.w = mul_nonIEEE(R8f.z,intBitsToFloat(uf_remappedPS[2].x)) + R3f.x;
R7f.w = clamp(R7f.w, 0.0, 1.0);
// 9
R125f.x = -(R127f.x) + 1.0;
R126f.y = -(R1f.w) + 1.0;
R5f.z = mul_nonIEEE(R2f.y,intBitsToFloat(uf_remappedPS[2].x)) + R3f.x;
R5f.z = clamp(R5f.z, 0.0, 1.0);
R124f.w = -(R6f.w) + 1.0;
R124f.x = -(R125f.w) + 1.0;
// 10
R3f.x = -(R2f.x) + 1.0;
R127f.y = -(R126f.x) + 1.0;
R124f.z = -(R124f.y) + 1.0;
R127f.w = -(R127f.z) + 1.0;
R1f.x = -(R9f.z) + 1.0;
// 11
R4f.x = -(R3f.w) + 1.0;
R2f.y = -(R0f.x) + 1.0;
R126f.z = -(R125f.y) + 1.0;
R126f.w = -(R125f.z) + 1.0;
R6f.z = -(R3f.y) + 1.0;
// 12
R5f.x = -(R6f.x) + 1.0;
R1f.y = -(R4f.w) + 1.0;
R8f.z = -(R0f.y) + 1.0;
R0f.w = -(R11f.z) + 1.0;
R4f.y = -(R5f.w) + 1.0;
// 13
R8f.x = -(R10f.z) + 1.0;
R5f.y = -(R6f.y) + 1.0;
R7f.z = -(R7f.w) + 1.0;
R2f.w = -(R7f.x) + 1.0;
R8f.w = -(R5f.z) + 1.0;
// 14
backupReg0f = R127f.x;
backupReg1f = R127f.y;
R127f.x = mul_nonIEEE(R126f.y,intBitsToFloat(uf_remappedPS[3].y)) + R1f.w;
R127f.y = mul_nonIEEE(R124f.z,intBitsToFloat(uf_remappedPS[3].z)) + R124f.y;
R124f.z = mul_nonIEEE(R124f.w,intBitsToFloat(uf_remappedPS[3].z)) + R6f.w;
R124f.w = mul_nonIEEE(R125f.x,intBitsToFloat(uf_remappedPS[3].x)) + backupReg0f;
R2f.z = mul_nonIEEE(backupReg1f,intBitsToFloat(uf_remappedPS[3].x)) + R126f.x;
// 15
backupReg0f = R124f.x;
backupReg1f = R125f.y;
backupReg2f = R126f.w;
R124f.x = mul_nonIEEE(R127f.w,intBitsToFloat(uf_remappedPS[3].y)) + R127f.z;
R125f.y = mul_nonIEEE(backupReg0f,intBitsToFloat(uf_remappedPS[3].x)) + R125f.w;
R127f.z = mul_nonIEEE(R3f.x,intBitsToFloat(uf_remappedPS[3].y)) + R2f.x;
R126f.w = mul_nonIEEE(R126f.z,intBitsToFloat(uf_remappedPS[3].x)) + backupReg1f;
R1f.w = mul_nonIEEE(backupReg2f,intBitsToFloat(uf_remappedPS[3].x)) + R125f.z;
// 16
backupReg0f = R0f.x;
backupReg1f = R1f.y;
R0f.x = mul_nonIEEE(R6f.z,intBitsToFloat(uf_remappedPS[3].y)) + R3f.y;
R1f.y = mul_nonIEEE(R4f.x,intBitsToFloat(uf_remappedPS[3].z)) + R3f.w;
R6f.z = mul_nonIEEE(R2f.y,intBitsToFloat(uf_remappedPS[3].y)) + backupReg0f;
R127f.w = mul_nonIEEE(R1f.x,intBitsToFloat(uf_remappedPS[3].z)) + R9f.z;
R9f.z = mul_nonIEEE(backupReg1f,intBitsToFloat(uf_remappedPS[3].z)) + R4f.w;
// 17
backupReg0f = R5f.x;
backupReg1f = R8f.z;
backupReg2f = R0f.y;
R5f.x = mul_nonIEEE(R0f.w,intBitsToFloat(uf_remappedPS[3].y)) + R11f.z;
R0f.y = mul_nonIEEE(backupReg0f,intBitsToFloat(uf_remappedPS[3].x)) + R6f.x;
R8f.z = mul_nonIEEE(R4f.y,intBitsToFloat(uf_remappedPS[3].x)) + R5f.w;
R0f.w = mul_nonIEEE(backupReg1f,intBitsToFloat(uf_remappedPS[3].z)) + backupReg2f;
R4f.y = mul_nonIEEE(R2f.w,intBitsToFloat(uf_remappedPS[3].y)) + R7f.x;
// 18
backupReg0f = R5f.y;
R6f.x = mul_nonIEEE(R8f.w,intBitsToFloat(uf_remappedPS[3].z)) + R5f.z;
R5f.y = mul_nonIEEE(R7f.z,intBitsToFloat(uf_remappedPS[3].y)) + R7f.w;
R5f.z = mul_nonIEEE(backupReg0f,intBitsToFloat(uf_remappedPS[3].x)) + R6f.y;
R7f.w = mul_nonIEEE(R8f.x,intBitsToFloat(uf_remappedPS[3].z)) + R10f.z;
tempResultf = max(0.0, R124f.w);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0f = tempResultf;
// 19
R8f.w = mul_nonIEEE(PS0f, intBitsToFloat(uf_remappedPS[4].x));
tempResultf = max(0.0, R127f.x);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1f = tempResultf;
// 20
R7f.x = mul_nonIEEE(PS1f, intBitsToFloat(uf_remappedPS[4].y));
tempResultf = max(0.0, R124f.z);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0f = tempResultf;
// 21
R6f.y = mul_nonIEEE(PS0f, intBitsToFloat(uf_remappedPS[4].z));
tempResultf = max(0.0, R125f.y);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1f = tempResultf;
// 22
R2f.y = mul_nonIEEE(PS1f, intBitsToFloat(uf_remappedPS[4].x));
tempResultf = max(0.0, R124f.x);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0f = tempResultf;
// 23
R2f.w = mul_nonIEEE(PS0f, intBitsToFloat(uf_remappedPS[4].y));
tempResultf = max(0.0, R127f.y);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1f = tempResultf;
// 24
R3f.y = mul_nonIEEE(PS1f, intBitsToFloat(uf_remappedPS[4].z));
tempResultf = max(0.0, R2f.z);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0f = tempResultf;
// 25
R7f.y = mul_nonIEEE(PS0f, intBitsToFloat(uf_remappedPS[4].x));
tempResultf = max(0.0, R127f.z);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1f = tempResultf;
// 26
R5f.w = mul_nonIEEE(PS1f, intBitsToFloat(uf_remappedPS[4].y));
tempResultf = max(0.0, R127f.w);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0f = tempResultf;
// 27
R3f.w = mul_nonIEEE(PS0f, intBitsToFloat(uf_remappedPS[4].z));
tempResultf = max(0.0, R126f.w);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R8f.x = tempResultf;
// 0
R127f.w = mul_nonIEEE(R8f.x, intBitsToFloat(uf_remappedPS[4].x));
tempResultf = max(0.0, R6f.z);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0f = tempResultf;
// 1
R125f.y = mul_nonIEEE(PS0f, intBitsToFloat(uf_remappedPS[4].y));
tempResultf = max(0.0, R1f.y);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1f = tempResultf;
// 2
R124f.w = mul_nonIEEE(PS1f, intBitsToFloat(uf_remappedPS[4].z));
tempResultf = max(0.0, R1f.w);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0f = tempResultf;
// 3
R125f.w = mul_nonIEEE(PS0f, intBitsToFloat(uf_remappedPS[4].x));
tempResultf = max(0.0, R0f.x);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1f = tempResultf;
// 4
R0f.x = mul_nonIEEE(PS1f, intBitsToFloat(uf_remappedPS[4].y));
tempResultf = max(0.0, R9f.z);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0f = tempResultf;
// 5
R126f.y = mul_nonIEEE(PS0f, intBitsToFloat(uf_remappedPS[4].z));
tempResultf = max(0.0, R0f.y);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1f = tempResultf;
// 6
R124f.y = mul_nonIEEE(PS1f, intBitsToFloat(uf_remappedPS[4].x));
tempResultf = max(0.0, R5f.x);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0f = tempResultf;
// 7
backupReg0f = R0f.w;
R0f.w = mul_nonIEEE(PS0f, intBitsToFloat(uf_remappedPS[4].y));
tempResultf = max(0.0, backupReg0f);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1f = tempResultf;
// 8
R0f.y = mul_nonIEEE(PS1f, intBitsToFloat(uf_remappedPS[4].z));
tempResultf = max(0.0, R8f.z);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0f = tempResultf;
// 9
backupReg0f = R4f.y;
R4f.y = mul_nonIEEE(PS0f, intBitsToFloat(uf_remappedPS[4].x));
tempResultf = max(0.0, backupReg0f);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1f = tempResultf;
// 10
backupReg0f = R7f.w;
R7f.w = mul_nonIEEE(PS1f, intBitsToFloat(uf_remappedPS[4].y));
tempResultf = max(0.0, backupReg0f);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0f = tempResultf;
// 11
R1f.w = mul_nonIEEE(PS0f, intBitsToFloat(uf_remappedPS[4].z));
tempResultf = max(0.0, R5f.z);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1f = tempResultf;
// 12
R6f.z = mul_nonIEEE(PS1f, intBitsToFloat(uf_remappedPS[4].x));
tempResultf = max(0.0, R5f.y);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0f = tempResultf;
// 13
R8f.x = mul_nonIEEE(PS0f, intBitsToFloat(uf_remappedPS[4].y));
tempResultf = max(0.0, R6f.x);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1f = tempResultf;
// 14
R2f.z = mul_nonIEEE(PS1f, intBitsToFloat(uf_remappedPS[4].z));
R124f.x = exp2(R8f.w);
// 15
R127f.y = exp2(R7f.x);
// 16
R127f.z = exp2(R6f.y);
// 17
backupReg0f = R127f.z;
R127f.x = dot(vec4(R124f.x,R127f.y,backupReg0f,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),intBitsToFloat(0x3dea4a8c),0.0));
PV1fy = R127f.x;
PV1fz = R127f.x;
PV1fw = R127f.x;
R126f.x = exp2(R2f.y);
// 18
PV0fy = R127f.z + -(R127f.x);
PV0fz = R127f.y + -(R127f.x);
PV0fw = R124f.x + -(R127f.x);
R127f.y = exp2(R2f.w);
// 19
backupReg0f = R127f.x;
R127f.x = mul_nonIEEE(PV0fw,intBitsToFloat(uf_remappedPS[5].x)) + backupReg0f;
R127f.x = clamp(R127f.x, 0.0, 1.0);
R124f.z = mul_nonIEEE(PV0fy,intBitsToFloat(uf_remappedPS[5].x)) + backupReg0f;
R124f.z = clamp(R124f.z, 0.0, 1.0);
R126f.w = mul_nonIEEE(PV0fz,intBitsToFloat(uf_remappedPS[5].x)) + backupReg0f;
R126f.w = clamp(R126f.w, 0.0, 1.0);
R127f.z = exp2(R3f.y);
// 20
R124f.x = dot(vec4(R126f.x,R127f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),intBitsToFloat(0x3dea4a8c),0.0));
PV0fy = R124f.x;
PV0fz = R124f.x;
PV0fw = R124f.x;
R125f.x = exp2(R7f.y);
// 21
R4f.x = R127f.x + -(0.5);
PV1fy = R127f.z + -(R124f.x);
PV1fz = R127f.y + -(R124f.x);
PV1fw = R126f.x + -(R124f.x);
R127f.y = exp2(R5f.w);
// 22
backupReg0f = R124f.x;
R124f.x = mul_nonIEEE(PV1fw,intBitsToFloat(uf_remappedPS[5].x)) + backupReg0f;
R124f.x = clamp(R124f.x, 0.0, 1.0);
R6f.y = R126f.w + -(0.5);
R125f.z = mul_nonIEEE(PV1fy,intBitsToFloat(uf_remappedPS[5].x)) + backupReg0f;
R125f.z = clamp(R125f.z, 0.0, 1.0);
R126f.w = mul_nonIEEE(PV1fz,intBitsToFloat(uf_remappedPS[5].x)) + backupReg0f;
R126f.w = clamp(R126f.w, 0.0, 1.0);
R127f.z = exp2(R3f.w);
// 23
tempf.x = dot(vec4(R125f.x,R127f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),intBitsToFloat(0x3dea4a8c),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
R126f.z = tempf.x;
PV1fw = tempf.x;
R127f.x = exp2(R127f.w);
// 24
PV0fx = R127f.y + -(PV1fx);
PV0fy = R125f.x + -(PV1fx);
R7f.z = R124f.z + -(0.5);
PV0fw = R127f.z + -(PV1fx);
R127f.y = exp2(R125f.y);
// 25
R5f.x = mul_nonIEEE(PV0fw,intBitsToFloat(uf_remappedPS[5].x)) + R126f.z;
R5f.x = clamp(R5f.x, 0.0, 1.0);
R3f.y = mul_nonIEEE(PV0fx,intBitsToFloat(uf_remappedPS[5].x)) + R126f.z;
R3f.y = clamp(R3f.y, 0.0, 1.0);
R8f.z = mul_nonIEEE(PV0fy,intBitsToFloat(uf_remappedPS[5].x)) + R126f.z;
R8f.z = clamp(R8f.z, 0.0, 1.0);
R3f.w = R124f.x + -(0.5);
R126f.z = exp2(R124f.w);
// 26
tempf.x = dot(vec4(R127f.x,R127f.y,R126f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),intBitsToFloat(0x3dea4a8c),0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
R127f.z = tempf.x;
PV0fw = tempf.x;
R7f.x = exp2(R125f.w);
// 27
PV1fx = R127f.y + -(PV0fx);
PV1fy = R127f.x + -(PV0fx);
R10f.z = R126f.w + -(0.5);
PV1fw = R126f.z + -(PV0fx);
R7f.y = exp2(R0f.x);
// 28
R1f.x = mul_nonIEEE(PV1fw,intBitsToFloat(uf_remappedPS[5].x)) + R127f.z;
R1f.x = clamp(R1f.x, 0.0, 1.0);
R2f.y = mul_nonIEEE(PV1fx,intBitsToFloat(uf_remappedPS[5].x)) + R127f.z;
R2f.y = clamp(R2f.y, 0.0, 1.0);
R9f.z = mul_nonIEEE(PV1fy,intBitsToFloat(uf_remappedPS[5].x)) + R127f.z;
R9f.z = clamp(R9f.z, 0.0, 1.0);
R5f.w = R125f.z + -(0.5);
R5f.z = exp2(R126f.y);
// 29
R0f.x = dot(vec4(R7f.x,R7f.y,R5f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),intBitsToFloat(0x3dea4a8c),0.0));
PV1fy = R0f.x;
PV1fz = R0f.x;
PV1fw = R0f.x;
R6f.x = exp2(R124f.y);
// 0
backupReg0f = R7f.x;
R7f.x = R8f.z + -(0.5);
PV0fy = R5f.z + -(R0f.x);
PV0fz = R7f.y + -(R0f.x);
PV0fw = backupReg0f + -(R0f.x);
R124f.y = exp2(R0f.w);
// 1
R125f.x = mul_nonIEEE(PV0fw,intBitsToFloat(uf_remappedPS[5].x)) + R0f.x;
R125f.x = clamp(R125f.x, 0.0, 1.0);
R125f.y = R3f.y + -(0.5);
R126f.z = mul_nonIEEE(PV0fy,intBitsToFloat(uf_remappedPS[5].x)) + R0f.x;
R126f.z = clamp(R126f.z, 0.0, 1.0);
R126f.w = mul_nonIEEE(PV0fz,intBitsToFloat(uf_remappedPS[5].x)) + R0f.x;
R126f.w = clamp(R126f.w, 0.0, 1.0);
R127f.z = exp2(R0f.y);
// 2
backupReg0f = R127f.z;
R127f.x = dot(vec4(R6f.x,R124f.y,backupReg0f,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),intBitsToFloat(0x3dea4a8c),0.0));
PV0fy = R127f.x;
PV0fz = R127f.x;
PV0fw = R127f.x;
R124f.x = exp2(R4f.y);
// 3
R5f.x = R5f.x + -(0.5);
PV1fy = R127f.z + -(R127f.x);
PV1fz = R124f.y + -(R127f.x);
PV1fw = R6f.x + -(R127f.x);
R124f.y = exp2(R7f.w);
// 4
R126f.x = mul_nonIEEE(PV1fw,intBitsToFloat(uf_remappedPS[5].x)) + R127f.x;
R126f.x = clamp(R126f.x, 0.0, 1.0);
R4f.y = R9f.z + -(0.5);
R124f.z = mul_nonIEEE(PV1fy,intBitsToFloat(uf_remappedPS[5].x)) + R127f.x;
R124f.z = clamp(R124f.z, 0.0, 1.0);
R125f.w = mul_nonIEEE(PV1fz,intBitsToFloat(uf_remappedPS[5].x)) + R127f.x;
R125f.w = clamp(R125f.w, 0.0, 1.0);
R127f.z = exp2(R1f.w);
// 5
tempf.x = dot(vec4(R124f.x,R124f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),intBitsToFloat(0x3dea4a8c),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
R125f.z = tempf.x;
PV1fw = tempf.x;
R127f.x = exp2(R6f.z);
// 6
PV0fx = R124f.y + -(PV1fx);
PV0fy = R124f.x + -(PV1fx);
R6f.z = R2f.y + -(0.5);
PV0fw = R127f.z + -(PV1fx);
R124f.y = exp2(R8f.x);
// 7
R124f.x = mul_nonIEEE(PV0fw,intBitsToFloat(uf_remappedPS[5].x)) + R125f.z;
R124f.x = clamp(R124f.x, 0.0, 1.0);
R127f.y = mul_nonIEEE(PV0fx,intBitsToFloat(uf_remappedPS[5].x)) + R125f.z;
R127f.y = clamp(R127f.y, 0.0, 1.0);
R127f.z = mul_nonIEEE(PV0fy,intBitsToFloat(uf_remappedPS[5].x)) + R125f.z;
R127f.z = clamp(R127f.z, 0.0, 1.0);
R124f.w = R1f.x + -(0.5);
R125f.z = exp2(R2f.z);
// 8
tempf.x = dot(vec4(R127f.x,R124f.y,R125f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),intBitsToFloat(0x3dea4a8c),0.0));
PV0fx = tempf.x;
R126f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R2f.y = R125f.x + -(0.5);
// 9
backupReg0f = R124f.y;
PV1fx = R127f.x + -(PV0fx);
R124f.y = R126f.w + -(0.5);
PV1fz = R125f.z + -(PV0fx);
PV1fw = backupReg0f + -(PV0fx);
R126f.w = R126f.z + -(0.5);
// 10
backupReg0f = R126f.x;
backupReg1f = R125f.w;
R126f.x = mul_nonIEEE(PV1fw,intBitsToFloat(uf_remappedPS[5].x)) + R126f.y;
R126f.x = clamp(R126f.x, 0.0, 1.0);
R123f.y = mul_nonIEEE(PV1fx,intBitsToFloat(uf_remappedPS[5].x)) + R126f.y;
R123f.y = clamp(R123f.y, 0.0, 1.0);
R126f.z = backupReg0f + -(0.5);
R125f.w = mul_nonIEEE(PV1fz,intBitsToFloat(uf_remappedPS[5].x)) + R126f.y;
R125f.w = clamp(R125f.w, 0.0, 1.0);
R127f.x = backupReg1f + -(0.5);
// 11
backupReg0f = R124f.x;
backupReg1f = R127f.y;
R124f.x = R127f.z + -(0.5);
R127f.y = backupReg0f + -(0.5);
R127f.z = backupReg1f + -(0.5);
R127f.w = R124f.z + -(0.5);
R124f.z = R123f.y + -(0.5);
// 12
backupReg0f = R126f.x;
R126f.x = R125f.w + -(0.5);
R126f.y = backupReg0f + -(0.5);
R125f.z = mul_nonIEEE(R4f.x,intBitsToFloat(uf_remappedPS[6].x)) + intBitsToFloat(uf_remappedPS[7].x);
R125f.w = mul_nonIEEE(R6f.y,intBitsToFloat(uf_remappedPS[6].x)) + intBitsToFloat(uf_remappedPS[7].x);
R125f.x = mul_nonIEEE(R7f.z,intBitsToFloat(uf_remappedPS[6].x)) + intBitsToFloat(uf_remappedPS[7].x);
// 13
backupReg0f = R7f.x;
backupReg1f = R125f.y;
R7f.x = mul_nonIEEE(R5f.w,intBitsToFloat(uf_remappedPS[6].x)) + intBitsToFloat(uf_remappedPS[7].x);
R125f.y = mul_nonIEEE(R10f.z,intBitsToFloat(uf_remappedPS[6].x)) + intBitsToFloat(uf_remappedPS[7].x);
R10f.z = mul_nonIEEE(R3f.w,intBitsToFloat(uf_remappedPS[6].x)) + intBitsToFloat(uf_remappedPS[7].x);
R3f.w = mul_nonIEEE(backupReg0f,intBitsToFloat(uf_remappedPS[6].x)) + intBitsToFloat(uf_remappedPS[7].x);
R5f.w = mul_nonIEEE(backupReg1f,intBitsToFloat(uf_remappedPS[6].x)) + intBitsToFloat(uf_remappedPS[7].x);
// 14
backupReg0f = R5f.x;
backupReg1f = R6f.z;
backupReg2f = R2f.y;
R5f.x = mul_nonIEEE(R4f.y,intBitsToFloat(uf_remappedPS[6].x)) + intBitsToFloat(uf_remappedPS[7].x);
R2f.y = mul_nonIEEE(R124f.w,intBitsToFloat(uf_remappedPS[6].x)) + intBitsToFloat(uf_remappedPS[7].x);
R6f.z = mul_nonIEEE(backupReg0f,intBitsToFloat(uf_remappedPS[6].x)) + intBitsToFloat(uf_remappedPS[7].x);
R124f.w = mul_nonIEEE(backupReg1f,intBitsToFloat(uf_remappedPS[6].x)) + intBitsToFloat(uf_remappedPS[7].x);
R7f.z = mul_nonIEEE(backupReg2f,intBitsToFloat(uf_remappedPS[6].x)) + intBitsToFloat(uf_remappedPS[7].x);
// 15
backupReg0f = R127f.x;
backupReg1f = R127f.w;
R127f.x = mul_nonIEEE(R126f.w,intBitsToFloat(uf_remappedPS[6].x)) + intBitsToFloat(uf_remappedPS[7].x);
R124f.y = mul_nonIEEE(R124f.y,intBitsToFloat(uf_remappedPS[6].x)) + intBitsToFloat(uf_remappedPS[7].x);
R126f.z = mul_nonIEEE(R126f.z,intBitsToFloat(uf_remappedPS[6].x)) + intBitsToFloat(uf_remappedPS[7].x);
R127f.w = mul_nonIEEE(backupReg0f,intBitsToFloat(uf_remappedPS[6].x)) + intBitsToFloat(uf_remappedPS[7].x);
R4f.x = mul_nonIEEE(backupReg1f,intBitsToFloat(uf_remappedPS[6].x)) + intBitsToFloat(uf_remappedPS[7].x);
// 16
backupReg0f = R127f.y;
backupReg1f = R127f.z;
R124f.x = mul_nonIEEE(R124f.x,intBitsToFloat(uf_remappedPS[6].x)) + intBitsToFloat(uf_remappedPS[7].x);
R127f.y = mul_nonIEEE(R124f.z,intBitsToFloat(uf_remappedPS[6].x)) + intBitsToFloat(uf_remappedPS[7].x);
R127f.z = mul_nonIEEE(backupReg0f,intBitsToFloat(uf_remappedPS[6].x)) + intBitsToFloat(uf_remappedPS[7].x);
R126f.w = mul_nonIEEE(backupReg1f,intBitsToFloat(uf_remappedPS[6].x)) + intBitsToFloat(uf_remappedPS[7].x);
R124f.z = mul_nonIEEE(R126f.y,intBitsToFloat(uf_remappedPS[6].x)) + intBitsToFloat(uf_remappedPS[7].x);
// 17
R126f.y = mul_nonIEEE(R126f.x,intBitsToFloat(uf_remappedPS[6].x)) + intBitsToFloat(uf_remappedPS[7].x);
// 18
backupReg0f = R125f.x;
backupReg1f = R125f.z;
backupReg2f = R125f.y;
R125f.x = mul_nonIEEE(R10f.z, intBitsToFloat(uf_remappedPS[8].x));
R125f.x = clamp(R125f.x, 0.0, 1.0);
R125f.y = mul_nonIEEE(backupReg0f, intBitsToFloat(uf_remappedPS[8].z));
R125f.y = clamp(R125f.y, 0.0, 1.0);
R125f.z = mul_nonIEEE(R125f.w, intBitsToFloat(uf_remappedPS[8].y));
R125f.z = clamp(R125f.z, 0.0, 1.0);
R125f.w = mul_nonIEEE(backupReg1f, intBitsToFloat(uf_remappedPS[8].x));
R125f.w = clamp(R125f.w, 0.0, 1.0);
R10f.z = mul_nonIEEE(backupReg2f, intBitsToFloat(uf_remappedPS[8].y));
R10f.z = clamp(R10f.z, 0.0, 1.0);
// 19
backupReg0f = R6f.z;
backupReg1f = R5f.x;
R5f.x = mul_nonIEEE(R3f.w, intBitsToFloat(uf_remappedPS[8].x));
R5f.x = clamp(R5f.x, 0.0, 1.0);
R4f.y = mul_nonIEEE(R7f.x, intBitsToFloat(uf_remappedPS[8].z));
R4f.y = clamp(R4f.y, 0.0, 1.0);
R6f.z = mul_nonIEEE(R5f.w, intBitsToFloat(uf_remappedPS[8].y));
R6f.z = clamp(R6f.z, 0.0, 1.0);
R3f.w = mul_nonIEEE(backupReg0f, intBitsToFloat(uf_remappedPS[8].z));
R3f.w = clamp(R3f.w, 0.0, 1.0);
R6f.y = mul_nonIEEE(backupReg1f, intBitsToFloat(uf_remappedPS[8].x));
R6f.y = clamp(R6f.y, 0.0, 1.0);
// 20
backupReg0f = R2f.y;
R7f.x = mul_nonIEEE(R124f.w, intBitsToFloat(uf_remappedPS[8].y));
R7f.x = clamp(R7f.x, 0.0, 1.0);
R2f.y = mul_nonIEEE(R7f.z, intBitsToFloat(uf_remappedPS[8].x));
R2f.y = clamp(R2f.y, 0.0, 1.0);
R7f.z = mul_nonIEEE(R124f.y, intBitsToFloat(uf_remappedPS[8].y));
R7f.z = clamp(R7f.z, 0.0, 1.0);
R5f.w = mul_nonIEEE(backupReg0f, intBitsToFloat(uf_remappedPS[8].z));
R5f.w = clamp(R5f.w, 0.0, 1.0);
R0f.y = mul_nonIEEE(R127f.x, intBitsToFloat(uf_remappedPS[8].z));
R0f.y = clamp(R0f.y, 0.0, 1.0);
// 21
backupReg0f = R4f.x;
R4f.x = mul_nonIEEE(R124f.x, intBitsToFloat(uf_remappedPS[8].x));
R4f.x = clamp(R4f.x, 0.0, 1.0);
R3f.y = mul_nonIEEE(backupReg0f, intBitsToFloat(uf_remappedPS[8].z));
R3f.y = clamp(R3f.y, 0.0, 1.0);
R2f.z = mul_nonIEEE(R127f.w, intBitsToFloat(uf_remappedPS[8].y));
R2f.z = clamp(R2f.z, 0.0, 1.0);
R1f.w = mul_nonIEEE(R126f.z, intBitsToFloat(uf_remappedPS[8].x));
R1f.w = clamp(R1f.w, 0.0, 1.0);
R1f.x = mul_nonIEEE(R126f.w, intBitsToFloat(uf_remappedPS[8].y));
R1f.x = clamp(R1f.x, 0.0, 1.0);
// 22
R8f.x = mul_nonIEEE(R127f.y, intBitsToFloat(uf_remappedPS[8].x));
R8f.x = clamp(R8f.x, 0.0, 1.0);
R7f.y = mul_nonIEEE(R124f.z, intBitsToFloat(uf_remappedPS[8].y));
R7f.y = clamp(R7f.y, 0.0, 1.0);
R9f.z = mul_nonIEEE(R126f.y, intBitsToFloat(uf_remappedPS[8].z));
R9f.z = clamp(R9f.z, 0.0, 1.0);
R7f.w = mul_nonIEEE(R127f.z, intBitsToFloat(uf_remappedPS[8].z));
R7f.w = clamp(R7f.w, 0.0, 1.0);
R0f.w = -(R9f.w) + R125f.w;
// 23
backupReg0f = R4f.y;
R6f.x = -(R8f.y) + R10f.z;
R4f.y = -(R9f.w) + R125f.y;
R10f.z = -(R9f.w) + R125f.z;
R2f.w = -(R8f.y) + R125f.x;
R5f.y = -(R8f.y) + backupReg0f;
// 0
R125f.x = -(R12f.z) + R6f.z;
R125f.y = -(R12f.z) + R5f.x;
R125f.z = -(R10f.w) + R6f.y;
R125f.w = -(R12f.z) + R3f.w;
R124f.x = -(R10f.w) + R7f.x;
// 1
R127f.x = -(R9f.x) + R2f.y;
R127f.y = -(R9f.x) + R0f.y;
R127f.z = -(R9f.x) + R7f.z;
R127f.w = -(R10f.w) + R5f.w;
R126f.w = -(R9f.y) + R1f.w;
// 2
R126f.x = -(R11f.w) + R4f.x;
R126f.y = -(R9f.y) + R3f.y;
R124f.z = -(R9f.y) + R2f.z;
R124f.w = -(R11f.w) + R1f.x;
R7f.w = -(R11f.w) + R7f.w;
// 3
R8f.x = -(R10f.x) + R8f.x;
R124f.y = mul_nonIEEE(R0f.w,intBitsToFloat(uf_remappedPS[9].y)) + R9f.w;
R126f.z = -(R10f.x) + R9f.z;
R0f.w = -(R10f.x) + R7f.y;
R1f.w = mul_nonIEEE(R10f.z,intBitsToFloat(uf_remappedPS[9].y)) + R9f.w;
// 4
backupReg0f = R4f.y;
backupReg1f = R125f.x;
R125f.x = mul_nonIEEE(R2f.w,intBitsToFloat(uf_remappedPS[9].y)) + R8f.y;
R4f.y = mul_nonIEEE(R5f.y,intBitsToFloat(uf_remappedPS[9].y)) + R8f.y;
R9f.z = mul_nonIEEE(backupReg0f,intBitsToFloat(uf_remappedPS[9].y)) + R9f.w;
R2f.w = mul_nonIEEE(R6f.x,intBitsToFloat(uf_remappedPS[9].y)) + R8f.y;
R5f.y = mul_nonIEEE(backupReg1f,intBitsToFloat(uf_remappedPS[9].y)) + R12f.z;
// 5
backupReg0f = R124f.x;
backupReg1f = R125f.y;
backupReg2f = R127f.w;
R124f.x = mul_nonIEEE(R125f.z,intBitsToFloat(uf_remappedPS[9].y)) + R10f.w;
R125f.y = mul_nonIEEE(backupReg0f,intBitsToFloat(uf_remappedPS[9].y)) + R10f.w;
R125f.z = mul_nonIEEE(backupReg1f,intBitsToFloat(uf_remappedPS[9].y)) + R12f.z;
R127f.w = mul_nonIEEE(R125f.w,intBitsToFloat(uf_remappedPS[9].y)) + R12f.z;
R125f.w = mul_nonIEEE(backupReg2f,intBitsToFloat(uf_remappedPS[9].y)) + R10f.w;
// 6
backupReg0f = R127f.y;
backupReg1f = R127f.z;
R127f.x = mul_nonIEEE(R127f.x,intBitsToFloat(uf_remappedPS[9].y)) + R9f.x;
R127f.y = mul_nonIEEE(R126f.w,intBitsToFloat(uf_remappedPS[9].y)) + R9f.y;
R127f.z = mul_nonIEEE(backupReg0f,intBitsToFloat(uf_remappedPS[9].y)) + R9f.x;
R126f.w = mul_nonIEEE(backupReg1f,intBitsToFloat(uf_remappedPS[9].y)) + R9f.x;
R10f.w = mul_nonIEEE(R124f.z,intBitsToFloat(uf_remappedPS[9].y)) + R9f.y;
// 7
backupReg0f = R126f.x;
backupReg1f = R126f.y;
R126f.x = mul_nonIEEE(R7f.w,intBitsToFloat(uf_remappedPS[9].y)) + R11f.w;
R126f.y = mul_nonIEEE(R124f.w,intBitsToFloat(uf_remappedPS[9].y)) + R11f.w;
R124f.z = mul_nonIEEE(backupReg0f,intBitsToFloat(uf_remappedPS[9].y)) + R11f.w;
R124f.w = mul_nonIEEE(backupReg1f,intBitsToFloat(uf_remappedPS[9].y)) + R9f.y;
R9f.y = mul_nonIEEE(R8f.x,intBitsToFloat(uf_remappedPS[9].y)) + R10f.x;
// 8
backupReg0f = R10f.x;
R10f.x = mul_nonIEEE(R0f.w,intBitsToFloat(uf_remappedPS[9].y)) + backupReg0f;
R12f.y = mul_nonIEEE(R1f.w, intBitsToFloat(uf_remappedPS[9].z));
R12f.y = clamp(R12f.y, 0.0, 1.0);
R12f.z = mul_nonIEEE(R9f.z, intBitsToFloat(uf_remappedPS[9].z));
R12f.z = clamp(R12f.z, 0.0, 1.0);
R0f.w = mul_nonIEEE(R126f.z,intBitsToFloat(uf_remappedPS[9].y)) + backupReg0f;
R12f.x = mul_nonIEEE(R124f.y, intBitsToFloat(uf_remappedPS[9].z));
R12f.x = clamp(R12f.x, 0.0, 1.0);
// 9
R8f.x = mul_nonIEEE(R125f.x, intBitsToFloat(uf_remappedPS[9].z));
R8f.x = clamp(R8f.x, 0.0, 1.0);
R8f.y = mul_nonIEEE(R2f.w, intBitsToFloat(uf_remappedPS[9].z));
R8f.y = clamp(R8f.y, 0.0, 1.0);
R8f.z = mul_nonIEEE(R4f.y, intBitsToFloat(uf_remappedPS[9].z));
R8f.z = clamp(R8f.z, 0.0, 1.0);
R1f.w = mul_nonIEEE(R125f.z, intBitsToFloat(uf_remappedPS[9].z));
R1f.w = clamp(R1f.w, 0.0, 1.0);
R1f.y = mul_nonIEEE(R5f.y, intBitsToFloat(uf_remappedPS[9].z));
R1f.y = clamp(R1f.y, 0.0, 1.0);
// 10
R5f.x = mul_nonIEEE(R124f.x, intBitsToFloat(uf_remappedPS[9].z));
R5f.x = clamp(R5f.x, 0.0, 1.0);
R5f.y = mul_nonIEEE(R125f.y, intBitsToFloat(uf_remappedPS[9].z));
R5f.y = clamp(R5f.y, 0.0, 1.0);
R1f.z = mul_nonIEEE(R127f.w, intBitsToFloat(uf_remappedPS[9].z));
R1f.z = clamp(R1f.z, 0.0, 1.0);
R5f.w = mul_nonIEEE(R125f.w, intBitsToFloat(uf_remappedPS[9].z));
R5f.w = clamp(R5f.w, 0.0, 1.0);
R4f.x = mul_nonIEEE(R127f.x, intBitsToFloat(uf_remappedPS[9].z));
R4f.x = clamp(R4f.x, 0.0, 1.0);
// 11
R2f.x = mul_nonIEEE(R127f.y, intBitsToFloat(uf_remappedPS[9].z));
R2f.x = clamp(R2f.x, 0.0, 1.0);
R4f.y = mul_nonIEEE(R126f.w, intBitsToFloat(uf_remappedPS[9].z));
R4f.y = clamp(R4f.y, 0.0, 1.0);
R4f.z = mul_nonIEEE(R127f.z, intBitsToFloat(uf_remappedPS[9].z));
R4f.z = clamp(R4f.z, 0.0, 1.0);
R2f.w = mul_nonIEEE(R10f.w, intBitsToFloat(uf_remappedPS[9].z));
R2f.w = clamp(R2f.w, 0.0, 1.0);
R2f.z = mul_nonIEEE(R124f.w, intBitsToFloat(uf_remappedPS[9].z));
R2f.z = clamp(R2f.z, 0.0, 1.0);
// 12
backupReg0f = R10f.x;
R10f.x = mul_nonIEEE(R124f.z, intBitsToFloat(uf_remappedPS[9].z));
R10f.x = clamp(R10f.x, 0.0, 1.0);
R10f.y = mul_nonIEEE(R126f.y, intBitsToFloat(uf_remappedPS[9].z));
R10f.y = clamp(R10f.y, 0.0, 1.0);
R10f.z = mul_nonIEEE(R126f.x, intBitsToFloat(uf_remappedPS[9].z));
R10f.z = clamp(R10f.z, 0.0, 1.0);
R9f.w = mul_nonIEEE(R9f.y, intBitsToFloat(uf_remappedPS[9].z));
R9f.w = clamp(R9f.w, 0.0, 1.0);
R9f.y = mul_nonIEEE(backupReg0f, intBitsToFloat(uf_remappedPS[9].z));
R9f.y = clamp(R9f.y, 0.0, 1.0);
// 13
R9f.z = mul_nonIEEE(R0f.w, intBitsToFloat(uf_remappedPS[9].z));
R9f.z = clamp(R9f.z, 0.0, 1.0);
// 14
R20f.x = R9f.w;
R20f.y = R9f.y;
R20f.z = R9f.z;
R20f.w = R9f.w;
// 15
R19f.x = R10f.x;
R19f.y = R10f.y;
R19f.z = R10f.z;
R19f.w = R10f.w;
// 16
R18f.x = R2f.x;
R18f.y = R2f.w;
R18f.z = R2f.z;
R18f.w = R2f.w;
// 17
R17f.x = R4f.x;
R17f.y = R4f.y;
R17f.z = R4f.z;
R17f.w = R4f.w;
// 18
R16f.x = R5f.x;
R16f.y = R5f.y;
R16f.z = R5f.w;
R16f.w = R5f.w;
// 19
R15f.x = R1f.w;
R15f.y = R1f.y;
R15f.z = R1f.z;
R15f.w = R1f.w;
// 20
R14f.x = R8f.x;
R14f.y = R8f.y;
R14f.z = R8f.z;
R14f.w = R8f.w;
// 21
R13f.x = R12f.x;
R13f.y = R12f.y;
R13f.z = R12f.z;
R13f.w = R12f.w;
// export
passPixelColor0 = vec4(R13f.x, R13f.y, R13f.z, R13f.w);
passPixelColor1 = vec4(R14f.x, R14f.y, R14f.z, R14f.w);
passPixelColor2 = vec4(R15f.x, R15f.y, R15f.z, R15f.w);
passPixelColor3 = vec4(R16f.x, R16f.y, R16f.z, R16f.w);
passPixelColor4 = vec4(R17f.x, R17f.y, R17f.z, R17f.w);
passPixelColor5 = vec4(R18f.x, R18f.y, R18f.z, R18f.w);
passPixelColor6 = vec4(R19f.x, R19f.y, R19f.z, R19f.w);
passPixelColor7 = vec4(R20f.x, R20f.y, R20f.z, R20f.w);
}
