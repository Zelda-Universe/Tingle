#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 6f5649a4b0d4153d
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[36];
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
out vec4 passParameterSem1;
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
ivec4 R18i = ivec4(0);
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
attrDecoder = attrDataSem8;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R9i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem7;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem2;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R17i.y = floatBitsToInt(-(intBitsToFloat(R5i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R1i.w = 0;
R2i.w = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R17i.y));
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
R15i.x = 0;
// 1
R3i.w = R2i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R3i.w = R1i.w;
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
PS0i = int(intBitsToFloat(R4i.w));
// 1
R10i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R17i.y) >= intBitsToFloat(R10i.z));
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
R15i.x = 0;
// 1
R1i.w = R2i.w;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R1i.w == 0);
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
R0i.y = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 3
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
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R0i.w));
// 1
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].y), intBitsToFloat(R127i.x)));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), intBitsToFloat(R127i.x)));
// 2
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].y), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R4i.y = 0;
R12i.z = 0;
R1i.w = 0;
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
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R0i.y));
// 1
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), intBitsToFloat(R127i.y)));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].z), intBitsToFloat(R127i.y)));
// 2
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].z), intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R4i.x = 0;
R5i.z = 0;
R2i.w = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = uf_remappedVS[5].x & 0x40000;
R127i.y = uf_remappedVS[5].x & 0x20000;
PV0iz = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(R8i.y));
PV0iw = uf_remappedVS[5].x & 0x10000;
PS0i = floatBitsToInt(intBitsToFloat(R8i.y) + intBitsToFloat(R8i.z));
// 1
R126i.x = floatBitsToInt(intBitsToFloat(PV0iz) * 0.5);
R125i.y = floatBitsToInt(intBitsToFloat(PS0i) * 0.5);
PV1iz = R8i.y;
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 2.0);
R127i.w = R8i.z;
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
PS1i = floatBitsToInt(float(PV0iw));
// 2
backupReg0i = R127i.y;
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R127i.y = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(R8i.z));
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R126i.w = floatBitsToInt(floor(intBitsToFloat(PV1iz)));
PS0i = floatBitsToInt(float(backupReg0i));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iz)));
R124i.y = floatBitsToInt(floor(intBitsToFloat(R127i.w)));
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PS1i = floatBitsToInt(float(R127i.x));
// 4
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iw)));
R127i.z = R8i.x;
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 2.0);
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R126i.y = int(intBitsToFloat(PV1ix));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0ix)));
PV1iy = 0 - R126i.y;
R124i.z = floatBitsToInt(intBitsToFloat(R127i.y) * 0.5);
R125i.w = floatBitsToInt(intBitsToFloat(R126i.x) + -(0.5));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) * 2.0);
R126i.x = int(intBitsToFloat(PV0iy));
// 6
R127i.x = max(R126i.y, PV1iy);
R125i.y = floatBitsToInt(intBitsToFloat(R125i.y) + -(0.5));
R125i.y = floatBitsToInt(intBitsToFloat(R125i.y) * 2.0);
PV0iz = 0 - R126i.x;
R127i.w = floatBitsToInt((intBitsToFloat(R126i.w) > 0.0)?1.0:0.0);
R126i.z = int(intBitsToFloat(PV1ix));
// 7
PV1ix = 0 - R126i.z;
R126i.y = floatBitsToInt((0.0 > intBitsToFloat(R126i.w))?1.0:0.0);
R125i.z = floatBitsToInt((intBitsToFloat(R124i.y) > 0.0)?1.0:0.0);
R126i.w = max(R126i.x, PV0iz);
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[6].w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 8
R125i.x = floatBitsToInt(floor(intBitsToFloat(R127i.z)));
R127i.y = max(R126i.z, PV1ix);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(R124i.y))?1.0:0.0);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.y), intBitsToFloat(PS1i)));
R126i.x = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[7].x));
// 9
backupReg0i = R126i.y;
backupReg1i = R125i.z;
R124i.x = floatBitsToInt((intBitsToFloat(uf_remappedVS[7].x) > 0.0)?1.0:0.0);
R126i.y = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[7].x))?1.0:0.0);
R125i.z = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(backupReg0i)));
R127i.w = floatBitsToInt(intBitsToFloat(backupReg1i) + -(intBitsToFloat(PV0iz)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(uf_remappedVS[8].y)));
// 10
backupReg0i = R125i.y;
backupReg1i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R124i.z) + -(0.5));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(uf_remappedVS[9].x)));
R124i.z = floatBitsToInt(intBitsToFloat(R17i.y) * intBitsToFloat(R126i.x));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[9].y)));
R125i.w = floatBitsToInt(float(backupReg1i));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) * 2.0);
// 11
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].w)) + 1.0);
R126i.y = floatBitsToInt(intBitsToFloat(R124i.x) + -(intBitsToFloat(R126i.y)));
PV1iz = floatBitsToInt((intBitsToFloat(backupReg0i) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(backupReg0i))?1.0:0.0);
PS1i = floatBitsToInt(float(R126i.w));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 12
backupReg0i = R124i.y;
R124i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.w)), intBitsToFloat(R125i.z)));
R124i.y = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iw)));
R125i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(R127i.w)));
R127i.w = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(R124i.z));
PS0i = floatBitsToInt(exp2(intBitsToFloat(R124i.w)));
// 13
backupReg0i = R125i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[9].z)));
R125i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].y) + intBitsToFloat(R0i.w));
R127i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(uf_remappedVS[6].x));
R125i.w = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R10i.z));
// 14
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(intBitsToFloat(R8i.x) + -(0.5));
R127i.y = floatBitsToInt(fract(intBitsToFloat(R127i.w)));
R124i.z = floatBitsToInt(intBitsToFloat(R17i.y) * intBitsToFloat(PS1i));
R127i.w = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
PS0i = floatBitsToInt(float(backupReg0i));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 15
backupReg0i = R124i.y;
backupReg1i = R125i.x;
R125i.x = floatBitsToInt(intBitsToFloat(R8i.y) + -(0.5));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R124i.x)));
R126i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].z) + intBitsToFloat(R127i.x));
R124i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(backupReg0i)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(backupReg1i));
// 16
R127i.x = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R124i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R125i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R125i.z)));
R124i.x = ((intBitsToFloat(uf_remappedVS[6].w) == 1.0)?-1:0);
// 17
backupReg0i = R125i.y;
R0i.x = floatBitsToInt(intBitsToFloat(R3i.x) + intBitsToFloat(PV0iy));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R127i.w)));
R0i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV0iw));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(R124i.y));
R124i.z = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(PV0iz));
// 18
backupReg0i = R124i.w;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R127i.y)));
R127i.y = floatBitsToInt(intBitsToFloat(R8i.z) + -(0.5));
R4i.z = ((R124i.x == 0)?(R127i.x):(R17i.y));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(backupReg0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(backupReg0i)));
// 19
R12i.x = R1i.w;
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(uf_remappedVS[10].x)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(uf_remappedVS[10].y)));
R1i.w = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(PV0ix));
// 20
R4i.x = R4i.x;
R0i.y = R2i.w;
R124i.w = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(R124i.w));
R126i.x = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV1iy));
// 21
backupReg0i = R3i.z;
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[11].w)) + intBitsToFloat(uf_remappedVS[12].w));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R4i.z)));
R3i.z = floatBitsToInt(intBitsToFloat(R4i.x) * intBitsToFloat(0x3a83126f));
R127i.w = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(R127i.z));
R3i.x = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(0x3a83126f));
// 22
R5i.x = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(uf_remappedVS[10].z)));
R5i.z = floatBitsToInt(intBitsToFloat(R5i.z) * intBitsToFloat(0x3a83126f));
R0i.w = floatBitsToInt(intBitsToFloat(R124i.z) + intBitsToFloat(R125i.z));
R0i.y = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 23
R0i.x = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0iy));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R4i.z)));
R0i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[11].z)) + intBitsToFloat(uf_remappedVS[12].z));
R4i.w = floatBitsToInt(intBitsToFloat(R1i.w) + -(intBitsToFloat(uf_remappedVS[12].w)));
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R4i.z)));
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.w = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(R3i.y));
// 1
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[12].w)) + intBitsToFloat(uf_remappedVS[14].w));
R127i.y = floatBitsToInt(intBitsToFloat(R12i.x) + intBitsToFloat(R3i.z));
R125i.z = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(0x358637bd));
R124i.w = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(R3i.x));
R125i.x = floatBitsToInt(intBitsToFloat(R12i.z) + intBitsToFloat(R5i.z));
// 2
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[15].x),intBitsToFloat(uf_remappedVS[15].y),intBitsToFloat(uf_remappedVS[15].z),0.0)));
PV0iy = R127i.x;
PV0iz = R127i.x;
PV0iw = R127i.x;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R125i.z)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),0.0)));
PV1ix = tempi.x;
R125i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.y = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(R4i.x));
// 4
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(R0i.z) * intBitsToFloat(R0i.y));
R3i.y = floatBitsToInt(intBitsToFloat(R1i.w) + -(intBitsToFloat(uf_remappedVS[14].w)));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(R12i.z)) + intBitsToFloat(R127i.w));
R2i.w = floatBitsToInt(intBitsToFloat(R1i.w) + -(intBitsToFloat(uf_remappedVS[11].w)));
R0i.w = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R125i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = ((intBitsToFloat(R123i.z) == 0.0)?-1:0);
// 6
backupReg0i = R127i.y;
backupReg1i = R125i.x;
R125i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[11].y)) + intBitsToFloat(uf_remappedVS[12].y));
R127i.y = ((PS1i == 0)?(R4i.y):(R124i.w));
R2i.z = ((PS1i == 0)?(R12i.x):(backupReg0i));
R126i.w = ((PS1i == 0)?(R12i.z):(backupReg1i));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
R124i.z = floatBitsToInt(tempResultf);
// 7
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[12].z)) + intBitsToFloat(uf_remappedVS[14].z));
R2i.y = ((intBitsToFloat(R4i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.z = floatBitsToInt(intBitsToFloat(R5i.x) * intBitsToFloat(0x3e22f983) + 0.5);
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(0x3e22f983) + 0.5);
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R124i.z)));
// 8
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[14].w)) + intBitsToFloat(uf_remappedVS[17].w));
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R124i.z)));
R125i.z = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(R0i.y));
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R124i.z)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R126i.x)));
// 9
backupReg0i = R127i.x;
R127i.x = ((intBitsToFloat(R2i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[11].x)) + intBitsToFloat(uf_remappedVS[12].x));
R126i.z = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(R0i.w));
R3i.w = ((intBitsToFloat(R3i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R3i.z = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 10
backupReg0i = R126i.y;
R126i.x = floatBitsToInt(fract(intBitsToFloat(R127i.z)));
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[12].y)) + intBitsToFloat(uf_remappedVS[14].y));
R127i.z = floatBitsToInt(-(intBitsToFloat(R2i.y)) + 1.0);
R127i.w = floatBitsToInt(fract(intBitsToFloat(R125i.w)));
R125i.x = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3e22f983) + 0.5);
// 11
R124i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.w)), intBitsToFloat(R15i.y)));
R124i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[14].z)) + intBitsToFloat(uf_remappedVS[17].z));
R0i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)), intBitsToFloat(R16i.y)));
R124i.w = floatBitsToInt(intBitsToFloat(R1i.w) + -(intBitsToFloat(uf_remappedVS[17].w)));
R125i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.z)), intBitsToFloat(R7i.w)));
// 12
backupReg0i = R126i.y;
backupReg1i = R126i.z;
R0i.x = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(R0i.y));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R125i.z)));
R126i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[11].z) + intBitsToFloat(R124i.z));
R1i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(R0i.w));
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(backupReg1i)));
// 13
R4i.x = floatBitsToInt(intBitsToFloat(R124i.y) * intBitsToFloat(R3i.z));
R14i.y = ((intBitsToFloat(R124i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R5i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R15i.y)),-(intBitsToFloat(R127i.y))) + intBitsToFloat(R125i.w));
R125i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[12].x)) + intBitsToFloat(uf_remappedVS[14].x));
R5i.x = floatBitsToInt(-(intBitsToFloat(R3i.w)) + 1.0);
// 14
backupReg0i = R127i.w;
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R127i.z)));
R4i.y = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R127i.z = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[14].y)) + intBitsToFloat(uf_remappedVS[17].y));
R127i.x = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 15
R13i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.w)),-(intBitsToFloat(R126i.w))) + intBitsToFloat(R0i.z));
R12i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R16i.y)),-(intBitsToFloat(R2i.z))) + intBitsToFloat(R124i.x));
R125i.z = floatBitsToInt(fract(intBitsToFloat(R125i.x)));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R5i.x)));
R125i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[11].y) + intBitsToFloat(R126i.y));
// 16
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R0i.x)));
R127i.y = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(R0i.w));
R124i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[12].z) + intBitsToFloat(R2i.x));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R4i.x)));
R126i.y = floatBitsToInt(-(intBitsToFloat(R14i.y)) + 1.0);
// 17
backupReg0i = R127i.z;
R124i.x = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(R3i.z));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(R1i.w)));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[14].x)) + intBitsToFloat(uf_remappedVS[17].x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R3i.x)));
R5i.y = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3e22f983));
// 18
R12i.x = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0x3e22f983));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R126i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].z), intBitsToFloat(R4i.y)));
R126i.w = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R1i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[11].x) + intBitsToFloat(R125i.x));
// 19
R4i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R12i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R13i.x),intBitsToFloat(R12i.y),intBitsToFloat(R5i.z),0.0)));
PV1iy = R4i.x;
PV1iz = R4i.x;
PV1iw = R4i.x;
R2i.x = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0iz));
// 20
R5i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[12].y) + intBitsToFloat(R124i.y));
R0i.y = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(R3i.z));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R124i.x)));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(R127i.y)));
R3i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[14].z) + intBitsToFloat(R125i.w));
// 21
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R5i.w)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R3i.x)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].y), intBitsToFloat(R4i.y)));
R0i.w = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0x3e22f983));
R14i.x = floatBitsToInt(sin((intBitsToFloat(R5i.y))/0.1591549367));
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(R2i.x));
R125i.y = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(R3i.z));
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[12].x) + intBitsToFloat(R4i.w));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R0i.y)));
R124i.w = floatBitsToInt(sin((intBitsToFloat(R12i.x))/0.1591549367));
// 1
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R5i.w)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R13i.y)));
R124i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[14].y) + intBitsToFloat(R0i.z));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(R3i.x)));
tempResultf = 1.0 / sqrt(intBitsToFloat(R4i.x));
R127i.w = floatBitsToInt(tempResultf);
// 2
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(R127i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].x), intBitsToFloat(R4i.y)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R127i.w)));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.x), intBitsToFloat(R124i.w)));
R3i.z = floatBitsToInt(cos((intBitsToFloat(R5i.y))/0.1591549367));
// 3
R124i.x = floatBitsToInt(intBitsToFloat(R124i.x) + intBitsToFloat(R125i.y));
R125i.y = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(R127i.x));
R125i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[14].x) + intBitsToFloat(R125i.w));
R126i.w = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV0iy));
R4i.y = floatBitsToInt(cos((intBitsToFloat(R12i.x))/0.1591549367));
// 4
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R13i.y)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R5i.w)));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R124i.w)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[17].z), intBitsToFloat(R14i.y)));
R12i.x = floatBitsToInt(sin((intBitsToFloat(R0i.w))/0.1591549367));
// 5
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.x), intBitsToFloat(R1i.w)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.x), intBitsToFloat(R127i.w)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R4i.y)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y), intBitsToFloat(R3i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.y), intBitsToFloat(R2i.z)));
// 6
backupReg0i = R127i.y;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(R124i.x));
R127i.y = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(R125i.y));
R124i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(R126i.w));
R126i.w = floatBitsToInt(max(intBitsToFloat(R8i.x), 0.0));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[17].y), intBitsToFloat(R14i.y)));
// 7
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.x), intBitsToFloat(R4i.y)));
R126i.y = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(backupReg0i));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R13i.y)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.x), intBitsToFloat(R5i.z)));
R125i.z = floatBitsToInt(cos((intBitsToFloat(R0i.w))/0.1591549367));
// 8
backupReg0i = R127i.z;
backupReg1i = R126i.w;
R124i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.w)),intBitsToFloat(R2i.z)) + intBitsToFloat(R127i.w));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(R5i.y)));
R127i.z = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R124i.z));
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R16i.y)),intBitsToFloat(R5i.y)) + intBitsToFloat(backupReg0i));
R124i.y = floatBitsToInt(min(intBitsToFloat(backupReg1i), 0.0));
// 9
backupReg0i = R125i.w;
R127i.x = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(R127i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(R127i.y)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[17].x), intBitsToFloat(R14i.y)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.x), intBitsToFloat(R125i.x)));
R13i.y = floatBitsToInt(-(intBitsToFloat(R125i.x)) + intBitsToFloat(backupReg0i));
// 10
backupReg0i = R125i.y;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.x), intBitsToFloat(R125i.z)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R124i.x)));
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R15i.y)),intBitsToFloat(R3i.x)) + intBitsToFloat(backupReg0i));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R126i.w)));
R14i.y = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R127i.z));
// 11
R0i.x = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(R124i.y));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(R127i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(uf_remappedVS[18].w)));
R125i.w = floatBitsToInt(-(intBitsToFloat(R5i.z)) + intBitsToFloat(R125i.w));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.x), intBitsToFloat(R0i.z)));
// 12
backupReg0i = R126i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R124i.x)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R125i.z)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R125i.z)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R126i.w)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R126i.z)));
// 13
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y),intBitsToFloat(R15i.y)) + intBitsToFloat(R125i.y));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R127i.z)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y),intBitsToFloat(R7i.w)) + intBitsToFloat(R127i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R124i.x)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R126i.z)));
// 14
backupReg0i = R14i.y;
R124i.x = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(R127i.y));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(uf_remappedVS[18].z)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R126i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(backupReg0i)));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R3i.x)) + intBitsToFloat(R123i.z));
// 15
backupReg0i = R125i.w;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R7i.w)) + intBitsToFloat(R124i.w));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R5i.y)) + intBitsToFloat(R125i.x));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedVS[18].y)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R15i.y)) + intBitsToFloat(R127i.x));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R126i.z)));
// 16
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R7i.w)) + intBitsToFloat(R127i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y),intBitsToFloat(R16i.y)) + intBitsToFloat(R0i.w));
R0i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.x)),intBitsToFloat(R3i.x)) + intBitsToFloat(R123i.x));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R125i.z)));
R2i.w = 0x3f800000;
// 17
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R15i.y)) + intBitsToFloat(R127i.w));
R15i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.x)),intBitsToFloat(R5i.y)) + intBitsToFloat(R125i.w));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R2i.z)) + intBitsToFloat(R123i.y));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(R126i.x)));
R0i.w = floatBitsToInt(intBitsToFloat(R8i.z) + 1.0);
// 18
backupReg0i = R126i.y;
R9i.x = floatBitsToInt(intBitsToFloat(R8i.x) + 1.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R126i.x)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R16i.y)) + intBitsToFloat(R125i.y));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R16i.y)) + intBitsToFloat(R124i.w));
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R124i.z)));
// 19
backupReg0i = R5i.y;
R12i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.x)),intBitsToFloat(R2i.z)) + intBitsToFloat(R123i.z));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(R127i.y)));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(R124i.z)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R127i.y)));
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(backupReg0i)) + intBitsToFloat(R127i.x));
// 20
backupReg0i = R3i.x;
R3i.x = floatBitsToInt(intBitsToFloat(R8i.y) + 1.0);
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(backupReg0i)) + intBitsToFloat(R125i.x));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R2i.z)) + intBitsToFloat(R124i.w));
PV0iw = ((intBitsToFloat(R17i.y) == 0.0)?-1:0);
// 21
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[15].x),intBitsToFloat(uf_remappedVS[15].y),intBitsToFloat(uf_remappedVS[15].z),intBitsToFloat(uf_remappedVS[15].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R9i.z = tempi.x;
PV1iw = tempi.x;
R2i.z = ((PV0iw == 0)?(R17i.y):(0x3f800000));
// 22
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),intBitsToFloat(uf_remappedVS[16].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R5i.w = tempi.x;
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R15i.y)) + intBitsToFloat(R127i.w));
// 23
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),intBitsToFloat(uf_remappedVS[13].w))));
PV1ix = tempi.x;
R1i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R0i.z)) + intBitsToFloat(R126i.y));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(uf_remappedVS[19].w)));
PV0iy = uf_remappedVS[20].y;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(uf_remappedVS[19].w)));
PV0iw = uf_remappedVS[20].x;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[19].w)));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(uf_remappedVS[19].z)));
PV1iz = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(PV0iy));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R12i.x)) + intBitsToFloat(R7i.w));
// 2
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y), intBitsToFloat(PV1iz)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 3
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R0i.z)) + intBitsToFloat(R1i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R15i.y)) + intBitsToFloat(R5i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R12i.x)) + intBitsToFloat(R5i.z));
R0i.w = floatBitsToInt(intBitsToFloat(R2i.z) * intBitsToFloat(PS0i));
R0i.w = clampFI32(R0i.w);
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R2i.x)) + intBitsToFloat(R123i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R0i.y)) + intBitsToFloat(R123i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R4i.z)) + intBitsToFloat(R123i.w));
// 5
backupReg0i = R1i.y;
R0i.x = floatBitsToInt(intBitsToFloat(R9i.z) + intBitsToFloat(R123i.x));
R1i.y = floatBitsToInt(intBitsToFloat(R5i.w) + intBitsToFloat(R123i.z));
R0i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(R123i.w));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(R124i.z));
R124i.z = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(R126i.y));
PV0iw = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(R125i.x));
// 7
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0ix));
// 8
R1i.x = floatBitsToInt(intBitsToFloat(R124i.z) + intBitsToFloat(PV1iy));
// 9
predResult = (intBitsToFloat(uf_remappedVS[21].x) != 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0iy = uf_remappedVS[16].w;
PV0iz = uf_remappedVS[15].w;
// 1
PV1ix = uf_remappedVS[13].w;
R127i.y = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(R0i.x)));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(R1i.y)));
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[21].x));
// 2
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(R0i.z)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(PV0iz),0.0)));
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
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV1ix)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[15].w) + intBitsToFloat(uf_remappedVS[16].w));
R127i.y = floatBitsToInt(intBitsToFloat(R1i.x) * intBitsToFloat(0x400ccccd));
R124i.z = floatBitsToInt(intBitsToFloat(R0i.w) * intBitsToFloat(0x3ecccccd));
R1i.w = 0x3f800000;
R124i.y = ((intBitsToFloat(R8i.x) > 0.5)?-1:0);
// 1
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[19].y), intBitsToFloat(uf_remappedVS[22].z)));
R125i.y = floatBitsToInt(intBitsToFloat(R124i.z) * intBitsToFloat(0x3ecccccd));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(uf_remappedVS[22].z)));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(0x3ff33333));
R1i.x = floatBitsToInt(-(intBitsToFloat(R10i.x)) + 1.0);
// 2
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R126i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[22].z), intBitsToFloat(PV1iw)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[13].w) + intBitsToFloat(backupReg0i));
PS0i = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40066666));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[22].z), intBitsToFloat(PS0i)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS0i)));
R125i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3dd70a3d));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), intBitsToFloat(uf_remappedVS[22].w)));
R124i.w = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(0x3eb33333));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R127i.y));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R127i.z));
PV0iz = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R127i.x));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R126i.z));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1ix));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV0ix));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R126i.y));
// 6
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
R127i.x = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(R127i.y));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(R127i.z));
R127i.y = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV1iw = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
R127i.w = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
// 8
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3e22f983) + 0.5);
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[19].x), intBitsToFloat(uf_remappedVS[22].y)));
// 9
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R127i.y = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
R123i.z = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.z = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
// 10
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R125i.w)));
PV0iy = floatBitsToInt(fract(intBitsToFloat(backupReg0i)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(uf_remappedVS[22].y)));
R126i.w = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
PS0i = floatBitsToInt(sin((intBitsToFloat(R126i.x))/0.1591549367));
// 11
R123i.x = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R126i.y = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x3e22f983));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R124i.z)));
PS1i = floatBitsToInt(cos((intBitsToFloat(R126i.x))/0.1591549367));
// 12
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[22].y), intBitsToFloat(R125i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(PS1i)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R125i.y)));
PS0i = floatBitsToInt(sin((intBitsToFloat(backupReg0i))/0.1591549367));
// 13
R125i.x = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0x3e22f983));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R127i.x)));
R127i.z = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(R127i.w));
R127i.w = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(sin((intBitsToFloat(R126i.w))/0.1591549367));
// 14
R127i.x = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R127i.y)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[22].y), intBitsToFloat(R124i.w)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R124i.w)));
PS0i = floatBitsToInt(cos((intBitsToFloat(R126i.w))/0.1591549367));
// 15
R1i.x = ((R124i.y == 0)?(R10i.x):(R1i.x));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R126i.w = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iy));
PS1i = floatBitsToInt(sin((intBitsToFloat(R126i.y))/0.1591549367));
// 16
R124i.x = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1iy));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R0i.w)));
R0i.w = R10i.y;
PS0i = floatBitsToInt(sin((intBitsToFloat(R126i.x))/0.1591549367));
// 17
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R124i.z)));
R124i.y = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0iz));
R8i.z = ((intBitsToFloat(R8i.y) > 0.5)?-1:0);
PS1i = floatBitsToInt(cos((intBitsToFloat(R126i.x))/0.1591549367));
// 18
R8i.x = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV1ix));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(sin((intBitsToFloat(R125i.x))/0.1591549367));
// 19
R0i.x = floatBitsToInt(intBitsToFloat(R124i.x) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R125i.w)));
// 20
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R2i.x)) + intBitsToFloat(R4i.x));
R6i.y = floatBitsToInt(intBitsToFloat(R124i.y) + intBitsToFloat(PV1iz));
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R4i.z)) + intBitsToFloat(R1i.z));
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R0i.y)) + intBitsToFloat(R2i.y));
}
if( activeMaskStackC[3] == true ) {
// 0
R14i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R6i.y),intBitsToFloat(R0i.x),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[23].x),intBitsToFloat(uf_remappedVS[23].y),intBitsToFloat(uf_remappedVS[23].z),intBitsToFloat(uf_remappedVS[23].w))));
PV0iy = R14i.x;
PV0iz = R14i.x;
PV0iw = R14i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R6i.y),intBitsToFloat(R0i.x),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[24].x),intBitsToFloat(uf_remappedVS[24].y),intBitsToFloat(uf_remappedVS[24].z),intBitsToFloat(uf_remappedVS[24].w))));
PV1ix = tempi.x;
R14i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R6i.y),intBitsToFloat(R0i.x),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[25].x),intBitsToFloat(uf_remappedVS[25].y),intBitsToFloat(uf_remappedVS[25].z),intBitsToFloat(uf_remappedVS[25].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R14i.z = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R6i.y),intBitsToFloat(R0i.x),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[26].x),intBitsToFloat(uf_remappedVS[26].y),intBitsToFloat(uf_remappedVS[26].z),intBitsToFloat(uf_remappedVS[26].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R14i.w = tempi.x;
// 4
PV0ix = uf_remappedVS[5].x & 0x100000;
PV0iy = PV1ix;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
PV0iw = uf_remappedVS[5].x & 0x80000;
// 5
R123i.x = floatBitsToInt(intBitsToFloat(R14i.z) * 0.0 + intBitsToFloat(PV0iy));
PV1iz = (PV0iw == 0x80000)?-1:0;
R125i.w = (PV0ix == 0x100000)?-1:0;
R18i.z = floatBitsToInt(intBitsToFloat(R14i.z) * 0.5 + intBitsToFloat(PV0iy));
// 6
R18i.x = floatBitsToInt(intBitsToFloat(R14i.x) * 0.5 + intBitsToFloat(R123i.x));
R124i.y = ((PV1iz == 0)?(R10i.y):(R0i.w));
R124i.z = ((PV1iz == 0)?(R10i.x):(R1i.x));
R18i.w = floatBitsToInt(intBitsToFloat(R14i.z) * 0.0 + intBitsToFloat(R14i.w));
R18i.y = floatBitsToInt(intBitsToFloat(R14i.y) * -(0.5) + intBitsToFloat(R123i.x));
// 7
R123i.x = ((R8i.z == 0)?(R124i.z):(R124i.z));
PV1iy = floatBitsToInt(-(intBitsToFloat(R124i.y)) + 1.0);
// 8
backupReg0i = R8i.z;
R8i.z = ((R125i.w == 0)?(R124i.z):(R123i.x));
R123i.w = ((backupReg0i == 0)?(R124i.y):(PV1iy));
// 9
R10i.y = ((R125i.w == 0)?(R124i.y):(R123i.w));
}
if( activeMaskStackC[3] == true ) {
// 0
R124i.x = uf_remappedVS[27].z;
R124i.y = uf_remappedVS[27].y;
R124i.z = uf_remappedVS[27].x;
// 1
R125i.x = uf_remappedVS[28].z;
R127i.y = uf_remappedVS[28].y;
R127i.z = uf_remappedVS[28].x;
// 2
PV0ix = uf_remappedVS[29].x;
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(uf_remappedVS[30].x)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(uf_remappedVS[30].y)));
// 3
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(uf_remappedVS[31].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(uf_remappedVS[31].y)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(uf_remappedVS[31].z)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedVS[31].w)));
// 4
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(uf_remappedVS[32].x)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(uf_remappedVS[32].y)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(uf_remappedVS[32].z)));
// 5
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[33].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[33].x)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[33].x)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[30].z));
// 6
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R125i.z)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[30].w));
// 7
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R125i.w)));
// 8
R4i.z = 0;
}
if( activeMaskStackC[3] == true ) {
// 0
R15i.y = uf_remappedVS[34].x;
PV0iw = uf_remappedVS[35].x;
// 1
R15i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[18].x) * 1.0 + 0.0);
R12i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedVS[32].w)));
}
if( activeMaskStackC[3] == true ) {
// 0
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[33].x), intBitsToFloat(R1i.x)));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[33].x), intBitsToFloat(R1i.y)));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[33].x), intBitsToFloat(R1i.z)));
// 1
R13i.x = R11i.x;
R13i.y = R11i.y;
R13i.z = R11i.z;
R13i.w = R11i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
// export
// skipped export to semanticId 255
// export
passParameterSem7 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
// skipped export to semanticId 255
// export
passParameterSem4 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.z));
// export
passParameterSem8 = vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.z), intBitsToFloat(R4i.z));
}
