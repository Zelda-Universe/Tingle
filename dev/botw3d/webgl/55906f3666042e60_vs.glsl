#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 55906f3666042e60
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[49];
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem2;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem3;
ATTR_LAYOUT(0, 4) in uvec4 attrDataSem4;
ATTR_LAYOUT(0, 5) in uvec4 attrDataSem5;
ATTR_LAYOUT(0, 6) in uvec4 attrDataSem6;
ATTR_LAYOUT(0, 7) in uvec4 attrDataSem7;
ATTR_LAYOUT(0, 8) in uvec4 attrDataSem8;

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem2;
out vec4 passParameterSem3;
out vec4 passParameterSem7;
out vec4 passParameterSem8;
out vec4 passParameterSem11;
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
attrDecoder = attrDataSem3;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyz = attrDataSem2.xyz;
attrDecoder.xyz = uvec3((attrDecoder.xyz>>24)|((attrDecoder.xyz>>8)&0xFF00u)|((attrDecoder.xyz<<8)&0xFF0000u)|((attrDecoder.xyz<<24)));
attrDecoder.w = uint(0);
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), 0x3f800000);
attrDecoder = attrDataSem8;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem7;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem0;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem1;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem5;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem4;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R7i.z = floatBitsToInt(-(intBitsToFloat(R7i.y)) + 1.0);
R3i.w = 0;
R9i.w = floatBitsToInt(1.0);
// 1
R4i.w = floatBitsToInt(-(intBitsToFloat(R2i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R7i.w = floatBitsToInt(-(intBitsToFloat(R7i.x)) + 1.0);
// 2
predResult = (0.0 > intBitsToFloat(R4i.w));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R15i.x = 0;
R15i.y = 0;
R15i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R9i.x = 0;
// 1
R2i.w = R9i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R2i.w = R3i.w;
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
PS0i = int(intBitsToFloat(R1i.w));
// 1
R10i.x = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R4i.w) >= intBitsToFloat(R10i.x));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R15i.x = 0;
R15i.y = 0;
R15i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R9i.x = 0;
// 1
R3i.w = R9i.w;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R3i.w == 0);
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
R0i.y = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedVS[4].x),intBitsToFloat(uf_remappedVS[4].y),intBitsToFloat(uf_remappedVS[4].z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[4].x),intBitsToFloat(uf_remappedVS[4].y),intBitsToFloat(uf_remappedVS[4].z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.w = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 3
R0i.x = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 4
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
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R0i.y));
// 1
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].x), intBitsToFloat(R127i.y)));
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].x), intBitsToFloat(R127i.y)));
// 2
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].x), intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R13i.x = 0;
// 1
R11i.x = R13i.x;
// 2
R12i.x = R13i.x;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
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
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R0i.w));
// 1
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].y), intBitsToFloat(R127i.x)));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].y), intBitsToFloat(R127i.x)));
// 2
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R11i.y = 0;
R12i.y = 0;
// 1
R13i.y = 0;
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
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].z), intBitsToFloat(R127i.x)));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].z), intBitsToFloat(R127i.x)));
// 2
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R11i.z = 0;
R12i.z = 0;
// 1
R13i.z = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R4i.w) + intBitsToFloat(uf_remappedVS[5].z));
R127i.w = floatBitsToInt(max(intBitsToFloat(R5i.x), 0.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[6].z));
// 1
PV1ix = uf_remappedVS[7].x & int(1);
R127i.y = uf_remappedVS[7].x & 0x2;
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(uf_remappedVS[5].x)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(PS0i));
R126i.w = uf_remappedVS[7].x & 0x4;
// 2
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(uf_remappedVS[8].y)));
R126i.y = floatBitsToInt(min(intBitsToFloat(R127i.w), 0.0));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PV1iw));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(uf_remappedVS[8].z)));
PS0i = floatBitsToInt(float(PV1ix));
// 3
backupReg0i = R127i.y;
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb));
R127i.y = floatBitsToInt(fract(intBitsToFloat(PV0iz)));
R127i.z = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R127i.w = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PS1i = floatBitsToInt(float(backupReg0i));
// 4
backupReg0i = R126i.w;
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R123i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R126i.w = floatBitsToInt(intBitsToFloat(R127i.y) + -(0.5));
PS0i = floatBitsToInt(float(backupReg0i));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(R127i.w)));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R127i.w = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iz)));
// 6
R123i.x = ((intBitsToFloat(R126i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].x), intBitsToFloat(R127i.y)));
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R126i.w = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iy)));
R125i.w = int(intBitsToFloat(PV1ix));
// 7
R127i.x = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
PV1iy = 0 - R125i.w;
PV1iz = floatBitsToInt(-(intBitsToFloat(PV0iy)) + 1.0);
PV1iw = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
R127i.y = int(intBitsToFloat(R127i.w));
// 8
backupReg0i = R126i.w;
PV0ix = 0 - R127i.y;
R125i.y = max(R125i.w, PV1iy);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].x), intBitsToFloat(PV1iw)));
R126i.w = floatBitsToInt(max(intBitsToFloat(PV1iz), -(intBitsToFloat(PV1iz))));
R126i.x = int(intBitsToFloat(backupReg0i));
// 9
PV1ix = floatBitsToInt(-(intBitsToFloat(PV0iz)) + 1.0);
PV1iy = 0 - R126i.x;
R127i.z = max(R127i.y, PV0ix);
R1i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].x)) + 1.0);
PS1i = floatBitsToInt(cos((intBitsToFloat(R127i.x))/0.1591549367));
// 10
R126i.x = max(R126i.x, PV1iy);
R126i.z = floatBitsToInt(max(intBitsToFloat(PV1ix), -(intBitsToFloat(PV1ix))));
PV0iw = floatBitsToInt(intBitsToFloat(PS1i) + 1.0);
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
R6i.x = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(R126i.y));
// 11
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(uf_remappedVS[8].x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].x), intBitsToFloat(PV0iw)));
R127i.x = floatBitsToInt(float(R125i.y));
// 12
R125i.x = floatBitsToInt(-(intBitsToFloat(PV1iz)) + 1.0);
R2i.w = ((intBitsToFloat(uf_remappedVS[9].x) == 1.0)?-1:0);
R125i.y = floatBitsToInt(float(R127i.z));
// 13
PS1i = floatBitsToInt(float(R126i.x));
// 14
R17i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.w),intBitsToFloat(R126i.z),0.0)));
PV0iy = R17i.x;
PV0iz = R17i.x;
PV0iw = R17i.x;
// 15
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.x), intBitsToFloat(R124i.w)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.x), intBitsToFloat(R124i.x)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.x), intBitsToFloat(backupReg0i)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[10].y)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[10].z)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[10].w)));
// 1
R9i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(R4i.w));
// 2
predResult = (R2i.w != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(R9i.y)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].w), intBitsToFloat(PV0ix)));
// 2
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].x), intBitsToFloat(PV1iw)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].y), intBitsToFloat(PV1iw)));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].z), intBitsToFloat(PV1iw)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
tempResultf = max(0.0, abs(intBitsToFloat(uf_remappedVS[9].x)));
tempResultf = log2(tempResultf);
PS0i = floatBitsToInt(tempResultf);
// 1
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f317218));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[9].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(PS1i)));
R127i.y = ((intBitsToFloat(uf_remappedVS[9].x) == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R1i.w));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R9i.y) + -(intBitsToFloat(PV1iz)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].w), intBitsToFloat(PV1ix)));
// 9
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].x), intBitsToFloat(PV0iw)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].y), intBitsToFloat(PV0iw)));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].z), intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = uf_remappedVS[12].x;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
PV0iy = uf_remappedVS[12].y;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R0i.z)));
R0i.w = 0x3f800000;
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[9].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV0ix));
R4i.z = 0x3f800000;
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(PS0i)));
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R1i.w));
// 2
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1iy)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PV1ix)));
R127i.z = floatBitsToInt((intBitsToFloat(uf_remappedVS[13].x) > 0.0)?1.0:0.0);
R3i.w = floatBitsToInt(1.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iw)));
// 3
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[13].x))?1.0:0.0);
PV1iy = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R13i.z)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[13].x));
// 4
R126i.x = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt(intBitsToFloat(R4i.w) * intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(R127i.x));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R13i.y)) + intBitsToFloat(PV1iz));
// 5
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R13i.x)) + intBitsToFloat(R122i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(uf_remappedVS[14].y)) + intBitsToFloat(PV0iy));
R123i.z = ((R2i.w == 0)?(PV0iw):(R9i.y));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R12i.z)));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R123i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.z)));
R127i.z = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R123i.z)));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R12i.y)) + intBitsToFloat(PS1i));
// 7
R127i.x = floatBitsToInt(intBitsToFloat(R6i.z) + intBitsToFloat(PV0iw));
R127i.y = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R11i.z)));
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R12i.x)) + intBitsToFloat(R122i.x));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(PV1iw),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R16i.z = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1iz)));
// 9
R6i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(R127i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(R127i.y)));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[15].x)) + intBitsToFloat(uf_remappedVS[16].x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R10i.x));
// 10
R10i.x = floatBitsToInt(intBitsToFloat(R4i.w) * intBitsToFloat(PS1i));
R1i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV1iz));
R1i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R127i.z)));
// 11
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x),intBitsToFloat(PV0iw)) + intBitsToFloat(PS0i));
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[15].y)) + intBitsToFloat(uf_remappedVS[16].y));
// 12
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[15].w)) + intBitsToFloat(uf_remappedVS[16].w));
R6i.y = floatBitsToInt(intBitsToFloat(R6i.z) + -(intBitsToFloat(uf_remappedVS[15].w)));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[15].z)) + intBitsToFloat(uf_remappedVS[16].z));
R6i.w = floatBitsToInt(intBitsToFloat(R6i.z) + -(intBitsToFloat(uf_remappedVS[16].w)));
// 13
R1i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[16].x)) + intBitsToFloat(uf_remappedVS[17].x));
R1i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[16].y)) + intBitsToFloat(uf_remappedVS[17].y));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 14
R3i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[16].z)) + intBitsToFloat(uf_remappedVS[17].z));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[16].w)) + intBitsToFloat(uf_remappedVS[17].w));
// 15
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(PV0iw)) + intBitsToFloat(uf_remappedVS[15].x));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(PV0iy)) + intBitsToFloat(uf_remappedVS[15].z));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(PV0iz)) + intBitsToFloat(uf_remappedVS[15].y));
R2i.x = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[18].x),intBitsToFloat(uf_remappedVS[18].y),intBitsToFloat(uf_remappedVS[18].z),intBitsToFloat(uf_remappedVS[18].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R9i.w = tempi.x;
// 1
R9i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(PV0ix)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R0i.z),intBitsToFloat(R4i.z))));
PV1iy = R9i.x;
PV1iz = R9i.x;
PV1iw = R9i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[19].x),intBitsToFloat(uf_remappedVS[19].y),intBitsToFloat(uf_remappedVS[19].z),intBitsToFloat(uf_remappedVS[19].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R9i.w = tempi.x;
R127i.w = floatBitsToInt(intBitsToFloat(R1i.x) * intBitsToFloat(R2i.x));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),intBitsToFloat(R12i.z),intBitsToFloat(PV0ix)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R0i.z),intBitsToFloat(R4i.z))));
PV1ix = tempi.x;
R3i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.z = floatBitsToInt(intBitsToFloat(R1i.w) * intBitsToFloat(R2i.x));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R0i.w = tempi.x;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(PV0ix)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R0i.z),intBitsToFloat(R4i.z))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R1i.z = tempi.x;
PV1iw = tempi.x;
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w),intBitsToFloat(R127i.w)) + intBitsToFloat(uf_remappedVS[16].x));
// 6
R4i.x = floatBitsToInt(intBitsToFloat(R6i.z) + -(intBitsToFloat(uf_remappedVS[17].w)));
PV0iy = floatBitsToInt(intBitsToFloat(R3i.x) * intBitsToFloat(R2i.x));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w),intBitsToFloat(R127i.z)) + intBitsToFloat(uf_remappedVS[16].y));
// 7
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w),intBitsToFloat(PV0iy)) + intBitsToFloat(uf_remappedVS[16].z));
// 8
R2i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[17].x)) + intBitsToFloat(uf_remappedVS[21].x));
R0i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[17].y)) + intBitsToFloat(uf_remappedVS[21].y));
// 9
PV1iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[17].w)) + intBitsToFloat(uf_remappedVS[21].w));
R0i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[17].z)) + intBitsToFloat(uf_remappedVS[21].z));
// 10
R3i.x = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
}
if( activeMaskStackC[3] == true ) {
// 0
R15i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R3i.y),intBitsToFloat(R1i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[22].x),intBitsToFloat(uf_remappedVS[22].y),intBitsToFloat(uf_remappedVS[22].z),intBitsToFloat(uf_remappedVS[22].w))));
PV0iy = R15i.x;
PV0iz = R15i.x;
PV0iw = R15i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R3i.y),intBitsToFloat(R1i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[23].x),intBitsToFloat(uf_remappedVS[23].y),intBitsToFloat(uf_remappedVS[23].z),intBitsToFloat(uf_remappedVS[23].w))));
PV1ix = tempi.x;
R15i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.w = floatBitsToInt(intBitsToFloat(R2i.x) * intBitsToFloat(R3i.x));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R3i.y),intBitsToFloat(R1i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[24].x),intBitsToFloat(uf_remappedVS[24].y),intBitsToFloat(uf_remappedVS[24].z),intBitsToFloat(uf_remappedVS[24].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R15i.z = tempi.x;
PV0iw = tempi.x;
R127i.z = floatBitsToInt(intBitsToFloat(R0i.w) * intBitsToFloat(R3i.x));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R3i.y),intBitsToFloat(R1i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[25].x),intBitsToFloat(uf_remappedVS[25].y),intBitsToFloat(uf_remappedVS[25].z),intBitsToFloat(uf_remappedVS[25].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R15i.w = tempi.x;
PS1i = floatBitsToInt(intBitsToFloat(R0i.z) * intBitsToFloat(R3i.x));
// 4
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R127i.w)) + intBitsToFloat(uf_remappedVS[17].x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R127i.z)) + intBitsToFloat(uf_remappedVS[17].y));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(PS1i)) + intBitsToFloat(uf_remappedVS[17].z));
PV0iw = PV1ix;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
R127i.y = ((intBitsToFloat(R6i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 5
R126i.x = ((intBitsToFloat(R6i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R123i.z = floatBitsToInt(intBitsToFloat(R15i.z) * 0.0 + intBitsToFloat(PV0iw));
R14i.w = floatBitsToInt(intBitsToFloat(R15i.z) * 0.0 + intBitsToFloat(R15i.w));
R14i.z = floatBitsToInt(intBitsToFloat(R15i.z) * 0.5 + intBitsToFloat(PV0iw));
// 6
R14i.x = floatBitsToInt(intBitsToFloat(R15i.x) * 0.5 + intBitsToFloat(R123i.z));
R14i.y = floatBitsToInt(intBitsToFloat(R15i.y) * -(0.5) + intBitsToFloat(R123i.z));
PV0iz = floatBitsToInt(intBitsToFloat(R6i.z) + -(intBitsToFloat(uf_remappedVS[21].w)));
R127i.w = ((intBitsToFloat(R4i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 7
PV1ix = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
R125i.y = ((intBitsToFloat(PV0iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iz = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
R126i.w = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
R6i.w = uf_remappedVS[26].x;
// 8
backupReg0i = R127i.y;
PV0ix = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[15].x), intBitsToFloat(R126i.w)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[15].y), intBitsToFloat(R126i.w)));
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[15].z), intBitsToFloat(R126i.w)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R125i.w)) + intBitsToFloat(PS0i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R125i.w)) + intBitsToFloat(PV0iz));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0ix)));
// 10
backupReg0i = R123i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R125i.w)) + intBitsToFloat(PV1ix));
R124i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[27].x)) + intBitsToFloat(uf_remappedVS[28].x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R127i.y)) + intBitsToFloat(backupReg0i));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[27].y)) + intBitsToFloat(uf_remappedVS[28].y));
// 11
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R127i.y)) + intBitsToFloat(backupReg0i));
R125i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[27].z)) + intBitsToFloat(uf_remappedVS[28].z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.z));
PS1i = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[27].w)) + intBitsToFloat(uf_remappedVS[28].w));
// 12
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(R125i.y)) + intBitsToFloat(R123i.w));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(R125i.y)) + intBitsToFloat(R123i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.y));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 13
R0i.x = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(PS0i));
R1i.y = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS0i));
R3i.z = floatBitsToInt(intBitsToFloat(R124i.y) * intBitsToFloat(PS0i));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(R125i.y)) + intBitsToFloat(R123i.z));
// 14
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[28].y)) + intBitsToFloat(uf_remappedVS[29].y));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[28].x)) + intBitsToFloat(uf_remappedVS[29].x));
// 15
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[28].w)) + intBitsToFloat(uf_remappedVS[29].w));
R125i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[28].z)) + intBitsToFloat(uf_remappedVS[29].z));
// 16
R125i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[29].y)) + intBitsToFloat(uf_remappedVS[30].y));
R125i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[29].x)) + intBitsToFloat(uf_remappedVS[30].x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 17
R3i.x = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(PS0i));
R2i.y = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS0i));
R6i.z = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS0i));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[29].z)) + intBitsToFloat(uf_remappedVS[30].z));
PS1i = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[29].w)) + intBitsToFloat(uf_remappedVS[30].w));
// 18
R4i.x = uf_remappedVS[31].x;
R4i.y = uf_remappedVS[31].y;
R4i.z = uf_remappedVS[31].z;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 19
R2i.x = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS0i));
R0i.y = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(PS0i));
R0i.z = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(PS0i));
}
if( activeMaskStackC[3] == true ) {
// 0
R13i.x = floatBitsToInt(intBitsToFloat(R9i.x) + -(intBitsToFloat(R4i.x)));
R13i.y = floatBitsToInt(intBitsToFloat(R3i.y) + -(intBitsToFloat(R4i.y)));
R13i.z = floatBitsToInt(intBitsToFloat(R1i.z) + -(intBitsToFloat(R4i.z)));
R127i.w = floatBitsToInt((intBitsToFloat(uf_remappedVS[13].z) > 0.0)?1.0:0.0);
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(uf_remappedVS[32].x)));
// 1
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(uf_remappedVS[32].y)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(uf_remappedVS[32].z)));
R11i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(uf_remappedVS[32].w)));
// 2
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[13].z))?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[13].z));
// 3
R127i.x = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(PV0iy)));
PV1iz = floatBitsToInt(intBitsToFloat(R4i.w) * intBitsToFloat(PS0i));
// 4
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(uf_remappedVS[14].w)) + intBitsToFloat(PV1iz));
R127i.w = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
// 5
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
// 6
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV1ix)));
// 7
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x),intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iz));
}
if( activeMaskStackC[3] == true ) {
// 0
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(uf_remappedVS[33].x)));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(uf_remappedVS[33].x)));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(uf_remappedVS[33].x)));
PV0iw = floatBitsToInt(intBitsToFloat(R3i.y) + -(intBitsToFloat(uf_remappedVS[27].w)));
// 1
R127i.x = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R0i.x)) + intBitsToFloat(uf_remappedVS[27].z));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R1i.y)) + intBitsToFloat(uf_remappedVS[27].y));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R3i.z)) + intBitsToFloat(uf_remappedVS[27].x));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R3i.y) + -(intBitsToFloat(uf_remappedVS[28].w)));
R125i.y = floatBitsToInt(intBitsToFloat(R3i.y) + -(intBitsToFloat(uf_remappedVS[29].w)));
R126i.z = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
// 3
R126i.x = ((intBitsToFloat(PV0ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R3i.x)) + intBitsToFloat(uf_remappedVS[28].z));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R2i.y)) + intBitsToFloat(uf_remappedVS[28].y));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R6i.z)) + intBitsToFloat(uf_remappedVS[28].x));
R6i.z = ((intBitsToFloat(R125i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 4
backupReg0i = R125i.y;
backupReg1i = R0i.z;
PV0ix = floatBitsToInt(-(intBitsToFloat(R6i.z)) + 1.0);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R2i.x)) + intBitsToFloat(uf_remappedVS[29].z));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R0i.y)) + intBitsToFloat(uf_remappedVS[29].y));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(backupReg1i)) + intBitsToFloat(uf_remappedVS[29].x));
PS0i = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
// 5
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV0ix)));
PV1iy = floatBitsToInt(intBitsToFloat(R3i.y) + -(intBitsToFloat(uf_remappedVS[30].w)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[27].x), intBitsToFloat(R126i.z)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[27].y), intBitsToFloat(R126i.z)));
// 6
backupReg0i = R126i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R127i.z)) + intBitsToFloat(PS1i));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R127i.z)) + intBitsToFloat(PV1iw));
R126i.z = ((intBitsToFloat(PV1iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[27].z), intBitsToFloat(backupReg0i)));
R3i.y = uf_remappedVS[34].x;
// 7
backupReg0i = R124i.y;
backupReg1i = R127i.z;
PV1ix = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.x));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(backupReg1i)) + intBitsToFloat(PV0iw));
PS1i = ((intBitsToFloat(R5i.x) > 0.5)?-1:0);
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.w));
R0i.y = ((PS1i == 0)?(R7i.x):(R7i.w));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(PV1ix)));
PV0iw = ((intBitsToFloat(R5i.y) > 0.5)?-1:0);
PS0i = ((intBitsToFloat(R5i.z) > 0.5)?-1:0);
// 9
R3i.x = ((PV0iw == 0)?(R7i.y):(R7i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(PV0iz)) + intBitsToFloat(R123i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(PV0iz)) + intBitsToFloat(R124i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PV0iz)) + intBitsToFloat(R127i.z));
R6i.w = ((PS0i == 0)?(R7i.x):(R7i.w));
// 10
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[30].x),intBitsToFloat(R126i.z)) + intBitsToFloat(R123i.w));
PV0iy = ((intBitsToFloat(R5i.w) > 0.5)?-1:0);
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[30].z),intBitsToFloat(R126i.z)) + intBitsToFloat(R123i.y));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[30].y),intBitsToFloat(R126i.z)) + intBitsToFloat(R123i.z));
PS0i = ((intBitsToFloat(R5i.y) > 0.5)?-1:0);
// 11
PV1ix = ((intBitsToFloat(R5i.z) > 0.5)?-1:0);
R2i.y = ((PS0i == 0)?(R7i.x):(R7i.w));
R3i.z = ((PV0iy == 0)?(R7i.y):(R7i.z));
PS1i = int(intBitsToFloat(uf_remappedVS[35].z));
// 12
R0i.x = ((PV1ix == 0)?(R7i.y):(R7i.z));
R126i.w = floatBitsToInt(float(PS1i));
// 13
PV1iy = floatBitsToInt((0.0 >= abs(intBitsToFloat(R126i.w)))?1.0:0.0);
PV1iz = floatBitsToInt(-(abs(intBitsToFloat(R126i.w))) + 0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.w));
// 14
R127i.x = ((intBitsToFloat(PV1iy) == 0.0)?(0):(PV1iz));
R6i.z = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
// 15
PV1iw = floatBitsToInt(abs(intBitsToFloat(R126i.w)) + intBitsToFloat(R127i.x));
// 16
R123i.z = ((-(intBitsToFloat(R127i.x)) > 0.0)?(PV1iw):(R127i.x));
// 17
R123i.y = ((intBitsToFloat(R126i.w) == 0.0)?(0):(R123i.z));
// 18
R10i.x = int(intBitsToFloat(R123i.y));
}
if( activeMaskStackC[3] == true ) {
// 0
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(uf_remappedVS[36].x)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(uf_remappedVS[36].y)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[36].z)));
R12i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(uf_remappedVS[36].w)));
// 1
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[33].x), intBitsToFloat(R1i.x)));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[33].x), intBitsToFloat(R1i.y)));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[33].x), intBitsToFloat(R0i.z)));
PV1iw = floatBitsToInt(trunc(intBitsToFloat(R6i.z)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[35].z));
// 2
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].x), intBitsToFloat(PS1i)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(uf_remappedVS[37].x)));
R126i.w = floatBitsToInt(intBitsToFloat(R126i.w) * 2.0);
R2i.x = int(intBitsToFloat(PV1iw));
// 3
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[35].w));
// 4
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].y), intBitsToFloat(PS1i)));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[38].z) + intBitsToFloat(uf_remappedVS[37].x));
// 6
R3i.y = floatBitsToInt(-(intBitsToFloat(R126i.w)) + intBitsToFloat(PV1iz));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = uf_remappedVS[7].x & 0x80000;
PV0iw = uf_remappedVS[7].x & 0x100000;
// 1
PV1ix = uf_remappedVS[7].x & 0x200000;
PV1iy = uf_remappedVS[7].x & 0x400000;
PV1iz = (PV0iw == 0x100000)?-1:0;
PV1iw = (PV0ix == 0x80000)?-1:0;
// 2
R127i.x = ((PV1iw == 0)?(R7i.x):(R0i.y));
PV0iy = (PV1ix == 0x200000)?-1:0;
PV0iz = (PV1iy == 0x400000)?-1:0;
R126i.w = ((PV1iz == 0)?(R7i.y):(R3i.x));
PS0i = uf_remappedVS[7].x & 0x800000;
// 3
PV1ix = uf_remappedVS[7].x & 0x1000000;
R127i.y = ((PV0iz == 0)?(R7i.y):(R3i.z));
R124i.z = ((PV0iy == 0)?(R7i.x):(R6i.w));
PV1iw = (PS0i == 0x800000)?-1:0;
PS1i = uf_remappedVS[7].y & int(1);
// 4
R3i.x = ((PV1iw == 0)?(R7i.x):(R2i.y));
R124i.y = (int(1) != PS1i)?-1:0;
PV0iz = (PV1ix == 0x1000000)?-1:0;
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(uf_remappedVS[37].y)));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
PS0i = floatBitsToInt(intBitsToFloat(uf_remappedVS[38].w) + intBitsToFloat(uf_remappedVS[37].y));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[39].y) + intBitsToFloat(uf_remappedVS[39].w));
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[39].x) + intBitsToFloat(uf_remappedVS[39].z));
PV1iz = floatBitsToInt(-(intBitsToFloat(PV0iw)) + intBitsToFloat(PS0i));
R2i.w = ((PV0iz == 0)?(R7i.y):(R0i.x));
R125i.y = floatBitsToInt(float(R10i.x));
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(uf_remappedVS[39].z)) + intBitsToFloat(PV1iy));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.w)),intBitsToFloat(uf_remappedVS[38].x)) + -(intBitsToFloat(R3i.y)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(uf_remappedVS[39].w)) + intBitsToFloat(PV1ix));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[38].y)) + intBitsToFloat(PV1iz));
PS0i = floatBitsToInt(float(R2i.x));
// 7
backupReg0i = R123i.y;
backupReg1i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.x)),intBitsToFloat(PS0i)) + intBitsToFloat(R123i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[37].z)) + intBitsToFloat(R123i.x));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[37].w)) + intBitsToFloat(R123i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R125i.y)) + intBitsToFloat(backupReg0i));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i),intBitsToFloat(R6i.z)) + -(0.5));
// 8
backupReg0i = R123i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R6i.x)) + -(0.5));
R123i.y = ((R124i.y == 0)?(0):(int(1)));
R125i.z = ((R124i.y == 0)?(0):(0x2));
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R122i.x)) + intBitsToFloat(R123i.w));
PS0i = int(intBitsToFloat(uf_remappedVS[40].z));
// 9
backupReg0i = R127i.x;
R127i.x = (R123i.y == int(1))?-1:0;
R124i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[41].z) + intBitsToFloat(uf_remappedVS[42].x));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R123i.x)) + -(intBitsToFloat(backupReg0i)));
PV1iw = (R123i.y == 0x2)?-1:0;
R126i.w = floatBitsToInt(float(PS0i));
// 10
backupReg0i = R126i.w;
R126i.x = ((R127i.x == 0)?(R5i.x):(R5i.y));
R123i.y = ((PV1iw == 0)?(R5i.y):(R5i.x));
R123i.z = ((PV1iw == 0)?(R5i.x):(R5i.z));
R125i.w = ((R127i.x == 0)?(R5i.y):(R5i.z));
R126i.z = floatBitsToInt(-(abs(intBitsToFloat(backupReg0i))) + 0.0);
// 11
R123i.x = ((R127i.x == 0)?(R123i.z):(R5i.y));
PV1iy = floatBitsToInt((0.0 >= abs(intBitsToFloat(R126i.w)))?1.0:0.0);
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[41].w) + intBitsToFloat(uf_remappedVS[42].y));
R123i.w = ((R127i.x == 0)?(R123i.y):(R5i.z));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.w));
// 12
R127i.x = ((intBitsToFloat(PV1iy) == 0.0)?(0):(R126i.z));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[42].y), intBitsToFloat(R123i.w)));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
PV0iz = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[42].x), intBitsToFloat(R123i.x)));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[40].z));
// 13
PV1ix = floatBitsToInt(trunc(intBitsToFloat(PV0iz)));
R124i.y = floatBitsToInt(-(intBitsToFloat(PV0iw)) + intBitsToFloat(R124i.y));
R127i.z = floatBitsToInt(-(intBitsToFloat(PV0iy)) + intBitsToFloat(R127i.z));
PV1iw = floatBitsToInt(abs(intBitsToFloat(R126i.w)) + intBitsToFloat(R127i.x));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].x), intBitsToFloat(PS0i)));
// 14
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R126i.z)) + -(0.5));
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[43].x) + intBitsToFloat(uf_remappedVS[43].z));
R123i.z = ((-(intBitsToFloat(R127i.x)) > 0.0)?(PV1iw):(R127i.x));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[43].y) + intBitsToFloat(uf_remappedVS[43].w));
R127i.x = int(intBitsToFloat(PV1ix));
// 15
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[43].z),intBitsToFloat(R126i.x)) + intBitsToFloat(PV0iy));
R123i.y = ((intBitsToFloat(R126i.w) == 0.0)?(0):(R123i.z));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[43].w),intBitsToFloat(R125i.w)) + intBitsToFloat(PV0iw));
R127i.w = (R125i.z == int(1))?-1:0;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[40].w));
// 16
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].y), intBitsToFloat(PS1i)));
R124i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.w)),intBitsToFloat(uf_remappedVS[41].x)) + -(intBitsToFloat(R124i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[41].y)) + intBitsToFloat(R127i.z));
R126i.w = (R125i.z == 0x2)?-1:0;
PS0i = int(intBitsToFloat(R123i.y));
// 17
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R125i.x)) + -(0.5));
R123i.y = ((R126i.w == 0)?(R5i.x):(R5i.z));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[42].w)) + intBitsToFloat(R124i.z));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[42].z)) + intBitsToFloat(backupReg0i));
PS1i = floatBitsToInt(float(PS0i));
// 18
backupReg0i = R127i.x;
R127i.x = ((R127i.w == 0)?(R123i.y):(R5i.y));
R123i.y = ((R126i.w == 0)?(R5i.y):(R5i.x));
R6i.z = ((R127i.w == 0)?(R5i.x):(R5i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(PS1i)) + intBitsToFloat(R124i.y));
PS0i = floatBitsToInt(float(backupReg0i));
// 19
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.x)),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.z));
R123i.y = ((R127i.w == 0)?(R123i.y):(R5i.z));
R3i.z = ((R127i.w == 0)?(R5i.y):(R5i.z));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R124i.x)) + intBitsToFloat(R123i.w));
PS1i = int(intBitsToFloat(uf_remappedVS[44].z));
// 20
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[45].z) + intBitsToFloat(uf_remappedVS[46].x));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[46].y), intBitsToFloat(R123i.y)));
R124i.y = floatBitsToInt(intBitsToFloat(R124i.y) * 2.0);
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R126i.x)) + -(intBitsToFloat(R123i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[46].x), intBitsToFloat(R127i.x)));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
R1i.w = floatBitsToInt(float(PS1i));
// 21
PV1ix = floatBitsToInt((0.0 >= abs(intBitsToFloat(R1i.w)))?1.0:0.0);
PV1iy = floatBitsToInt(-(intBitsToFloat(PV0iw)) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(-(abs(intBitsToFloat(R1i.w))) + 0.0);
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[45].w) + intBitsToFloat(uf_remappedVS[46].y));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R1i.w));
// 22
R5i.x = ((intBitsToFloat(PV1ix) == 0.0)?(0):(PV1iz));
R5i.y = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
R5i.z = floatBitsToInt(-(intBitsToFloat(R124i.y)) + intBitsToFloat(PV1iw));
R3i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.w)),intBitsToFloat(uf_remappedVS[45].x)) + -(intBitsToFloat(PV1iy)));
R5i.w = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[44].z));
}
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = floatBitsToInt(intBitsToFloat(R6i.w) + 0.5);
PV0iy = floatBitsToInt(trunc(intBitsToFloat(R5i.y)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[44].x), intBitsToFloat(R5i.w)));
PV0iw = floatBitsToInt(abs(intBitsToFloat(R1i.w)) + intBitsToFloat(R5i.x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[44].w));
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[44].y), intBitsToFloat(PS0i)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[45].y)) + intBitsToFloat(R5i.z));
R123i.z = ((-(intBitsToFloat(R5i.x)) > 0.0)?(PV0iw):(R5i.x));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R124i.z)) + -(0.5));
PS1i = int(intBitsToFloat(PV0iy));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[47].x) + intBitsToFloat(uf_remappedVS[47].z));
R123i.y = ((intBitsToFloat(R1i.w) == 0.0)?(0):(R123i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R127i.x)) + -(0.5));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[47].y) + intBitsToFloat(uf_remappedVS[47].w));
PS0i = floatBitsToInt(float(PS1i));
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[47].z),intBitsToFloat(R6i.z)) + intBitsToFloat(PV0ix));
R124i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.x)),intBitsToFloat(PS0i)) + intBitsToFloat(R124i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[47].w),intBitsToFloat(R3i.z)) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[10].x) * 1.0);
PS1i = int(intBitsToFloat(R123i.y));
// 4
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.x), intBitsToFloat(PV1iw)));
R0i.y = floatBitsToInt(intBitsToFloat(R0i.z) + 0.5);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[46].w)) + intBitsToFloat(R123i.z));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[46].z)) + intBitsToFloat(R123i.x));
PS0i = floatBitsToInt(float(PS1i));
// 5
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R127i.z)) + -(intBitsToFloat(R124i.y)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(PS0i)) + intBitsToFloat(R3i.w));
R0i.z = floatBitsToInt(intBitsToFloat(R0i.w) + 0.5);
// 6
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R125i.w)) + intBitsToFloat(R123i.w));
R0i.w = floatBitsToInt(intBitsToFloat(R1i.z) + 0.5);
// 7
R17i.x = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
R17i.y = floatBitsToInt(intBitsToFloat(R127i.z) + 0.5);
}
if( activeMaskStackC[3] == true ) {
// 0
R9i.y = uf_remappedVS[48].x;
// 1
R18i.x = R8i.x;
R18i.y = R8i.y;
R18i.z = R8i.z;
R18i.w = R8i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
// export
passParameterSem2 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.z));
// export
passParameterSem9 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.z));
}
