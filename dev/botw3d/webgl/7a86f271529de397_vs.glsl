#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 7a86f271529de397
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[43];
TEXTURE_LAYOUT(45, 0, 0) uniform sampler2D textureUnitVS13;
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
out vec4 passParameterSem12;
out vec4 passParameterSem14;
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
R4i.w = floatBitsToInt(1.0);
// 1
R2i.w = floatBitsToInt(-(intBitsToFloat(R2i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R7i.w = floatBitsToInt(-(intBitsToFloat(R7i.x)) + 1.0);
// 2
predResult = (0.0 > intBitsToFloat(R2i.w));
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
R9i.x = 0;
// 1
R9i.w = R4i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R9i.w = R3i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R9i.w == 0);
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
predResult = (intBitsToFloat(R2i.w) >= intBitsToFloat(R13i.x));
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
R9i.x = 0;
// 1
R10i.x = R10i.x;
R10i.y = R10i.y;
R10i.z = R10i.z;
R10i.w = R12i.w;
// 2
R3i.w = R4i.w;
}
activeMaskStack[2] = activeMaskStack[2] == false;
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R10i.x = R12i.x;
R10i.y = R12i.y;
R10i.z = R12i.z;
R10i.w = R12i.w;
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
R1i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(R2i.w));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(uf_remappedVS[3].w)));
// 2
R0i.x = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV1iz));
// 3
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[2].x)));
// 4
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(uf_remappedVS[3].y)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[3].z)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R9i.y = ((intBitsToFloat(uf_remappedVS[4].x) == 1.0)?-1:0);
R10i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].x)) + 1.0);
// 1
predResult = (R9i.y != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(R1i.w)));
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
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PS1i)));
R127i.y = ((intBitsToFloat(uf_remappedVS[4].x) == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R10i.z));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R1i.w) + -(intBitsToFloat(PV1iz)));
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
R0i.x = 0x3f800000;
PV0iy = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(R5i.y));
PV0iz = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(R5i.z));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R0i.z)));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[4].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(R5i.z));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) * 0.5);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) * 0.5);
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(R10i.z));
// 2
R10i.x = floatBitsToInt(intBitsToFloat(R5i.x) + -(0.5));
R127i.y = floatBitsToInt(intBitsToFloat(PV1iy) + -(0.5));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + -(0.5));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) * 0.5);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iz)));
// 3
PV1ix = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R126i.y = floatBitsToInt(intBitsToFloat(PV0iw) + -(0.5));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) * 2.0);
R0i.z = floatBitsToInt(intBitsToFloat(R5i.y) + -(0.5));
R3i.w = floatBitsToInt(intBitsToFloat(R5i.z) + -(0.5));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(uf_remappedVS[6].x)));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(uf_remappedVS[6].y)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(R127i.w));
R0i.w = floatBitsToInt(intBitsToFloat(PS1i) + intBitsToFloat(uf_remappedVS[7].x));
// 5
R9i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].y) + intBitsToFloat(PV0ix));
R123i.y = ((R9i.y == 0)?(PV0iz):(R1i.w));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(uf_remappedVS[6].z)));
// 6
backupReg0i = R2i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.y)));
R2i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].z) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R123i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R123i.y)));
PS0i = uf_remappedVS[8].x & 0x10000;
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV0ix));
R127i.z = uf_remappedVS[8].x & 0x20000;
PV1iw = floatBitsToInt(intBitsToFloat(R6i.z) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(float(PS0i));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
// 9
R1i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV0iz));
R1i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV0iy));
R1i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(float(R127i.z));
// 10
PV0ix = uf_remappedVS[8].x & 0x40000;
PV0iy = R5i.y;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R126i.y = int(intBitsToFloat(PV1iw));
// 11
PV1ix = 0 - R126i.y;
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
R127i.z = floatBitsToInt(floor(intBitsToFloat(PV0iy)));
R127i.w = R5i.z;
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
PS1i = floatBitsToInt(float(PV0ix));
// 12
R126i.x = floatBitsToInt((intBitsToFloat(R127i.z) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iw = max(R126i.y, PV1ix);
R127i.x = int(intBitsToFloat(PV1iy));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(R127i.z))?1.0:0.0);
PV1iz = floatBitsToInt(floor(intBitsToFloat(R127i.w)));
PV1iw = 0 - R127i.x;
R127i.z = floatBitsToInt(float(PV0iw));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 2.0);
// 14
PV0ix = floatBitsToInt((intBitsToFloat(PV1iz) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PV1iz))?1.0:0.0);
PV0iz = max(R127i.x, PV1iw);
PV0iw = floatBitsToInt(intBitsToFloat(R126i.x) + -(intBitsToFloat(PV1iy)));
R127i.w = int(intBitsToFloat(PV1ix));
// 15
R6i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.z)), intBitsToFloat(PV0iw)));
PV1iy = 0 - R127i.w;
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iy)));
PS1i = floatBitsToInt(float(PV0iz));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 16
R2i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(PV1iz)));
PV0iy = max(R127i.w, PV1iy);
// 17
R11i.x = floatBitsToInt(float(PV0iy));
R11i.x = floatBitsToInt(intBitsToFloat(R11i.x) * 2.0);
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.x)),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R1i.w = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.x)),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R6i.z = tempi.x;
PV1iw = tempi.x;
PS1i = R5i.x;
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.x)),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w))));
PV0ix = tempi.x;
R6i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(floor(intBitsToFloat(PS1i)));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R6i.x)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(R2i.x)));
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[12].y)));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(uf_remappedVS[12].x)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
R127i.z = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(PV1ix));
R126i.w = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(PV1iy));
R126i.x = floatBitsToInt(intBitsToFloat(PS1i) + 0.0);
// 5
R125i.x = floatBitsToInt(intBitsToFloat(PV0ix) + 0.0);
R126i.y = ((intBitsToFloat(uf_remappedVS[7].w) == 1.0)?-1:0);
PV1iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R11i.x)), intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(uf_remappedVS[12].z)));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[7].w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV1iz)));
R126i.z = floatBitsToInt(intBitsToFloat(PV1iw) + 0.0);
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].w)) + 1.0);
// 7
R127i.x = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(PV0iy));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 8
PV0iy = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 9
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 10
R123i.y = ((R126i.y == 0)?(PV1iz):(R2i.w));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R123i.y)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R123i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R123i.y)));
// 12
PV0iy = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV1iy));
R0i.z = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(PV1ix));
// 13
R123i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3e22f983) + 0.5);
// 14
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV0iw = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
// 15
R123i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 16
R11i.x = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
R126i.y = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
// 17
R9i.x = floatBitsToInt(sin((intBitsToFloat(R126i.y))/0.1591549367));
// 18
R3i.w = floatBitsToInt(cos((intBitsToFloat(R126i.y))/0.1591549367));
// 19
R10i.x = floatBitsToInt(sin((intBitsToFloat(R11i.x))/0.1591549367));
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(-(intBitsToFloat(R1i.w)) + intBitsToFloat(uf_remappedVS[13].x));
R126i.w = floatBitsToInt(-(intBitsToFloat(R6i.y)) + intBitsToFloat(uf_remappedVS[13].z));
// 1
R125i.x = ((-(intBitsToFloat(R126i.x)) == 0.0)?-1:0);
R124i.y = ((intBitsToFloat(R126i.w) == 0.0)?-1:0);
PV1iz = floatBitsToInt((0.0 > -(intBitsToFloat(R126i.x)))?1.0:0.0);
PV1iw = floatBitsToInt((-(intBitsToFloat(R126i.x)) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.w));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R126i.x)) * intBitsToFloat(PS1i));
R125i.y = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
PV0iw = ((0.0 > intBitsToFloat(R126i.w))?-1:0);
R127i.w = floatBitsToInt(cos((intBitsToFloat(R11i.x))/0.1591549367));
// 3
PV1ix = floatBitsToInt((intBitsToFloat(PV0ix) > 0.0)?1.0:0.0);
R126i.y = floatBitsToInt(max(intBitsToFloat(PV0ix), -(intBitsToFloat(PV0ix))));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PV0ix))?1.0:0.0);
R2i.y = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(0x3fc90fdb));
// 4
R125i.x = ((intBitsToFloat(R126i.y) > 1.0)?-1:0);
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iw)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.y));
// 5
R123i.x = ((R125i.x == 0)?(R126i.y):(PS0i));
R127i.y = floatBitsToInt(((R125i.x == 0)?(intBitsToFloat(PV0iz)):(-(intBitsToFloat(PV0iz)))));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3fc90fdb));
// 6
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R127i.w)));
R1i.y = floatBitsToInt(-(intBitsToFloat(R10i.x)));
PV0iz = floatBitsToInt(min(intBitsToFloat(R123i.x), 1.0));
R126i.w = ((R125i.x == 0)?(0):(PV1iz));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(R127i.w)));
// 7
R126i.y = floatBitsToInt(max(intBitsToFloat(PV0iz), -(1.0)));
// 8
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R126i.y)));
// 9
R123i.y = floatBitsToInt(intBitsToFloat(0x3d6ee04d) * intBitsToFloat(R125i.x) + intBitsToFloat(0x3f43b24e));
R123i.w = floatBitsToInt(intBitsToFloat(0x3edcf805) * intBitsToFloat(R125i.x) + 1.0);
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R123i.y)) + 1.0);
R126i.z = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R126i.y)), intBitsToFloat(R123i.w)));
// 11
PV1ix = uf_remappedVS[14].y;
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) / 2.0);
PV1iy = uf_remappedVS[14].x;
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) / 2.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.x));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV1iy));
// 13
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.x), intBitsToFloat(PV0iw)));
R123i.y = ((intBitsToFloat(R126i.y) > 0.0)?(PV0iz):(floatBitsToInt(-(intBitsToFloat(PV0iz)))));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PV0ix)));
// 14
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R123i.y)) + intBitsToFloat(R126i.w));
// 15
PV1ix = floatBitsToInt((intBitsToFloat(R125i.x) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(R125i.x))?1.0:0.0);
// 16
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iw)));
// 17
PV1ix = floatBitsToInt(-(intBitsToFloat(R125i.y)) + intBitsToFloat(PV0iz));
// 18
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3fc90fdb));
// 19
PV1iz = floatBitsToInt(intBitsToFloat(R125i.x) + -(intBitsToFloat(PV0iw)));
// 20
R123i.y = ((R127i.z == 0)?(PV1iz):(0x40490fdb));
// 21
R123i.x = ((R124i.y == 0)?(R123i.y):(R2i.y));
// 22
PV0iz = floatBitsToInt(intBitsToFloat(R0i.z) + -(intBitsToFloat(R123i.x)));
// 23
R123i.z = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e22f983) + 0.5);
// 24
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
// 25
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 26
R126i.w = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 27
PS1i = floatBitsToInt(sin((intBitsToFloat(R126i.w))/0.1591549367));
// 28
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R127i.w)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(PS1i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(cos((intBitsToFloat(R126i.w))/0.1591549367));
// 29
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(R124i.y)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R127i.w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(R127i.z)));
// 30
R126i.x = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(PV1iw)));
R126i.z = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R125i.x)));
// 31
R10i.x = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R126i.x)));
R127i.z = floatBitsToInt(-(intBitsToFloat(R124i.y)) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R126i.z)));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R1i.y)) + intBitsToFloat(PS0i));
// 32
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R124i.z)) + intBitsToFloat(R122i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R125i.w)) + intBitsToFloat(PV1iw));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R127i.x)) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R4i.w)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R4i.w)));
// 33
backupReg0i = R123i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R125i.w)) + intBitsToFloat(PS0i));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R1i.y)) + intBitsToFloat(PV0iw));
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R10i.x)) + intBitsToFloat(backupReg0i));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R4i.w)));
// 34
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(backupReg0i)) + intBitsToFloat(PS1i));
PV0iz = floatBitsToInt((intBitsToFloat(uf_remappedVS[15].z) > 0.0)?1.0:0.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R124i.z)) + intBitsToFloat(R123i.z));
PS0i = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[15].z))?1.0:0.0);
// 35
R1i.x = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(R123i.w));
R1i.y = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PS0i)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R10i.x)) + intBitsToFloat(R123i.y));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[15].z));
// 36
R3i.x = floatBitsToInt(intBitsToFloat(R2i.w) * intBitsToFloat(PS1i));
R10i.y = floatBitsToInt(intBitsToFloat(R6i.z) + intBitsToFloat(R123i.z));
R1i.z = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(R127i.x));
R0i.w = 0x3f800000;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R13i.x));
// 37
R12i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R10i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),intBitsToFloat(uf_remappedVS[16].w))));
PV1iy = R12i.x;
PV1iz = R12i.x;
PV1iw = R12i.x;
R4i.w = floatBitsToInt(intBitsToFloat(R2i.w) * intBitsToFloat(PS0i));
// 38
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R10i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[17].x),intBitsToFloat(uf_remappedVS[17].y),intBitsToFloat(uf_remappedVS[17].z),intBitsToFloat(uf_remappedVS[17].w))));
PV0ix = tempi.x;
R12i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R3i.z = floatBitsToInt(-(intBitsToFloat(R1i.y)) + 1.0);
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R10i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[18].x),intBitsToFloat(uf_remappedVS[18].y),intBitsToFloat(uf_remappedVS[18].z),intBitsToFloat(uf_remappedVS[18].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R12i.z = tempi.x;
PV0iw = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R10i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[19].x),intBitsToFloat(uf_remappedVS[19].y),intBitsToFloat(uf_remappedVS[19].z),intBitsToFloat(uf_remappedVS[19].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R12i.w = tempi.x;
// 2
PV0ix = PV1ix;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
R6i.y = uf_remappedVS[20].y;
R6i.z = uf_remappedVS[20].x;
R1i.w = uf_remappedVS[20].z;
// 3
R10i.x = uf_remappedVS[21].x;
R15i.z = floatBitsToInt(intBitsToFloat(R12i.z) * 0.5 + intBitsToFloat(PV0ix));
R123i.w = floatBitsToInt(intBitsToFloat(R12i.z) * 0.0 + intBitsToFloat(PV0ix));
R15i.w = floatBitsToInt(intBitsToFloat(R12i.z) * 0.0 + intBitsToFloat(R12i.w));
// 4
R15i.x = floatBitsToInt(intBitsToFloat(R12i.x) * 0.5 + intBitsToFloat(R123i.w));
R15i.y = floatBitsToInt(intBitsToFloat(R12i.y) * -(0.5) + intBitsToFloat(R123i.w));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[22].x)) + intBitsToFloat(uf_remappedVS[23].x));
R125i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[22].y)) + intBitsToFloat(uf_remappedVS[23].y));
// 5
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[22].z)) + intBitsToFloat(uf_remappedVS[23].z));
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[22].w)) + intBitsToFloat(uf_remappedVS[23].w));
// 6
R124i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[23].y)) + intBitsToFloat(uf_remappedVS[24].y));
R125i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[23].x)) + intBitsToFloat(uf_remappedVS[24].x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 7
R9i.x = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(PS0i));
R3i.y = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS0i));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[23].z)) + intBitsToFloat(uf_remappedVS[24].z));
R3i.w = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[23].w)) + intBitsToFloat(uf_remappedVS[24].w));
// 8
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 9
R4i.x = floatBitsToInt(intBitsToFloat(R124i.y) * intBitsToFloat(PS0i));
R2i.y = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(PS0i));
R0i.w = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS0i));
}
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(uf_remappedVS[25].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(uf_remappedVS[25].y)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(uf_remappedVS[25].z)));
R16i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(uf_remappedVS[25].w)));
// 1
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[26].x)));
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[26].x)));
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[26].x)));
}
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R3i.x;
R3i.x = uf_remappedVS[27].x;
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(uf_remappedVS[28].w)) + intBitsToFloat(backupReg0i));
// 1
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
// 2
PV0ix = uf_remappedVS[8].x & 0x80000;
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PV1iy)));
// 3
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(R3i.z)) + intBitsToFloat(PV0iy));
R127i.y = (PV0ix == 0x80000)?-1:0;
// 4
R127i.x = floatBitsToInt(intBitsToFloat(R124i.x) + -(intBitsToFloat(uf_remappedVS[23].w)));
R124i.y = ((intBitsToFloat(R5i.x) > 0.5)?-1:0);
PV0iw = floatBitsToInt(intBitsToFloat(R124i.x) + -(intBitsToFloat(uf_remappedVS[22].w)));
// 5
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R3i.w)) + intBitsToFloat(uf_remappedVS[22].z));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R9i.x)) + intBitsToFloat(uf_remappedVS[22].y));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R3i.y)) + intBitsToFloat(uf_remappedVS[22].x));
R125i.w = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.z = ((intBitsToFloat(R127i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 6
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R0i.w)) + intBitsToFloat(uf_remappedVS[23].z));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R4i.x)) + intBitsToFloat(uf_remappedVS[23].y));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R2i.y)) + intBitsToFloat(uf_remappedVS[23].x));
PV0iw = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
R127i.w = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
// 7
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(uf_remappedVS[24].w)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[22].x), intBitsToFloat(R127i.w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[22].y), intBitsToFloat(R127i.w)));
R122i.x = ((R124i.y == 0)?(R7i.x):(R7i.w));
// 8
backupReg0i = R127i.z;
backupReg1i = R127i.w;
R125i.x = ((intBitsToFloat(PV1iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
R3i.y = ((R127i.y == 0)?(R7i.x):(R122i.x));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R124i.x)) + intBitsToFloat(PV1iw));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R124i.x)) + intBitsToFloat(PV1iz));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[22].z), intBitsToFloat(backupReg1i)));
// 9
PV1ix = uf_remappedVS[8].x & 0x100000;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R124i.x)) + intBitsToFloat(PS0i));
PV1iz = ((intBitsToFloat(R5i.y) > 0.5)?-1:0);
PV1iw = floatBitsToInt(-(intBitsToFloat(R125i.x)) + 1.0);
PS1i = uf_remappedVS[8].x & 0x200000;
// 10
R126i.x = (PS1i == 0x200000)?-1:0;
R123i.y = ((PV1iz == 0)?(R7i.y):(R7i.z));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PV1iw)));
PV0iw = (PV1ix == 0x100000)?-1:0;
PS0i = ((intBitsToFloat(R5i.z) > 0.5)?-1:0);
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(PV0iz)) + intBitsToFloat(R127i.w));
R1i.y = ((PV0iw == 0)?(R7i.y):(R123i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PV0iz)) + intBitsToFloat(R127i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(PV0iz)) + intBitsToFloat(R127i.z));
R122i.x = ((PS0i == 0)?(R7i.x):(R7i.w));
// 12
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[24].y),intBitsToFloat(R125i.x)) + intBitsToFloat(R123i.w));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[24].x),intBitsToFloat(R125i.x)) + intBitsToFloat(R123i.x));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[24].z),intBitsToFloat(R125i.x)) + intBitsToFloat(R123i.z));
R0i.w = ((R126i.x == 0)?(R7i.x):(R122i.x));
PS0i = ((intBitsToFloat(R5i.w) > 0.5)?-1:0);
// 13
PV1ix = ((intBitsToFloat(R5i.y) > 0.5)?-1:0);
PV1iy = uf_remappedVS[8].x & 0x800000;
PV1iz = uf_remappedVS[8].x & 0x400000;
R127i.w = ((PS0i == 0)?(R7i.y):(R7i.z));
PS1i = uf_remappedVS[8].x & 0x1000000;
// 14
PV0ix = (PV1iy == 0x800000)?-1:0;
PV0iy = (PV1iz == 0x400000)?-1:0;
R123i.z = ((PV1ix == 0)?(R7i.x):(R7i.w));
R125i.w = (PS1i == 0x1000000)?-1:0;
PS0i = ((intBitsToFloat(R5i.z) > 0.5)?-1:0);
// 15
R123i.x = ((PS0i == 0)?(R7i.y):(R7i.z));
R6i.y = ((PV0ix == 0)?(R7i.x):(R123i.z));
R0i.z = ((PV0iy == 0)?(R7i.y):(R127i.w));
PV1iw = uf_remappedVS[8].y & int(1);
// 16
R7i.x = ((R125i.w == 0)?(R7i.y):(R123i.x));
R6i.z = (int(1) != PV1iw)?-1:0;
}
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(uf_remappedVS[29].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(uf_remappedVS[29].y)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(uf_remappedVS[29].z)));
R17i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(uf_remappedVS[29].w)));
// 1
R17i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[26].x), intBitsToFloat(R0i.x)));
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[26].x), intBitsToFloat(R0i.y)));
R17i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[26].x), intBitsToFloat(R2i.z)));
PS1i = int(intBitsToFloat(uf_remappedVS[30].z));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(uf_remappedVS[31].x)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(uf_remappedVS[31].y)));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[32].w) + intBitsToFloat(uf_remappedVS[31].y));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[32].z) + intBitsToFloat(uf_remappedVS[31].x));
R126i.x = floatBitsToInt(float(PS1i));
// 3
PV1ix = floatBitsToInt(-(abs(intBitsToFloat(R126i.x))) + 0.0);
PV1iy = floatBitsToInt((0.0 >= abs(intBitsToFloat(R126i.x)))?1.0:0.0);
PV1iz = floatBitsToInt(-(intBitsToFloat(PV0ix)) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(-(intBitsToFloat(PV0iy)) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 4
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.w)),intBitsToFloat(uf_remappedVS[32].x)) + -(intBitsToFloat(PV1iz)));
R127i.y = ((intBitsToFloat(PV1iy) == 0.0)?(0):(PV1ix));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(uf_remappedVS[32].y)) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[30].z));
// 5
PV1ix = floatBitsToInt(abs(intBitsToFloat(R126i.x)) + intBitsToFloat(R127i.y));
R126i.y = ((R6i.z == 0)?(0):(int(1)));
PV1iz = floatBitsToInt(trunc(intBitsToFloat(PV0iw)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[30].x), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[30].w));
// 6
backupReg0i = R127i.y;
R127i.x = (R126i.y == int(1))?-1:0;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[30].y), intBitsToFloat(PS1i)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R125i.w)) + -(0.5));
R123i.w = ((-(intBitsToFloat(backupReg0i)) > 0.0)?(PV1ix):(backupReg0i));
PS0i = int(intBitsToFloat(PV1iz));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[33].x) + intBitsToFloat(uf_remappedVS[33].z));
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[33].y) + intBitsToFloat(uf_remappedVS[33].w));
R123i.z = ((intBitsToFloat(R126i.x) == 0.0)?(0):(R123i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R127i.y)) + -(0.5));
PS1i = floatBitsToInt(float(PS0i));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(uf_remappedVS[33].z)) + intBitsToFloat(PV1ix));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)),intBitsToFloat(PS1i)) + intBitsToFloat(R127i.z));
PV0iz = (R126i.y == 0x2)?-1:0;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(uf_remappedVS[33].w)) + intBitsToFloat(PV1iy));
PS0i = int(intBitsToFloat(R123i.z));
// 9
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(uf_remappedVS[31].z)) + intBitsToFloat(R123i.x));
R123i.y = ((PV0iz == 0)?(R5i.x):(R5i.z));
R123i.z = ((PV0iz == 0)?(R5i.y):(R5i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(uf_remappedVS[31].w)) + intBitsToFloat(R123i.w));
PS1i = floatBitsToInt(float(PS0i));
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(PS1i)) + intBitsToFloat(R125i.x));
R123i.y = ((R127i.x == 0)?(R123i.y):(R5i.y));
R123i.z = ((R127i.x == 0)?(R123i.z):(R5i.z));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R127i.w)) + -(intBitsToFloat(R127i.y)));
R125i.w = ((R127i.x == 0)?(R5i.x):(R5i.y));
// 11
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R124i.z)) + intBitsToFloat(R123i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[34].x), intBitsToFloat(R123i.y)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
R127i.z = ((R127i.x == 0)?(R5i.y):(R5i.z));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[34].y), intBitsToFloat(R123i.z)));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
PS1i = int(intBitsToFloat(uf_remappedVS[35].z));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[36].w) + intBitsToFloat(uf_remappedVS[34].y));
R124i.z = ((R6i.z == 0)?(0):(0x2));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[36].z) + intBitsToFloat(uf_remappedVS[34].x));
R127i.x = floatBitsToInt(float(PS1i));
// 13
PV1ix = floatBitsToInt(-(abs(intBitsToFloat(R127i.x))) + 0.0);
PV1iy = floatBitsToInt((0.0 >= abs(intBitsToFloat(R127i.x)))?1.0:0.0);
PV1iz = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(-(intBitsToFloat(R127i.w)) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 14
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.w)),intBitsToFloat(uf_remappedVS[36].x)) + -(intBitsToFloat(PV1iz)));
R127i.y = ((intBitsToFloat(PV1iy) == 0.0)?(0):(PV1ix));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(uf_remappedVS[36].y)) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[35].z));
// 15
PV1ix = floatBitsToInt(abs(intBitsToFloat(R127i.x)) + intBitsToFloat(R127i.y));
R126i.y = (R124i.z == int(1))?-1:0;
PV1iz = floatBitsToInt(trunc(intBitsToFloat(PV0iw)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].x), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[35].w));
// 16
backupReg0i = R127i.y;
R126i.x = (R124i.z == 0x2)?-1:0;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].y), intBitsToFloat(PS1i)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R127i.w)) + -(0.5));
R123i.w = ((-(intBitsToFloat(backupReg0i)) > 0.0)?(PV1ix):(backupReg0i));
PS0i = int(intBitsToFloat(PV1iz));
// 17
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[37].x) + intBitsToFloat(uf_remappedVS[37].z));
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[37].y) + intBitsToFloat(uf_remappedVS[37].w));
R123i.z = ((intBitsToFloat(R127i.x) == 0.0)?(0):(R123i.w));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R127i.y)) + -(0.5));
PS1i = floatBitsToInt(float(PS0i));
// 18
backupReg0i = R123i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)),intBitsToFloat(PS1i)) + intBitsToFloat(R125i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[37].z),intBitsToFloat(R125i.w)) + intBitsToFloat(PV1ix));
R123i.z = ((R126i.x == 0)?(R5i.x):(R5i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[37].w),intBitsToFloat(R127i.z)) + intBitsToFloat(PV1iy));
PS0i = int(intBitsToFloat(backupReg0i));
// 19
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(uf_remappedVS[34].z)) + intBitsToFloat(R123i.y));
R127i.y = ((R126i.y == 0)?(R123i.z):(R5i.y));
R123i.z = ((backupReg0i == 0)?(R5i.y):(R5i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(uf_remappedVS[34].w)) + intBitsToFloat(R123i.w));
PS1i = floatBitsToInt(float(PS0i));
// 20
backupReg0i = R5i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PS1i)) + intBitsToFloat(R125i.x));
R123i.y = ((R126i.y == 0)?(R123i.z):(backupReg0i));
R5i.z = ((R126i.y == 0)?(R5i.x):(R5i.y));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R126i.w)) + -(intBitsToFloat(R127i.x)));
R0i.z = ((R126i.y == 0)?(R5i.y):(backupReg0i));
// 21
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R124i.z)) + intBitsToFloat(R123i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].x), intBitsToFloat(R127i.y)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].y), intBitsToFloat(R123i.y)));
R124i.z = floatBitsToInt(intBitsToFloat(R124i.z) * 2.0);
PS1i = int(intBitsToFloat(uf_remappedVS[39].z));
// 22
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[40].w) + intBitsToFloat(uf_remappedVS[38].y));
R5i.y = floatBitsToInt(intBitsToFloat(R6i.w) * 1.0);
R2i.z = 0;
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[40].z) + intBitsToFloat(uf_remappedVS[38].x));
R4i.x = floatBitsToInt(float(PS1i));
// 23
PV1ix = floatBitsToInt(-(abs(intBitsToFloat(R4i.x))) + 0.0);
PV1iy = floatBitsToInt((0.0 >= abs(intBitsToFloat(R4i.x)))?1.0:0.0);
PV1iz = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(-(intBitsToFloat(R124i.z)) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R4i.x));
// 24
R10i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.w)),intBitsToFloat(uf_remappedVS[40].x)) + -(intBitsToFloat(PV1iz)));
R1i.y = ((intBitsToFloat(PV1iy) == 0.0)?(0):(PV1ix));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(uf_remappedVS[40].y)) + intBitsToFloat(PV1iw));
R5i.w = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
R5i.x = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[39].z));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(abs(intBitsToFloat(R4i.x)) + intBitsToFloat(R1i.y));
R126i.y = floatBitsToInt(intBitsToFloat(R5i.y) * 0.25 + 0.5);
R126i.y = clampFI32(R126i.y);
PV0iz = floatBitsToInt(trunc(intBitsToFloat(R5i.w)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].x), intBitsToFloat(R5i.x)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[39].w));
// 1
R14i.x = floatBitsToInt(intBitsToFloat(R3i.x) + 0.5);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].y), intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R127i.w)) + -(0.5));
R123i.w = ((-(intBitsToFloat(R1i.y)) > 0.0)?(PV0ix):(R1i.y));
PS1i = int(intBitsToFloat(PV0iz));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[41].x) + intBitsToFloat(uf_remappedVS[41].z));
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[41].y) + intBitsToFloat(uf_remappedVS[41].w));
R123i.z = ((intBitsToFloat(R4i.x) == 0.0)?(0):(R123i.w));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(R127i.y)) + -(0.5));
PS0i = floatBitsToInt(float(PS1i));
// 3
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)),intBitsToFloat(PS0i)) + intBitsToFloat(R6i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[41].z),intBitsToFloat(R5i.z)) + intBitsToFloat(PV0ix));
R124i.z = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[41].w),intBitsToFloat(R0i.z)) + intBitsToFloat(PV0iy));
PS1i = int(intBitsToFloat(R123i.z));
// 4
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(uf_remappedVS[38].z)) + intBitsToFloat(R123i.y));
R14i.y = floatBitsToInt(intBitsToFloat(R3i.w) + 0.5);
R14i.z = floatBitsToInt(intBitsToFloat(R9i.x) + 0.5);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(uf_remappedVS[38].w)) + intBitsToFloat(R123i.w));
PS0i = floatBitsToInt(float(PS1i));
// 5
backupReg0i = R124i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PS0i)) + intBitsToFloat(R10i.x));
R9i.y = uf_remappedVS[42].x;
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R126i.w)) + -(intBitsToFloat(R126i.x)));
R14i.w = floatBitsToInt(intBitsToFloat(R0i.w) + 0.5);
PS1i = floatBitsToInt(intBitsToFloat(backupReg0i) + 8.5);
// 6
R2i.x = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3daaaaab));
R0i.y = 0;
R0i.z = 0x3d2aaaab;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.x));
// 7
R18i.x = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
R18i.y = floatBitsToInt(intBitsToFloat(R124i.z) + 0.5);
R11i.z = R4i.y;
R11i.y = R6i.w;
}
if( activeMaskStackC[3] == true ) {
R19i.xyz = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.z))).xyz);
R19i.w = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R0i.z),intBitsToFloat(R0i.y))).z);
}
if( activeMaskStackC[3] == true ) {
// 0
R9i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[3].x) * 1.0 + 0.0);
// 1
R0i.x = R8i.x;
R0i.y = R8i.y;
R0i.z = R8i.z;
R0i.w = R8i.w;
// 2
R20i.x = R1i.x;
R20i.y = R10i.y;
R20i.z = R1i.z;
R20i.w = R10i.w;
}
activeMaskStack[2] = activeMaskStack[2] == false;
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R12i.x = R10i.x;
R12i.y = R10i.y;
R12i.z = R10i.z;
R12i.w = R10i.w;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));
// export
passParameterSem12 = vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.z));
// export
passParameterSem9 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.z));
}
