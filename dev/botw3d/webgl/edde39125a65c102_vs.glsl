#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader edde39125a65c102
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[38];
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

out vec4 passParameterSem0;
out vec4 passParameterSem3;
out vec4 passParameterSem7;
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
attrDecoder = attrDataSem7;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem12;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R11i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem11;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R10i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem4;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem5;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem9;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R9i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem8;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem3;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
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
R16i.y = floatBitsToInt(-(intBitsToFloat(R6i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R4i.w = 0;
R6i.w = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R16i.y));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R0i.x = 0;
R0i.y = 0;
R0i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R12i.x = 0;
// 1
R7i.w = R6i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R7i.w = R4i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R7i.w == 0);
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
PS0i = int(intBitsToFloat(R5i.w));
// 1
R10i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R16i.y) >= intBitsToFloat(R10i.z));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = 0;
R0i.y = 0;
R0i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R12i.x = 0;
// 1
R4i.w = R6i.w;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R4i.w == 0);
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
R0i.w = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R12i.y = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 5
R0i.y = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 6
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
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R127i.y)));
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R127i.y)));
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
R14i.x = R15i.x;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (intBitsToFloat(R12i.y) > 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R12i.y));
// 1
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R127i.x)));
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
R15i.y = 0;
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
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R127i.x)));
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
R15i.z = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(max(intBitsToFloat(R8i.x), 0.0));
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[2].x))?1.0:0.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(uf_remappedVS[3].y)));
PV0iw = floatBitsToInt((intBitsToFloat(uf_remappedVS[2].x) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[2].x));
// 1
R126i.x = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(intBitsToFloat(R16i.y) * intBitsToFloat(PS0i));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].w)) + intBitsToFloat(uf_remappedVS[5].w));
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].z)) + intBitsToFloat(uf_remappedVS[5].z));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R10i.z));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].x)) + intBitsToFloat(uf_remappedVS[5].x));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].y)) + intBitsToFloat(uf_remappedVS[5].y));
R12i.x = floatBitsToInt(intBitsToFloat(R16i.y) * intBitsToFloat(PS1i));
// 3
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.x), intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(min(intBitsToFloat(backupReg0i), 0.0));
PV1iz = floatBitsToInt(fract(intBitsToFloat(PV0ix)));
R4i.w = ((intBitsToFloat(uf_remappedVS[6].x) == 1.0)?-1:0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.z));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV1iz)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS1i));
R127i.z = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS1i));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
R0i.x = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(PV1iy));
// 5
R12i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].x)) + 1.0);
PV1iw = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0ix));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(uf_remappedVS[4].w)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(uf_remappedVS[5].w)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R127i.y)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R127i.w)));
R126i.z = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R127i.z)));
R127i.w = ((intBitsToFloat(PV0ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 8
backupReg0i = R127i.w;
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].y) + intBitsToFloat(PV1iy));
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].x) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R126i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].z) + intBitsToFloat(PV1iw));
PS0i = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0iz)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), intBitsToFloat(PS0i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].x), intBitsToFloat(PS0i)));
// 10
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].x), intBitsToFloat(R126i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV1ix)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), intBitsToFloat(R126i.z)));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R127i.w));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(R127i.z));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].z), intBitsToFloat(R126i.z)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(R126i.y));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV1iw));
PV0iz = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV1ix));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PV1iy));
// 13
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(PV0iw)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iz)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(PV0ix)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[7].y)));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[7].z)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[7].w)));
// 1
R5i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(R16i.y));
// 2
predResult = (R4i.w != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(R5i.w)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].w), intBitsToFloat(PV0ix)));
// 2
R17i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x), intBitsToFloat(PV1iw)));
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].y), intBitsToFloat(PV1iw)));
R17i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].z), intBitsToFloat(PV1iw)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
tempResultf = max(0.0, abs(intBitsToFloat(uf_remappedVS[6].x)));
tempResultf = log2(tempResultf);
PS0i = floatBitsToInt(tempResultf);
// 1
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f317218));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[6].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PS1i)));
R127i.y = ((intBitsToFloat(uf_remappedVS[6].x) == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R12i.y));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R5i.w) + -(intBitsToFloat(PV1iz)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].w), intBitsToFloat(PV1ix)));
// 9
R17i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x), intBitsToFloat(PV0iw)));
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].y), intBitsToFloat(PV0iw)));
R17i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].z), intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = uf_remappedVS[9].x & 0x20000;
PV0iy = uf_remappedVS[9].x & 0x10000;
PV0iz = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(R8i.y));
R127i.w = uf_remappedVS[9].x & 0x40000;
PS0i = floatBitsToInt(intBitsToFloat(R8i.y) + intBitsToFloat(R8i.z));
// 1
R126i.x = floatBitsToInt(intBitsToFloat(PV0iz) * 0.5);
R127i.y = R8i.z;
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
PV1iz = R8i.y;
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 2.0);
R126i.w = floatBitsToInt(intBitsToFloat(PS0i) * 0.5);
PS1i = floatBitsToInt(float(PV0iy));
// 2
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(R8i.z));
R126i.y = floatBitsToInt(floor(intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(backupReg0i));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R125i.w = floatBitsToInt(floor(intBitsToFloat(R127i.y)));
PS1i = floatBitsToInt(float(R127i.w));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R124i.w = R8i.x;
R124i.w = floatBitsToInt(intBitsToFloat(R124i.w) * 2.0);
R125i.x = int(intBitsToFloat(PV1ix));
// 5
PV1ix = 0 - R125i.x;
R127i.y = floatBitsToInt(intBitsToFloat(R126i.x) + -(0.5));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
R125i.z = floatBitsToInt(intBitsToFloat(R127i.x) * 0.5);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iz)));
R127i.w = int(intBitsToFloat(PV0ix));
// 6
R125i.x = max(R125i.x, PV1ix);
R125i.y = floatBitsToInt(intBitsToFloat(R126i.w) + -(0.5));
R125i.y = floatBitsToInt(intBitsToFloat(R125i.y) * 2.0);
PV0iz = 0 - R127i.w;
R126i.w = floatBitsToInt((intBitsToFloat(R126i.y) > 0.0)?1.0:0.0);
R127i.z = int(intBitsToFloat(PV1iw));
// 7
backupReg0i = R126i.y;
PV1ix = 0 - R127i.z;
R126i.y = max(R127i.w, PV0iz);
R126i.z = floatBitsToInt((intBitsToFloat(R125i.w) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(backupReg0i))?1.0:0.0);
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[10].w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 8
backupReg0i = R126i.w;
R127i.x = max(R127i.z, PV1ix);
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(R125i.w))?1.0:0.0);
R126i.w = floatBitsToInt(floor(intBitsToFloat(R124i.w)));
R127i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(PV1iw)));
// 9
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(uf_remappedVS[11].x)));
R127i.y = floatBitsToInt(intBitsToFloat(R126i.z) + -(intBitsToFloat(PV0iz)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(uf_remappedVS[11].y)));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.z) + -(0.5));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) * 2.0);
PS1i = floatBitsToInt(float(backupReg0i));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 10
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[10].w)) + 1.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(R126i.w))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(R126i.w) > 0.0)?1.0:0.0);
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(R127i.z)));
PS0i = floatBitsToInt(float(R126i.y));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 11
backupReg0i = R125i.x;
backupReg1i = R127i.y;
R125i.x = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iy)));
R127i.y = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(uf_remappedVS[10].x));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(backupReg1i)));
R124i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[10].y) + intBitsToFloat(R126i.z));
PS1i = floatBitsToInt(exp2(intBitsToFloat(R124i.y)));
// 12
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R8i.x) + -(0.5));
R126i.y = floatBitsToInt(intBitsToFloat(R8i.y) + -(0.5));
R126i.z = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(uf_remappedVS[11].z)));
PS0i = floatBitsToInt(float(backupReg0i));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 13
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R126i.w)));
R124i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(R125i.x)));
R125i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[10].z) + intBitsToFloat(PV0iw));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R126i.w)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R127i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R127i.z)));
PV0iz = ((intBitsToFloat(uf_remappedVS[10].w) == 1.0)?-1:0);
PV0iw = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS1i));
R125i.y = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV1ix));
// 15
R126i.x = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(PV0iy));
R127i.y = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV0ix));
R127i.z = ((PV0iz == 0)?(PV0iw):(R16i.y));
R126i.w = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(R126i.w));
PS1i = floatBitsToInt(intBitsToFloat(R8i.z) + -(0.5));
// 16
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R124i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[12].x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R124i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(uf_remappedVS[12].y)));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(uf_remappedVS[12].z)));
// 17
backupReg0i = R125i.z;
PV1ix = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(PV0iz));
R125i.z = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R127i.z)));
// 18
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R127i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R127i.z)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R127i.x));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[6].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 19
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PS0i)));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e22f983) + 0.5);
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(R12i.y));
// 20
PV0ix = uf_remappedVS[13].y;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
R123i.y = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iz)));
// 21
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R123i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV1iw = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R0i.y = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(PV0ix));
// 22
R4i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R4i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R4i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(R126i.w));
R0i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R0i.z)));
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R4i.y) * intBitsToFloat(0x3e22f983));
R123i.y = ((R4i.w == 0)?(R4i.z):(R5i.w));
R125i.z = floatBitsToInt(intBitsToFloat(R0i.w) * intBitsToFloat(0x3e22f983));
PV0iw = uf_remappedVS[13].x;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
R125i.w = floatBitsToInt(sin((intBitsToFloat(R4i.x))/0.1591549367));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R123i.y)));
R124i.y = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R123i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R123i.y)));
R127i.z = floatBitsToInt(cos((intBitsToFloat(R4i.x))/0.1591549367));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R17i.y) + intBitsToFloat(PV1iw));
PV0iy = floatBitsToInt(intBitsToFloat(R17i.x) + intBitsToFloat(PV1ix));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(R0i.y)));
R126i.w = floatBitsToInt(intBitsToFloat(R17i.z) + intBitsToFloat(PV1iz));
R127i.y = floatBitsToInt(sin((intBitsToFloat(R125i.z))/0.1591549367));
// 3
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.y)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R127i.y)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(PV0iy)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(PV0ix)));
R124i.x = floatBitsToInt(cos((intBitsToFloat(R125i.z))/0.1591549367));
// 4
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(R126i.w)));
R9i.y = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV1iz));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R124i.x)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R124i.x)));
R124i.w = floatBitsToInt(sin((intBitsToFloat(R127i.x))/0.1591549367));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R125i.x)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R125i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R125i.y)));
R9i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R126i.w)));
R124i.z = floatBitsToInt(cos((intBitsToFloat(R127i.x))/0.1591549367));
// 6
backupReg0i = R127i.z;
PV0ix = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV1iz));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R124i.z)));
R127i.z = floatBitsToInt(-(intBitsToFloat(R124i.w)));
PV0iw = floatBitsToInt(-(intBitsToFloat(R126i.w)) + intBitsToFloat(PV1ix));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R124i.z)));
// 7
backupReg0i = R127i.w;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R12i.y)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R12i.y)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R124i.z)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R12i.y)));
R0i.y = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(backupReg0i));
// 8
backupReg0i = R125i.x;
backupReg1i = R126i.y;
backupReg2i = R127i.z;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R124i.y)));
R126i.y = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + intBitsToFloat(R9i.w));
R127i.z = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(R126i.x));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(backupReg1i));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(backupReg2i)) + intBitsToFloat(PV1ix));
// 9
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R125i.z)) + intBitsToFloat(R127i.w));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R124i.z)));
R125i.z = 0x3f800000;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R126i.w)) + intBitsToFloat(R127i.y));
R5i.w = floatBitsToInt(intBitsToFloat(R12i.y) * 0.0 + 1.0);
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R9i.y),intBitsToFloat(R0i.y),intBitsToFloat(R127i.z),intBitsToFloat(R125i.z))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R0i.w = tempi.x;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(PV1iy)) + intBitsToFloat(R126i.x));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R9i.y),intBitsToFloat(R0i.y),intBitsToFloat(R127i.z),intBitsToFloat(R125i.z))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R1i.w = tempi.x;
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R125i.w)) + intBitsToFloat(R127i.w));
// 12
backupReg0i = R126i.y;
R9i.x = 0x3f800000;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[14].x), intBitsToFloat(uf_remappedVS[15].y)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(backupReg0i)) + intBitsToFloat(R124i.x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[14].x), intBitsToFloat(uf_remappedVS[15].x)));
R3i.x = floatBitsToInt(intBitsToFloat(R12i.x) + 0.0);
// 13
R5i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),intBitsToFloat(R15i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R5i.w))));
PV1iy = R5i.x;
PV1iz = R5i.x;
PV1iw = R5i.x;
R124i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[15].w) * 1.0);
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R5i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R1i.z = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(uf_remappedVS[15].z)));
// 15
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedVS[15].z)));
PV1iy = uf_remappedVS[9].x & 0x80000;
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(R127i.w));
PV1iw = ((intBitsToFloat(R8i.x) > 0.5)?-1:0);
R0i.x = floatBitsToInt(-(intBitsToFloat(R10i.x)) + 1.0);
// 16
PV0ix = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R126i.y));
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iz = (PV1iy == 0x80000)?-1:0;
R123i.w = R10i.y;
R122i.x = ((PV1iw == 0)?(R10i.x):(R0i.x));
// 17
R125i.x = ((PV0iz == 0)?(R10i.y):(R123i.w));
R126i.y = ((PV0iz == 0)?(R10i.x):(R122i.x));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R123i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e22f983) + 0.5);
PS1i = uf_remappedVS[9].x & 0x100000;
// 18
R123i.x = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV0iz = ((intBitsToFloat(R8i.y) > 0.5)?-1:0);
PV0iw = floatBitsToInt(-(intBitsToFloat(R125i.x)) + 1.0);
R126i.z = (PS1i == 0x100000)?-1:0;
// 19
backupReg0i = R123i.x;
R123i.x = R126i.y;
R123i.y = ((PV0iz == 0)?(R125i.x):(PV0iw));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iw = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3e22f983));
// 20
PV0ix = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
R8i.y = ((R126i.z == 0)?(R126i.y):(R123i.x));
R3i.w = ((R126i.z == 0)?(R125i.x):(R123i.y));
R126i.y = floatBitsToInt(cos((intBitsToFloat(PV1iw))/0.1591549367));
// 21
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R9i.y),intBitsToFloat(R0i.y),intBitsToFloat(R127i.z),intBitsToFloat(R125i.z))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R0i.w = tempi.x;
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 22
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R126i.y)));
// 23
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(R124i.x)));
}
if( activeMaskStackC[3] == true ) {
// 0
R124i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[16].w)) + intBitsToFloat(uf_remappedVS[17].w));
PV0iy = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(0xbccccccd));
R125i.z = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(uf_remappedVS[17].w)));
R127i.w = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(uf_remappedVS[16].w)));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(R14i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R5i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[14].y), intBitsToFloat(PV0iy)));
// 2
backupReg0i = R124i.x;
R124i.x = ((intBitsToFloat(R127i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R3i.y = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[16].x)) + intBitsToFloat(uf_remappedVS[17].x));
R125i.w = ((intBitsToFloat(R125i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 3
R127i.x = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(uf_remappedVS[18].w)));
R126i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(PS0i));
PV1iz = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[17].w)) + intBitsToFloat(uf_remappedVS[18].w));
R127i.z = floatBitsToInt(-(intBitsToFloat(R124i.x)) + 1.0);
// 4
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[17].x)) + intBitsToFloat(uf_remappedVS[18].x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(PV1iz)));
R124i.w = ((intBitsToFloat(R127i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 5
R1i.x = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(uf_remappedVS[19].w)));
PV1iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[18].w)) + intBitsToFloat(uf_remappedVS[19].w));
R126i.z = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(PS0i));
R126i.w = floatBitsToInt(-(intBitsToFloat(R124i.w)) + 1.0);
// 6
R125i.x = ((intBitsToFloat(R1i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[16].x), intBitsToFloat(R127i.z)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R126i.y)) + intBitsToFloat(uf_remappedVS[16].x));
R127i.w = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(uf_remappedVS[20].w)));
R124i.x = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 7
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R127i.y)) + intBitsToFloat(PV0iy));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R126i.w)));
PV1iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[18].x)) + intBitsToFloat(uf_remappedVS[19].x));
R126i.w = ((intBitsToFloat(R127i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS1i = floatBitsToInt(-(intBitsToFloat(R125i.x)) + 1.0);
// 8
R124i.x = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(R124i.x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[19].w)) + intBitsToFloat(uf_remappedVS[20].w));
// 9
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R126i.z)) + intBitsToFloat(uf_remappedVS[17].x));
R125i.y = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(uf_remappedVS[21].w)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PV0iz)));
R126i.z = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 10
backupReg0i = R127i.y;
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[19].x)) + intBitsToFloat(uf_remappedVS[20].x));
R127i.y = ((intBitsToFloat(R125i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(backupReg0i)) + intBitsToFloat(R126i.x));
// 11
R126i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(R126i.z));
PV1iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[20].w)) + intBitsToFloat(uf_remappedVS[21].w));
PV1iz = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
// 12
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV1iz)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R124i.x)) + intBitsToFloat(uf_remappedVS[18].x));
R126i.w = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(uf_remappedVS[22].w)));
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 13
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R126i.y)) + intBitsToFloat(R124i.w));
PV1iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[20].x)) + intBitsToFloat(uf_remappedVS[21].x));
R124i.w = ((intBitsToFloat(R126i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 14
R127i.x = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(R127i.x));
PV0iz = floatBitsToInt(-(intBitsToFloat(R124i.w)) + 1.0);
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[21].w)) + intBitsToFloat(uf_remappedVS[22].w));
// 15
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R126i.x)) + intBitsToFloat(uf_remappedVS[19].x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(uf_remappedVS[23].w)));
R126i.z = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 16
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[21].x)) + intBitsToFloat(uf_remappedVS[22].x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(R125i.z)) + intBitsToFloat(R124i.x));
R125i.z = ((intBitsToFloat(PV1iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 17
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(R126i.z));
PV1iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[22].w)) + intBitsToFloat(uf_remappedVS[23].w));
PV1iz = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
// 18
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(PV1ix)) + intBitsToFloat(uf_remappedVS[21].x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R127i.x)) + intBitsToFloat(uf_remappedVS[20].x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(PV1iz)));
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 19
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R125i.x)) + intBitsToFloat(R127i.y));
PV1iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[22].x)) + intBitsToFloat(uf_remappedVS[23].x));
// 20
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R126i.y)) + intBitsToFloat(R123i.x));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(backupReg0i));
// 21
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PV0iw)) + intBitsToFloat(uf_remappedVS[22].x));
// 22
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(R127i.x));
// 23
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[23].x),intBitsToFloat(R125i.z)) + intBitsToFloat(R123i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R3i.y),intBitsToFloat(R1i.z),intBitsToFloat(R9i.x)),vec4(intBitsToFloat(uf_remappedVS[24].x),intBitsToFloat(uf_remappedVS[24].y),intBitsToFloat(uf_remappedVS[24].z),intBitsToFloat(uf_remappedVS[24].w))));
PV0iy = R127i.x;
PV0iz = R127i.x;
PV0iw = R127i.x;
// 1
R124i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R3i.y),intBitsToFloat(R1i.z),intBitsToFloat(R9i.x)),vec4(intBitsToFloat(uf_remappedVS[25].x),intBitsToFloat(uf_remappedVS[25].y),intBitsToFloat(uf_remappedVS[25].z),intBitsToFloat(uf_remappedVS[25].w))));
PV1iy = R124i.x;
PV1iz = R124i.x;
PV1iw = R124i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R3i.y),intBitsToFloat(R1i.z),intBitsToFloat(R9i.x)),vec4(intBitsToFloat(uf_remappedVS[26].x),intBitsToFloat(uf_remappedVS[26].y),intBitsToFloat(uf_remappedVS[26].z),intBitsToFloat(uf_remappedVS[26].w))));
PV0ix = tempi.x;
R126i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R3i.y),intBitsToFloat(R1i.z),intBitsToFloat(R9i.x)),vec4(intBitsToFloat(uf_remappedVS[27].x),intBitsToFloat(uf_remappedVS[27].y),intBitsToFloat(uf_remappedVS[27].z),intBitsToFloat(uf_remappedVS[27].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R127i.w = tempi.x;
// 4
R125i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[13].z) + intBitsToFloat(R127i.x));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),intBitsToFloat(R127i.w)),vec4(intBitsToFloat(uf_remappedVS[28].x),intBitsToFloat(uf_remappedVS[28].y),intBitsToFloat(uf_remappedVS[28].z),intBitsToFloat(uf_remappedVS[28].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),intBitsToFloat(R127i.w)),vec4(intBitsToFloat(uf_remappedVS[29].x),intBitsToFloat(uf_remappedVS[29].y),intBitsToFloat(uf_remappedVS[29].z),intBitsToFloat(uf_remappedVS[29].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 7
R124i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(PS0i));
// 8
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R3i.y),intBitsToFloat(R1i.z),intBitsToFloat(R9i.x)),vec4(intBitsToFloat(uf_remappedVS[30].x),intBitsToFloat(uf_remappedVS[30].y),intBitsToFloat(uf_remappedVS[30].z),intBitsToFloat(uf_remappedVS[30].w))));
PV0iy = R0i.x;
PV0iz = R0i.x;
PV0iw = R0i.x;
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R3i.y),intBitsToFloat(R1i.z),intBitsToFloat(R9i.x)),vec4(intBitsToFloat(uf_remappedVS[31].x),intBitsToFloat(uf_remappedVS[31].y),intBitsToFloat(uf_remappedVS[31].z),intBitsToFloat(uf_remappedVS[31].w))));
PV1ix = tempi.x;
R0i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R3i.y),intBitsToFloat(R1i.z),intBitsToFloat(R9i.x)),vec4(intBitsToFloat(uf_remappedVS[32].x),intBitsToFloat(uf_remappedVS[32].y),intBitsToFloat(uf_remappedVS[32].z),intBitsToFloat(uf_remappedVS[32].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R0i.w = tempi.x;
// 11
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R124i.x)));
PV1iw = PV0ix;
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) / 2.0);
// 12
R13i.x = floatBitsToInt(intBitsToFloat(R0i.x) * 0.5 + intBitsToFloat(PV1iw));
R13i.y = floatBitsToInt(intBitsToFloat(R0i.y) * -(0.5) + intBitsToFloat(PV1iw));
R13i.z = floatBitsToInt(intBitsToFloat(R0i.z) * 0.5 + intBitsToFloat(PV1iw));
R13i.w = floatBitsToInt(intBitsToFloat(R0i.w) * 1.0);
}
if( activeMaskStackC[3] == true ) {
// 0
R124i.x = uf_remappedVS[33].z;
R126i.y = uf_remappedVS[33].y;
R125i.z = uf_remappedVS[33].x;
// 1
PV1ix = uf_remappedVS[34].x;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(uf_remappedVS[35].x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(uf_remappedVS[35].y)));
// 2
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(uf_remappedVS[36].x)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(uf_remappedVS[36].y)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(uf_remappedVS[36].z)));
R14i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(uf_remappedVS[36].w)));
// 3
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(uf_remappedVS[37].x)));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[37].x)));
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(uf_remappedVS[37].x)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[35].z));
// 4
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R127i.y)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[35].w));
// 5
R12i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].x) * 1.0 + 0.0);
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R127i.w)));
// 6
R15i.y = R1i.y;
R15i.z = 0;
// 7
R17i.x = R11i.x;
R17i.y = R11i.y;
R17i.z = R11i.z;
R17i.w = R11i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.z));
// export
passParameterSem8 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.z));
}
