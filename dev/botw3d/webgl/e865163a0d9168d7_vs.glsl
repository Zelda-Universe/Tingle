#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader e865163a0d9168d7
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[54];
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
R9i.z = floatBitsToInt(-(intBitsToFloat(R7i.y)) + 1.0);
R3i.w = 0;
R4i.w = floatBitsToInt(1.0);
// 1
R7i.w = floatBitsToInt(-(intBitsToFloat(R2i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R9i.w = floatBitsToInt(-(intBitsToFloat(R7i.x)) + 1.0);
// 2
predResult = (0.0 > intBitsToFloat(R7i.w));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R14i.x = 0;
R14i.y = 0;
R14i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R12i.x = 0;
// 1
R2i.w = R4i.w;
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
R9i.x = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R7i.w) >= intBitsToFloat(R9i.x));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R14i.x = 0;
R14i.y = 0;
R14i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R12i.x = 0;
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
PV0ix = floatBitsToInt(max(intBitsToFloat(R5i.x), 0.0));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(uf_remappedVS[2].y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(uf_remappedVS[2].z)));
// 1
PV1iw = floatBitsToInt(min(intBitsToFloat(PV0ix), 0.0));
R1i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(R7i.w));
// 2
R0i.x = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV1iw));
// 3
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[2].x)));
// 4
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(uf_remappedVS[3].y)));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(uf_remappedVS[3].z)));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(uf_remappedVS[3].w)));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(uf_remappedVS[3].y)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R10i.y = ((intBitsToFloat(uf_remappedVS[4].x) == 1.0)?-1:0);
R0i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].x)) + 1.0);
// 1
predResult = (R10i.y != 0);
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
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R0i.z));
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
PV0ix = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(R5i.z));
PV0iy = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(R5i.z));
PV0iz = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(R5i.y));
R0i.w = 0x3f800000;
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[4].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) * 0.5);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * 0.5);
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) * 0.5);
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R0i.z));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) + -(0.5));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
R0i.y = floatBitsToInt(intBitsToFloat(R5i.x) + -(0.5));
R127i.z = floatBitsToInt(intBitsToFloat(PV1iz) + -(0.5));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 2.0);
PV0iw = floatBitsToInt(intBitsToFloat(PV1iw) + -(0.5));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
// 3
R0i.x = floatBitsToInt(intBitsToFloat(R5i.y) + -(0.5));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedVS[6].x)));
PV1iz = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R4i.w = floatBitsToInt(intBitsToFloat(R5i.z) + -(0.5));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedVS[6].y)));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(R127i.y));
R9i.y = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(uf_remappedVS[7].x));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(uf_remappedVS[6].z)));
R3i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].y) + intBitsToFloat(PS1i));
// 5
backupReg0i = R10i.y;
PV1ix = uf_remappedVS[8].x & 0x10000;
R10i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].z) + intBitsToFloat(PV0iz));
R127i.z = uf_remappedVS[8].x & 0x20000;
R123i.w = ((backupReg0i == 0)?(PV0ix):(R1i.w));
R126i.z = uf_remappedVS[8].x & 0x40000;
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R123i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R123i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.w)));
PS0i = floatBitsToInt(float(PV1ix));
// 7
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt(intBitsToFloat(R6i.z) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
// 8
PV0ix = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1iz)));
R127i.z = floatBitsToInt(float(R127i.z));
// 9
R1i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV0iy));
R1i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV0iw));
R1i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0iz));
R126i.w = floatBitsToInt((intBitsToFloat(R127i.z) > 0.0)?1.0:0.0);
R127i.w = int(intBitsToFloat(PV0ix));
// 10
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(R127i.z))?1.0:0.0);
PV0iy = R5i.y;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
PV0iz = 0 - R127i.w;
R125i.w = R5i.z;
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) * 2.0);
PS0i = floatBitsToInt(float(R126i.z));
// 11
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = max(R127i.w, PV0iz);
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R127i.w = floatBitsToInt(intBitsToFloat(R126i.w) + -(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(floor(intBitsToFloat(PV0iy)));
// 12
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iy = floatBitsToInt(floor(intBitsToFloat(R125i.w)));
R127i.z = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iz)));
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R127i.x = floatBitsToInt(float(PV1iy));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
// 13
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PV0iy))?1.0:0.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt((intBitsToFloat(PV0iy) > 0.0)?1.0:0.0);
R126i.z = int(intBitsToFloat(R127i.w));
// 14
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1ix)));
PV0iy = 0 - R126i.z;
R6i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)), intBitsToFloat(PV1iy)));
R127i.y = int(intBitsToFloat(R127i.z));
// 15
PV1ix = max(R126i.z, PV0iy);
PV1iy = 0 - R127i.y;
// 16
PV0iw = max(R127i.y, PV1iy);
PS0i = floatBitsToInt(float(PV1ix));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 17
R1i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(R127i.x)));
R2i.z = floatBitsToInt(float(PV0iw));
R2i.z = floatBitsToInt(intBitsToFloat(R2i.z) * 2.0);
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w))));
PV0ix = tempi.x;
R6i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
R6i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w))));
PV1iy = R6i.x;
PV1iz = R6i.x;
PV1iw = R6i.x;
PS1i = R5i.x;
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R0i.w = tempi.x;
PS0i = floatBitsToInt(floor(intBitsToFloat(PS1i)));
// 3
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(R6i.z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R1i.w)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[12].x)));
// 4
R127i.x = floatBitsToInt(intBitsToFloat(R9i.y) + intBitsToFloat(PV1iz));
R126i.y = floatBitsToInt(intBitsToFloat(R3i.w) + intBitsToFloat(PV1iw));
R125i.z = floatBitsToInt(intBitsToFloat(PS1i) + 0.0);
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[12].y)));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.z)), intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(uf_remappedVS[12].z)));
R127i.z = floatBitsToInt(intBitsToFloat(PS0i) + 0.0);
R127i.w = ((intBitsToFloat(uf_remappedVS[7].w) == 1.0)?-1:0);
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[7].w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 6
R126i.x = floatBitsToInt(intBitsToFloat(PV1iy) + 0.0);
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].w)) + 1.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(PV1ix)));
// 7
R126i.z = floatBitsToInt(intBitsToFloat(R10i.y) + intBitsToFloat(PV0iw));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
// 8
PV0iw = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(PS0i));
// 10
R123i.w = ((R127i.w == 0)?(PV1ix):(R7i.w));
// 11
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R123i.w)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R123i.w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R123i.w)));
// 12
R1i.x = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV1iz));
PV0iw = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV1iw));
// 13
R123i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.z = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3e22f983) + 0.5);
// 14
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
// 15
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 16
R0i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R127i.w = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 17
R2i.z = floatBitsToInt(sin((intBitsToFloat(R127i.w))/0.1591549367));
// 18
R10i.y = floatBitsToInt(cos((intBitsToFloat(R127i.w))/0.1591549367));
// 19
R6i.z = floatBitsToInt(sin((intBitsToFloat(R0i.x))/0.1591549367));
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.y = floatBitsToInt(-(intBitsToFloat(R0i.w)) + intBitsToFloat(uf_remappedVS[13].z));
R127i.z = floatBitsToInt(-(intBitsToFloat(R6i.y)) + intBitsToFloat(uf_remappedVS[13].x));
// 1
PV1ix = floatBitsToInt((0.0 > -(intBitsToFloat(R127i.z)))?1.0:0.0);
PV1iy = floatBitsToInt((-(intBitsToFloat(R127i.z)) > 0.0)?1.0:0.0);
R125i.z = ((-(intBitsToFloat(R127i.z)) == 0.0)?-1:0);
R124i.w = ((intBitsToFloat(R126i.y) == 0.0)?-1:0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.y));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.z)) * intBitsToFloat(PS1i));
PV0iy = ((0.0 > intBitsToFloat(R126i.y))?-1:0);
R126i.w = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1ix)));
R127i.y = floatBitsToInt(cos((intBitsToFloat(R0i.x))/0.1591549367));
// 3
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PV0ix))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(PV0ix) > 0.0)?1.0:0.0);
R127i.w = floatBitsToInt(max(intBitsToFloat(PV0ix), -(intBitsToFloat(PV0ix))));
R4i.w = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0x3fc90fdb));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iy)));
R125i.z = ((intBitsToFloat(R127i.w) > 1.0)?-1:0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3fc90fdb));
R123i.z = ((R125i.z == 0)?(R127i.w):(PS0i));
R125i.w = floatBitsToInt(((R125i.z == 0)?(intBitsToFloat(PV0ix)):(-(intBitsToFloat(PV0ix)))));
// 6
PV0ix = floatBitsToInt(min(intBitsToFloat(R123i.z), 1.0));
R126i.y = ((R125i.z == 0)?(0):(PV1ix));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(R127i.y)));
R1i.w = floatBitsToInt(-(intBitsToFloat(R6i.z)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R127i.y)));
// 7
R127i.w = floatBitsToInt(max(intBitsToFloat(PV0ix), -(1.0)));
// 8
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R127i.w)));
// 9
R123i.y = floatBitsToInt(intBitsToFloat(0x3edcf805) * intBitsToFloat(R125i.z) + 1.0);
R123i.w = floatBitsToInt(intBitsToFloat(0x3d6ee04d) * intBitsToFloat(R125i.z) + intBitsToFloat(0x3f43b24e));
// 10
R126i.x = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R127i.w)), intBitsToFloat(R123i.y)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R123i.w)) + 1.0);
// 11
R125i.x = floatBitsToInt(intBitsToFloat(R6i.y) + -(intBitsToFloat(uf_remappedVS[13].x)));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(uf_remappedVS[14].z)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.z));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS1i)));
R125i.y = floatBitsToInt(intBitsToFloat(R6i.x) + -(intBitsToFloat(uf_remappedVS[13].y)));
// 13
R127i.z = floatBitsToInt(intBitsToFloat(R0i.w) + -(intBitsToFloat(uf_remappedVS[13].z)));
R123i.w = ((intBitsToFloat(R127i.w) > 0.0)?(PV0ix):(floatBitsToInt(-(intBitsToFloat(PV0ix)))));
// 14
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R123i.w)) + intBitsToFloat(R126i.y));
// 15
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(R125i.z))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(R125i.z) > 0.0)?1.0:0.0);
// 16
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iy)));
// 17
PV1iz = floatBitsToInt(-(intBitsToFloat(R126i.w)) + intBitsToFloat(PV0ix));
// 18
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3fc90fdb));
// 19
PV1ix = floatBitsToInt(intBitsToFloat(R125i.z) + -(intBitsToFloat(PV0iy)));
// 20
R123i.w = ((R127i.x == 0)?(PV1ix):(0x40490fdb));
// 21
R123i.z = ((R124i.w == 0)?(R123i.w):(R4i.w));
// 22
PV0ix = floatBitsToInt(intBitsToFloat(R1i.x) + -(intBitsToFloat(R123i.z)));
// 23
R123i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iy = uf_remappedVS[14].y;
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) / 2.0);
PV1iz = uf_remappedVS[14].x;
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) / 2.0);
// 24
R1i.x = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV1iz));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
R4i.w = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV1iy));
// 25
R123i.z = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 26
R126i.y = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
// 27
tempi.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R125i.x)),-(intBitsToFloat(R125i.y)),-(intBitsToFloat(R127i.z)),intBitsToFloat(0x80000000)),vec4(-(intBitsToFloat(R125i.x)),-(intBitsToFloat(R125i.y)),-(intBitsToFloat(R127i.z)),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R124i.w = tempi.x;
PS1i = floatBitsToInt(sin((intBitsToFloat(R126i.y))/0.1591549367));
// 28
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PS1i)));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R127i.y)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(cos((intBitsToFloat(R126i.y))/0.1591549367));
// 29
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R127i.y)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R126i.w)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R127i.x)));
// 30
backupReg0i = R6i.z;
R0i.x = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1iz)));
R6i.z = floatBitsToInt(-(intBitsToFloat(PV1iz)) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1iy)));
tempResultf = 1.0 / sqrt(intBitsToFloat(R124i.w));
PS0i = floatBitsToInt(tempResultf);
// 31
R12i.x = floatBitsToInt(-(intBitsToFloat(R126i.w)) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.x)), intBitsToFloat(PS0i)));
R0i.z = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.z)), intBitsToFloat(PS0i)));
// 32
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(PS1i)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(PV1iw)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(PV1iy)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R9i.y)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R6i.z)));
// 33
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(R2i.z));
// 34
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R0i.x)));
PV0iy = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(R1i.y));
PV0iz = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(R2i.x));
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R1i.w)) + intBitsToFloat(R126i.w));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 35
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R3i.w = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 36
R9i.x = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(R1i.y));
R2i.y = 0x3f800000;
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(R127i.x));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R1i.z)) + intBitsToFloat(R125i.z));
R10i.y = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iz = floatBitsToInt(intBitsToFloat(R10i.y) * intBitsToFloat(R3i.w));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(PV0iz)));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(PV0iz)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(PV0iz)));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PV1iw)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R4i.w)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(R1i.x)));
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(PV0ix)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(PV0ix)));
R127i.z = uf_remappedVS[15].x;
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV0ix)));
R126i.z = uf_remappedVS[15].y;
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(PV1iw));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R1i.z)) + intBitsToFloat(PV1ix));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R1i.w)) + intBitsToFloat(PV1iy));
R126i.w = uf_remappedVS[15].z;
R124i.w = uf_remappedVS[16].x;
// 5
backupReg0i = R123i.y;
backupReg1i = R123i.z;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(uf_remappedVS[17].x)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R12i.x)) + intBitsToFloat(R123i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R0i.z)) + intBitsToFloat(backupReg0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R11i.x)) + intBitsToFloat(backupReg1i));
// 6
R0i.x = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(R123i.w));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(uf_remappedVS[17].y)));
R6i.z = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(R123i.y));
R4i.w = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(R123i.z));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(uf_remappedVS[17].z)));
// 7
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(uf_remappedVS[18].x)));
PV1iy = floatBitsToInt(-(intBitsToFloat(R6i.x)) + intBitsToFloat(R4i.w));
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(uf_remappedVS[18].x)));
R15i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(uf_remappedVS[17].w)));
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[18].x)));
// 8
backupReg0i = R127i.x;
R127i.x = uf_remappedVS[19].x;
R125i.y = uf_remappedVS[19].y;
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(backupReg0i));
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iw)), intBitsToFloat(PV0iw)));
PV1iz = ((0.0 > intBitsToFloat(PV0iw))?-1:0);
R1i.w = uf_remappedVS[19].z;
// 10
R0i.w = ((PV1iz == 0)?(PV1ix):(PV1iy));
// 11
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[20].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(uf_remappedVS[20].y)));
}
if( activeMaskStackC[3] == true ) {
// 0
R6i.y = uf_remappedVS[21].x;
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[22].w)));
}
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R6i.y;
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(uf_remappedVS[23].y)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(uf_remappedVS[20].z)));
R16i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[20].w)));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[22].x), intBitsToFloat(R6i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[22].z), intBitsToFloat(R6i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[22].y), intBitsToFloat(R6i.y)));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(PV0iz)));
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].x), intBitsToFloat(R1i.x)));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R6i.z) + intBitsToFloat(PV1iw));
PV0iy = floatBitsToInt(intBitsToFloat(R4i.w) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV1iy));
PV0iw = ((intBitsToFloat(R5i.x) > 0.5)?-1:0);
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].x), intBitsToFloat(R0i.y)));
// 3
backupReg0i = R1i.z;
R1i.x = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(PV0iz));
R10i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV0iy));
R1i.z = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(PV0ix));
R4i.w = ((PV0iw == 0)?(R7i.x):(R9i.w));
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].x), intBitsToFloat(backupReg0i)));
// 4
R2i.x = ((intBitsToFloat(R5i.z) > 0.5)?-1:0);
PV0iy = ((intBitsToFloat(R5i.y) > 0.5)?-1:0);
// 5
R0i.x = ((PV0iy == 0)?(R7i.y):(R9i.z));
R11i.z = uf_remappedVS[24].z;
R11i.w = uf_remappedVS[24].w;
}
if( activeMaskStackC[3] == true ) {
// 0
R14i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R10i.y),intBitsToFloat(R1i.z),intBitsToFloat(R2i.y)),vec4(intBitsToFloat(uf_remappedVS[25].x),intBitsToFloat(uf_remappedVS[25].y),intBitsToFloat(uf_remappedVS[25].z),intBitsToFloat(uf_remappedVS[25].w))));
PV0iy = R14i.x;
PV0iz = R14i.x;
PV0iw = R14i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R10i.y),intBitsToFloat(R1i.z),intBitsToFloat(R2i.y)),vec4(intBitsToFloat(uf_remappedVS[26].x),intBitsToFloat(uf_remappedVS[26].y),intBitsToFloat(uf_remappedVS[26].z),intBitsToFloat(uf_remappedVS[26].w))));
PV1ix = tempi.x;
R14i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R124i.w = ((R2i.x == 0)?(R7i.x):(R9i.w));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R10i.y),intBitsToFloat(R1i.z),intBitsToFloat(R2i.y)),vec4(intBitsToFloat(uf_remappedVS[27].x),intBitsToFloat(uf_remappedVS[27].y),intBitsToFloat(uf_remappedVS[27].z),intBitsToFloat(uf_remappedVS[27].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R14i.z = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R10i.y),intBitsToFloat(R1i.z),intBitsToFloat(R2i.y)),vec4(intBitsToFloat(uf_remappedVS[28].x),intBitsToFloat(uf_remappedVS[28].y),intBitsToFloat(uf_remappedVS[28].z),intBitsToFloat(uf_remappedVS[28].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R14i.w = tempi.x;
R126i.w = ((intBitsToFloat(R5i.w) > 0.5)?-1:0);
// 4
PV0ix = uf_remappedVS[8].x & 0x80000;
R125i.y = uf_remappedVS[8].x & 0x200000;
PV0iz = PV1ix;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
PV0iw = uf_remappedVS[8].x & 0x100000;
R127i.y = uf_remappedVS[8].x & 0x400000;
// 5
PV1ix = (PV0ix == 0x80000)?-1:0;
R123i.y = floatBitsToInt(intBitsToFloat(R14i.z) * 0.0 + intBitsToFloat(PV0iz));
R18i.z = floatBitsToInt(intBitsToFloat(R14i.z) * 0.5 + intBitsToFloat(PV0iz));
R18i.w = floatBitsToInt(intBitsToFloat(R14i.z) * 0.0 + intBitsToFloat(R14i.w));
PS1i = (PV0iw == 0x100000)?-1:0;
// 6
backupReg0i = R0i.x;
R0i.x = ((PV1ix == 0)?(R7i.x):(R4i.w));
R18i.y = floatBitsToInt(intBitsToFloat(R14i.y) * -(0.5) + intBitsToFloat(R123i.y));
PV0iz = (R125i.y == 0x200000)?-1:0;
R4i.w = ((PS1i == 0)?(R7i.y):(backupReg0i));
R18i.x = floatBitsToInt(intBitsToFloat(R14i.x) * 0.5 + intBitsToFloat(R123i.y));
// 7
PV1ix = (R127i.y == 0x400000)?-1:0;
R123i.y = ((R126i.w == 0)?(R7i.y):(R9i.z));
R2i.z = ((PV0iz == 0)?(R7i.x):(R124i.w));
PV1iw = uf_remappedVS[8].x & 0x800000;
R10i.x = floatBitsToInt(1.0 / intBitsToFloat(R18i.w));
// 8
R127i.x = (PV1iw == 0x800000)?-1:0;
R2i.y = ((PV1ix == 0)?(R7i.y):(R123i.y));
PV0iz = ((intBitsToFloat(R5i.y) > 0.5)?-1:0);
PV0iw = floatBitsToInt(intBitsToFloat(R18i.z) * intBitsToFloat(R10i.x));
PS0i = uf_remappedVS[8].x & 0x1000000;
// 9
R125i.x = (PS0i == 0x1000000)?-1:0;
R123i.y = ((PV0iz == 0)?(R7i.x):(R9i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(uf_remappedVS[1].w)) + -(intBitsToFloat(uf_remappedVS[1].y)));
PV1iw = ((intBitsToFloat(R5i.z) > 0.5)?-1:0);
// 10
R6i.x = ((R127i.x == 0)?(R7i.x):(R123i.y));
R123i.y = ((PV1iw == 0)?(R7i.y):(R9i.z));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R123i.z));
// 11
R4i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS0i));
PV1iz = uf_remappedVS[8].y & int(1);
R3i.w = ((R125i.x == 0)?(R7i.y):(R123i.y));
// 12
R7i.y = (int(1) != PV1iz)?-1:0;
// 13
R123i.y = ((R7i.y == 0)?(0):(int(1)));
// 14
R125i.x = (R123i.y == int(1))?-1:0;
PV0iw = (R123i.y == 0x2)?-1:0;
// 15
R2i.x = ((R125i.x == 0)?(R5i.x):(R5i.y));
R123i.y = ((PV0iw == 0)?(R5i.y):(R5i.x));
R123i.z = ((PV0iw == 0)?(R5i.x):(R5i.z));
R0i.w = ((R125i.x == 0)?(R5i.y):(R5i.z));
// 16
R7i.x = ((R125i.x == 0)?(R123i.z):(R5i.y));
R1i.w = ((R125i.x == 0)?(R123i.y):(R5i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(uf_remappedVS[29].y)));
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) * 2.0);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(uf_remappedVS[29].x)));
R126i.w = floatBitsToInt(intBitsToFloat(R126i.w) * 2.0);
PS0i = int(intBitsToFloat(uf_remappedVS[30].z));
// 1
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[31].z) + intBitsToFloat(uf_remappedVS[29].x));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[31].w) + intBitsToFloat(uf_remappedVS[29].y));
R124i.w = floatBitsToInt(float(PS0i));
// 2
PV0ix = floatBitsToInt(-(abs(intBitsToFloat(R124i.w))) + 0.0);
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.w)) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(-(intBitsToFloat(R125i.x)) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt((0.0 >= abs(intBitsToFloat(R124i.w)))?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R124i.w));
// 3
R125i.x = ((intBitsToFloat(PV0iw) == 0.0)?(0):(PV0ix));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.w)),intBitsToFloat(uf_remappedVS[31].x)) + -(intBitsToFloat(PV0iy)));
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(uf_remappedVS[31].y)) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[30].z));
// 4
PV0iy = floatBitsToInt(trunc(intBitsToFloat(PV1iz)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[30].x), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(abs(intBitsToFloat(R124i.w)) + intBitsToFloat(R125i.x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[30].w));
// 5
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[30].y), intBitsToFloat(PS0i)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R126i.z)) + -(0.5));
R123i.z = ((-(intBitsToFloat(backupReg0i)) > 0.0)?(PV0iw):(backupReg0i));
PS1i = int(intBitsToFloat(PV0iy));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[32].x) + intBitsToFloat(uf_remappedVS[32].z));
R123i.y = ((intBitsToFloat(R124i.w) == 0.0)?(0):(R123i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(R125i.x)) + -(0.5));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[32].y) + intBitsToFloat(uf_remappedVS[32].w));
PS0i = floatBitsToInt(float(PS1i));
// 7
backupReg0i = R123i.y;
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.x)),intBitsToFloat(PS0i)) + intBitsToFloat(R126i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(uf_remappedVS[32].z)) + intBitsToFloat(PV0ix));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(uf_remappedVS[32].w)) + intBitsToFloat(PV0iw));
PS1i = int(intBitsToFloat(backupReg0i));
// 8
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[33].x), intBitsToFloat(R7i.x)));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[33].y), intBitsToFloat(R1i.w)));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) * 2.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(uf_remappedVS[29].w)) + intBitsToFloat(R123i.z));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(uf_remappedVS[29].z)) + intBitsToFloat(R123i.y));
PS0i = floatBitsToInt(float(PS1i));
// 9
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R127i.z)) + -(intBitsToFloat(R125i.x)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.y));
PS1i = int(intBitsToFloat(uf_remappedVS[34].z));
// 10
backupReg0i = R125i.y;
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[35].w) + intBitsToFloat(uf_remappedVS[33].y));
R125i.y = ((R7i.y == 0)?(0):(0x2));
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[35].z) + intBitsToFloat(uf_remappedVS[33].x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(backupReg0i)) + intBitsToFloat(R123i.w));
R126i.w = floatBitsToInt(float(PS1i));
// 11
PV1ix = floatBitsToInt(-(abs(intBitsToFloat(R126i.w))) + 0.0);
PV1iy = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(-(intBitsToFloat(R126i.y)) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt((0.0 >= abs(intBitsToFloat(R126i.w)))?1.0:0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.w));
// 12
R127i.x = ((intBitsToFloat(PV1iw) == 0.0)?(0):(PV1ix));
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.w)),intBitsToFloat(uf_remappedVS[35].x)) + -(intBitsToFloat(PV1iy)));
PV0iz = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(uf_remappedVS[35].y)) + intBitsToFloat(PV1iz));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[34].z));
// 13
R125i.x = (R125i.y == int(1))?-1:0;
PV1iy = floatBitsToInt(trunc(intBitsToFloat(PV0iz)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[34].x), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(abs(intBitsToFloat(R126i.w)) + intBitsToFloat(R127i.x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[34].w));
// 14
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[34].y), intBitsToFloat(PS1i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R127i.z)) + -(0.5));
R123i.z = ((-(intBitsToFloat(backupReg0i)) > 0.0)?(PV1iw):(backupReg0i));
R125i.w = (R125i.y == 0x2)?-1:0;
PS0i = int(intBitsToFloat(PV1iy));
// 15
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[36].x) + intBitsToFloat(uf_remappedVS[36].z));
R123i.y = ((intBitsToFloat(R126i.w) == 0.0)?(0):(R123i.z));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R127i.x)) + -(0.5));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[36].y) + intBitsToFloat(uf_remappedVS[36].w));
PS1i = floatBitsToInt(float(PS0i));
// 16
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].z),intBitsToFloat(R2i.x)) + intBitsToFloat(PV1ix));
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.x)),intBitsToFloat(PS1i)) + intBitsToFloat(R124i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].w),intBitsToFloat(R0i.w)) + intBitsToFloat(PV1iw));
R123i.w = ((R125i.w == 0)?(R5i.x):(R5i.z));
PS0i = int(intBitsToFloat(R123i.y));
// 17
R127i.x = ((R125i.x == 0)?(R123i.w):(R5i.y));
R123i.y = ((R125i.w == 0)?(R5i.y):(R5i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(uf_remappedVS[33].w)) + intBitsToFloat(R123i.z));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(uf_remappedVS[33].z)) + intBitsToFloat(R123i.x));
PS1i = floatBitsToInt(float(PS0i));
// 18
backupReg0i = R127i.z;
backupReg1i = R5i.y;
R123i.x = ((R125i.x == 0)?(R123i.y):(R5i.z));
R5i.y = ((R125i.x == 0)?(R5i.x):(backupReg1i));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R126i.z)) + -(intBitsToFloat(R125i.y)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(PS1i)) + intBitsToFloat(R126i.y));
R2i.y = ((R125i.x == 0)?(backupReg1i):(R5i.z));
// 19
backupReg0i = R127i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[37].x), intBitsToFloat(R127i.x)));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[37].y), intBitsToFloat(R123i.x)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
R9i.z = floatBitsToInt(intBitsToFloat(R127i.w) + 0.5);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(backupReg0i)) + intBitsToFloat(R123i.w));
PS1i = int(intBitsToFloat(uf_remappedVS[38].z));
// 20
R2i.x = floatBitsToInt(intBitsToFloat(R125i.z) + 0.5);
R0i.y = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[39].z) + intBitsToFloat(uf_remappedVS[37].x));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[39].w) + intBitsToFloat(uf_remappedVS[37].y));
R127i.w = floatBitsToInt(float(PS1i));
// 21
PV1ix = floatBitsToInt(-(abs(intBitsToFloat(R127i.w))) + 0.0);
PV1iy = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt((0.0 >= abs(intBitsToFloat(R127i.w)))?1.0:0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 22
R127i.x = ((intBitsToFloat(PV1iw) == 0.0)?(0):(PV1ix));
R1i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.w)),intBitsToFloat(uf_remappedVS[39].x)) + -(intBitsToFloat(PV1iy)));
PV0iz = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(uf_remappedVS[39].y)) + intBitsToFloat(PV1iz));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[38].z));
// 23
R7i.x = floatBitsToInt(intBitsToFloat(R127i.z) + 0.5);
PV1iy = floatBitsToInt(trunc(intBitsToFloat(PV0iz)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].x), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(abs(intBitsToFloat(R127i.w)) + intBitsToFloat(R127i.x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[38].w));
// 24
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].y), intBitsToFloat(PS1i)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R2i.z)) + -(0.5));
R123i.z = ((-(intBitsToFloat(R127i.x)) > 0.0)?(PV1iw):(R127i.x));
R19i.w = 0;
PS0i = int(intBitsToFloat(PV1iy));
// 25
R6i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[40].x) + intBitsToFloat(uf_remappedVS[40].z));
R7i.y = ((intBitsToFloat(R127i.w) == 0.0)?(0):(R123i.z));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(R5i.x)) + -(0.5));
R3i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[40].y) + intBitsToFloat(uf_remappedVS[40].w));
R5i.z = floatBitsToInt(float(PS0i));
}
if( activeMaskStackC[3] == true ) {
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].z),intBitsToFloat(R5i.y)) + intBitsToFloat(R6i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.x)),intBitsToFloat(R5i.z)) + intBitsToFloat(R5i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].w),intBitsToFloat(R2i.y)) + intBitsToFloat(R3i.w));
R125i.w = uf_remappedVS[41].y;
PS0i = int(intBitsToFloat(R7i.y));
// 1
R125i.x = 0;
R126i.y = uf_remappedVS[42].y;
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(uf_remappedVS[37].w)) + intBitsToFloat(R123i.z));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(uf_remappedVS[37].z)) + intBitsToFloat(R123i.x));
PS1i = floatBitsToInt(float(PS0i));
// 2
backupReg0i = R127i.y;
R127i.x = uf_remappedVS[43].y;
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[13].x) + -(intBitsToFloat(R1i.x)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R6i.z)) + -(intBitsToFloat(backupReg0i)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(PS1i)) + intBitsToFloat(R1i.y));
R125i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[13].y) + -(intBitsToFloat(R10i.y)));
// 3
R5i.x = floatBitsToInt(intBitsToFloat(R123i.z) + 0.5);
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[13].z) + -(intBitsToFloat(R1i.z)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R6i.y)) + intBitsToFloat(R123i.w));
PS1i = floatBitsToInt(intBitsToFloat(R18i.z) * intBitsToFloat(R18i.z));
// 4
R123i.x = floatBitsToInt((intBitsToFloat(R18i.y) * intBitsToFloat(R18i.y) + intBitsToFloat(PS1i)));
R10i.y = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
PS0i = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(R127i.z));
// 5
backupReg0i = R123i.x;
R123i.x = floatBitsToInt((intBitsToFloat(R125i.y) * intBitsToFloat(R125i.y) + intBitsToFloat(PS0i)));
R123i.w = floatBitsToInt((intBitsToFloat(R18i.x) * intBitsToFloat(R18i.x) + intBitsToFloat(backupReg0i)));
// 6
R123i.y = floatBitsToInt((intBitsToFloat(R127i.y) * intBitsToFloat(R127i.y) + intBitsToFloat(R123i.x)));
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.w));
PS0i = floatBitsToInt(tempResultf);
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.x), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.y), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.z), intBitsToFloat(PS0i)));
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.y));
R127i.w = floatBitsToInt(tempResultf);
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(PV1ix),intBitsToFloat(PV1iy),intBitsToFloat(PV1iz),intBitsToFloat(PV1iz)),vec4(-(intBitsToFloat(R125i.w)),-(intBitsToFloat(R126i.y)),-(intBitsToFloat(R127i.x)),-(intBitsToFloat(R125i.x)))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R127i.w)));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(0x3edc28f6));
PV1ix = clampFI32(PV1ix);
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R127i.w)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.w)));
// 10
R1i.y = uf_remappedVS[13].y;
tempResultf = max(0.0, intBitsToFloat(PV1ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R3i.w = floatBitsToInt(tempResultf);
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R6i.y),intBitsToFloat(R1i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[44].x),intBitsToFloat(uf_remappedVS[44].y),intBitsToFloat(uf_remappedVS[44].z),0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
R127i.x = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
R12i.y = uf_remappedVS[45].x;
PV1iw = floatBitsToInt(min(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[46].z)));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[47].z), intBitsToFloat(R3i.w)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(uf_remappedVS[48].x)) + -(intBitsToFloat(uf_remappedVS[48].y)));
R123i.y = clampFI32(R123i.y);
PV0iz = floatBitsToInt(-(intBitsToFloat(R9i.x)) + intBitsToFloat(PV1iw));
R127i.w = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R122i.x = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
// 3
backupReg0i = R123i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[46].y),intBitsToFloat(PV0iz)) + intBitsToFloat(uf_remappedVS[46].x));
R123i.x = clampFI32(R123i.x);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(uf_remappedVS[49].x)) + -(intBitsToFloat(uf_remappedVS[49].y)));
R123i.y = clampFI32(R123i.y);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R122i.x)) + intBitsToFloat(0xbe593484));
PV1iw = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0ix = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R19i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(uf_remappedVS[50].w)));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[47].w)),intBitsToFloat(PS1i)) + 1.0);
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R123i.z)) + intBitsToFloat(0x3fc90da4));
tempResultf = max(0.0, intBitsToFloat(PV1iw));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 5
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[44].y) * 1.0 + intBitsToFloat(R4i.x));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[47].x), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[44].y) + 1.0);
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 6
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) * 1.5);
PV0ix = clampFI32(PV0ix);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[51].x), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[51].y), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 7
R125i.y = floatBitsToInt(intBitsToFloat(PV0ix) * 15.0);
PV1iw = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 8
R4i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R127i.z)));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(R127i.w)));
// 9
R19i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedVS[52].w)));
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f22f983));
PV1iw = floatBitsToInt(intBitsToFloat(R18i.y) * intBitsToFloat(R10i.x));
PS1i = floatBitsToInt(exp2(intBitsToFloat(R125i.z)));
// 10
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),-(intBitsToFloat(R125i.w))) + 1.0);
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[51].z)),intBitsToFloat(PS1i)) + intBitsToFloat(uf_remappedVS[51].z));
R123i.y = clampFI32(R123i.y);
PV0iz = floatBitsToInt(-(intBitsToFloat(PV1iw)) + 1.0);
R10i.w = 0;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R125i.y));
// 11
R123i.x = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3f333333) + intBitsToFloat(0x3e19999a));
R123i.x = clampFI32(R123i.x);
R1i.y = floatBitsToInt(intBitsToFloat(R123i.y) + intBitsToFloat(0x80000000));
R1i.y = clampFI32(R1i.y);
PV1iz = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS0i));
R17i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R11i.x)) + intBitsToFloat(R6i.w));
// 12
PV0ix = floatBitsToInt(max(intBitsToFloat(PV1iz), intBitsToFloat(0x3e4ccccd)));
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R0i.z)) + intBitsToFloat(R2i.w));
R17i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R12i.x)) + intBitsToFloat(R7i.z));
PV0iw = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
R19i.z = R1i.y;
// 13
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) + 2.5);
R2i.w = floatBitsToInt(min(intBitsToFloat(PV0ix), 1.0));
// 14
R10i.x = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3daaaaab));
}
if( activeMaskStackC[3] == true ) {
R4i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y))).xyz);
R20i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R10i.x),intBitsToFloat(R10i.w))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R2i.w)));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R2i.w)));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R2i.w)));
R13i.w = R1i.y;
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[23].w), intBitsToFloat(R11i.z)));
// 1
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[31].y),intBitsToFloat(R125i.z)) + intBitsToFloat(R9i.z));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[23].w), intBitsToFloat(R11i.w)));
// 2
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].y), intBitsToFloat(R125i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[31].y), intBitsToFloat(R125i.y)));
// 3
backupReg0i = R0i.y;
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(uf_remappedVS[53].w)) + intBitsToFloat(R2i.x));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].y),intBitsToFloat(R125i.z)) + intBitsToFloat(backupReg0i));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[53].w),intBitsToFloat(PV0iy)) + intBitsToFloat(R7i.x));
// 4
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].y),intBitsToFloat(R125i.z)) + intBitsToFloat(R10i.y));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].y), intBitsToFloat(R125i.y)));
// 5
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[53].w),intBitsToFloat(PV0iz)) + intBitsToFloat(R5i.x));
}
if( activeMaskStackC[3] == true ) {
// 0
R12i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[3].x) * 1.0 + 0.0);
// 1
R11i.x = R8i.x;
R11i.y = R8i.y;
R11i.z = R8i.z;
R11i.w = R8i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.z));
// export
passParameterSem9 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.z));
}
