#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader c3014ec147c86700
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[39];
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
out vec4 passParameterSem1;
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
R8i.x = floatBitsToInt(-(intBitsToFloat(R8i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R7i.z = 0;
R10i.w = floatBitsToInt(-(intBitsToFloat(R13i.x)) + 1.0);
R8i.z = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R8i.x));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R18i.x = 0;
R18i.y = 0;
R18i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R19i.x = 0;
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
R21i.y = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R8i.x) >= intBitsToFloat(R21i.y));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R18i.x = 0;
R18i.y = 0;
R18i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R19i.x = 0;
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
R20i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R127i.y)));
R17i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R127i.y)));
// 2
R18i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R20i.x = 0;
// 1
R18i.x = R20i.x;
// 2
R17i.x = R20i.x;
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
R20i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R127i.x)));
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R127i.x)));
// 2
R18i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R18i.y = 0;
R17i.y = 0;
// 1
R20i.y = 0;
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
R20i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R127i.x)));
R17i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R127i.x)));
// 2
R18i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R18i.z = 0;
R17i.z = 0;
// 1
R20i.z = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R11i.x) + intBitsToFloat(R11i.y));
R127i.y = uf_remappedVS[2].x & 0x20000;
R127i.z = uf_remappedVS[2].x & 0x40000;
PV0iw = uf_remappedVS[2].x & 0x10000;
R126i.z = floatBitsToInt(intBitsToFloat(R11i.x) + intBitsToFloat(R11i.z));
// 1
PV1ix = R11i.y;
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
R126i.y = R11i.x;
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) * 2.0);
R125i.z = floatBitsToInt(intBitsToFloat(PV0ix) * 0.5);
R127i.w = floatBitsToInt(intBitsToFloat(R11i.y) + intBitsToFloat(R11i.z));
PS1i = floatBitsToInt(float(PV0iw));
// 2
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R125i.y = floatBitsToInt(intBitsToFloat(R126i.z) * 0.5);
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R126i.w = floatBitsToInt(floor(intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(float(R127i.z));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0ix)));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R127i.z = R11i.z;
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 2.0);
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(float(R127i.y));
// 4
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R127i.y = floatBitsToInt(floor(intBitsToFloat(R126i.y)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R126i.y = int(intBitsToFloat(PV1ix));
// 5
backupReg0i = R126i.y;
R126i.x = floatBitsToInt(intBitsToFloat(R127i.w) * 0.5);
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
PV1iz = 0 - backupReg0i;
R127i.w = floatBitsToInt(intBitsToFloat(R125i.z) + -(0.5));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
R127i.x = int(intBitsToFloat(PV0iz));
// 6
R125i.x = max(R126i.y, PV1iz);
R126i.y = floatBitsToInt((intBitsToFloat(R126i.w) > 0.0)?1.0:0.0);
R126i.z = floatBitsToInt(intBitsToFloat(R125i.y) + -(0.5));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) * 2.0);
PV0iw = 0 - R127i.x;
R125i.z = int(intBitsToFloat(PV1iy));
// 7
backupReg0i = R127i.z;
PV1ix = 0 - R125i.z;
R125i.y = max(R127i.x, PV0iw);
R127i.z = floatBitsToInt((0.0 > intBitsToFloat(R126i.w))?1.0:0.0);
R126i.w = floatBitsToInt(floor(intBitsToFloat(backupReg0i)));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[3].w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 8
backupReg0i = R127i.y;
PV0ix = floatBitsToInt((intBitsToFloat(backupReg0i) > 0.0)?1.0:0.0);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(PS1i)));
R124i.z = max(R125i.z, PV1ix);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(backupReg0i))?1.0:0.0);
R125i.z = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[4].x));
// 9
R127i.x = floatBitsToInt(intBitsToFloat(R126i.y) + -(intBitsToFloat(R127i.z)));
R126i.y = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
R127i.z = floatBitsToInt((intBitsToFloat(uf_remappedVS[4].x) > 0.0)?1.0:0.0);
R125i.w = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[4].x))?1.0:0.0);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(uf_remappedVS[5].y)));
// 10
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(R8i.x) * intBitsToFloat(R125i.z));
R124i.y = floatBitsToInt(intBitsToFloat(backupReg0i) + -(0.5));
R124i.y = floatBitsToInt(intBitsToFloat(R124i.y) * 2.0);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(uf_remappedVS[6].x)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(uf_remappedVS[6].z)));
R127i.w = floatBitsToInt(float(R125i.x));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
// 11
backupReg0i = R125i.y;
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R18i.x),intBitsToFloat(R18i.y),intBitsToFloat(R18i.z),0.0)));
PV1ix = tempi.x;
R125i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.z = floatBitsToInt(float(backupReg0i));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) * 2.0);
// 12
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(R126i.w))?1.0:0.0);
R0i.y = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(R125i.w)));
PV0iz = floatBitsToInt((intBitsToFloat(R126i.w) > 0.0)?1.0:0.0);
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[3].w)) + 1.0);
R127i.y = floatBitsToInt(exp2(intBitsToFloat(R127i.y)));
// 13
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.z)), intBitsToFloat(R126i.y)));
R126i.y = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(backupReg0i));
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)), intBitsToFloat(R127i.x)));
R127i.w = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0ix)));
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R21i.y));
// 14
R125i.x = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(uf_remappedVS[3].x));
R127i.y = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
R15i.z = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(0x358637bd));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(uf_remappedVS[6].y)));
PS0i = floatBitsToInt(float(R124i.z));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 15
R0i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[3].z) + intBitsToFloat(R0i.w));
R7i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(R127i.w)));
R124i.z = floatBitsToInt(fract(intBitsToFloat(R126i.y)));
R8i.w = R17i.y;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.w));
// 16
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(R0i.y)) + 1.0);
R8i.y = floatBitsToInt(intBitsToFloat(R11i.x) + -(0.5));
R125i.z = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS1i));
R9i.w = floatBitsToInt(intBitsToFloat(R8i.x) * intBitsToFloat(backupReg0i));
R15i.y = floatBitsToInt(intBitsToFloat(R11i.z) + -(0.5));
// 17
R7i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),0.0)));
PV1iy = R7i.x;
PV1iz = R7i.x;
PV1iw = R7i.x;
R16i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[3].y) + intBitsToFloat(R124i.w));
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R17i.x),intBitsToFloat(R17i.y),intBitsToFloat(R17i.z),0.0)));
PV0ix = tempi.x;
R19i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R126i.z)));
// 19
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(backupReg0i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R126i.z)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(backupReg0i)));
R124i.w = ((intBitsToFloat(uf_remappedVS[3].w) == 1.0)?-1:0);
// 20
backupReg0i = R127i.x;
R127i.x = R17i.z;
R5i.y = R20i.z;
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(R15i.z)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(backupReg0i)));
R5i.w = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(R124i.x));
// 21
PV1ix = R18i.z;
R17i.y = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(R126i.x));
R0i.z = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(R127i.y));
R7i.w = floatBitsToInt(intBitsToFloat(R6i.z) + intBitsToFloat(R126i.z));
R4i.w = floatBitsToInt(intBitsToFloat(R11i.y) + -(0.5));
// 22
backupReg0i = R0i.y;
R0i.x = ((R124i.w == 0)?(R125i.z):(R8i.x));
R0i.y = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0x3a83126f));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R124i.z)));
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y), intBitsToFloat(R7i.y)));
R8i.z = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3a83126f));
}
if( activeMaskStackC[3] == true ) {
// 0
R124i.x = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(R5i.z));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(uf_remappedVS[7].x)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R7i.y)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(uf_remappedVS[7].y)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(R0i.x)));
// 1
R126i.x = R20i.y;
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.y), intBitsToFloat(uf_remappedVS[7].z)));
R124i.z = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(0x3a83126f));
R5i.x = floatBitsToInt(intBitsToFloat(R124i.x) + -(intBitsToFloat(uf_remappedVS[8].w)));
// 2
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R19i.y)),intBitsToFloat(R18i.y)) + intBitsToFloat(R7i.z));
R125i.y = floatBitsToInt(intBitsToFloat(R16i.y) + intBitsToFloat(R6i.w));
R126i.z = floatBitsToInt(intBitsToFloat(R7i.w) + intBitsToFloat(PV1iy));
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].w)) + intBitsToFloat(uf_remappedVS[8].w));
R125i.x = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV1iw));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R19i.y),intBitsToFloat(R15i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R7i.x),intBitsToFloat(R19i.y),intBitsToFloat(R15i.z),0.0)));
PV1ix = tempi.x;
R127i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(R125i.z));
// 4
backupReg0i = R124i.w;
PV0ix = floatBitsToInt(intBitsToFloat(R8i.w) + intBitsToFloat(R0i.y));
R126i.y = floatBitsToInt(intBitsToFloat(R18i.y) + intBitsToFloat(R8i.z));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.y), intBitsToFloat(R0i.x)));
R124i.w = ((intBitsToFloat(R127i.x) == 0.0)?-1:0);
R125i.w = floatBitsToInt(intBitsToFloat(PS1i) + intBitsToFloat(backupReg0i));
// 5
backupReg0i = R126i.x;
backupReg1i = R127i.y;
R126i.x = floatBitsToInt(intBitsToFloat(R124i.z) + intBitsToFloat(R127i.w));
R127i.y = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV0iz));
R125i.z = ((R124i.w == 0)?(backupReg0i):(R125i.x));
R127i.w = ((R124i.w == 0)?(R8i.w):(PV0ix));
tempResultf = 1.0 / sqrt(intBitsToFloat(backupReg1i));
R126i.z = floatBitsToInt(tempResultf);
// 6
backupReg0i = R126i.w;
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].z)) + intBitsToFloat(uf_remappedVS[8].z));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R0i.x)));
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(R126i.z)));
R126i.w = ((R124i.w == 0)?(R18i.y):(R126i.y));
R125i.y = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 7
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].w)) + intBitsToFloat(uf_remappedVS[10].w));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.z), intBitsToFloat(R126i.z)));
R124i.z = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(PV0iy));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.y), intBitsToFloat(R126i.z)));
R125i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(R125i.y));
// 8
R127i.x = ((intBitsToFloat(R5i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.y = floatBitsToInt(intBitsToFloat(R124i.x) + -(intBitsToFloat(uf_remappedVS[10].w)));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(0x3e22f983) + 0.5);
R6i.w = floatBitsToInt(intBitsToFloat(R124i.x) + -(intBitsToFloat(uf_remappedVS[9].w)));
R8i.w = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 9
R126i.x = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(0x3e22f983) + 0.5);
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)), intBitsToFloat(R6i.y)));
PV1iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].y)) + intBitsToFloat(uf_remappedVS[8].y));
R124i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.w)), intBitsToFloat(R16i.z)));
PS1i = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.z)), intBitsToFloat(R4i.w)));
// 10
R0i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R16i.z)),-(intBitsToFloat(R127i.w))) + intBitsToFloat(PS1i));
R124i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(R125i.y));
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].z)) + intBitsToFloat(uf_remappedVS[10].z));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(R125i.w)));
R127i.z = ((intBitsToFloat(R6i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 11
backupReg0i = R126i.y;
R124i.x = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(R8i.w));
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].x)) + intBitsToFloat(uf_remappedVS[8].x));
R0i.z = ((intBitsToFloat(backupReg0i) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.w = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R125i.x = floatBitsToInt(fract(intBitsToFloat(R126i.z)));
// 12
R126i.x = floatBitsToInt(fract(intBitsToFloat(R126i.x)));
PV0iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].y)) + intBitsToFloat(uf_remappedVS[10].y));
R8i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.w)),-(intBitsToFloat(R126i.w))) + intBitsToFloat(R127i.y));
R126i.w = floatBitsToInt(intBitsToFloat(R124i.z) * intBitsToFloat(0x3e22f983) + 0.5);
R18i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.y)),-(intBitsToFloat(R125i.z))) + intBitsToFloat(R124i.w));
// 13
backupReg0i = R126i.y;
backupReg1i = R124i.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(R124i.y)));
R126i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].z) + intBitsToFloat(R127i.w));
R125i.z = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(R125i.y));
R127i.w = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(R8i.w));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(backupReg1i)));
// 14
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R125i.w)));
PV0iy = floatBitsToInt(-(intBitsToFloat(R0i.z)) + 1.0);
R15i.z = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].x)) + intBitsToFloat(uf_remappedVS[10].x));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 15
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(R8i.w));
R125i.y = floatBitsToInt(fract(intBitsToFloat(R126i.w)));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iy)));
R126i.w = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(R125i.z)));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.z),intBitsToFloat(R18i.y),intBitsToFloat(R0i.x),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R8i.z),intBitsToFloat(R18i.y),intBitsToFloat(R0i.x),0.0)));
PV0ix = tempi.x;
R124i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R19i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].y) + intBitsToFloat(R124i.x));
// 17
backupReg0i = R126i.y;
R124i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].z) + intBitsToFloat(R124i.z));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R127i.w)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R7i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].z), intBitsToFloat(R15i.z)));
R0i.y = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(0x3e22f983));
// 18
R126i.x = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PV1iw));
R17i.y = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0x3e22f983));
R124i.z = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R6i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].x) + intBitsToFloat(R127i.y));
tempResultf = 1.0 / sqrt(intBitsToFloat(R124i.y));
R8i.w = floatBitsToInt(tempResultf);
// 19
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].y) + intBitsToFloat(R126i.y));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R7i.z)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].y), intBitsToFloat(R15i.z)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(backupReg0i)));
R6i.x = floatBitsToInt(cos((intBitsToFloat(R0i.y))/0.1591549367));
// 20
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(intBitsToFloat(R124i.z) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.y), intBitsToFloat(R7i.x)));
R17i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.y), intBitsToFloat(R8i.w)));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R8i.w)));
R5i.z = floatBitsToInt(sin((intBitsToFloat(R17i.y))/0.1591549367));
// 21
R5i.x = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(R126i.x));
R18i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].x) + intBitsToFloat(R126i.w));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].z), intBitsToFloat(R0i.z)));
R0i.w = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(R125i.z));
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R7i.z)));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].x), intBitsToFloat(R15i.z)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R5i.z)));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R8i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(R7i.x)));
R127i.z = floatBitsToInt(sin((intBitsToFloat(R0i.y))/0.1591549367));
// 1
R127i.x = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0ix));
R127i.y = floatBitsToInt(intBitsToFloat(R7i.w) + intBitsToFloat(R0i.w));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.z), intBitsToFloat(R5i.w)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R17i.z)));
R0i.w = floatBitsToInt(sin((intBitsToFloat(R0i.x))/0.1591549367));
// 2
R126i.x = floatBitsToInt(intBitsToFloat(R6i.z) + intBitsToFloat(R5i.x));
R126i.y = floatBitsToInt(max(intBitsToFloat(R11i.x), 0.0));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].y), intBitsToFloat(R0i.z)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.y), intBitsToFloat(R7i.z)));
R18i.y = floatBitsToInt(cos((intBitsToFloat(R0i.x))/0.1591549367));
// 3
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R18i.y)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R124i.y)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R5i.z)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(R8i.z)));
R5i.x = floatBitsToInt(cos((intBitsToFloat(R17i.y))/0.1591549367));
// 4
backupReg0i = R125i.z;
backupReg1i = R126i.y;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R5i.x)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R5i.x)));
R125i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.w)),intBitsToFloat(R5i.w)) + intBitsToFloat(R126i.w));
R124i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.y)),intBitsToFloat(R8i.z)) + intBitsToFloat(backupReg0i));
R126i.w = floatBitsToInt(min(intBitsToFloat(backupReg1i), 0.0));
// 5
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R124i.z) + intBitsToFloat(R127i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z), intBitsToFloat(R126i.x)));
R124i.z = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(backupReg0i));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].x), intBitsToFloat(R0i.z)));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R126i.y)));
// 6
R0i.x = floatBitsToInt(-(intBitsToFloat(R124i.x)) + intBitsToFloat(R125i.y));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R125i.z)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R18i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R126i.z)));
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R124i.w)));
// 7
backupReg0i = R126i.y;
R7i.x = floatBitsToInt(intBitsToFloat(R12i.x) + intBitsToFloat(R126i.w));
R126i.y = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R124i.z));
R124i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R16i.z)),intBitsToFloat(R17i.z)) + intBitsToFloat(R125i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(R127i.x)));
R12i.y = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV0iw));
// 8
backupReg0i = R127i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R124i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R125i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[11].w)));
R125i.w = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(R126i.x));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R124i.w)));
// 9
R124i.x = floatBitsToInt(-(intBitsToFloat(R124i.y)) + intBitsToFloat(PV0ix));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R16i.z)) + intBitsToFloat(R125i.y));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R4i.w)) + intBitsToFloat(R6i.x));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R124i.z)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(PV0iz)));
// 10
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(uf_remappedVS[11].z)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.y), intBitsToFloat(R5i.z)));
R125i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.w)), intBitsToFloat(R125i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(R126i.y)));
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.w)), intBitsToFloat(R124i.w)));
// 11
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R124i.z)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R6i.y)) + intBitsToFloat(R126i.w));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedVS[11].y)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y),intBitsToFloat(R16i.z)) + intBitsToFloat(R127i.y));
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.w)), intBitsToFloat(R124i.z)));
// 12
backupReg0i = R123i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.y), intBitsToFloat(R5i.x)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y),intBitsToFloat(R4i.w)) + intBitsToFloat(R126i.z));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R8i.z)) + intBitsToFloat(R123i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R8i.z)) + intBitsToFloat(R125i.y));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R5i.w)) + intBitsToFloat(backupReg0i));
// 13
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(R4i.w)) + intBitsToFloat(R126i.y));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R17i.z)) + intBitsToFloat(R12i.z));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R127i.w)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R17i.z)) + intBitsToFloat(R123i.y));
R6i.w = 0x3f800000;
// 14
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y),intBitsToFloat(R6i.y)) + intBitsToFloat(R125i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(R6i.y)) + intBitsToFloat(R126i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(R16i.z)) + intBitsToFloat(R125i.z));
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R126i.y)));
R16i.z = floatBitsToInt(intBitsToFloat(R11i.x) + 1.0);
// 15
backupReg0i = R5i.w;
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R8i.z)) + intBitsToFloat(R123i.z));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R17i.z)) + intBitsToFloat(R126i.x));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(backupReg0i)) + intBitsToFloat(R123i.x));
R5i.w = floatBitsToInt(intBitsToFloat(R11i.y) + 1.0);
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(backupReg0i)) + intBitsToFloat(R123i.y));
// 16
PV0ix = ((intBitsToFloat(R8i.x) == 0.0)?-1:0);
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R126i.z)));
R4i.w = floatBitsToInt(intBitsToFloat(R11i.z) + 1.0);
// 17
R1i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R6i.w))));
PV1iy = R1i.x;
PV1iz = R1i.x;
PV1iw = R1i.x;
R1i.w = ((PV0ix == 0)?(R8i.x):(0x3f800000));
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R6i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R2i.w = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(R127i.w)));
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R6i.w))));
PV1ix = tempi.x;
R3i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(R126i.y)));
// 20
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),intBitsToFloat(R6i.z)) + intBitsToFloat(R127i.x));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),intBitsToFloat(R0i.w)) + intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(R126i.z)));
// 21
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),intBitsToFloat(R8i.z)) + intBitsToFloat(PV0iw));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.z), intBitsToFloat(uf_remappedVS[12].w)));
PV0iy = uf_remappedVS[13].y;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(uf_remappedVS[12].w)));
PV0iw = uf_remappedVS[13].x;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(uf_remappedVS[12].w)));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R10i.y) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R21i.y), intBitsToFloat(uf_remappedVS[12].z)));
PV1iz = floatBitsToInt(intBitsToFloat(R10i.x) + intBitsToFloat(PV0iw));
// 2
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(PV1ix)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PV1iz)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R0i.w)) + intBitsToFloat(R7i.w));
R0i.y = floatBitsToInt(intBitsToFloat(R1i.w) * intBitsToFloat(PS0i));
R0i.y = clampFI32(R0i.y);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R6i.z)) + intBitsToFloat(R12i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R8i.z)) + intBitsToFloat(R6i.y));
// 4
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R5i.x)) + intBitsToFloat(R123i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R5i.y)) + intBitsToFloat(R123i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R7i.z)) + intBitsToFloat(R123i.w));
// 5
R0i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(R123i.y));
R1i.y = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(R123i.z));
R0i.z = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(R123i.w));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(R126i.z));
R126i.z = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(R126i.x));
PV0iw = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(R127i.x));
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
R127i.x = floatBitsToInt(-(intBitsToFloat(R0i.x)) + intBitsToFloat(PV0iz));
R127i.y = floatBitsToInt(-(intBitsToFloat(R1i.y)) + intBitsToFloat(PV0ix));
PV1iw = uf_remappedVS[17].w;
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[14].x));
// 2
PV0iz = floatBitsToInt(-(intBitsToFloat(R0i.z)) + intBitsToFloat(PV1iw));
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
R127i.x = floatBitsToInt(intBitsToFloat(R0i.w) * intBitsToFloat(0x400ccccd));
R124i.y = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(0x3ecccccd));
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[16].w) + intBitsToFloat(uf_remappedVS[15].w));
R1i.w = 0x3f800000;
R0i.y = ((intBitsToFloat(R11i.z) > 0.5)?-1:0);
// 1
R125i.x = floatBitsToInt(intBitsToFloat(R124i.y) * intBitsToFloat(0x3ecccccd));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[18].z)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].y), intBitsToFloat(uf_remappedVS[18].z)));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0x3ff33333));
R124i.z = ((intBitsToFloat(R11i.x) > 0.5)?-1:0);
// 2
backupReg0i = R127i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R126i.z)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].z), intBitsToFloat(PV1iw)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(uf_remappedVS[17].w));
PS0i = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40066666));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].z), intBitsToFloat(PS0i)));
R125i.y = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3dd70a3d));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS0i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), intBitsToFloat(uf_remappedVS[18].w)));
R124i.w = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(0x3eb33333));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R127i.y));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R127i.x));
PV0iz = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R126i.y));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R127i.z));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1ix));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(PV0iz));
R126i.x = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R126i.z));
// 6
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.z = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.w = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
R126i.z = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(R127i.x));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(R126i.x));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R127i.z = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iw = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
R127i.w = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
// 8
backupReg0i = R126i.z;
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R126i.z = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3e22f983) + 0.5);
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].x), intBitsToFloat(uf_remappedVS[18].y)));
// 9
R126i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R123i.y = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.z = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R125i.y = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
// 10
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(uf_remappedVS[18].y)));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R126i.z)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R125i.w)));
R126i.w = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PS0i = floatBitsToInt(sin((intBitsToFloat(R127i.z))/0.1591549367));
// 11
backupReg0i = R127i.z;
R124i.x = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x3e22f983));
R123i.y = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R127i.x)));
PS1i = floatBitsToInt(cos((intBitsToFloat(backupReg0i))/0.1591549367));
// 12
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].y), intBitsToFloat(R125i.x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PS1i)));
R125i.z = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R125i.x)));
PS0i = floatBitsToInt(sin((intBitsToFloat(R126i.x))/0.1591549367));
// 13
backupReg0i = R127i.z;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R126i.z)));
R125i.y = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV0iy));
R127i.z = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(R127i.w));
R127i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3e22f983));
PS1i = floatBitsToInt(sin((intBitsToFloat(R126i.w))/0.1591549367));
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R127i.x)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].y), intBitsToFloat(R124i.w)));
R126i.z = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV1ix));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R124i.w)));
PS0i = floatBitsToInt(cos((intBitsToFloat(R126i.w))/0.1591549367));
// 15
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
R1i.y = R13i.y;
R1i.z = R13i.y;
R126i.w = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(sin((intBitsToFloat(R124i.x))/0.1591549367));
// 16
R0i.x = R10i.w;
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R0i.w)));
R127i.z = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(PV1ix));
R0i.w = ((intBitsToFloat(R11i.w) > 0.5)?-1:0);
PS0i = floatBitsToInt(sin((intBitsToFloat(R125i.z))/0.1591549367));
// 17
R127i.x = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV0iy));
R2i.y = ((R0i.y == 0)?(R13i.x):(R0i.x));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R124i.y)));
R2i.w = ((intBitsToFloat(R11i.y) > 0.5)?-1:0);
PS1i = floatBitsToInt(cos((intBitsToFloat(R125i.z))/0.1591549367));
// 18
R0i.x = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV1iz));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(sin((intBitsToFloat(R127i.w))/0.1591549367));
// 19
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R125i.w)));
R0i.z = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iw));
R1i.x = R10i.w;
// 20
R1i.x = ((R124i.z == 0)?(R13i.x):(R1i.x));
R0i.y = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV1ix));
// 21
R20i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(R5i.x)) + intBitsToFloat(R2i.x));
R20i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(R5i.y)) + intBitsToFloat(R4i.y));
R20i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(R7i.z)) + intBitsToFloat(R2i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
R18i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[19].x),intBitsToFloat(uf_remappedVS[19].y),intBitsToFloat(uf_remappedVS[19].z),intBitsToFloat(uf_remappedVS[19].w))));
PV0iy = R18i.x;
PV0iz = R18i.x;
PV0iw = R18i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w))));
PV1ix = tempi.x;
R18i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R18i.z = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[22].x),intBitsToFloat(uf_remappedVS[22].y),intBitsToFloat(uf_remappedVS[22].z),intBitsToFloat(uf_remappedVS[22].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R18i.w = tempi.x;
// 4
PV0ix = uf_remappedVS[2].x & 0x200000;
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[23].y))?1.0:0.0);
R125i.z = PV1ix;
R125i.z = floatBitsToInt(intBitsToFloat(R125i.z) / 2.0);
PV0iw = floatBitsToInt((intBitsToFloat(uf_remappedVS[23].y) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[23].y));
// 5
R127i.x = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iy)));
PV1iy = uf_remappedVS[2].x & 0x80000;
PV1iz = (PV0ix == 0x200000)?-1:0;
PV1iw = floatBitsToInt(intBitsToFloat(R8i.x) * intBitsToFloat(PS0i));
R124i.z = uf_remappedVS[2].x & 0x400000;
// 6
PV0ix = (PV1iy == 0x80000)?-1:0;
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x),intBitsToFloat(uf_remappedVS[4].z)) + intBitsToFloat(PV1iw));
R127i.z = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R125i.w = ((PV1iz == 0)?(R13i.y):(R1i.y));
R124i.y = ((PV1iz == 0)?(R13i.x):(R2i.y));
// 7
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iy = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
R126i.z = ((PV0ix == 0)?(R13i.y):(R1i.z));
R127i.w = ((PV0ix == 0)?(R13i.x):(R1i.x));
R124i.x = uf_remappedVS[2].x & 0x100000;
// 8
PV0ix = (R124i.z == 0x400000)?-1:0;
R123i.y = R124i.y;
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV1ix)));
R122i.x = ((R0i.w == 0)?(R125i.w):(PV1iy));
// 9
R1i.x = ((PV0ix == 0)?(R124i.y):(R123i.y));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w),intBitsToFloat(R127i.z)) + intBitsToFloat(PV0iw));
R1i.z = ((PV0ix == 0)?(R125i.w):(R122i.x));
R125i.w = (R124i.x == 0x100000)?-1:0;
R122i.x = ((R2i.w == 0)?(R126i.z):(PV0iz));
// 10
R123i.x = R127i.w;
R11i.z = ((R125i.w == 0)?(R126i.z):(R122i.x));
R123i.w = floatBitsToInt(intBitsToFloat(R18i.z) * 0.0 + intBitsToFloat(R125i.z));
R0i.z = floatBitsToInt(intBitsToFloat(R18i.z) * 0.5 + intBitsToFloat(R125i.z));
// 11
R0i.x = floatBitsToInt(intBitsToFloat(R18i.x) * 0.5 + intBitsToFloat(R123i.w));
R11i.y = ((R125i.w == 0)?(R127i.w):(R123i.x));
R0i.w = floatBitsToInt(intBitsToFloat(R18i.z) * 0.0 + intBitsToFloat(R18i.w));
R0i.y = floatBitsToInt(intBitsToFloat(R18i.y) * -(0.5) + intBitsToFloat(R123i.w));
}
if( activeMaskStackC[3] == true ) {
// 0
R124i.x = floatBitsToInt(intBitsToFloat(R13i.y) + -(intBitsToFloat(uf_remappedVS[24].w)));
R127i.y = floatBitsToInt(intBitsToFloat(R13i.y) + -(intBitsToFloat(uf_remappedVS[25].w)));
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[24].w)) + intBitsToFloat(uf_remappedVS[25].w));
// 1
R125i.y = ((intBitsToFloat(R127i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[24].x)) + intBitsToFloat(uf_remappedVS[25].x));
R127i.w = ((intBitsToFloat(R124i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[25].w)) + intBitsToFloat(uf_remappedVS[26].w));
R2i.y = floatBitsToInt(intBitsToFloat(R13i.y) + -(intBitsToFloat(uf_remappedVS[26].w)));
R126i.z = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
R124i.y = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
// 3
R127i.x = ((intBitsToFloat(R2i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[25].x)) + intBitsToFloat(uf_remappedVS[26].x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0iw)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 4
R126i.x = floatBitsToInt(intBitsToFloat(R13i.y) + -(intBitsToFloat(uf_remappedVS[27].w)));
R126i.y = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(PS1i));
R125i.z = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[26].w)) + intBitsToFloat(uf_remappedVS[27].w));
// 5
R125i.x = floatBitsToInt(intBitsToFloat(R13i.y) + -(intBitsToFloat(uf_remappedVS[28].w)));
R1i.y = ((intBitsToFloat(R126i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R126i.z)) + intBitsToFloat(uf_remappedVS[24].x));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[24].x), intBitsToFloat(R124i.y)));
R124i.y = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 6
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(PV1iw));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R125i.z)));
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[26].x)) + intBitsToFloat(uf_remappedVS[27].x));
R127i.w = ((intBitsToFloat(R125i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS0i = floatBitsToInt(-(intBitsToFloat(R1i.y)) + 1.0);
// 7
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[27].w)) + intBitsToFloat(uf_remappedVS[28].w));
R124i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(R124i.y));
R125i.z = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
// 8
PV0ix = floatBitsToInt(intBitsToFloat(R13i.y) + -(intBitsToFloat(uf_remappedVS[29].w)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R126i.y)) + intBitsToFloat(uf_remappedVS[25].x));
R126i.z = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 9
backupReg0i = R124i.x;
R124i.x = ((intBitsToFloat(PV0ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[27].x)) + intBitsToFloat(uf_remappedVS[28].x));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R125i.z)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(R125i.y)) + intBitsToFloat(backupReg0i));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(R126i.z));
PV0iz = floatBitsToInt(-(intBitsToFloat(R124i.x)) + 1.0);
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[28].w)) + intBitsToFloat(uf_remappedVS[29].w));
// 11
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PV0ix)) + intBitsToFloat(uf_remappedVS[27].x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R124i.y)) + intBitsToFloat(uf_remappedVS[26].x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0iz)));
R124i.y = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 12
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R125i.w)) + intBitsToFloat(R126i.w));
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[28].x)) + intBitsToFloat(uf_remappedVS[29].x));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(R124i.y));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R125i.z)) + intBitsToFloat(R123i.y));
R125i.z = uf_remappedVS[30].x;
R126i.w = uf_remappedVS[30].y;
R126i.z = uf_remappedVS[30].z;
// 14
backupReg0i = R125i.x;
R125i.x = uf_remappedVS[31].y;
R124i.y = uf_remappedVS[31].x;
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(PV1ix)) + intBitsToFloat(uf_remappedVS[28].x));
// 15
backupReg0i = R125i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(uf_remappedVS[32].x)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(uf_remappedVS[32].y)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(backupReg0i));
R127i.w = uf_remappedVS[31].z;
// 16
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(uf_remappedVS[33].x)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(uf_remappedVS[33].y)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[29].x),intBitsToFloat(R124i.x)) + intBitsToFloat(R123i.z));
// 17
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(uf_remappedVS[34].x)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(uf_remappedVS[34].y)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(uf_remappedVS[33].z)));
R15i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(uf_remappedVS[33].w)));
// 18
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), intBitsToFloat(uf_remappedVS[35].y)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(uf_remappedVS[35].x)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(uf_remappedVS[34].z)));
// 19
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(uf_remappedVS[36].x)));
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[36].x)));
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(uf_remappedVS[36].x)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[32].z));
// 20
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R126i.x)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[32].w));
// 21
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R125i.y)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[35].z));
// 22
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R124i.y)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[35].w));
// 23
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R125i.x)));
R16i.z = R126i.x;
R16i.w = R127i.w;
}
if( activeMaskStackC[3] == true ) {
// 0
R19i.y = uf_remappedVS[37].x;
PV0iz = uf_remappedVS[38].x;
// 1
R19i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[11].x) * 1.0 + 0.0);
R17i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(uf_remappedVS[34].w)));
}
if( activeMaskStackC[3] == true ) {
// 0
R17i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].x), intBitsToFloat(R2i.x)));
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].x), intBitsToFloat(R2i.y)));
R17i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].x), intBitsToFloat(R2i.z)));
// 1
R22i.x = R14i.x;
R22i.y = R14i.y;
R22i.z = R14i.z;
R22i.w = R14i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
// skipped export to semanticId 255
// export
passParameterSem7 = vec4(intBitsToFloat(R22i.x), intBitsToFloat(R22i.y), intBitsToFloat(R22i.z), intBitsToFloat(R22i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.z));
}
