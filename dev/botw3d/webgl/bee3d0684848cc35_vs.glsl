#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader bee3d0684848cc35
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[69];
TEXTURE_LAYOUT(39, 0, 0) uniform sampler2D textureUnitVS7;
TEXTURE_LAYOUT(40, 0, 1) uniform sampler2D textureUnitVS8;
TEXTURE_LAYOUT(44, 0, 2) uniform sampler2DArrayShadow textureUnitVS12;
TEXTURE_LAYOUT(45, 0, 3) uniform sampler2D textureUnitVS13;
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

out vec4 passParameterSem0;
out vec4 passParameterSem7;
out vec4 passParameterSem11;
out vec4 passParameterSem14;
out vec4 passParameterSem15;
out vec4 passParameterSem16;
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
bool activeMaskStack[5];
bool activeMaskStackC[6];
activeMaskStack[0] = false;
activeMaskStack[1] = false;
activeMaskStack[2] = false;
activeMaskStack[3] = false;
activeMaskStackC[0] = false;
activeMaskStackC[1] = false;
activeMaskStackC[2] = false;
activeMaskStackC[3] = false;
activeMaskStackC[4] = false;
activeMaskStack[0] = true;
activeMaskStackC[0] = true;
activeMaskStackC[1] = true;
R0i = ivec4(gl_VertexID, 0, 0, gl_InstanceID);
attrDecoder = attrDataSem4;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyz = attrDataSem3.xyz;
attrDecoder.xyz = uvec3((attrDecoder.xyz>>24)|((attrDecoder.xyz>>8)&0xFF00u)|((attrDecoder.xyz<<8)&0xFF0000u)|((attrDecoder.xyz<<24)));
attrDecoder.w = uint(0);
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), 0x3f800000);
attrDecoder = attrDataSem9;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem1;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem2;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem6;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem5;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem0;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R12i.y = floatBitsToInt(-(intBitsToFloat(R3i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R0i.w = 0;
R1i.w = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R12i.y));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R17i.x = 0;
R17i.y = 0;
R17i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R18i.x = 0;
// 1
R3i.w = R1i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R3i.w = R0i.w;
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
PS0i = int(intBitsToFloat(R2i.w));
// 1
R11i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R12i.y) >= intBitsToFloat(R11i.z));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R17i.x = 0;
R17i.y = 0;
R17i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R18i.x = 0;
// 1
R0i.w = R1i.w;
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
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].y), intBitsToFloat(R127i.x)));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), intBitsToFloat(R127i.x)));
// 2
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].y), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R13i.y = 0;
R10i.z = 0;
R2i.w = 0;
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
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), intBitsToFloat(R127i.y)));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].z), intBitsToFloat(R127i.y)));
// 2
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].z), intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R11i.x = 0;
R12i.z = 0;
R5i.w = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(uf_remappedVS[5].y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(uf_remappedVS[5].z)));
PV0iw = floatBitsToInt(max(intBitsToFloat(R6i.x), 0.0));
R12i.x = 0;
// 1
PV1iz = floatBitsToInt(min(intBitsToFloat(PV0iw), 0.0));
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(uf_remappedVS[6].w)));
R7i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(R12i.y));
// 2
R0i.x = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(PV1iz));
// 3
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[5].x)));
// 4
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(uf_remappedVS[6].y)));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[6].z)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R9i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].x)) + 1.0);
R9i.z = ((intBitsToFloat(uf_remappedVS[7].x) == 1.0)?-1:0);
// 1
predResult = (R9i.z != 0);
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
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].w), intBitsToFloat(PV0ix)));
// 2
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x), intBitsToFloat(PV1iw)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].y), intBitsToFloat(PV1iw)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].z), intBitsToFloat(PV1iw)));
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
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(PS1i)));
R127i.y = ((intBitsToFloat(uf_remappedVS[7].x) == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R9i.y));
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
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].w), intBitsToFloat(PV1ix)));
// 9
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x), intBitsToFloat(PV0iw)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].y), intBitsToFloat(PV0iw)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].z), intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[7].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(PS0i)));
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R9i.y));
// 2
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iw)));
// 3
PV1iy = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
// 4
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(R127i.x));
// 5
R123i.z = ((R9i.z == 0)?(PV0iw):(R7i.z));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R123i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R123i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R123i.z)));
// 7
R7i.x = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV0iy));
R7i.y = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(PV0ix));
R7i.z = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV0iw));
// 8
predResult = (R9i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(R12i.y)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].w), intBitsToFloat(PV0ix)));
// 2
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x), intBitsToFloat(PV1iw)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].y), intBitsToFloat(PV1iw)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].z), intBitsToFloat(PV1iw)));
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
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(PS1i)));
R127i.y = ((intBitsToFloat(uf_remappedVS[7].x) == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R9i.y));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R12i.y) + -(intBitsToFloat(PV1iz)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].w), intBitsToFloat(PV1ix)));
// 9
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x), intBitsToFloat(PV0iw)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].y), intBitsToFloat(PV0iw)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].z), intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R127i.w = tempi.x;
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[7].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
R127i.x = uf_remappedVS[9].x & 0x10000;
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(PS0i)));
R126i.z = uf_remappedVS[9].x & 0x40000;
R126i.w = uf_remappedVS[9].x & 0x20000;
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R9i.y));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(R6i.y));
R126i.y = ((intBitsToFloat(0x3a83126f) > intBitsToFloat(R12i.y))?-1:0);
PV0iz = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(R6i.z));
R125i.w = R6i.y;
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) * 2.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 3
PV1ix = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R125i.y = R6i.z;
R125i.y = floatBitsToInt(intBitsToFloat(R125i.y) * 2.0);
R124i.z = floatBitsToInt(intBitsToFloat(PV0ix) * 0.5);
R124i.w = floatBitsToInt(intBitsToFloat(PV0iz) * 0.5);
tempResultf = 1.0 / sqrt(intBitsToFloat(R127i.w));
PS1i = floatBitsToInt(tempResultf);
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(R127i.z));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(PS1i)));
R127i.w = floatBitsToInt(float(R127i.x));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3a83126f));
R127i.y = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3a83126f));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3a83126f));
R123i.w = ((R9i.z == 0)?(PV0iy):(R12i.y));
R127i.x = floatBitsToInt(float(R126i.w));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R123i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R123i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R123i.w)));
R126i.w = floatBitsToInt(intBitsToFloat(R7i.x) + -(intBitsToFloat(PV1ix)));
R125i.x = floatBitsToInt(intBitsToFloat(R7i.y) + -(intBitsToFloat(PV1iz)));
// 7
R126i.x = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(PV0iz));
R127i.y = floatBitsToInt(intBitsToFloat(R7i.z) + -(intBitsToFloat(R127i.y)));
R127i.z = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV0ix));
R124i.x = floatBitsToInt((intBitsToFloat(R127i.w) > 0.0)?1.0:0.0);
// 8
PV0ix = floatBitsToInt((intBitsToFloat(R127i.x) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(R127i.x))?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(R127i.w))?1.0:0.0);
R127i.w = ((R126i.y == 0)?(PV1iw):(R126i.w));
R126i.z = floatBitsToInt(float(R126i.z));
// 9
R123i.x = ((R126i.y == 0)?(R127i.z):(R127i.y));
PV1iy = floatBitsToInt(intBitsToFloat(R124i.x) + -(intBitsToFloat(PV0iz)));
R127i.z = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iy)));
R123i.w = ((R126i.y == 0)?(R126i.x):(R125i.x));
R127i.y = floatBitsToInt((intBitsToFloat(R126i.z) > 0.0)?1.0:0.0);
// 10
backupReg0i = R126i.z;
R125i.x = floatBitsToInt(intBitsToFloat(R7i.x) + -(intBitsToFloat(R127i.w)));
R126i.y = floatBitsToInt(intBitsToFloat(R7i.y) + -(intBitsToFloat(R123i.w)));
R126i.z = floatBitsToInt(intBitsToFloat(R7i.z) + -(intBitsToFloat(R123i.x)));
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(backupReg0i))?1.0:0.0);
R127i.w = int(intBitsToFloat(PV1iy));
// 11
backupReg0i = R127i.z;
R126i.x = floatBitsToInt(intBitsToFloat(R127i.y) + -(intBitsToFloat(PV0iw)));
R127i.y = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(R6i.z));
R127i.z = 0 - R127i.w;
R125i.w = floatBitsToInt(floor(intBitsToFloat(R125i.w)));
R124i.x = int(intBitsToFloat(backupReg0i));
// 12
R9i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),0.0)));
PV0iy = R9i.x;
PV0iz = R9i.x;
PV0iw = R9i.x;
R125i.z = 0 - R124i.x;
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),0.0)));
PV1ix = tempi.x;
R0i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R3i.z = int(intBitsToFloat(R126i.x));
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R0i.z = tempi.x;
PV0iw = tempi.x;
R126i.w = floatBitsToInt(floor(intBitsToFloat(R125i.y)));
// 15
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(intBitsToFloat(R127i.y) * 0.5);
R126i.y = max(backupReg0i, R125i.z);
R127i.z = max(R127i.w, R127i.z);
R127i.w = R6i.x;
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
R3i.y = floatBitsToInt(intBitsToFloat(R124i.z) + -(0.5));
R3i.y = floatBitsToInt(intBitsToFloat(R3i.y) * 2.0);
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R9i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),0.0)));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R3i.w = floatBitsToInt(intBitsToFloat(R124i.w) + -(0.5));
R3i.w = floatBitsToInt(intBitsToFloat(R3i.w) * 2.0);
// 17
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(R125i.w))?1.0:0.0);
PV1iy = 0 - R3i.z;
PV1iz = floatBitsToInt((intBitsToFloat(R126i.w) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(R125i.w) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt((0.0 > intBitsToFloat(R126i.w))?1.0:0.0);
// 18
backupReg0i = R127i.y;
PV0ix = floatBitsToInt(floor(intBitsToFloat(R127i.w)));
R127i.y = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PS1i)));
R125i.z = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1ix)));
R127i.w = max(R3i.z, PV1iy);
PS0i = floatBitsToInt(sqrt(intBitsToFloat(backupReg0i)));
// 19
R3i.x = floatBitsToInt(intBitsToFloat(R124i.x) + -(0.5));
R3i.x = floatBitsToInt(intBitsToFloat(R3i.x) * 2.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PV0ix))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(PV0ix) > 0.0)?1.0:0.0);
R4i.w = ((intBitsToFloat(0x3a83126f) > intBitsToFloat(PS0i))?-1:0);
PS1i = floatBitsToInt(float(R127i.z));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 20
R0i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(R125i.z)));
R10i.y = floatBitsToInt(intBitsToFloat(R6i.y) + -(0.5));
R9i.z = floatBitsToInt(intBitsToFloat(R6i.x) + -(0.5));
R126i.w = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iy)));
PS0i = floatBitsToInt(float(R126i.y));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 21
R10i.x = floatBitsToInt(intBitsToFloat(R6i.z) + -(0.5));
R11i.y = uf_remappedVS[13].y;
R11i.y = floatBitsToInt(intBitsToFloat(R11i.y) / 2.0);
R3i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(R127i.y)));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R0i.x)));
PS1i = floatBitsToInt(float(R127i.w));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 22
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R0i.w = tempi.x;
R9i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(R126i.w)));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(uf_remappedVS[14].x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(uf_remappedVS[14].y)));
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[15].w)) + 1.0);
R0i.w = ((R4i.w == 0)?(R0i.z):(R0i.w));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[15].w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(uf_remappedVS[14].z)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(uf_remappedVS[15].x));
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[15].y) + intBitsToFloat(PV0iy));
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R125i.z = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 3
R126i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[15].z) + intBitsToFloat(R124i.x));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R0i.x)));
PV1iz = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R3i.z)));
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R3i.z)));
// 4
R125i.x = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(R126i.w));
R127i.y = ((intBitsToFloat(uf_remappedVS[15].w) == 1.0)?-1:0);
R126i.z = ((R4i.w == 0)?(R9i.x):(R125i.z));
R126i.w = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1iy));
R127i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(R1i.w));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.w = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R125i.w));
// 6
R0i.x = R2i.w;
R0i.y = ((R4i.w == 0)?(R0i.y):(PV1ix));
R127i.z = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(R124i.x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(uf_remappedVS[16].x)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R9i.y)));
R1i.y = R5i.w;
R125i.z = ((R127i.y == 0)?(R125i.x):(R12i.y));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R9i.y)));
// 8
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y), intBitsToFloat(R0i.w)));
R126i.y = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV1iw));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(uf_remappedVS[16].y)));
R124i.w = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV1ix));
// 9
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(R127i.w));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iz));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R125i.z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(uf_remappedVS[16].z)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R125i.z)));
// 10
backupReg0i = R126i.x;
backupReg1i = R124i.w;
R126i.x = floatBitsToInt(intBitsToFloat(R11i.x) * intBitsToFloat(0x3a83126f));
R125i.y = floatBitsToInt(intBitsToFloat(R1i.y) * intBitsToFloat(0x3a83126f));
R124i.z = floatBitsToInt(intBitsToFloat(R12i.z) * intBitsToFloat(0x3a83126f));
R124i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.y)),intBitsToFloat(R10i.z)) + intBitsToFloat(backupReg0i));
R125i.x = floatBitsToInt(intBitsToFloat(backupReg1i) + intBitsToFloat(PV1iw));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.z),intBitsToFloat(R0i.y),intBitsToFloat(R0i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.z),intBitsToFloat(R0i.y),intBitsToFloat(R0i.w),0.0)));
PV1ix = tempi.x;
R124i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.z = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(R127i.z));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R125i.z)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(R127i.w));
R125i.z = ((intBitsToFloat(R124i.w) == 0.0)?-1:0);
PV0iw = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(R126i.x));
PS0i = floatBitsToInt(intBitsToFloat(R10i.z) + intBitsToFloat(R124i.z));
// 13
backupReg0i = R125i.y;
R126i.x = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(PV0ix));
R125i.y = ((R125i.z == 0)?(R0i.x):(PV0iw));
R124i.z = ((R125i.z == 0)?(R10i.z):(PS0i));
PV1iw = floatBitsToInt(intBitsToFloat(R13i.y) + intBitsToFloat(backupReg0i));
tempResultf = 1.0 / sqrt(intBitsToFloat(R124i.y));
R125i.x = floatBitsToInt(tempResultf);
// 14
R123i.x = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(0x3e22f983) + 0.5);
R127i.z = ((R125i.z == 0)?(R13i.y):(PV1iw));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R125i.x)));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R125i.x)));
// 15
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(0x3e22f983) + 0.5);
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R125i.x)));
PV1iz = floatBitsToInt(fract(intBitsToFloat(backupReg0i)));
PV1iw = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.z)), intBitsToFloat(R4i.w)));
// 16
PV0ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.z)), intBitsToFloat(R1i.y)));
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV0iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)), intBitsToFloat(R1i.w)));
R125i.z = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
// 17
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.w)),-(intBitsToFloat(R124i.z))) + intBitsToFloat(PV0ix));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.y)),-(intBitsToFloat(R125i.y))) + intBitsToFloat(R126i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.w)),-(intBitsToFloat(R127i.z))) + intBitsToFloat(PV0iw));
R127i.w = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R1i.z = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
// 18
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R6i.w)));
R125i.y = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R125i.z = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(R11i.y));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(R7i.x)));
R10i.x = floatBitsToInt(sin((intBitsToFloat(R127i.w))/0.1591549367));
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R11i.y = floatBitsToInt(sin((intBitsToFloat(R1i.z))/0.1591549367));
// 20
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y), intBitsToFloat(R125i.z)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(R11i.y)));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(R7i.z)));
R0i.w = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(0x3e22f983));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 21
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(R7i.y)));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS0i)));
R7i.z = floatBitsToInt(cos((intBitsToFloat(R127i.w))/0.1591549367));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R3i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(R7i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(R5i.w)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R11i.y)));
R7i.w = floatBitsToInt(cos((intBitsToFloat(R1i.z))/0.1591549367));
// 1
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(R7i.w)));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.w)),intBitsToFloat(R7i.y)) + intBitsToFloat(PV0ix));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R7i.w)));
R124i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.y)),intBitsToFloat(R5i.w)) + intBitsToFloat(PV0iy));
R124i.x = floatBitsToInt(sin((intBitsToFloat(R0i.w))/0.1591549367));
// 2
backupReg0i = R0i.w;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R0i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R127i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R126i.x)));
R0i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.w)),intBitsToFloat(R3i.z)) + intBitsToFloat(R127i.z));
R127i.z = floatBitsToInt(cos((intBitsToFloat(backupReg0i))/0.1591549367));
// 3
backupReg0i = R125i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(R127i.z)));
R124i.y = floatBitsToInt(-(intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iz));
R125i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV0ix));
R125i.w = floatBitsToInt(-(intBitsToFloat(R126i.x)) + intBitsToFloat(PV0iy));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(backupReg0i)));
// 4
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R127i.y)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R127i.z)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(R127i.z)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R124i.w)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R127i.y)));
// 5
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R124i.w)));
R0i.y = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(R127i.w));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R0i.w)));
PV1iw = uf_remappedVS[13].x;
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) / 2.0);
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R127i.y)));
// 6
backupReg0i = R125i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R124i.w)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R4i.w)) + intBitsToFloat(R126i.x));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R4i.w)) + intBitsToFloat(backupReg0i));
R124i.w = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV1iw));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R4i.w)) + intBitsToFloat(PS1i));
// 7
backupReg0i = R125i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R1i.w)) + intBitsToFloat(R126i.w));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R1i.w)) + intBitsToFloat(R125i.x));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R1i.w)) + intBitsToFloat(PV0ix));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R1i.y)) + intBitsToFloat(backupReg0i));
R5i.z = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(R9i.z));
// 8
backupReg0i = R125i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(R127i.z)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R3i.z)) + intBitsToFloat(R123i.x));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R5i.w)) + intBitsToFloat(backupReg0i));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R0i.w)));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R0i.w)));
// 9
backupReg0i = R127i.y;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R1i.y)) + intBitsToFloat(PV0iw));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R127i.z)));
R9i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.x)),intBitsToFloat(R3i.z)) + intBitsToFloat(backupReg0i));
R125i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.x)),intBitsToFloat(R5i.w)) + intBitsToFloat(R126i.z));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R125i.y)));
// 10
backupReg0i = R2i.x;
backupReg1i = R2i.y;
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R7i.y)) + intBitsToFloat(R126i.w));
R2i.y = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(R3i.w));
R2i.z = floatBitsToInt(intBitsToFloat(backupReg1i) + intBitsToFloat(R7i.x));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.x), intBitsToFloat(R124i.w)));
R2i.w = 0x3f800000;
// 11
backupReg0i = R127i.x;
backupReg1i = R125i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R5i.w)) + intBitsToFloat(R127i.w));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R1i.y)) + intBitsToFloat(backupReg0i));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R2i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R3i.z)) + intBitsToFloat(backupReg1i));
PS1i = floatBitsToInt(intBitsToFloat(R6i.y) + 1.0);
// 12
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(R125i.w)) + intBitsToFloat(R127i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.x)),intBitsToFloat(R7i.y)) + intBitsToFloat(R125i.x));
PV0iz = floatBitsToInt(intBitsToFloat(R6i.z) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(R9i.z)) + intBitsToFloat(R126i.z));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(uf_remappedVS[17].x)));
// 13
backupReg0i = R123i.x;
backupReg1i = R7i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(R127i.y)) + intBitsToFloat(R125i.z));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R127i.x)) + intBitsToFloat(backupReg0i));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(backupReg1i)) + intBitsToFloat(R126i.y));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.w));
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(uf_remappedVS[17].x)));
// 14
PV0ix = ((intBitsToFloat(R12i.y) == 0.0)?-1:0);
PV0iy = floatBitsToInt(intBitsToFloat(R6i.x) + 1.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), intBitsToFloat(uf_remappedVS[18].w)));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R125i.z)) + intBitsToFloat(R123i.x));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R127i.z)));
// 15
R123i.x = ((PV0ix == 0)?(R12i.y):(0x3f800000));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R2i.x)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(uf_remappedVS[17].x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R125i.y)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 16
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R125i.w)) + intBitsToFloat(R127i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R127i.y)) + intBitsToFloat(PV1iy));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R9i.z)) + intBitsToFloat(PV1iw));
R0i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(PS1i));
R0i.w = clampFI32(R0i.w);
// 17
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.x));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.z));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R125i.z)) + intBitsToFloat(R123i.y));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R2i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w))));
PV0iy = R2i.x;
PV0iz = R2i.x;
PV0iw = R2i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w))));
PV1ix = tempi.x;
R10i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R3i.x = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(R7i.y));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R1i.z = tempi.x;
PV0iw = tempi.x;
R1i.y = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R5i.w));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(R0i.y));
R0i.z = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R3i.w));
PV1iw = floatBitsToInt(intBitsToFloat(R3i.x) + intBitsToFloat(R3i.z));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(PV1ix));
PV0iy = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(R9i.x));
// 5
R2i.z = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PV0ix));
// 6
predResult = (intBitsToFloat(uf_remappedVS[19].y) != 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0iy = uf_remappedVS[11].w;
PV0iz = uf_remappedVS[10].w;
// 1
PV1ix = uf_remappedVS[12].w;
R127i.y = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(R3i.x)));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(R1i.y)));
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[19].y));
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
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[10].w) + intBitsToFloat(uf_remappedVS[11].w));
R0i.y = floatBitsToInt(intBitsToFloat(R14i.y) + 1.0);
R1i.w = 0x3f800000;
R2i.w = 0x3f800000;
// 1
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(uf_remappedVS[20].w)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[20].z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].z), intBitsToFloat(uf_remappedVS[20].w)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R11i.z));
// 2
R0i.x = floatBitsToInt(intBitsToFloat(R12i.y) * intBitsToFloat(PS1i));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV1iz)));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[12].w) + intBitsToFloat(R127i.x));
R1i.x = floatBitsToInt(intBitsToFloat(R12i.x) + intBitsToFloat(R2i.x));
// 3
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), intBitsToFloat(uf_remappedVS[18].x)));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3dd70a3d));
R2i.y = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(R10i.y));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R127i.y));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].y), intBitsToFloat(uf_remappedVS[20].z)));
R2i.z = floatBitsToInt(intBitsToFloat(R12i.x) + intBitsToFloat(R1i.z));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R126i.x));
// 5
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV0iy)));
PV1iz = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0ix));
// 6
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
// 7
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
// 8
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 9
R127i.z = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R127i.w = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 10
PS0i = floatBitsToInt(sin((intBitsToFloat(R127i.z))/0.1591549367));
// 11
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R126i.y)));
PS1i = floatBitsToInt(cos((intBitsToFloat(R127i.z))/0.1591549367));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(intBitsToFloat(R3i.x) + intBitsToFloat(PV1iw));
PS0i = floatBitsToInt(sin((intBitsToFloat(R127i.w))/0.1591549367));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV0ix));
R0i.y = floatBitsToInt(-(intBitsToFloat(R2i.x)) + intBitsToFloat(PV0iz));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R126i.x)));
// 14
backupReg0i = R1i.y;
R1i.y = floatBitsToInt(-(intBitsToFloat(R1i.z)) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV1iw));
// 15
R0i.z = floatBitsToInt(-(intBitsToFloat(R10i.y)) + intBitsToFloat(PV0iz));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R2i.x) + -(intBitsToFloat(uf_remappedVS[21].x)));
PV0iy = floatBitsToInt(intBitsToFloat(R10i.y) + -(intBitsToFloat(uf_remappedVS[21].y)));
PV0iz = floatBitsToInt(intBitsToFloat(R1i.z) + -(intBitsToFloat(uf_remappedVS[21].z)));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[22].x));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R10i.y),intBitsToFloat(R1i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[23].x),intBitsToFloat(uf_remappedVS[23].y),intBitsToFloat(uf_remappedVS[23].z),intBitsToFloat(uf_remappedVS[23].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R127i.z = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 3
PV1ix = floatBitsToInt(min(intBitsToFloat(PS0i), intBitsToFloat(uf_remappedVS[22].x)));
R14i.y = uf_remappedVS[24].x;
// 4
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(R127i.w));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PV0iz)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PV0iz)));
// 6
R3i.x = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(PV1iy));
R3i.y = floatBitsToInt(intBitsToFloat(R10i.y) + intBitsToFloat(PV1ix));
R3i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV1iw));
// 7
R4i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[25].x),intBitsToFloat(uf_remappedVS[25].y),intBitsToFloat(uf_remappedVS[25].z),intBitsToFloat(uf_remappedVS[25].w))));
PV1iy = R4i.x;
PV1iz = R4i.x;
PV1iw = R4i.x;
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[26].x),intBitsToFloat(uf_remappedVS[26].y),intBitsToFloat(uf_remappedVS[26].z),intBitsToFloat(uf_remappedVS[26].w))));
PV0ix = tempi.x;
R4i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[23].x),intBitsToFloat(uf_remappedVS[23].y),intBitsToFloat(uf_remappedVS[23].z),intBitsToFloat(uf_remappedVS[23].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R10i.z = tempi.x;
PV1iw = tempi.x;
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[27].x),intBitsToFloat(uf_remappedVS[27].y),intBitsToFloat(uf_remappedVS[27].z),intBitsToFloat(uf_remappedVS[27].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R5i.w = tempi.x;
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R10i.y),intBitsToFloat(R1i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[27].x),intBitsToFloat(uf_remappedVS[27].y),intBitsToFloat(uf_remappedVS[27].z),intBitsToFloat(uf_remappedVS[27].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = PV0ix;
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 12
R126i.x = floatBitsToInt(intBitsToFloat(R10i.z) * 0.0 + intBitsToFloat(R5i.w));
PV0iy = PV1ix;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
R123i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 0.0 + intBitsToFloat(PV1ix));
R127i.w = floatBitsToInt(intBitsToFloat(R10i.z) * 0.0 + intBitsToFloat(PS1i));
R9i.z = floatBitsToInt(intBitsToFloat(R10i.z) * 0.5 + intBitsToFloat(PS1i));
// 13
R123i.x = floatBitsToInt(intBitsToFloat(R127i.z) * 0.5 + intBitsToFloat(PV0iy));
R15i.y = floatBitsToInt(intBitsToFloat(R4i.y) * -(0.5) + intBitsToFloat(R127i.w));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.z));
// 14
R5i.x = floatBitsToInt(intBitsToFloat(R4i.x) * 0.5 + intBitsToFloat(R127i.w));
PV0iy = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(PS1i));
R11i.z = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 15
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].w), intBitsToFloat(PV0iy)));
PV1iz = floatBitsToInt(intBitsToFloat(R9i.z) * intBitsToFloat(R11i.z));
// 16
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(uf_remappedVS[1].w)) + -(intBitsToFloat(uf_remappedVS[1].y)));
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].y)) + intBitsToFloat(PV1ix));
// 17
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 18
R0i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.y));
// 19
R4i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS0i));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[28].x)) + intBitsToFloat(uf_remappedVS[28].y));
PV0iy = floatBitsToInt((intBitsToFloat(uf_remappedVS[29].y) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[29].y))?1.0:0.0);
R127i.w = floatBitsToInt(intBitsToFloat(R0i.y) + -(intBitsToFloat(uf_remappedVS[28].x)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[29].y));
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[30].w)) + intBitsToFloat(uf_remappedVS[31].w));
PV1iy = floatBitsToInt(intBitsToFloat(R12i.y) * intBitsToFloat(PS0i));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(uf_remappedVS[32].z)) + intBitsToFloat(PV1iy));
R11i.y = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
R11i.y = clampFI32(R11i.y);
R126i.z = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R2i.w = uf_remappedVS[33].x;
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 3
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[30].x)) + intBitsToFloat(uf_remappedVS[31].x));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
// 4
R126i.x = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(R127i.w));
PV0iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[31].w)) + intBitsToFloat(uf_remappedVS[34].w));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV1iz)));
// 5
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[31].x)) + intBitsToFloat(uf_remappedVS[34].x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R126i.z)) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 6
R125i.x = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(PS1i));
R126i.y = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(uf_remappedVS[30].w)));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(uf_remappedVS[31].w)));
// 7
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[34].w)) + intBitsToFloat(uf_remappedVS[35].w));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(uf_remappedVS[34].w)));
R126i.z = ((intBitsToFloat(R126i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.w = ((intBitsToFloat(R127i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(uf_remappedVS[35].w)));
// 8
backupReg0i = R126i.y;
backupReg1i = R126i.x;
R126i.x = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R126i.y = ((intBitsToFloat(R127i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(backupReg1i)) + intBitsToFloat(uf_remappedVS[30].x));
PV0iw = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 9
backupReg0i = R126i.z;
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[34].x)) + intBitsToFloat(uf_remappedVS[35].x));
PV1iy = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
R126i.z = ((intBitsToFloat(R127i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iw)));
// 10
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(R127i.w));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[30].x), intBitsToFloat(backupReg0i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R125i.x)) + intBitsToFloat(uf_remappedVS[31].x));
PS0i = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
// 11
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PV0iy)) + intBitsToFloat(uf_remappedVS[34].x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS0i)));
R0i.z = uf_remappedVS[33].y;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R125i.w)) + intBitsToFloat(PV0iz));
// 12
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.w));
R1i.z = uf_remappedVS[36].x;
R3i.w = uf_remappedVS[33].z;
// 13
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.y));
// 14
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].x),intBitsToFloat(R126i.z)) + intBitsToFloat(R123i.x));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = ((intBitsToFloat(R4i.w) > intBitsToFloat(uf_remappedVS[37].x))?-1:0);
R127i.y = ((intBitsToFloat(R4i.w) > intBitsToFloat(uf_remappedVS[37].y))?-1:0);
R6i.z = uf_remappedVS[38].x;
R0i.w = uf_remappedVS[38].y;
// 1
R0i.x = uf_remappedVS[38].z;
R126i.z = ((intBitsToFloat(R4i.w) > intBitsToFloat(uf_remappedVS[37].z))?-1:0);
PV1iw = PV0ix & int(1);
// 2
PV0iz = PV1iw - R127i.y;
// 3
PV1iy = PV0iz - R126i.z;
// 4
R6i.x = floatBitsToInt(float(PV1iy));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(uf_remappedVS[39].x)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[39].y)));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[39].z)));
R11i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(uf_remappedVS[39].w)));
// 1
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(uf_remappedVS[40].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[40].y)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(uf_remappedVS[40].z)));
R12i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(uf_remappedVS[40].w)));
// 2
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[41].x)));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[41].x)));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(uf_remappedVS[41].x)));
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[41].x), intBitsToFloat(R2i.x)));
// 3
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[41].x), intBitsToFloat(R0i.y)));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[41].x), intBitsToFloat(R0i.z)));
// 4
predResult = (intBitsToFloat(R6i.x) == 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R1i.y = R2i.y;
R1i.z = R2i.z;
R1i.w = 0x3f800000;
// 1
R2i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[42].x),intBitsToFloat(uf_remappedVS[42].y),intBitsToFloat(uf_remappedVS[42].z),intBitsToFloat(uf_remappedVS[42].w))));
PV1iy = R2i.x;
PV1iz = R2i.x;
PV1iw = R2i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[43].x),intBitsToFloat(uf_remappedVS[43].y),intBitsToFloat(uf_remappedVS[43].z),intBitsToFloat(uf_remappedVS[43].w))));
PV0ix = tempi.x;
R2i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[44].x),intBitsToFloat(uf_remappedVS[44].y),intBitsToFloat(uf_remappedVS[44].z),intBitsToFloat(uf_remappedVS[44].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R2i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[45].x),intBitsToFloat(uf_remappedVS[45].y),intBitsToFloat(uf_remappedVS[45].z),intBitsToFloat(uf_remappedVS[45].w))));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
activeMaskStack[4] = activeMaskStack[3];
activeMaskStackC[5] = activeMaskStackC[4];
// 0
predResult = (intBitsToFloat(R6i.x) == 1.0);
activeMaskStack[4] = predResult;
activeMaskStackC[5] = predResult == true && activeMaskStackC[4] == true;
}
else {
activeMaskStack[4] = false;
activeMaskStackC[5] = false;
}
if( activeMaskStackC[5] == true ) {
// 0
R1i.y = R2i.y;
R1i.z = R2i.z;
R1i.w = 0x3f800000;
// 1
R2i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[46].x),intBitsToFloat(uf_remappedVS[46].y),intBitsToFloat(uf_remappedVS[46].z),intBitsToFloat(uf_remappedVS[46].w))));
PV1iy = R2i.x;
PV1iz = R2i.x;
PV1iw = R2i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[47].x),intBitsToFloat(uf_remappedVS[47].y),intBitsToFloat(uf_remappedVS[47].z),intBitsToFloat(uf_remappedVS[47].w))));
PV0ix = tempi.x;
R2i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[48].x),intBitsToFloat(uf_remappedVS[48].y),intBitsToFloat(uf_remappedVS[48].z),intBitsToFloat(uf_remappedVS[48].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R2i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[49].x),intBitsToFloat(uf_remappedVS[49].y),intBitsToFloat(uf_remappedVS[49].z),intBitsToFloat(uf_remappedVS[49].w))));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
}
activeMaskStack[4] = activeMaskStack[4] == false;
activeMaskStackC[5] = activeMaskStack[4] == true && activeMaskStackC[4] == true;
if( activeMaskStackC[5] == true ) {
// 0
R1i.y = R2i.y;
R1i.z = R2i.z;
R1i.w = 0x3f800000;
// 1
R2i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[50].x),intBitsToFloat(uf_remappedVS[50].y),intBitsToFloat(uf_remappedVS[50].z),intBitsToFloat(uf_remappedVS[50].w))));
PV1iy = R2i.x;
PV1iz = R2i.x;
PV1iw = R2i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[51].x),intBitsToFloat(uf_remappedVS[51].y),intBitsToFloat(uf_remappedVS[51].z),intBitsToFloat(uf_remappedVS[51].w))));
PV0ix = tempi.x;
R2i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[52].x),intBitsToFloat(uf_remappedVS[52].y),intBitsToFloat(uf_remappedVS[52].z),intBitsToFloat(uf_remappedVS[52].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R2i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[53].x),intBitsToFloat(uf_remappedVS[53].y),intBitsToFloat(uf_remappedVS[53].z),intBitsToFloat(uf_remappedVS[53].w))));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
}
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = 0;
R5i.y = 0;
R0i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R10i.w = ((0.0 >= intBitsToFloat(R11i.y))?-1:0);
R126i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[21].x) + -(intBitsToFloat(R3i.x)));
// 1
R127i.x = ((R10i.w == 0)?(R4i.x):(R0i.x));
R127i.y = R5i.w;
R127i.z = ((R10i.w == 0)?(R10i.z):(R0i.z));
R127i.w = ((R10i.w == 0)?(R4i.y):(R5i.y));
R9i.y = ((R10i.w == 0)?(0):(0x3f800000));
// 2
R123i.x = ((R10i.w == 0)?(R17i.y):(R5i.y));
R123i.y = ((R10i.w == 0)?(R17i.x):(R0i.x));
R123i.z = ((R10i.w == 0)?(R17i.w):(R5i.w));
R123i.w = ((R10i.w == 0)?(R17i.z):(R0i.z));
R126i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[21].y) + -(intBitsToFloat(R3i.y)));
// 3
R17i.x = ((R9i.y == 0)?(R127i.x):(R123i.y));
R17i.y = ((R9i.y == 0)?(R127i.w):(R123i.x));
R17i.z = ((R9i.y == 0)?(R127i.z):(R123i.w));
R17i.w = ((R9i.y == 0)?(R127i.y):(R123i.z));
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[21].z) + -(intBitsToFloat(R3i.z)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R0i.y));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[54].x),intBitsToFloat(uf_remappedVS[54].y),intBitsToFloat(uf_remappedVS[54].z),intBitsToFloat(uf_remappedVS[54].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 6
backupReg0i = R126i.x;
backupReg1i = R126i.y;
backupReg2i = R127i.z;
R126i.x = floatBitsToInt(intBitsToFloat(R2i.z) * intBitsToFloat(R127i.y));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PS1i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), intBitsToFloat(PS1i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg2i), intBitsToFloat(PS1i)));
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[55].x),intBitsToFloat(uf_remappedVS[55].y),intBitsToFloat(uf_remappedVS[55].z),intBitsToFloat(uf_remappedVS[55].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R126i.z = tempi.x;
PV1iw = tempi.x;
R0i.x = floatBitsToInt(intBitsToFloat(R2i.x) * intBitsToFloat(R127i.y));
// 8
backupReg0i = R127i.y;
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[56].x),intBitsToFloat(uf_remappedVS[56].y),intBitsToFloat(uf_remappedVS[56].z),intBitsToFloat(uf_remappedVS[56].w))));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.y = floatBitsToInt(intBitsToFloat(R2i.y) * intBitsToFloat(backupReg0i));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[57].x),intBitsToFloat(uf_remappedVS[57].y),intBitsToFloat(uf_remappedVS[57].z),0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R0i.z = floatBitsToInt(roundEven(intBitsToFloat(R6i.x)));
// 10
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R126i.w)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R126i.w)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[58].x)) + -(intBitsToFloat(uf_remappedVS[58].y)));
R123i.z = clampFI32(R123i.z);
R0i.w = R126i.x;
R0i.w = clampFI32(R0i.w);
R126i.x = floatBitsToInt(intBitsToFloat(PV1ix) + 0.5);
// 11
PV1ix = floatBitsToInt(intBitsToFloat(R15i.y) * intBitsToFloat(R11i.z));
PV1iy = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
R123i.z = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
R126i.w = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
R3i.y = 0;
// 12
R4i.x = uf_remappedVS[59].y;
R5i.y = uf_remappedVS[60].y;
PV0iz = floatBitsToInt(-(intBitsToFloat(PV1ix)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R123i.z)) + intBitsToFloat(0xbe593484));
tempResultf = max(0.0, intBitsToFloat(PV1iy));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R127i.x = floatBitsToInt(tempResultf);
// 13
R123i.x = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3f333333) + intBitsToFloat(0x3e19999a));
R123i.x = clampFI32(R123i.x);
R6i.y = uf_remappedVS[61].y;
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R123i.w)) + intBitsToFloat(0x3fc90da4));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[62].y), intBitsToFloat(R127i.x)));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(R126i.w)));
// 14
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3f22f983));
PV0iy = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[57].y) + 1.0);
R1i.w = 0;
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iw)));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 15
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),-(intBitsToFloat(R126i.z))) + 1.0);
R2i.y = floatBitsToInt(intBitsToFloat(PS0i) + 0.5);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) + 8.5);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) * 1.5);
PV1iw = clampFI32(PV1iw);
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[62].x), intBitsToFloat(R127i.x)));
// 16
R3i.x = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3daaaaab));
R7i.y = floatBitsToInt(intBitsToFloat(PV1iw) * 15.0);
R1i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[57].y) * 1.0 + intBitsToFloat(R4i.w));
R7i.w = R14i.y;
R4i.y = floatBitsToInt(exp2(intBitsToFloat(PS1i)));
}
if( activeMaskStackC[3] == true ) {
R0i.w = floatBitsToInt(texture(textureUnitVS12, vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))));
R0i.z = floatBitsToInt(texture(textureUnitVS7, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y))).x);
R2i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y))).xyz);
R3i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R15i.y),intBitsToFloat(R9i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R5i.x),intBitsToFloat(R15i.y),intBitsToFloat(R9i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[63].x)) + -(intBitsToFloat(uf_remappedVS[63].y)));
R122i.x = clampFI32(R122i.x);
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(R0i.w)) + 1.0);
R4i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[62].z)),intBitsToFloat(R4i.y)) + intBitsToFloat(uf_remappedVS[62].z));
R4i.y = clampFI32(R4i.y);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[64].y)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R122i.x)) + 1.0);
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.y), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(PS1i)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(R126i.z)) + 1.0);
tempResultf = max(0.0, intBitsToFloat(PV1iw));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),intBitsToFloat(PV0iz)),vec4(-(intBitsToFloat(R4i.x)),-(intBitsToFloat(R5i.y)),-(intBitsToFloat(R6i.y)),-(intBitsToFloat(R1i.w)))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[65].x), intBitsToFloat(PS0i)));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(0x3edc28f6));
PV0ix = clampFI32(PV0ix);
R6i.y = floatBitsToInt(-(intBitsToFloat(R126i.z)) + intBitsToFloat(R126i.w));
R0i.z = R18i.z;
R125i.w = ((R10i.w == 0)?(0):(R3i.x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R7i.y));
// 5
R6i.x = 0;
R126i.y = ((R10i.w == 0)?(0):(R3i.y));
R127i.z = ((R10i.w == 0)?(0):(R3i.z));
PV1iw = floatBitsToInt(intBitsToFloat(R1i.z) * intBitsToFloat(PS0i));
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 6
R0i.x = R10i.x;
PV0iy = floatBitsToInt(max(intBitsToFloat(PV1iw), intBitsToFloat(0x3e4ccccd)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[65].z), intBitsToFloat(PS1i)));
R124i.w = ((R10i.w == 0)?(0):(R3i.w));
PS0i = floatBitsToInt(exp2(intBitsToFloat(R127i.y)));
// 7
PV1ix = floatBitsToInt(min(intBitsToFloat(PV0iy), 1.0));
R0i.y = R13i.y;
R1i.z = R7i.z;
R126i.w = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
// 8
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV1ix)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV1ix)));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[65].w)),intBitsToFloat(PS1i)) + 1.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV1ix)));
R125i.x = ((R10i.w == 0)?(0):(R0i.x));
// 9
R2i.x = ((R10i.w == 0)?(0):(R124i.x));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R123i.z)));
R126i.z = ((R10i.w == 0)?(0):(R127i.y));
R126i.w = ((R10i.w == 0)?(0):(R127i.w));
R1i.w = ((R10i.w == 0)?(0):(R0i.y));
// 10
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(uf_remappedVS[66].w)));
R5i.y = ((R10i.w == 0)?(0):(R0i.w));
R125i.z = ((R10i.w == 0)?(0):(R1i.z));
R2i.w = ((R10i.w == 0)?(0):(R8i.x));
R4i.w = ((R10i.w == 0)?(0):(R8i.y));
// 11
R126i.x = ((R10i.w == 0)?(0):(R127i.x));
R125i.y = ((R10i.w == 0)?(0):(R8i.w));
R124i.z = ((R10i.w == 0)?(0):(R8i.z));
R9i.w = ((R10i.w == 0)?(R18i.y):(R14i.y));
R5i.x = ((R10i.w == 0)?(R18i.x):(R6i.x));
// 12
R1i.x = ((R10i.w == 0)?(0):(R16i.y));
R124i.y = ((R10i.w == 0)?(0):(R9i.x));
R1i.z = R18i.z;
R6i.w = ((R10i.w == 0)?(0):(R12i.w));
R2i.y = ((R10i.w == 0)?(0):(R7i.x));
// 13
R0i.x = ((R10i.w == 0)?(0):(R12i.y));
R7i.y = ((R10i.w == 0)?(0):(R4i.z));
PV1iz = R10i.x;
R5i.w = ((R10i.w == 0)?(0):(R5i.z));
R4i.x = R13i.y;
// 14
R10i.x = ((R9i.y == 0)?(R127i.x):(R126i.x));
R2i.z = ((R10i.w == 0)?(0):(R11i.w));
R0i.w = R7i.z;
R14i.x = ((R9i.y == 0)?(PV1iz):(R125i.x));
// 15
R20i.x = ((R9i.y == 0)?(R124i.x):(R2i.x));
R20i.y = ((R9i.y == 0)?(R127i.w):(R126i.w));
R20i.z = ((R9i.y == 0)?(R127i.y):(R126i.z));
R13i.x = ((R9i.y == 0)?(R3i.x):(R125i.w));
// 16
R13i.y = ((R9i.y == 0)?(R3i.y):(R126i.y));
R13i.z = ((R9i.y == 0)?(R3i.z):(R127i.z));
R13i.w = ((R9i.y == 0)?(R3i.w):(R124i.w));
R14i.y = ((R9i.y == 0)?(R4i.x):(R1i.w));
// 17
R15i.x = ((R9i.y == 0)?(R8i.x):(R2i.w));
R15i.y = ((R9i.y == 0)?(R8i.y):(R4i.w));
R14i.z = ((R9i.y == 0)?(R0i.w):(R125i.z));
R15i.z = ((R9i.y == 0)?(R8i.z):(R124i.z));
// 18
R16i.x = ((R9i.y == 0)?(R9i.x):(R124i.y));
R15i.w = ((R9i.y == 0)?(R8i.w):(R125i.y));
// 19
R16i.y = ((R9i.y == 0)?(R16i.y):(R1i.x));
R16i.z = ((R9i.y == 0)?(R5i.z):(R5i.w));
R16i.w = ((R9i.y == 0)?(R12i.w):(R6i.w));
// 20
R19i.x = ((R9i.y == 0)?(R7i.x):(R2i.y));
R19i.y = ((R9i.y == 0)?(R12i.y):(R0i.x));
// 21
R19i.z = ((R9i.y == 0)?(R4i.z):(R7i.y));
R19i.w = ((R9i.y == 0)?(R11i.w):(R2i.z));
R14i.w = R5i.y;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iz = floatBitsToInt(min(intBitsToFloat(uf_remappedVS[21].y), intBitsToFloat(uf_remappedVS[67].z)));
// 1
PV1iy = floatBitsToInt(-(intBitsToFloat(R10i.y)) + intBitsToFloat(PV0iz));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[67].y),intBitsToFloat(PV1iy)) + intBitsToFloat(uf_remappedVS[67].x));
R123i.x = clampFI32(R123i.x);
// 3
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(uf_remappedVS[68].w)));
// 4
R123i.w = ((R10i.w == 0)?(0):(R124i.w));
// 5
R10i.y = ((R9i.y == 0)?(R124i.w):(R123i.w));
}
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(R11i.y)) + 0.0);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[19].z), intBitsToFloat(R6i.y)));
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(R124i.w)) + intBitsToFloat(R4i.y));
PV1ix = clampFI32(PV1ix);
R123i.y = ((R10i.w == 0)?(R0i.x):(R6i.x));
R124i.z = ((R10i.w == 0)?(0):(R124i.w));
// 2
R18i.x = ((R9i.y == 0)?(R123i.y):(R5i.x));
R18i.y = ((R9i.y == 0)?(R7i.w):(R9i.w));
R125i.z = PV1ix;
R127i.w = PV1ix;
R18i.z = ((R9i.y == 0)?(R0i.z):(R1i.z));
// 3
R123i.y = ((R10i.w == 0)?(0):(R127i.w));
R123i.z = ((R10i.w == 0)?(0):(R125i.z));
// 4
R10i.z = ((R9i.y == 0)?(R125i.z):(R123i.z));
R10i.w = ((R9i.y == 0)?(R124i.w):(R124i.z));
R20i.w = ((R9i.y == 0)?(R127i.w):(R123i.y));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.w));
// export
// skipped export to semanticId 255
// export
passParameterSem7 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.z));
}
