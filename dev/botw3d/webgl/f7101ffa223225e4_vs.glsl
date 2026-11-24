#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader f7101ffa223225e4
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
UNIFORM_BUFFER_LAYOUT(6, 0, 2) uniform uniformBlockVS6
{
vec4 uf_blockVS6[19];
};


UNIFORM_BUFFER_LAYOUT(7, 0, 3) uniform uniformBlockVS7
{
vec4 uf_blockVS7[4096];
};


UNIFORM_BUFFER_LAYOUT(8, 0, 4) uniform uniformBlockVS8
{
vec4 uf_blockVS8[7];
};


UNIFORM_BUFFER_LAYOUT(11, 0, 5) uniform uniformBlockVS11
{
vec4 uf_blockVS11[4];
};


UNIFORM_BUFFER_LAYOUT(13, 0, 6) uniform uniformBlockVS13
{
vec4 uf_blockVS13[39];
};


UNIFORM_BUFFER_LAYOUT(14, 0, 7) uniform uniformBlockVS14
{
vec4 uf_blockVS14[2];
};


TEXTURE_LAYOUT(40, 0, 0) uniform sampler2D textureUnitVS8;
TEXTURE_LAYOUT(45, 0, 1) uniform sampler2D textureUnitVS13;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem2;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem3;
ATTR_LAYOUT(0, 4) in uvec4 attrDataSem4;
ATTR_LAYOUT(0, 5) in uvec4 attrDataSem5;
ATTR_LAYOUT(0, 6) in uvec4 attrDataSem6;
ATTR_LAYOUT(0, 7) in uvec4 attrDataSem7;

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem3;
out vec4 passParameterSem8;
out vec4 passParameterSem11;
out vec4 passParameterSem14;
out vec4 passParameterSem15;
out vec4 passParameterSem16;
out vec4 passParameterSem4;
out vec4 passParameterSem9;
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
ivec4 R0i = ivec4(0);
ivec4 R1i = ivec4(0);
ivec4 R2i = ivec4(0);
ivec4 R3i = ivec4(0);
ivec4 R4i = ivec4(0);
ivec4 R5i = ivec4(0);
ivec4 R6i = ivec4(0);
ivec4 R7i = ivec4(0);
ivec4 R8i = ivec4(0);
ivec4 R9i = ivec4(0);
ivec4 R10i = ivec4(0);
ivec4 R11i = ivec4(0);
ivec4 R12i = ivec4(0);
ivec4 R13i = ivec4(0);
ivec4 R14i = ivec4(0);
ivec4 R15i = ivec4(0);
ivec4 R16i = ivec4(0);
ivec4 R17i = ivec4(0);
ivec4 R18i = ivec4(0);
ivec4 R19i = ivec4(0);
ivec4 R20i = ivec4(0);
ivec4 R21i = ivec4(0);
ivec4 R22i = ivec4(0);
ivec4 R23i = ivec4(0);
ivec4 R24i = ivec4(0);
ivec4 R122i = ivec4(0);
ivec4 R123i = ivec4(0);
ivec4 R124i = ivec4(0);
ivec4 R125i = ivec4(0);
ivec4 R126i = ivec4(0);
ivec4 R127i = ivec4(0);
uvec4 attrDecoder;
int backupReg0i, backupReg1i, backupReg2i, backupReg3i, backupReg4i;
int PV0ix = 0, PV0iy = 0, PV0iz = 0, PV0iw = 0, PV1ix = 0, PV1iy = 0, PV1iz = 0, PV1iw = 0;
int PS0i = 0, PS1i = 0;
ivec4 tempi = ivec4(0);
float tempResultf;
int tempResulti;
ivec4 ARi = ivec4(0);
bool predResult = true;
bool activeMaskStack[4];
bool activeMaskStackC[5];
activeMaskStack[0] = false;
activeMaskStack[1] = false;
activeMaskStack[2] = false;
activeMaskStackC[0] = false;
activeMaskStackC[1] = false;
activeMaskStackC[2] = false;
activeMaskStackC[3] = false;
activeMaskStack[0] = true;
activeMaskStackC[0] = true;
activeMaskStackC[1] = true;
R0i = ivec4(gl_VertexID, 0, 0, gl_InstanceID);
attrDecoder = attrDataSem5;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem3;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem4;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem7;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem6;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem0;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem1;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem2;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R10i.y = floatBitsToInt(-(intBitsToFloat(R5i.w)) + uf_blockVS8[2].x);
R0i.w = 0;
R1i.w = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R10i.y));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R17i.x = 0;
R17i.y = 0;
R17i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R18i.x = 0;
// 1
R2i.w = R1i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R2i.w = R0i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R2i.w == 0);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
PS0i = int(intBitsToFloat(R4i.w));
// 1
R0i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R10i.y) >= intBitsToFloat(R0i.z));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R17i.x = 0;
R17i.y = 0;
R17i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R18i.x = 0;
// 1
R0i.w = R1i.w;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R0i.w == 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R127i.x = R1i.y;
R0i.y = R2i.x;
R8i.z = R3i.x;
R127i.w = R2i.y;
R127i.z = R3i.y;
// 1
R126i.x = R1i.z;
R127i.y = R2i.z;
R126i.z = R3i.z;
R10i.x = int(intBitsToFloat(R6i.w));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R0i.y),intBitsToFloat(R8i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R0i.y),intBitsToFloat(R8i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.w),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.w),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R8i.z = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R9i.z = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 5
R10i.z = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 6
predResult = (intBitsToFloat(R8i.z) > 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R8i.z));
// 1
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R127i.y)));
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R127i.y)));
// 2
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R15i.x = 0;
// 1
R13i.x = R15i.x;
// 2
R11i.x = R15i.x;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (intBitsToFloat(R9i.z) > 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R9i.z));
// 1
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R127i.x)));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R127i.x)));
// 2
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R13i.y = 0;
R11i.y = 0;
// 1
R15i.y = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (intBitsToFloat(R10i.z) > 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R10i.z));
// 1
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R127i.x)));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R127i.x)));
// 2
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R13i.z = 0;
R11i.z = 0;
// 1
R15i.z = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt((uf_blockVS7[9].x > 0.0)?1.0:0.0);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), uf_blockVS7[10].y));
PV0iz = floatBitsToInt(max(intBitsToFloat(R7i.x), 0.0));
PV0iw = floatBitsToInt((0.0 > uf_blockVS7[9].x)?1.0:0.0);
PS0i = floatBitsToInt(1.0 / uf_blockVS7[9].x);
// 1
R127i.x = floatBitsToInt(-(uf_blockVS7[96].w) + uf_blockVS7[97].w);
R126i.y = floatBitsToInt(min(intBitsToFloat(PV0iz), 0.0));
R127i.z = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(intBitsToFloat(R10i.y) * intBitsToFloat(PS0i));
R14i.x = floatBitsToInt(1.0 / intBitsToFloat(R0i.z));
// 2
backupReg0i = R127i.y;
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R127i.y = floatBitsToInt(-(uf_blockVS7[96].x) + uf_blockVS7[97].x);
PV0iz = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV1iw));
R10i.w = floatBitsToInt(intBitsToFloat(R10i.y) * intBitsToFloat(R14i.x));
R125i.y = floatBitsToInt(-(uf_blockVS7[96].y) + uf_blockVS7[97].y);
// 3
R0i.x = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(R126i.y));
PV1iy = floatBitsToInt(fract(intBitsToFloat(PV0iz)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(PV0ix)));
R1i.w = floatBitsToInt(-(uf_blockVS7[12].x) + 1.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 4
R127i.x = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV1iy)));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS1i));
R9i.z = ((uf_blockVS7[12].x == 1.0)?-1:0);
// 5
PV1iw = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV0iy));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + -(uf_blockVS7[97].w));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(uf_blockVS7[96].w));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R127i.z)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R127i.x)));
R127i.z = ((intBitsToFloat(PV0ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.w = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 8
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
R126i.z = floatBitsToInt(uf_blockVS7[96].x + intBitsToFloat(PV1ix));
R126i.w = floatBitsToInt(uf_blockVS7[96].y + intBitsToFloat(PV1iy));
R125i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[97].x, intBitsToFloat(R127i.z)));
// 9
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].x, intBitsToFloat(PV0iy)));
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].y, intBitsToFloat(PV0iy)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0ix)));
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[97].y, intBitsToFloat(R127i.z)));
// 10
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV1iz)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV1iz)));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R127i.y));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(R127i.x));
// 12
PV0iy = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(PV1iw));
// 13
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PV0iy)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iz)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), uf_blockVS8[3].y));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), uf_blockVS8[3].y));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), uf_blockVS8[3].z));
// 1
R0i.z = floatBitsToInt(uf_blockVS8[2].w + intBitsToFloat(R10i.y));
// 2
predResult = (R9i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R0i.z)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].w, intBitsToFloat(PV0ix)));
// 2
R8i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].x, intBitsToFloat(PV1iw)));
R8i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].y, intBitsToFloat(PV1iw)));
R8i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].z, intBitsToFloat(PV1iw)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
tempResultf = max(0.0, abs(uf_blockVS7[12].x));
tempResultf = log2(tempResultf);
PS0i = floatBitsToInt(tempResultf);
// 1
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f317218));
tempResultf = max(0.0, uf_blockVS7[12].x);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PS1i)));
R127i.y = ((uf_blockVS7[12].x == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R1i.w));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R0i.z) + -(intBitsToFloat(PV1iz)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].w, intBitsToFloat(PV1ix)));
// 9
R8i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].x, intBitsToFloat(PV0iw)));
R8i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].y, intBitsToFloat(PV0iw)));
R8i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].z, intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
tempResultf = max(0.0, uf_blockVS7[12].x);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PS0i)));
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R1i.w));
// 2
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iw)));
// 3
PV1iy = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
// 4
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(R127i.x));
// 5
R123i.z = ((R9i.z == 0)?(PV0iw):(R0i.z));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R123i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R123i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R123i.z)));
// 7
R19i.x = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(PV0iy));
R12i.y = floatBitsToInt(intBitsToFloat(R8i.y) + intBitsToFloat(PV0ix));
R0i.z = floatBitsToInt(intBitsToFloat(R8i.z) + intBitsToFloat(PV0iw));
// 8
predResult = (R9i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(R10i.y)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].w, intBitsToFloat(PV0ix)));
// 2
R16i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].x, intBitsToFloat(PV1iw)));
R16i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].y, intBitsToFloat(PV1iw)));
R16i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].z, intBitsToFloat(PV1iw)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
tempResultf = max(0.0, abs(uf_blockVS7[12].x));
tempResultf = log2(tempResultf);
PS0i = floatBitsToInt(tempResultf);
// 1
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f317218));
tempResultf = max(0.0, uf_blockVS7[12].x);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(PS1i)));
R127i.y = ((uf_blockVS7[12].x == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R1i.w));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R10i.y) + -(intBitsToFloat(PV1iz)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].w, intBitsToFloat(PV1ix)));
// 9
R16i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].x, intBitsToFloat(PV0iw)));
R16i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].y, intBitsToFloat(PV0iw)));
R16i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].z, intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = 0x3f800000;
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(R0i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(R12i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(R19i.x)));
R0i.w = floatBitsToInt(uf_blockVS8[4].w);
// 1
R127i.x = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV0iw));
R127i.y = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV0iz));
R127i.z = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(PV0iy));
R2i.w = floatBitsToInt(uf_blockVS8[5].w);
R3i.w = floatBitsToInt(uf_blockVS8[6].w);
// 2
R12i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R126i.x))));
PV0iy = R12i.x;
PV0iz = R12i.x;
PV0iw = R12i.x;
R126i.y = floatBitsToInt(uf_blockVS7[5].x) & 0x20000;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R126i.x))));
PV1ix = tempi.x;
R14i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x10000;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R126i.x))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R4i.z = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(float(R126i.y));
// 5
PV1ix = floatBitsToInt(uf_blockVS7[5].x) & 0x40000;
R127i.y = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(R7i.z));
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(float(R126i.z));
// 6
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
R126i.z = R7i.z;
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) * 2.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PS0i = floatBitsToInt(float(PV1ix));
// 7
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
R127i.w = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(R7i.y));
R127i.x = int(intBitsToFloat(PV0iy));
// 8
R126i.x = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.y) * 0.5);
R127i.z = R7i.y;
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 2.0);
PV0iw = 0 - R127i.x;
R127i.y = int(intBitsToFloat(PV1iz));
// 9
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(R7i.z));
PV1iy = floatBitsToInt(floor(intBitsToFloat(R126i.z)));
R126i.z = max(backupReg0i, PV0iw);
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 0.5);
R3i.y = floatBitsToInt(intBitsToFloat(PV0iy) + -(0.5));
R3i.y = floatBitsToInt(intBitsToFloat(R3i.y) * 2.0);
// 10
PV0ix = 0 - R127i.y;
PV0iy = floatBitsToInt((intBitsToFloat(PV1iy) > 0.0)?1.0:0.0);
R127i.z = floatBitsToInt(floor(intBitsToFloat(R127i.z)));
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PV1iy))?1.0:0.0);
R126i.w = int(intBitsToFloat(R126i.x));
// 11
backupReg0i = R127i.w;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 0.5);
PV1iy = R7i.x;
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) * 2.0);
R125i.z = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iw)));
R127i.w = max(R127i.y, PV0ix);
R3i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + -(0.5));
R3i.z = floatBitsToInt(intBitsToFloat(R3i.z) * 2.0);
// 12
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(R127i.z))?1.0:0.0);
PV0iy = floatBitsToInt((intBitsToFloat(R127i.z) > 0.0)?1.0:0.0);
PV0iz = 0 - R126i.w;
R125i.w = floatBitsToInt(floor(intBitsToFloat(PV1iy)));
PS0i = floatBitsToInt(float(R126i.z));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 13
R2i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(R125i.z)));
PV1iy = max(R126i.w, PV0iz);
R2i.z = floatBitsToInt(intBitsToFloat(R127i.x) + -(0.5));
R2i.z = floatBitsToInt(intBitsToFloat(R2i.z) * 2.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(float(R127i.w));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 14
R1i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(PV1iw)));
R2i.y = floatBitsToInt(intBitsToFloat(R7i.y) + -(0.5));
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(R125i.w))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(R125i.w) > 0.0)?1.0:0.0);
R127i.x = floatBitsToInt(float(PV1iy));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
// 15
R4i.x = floatBitsToInt(intBitsToFloat(R7i.z) + -(0.5));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(uf_blockVS7[13].y);
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) / 2.0);
R4i.w = floatBitsToInt(intBitsToFloat(R7i.x) + -(0.5));
PS1i = floatBitsToInt(uf_blockVS7[13].x);
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 16
PV0ix = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(PV1iz));
PV0iy = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PS1i));
R1i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.x)), intBitsToFloat(PV1iy)));
R3i.w = floatBitsToInt(intBitsToFloat(R6i.z) * 1.0);
tempResultf = max(0.0, uf_blockVS7[12].x);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 17
backupReg0i = R0i.x;
backupReg1i = R0i.y;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), intBitsToFloat(PV0ix)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iy)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(PS0i)));
R0i.w = ((intBitsToFloat(0x3a83126f) > intBitsToFloat(R10i.y))?-1:0);
R9i.x = floatBitsToInt(1.0 / intBitsToFloat(backupReg1i));
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),0.0)));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iz)));
// 19
PV1ix = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R8i.y = (R10i.x == 0x3)?-1:0;
PV1iz = (R10i.x == int(1))?-1:0;
R2i.w = (R10i.x == 0x2)?-1:0;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R1i.w));
// 20
R8i.x = ((PV1iz == 0)?(0x3f800000):(0xbf800000));
R4i.y = ((PV1iz == 0)?(0xbf800000):(0xbf800000));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(PS1i));
tempResultf = 1.0 / sqrt(intBitsToFloat(R127i.y));
PS0i = floatBitsToInt(tempResultf);
// 21
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PS0i)));
R123i.y = ((R9i.z == 0)?(PV0iz):(R10i.y));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PS0i)));
R9i.w = floatBitsToInt(1.0 / uf_blockVS8[2].w);
// 22
backupReg0i = R5i.y;
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R123i.y)));
R5i.y = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3a83126f));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R123i.y)));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R123i.y)));
R8i.w = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3a83126f));
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(-(intBitsToFloat(R12i.x)) + uf_blockVS6[17].x);
R1i.y = floatBitsToInt(intBitsToFloat(R16i.y) + intBitsToFloat(R5i.w));
R126i.z = floatBitsToInt(intBitsToFloat(R3i.x) * intBitsToFloat(0x3a83126f));
R124i.w = floatBitsToInt(-(intBitsToFloat(R4i.z)) + uf_blockVS6[17].z);
R1i.w = floatBitsToInt(intBitsToFloat(R16i.z) + intBitsToFloat(R5i.z));
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), uf_blockVS7[115].y));
R126i.y = floatBitsToInt(-(uf_blockVS7[114].w) + 1.0);
PV1iz = floatBitsToInt((0.0 > -(intBitsToFloat(R126i.x)))?1.0:0.0);
PV1iw = floatBitsToInt((-(intBitsToFloat(R126i.x)) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R124i.w));
// 2
R124i.x = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.x)) * intBitsToFloat(PS1i));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), uf_blockVS7[115].x));
R127i.w = ((uf_blockVS7[114].w == 1.0)?-1:0);
tempResultf = max(0.0, uf_blockVS7[114].w);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 3
PV1ix = floatBitsToInt((intBitsToFloat(PV0iy) > 0.0)?1.0:0.0);
R127i.y = floatBitsToInt(max(intBitsToFloat(PV0iy), -(intBitsToFloat(PV0iy))));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PV0iy))?1.0:0.0);
R125i.y = floatBitsToInt(uf_blockVS7[114].y + intBitsToFloat(R127i.x));
// 4
R127i.x = ((intBitsToFloat(R127i.y) > 1.0)?-1:0);
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), uf_blockVS7[115].z));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iw)));
R126i.w = floatBitsToInt(intBitsToFloat(R125i.z) + uf_blockVS7[114].x);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
R123i.x = ((R127i.x == 0)?(R127i.y):(PS0i));
R127i.y = floatBitsToInt(((R127i.x == 0)?(intBitsToFloat(PV0iz)):(-(intBitsToFloat(PV0iz)))));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3fc90fdb));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R2i.x)));
PS1i = floatBitsToInt(exp2(intBitsToFloat(R127i.z)));
// 6
backupReg0i = R127i.x;
R127i.x = ((-(intBitsToFloat(R126i.x)) == 0.0)?-1:0);
PV0iy = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
PV0iz = floatBitsToInt(min(intBitsToFloat(R123i.x), 1.0));
R5i.w = ((backupReg0i == 0)?(0):(PV1iz));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.y));
// 7
R126i.x = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(R125i.w));
R126i.y = floatBitsToInt(max(intBitsToFloat(PV0iz), -(1.0)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
PV1iw = ((0.0 > intBitsToFloat(R124i.w))?-1:0);
R125i.w = floatBitsToInt(uf_blockVS7[114].z + intBitsToFloat(R124i.y));
// 8
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R126i.y)));
R124i.y = ((R127i.w == 0)?(PV1iz):(R10i.y));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R1i.x)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), uf_blockVS7[113].y));
// 9
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R1i.z)));
R123i.y = floatBitsToInt(intBitsToFloat(0x3d6ee04d) * intBitsToFloat(R127i.x) + intBitsToFloat(0x3f43b24e));
R125i.z = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV0iw));
R123i.w = floatBitsToInt(intBitsToFloat(0x3edcf805) * intBitsToFloat(R127i.x) + 1.0);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), uf_blockVS7[113].x));
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R123i.y)) + 1.0);
PV0iy = floatBitsToInt(intBitsToFloat(R125i.y) + 0.0);
R127i.z = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R126i.y)), intBitsToFloat(R123i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R124i.y)));
R2i.y = ((intBitsToFloat(R124i.w) == 0.0)?-1:0);
// 11
PV1ix = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(R125i.x));
R3i.y = floatBitsToInt(intBitsToFloat(R124i.x) * intBitsToFloat(0x3fc90fdb));
R1i.z = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PV0iw));
R126i.w = floatBitsToInt(intBitsToFloat(R126i.w) + 0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.x));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R124i.y)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R124i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), uf_blockVS7[113].z));
R125i.y = floatBitsToInt(intBitsToFloat(R16i.x) + intBitsToFloat(R5i.x));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(R19i.x) + -(intBitsToFloat(R5i.y)));
R123i.y = ((intBitsToFloat(R126i.y) > 0.0)?(PV0iz):(floatBitsToInt(-(intBitsToFloat(PV0iz)))));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) + 0.0);
PV1iw = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV0ix));
R125i.x = floatBitsToInt(intBitsToFloat(R12i.y) + -(intBitsToFloat(R8i.w)));
// 14
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R123i.y)) + intBitsToFloat(R5i.w));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R124i.y));
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
R126i.w = floatBitsToInt(intBitsToFloat(R0i.z) + -(intBitsToFloat(R126i.z)));
R126i.z = ((R0i.w == 0)?(R125i.y):(PV1ix));
// 15
PV1ix = floatBitsToInt((intBitsToFloat(R127i.x) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(R127i.x))?1.0:0.0);
R127i.y = ((R0i.w == 0)?(R1i.y):(R125i.x));
// 16
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = ((R0i.w == 0)?(R1i.w):(R126i.w));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
R2i.x = floatBitsToInt(intBitsToFloat(R19i.x) + -(intBitsToFloat(R126i.z)));
// 17
backupReg0i = R127i.y;
PV1ix = floatBitsToInt(-(intBitsToFloat(R124i.x)) + intBitsToFloat(PV0iz));
R127i.y = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R8i.w = floatBitsToInt(intBitsToFloat(R12i.y) + -(intBitsToFloat(backupReg0i)));
R2i.z = floatBitsToInt(intBitsToFloat(R0i.z) + -(intBitsToFloat(R123i.y)));
// 18
R123i.x = ((R2i.w == 0)?(R8i.x):(0xbf800000));
R125i.y = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
R123i.z = ((R2i.w == 0)?(R4i.y):(0x3f800000));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3fc90fdb));
R0i.w = floatBitsToInt(cos((intBitsToFloat(R127i.y))/0.1591549367));
// 19
R8i.x = ((R8i.y == 0)?(R123i.x):(0x3f800000));
PV1iz = floatBitsToInt(intBitsToFloat(R127i.x) + -(intBitsToFloat(PV0iw)));
R2i.w = ((R8i.y == 0)?(R123i.z):(0x3f800000));
R4i.x = floatBitsToInt(sin((intBitsToFloat(R127i.y))/0.1591549367));
// 20
R123i.y = ((R124i.z == 0)?(PV1iz):(0x40490fdb));
R5i.x = floatBitsToInt(sin((intBitsToFloat(R125i.y))/0.1591549367));
// 21
R123i.x = ((R2i.y == 0)?(R123i.y):(R3i.y));
R2i.y = floatBitsToInt(-(intBitsToFloat(R5i.x)));
R1i.w = floatBitsToInt(cos((intBitsToFloat(R125i.y))/0.1591549367));
// 22
backupReg0i = R1i.w;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(backupReg0i)));
R1i.z = floatBitsToInt(intBitsToFloat(R1i.z) + -(intBitsToFloat(R123i.x)));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(backupReg0i)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),uf_blockVS11[0].x) + 0.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),uf_blockVS11[0].x) + 0.0);
R123i.z = floatBitsToInt(intBitsToFloat(R1i.z) * intBitsToFloat(0x3e22f983) + 0.5);
// 1
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
// 2
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 3
R126i.w = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 4
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),intBitsToFloat(R15i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R8i.w),intBitsToFloat(R2i.z),0.0)));
PV0iy = R126i.x;
PV0iz = R126i.x;
PV0iw = R126i.x;
PS0i = floatBitsToInt(sin((intBitsToFloat(R126i.w))/0.1591549367));
// 5
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R1i.w)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PS0i)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PS0i)));
R125i.y = floatBitsToInt(cos((intBitsToFloat(R126i.w))/0.1591549367));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R125i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R127i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R124i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R125i.y)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R3i.w)));
// 7
R124i.x = floatBitsToInt(-(intBitsToFloat(PV0ix)) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PV0iw)));
R126i.z = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0iz));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PV0ix)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R1i.w)));
// 8
backupReg0i = R127i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R3i.w)));
R127i.y = floatBitsToInt(intBitsToFloat(R124i.z) + intBitsToFloat(PV1iy));
R124i.z = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R3i.w)));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R2i.y)) + intBitsToFloat(R124i.y));
// 9
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R5i.w)) + intBitsToFloat(PV0iw));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R1i.x)) + intBitsToFloat(PV0ix));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) * 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R127i.z)) + intBitsToFloat(R122i.x));
R0i.x = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(R9i.w));
// 10
backupReg0i = R123i.y;
backupReg1i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R12i.x) + intBitsToFloat(R123i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R124i.z)) + intBitsToFloat(R123i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R127i.y)) + intBitsToFloat(backupReg0i));
PV0iw = floatBitsToInt(intBitsToFloat(backupReg1i) * 1.0);
PS0i = floatBitsToInt(intBitsToFloat(R124i.x) * 1.0);
// 11
backupReg0i = R123i.y;
backupReg1i = R126i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R2i.y)) + intBitsToFloat(PV0iw));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R1i.x)) + intBitsToFloat(PS0i));
R126i.z = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(backupReg0i));
R126i.w = floatBitsToInt(intBitsToFloat(R14i.y) + intBitsToFloat(R123i.z));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R5i.w)) + intBitsToFloat(backupReg1i));
// 12
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.x));
PV0iy = floatBitsToInt(-(intBitsToFloat(R14i.y)) + intBitsToFloat(R126i.w));
R24i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R124i.z)) + intBitsToFloat(R122i.x));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.y));
// 13
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(R9i.x));
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iw)), intBitsToFloat(PV1iw)));
PV0iz = ((0.0 > intBitsToFloat(PV1iw))?-1:0);
// 15
R123i.w = ((PV0iz == 0)?(PV0ix):(PV0iy));
// 16
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), uf_blockVS14[1].w));
// 17
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), uf_blockVS11[2].y));
// 18
PV0ix = floatBitsToInt(mul_nonIEEE(uf_blockVS14[1].x, intBitsToFloat(PV1iy)));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockVS14[1].z, intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS14[1].y, intBitsToFloat(PV1iy)));
// 19
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(PV0iz)));
// 20
R16i.x = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV1iy));
R16i.y = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV1ix));
R16i.z = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV1iw));
// 21
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R8i.w),intBitsToFloat(R2i.z),0.0)));
PV1ix = tempi.x;
R127i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R1i.x = floatBitsToInt(-(intBitsToFloat(R12i.x)) + intBitsToFloat(R16i.x));
// 22
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R8i.w),intBitsToFloat(R2i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R124i.z = tempi.x;
PV0iw = tempi.x;
R0i.y = floatBitsToInt(-(intBitsToFloat(R14i.y)) + intBitsToFloat(R16i.y));
// 23
R1i.y = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(R9i.w));
R0i.z = floatBitsToInt(-(intBitsToFloat(R4i.z)) + intBitsToFloat(R16i.z));
R1i.z = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(R9i.w));
// 24
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 25
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R124i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R124i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R126i.z = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 26
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R124i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R124i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R127i.z = tempi.x;
PV0iw = tempi.x;
R126i.w = ((intBitsToFloat(PS1i) > 0.0)?-1:0);
// 27
PS1i = floatBitsToInt(sqrt(intBitsToFloat(R126i.z)));
// 28
PV0ix = ((intBitsToFloat(PS1i) > 0.0)?-1:0);
tempResultf = 1.0 / sqrt(intBitsToFloat(R127i.z));
PS0i = floatBitsToInt(tempResultf);
// 29
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS0i)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(PS0i)));
R0i.w = ((R126i.w == 0)?(0):(PV0ix));
// 30
predResult = (R0i.w != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), uf_blockVS7[95].x));
// 1
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), uf_blockVS7[95].x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), uf_blockVS7[95].x));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PS1i)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.z)));
// 5
R16i.x = floatBitsToInt(intBitsToFloat(R16i.x) + intBitsToFloat(PV0iy));
R16i.y = floatBitsToInt(intBitsToFloat(R16i.y) + intBitsToFloat(PV0ix));
R16i.z = floatBitsToInt(intBitsToFloat(R16i.z) + intBitsToFloat(PV0iw));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), uf_blockVS7[13].z));
R3i.y = floatBitsToInt(uf_blockVS7[60].x);
R0i.z = floatBitsToInt(uf_blockVS7[60].y);
R0i.w = 0x3f800000;
R1i.w = 0x3f800000;
// 1
PV1iy = floatBitsToInt((uf_blockVS7[8].y > 0.0)?1.0:0.0);
R1i.z = floatBitsToInt(uf_blockVS7[60].z);
PV1iw = floatBitsToInt((0.0 > uf_blockVS7[8].y)?1.0:0.0);
// 2
R1i.x = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iw)));
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS6[8].x,uf_blockVS6[8].y,uf_blockVS6[8].z,uf_blockVS6[8].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R5i.w = tempi.x;
// 1
R9i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS6[9].x,uf_blockVS6[9].y,uf_blockVS6[9].z,uf_blockVS6[9].w)));
PV1iy = R9i.x;
PV1iz = R9i.x;
PV1iw = R9i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS6[11].x,uf_blockVS6[11].y,uf_blockVS6[11].z,uf_blockVS6[11].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R13i.z = tempi.x;
PV0iw = tempi.x;
// 3
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS6[0].x,uf_blockVS6[0].y,uf_blockVS6[0].z,uf_blockVS6[0].w)));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
R125i.w = PV0ix;
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) / 2.0);
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS6[1].x,uf_blockVS6[1].y,uf_blockVS6[1].z,uf_blockVS6[1].w)));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R9i.z = floatBitsToInt(intBitsToFloat(R13i.z) * 1.0);
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS6[2].x,uf_blockVS6[2].y,uf_blockVS6[2].z,uf_blockVS6[2].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R9i.y = floatBitsToInt(intBitsToFloat(R9i.x) * -(0.5) + intBitsToFloat(R125i.w));
// 6
R11i.x = floatBitsToInt(intBitsToFloat(R5i.w) * 0.5 + intBitsToFloat(R125i.w));
R1i.y = floatBitsToInt(-(intBitsToFloat(R1i.x)) + 1.0);
R127i.z = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV1ix));
R126i.w = floatBitsToInt(-(uf_blockVS7[68].x) + uf_blockVS7[69].x);
R8i.y = floatBitsToInt(1.0 / intBitsToFloat(R9i.z));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS6[3].x,uf_blockVS6[3].y,uf_blockVS6[3].z,uf_blockVS6[3].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R127i.w = tempi.x;
// 8
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(PV1ix)),vec4(uf_blockVS6[6].x,uf_blockVS6[6].y,uf_blockVS6[6].z,uf_blockVS6[6].w)));
PV0iy = R126i.x;
PV0iz = R126i.x;
PV0iw = R126i.x;
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w)),vec4(uf_blockVS6[7].x,uf_blockVS6[7].y,uf_blockVS6[7].z,uf_blockVS6[7].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 10
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R12i.x),intBitsToFloat(R14i.y),intBitsToFloat(R4i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS6[10].x,uf_blockVS6[10].y,uf_blockVS6[10].z,uf_blockVS6[10].w)));
PV0iy = R127i.x;
PV0iz = R127i.x;
PV0iw = R127i.x;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 11
PV1iy = floatBitsToInt(-(uf_blockVS7[68].w) + uf_blockVS7[69].w);
PV1iw = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(PS0i));
// 12
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.z), intBitsToFloat(PV1iw)));
R127i.w = floatBitsToInt(-(uf_blockVS7[69].x) + uf_blockVS7[70].x);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 13
R0i.x = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(-(uf_blockVS7[69].w) + uf_blockVS7[70].w);
R8i.z = floatBitsToInt(intBitsToFloat(R10i.x) * 0.5 + intBitsToFloat(R125i.w));
// 14
PV0ix = floatBitsToInt(intBitsToFloat(R8i.z) * intBitsToFloat(R8i.y));
R127i.z = floatBitsToInt(-(uf_blockVS7[70].x) + uf_blockVS7[71].x);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 15
R2i.y = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),uf_blockVS6[18].w) + -(uf_blockVS6[18].y));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R12i.x),intBitsToFloat(R14i.y),intBitsToFloat(R4i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS6[11].x,uf_blockVS6[11].y,uf_blockVS6[11].z,uf_blockVS6[11].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R123i.w));
// 17
PV1ix = PV0ix;
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) / 2.0);
R5i.y = floatBitsToInt(-(uf_blockVS6[18].z) * intBitsToFloat(PS0i));
R123i.z = floatBitsToInt(intBitsToFloat(R127i.x) * 0.0 + intBitsToFloat(PV0ix));
// 18
PV0iy = floatBitsToInt(-(uf_blockVS7[70].w) + uf_blockVS7[71].w);
R0i.w = floatBitsToInt(intBitsToFloat(R127i.x) * 0.5 + intBitsToFloat(PV1ix));
R0i.y = floatBitsToInt(1.0 / intBitsToFloat(R123i.z));
// 19
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 20
R2i.x = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS1i));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(uf_blockVS7[13].z, intBitsToFloat(R0i.w)));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[8].y);
// 1
PV1iy = floatBitsToInt(intBitsToFloat(R10i.y) * intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(R0i.y));
// 2
PV0ix = floatBitsToInt(uf_blockVS7[13].z + -(intBitsToFloat(PV1iw)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),uf_blockVS7[9].z) + intBitsToFloat(PV1iy));
// 3
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV1iz = floatBitsToInt(intBitsToFloat(R0i.w) + -(intBitsToFloat(PV0ix)));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(PV1iz));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockVS6[18].w, intBitsToFloat(PV0iy)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w),intBitsToFloat(R1i.y)) + intBitsToFloat(PV0ix));
// 6
PV0ix = floatBitsToInt(-(uf_blockVS6[18].y) + intBitsToFloat(PV1ix));
// 7
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 8
R4i.y = floatBitsToInt(-(uf_blockVS6[18].z) * intBitsToFloat(PS1i));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R0i.w) + -(uf_blockVS7[68].w));
PV0iy = floatBitsToInt(intBitsToFloat(R0i.w) + -(uf_blockVS7[69].w));
// 1
R127i.x = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.y = ((intBitsToFloat(PV0ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R0i.x)) + uf_blockVS7[68].x);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R2i.y)) + uf_blockVS7[69].x);
PS1i = ((intBitsToFloat(R7i.x) > 0.5)?-1:0);
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R0i.w) + -(uf_blockVS7[70].w));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
PV0iz = floatBitsToInt(intBitsToFloat(R0i.w) + -(uf_blockVS7[71].w));
PV0iw = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R0i.x = floatBitsToInt(((PS1i == 0)?(intBitsToFloat(R6i.x)):(-(intBitsToFloat(R6i.x)))));
// 3
backupReg0i = R127i.y;
R126i.x = ((intBitsToFloat(PV0ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.y = ((intBitsToFloat(PV0iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R2i.x)) + uf_blockVS7[70].x);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iw)));
PS1i = floatBitsToInt(mul_nonIEEE(uf_blockVS7[68].x, intBitsToFloat(PV0iy)));
// 4
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), uf_blockVS8[0].x));
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV1iw)) + intBitsToFloat(PS1i));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), uf_blockVS8[0].y));
// 5
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV0ix)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), uf_blockVS8[0].z));
R9i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), uf_blockVS7[59].x));
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), uf_blockVS7[59].x));
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV1iy)) + intBitsToFloat(R126i.w));
PV0iy = floatBitsToInt(uf_blockVS7[76].x);
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), uf_blockVS7[59].x));
PV0iw = floatBitsToInt(uf_blockVS7[76].y);
PS0i = ((intBitsToFloat(R7i.y) > 0.5)?-1:0);
// 7
PV1ix = floatBitsToInt(uf_blockVS7[76].z);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), uf_blockVS8[1].x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), uf_blockVS8[1].y));
R1i.z = floatBitsToInt(((PS0i == 0)?(intBitsToFloat(R6i.y)):(-(intBitsToFloat(R6i.y)))));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), uf_blockVS8[1].z));
R123i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[71].x,intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.z));
PV0iz = ((intBitsToFloat(R7i.z) > 0.5)?-1:0);
R126i.w = ((intBitsToFloat(R7i.w) > 0.5)?-1:0);
R125i.w = ((intBitsToFloat(R7i.y) > 0.5)?-1:0);
// 9
R12i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R126i.y)));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), uf_blockVS8[0].w));
R11i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(PV0ix)));
R8i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R127i.w)));
R3i.y = floatBitsToInt(((PV0iz == 0)?(intBitsToFloat(R6i.x)):(-(intBitsToFloat(R6i.x)))));
// 10
R2i.x = floatBitsToInt(((R125i.w == 0)?(intBitsToFloat(R6i.x)):(-(intBitsToFloat(R6i.x)))));
PV0iy = ((intBitsToFloat(R7i.z) > 0.5)?-1:0);
R0i.w = floatBitsToInt(((R126i.w == 0)?(intBitsToFloat(R6i.y)):(-(intBitsToFloat(R6i.y)))));
// 11
R0i.z = floatBitsToInt(((PV0iy == 0)?(intBitsToFloat(R6i.y)):(-(intBitsToFloat(R6i.y)))));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(uf_blockVS7[5].x) & 0x80000;
R2i.z = floatBitsToInt(uf_blockVS7[84].x);
// 1
PV1ix = floatBitsToInt(uf_blockVS7[5].x) & 0x100000;
PV1iy = (PV0ix == 0x80000)?-1:0;
PV1iw = floatBitsToInt(uf_blockVS7[5].x) & 0x200000;
// 2
PV0ix = (PV1iw == 0x200000)?-1:0;
PV0iy = floatBitsToInt(uf_blockVS7[5].x) & 0x400000;
R4i.z = ((PV1iy == 0)?(R6i.x):(R0i.x));
PV0iw = (PV1ix == 0x100000)?-1:0;
PS0i = floatBitsToInt(uf_blockVS7[5].x) & 0x800000;
// 3
PV1ix = (PS0i == 0x800000)?-1:0;
R1i.y = ((PV0iw == 0)?(R6i.y):(R1i.z));
PV1iz = (PV0iy == 0x400000)?-1:0;
R4i.w = ((PV0ix == 0)?(R6i.x):(R3i.y));
PS1i = floatBitsToInt(uf_blockVS7[5].x) & 0x1000000;
// 4
R8i.x = ((PV1iz == 0)?(R6i.y):(R0i.w));
PV0iy = floatBitsToInt(uf_blockVS7[5].y) & int(1);
R1i.z = ((PV1ix == 0)?(R6i.x):(R2i.x));
PV0iw = (PS1i == 0x1000000)?-1:0;
R3i.y = int(uf_blockVS7[26].x);
// 5
R2i.x = (int(1) != PV0iy)?-1:0;
R0i.y = ((PV0iw == 0)?(R6i.y):(R0i.z));
PV1iz = floatBitsToInt(uf_blockVS7[5].x) & 0x100;
R0i.w = int(uf_blockVS7[26].y);
// 6
PV0ix = floatBitsToInt(uf_blockVS7[5].x) & 0x200;
R0i.z = ((R2i.x == 0)?(R7i.x):(R7i.y));
PS0i = floatBitsToInt(float(PV1iz));
// 7
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PS1i = floatBitsToInt(float(PV0ix));
// 8
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
// 9
R6i.x = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iw)));
R126i.z = int(intBitsToFloat(PV0ix));
// 10
PV0iy = 0 - R126i.z;
// 11
R6i.w = max(R126i.z, PV0iy);
}
if( activeMaskStackC[3] == true ) {
// 0
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), uf_blockVS8[1].w));
// 1
PV1ix = floatBitsToInt(uf_blockVS7[5].x) & 0x400;
R126i.y = floatBitsToInt(uf_blockVS7[5].x) & 0x800;
R125i.z = int(-1) + R3i.y;
R126i.z = int(intBitsToFloat(R6i.x));
// 2
PV0iy = 0 - R126i.z;
R124i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x4000000;
PS0i = floatBitsToInt(float(PV1ix));
// 3
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R2i.w = max(R126i.z, PV0iy);
PS1i = floatBitsToInt(float(R126i.y));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R127i.x = floatBitsToInt(float(R3i.y));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iw)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R127i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(R127i.x)));
R126i.z = int(intBitsToFloat(PV0ix));
// 6
PV0ix = 0 - R126i.z;
PV0iy = floatBitsToInt(intBitsToFloat(R14i.x) * intBitsToFloat(PV1iz));
R127i.z = int(intBitsToFloat(PV1ix));
// 7
PV1iy = 0 - R127i.z;
R1i.w = max(R126i.z, PV0ix);
PS1i = int(intBitsToFloat(PV0iy));
// 8
R125i.w = max(R127i.z, PV1iy);
R125i.x = R6i.w * PS1i;
// 9
PS1i = floatBitsToInt(float(R0i.w));
// 10
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 11
PV1iy = floatBitsToInt(intBitsToFloat(R10i.y) * intBitsToFloat(PS0i));
R127i.z = floatBitsToInt(float(R3i.y));
// 12
R124i.y = floatBitsToInt(abs(intBitsToFloat(R127i.z)));
R127i.w = int(intBitsToFloat(PV1iy));
// 13
PS1i = floatBitsToInt(float(R127i.w));
// 14
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(PS1i));
R127i.y = floatBitsToInt(float(R127i.w));
// 15
R123i.y = ((intBitsToFloat(PV0iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.w = floatBitsToInt(abs(intBitsToFloat(R127i.y)));
R0i.w = floatBitsToInt(1.0 / abs(intBitsToFloat(R127i.z)));
// 16
PV0ix = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R127i.y)), intBitsToFloat(R0i.w)));
PS0i = int(intBitsToFloat(R123i.y));
// 17
R126i.x = int(1) - PS0i;
PV1iz = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
R124i.w = PS0i * R125i.z;
// 18
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iz)),intBitsToFloat(R124i.y)) + intBitsToFloat(R126i.w));
PS0i = floatBitsToInt(float(R124i.z));
// 19
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iy = floatBitsToInt((intBitsToFloat(R127i.x) >= abs(intBitsToFloat(R127i.z)))?1.0:0.0);
PV1iz = floatBitsToInt(-(abs(intBitsToFloat(R127i.z))) + intBitsToFloat(R127i.x));
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R125i.y = int(intBitsToFloat(R126i.y));
// 20
backupReg0i = R125i.w;
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1ix)));
R125i.w = ((intBitsToFloat(PV1iy) == 0.0)?(R127i.x):(PV1iz));
R124i.z = backupReg0i * R125i.y;
// 21
PV1ix = floatBitsToInt(abs(intBitsToFloat(R127i.z)) + intBitsToFloat(R125i.w));
R126i.y = int(intBitsToFloat(PV0iz));
// 22
R123i.z = ((-(intBitsToFloat(R125i.w)) > 0.0)?(PV1ix):(R125i.w));
PV0iw = 0 - R126i.y;
// 23
PV1ix = max(R126i.y, PV0iw);
R123i.y = ((-(intBitsToFloat(R127i.y)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.z)))):(R123i.z));
// 24
R123i.w = ((intBitsToFloat(R127i.z) == 0.0)?(R127i.y):(R123i.y));
PS0i = PV1ix * R125i.y;
// 25
R127i.x = R127i.w + PS0i;
PS1i = int(intBitsToFloat(R123i.w));
// 26
PS0i = R126i.x * PS1i;
// 27
PV1ix = PS0i + R124i.w;
R127i.y = R1i.w * R127i.x;
// 28
PS0i = R2i.w * PV1ix;
// 29
PV1iz = PS0i + R125i.x;
// 30
PV0iy = R127i.y + PV1iz;
// 31
PV1iw = R124i.z + PV0iy;
// 32
R127i.x = floatBitsToInt(float(PV1iw));
// 33
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), abs(intBitsToFloat(R127i.x))));
R124i.w = floatBitsToInt(abs(intBitsToFloat(R127i.x)));
// 34
PV0iy = floatBitsToInt(trunc(intBitsToFloat(PV1iz)));
// 35
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iy)),intBitsToFloat(R124i.y)) + intBitsToFloat(R124i.w));
// 36
PV0iy = floatBitsToInt((intBitsToFloat(R125i.x) >= abs(intBitsToFloat(R127i.z)))?1.0:0.0);
PV0iz = floatBitsToInt(-(abs(intBitsToFloat(R127i.z))) + intBitsToFloat(R125i.x));
// 37
R124i.w = ((intBitsToFloat(PV0iy) == 0.0)?(R125i.x):(PV0iz));
// 38
PV0ix = floatBitsToInt(abs(intBitsToFloat(R127i.z)) + intBitsToFloat(R124i.w));
// 39
R123i.z = ((-(intBitsToFloat(R124i.w)) > 0.0)?(PV0ix):(R124i.w));
// 40
R123i.y = ((-(intBitsToFloat(R127i.x)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.z)))):(R123i.z));
// 41
R123i.w = ((intBitsToFloat(R127i.z) == 0.0)?(R127i.x):(R123i.y));
// 42
R127i.x = int(intBitsToFloat(R123i.w));
// 43
R127i.z = floatBitsToInt(float(R127i.x));
// 44
PV0iy = floatBitsToInt((intBitsToFloat(R127i.z) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(R127i.z))?1.0:0.0);
R2i.y = floatBitsToInt(float(R127i.x));
// 45
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iw)));
R124i.z = floatBitsToInt(abs(intBitsToFloat(R2i.y)));
PV1iw = floatBitsToInt(abs(intBitsToFloat(R2i.y)) * 0.25);
// 46
PV0ix = floatBitsToInt(trunc(intBitsToFloat(PV1iw)));
R123i.z = floatBitsToInt(intBitsToFloat(PV1ix) * 0.5 + intBitsToFloat(R127i.z));
// 47
PV1ix = floatBitsToInt(intBitsToFloat(R123i.z) * 0.25);
R3i.y = floatBitsToInt(-(intBitsToFloat(PV0ix)) * 4.0 + intBitsToFloat(R124i.z));
// 48
R6i.x = floatBitsToInt((intBitsToFloat(R3i.y) >= 4.0)?1.0:0.0);
R6i.y = floatBitsToInt(trunc(intBitsToFloat(PV1ix)));
R0i.w = floatBitsToInt(intBitsToFloat(R3i.y) + -4.0);
}
if( activeMaskStackC[3] == true ) {
// 0
R124i.z = ((intBitsToFloat(R6i.x) == 0.0)?(R3i.y):(R0i.w));
PS0i = int(intBitsToFloat(R6i.y));
// 1
PV1iy = floatBitsToInt(intBitsToFloat(R124i.z) + 4.0);
R0i.z = PS0i + 0x1b;
PS1i = int(uf_blockVS7[48].z);
// 2
R123i.w = ((-(intBitsToFloat(R124i.z)) > 0.0)?(PV1iy):(R124i.z));
R124i.z = floatBitsToInt(float(PS1i));
// 3
R123i.x = ((-(intBitsToFloat(R2i.y)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.w)))):(R123i.w));
PV1iy = floatBitsToInt(-(abs(intBitsToFloat(R124i.z))) + 0.0);
PV1iw = floatBitsToInt((0.0 >= abs(intBitsToFloat(R124i.z)))?1.0:0.0);
// 4
R127i.x = ((intBitsToFloat(PV1iw) == 0.0)?(0):(PV1iy));
PS0i = int(intBitsToFloat(R123i.x));
// 5
R125i.x = 0xfffffffd + PS0i;
PV1iy = int(-1) + PS0i;
PV1iz = floatBitsToInt(abs(intBitsToFloat(R124i.z)) + intBitsToFloat(R127i.x));
R124i.w = 0xfffffffe + PS0i;
PS1i = floatBitsToInt(float(PS0i));
// 6
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R123i.y = ((-(intBitsToFloat(R127i.x)) > 0.0)?(PV1iz):(R127i.x));
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(PV1iy));
// 7
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0ix)));
R127i.w = ((intBitsToFloat(R124i.z) == 0.0)?(0):(R123i.y));
PS1i = floatBitsToInt(float(R124i.w));
// 8
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iy)));
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R124i.y = int(intBitsToFloat(PV1iz));
// 9
PV1ix = 0 - R124i.y;
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0ix)));
R124i.w = int(intBitsToFloat(PV0iy));
// 10
PV0ix = max(R124i.y, PV1ix);
PV0iy = 0 - R124i.w;
R127i.x = int(intBitsToFloat(PV1iw));
// 11
R1i.x = int(1) - PV0ix;
PV1iy = 0 - R127i.x;
PV1iz = max(R124i.w, PV0iy);
PS1i = floatBitsToInt(float(R125i.x));
// 12
R0i.x = int(1) - PV1iz;
PV0iy = max(R127i.x, PV1iy);
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R4i.x = int(intBitsToFloat(R127i.w));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iw)));
R0i.w = int(1) - PV0iy;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R124i.z));
// 14
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
R124i.z = int(intBitsToFloat(PV1ix));
// 15
PV1iy = 0 - R124i.z;
PV1iw = floatBitsToInt(trunc(intBitsToFloat(PV0iy)));
R2i.z = floatBitsToInt(1.0 / uf_blockVS7[48].z);
// 16
PV0iw = max(R124i.z, PV1iy);
R5i.x = int(intBitsToFloat(PV1iw));
// 17
R6i.x = int(1) - PV0iw;
}
if( activeMaskStackC[3] == true ) {
R3i.xyzw = floatBitsToInt(uf_blockVS7[R0i.z].xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), uf_blockVS7[45].y));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].x, intBitsToFloat(R2i.z)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), uf_blockVS7[45].x));
R124i.z = floatBitsToInt(intBitsToFloat(R124i.z) * 2.0);
R124i.w = floatBitsToInt(intBitsToFloat(R4i.z) + 0.5);
R127i.z = R6i.x * R3i.w;
// 1
R125i.x = ((R2i.x == 0)?(0):(int(1)));
PV1iy = floatBitsToInt(uf_blockVS7[44].z + uf_blockVS7[45].x);
PV1iz = floatBitsToInt(uf_blockVS7[44].w + uf_blockVS7[45].y);
R126i.w = floatBitsToInt(intBitsToFloat(R1i.y) + -(0.5));
R124i.y = R0i.w * R3i.z;
// 2
PV0ix = floatBitsToInt(uf_blockVS7[46].x + uf_blockVS7[46].z);
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(uf_blockVS7[46].y + uf_blockVS7[46].w);
PV0iw = floatBitsToInt(-(intBitsToFloat(R124i.z)) + intBitsToFloat(PV1iy));
R127i.w = R0i.x * R3i.y;
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),uf_blockVS7[46].z) + intBitsToFloat(PV0ix));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),uf_blockVS7[46].w) + intBitsToFloat(PV0iz));
R124i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R10i.y)),uf_blockVS7[44].x) + -(intBitsToFloat(PV0iw)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),uf_blockVS7[44].y) + intBitsToFloat(PV0iy));
PS1i = R1i.x * R3i.x;
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),uf_blockVS7[45].z) + intBitsToFloat(R123i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),uf_blockVS7[45].w) + intBitsToFloat(R123i.y));
PV0iz = R127i.w + PS1i;
R3i.w = (R125i.x == int(1))?-1:0;
PS0i = floatBitsToInt(1.0 / uf_blockVS7[48].w);
// 5
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].y, intBitsToFloat(PS0i)));
PV1iy = R124i.y + PV0iz;
R125i.z = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R127i.w = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
PS1i = floatBitsToInt(float(R4i.x));
// 6
PV0ix = (R125i.x == 0x2)?-1:0;
R124i.y = ((R3i.w == 0)?(R7i.x):(R7i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PS1i)) + intBitsToFloat(R124i.z));
R0i.w = R127i.z + PV1iy;
PS0i = floatBitsToInt(float(R5i.x));
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.x)),intBitsToFloat(PS0i)) + intBitsToFloat(R125i.w));
R123i.y = ((PV0ix == 0)?(R7i.x):(R7i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R124i.w)) + intBitsToFloat(R123i.z));
R123i.w = ((PV0ix == 0)?(R7i.y):(R7i.x));
R127i.z = ((R3i.w == 0)?(R7i.y):(R7i.z));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.x)),intBitsToFloat(R126i.w)) + -(intBitsToFloat(R123i.x)));
R3i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.z)),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.z));
R123i.z = ((R3i.w == 0)?(R123i.y):(R7i.y));
R123i.w = ((R3i.w == 0)?(R123i.w):(R7i.z));
PS0i = int(uf_blockVS7[53].z);
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockVS7[50].x, intBitsToFloat(R123i.z)));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[50].y, intBitsToFloat(R123i.w)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
PV1iz = floatBitsToInt(uf_blockVS7[49].z + uf_blockVS7[50].x);
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R125i.z)) + intBitsToFloat(R123i.x));
R124i.w = floatBitsToInt(float(PS0i));
// 10
PV0ix = floatBitsToInt(uf_blockVS7[49].w + uf_blockVS7[50].y);
R125i.y = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(PV1iz));
R124i.z = floatBitsToInt(abs(intBitsToFloat(R124i.w)));
R3i.w = floatBitsToInt(intBitsToFloat(R4i.w) + 0.5);
R127i.x = floatBitsToInt(float(R0i.w));
// 11
PV1ix = floatBitsToInt((intBitsToFloat(R127i.x) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(R127i.x))?1.0:0.0);
R125i.z = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(uf_blockVS7[51].x + uf_blockVS7[51].z);
R126i.z = floatBitsToInt(float(R0i.w));
// 12
R125i.x = floatBitsToInt(abs(intBitsToFloat(R126i.z)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iy)));
PV0iz = floatBitsToInt(uf_blockVS7[51].y + uf_blockVS7[51].w);
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[51].z,intBitsToFloat(R124i.y)) + intBitsToFloat(PV1iw));
PS0i = floatBitsToInt(1.0 / abs(intBitsToFloat(R124i.w)));
// 13
PV1ix = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R126i.z)), intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R10i.y)),uf_blockVS7[49].x) + -(intBitsToFloat(R125i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[51].w,intBitsToFloat(R127i.z)) + intBitsToFloat(PV0iz));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iy) * 0.5 + intBitsToFloat(R127i.x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R124i.w));
// 14
PV0ix = floatBitsToInt(trunc(intBitsToFloat(PV1ix)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),uf_blockVS7[49].y) + intBitsToFloat(R125i.z));
PV0iz = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(PS1i));
R125i.w = floatBitsToInt(intBitsToFloat(R8i.x) + -(0.5));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[53].z);
// 15
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(intBitsToFloat(R1i.z) + 0.5);
PV1iy = floatBitsToInt(trunc(intBitsToFloat(PV0iz)));
R1i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[53].x, intBitsToFloat(PS0i)));
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0ix)),intBitsToFloat(R124i.z)) + intBitsToFloat(backupReg0i));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[53].w);
// 16
PV0ix = floatBitsToInt(-(abs(intBitsToFloat(R124i.w))) + intBitsToFloat(R126i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),uf_blockVS7[50].z) + intBitsToFloat(R127i.w));
PV0iz = floatBitsToInt((intBitsToFloat(R126i.w) >= abs(intBitsToFloat(R124i.w)))?1.0:0.0);
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[53].y, intBitsToFloat(PS1i)));
PS0i = int(intBitsToFloat(PV1iy));
// 17
R5i.x = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R124i.y = ((intBitsToFloat(PV0iz) == 0.0)?(R126i.w):(PV0ix));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),uf_blockVS7[50].w) + intBitsToFloat(R127i.z));
R1i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[58].x, intBitsToFloat(R125i.x)));
PS1i = floatBitsToInt(float(PS0i));
// 18
PV0ix = floatBitsToInt(abs(intBitsToFloat(R124i.w)) + intBitsToFloat(R124i.y));
PV0iy = floatBitsToInt(intBitsToFloat(R0i.y) + -(0.5));
R127i.z = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)),intBitsToFloat(PS1i)) + intBitsToFloat(R125i.y));
R1i.x = floatBitsToInt(1.0 / uf_blockVS7[58].z);
// 19
R123i.x = ((-(intBitsToFloat(R124i.y)) > 0.0)?(PV0ix):(R124i.y));
R1i.y = floatBitsToInt(intBitsToFloat(R10i.w) + 0.0);
R2i.z = floatBitsToInt(mul_nonIEEE(-(uf_blockVS7[58].y), intBitsToFloat(PV0iy)));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)),intBitsToFloat(R125i.w)) + -(intBitsToFloat(R123i.w)));
R6i.w = floatBitsToInt(1.0 / uf_blockVS7[58].w);
// 20
R123i.x = ((-(intBitsToFloat(R126i.z)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.x)))):(R123i.x));
R124i.y = floatBitsToInt(intBitsToFloat(R4i.y) + -(uf_blockVS7[93].x));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.w));
PV0iw = floatBitsToInt(-(uf_blockVS7[93].x) + uf_blockVS7[93].y);
R7i.w = floatBitsToInt(intBitsToFloat(R1i.y) + -(uf_blockVS7[104].w));
// 21
R7i.x = floatBitsToInt(-(uf_blockVS7[104].x) + uf_blockVS7[105].x);
R123i.y = ((intBitsToFloat(R124i.w) == 0.0)?(R126i.z):(R123i.x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 22
R125i.x = floatBitsToInt(-(uf_blockVS7[104].w) + uf_blockVS7[105].w);
R3i.z = floatBitsToInt(intBitsToFloat(R124i.y) * intBitsToFloat(PS1i));
R3i.z = clampFI32(R3i.z);
PS0i = int(intBitsToFloat(R123i.y));
// 23
R4i.x = floatBitsToInt(intBitsToFloat(R1i.y) + -(uf_blockVS7[106].w));
R4i.z = floatBitsToInt(intBitsToFloat(R1i.y) + -(uf_blockVS7[105].w));
R0i.w = floatBitsToInt(-(uf_blockVS7[105].w) + uf_blockVS7[106].w);
PS1i = floatBitsToInt(float(PS0i));
// 24
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(PS1i)) + intBitsToFloat(R127i.y));
R0i.y = floatBitsToInt(-(uf_blockVS7[105].x) + uf_blockVS7[106].x);
R4i.y = floatBitsToInt(1.0 / intBitsToFloat(R125i.x));
}
if( activeMaskStackC[3] == true ) {
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(R3i.w)) + intBitsToFloat(R8i.x));
R127i.y = floatBitsToInt(-(uf_blockVS7[106].x) + uf_blockVS7[107].x);
PV0iw = floatBitsToInt(intBitsToFloat(R7i.x) * intBitsToFloat(R4i.y));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R0i.w));
// 1
R8i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.w)),intBitsToFloat(R5i.x)) + intBitsToFloat(R123i.x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(PV0iw)) + uf_blockVS7[104].x);
PV1iz = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(PS0i));
R124i.w = floatBitsToInt(intBitsToFloat(R1i.y) + -(uf_blockVS7[107].w));
R127i.z = ((intBitsToFloat(R7i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 2
R125i.x = ((intBitsToFloat(R4i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(PV1iz)) + uf_blockVS7[105].x);
R126i.z = ((intBitsToFloat(R4i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.w = floatBitsToInt(intBitsToFloat(R1i.y) + -(uf_blockVS7[108].w));
R127i.x = ((intBitsToFloat(R124i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 3
R126i.x = ((intBitsToFloat(R127i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iy = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
PV1iz = floatBitsToInt(-(uf_blockVS7[106].w) + uf_blockVS7[107].w);
PV1iw = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R124i.y = floatBitsToInt(-(intBitsToFloat(R125i.x)) + 1.0);
// 4
backupReg0i = R126i.z;
PV0ix = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
R125i.y = floatBitsToInt(-(uf_blockVS7[107].x) + uf_blockVS7[108].x);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PV1iw)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1iy)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
// 5
PV1ix = floatBitsToInt(-(uf_blockVS7[107].w) + uf_blockVS7[108].w);
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R124i.y)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS0i));
R125i.x = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
// 6
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(PV1iw)) + uf_blockVS7[106].x);
R127i.z = floatBitsToInt(intBitsToFloat(R1i.y) + -(uf_blockVS7[109].w));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 7
backupReg0i = R125i.y;
R127i.x = floatBitsToInt(-(uf_blockVS7[108].x) + uf_blockVS7[109].x);
R125i.y = ((intBitsToFloat(R127i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iz = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(PS0i));
R3i.w = 0;
// 8
PV0ix = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(PV1iz)) + uf_blockVS7[107].x);
R4i.w = floatBitsToInt(intBitsToFloat(R1i.y) + -(uf_blockVS7[110].w));
// 9
backupReg0i = R126i.x;
R126i.x = ((intBitsToFloat(R4i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iz = floatBitsToInt(-(uf_blockVS7[108].w) + uf_blockVS7[109].w);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(intBitsToFloat(R8i.z) * intBitsToFloat(R8i.z));
// 10
PV0ix = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
R127i.y = floatBitsToInt(-(uf_blockVS7[109].x) + uf_blockVS7[110].x);
R123i.z = floatBitsToInt((intBitsToFloat(R9i.y) * intBitsToFloat(R9i.y) + intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
// 11
backupReg0i = R125i.y;
PV1ix = floatBitsToInt(-(uf_blockVS7[109].w) + uf_blockVS7[110].w);
R125i.y = floatBitsToInt((intBitsToFloat(R11i.x) * intBitsToFloat(R11i.x) + intBitsToFloat(R123i.z)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS0i));
// 12
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV1iw)) + uf_blockVS7[108].x);
PV0iy = floatBitsToInt(intBitsToFloat(R1i.y) + -(uf_blockVS7[111].w));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 13
R127i.x = floatBitsToInt(-(uf_blockVS7[110].x) + uf_blockVS7[111].x);
R7i.y = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iz = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS0i));
R124i.w = 0;
tempResultf = 1.0 / sqrt(intBitsToFloat(R125i.y));
R127i.y = floatBitsToInt(tempResultf);
// 14
PV0ix = floatBitsToInt(-(intBitsToFloat(R7i.y)) + 1.0);
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV1iz)) + uf_blockVS7[109].x);
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockVS7[104].x, intBitsToFloat(R125i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(R127i.y)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(R127i.y)));
// 15
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R127i.y)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R124i.y)) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(-(uf_blockVS7[110].w) + uf_blockVS7[111].w);
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV0ix)));
// 16
R126i.x = floatBitsToInt(uf_blockVS6[0].y);
R127i.y = floatBitsToInt(uf_blockVS6[1].y);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R126i.z)) + intBitsToFloat(R123i.y));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
// 17
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R125i.w)) + intBitsToFloat(R123i.w));
PV1iz = floatBitsToInt(uf_blockVS6[2].y);
R125i.w = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS0i));
// 18
tempi.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R126i.x)),-(intBitsToFloat(R127i.y)),-(intBitsToFloat(PV1iz)),-(intBitsToFloat(R124i.w))),vec4(intBitsToFloat(R127i.w),intBitsToFloat(R125i.y),intBitsToFloat(R125i.x),intBitsToFloat(R125i.x))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R124i.z)) + intBitsToFloat(R123i.x));
// 19
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(R125i.w)) + uf_blockVS7[110].x);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R126i.w)) + intBitsToFloat(R122i.x));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(0x3edc28f6));
PV1iw = clampFI32(PV1iw);
// 20
backupReg0i = R125i.z;
R125i.x = floatBitsToInt(uf_blockVS6[17].x + -(intBitsToFloat(R16i.x)));
R127i.y = floatBitsToInt(uf_blockVS6[17].y + -(intBitsToFloat(R16i.y)));
R125i.z = floatBitsToInt(uf_blockVS6[17].z + -(intBitsToFloat(R16i.z)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(backupReg0i)) + intBitsToFloat(R123i.y));
tempResultf = max(0.0, intBitsToFloat(PV1iw));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R1i.z = floatBitsToInt(tempResultf);
// 21
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R7i.w)) + intBitsToFloat(R123i.w));
PS1i = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(R125i.z));
// 22
backupReg0i = R123i.x;
R123i.x = floatBitsToInt((intBitsToFloat(R127i.y) * intBitsToFloat(R127i.y) + intBitsToFloat(PS1i)));
R2i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[111].x,intBitsToFloat(R7i.y)) + intBitsToFloat(backupReg0i));
// 23
R123i.z = floatBitsToInt((intBitsToFloat(R125i.x) * intBitsToFloat(R125i.x) + intBitsToFloat(R123i.x)));
// 24
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.z));
PS0i = floatBitsToInt(tempResultf);
// 25
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PS0i)));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PS0i)));
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R7i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS13[28].x,uf_blockVS13[28].y,uf_blockVS13[28].z,0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
R125i.z = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
PV1iw = floatBitsToInt(min(uf_blockVS6[17].y, uf_blockVS13[27].z));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(uf_blockVS13[38].z, intBitsToFloat(R1i.z)));
PV0iy = floatBitsToInt(-(intBitsToFloat(R14i.y)) + intBitsToFloat(PV1iw));
R124i.z = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),uf_blockVS13[37].x) + -(uf_blockVS13[37].y));
R123i.w = clampFI32(R123i.w);
R122i.x = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS13[27].y,intBitsToFloat(PV0iy)) + uf_blockVS13[27].x);
R123i.x = clampFI32(R123i.x);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),uf_blockVS13[22].x) + -(uf_blockVS13[22].y));
R123i.y = clampFI32(R123i.y);
PV1iz = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R122i.x)) + intBitsToFloat(0xbe593484));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0ix = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R127i.y = floatBitsToInt(mul_nonIEEE(-(uf_blockVS13[38].w),intBitsToFloat(PS1i)) + 1.0);
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), uf_blockVS13[26].w));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R123i.w)) + intBitsToFloat(0x3fc90da4));
tempResultf = max(0.0, intBitsToFloat(PV1iz));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockVS13[38].x, intBitsToFloat(PS0i)));
R125i.y = floatBitsToInt(uf_blockVS13[28].y * 1.0 + intBitsToFloat(R5i.y));
PV1iw = floatBitsToInt(uf_blockVS13[28].y + 1.0);
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 6
R125i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS13[23].x, intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) * 1.5);
PV0iy = clampFI32(PV0iy);
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockVS13[23].y, intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
// 7
R126i.x = floatBitsToInt(intBitsToFloat(PV0iy) * 15.0);
PV1iz = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(R127i.y)));
R5i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
PS0i = floatBitsToInt(sqrt(intBitsToFloat(R124i.z)));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f22f983));
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), uf_blockVS13[25].w));
PS1i = floatBitsToInt(exp2(intBitsToFloat(R125i.x)));
// 10
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),-(intBitsToFloat(R126i.w))) + 1.0);
R123i.y = floatBitsToInt(mul_nonIEEE(-(uf_blockVS13[23].z),intBitsToFloat(PS1i)) + uf_blockVS13[23].z);
R123i.y = clampFI32(R123i.y);
PV0iz = floatBitsToInt(intBitsToFloat(R9i.y) * intBitsToFloat(R8i.y));
R4i.w = 0;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(R123i.y) + intBitsToFloat(0x80000000));
PV1ix = clampFI32(PV1ix);
R4i.y = ((0.0 >= intBitsToFloat(R3i.z))?-1:0);
PV1iz = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(-(intBitsToFloat(PV0iz)) + 1.0);
R6i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
// 12
R123i.x = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3f333333) + intBitsToFloat(0x3e19999a));
R123i.x = clampFI32(R123i.x);
PV0iy = floatBitsToInt(max(intBitsToFloat(PV1iz), intBitsToFloat(0x3e4ccccd)));
R4i.z = PV1ix;
R0i.w = PV1ix;
R8i.y = 0;
// 13
R7i.x = floatBitsToInt(min(intBitsToFloat(PV0iy), 1.0));
R7i.y = ((R4i.y == 0)?(R5i.w):(R8i.y));
PV1iz = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
R5i.w = 0;
R0i.x = 0;
// 14
R2i.x = R15i.x;
R1i.y = R12i.y;
R22i.z = R24i.z;
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + 2.5);
R15i.z = ((R4i.y == 0)?(R9i.x):(R5i.w));
// 15
R4i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3daaaaab));
R0i.y = ((R4i.y == 0)?(R10i.x):(R6i.z));
R16i.z = R13i.z;
R11i.w = ((R4i.y == 0)?(0):(0x3f800000));
R0i.z = R2i.y;
}
if( activeMaskStackC[3] == true ) {
R5i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y))).xyz);
R10i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.w))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R5i.x;
R5i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS11[2].w, uf_blockVS14[0].z));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R7i.x)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R7i.x)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R7i.x)));
R5i.y = R18i.z;
// 1
R123i.x = ((R4i.y == 0)?(0):(R7i.w));
R123i.y = ((R4i.y == 0)?(0):(R0i.w));
R123i.z = ((R4i.y == 0)?(0):(R1i.z));
R4i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS11[2].w, uf_blockVS14[0].w));
R125i.w = ((R4i.y == 0)?(0):(R126i.w));
// 2
R19i.x = ((R11i.w == 0)?(R7i.w):(R123i.x));
R19i.y = ((R11i.w == 0)?(R1i.z):(R123i.z));
R19i.z = ((R11i.w == 0)?(R0i.w):(R123i.y));
R123i.w = ((R4i.y == 0)?(0):(R124i.z));
R122i.x = ((R4i.y == 0)?(0):(R125i.y));
// 3
R20i.x = ((R11i.w == 0)?(R126i.w):(R125i.w));
R20i.y = ((R11i.w == 0)?(R124i.z):(R123i.w));
R20i.z = ((R11i.w == 0)?(R125i.y):(R122i.x));
R123i.w = ((R4i.y == 0)?(0):(R10i.x));
R125i.y = ((R4i.y == 0)?(0):(R10i.z));
// 4
R21i.x = ((R11i.w == 0)?(R10i.x):(R123i.w));
R123i.y = ((R4i.y == 0)?(0):(R3i.w));
R123i.z = ((R4i.y == 0)?(0):(R4i.z));
R123i.w = ((R4i.y == 0)?(0):(R10i.y));
R0i.w = ((R4i.y == 0)?(0):(R2i.x));
// 5
R21i.y = ((R11i.w == 0)?(R10i.y):(R123i.w));
R21i.z = ((R11i.w == 0)?(R10i.z):(R125i.y));
R19i.w = ((R11i.w == 0)?(R3i.w):(R123i.y));
R20i.w = ((R11i.w == 0)?(R4i.z):(R123i.z));
// 6
backupReg0i = R1i.y;
R123i.x = ((R4i.y == 0)?(0):(R10i.w));
R1i.y = ((R4i.y == 0)?(0):(R22i.z));
R4i.z = ((R4i.y == 0)?(0):(backupReg0i));
R7i.x = ((R4i.y == 0)?(0):(R2i.w));
// 7
R10i.y = ((R4i.y == 0)?(0):(R1i.z));
R21i.w = ((R11i.w == 0)?(R10i.w):(R123i.x));
R10i.w = floatBitsToInt(uf_blockVS11[3].w);
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[44].y,intBitsToFloat(R5i.x)) + intBitsToFloat(R3i.y));
R126i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[49].y,intBitsToFloat(R5i.x)) + intBitsToFloat(R8i.x));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockVS7[44].y, intBitsToFloat(R4i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[49].y, intBitsToFloat(R4i.w)));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), uf_blockVS7[54].y));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R10i.w)) + intBitsToFloat(R2i.w));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w),intBitsToFloat(PV0iw)) + intBitsToFloat(R7i.z));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), uf_blockVS7[54].y));
R2i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS8[3].x,intBitsToFloat(R3i.z)) + 0.0);
// 2
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R1i.w)) + intBitsToFloat(PV1ix));
R127i.y = ((R4i.y == 0)?(0):(R125i.y));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(PV1iw)));
R126i.w = ((R4i.y == 0)?(R2i.x):(R0i.x));
R124i.z = ((R4i.y == 0)?(0):(R126i.y));
// 3
backupReg0i = R2i.y;
R123i.x = ((R4i.y == 0)?(0):(R126i.x));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w),intBitsToFloat(R2i.z)) + intBitsToFloat(PV0iz));
R123i.z = ((R4i.y == 0)?(0):(R125i.z));
R123i.w = ((R4i.y == 0)?(0):(R1i.x));
R125i.w = ((R4i.y == 0)?(R18i.y):(backupReg0i));
// 4
R14i.x = ((R11i.w == 0)?(R1i.x):(R123i.w));
R22i.y = ((R11i.w == 0)?(R125i.y):(R127i.y));
R22i.z = ((R11i.w == 0)?(R126i.y):(R124i.z));
R22i.w = ((R11i.w == 0)?(R125i.z):(R123i.z));
R22i.x = ((R11i.w == 0)?(R126i.x):(R123i.x));
// 5
R123i.x = ((R4i.y == 0)?(R18i.x):(R0i.x));
R123i.y = R18i.z;
R123i.z = ((R4i.y == 0)?(0):(R2i.y));
R127i.w = ((R4i.y == 0)?(0):(R8i.w));
R125i.z = ((R4i.y == 0)?(0):(R9i.z));
// 6
R18i.x = ((R11i.w == 0)?(R126i.w):(R123i.x));
R14i.y = ((R11i.w == 0)?(R2i.y):(R123i.z));
R18i.z = ((R11i.w == 0)?(R5i.y):(R123i.y));
R123i.w = ((R4i.y == 0)?(0):(R11i.x));
R18i.y = ((R11i.w == 0)?(R0i.z):(R125i.w));
// 7
R23i.x = ((R11i.w == 0)?(R11i.x):(R123i.w));
R123i.y = ((R4i.y == 0)?(0):(R9i.y));
R123i.z = ((R4i.y == 0)?(0):(R12i.x));
R123i.w = ((R4i.y == 0)?(0):(R8i.z));
R126i.w = ((R4i.y == 0)?(0):(R11i.z));
// 8
R9i.x = ((R11i.w == 0)?(R12i.x):(R123i.z));
R23i.y = ((R11i.w == 0)?(R9i.y):(R123i.y));
R23i.z = ((R11i.w == 0)?(R8i.z):(R123i.w));
R23i.w = ((R11i.w == 0)?(R9i.z):(R125i.z));
R127i.y = ((R4i.y == 0)?(0):(R9i.w));
// 9
R126i.x = ((R4i.y == 0)?(0):(R13i.x));
R9i.y = ((R11i.w == 0)?(R8i.w):(R127i.w));
R123i.z = ((R4i.y == 0)?(R17i.x):(R8i.y));
R127i.w = ((R4i.y == 0)?(0):(R12i.z));
PS1i = R15i.x;
// 10
R12i.x = ((R11i.w == 0)?(PS1i):(R0i.w));
PV0iy = R12i.y;
R9i.z = ((R11i.w == 0)?(R11i.z):(R126i.w));
R126i.w = ((R4i.y == 0)?(R17i.z):(R6i.z));
R17i.x = ((R11i.w == 0)?(R7i.y):(R123i.z));
// 11
backupReg0i = R24i.z;
R24i.x = ((R11i.w == 0)?(R9i.w):(R127i.y));
R12i.y = ((R11i.w == 0)?(PV0iy):(R4i.z));
R24i.z = ((R11i.w == 0)?(R12i.z):(R127i.w));
PV1iw = backupReg0i;
R24i.y = ((R11i.w == 0)?(R13i.x):(R126i.x));
// 12
R123i.x = ((R4i.y == 0)?(0):(R14i.z));
R123i.y = ((R4i.y == 0)?(0):(R11i.y));
R12i.z = ((R11i.w == 0)?(PV1iw):(R1i.y));
R127i.w = ((R4i.y == 0)?(R17i.w):(R13i.z));
R12i.w = R7i.x;
// 13
backupReg0i = R123i.x;
R123i.x = ((R4i.y == 0)?(R17i.y):(R5i.w));
R9i.w = ((R11i.w == 0)?(R14i.z):(backupReg0i));
R24i.w = ((R11i.w == 0)?(R11i.y):(R123i.y));
// 14
R17i.y = ((R11i.w == 0)?(R15i.z):(R123i.x));
R17i.z = ((R11i.w == 0)?(R0i.y):(R126i.w));
R17i.w = ((R11i.w == 0)?(R16i.z):(R127i.w));
R14i.z = ((R11i.w == 0)?(R1i.z):(R10i.y));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R24i.x), intBitsToFloat(R24i.y), intBitsToFloat(R24i.z), intBitsToFloat(R24i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R23i.x), intBitsToFloat(R23i.y), intBitsToFloat(R23i.z), intBitsToFloat(R23i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R22i.x), intBitsToFloat(R22i.y), intBitsToFloat(R22i.z), intBitsToFloat(R22i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R21i.x), intBitsToFloat(R21i.y), intBitsToFloat(R21i.z), intBitsToFloat(R21i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.z));
// export
passParameterSem9 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.z));
}
