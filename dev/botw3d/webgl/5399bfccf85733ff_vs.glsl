#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 5399bfccf85733ff
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[51];
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
ATTR_LAYOUT(0, 8) in uvec4 attrDataSem8;

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem3;
out vec4 passParameterSem7;
out vec4 passParameterSem8;
out vec4 passParameterSem11;
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
R13i.z = floatBitsToInt(-(intBitsToFloat(R7i.y)) + 1.0);
R3i.w = 0;
R4i.w = floatBitsToInt(1.0);
// 1
R14i.w = floatBitsToInt(-(intBitsToFloat(R2i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R2i.w = floatBitsToInt(-(intBitsToFloat(R7i.x)) + 1.0);
// 2
predResult = (0.0 > intBitsToFloat(R14i.w));
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
R7i.w = R4i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R7i.w = R3i.w;
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
PS0i = int(intBitsToFloat(R1i.w));
// 1
R13i.x = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R14i.w) >= intBitsToFloat(R13i.x));
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
R3i.w = R4i.w;
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
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(uf_remappedVS[2].y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(uf_remappedVS[2].z)));
PV0iw = floatBitsToInt(max(intBitsToFloat(R5i.x), 0.0));
// 1
PV1iz = floatBitsToInt(min(intBitsToFloat(PV0iw), 0.0));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(uf_remappedVS[3].w)));
// 2
R0i.x = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV1iz));
R7i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(R14i.w));
// 3
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[2].x)));
// 4
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(uf_remappedVS[3].y)));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[3].z)));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(uf_remappedVS[3].y)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R9i.x = ((intBitsToFloat(uf_remappedVS[4].x) == 1.0)?-1:0);
R0i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].x)) + 1.0);
// 1
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
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R7i.z)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].w), intBitsToFloat(PV0ix)));
// 2
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].x), intBitsToFloat(PV1iw)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), intBitsToFloat(PV1iw)));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].z), intBitsToFloat(PV1iw)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
tempResultf = max(0.0, abs(intBitsToFloat(uf_remappedVS[4].x)));
tempResultf = log2(tempResultf);
PS0i = floatBitsToInt(tempResultf);
// 1
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f317218));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[4].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(PS1i)));
R127i.y = ((intBitsToFloat(uf_remappedVS[4].x) == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R0i.y));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R7i.z) + -(intBitsToFloat(PV1iz)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].w), intBitsToFloat(PV1ix)));
// 9
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].x), intBitsToFloat(PV0iw)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), intBitsToFloat(PV0iw)));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].z), intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R0i.z)));
PV0iy = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(R5i.y));
PV0iz = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(R5i.z));
R0i.w = 0x3f800000;
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[4].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) * 0.5);
PV1iy = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(R5i.z));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iz) * 0.5);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(PS0i)));
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R0i.y));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) * 0.5);
R0i.y = floatBitsToInt(intBitsToFloat(R5i.x) + -(0.5));
R127i.z = floatBitsToInt(intBitsToFloat(PV1iz) + -(0.5));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 2.0);
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + -(0.5));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iw)));
// 3
R126i.x = floatBitsToInt(intBitsToFloat(PV0ix) + -(0.5));
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) * 2.0);
PV1iy = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R0i.z = floatBitsToInt(intBitsToFloat(R5i.z) + -(0.5));
R3i.w = floatBitsToInt(intBitsToFloat(R5i.y) + -(0.5));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedVS[6].x)));
// 4
R0i.x = floatBitsToInt(intBitsToFloat(PS1i) + intBitsToFloat(uf_remappedVS[7].x));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(uf_remappedVS[6].y)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(R127i.x));
// 5
backupReg0i = R9i.x;
R9i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].y) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(uf_remappedVS[6].z)));
R123i.z = ((backupReg0i == 0)?(PV0iw):(R7i.z));
// 6
backupReg0i = R2i.z;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R123i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.z)));
R2i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].z) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R123i.z)));
PS0i = uf_remappedVS[8].x & 0x10000;
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R6i.z) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV0iy));
R127i.w = uf_remappedVS[8].x & 0x20000;
PS1i = floatBitsToInt(float(PS0i));
// 8
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1iz)));
PS0i = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
// 9
R1i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV0iw));
R1i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV0iz));
R1i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(float(R127i.w));
// 10
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iy = uf_remappedVS[8].x & 0x40000;
PV0iz = R5i.y;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R127i.z = int(intBitsToFloat(PV1iw));
// 11
R126i.x = R5i.z;
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) * 2.0);
PV1iy = 0 - R127i.z;
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
R127i.w = floatBitsToInt(floor(intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(float(PV0iy));
// 12
PV0ix = max(R127i.z, PV1iy);
R126i.y = floatBitsToInt((intBitsToFloat(R127i.w) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R127i.y = int(intBitsToFloat(PV1iz));
// 13
PV1ix = 0 - R127i.y;
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(R127i.w))?1.0:0.0);
PV1iw = floatBitsToInt(floor(intBitsToFloat(R126i.x)));
R127i.w = floatBitsToInt(float(PV0ix));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
// 14
PV0ix = floatBitsToInt(intBitsToFloat(R126i.y) + -(intBitsToFloat(PV1iz)));
PV0iy = floatBitsToInt((intBitsToFloat(PV1iw) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PV1iw))?1.0:0.0);
PV0iw = max(R127i.y, PV1ix);
R126i.x = int(intBitsToFloat(PV1iy));
// 15
PV1ix = 0 - R126i.x;
R6i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(float(PV0iw));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 16
R6i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(PV1iw)));
PV0iz = max(R126i.x, PV1ix);
// 17
R2i.y = floatBitsToInt(float(PV0iz));
R2i.y = floatBitsToInt(intBitsToFloat(R2i.y) * 2.0);
}
if( activeMaskStackC[3] == true ) {
// 0
R2i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w))));
PV0iy = R2i.x;
PV0iz = R2i.x;
PV0iw = R2i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R7i.w = tempi.x;
PS1i = R5i.x;
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R1i.z = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(floor(intBitsToFloat(PS1i)));
// 3
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R6i.y)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(R6i.x)));
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[12].x)));
// 4
R127i.x = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(PV1iz));
R125i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.0);
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iw)));
R127i.w = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV1iy));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(uf_remappedVS[12].y)));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[12].z)));
R126i.y = floatBitsToInt(intBitsToFloat(PS0i) + 0.0);
R127i.z = ((intBitsToFloat(uf_remappedVS[7].w) == 1.0)?-1:0);
PV1iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.y)), intBitsToFloat(PV0iz)));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[7].w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 6
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].w)) + 1.0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.w), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV1iw)));
R126i.w = floatBitsToInt(intBitsToFloat(PV1ix) + 0.0);
// 7
R127i.y = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iy)));
// 8
PV0iz = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 9
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(PS0i));
// 10
R123i.z = ((R127i.z == 0)?(PV1iw):(R14i.w));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R123i.z)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R123i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R123i.z)));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(PV1iy));
PV0iz = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV1iz));
R3i.w = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV1ix));
// 13
R123i.x = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e22f983) + 0.5);
// 14
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
// 15
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 16
R0i.x = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
R127i.z = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
// 17
R2i.y = floatBitsToInt(sin((intBitsToFloat(R127i.z))/0.1591549367));
// 18
R9i.x = floatBitsToInt(cos((intBitsToFloat(R127i.z))/0.1591549367));
// 19
R0i.y = floatBitsToInt(sin((intBitsToFloat(R0i.x))/0.1591549367));
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(-(intBitsToFloat(R1i.z)) + intBitsToFloat(uf_remappedVS[13].z));
R126i.y = floatBitsToInt(-(intBitsToFloat(R2i.x)) + intBitsToFloat(uf_remappedVS[13].x));
// 1
PV1ix = floatBitsToInt((-(intBitsToFloat(R126i.y)) > 0.0)?1.0:0.0);
R125i.y = ((-(intBitsToFloat(R126i.y)) == 0.0)?-1:0);
R124i.z = ((intBitsToFloat(R127i.x) == 0.0)?-1:0);
PV1iw = floatBitsToInt((0.0 > -(intBitsToFloat(R126i.y)))?1.0:0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R126i.y)) * intBitsToFloat(PS1i));
PV0iy = ((0.0 > intBitsToFloat(R127i.x))?-1:0);
R125i.z = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iw)));
R126i.x = floatBitsToInt(cos((intBitsToFloat(R0i.x))/0.1591549367));
// 3
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PV0ix))?1.0:0.0);
PV1iy = floatBitsToInt((intBitsToFloat(PV0ix) > 0.0)?1.0:0.0);
R127i.z = floatBitsToInt(max(intBitsToFloat(PV0ix), -(intBitsToFloat(PV0ix))));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV0iy)));
R2i.z = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(0x3fc90fdb));
// 4
R125i.y = ((intBitsToFloat(R127i.z) > 1.0)?-1:0);
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 5
R123i.y = ((R125i.y == 0)?(R127i.z):(PS0i));
R126i.z = floatBitsToInt(((R125i.y == 0)?(intBitsToFloat(PV0iw)):(-(intBitsToFloat(PV0iw)))));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3fc90fdb));
// 6
R127i.x = ((R125i.y == 0)?(0):(PV1iw));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(R126i.x)));
R0i.z = floatBitsToInt(-(intBitsToFloat(R0i.y)));
PV0iw = floatBitsToInt(min(intBitsToFloat(R123i.y), 1.0));
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R126i.x)));
// 7
R127i.z = floatBitsToInt(max(intBitsToFloat(PV0iw), -(1.0)));
// 8
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.z)));
// 9
R123i.x = floatBitsToInt(intBitsToFloat(0x3edcf805) * intBitsToFloat(R125i.y) + 1.0);
R123i.z = floatBitsToInt(intBitsToFloat(0x3d6ee04d) * intBitsToFloat(R125i.y) + intBitsToFloat(0x3f43b24e));
// 10
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R123i.z)) + 1.0);
R126i.w = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R127i.z)), intBitsToFloat(R123i.x)));
// 11
PV1iy = uf_remappedVS[14].y;
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) / 2.0);
PV1iz = uf_remappedVS[14].x;
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) / 2.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.y));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV1iz));
R125i.y = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PS1i)));
// 13
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(PV0ix)));
R123i.z = ((intBitsToFloat(R127i.z) > 0.0)?(PV0iw):(floatBitsToInt(-(intBitsToFloat(PV0iw)))));
// 14
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(R127i.x));
// 15
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(R126i.y))?1.0:0.0);
PV1iy = floatBitsToInt((intBitsToFloat(R126i.y) > 0.0)?1.0:0.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(R125i.y)));
// 16
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1ix)));
// 17
PV1iy = floatBitsToInt(-(intBitsToFloat(R125i.z)) + intBitsToFloat(PV0iw));
// 18
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3fc90fdb));
// 19
PV1iw = floatBitsToInt(intBitsToFloat(R126i.y) + -(intBitsToFloat(PV0ix)));
// 20
R123i.z = ((R127i.w == 0)?(PV1iw):(0x40490fdb));
// 21
R123i.y = ((R124i.z == 0)?(R123i.z):(R2i.z));
// 22
PV0iw = floatBitsToInt(intBitsToFloat(R3i.w) + -(intBitsToFloat(R123i.y)));
// 23
R123i.w = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
R4i.x = floatBitsToInt(1.0 / intBitsToFloat(R9i.y));
// 24
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
// 25
R123i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 26
R127i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
// 27
PS1i = floatBitsToInt(sin((intBitsToFloat(R127i.x))/0.1591549367));
// 28
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R126i.x)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(PS1i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(cos((intBitsToFloat(backupReg0i))/0.1591549367));
// 29
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R124i.z)));
R11i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R126i.x)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R127i.w)));
// 30
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PV1iy)));
R126i.y = floatBitsToInt(-(intBitsToFloat(PV1iy)) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PV1ix)));
R126i.w = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PS1i));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R127i.x)));
// 31
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R126i.w)));
R6i.y = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R126i.y)));
R13i.w = floatBitsToInt(-(intBitsToFloat(R124i.z)) + intBitsToFloat(PV0ix));
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R0i.z)) + intBitsToFloat(PS0i));
// 32
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R10i.x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R10i.x)));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R125i.x)) + intBitsToFloat(PV1ix));
R12i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R127i.y)) + intBitsToFloat(PV1iz));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R10i.x)));
// 33
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R125i.x)) + intBitsToFloat(PS0i));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R127i.y)) + intBitsToFloat(PV0ix));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R0i.z)) + intBitsToFloat(PV0iy));
R1i.w = 0x3f800000;
R125i.x = floatBitsToInt(intBitsToFloat(R2i.x) + -(intBitsToFloat(uf_remappedVS[13].x)));
// 34
PV0ix = floatBitsToInt(intBitsToFloat(R7i.w) + -(intBitsToFloat(uf_remappedVS[13].y)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R13i.w)) + intBitsToFloat(R123i.x));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R6i.y)) + intBitsToFloat(R123i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R11i.w)) + intBitsToFloat(R123i.z));
PS0i = floatBitsToInt(intBitsToFloat(R1i.z) + -(intBitsToFloat(uf_remappedVS[13].z)));
// 35
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(PV0ix),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(PV0ix),intBitsToFloat(PS0i),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R10i.x = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(R123i.w));
// 36
R2i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(R127i.y));
R0i.w = floatBitsToInt(intBitsToFloat(R7i.w) + intBitsToFloat(R126i.z));
R0i.z = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 37
PV1iy = floatBitsToInt(-(intBitsToFloat(R7i.w)) + intBitsToFloat(R0i.w));
// 38
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(R4i.x));
// 39
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iw)), intBitsToFloat(PV0iw)));
PV1iz = ((0.0 > intBitsToFloat(PV0iw))?-1:0);
// 40
R3i.w = ((PV1iz == 0)?(PV1ix):(PV1iy));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(min(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[15].x)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(uf_remappedVS[16].w)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[15].x));
// 1
R0i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(PS0i));
}
if( activeMaskStackC[3] == true ) {
// 0
R4i.x = uf_remappedVS[17].y;
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[18].y)));
R0i.z = uf_remappedVS[17].x;
// 1
R9i.x = uf_remappedVS[17].z;
R3i.w = uf_remappedVS[19].x;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[16].x), intBitsToFloat(R0i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[16].z), intBitsToFloat(R0i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[16].y), intBitsToFloat(R0i.y)));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(PV0iz)));
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[20].x)));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(PV1iw));
PV0iy = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(intBitsToFloat(R10i.x) + intBitsToFloat(PV1iy));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(uf_remappedVS[20].y)));
// 3
PV1ix = floatBitsToInt(-(intBitsToFloat(R7i.w)) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(-(intBitsToFloat(R2i.x)) + intBitsToFloat(PV0iz));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(uf_remappedVS[20].z)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R1i.z)) + intBitsToFloat(PV0ix));
R17i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(uf_remappedVS[20].w)));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R0i.x)));
PV0iy = ((intBitsToFloat(R5i.x) > 0.5)?-1:0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R0i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R0i.x)));
// 5
R0i.x = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(PV0iw));
R4i.y = floatBitsToInt(intBitsToFloat(R7i.w) + intBitsToFloat(PV0iz));
R1i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0ix));
R3i.w = ((PV0iy == 0)?(R7i.x):(R2i.w));
PS1i = ((intBitsToFloat(R5i.y) > 0.5)?-1:0);
// 6
R2i.x = ((intBitsToFloat(R5i.z) > 0.5)?-1:0);
R0i.w = ((PS1i == 0)?(R7i.y):(R13i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
R15i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R4i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w))));
PV0iy = R15i.x;
PV0iz = R15i.x;
PV0iw = R15i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R4i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[22].x),intBitsToFloat(uf_remappedVS[22].y),intBitsToFloat(uf_remappedVS[22].z),intBitsToFloat(uf_remappedVS[22].w))));
PV1ix = tempi.x;
R15i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R2i.z = ((R2i.x == 0)?(R7i.x):(R2i.w));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R4i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[23].x),intBitsToFloat(uf_remappedVS[23].y),intBitsToFloat(uf_remappedVS[23].z),intBitsToFloat(uf_remappedVS[23].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R15i.z = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R4i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[24].x),intBitsToFloat(uf_remappedVS[24].y),intBitsToFloat(uf_remappedVS[24].z),intBitsToFloat(uf_remappedVS[24].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R15i.w = tempi.x;
R126i.z = ((intBitsToFloat(R5i.w) > 0.5)?-1:0);
// 4
R17i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(uf_remappedVS[25].x)));
PV0iy = PV1ix;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
R17i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[25].x)));
R1i.w = uf_remappedVS[26].x;
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[25].x)));
// 5
R123i.x = floatBitsToInt(intBitsToFloat(R15i.z) * 0.0 + intBitsToFloat(PV0iy));
R0i.y = uf_remappedVS[26].y;
R19i.z = floatBitsToInt(intBitsToFloat(R15i.z) * 0.5 + intBitsToFloat(PV0iy));
R19i.w = floatBitsToInt(intBitsToFloat(R15i.z) * 0.0 + intBitsToFloat(R15i.w));
R2i.x = uf_remappedVS[26].z;
// 6
R19i.x = floatBitsToInt(intBitsToFloat(R15i.x) * 0.5 + intBitsToFloat(R123i.x));
R19i.y = floatBitsToInt(intBitsToFloat(R15i.y) * -(0.5) + intBitsToFloat(R123i.x));
R0i.z = ((R126i.z == 0)?(R7i.y):(R13i.z));
PV0iw = ((intBitsToFloat(R5i.y) > 0.5)?-1:0);
R10i.w = floatBitsToInt(1.0 / intBitsToFloat(R19i.w));
// 7
R9i.x = ((PV0iw == 0)?(R7i.x):(R2i.w));
PV1iz = floatBitsToInt(intBitsToFloat(R19i.z) * intBitsToFloat(R10i.w));
// 8
PV0ix = ((intBitsToFloat(R5i.z) > 0.5)?-1:0);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(uf_remappedVS[1].w)) + -(intBitsToFloat(uf_remappedVS[1].y)));
// 9
R2i.w = ((PV0ix == 0)?(R7i.y):(R13i.z));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.y));
// 10
R9i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS1i));
// 11
PS1i = int(intBitsToFloat(uf_remappedVS[27].z));
// 12
R126i.z = floatBitsToInt(float(PS1i));
// 13
PV1ix = floatBitsToInt((0.0 >= abs(intBitsToFloat(R126i.z)))?1.0:0.0);
PV1iy = floatBitsToInt(-(abs(intBitsToFloat(R126i.z))) + 0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.z));
// 14
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
R126i.w = ((intBitsToFloat(PV1ix) == 0.0)?(0):(PV1iy));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[27].z));
// 15
PV1ix = floatBitsToInt(trunc(intBitsToFloat(PV0iy)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[27].x), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(abs(intBitsToFloat(R126i.z)) + intBitsToFloat(R126i.w));
R4i.x = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[27].w));
// 16
R123i.y = ((-(intBitsToFloat(R126i.w)) > 0.0)?(PV1iz):(R126i.w));
R4i.w = int(intBitsToFloat(PV1ix));
// 17
R123i.x = ((intBitsToFloat(R126i.z) == 0.0)?(0):(R123i.y));
// 18
R10i.x = uf_remappedVS[13].x;
R10i.y = uf_remappedVS[13].y;
R10i.z = uf_remappedVS[13].z;
R6i.w = int(intBitsToFloat(R123i.x));
}
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = floatBitsToInt(intBitsToFloat(R10i.x) + -(intBitsToFloat(R0i.x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[28].y)));
R6i.z = floatBitsToInt(intBitsToFloat(R10i.z) + -(intBitsToFloat(R1i.z)));
PV0iw = uf_remappedVS[29].x;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(uf_remappedVS[28].x)));
// 1
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(uf_remappedVS[28].z)));
R18i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedVS[28].w)));
}
if( activeMaskStackC[3] == true ) {
// 0
R18i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[25].x), intBitsToFloat(R1i.x)));
R18i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[25].x), intBitsToFloat(R0i.y)));
R18i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[25].x), intBitsToFloat(R1i.z)));
PV0iw = uf_remappedVS[8].x & 0x80000;
PS0i = uf_remappedVS[8].x & 0x100000;
// 1
PV1ix = uf_remappedVS[8].x & 0x200000;
PV1iy = (PS0i == 0x100000)?-1:0;
PV1iz = (PV0iw == 0x80000)?-1:0;
PV1iw = uf_remappedVS[8].x & 0x400000;
R127i.y = uf_remappedVS[8].y & int(1);
// 2
PV0ix = (PV1ix == 0x200000)?-1:0;
PV0iy = (PV1iw == 0x400000)?-1:0;
R124i.z = ((PV1iy == 0)?(R7i.y):(R0i.w));
R126i.w = ((PV1iz == 0)?(R7i.x):(R3i.w));
PS0i = uf_remappedVS[8].x & 0x800000;
// 3
R2i.x = ((PV0iy == 0)?(R7i.y):(R0i.z));
R126i.y = ((PV0ix == 0)?(R7i.x):(R2i.z));
PV1iz = (PS0i == 0x800000)?-1:0;
PV1iw = uf_remappedVS[8].x & 0x1000000;
R126i.x = (int(1) != R127i.y)?-1:0;
// 4
backupReg0i = R6i.w;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[27].y), intBitsToFloat(R4i.x)));
PV0iy = (PV1iw == 0x1000000)?-1:0;
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(uf_remappedVS[30].y)));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) * 2.0);
R6i.w = ((PV1iz == 0)?(R7i.x):(R9i.x));
R125i.x = floatBitsToInt(float(backupReg0i));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(uf_remappedVS[30].x)));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[31].z) + intBitsToFloat(uf_remappedVS[30].x));
R4i.z = ((PV0iy == 0)?(R7i.y):(R2i.w));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[31].w) + intBitsToFloat(uf_remappedVS[30].y));
R127i.y = floatBitsToInt(float(R4i.w));
// 6
PV0ix = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.z)) + intBitsToFloat(PV1iw));
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[32].x) + intBitsToFloat(uf_remappedVS[32].z));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[32].y) + intBitsToFloat(uf_remappedVS[32].w));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R2i.y)) + -(0.5));
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R14i.w)),intBitsToFloat(uf_remappedVS[31].x)) + -(intBitsToFloat(PV0ix)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(uf_remappedVS[32].w)) + intBitsToFloat(PV0iw));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.w),intBitsToFloat(uf_remappedVS[31].y)) + intBitsToFloat(PV0iy));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(uf_remappedVS[32].z)) + intBitsToFloat(PV0iz));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R124i.x)) + -(0.5));
// 8
backupReg0i = R123i.x;
backupReg1i = R123i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.w),intBitsToFloat(uf_remappedVS[30].z)) + intBitsToFloat(R123i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.w),intBitsToFloat(uf_remappedVS[30].w)) + intBitsToFloat(R123i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R125i.x)) + intBitsToFloat(backupReg0i));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.x)),intBitsToFloat(R127i.y)) + intBitsToFloat(backupReg1i));
R122i.x = ((R126i.x == 0)?(0):(int(1)));
// 9
PV1ix = (R122i.x == 0x2)?-1:0;
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(R126i.w)) + -(intBitsToFloat(R123i.w)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.z));
R126i.w = (R122i.x == int(1))?-1:0;
PS1i = int(intBitsToFloat(uf_remappedVS[33].z));
// 10
R123i.x = ((PV1ix == 0)?(R5i.y):(R5i.x));
R123i.y = ((PV1ix == 0)?(R5i.x):(R5i.z));
R125i.z = ((R126i.w == 0)?(R5i.x):(R5i.y));
R127i.w = ((R126i.w == 0)?(R5i.y):(R5i.z));
R124i.z = floatBitsToInt(float(PS1i));
// 11
PV1ix = floatBitsToInt((0.0 >= abs(intBitsToFloat(R124i.z)))?1.0:0.0);
PV1iy = floatBitsToInt(-(abs(intBitsToFloat(R124i.z))) + 0.0);
R123i.z = ((R126i.w == 0)?(R123i.x):(R5i.z));
R123i.w = ((R126i.w == 0)?(R123i.y):(R5i.y));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R124i.z));
// 12
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[34].y), intBitsToFloat(R123i.z)));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[34].x), intBitsToFloat(R123i.w)));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) * 2.0);
R126i.w = ((intBitsToFloat(PV1ix) == 0.0)?(0):(PV1iy));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[33].z));
// 13
PV1ix = floatBitsToInt(trunc(intBitsToFloat(PV0iy)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[33].x), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(abs(intBitsToFloat(R124i.z)) + intBitsToFloat(R126i.w));
R125i.w = ((R126i.x == 0)?(0):(0x2));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[33].w));
// 14
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R127i.y)) + -(0.5));
R123i.y = ((-(intBitsToFloat(R126i.w)) > 0.0)?(PV1iz):(R126i.w));
R127i.z = (R125i.w == int(1))?-1:0;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[33].y), intBitsToFloat(PS1i)));
PS0i = int(intBitsToFloat(PV1ix));
// 15
R123i.x = ((intBitsToFloat(R124i.z) == 0.0)?(0):(R123i.y));
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[35].z) + intBitsToFloat(uf_remappedVS[34].x));
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[35].w) + intBitsToFloat(uf_remappedVS[34].y));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R126i.w)) + -(0.5));
R126i.y = floatBitsToInt(float(PS0i));
// 16
PV0ix = floatBitsToInt(-(intBitsToFloat(R126i.z)) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[36].x) + intBitsToFloat(uf_remappedVS[36].z));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[36].y) + intBitsToFloat(uf_remappedVS[36].w));
PS0i = int(intBitsToFloat(R123i.x));
// 17
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R14i.w)),intBitsToFloat(uf_remappedVS[35].x)) + -(intBitsToFloat(PV0ix)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].w),intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iw));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.w),intBitsToFloat(uf_remappedVS[35].y)) + intBitsToFloat(PV0iy));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].z),intBitsToFloat(R125i.z)) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(float(PS0i));
// 18
backupReg0i = R123i.x;
backupReg1i = R123i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.w),intBitsToFloat(uf_remappedVS[34].z)) + intBitsToFloat(R123i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.w),intBitsToFloat(uf_remappedVS[34].w)) + intBitsToFloat(R123i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PS1i)) + intBitsToFloat(backupReg0i));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.w)),intBitsToFloat(R126i.y)) + intBitsToFloat(backupReg1i));
PS0i = (R125i.w == 0x2)?-1:0;
// 19
backupReg0i = R123i.x;
R123i.x = ((PS0i == 0)?(R5i.x):(R5i.z));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(R124i.w)) + -(intBitsToFloat(R123i.w)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.z));
R123i.w = ((PS0i == 0)?(R5i.y):(R5i.x));
R7i.y = ((R127i.z == 0)?(R5i.x):(R5i.y));
// 20
R2i.x = ((R127i.z == 0)?(R5i.y):(R5i.z));
R1i.y = floatBitsToInt(intBitsToFloat(R0i.z) + 0.5);
R123i.z = ((R127i.z == 0)?(R123i.w):(R5i.z));
R123i.w = ((R127i.z == 0)?(R123i.x):(R5i.y));
PS0i = int(intBitsToFloat(uf_remappedVS[37].z));
// 21
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[38].w) + intBitsToFloat(uf_remappedVS[39].y));
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[38].z) + intBitsToFloat(uf_remappedVS[39].x));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].x), intBitsToFloat(R123i.w)));
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 2.0);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].y), intBitsToFloat(R123i.z)));
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 2.0);
R1i.z = floatBitsToInt(float(PS0i));
// 22
R5i.x = floatBitsToInt(-(intBitsToFloat(PV1iz)) + intBitsToFloat(PV1iy));
R5i.y = floatBitsToInt(-(intBitsToFloat(PV1iw)) + intBitsToFloat(PV1ix));
R0i.z = floatBitsToInt(-(abs(intBitsToFloat(R1i.z))) + 0.0);
R5i.w = floatBitsToInt((0.0 >= abs(intBitsToFloat(R1i.z)))?1.0:0.0);
R5i.z = floatBitsToInt(1.0 / intBitsToFloat(R1i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R14i.w)),intBitsToFloat(uf_remappedVS[38].x)) + -(intBitsToFloat(R5i.x)));
PV0iy = floatBitsToInt(intBitsToFloat(R5i.z) * 0.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.w),intBitsToFloat(uf_remappedVS[38].y)) + intBitsToFloat(R5i.y));
R124i.w = ((intBitsToFloat(R5i.w) == 0.0)?(0):(R0i.z));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[37].z));
// 1
PV1ix = floatBitsToInt(trunc(intBitsToFloat(PV0iy)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[37].x), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(abs(intBitsToFloat(R1i.z)) + intBitsToFloat(R124i.w));
R5i.w = floatBitsToInt(intBitsToFloat(R2i.y) + 0.5);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[37].w));
// 2
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w),intBitsToFloat(R127i.y)) + -(0.5));
R123i.y = ((-(intBitsToFloat(R124i.w)) > 0.0)?(PV1iz):(R124i.w));
R2i.z = floatBitsToInt(intBitsToFloat(R2i.z) + 0.5);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[37].y), intBitsToFloat(PS1i)));
PS0i = int(intBitsToFloat(PV1ix));
// 3
R123i.x = ((intBitsToFloat(R1i.z) == 0.0)?(0):(R123i.y));
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[40].x) + intBitsToFloat(uf_remappedVS[40].z));
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[40].y) + intBitsToFloat(uf_remappedVS[40].w));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R124i.w)) + -(0.5));
PS1i = floatBitsToInt(float(PS0i));
// 4
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.w)),intBitsToFloat(PS1i)) + intBitsToFloat(R127i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].w),intBitsToFloat(R2i.x)) + intBitsToFloat(PV1iz));
R1i.z = floatBitsToInt(intBitsToFloat(R0i.y) + 0.5);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].z),intBitsToFloat(R7i.y)) + intBitsToFloat(PV1iy));
PS0i = int(intBitsToFloat(R123i.x));
// 5
PV1ix = floatBitsToInt(min(intBitsToFloat(R10i.y), intBitsToFloat(uf_remappedVS[41].z)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.w),intBitsToFloat(uf_remappedVS[39].w)) + intBitsToFloat(R123i.y));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.w),intBitsToFloat(uf_remappedVS[39].z)) + intBitsToFloat(R123i.w));
R20i.w = 0;
PS1i = floatBitsToInt(float(PS0i));
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w),intBitsToFloat(uf_remappedVS[42].x)) + -(intBitsToFloat(uf_remappedVS[42].y)));
R123i.x = clampFI32(R123i.x);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(R126i.w)) + -(intBitsToFloat(R127i.x)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PS1i)) + intBitsToFloat(R126i.x));
PV0iw = floatBitsToInt(-(intBitsToFloat(R7i.w)) + intBitsToFloat(PV1ix));
R126i.y = floatBitsToInt(intBitsToFloat(R10i.y) + -(intBitsToFloat(R4i.y)));
// 7
R5i.x = floatBitsToInt(intBitsToFloat(R123i.y) + 0.5);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[41].y),intBitsToFloat(PV0iw)) + intBitsToFloat(uf_remappedVS[41].x));
R123i.y = clampFI32(R123i.y);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R125i.x)) + intBitsToFloat(R123i.z));
PV1iw = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w),intBitsToFloat(uf_remappedVS[43].x)) + -(intBitsToFloat(uf_remappedVS[43].y)));
R122i.x = clampFI32(R122i.x);
// 8
R2i.x = floatBitsToInt(intBitsToFloat(R123i.z) + 0.5);
R20i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(uf_remappedVS[44].w)));
PV0iz = floatBitsToInt(-(intBitsToFloat(R122i.x)) + 1.0);
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[45].y) + 1.0);
tempResultf = max(0.0, intBitsToFloat(PV1iw));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 9
R125i.x = floatBitsToInt(intBitsToFloat(PV0iw) * 1.5);
R125i.x = clampFI32(R125i.x);
R125i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[45].y) * 1.0 + intBitsToFloat(R9i.w));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[42].w), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(intBitsToFloat(R6i.z) * intBitsToFloat(R6i.z));
tempResultf = max(0.0, intBitsToFloat(PV0iz));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R127i.y = floatBitsToInt(tempResultf);
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R126i.y),intBitsToFloat(PV1iw),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R126i.y),1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iz)));
// 11
backupReg0i = R127i.y;
R20i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)),intBitsToFloat(uf_remappedVS[46].w)) + intBitsToFloat(uf_remappedVS[46].w));
R127i.y = floatBitsToInt(intBitsToFloat(R125i.x) * 15.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[47].x), intBitsToFloat(backupReg0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[47].y), intBitsToFloat(backupReg0i)));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iw)));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[45].x),intBitsToFloat(uf_remappedVS[45].y),intBitsToFloat(uf_remappedVS[45].z),0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R0i.y = floatBitsToInt(intBitsToFloat(PS0i) + 0.5);
// 14
R126i.w = floatBitsToInt(intBitsToFloat(PV1ix) + 0.5);
PS0i = floatBitsToInt(exp2(intBitsToFloat(R127i.z)));
// 15
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[47].z)),intBitsToFloat(PS0i)) + intBitsToFloat(uf_remappedVS[47].z));
R123i.x = clampFI32(R123i.x);
PV1iy = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
R123i.w = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 16
R10i.x = floatBitsToInt(intBitsToFloat(R123i.x) + intBitsToFloat(0x80000000));
R10i.x = clampFI32(R10i.x);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R123i.w)) + intBitsToFloat(0xbe593484));
PV0iz = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1iy)));
// 17
PV1ix = floatBitsToInt(max(intBitsToFloat(PV0iz), intBitsToFloat(0x3e4ccccd)));
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f22f983));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R123i.y)) + intBitsToFloat(0x3fc90da4));
R20i.z = R10i.x;
// 18
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),-(intBitsToFloat(R123i.w))) + 1.0);
R9i.w = floatBitsToInt(min(intBitsToFloat(PV1ix), 1.0));
}
if( activeMaskStackC[3] == true ) {
R0i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
}
if( activeMaskStackC[3] == true ) {
// 0
R21i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R9i.w)));
R9i.y = uf_remappedVS[48].x;
R21i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R9i.w)));
R21i.w = R10i.x;
R21i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R9i.w)));
// 1
R9i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[3].x) * 1.0 + 0.0);
R0i.y = 0;
PV1iw = floatBitsToInt(intBitsToFloat(R19i.y) * intBitsToFloat(R10i.w));
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R11i.w)) + intBitsToFloat(R6i.x));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(PV1iw)) + 1.0);
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R6i.y)) + intBitsToFloat(R12i.w));
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R13i.w)) + intBitsToFloat(R7i.z));
// 3
R123i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3f333333) + intBitsToFloat(0x3e19999a));
R123i.x = clampFI32(R123i.x);
// 4
PV0iz = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
// 5
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + 2.5);
// 6
R0i.x = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3daaaaab));
}
if( activeMaskStackC[3] == true ) {
R11i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].w), intBitsToFloat(uf_remappedVS[49].w)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].w), intBitsToFloat(uf_remappedVS[49].z)));
}
if( activeMaskStackC[3] == true ) {
// 0
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[31].y),intBitsToFloat(R3i.z)) + intBitsToFloat(R1i.y));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].y), intBitsToFloat(R0i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[31].y), intBitsToFloat(R0i.x)));
// 1
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(uf_remappedVS[50].w)) + intBitsToFloat(R5i.w));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].y),intBitsToFloat(R3i.z)) + intBitsToFloat(R2i.z));
R10i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[50].w),intBitsToFloat(PV0iy)) + intBitsToFloat(R1i.z));
// 2
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].y),intBitsToFloat(R3i.z)) + intBitsToFloat(R2i.x));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].y), intBitsToFloat(R0i.x)));
// 3
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[50].w),intBitsToFloat(PV0iz)) + intBitsToFloat(R5i.x));
// 4
R0i.x = R8i.x;
R0i.y = R8i.y;
R0i.z = R8i.z;
R0i.w = R8i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R21i.x), intBitsToFloat(R21i.y), intBitsToFloat(R21i.z), intBitsToFloat(R21i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.z));
// export
passParameterSem9 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.z));
}
