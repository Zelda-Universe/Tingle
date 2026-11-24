#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 32bc980ce0f319be
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[41];
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem2;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem3;
ATTR_LAYOUT(0, 4) in uvec4 attrDataSem4;
ATTR_LAYOUT(0, 5) in uvec4 attrDataSem5;
ATTR_LAYOUT(0, 6) in uvec4 attrDataSem6;
ATTR_LAYOUT(0, 7) in uvec4 attrDataSem7;
ATTR_LAYOUT(0, 8) in uvec4 attrDataSem8;
ATTR_LAYOUT(0, 9) in uvec4 attrDataSem9;
ATTR_LAYOUT(0, 10) in uvec4 attrDataSem10;
ATTR_LAYOUT(0, 11) in uvec4 attrDataSem11;
ATTR_LAYOUT(0, 12) in uvec4 attrDataSem12;
ATTR_LAYOUT(0, 13) in uvec4 attrDataSem13;
ATTR_LAYOUT(0, 14) in uvec4 attrDataSem14;

out vec4 passParameterSem0;
out vec4 passParameterSem7;
out vec4 passParameterSem8;
out vec4 passParameterSem11;
out vec4 passParameterSem4;
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
attrDecoder = attrDataSem9;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R10i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyz = attrDataSem8.xyz;
attrDecoder.xyz = uvec3((attrDecoder.xyz>>24)|((attrDecoder.xyz>>8)&0xFF00u)|((attrDecoder.xyz<<8)&0xFF0000u)|((attrDecoder.xyz<<24)));
attrDecoder.w = uint(0);
R9i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), 0x3f800000);
attrDecoder = attrDataSem14;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R14i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem13;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R13i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem3;
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem4;
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem6;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem7;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem11;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R12i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem10;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R11i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem5;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
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
R18i.x = floatBitsToInt(-(intBitsToFloat(R8i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R7i.z = 0;
R9i.w = floatBitsToInt(-(intBitsToFloat(R13i.x)) + 1.0);
R8i.z = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R18i.x));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R19i.x = 0;
R19i.y = 0;
R19i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R20i.x = 0;
// 1
R13i.z = R8i.z;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R13i.z = R7i.z;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R13i.z == 0);
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
PS0i = int(intBitsToFloat(R7i.w));
// 1
R8i.y = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R18i.x) >= intBitsToFloat(R8i.y));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R19i.x = 0;
R19i.y = 0;
R19i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R20i.x = 0;
// 1
R7i.z = R8i.z;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R7i.z == 0);
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
R0i.z = R3i.x;
R127i.w = R2i.y;
R127i.z = R3i.y;
// 1
R126i.x = R1i.z;
R127i.y = R2i.z;
R126i.z = R3i.z;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),0.0)));
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
R0i.z = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.x = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 5
R7i.z = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 6
predResult = (intBitsToFloat(R0i.z) > 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R0i.z));
// 1
R22i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R127i.y)));
R23i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R127i.y)));
// 2
R21i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R22i.x = 0;
// 1
R21i.x = R22i.x;
// 2
R23i.x = R22i.x;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (intBitsToFloat(R0i.x) > 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R0i.x));
// 1
R22i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R127i.x)));
R23i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R127i.x)));
// 2
R21i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R21i.y = 0;
R23i.y = 0;
// 1
R22i.y = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (intBitsToFloat(R7i.z) > 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R7i.z));
// 1
R22i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R127i.x)));
R23i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R127i.x)));
// 2
R21i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R21i.z = 0;
R23i.z = 0;
// 1
R22i.z = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = uf_remappedVS[2].x & 0x40000;
PV0iy = floatBitsToInt(intBitsToFloat(R11i.x) + intBitsToFloat(R11i.y));
R127i.z = uf_remappedVS[2].x & 0x20000;
PV0iw = uf_remappedVS[2].x & 0x10000;
PS0i = floatBitsToInt(intBitsToFloat(R11i.y) + intBitsToFloat(R11i.z));
// 1
R126i.x = floatBitsToInt(intBitsToFloat(PV0iy) * 0.5);
PV1iy = R11i.y;
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) * 2.0);
R125i.z = floatBitsToInt(intBitsToFloat(PS0i) * 0.5);
R127i.w = R11i.z;
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
PS1i = floatBitsToInt(float(PV0iw));
// 2
backupReg0i = R127i.z;
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R127i.z = floatBitsToInt(intBitsToFloat(R11i.x) + intBitsToFloat(R11i.z));
R126i.w = floatBitsToInt(floor(intBitsToFloat(PV1iy)));
PS0i = floatBitsToInt(float(backupReg0i));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R124i.z = floatBitsToInt(floor(intBitsToFloat(R127i.w)));
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PS1i = floatBitsToInt(float(R127i.x));
// 4
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R127i.y = R11i.x;
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R126i.z = int(intBitsToFloat(PV1ix));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0ix)));
PV1iy = 0 - R126i.z;
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 0.5);
R125i.w = floatBitsToInt(intBitsToFloat(R126i.x) + -(0.5));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) * 2.0);
R126i.x = int(intBitsToFloat(PV0iz));
// 6
R127i.x = max(R126i.z, PV1iy);
PV0iy = 0 - R126i.x;
R125i.z = floatBitsToInt(intBitsToFloat(R125i.z) + -(0.5));
R125i.z = floatBitsToInt(intBitsToFloat(R125i.z) * 2.0);
R127i.w = floatBitsToInt((intBitsToFloat(R126i.w) > 0.0)?1.0:0.0);
R126i.y = int(intBitsToFloat(PV1ix));
// 7
PV1ix = 0 - R126i.y;
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(R126i.w))?1.0:0.0);
R126i.z = floatBitsToInt((intBitsToFloat(R124i.z) > 0.0)?1.0:0.0);
R126i.w = max(R126i.x, PV0iy);
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[3].w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 8
backupReg0i = R127i.w;
R126i.x = floatBitsToInt(floor(intBitsToFloat(R127i.y)));
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(R124i.z))?1.0:0.0);
R124i.z = max(R126i.y, PV1ix);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.x), intBitsToFloat(PS1i)));
R127i.y = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(PV1iy)));
// 9
R124i.x = floatBitsToInt(intBitsToFloat(R127i.z) + -(0.5));
R124i.x = floatBitsToInt(intBitsToFloat(R124i.x) * 2.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(uf_remappedVS[4].x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(uf_remappedVS[4].y)));
R125i.w = floatBitsToInt(intBitsToFloat(R126i.z) + -(intBitsToFloat(PV0iy)));
R125i.x = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[5].x));
// 10
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[3].w)) + 1.0);
PV0iy = floatBitsToInt((intBitsToFloat(R126i.x) > 0.0)?1.0:0.0);
R126i.z = floatBitsToInt((intBitsToFloat(uf_remappedVS[5].x) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(R126i.x))?1.0:0.0);
PS0i = floatBitsToInt(float(backupReg0i));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 11
backupReg0i = R126i.w;
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(R127i.y)));
R127i.y = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[5].x))?1.0:0.0);
R125i.z = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iw)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(uf_remappedVS[6].y)));
PS1i = floatBitsToInt(float(backupReg0i));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 12
backupReg0i = R126i.y;
backupReg1i = R127i.w;
R125i.x = floatBitsToInt(intBitsToFloat(R18i.x) * intBitsToFloat(R125i.x));
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(R125i.w)));
R0i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(uf_remappedVS[3].x));
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[3].y) + intBitsToFloat(R127i.z));
R127i.z = floatBitsToInt(exp2(intBitsToFloat(backupReg1i)));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R21i.x),intBitsToFloat(R21i.y),intBitsToFloat(R21i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(uf_remappedVS[4].z)));
// 14
backupReg0i = R127i.y;
R125i.x = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(R125i.x));
R127i.y = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R18i.z = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(0x358637bd));
R0i.w = floatBitsToInt(intBitsToFloat(R126i.z) + -(intBitsToFloat(backupReg0i)));
PS0i = floatBitsToInt(float(R124i.z));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 15
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(intBitsToFloat(R11i.y) + -(0.5));
R125i.y = floatBitsToInt(intBitsToFloat(R11i.x) + -(0.5));
R7i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[3].z) + intBitsToFloat(backupReg0i));
R125i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(R125i.z)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 16
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(backupReg0i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(backupReg0i)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R126i.y)));
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R8i.y));
// 17
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R126i.y)));
PV1iy = ((intBitsToFloat(uf_remappedVS[3].w) == 1.0)?-1:0);
R15i.z = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV0iy));
R7i.w = R23i.y;
R7i.x = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV0iz));
// 18
R8i.x = ((PV1iy == 0)?(R126i.x):(R18i.x));
R127i.y = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(PV1ix));
R16i.z = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R126i.w));
R4i.w = floatBitsToInt(fract(intBitsToFloat(R125i.x)));
R126i.y = floatBitsToInt(-(intBitsToFloat(R0i.w)) + 1.0);
// 19
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R125i.w)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R125i.w)));
R8i.z = floatBitsToInt(intBitsToFloat(R11i.z) + -(0.5));
R10i.w = floatBitsToInt(intBitsToFloat(R18i.x) * intBitsToFloat(R127i.x));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(uf_remappedVS[7].x)));
// 20
R15i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R22i.x),intBitsToFloat(R22i.y),intBitsToFloat(R22i.z),0.0)));
PV0iy = R15i.x;
PV0iz = R15i.x;
PV0iw = R15i.x;
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(uf_remappedVS[7].y)));
// 21
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R23i.x),intBitsToFloat(R23i.y),intBitsToFloat(R23i.z),0.0)));
PV1ix = tempi.x;
R7i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R17i.z = R21i.y;
// 22
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(R18i.z)));
R5i.y = R23i.z;
R5i.z = R22i.z;
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(R126i.y)));
R6i.w = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(R125i.y));
}
if( activeMaskStackC[3] == true ) {
// 0
R124i.x = floatBitsToInt(intBitsToFloat(R7i.z) + intBitsToFloat(R0i.x));
PV0iy = R21i.z;
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R4i.w)));
R125i.w = floatBitsToInt(intBitsToFloat(R6i.z) + intBitsToFloat(R0i.y));
R125i.y = R22i.y;
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(R0i.z));
R126i.y = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(0x3a83126f));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(uf_remappedVS[7].z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.z), intBitsToFloat(R8i.x)));
R127i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3a83126f));
// 2
R126i.x = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(PV1iz));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.y)),intBitsToFloat(R17i.z)) + intBitsToFloat(R5i.x));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.z), intBitsToFloat(R8i.x)));
R125i.w = floatBitsToInt(intBitsToFloat(R5i.z) * intBitsToFloat(0x3a83126f));
R124i.y = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PV1iw));
// 3
backupReg0i = R125i.z;
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R15i.x),intBitsToFloat(R7i.y),intBitsToFloat(R18i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R15i.x),intBitsToFloat(R7i.y),intBitsToFloat(R18i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R125i.z = tempi.x;
PV1iw = tempi.x;
R127i.w = floatBitsToInt(intBitsToFloat(R5i.w) + intBitsToFloat(backupReg0i));
// 4
backupReg0i = R127i.y;
backupReg1i = R127i.z;
backupReg2i = R125i.w;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R8i.x)));
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].w)) + intBitsToFloat(uf_remappedVS[9].w));
R127i.z = ((intBitsToFloat(backupReg0i) == 0.0)?-1:0);
R125i.w = floatBitsToInt(intBitsToFloat(R6i.w) + intBitsToFloat(backupReg1i));
PS0i = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(backupReg2i));
// 5
R125i.x = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV0ix));
R125i.y = ((R127i.z == 0)?(R125i.y):(PS0i));
PV1iz = floatBitsToInt(intBitsToFloat(R17i.z) + intBitsToFloat(R127i.x));
PV1iw = floatBitsToInt(intBitsToFloat(R7i.w) + intBitsToFloat(R126i.y));
tempResultf = 1.0 / sqrt(intBitsToFloat(R125i.z));
R127i.x = floatBitsToInt(tempResultf);
// 6
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].z)) + intBitsToFloat(uf_remappedVS[9].z));
R127i.y = ((R127i.z == 0)?(R7i.w):(PV1iw));
R124i.z = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(uf_remappedVS[9].w)));
R126i.w = ((R127i.z == 0)?(R17i.z):(PV1iz));
R126i.z = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 7
R124i.x = floatBitsToInt(intBitsToFloat(R124i.y) * intBitsToFloat(0x3e22f983) + 0.5);
R124i.y = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(0x3e22f983) + 0.5);
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.x), intBitsToFloat(R127i.x)));
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].w)) + intBitsToFloat(uf_remappedVS[10].w));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(R127i.x)));
// 8
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(R126i.z));
R7i.y = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(uf_remappedVS[8].w)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.z), intBitsToFloat(backupReg0i)));
R6i.w = ((intBitsToFloat(R124i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R5i.y = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 9
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].y)) + intBitsToFloat(uf_remappedVS[9].y));
R126i.y = floatBitsToInt(fract(intBitsToFloat(R124i.x)));
R127i.z = floatBitsToInt(fract(intBitsToFloat(R124i.y)));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(0x3e22f983) + 0.5);
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)), intBitsToFloat(R0i.z)));
// 10
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].z)) + intBitsToFloat(uf_remappedVS[10].z));
R124i.y = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(uf_remappedVS[10].w)));
R125i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.w)), intBitsToFloat(R16i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)), intBitsToFloat(R4i.w)));
R127i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(R126i.z));
// 11
backupReg0i = R127i.y;
backupReg1i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].x)) + intBitsToFloat(uf_remappedVS[9].x));
R127i.y = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(R5i.y));
R17i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R16i.z)),-(intBitsToFloat(backupReg0i))) + intBitsToFloat(PV0iw));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(backupReg1i)));
R124i.x = ((intBitsToFloat(R7i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 12
backupReg0i = R126i.y;
backupReg1i = R127i.z;
R16i.x = ((intBitsToFloat(R124i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.y = floatBitsToInt(-(intBitsToFloat(R6i.w)) + 1.0);
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].y)) + intBitsToFloat(uf_remappedVS[10].y));
R7i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R126i.x = floatBitsToInt(intBitsToFloat(backupReg1i) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 13
backupReg0i = R125i.y;
R8i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.w)),-(intBitsToFloat(R126i.w))) + intBitsToFloat(R125i.x));
R125i.y = floatBitsToInt(fract(intBitsToFloat(R125i.w)));
R18i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.z)),-(intBitsToFloat(backupReg0i))) + intBitsToFloat(R125i.z));
R126i.w = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(R126i.z));
R124i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].x)) + intBitsToFloat(uf_remappedVS[10].x));
// 14
backupReg0i = R127i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(R127i.w)));
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].z) + intBitsToFloat(R124i.w));
R126i.z = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(R5i.y));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(backupReg0i)));
R127i.z = floatBitsToInt(-(intBitsToFloat(R16i.x)) + 1.0);
// 15
backupReg0i = R126i.y;
R15i.x = floatBitsToInt(-(intBitsToFloat(R124i.x)) + 1.0);
R126i.y = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(0x3e22f983));
R125i.z = floatBitsToInt(intBitsToFloat(R7i.w) * intBitsToFloat(0x3e22f983));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(backupReg0i)));
R124i.w = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 16
backupReg0i = R127i.z;
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R18i.z),intBitsToFloat(R17i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R18i.z),intBitsToFloat(R17i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R127i.z = tempi.x;
PV0iw = tempi.x;
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(backupReg0i)));
// 17
backupReg0i = R127i.w;
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].y) + intBitsToFloat(R127i.x));
R124i.y = floatBitsToInt(intBitsToFloat(R124i.y) * intBitsToFloat(R5i.y));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(R126i.w)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R126i.z)));
R126i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].z) + intBitsToFloat(backupReg0i));
// 18
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R125i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].z), intBitsToFloat(R15i.x)));
R5i.z = floatBitsToInt(intBitsToFloat(R124i.w) * intBitsToFloat(0x3e22f983));
R124i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].x) + intBitsToFloat(PV1iz));
R17i.x = floatBitsToInt(sin((intBitsToFloat(R125i.z))/0.1591549367));
// 19
R126i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].y) + intBitsToFloat(R127i.w));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R124i.y)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R6i.x)));
R5i.w = floatBitsToInt(sin((intBitsToFloat(R126i.y))/0.1591549367));
// 20
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].y), intBitsToFloat(R15i.x)));
R7i.y = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R125i.w)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.x), intBitsToFloat(R5i.w)));
tempResultf = 1.0 / sqrt(intBitsToFloat(R127i.z));
R5i.x = floatBitsToInt(tempResultf);
// 21
R0i.x = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0ix));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.z), intBitsToFloat(R5i.x)));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.z), intBitsToFloat(R5i.x)));
R6i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].x) + intBitsToFloat(R124i.y));
R0i.y = floatBitsToInt(cos((intBitsToFloat(R125i.z))/0.1591549367));
// 22
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R6i.x)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].z), intBitsToFloat(R16i.x)));
R17i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R125i.w)));
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R5i.w)));
R18i.z = floatBitsToInt(cos((intBitsToFloat(R126i.y))/0.1591549367));
}
if( activeMaskStackC[3] == true ) {
// 0
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R18i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x), intBitsToFloat(R15i.x)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R6i.y)));
R8i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(R5i.x)));
R5i.x = floatBitsToInt(sin((intBitsToFloat(R5i.z))/0.1591549367));
// 1
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R0i.w)));
R126i.y = floatBitsToInt(intBitsToFloat(R17i.z) + intBitsToFloat(PV0iy));
R127i.z = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(R0i.x));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.z), intBitsToFloat(R8i.z)));
R124i.w = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(R7i.y));
// 2
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].y), intBitsToFloat(R16i.x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(R6i.x)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(R8i.w)));
PV0iw = floatBitsToInt(max(intBitsToFloat(R11i.x), 0.0));
R125i.y = floatBitsToInt(cos((intBitsToFloat(R5i.z))/0.1591549367));
// 3
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.x), intBitsToFloat(R18i.z)));
R126i.y = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(R126i.y));
R124i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.w)),intBitsToFloat(R8i.z)) + intBitsToFloat(R125i.z));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R7i.w)));
R125i.z = floatBitsToInt(min(intBitsToFloat(PV0iw), 0.0));
// 4
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.z)),intBitsToFloat(R8i.w)) + intBitsToFloat(R125i.w));
R124i.y = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(R126i.x));
R127i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(R127i.z));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z), intBitsToFloat(R124i.w)));
R5i.z = floatBitsToInt(-(intBitsToFloat(R124i.x)) + intBitsToFloat(PV1iw));
// 5
backupReg0i = R126i.z;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].x), intBitsToFloat(R16i.x)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R124i.x)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R124i.z)));
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R16i.z)),intBitsToFloat(R6i.y)) + intBitsToFloat(backupReg0i));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R127i.x)));
// 6
backupReg0i = R126i.y;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.x), intBitsToFloat(R125i.y)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(R127i.z)));
R127i.z = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(backupReg0i));
R127i.w = floatBitsToInt(-(intBitsToFloat(R7i.w)) + intBitsToFloat(PV1iy));
R0i.x = floatBitsToInt(intBitsToFloat(R12i.x) + intBitsToFloat(R125i.z));
// 7
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R125i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R125i.y)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(uf_remappedVS[11].w)));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(R125i.y)));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R124i.z)));
// 8
backupReg0i = R126i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R127i.x)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R126i.w)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R16i.z)) + intBitsToFloat(R126i.z));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R4i.w)) + intBitsToFloat(R124i.w));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[11].z)));
// 9
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(R125i.x));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R127i.z)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(R125i.z)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(backupReg0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R4i.w)) + intBitsToFloat(PV0ix));
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R16i.z)) + intBitsToFloat(R12i.z));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R124i.z)));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(uf_remappedVS[11].y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R126i.w)));
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R126i.w)));
// 11
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R0i.z)) + intBitsToFloat(PV0iw));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),intBitsToFloat(R8i.w)) + intBitsToFloat(R126i.z));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),intBitsToFloat(R6i.y)) + intBitsToFloat(R124i.w));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R0i.z)) + intBitsToFloat(R126i.y));
R0i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.x)),intBitsToFloat(R8i.w)) + intBitsToFloat(R123i.x));
// 12
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R16i.z)) + intBitsToFloat(R124i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R4i.w)) + intBitsToFloat(R125i.w));
R16i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.x)),intBitsToFloat(R6i.y)) + intBitsToFloat(R127i.z));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.z), intBitsToFloat(R125i.y)));
R6i.w = 0x3f800000;
// 13
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),intBitsToFloat(R8i.z)) + intBitsToFloat(R124i.w));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R126i.z)));
R18i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R8i.w)) + intBitsToFloat(R123i.x));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R127i.y)));
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R6i.y)) + intBitsToFloat(R123i.y));
// 14
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R126i.x)));
R6i.y = floatBitsToInt(intBitsToFloat(R11i.x) + 1.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R0i.z)) + intBitsToFloat(R124i.x));
R5i.w = floatBitsToInt(intBitsToFloat(R11i.y) + 1.0);
R8i.w = floatBitsToInt(intBitsToFloat(R11i.z) + 1.0);
// 15
PV1ix = ((intBitsToFloat(R18i.x) == 0.0)?-1:0);
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R8i.z)) + intBitsToFloat(R123i.z));
R8i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.x)),intBitsToFloat(R8i.z)) + intBitsToFloat(R125i.x));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(R127i.y)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(R126i.z)));
// 16
R7i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R6i.w))));
PV0iy = R7i.x;
PV0iz = R7i.x;
PV0iw = R7i.x;
R1i.w = ((PV1ix == 0)?(R18i.x):(0x3f800000));
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R6i.w))));
PV1ix = tempi.x;
R7i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(R126i.x)));
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R6i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R9i.z = tempi.x;
PV0iw = tempi.x;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),intBitsToFloat(R16i.z)) + intBitsToFloat(R125i.w));
// 19
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),intBitsToFloat(R0i.w)) + intBitsToFloat(R124i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),intBitsToFloat(R8i.z)) + intBitsToFloat(R126i.z));
// 20
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(R18i.z)) + intBitsToFloat(R123i.x));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(R7i.w)) + intBitsToFloat(R127i.y));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(R5i.y)) + intBitsToFloat(R123i.w));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(uf_remappedVS[12].w)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(uf_remappedVS[12].w)));
PV0iz = uf_remappedVS[13].y;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
PV0iw = uf_remappedVS[13].x;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(uf_remappedVS[12].w)));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R10i.x) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(intBitsToFloat(R10i.y) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(uf_remappedVS[12].z)));
// 2
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PV1iy)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z), intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R0i.w)) + intBitsToFloat(R4i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R8i.z)) + intBitsToFloat(R12i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R16i.z)) + intBitsToFloat(R12i.y));
R0i.y = floatBitsToInt(intBitsToFloat(R1i.w) * intBitsToFloat(PS0i));
R0i.y = clampFI32(R0i.y);
// 4
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(R7i.w)) + intBitsToFloat(R123i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(R18i.z)) + intBitsToFloat(backupReg0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(R5i.y)) + intBitsToFloat(R123i.y));
// 5
R2i.x = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(R123i.z));
R3i.y = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(R123i.x));
R2i.z = floatBitsToInt(intBitsToFloat(R9i.z) + intBitsToFloat(R123i.w));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(R126i.x));
R126i.z = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(R125i.x));
PV0iw = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(R127i.y));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0iy));
// 8
R0i.w = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV1ix));
// 9
predResult = (intBitsToFloat(uf_remappedVS[14].x) != 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = uf_remappedVS[15].w;
PV0iz = uf_remappedVS[16].w;
// 1
R127i.x = floatBitsToInt(-(intBitsToFloat(R2i.x)) + intBitsToFloat(PV0iz));
R127i.y = floatBitsToInt(-(intBitsToFloat(R3i.y)) + intBitsToFloat(PV0ix));
PV1iw = uf_remappedVS[17].w;
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[14].x));
// 2
PV0iz = floatBitsToInt(-(intBitsToFloat(R2i.z)) + intBitsToFloat(PV1iw));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(R127i.z));
PV1ix = clampFI32(PV1ix);
// 6
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PV1ix)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R1i.x = 0x3f800000;
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[16].w) + intBitsToFloat(uf_remappedVS[15].w));
R4i.z = 0;
R6i.w = 0x3f800000;
R1i.y = 0;
// 1
R0i.x = R9i.w;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[18].z)));
PV1iz = ((intBitsToFloat(R11i.x) > 0.5)?-1:0);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].y), intBitsToFloat(uf_remappedVS[18].z)));
R3i.z = ((intBitsToFloat(R11i.y) > 0.5)?-1:0);
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(uf_remappedVS[17].w));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[18].y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV1iw)));
R3i.w = ((PV1iz == 0)?(R13i.x):(R0i.x));
R2i.w = R13i.y;
// 3
PV1ix = ((intBitsToFloat(R11i.z) > 0.5)?-1:0);
PV1iy = ((intBitsToFloat(R11i.w) > 0.5)?-1:0);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), intBitsToFloat(uf_remappedVS[18].w)));
R127i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3dd70a3d));
PS1i = floatBitsToInt(-(intBitsToFloat(R13i.y)) + 1.0);
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R126i.y));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R127i.z));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].x), intBitsToFloat(uf_remappedVS[18].y)));
R4i.w = ((PV1ix == 0)?(R13i.x):(R9i.w));
R5i.w = ((PV1iy == 0)?(R13i.y):(PS1i));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0iy));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PV0iz)));
R0i.z = R6i.x;
PV1iw = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0ix));
// 6
R0i.x = R2i.y;
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
R10i.z = R1i.z;
// 7
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R0i.w = R1i.z;
// 8
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 9
R127i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R127i.w = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 10
PS0i = floatBitsToInt(sin((intBitsToFloat(R127i.w))/0.1591549367));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R127i.y)));
PS1i = floatBitsToInt(cos((intBitsToFloat(R127i.w))/0.1591549367));
// 12
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(sin((intBitsToFloat(R127i.x))/0.1591549367));
// 13
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R126i.y)));
PV1iy = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(PV0iy));
R1i.z = floatBitsToInt(-(intBitsToFloat(R7i.x)) + intBitsToFloat(PV0iw));
// 14
R2i.z = floatBitsToInt(-(intBitsToFloat(R9i.z)) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(PV1ix));
// 15
R1i.w = floatBitsToInt(-(intBitsToFloat(R7i.y)) + intBitsToFloat(PV0iw));
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R7i.x) + -(intBitsToFloat(uf_remappedVS[19].x)));
R126i.y = floatBitsToInt(intBitsToFloat(R7i.y) + -(intBitsToFloat(uf_remappedVS[19].y)));
R127i.z = floatBitsToInt(intBitsToFloat(R9i.z) + -(intBitsToFloat(uf_remappedVS[19].z)));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R9i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w))));
PV1ix = tempi.x;
R127i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R9i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w))));
PV0iy = R126i.x;
PV0iz = R126i.x;
PV0iw = R126i.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = R126i.x;
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 4
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[22].x)) + intBitsToFloat(uf_remappedVS[22].y));
R123i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 0.0 + intBitsToFloat(backupReg0i));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.y) * 0.5 + intBitsToFloat(PS1i));
R6i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R0i.y = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 5
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[23].w)) + intBitsToFloat(uf_remappedVS[24].w));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.y));
// 6
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[23].x)) + intBitsToFloat(uf_remappedVS[24].x));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS1i));
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 7
R4i.x = uf_remappedVS[25].y;
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].w), intBitsToFloat(PV0iw)));
R8i.w = uf_remappedVS[25].x;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 8
R3i.x = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].y)) + intBitsToFloat(PV1iz));
R6i.z = uf_remappedVS[25].z;
// 9
R5i.x = uf_remappedVS[26].x;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 10
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS1i));
// 11
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(uf_remappedVS[22].x)));
// 12
R7i.z = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(R126i.w));
R7i.z = clampFI32(R7i.z);
// 13
R3i.y = ((0.0 >= intBitsToFloat(R7i.z))?-1:0);
// 14
R2i.x = ((R3i.y == 0)?(R19i.x):(R4i.z));
R4i.y = ((R3i.y == 0)?(0):(0x3f800000));
R5i.z = ((R3i.y == 0)?(R19i.y):(R1i.y));
R7i.w = ((R3i.y == 0)?(R19i.z):(R6i.w));
R8i.z = R20i.z;
// 15
R126i.x = ((R3i.y == 0)?(0):(R6i.x));
R126i.y = ((R3i.y == 0)?(0):(R6i.w));
R127i.z = ((R3i.y == 0)?(0):(R10i.z));
R126i.w = ((R3i.y == 0)?(0):(R2i.y));
R127i.x = ((R3i.y == 0)?(0):(R14i.x));
// 16
R127i.y = ((R3i.y == 0)?(0):(R14i.w));
R126i.z = ((R3i.y == 0)?(0):(R14i.z));
R127i.w = ((R3i.y == 0)?(0):(R14i.y));
// 17
R15i.x = ((R4i.y == 0)?(R0i.z):(R126i.x));
R15i.y = ((R4i.y == 0)?(R0i.x):(R126i.w));
R0i.z = R20i.z;
// 18
R17i.x = ((R4i.y == 0)?(R14i.x):(R127i.x));
R17i.y = ((R4i.y == 0)?(R14i.y):(R127i.w));
R15i.z = ((R4i.y == 0)?(R0i.w):(R127i.z));
R17i.z = ((R4i.y == 0)?(R14i.z):(R126i.z));
// 19
R17i.w = ((R4i.y == 0)?(R14i.w):(R127i.y));
R15i.w = R126i.y;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = uf_remappedVS[2].y & int(1);
PV0iy = floatBitsToInt(max(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[27].y)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[27].y));
// 1
PV1ix = floatBitsToInt((intBitsToFloat(uf_remappedVS[28].y) > 0.0)?1.0:0.0);
R127i.y = (int(1) != PV0ix)?-1:0;
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[28].y))?1.0:0.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[28].y));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R18i.x) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV1iw)));
R126i.y = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iz)));
// 3
R14i.x = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(PV0iz));
R0i.y = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(PV0iy));
R1i.z = floatBitsToInt(intBitsToFloat(R9i.z) + intBitsToFloat(PV0iw));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x),intBitsToFloat(uf_remappedVS[5].z)) + intBitsToFloat(PV0ix));
R122i.x = ((R127i.y == 0)?(0):(int(1)));
// 4
R127i.x = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV0iz = uf_remappedVS[2].x & 0x80000;
PV0iw = (R122i.x == 0x2)?-1:0;
R127i.y = (R122i.x == int(1))?-1:0;
// 5
R126i.x = (PV0iz == 0x80000)?-1:0;
R123i.y = ((PV0iw == 0)?(R11i.y):(R11i.x));
R123i.z = ((PV0iw == 0)?(R11i.x):(R11i.z));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV0iy)));
R126i.y = uf_remappedVS[2].x & 0x100000;
// 6
backupReg0i = R127i.x;
R127i.x = ((R126i.x == 0)?(R13i.y):(R2i.w));
R14i.y = ((R127i.y == 0)?(R123i.z):(R11i.y));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV1iw));
R2i.w = ((R127i.y == 0)?(R123i.y):(R11i.z));
PS0i = uf_remappedVS[2].x & 0x200000;
// 7
PV1ix = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R126i.y = (R126i.y == 0x100000)?-1:0;
R127i.z = ((R126i.x == 0)?(R13i.x):(R3i.w));
PV1iw = uf_remappedVS[2].x & 0x400000;
PS1i = (PS0i == 0x200000)?-1:0;
// 8
R11i.x = ((R127i.y == 0)?(R11i.x):(R11i.y));
R11i.y = ((R127i.y == 0)?(R11i.y):(R11i.z));
PV0iz = (PV1iw == 0x400000)?-1:0;
R123i.w = ((R3i.z == 0)?(R127i.x):(PV1ix));
R2i.y = ((PS1i == 0)?(R13i.x):(R4i.w));
// 9
R13i.x = ((R126i.y == 0)?(R127i.x):(R123i.w));
R123i.y = R127i.z;
R3i.z = ((PV0iz == 0)?(R13i.y):(R5i.w));
R5i.y = uf_remappedVS[29].x;
// 10
R7i.x = 0;
R13i.y = ((R3i.y == 0)?(R20i.y):(R5i.y));
R11i.z = ((R126i.y == 0)?(R127i.z):(R123i.y));
R5i.w = ((R3i.y == 0)?(R5i.y):(R5i.y));
// 11
R6i.x = ((R3i.y == 0)?(R20i.x):(R7i.x));
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R0i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.x)),vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w))));
PV0ix = tempi.x;
R125i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R0i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.x)),vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R125i.w = tempi.x;
R126i.y = ((R3i.y == 0)?(PV0ix):(PV0ix));
// 2
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R0i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.x)),vec4(intBitsToFloat(uf_remappedVS[30].x),intBitsToFloat(uf_remappedVS[30].y),intBitsToFloat(uf_remappedVS[30].z),intBitsToFloat(uf_remappedVS[30].w))));
PV0iy = R0i.x;
PV0iz = R0i.x;
PV0iw = R0i.x;
R127i.z = ((R3i.y == 0)?(PV1ix):(R6i.w));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R0i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.x)),vec4(intBitsToFloat(uf_remappedVS[31].x),intBitsToFloat(uf_remappedVS[31].y),intBitsToFloat(uf_remappedVS[31].z),intBitsToFloat(uf_remappedVS[31].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R125i.z = tempi.x;
PV1iw = tempi.x;
R127i.x = ((R3i.y == 0)?(R0i.x):(R4i.z));
// 4
R126i.x = R125i.y;
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) / 2.0);
R127i.y = floatBitsToInt(intBitsToFloat(R2i.z) + -(intBitsToFloat(uf_remappedVS[23].w)));
R123i.z = ((R3i.y == 0)?(R19i.w):(R125i.y));
R123i.w = ((R3i.y == 0)?(PV1ix):(R1i.y));
PS0i = int(intBitsToFloat(uf_remappedVS[32].z));
// 5
R19i.x = ((R4i.y == 0)?(R127i.x):(R2i.x));
R19i.y = ((R4i.y == 0)?(R123i.w):(R5i.z));
R19i.z = ((R4i.y == 0)?(R127i.z):(R7i.w));
R19i.w = ((R4i.y == 0)?(R126i.y):(R123i.z));
R127i.w = floatBitsToInt(float(PS0i));
// 6
PV0ix = floatBitsToInt((0.0 >= abs(intBitsToFloat(R127i.w)))?1.0:0.0);
PV0iy = floatBitsToInt(intBitsToFloat(R2i.z) + -(intBitsToFloat(uf_remappedVS[24].w)));
PV0iz = floatBitsToInt(-(abs(intBitsToFloat(R127i.w))) + 0.0);
R126i.w = ((intBitsToFloat(R127i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 7
R124i.x = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.y = ((intBitsToFloat(PV0ix) == 0.0)?(0):(PV0iz));
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[33].x), intBitsToFloat(R14i.y)));
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 2.0);
PS1i = floatBitsToInt(intBitsToFloat(uf_remappedVS[34].z) + intBitsToFloat(uf_remappedVS[33].x));
// 8
PV0ix = floatBitsToInt(trunc(intBitsToFloat(PV1iz)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[33].y), intBitsToFloat(R2i.w)));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[34].w) + intBitsToFloat(uf_remappedVS[33].y));
PV0iw = floatBitsToInt(abs(intBitsToFloat(R127i.w)) + intBitsToFloat(R126i.y));
R127i.x = floatBitsToInt(-(intBitsToFloat(PV1iw)) + intBitsToFloat(PS1i));
// 9
R125i.x = floatBitsToInt(-(intBitsToFloat(PV0iy)) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(-(intBitsToFloat(R124i.x)) + 1.0);
R123i.z = ((-(intBitsToFloat(R126i.y)) > 0.0)?(PV0iw):(R126i.y));
PV1iw = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
R126i.y = int(intBitsToFloat(PV0ix));
// 10
R123i.x = ((intBitsToFloat(R127i.w) == 0.0)?(0):(R123i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R3i.x)) + intBitsToFloat(uf_remappedVS[23].x));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[23].x), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV1iy)));
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[32].z));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[35].x) + intBitsToFloat(uf_remappedVS[35].z));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(PV0iw)) + intBitsToFloat(PV0iz));
R124i.z = floatBitsToInt(intBitsToFloat(R125i.w) * 0.0 + intBitsToFloat(R126i.x));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[35].y) + intBitsToFloat(uf_remappedVS[35].w));
R127i.y = int(intBitsToFloat(R123i.x));
// 12
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(R125i.w) * 0.0 + intBitsToFloat(R125i.y));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].z),intBitsToFloat(R11i.x)) + intBitsToFloat(PV1ix));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].w),intBitsToFloat(R11i.y)) + intBitsToFloat(PV1iw));
R126i.w = floatBitsToInt(intBitsToFloat(R125i.w) * 0.5 + intBitsToFloat(backupReg0i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[32].w));
// 13
backupReg0i = R127i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R18i.x)),intBitsToFloat(uf_remappedVS[34].x)) + -(intBitsToFloat(R127i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].y), intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].x), intBitsToFloat(R127i.w)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.x),intBitsToFloat(uf_remappedVS[34].y)) + intBitsToFloat(R125i.x));
PS1i = floatBitsToInt(float(backupReg0i));
// 14
R11i.x = uf_remappedVS[36].z;
R11i.y = uf_remappedVS[36].y;
R2i.z = uf_remappedVS[36].x;
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PS1i)) + intBitsToFloat(R123i.x));
PS0i = floatBitsToInt(float(R126i.y));
// 15
backupReg0i = R127i.y;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.x), intBitsToFloat(uf_remappedVS[37].y)));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.w));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R127i.z)) + -(0.5));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(backupReg0i)) + -(0.5));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[37].w));
// 16
backupReg0i = R125i.y;
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[24].x),intBitsToFloat(R124i.x)) + intBitsToFloat(R124i.y));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(PV1ix)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.x),intBitsToFloat(uf_remappedVS[33].w)) + intBitsToFloat(R126i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.x),intBitsToFloat(uf_remappedVS[33].z)) + intBitsToFloat(backupReg0i));
R127i.x = floatBitsToInt(intBitsToFloat(R125i.z) * -(0.5) + intBitsToFloat(R124i.z));
// 17
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), intBitsToFloat(uf_remappedVS[37].x)));
R124i.y = floatBitsToInt(intBitsToFloat(R0i.x) * 0.5 + intBitsToFloat(R124i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R127i.w)) + -(intBitsToFloat(R127i.y)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R127i.z)) + intBitsToFloat(R125i.w));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[37].z));
// 18
R124i.x = R125i.y;
R125i.y = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
R127i.z = floatBitsToInt(intBitsToFloat(R123i.z) + 0.5);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(PV1ix)));
R126i.y = ((R3i.y == 0)?(0):(R124i.y));
// 19
R123i.x = ((R3i.y == 0)?(0):(R127i.w));
R127i.y = ((R3i.y == 0)?(0):(R127i.z));
R123i.z = ((R3i.y == 0)?(0):(R125i.y));
R123i.w = ((R3i.y == 0)?(0):(R124i.x));
R125i.x = ((R3i.y == 0)?(0):(R127i.x));
// 20
R16i.x = ((R4i.y == 0)?(R127i.w):(R123i.x));
R16i.y = ((R4i.y == 0)?(R124i.x):(R123i.w));
R124i.z = ((R3i.y == 0)?(0):(R126i.x));
R127i.w = ((R3i.y == 0)?(0):(R126i.w));
R16i.z = ((R4i.y == 0)?(R125i.y):(R123i.z));
// 21
R16i.w = ((R4i.y == 0)?(R127i.z):(R127i.y));
// 22
R21i.x = ((R4i.y == 0)?(R124i.y):(R126i.y));
R21i.y = ((R4i.y == 0)?(R127i.x):(R125i.x));
R21i.z = ((R4i.y == 0)?(R126i.w):(R127i.w));
R21i.w = ((R4i.y == 0)?(R126i.x):(R124i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(uf_remappedVS[38].z)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(uf_remappedVS[38].y)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(uf_remappedVS[38].x)));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.x), intBitsToFloat(uf_remappedVS[38].w)));
// 1
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(uf_remappedVS[39].w)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(uf_remappedVS[39].z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(uf_remappedVS[39].y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(uf_remappedVS[39].x)));
R6i.z = ((R3i.y == 0)?(0):(R2i.w));
// 2
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[40].x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(uf_remappedVS[40].x)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(uf_remappedVS[40].x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].x), intBitsToFloat(PV1iw)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].x), intBitsToFloat(PV1iz)));
// 3
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(R7i.z)) + 0.0);
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].x), intBitsToFloat(R124i.y)));
R124i.z = ((R3i.y == 0)?(0):(R127i.w));
R126i.w = ((R3i.y == 0)?(0):(R127i.z));
R126i.z = ((R3i.y == 0)?(0):(R126i.x));
// 4
R123i.x = ((R3i.y == 0)?(R0i.x):(R7i.x));
R126i.y = ((R3i.y == 0)?(0):(R125i.z));
R7i.z = ((R3i.y == 0)?(0):(R127i.y));
R125i.w = ((R3i.y == 0)?(0):(R124i.y));
R124i.w = ((R3i.y == 0)?(0):(R127i.x));
// 5
R20i.x = ((R4i.y == 0)?(R123i.x):(R6i.x));
R20i.y = ((R4i.y == 0)?(R5i.w):(R13i.y));
R20i.z = ((R4i.y == 0)?(R8i.z):(R0i.z));
R0i.x = ((R4i.y == 0)?(R127i.w):(R124i.z));
// 6
R0i.y = ((R4i.y == 0)?(R127i.z):(R126i.w));
R0i.z = ((R4i.y == 0)?(R124i.y):(R125i.w));
R0i.w = ((R4i.y == 0)?(R126i.x):(R126i.z));
R22i.x = ((R4i.y == 0)?(R125i.z):(R126i.y));
// 7
R22i.y = ((R4i.y == 0)?(R127i.y):(R7i.z));
R22i.z = ((R4i.y == 0)?(R127i.x):(R124i.w));
R22i.w = ((R4i.y == 0)?(R2i.w):(R6i.z));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R22i.x), intBitsToFloat(R22i.y), intBitsToFloat(R22i.z), intBitsToFloat(R22i.w));
// export
// skipped export to semanticId 255
// export
// skipped export to semanticId 255
// export
passParameterSem7 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.z));
}
