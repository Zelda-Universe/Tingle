#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 1289f8807d2679fa
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[51];
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

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem3;
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
bool activeMaskStack[6];
bool activeMaskStackC[7];
activeMaskStack[0] = false;
activeMaskStack[1] = false;
activeMaskStack[2] = false;
activeMaskStack[3] = false;
activeMaskStack[4] = false;
activeMaskStackC[0] = false;
activeMaskStackC[1] = false;
activeMaskStackC[2] = false;
activeMaskStackC[3] = false;
activeMaskStackC[4] = false;
activeMaskStackC[5] = false;
activeMaskStack[0] = true;
activeMaskStackC[0] = true;
activeMaskStackC[1] = true;
R0i = ivec4(gl_VertexID, 0, 0, gl_InstanceID);
attrDecoder = attrDataSem8;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem3;
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem6;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem7;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem10;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R10i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem9;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R9i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem5;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
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
R6i.y = floatBitsToInt(-(intBitsToFloat(R7i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R4i.w = 0;
R5i.w = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R6i.y));
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
R7i.x = 0;
// 1
R7i.w = R5i.w;
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
PS0i = int(intBitsToFloat(R6i.w));
// 1
R6i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R6i.y) >= intBitsToFloat(R6i.z));
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
R7i.x = 0;
// 1
R6i.w = R5i.w;
}
activeMaskStack[2] = activeMaskStack[2] == false;
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R6i.w = R4i.w;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R6i.w == 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(R9i.y));
R127i.y = uf_remappedVS[2].x & 0x40000;
R127i.z = uf_remappedVS[2].x & 0x20000;
PV0iw = uf_remappedVS[2].x & 0x10000;
PS0i = floatBitsToInt(intBitsToFloat(R9i.y) + intBitsToFloat(R9i.z));
// 1
PV1ix = R9i.y;
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
R126i.y = floatBitsToInt(intBitsToFloat(PV0ix) * 0.5);
R125i.z = floatBitsToInt(intBitsToFloat(PS0i) * 0.5);
R127i.w = R9i.z;
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
PS1i = floatBitsToInt(float(PV0iw));
// 2
backupReg0i = R127i.z;
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R127i.z = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(R9i.z));
R126i.w = floatBitsToInt(floor(intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(float(backupReg0i));
// 3
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
R124i.z = floatBitsToInt(floor(intBitsToFloat(R127i.w)));
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PS1i = floatBitsToInt(float(R127i.y));
// 4
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R127i.y = R9i.x;
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R126i.z = int(intBitsToFloat(PV1iy));
// 5
PV1ix = 0 - R126i.z;
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0ix)));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 0.5);
R125i.w = floatBitsToInt(intBitsToFloat(R126i.y) + -(0.5));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) * 2.0);
R126i.y = int(intBitsToFloat(PV0iz));
// 6
PV0ix = 0 - R126i.y;
R125i.y = max(R126i.z, PV1ix);
R125i.z = floatBitsToInt(intBitsToFloat(R125i.z) + -(0.5));
R125i.z = floatBitsToInt(intBitsToFloat(R125i.z) * 2.0);
R127i.w = floatBitsToInt((intBitsToFloat(R126i.w) > 0.0)?1.0:0.0);
R127i.x = int(intBitsToFloat(PV1iy));
// 7
PV1ix = 0 - R127i.x;
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(R126i.w))?1.0:0.0);
R126i.z = floatBitsToInt((intBitsToFloat(R124i.z) > 0.0)?1.0:0.0);
R126i.w = max(R126i.y, PV0ix);
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[3].w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 8
backupReg0i = R127i.w;
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(R124i.z))?1.0:0.0);
R127i.y = floatBitsToInt(floor(intBitsToFloat(R127i.y)));
R124i.z = max(R127i.x, PV1ix);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(PS1i)));
R127i.x = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(PV1iy)));
// 9
backupReg0i = R125i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(uf_remappedVS[4].x)));
R125i.y = floatBitsToInt(intBitsToFloat(R127i.z) + -(0.5));
R125i.y = floatBitsToInt(intBitsToFloat(R125i.y) * 2.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(uf_remappedVS[4].y)));
R125i.w = floatBitsToInt(intBitsToFloat(R126i.z) + -(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(float(backupReg0i));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 10
backupReg0i = R127i.y;
PV0ix = floatBitsToInt((intBitsToFloat(backupReg0i) > 0.0)?1.0:0.0);
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[3].w)) + 1.0);
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(R127i.x)));
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(backupReg0i))?1.0:0.0);
PS0i = floatBitsToInt(float(R126i.w));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 11
backupReg0i = R127i.z;
backupReg1i = R127i.w;
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(R125i.w)));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(uf_remappedVS[3].x));
R127i.z = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[3].y) + intBitsToFloat(backupReg0i));
PS1i = floatBitsToInt(exp2(intBitsToFloat(backupReg1i)));
// 12
backupReg0i = R124i.z;
R126i.x = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(uf_remappedVS[4].z)));
R124i.z = floatBitsToInt(intBitsToFloat(R9i.x) + -(0.5));
R126i.w = floatBitsToInt(intBitsToFloat(R9i.y) + -(0.5));
PS0i = floatBitsToInt(float(backupReg0i));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 13
backupReg0i = R127i.z;
R125i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[3].z) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R126i.z)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R126i.z)));
R125i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(backupReg0i)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R127i.x)));
PV0iy = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(PS1i));
PV0iz = ((intBitsToFloat(uf_remappedVS[3].w) == 1.0)?-1:0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R127i.x)));
R124i.w = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV1iy));
// 15
R127i.x = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(PV0ix));
R126i.y = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(R127i.z));
R126i.z = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0iw));
R127i.w = ((PV0iz == 0)?(PV0iy):(R6i.y));
R127i.z = floatBitsToInt(intBitsToFloat(R9i.z) + -(0.5));
// 16
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R125i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(uf_remappedVS[5].x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R125i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(uf_remappedVS[5].y)));
R6i.w = 0x3f800000;
// 17
backupReg0i = R127i.x;
backupReg1i = R127i.z;
R127i.x = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(PV0iz));
R127i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), intBitsToFloat(uf_remappedVS[5].z)));
// 18
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R127i.w)));
R126i.y = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(PS1i));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R127i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R127i.w)));
R127i.w = floatBitsToInt(max(intBitsToFloat(R9i.x), 0.0));
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R6i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R3i.z = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0iw));
// 20
backupReg0i = R126i.y;
backupReg1i = R125i.x;
backupReg2i = R127i.z;
R125i.x = floatBitsToInt(min(intBitsToFloat(R127i.w), 0.0));
R126i.y = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3e22f983) + 0.5);
R127i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(backupReg1i));
PV0iw = floatBitsToInt(intBitsToFloat(backupReg2i) + intBitsToFloat(R126i.z));
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(uf_remappedVS[6].y)));
// 21
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R6i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R0i.w = tempi.x;
R127i.w = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
// 22
R5i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R6i.w))));
PV0iy = R5i.x;
PV0iz = R5i.x;
PV0iw = R5i.x;
PS0i = floatBitsToInt(fract(intBitsToFloat(R126i.y)));
// 23
R0i.x = floatBitsToInt(intBitsToFloat(R10i.x) + intBitsToFloat(R125i.x));
R10i.y = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0x3e22f983) + 0.5);
R1i.z = floatBitsToInt(fract(intBitsToFloat(R127i.w)));
R1i.w = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R1i.y = uf_remappedVS[7].y;
R1i.y = floatBitsToInt(intBitsToFloat(R1i.y) / 2.0);
}
if( activeMaskStackC[3] == true ) {
// 0
R125i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].x) * 1.0);
R126i.y = floatBitsToInt(intBitsToFloat(R3i.z) + intBitsToFloat(uf_remappedVS[9].z));
R123i.z = floatBitsToInt(intBitsToFloat(R1i.z) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].y) * 1.0);
R127i.x = floatBitsToInt(fract(intBitsToFloat(R10i.y)));
// 1
R126i.x = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(uf_remappedVS[9].y));
R127i.y = floatBitsToInt(intBitsToFloat(R1i.w) * intBitsToFloat(0x3e22f983));
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].z) * 1.0);
R124i.w = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(uf_remappedVS[9].x));
R124i.x = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(uf_remappedVS[10].y)) + intBitsToFloat(R127i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(uf_remappedVS[10].x)) + intBitsToFloat(R125i.x));
R123i.z = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(uf_remappedVS[10].z)) + intBitsToFloat(PV1iz));
R124i.y = floatBitsToInt(sin((intBitsToFloat(R127i.y))/0.1591549367));
// 3
backupReg0i = R123i.x;
backupReg1i = R123i.y;
backupReg2i = R123i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(uf_remappedVS[11].z)) + intBitsToFloat(R123i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(uf_remappedVS[11].y)) + intBitsToFloat(backupReg0i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(uf_remappedVS[11].x)) + intBitsToFloat(backupReg1i));
R127i.w = floatBitsToInt(intBitsToFloat(backupReg2i) * intBitsToFloat(0x3e22f983));
R126i.x = floatBitsToInt(cos((intBitsToFloat(R127i.y))/0.1591549367));
// 4
R4i.x = floatBitsToInt(intBitsToFloat(R8i.y) + intBitsToFloat(R1i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(uf_remappedVS[12].z)) + intBitsToFloat(R123i.x));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(uf_remappedVS[12].y)) + intBitsToFloat(R123i.y));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(uf_remappedVS[12].x)) + intBitsToFloat(R123i.z));
R126i.w = floatBitsToInt(sin((intBitsToFloat(R124i.x))/0.1591549367));
// 5
R127i.x = floatBitsToInt(intBitsToFloat(R8i.z) * 1.0);
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[6].x)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R126i.w)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R126i.w)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[13].x));
// 6
R0i.x = 0x3f800000;
R1i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[14].y) * 1.0);
R124i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[14].x) * 1.0);
PV0iw = floatBitsToInt(intBitsToFloat(R124i.w) * intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[13].y));
// 7
R1i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[14].z) * 1.0);
PV1iy = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) / 2.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) + 0.5);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[13].z));
// 8
backupReg0i = R127i.y;
R7i.x = floatBitsToInt(fract(intBitsToFloat(PV1iz)));
R127i.y = floatBitsToInt(intBitsToFloat(PV1iy) + 0.5);
PV0iw = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
R127i.z = floatBitsToInt(cos((intBitsToFloat(R124i.x))/0.1591549367));
// 9
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R127i.z)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R127i.z)));
R125i.z = floatBitsToInt(intBitsToFloat(R7i.x) + -(0.5));
R125i.z = floatBitsToInt(intBitsToFloat(R125i.z) * 2.0);
R124i.w = floatBitsToInt(intBitsToFloat(PV0iw) + 0.5);
R125i.y = floatBitsToInt(sin((intBitsToFloat(R127i.w))/0.1591549367));
// 10
backupReg0i = R127i.w;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R125i.w)));
R5i.y = floatBitsToInt(fract(intBitsToFloat(R127i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R126i.z)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R124i.x)));
R10i.x = floatBitsToInt(cos((intBitsToFloat(backupReg0i))/0.1591549367));
// 11
backupReg0i = R126i.y;
R124i.x = floatBitsToInt(intBitsToFloat(R124i.x) + intBitsToFloat(PV0ix));
R126i.y = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + intBitsToFloat(PV0iz));
R2i.z = floatBitsToInt(fract(intBitsToFloat(R124i.w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R10i.x)));
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(backupReg0i)));
// 12
R2i.x = floatBitsToInt(-(intBitsToFloat(R125i.y)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R10i.x)));
PV0iz = floatBitsToInt(intBitsToFloat(R2i.z) + -(0.5));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R10i.x)));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R127i.x)));
// 13
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].z), intBitsToFloat(PV0iz)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(backupReg0i)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(backupReg0i)));
PV1iw = floatBitsToInt(intBitsToFloat(R5i.y) + -(0.5));
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 2.0);
R3i.y = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(R127i.w));
// 14
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R10i.x)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].y), intBitsToFloat(PV1iw)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(uf_remappedVS[15].x)) + intBitsToFloat(R124i.z));
R3i.w = floatBitsToInt(-(intBitsToFloat(R126i.z)) + intBitsToFloat(R125i.x));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(uf_remappedVS[15].y)) + intBitsToFloat(R1i.y));
// 15
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].x), intBitsToFloat(R125i.z)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(uf_remappedVS[15].z)) + intBitsToFloat(R1i.x));
R6i.x = 0x3f800000;
// 16
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(uf_remappedVS[16].x)) + intBitsToFloat(R127i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(uf_remappedVS[16].z)) + intBitsToFloat(R123i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(uf_remappedVS[16].y)) + intBitsToFloat(R126i.z));
R11i.x = 0;
// 17
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(uf_remappedVS[17].y)) + intBitsToFloat(R123i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(uf_remappedVS[17].x)) + intBitsToFloat(backupReg0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(uf_remappedVS[17].z)) + intBitsToFloat(R123i.z));
// 18
R1i.x = floatBitsToInt(-(intBitsToFloat(R3i.z)) + intBitsToFloat(R123i.w));
R1i.y = floatBitsToInt(-(intBitsToFloat(R0i.w)) + intBitsToFloat(R123i.x));
R4i.z = floatBitsToInt(-(intBitsToFloat(R5i.x)) + intBitsToFloat(R123i.y));
// 19
R6i.w = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(R1i.y));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(uf_remappedVS[18].z)));
PV0iz = uf_remappedVS[7].x;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R4i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(uf_remappedVS[18].y)));
R127i.w = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(uf_remappedVS[19].z));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R2i.x)) + intBitsToFloat(R1i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R2i.w)) + intBitsToFloat(R2i.y));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(PV1ix)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R4i.y)) + intBitsToFloat(R1i.z));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[20].z));
// 3
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R10i.x)) + intBitsToFloat(R123i.x));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R3i.y)) + intBitsToFloat(R123i.w));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R3i.w)) + intBitsToFloat(R123i.y));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS0i));
PS1i = uf_remappedVS[2].x & int(1);
// 4
R127i.x = uf_remappedVS[2].x & 0x4;
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(uf_remappedVS[19].x)) + intBitsToFloat(PV1iw));
PV0iz = uf_remappedVS[2].x & 0x2;
PS0i = floatBitsToInt(float(PS1i));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x40c90fdb));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R126i.z = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(float(PV0iz));
// 6
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R127i.z = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iy)));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
PS0i = floatBitsToInt(float(R127i.x));
// 7
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R126i.y = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iy)));
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(intBitsToFloat(R126i.z) + -(0.5));
// 8
R123i.x = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R125i.y = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
R123i.z = ((intBitsToFloat(PS1i) >= 0.0)?(floatBitsToInt(1.0)):(0));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[20].x)),intBitsToFloat(R126i.z)) + 1.0);
R127i.z = int(intBitsToFloat(R127i.z));
// 9
backupReg0i = R127i.z;
R127i.x = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
PV1iy = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
R126i.z = floatBitsToInt(max(intBitsToFloat(R123i.w), -(intBitsToFloat(R123i.w))));
PV1iw = 0 - backupReg0i;
R125i.x = int(intBitsToFloat(R126i.y));
// 10
backupReg0i = R125i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[20].x)),intBitsToFloat(PV1iy)) + 1.0);
R125i.y = max(R127i.z, PV1iw);
PV0iw = 0 - R125i.x;
R124i.x = int(intBitsToFloat(backupReg0i));
// 11
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(max(intBitsToFloat(R123i.x), -(intBitsToFloat(R123i.x))));
R127i.z = max(backupReg0i, PV0iw);
PV1iw = 0 - R124i.x;
PS1i = floatBitsToInt(cos((intBitsToFloat(R127i.x))/0.1591549367));
// 12
backupReg0i = R125i.y;
R125i.y = max(R124i.x, PV1iw);
PV0iz = floatBitsToInt(intBitsToFloat(PS1i) + 1.0);
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
R124i.x = floatBitsToInt(float(backupReg0i));
// 13
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[20].x)),intBitsToFloat(PV0iz)) + 1.0);
R126i.y = floatBitsToInt(float(R127i.z));
// 14
PS0i = floatBitsToInt(float(R125i.y));
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R126i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.z),intBitsToFloat(R125i.x),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R10i.z = tempi.x;
PV1iw = tempi.x;
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w)),vec4(intBitsToFloat(R10i.x),intBitsToFloat(R3i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.x))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedVS[22].x),intBitsToFloat(uf_remappedVS[22].y),intBitsToFloat(uf_remappedVS[22].z),intBitsToFloat(uf_remappedVS[22].w)),vec4(intBitsToFloat(R10i.x),intBitsToFloat(R3i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.x))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.z = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV0ix));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedVS[23].x),intBitsToFloat(uf_remappedVS[23].y),intBitsToFloat(uf_remappedVS[23].z),intBitsToFloat(uf_remappedVS[23].w)),vec4(intBitsToFloat(R10i.x),intBitsToFloat(R3i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.x))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(PV1ix));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(R3i.z) + intBitsToFloat(PV0ix));
R0i.y = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(R1i.y));
R0i.x = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(R4i.z));
// 4
R0i.z = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R1i.x));
// 5
predResult = (intBitsToFloat(uf_remappedVS[24].x) == 1.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
activeMaskStack[4] = activeMaskStack[3];
activeMaskStackC[5] = activeMaskStackC[4];
// 0
predResult = (intBitsToFloat(R6i.w) > intBitsToFloat(uf_remappedVS[24].y));
activeMaskStack[4] = predResult;
activeMaskStackC[5] = predResult == true && activeMaskStackC[4] == true;
}
else {
activeMaskStack[4] = false;
activeMaskStackC[5] = false;
}
if( activeMaskStackC[5] == true ) {
// 0
R0i.x = 0;
R0i.y = 0;
R0i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
// 1
R6i.x = R11i.x;
R0i.w = R5i.w;
}
activeMaskStack[4] = activeMaskStack[4] == false;
activeMaskStackC[5] = activeMaskStack[4] == true && activeMaskStackC[4] == true;
if( activeMaskStackC[5] == true ) {
// 0
R0i.w = R4i.w;
}
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R5i.w = R4i.w;
// 1
R4i.w = R0i.w;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
activeMaskStack[4] = activeMaskStack[3];
activeMaskStackC[5] = activeMaskStackC[4];
// 0
predResult = (intBitsToFloat(uf_remappedVS[24].x) == 2.0);
activeMaskStack[4] = predResult;
activeMaskStackC[5] = predResult == true && activeMaskStackC[4] == true;
}
else {
activeMaskStack[4] = false;
activeMaskStackC[5] = false;
}
if( activeMaskStackC[5] == true ) {
activeMaskStack[5] = activeMaskStack[4];
activeMaskStackC[6] = activeMaskStackC[5];
// 0
predResult = (intBitsToFloat(uf_remappedVS[24].y) > intBitsToFloat(R6i.w));
activeMaskStack[5] = predResult;
activeMaskStackC[6] = predResult == true && activeMaskStackC[5] == true;
}
else {
activeMaskStack[5] = false;
activeMaskStackC[6] = false;
}
if( activeMaskStackC[6] == true ) {
// 0
R0i.x = 0;
R0i.y = 0;
R0i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
// 1
R6i.x = R11i.x;
}
activeMaskStack[5] = activeMaskStack[5] == false;
activeMaskStackC[6] = activeMaskStack[5] == true && activeMaskStackC[5] == true;
if( activeMaskStackC[6] == true ) {
// 0
R5i.w = R4i.w;
}
activeMaskStackC[5] = activeMaskStack[4] == true && activeMaskStackC[4] == true;
activeMaskStack[4] = activeMaskStack[4] == false;
activeMaskStackC[5] = activeMaskStack[4] == true && activeMaskStackC[4] == true;
if( activeMaskStackC[5] == true ) {
// 0
R5i.w = R4i.w;
}
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (R4i.w == 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
activeMaskStack[4] = activeMaskStack[3];
activeMaskStackC[5] = activeMaskStackC[4];
// 0
predResult = (R5i.w == 0);
activeMaskStack[4] = predResult;
activeMaskStackC[5] = predResult == true && activeMaskStackC[4] == true;
}
else {
activeMaskStack[4] = false;
activeMaskStackC[5] = false;
}
if( activeMaskStackC[5] == true ) {
// 0
R127i.x = ((intBitsToFloat(uf_remappedVS[25].x) > 0.0)?-1:0);
R123i.y = floatBitsToInt(intBitsToFloat(R2i.z) * 2.0 + -(1.0));
R123i.z = floatBitsToInt(intBitsToFloat(R5i.y) * 2.0 + -(1.0));
R123i.w = floatBitsToInt(intBitsToFloat(R7i.x) * 2.0 + -(1.0));
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[25].x));
// 1
PV1ix = floatBitsToInt(max(intBitsToFloat(R123i.w), -(intBitsToFloat(R123i.w))));
R125i.y = ((intBitsToFloat(uf_remappedVS[25].y) > 0.0)?-1:0);
PV1iz = floatBitsToInt(max(intBitsToFloat(R123i.y), -(intBitsToFloat(R123i.y))));
PV1iw = floatBitsToInt(max(intBitsToFloat(R123i.z), -(intBitsToFloat(R123i.z))));
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[25].y));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(PV1iw)) + 1.0);
PV0iy = floatBitsToInt(-(intBitsToFloat(PV1ix)) + 1.0);
R127i.z = ((intBitsToFloat(uf_remappedVS[25].z) > 0.0)?-1:0);
PV0iw = floatBitsToInt(-(intBitsToFloat(PV1iz)) + 1.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[25].z));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(R127i.y));
PV1ix = clampFI32(PV1ix);
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(R126i.y));
PV1iy = clampFI32(PV1iy);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(PS0i));
PV1iz = clampFI32(PV1iz);
// 4
R123i.x = ((R125i.y == 0)?(0x3f800000):(PV1iy));
R125i.y = ((R127i.z == 0)?(0x3f800000):(PV1iz));
R123i.w = ((R127i.x == 0)?(0x3f800000):(PV1ix));
// 5
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R123i.x)));
// 6
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV1iz)));
// 7
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(PV0iy)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt((intBitsToFloat(uf_remappedVS[26].x) > 0.0)?1.0:0.0);
R127i.y = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[26].x))?1.0:0.0);
R127i.z = floatBitsToInt((intBitsToFloat(uf_remappedVS[26].y) > 0.0)?1.0:0.0);
R0i.w = 0x3f800000;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[26].x));
// 1
R12i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[27].x),intBitsToFloat(uf_remappedVS[27].y),intBitsToFloat(uf_remappedVS[27].z),intBitsToFloat(uf_remappedVS[27].w))));
PV1iy = R12i.x;
PV1iz = R12i.x;
PV1iw = R12i.x;
R126i.x = floatBitsToInt(intBitsToFloat(R6i.y) * intBitsToFloat(PS0i));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[28].x),intBitsToFloat(uf_remappedVS[28].y),intBitsToFloat(uf_remappedVS[28].z),intBitsToFloat(uf_remappedVS[28].w))));
PV0ix = tempi.x;
R12i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.z = floatBitsToInt(intBitsToFloat(R127i.x) + -(intBitsToFloat(R127i.y)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[29].x),intBitsToFloat(uf_remappedVS[29].y),intBitsToFloat(uf_remappedVS[29].z),intBitsToFloat(uf_remappedVS[29].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R12i.z = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R6i.z));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[30].x),intBitsToFloat(uf_remappedVS[30].y),intBitsToFloat(uf_remappedVS[30].z),intBitsToFloat(uf_remappedVS[30].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R12i.w = tempi.x;
R127i.x = floatBitsToInt(intBitsToFloat(R6i.y) * intBitsToFloat(PS1i));
// 5
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[26].y))?1.0:0.0);
R127i.y = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R125i.z = ((intBitsToFloat(R9i.x) > 0.5)?-1:0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(uf_remappedVS[31].y)) + intBitsToFloat(R126i.x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[26].y));
// 6
PV0ix = uf_remappedVS[2].y & int(1);
PV0iy = floatBitsToInt(intBitsToFloat(R6i.y) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(PV1ix)));
R125i.y = uf_remappedVS[2].x & 0x80000;
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(uf_remappedVS[31].z)) + intBitsToFloat(PV0iy));
R126i.y = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV0iz)));
PV1iw = (int(1) != PV0ix)?-1:0;
R126i.x = uf_remappedVS[2].x & 0x100000;
// 8
backupReg0i = R123i.x;
R123i.x = ((PV1iw == 0)?(0):(int(1)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y)) + intBitsToFloat(PV1iz));
R126i.z = ((intBitsToFloat(R9i.y) > 0.5)?-1:0);
PV0iw = floatBitsToInt(fract(intBitsToFloat(backupReg0i)));
R126i.w = uf_remappedVS[2].x & 0x200000;
// 9
R125i.x = (R123i.x == int(1))?-1:0;
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0iw)));
R127i.z = ((intBitsToFloat(R9i.z) > 0.5)?-1:0);
PV1iw = (R123i.x == 0x2)?-1:0;
R124i.z = uf_remappedVS[2].x & 0x400000;
// 10
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y)) + intBitsToFloat(PV1iy));
R123i.y = ((PV1iw == 0)?(R9i.y):(R9i.x));
R123i.z = ((PV1iw == 0)?(R9i.x):(R9i.z));
R127i.w = ((intBitsToFloat(R9i.w) > 0.5)?-1:0);
R127i.x = (R125i.y == 0x80000)?-1:0;
// 11
R1i.x = ((R125i.x == 0)?(R123i.z):(R9i.y));
R126i.y = floatBitsToInt(((R126i.z == 0)?(intBitsToFloat(R8i.y)):(-(intBitsToFloat(R8i.y)))));
R125i.z = floatBitsToInt(((R125i.z == 0)?(intBitsToFloat(R8i.x)):(-(intBitsToFloat(R8i.x)))));
R2i.w = ((R125i.x == 0)?(R123i.y):(R9i.z));
R126i.z = (R126i.w == 0x200000)?-1:0;
// 12
R123i.x = floatBitsToInt(((R127i.z == 0)?(intBitsToFloat(R8i.x)):(-(intBitsToFloat(R8i.x)))));
PV0iy = (R124i.z == 0x400000)?-1:0;
R123i.z = floatBitsToInt(((R127i.w == 0)?(intBitsToFloat(R8i.y)):(-(intBitsToFloat(R8i.y)))));
PV0iw = (R126i.x == 0x100000)?-1:0;
R127i.z = R12i.w;
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) / 2.0);
// 13
backupReg0i = R123i.x;
R123i.x = ((PV0iw == 0)?(R8i.y):(R126i.y));
R3i.y = ((R125i.x == 0)?(R9i.y):(R9i.z));
R1i.z = ((R125i.x == 0)?(R9i.x):(R9i.y));
R5i.w = ((R126i.z == 0)?(R8i.x):(backupReg0i));
R5i.z = ((PV0iy == 0)?(R8i.y):(R123i.z));
// 14
backupReg0i = R5i.z;
R5i.x = floatBitsToInt(intBitsToFloat(R5i.w) + 0.5);
R123i.y = ((R127i.x == 0)?(R8i.x):(R125i.z));
R3i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + -(0.5));
R4i.w = floatBitsToInt(intBitsToFloat(R123i.x) + -(0.5));
R122i.x = floatBitsToInt(intBitsToFloat(R12i.z) * 0.0 + intBitsToFloat(R127i.z));
// 15
R13i.x = floatBitsToInt(intBitsToFloat(R12i.x) * 0.5 + intBitsToFloat(R122i.x));
R13i.y = floatBitsToInt(intBitsToFloat(R12i.y) * -(0.5) + intBitsToFloat(R122i.x));
R4i.z = floatBitsToInt(intBitsToFloat(R123i.y) + 0.5);
R13i.w = floatBitsToInt(intBitsToFloat(R12i.z) * 0.0 + intBitsToFloat(R12i.w));
R13i.z = floatBitsToInt(intBitsToFloat(R12i.z) * 0.5 + intBitsToFloat(R127i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(intBitsToFloat(R0i.y) + -(intBitsToFloat(uf_remappedVS[32].w)));
PS0i = int(intBitsToFloat(uf_remappedVS[33].z));
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[32].w)) + intBitsToFloat(uf_remappedVS[34].w));
R8i.y = floatBitsToInt(intBitsToFloat(R0i.y) + -(intBitsToFloat(uf_remappedVS[34].w)));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[32].z)) + intBitsToFloat(uf_remappedVS[34].z));
R125i.w = ((intBitsToFloat(R126i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R8i.w = floatBitsToInt(float(PS0i));
// 2
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[32].y)) + intBitsToFloat(uf_remappedVS[34].y));
PV0iy = floatBitsToInt((0.0 >= abs(intBitsToFloat(R8i.w)))?1.0:0.0);
PV0iz = floatBitsToInt(-(abs(intBitsToFloat(R8i.w))) + 0.0);
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[32].x)) + intBitsToFloat(uf_remappedVS[34].x));
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 3
R125i.x = ((intBitsToFloat(PV0iy) == 0.0)?(0):(PV0iz));
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[34].w)) + intBitsToFloat(uf_remappedVS[35].w));
R0i.z = floatBitsToInt(intBitsToFloat(R0i.y) + -(intBitsToFloat(uf_remappedVS[35].w)));
R124i.w = ((intBitsToFloat(R8i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(R127i.w));
// 4
R2i.x = floatBitsToInt(intBitsToFloat(R0i.x) + -(intBitsToFloat(uf_remappedVS[36].w)));
R125i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[37].w)) + intBitsToFloat(uf_remappedVS[36].w));
R126i.z = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(R127i.w));
R0i.w = floatBitsToInt(intBitsToFloat(R0i.x) + -(intBitsToFloat(uf_remappedVS[37].w)));
R124i.x = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(R127i.w));
// 5
R9i.x = ((intBitsToFloat(R0i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.y = floatBitsToInt(-(intBitsToFloat(R124i.w)) + 1.0);
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[34].y)) + intBitsToFloat(uf_remappedVS[35].y));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[34].x)) + intBitsToFloat(uf_remappedVS[35].x));
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(R126i.y));
// 6
backupReg0i = R125i.y;
R8i.x = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
R125i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[34].z)) + intBitsToFloat(uf_remappedVS[35].z));
R124i.z = ((intBitsToFloat(R0i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R3i.w = ((intBitsToFloat(R2i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 7
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].w)) + intBitsToFloat(uf_remappedVS[38].w));
R126i.y = floatBitsToInt(intBitsToFloat(R0i.y) + -(intBitsToFloat(uf_remappedVS[38].w)));
R8i.z = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(R126i.w));
PV1iw = floatBitsToInt(abs(intBitsToFloat(R8i.w)) + intBitsToFloat(R125i.x));
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(R8i.w));
// 8
R125i.x = ((-(intBitsToFloat(R125i.x)) > 0.0)?(PV1iw):(R125i.x));
R0i.y = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(R126i.w));
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[37].x)) + intBitsToFloat(uf_remappedVS[36].x));
R1i.w = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(R126i.w));
R9i.w = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 9
R3i.x = floatBitsToInt(intBitsToFloat(R0i.x) + -(intBitsToFloat(uf_remappedVS[39].w)));
R124i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(R127i.x));
R2i.z = ((intBitsToFloat(R126i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[36].w)) + intBitsToFloat(uf_remappedVS[39].w));
R126i.y = floatBitsToInt(-(intBitsToFloat(R9i.x)) + 1.0);
// 10
backupReg0i = R124i.x;
backupReg1i = R125i.z;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R127i.y)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(backupReg0i)) + intBitsToFloat(uf_remappedVS[32].z));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R126i.z)) + intBitsToFloat(uf_remappedVS[32].y));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(backupReg1i)) + intBitsToFloat(uf_remappedVS[32].x));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].x), intBitsToFloat(R8i.x)));
// 11
backupReg0i = R126i.w;
R4i.x = ((intBitsToFloat(R3i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.y = floatBitsToInt(-(intBitsToFloat(R3i.w)) + 1.0);
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].y)) + intBitsToFloat(uf_remappedVS[38].y));
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].x)) + intBitsToFloat(uf_remappedVS[38].x));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 12
backupReg0i = R126i.y;
backupReg1i = R125i.w;
backupReg2i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(R127i.w) * 0.0);
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].z)) + intBitsToFloat(uf_remappedVS[38].z));
R9i.z = floatBitsToInt(-(intBitsToFloat(R124i.z)) + 1.0);
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(backupReg0i)));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i),intBitsToFloat(R124i.x)) + intBitsToFloat(backupReg2i));
// 13
backupReg0i = R8i.x;
R8i.x = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(R9i.w));
R2i.y = ((intBitsToFloat(R8i.w) == 0.0)?(0):(R125i.x));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].z), intBitsToFloat(backupReg0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].y), intBitsToFloat(backupReg0i)));
R1i.y = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(R9i.w));
// 14
backupReg0i = R127i.y;
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[36].x)) + intBitsToFloat(uf_remappedVS[39].x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R124i.x)) + intBitsToFloat(PV1iw));
R125i.z = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(R9i.w));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R124i.x)) + intBitsToFloat(PV1iz));
R126i.w = floatBitsToInt(-(intBitsToFloat(R2i.z)) + 1.0);
// 15
R127i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(R127i.z));
PV1iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[39].w)) + intBitsToFloat(uf_remappedVS[40].w));
PV1iz = floatBitsToInt(intBitsToFloat(R0i.x) + -(intBitsToFloat(uf_remappedVS[40].w)));
R9i.w = floatBitsToInt(-(intBitsToFloat(R4i.x)) + 1.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R125i.y)));
// 16
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(uf_remappedVS[34].y));
R0i.y = ((intBitsToFloat(PV1iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R124i.y)) + intBitsToFloat(uf_remappedVS[37].x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R8i.z)) + intBitsToFloat(uf_remappedVS[34].x));
R125i.x = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 17
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[37].x), intBitsToFloat(R9i.z)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R1i.w)) + intBitsToFloat(uf_remappedVS[34].z));
R126i.z = floatBitsToInt(trunc(intBitsToFloat(R126i.x)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(R126i.w)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R125i.w)) + intBitsToFloat(R9i.y));
// 18
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(PV1ix));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R125i.w)) + intBitsToFloat(R127i.y));
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[39].x)) + intBitsToFloat(uf_remappedVS[40].x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(R125i.w)) + intBitsToFloat(R124i.w));
R126i.x = floatBitsToInt(-(intBitsToFloat(R0i.y)) + 1.0);
// 19
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[41].y), intBitsToFloat(R2i.w)));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[42].w) + intBitsToFloat(uf_remappedVS[41].y));
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[42].z) + intBitsToFloat(uf_remappedVS[41].x));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[41].x), intBitsToFloat(R1i.x)));
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 2.0);
R125i.w = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(R125i.x));
// 20
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R127i.x)) + intBitsToFloat(uf_remappedVS[36].x));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R9i.w)));
R127i.z = floatBitsToInt(-(intBitsToFloat(PV1iw)) + intBitsToFloat(PV1iz));
R3i.w = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(PV1iy));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R8i.x)) + intBitsToFloat(uf_remappedVS[35].x));
// 21
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R122i.x),intBitsToFloat(R126i.w)) + intBitsToFloat(R124i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R125i.z)) + intBitsToFloat(uf_remappedVS[35].z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R1i.y)) + intBitsToFloat(uf_remappedVS[35].y));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(PV0iy)) + intBitsToFloat(R124i.x));
R124i.x = int(intBitsToFloat(R2i.y));
// 22
backupReg0i = R127i.y;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(R126i.w)) + intBitsToFloat(R127i.w));
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[43].x) + intBitsToFloat(uf_remappedVS[43].z));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R126i.w)) + intBitsToFloat(backupReg0i));
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[43].y) + intBitsToFloat(uf_remappedVS[43].w));
R2i.x = int(intBitsToFloat(R126i.z));
// 23
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R125i.w)) + intBitsToFloat(uf_remappedVS[39].x));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R126i.x)));
R125i.w = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[33].z));
// 24
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[43].z),intBitsToFloat(R1i.z)) + intBitsToFloat(R127i.y));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(PV1iw)) + intBitsToFloat(R124i.w));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[43].w),intBitsToFloat(R3i.y)) + intBitsToFloat(R127i.w));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[33].w));
// 25
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[33].y), intBitsToFloat(PS0i)));
R1i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.y)),intBitsToFloat(uf_remappedVS[42].x)) + -(intBitsToFloat(R127i.z)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[33].x), intBitsToFloat(R125i.w)));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(uf_remappedVS[42].y)) + intBitsToFloat(R3i.w));
R3i.y = floatBitsToInt(float(R124i.x));
}
if( activeMaskStackC[3] == true ) {
// 0
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].x),intBitsToFloat(R2i.z)) + intBitsToFloat(R8i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].y),intBitsToFloat(R2i.z)) + intBitsToFloat(R0i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].z),intBitsToFloat(R2i.z)) + intBitsToFloat(R1i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(R3i.y)) + intBitsToFloat(R1i.y));
PS0i = floatBitsToInt(float(R2i.x));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.x)),intBitsToFloat(PS0i)) + intBitsToFloat(R3i.w));
R124i.y = uf_remappedVS[44].x;
R126i.z = uf_remappedVS[44].y;
R125i.w = uf_remappedVS[44].z;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(R5i.x)) + intBitsToFloat(R123i.w));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[18].x) * 1.0);
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.x)),intBitsToFloat(R3i.z)) + -(intBitsToFloat(R123i.x)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(uf_remappedVS[41].w)) + intBitsToFloat(R9i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(uf_remappedVS[41].z)) + intBitsToFloat(R3i.x));
// 3
backupReg0i = R0i.y;
backupReg1i = R123i.w;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(uf_remappedVS[45].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(uf_remappedVS[45].y)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(PV0ix)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].x),intBitsToFloat(backupReg0i)) + intBitsToFloat(R2i.y));
R127i.y = floatBitsToInt(-(intBitsToFloat(backupReg1i)) + 1.0);
// 4
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(uf_remappedVS[46].x)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(uf_remappedVS[46].y)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(uf_remappedVS[45].z)));
R124i.w = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(uf_remappedVS[45].w)));
// 5
R124i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[47].y)), intBitsToFloat(R4i.w)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[47].x), intBitsToFloat(R4i.z)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(uf_remappedVS[46].z)));
// 6
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[48].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[48].x)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[48].x)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[47].z));
// 7
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R124i.y)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[47].w));
// 8
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R124i.x)));
R14i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.w)),intBitsToFloat(R127i.y)) + intBitsToFloat(R127i.w));
R14i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R124i.w)) + intBitsToFloat(R125i.y));
}
if( activeMaskStackC[3] == true ) {
// 0
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z),intBitsToFloat(R3i.z)) + 0.0);
R7i.y = uf_remappedVS[49].x;
PV0iw = uf_remappedVS[50].x;
// 1
R11i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedVS[46].w)));
}
if( activeMaskStackC[3] == true ) {
// 0
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[48].x), intBitsToFloat(R1i.x)));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[48].x), intBitsToFloat(R1i.y)));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[48].x), intBitsToFloat(R1i.z)));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.y), intBitsToFloat(R7i.z), intBitsToFloat(R7i.z));
}
