#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 6dcfd9f7de2c1092
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[45];
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
R0i.y = floatBitsToInt(-(intBitsToFloat(R5i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R8i.z = 0;
R17i.z = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R0i.y));
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
R15i.x = 0;
// 1
R0i.z = R17i.z;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R0i.z = R8i.z;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R0i.z == 0);
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
predResult = (intBitsToFloat(R0i.y) >= intBitsToFloat(R0i.z));
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
R15i.x = 0;
// 1
R8i.z = R17i.z;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R8i.z == 0);
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
R9i.y = R2i.x;
R8i.z = R3i.x;
R127i.w = R2i.y;
R127i.z = R3i.y;
// 1
R126i.x = R1i.z;
R127i.y = R2i.z;
R126i.z = R3i.z;
R12i.x = int(intBitsToFloat(R6i.w));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R9i.y),intBitsToFloat(R8i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R9i.y),intBitsToFloat(R8i.z),0.0)));
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
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R127i.y)));
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R127i.y)));
// 2
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R9i.x = 0;
// 1
R11i.x = R9i.x;
// 2
R10i.x = R9i.x;
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
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R127i.x)));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R127i.x)));
// 2
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R11i.y = 0;
R10i.y = 0;
// 1
R9i.y = 0;
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
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R127i.x)));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R127i.x)));
// 2
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R11i.z = 0;
R10i.z = 0;
// 1
R9i.z = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[2].x))?1.0:0.0);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(uf_remappedVS[3].y)));
PV0iz = floatBitsToInt((intBitsToFloat(uf_remappedVS[2].x) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt(max(intBitsToFloat(R7i.x), 0.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[2].x));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(PS0i));
R126i.y = floatBitsToInt(min(intBitsToFloat(PV0iw), 0.0));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].w)) + intBitsToFloat(uf_remappedVS[5].w));
R127i.w = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R0i.z));
// 2
backupReg0i = R127i.y;
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].x)) + intBitsToFloat(uf_remappedVS[5].x));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].y)) + intBitsToFloat(uf_remappedVS[5].y));
PV0iw = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV1ix));
R4i.w = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(PS1i));
// 3
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(PV0ix)));
PV1iy = floatBitsToInt(fract(intBitsToFloat(PV0iw)));
R12i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].x)) + 1.0);
R0i.w = ((intBitsToFloat(uf_remappedVS[6].x) == 1.0)?-1:0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 4
R126i.x = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS1i));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV1iy)));
R0i.x = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(R126i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0iw));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(uf_remappedVS[5].w)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(uf_remappedVS[4].w)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R127i.y)));
R127i.y = ((intBitsToFloat(PV0ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.z = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R126i.x)));
// 8
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].x) + intBitsToFloat(PV1ix));
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].y) + intBitsToFloat(PV1iw));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].x), intBitsToFloat(R127i.y)));
// 9
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].x), intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV0ix)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), intBitsToFloat(R127i.y)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), intBitsToFloat(PV0iy)));
// 10
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV1iy)));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(R126i.w));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R126i.x));
// 12
PV0iy = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(PV1iz));
PV0iw = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV1ix));
// 13
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PV0iw)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iy)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[7].y)));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[7].z)));
// 1
R13i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(R0i.y));
// 2
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
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y), intBitsToFloat(R13i.y)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].w), intBitsToFloat(PV0ix)));
// 2
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x), intBitsToFloat(PV1iw)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].y), intBitsToFloat(PV1iw)));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].z), intBitsToFloat(PV1iw)));
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
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y), intBitsToFloat(PS1i)));
R127i.y = ((intBitsToFloat(uf_remappedVS[6].x) == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R12i.z));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R13i.y) + -(intBitsToFloat(PV1iz)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].w), intBitsToFloat(PV1ix)));
// 9
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x), intBitsToFloat(PV0iw)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].y), intBitsToFloat(PV0iw)));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].z), intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = uf_remappedVS[9].y;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
PV0iy = uf_remappedVS[9].x;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
R126i.z = floatBitsToInt(intBitsToFloat(R6i.z) * 1.0);
R126i.w = 0x3f800000;
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[6].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y), intBitsToFloat(PS0i)));
PV1iy = (R12i.x == int(1))?-1:0;
PV1iz = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV0iy));
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R12i.z));
// 2
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(PV1iz)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1iw)));
R127i.z = ((PV1iy == 0)?(0xbf800000):(0xbf800000));
R127i.w = ((PV1iy == 0)?(0x3f800000):(0xbf800000));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
// 3
R127i.x = (R12i.x == 0x3)?-1:0;
R126i.y = floatBitsToInt(1.0);
PV1iz = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PV1iw = (R12i.x == 0x2)?-1:0;
R125i.x = PV0iy;
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(R127i.y));
R123i.y = ((PV1iw == 0)?(R127i.w):(0xbf800000));
R123i.z = ((PV1iw == 0)?(R127i.z):(0x3f800000));
R125i.w = R126i.z;
R124i.w = 0x3f800000;
// 5
R123i.x = ((R127i.x == 0)?(R123i.z):(0x3f800000));
R127i.y = R126i.y;
R123i.z = ((R127i.x == 0)?(R123i.y):(0x3f800000));
R123i.w = ((R0i.w == 0)?(PV0ix):(R13i.y));
R125i.z = floatBitsToInt(-(intBitsToFloat(R126i.x)));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R123i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R123i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R123i.w)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(uf_remappedVS[10].x)) + 0.0);
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(uf_remappedVS[10].x)) + 0.0);
// 7
R126i.x = R123i.w;
PV1iy = floatBitsToInt(intBitsToFloat(R8i.z) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(intBitsToFloat(R8i.y) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(PV0iz));
R126i.z = floatBitsToInt(-(intBitsToFloat(R122i.x)));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(PV1iw)));
R8i.y = floatBitsToInt(1.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(PV1iz)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(R126i.z)));
// 9
R127i.x = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV0ix));
R126i.y = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV0iw));
R127i.z = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(PV0iz));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),intBitsToFloat(R127i.y)) + intBitsToFloat(PS0i));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R126i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R0i.w = tempi.x;
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(R126i.x)) + intBitsToFloat(R122i.x));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R126i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R1i.w = tempi.x;
R127i.w = floatBitsToInt((intBitsToFloat(uf_remappedVS[11].y) > 0.0)?1.0:0.0);
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R126i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R2i.w = tempi.x;
R127i.z = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[11].y))?1.0:0.0);
// 13
R3i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R9i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R125i.w),intBitsToFloat(R125i.z),intBitsToFloat(R124i.w))));
PV1iy = R3i.x;
PV1iz = R3i.x;
PV1iw = R3i.x;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[11].y));
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(R126i.z)));
R126i.y = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(R127i.z)));
R127i.w = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(PS1i));
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R125i.w),intBitsToFloat(R125i.z),intBitsToFloat(R124i.w))));
PV1ix = tempi.x;
R3i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(R127i.y)) + intBitsToFloat(PV0ix));
// 16
R127i.x = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x),intBitsToFloat(R126i.x)) + intBitsToFloat(R122i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(uf_remappedVS[2].z)) + intBitsToFloat(R127i.w));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), intBitsToFloat(R126i.z)));
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R16i.z = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
// 18
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS1i)));
// 19
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(R127i.x)) + intBitsToFloat(PV0iw));
// 20
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R125i.w),intBitsToFloat(R125i.z),intBitsToFloat(R124i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R3i.z = tempi.x;
PV0iw = tempi.x;
}
if( activeMaskStackC[3] == true ) {
// 0
R9i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R8i.y)),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w))));
PV0iy = R9i.x;
PV0iz = R9i.x;
PV0iw = R9i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R8i.y)),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),intBitsToFloat(uf_remappedVS[13].w))));
PV1ix = tempi.x;
R9i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R8i.y)),vec4(intBitsToFloat(uf_remappedVS[14].x),intBitsToFloat(uf_remappedVS[14].y),intBitsToFloat(uf_remappedVS[14].z),intBitsToFloat(uf_remappedVS[14].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R9i.w = tempi.x;
// 3
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R8i.y)),vec4(intBitsToFloat(uf_remappedVS[15].x),intBitsToFloat(uf_remappedVS[15].y),intBitsToFloat(uf_remappedVS[15].z),intBitsToFloat(uf_remappedVS[15].w))));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
R124i.w = PV0ix;
R124i.w = floatBitsToInt(intBitsToFloat(R124i.w) / 2.0);
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R8i.y)),vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),intBitsToFloat(uf_remappedVS[16].w))));
PV0ix = tempi.x;
R126i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 5
R125i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R8i.y)),vec4(intBitsToFloat(uf_remappedVS[17].x),intBitsToFloat(uf_remappedVS[17].y),intBitsToFloat(uf_remappedVS[17].z),intBitsToFloat(uf_remappedVS[17].w))));
PV1iy = R125i.x;
PV1iz = R125i.x;
PV1iw = R125i.x;
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R8i.y)),vec4(intBitsToFloat(uf_remappedVS[18].x),intBitsToFloat(uf_remappedVS[18].y),intBitsToFloat(uf_remappedVS[18].z),intBitsToFloat(uf_remappedVS[18].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R125i.w = tempi.x;
// 7
R125i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].z) + intBitsToFloat(R125i.x));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),intBitsToFloat(R125i.w)),vec4(intBitsToFloat(uf_remappedVS[19].x),intBitsToFloat(uf_remappedVS[19].y),intBitsToFloat(uf_remappedVS[19].z),intBitsToFloat(uf_remappedVS[19].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R126i.z = tempi.x;
PV0iw = tempi.x;
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),intBitsToFloat(R125i.w)),vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 10
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS0i));
// 12
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(PV1ix)));
// 13
R10i.x = floatBitsToInt(intBitsToFloat(R9i.x) * 0.5 + intBitsToFloat(R124i.w));
R10i.y = floatBitsToInt(intBitsToFloat(R9i.y) * -(0.5) + intBitsToFloat(R124i.w));
R10i.z = floatBitsToInt(intBitsToFloat(R9i.z) * 0.5 + intBitsToFloat(R124i.w));
R10i.w = floatBitsToInt(intBitsToFloat(R9i.w) * 1.0);
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = uf_remappedVS[21].z;
R125i.y = uf_remappedVS[21].y;
R125i.z = uf_remappedVS[21].x;
// 1
R126i.x = floatBitsToInt(intBitsToFloat(R2i.z) + -(intBitsToFloat(uf_remappedVS[22].w)));
R126i.y = floatBitsToInt(intBitsToFloat(R2i.z) + -(intBitsToFloat(uf_remappedVS[23].w)));
PV1iz = ((intBitsToFloat(R7i.x) > 0.5)?-1:0);
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[23].w)) + intBitsToFloat(uf_remappedVS[22].w));
R126i.z = ((intBitsToFloat(R7i.y) > 0.5)?-1:0);
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[23].x)) + intBitsToFloat(uf_remappedVS[22].x));
R127i.y = ((intBitsToFloat(R126i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.z = ((intBitsToFloat(R126i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R3i.w = floatBitsToInt(((PV1iz == 0)?(intBitsToFloat(R6i.x)):(-(intBitsToFloat(R6i.x)))));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 3
backupReg0i = R126i.z;
PV1ix = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(PS0i));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[22].x)) + intBitsToFloat(uf_remappedVS[24].x));
PV1iw = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R3i.y = floatBitsToInt(((backupReg0i == 0)?(intBitsToFloat(R6i.y)):(-(intBitsToFloat(R6i.y)))));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(PV1iy)) + intBitsToFloat(uf_remappedVS[23].x));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[23].x), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(intBitsToFloat(R2i.z) + -(intBitsToFloat(uf_remappedVS[24].w)));
PS0i = ((intBitsToFloat(R7i.z) > 0.5)?-1:0);
// 5
R3i.x = floatBitsToInt(((PS0i == 0)?(intBitsToFloat(R6i.x)):(-(intBitsToFloat(R6i.x)))));
PV1iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[22].w)) + intBitsToFloat(uf_remappedVS[24].w));
R124i.z = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(PV0iz)) + intBitsToFloat(PV0iy));
R125i.x = ((intBitsToFloat(R7i.w) > 0.5)?-1:0);
// 6
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(uf_remappedVS[25].x)));
PV0iy = floatBitsToInt(-(intBitsToFloat(R124i.z)) + 1.0);
R125i.z = uf_remappedVS[26].x;
R125i.w = uf_remappedVS[26].y;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 7
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(uf_remappedVS[25].y)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[25].z)));
PV1iw = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS0i));
R2i.w = floatBitsToInt(((R125i.x == 0)?(intBitsToFloat(R6i.y)):(-(intBitsToFloat(R6i.y)))));
// 8
PV0ix = uf_remappedVS[26].z;
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PV1iw)) + intBitsToFloat(uf_remappedVS[22].x));
PV0iw = ((intBitsToFloat(R7i.y) > 0.5)?-1:0);
// 9
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(uf_remappedVS[27].x)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(uf_remappedVS[27].y)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R127i.x)) + intBitsToFloat(R124i.w));
R1i.w = floatBitsToInt(((PV0iw == 0)?(intBitsToFloat(R6i.x)):(-(intBitsToFloat(R6i.x)))));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedVS[27].z)));
// 10
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[24].x),intBitsToFloat(R124i.z)) + intBitsToFloat(R123i.z));
PV0iz = ((intBitsToFloat(R7i.z) > 0.5)?-1:0);
// 11
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[28].x)));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[28].x)));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(uf_remappedVS[28].x)));
R11i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(uf_remappedVS[25].w)));
R8i.y = floatBitsToInt(((PV0iz == 0)?(intBitsToFloat(R6i.y)):(-(intBitsToFloat(R6i.y)))));
// 12
PS0i = int(intBitsToFloat(uf_remappedVS[29].z));
// 13
R127i.x = floatBitsToInt(float(PS0i));
// 14
PV0iz = floatBitsToInt((0.0 >= abs(intBitsToFloat(R127i.x)))?1.0:0.0);
PV0iw = floatBitsToInt(-(abs(intBitsToFloat(R127i.x))) + 0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 15
R125i.y = ((intBitsToFloat(PV0iz) == 0.0)?(0):(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[29].z));
// 16
PV0ix = floatBitsToInt(abs(intBitsToFloat(R127i.x)) + intBitsToFloat(R125i.y));
PV0iz = floatBitsToInt(trunc(intBitsToFloat(PV1iw)));
R8i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[29].x), intBitsToFloat(PS1i)));
// 17
R123i.w = ((-(intBitsToFloat(R125i.y)) > 0.0)?(PV0ix):(R125i.y));
R1i.y = int(intBitsToFloat(PV0iz));
// 18
R123i.z = ((intBitsToFloat(R127i.x) == 0.0)?(0):(R123i.w));
// 19
R2i.y = int(intBitsToFloat(R123i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = uf_remappedVS[30].x & 0x100000;
PV0iy = uf_remappedVS[30].x & 0x80000;
PV0iz = uf_remappedVS[30].x & 0x200000;
R4i.w = uf_remappedVS[31].x;
PS0i = uf_remappedVS[30].x & 0x400000;
// 1
PV1ix = (PV0iy == 0x80000)?-1:0;
PV1iy = (PS0i == 0x400000)?-1:0;
PV1iz = (PV0iz == 0x200000)?-1:0;
PV1iw = (PV0ix == 0x100000)?-1:0;
R125i.w = uf_remappedVS[30].y & int(1);
// 2
backupReg0i = R3i.x;
R3i.x = ((PV1iw == 0)?(R6i.y):(R3i.y));
R3i.y = ((PV1ix == 0)?(R6i.x):(R3i.w));
R3i.z = ((PV1iy == 0)?(R6i.y):(R2i.w));
R2i.w = ((PV1iz == 0)?(R6i.x):(backupReg0i));
PS0i = uf_remappedVS[30].x & 0x800000;
// 3
PV1ix = (PS0i == 0x800000)?-1:0;
PV1iy = uf_remappedVS[30].x & 0x1000000;
R2i.z = (int(1) != R125i.w)?-1:0;
// 4
R4i.y = ((PV1ix == 0)?(R6i.x):(R1i.w));
PV0iw = (PV1iy == 0x1000000)?-1:0;
// 5
R6i.x = ((PV0iw == 0)?(R6i.y):(R8i.y));
}
if( activeMaskStackC[3] == true ) {
// 0
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[28].x), intBitsToFloat(R1i.x)));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[28].x), intBitsToFloat(R5i.y)));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[28].x), intBitsToFloat(R0i.z)));
R12i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(uf_remappedVS[27].w)));
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(uf_remappedVS[32].x)));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(uf_remappedVS[32].y)));
R125i.y = floatBitsToInt(intBitsToFloat(R125i.y) * 2.0);
R127i.z = floatBitsToInt(intBitsToFloat(R3i.y) + 0.5);
R124i.w = floatBitsToInt(intBitsToFloat(R3i.x) + -(0.5));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[29].w));
// 2
R123i.x = ((R2i.z == 0)?(0):(int(1)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[29].y), intBitsToFloat(PS1i)));
R125i.z = floatBitsToInt(float(R2i.y));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[33].w) + intBitsToFloat(uf_remappedVS[32].y));
R126i.y = (R123i.x == int(1))?-1:0;
R124i.z = (R123i.x == 0x2)?-1:0;
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[33].z) + intBitsToFloat(uf_remappedVS[32].x));
R125i.w = floatBitsToInt(float(R1i.y));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[34].x) + intBitsToFloat(uf_remappedVS[34].z));
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[34].y) + intBitsToFloat(uf_remappedVS[34].w));
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(-(intBitsToFloat(R125i.y)) + intBitsToFloat(PV1ix));
R125i.y = ((R124i.z == 0)?(R7i.x):(R7i.z));
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.y)),intBitsToFloat(uf_remappedVS[33].x)) + -(intBitsToFloat(PV0iz)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(uf_remappedVS[34].z)) + intBitsToFloat(PV0ix));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(uf_remappedVS[33].y)) + intBitsToFloat(PV0iw));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(uf_remappedVS[34].w)) + intBitsToFloat(PV0iy));
R122i.x = ((R124i.z == 0)?(R7i.y):(R7i.x));
// 6
backupReg0i = R123i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),intBitsToFloat(R125i.z)) + intBitsToFloat(R123i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)),intBitsToFloat(R125i.w)) + intBitsToFloat(R123i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(uf_remappedVS[32].z)) + intBitsToFloat(backupReg0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(uf_remappedVS[32].w)) + intBitsToFloat(R123i.w));
R125i.z = ((R126i.y == 0)?(R122i.x):(R7i.z));
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)),intBitsToFloat(R124i.w)) + -(intBitsToFloat(R123i.y)));
PV1iz = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
PV1iw = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
R127i.y = ((R126i.y == 0)?(R7i.x):(R7i.y));
// 8
R13i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.y)),intBitsToFloat(PV1iz)) + intBitsToFloat(R123i.x));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(PV1iw)) + intBitsToFloat(R123i.y));
R127i.z = ((R126i.y == 0)?(R7i.y):(R7i.z));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].y), intBitsToFloat(R125i.z)));
R124i.w = floatBitsToInt(intBitsToFloat(R124i.w) * 2.0);
PS0i = int(intBitsToFloat(uf_remappedVS[36].z));
// 9
backupReg0i = R126i.y;
R126i.x = floatBitsToInt(intBitsToFloat(R2i.w) + 0.5);
R126i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[37].z) + intBitsToFloat(uf_remappedVS[35].x));
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[37].w) + intBitsToFloat(uf_remappedVS[35].y));
R123i.w = ((backupReg0i == 0)?(R125i.y):(R7i.y));
R125i.z = floatBitsToInt(float(PS0i));
// 10
PV0ix = floatBitsToInt(-(abs(intBitsToFloat(R125i.z))) + 0.0);
PV0iy = floatBitsToInt(-(intBitsToFloat(R124i.w)) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt((0.0 >= abs(intBitsToFloat(R125i.z)))?1.0:0.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].x), intBitsToFloat(R123i.w)));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R125i.z));
// 11
R127i.x = floatBitsToInt(-(intBitsToFloat(PV0iw)) + intBitsToFloat(R126i.y));
PV1iy = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(uf_remappedVS[37].y)) + intBitsToFloat(PV0iy));
R124i.w = ((intBitsToFloat(PV0iz) == 0.0)?(0):(PV0ix));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[36].z));
// 12
PV0ix = floatBitsToInt(trunc(intBitsToFloat(PV1iy)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].x), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(abs(intBitsToFloat(R125i.z)) + intBitsToFloat(R124i.w));
R125i.w = floatBitsToInt(intBitsToFloat(R3i.z) + -(0.5));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[36].w));
// 13
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.y)),intBitsToFloat(uf_remappedVS[37].x)) + -(intBitsToFloat(R127i.x)));
R123i.y = ((-(intBitsToFloat(R124i.w)) > 0.0)?(PV0iz):(R124i.w));
R126i.z = ((R2i.z == 0)?(0):(0x2));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].y), intBitsToFloat(PS0i)));
PS1i = int(intBitsToFloat(PV0ix));
// 14
R123i.x = ((intBitsToFloat(R125i.z) == 0.0)?(0):(R123i.y));
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[38].x) + intBitsToFloat(uf_remappedVS[38].z));
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[38].y) + intBitsToFloat(uf_remappedVS[38].w));
R127i.w = (R126i.z == int(1))?-1:0;
PS0i = floatBitsToInt(float(PS1i));
// 15
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.w)),intBitsToFloat(PS0i)) + intBitsToFloat(R124i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].w),intBitsToFloat(R127i.z)) + intBitsToFloat(PV0iz));
R127i.z = (R126i.z == 0x2)?-1:0;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].z),intBitsToFloat(R127i.y)) + intBitsToFloat(PV0iy));
PS1i = int(intBitsToFloat(backupReg0i));
// 16
R125i.x = ((R127i.z == 0)?(R7i.x):(R7i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(uf_remappedVS[35].w)) + intBitsToFloat(R123i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(uf_remappedVS[35].z)) + intBitsToFloat(R123i.w));
R125i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.w)),intBitsToFloat(R125i.w)) + -(intBitsToFloat(R123i.x)));
PS0i = floatBitsToInt(float(PS1i));
// 17
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
R127i.y = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(PS0i)) + intBitsToFloat(backupReg0i));
R123i.w = ((R127i.z == 0)?(R7i.y):(R7i.x));
R122i.x = ((R127i.z == 0)?(R7i.z):(R7i.y));
// 18
R123i.x = ((R127i.w == 0)?(R125i.x):(R7i.y));
R3i.y = ((R127i.w == 0)?(R122i.x):(R7i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.z));
R124i.w = ((R127i.w == 0)?(R123i.w):(R7i.z));
R1i.y = ((R127i.w == 0)?(R7i.x):(R7i.y));
// 19
backupReg0i = R127i.y;
R7i.x = ((R127i.w == 0)?(R7i.y):(R7i.z));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].x), intBitsToFloat(R123i.x)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
R13i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.w)),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.z));
R13i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(backupReg0i)) + intBitsToFloat(R125i.w));
PS1i = int(intBitsToFloat(uf_remappedVS[40].z));
// 20
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[41].z) + intBitsToFloat(uf_remappedVS[39].x));
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[41].w) + intBitsToFloat(uf_remappedVS[39].y));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].y), intBitsToFloat(R124i.w)));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
R3i.z = floatBitsToInt(float(PS1i));
// 21
PV1ix = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(-(intBitsToFloat(PV0iw)) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(-(abs(intBitsToFloat(R3i.z))) + 0.0);
PV1iw = floatBitsToInt((0.0 >= abs(intBitsToFloat(R3i.z)))?1.0:0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R3i.z));
// 22
R3i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.y)),intBitsToFloat(uf_remappedVS[41].x)) + -(intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(uf_remappedVS[41].y)) + intBitsToFloat(PV1iy));
R124i.w = ((intBitsToFloat(PV1iw) == 0.0)?(0):(PV1iz));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[40].z));
// 23
PV1ix = floatBitsToInt(trunc(intBitsToFloat(PV0iy)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].x), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(abs(intBitsToFloat(R3i.z)) + intBitsToFloat(R124i.w));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[40].w));
// 24
R7i.y = ((-(intBitsToFloat(R124i.w)) > 0.0)?(PV1iz):(R124i.w));
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].y), intBitsToFloat(PS1i)));
R2i.w = int(intBitsToFloat(PV1ix));
}
if( activeMaskStackC[3] == true ) {
// 0
R123i.x = ((intBitsToFloat(R3i.z) == 0.0)?(0):(R7i.y));
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[42].y) + intBitsToFloat(uf_remappedVS[42].z));
PS0i = floatBitsToInt(float(R2i.w));
// 1
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.w)),intBitsToFloat(PS0i)) + intBitsToFloat(R7i.z));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[42].z),intBitsToFloat(R3i.y)) + intBitsToFloat(PV0iy));
PS1i = int(intBitsToFloat(R123i.x));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[43].y) + intBitsToFloat(uf_remappedVS[43].w));
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[43].x) + intBitsToFloat(uf_remappedVS[43].z));
PS0i = floatBitsToInt(float(PS1i));
// 3
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(PS0i)) + intBitsToFloat(R3i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[43].z),intBitsToFloat(R1i.y)) + intBitsToFloat(PV0iz));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(uf_remappedVS[42].x)) + intBitsToFloat(R124i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[43].w),intBitsToFloat(R7i.x)) + intBitsToFloat(PV0ix));
// 4
backupReg0i = R123i.y;
R123i.y = floatBitsToInt(-(intBitsToFloat(R123i.z)) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(uf_remappedVS[39].w)) + intBitsToFloat(R123i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(uf_remappedVS[39].z)) + intBitsToFloat(backupReg0i));
R15i.y = uf_remappedVS[44].x;
// 5
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R125i.y = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
R124i.w = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
// 6
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 7
R127i.z = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
// 8
R127i.y = floatBitsToInt(sin((intBitsToFloat(R127i.z))/0.1591549367));
// 9
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R127i.y)));
PS1i = floatBitsToInt(cos((intBitsToFloat(R127i.z))/0.1591549367));
// 10
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(PS1i)) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(PS1i)));
// 11
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.x)),intBitsToFloat(R127i.y)) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(R126i.x) + -(0.5));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(R127i.z) + 0.5);
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.w)),intBitsToFloat(PV1iw)) + -(intBitsToFloat(R126i.y)));
// 13
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(PV0ix)) + intBitsToFloat(R127i.x));
// 14
R14i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.z)),intBitsToFloat(R124i.w)) + intBitsToFloat(R123i.y));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R125i.y)) + intBitsToFloat(R126i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
R15i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].x) * 1.0 + 0.0);
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
// export
// skipped export to semanticId 255
// export
passParameterSem8 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.z));
// export
passParameterSem9 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.z));
}
