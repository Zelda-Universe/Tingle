#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 7d8ea6fc89d75a56
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[56];
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
out vec4 passParameterSem3;
out vec4 passParameterSem7;
out vec4 passParameterSem8;
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
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem9;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem8;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem1;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem2;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem6;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem5;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem0;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R14i.y = floatBitsToInt(-(intBitsToFloat(R3i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R0i.w = 0;
R1i.w = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R14i.y));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R9i.x = 0;
R9i.y = 0;
R9i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R13i.x = 0;
// 1
R3i.w = R1i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R3i.w = R0i.w;
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
R0i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R14i.y) >= intBitsToFloat(R0i.z));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R9i.x = 0;
R9i.y = 0;
R9i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R13i.x = 0;
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
R9i.z = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
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
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].x), intBitsToFloat(R127i.y)));
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].x), intBitsToFloat(R127i.y)));
// 2
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].x), intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R10i.x = 0;
// 1
R12i.x = R10i.x;
// 2
R11i.x = R10i.x;
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
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].y), intBitsToFloat(R127i.x)));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].y), intBitsToFloat(R127i.x)));
// 2
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R12i.y = 0;
R11i.y = 0;
// 1
R10i.y = 0;
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
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].z), intBitsToFloat(R127i.x)));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].z), intBitsToFloat(R127i.x)));
// 2
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R12i.z = 0;
R11i.z = 0;
// 1
R10i.z = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R125i.x = floatBitsToInt(max(intBitsToFloat(R5i.x), 0.0));
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[5].x))?1.0:0.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(uf_remappedVS[6].y)));
PV0iw = floatBitsToInt((intBitsToFloat(uf_remappedVS[5].x) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[5].x));
// 1
R127i.x = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(intBitsToFloat(R14i.y) * intBitsToFloat(PS0i));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].w)) + intBitsToFloat(uf_remappedVS[8].w));
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].z)) + intBitsToFloat(uf_remappedVS[8].z));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R0i.z));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].x)) + intBitsToFloat(uf_remappedVS[8].x));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].y)) + intBitsToFloat(uf_remappedVS[8].y));
R13i.x = floatBitsToInt(intBitsToFloat(R14i.y) * intBitsToFloat(PS1i));
// 3
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.x), intBitsToFloat(PV0iy)));
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].z)) + intBitsToFloat(uf_remappedVS[9].z));
PV1iz = floatBitsToInt(fract(intBitsToFloat(PV0ix)));
R125i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].w)) + intBitsToFloat(uf_remappedVS[9].w));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.z));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV1iz)));
R125i.y = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS1i));
R127i.z = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS1i));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].x)) + intBitsToFloat(uf_remappedVS[9].x));
// 5
backupReg0i = R125i.w;
R9i.x = floatBitsToInt(min(intBitsToFloat(R125i.x), 0.0));
PV1iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].y)) + intBitsToFloat(uf_remappedVS[9].y));
R125i.w = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 6
backupReg0i = R127i.y;
R125i.x = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(PS1i));
R127i.y = floatBitsToInt(intBitsToFloat(R125i.w) + -(intBitsToFloat(uf_remappedVS[7].w)));
R126i.z = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(PS1i));
R124i.w = floatBitsToInt(intBitsToFloat(R125i.w) + -(intBitsToFloat(uf_remappedVS[8].w)));
R0i.w = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(PS1i));
// 7
backupReg0i = R127i.w;
R0i.x = floatBitsToInt(intBitsToFloat(R125i.w) + -(intBitsToFloat(uf_remappedVS[9].w)));
PV1iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].w)) + intBitsToFloat(uf_remappedVS[10].w));
R125i.z = ((intBitsToFloat(R124i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R125i.y)));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(backupReg0i)));
// 8
backupReg0i = R127i.y;
backupReg1i = R127i.z;
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].x)) + intBitsToFloat(uf_remappedVS[10].x));
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].y)) + intBitsToFloat(uf_remappedVS[10].y));
R127i.z = ((intBitsToFloat(backupReg0i) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(backupReg1i)));
R9i.w = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 9
backupReg0i = R126i.z;
R124i.x = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
PV1iy = floatBitsToInt(intBitsToFloat(R125i.w) + -(intBitsToFloat(uf_remappedVS[10].w)));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].z)) + intBitsToFloat(uf_remappedVS[10].z));
R125i.w = ((intBitsToFloat(R0i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(backupReg0i)));
// 10
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].z) + intBitsToFloat(R126i.w));
R126i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].x) + intBitsToFloat(R127i.w));
R124i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].y) + intBitsToFloat(backupReg0i));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R125i.x)));
R9i.z = ((intBitsToFloat(PV1iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 11
backupReg0i = R127i.y;
backupReg1i = R126i.z;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R0i.w)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(R9i.w));
R126i.z = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(R9i.w));
R124i.w = floatBitsToInt(intBitsToFloat(backupReg1i) * intBitsToFloat(R9i.w));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R124i.x)));
// 12
backupReg0i = R125i.y;
PV0ix = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
R125i.y = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].y) + intBitsToFloat(R127i.w));
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].x) + intBitsToFloat(backupReg0i));
R0i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].z) + intBitsToFloat(PV1ix));
// 13
backupReg0i = R125i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R127i.y)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R126i.z)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R124i.w)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0ix)));
R126i.z = floatBitsToInt(-(intBitsToFloat(R9i.z)) + 1.0);
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R124i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].x), intBitsToFloat(R125i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R124i.y)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R124i.y)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].y), intBitsToFloat(R125i.y)));
// 15
backupReg0i = R125i.y;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R126i.z)));
R125i.y = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0iy));
R126i.z = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].z), intBitsToFloat(backupReg0i)));
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].x) + intBitsToFloat(R127i.x));
// 16
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(PV1iw));
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].z) + intBitsToFloat(R125i.z));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R126i.w)));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].y) + intBitsToFloat(backupReg0i));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R126i.w)));
// 17
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R126i.w)));
PV1iy = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(R126i.z));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R124i.x)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(R125i.y));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R124i.x)));
// 18
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R124i.x)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PV1iw));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R126i.x));
R126i.w = floatBitsToInt(intBitsToFloat(PS1i) + intBitsToFloat(PV1iy));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].x), intBitsToFloat(R9i.z)));
// 19
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].z), intBitsToFloat(R9i.z)));
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].y), intBitsToFloat(R9i.z)));
R0i.x = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(R9i.x));
// 20
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R126i.w));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1iz)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PV1iy));
R9i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[11].x)) + 1.0);
// 21
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(PV0iw)));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(PV0ix)));
R1i.w = ((intBitsToFloat(uf_remappedVS[11].x) == 1.0)?-1:0);
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
backupReg0i = R9i.x;
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[12].y)));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(uf_remappedVS[12].z)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[12].w)));
// 1
R2i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(R14i.y));
// 2
predResult = (R1i.w != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R2i.w)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].w), intBitsToFloat(PV0ix)));
// 2
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].x), intBitsToFloat(PV1iw)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].y), intBitsToFloat(PV1iw)));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].z), intBitsToFloat(PV1iw)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
tempResultf = max(0.0, abs(intBitsToFloat(uf_remappedVS[11].x)));
tempResultf = log2(tempResultf);
PS0i = floatBitsToInt(tempResultf);
// 1
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f317218));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[11].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PS1i)));
R127i.y = ((intBitsToFloat(uf_remappedVS[11].x) == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R9i.y));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R2i.w) + -(intBitsToFloat(PV1iz)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].w), intBitsToFloat(PV1ix)));
// 9
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].x), intBitsToFloat(PV0iw)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].y), intBitsToFloat(PV0iw)));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].z), intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(R5i.y));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R0i.z)));
PV0iz = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(R5i.z));
R0i.w = 0x3f800000;
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[11].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) * 0.5);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) * 0.5);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(R5i.z));
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R9i.y));
// 2
R124i.x = floatBitsToInt(intBitsToFloat(R5i.x) + -(0.5));
R127i.y = floatBitsToInt(intBitsToFloat(PV1iy) + -(0.5));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) * 0.5);
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + -(0.5));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iz)));
// 3
R126i.x = floatBitsToInt(intBitsToFloat(PV0iz) + -(0.5));
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) * 2.0);
PV1iy = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R126i.z = floatBitsToInt(intBitsToFloat(R5i.z) + -(0.5));
R126i.w = floatBitsToInt(intBitsToFloat(R5i.y) + -(0.5));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedVS[14].x)));
// 4
R125i.x = floatBitsToInt(intBitsToFloat(PS1i) + intBitsToFloat(uf_remappedVS[15].x));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(R127i.x));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(uf_remappedVS[14].y)));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(uf_remappedVS[14].z)));
R126i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[15].y) + intBitsToFloat(PV0iw));
R123i.w = ((R1i.w == 0)?(PV0iz):(R2i.w));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R123i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R123i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R123i.w)));
R125i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[15].z) + intBitsToFloat(PV1ix));
PS0i = uf_remappedVS[16].x & 0x10000;
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R6i.z) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(PV0ix));
R127i.z = uf_remappedVS[16].x & 0x20000;
PV1iw = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV0iy));
PS1i = floatBitsToInt(float(PS0i));
// 8
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1iy)));
PS0i = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
// 9
R0i.x = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(PV0iz));
R6i.y = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(PV0iw));
R2i.z = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(float(R127i.z));
// 10
PV0ix = uf_remappedVS[16].x & 0x40000;
PV0iy = R5i.y;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R127i.y = int(intBitsToFloat(PV1iw));
// 11
PV1ix = 0 - R127i.y;
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iw)));
R127i.z = R5i.z;
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 2.0);
R127i.w = floatBitsToInt(floor(intBitsToFloat(PV0iy)));
PS1i = floatBitsToInt(float(PV0ix));
// 12
R127i.x = floatBitsToInt((intBitsToFloat(R127i.w) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iz = max(R127i.y, PV1ix);
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R126i.x = int(intBitsToFloat(PV1iy));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(R127i.w))?1.0:0.0);
PV1iz = 0 - R126i.x;
PV1iw = floatBitsToInt(floor(intBitsToFloat(R127i.z)));
R127i.w = floatBitsToInt(float(PV0iz));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
// 14
PV0ix = floatBitsToInt((intBitsToFloat(PV1iw) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PV1iw))?1.0:0.0);
PV0iz = floatBitsToInt(intBitsToFloat(R127i.x) + -(intBitsToFloat(PV1iy)));
PV0iw = max(R126i.x, PV1iz);
R127i.z = int(intBitsToFloat(PV1ix));
// 15
PV1ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)), intBitsToFloat(PV0iz)));
PV1iy = 0 - R127i.z;
PV1iz = R5i.x;
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 2.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iy)));
PS1i = floatBitsToInt(float(PV0iw));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 16
PV0ix = floatBitsToInt(floor(intBitsToFloat(PV1iz)));
PV0iy = max(R127i.z, PV1iy);
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PV1ix)));
// 17
R127i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PS0i));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PV0ix))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(PV0ix) > 0.0)?1.0:0.0);
R2i.w = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(PV0iw));
R125i.x = floatBitsToInt(float(PV0iy));
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) * 2.0);
// 18
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R127i.z)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iy)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(uf_remappedVS[17].x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R127i.z)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(uf_remappedVS[17].y)));
// 19
R6i.x = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0iz));
R2i.y = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.x)), intBitsToFloat(PV0iy)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(uf_remappedVS[17].z)));
// 20
R2i.x = ((intBitsToFloat(uf_remappedVS[15].w) == 1.0)?-1:0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PV1iw)));
R6i.w = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R127i.z));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[15].w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 21
R1i.x = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y), intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[15].w)) + 1.0);
PV1iw = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0iz));
// 22
R3i.x = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R126i.y));
PV0iy = uf_remappedVS[18].x;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
PV0iz = uf_remappedVS[18].y;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 23
PV1ix = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PV1iy = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV0iy));
R3i.w = floatBitsToInt(intBitsToFloat(R0i.y) * 0.0 + 1.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 24
R4i.x = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(PS1i));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(PV1iz)));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y), intBitsToFloat(PV1iy)));
}
if( activeMaskStackC[3] == true ) {
// 0
R123i.z = ((R2i.x == 0)?(R4i.x):(R14i.y));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R123i.z)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R123i.z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R123i.z)));
// 2
PV0iy = floatBitsToInt(intBitsToFloat(R3i.x) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(intBitsToFloat(R6i.w) + intBitsToFloat(PV1iy));
// 3
R123i.x = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.w = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
// 4
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
// 5
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 6
R127i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R126i.y = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R127i.z = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[19].x), intBitsToFloat(uf_remappedVS[20].x)));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R6i.y),intBitsToFloat(R2i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R1i.w = tempi.x;
R124i.x = floatBitsToInt(sin((intBitsToFloat(R126i.y))/0.1591549367));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R6i.y),intBitsToFloat(R2i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[22].x),intBitsToFloat(uf_remappedVS[22].y),intBitsToFloat(uf_remappedVS[22].z),intBitsToFloat(uf_remappedVS[22].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R2i.w = tempi.x;
R126i.z = floatBitsToInt(cos((intBitsToFloat(R126i.y))/0.1591549367));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R6i.y),intBitsToFloat(R2i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[23].x),intBitsToFloat(uf_remappedVS[23].y),intBitsToFloat(uf_remappedVS[23].z),intBitsToFloat(uf_remappedVS[23].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R0i.w = tempi.x;
R125i.w = floatBitsToInt(sin((intBitsToFloat(R127i.z))/0.1591549367));
// 10
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R125i.w)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[19].x), intBitsToFloat(uf_remappedVS[20].y)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R125i.w)));
R126i.y = floatBitsToInt(cos((intBitsToFloat(R127i.z))/0.1591549367));
// 11
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R126i.y)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R126i.y)));
R126i.x = floatBitsToInt(sin((intBitsToFloat(R127i.x))/0.1591549367));
// 12
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(R126i.x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R125i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R125i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R127i.y)));
R127i.z = floatBitsToInt(cos((intBitsToFloat(backupReg0i))/0.1591549367));
// 13
backupReg0i = R127i.y;
backupReg1i = R126i.z;
PV1ix = floatBitsToInt(-(intBitsToFloat(R125i.x)) + intBitsToFloat(PV0iw));
R127i.y = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV0iy));
R126i.z = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + intBitsToFloat(PV0iz));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R127i.z)));
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), intBitsToFloat(R127i.z)));
// 14
backupReg0i = R127i.z;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R126i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R0i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(backupReg0i)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(backupReg0i)));
R126i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[20].w) * 1.0);
// 15
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R0i.y)));
R6i.y = 0x3f800000;
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R125i.x)) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV0ix));
// 16
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R127i.x)) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R0i.y)));
// 17
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R127i.z)) + intBitsToFloat(PV0iz));
// 18
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R126i.z)) + intBitsToFloat(R123i.w));
// 19
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.x),intBitsToFloat(R126i.z),intBitsToFloat(R3i.w))));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
// 20
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.x),intBitsToFloat(R126i.z),intBitsToFloat(R3i.w))));
PV0iy = R126i.x;
PV0iz = R126i.x;
PV0iw = R126i.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[20].z)));
// 21
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),intBitsToFloat(R12i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.x),intBitsToFloat(R126i.z),intBitsToFloat(R3i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R4i.z = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(R124i.w));
// 22
R123i.z = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(uf_remappedVS[20].z)));
// 23
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R124i.z));
// 24
R123i.x = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.w = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 25
PV1ix = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
// 26
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R124i.z = floatBitsToInt(cos((intBitsToFloat(PV1ix))/0.1591549367));
// 27
PV1iw = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
// 28
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1iw))/0.1591549367));
// 29
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R124i.z)));
// 30
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R126i.w)));
// 31
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(0xbccccccd));
// 32
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[19].y), intBitsToFloat(PV1iz)));
// 33
R4i.y = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV0iz));
}
if( activeMaskStackC[3] == true ) {
// 0
R9i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R6i.y)),vec4(intBitsToFloat(uf_remappedVS[24].x),intBitsToFloat(uf_remappedVS[24].y),intBitsToFloat(uf_remappedVS[24].z),intBitsToFloat(uf_remappedVS[24].w))));
PV0iy = R9i.x;
PV0iz = R9i.x;
PV0iw = R9i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R6i.y)),vec4(intBitsToFloat(uf_remappedVS[25].x),intBitsToFloat(uf_remappedVS[25].y),intBitsToFloat(uf_remappedVS[25].z),intBitsToFloat(uf_remappedVS[25].w))));
PV1ix = tempi.x;
R9i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R6i.y)),vec4(intBitsToFloat(uf_remappedVS[26].x),intBitsToFloat(uf_remappedVS[26].y),intBitsToFloat(uf_remappedVS[26].z),intBitsToFloat(uf_remappedVS[26].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R9i.w = tempi.x;
// 3
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R6i.y)),vec4(intBitsToFloat(uf_remappedVS[27].x),intBitsToFloat(uf_remappedVS[27].y),intBitsToFloat(uf_remappedVS[27].z),intBitsToFloat(uf_remappedVS[27].w))));
PV1iy = R126i.x;
PV1iz = R126i.x;
PV1iw = R126i.x;
R127i.w = PV0ix;
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) / 2.0);
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R6i.y)),vec4(intBitsToFloat(uf_remappedVS[28].x),intBitsToFloat(uf_remappedVS[28].y),intBitsToFloat(uf_remappedVS[28].z),intBitsToFloat(uf_remappedVS[28].w))));
PV0ix = tempi.x;
R126i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R6i.y)),vec4(intBitsToFloat(uf_remappedVS[29].x),intBitsToFloat(uf_remappedVS[29].y),intBitsToFloat(uf_remappedVS[29].z),intBitsToFloat(uf_remappedVS[29].w))));
PV1ix = tempi.x;
R127i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R6i.y)),vec4(intBitsToFloat(uf_remappedVS[30].x),intBitsToFloat(uf_remappedVS[30].y),intBitsToFloat(uf_remappedVS[30].z),intBitsToFloat(uf_remappedVS[30].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R126i.w = tempi.x;
// 7
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[31].y))?1.0:0.0);
R124i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[18].z) + intBitsToFloat(R127i.y));
PV1iw = floatBitsToInt((intBitsToFloat(uf_remappedVS[31].y) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[31].y));
// 8
R127i.y = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1ix)));
R124i.w = floatBitsToInt(intBitsToFloat(R14i.y) * intBitsToFloat(PS1i));
// 9
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R124i.z),intBitsToFloat(R126i.w)),vec4(intBitsToFloat(uf_remappedVS[32].x),intBitsToFloat(uf_remappedVS[32].y),intBitsToFloat(uf_remappedVS[32].z),intBitsToFloat(uf_remappedVS[32].w))));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
R125i.x = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R124i.z),intBitsToFloat(R126i.w)),vec4(intBitsToFloat(uf_remappedVS[33].x),intBitsToFloat(uf_remappedVS[33].y),intBitsToFloat(uf_remappedVS[33].z),intBitsToFloat(uf_remappedVS[33].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 11
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(uf_remappedVS[5].z)) + intBitsToFloat(R124i.w));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
// 13
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV0iy)));
// 14
R10i.x = floatBitsToInt(intBitsToFloat(R9i.x) * 0.5 + intBitsToFloat(R127i.w));
R10i.y = floatBitsToInt(intBitsToFloat(R9i.y) * -(0.5) + intBitsToFloat(R127i.w));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.x),intBitsToFloat(R125i.x)) + intBitsToFloat(PV1iw));
R10i.w = floatBitsToInt(intBitsToFloat(R9i.w) * 1.0);
R10i.z = floatBitsToInt(intBitsToFloat(R9i.z) * 0.5 + intBitsToFloat(R127i.w));
// 15
R0i.x = floatBitsToInt(-(intBitsToFloat(R7i.z)) + 1.0);
PV1iy = uf_remappedVS[16].x & 0x80000;
R2i.z = R7i.w;
R3i.w = ((intBitsToFloat(R5i.x) > 0.5)?-1:0);
// 16
R3i.x = (PV1iy == 0x80000)?-1:0;
}
if( activeMaskStackC[3] == true ) {
// 0
R125i.x = uf_remappedVS[34].z;
R126i.y = uf_remappedVS[34].y;
R126i.z = uf_remappedVS[34].x;
// 1
R123i.x = ((R3i.w == 0)?(R7i.z):(R0i.x));
R127i.y = floatBitsToInt(intBitsToFloat(R4i.z) + -(intBitsToFloat(uf_remappedVS[35].w)));
R124i.z = floatBitsToInt(intBitsToFloat(R4i.z) + -(intBitsToFloat(uf_remappedVS[36].w)));
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].w)) + intBitsToFloat(uf_remappedVS[36].w));
R122i.x = ((R3i.w == 0)?(R7i.w):(R2i.z));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].x)) + intBitsToFloat(uf_remappedVS[36].x));
R125i.y = ((intBitsToFloat(R127i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R2i.z = ((R3i.x == 0)?(R7i.w):(R122i.x));
R0i.w = ((R3i.x == 0)?(R7i.z):(R123i.x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 3
R126i.x = ((intBitsToFloat(R124i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(PS0i));
PV1iz = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
R127i.w = uf_remappedVS[37].x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(uf_remappedVS[38].x)));
// 4
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PV1iy)) + intBitsToFloat(uf_remappedVS[35].x));
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].x), intBitsToFloat(PV1iz)));
R124i.w = ((intBitsToFloat(R5i.y) > 0.5)?-1:0);
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(uf_remappedVS[38].y)));
// 5
backupReg0i = R125i.x;
R125i.x = uf_remappedVS[37].y;
PV1iy = floatBitsToInt(-(intBitsToFloat(R2i.z)) + 1.0);
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[38].z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV0iy)));
R6i.y = R0i.w;
// 6
backupReg0i = R127i.w;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PV1iw)) + intBitsToFloat(R126i.z));
R125i.y = uf_remappedVS[37].z;
R4i.z = ((R124i.w == 0)?(R2i.z):(PV1iy));
R127i.w = ((intBitsToFloat(R5i.z) > 0.5)?-1:0);
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[39].x)));
// 7
PV1ix = ((intBitsToFloat(R5i.w) > 0.5)?-1:0);
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(uf_remappedVS[39].y)));
PV1iz = floatBitsToInt(-(intBitsToFloat(R7i.x)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].x),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.x));
PS1i = floatBitsToInt(-(intBitsToFloat(R7i.y)) + 1.0);
// 8
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[40].x)));
R4i.y = ((R127i.w == 0)?(R7i.x):(PV1iz));
R3i.w = ((PV1ix == 0)?(R7i.y):(PS1i));
R11i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(uf_remappedVS[38].w)));
// 9
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[40].x)));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[40].x)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(uf_remappedVS[39].z)));
// 10
R6i.w = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[41].z));
// 11
R1i.z = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[41].w));
}
if( activeMaskStackC[3] == true ) {
// 0
R3i.x = uf_remappedVS[42].x;
PV0iy = uf_remappedVS[16].x & 0x100000;
PV0iz = uf_remappedVS[16].x & 0x200000;
PV0iw = uf_remappedVS[16].x & 0x400000;
PS0i = uf_remappedVS[16].y & int(1);
// 1
PV1ix = (PV0iy == 0x100000)?-1:0;
PV1iy = (PV0iz == 0x200000)?-1:0;
PV1iz = (PV0iw == 0x400000)?-1:0;
PV1iw = (int(1) != PS0i)?-1:0;
// 2
R7i.x = ((PV1iy == 0)?(R7i.x):(R4i.y));
R4i.y = ((PV1ix == 0)?(R2i.z):(R4i.z));
R2i.z = ((PV1iz == 0)?(R7i.y):(R3i.w));
R0i.w = ((PV1ix == 0)?(R0i.w):(R6i.y));
R122i.x = ((PV1iw == 0)?(0):(int(1)));
// 3
R126i.x = (R122i.x == int(1))?-1:0;
PV1iw = (R122i.x == 0x2)?-1:0;
// 4
R123i.x = ((PV1iw == 0)?(R5i.z):(R5i.y));
R123i.y = ((PV1iw == 0)?(R5i.y):(R5i.x));
R123i.z = ((PV1iw == 0)?(R5i.x):(R5i.z));
R3i.w = ((R126i.x == 0)?(R5i.x):(R5i.y));
R7i.w = ((R126i.x == 0)?(R5i.y):(R5i.z));
// 5
backupReg0i = R5i.y;
R5i.y = ((R126i.x == 0)?(R123i.x):(R5i.x));
R5i.z = ((R126i.x == 0)?(R123i.y):(R5i.z));
R5i.w = ((R126i.x == 0)?(R123i.z):(backupReg0i));
}
if( activeMaskStackC[3] == true ) {
// 0
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].x), intBitsToFloat(R1i.x)));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].x), intBitsToFloat(R0i.y)));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].x), intBitsToFloat(R0i.z)));
R12i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(uf_remappedVS[39].w)));
// 1
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(uf_remappedVS[41].y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[41].x)));
PS1i = int(intBitsToFloat(uf_remappedVS[43].z));
// 2
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1iw)));
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[44].x), intBitsToFloat(R5i.w)));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[45].z) + intBitsToFloat(uf_remappedVS[44].x));
R125i.y = floatBitsToInt(float(PS1i));
// 3
PV1ix = floatBitsToInt(-(abs(intBitsToFloat(R125i.y))) + 0.0);
PV1iy = floatBitsToInt((0.0 >= abs(intBitsToFloat(R125i.y)))?1.0:0.0);
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[44].y), intBitsToFloat(R5i.z)));
R124i.z = floatBitsToInt(intBitsToFloat(R124i.z) * 2.0);
PV1iw = floatBitsToInt(-(intBitsToFloat(PV0iz)) + intBitsToFloat(PV0iw));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R125i.y));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R14i.y)),intBitsToFloat(uf_remappedVS[45].x)) + -(intBitsToFloat(PV1iw)));
R126i.z = ((intBitsToFloat(PV1iy) == 0.0)?(0):(PV1ix));
R5i.w = floatBitsToInt(intBitsToFloat(R13i.x) + 0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[43].z));
// 5
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[43].x), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(abs(intBitsToFloat(R125i.y)) + intBitsToFloat(R126i.z));
PV1iw = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[43].w));
// 6
R123i.x = ((-(intBitsToFloat(R126i.z)) > 0.0)?(PV1iy):(R126i.z));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(R126i.x)) + -(0.5));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[43].y), intBitsToFloat(PS1i)));
PS0i = int(intBitsToFloat(PV1iw));
// 7
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[45].w) + intBitsToFloat(uf_remappedVS[44].y));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R126i.z)) + -(0.5));
R123i.w = ((intBitsToFloat(R125i.y) == 0.0)?(0):(R123i.x));
R127i.z = floatBitsToInt(float(PS0i));
// 8
PV0ix = floatBitsToInt(-(intBitsToFloat(R124i.z)) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[46].y) + intBitsToFloat(uf_remappedVS[46].z));
PS0i = int(intBitsToFloat(R123i.w));
// 9
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y),intBitsToFloat(uf_remappedVS[45].y)) + intBitsToFloat(PV0ix));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[46].z),intBitsToFloat(R5i.y)) + intBitsToFloat(PV0iw));
PS1i = floatBitsToInt(float(PS0i));
// 10
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.z)),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.y));
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[47].x) + intBitsToFloat(uf_remappedVS[47].z));
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[47].y) + intBitsToFloat(uf_remappedVS[47].w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(PS1i)) + intBitsToFloat(R127i.y));
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[47].z),intBitsToFloat(R3i.w)) + intBitsToFloat(PV0iy));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[47].w),intBitsToFloat(R7i.w)) + intBitsToFloat(PV0iz));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y),intBitsToFloat(uf_remappedVS[46].x)) + intBitsToFloat(R124i.z));
// 12
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(-(intBitsToFloat(R123i.w)) * intBitsToFloat(0x3e22f983) + 0.5);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y),intBitsToFloat(uf_remappedVS[44].w)) + intBitsToFloat(R123i.z));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y),intBitsToFloat(uf_remappedVS[44].z)) + intBitsToFloat(backupReg0i));
// 13
PV1iw = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
// 14
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 15
R127i.y = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
// 16
R125i.x = floatBitsToInt(sin((intBitsToFloat(R127i.y))/0.1591549367));
// 17
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R126i.y)));
PS1i = floatBitsToInt(cos((intBitsToFloat(R127i.y))/0.1591549367));
// 18
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R126i.y)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i),intBitsToFloat(R125i.z)) + intBitsToFloat(PV1iz));
// 19
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R123i.y)) + -(intBitsToFloat(R126i.x)));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.x)),intBitsToFloat(R125i.z)) + intBitsToFloat(PV0ix));
// 20
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R123i.w)) + intBitsToFloat(R127i.w));
// 21
R15i.z = floatBitsToInt(intBitsToFloat(R123i.x) + 0.5);
R15i.w = floatBitsToInt(intBitsToFloat(R125i.y) + 0.5);
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R5i.w) + -(intBitsToFloat(uf_remappedVS[48].w)));
PV0iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[49].w)) + intBitsToFloat(uf_remappedVS[48].w));
R127i.w = floatBitsToInt(intBitsToFloat(R5i.w) + -(intBitsToFloat(uf_remappedVS[49].w)));
// 1
R125i.x = ((intBitsToFloat(R127i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.y = ((intBitsToFloat(R127i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[49].x)) + intBitsToFloat(uf_remappedVS[48].x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 2
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[48].x)) + intBitsToFloat(uf_remappedVS[50].x));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(PS1i));
// 3
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV0iw)) + intBitsToFloat(uf_remappedVS[49].x));
R127i.w = floatBitsToInt(intBitsToFloat(R5i.w) + -(intBitsToFloat(uf_remappedVS[50].w)));
// 4
R124i.x = ((intBitsToFloat(R127i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iy = floatBitsToInt(-(intBitsToFloat(R125i.x)) + 1.0);
R127i.z = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[48].w)) + intBitsToFloat(uf_remappedVS[50].w));
// 5
PV1ix = floatBitsToInt(-(intBitsToFloat(R124i.x)) + 1.0);
R124i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[50].x)) + intBitsToFloat(uf_remappedVS[51].x));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV0iy)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 6
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[50].w)) + intBitsToFloat(uf_remappedVS[51].w));
R124i.w = floatBitsToInt(intBitsToFloat(R5i.w) + -(intBitsToFloat(uf_remappedVS[51].w)));
// 7
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PV0iy)) + intBitsToFloat(uf_remappedVS[48].x));
R125i.z = ((intBitsToFloat(R124i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.w = floatBitsToInt(intBitsToFloat(R5i.w) + -(intBitsToFloat(uf_remappedVS[52].w)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 8
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[51].x)) + intBitsToFloat(uf_remappedVS[52].x));
R125i.y = ((intBitsToFloat(R126i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iz = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
PV0iw = floatBitsToInt(intBitsToFloat(R124i.z) * intBitsToFloat(PS1i));
// 9
PV1ix = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
R126i.y = floatBitsToInt(intBitsToFloat(R5i.w) + -(intBitsToFloat(uf_remappedVS[53].w)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV0iw)) + intBitsToFloat(uf_remappedVS[50].x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(PV0iz)));
// 10
R124i.x = ((intBitsToFloat(R126i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[51].w)) + intBitsToFloat(uf_remappedVS[52].w));
// 11
PV1ix = floatBitsToInt(-(intBitsToFloat(R124i.x)) + 1.0);
R125i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[52].x)) + intBitsToFloat(uf_remappedVS[53].x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 12
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[52].w)) + intBitsToFloat(uf_remappedVS[53].w));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS1i));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV1ix)));
// 13
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(PV0iy)) + intBitsToFloat(uf_remappedVS[51].x));
R124i.w = floatBitsToInt(intBitsToFloat(R5i.w) + -(intBitsToFloat(uf_remappedVS[54].w)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 14
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[53].x)) + intBitsToFloat(uf_remappedVS[54].x));
R125i.y = ((intBitsToFloat(R124i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iw = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(PS1i));
// 15
PV1ix = floatBitsToInt(intBitsToFloat(R5i.w) + -(intBitsToFloat(uf_remappedVS[55].w)));
PV1iy = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PV0iw)) + intBitsToFloat(uf_remappedVS[52].x));
// 16
backupReg0i = R124i.x;
R124i.x = ((intBitsToFloat(PV1ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[53].w)) + intBitsToFloat(uf_remappedVS[54].w));
// 17
PV1ix = floatBitsToInt(-(intBitsToFloat(R124i.x)) + 1.0);
R125i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[54].x)) + intBitsToFloat(uf_remappedVS[55].x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 18
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[54].w)) + intBitsToFloat(uf_remappedVS[55].w));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS1i));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV1ix)));
// 19
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(PV0iy)) + intBitsToFloat(uf_remappedVS[53].x));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[49].x), intBitsToFloat(R127i.z)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 20
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R125i.w)) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(PS1i));
// 21
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(PV0iw)) + intBitsToFloat(uf_remappedVS[54].x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R125i.x)) + intBitsToFloat(R123i.x));
// 22
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.w));
// 23
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.z));
// 24
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R3i.w)) + intBitsToFloat(R123i.y));
// 25
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R124i.y)) + intBitsToFloat(R123i.x));
// 26
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R126i.w)) + intBitsToFloat(R123i.w));
// 27
R13i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[12].x) * 1.0 + 0.0);
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[55].x),intBitsToFloat(R124i.x)) + intBitsToFloat(R123i.z));
// 28
R16i.x = R8i.x;
R16i.y = R8i.y;
R16i.z = R8i.z;
R16i.w = R8i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));
// export
// skipped export to semanticId 255
// export
passParameterSem3 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.z));
}
