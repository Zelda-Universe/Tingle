#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader ebb4748fc1530dae
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[57];
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
ivec4 R19i = ivec4(0);
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
attrDecoder = attrDataSem4;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyz = attrDataSem3.xyz;
attrDecoder.xyz = uvec3((attrDecoder.xyz>>24)|((attrDecoder.xyz>>8)&0xFF00u)|((attrDecoder.xyz<<8)&0xFF0000u)|((attrDecoder.xyz<<24)));
attrDecoder.w = uint(0);
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), 0x3f800000);
attrDecoder = attrDataSem9;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R9i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem8;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem1;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem2;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem6;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem5;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem0;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R8i.z = floatBitsToInt(-(intBitsToFloat(R8i.y)) + 1.0);
R1i.w = 0;
R8i.w = floatBitsToInt(1.0);
// 1
R4i.w = floatBitsToInt(-(intBitsToFloat(R3i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R5i.w = floatBitsToInt(-(intBitsToFloat(R8i.x)) + 1.0);
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
R10i.x = 0;
R10i.y = 0;
R10i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R11i.x = 0;
// 1
R3i.w = R8i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R3i.w = R1i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R3i.w == 0);
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
PS0i = int(intBitsToFloat(R2i.w));
// 1
R12i.x = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R4i.w) >= intBitsToFloat(R12i.x));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R10i.x = 0;
R10i.y = 0;
R10i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R11i.x = 0;
// 1
R1i.w = R8i.w;
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
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].x), intBitsToFloat(R127i.y)));
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].x), intBitsToFloat(R127i.y)));
// 2
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].x), intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R14i.x = 0;
// 1
R10i.x = R14i.x;
// 2
R13i.x = R14i.x;
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
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].y), intBitsToFloat(R127i.x)));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].y), intBitsToFloat(R127i.x)));
// 2
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R10i.y = 0;
R13i.y = 0;
// 1
R14i.y = 0;
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
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].z), intBitsToFloat(R127i.x)));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].z), intBitsToFloat(R127i.x)));
// 2
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R10i.z = 0;
R13i.z = 0;
// 1
R14i.z = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R4i.w) + intBitsToFloat(uf_remappedVS[5].z));
R127i.w = floatBitsToInt(max(intBitsToFloat(R6i.x), 0.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[6].z));
// 1
PV1ix = uf_remappedVS[7].x & int(1);
R127i.y = uf_remappedVS[7].x & 0x2;
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(uf_remappedVS[5].x)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(PS0i));
R126i.w = uf_remappedVS[7].x & 0x4;
// 2
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(uf_remappedVS[8].y)));
R126i.y = floatBitsToInt(min(intBitsToFloat(R127i.w), 0.0));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PV1iw));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(uf_remappedVS[8].z)));
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
R7i.x = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(R126i.y));
// 11
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(uf_remappedVS[8].x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].x), intBitsToFloat(PV0iw)));
R127i.x = floatBitsToInt(float(R125i.y));
// 12
R125i.x = floatBitsToInt(-(intBitsToFloat(PV1iz)) + 1.0);
R2i.w = ((intBitsToFloat(uf_remappedVS[9].x) == 1.0)?-1:0);
R125i.y = floatBitsToInt(float(R127i.z));
// 13
PS1i = floatBitsToInt(float(R126i.x));
// 14
R11i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.w),intBitsToFloat(R126i.z),0.0)));
PV0iy = R11i.x;
PV0iz = R11i.x;
PV0iw = R11i.x;
// 15
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(R124i.w)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(R124i.x)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(backupReg0i)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[10].y)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[10].z)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[10].w)));
// 1
R11i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(R4i.w));
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
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(R11i.y)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].w), intBitsToFloat(PV0ix)));
// 2
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].x), intBitsToFloat(PV1iw)));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].y), intBitsToFloat(PV1iw)));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].z), intBitsToFloat(PV1iw)));
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
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(PS1i)));
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
PV0iy = floatBitsToInt(intBitsToFloat(R11i.y) + -(intBitsToFloat(PV1iz)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].w), intBitsToFloat(PV1ix)));
// 9
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].x), intBitsToFloat(PV0iw)));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].y), intBitsToFloat(PV0iw)));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].z), intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R0i.z)));
PV0iy = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(R6i.z));
PV0iz = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(R6i.y));
R0i.w = 0x3f800000;
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[9].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) * 0.5);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(R6i.z));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) * 0.5);
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R1i.w));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(PV1ix) + -(0.5));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) * 0.5);
R125i.z = floatBitsToInt(intBitsToFloat(R6i.x) + -(0.5));
R127i.w = floatBitsToInt(intBitsToFloat(PV1iw) + -(0.5));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 3
R125i.x = floatBitsToInt(intBitsToFloat(R6i.y) + -(0.5));
R126i.y = floatBitsToInt(intBitsToFloat(R6i.z) + -(0.5));
R126i.z = floatBitsToInt(intBitsToFloat(PV0iy) + -(0.5));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) * 2.0);
PV1iw = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedVS[12].x)));
// 4
R126i.x = floatBitsToInt(intBitsToFloat(PS1i) + intBitsToFloat(uf_remappedVS[13].x));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(R127i.z));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(uf_remappedVS[12].y)));
// 5
R123i.x = ((R2i.w == 0)?(PV0iy):(R11i.y));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(uf_remappedVS[12].z)));
R126i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[13].y) + intBitsToFloat(PV0iz));
// 6
R124i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[13].z) + intBitsToFloat(PV1iz));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R123i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R123i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R123i.x)));
PS0i = uf_remappedVS[7].x & 0x10000;
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(PV0iw));
R127i.y = uf_remappedVS[7].x & 0x20000;
PV1iz = floatBitsToInt(intBitsToFloat(R7i.z) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(float(PS0i));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(PV1iz)));
PS0i = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
// 9
R3i.x = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(PV0iy));
R2i.y = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(PV0ix));
R0i.z = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(float(R127i.y));
// 10
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iz = uf_remappedVS[7].x & 0x40000;
PV0iw = R6i.y;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
R127i.w = int(intBitsToFloat(PV1iw));
// 11
backupReg0i = R127i.w;
R127i.x = floatBitsToInt(floor(intBitsToFloat(PV0iw)));
R127i.y = R6i.z;
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
PV1iz = 0 - backupReg0i;
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(float(PV0iz));
// 12
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iy = max(R127i.w, PV1iz);
R127i.z = floatBitsToInt((intBitsToFloat(R127i.x) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R126i.z = int(intBitsToFloat(PV1iw));
// 13
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(R127i.x))?1.0:0.0);
PV1iy = 0 - R126i.z;
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(floor(intBitsToFloat(R127i.y)));
R127i.x = floatBitsToInt(float(PV0iy));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
// 14
PV0ix = max(R126i.z, PV1iy);
PV0iy = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt((intBitsToFloat(PV1iw) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PV1iw))?1.0:0.0);
R127i.y = int(intBitsToFloat(PV1iz));
// 15
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iw)));
PV1iy = 0 - R127i.y;
PV1iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.x)), intBitsToFloat(PV0iy)));
PV1iw = R6i.x;
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 2.0);
PS1i = floatBitsToInt(float(PV0ix));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 16
backupReg0i = R127i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV1iz)));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(floor(intBitsToFloat(PV1iw)));
PV0iw = max(backupReg0i, PV1iy);
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PV1iz)));
// 17
R2i.x = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV0ix));
PV1iy = floatBitsToInt((intBitsToFloat(PV0iz) > 0.0)?1.0:0.0);
R126i.z = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PS0i));
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PV0iz))?1.0:0.0);
R127i.z = floatBitsToInt(float(PV0iw));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 2.0);
// 18
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R127i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(uf_remappedVS[14].x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R127i.y)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iw)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(uf_remappedVS[14].y)));
// 19
PV1ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.z)), intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV0iz));
R7i.z = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV0iy));
R2i.w = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV0ix));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(uf_remappedVS[14].z)));
// 20
R7i.x = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R127i.y));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PV1ix)));
R2i.z = ((intBitsToFloat(uf_remappedVS[13].w) == 1.0)?-1:0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(PV1ix)));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[13].w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 21
PV1ix = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(PS0i)));
R1i.z = floatBitsToInt(intBitsToFloat(R124i.x) + intBitsToFloat(PV0iw));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[13].w)) + 1.0);
// 22
PV0ix = uf_remappedVS[15].y;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
R3i.z = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R126i.w));
PV0iw = uf_remappedVS[15].x;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 23
PV1ix = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(PV0ix));
PV1iy = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R7i.w = floatBitsToInt(intBitsToFloat(R0i.x) * 0.0 + 1.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 24
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.x), intBitsToFloat(PV1iy)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PV1ix)));
R5i.z = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(PS1i));
}
if( activeMaskStackC[3] == true ) {
// 0
R123i.y = ((R2i.z == 0)?(R5i.z):(R4i.w));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.y)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R123i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R123i.y)));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(PV1iw));
PV0iy = floatBitsToInt(intBitsToFloat(R7i.z) + intBitsToFloat(PV1ix));
PV0iw = floatBitsToInt(intBitsToFloat(R3i.z) + intBitsToFloat(PV1iz));
// 3
R123i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.z = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3e22f983) + 0.5);
// 4
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV0iw = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
// 5
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 6
R124i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R127i.y = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
R127i.w = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R2i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),intBitsToFloat(uf_remappedVS[16].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R2i.w = tempi.x;
R126i.z = floatBitsToInt(sin((intBitsToFloat(R127i.w))/0.1591549367));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R2i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[17].x),intBitsToFloat(uf_remappedVS[17].y),intBitsToFloat(uf_remappedVS[17].z),intBitsToFloat(uf_remappedVS[17].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R1i.w = tempi.x;
R126i.y = floatBitsToInt(cos((intBitsToFloat(R127i.w))/0.1591549367));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R2i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[18].x),intBitsToFloat(uf_remappedVS[18].y),intBitsToFloat(uf_remappedVS[18].z),intBitsToFloat(uf_remappedVS[18].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R0i.w = tempi.x;
R125i.x = floatBitsToInt(sin((intBitsToFloat(R127i.y))/0.1591549367));
// 10
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R125i.x)));
R2i.y = 0x3f800000;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R125i.x)));
R127i.w = floatBitsToInt(cos((intBitsToFloat(R127i.y))/0.1591549367));
// 11
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R127i.w)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R127i.w)));
R125i.z = floatBitsToInt(sin((intBitsToFloat(R124i.x))/0.1591549367));
// 12
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(-(intBitsToFloat(R125i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R127i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R126i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R125i.y)));
R127i.y = floatBitsToInt(cos((intBitsToFloat(backupReg0i))/0.1591549367));
// 13
backupReg0i = R126i.y;
backupReg1i = R127i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(backupReg1i)));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(-(intBitsToFloat(R127i.z)) + intBitsToFloat(PV0iz));
R127i.w = floatBitsToInt(-(intBitsToFloat(R126i.w)) + intBitsToFloat(PV0iy));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(backupReg1i)));
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R127i.y)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R127i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R126i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(R0i.x)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PV1iz)));
// 15
PV1ix = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(PV0iz));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R127i.z)) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R0i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PV0ix)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R127i.z)) + intBitsToFloat(PS0i));
// 16
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R0i.x)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R126i.y)) + intBitsToFloat(R123i.y));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PV1ix)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R124i.x)) + intBitsToFloat(PV1iz));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R124i.x)) + intBitsToFloat(PV1iw));
// 17
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R127i.y)) + intBitsToFloat(PV0iz));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R127i.x)) + intBitsToFloat(R122i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R127i.y)) + intBitsToFloat(PV0ix));
R127i.y = floatBitsToInt((intBitsToFloat(uf_remappedVS[19].x) > 0.0)?1.0:0.0);
// 18
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.y));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R126i.y)) + intBitsToFloat(R125i.y));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.w));
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[19].x))?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[19].x));
// 19
backupReg0i = R127i.y;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.z), intBitsToFloat(R127i.x)));
R127i.y = floatBitsToInt(intBitsToFloat(R4i.w) * intBitsToFloat(PS0i));
R127i.w = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(PV0iw)));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R12i.x));
// 20
R4i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(R14i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R124i.y),intBitsToFloat(R125i.z),intBitsToFloat(R7i.w))));
PV0iy = R4i.x;
PV0iz = R4i.x;
PV0iw = R4i.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y),intBitsToFloat(R126i.y)) + intBitsToFloat(PV1ix));
// 21
R17i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.x),intBitsToFloat(R126i.z)) + intBitsToFloat(R122i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(uf_remappedVS[20].y)) + intBitsToFloat(R127i.y));
R3i.z = floatBitsToInt(intBitsToFloat(R4i.w) * intBitsToFloat(R127i.z));
R126i.w = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.z), intBitsToFloat(R127i.x)));
// 22
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R124i.y),intBitsToFloat(R125i.z),intBitsToFloat(R7i.w))));
PV0ix = tempi.x;
R4i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y),intBitsToFloat(R126i.y)) + intBitsToFloat(PS1i));
// 23
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(R127i.x)));
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.x),intBitsToFloat(R126i.z)) + intBitsToFloat(R122i.x));
PV1iw = floatBitsToInt(fract(intBitsToFloat(R127i.y)));
// 24
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(PV1ix),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.z),intBitsToFloat(R126i.y),1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R17i.z = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV1iw)));
// 25
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R126i.w)) + intBitsToFloat(PS0i));
// 26
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R124i.y),intBitsToFloat(R125i.z),intBitsToFloat(R7i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R4i.z = tempi.x;
PV0iw = tempi.x;
}
if( activeMaskStackC[3] == true ) {
// 0
R10i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R2i.y)),vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w))));
PV0iy = R10i.x;
PV0iz = R10i.x;
PV0iw = R10i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R2i.y)),vec4(intBitsToFloat(uf_remappedVS[22].x),intBitsToFloat(uf_remappedVS[22].y),intBitsToFloat(uf_remappedVS[22].z),intBitsToFloat(uf_remappedVS[22].w))));
PV1ix = tempi.x;
R10i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R2i.y)),vec4(intBitsToFloat(uf_remappedVS[23].x),intBitsToFloat(uf_remappedVS[23].y),intBitsToFloat(uf_remappedVS[23].z),intBitsToFloat(uf_remappedVS[23].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R10i.w = tempi.x;
// 3
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R2i.y)),vec4(intBitsToFloat(uf_remappedVS[24].x),intBitsToFloat(uf_remappedVS[24].y),intBitsToFloat(uf_remappedVS[24].z),intBitsToFloat(uf_remappedVS[24].w))));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
R127i.z = PV0ix;
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) / 2.0);
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R2i.y)),vec4(intBitsToFloat(uf_remappedVS[25].x),intBitsToFloat(uf_remappedVS[25].y),intBitsToFloat(uf_remappedVS[25].z),intBitsToFloat(uf_remappedVS[25].w))));
PV0ix = tempi.x;
R124i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 5
R124i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R2i.y)),vec4(intBitsToFloat(uf_remappedVS[26].x),intBitsToFloat(uf_remappedVS[26].y),intBitsToFloat(uf_remappedVS[26].z),intBitsToFloat(uf_remappedVS[26].w))));
PV1iy = R124i.x;
PV1iz = R124i.x;
PV1iw = R124i.x;
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R2i.y)),vec4(intBitsToFloat(uf_remappedVS[27].x),intBitsToFloat(uf_remappedVS[27].y),intBitsToFloat(uf_remappedVS[27].z),intBitsToFloat(uf_remappedVS[27].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R126i.w = tempi.x;
// 7
R125i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[15].z) + intBitsToFloat(R124i.x));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R124i.y),intBitsToFloat(R125i.z),intBitsToFloat(R126i.w)),vec4(intBitsToFloat(uf_remappedVS[28].x),intBitsToFloat(uf_remappedVS[28].y),intBitsToFloat(uf_remappedVS[28].z),intBitsToFloat(uf_remappedVS[28].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R126i.z = tempi.x;
PV0iw = tempi.x;
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R124i.y),intBitsToFloat(R125i.z),intBitsToFloat(R126i.w)),vec4(intBitsToFloat(uf_remappedVS[29].x),intBitsToFloat(uf_remappedVS[29].y),intBitsToFloat(uf_remappedVS[29].z),intBitsToFloat(uf_remappedVS[29].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 10
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 11
PV1iw = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS0i));
// 12
R2i.x = uf_remappedVS[30].x;
R2i.y = uf_remappedVS[30].y;
R2i.z = uf_remappedVS[30].z;
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(PV1iw)));
// 13
R15i.x = floatBitsToInt(intBitsToFloat(R10i.x) * 0.5 + intBitsToFloat(R127i.z));
R15i.y = floatBitsToInt(intBitsToFloat(R10i.y) * -(0.5) + intBitsToFloat(R127i.z));
R15i.z = floatBitsToInt(intBitsToFloat(R10i.z) * 0.5 + intBitsToFloat(R127i.z));
R15i.w = floatBitsToInt(intBitsToFloat(R10i.w) * 1.0);
}
if( activeMaskStackC[3] == true ) {
// 0
R19i.x = floatBitsToInt(intBitsToFloat(R4i.x) + -(intBitsToFloat(R2i.x)));
R19i.y = floatBitsToInt(intBitsToFloat(R4i.y) + -(intBitsToFloat(R2i.y)));
R19i.z = floatBitsToInt(intBitsToFloat(R4i.z) + -(intBitsToFloat(R2i.z)));
R127i.w = floatBitsToInt(intBitsToFloat(R0i.z) + -(intBitsToFloat(uf_remappedVS[31].w)));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[31].z)) + intBitsToFloat(uf_remappedVS[32].z));
// 1
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[31].x)) + intBitsToFloat(uf_remappedVS[32].x));
R124i.y = ((intBitsToFloat(R127i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[31].y)) + intBitsToFloat(uf_remappedVS[32].y));
// 2
R126i.x = floatBitsToInt(intBitsToFloat(R0i.z) + -(intBitsToFloat(uf_remappedVS[32].w)));
PV0iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[31].w)) + intBitsToFloat(uf_remappedVS[32].w));
R126i.z = floatBitsToInt(-(intBitsToFloat(R124i.y)) + 1.0);
// 3
R124i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[32].x)) + intBitsToFloat(uf_remappedVS[33].x));
R126i.y = ((intBitsToFloat(R126i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[32].y)) + intBitsToFloat(uf_remappedVS[33].y));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 4
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[32].z)) + intBitsToFloat(uf_remappedVS[33].z));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[32].w)) + intBitsToFloat(uf_remappedVS[33].w));
// 5
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV0iw)) + intBitsToFloat(uf_remappedVS[31].x));
PV1iy = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV0iy)) + intBitsToFloat(uf_remappedVS[31].z));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV0iz)) + intBitsToFloat(uf_remappedVS[31].y));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R124i.x) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(PS1i));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PV1iy)));
R124i.y = floatBitsToInt(intBitsToFloat(R0i.z) + -(intBitsToFloat(uf_remappedVS[33].w)));
// 7
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PV0ix)) + intBitsToFloat(uf_remappedVS[32].x));
R127i.y = ((intBitsToFloat(R124i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PV0iy)) + intBitsToFloat(uf_remappedVS[32].z));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PV0iz)) + intBitsToFloat(uf_remappedVS[32].y));
// 8
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[33].x)) + intBitsToFloat(uf_remappedVS[34].x));
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[33].y)) + intBitsToFloat(uf_remappedVS[34].y));
// 9
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[33].w)) + intBitsToFloat(uf_remappedVS[34].w));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV0iz)));
R124i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[33].z)) + intBitsToFloat(uf_remappedVS[34].z));
PV1iw = floatBitsToInt(intBitsToFloat(R0i.z) + -(intBitsToFloat(uf_remappedVS[34].w)));
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[31].x), intBitsToFloat(R126i.z)));
R125i.y = ((intBitsToFloat(PV1iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[31].y), intBitsToFloat(R126i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[31].z), intBitsToFloat(R126i.z)));
R124i.x = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R125i.w)) + intBitsToFloat(PV0iw));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R125i.w)) + intBitsToFloat(PV0iz));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R125i.w)) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(R124i.x));
R127i.z = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(R124i.x));
// 12
backupReg0i = R126i.y;
PV0ix = floatBitsToInt(intBitsToFloat(R124i.z) * intBitsToFloat(R124i.x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(backupReg0i)) + intBitsToFloat(R123i.x));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(backupReg0i)) + intBitsToFloat(R123i.y));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(backupReg0i)) + intBitsToFloat(R123i.z));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(PV1iw)) + intBitsToFloat(uf_remappedVS[33].x));
// 13
backupReg0i = R127i.z;
PV1ix = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(PV0ix)) + intBitsToFloat(uf_remappedVS[33].z));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(backupReg0i)) + intBitsToFloat(uf_remappedVS[33].y));
// 14
R4i.x = uf_remappedVS[35].x;
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[19].z))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(uf_remappedVS[19].z) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[19].z));
// 15
backupReg0i = R126i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PV0iw)) + intBitsToFloat(R124i.w));
R126i.y = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iy)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV0iw)) + intBitsToFloat(backupReg0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV0iw)) + intBitsToFloat(R125i.z));
R127i.z = floatBitsToInt(intBitsToFloat(R4i.w) * intBitsToFloat(PS0i));
// 16
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[34].y),intBitsToFloat(R125i.y)) + intBitsToFloat(R123i.w));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[34].x),intBitsToFloat(R125i.y)) + intBitsToFloat(R123i.x));
R125i.z = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[34].z),intBitsToFloat(R125i.y)) + intBitsToFloat(R123i.z));
// 17
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(uf_remappedVS[20].w)) + intBitsToFloat(R127i.z));
// 18
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[36].y)) + intBitsToFloat(uf_remappedVS[37].y));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[36].x)) + intBitsToFloat(uf_remappedVS[37].x));
// 19
backupReg0i = R126i.y;
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[36].w)) + intBitsToFloat(uf_remappedVS[37].w));
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[36].z)) + intBitsToFloat(uf_remappedVS[37].z));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0ix)));
// 20
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R125i.z)) + intBitsToFloat(PV1iz));
R125i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[37].y)) + intBitsToFloat(uf_remappedVS[38].y));
R124i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[37].x)) + intBitsToFloat(uf_remappedVS[38].x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 21
PV1ix = floatBitsToInt(intBitsToFloat(R4i.y) + -(intBitsToFloat(uf_remappedVS[36].w)));
PV1iy = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS0i));
PV1iz = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(PS0i));
R127i.x = floatBitsToInt(intBitsToFloat(R4i.y) + -(intBitsToFloat(uf_remappedVS[37].w)));
// 22
R5i.x = ((intBitsToFloat(PV1ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(PV1iw)) + intBitsToFloat(uf_remappedVS[36].z));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(PV1iy)) + intBitsToFloat(uf_remappedVS[36].y));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(PV1iz)) + intBitsToFloat(uf_remappedVS[36].x));
R0i.w = ((intBitsToFloat(R127i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 23
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[37].w)) + intBitsToFloat(uf_remappedVS[38].w));
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[37].z)) + intBitsToFloat(uf_remappedVS[38].z));
R124i.z = floatBitsToInt(intBitsToFloat(R4i.y) + -(intBitsToFloat(uf_remappedVS[38].w)));
// 24
R0i.x = ((intBitsToFloat(R124i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[38].y)) + intBitsToFloat(uf_remappedVS[39].y));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[38].x)) + intBitsToFloat(uf_remappedVS[39].x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 25
PV1ix = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(PS0i));
PV1iz = floatBitsToInt(intBitsToFloat(R124i.w) * intBitsToFloat(PS0i));
R124i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[38].z)) + intBitsToFloat(uf_remappedVS[39].z));
PS1i = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[38].w)) + intBitsToFloat(uf_remappedVS[39].w));
// 26
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PV1ix)) + intBitsToFloat(uf_remappedVS[37].z));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PV1iy)) + intBitsToFloat(uf_remappedVS[37].y));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PV1iz)) + intBitsToFloat(uf_remappedVS[37].x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 27
PV1ix = floatBitsToInt(intBitsToFloat(R124i.w) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS0i));
PV1iz = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS0i));
// 28
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(PV1ix)) + intBitsToFloat(uf_remappedVS[38].z));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(PV1iy)) + intBitsToFloat(uf_remappedVS[38].y));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(PV1iz)) + intBitsToFloat(uf_remappedVS[38].x));
}
if( activeMaskStackC[3] == true ) {
// 0
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(uf_remappedVS[40].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(uf_remappedVS[40].y)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(uf_remappedVS[40].z)));
R16i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(uf_remappedVS[40].w)));
// 1
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(uf_remappedVS[41].x)));
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[41].x)));
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(uf_remappedVS[41].x)));
PV1iw = floatBitsToInt(intBitsToFloat(R4i.y) + -(intBitsToFloat(uf_remappedVS[39].w)));
PS1i = floatBitsToInt(-(intBitsToFloat(R0i.x)) + 1.0);
// 2
R127i.x = ((intBitsToFloat(PV1iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(-(intBitsToFloat(R5i.x)) + 1.0);
PV0iw = floatBitsToInt(-(intBitsToFloat(R0i.w)) + 1.0);
R124i.z = ((intBitsToFloat(R6i.x) > 0.5)?-1:0);
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].x), intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].y), intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].z), intBitsToFloat(PV0iz)));
// 4
backupReg0i = R124i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(PV1iz)) + intBitsToFloat(PV1iy));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(PV1iz)) + intBitsToFloat(PV1ix));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1iw)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(PV1iz)) + intBitsToFloat(PS1i));
R5i.y = ((backupReg0i == 0)?(R8i.x):(R5i.w));
// 5
backupReg0i = R123i.x;
backupReg1i = R123i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R126i.y)) + intBitsToFloat(R123i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R126i.y)) + intBitsToFloat(backupReg0i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(R126i.y)) + intBitsToFloat(backupReg1i));
PV1iw = ((intBitsToFloat(R6i.y) > 0.5)?-1:0);
PS1i = ((intBitsToFloat(R6i.z) > 0.5)?-1:0);
// 6
backupReg0i = R123i.y;
backupReg1i = R123i.z;
R0i.x = ((PV1iw == 0)?(R8i.y):(R8i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(R124i.z)) + intBitsToFloat(R123i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R124i.z)) + intBitsToFloat(backupReg0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(R124i.z)) + intBitsToFloat(backupReg1i));
R3i.w = ((PS1i == 0)?(R8i.x):(R5i.w));
// 7
backupReg0i = R123i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].x),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.w));
PV1iy = ((intBitsToFloat(R6i.w) > 0.5)?-1:0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].z),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].y),intBitsToFloat(R127i.x)) + intBitsToFloat(backupReg0i));
PS1i = ((intBitsToFloat(R6i.y) > 0.5)?-1:0);
// 8
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(uf_remappedVS[42].x)));
R7i.y = ((PS1i == 0)?(R8i.x):(R5i.w));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(uf_remappedVS[42].z)));
R2i.w = ((PV1iy == 0)?(R8i.y):(R8i.z));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(uf_remappedVS[42].y)));
// 9
PV1iy = ((intBitsToFloat(R6i.z) > 0.5)?-1:0);
PS1i = int(intBitsToFloat(uf_remappedVS[43].z));
// 10
R5i.x = ((PV1iy == 0)?(R8i.y):(R8i.z));
R1i.w = floatBitsToInt(float(PS1i));
// 11
PV1iy = floatBitsToInt((0.0 >= abs(intBitsToFloat(R1i.w)))?1.0:0.0);
PV1iz = floatBitsToInt(-(abs(intBitsToFloat(R1i.w))) + 0.0);
// 12
R127i.x = ((intBitsToFloat(PV1iy) == 0.0)?(0):(PV1iz));
// 13
PV1iw = floatBitsToInt(abs(intBitsToFloat(R1i.w)) + intBitsToFloat(R127i.x));
// 14
R123i.z = ((-(intBitsToFloat(R127i.x)) > 0.0)?(PV1iw):(R127i.x));
// 15
R123i.y = ((intBitsToFloat(R1i.w) == 0.0)?(0):(R123i.z));
// 16
R2i.x = int(intBitsToFloat(R123i.y));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = uf_remappedVS[7].x & 0x80000;
R1i.y = uf_remappedVS[44].x;
// 1
PV1ix = uf_remappedVS[7].x & 0x100000;
PV1iz = uf_remappedVS[7].x & 0x200000;
PV1iw = (PV0ix == 0x80000)?-1:0;
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(R1i.w));
// 2
R4i.x = ((PV1iw == 0)?(R8i.x):(R5i.y));
PV0iy = (PV1iz == 0x200000)?-1:0;
PV0iz = (PV1ix == 0x100000)?-1:0;
PV0iw = uf_remappedVS[7].x & 0x400000;
PS0i = uf_remappedVS[7].x & 0x800000;
// 3
PV1ix = (PV0iw == 0x400000)?-1:0;
PV1iy = (PS0i == 0x800000)?-1:0;
R2i.z = ((PV0iy == 0)?(R8i.x):(R3i.w));
R3i.w = ((PV0iz == 0)?(R8i.y):(R0i.x));
PS1i = uf_remappedVS[7].x & 0x1000000;
// 4
R0i.x = ((PV1iy == 0)?(R8i.x):(R7i.y));
R7i.y = ((PV1ix == 0)?(R8i.y):(R2i.w));
PV0iz = (PS1i == 0x1000000)?-1:0;
PV0iw = uf_remappedVS[7].y & int(1);
PS0i = floatBitsToInt(intBitsToFloat(R127i.w) * 0.0);
// 5
backupReg0i = R8i.y;
PV1ix = floatBitsToInt(trunc(intBitsToFloat(PS0i)));
R8i.y = (int(1) != PV0iw)?-1:0;
R2i.w = ((PV0iz == 0)?(backupReg0i):(R5i.x));
// 6
R5i.x = int(intBitsToFloat(PV1ix));
}
if( activeMaskStackC[3] == true ) {
// 0
R18i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[41].x), intBitsToFloat(R1i.x)));
R18i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[41].x), intBitsToFloat(R0i.y)));
R18i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[41].x), intBitsToFloat(R0i.z)));
R18i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[42].w)));
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(uf_remappedVS[45].y)));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
R123i.y = ((R8i.y == 0)?(0):(int(1)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(uf_remappedVS[45].x)));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[43].z));
// 2
R126i.x = (R123i.y == int(1))?-1:0;
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[43].x), intBitsToFloat(PS1i)));
PV0iw = (R123i.y == 0x2)?-1:0;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[43].w));
// 3
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[43].y), intBitsToFloat(PS0i)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R124i.z)) + -(0.5));
R123i.z = ((PV0iw == 0)?(R6i.x):(R6i.z));
R124i.w = ((PV0iw == 0)?(R6i.y):(R6i.x));
R126i.y = floatBitsToInt(float(R2i.x));
// 4
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(R124i.x)) + -(0.5));
R127i.y = ((R126i.x == 0)?(R123i.z):(R6i.y));
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[46].z) + intBitsToFloat(uf_remappedVS[45].x));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[46].w) + intBitsToFloat(uf_remappedVS[45].y));
R127i.z = floatBitsToInt(float(R5i.x));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[47].x) + intBitsToFloat(uf_remappedVS[47].z));
PV1iy = floatBitsToInt(-(intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[47].y) + intBitsToFloat(uf_remappedVS[47].w));
R127i.w = ((R126i.x == 0)?(R124i.w):(R6i.z));
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(uf_remappedVS[47].z)) + intBitsToFloat(PV1ix));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.w)),intBitsToFloat(uf_remappedVS[46].x)) + -(intBitsToFloat(PV1iy)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(uf_remappedVS[47].w)) + intBitsToFloat(PV1iw));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[46].y)) + intBitsToFloat(PV1iz));
R125i.z = ((R126i.x == 0)?(R6i.x):(R6i.y));
// 7
backupReg0i = R123i.x;
backupReg1i = R123i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.x)),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[45].z)) + intBitsToFloat(backupReg0i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[45].w)) + intBitsToFloat(R123i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R126i.y)) + intBitsToFloat(backupReg1i));
R126i.y = ((R126i.x == 0)?(R6i.y):(R6i.z));
// 8
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[48].x), intBitsToFloat(R127i.y)));
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) * 2.0);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[48].y), intBitsToFloat(R127i.w)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(backupReg0i)) + -(intBitsToFloat(R123i.x)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(R125i.y)) + intBitsToFloat(R123i.w));
PS0i = int(intBitsToFloat(uf_remappedVS[49].z));
// 9
R125i.y = ((R8i.y == 0)?(0):(0x2));
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[50].z) + intBitsToFloat(uf_remappedVS[48].x));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[50].w) + intBitsToFloat(uf_remappedVS[48].y));
R127i.w = floatBitsToInt(float(PS0i));
// 10
PV0ix = floatBitsToInt(-(abs(intBitsToFloat(R127i.w))) + 0.0);
PV0iy = floatBitsToInt(-(intBitsToFloat(R125i.x)) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt((0.0 >= abs(intBitsToFloat(R127i.w)))?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 11
R125i.x = ((intBitsToFloat(PV0iw) == 0.0)?(0):(PV0ix));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.w)),intBitsToFloat(uf_remappedVS[50].x)) + -(intBitsToFloat(PV0iy)));
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[50].y)) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[49].z));
// 12
R126i.x = (R125i.y == int(1))?-1:0;
PV0iy = floatBitsToInt(trunc(intBitsToFloat(PV1iz)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[49].x), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(abs(intBitsToFloat(R127i.w)) + intBitsToFloat(R125i.x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[49].w));
// 13
backupReg0i = R125i.x;
backupReg1i = R125i.y;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[49].y), intBitsToFloat(PS0i)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R127i.z)) + -(0.5));
R123i.z = ((-(intBitsToFloat(backupReg0i)) > 0.0)?(PV0iw):(backupReg0i));
R126i.w = (backupReg1i == 0x2)?-1:0;
PS1i = int(intBitsToFloat(PV0iy));
// 14
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[51].x) + intBitsToFloat(uf_remappedVS[51].z));
R123i.y = ((intBitsToFloat(R127i.w) == 0.0)?(0):(R123i.z));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(R125i.x)) + -(0.5));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[51].y) + intBitsToFloat(uf_remappedVS[51].w));
PS0i = floatBitsToInt(float(PS1i));
// 15
backupReg0i = R126i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[51].z),intBitsToFloat(R125i.z)) + intBitsToFloat(PV0ix));
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.x)),intBitsToFloat(PS0i)) + intBitsToFloat(R124i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[51].w),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV0iw));
R123i.w = ((R126i.w == 0)?(R6i.x):(R6i.z));
PS1i = int(intBitsToFloat(R123i.y));
// 16
R125i.x = ((R126i.x == 0)?(R123i.w):(R6i.y));
R123i.y = ((R126i.w == 0)?(R6i.y):(R6i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[48].w)) + intBitsToFloat(R123i.z));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[48].z)) + intBitsToFloat(R123i.x));
PS0i = floatBitsToInt(float(PS1i));
// 17
backupReg0i = R6i.y;
R123i.x = ((R126i.x == 0)?(R123i.y):(R6i.z));
R6i.y = ((R126i.x == 0)?(R6i.x):(backupReg0i));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R124i.z)) + -(intBitsToFloat(R126i.y)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.y));
R7i.y = ((R126i.x == 0)?(backupReg0i):(R6i.z));
// 18
backupReg0i = R125i.y;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[52].x), intBitsToFloat(R125i.x)));
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) * 2.0);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[52].y), intBitsToFloat(R123i.x)));
R125i.y = floatBitsToInt(intBitsToFloat(R125i.y) * 2.0);
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(backupReg0i)) + intBitsToFloat(R123i.w));
PS0i = int(intBitsToFloat(uf_remappedVS[53].z));
// 19
R13i.x = floatBitsToInt(intBitsToFloat(R125i.w) + 0.5);
R13i.y = floatBitsToInt(intBitsToFloat(R126i.z) + 0.5);
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[54].z) + intBitsToFloat(uf_remappedVS[52].x));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[54].w) + intBitsToFloat(uf_remappedVS[52].y));
R125i.w = floatBitsToInt(float(PS0i));
// 20
PV0ix = floatBitsToInt(-(abs(intBitsToFloat(R125i.w))) + 0.0);
PV0iy = floatBitsToInt(-(intBitsToFloat(R125i.x)) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(-(intBitsToFloat(R125i.y)) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt((0.0 >= abs(intBitsToFloat(R125i.w)))?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R125i.w));
// 21
R125i.x = ((intBitsToFloat(PV0iw) == 0.0)?(0):(PV0ix));
R1i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.w)),intBitsToFloat(uf_remappedVS[54].x)) + -(intBitsToFloat(PV0iy)));
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[54].y)) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[53].z));
// 22
PV0iy = floatBitsToInt(trunc(intBitsToFloat(PV1iz)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[53].x), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(abs(intBitsToFloat(R125i.w)) + intBitsToFloat(R125i.x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[53].w));
// 23
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[53].y), intBitsToFloat(PS0i)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R0i.z)) + -(0.5));
R123i.z = ((-(intBitsToFloat(R125i.x)) > 0.0)?(PV0iw):(R125i.x));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[10].x) * 1.0);
PS1i = int(intBitsToFloat(PV0iy));
// 24
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(PV1iw)));
R8i.y = ((intBitsToFloat(R125i.w) == 0.0)?(0):(R123i.z));
R6i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[55].x) + intBitsToFloat(uf_remappedVS[55].z));
R6i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[55].y) + intBitsToFloat(uf_remappedVS[55].w));
R2i.z = floatBitsToInt(float(PS1i));
}
if( activeMaskStackC[3] == true ) {
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[55].z),intBitsToFloat(R6i.y)) + intBitsToFloat(R6i.z));
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.x)),intBitsToFloat(R2i.z)) + intBitsToFloat(R3i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[55].w),intBitsToFloat(R7i.y)) + intBitsToFloat(R6i.w));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R0i.x)) + -(0.5));
PS0i = int(intBitsToFloat(R8i.y));
// 1
R11i.y = uf_remappedVS[56].x;
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[52].w)) + intBitsToFloat(R123i.z));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[52].z)) + intBitsToFloat(R123i.x));
PS1i = floatBitsToInt(float(PS0i));
// 2
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R125i.w)) + -(intBitsToFloat(R125i.y)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(PS1i)) + intBitsToFloat(R1i.y));
R13i.z = floatBitsToInt(intBitsToFloat(R1i.w) + 0.5);
// 3
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R5i.y)) + intBitsToFloat(R123i.w));
R13i.w = floatBitsToInt(intBitsToFloat(R3i.z) + 0.5);
// 4
R14i.x = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
R14i.y = floatBitsToInt(intBitsToFloat(R126i.z) + 0.5);
// 5
R0i.x = R9i.x;
R0i.y = R9i.y;
R0i.z = R9i.z;
R0i.w = R9i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w));
// export
passParameterSem2 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.z));
// export
passParameterSem9 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.z));
}
