#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 9a8ea9d729ba72e1
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[40];
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
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyz = attrDataSem5.xyz;
attrDecoder.xyz = uvec3((attrDecoder.xyz>>24)|((attrDecoder.xyz>>8)&0xFF00u)|((attrDecoder.xyz<<8)&0xFF0000u)|((attrDecoder.xyz<<24)));
attrDecoder.w = uint(0);
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), 0x3f800000);
attrDecoder = attrDataSem11;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R11i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem10;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R10i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem3;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem4;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem8;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R9i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem7;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
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
R12i.x = floatBitsToInt(-(intBitsToFloat(R5i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R0i.z = 0;
R5i.w = floatBitsToInt(-(intBitsToFloat(R10i.x)) + 1.0);
R10i.z = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R12i.x));
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
R16i.x = 0;
// 1
R12i.z = R10i.z;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R12i.z = R0i.z;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R12i.z == 0);
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
R12i.y = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R12i.x) >= intBitsToFloat(R12i.y));
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
R16i.x = 0;
// 1
R0i.z = R10i.z;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R0i.z == 0);
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
R10i.z = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
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
R17i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R127i.y)));
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R127i.y)));
// 2
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R17i.x = 0;
// 1
R13i.x = R17i.x;
// 2
R14i.x = R17i.x;
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
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R127i.x)));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R127i.x)));
// 2
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R13i.y = 0;
R14i.y = 0;
// 1
R17i.y = 0;
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
R17i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R127i.x)));
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R127i.x)));
// 2
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R13i.z = 0;
R14i.z = 0;
// 1
R17i.z = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R125i.x = floatBitsToInt(max(intBitsToFloat(R8i.x), 0.0));
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[2].x))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(uf_remappedVS[2].x) > 0.0)?1.0:0.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(uf_remappedVS[3].y)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[2].x));
// 1
R127i.x = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(intBitsToFloat(R12i.x) * intBitsToFloat(PS0i));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].w)) + intBitsToFloat(uf_remappedVS[5].w));
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].z)) + intBitsToFloat(uf_remappedVS[5].z));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R12i.y));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].x)) + intBitsToFloat(uf_remappedVS[5].x));
R10i.w = floatBitsToInt(intBitsToFloat(R12i.x) * intBitsToFloat(PS1i));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].y)) + intBitsToFloat(uf_remappedVS[5].y));
// 3
backupReg0i = R127i.z;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(PV0iy)));
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].z)) + intBitsToFloat(uf_remappedVS[6].z));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].w)) + intBitsToFloat(uf_remappedVS[6].w));
PV1iw = floatBitsToInt(fract(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 4
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS1i));
R125i.y = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS1i));
R126i.z = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1iw)));
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].x)) + intBitsToFloat(uf_remappedVS[6].x));
// 5
backupReg0i = R127i.z;
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].y)) + intBitsToFloat(uf_remappedVS[6].y));
R127i.z = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV0iw));
R125i.w = floatBitsToInt(min(intBitsToFloat(R125i.x), 0.0));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 6
R126i.x = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS1i));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(uf_remappedVS[4].w)));
R125i.z = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(uf_remappedVS[5].w)));
R127i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(PS1i));
R124i.z = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(PS1i));
// 7
backupReg0i = R126i.z;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R127i.x)));
PV1iy = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(uf_remappedVS[6].w)));
R126i.z = ((intBitsToFloat(R125i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(backupReg0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R125i.y)));
// 8
backupReg0i = R127i.y;
R125i.x = ((intBitsToFloat(PV1iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.y = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R0i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].x) + intBitsToFloat(PV1ix));
R126i.w = ((intBitsToFloat(backupReg0i) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].y) + intBitsToFloat(PV1iw));
// 9
backupReg0i = R127i.z;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R127i.w)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R126i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R124i.z)));
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].z) + intBitsToFloat(backupReg0i));
PS1i = floatBitsToInt(-(intBitsToFloat(R125i.x)) + 1.0);
// 10
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].x) + intBitsToFloat(PV1iy));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(backupReg0i)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS1i)));
R125i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].y) + intBitsToFloat(PV1ix));
// 11
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].z) + intBitsToFloat(R127i.z));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PV0iz)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iz)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].x), intBitsToFloat(R126i.x)));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), intBitsToFloat(R126i.x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R126i.w)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), intBitsToFloat(R126i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R126i.w)));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R126i.w)));
R126i.w = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PV0iz));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].x), intBitsToFloat(R125i.x)));
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].y), intBitsToFloat(R125i.x)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].z), intBitsToFloat(R125i.x)));
R0i.x = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(R125i.w));
// 15
PV1ix = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R126i.w));
R18i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].x)) + 1.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iz));
R9i.x = ((intBitsToFloat(uf_remappedVS[7].x) == 1.0)?-1:0);
// 16
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(PV1iw)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1ix)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(PV1iz)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R18i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[8].y)));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[8].z)));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[8].w)));
// 1
R10i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(R12i.x));
// 2
predResult = (R9i.x != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(R10i.z)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(PV0ix)));
// 2
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].x), intBitsToFloat(PV1iw)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].y), intBitsToFloat(PV1iw)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].z), intBitsToFloat(PV1iw)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
tempResultf = max(0.0, abs(intBitsToFloat(uf_remappedVS[7].x)));
tempResultf = log2(tempResultf);
PS0i = floatBitsToInt(tempResultf);
// 1
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f317218));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[7].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(PS1i)));
R127i.y = ((intBitsToFloat(uf_remappedVS[7].x) == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R18i.y));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R10i.z) + -(intBitsToFloat(PV1iz)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(PV1ix)));
// 9
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].x), intBitsToFloat(PV0iw)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].y), intBitsToFloat(PV0iw)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].z), intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
PV0ix = uf_remappedVS[10].y;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
PV0iy = uf_remappedVS[10].x;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R9i.z)));
R126i.w = 0x3f800000;
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[7].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(PS0i)));
R125i.w = 0x3f800000;
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(R18i.y));
// 2
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.x), intBitsToFloat(PV1ix)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(PV1iy)));
PV0iz = floatBitsToInt(intBitsToFloat(R8i.y) + 1.0);
PV0iw = floatBitsToInt(intBitsToFloat(R8i.x) + 1.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iz)));
// 3
PV1ix = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedVS[11].w)));
PV1iz = floatBitsToInt(intBitsToFloat(R8i.z) + 1.0);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(uf_remappedVS[11].w)));
PS1i = ((intBitsToFloat(R12i.x) == 0.0)?-1:0);
// 4
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(uf_remappedVS[11].w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(uf_remappedVS[11].z)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(R127i.w));
R127i.w = ((PS1i == 0)?(R12i.x):(0x3f800000));
R0i.w = floatBitsToInt(1.0);
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R17i.z)));
R123i.y = ((R9i.x == 0)?(PV0iz):(R10i.z));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 6
backupReg0i = R5i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R123i.y)));
R5i.y = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
R5i.y = clampFI32(R5i.y);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R123i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R123i.y)));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R17i.y)) + intBitsToFloat(PV1ix));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R14i.z)));
PV1iw = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV0iz));
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R17i.x)) + intBitsToFloat(R122i.x));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R14i.y)) + intBitsToFloat(PV1iz));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(PV1iw)));
// 9
R127i.x = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV0iz));
R127i.y = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV0iy));
R127i.z = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R13i.z)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R14i.x)) + intBitsToFloat(R123i.x));
// 10
R1i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R126i.w))));
PV0iy = R1i.x;
PV0iz = R1i.x;
PV0iw = R1i.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R13i.y)) + intBitsToFloat(PV1iw));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R126i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R125i.z = tempi.x;
PV1iw = tempi.x;
R1i.w = R1i.x;
// 12
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R126i.w))));
PV0iy = R127i.x;
PV0iz = R127i.x;
PV0iw = R127i.x;
R2i.w = PV1ix;
// 13
R2i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R17i.x),intBitsToFloat(R17i.y),intBitsToFloat(R17i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),intBitsToFloat(R125i.w))));
PV1iy = R2i.x;
PV1iz = R2i.x;
PV1iw = R2i.x;
R1i.w = R127i.x;
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(R14i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),intBitsToFloat(R125i.w))));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.z = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(R126i.y));
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),intBitsToFloat(R125i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R1i.z = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R124i.w));
// 16
PV0ix = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PS1i));
R1i.y = R125i.z;
R6i.z = R127i.x;
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R125i.x));
// 17
R2i.z = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0ix));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R13i.x)) + intBitsToFloat(R124i.x));
// 18
predResult = (intBitsToFloat(uf_remappedVS[12].x) != 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = uf_remappedVS[13].w;
PV0iz = uf_remappedVS[14].w;
// 1
R127i.x = floatBitsToInt(-(intBitsToFloat(R2i.x)) + intBitsToFloat(PV0iz));
R127i.y = floatBitsToInt(-(intBitsToFloat(R0i.y)) + intBitsToFloat(PV0ix));
PV1iw = uf_remappedVS[15].w;
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[12].x));
// 2
PV0iz = floatBitsToInt(-(intBitsToFloat(R1i.z)) + intBitsToFloat(PV1iw));
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
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PV1ix)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = 0;
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[14].w) + intBitsToFloat(uf_remappedVS[13].w));
R0i.z = 0;
R1i.w = 0x3f800000;
R127i.z = ((intBitsToFloat(R8i.x) > 0.5)?-1:0);
// 1
backupReg0i = R127i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(uf_remappedVS[16].z)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].y), intBitsToFloat(uf_remappedVS[16].z)));
R4i.z = ((intBitsToFloat(R8i.y) > 0.5)?-1:0);
R2i.w = R10i.y;
R3i.x = R5i.w;
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(uf_remappedVS[15].w));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV1iy)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(uf_remappedVS[16].y)));
R3i.w = ((R127i.z == 0)?(R10i.x):(R3i.x));
PS0i = ((intBitsToFloat(R8i.z) > 0.5)?-1:0);
// 3
PV1ix = ((intBitsToFloat(R8i.w) > 0.5)?-1:0);
PV1iy = floatBitsToInt(-(intBitsToFloat(R10i.y)) + 1.0);
R127i.z = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3dd70a3d));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), intBitsToFloat(uf_remappedVS[16].w)));
R2i.z = ((PS0i == 0)?(R10i.x):(R5i.w));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R127i.x));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].x), intBitsToFloat(uf_remappedVS[16].y)));
R3i.z = ((PV1ix == 0)?(R10i.y):(PV1iy));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R127i.y));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0ix));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PV0iy)));
// 6
R123i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.w = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
// 7
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
// 8
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 9
R127i.x = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R127i.z = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 10
PS0i = floatBitsToInt(sin((intBitsToFloat(R127i.z))/0.1591549367));
// 11
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R126i.z)));
PS1i = floatBitsToInt(cos((intBitsToFloat(R127i.z))/0.1591549367));
// 12
R2i.x = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(PV1iz));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(sin((intBitsToFloat(R127i.x))/0.1591549367));
// 13
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R127i.w)));
R9i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0iw));
// 14
R0i.y = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(PV1iz));
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R6i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[17].x),intBitsToFloat(uf_remappedVS[17].y),intBitsToFloat(uf_remappedVS[17].z),intBitsToFloat(uf_remappedVS[17].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R126i.z = tempi.x;
PV0iw = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R6i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[18].x),intBitsToFloat(uf_remappedVS[18].y),intBitsToFloat(uf_remappedVS[18].z),intBitsToFloat(uf_remappedVS[18].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[19].x)) + intBitsToFloat(uf_remappedVS[19].y));
PV0iy = PV1ix;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
R123i.z = floatBitsToInt(intBitsToFloat(R126i.z) * 0.0 + intBitsToFloat(PV1ix));
R126i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
// 3
R123i.x = floatBitsToInt(intBitsToFloat(R126i.z) * 0.5 + intBitsToFloat(PV0iy));
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[20].w)) + intBitsToFloat(uf_remappedVS[21].w));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.z));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(PS1i));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[20].x)) + intBitsToFloat(uf_remappedVS[21].x));
R126i.x = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].w), intBitsToFloat(PV0iy)));
R2i.y = uf_remappedVS[22].x;
R6i.z = uf_remappedVS[22].y;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 6
R1i.x = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
R3i.y = uf_remappedVS[22].z;
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].y)) + intBitsToFloat(PV1ix));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R0i.y),intBitsToFloat(R9i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[18].x),intBitsToFloat(uf_remappedVS[18].y),intBitsToFloat(uf_remappedVS[18].z),intBitsToFloat(uf_remappedVS[18].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R126i.z = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 8
R127i.x = PV1ix;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) / 2.0);
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS1i));
R4i.w = uf_remappedVS[23].x;
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R0i.y),intBitsToFloat(R9i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[17].x),intBitsToFloat(uf_remappedVS[17].y),intBitsToFloat(uf_remappedVS[17].z),intBitsToFloat(uf_remappedVS[17].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R127i.w = tempi.x;
// 10
R125i.x = floatBitsToInt(intBitsToFloat(PV1ix) * 0.0 + intBitsToFloat(R127i.x));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.y) + -(intBitsToFloat(uf_remappedVS[19].x)));
R1i.z = floatBitsToInt(intBitsToFloat(PV1ix) * 0.0 + intBitsToFloat(R126i.z));
R124i.w = floatBitsToInt(intBitsToFloat(PV1ix) * 0.5 + intBitsToFloat(R127i.x));
// 11
R125i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[21].w)) + intBitsToFloat(uf_remappedVS[24].w));
R5i.w = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(R126i.x));
R5i.w = clampFI32(R5i.w);
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R0i.y),intBitsToFloat(R9i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[25].x),intBitsToFloat(uf_remappedVS[25].y),intBitsToFloat(uf_remappedVS[25].z),intBitsToFloat(uf_remappedVS[25].w))));
PV0ix = tempi.x;
R126i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R7i.z = ((0.0 >= intBitsToFloat(R5i.w))?-1:0);
// 13
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R0i.y),intBitsToFloat(R9i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[26].x),intBitsToFloat(uf_remappedVS[26].y),intBitsToFloat(uf_remappedVS[26].z),intBitsToFloat(uf_remappedVS[26].w))));
PV1iy = R126i.x;
PV1iz = R126i.x;
PV1iw = R126i.x;
R127i.y = ((R7i.z == 0)?(PV0ix):(R0i.x));
// 14
R127i.x = ((R7i.z == 0)?(R126i.x):(R0i.z));
R123i.y = ((R7i.z == 0)?(R15i.x):(R0i.x));
R9i.z = ((R7i.z == 0)?(0):(0x3f800000));
R127i.w = ((R7i.z == 0)?(R127i.w):(R126i.w));
R127i.z = R126i.z;
// 15
backupReg0i = R123i.y;
R123i.x = ((R7i.z == 0)?(R15i.z):(R126i.w));
R123i.y = ((R7i.z == 0)?(R15i.y):(R0i.z));
R124i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[21].x)) + intBitsToFloat(uf_remappedVS[24].x));
R125i.w = floatBitsToInt(intBitsToFloat(R126i.x) * -(0.5) + intBitsToFloat(R125i.x));
R15i.x = ((R9i.z == 0)?(R127i.y):(backupReg0i));
// 16
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[24].w)) + intBitsToFloat(uf_remappedVS[27].w));
R15i.y = ((R9i.z == 0)?(backupReg0i):(R123i.y));
R15i.z = ((R9i.z == 0)?(R127i.w):(R123i.x));
R123i.w = ((R7i.z == 0)?(R15i.w):(R126i.z));
R126i.x = floatBitsToInt(intBitsToFloat(R126i.y) * 0.5 + intBitsToFloat(R125i.x));
// 17
R125i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[24].x)) + intBitsToFloat(uf_remappedVS[27].x));
R15i.w = ((R9i.z == 0)?(R127i.z):(R123i.w));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R125i.z));
// 18
backupReg0i = R127i.x;
R127i.x = ((R7i.z == 0)?(0):(R5i.x));
R0i.y = floatBitsToInt(intBitsToFloat(R124i.z) * intBitsToFloat(PS1i));
R124i.z = ((R7i.z == 0)?(0):(R4i.y));
R1i.w = ((R7i.z == 0)?(0):(R5i.w));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 19
backupReg0i = R125i.x;
R125i.x = ((R7i.z == 0)?(0):(R11i.y));
R126i.y = ((R7i.z == 0)?(0):(R11i.x));
R0i.z = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(PS0i));
R6i.w = R16i.z;
R127i.z = ((R7i.z == 0)?(0):(R11i.w));
// 20
R124i.x = ((R7i.z == 0)?(0):(R124i.w));
R127i.y = ((R7i.z == 0)?(0):(R125i.w));
R125i.z = ((R7i.z == 0)?(0):(R126i.x));
R127i.w = ((R7i.z == 0)?(0):(R5i.z));
// 21
R126i.w = ((R7i.z == 0)?(0):(R11i.z));
// 22
R7i.w = R16i.z;
// 23
R17i.x = ((R9i.z == 0)?(R5i.x):(R127i.x));
R0i.w = ((R7i.z == 0)?(0):(R1i.z));
R18i.x = ((R9i.z == 0)?(R11i.x):(R126i.y));
// 24
R17i.y = ((R9i.z == 0)?(R4i.y):(R124i.z));
R17i.z = ((R9i.z == 0)?(R5i.z):(R127i.w));
R18i.y = ((R9i.z == 0)?(R11i.y):(R125i.x));
// 25
R18i.z = ((R9i.z == 0)?(R11i.z):(R126i.w));
R18i.w = ((R9i.z == 0)?(R11i.w):(R127i.z));
// 26
R19i.x = ((R9i.z == 0)?(R126i.x):(R125i.z));
R19i.y = ((R9i.z == 0)?(R125i.w):(R127i.y));
R19i.z = ((R9i.z == 0)?(R124i.w):(R124i.x));
R19i.w = ((R9i.z == 0)?(R1i.z):(R0i.w));
// 27
R17i.w = ((R9i.z == 0)?(R5i.w):(R1i.w));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[28].y))?1.0:0.0);
PV0iy = floatBitsToInt((intBitsToFloat(uf_remappedVS[28].y) > 0.0)?1.0:0.0);
PV0iz = uf_remappedVS[29].y & int(1);
PV0iw = uf_remappedVS[29].x & 0x80000;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[28].y));
// 1
PV1ix = (int(1) != PV0iz)?-1:0;
PV1iy = floatBitsToInt(intBitsToFloat(R12i.x) * intBitsToFloat(PS0i));
R125i.z = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
R126i.w = (PV0iw == 0x80000)?-1:0;
PS1i = int(intBitsToFloat(uf_remappedVS[30].z));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(uf_remappedVS[2].z)) + intBitsToFloat(PV1iy));
R11i.y = ((R126i.w == 0)?(R10i.y):(R2i.w));
R123i.z = ((PV1ix == 0)?(0):(int(1)));
R125i.w = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
R124i.w = floatBitsToInt(float(PS1i));
// 3
PV1ix = floatBitsToInt((0.0 >= abs(intBitsToFloat(R124i.w)))?1.0:0.0);
PV1iy = floatBitsToInt(-(abs(intBitsToFloat(R124i.w))) + 0.0);
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
PV1iw = (R123i.z == 0x2)?-1:0;
R127i.x = (R123i.z == int(1))?-1:0;
// 4
R126i.x = ((intBitsToFloat(PV1ix) == 0.0)?(0):(PV1iy));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PV1iz)));
R123i.z = ((PV1iw == 0)?(R8i.x):(R8i.z));
R123i.w = ((PV1iw == 0)?(R8i.y):(R8i.x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R124i.w));
// 5
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w),intBitsToFloat(R125i.w)) + intBitsToFloat(PV0iy));
R126i.y = ((R127i.x == 0)?(R123i.z):(R8i.y));
R127i.z = ((R127i.x == 0)?(R123i.w):(R8i.z));
PV1iw = floatBitsToInt(abs(intBitsToFloat(R124i.w)) + intBitsToFloat(R126i.x));
PS1i = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
// 6
R123i.x = ((-(intBitsToFloat(R126i.x)) > 0.0)?(PV1iw):(R126i.x));
R124i.y = floatBitsToInt(intBitsToFloat(R124i.x) + -(intBitsToFloat(uf_remappedVS[21].w)));
R125i.z = floatBitsToInt(intBitsToFloat(R124i.x) + -(intBitsToFloat(uf_remappedVS[20].w)));
R125i.w = floatBitsToInt(-(intBitsToFloat(R11i.y)) + 1.0);
R126i.z = floatBitsToInt(trunc(intBitsToFloat(PS1i)));
// 7
backupReg0i = R124i.x;
R124i.x = ((intBitsToFloat(R124i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.y = ((intBitsToFloat(R125i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R1i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(uf_remappedVS[24].w)));
PV1iw = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(uf_remappedVS[27].w)));
R124i.z = ((intBitsToFloat(R124i.w) == 0.0)?(0):(R123i.x));
// 8
PV0ix = floatBitsToInt(-(intBitsToFloat(R124i.x)) + 1.0);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R1i.x)) + intBitsToFloat(uf_remappedVS[20].x));
R125i.z = ((intBitsToFloat(R1i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iw = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
R1i.y = ((intBitsToFloat(PV1iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 9
R126i.x = uf_remappedVS[29].x & 0x100000;
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[20].x), intBitsToFloat(PV0iw)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
R125i.x = uf_remappedVS[29].x & 0x200000;
// 10
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[31].x), intBitsToFloat(R126i.y)));
R124i.x = floatBitsToInt(intBitsToFloat(R124i.x) * 2.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[31].y), intBitsToFloat(R127i.z)));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) * 2.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(PV1iz)) + intBitsToFloat(PV1iy));
R124i.w = uf_remappedVS[29].x & 0x400000;
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1iw)));
// 11
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(-(intBitsToFloat(R1i.y)) + 1.0);
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[32].z) + intBitsToFloat(uf_remappedVS[31].x));
R5i.z = ((R126i.w == 0)?(R10i.x):(R3i.w));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[32].w) + intBitsToFloat(uf_remappedVS[31].y));
R126i.w = (backupReg0i == 0x100000)?-1:0;
// 12
backupReg0i = R125i.x;
backupReg1i = R124i.w;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(uf_remappedVS[21].x));
R127i.y = floatBitsToInt(-(intBitsToFloat(R126i.y)) + intBitsToFloat(PV1iw));
R11i.z = floatBitsToInt(-(intBitsToFloat(R124i.x)) + intBitsToFloat(PV1iy));
R124i.w = (backupReg0i == 0x200000)?-1:0;
R126i.y = (backupReg1i == 0x400000)?-1:0;
// 13
backupReg0i = R127i.x;
backupReg1i = R124i.z;
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[33].x) + intBitsToFloat(uf_remappedVS[33].z));
R124i.y = ((backupReg0i == 0)?(R8i.x):(R8i.y));
R124i.z = ((backupReg0i == 0)?(R8i.y):(R8i.z));
R123i.w = ((R4i.z == 0)?(R11i.y):(R125i.w));
R124i.x = int(intBitsToFloat(backupReg1i));
// 14
backupReg0i = R125i.y;
R8i.x = ((R124i.w == 0)?(R10i.x):(R2i.z));
R125i.y = ((R126i.w == 0)?(R11i.y):(R123i.w));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(backupReg0i)) + intBitsToFloat(R127i.z));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[33].y) + intBitsToFloat(uf_remappedVS[33].w));
R125i.x = int(intBitsToFloat(R126i.z));
// 15
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[33].z),intBitsToFloat(R124i.y)) + intBitsToFloat(R127i.x));
R126i.y = ((R126i.y == 0)?(R10i.y):(R3i.z));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R126i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[33].w),intBitsToFloat(R124i.z)) + intBitsToFloat(PV0iw));
R124i.w = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[30].z));
// 16
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(R0i.z)) + intBitsToFloat(uf_remappedVS[24].x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[30].w));
// 17
backupReg0i = R127i.y;
backupReg1i = R124i.x;
R124i.x = R5i.z;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[30].x), intBitsToFloat(R124i.w)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[30].y), intBitsToFloat(PS0i)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.x),intBitsToFloat(uf_remappedVS[32].y)) + intBitsToFloat(backupReg0i));
R124i.z = floatBitsToInt(float(backupReg1i));
// 18
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.x)),intBitsToFloat(uf_remappedVS[32].x)) + -(intBitsToFloat(R11i.z)));
R11i.y = uf_remappedVS[34].x;
R11i.z = uf_remappedVS[34].y;
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R125i.z)) + intBitsToFloat(R127i.z));
PS0i = floatBitsToInt(float(R125i.x));
// 19
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.z)),intBitsToFloat(PS0i)) + intBitsToFloat(R124i.w));
R10i.y = ((R126i.w == 0)?(R5i.z):(backupReg0i));
R5i.z = uf_remappedVS[34].z;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R124i.z)) + intBitsToFloat(R123i.x));
R124i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[35].w));
// 20
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(uf_remappedVS[35].y)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.x),intBitsToFloat(uf_remappedVS[31].w)) + intBitsToFloat(R127i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R127i.y)) + -(0.5));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.x),intBitsToFloat(uf_remappedVS[31].z)) + intBitsToFloat(R127i.x));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R126i.z)) + -(0.5));
// 21
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[27].x),intBitsToFloat(R1i.y)) + intBitsToFloat(R125i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(R122i.x)) + -(intBitsToFloat(R124i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PV0ix)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R123i.z)) + intBitsToFloat(R126i.w));
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[35].z));
// 22
backupReg0i = R10i.y;
R10i.x = PV1iz;
R10i.y = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[35].x)));
R3i.w = floatBitsToInt(intBitsToFloat(R123i.y) + 0.5);
// 23
R1i.x = ((R7i.z == 0)?(0):(R10i.x));
R1i.y = ((R7i.z == 0)?(0):(R10i.y));
R4i.z = ((R7i.z == 0)?(0):(R3i.w));
R8i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV0iz)));
}
if( activeMaskStackC[3] == true ) {
// 0
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(uf_remappedVS[36].x)));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(uf_remappedVS[36].w)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), intBitsToFloat(uf_remappedVS[36].y)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(uf_remappedVS[36].z)));
R124i.y = ((R7i.z == 0)?(0):(R8i.w));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(uf_remappedVS[37].y)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(uf_remappedVS[37].x)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(uf_remappedVS[37].z)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(uf_remappedVS[37].w)));
R124i.w = ((R7i.z == 0)?(0):(R11i.y));
// 2
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(uf_remappedVS[38].x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].x), intBitsToFloat(PV1iy)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(uf_remappedVS[38].x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(uf_remappedVS[38].x)));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].x), intBitsToFloat(PV1ix)));
// 3
R124i.x = ((R7i.z == 0)?(0):(R127i.y));
R126i.y = ((R7i.z == 0)?(0):(R127i.x));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].x), intBitsToFloat(R124i.z)));
R126i.w = ((R7i.z == 0)?(0):(R125i.w));
R126i.z = ((R7i.z == 0)?(0):(R126i.x));
// 4
R125i.x = ((R7i.z == 0)?(0):(R124i.z));
R125i.y = ((R7i.z == 0)?(0):(R127i.z));
R125i.z = ((R7i.z == 0)?(0):(R127i.w));
// 5
R13i.x = ((R9i.z == 0)?(R8i.w):(R124i.y));
R13i.y = ((R9i.z == 0)?(R10i.x):(R1i.x));
R13i.z = ((R9i.z == 0)?(R10i.y):(R1i.y));
R13i.w = ((R9i.z == 0)?(R3i.w):(R4i.z));
// 6
R14i.x = ((R9i.z == 0)?(R127i.y):(R124i.x));
R14i.y = ((R9i.z == 0)?(R127i.x):(R126i.y));
R14i.z = ((R9i.z == 0)?(R124i.z):(R125i.x));
R14i.w = ((R9i.z == 0)?(R125i.w):(R126i.w));
// 7
R20i.x = ((R9i.z == 0)?(R126i.x):(R126i.z));
R20i.y = ((R9i.z == 0)?(R127i.z):(R125i.y));
// 8
R20i.z = ((R9i.z == 0)?(R127i.w):(R125i.z));
R20i.w = ((R9i.z == 0)?(R11i.y):(R124i.w));
}
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(R5i.w)) + 0.0);
R0i.y = uf_remappedVS[39].x;
R1i.x = 0;
// 1
R123i.x = ((R7i.z == 0)?(R0i.y):(R0i.y));
R123i.y = ((R7i.z == 0)?(R0i.x):(R1i.x));
R123i.z = ((R7i.z == 0)?(R16i.x):(R1i.x));
R123i.w = ((R7i.z == 0)?(R16i.y):(R0i.y));
// 2
R16i.x = ((R9i.z == 0)?(R123i.y):(R123i.z));
R16i.y = ((R9i.z == 0)?(R123i.x):(R123i.w));
R16i.z = ((R9i.z == 0)?(R6i.w):(R7i.w));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.w));
// export
// skipped export to semanticId 255
// export
// skipped export to semanticId 255
// export
passParameterSem7 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.z));
}
