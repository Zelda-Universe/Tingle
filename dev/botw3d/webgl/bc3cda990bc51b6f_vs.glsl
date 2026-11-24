#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader bc3cda990bc51b6f
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[35];
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

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem7;
out vec4 passParameterSem11;
out vec4 passParameterSem4;
out vec4 passParameterSem8;
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
attrDecoder = attrDataSem6;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyz = attrDataSem5.xyz;
attrDecoder.xyz = uvec3((attrDecoder.xyz>>24)|((attrDecoder.xyz>>8)&0xFF00u)|((attrDecoder.xyz<<8)&0xFF0000u)|((attrDecoder.xyz<<24)));
attrDecoder.w = uint(0);
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), 0x3f800000);
attrDecoder = attrDataSem11;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R10i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem10;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R9i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem0;
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem3;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem4;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem8;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem7;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem2;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R12i.y = floatBitsToInt(-(intBitsToFloat(R4i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R1i.w = 0;
R2i.w = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R12i.y));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R13i.x = 0;
R13i.y = 0;
R13i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R14i.x = 0;
// 1
R4i.w = R2i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R4i.w = R1i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R4i.w == 0);
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
PS0i = int(intBitsToFloat(R3i.w));
// 1
R9i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R12i.y) >= intBitsToFloat(R9i.z));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R13i.x = 0;
R13i.y = 0;
R13i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R14i.x = 0;
// 1
R1i.w = R2i.w;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R1i.w == 0);
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
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedVS[2].x),intBitsToFloat(uf_remappedVS[2].y),intBitsToFloat(uf_remappedVS[2].z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[2].x),intBitsToFloat(uf_remappedVS[2].y),intBitsToFloat(uf_remappedVS[2].z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R0i.w = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedVS[4].x),intBitsToFloat(uf_remappedVS[4].y),intBitsToFloat(uf_remappedVS[4].z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[4].x),intBitsToFloat(uf_remappedVS[4].y),intBitsToFloat(uf_remappedVS[4].z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.y = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 3
R0i.z = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 4
predResult = (intBitsToFloat(R0i.w) > 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R0i.w));
// 1
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].x), intBitsToFloat(R127i.y)));
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].x), intBitsToFloat(R127i.y)));
// 2
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].x), intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R15i.x = 0;
// 1
R11i.x = R15i.x;
// 2
R13i.x = R15i.x;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (intBitsToFloat(R0i.y) > 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R0i.y));
// 1
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].y), intBitsToFloat(R127i.x)));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].y), intBitsToFloat(R127i.x)));
// 2
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R11i.y = 0;
R13i.y = 0;
// 1
R15i.y = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
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
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R0i.z));
// 1
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].z), intBitsToFloat(R127i.x)));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].z), intBitsToFloat(R127i.x)));
// 2
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R11i.z = 0;
R13i.z = 0;
// 1
R15i.z = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = uf_remappedVS[5].x & 0x20000;
PV0iy = uf_remappedVS[5].x & 0x10000;
R127i.z = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(R7i.y));
R127i.w = uf_remappedVS[5].x & 0x40000;
R126i.x = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[6].x));
// 1
R125i.x = R7i.z;
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) * 2.0);
R127i.y = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(R7i.z));
R126i.z = R7i.y;
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) * 2.0);
R126i.w = floatBitsToInt((intBitsToFloat(uf_remappedVS[6].x) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(float(PV0iy));
// 2
backupReg0i = R127i.x;
R127i.x = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[6].x))?1.0:0.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(uf_remappedVS[7].y)));
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(backupReg0i));
// 3
backupReg0i = R127i.w;
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R127i.w = floatBitsToInt(intBitsToFloat(R12i.y) * intBitsToFloat(R126i.x));
PS1i = floatBitsToInt(float(backupReg0i));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R124i.w = floatBitsToInt(intBitsToFloat(R127i.z) * 0.5);
R126i.x = int(intBitsToFloat(PV1ix));
// 5
R124i.x = floatBitsToInt(intBitsToFloat(R127i.y) * 0.5);
R127i.y = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(R7i.z));
R127i.z = 0 - R126i.x;
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iz)));
R125i.w = int(intBitsToFloat(PV0ix));
// 6
backupReg0i = R125i.w;
R125i.x = floatBitsToInt(floor(intBitsToFloat(R125i.x)));
R125i.y = floatBitsToInt(floor(intBitsToFloat(R126i.z)));
PV0iz = 0 - backupReg0i;
R0i.w = R7i.x;
R0i.w = floatBitsToInt(intBitsToFloat(R0i.w) * 2.0);
R126i.z = int(intBitsToFloat(PV1iw));
// 7
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(R127i.w));
R126i.y = max(R125i.w, PV0iz);
R124i.z = max(R126i.x, R127i.z);
R126i.w = floatBitsToInt(intBitsToFloat(R126i.w) + -(intBitsToFloat(backupReg0i)));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[8].w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R127i.z = floatBitsToInt(tempResultf);
// 8
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(intBitsToFloat(R124i.x) + -(0.5));
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) * 2.0);
R127i.y = floatBitsToInt(intBitsToFloat(R124i.w) + -(0.5));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
R125i.z = floatBitsToInt(intBitsToFloat(backupReg0i) * 0.5);
R124i.w = 0 - R126i.z;
R124i.x = floatBitsToInt(1.0 / intBitsToFloat(R9i.z));
// 9
PV1ix = floatBitsToInt((intBitsToFloat(R125i.y) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((intBitsToFloat(R125i.x) > 0.0)?1.0:0.0);
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(R125i.x))?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(R125i.y))?1.0:0.0);
R127i.w = floatBitsToInt(floor(intBitsToFloat(R0i.w)));
// 10
backupReg0i = R127i.x;
R127i.x = max(R126i.z, R124i.w);
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(R127i.z)));
R127i.z = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iw)));
R124i.w = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iz)));
R125i.y = floatBitsToInt(fract(intBitsToFloat(backupReg0i)));
// 11
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(R125i.z) + -(0.5));
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) * 2.0);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(uf_remappedVS[9].x)));
PV1iz = floatBitsToInt(intBitsToFloat(R12i.y) * intBitsToFloat(R124i.x));
PV1iw = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[9].y)));
// 12
R124i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].w)) + 1.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(R127i.w))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(R127i.w) > 0.0)?1.0:0.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(PV1iw)));
PS0i = floatBitsToInt(float(R124i.z));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 13
R125i.x = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R125i.y)));
R125i.z = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(uf_remappedVS[8].x));
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(R127i.z)));
PS1i = floatBitsToInt(float(R126i.y));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 14
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].y) + intBitsToFloat(R0i.y));
R126i.y = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1iy));
R124i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(R124i.w)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[9].z)));
PS0i = floatBitsToInt(exp2(intBitsToFloat(R124i.y)));
// 15
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R7i.x) + -(0.5));
R127i.y = floatBitsToInt(intBitsToFloat(R7i.y) + -(0.5));
R127i.z = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R124i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[10].w)) + intBitsToFloat(uf_remappedVS[11].w));
PS1i = floatBitsToInt(float(backupReg0i));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 16
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R126i.w)));
R124i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(R125i.x)));
R126i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].z) + intBitsToFloat(R127i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R126i.w)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R124i.x));
// 17
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R124i.z)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R124i.z)));
PV1iz = ((intBitsToFloat(uf_remappedVS[8].w) == 1.0)?-1:0);
PV1iw = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS0i));
R125i.y = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV0ix));
// 18
R125i.x = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV1iy));
R3i.y = ((PV1iz == 0)?(PV1iw):(R12i.y));
R127i.z = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(PV1ix));
R127i.w = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(R127i.w));
R125i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[10].z)) + intBitsToFloat(uf_remappedVS[11].z));
// 19
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[11].w)) + intBitsToFloat(uf_remappedVS[12].w));
R0i.y = floatBitsToInt(intBitsToFloat(R7i.z) + -(0.5));
R4i.z = floatBitsToInt(intBitsToFloat(R126i.y) + -(intBitsToFloat(uf_remappedVS[11].w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R124i.y)));
R4i.y = floatBitsToInt(1.0 / intBitsToFloat(R124i.w));
// 20
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[13].x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(uf_remappedVS[13].y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R124i.y)));
R1i.w = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV1iw));
R3i.w = floatBitsToInt(intBitsToFloat(R126i.y) + -(intBitsToFloat(uf_remappedVS[10].w)));
// 21
R0i.x = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iy));
R2i.y = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(PV0iz));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[10].y)) + intBitsToFloat(uf_remappedVS[11].y));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0ix));
R124i.w = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(R4i.y));
// 22
R3i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[11].z)) + intBitsToFloat(uf_remappedVS[12].z));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R3i.y)));
R3i.z = ((intBitsToFloat(R4i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R0i.w = floatBitsToInt(intBitsToFloat(R126i.y) + -(intBitsToFloat(uf_remappedVS[12].w)));
R4i.w = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 23
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[13].z)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R3i.y)));
R0i.z = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0iy));
R2i.w = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(R4i.y));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R124i.w)));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[10].x)) + intBitsToFloat(uf_remappedVS[11].x));
R125i.y = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(R0i.y));
R127i.z = floatBitsToInt(intBitsToFloat(R3i.x) * intBitsToFloat(R4i.w));
R127i.w = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(R2i.x));
R125i.x = ((intBitsToFloat(R3i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 1
R124i.x = ((intBitsToFloat(R0i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[11].y)) + intBitsToFloat(uf_remappedVS[12].y));
R125i.z = floatBitsToInt(-(intBitsToFloat(R3i.z)) + 1.0);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(R3i.y)));
R126i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(R4i.y));
// 2
backupReg0i = R127i.z;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1iw));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R2i.w)));
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[10].z) + intBitsToFloat(R2i.z));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(backupReg0i)));
R127i.y = floatBitsToInt(-(intBitsToFloat(R124i.x)) + 1.0);
// 3
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(R4i.w));
R126i.y = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R125i.z)));
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[11].x)) + intBitsToFloat(uf_remappedVS[12].x));
R124i.w = floatBitsToInt(intBitsToFloat(R0i.z) * intBitsToFloat(0x3e22f983) + 0.5);
// 4
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R127i.y)));
R127i.y = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(0x3e22f983) + 0.5);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(backupReg0i)));
R126i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[10].y) + intBitsToFloat(R124i.y));
R125i.y = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(R4i.w));
// 5
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[11].z) + intBitsToFloat(R127i.w));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(backupReg0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R126i.z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].z), intBitsToFloat(R126i.y)));
R127i.z = floatBitsToInt(fract(intBitsToFloat(R124i.w)));
// 6
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(fract(intBitsToFloat(R127i.y)));
R127i.y = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PV1iw));
R125i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[10].x) + intBitsToFloat(R125i.z));
R127i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3e22f983) + 0.5);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R125i.y)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R126i.z)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R126i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].y), intBitsToFloat(R126i.y)));
R126i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[11].y) + intBitsToFloat(R124i.y));
R124i.y = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 8
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PV1iz));
R127i.y = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R127i.y));
R127i.z = floatBitsToInt(fract(intBitsToFloat(R127i.w)));
R127i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R124i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[11].x) + intBitsToFloat(R124i.w));
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R126i.x)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R126i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].x), intBitsToFloat(R126i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].z), intBitsToFloat(R124i.x)));
R125i.x = floatBitsToInt(intBitsToFloat(R124i.y) * intBitsToFloat(0x3e22f983));
// 10
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(PV1iz));
R123i.y = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R126i.z = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x3e22f983));
R127i.w = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(backupReg0i));
R127i.z = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R127i.y));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R126i.x)));
R127i.y = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].y), intBitsToFloat(R124i.x)));
PV1iw = floatBitsToInt(max(intBitsToFloat(R7i.x), 0.0));
R124i.y = floatBitsToInt(sin((intBitsToFloat(R126i.z))/0.1591549367));
// 12
R127i.x = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R127i.x));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R127i.w));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R127i.z)));
R127i.w = floatBitsToInt(min(intBitsToFloat(PV1iw), 0.0));
R124i.w = floatBitsToInt(sin((intBitsToFloat(R125i.x))/0.1591549367));
// 13
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].x), intBitsToFloat(R124i.x)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R124i.y)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(uf_remappedVS[14].w)));
R127i.z = floatBitsToInt(cos((intBitsToFloat(R125i.x))/0.1591549367));
// 14
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R124i.y)));
R126i.y = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(backupReg0i));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(PV1iw)));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(uf_remappedVS[14].z)));
R125i.x = floatBitsToInt(cos((intBitsToFloat(R126i.z))/0.1591549367));
// 15
R0i.x = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(R127i.w));
R2i.y = floatBitsToInt(intBitsToFloat(R124i.z) * 0.0 + 1.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R125i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R125i.x)));
R126i.w = floatBitsToInt(sin((intBitsToFloat(R127i.y))/0.1591549367));
// 16
backupReg0i = R127i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R127i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R126i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R125i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R126i.y)));
R125i.z = floatBitsToInt(cos((intBitsToFloat(backupReg0i))/0.1591549367));
// 17
R0i.x = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV0iz));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R125i.z)));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedVS[14].y)));
R2i.w = floatBitsToInt(-(intBitsToFloat(R127i.w)) + intBitsToFloat(PV0ix));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R127i.w)));
// 18
R2i.x = floatBitsToInt(-(intBitsToFloat(R126i.w)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R124i.z)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R125i.z)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R125i.z)));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R124i.z)));
// 19
R3i.x = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(R126i.z));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R124i.z)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R125i.z)));
R1i.w = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(R127i.y));
R3i.w = 0x3f800000;
// 20
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[15].x),intBitsToFloat(uf_remappedVS[15].y),intBitsToFloat(uf_remappedVS[15].z),intBitsToFloat(uf_remappedVS[15].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R5i.w = tempi.x;
R8i.y = floatBitsToInt(intBitsToFloat(R7i.x) + 1.0);
// 21
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),intBitsToFloat(uf_remappedVS[16].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R6i.w = tempi.x;
R8i.x = floatBitsToInt(intBitsToFloat(R7i.y) + 1.0);
// 22
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[17].x),intBitsToFloat(uf_remappedVS[17].y),intBitsToFloat(uf_remappedVS[17].z),intBitsToFloat(uf_remappedVS[17].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R7i.w = tempi.x;
R3i.w = floatBitsToInt(intBitsToFloat(R7i.z) + 1.0);
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
PV0ix = uf_remappedVS[18].x;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(uf_remappedVS[19].w)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(uf_remappedVS[19].w)));
PV0iw = uf_remappedVS[18].y;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(uf_remappedVS[19].w)));
// 1
PV1ix = ((intBitsToFloat(R12i.y) == 0.0)?-1:0);
PV1iy = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(uf_remappedVS[19].z)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R3i.y)));
// 2
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(PV1iz)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R2i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(PV1iy)));
R123i.w = ((PV1ix == 0)?(R12i.y):(0x3f800000));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R2i.x)) + intBitsToFloat(R4i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R3i.z)) + intBitsToFloat(R0i.y));
R1i.z = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(PS0i));
R1i.z = clampFI32(R1i.z);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R0i.w)) + intBitsToFloat(R4i.z));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R0i.x)));
// 4
backupReg0i = R127i.x;
backupReg1i = R126i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R0i.z)) + intBitsToFloat(R123i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R1i.w)) + intBitsToFloat(R123i.w));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R3i.x)) + intBitsToFloat(R123i.y));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R3i.z)) + intBitsToFloat(PS1i));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R2i.x)) + intBitsToFloat(backupReg1i));
// 5
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),intBitsToFloat(R15i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R2i.y))));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R0i.z)) + intBitsToFloat(R122i.x));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R2i.y))));
PV0ix = tempi.x;
R1i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R124i.w = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(R125i.z));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R7i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R2i.y))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
// 8
backupReg0i = R125i.x;
backupReg1i = R125i.y;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R3i.x)) + intBitsToFloat(R126i.w));
R125i.y = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(backupReg0i));
PV0iz = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(backupReg1i));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(PV0iz));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R0i.w)) + intBitsToFloat(R124i.y));
// 10
backupReg0i = R125i.y;
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R1i.w)) + intBitsToFloat(R123i.z));
R2i.w = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV1ix));
// 11
R16i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),intBitsToFloat(R15i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R125i.x),0.0)));
PV1iy = R16i.x;
PV1iz = R16i.x;
PV1iw = R16i.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.z), intBitsToFloat(R125i.x)));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),1.0,0.0)));
PV0ix = tempi.x;
R16i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), intBitsToFloat(R125i.x)));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R16i.z = tempi.x;
PV1iw = tempi.x;
// 14
predResult = (intBitsToFloat(uf_remappedVS[20].x) != 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = uf_remappedVS[16].w;
PV0iy = uf_remappedVS[15].w;
// 1
R127i.x = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(R0i.x)));
R127i.y = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(R1i.y)));
PV1iw = uf_remappedVS[17].w;
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[20].x));
// 2
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(R0i.z)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(R126i.y));
PV1ix = clampFI32(PV1ix);
// 6
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PV1ix)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[15].w) + intBitsToFloat(uf_remappedVS[16].w));
PV0iy = ((intBitsToFloat(R7i.x) > 0.5)?-1:0);
R7i.z = ((intBitsToFloat(R7i.y) > 0.5)?-1:0);
R0i.w = 0x3f800000;
R1i.x = floatBitsToInt(-(intBitsToFloat(R9i.x)) + 1.0);
// 1
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(uf_remappedVS[21].z)));
R0i.y = R9i.y;
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[19].y), intBitsToFloat(uf_remappedVS[21].z)));
R1i.w = ((PV0iy == 0)?(R9i.x):(R1i.x));
// 2
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PV1iz)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(uf_remappedVS[21].y)));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[17].w) + intBitsToFloat(backupReg0i));
// 3
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), intBitsToFloat(uf_remappedVS[21].w)));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3dd70a3d));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[19].x), intBitsToFloat(uf_remappedVS[21].y)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R127i.x));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R126i.x));
// 5
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iy));
// 6
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
// 7
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
// 8
R123i.y = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 9
R127i.z = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R127i.w = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
// 10
PS0i = floatBitsToInt(sin((intBitsToFloat(R127i.z))/0.1591549367));
// 11
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R127i.y)));
PS1i = floatBitsToInt(cos((intBitsToFloat(R127i.z))/0.1591549367));
// 12
R7i.x = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(sin((intBitsToFloat(R127i.w))/0.1591549367));
// 13
R0i.x = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R126i.y)));
// 14
R7i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV1iz));
}
if( activeMaskStackC[3] == true ) {
// 0
R13i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R0i.x),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[22].x),intBitsToFloat(uf_remappedVS[22].y),intBitsToFloat(uf_remappedVS[22].z),intBitsToFloat(uf_remappedVS[22].w))));
PV0iy = R13i.x;
PV0iz = R13i.x;
PV0iw = R13i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R0i.x),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[23].x),intBitsToFloat(uf_remappedVS[23].y),intBitsToFloat(uf_remappedVS[23].z),intBitsToFloat(uf_remappedVS[23].w))));
PV1ix = tempi.x;
R13i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R0i.x),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[24].x),intBitsToFloat(uf_remappedVS[24].y),intBitsToFloat(uf_remappedVS[24].z),intBitsToFloat(uf_remappedVS[24].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R13i.z = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R0i.x),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[25].x),intBitsToFloat(uf_remappedVS[25].y),intBitsToFloat(uf_remappedVS[25].z),intBitsToFloat(uf_remappedVS[25].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R13i.w = tempi.x;
// 4
PV0ix = uf_remappedVS[5].x & 0x100000;
PV0iy = PV1ix;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
PV0iw = uf_remappedVS[5].x & 0x80000;
// 5
R127i.x = (PV0ix == 0x100000)?-1:0;
PV1iz = (PV0iw == 0x80000)?-1:0;
R123i.w = floatBitsToInt(intBitsToFloat(R13i.z) * 0.0 + intBitsToFloat(PV0iy));
R15i.z = floatBitsToInt(intBitsToFloat(R13i.z) * 0.5 + intBitsToFloat(PV0iy));
// 6
R15i.x = floatBitsToInt(intBitsToFloat(R13i.x) * 0.5 + intBitsToFloat(R123i.w));
R126i.y = ((PV1iz == 0)?(R9i.y):(R0i.y));
R127i.z = ((PV1iz == 0)?(R9i.x):(R1i.w));
R15i.w = floatBitsToInt(intBitsToFloat(R13i.z) * 0.0 + intBitsToFloat(R13i.w));
R15i.y = floatBitsToInt(intBitsToFloat(R13i.y) * -(0.5) + intBitsToFloat(R123i.w));
// 7
PV1iy = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
R123i.w = ((R7i.z == 0)?(R127i.z):(R127i.z));
// 8
R123i.x = ((R7i.z == 0)?(R126i.y):(PV1iy));
R7i.z = ((R127i.x == 0)?(R127i.z):(R123i.w));
// 9
R0i.y = ((R127i.x == 0)?(R126i.y):(R123i.x));
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = uf_remappedVS[26].z;
R126i.y = uf_remappedVS[26].y;
R127i.z = uf_remappedVS[26].x;
// 1
R127i.y = uf_remappedVS[27].z;
R126i.z = uf_remappedVS[27].y;
R127i.w = uf_remappedVS[27].x;
// 2
PV0ix = uf_remappedVS[28].x;
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(uf_remappedVS[29].x)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[29].y)));
// 3
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(uf_remappedVS[30].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(uf_remappedVS[30].y)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[30].z)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedVS[30].w)));
// 4
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(uf_remappedVS[31].x)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(uf_remappedVS[31].y)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(uf_remappedVS[31].z)));
// 5
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[32].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[32].x)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[32].x)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[29].z));
// 6
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R125i.z)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[29].w));
// 7
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R126i.w)));
// 8
R3i.z = 0;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = uf_remappedVS[33].x;
R14i.y = uf_remappedVS[34].x;
// 1
R14i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[14].x) * 1.0 + 0.0);
R11i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedVS[31].w)));
}
if( activeMaskStackC[3] == true ) {
// 0
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].x), intBitsToFloat(R1i.x)));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].x), intBitsToFloat(R1i.y)));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].x), intBitsToFloat(R1i.z)));
// 1
R17i.x = R10i.x;
R17i.y = R10i.y;
R17i.z = R10i.z;
R17i.w = R10i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));
// export
// skipped export to semanticId 255
// export
passParameterSem7 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.z));
// export
passParameterSem8 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.z));
}
