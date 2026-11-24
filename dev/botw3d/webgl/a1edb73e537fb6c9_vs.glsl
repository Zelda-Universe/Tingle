#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader a1edb73e537fb6c9
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[41];
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
out vec4 passParameterSem3;
out vec4 passParameterSem5;
out vec4 passParameterSem11;
out vec4 passParameterSem14;
out vec4 passParameterSem15;
out vec4 passParameterSem16;
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
R11i.y = floatBitsToInt(-(intBitsToFloat(R5i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R0i.w = 0;
R5i.w = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R11i.y));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R12i.x = 0;
R12i.y = 0;
R12i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R18i.x = 0;
// 1
R7i.w = R5i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R7i.w = R0i.w;
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
PS0i = int(intBitsToFloat(R4i.w));
// 1
R0i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R11i.y) >= intBitsToFloat(R0i.z));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R12i.x = 0;
R12i.y = 0;
R12i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R18i.x = 0;
// 1
R0i.w = R5i.w;
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
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R127i.y)));
R17i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R127i.y)));
// 2
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R13i.x = 0;
// 1
R12i.x = R13i.x;
// 2
R17i.x = R13i.x;
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
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R127i.x)));
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R127i.x)));
// 2
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R12i.y = 0;
R17i.y = 0;
// 1
R13i.y = 0;
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
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R127i.x)));
R17i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R127i.x)));
// 2
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R12i.z = 0;
R17i.z = 0;
// 1
R13i.z = 0;
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
PV1ix = floatBitsToInt(intBitsToFloat(R11i.y) * intBitsToFloat(PS0i));
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
R4i.w = floatBitsToInt(intBitsToFloat(R11i.y) * intBitsToFloat(PS1i));
// 3
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(PV0ix)));
PV1iy = floatBitsToInt(fract(intBitsToFloat(PV0iw)));
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].w)) + intBitsToFloat(uf_remappedVS[6].w));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 4
R126i.x = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS1i));
R125i.y = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS1i));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].x)) + intBitsToFloat(uf_remappedVS[6].x));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV1iy)));
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].y)) + intBitsToFloat(uf_remappedVS[6].y));
// 5
R0i.x = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(R126i.y));
PV1iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].w)) + intBitsToFloat(uf_remappedVS[7].w));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0iw));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.w));
// 6
backupReg0i = R127i.y;
PV0ix = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(uf_remappedVS[4].w)));
R127i.y = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS1i));
R125i.z = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(uf_remappedVS[5].w)));
R126i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(PS1i));
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 7
backupReg0i = R125i.y;
R127i.x = ((intBitsToFloat(R125i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R126i.x)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(backupReg0i)));
R0i.w = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(uf_remappedVS[6].w)));
R126i.y = ((intBitsToFloat(PV0ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 8
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].y)) + intBitsToFloat(uf_remappedVS[7].y));
R127i.y = ((intBitsToFloat(R0i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].x)) + intBitsToFloat(uf_remappedVS[7].x));
R125i.w = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(backupReg0i)));
// 9
backupReg0i = R125i.y;
PV1ix = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(uf_remappedVS[7].w)));
R125i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].x) + intBitsToFloat(R126i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R126i.w)));
R126i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].y) + intBitsToFloat(backupReg0i));
R126i.z = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(R127i.w));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(R127i.w));
R124i.y = ((intBitsToFloat(PV1ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R125i.w)));
R126i.x = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
// 11
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].x) + intBitsToFloat(R124i.w));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iz)));
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].y) + intBitsToFloat(R127i.z));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R126i.z)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV0ix)));
// 12
PV0ix = floatBitsToInt(-(intBitsToFloat(R124i.y)) + 1.0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].x), intBitsToFloat(R126i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R127i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R127i.w)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), intBitsToFloat(R126i.x)));
// 13
R126i.x = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV0ix)));
R126i.z = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].x) + intBitsToFloat(R124i.w));
PS1i = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].y) + intBitsToFloat(R125i.w));
// 14
backupReg0i = R126i.y;
backupReg1i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(PV1iy)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(PV1iy)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(backupReg0i)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), intBitsToFloat(backupReg0i)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].x), intBitsToFloat(R124i.y)));
// 15
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R126i.z));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].y), intBitsToFloat(R124i.y)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(R126i.x));
R8i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].x)) + 1.0);
// 16
PV0ix = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV1iw));
PV0iz = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV1iy));
R5i.w = ((intBitsToFloat(uf_remappedVS[8].x) == 1.0)?-1:0);
// 17
PV1iy = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(PV0iz));
PV1iw = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV0ix));
// 18
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PV1iw)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1iy)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[9].y)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[9].z)));
// 1
R15i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(R11i.y));
// 2
predResult = (R5i.w != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.y), intBitsToFloat(R15i.y)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].w), intBitsToFloat(PV0ix)));
// 2
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].x), intBitsToFloat(PV1iw)));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].y), intBitsToFloat(PV1iw)));
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].z), intBitsToFloat(PV1iw)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
tempResultf = max(0.0, abs(intBitsToFloat(uf_remappedVS[8].x)));
tempResultf = log2(tempResultf);
PS0i = floatBitsToInt(tempResultf);
// 1
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f317218));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[8].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.y), intBitsToFloat(PS1i)));
R127i.y = ((intBitsToFloat(uf_remappedVS[8].x) == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R8i.z));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R15i.y) + -(intBitsToFloat(PV1iz)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].w), intBitsToFloat(PV1ix)));
// 9
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].x), intBitsToFloat(PV0iw)));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].y), intBitsToFloat(PV0iw)));
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].z), intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = uf_remappedVS[11].x;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
R10i.y = 0x3f800000;
PV0iz = uf_remappedVS[11].y;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
R125i.w = 0x3f800000;
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[8].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
R9i.x = floatBitsToInt(1.0);
R9i.y = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.y), intBitsToFloat(PS0i)));
R0i.w = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV0ix));
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R8i.z));
// 2
PV0ix = floatBitsToInt(1.0);
PV0iy = (R10i.x == int(1))?-1:0;
R127i.z = (R10i.x == 0x3)?-1:0;
R127i.w = (R10i.x == 0x2)?-1:0;
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iz)));
// 3
R123i.x = ((PV0iy == 0)?(0xbf800000):(0xbf800000));
PV1iy = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R123i.z = ((PV0iy == 0)?(0x3f800000):(0xbf800000));
R124i.w = PV0ix;
R0i.y = 0;
// 4
backupReg0i = R123i.x;
R123i.x = ((R127i.w == 0)?(R123i.z):(0xbf800000));
R123i.y = ((R127i.w == 0)?(backupReg0i):(0x3f800000));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(R127i.x));
R127i.w = floatBitsToInt((intBitsToFloat(uf_remappedVS[12].y) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[12].y));
// 5
backupReg0i = R123i.x;
R123i.x = ((R127i.z == 0)?(R123i.y):(0x3f800000));
R123i.y = ((R127i.z == 0)?(backupReg0i):(0x3f800000));
R127i.z = floatBitsToInt(intBitsToFloat(R11i.y) * intBitsToFloat(PS0i));
R123i.w = ((R5i.w == 0)?(PV0iz):(R15i.y));
R126i.w = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[12].y))?1.0:0.0);
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R123i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R123i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R123i.w)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(uf_remappedVS[13].x)) + 0.0);
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(uf_remappedVS[13].x)) + 0.0);
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R14i.z) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(intBitsToFloat(R14i.y) + intBitsToFloat(PV0ix));
R124i.z = R123i.w;
PV1iw = floatBitsToInt(intBitsToFloat(R14i.x) + intBitsToFloat(PV0iy));
R125i.z = floatBitsToInt(-(intBitsToFloat(R122i.x)));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(uf_remappedVS[2].z)) + intBitsToFloat(R127i.z));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(PV1iy)));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(R126i.w)));
// 9
backupReg0i = R127i.z;
R127i.x = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV0iz));
R127i.y = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV0iw));
R126i.z = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
R126i.y = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
// 10
backupReg0i = R127i.z;
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R125i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R127i.z = tempi.x;
PV0iw = tempi.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1iw)));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R125i.w))));
PV1ix = tempi.x;
R125i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R3i.w = PV0ix;
// 12
R1i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R125i.w))));
PV0iy = R1i.x;
PV0iz = R1i.x;
PV0iw = R1i.x;
R3i.x = PV1ix;
// 13
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(R126i.y)) + intBitsToFloat(R126i.x));
PV1iy = uf_remappedVS[14].x & 0x80000;
PV1iz = ((intBitsToFloat(R7i.x) > 0.5)?-1:0);
R5i.w = R1i.x;
R6i.w = R127i.z;
// 14
R126i.x = uf_remappedVS[14].x & 0x100000;
R123i.y = floatBitsToInt(((PV1iz == 0)?(intBitsToFloat(R6i.x)):(-(intBitsToFloat(R6i.x)))));
PV0iz = (PV1iy == 0x80000)?-1:0;
R7i.w = R125i.y;
R125i.y = ((intBitsToFloat(R7i.y) > 0.5)?-1:0);
// 15
R16i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.z),intBitsToFloat(R124i.w),intBitsToFloat(R125i.z),0.0)));
PV1iy = R16i.x;
PV1iz = R16i.x;
PV1iw = R16i.x;
R2i.x = ((PV0iz == 0)?(R6i.x):(R123i.y));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R17i.x),intBitsToFloat(R17i.y),intBitsToFloat(R17i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.z),intBitsToFloat(R124i.w),intBitsToFloat(R125i.z),0.0)));
PV0ix = tempi.x;
R16i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.w = (R126i.x == 0x100000)?-1:0;
// 17
R10i.x = R4i.w;
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedVS[15].x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z), intBitsToFloat(R125i.z)));
R9i.w = 0;
R122i.x = floatBitsToInt(((R125i.y == 0)?(intBitsToFloat(R6i.y)):(-(intBitsToFloat(R6i.y)))));
// 18
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * 0.25 + 0.5);
R123i.x = clampFI32(R123i.x);
R1i.z = ((R125i.w == 0)?(R6i.y):(R122i.x));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y),intBitsToFloat(R124i.w)) + intBitsToFloat(PV1iz));
// 19
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.x),intBitsToFloat(R124i.z)) + intBitsToFloat(R122i.x));
PV1iw = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
// 20
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + 8.5);
// 21
R0i.x = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3daaaaab));
}
if( activeMaskStackC[3] == true ) {
R15i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R3i.x;
R3i.x = floatBitsToInt(intBitsToFloat(R1i.x) + -(intBitsToFloat(uf_remappedVS[16].x)));
R1i.y = floatBitsToInt(intBitsToFloat(R3i.w) + -(intBitsToFloat(uf_remappedVS[16].y)));
R3i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(uf_remappedVS[16].z)));
// 1
tempi.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R3i.x)),-(intBitsToFloat(R1i.y)),-(intBitsToFloat(R3i.z)),intBitsToFloat(0x80000000)),vec4(-(intBitsToFloat(R3i.x)),-(intBitsToFloat(R1i.y)),-(intBitsToFloat(R3i.z)),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R124i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[17].y) + intBitsToFloat(uf_remappedVS[17].z));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R1i.y),intBitsToFloat(R3i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R3i.x),intBitsToFloat(R1i.y),intBitsToFloat(R3i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 3
R1i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.y)), intBitsToFloat(PS0i)));
R0i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.x)), intBitsToFloat(PS0i)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z),intBitsToFloat(uf_remappedVS[17].z)) + intBitsToFloat(R124i.z));
R1i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.z)), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 4
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(uf_remappedVS[18].x)));
R125i.y = floatBitsToInt(intBitsToFloat(R125i.y) * 2.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y),intBitsToFloat(uf_remappedVS[17].x)) + intBitsToFloat(R123i.z));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(uf_remappedVS[18].y)));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) * 2.0);
R0i.x = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 5
R123i.x = floatBitsToInt(-(intBitsToFloat(R123i.z)) * intBitsToFloat(0x3e22f983) + 0.5);
R2i.z = uf_remappedVS[19].y;
R2i.w = uf_remappedVS[19].x;
PS1i = int(intBitsToFloat(uf_remappedVS[20].z));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[21].z) + intBitsToFloat(uf_remappedVS[18].x));
R126i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[21].w) + intBitsToFloat(uf_remappedVS[18].y));
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
R127i.y = floatBitsToInt(float(PS1i));
// 7
PV1ix = floatBitsToInt(-(abs(intBitsToFloat(R127i.y))) + 0.0);
R124i.y = floatBitsToInt(-(intBitsToFloat(R125i.y)) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt((0.0 >= abs(intBitsToFloat(R127i.y)))?1.0:0.0);
R123i.w = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 8
backupReg0i = R126i.y;
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
R126i.y = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R125i.z = floatBitsToInt(-(intBitsToFloat(R125i.w)) + intBitsToFloat(backupReg0i));
R125i.w = ((intBitsToFloat(PV1iz) == 0.0)?(0):(PV1ix));
R125i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[20].z));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[22].x) + intBitsToFloat(uf_remappedVS[22].z));
PV1iy = floatBitsToInt(abs(intBitsToFloat(R127i.y)) + intBitsToFloat(R125i.w));
R124i.z = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[22].y) + intBitsToFloat(uf_remappedVS[22].w));
R126i.x = floatBitsToInt(sin((intBitsToFloat(R126i.y))/0.1591549367));
// 10
backupReg0i = R126i.y;
R123i.x = ((-(intBitsToFloat(R125i.w)) > 0.0)?(PV1iy):(R125i.w));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R126i.x)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(uf_remappedVS[22].z)) + intBitsToFloat(PV1ix));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(uf_remappedVS[22].w)) + intBitsToFloat(PV1iw));
R127i.z = floatBitsToInt(cos((intBitsToFloat(backupReg0i))/0.1591549367));
// 11
backupReg0i = R127i.y;
backupReg1i = R127i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[20].x), intBitsToFloat(R125i.y)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y),intBitsToFloat(uf_remappedVS[21].y)) + intBitsToFloat(R125i.z));
R123i.z = ((intBitsToFloat(backupReg0i) == 0.0)?(0):(R123i.x));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(backupReg1i)));
R127i.w = int(intBitsToFloat(R124i.z));
// 12
backupReg0i = R126i.x;
backupReg1i = R126i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R11i.y)),intBitsToFloat(uf_remappedVS[21].x)) + -(intBitsToFloat(R124i.y)));
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.z)),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV1iw));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(R127i.z)) + intBitsToFloat(backupReg1i));
R4i.w = uf_remappedVS[19].z;
R124i.w = int(intBitsToFloat(R123i.z));
// 13
backupReg0i = R126i.z;
R125i.x = floatBitsToInt(intBitsToFloat(R126i.y) + 0.5);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y),intBitsToFloat(uf_remappedVS[18].w)) + intBitsToFloat(R125i.w));
R126i.z = floatBitsToInt(intBitsToFloat(R127i.z) + -(0.5));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y),intBitsToFloat(uf_remappedVS[18].z)) + intBitsToFloat(backupReg0i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[20].w));
// 14
backupReg0i = R124i.w;
R124i.x = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
R125i.z = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[20].y), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(float(backupReg0i));
// 15
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PS0i)) + intBitsToFloat(R126i.x));
PS1i = floatBitsToInt(float(R127i.w));
// 16
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.w)),intBitsToFloat(PS1i)) + intBitsToFloat(R127i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R125i.x)) + intBitsToFloat(R123i.z));
// 17
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.w)),intBitsToFloat(R126i.z)) + -(intBitsToFloat(R123i.x)));
R14i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.y)),intBitsToFloat(R124i.x)) + intBitsToFloat(R123i.y));
// 18
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R125i.z)) + intBitsToFloat(R123i.x));
R14i.z = 0;
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].z), intBitsToFloat(R1i.w)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].z), intBitsToFloat(R1i.x)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].z), intBitsToFloat(R0i.y)));
R127i.w = floatBitsToInt(intBitsToFloat(R4i.x) + -(intBitsToFloat(uf_remappedVS[23].w)));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R3i.x) + intBitsToFloat(R125i.z));
PV1iy = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(R125i.y));
PV1iz = floatBitsToInt(intBitsToFloat(R3i.z) + intBitsToFloat(R127i.x));
R124i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[23].w)) + intBitsToFloat(uf_remappedVS[24].w));
R125i.x = floatBitsToInt(intBitsToFloat(R4i.x) + -(intBitsToFloat(uf_remappedVS[24].w)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(PV1ix),intBitsToFloat(PV1iy),intBitsToFloat(PV1iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV1ix),intBitsToFloat(PV1iy),intBitsToFloat(PV1iz),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[23].x)) + intBitsToFloat(uf_remappedVS[24].x));
// 3
R3i.x = floatBitsToInt(intBitsToFloat(R4i.x) + -(intBitsToFloat(uf_remappedVS[25].w)));
R1i.y = ((intBitsToFloat(R127i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[24].w)) + intBitsToFloat(uf_remappedVS[25].w));
R126i.w = ((intBitsToFloat(R125i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 4
backupReg0i = R0i.x;
backupReg1i = R124i.w;
R0i.x = ((intBitsToFloat(R3i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R0i.y = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
PV0iz = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(backupReg0i));
R124i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[24].x)) + intBitsToFloat(uf_remappedVS[25].x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(backupReg1i));
// 5
backupReg0i = R127i.z;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PV0iz)));
R127i.z = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(PV0iz)));
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R0i.w)));
R127i.y = PV1ix;
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R9i.y)));
R125i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[25].w)) + intBitsToFloat(uf_remappedVS[26].w));
R124i.y = floatBitsToInt(intBitsToFloat(R4i.x) + -(intBitsToFloat(uf_remappedVS[26].w)));
// 7
backupReg0i = R127i.z;
R124i.x = PV0ix;
R9i.y = floatBitsToInt(-(intBitsToFloat(R1i.y)) + 1.0);
R127i.z = floatBitsToInt(-(intBitsToFloat(PV0iz)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(backupReg0i)) + intBitsToFloat(uf_remappedVS[23].x));
R126i.x = floatBitsToInt(intBitsToFloat(R124i.w) * intBitsToFloat(R126i.y));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R10i.y))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R6i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[25].x)) + intBitsToFloat(uf_remappedVS[26].x));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R17i.x),intBitsToFloat(R17i.y),intBitsToFloat(R17i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R10i.y))));
PV1ix = tempi.x;
R126i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R4i.x = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV0ix));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),intBitsToFloat(R12i.z),intBitsToFloat(R7i.w)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R10i.y))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.w = floatBitsToInt(1.0 / intBitsToFloat(R125i.w));
// 11
backupReg0i = R127i.x;
R127i.x = ((intBitsToFloat(R124i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R10i.y = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(R126i.y));
R6i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(-(intBitsToFloat(R0i.x)) + 1.0);
R3i.w = floatBitsToInt(intBitsToFloat(R3i.w) + intBitsToFloat(R125i.y));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[23].x), intBitsToFloat(R9i.y)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R0i.y)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R126i.x)) + intBitsToFloat(uf_remappedVS[24].x));
PS0i = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
// 13
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(intBitsToFloat(R6i.y) * intBitsToFloat(R125i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV0iz)) + intBitsToFloat(PV0ix));
// 14
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(PV1iz)) + intBitsToFloat(uf_remappedVS[25].x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R126i.y)) + intBitsToFloat(R123i.w));
// 15
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.z));
// 16
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[26].x),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.y));
}
if( activeMaskStackC[3] == true ) {
// 0
R12i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R10i.y),intBitsToFloat(R6i.z),intBitsToFloat(R9i.x)),vec4(intBitsToFloat(uf_remappedVS[27].x),intBitsToFloat(uf_remappedVS[27].y),intBitsToFloat(uf_remappedVS[27].z),intBitsToFloat(uf_remappedVS[27].w))));
PV0iy = R12i.x;
PV0iz = R12i.x;
PV0iw = R12i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R10i.y),intBitsToFloat(R6i.z),intBitsToFloat(R9i.x)),vec4(intBitsToFloat(uf_remappedVS[28].x),intBitsToFloat(uf_remappedVS[28].y),intBitsToFloat(uf_remappedVS[28].z),intBitsToFloat(uf_remappedVS[28].w))));
PV1ix = tempi.x;
R12i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R10i.y),intBitsToFloat(R6i.z),intBitsToFloat(R9i.x)),vec4(intBitsToFloat(uf_remappedVS[29].x),intBitsToFloat(uf_remappedVS[29].y),intBitsToFloat(uf_remappedVS[29].z),intBitsToFloat(uf_remappedVS[29].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R12i.z = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R10i.y),intBitsToFloat(R6i.z),intBitsToFloat(R9i.x)),vec4(intBitsToFloat(uf_remappedVS[30].x),intBitsToFloat(uf_remappedVS[30].y),intBitsToFloat(uf_remappedVS[30].z),intBitsToFloat(uf_remappedVS[30].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R12i.w = tempi.x;
// 4
R126i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[16].x) + -(intBitsToFloat(R4i.x)));
R126i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[16].y) + -(intBitsToFloat(R10i.y)));
PV0iz = PV1ix;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
R126i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[16].z) + -(intBitsToFloat(R6i.z)));
// 5
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[31].y) + 1.0);
R124i.y = floatBitsToInt(intBitsToFloat(R12i.z) * 0.0 + intBitsToFloat(PV0iz));
R13i.z = floatBitsToInt(intBitsToFloat(R12i.z) * 0.5 + intBitsToFloat(PV0iz));
R13i.w = floatBitsToInt(intBitsToFloat(R12i.z) * 0.0 + intBitsToFloat(R12i.w));
PS1i = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(R126i.w));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R13i.w));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R127i.x) * 1.5);
PV1ix = clampFI32(PV1ix);
R125i.y = floatBitsToInt(min(intBitsToFloat(uf_remappedVS[16].y), intBitsToFloat(uf_remappedVS[32].z)));
PV1iw = floatBitsToInt(intBitsToFloat(R13i.z) * intBitsToFloat(PS0i));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS1i)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(uf_remappedVS[1].w)) + -(intBitsToFloat(uf_remappedVS[1].y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PS1i)));
R126i.y = floatBitsToInt(intBitsToFloat(PV1ix) * 15.0);
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iw),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[31].x),intBitsToFloat(uf_remappedVS[31].y),intBitsToFloat(uf_remappedVS[31].z),0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.z));
// 10
backupReg0i = R126i.y;
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS1i));
R126i.y = floatBitsToInt(-(intBitsToFloat(R3i.w)) + intBitsToFloat(R125i.y));
R127i.z = floatBitsToInt(intBitsToFloat(PV1ix) + 0.5);
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(uf_remappedVS[33].x)) + -(intBitsToFloat(uf_remappedVS[33].y)));
R123i.x = clampFI32(R123i.x);
PV1iy = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R123i.z = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(uf_remappedVS[34].x)) + -(intBitsToFloat(uf_remappedVS[34].y)));
R123i.w = clampFI32(R123i.w);
R13i.y = floatBitsToInt(intBitsToFloat(R12i.y) * -(0.5) + intBitsToFloat(R124i.y));
// 12
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(0xbe593484));
R125i.y = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
R123i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[31].y) * 1.0 + intBitsToFloat(R126i.x));
R127i.w = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1iy)));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f22f983));
PV1iy = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(R126i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].y),intBitsToFloat(R126i.y)) + intBitsToFloat(uf_remappedVS[32].x));
R123i.z = clampFI32(R123i.z);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R123i.x)) + intBitsToFloat(0x3fc90da4));
R13i.x = floatBitsToInt(intBitsToFloat(R12i.x) * 0.5 + intBitsToFloat(R124i.y));
// 14
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),-(intBitsToFloat(R123i.w))) + 1.0);
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(uf_remappedVS[35].w)));
PV0iz = floatBitsToInt(max(intBitsToFloat(PV1iy), intBitsToFloat(0x3e4ccccd)));
tempResultf = max(0.0, intBitsToFloat(R125i.y));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 15
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].x), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].y), intBitsToFloat(PS0i)));
R3i.w = floatBitsToInt(min(intBitsToFloat(PV0iz), 1.0));
tempResultf = max(0.0, intBitsToFloat(R127i.w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 16
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[34].w), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iz)));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 17
R4i.y = floatBitsToInt(intBitsToFloat(PS0i) + 0.5);
R6i.z = floatBitsToInt(exp2(intBitsToFloat(R126i.x)));
}
if( activeMaskStackC[3] == true ) {
R4i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y))).xyz);
}
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(uf_remappedVS[37].x)));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[36].z)),intBitsToFloat(R6i.z)) + intBitsToFloat(uf_remappedVS[36].z));
R123i.y = clampFI32(R123i.y);
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(uf_remappedVS[37].y)));
// 1
R17i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R3i.w)));
R125i.y = floatBitsToInt(intBitsToFloat(R123i.y) + intBitsToFloat(0x80000000));
R125i.y = clampFI32(R125i.y);
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(uf_remappedVS[37].z)));
R19i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[37].w)));
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R3i.w)));
// 2
R17i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R3i.w)));
R17i.w = R125i.y;
PS0i = floatBitsToInt(exp2(intBitsToFloat(R10i.y)));
// 3
R9i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)),intBitsToFloat(uf_remappedVS[38].w)) + intBitsToFloat(uf_remappedVS[38].w));
R9i.z = R125i.y;
}
if( activeMaskStackC[3] == true ) {
// 0
R19i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[39].x)));
R19i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[39].x)));
R19i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[39].x)));
R18i.y = uf_remappedVS[40].x;
// 1
R10i.y = uf_remappedVS[40].y;
R10i.z = uf_remappedVS[40].z;
}
if( activeMaskStackC[3] == true ) {
// 0
R18i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].x) * 1.0 + 0.0);
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem5 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.z));
// export
passParameterSem8 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.z));
}
