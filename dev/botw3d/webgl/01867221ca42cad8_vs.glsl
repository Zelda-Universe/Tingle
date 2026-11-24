#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 01867221ca42cad8
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[56];
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
out vec4 passParameterSem1;
out vec4 passParameterSem3;
out vec4 passParameterSem8;
out vec4 passParameterSem10;
out vec4 passParameterSem11;
out vec4 passParameterSem13;
out vec4 passParameterSem14;
out vec4 passParameterSem15;
out vec4 passParameterSem16;
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
ivec4 R20i = ivec4(0);
ivec4 R21i = ivec4(0);
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
attrDecoder = attrDataSem0;
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem1;
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
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
attrDecoder = attrDataSem2;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R18i.y = floatBitsToInt(-(intBitsToFloat(R5i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R2i.w = 0;
R3i.w = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R18i.y));
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
R17i.x = 0;
// 1
R5i.w = R3i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R5i.w = R2i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R5i.w == 0);
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
R18i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R18i.y) >= intBitsToFloat(R18i.z));
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
R17i.x = 0;
// 1
R2i.w = R3i.w;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R2i.w == 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = uf_remappedVS[2].x & 0x10000;
R127i.y = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(R7i.y));
R127i.z = uf_remappedVS[2].x & 0x40000;
R127i.w = uf_remappedVS[2].x & 0x20000;
R126i.z = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[3].x));
// 1
R127i.x = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(R7i.z));
R126i.y = R7i.y;
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) * 2.0);
R125i.z = R7i.z;
R125i.z = floatBitsToInt(intBitsToFloat(R125i.z) * 2.0);
R126i.w = floatBitsToInt((intBitsToFloat(uf_remappedVS[3].x) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(float(PV0ix));
// 2
backupReg0i = R127i.w;
R126i.x = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[3].x))?1.0:0.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(uf_remappedVS[4].y)));
PS0i = floatBitsToInt(float(backupReg0i));
// 3
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iy)));
R125i.w = floatBitsToInt(intBitsToFloat(R18i.y) * intBitsToFloat(R126i.z));
PS1i = floatBitsToInt(float(R127i.z));
// 4
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R126i.z = floatBitsToInt(intBitsToFloat(R127i.y) * 0.5);
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1ix)));
R124i.w = int(intBitsToFloat(PV1iz));
// 5
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(R7i.z));
R127i.y = 0 - R124i.w;
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iy)));
R0i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * 0.5);
R127i.z = int(intBitsToFloat(PV0iw));
// 6
backupReg0i = R125i.z;
R125i.x = floatBitsToInt(floor(intBitsToFloat(R126i.y)));
PV0iy = 0 - R127i.z;
R125i.z = R7i.x;
R125i.z = floatBitsToInt(intBitsToFloat(R125i.z) * 2.0);
R2i.w = floatBitsToInt(floor(intBitsToFloat(backupReg0i)));
R125i.y = int(intBitsToFloat(PV1iz));
// 7
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R125i.w));
R124i.y = max(R127i.z, PV0iy);
R124i.z = floatBitsToInt(intBitsToFloat(backupReg0i) * 0.5);
R127i.w = floatBitsToInt(intBitsToFloat(R126i.w) + -(intBitsToFloat(R126i.x)));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[5].w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R126i.y = floatBitsToInt(tempResultf);
// 8
R126i.x = floatBitsToInt(intBitsToFloat(R126i.z) + -(0.5));
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) * 2.0);
R127i.y = max(R124i.w, R127i.y);
R126i.z = 0 - R125i.y;
R124i.w = floatBitsToInt(intBitsToFloat(R0i.w) + -(0.5));
R124i.w = floatBitsToInt(intBitsToFloat(R124i.w) * 2.0);
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R18i.z));
// 9
PV1ix = floatBitsToInt((intBitsToFloat(R2i.w) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(R2i.w))?1.0:0.0);
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(R125i.x))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(R125i.x) > 0.0)?1.0:0.0);
R125i.z = floatBitsToInt(floor(intBitsToFloat(R125i.z)));
// 10
backupReg0i = R126i.z;
backupReg1i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.y), intBitsToFloat(R126i.y)));
R126i.y = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
R126i.z = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iy)));
R126i.w = max(R125i.y, backupReg0i);
R125i.y = floatBitsToInt(fract(intBitsToFloat(backupReg1i)));
// 11
R10i.x = floatBitsToInt(intBitsToFloat(R18i.y) * intBitsToFloat(R127i.z));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(uf_remappedVS[6].x)));
R127i.z = floatBitsToInt(intBitsToFloat(R124i.z) + -(0.5));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 2.0);
PV1iw = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(uf_remappedVS[6].y)));
// 12
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(R125i.z))?1.0:0.0);
PV0iy = floatBitsToInt((intBitsToFloat(R125i.z) > 0.0)?1.0:0.0);
R125i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].w)) + 1.0);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(PV1iw)));
PS0i = floatBitsToInt(float(R127i.y));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 13
backupReg0i = R124i.y;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R125i.y)));
R124i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].y) + intBitsToFloat(R126i.x));
R124i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(R126i.y)));
R127i.w = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(float(backupReg0i));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 14
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(uf_remappedVS[5].x));
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(R126i.z)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(uf_remappedVS[6].z)));
R3i.w = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(exp2(intBitsToFloat(backupReg0i)));
// 15
backupReg0i = R126i.w;
R125i.x = floatBitsToInt(intBitsToFloat(R7i.x) + -(0.5));
R126i.y = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].w)) + intBitsToFloat(uf_remappedVS[8].w));
R126i.w = floatBitsToInt(intBitsToFloat(R7i.y) + -(0.5));
PS1i = floatBitsToInt(float(backupReg0i));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 16
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(R127i.w)));
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].z) + intBitsToFloat(R127i.z));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R124i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R124i.z)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R125i.z));
// 17
backupReg0i = R126i.y;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R125i.y)));
R126i.y = ((intBitsToFloat(uf_remappedVS[5].w) == 1.0)?-1:0);
R127i.z = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(PS0i));
R124i.w = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0iz));
R125i.z = floatBitsToInt(intBitsToFloat(R3i.x) + intBitsToFloat(PV0iw));
// 18
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].y)) + intBitsToFloat(uf_remappedVS[8].y));
R0i.y = floatBitsToInt(intBitsToFloat(R7i.z) + -(0.5));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R125i.y)));
R125i.w = floatBitsToInt(intBitsToFloat(R124i.y) + intBitsToFloat(PV1ix));
R2i.w = floatBitsToInt(1.0 / intBitsToFloat(R126i.z));
// 19
R0i.x = ((R126i.y == 0)?(R127i.z):(R18i.y));
R126i.y = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(PV0iz));
R8i.z = floatBitsToInt(intBitsToFloat(R3i.w) + -(intBitsToFloat(uf_remappedVS[8].w)));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].w)) + intBitsToFloat(uf_remappedVS[9].w));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R126i.x)));
// 20
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(uf_remappedVS[10].x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(uf_remappedVS[10].y)));
R3i.z = floatBitsToInt(intBitsToFloat(R3i.z) + intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R126i.x)));
R0i.w = floatBitsToInt(intBitsToFloat(R3i.w) + -(intBitsToFloat(uf_remappedVS[7].w)));
// 21
backupReg0i = R127i.y;
backupReg1i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV0ix));
R127i.y = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV0iy));
R0i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV0iw));
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].x)) + intBitsToFloat(uf_remappedVS[8].x));
R3i.x = floatBitsToInt(intBitsToFloat(backupReg1i) * intBitsToFloat(R2i.w));
// 22
R4i.x = ((intBitsToFloat(R8i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R3i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].y)) + intBitsToFloat(uf_remappedVS[9].y));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R0i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R0i.x)));
R4i.z = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 23
backupReg0i = R2i.w;
R5i.x = floatBitsToInt(intBitsToFloat(R3i.w) + -(intBitsToFloat(uf_remappedVS[9].w)));
R4i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].w)) + intBitsToFloat(uf_remappedVS[11].w));
R5i.z = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0iz));
R2i.w = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV0iw));
R5i.y = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(backupReg0i));
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R3i.x)));
R127i.y = floatBitsToInt(intBitsToFloat(R3i.y) * intBitsToFloat(R4i.z));
R125i.z = ((intBitsToFloat(R0i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[10].z)));
R126i.x = floatBitsToInt(1.0 / intBitsToFloat(R4i.y));
// 1
R3i.x = ((intBitsToFloat(R5i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.y = floatBitsToInt(-(intBitsToFloat(R4i.x)) + 1.0);
PV1iz = floatBitsToInt(intBitsToFloat(R3i.z) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].x)) + intBitsToFloat(uf_remappedVS[9].x));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R0i.x)));
// 2
backupReg0i = R127i.y;
R125i.x = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(R4i.z));
R127i.y = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PS1i));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R5i.y)));
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].y)) + intBitsToFloat(uf_remappedVS[11].y));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(backupReg0i)));
// 3
backupReg0i = R126i.y;
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].y) + intBitsToFloat(R127i.x));
R126i.y = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(R126i.x));
R127i.z = floatBitsToInt(-(intBitsToFloat(R3i.x)) + 1.0);
PV1iw = floatBitsToInt(intBitsToFloat(R3i.w) + -(intBitsToFloat(uf_remappedVS[11].w)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(backupReg0i)));
// 4
R124i.x = floatBitsToInt(intBitsToFloat(R5i.z) * intBitsToFloat(0x3e22f983) + 0.5);
R0i.y = ((intBitsToFloat(PV1iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].x)) + intBitsToFloat(uf_remappedVS[11].x));
R125i.w = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
R0i.x = floatBitsToInt(intBitsToFloat(R2i.w) * intBitsToFloat(0x3e22f983) + 0.5);
// 5
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].x) + intBitsToFloat(R126i.z));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R127i.z)));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(backupReg0i));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R125i.x)));
R126i.w = floatBitsToInt(-(intBitsToFloat(R0i.y)) + 1.0);
// 6
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R126i.y)));
R126i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].y) + intBitsToFloat(R124i.z));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R125i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].y), intBitsToFloat(R125i.w)));
R124i.y = floatBitsToInt(fract(intBitsToFloat(R124i.x)));
// 7
backupReg0i = R127i.y;
backupReg1i = R127i.w;
R124i.x = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0iw));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R126i.w)));
R124i.z = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3e22f983) + 0.5);
R127i.w = floatBitsToInt(fract(intBitsToFloat(R0i.x)));
R126i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].x) + intBitsToFloat(backupReg1i));
// 8
backupReg0i = R126i.y;
backupReg1i = R125i.w;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R125i.y)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R127i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R5i.y)));
R125i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].y) + intBitsToFloat(R127i.x));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].x), intBitsToFloat(backupReg1i)));
// 9
R123i.x = floatBitsToInt(intBitsToFloat(R124i.y) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R124i.y = floatBitsToInt(fract(intBitsToFloat(R124i.z)));
R123i.z = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.w = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PS0i));
R124i.x = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(R124i.x));
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R127i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R5i.y)));
R124i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].x) + intBitsToFloat(R126i.y));
R126i.w = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
R126i.y = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
// 11
R123i.x = floatBitsToInt(intBitsToFloat(R124i.y) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R124i.y = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(R127i.w));
PV1iz = floatBitsToInt(max(intBitsToFloat(R7i.x), 0.0));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R124i.x));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].y), intBitsToFloat(R0i.y)));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R127i.y)));
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + intBitsToFloat(PV1iw));
R124i.z = floatBitsToInt(min(intBitsToFloat(PV1iz), 0.0));
R127i.w = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
R127i.z = floatBitsToInt(sin((intBitsToFloat(R126i.w))/0.1591549367));
// 13
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].x), intBitsToFloat(R0i.y)));
PV1iy = uf_remappedVS[12].y;
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) / 2.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R124i.y));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PV0iy)));
R124i.y = floatBitsToInt(cos((intBitsToFloat(R126i.w))/0.1591549367));
// 14
R0i.x = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(R124i.z));
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PV1iz));
R5i.z = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(PV1iy));
R126i.w = uf_remappedVS[12].x;
R126i.w = floatBitsToInt(intBitsToFloat(R126i.w) / 2.0);
R124i.x = floatBitsToInt(sin((intBitsToFloat(R126i.y))/0.1591549367));
// 15
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R124i.x)));
R127i.y = floatBitsToInt(intBitsToFloat(R6i.z) * 1.0);
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV0iy)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R124i.x)));
R124i.w = floatBitsToInt(cos((intBitsToFloat(R126i.y))/0.1591549367));
// 16
R5i.x = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(R126i.w));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R124i.w)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R124i.w)));
R9i.w = 0x3f800000;
R12i.z = floatBitsToInt(sin((intBitsToFloat(R127i.w))/0.1591549367));
// 17
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z), intBitsToFloat(R126i.y)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z), intBitsToFloat(R127i.x)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z), intBitsToFloat(R124i.z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z), intBitsToFloat(R125i.w)));
R125i.y = floatBitsToInt(cos((intBitsToFloat(R127i.w))/0.1591549367));
// 18
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R125i.y)));
R3i.y = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV1iy));
R10i.z = floatBitsToInt(-(intBitsToFloat(R124i.z)) + intBitsToFloat(PV1iw));
R0i.w = floatBitsToInt(-(intBitsToFloat(R12i.z)));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R125i.y)));
// 19
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(R127i.y)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R125i.y)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R127i.y)));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(R127i.y)));
R11i.z = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(R126i.x));
// 20
R4i.x = floatBitsToInt(-(intBitsToFloat(R125i.w)) + intBitsToFloat(R126i.z));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R125i.y)));
R4i.z = floatBitsToInt(intBitsToFloat(R7i.x) + 1.0);
R8i.w = 0x3f800000;
R0i.x = floatBitsToInt(intBitsToFloat(R7i.y) + 1.0);
// 21
PV1iz = ((intBitsToFloat(R18i.y) == 0.0)?-1:0);
R3i.w = floatBitsToInt(intBitsToFloat(R7i.z) + 1.0);
PS1i = int(intBitsToFloat(R6i.w));
// 22
R8i.x = (PS1i == int(1))?-1:0;
R8i.y = (PS1i == 0x2)?-1:0;
R3i.z = (PS1i == 0x3)?-1:0;
R5i.w = ((PV1iz == 0)?(R18i.y):(0x3f800000));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(uf_remappedVS[13].z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(uf_remappedVS[13].y)));
R126i.z = ((R8i.x == 0)?(0x3f800000):(0xbf800000));
R125i.w = ((R8i.x == 0)?(0xbf800000):(0xbf800000));
// 1
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(uf_remappedVS[14].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[14].x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R5i.z)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R5i.x)));
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(uf_remappedVS[14].x)));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.z), intBitsToFloat(uf_remappedVS[15].w)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R5i.y)) + intBitsToFloat(R0i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R0i.w)) + intBitsToFloat(R4i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R9i.z)) + intBitsToFloat(R3i.x));
R127i.x = ((R8i.y == 0)?(R125i.w):(0x3f800000));
// 3
backupReg0i = R8i.y;
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(R4i.y)) + intBitsToFloat(R123i.z));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(R11i.z)) + intBitsToFloat(R123i.w));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(R4i.x)) + intBitsToFloat(R123i.y));
R124i.w = ((backupReg0i == 0)?(R126i.z):(0xbf800000));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 4
R8i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R9i.w)),vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),intBitsToFloat(uf_remappedVS[16].w))));
PV0iy = R8i.x;
PV0iz = R8i.x;
PV0iw = R8i.x;
R4i.z = floatBitsToInt(intBitsToFloat(R5i.w) * intBitsToFloat(PS1i));
R4i.z = clampFI32(R4i.z);
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R9i.w)),vec4(intBitsToFloat(uf_remappedVS[17].x),intBitsToFloat(uf_remappedVS[17].y),intBitsToFloat(uf_remappedVS[17].z),intBitsToFloat(uf_remappedVS[17].w))));
PV1ix = tempi.x;
R11i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.x = ((R3i.z == 0)?(R124i.w):(0x3f800000));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R9i.w)),vec4(intBitsToFloat(uf_remappedVS[18].x),intBitsToFloat(uf_remappedVS[18].y),intBitsToFloat(uf_remappedVS[18].z),intBitsToFloat(uf_remappedVS[18].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R1i.z = tempi.x;
PV0iw = tempi.x;
R125i.y = ((R3i.z == 0)?(R127i.x):(0x3f800000));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[18].x),intBitsToFloat(uf_remappedVS[18].y),intBitsToFloat(uf_remappedVS[18].z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R124i.w = tempi.x;
// 8
R1i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),0.0)));
PV0iy = R1i.x;
PV0iz = R1i.x;
PV0iw = R1i.x;
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[17].x),intBitsToFloat(uf_remappedVS[17].y),intBitsToFloat(uf_remappedVS[17].z),0.0)));
PV1ix = tempi.x;
R1i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R5i.z = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(0x358637bd));
// 10
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(uf_remappedVS[19].x)) + 0.0);
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(uf_remappedVS[19].x)) + 0.0);
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w)),vec4(intBitsToFloat(R3i.x),intBitsToFloat(R8i.y),intBitsToFloat(R0i.z),intBitsToFloat(R8i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.w = uf_remappedVS[20].z;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w)),vec4(intBitsToFloat(R3i.x),intBitsToFloat(R8i.y),intBitsToFloat(R0i.z),intBitsToFloat(R8i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R2i.x = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(PV0ix));
// 2
R127i.x = uf_remappedVS[22].z;
R2i.y = floatBitsToInt(intBitsToFloat(R11i.y) + intBitsToFloat(PV1ix));
R126i.z = uf_remappedVS[21].z;
R124i.w = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(R0i.x));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R125i.w)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedVS[22].x),intBitsToFloat(uf_remappedVS[22].y),intBitsToFloat(uf_remappedVS[22].z),intBitsToFloat(uf_remappedVS[22].w)),vec4(intBitsToFloat(R3i.x),intBitsToFloat(R8i.y),intBitsToFloat(R0i.z),intBitsToFloat(R8i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(R0i.y));
// 4
R126i.x = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(PS1i));
R125i.y = uf_remappedVS[20].y;
R0i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV1ix));
R126i.w = uf_remappedVS[21].y;
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R126i.z)));
// 5
backupReg0i = R5i.x;
R5i.x = uf_remappedVS[22].y;
PV1iy = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(backupReg0i));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R127i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R125i.w)));
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R126i.z)));
// 6
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R127i.x)));
R124i.y = uf_remappedVS[20].x;
R125i.z = uf_remappedVS[21].x;
R0i.w = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(backupReg0i));
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R125i.w)));
// 7
backupReg0i = R127i.x;
backupReg1i = R124i.w;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R126i.z)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z),intBitsToFloat(R125i.y)) + intBitsToFloat(R127i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(backupReg0i)));
R124i.w = uf_remappedVS[22].x;
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z),intBitsToFloat(R126i.w)) + intBitsToFloat(backupReg1i));
// 8
backupReg0i = R124i.z;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z),intBitsToFloat(R126i.w)) + intBitsToFloat(R124i.x));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z),intBitsToFloat(R125i.y)) + intBitsToFloat(R127i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z),intBitsToFloat(R5i.x)) + intBitsToFloat(backupReg0i));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z),intBitsToFloat(R5i.x)) + intBitsToFloat(R126i.x));
// 9
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z),intBitsToFloat(R126i.w)) + intBitsToFloat(R127i.x));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z),intBitsToFloat(R125i.y)) + intBitsToFloat(R125i.x));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z),intBitsToFloat(R5i.x)) + intBitsToFloat(R127i.z));
// 10
R20i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.z)),intBitsToFloat(R124i.y)) + intBitsToFloat(R127i.y));
R20i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.z)),intBitsToFloat(R125i.z)) + intBitsToFloat(R126i.z));
R20i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.z)),intBitsToFloat(R124i.w)) + intBitsToFloat(R127i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(R125i.z)) + intBitsToFloat(R126i.y));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(R124i.w)) + intBitsToFloat(R126i.x));
// 11
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R20i.y)) + intBitsToFloat(R123i.w));
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R125i.z)) + intBitsToFloat(backupReg0i));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R20i.z)) + intBitsToFloat(R122i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(R124i.y)) + intBitsToFloat(R124i.z));
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R124i.y)) + intBitsToFloat(R125i.y));
// 12
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R20i.x)) + intBitsToFloat(R123i.w));
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R124i.w)) + intBitsToFloat(R126i.w));
// 13
R19i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),intBitsToFloat(R16i.x)) + intBitsToFloat(R123i.x));
R19i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),intBitsToFloat(R16i.y)) + intBitsToFloat(R127i.x));
R19i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),intBitsToFloat(R16i.z)) + intBitsToFloat(R125i.z));
// 14
predResult = (intBitsToFloat(uf_remappedVS[23].y) != 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = uf_remappedVS[17].w;
PV0iy = uf_remappedVS[16].w;
// 1
R127i.x = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(R2i.x)));
R127i.y = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(R2i.y)));
PV1iw = uf_remappedVS[18].w;
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[23].y));
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
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PV1ix)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[16].w) + intBitsToFloat(uf_remappedVS[17].w));
// 1
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[19].w), intBitsToFloat(uf_remappedVS[15].z)));
// 2
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[18].w) + intBitsToFloat(R127i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[19].w), intBitsToFloat(R0i.w)));
// 3
R126i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3dd70a3d));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), intBitsToFloat(uf_remappedVS[15].x)));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R127i.x));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R127i.z));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[19].z), intBitsToFloat(uf_remappedVS[15].y)));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV0iy));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PV0iz)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[19].z), intBitsToFloat(R4i.z)));
PV1iw = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV0ix));
// 6
R123i.y = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
// 7
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
// 8
R123i.x = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 9
R126i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R127i.w = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R5i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R126i.z = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(sin((intBitsToFloat(R126i.x))/0.1591549367));
// 11
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R127i.z)));
PS1i = floatBitsToInt(cos((intBitsToFloat(R126i.x))/0.1591549367));
// 12
R3i.x = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(sin((intBitsToFloat(R127i.w))/0.1591549367));
// 13
R0i.x = floatBitsToInt(-(intBitsToFloat(R8i.x)) + intBitsToFloat(R3i.x));
R3i.z = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R127i.y)));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(R126i.z)));
// 14
R126i.x = ((intBitsToFloat(PS1i) > 0.0)?-1:0);
R3i.y = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(PV1iw));
// 15
R0i.y = floatBitsToInt(-(intBitsToFloat(R11i.y)) + intBitsToFloat(R3i.y));
R0i.z = floatBitsToInt(-(intBitsToFloat(R1i.z)) + intBitsToFloat(R3i.z));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R5i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 18
PV0iw = ((intBitsToFloat(PS1i) > 0.0)?-1:0);
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 19
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PS0i)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PS0i)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PS0i)));
R0i.w = ((PV0iw == 0)?(0):(R126i.x));
// 20
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
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(uf_remappedVS[24].x)));
// 1
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(uf_remappedVS[24].x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[24].x)));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PS1i)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R1i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.z)));
// 5
R3i.x = floatBitsToInt(intBitsToFloat(R3i.x) + intBitsToFloat(PV0iy));
R3i.y = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(PV0ix));
R3i.z = floatBitsToInt(intBitsToFloat(R3i.z) + intBitsToFloat(PV0iw));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(-(intBitsToFloat(R3i.x)) + intBitsToFloat(uf_remappedVS[25].x));
R127i.y = floatBitsToInt(-(intBitsToFloat(R3i.y)) + intBitsToFloat(uf_remappedVS[25].y));
R127i.z = floatBitsToInt(intBitsToFloat(R18i.y) * 100.0);
R127i.z = clampFI32(R127i.z);
R0i.w = 0x3f800000;
R126i.z = floatBitsToInt(-(intBitsToFloat(R3i.z)) + intBitsToFloat(uf_remappedVS[25].z));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[26].x),intBitsToFloat(uf_remappedVS[26].y),intBitsToFloat(uf_remappedVS[26].z),intBitsToFloat(uf_remappedVS[26].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R12i.w = tempi.x;
R2i.y = 0;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[27].x),intBitsToFloat(uf_remappedVS[27].y),intBitsToFloat(uf_remappedVS[27].z),intBitsToFloat(uf_remappedVS[27].w))));
PV0ix = tempi.x;
R126i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R124i.x = PV1ix;
R124i.x = floatBitsToInt(intBitsToFloat(R124i.x) / 2.0);
// 3
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[28].x),intBitsToFloat(uf_remappedVS[28].y),intBitsToFloat(uf_remappedVS[28].z),intBitsToFloat(uf_remappedVS[28].w))));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
R14i.z = floatBitsToInt(intBitsToFloat(PV0ix) * 0.5 + intBitsToFloat(R124i.x));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[29].x),intBitsToFloat(uf_remappedVS[29].y),intBitsToFloat(uf_remappedVS[29].z),intBitsToFloat(uf_remappedVS[29].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R125i.z = tempi.x;
PV0iw = tempi.x;
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R127i.z)));
// 5
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.y), intBitsToFloat(uf_remappedVS[30].x)));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R127i.z)));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R127i.z)));
R14i.w = floatBitsToInt(intBitsToFloat(R126i.y) * 0.0 + intBitsToFloat(R12i.w));
R125i.x = ((intBitsToFloat(R7i.x) > 0.5)?-1:0);
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R14i.w));
// 7
backupReg0i = R127i.x;
R127i.x = ((intBitsToFloat(R7i.z) > 0.5)?-1:0);
PV1iy = floatBitsToInt(intBitsToFloat(R14i.z) * intBitsToFloat(PS0i));
R123i.z = floatBitsToInt(intBitsToFloat(backupReg0i) * 0.25 + 0.5);
R123i.z = clampFI32(R123i.z);
R127i.w = ((intBitsToFloat(R7i.y) > 0.5)?-1:0);
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(uf_remappedVS[1].w)) + -(intBitsToFloat(uf_remappedVS[1].y)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS1i)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS1i)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
// 9
R126i.x = ((intBitsToFloat(R7i.y) > 0.5)?-1:0);
PV1iy = ((intBitsToFloat(R7i.w) > 0.5)?-1:0);
R126i.z = ((intBitsToFloat(R7i.z) > 0.5)?-1:0);
PV1iw = floatBitsToInt(intBitsToFloat(PS0i) + 8.5);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.x));
// 10
R2i.x = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3daaaaab));
R4i.y = floatBitsToInt(((R127i.w == 0)?(intBitsToFloat(R6i.y)):(-(intBitsToFloat(R6i.y)))));
R3i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS1i));
R2i.w = floatBitsToInt(((R125i.x == 0)?(intBitsToFloat(R6i.x)):(-(intBitsToFloat(R6i.x)))));
R3i.x = floatBitsToInt(((PV1iy == 0)?(intBitsToFloat(R6i.y)):(-(intBitsToFloat(R6i.y)))));
// 11
PV1ix = floatBitsToInt(fract(intBitsToFloat(R1i.w)));
R3i.y = floatBitsToInt(((R127i.x == 0)?(intBitsToFloat(R6i.x)):(-(intBitsToFloat(R6i.x)))));
R2i.z = floatBitsToInt(((R126i.z == 0)?(intBitsToFloat(R6i.y)):(-(intBitsToFloat(R6i.y)))));
// 12
R3i.w = floatBitsToInt(((R126i.x == 0)?(intBitsToFloat(R6i.x)):(-(intBitsToFloat(R6i.x)))));
R10i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[23].z), intBitsToFloat(PV1ix)));
// 13
R123i.w = floatBitsToInt(intBitsToFloat(R126i.y) * 0.0 + intBitsToFloat(R124i.x));
// 14
R14i.x = floatBitsToInt(intBitsToFloat(R0i.x) * 0.5 + intBitsToFloat(R123i.w));
R14i.y = floatBitsToInt(intBitsToFloat(R125i.z) * -(0.5) + intBitsToFloat(R123i.w));
// 15
R9i.y = uf_remappedVS[25].y;
}
if( activeMaskStackC[3] == true ) {
R15i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[31].x),intBitsToFloat(uf_remappedVS[31].y),intBitsToFloat(uf_remappedVS[31].z),0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[31].y) + 1.0);
// 1
R124i.x = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(uf_remappedVS[32].x)) + -(intBitsToFloat(uf_remappedVS[32].y)));
R123i.y = clampFI32(R123i.y);
PV1iz = floatBitsToInt((intBitsToFloat(uf_remappedVS[33].y) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[33].y))?1.0:0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[33].y));
// 2
R123i.x = floatBitsToInt(intBitsToFloat(R124i.x) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
PV0iy = floatBitsToInt(intBitsToFloat(R18i.y) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R127i.w = floatBitsToInt(-(intBitsToFloat(R124i.x)) + 1.0);
R126i.x = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iw)));
// 3
PV1ix = uf_remappedVS[2].y & int(1);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(uf_remappedVS[3].z)) + intBitsToFloat(PV0iy));
R125i.z = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R123i.x)) + intBitsToFloat(0xbe593484));
tempResultf = max(0.0, intBitsToFloat(PV0iz));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R4i.x = floatBitsToInt(tempResultf);
// 4
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R123i.w)) + intBitsToFloat(0x3fc90da4));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV0iz = (int(1) != PV1ix)?-1:0;
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[34].y), intBitsToFloat(R4i.x)));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(R127i.w)));
// 5
R123i.x = ((PV0iz == 0)?(0):(0x2));
PV1iy = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f22f983));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV0iy)));
R126i.w = floatBitsToInt(intBitsToFloat(R126i.w) * 1.5);
R126i.w = clampFI32(R126i.w);
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 6
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),-(intBitsToFloat(R124i.x))) + 1.0);
R0i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x),intBitsToFloat(R125i.z)) + intBitsToFloat(PV1iz));
PV0iw = (R123i.x == 0x2)?-1:0;
R1i.y = (R123i.x == int(1))?-1:0;
// 7
R2i.x = uf_remappedVS[2].x & 0x80000;
R2i.y = uf_remappedVS[2].x & 0x100000;
R0i.z = ((PV0iw == 0)?(R7i.y):(R7i.x));
R0i.w = ((PV0iw == 0)?(R7i.x):(R7i.z));
R1i.x = floatBitsToInt(intBitsToFloat(R126i.w) * 15.0);
}
if( activeMaskStackC[3] == true ) {
R10i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(intBitsToFloat(R1i.z) + -(intBitsToFloat(uf_remappedVS[35].w)));
R0i.y = ((R1i.y == 0)?(R0i.w):(R7i.y));
R125i.z = ((R1i.y == 0)?(R0i.z):(R7i.z));
R0i.w = (R2i.x == 0x80000)?-1:0;
PS0i = int(intBitsToFloat(uf_remappedVS[36].z));
// 1
R125i.x = floatBitsToInt(intBitsToFloat(R1i.z) + -(intBitsToFloat(uf_remappedVS[37].w)));
R125i.y = ((intBitsToFloat(R126i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].w)) + intBitsToFloat(uf_remappedVS[37].w));
R1i.w = (R2i.y == 0x100000)?-1:0;
R127i.x = floatBitsToInt(float(PS0i));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].x)) + intBitsToFloat(uf_remappedVS[37].x));
R124i.y = ((intBitsToFloat(R125i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iz = floatBitsToInt((0.0 >= abs(intBitsToFloat(R127i.x)))?1.0:0.0);
PV0iw = floatBitsToInt(-(abs(intBitsToFloat(R127i.x))) + 0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
// 3
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[37].w)) + intBitsToFloat(uf_remappedVS[38].w));
R126i.y = ((intBitsToFloat(PV0iz) == 0.0)?(0):(PV0iw));
R0i.z = floatBitsToInt(intBitsToFloat(R1i.z) + -(intBitsToFloat(uf_remappedVS[38].w)));
R126i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(PS0i));
R124i.x = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 4
PV0ix = floatBitsToInt(abs(intBitsToFloat(R127i.x)) + intBitsToFloat(R126i.y));
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[37].x)) + intBitsToFloat(uf_remappedVS[38].x));
R124i.z = ((intBitsToFloat(R0i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.w = floatBitsToInt(-(intBitsToFloat(R124i.y)) + 1.0);
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 5
backupReg0i = R126i.y;
PV1ix = floatBitsToInt(intBitsToFloat(R1i.z) + -(intBitsToFloat(uf_remappedVS[39].w)));
R126i.y = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
PV1iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[38].w)) + intBitsToFloat(uf_remappedVS[39].w));
R123i.w = ((-(intBitsToFloat(backupReg0i)) > 0.0)?(PV0ix):(backupReg0i));
R124i.w = floatBitsToInt(intBitsToFloat(R124i.x) * 0.0);
// 6
R127i.x = ((intBitsToFloat(R127i.x) == 0.0)?(0):(R123i.w));
R8i.y = ((intBitsToFloat(PV1ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(R127i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R126i.w)) + intBitsToFloat(uf_remappedVS[35].x));
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
// 7
PV1ix = floatBitsToInt(-(intBitsToFloat(R124i.z)) + 1.0);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R125i.w)));
R126i.z = floatBitsToInt(trunc(intBitsToFloat(R124i.w)));
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[38].x)) + intBitsToFloat(uf_remappedVS[39].x));
R2i.y = floatBitsToInt(-(intBitsToFloat(R8i.y)) + 1.0);
// 8
PV0ix = uf_remappedVS[2].x & 0x200000;
R127i.y = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(R127i.y));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].x), intBitsToFloat(R126i.y)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PV1ix)));
R5i.y = int(intBitsToFloat(R127i.x));
// 9
R126i.x = (PV0ix == 0x200000)?-1:0;
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R125i.y)) + intBitsToFloat(PV0iz));
PV1iz = uf_remappedVS[2].x & 0x800000;
PV1iw = uf_remappedVS[2].x & 0x400000;
R124i.w = ((R1i.y == 0)?(R7i.x):(R7i.y));
// 10
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].x), intBitsToFloat(R0i.y)));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
PV0iy = uf_remappedVS[2].x & 0x1000000;
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].y), intBitsToFloat(R125i.z)));
R125i.z = floatBitsToInt(intBitsToFloat(R125i.z) * 2.0);
R127i.w = (PV1iw == 0x400000)?-1:0;
R126i.y = (PV1iz == 0x800000)?-1:0;
// 11
backupReg0i = R126i.z;
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[41].w) + intBitsToFloat(uf_remappedVS[40].y));
R124i.y = (PV0iy == 0x1000000)?-1:0;
R126i.z = ((R1i.y == 0)?(R7i.y):(R7i.z));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[41].z) + intBitsToFloat(uf_remappedVS[40].x));
R1i.y = int(intBitsToFloat(backupReg0i));
// 12
backupReg0i = R125i.x;
backupReg1i = R125i.z;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R2i.y)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R127i.z)) + intBitsToFloat(uf_remappedVS[37].x));
R125i.z = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(PV1iw));
R126i.w = floatBitsToInt(-(intBitsToFloat(backupReg1i)) + intBitsToFloat(PV1ix));
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[36].z));
// 13
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(R125i.w)) + intBitsToFloat(R125i.y));
R125i.y = ((backupReg0i == 0)?(R6i.x):(R3i.y));
R124i.z = ((R0i.w == 0)?(R6i.x):(R2i.w));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R127i.y)) + intBitsToFloat(uf_remappedVS[38].x));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[36].w));
// 14
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[42].y) + intBitsToFloat(uf_remappedVS[42].w));
R127i.y = ((R1i.w == 0)?(R6i.y):(R4i.y));
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[42].x) + intBitsToFloat(uf_remappedVS[42].z));
R127i.w = ((R127i.w == 0)?(R6i.y):(R3i.x));
R1i.w = floatBitsToInt(1.0 / intBitsToFloat(R1i.x));
// 15
backupReg0i = R126i.z;
backupReg1i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[42].z),intBitsToFloat(R124i.w)) + intBitsToFloat(PV0iz));
R6i.y = ((R124i.y == 0)?(R6i.y):(R2i.z));
R126i.z = ((R126i.y == 0)?(R6i.x):(R3i.w));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[42].w),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV0ix));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].x), intBitsToFloat(backupReg1i)));
// 16
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R18i.y)),intBitsToFloat(uf_remappedVS[41].x)) + -(intBitsToFloat(R125i.z)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].y), intBitsToFloat(R127i.z)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.y),intBitsToFloat(uf_remappedVS[41].y)) + intBitsToFloat(R126i.w));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R125i.x)) + intBitsToFloat(R126i.x));
PS0i = floatBitsToInt(float(R5i.y));
// 17
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(PS0i)) + intBitsToFloat(R123i.x));
R5i.y = uf_remappedVS[43].x;
R6i.z = uf_remappedVS[43].y;
R6i.w = uf_remappedVS[43].z;
PS1i = floatBitsToInt(float(R1i.y));
// 18
R1i.x = uf_remappedVS[44].y;
R124i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.y)),intBitsToFloat(PS1i)) + intBitsToFloat(R127i.z));
R0i.z = uf_remappedVS[44].x;
R2i.w = uf_remappedVS[44].z;
R1i.y = floatBitsToInt(intBitsToFloat(R124i.z) + 0.5);
// 19
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.w) + -(0.5));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.y),intBitsToFloat(uf_remappedVS[40].z)) + intBitsToFloat(backupReg0i));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.y) + -(0.5));
R127i.w = floatBitsToInt(intBitsToFloat(R125i.y) + 0.5);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.y),intBitsToFloat(uf_remappedVS[40].w)) + intBitsToFloat(R124i.w));
// 20
R125i.x = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
PV0iy = floatBitsToInt(intBitsToFloat(R126i.z) + 0.5);
PV0iz = floatBitsToInt(intBitsToFloat(R6i.y) + -(0.5));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].x),intBitsToFloat(R8i.y)) + intBitsToFloat(R126i.w));
R2i.z = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[45].z));
// 21
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(PV0iy)) + intBitsToFloat(R126i.x));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[45].x), intBitsToFloat(R1i.y)));
R7i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[45].y)), intBitsToFloat(R127i.z)));
R3i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.y)),intBitsToFloat(PV0iz)) + -(intBitsToFloat(R124i.y)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[46].x), intBitsToFloat(R127i.w)));
// 22
R6i.x = floatBitsToInt(-(intBitsToFloat(R124i.w)) + 1.0);
R7i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[46].y)), intBitsToFloat(R127i.x)));
R13i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.z)),intBitsToFloat(R125i.x)) + intBitsToFloat(R123i.x));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[34].x), intBitsToFloat(R4i.x)));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R6i.x)) + intBitsToFloat(R3i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(uf_remappedVS[47].x)) + -(intBitsToFloat(uf_remappedVS[47].y)));
R123i.z = clampFI32(R123i.z);
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R1i.y)));
// 1
PV1ix = floatBitsToInt(min(intBitsToFloat(R9i.y), intBitsToFloat(uf_remappedVS[48].z)));
R123i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[31].y) * 1.0 + intBitsToFloat(R3i.z));
R124i.w = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[34].z)),intBitsToFloat(PS1i)) + intBitsToFloat(uf_remappedVS[34].z));
R123i.x = clampFI32(R123i.x);
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(uf_remappedVS[49].y)));
PV0iz = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(R1i.w));
R127i.w = floatBitsToInt(-(intBitsToFloat(R11i.y)) + intBitsToFloat(PV1ix));
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(uf_remappedVS[49].x)));
// 3
backupReg0i = R0i.z;
R127i.x = floatBitsToInt(-(intBitsToFloat(R10i.w)) + intBitsToFloat(R123i.x));
R127i.x = clampFI32(R127i.x);
PV1iy = floatBitsToInt(max(intBitsToFloat(PV0iz), intBitsToFloat(0x3e4ccccd)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(uf_remappedVS[49].z)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[49].w)));
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[50].x)));
// 4
backupReg0i = R124i.w;
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(uf_remappedVS[50].y)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(uf_remappedVS[50].z)));
R124i.w = floatBitsToInt(min(intBitsToFloat(PV1iy), 1.0));
tempResultf = max(0.0, intBitsToFloat(backupReg0i));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[48].y),intBitsToFloat(R127i.w)) + intBitsToFloat(uf_remappedVS[48].x));
R123i.x = clampFI32(R123i.x);
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(R124i.w)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[47].w), intBitsToFloat(PS0i)));
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(R124i.w)));
// 6
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(uf_remappedVS[51].w)));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(R124i.w)));
R9i.w = R127i.x;
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iz)));
// 7
R10i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)),intBitsToFloat(uf_remappedVS[52].w)) + intBitsToFloat(uf_remappedVS[52].w));
R10i.z = R127i.x;
}
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[53].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[53].x)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[53].x)));
R2i.w = uf_remappedVS[54].x;
// 1
R17i.y = uf_remappedVS[55].x;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[45].w));
// 2
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R7i.z)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[46].z));
// 3
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R1i.z)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[46].w));
// 4
R11i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R7i.w)));
}
if( activeMaskStackC[3] == true ) {
// 0
R21i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[53].x), intBitsToFloat(R2i.x)));
R21i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[53].x), intBitsToFloat(R1i.y)));
R21i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[53].x), intBitsToFloat(R2i.z)));
R21i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(uf_remappedVS[50].w)));
// 1
R17i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[13].x) * 1.0 + 0.0);
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R21i.x), intBitsToFloat(R21i.y), intBitsToFloat(R21i.z), intBitsToFloat(R21i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));
// export
passParameterSem10 = vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.w));
// export
passParameterSem13 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.z));
// export
passParameterSem9 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.z));
}
