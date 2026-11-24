#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader e2ce61b2dce7d8d5
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[43];
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
out vec4 passParameterSem11;
out vec4 passParameterSem12;
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
ivec4 R20i = ivec4(0);
ivec4 R122i = ivec4(0);
ivec4 R123i = ivec4(0);
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
R9i.y = floatBitsToInt(-(intBitsToFloat(R2i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R2i.w = 0;
R3i.w = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R9i.y));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R10i.x = 0;
R10i.y = 0;
R10i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R11i.x = 0;
// 1
R4i.w = R3i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R4i.w = R2i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R4i.w == 0);
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
R7i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R9i.y) >= intBitsToFloat(R7i.z));
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
R11i.x = 0;
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
R0i.z = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
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
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].x), intBitsToFloat(R127i.y)));
// 2
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].x), intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R10i.x = 0;
// 1
R13i.x = R10i.x;
// 2
R12i.x = R10i.x;
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
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].y), intBitsToFloat(R127i.x)));
// 2
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R13i.y = 0;
R12i.y = 0;
// 1
R10i.y = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (intBitsToFloat(R0i.z) > 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R0i.z));
// 1
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].z), intBitsToFloat(R127i.x)));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].z), intBitsToFloat(R127i.x)));
// 2
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R13i.z = 0;
R12i.z = 0;
// 1
R10i.z = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(uf_remappedVS[5].y)));
PV0iy = floatBitsToInt(max(intBitsToFloat(R5i.x), 0.0));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(uf_remappedVS[5].z)));
// 1
R9i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(R9i.y));
PV1iw = floatBitsToInt(min(intBitsToFloat(PV0iy), 0.0));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(uf_remappedVS[6].w)));
// 2
R0i.x = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV1iw));
// 3
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[5].x)));
// 4
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(uf_remappedVS[6].y)));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[6].z)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R14i.z = ((intBitsToFloat(uf_remappedVS[7].x) == 1.0)?-1:0);
R1i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].x)) + 1.0);
// 1
predResult = (R14i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(R9i.z)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].w), intBitsToFloat(PV0ix)));
// 2
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x), intBitsToFloat(PV1iw)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].y), intBitsToFloat(PV1iw)));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].z), intBitsToFloat(PV1iw)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
tempResultf = max(0.0, abs(intBitsToFloat(uf_remappedVS[7].x)));
tempResultf = log2(tempResultf);
PS0i = floatBitsToInt(tempResultf);
// 1
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f317218));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[7].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(PS1i)));
R127i.y = ((intBitsToFloat(uf_remappedVS[7].x) == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R1i.w));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R9i.z) + -(intBitsToFloat(PV1iz)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].w), intBitsToFloat(PV1ix)));
// 9
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x), intBitsToFloat(PV0iw)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].y), intBitsToFloat(PV0iw)));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].z), intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = uf_remappedVS[9].x;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R0i.w)));
PV0iz = uf_remappedVS[9].y;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
R0i.w = 0x3f800000;
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[7].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV0iz));
R3i.w = 0x3f800000;
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R1i.w));
// 2
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1iy)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(intBitsToFloat(R5i.y) + 1.0);
PV0iw = floatBitsToInt(intBitsToFloat(R5i.x) + 1.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
// 3
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedVS[10].x)));
PV1iy = floatBitsToInt(intBitsToFloat(R5i.z) + 1.0);
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(uf_remappedVS[10].x)));
PV1iw = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PS1i = ((intBitsToFloat(R9i.y) == 0.0)?-1:0);
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(R127i.y));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(uf_remappedVS[11].w)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(uf_remappedVS[10].x)));
R127i.w = ((PS1i == 0)?(R9i.y):(0x3f800000));
R1i.w = floatBitsToInt(1.0);
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R10i.y)));
R123i.z = ((R14i.z == 0)?(PV0ix):(R9i.z));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 6
backupReg0i = R123i.z;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(backupReg0i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(backupReg0i)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R10i.z)) + intBitsToFloat(PV1ix));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(backupReg0i)));
R2i.x = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
R2i.x = clampFI32(R2i.x);
// 7
R19i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R10i.x)) + intBitsToFloat(R123i.z));
PV1iy = floatBitsToInt(intBitsToFloat(R6i.z) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(PV0iy));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R12i.z)));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1iz)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1iy)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1iw)));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R12i.y)) + intBitsToFloat(PS1i));
// 9
R1i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV0ix));
R1i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV0iz));
R1i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R13i.z)));
R19i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R12i.x)) + intBitsToFloat(R122i.x));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(PV1iw),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R19i.z = tempi.x;
PV0iw = tempi.x;
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R5i.w = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),intBitsToFloat(uf_remappedVS[13].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R2i.w = tempi.x;
R4i.w = PV0ix;
// 2
R3i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(PV1ix)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R4i.y),intBitsToFloat(R0i.y),intBitsToFloat(R3i.w))));
PV0iy = R3i.x;
PV0iz = R3i.x;
PV0iw = R3i.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),intBitsToFloat(R12i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R4i.y),intBitsToFloat(R0i.y),intBitsToFloat(R3i.w))));
PV1ix = tempi.x;
R2i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.y = floatBitsToInt(intBitsToFloat(R3i.x) + intBitsToFloat(R4i.x));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[14].x),intBitsToFloat(uf_remappedVS[14].y),intBitsToFloat(uf_remappedVS[14].z),intBitsToFloat(uf_remappedVS[14].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R0i.w = tempi.x;
R127i.x = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R4i.z));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(PV0ix)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R4i.y),intBitsToFloat(R0i.y),intBitsToFloat(R3i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R2i.z = tempi.x;
PV1iw = tempi.x;
// 6
PV0iz = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(R127i.x));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R0i.z));
// 7
R1i.y = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0iz));
// 8
predResult = (intBitsToFloat(uf_remappedVS[15].y) != 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0iy = uf_remappedVS[12].w;
PV0iz = uf_remappedVS[13].w;
// 1
R127i.x = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(R3i.x)));
R127i.y = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(R2i.y)));
PV1iw = uf_remappedVS[14].w;
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[15].y));
// 2
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(R2i.z)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 5
PV1iy = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(R127i.z));
PV1iy = clampFI32(PV1iy);
// 6
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV1iy)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[13].w) + intBitsToFloat(uf_remappedVS[12].w));
R0i.y = 0;
PV0iz = ((intBitsToFloat(R5i.x) > 0.5)?-1:0);
PV0iw = floatBitsToInt(-(intBitsToFloat(R7i.x)) + 1.0);
R127i.w = ((intBitsToFloat(R5i.y) > 0.5)?-1:0);
// 1
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[16].w)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(uf_remappedVS[16].z)));
PV1iz = floatBitsToInt(-(intBitsToFloat(R7i.y)) + 1.0);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].z), intBitsToFloat(uf_remappedVS[16].w)));
R2i.w = ((PV0iz == 0)?(R7i.x):(PV0iw));
// 2
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.y), intBitsToFloat(uf_remappedVS[17].x)));
R1i.z = ((R127i.w == 0)?(R7i.y):(PV1iz));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[14].w) + intBitsToFloat(backupReg0i));
R13i.w = 0;
// 3
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * 0.25 + 0.5);
R123i.x = clampFI32(R123i.x);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), intBitsToFloat(uf_remappedVS[11].x)));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3dd70a3d));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].y), intBitsToFloat(uf_remappedVS[16].z)));
PV0iy = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R127i.x));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R126i.x));
// 5
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV0ix)));
PV1iy = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + 8.5);
// 6
R0i.x = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3daaaaab));
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.w = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
// 7
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
// 8
R123i.z = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 9
R127i.y = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
R127i.z = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
// 10
PS0i = floatBitsToInt(sin((intBitsToFloat(R127i.z))/0.1591549367));
// 11
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R126i.y)));
PS1i = floatBitsToInt(cos((intBitsToFloat(R127i.z))/0.1591549367));
// 12
R1i.x = floatBitsToInt(intBitsToFloat(R3i.x) + intBitsToFloat(PV1iz));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(sin((intBitsToFloat(R127i.y))/0.1591549367));
// 13
R18i.x = R1i.x;
R0i.z = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R127i.x)));
// 14
R1i.y = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(PV1iw));
// 15
R18i.y = R1i.y;
R18i.z = R0i.z;
}
if( activeMaskStackC[3] == true ) {
R14i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
R10i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R0i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[18].x),intBitsToFloat(uf_remappedVS[18].y),intBitsToFloat(uf_remappedVS[18].z),intBitsToFloat(uf_remappedVS[18].w))));
PV0iy = R10i.x;
PV0iz = R10i.x;
PV0iw = R10i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R0i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[19].x),intBitsToFloat(uf_remappedVS[19].y),intBitsToFloat(uf_remappedVS[19].z),intBitsToFloat(uf_remappedVS[19].w))));
PV1ix = tempi.x;
R10i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R0i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R10i.z = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R0i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R10i.w = tempi.x;
// 4
R127i.x = floatBitsToInt(-(intBitsToFloat(R1i.x)) + intBitsToFloat(uf_remappedVS[22].x));
R127i.y = PV1ix;
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) / 2.0);
R127i.z = floatBitsToInt(-(intBitsToFloat(R1i.y)) + intBitsToFloat(uf_remappedVS[22].y));
R127i.w = floatBitsToInt(-(intBitsToFloat(R0i.z)) + intBitsToFloat(uf_remappedVS[22].z));
// 5
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(uf_remappedVS[23].x)));
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) * 2.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(uf_remappedVS[23].y)));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) * 2.0);
R12i.z = floatBitsToInt(intBitsToFloat(R10i.z) * 0.5 + intBitsToFloat(R127i.y));
R12i.w = floatBitsToInt(intBitsToFloat(R10i.z) * 0.0 + intBitsToFloat(R10i.w));
R126i.w = int(intBitsToFloat(uf_remappedVS[24].z));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R12i.w));
// 7
backupReg0i = R127i.y;
R125i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[25].w) + intBitsToFloat(uf_remappedVS[23].y));
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[25].z) + intBitsToFloat(uf_remappedVS[23].x));
PV1iz = floatBitsToInt(intBitsToFloat(R12i.z) * intBitsToFloat(PS0i));
R125i.w = floatBitsToInt(intBitsToFloat(R10i.z) * 0.0 + intBitsToFloat(backupReg0i));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 8
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS1i)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(uf_remappedVS[1].w)) + -(intBitsToFloat(uf_remappedVS[1].y)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS1i)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PS1i)));
R127i.z = floatBitsToInt(float(R126i.w));
// 9
PV1ix = floatBitsToInt((0.0 >= abs(intBitsToFloat(R127i.z)))?1.0:0.0);
PV1iy = floatBitsToInt(-(abs(intBitsToFloat(R127i.z))) + 0.0);
PV1iz = floatBitsToInt(-(intBitsToFloat(R126i.x)) + intBitsToFloat(R127i.y));
PV1iw = floatBitsToInt(-(intBitsToFloat(R126i.y)) + intBitsToFloat(R125i.x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.y));
// 10
R126i.x = ((intBitsToFloat(PV1ix) == 0.0)?(0):(PV1iy));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.y)),intBitsToFloat(uf_remappedVS[25].x)) + -(intBitsToFloat(PV1iz)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),intBitsToFloat(uf_remappedVS[25].y)) + intBitsToFloat(PV1iw));
R1i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 11
R1i.x = uf_remappedVS[26].x;
PV1iy = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
PV1iz = floatBitsToInt(abs(intBitsToFloat(R127i.z)) + intBitsToFloat(R126i.x));
R4i.w = uf_remappedVS[26].y;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[24].z));
// 12
PV0ix = floatBitsToInt(trunc(intBitsToFloat(PV1iy)));
R123i.y = ((-(intBitsToFloat(R126i.x)) > 0.0)?(PV1iz):(R126i.x));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[24].x), intBitsToFloat(PS1i)));
R126i.x = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[24].w));
// 13
R123i.x = ((intBitsToFloat(R127i.z) == 0.0)?(0):(R123i.y));
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[27].x) + intBitsToFloat(uf_remappedVS[27].z));
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[27].y) + intBitsToFloat(uf_remappedVS[27].w));
R127i.w = int(intBitsToFloat(PV0ix));
// 14
backupReg0i = R5i.x;
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[24].y), intBitsToFloat(R126i.x)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(uf_remappedVS[27].w)) + intBitsToFloat(PV1iz));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(uf_remappedVS[27].z)) + intBitsToFloat(PV1iy));
PS0i = int(intBitsToFloat(R123i.x));
// 15
R2i.x = uf_remappedVS[26].z;
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),intBitsToFloat(uf_remappedVS[23].w)) + intBitsToFloat(R123i.y));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),intBitsToFloat(uf_remappedVS[23].z)) + intBitsToFloat(R123i.w));
PS1i = floatBitsToInt(float(PS0i));
// 16
R12i.x = floatBitsToInt(intBitsToFloat(R10i.x) * 0.5 + intBitsToFloat(R125i.w));
R12i.y = floatBitsToInt(intBitsToFloat(R10i.y) * -(0.5) + intBitsToFloat(R125i.w));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(PS1i)) + intBitsToFloat(R127i.y));
PS0i = floatBitsToInt(float(R127i.w));
// 17
R5i.y = uf_remappedVS[22].y;
R3i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.x)),intBitsToFloat(PS0i)) + intBitsToFloat(R126i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[28].x),intBitsToFloat(uf_remappedVS[28].y),intBitsToFloat(uf_remappedVS[28].z),0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(intBitsToFloat(uf_remappedVS[28].y) + 1.0);
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(uf_remappedVS[29].x)) + -(intBitsToFloat(uf_remappedVS[29].y)));
R123i.x = clampFI32(R123i.x);
PV1iy = floatBitsToInt(intBitsToFloat(PS0i) * 1.5);
PV1iy = clampFI32(PV1iy);
R126i.z = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
R127i.w = uf_remappedVS[30].x & 0x80000;
R127i.y = uf_remappedVS[30].x & 0x100000;
// 2
R126i.x = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
PV0iy = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
R123i.z = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(uf_remappedVS[31].x)) + -(intBitsToFloat(uf_remappedVS[31].y)));
R123i.w = clampFI32(R123i.w);
R1i.y = floatBitsToInt(intBitsToFloat(PV1iy) * 15.0);
// 3
R125i.x = (R127i.y == 0x100000)?-1:0;
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(0xbe593484));
R127i.z = (R127i.w == 0x80000)?-1:0;
R0i.w = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
tempResultf = max(0.0, intBitsToFloat(PV0iy));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 4
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].x), intBitsToFloat(PS1i)));
R2i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[28].y) * 1.0 + intBitsToFloat(R1i.w));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].y), intBitsToFloat(PS1i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R123i.y)) + intBitsToFloat(0x3fc90da4));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(R126i.x)));
// 5
R123i.x = ((R125i.x == 0)?(R7i.y):(R1i.z));
PV1iy = floatBitsToInt(min(intBitsToFloat(R5i.y), intBitsToFloat(uf_remappedVS[33].z)));
R123i.z = ((R127i.z == 0)?(R7i.x):(R2i.w));
PV1iw = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f22f983));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 6
backupReg0i = R5i.x;
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),-(intBitsToFloat(R127i.w))) + 1.0);
R5i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R2i.z)) + -(0.5));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(backupReg0i)) + -(0.5));
R1i.z = floatBitsToInt(-(intBitsToFloat(R5i.w)) + intBitsToFloat(PV1iy));
}
if( activeMaskStackC[3] == true ) {
R7i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y))).xyz);
}
if( activeMaskStackC[3] == true ) {
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R2i.z)) + intBitsToFloat(R3i.z));
R127i.y = uf_remappedVS[34].z;
R127i.z = uf_remappedVS[34].x;
R127i.w = uf_remappedVS[34].y;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R2i.w)) + -(intBitsToFloat(R3i.w)));
// 1
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(uf_remappedVS[35].x)));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(uf_remappedVS[35].y)));
PV1iw = uf_remappedVS[36].x;
R17i.x = floatBitsToInt(intBitsToFloat(R123i.x) + 0.5);
// 2
PV0ix = uf_remappedVS[37].x;
R17i.y = floatBitsToInt(intBitsToFloat(R125i.x) + 0.5);
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(uf_remappedVS[35].z)));
R15i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(uf_remappedVS[35].w)));
R17i.z = 0;
// 3
backupReg0i = R1i.y;
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(uf_remappedVS[38].x)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(uf_remappedVS[38].y)));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(uf_remappedVS[38].z)));
R16i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedVS[38].w)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R2i.y) * intBitsToFloat(PS1i));
tempResultf = max(0.0, intBitsToFloat(R0i.w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R2i.z = floatBitsToInt(tempResultf);
// 5
PV1iz = floatBitsToInt(max(intBitsToFloat(PV0ix), intBitsToFloat(0x3e4ccccd)));
R3i.z = floatBitsToInt(exp2(intBitsToFloat(R0i.x)));
// 6
PV0iw = floatBitsToInt(min(intBitsToFloat(PV1iz), 1.0));
// 7
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(PV0iw)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PV0iw)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(PV0iw)));
R7i.x = uf_remappedVS[6].x;
}
if( activeMaskStackC[3] == true ) {
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[32].z)),intBitsToFloat(R3i.z)) + intBitsToFloat(uf_remappedVS[32].z));
R123i.x = clampFI32(R123i.x);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[31].w), intBitsToFloat(R2i.z)));
// 1
R125i.x = floatBitsToInt(intBitsToFloat(R123i.x) + intBitsToFloat(0x80000000));
R125i.x = clampFI32(R125i.x);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[33].y),intBitsToFloat(R1i.z)) + intBitsToFloat(uf_remappedVS[33].x));
R127i.y = clampFI32(R127i.y);
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(uf_remappedVS[39].x)));
// 2
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].x), intBitsToFloat(R2i.x)));
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(uf_remappedVS[39].x)));
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(uf_remappedVS[39].x)));
R0i.w = R125i.x;
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].x), intBitsToFloat(R1i.y)));
// 3
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(uf_remappedVS[40].w)));
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].x), intBitsToFloat(R4i.z)));
PS1i = floatBitsToInt(exp2(intBitsToFloat(R126i.y)));
// 4
R13i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)),intBitsToFloat(uf_remappedVS[41].w)) + intBitsToFloat(uf_remappedVS[41].w));
R13i.z = R125i.x;
}
if( activeMaskStackC[3] == true ) {
// 0
R11i.x = floatBitsToInt(intBitsToFloat(R7i.x) * 1.0 + 0.0);
R11i.y = uf_remappedVS[42].x;
// 1
R20i.x = R8i.x;
R20i.y = R8i.y;
R20i.z = R8i.z;
R20i.w = R8i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.w));
// export
passParameterSem12 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.z));
// export
passParameterSem8 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.z));
}
