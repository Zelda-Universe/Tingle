#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader afe5679b2b78282e
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[42];
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
ATTR_LAYOUT(0, 9) in uvec4 attrDataSem9;
ATTR_LAYOUT(0, 10) in uvec4 attrDataSem10;
ATTR_LAYOUT(0, 11) in uvec4 attrDataSem11;

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem7;
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
ivec4 R20i = ivec4(0);
ivec4 R21i = ivec4(0);
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
R15i.y = floatBitsToInt(-(intBitsToFloat(R5i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R0i.w = 0;
R5i.w = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R15i.y));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R16i.x = 0;
R16i.y = 0;
R16i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R17i.x = 0;
// 1
R6i.w = R5i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R6i.w = R0i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R6i.w == 0);
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
R8i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R15i.y) >= intBitsToFloat(R8i.z));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R16i.x = 0;
R16i.y = 0;
R16i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R17i.x = 0;
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
R0i.z = R3i.x;
R127i.w = R2i.y;
R127i.z = R3i.y;
// 1
R126i.x = R1i.z;
R127i.y = R2i.z;
R126i.z = R3i.z;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),0.0)));
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
R0i.w = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R12i.y = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 5
R0i.y = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 6
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
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R127i.y)));
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R127i.y)));
// 2
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R14i.x = 0;
// 1
R12i.x = R14i.x;
// 2
R13i.x = R14i.x;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (intBitsToFloat(R12i.y) > 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R12i.y));
// 1
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R127i.x)));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R127i.x)));
// 2
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R12i.y = 0;
R13i.y = 0;
// 1
R14i.y = 0;
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
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R127i.x)));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R127i.x)));
// 2
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R12i.z = 0;
R13i.z = 0;
// 1
R14i.z = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(max(intBitsToFloat(R8i.x), 0.0));
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[2].x))?1.0:0.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(uf_remappedVS[3].y)));
PV0iw = floatBitsToInt((intBitsToFloat(uf_remappedVS[2].x) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[2].x));
// 1
R126i.x = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(intBitsToFloat(R15i.y) * intBitsToFloat(PS0i));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].w)) + intBitsToFloat(uf_remappedVS[5].w));
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].z)) + intBitsToFloat(uf_remappedVS[5].z));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R8i.z));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].x)) + intBitsToFloat(uf_remappedVS[5].x));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].y)) + intBitsToFloat(uf_remappedVS[5].y));
R15i.x = floatBitsToInt(intBitsToFloat(R15i.y) * intBitsToFloat(PS1i));
// 3
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.x), intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(min(intBitsToFloat(backupReg0i), 0.0));
PV1iz = floatBitsToInt(fract(intBitsToFloat(PV0ix)));
R4i.w = ((intBitsToFloat(uf_remappedVS[6].x) == 1.0)?-1:0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.z));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV1iz)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS1i));
R127i.z = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS1i));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
R0i.x = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(PV1iy));
// 5
R16i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].x)) + 1.0);
PV1iw = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0ix));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(uf_remappedVS[4].w)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(uf_remappedVS[5].w)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R127i.y)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R127i.w)));
R126i.z = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R127i.z)));
R127i.w = ((intBitsToFloat(PV0ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 8
backupReg0i = R127i.w;
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].y) + intBitsToFloat(PV1iy));
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].x) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R126i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].z) + intBitsToFloat(PV1iw));
PS0i = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0iz)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), intBitsToFloat(PS0i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].x), intBitsToFloat(PS0i)));
// 10
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].x), intBitsToFloat(R126i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV1ix)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), intBitsToFloat(R126i.z)));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R127i.w));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(R127i.z));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].z), intBitsToFloat(R126i.z)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(R126i.y));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV1iw));
PV0iz = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV1ix));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PV1iy));
// 13
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(PV0iw)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iz)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(PV0ix)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[7].y)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[7].z)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[7].w)));
// 1
R5i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(R15i.y));
// 2
predResult = (R4i.w != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(R5i.w)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].w), intBitsToFloat(PV0ix)));
// 2
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x), intBitsToFloat(PV1iw)));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].y), intBitsToFloat(PV1iw)));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].z), intBitsToFloat(PV1iw)));
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
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PS1i)));
R127i.y = ((intBitsToFloat(uf_remappedVS[6].x) == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R16i.y));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R5i.w) + -(intBitsToFloat(PV1iz)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].w), intBitsToFloat(PV1ix)));
// 9
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x), intBitsToFloat(PV0iw)));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].y), intBitsToFloat(PV0iw)));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].z), intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = uf_remappedVS[9].y;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
PV0iy = uf_remappedVS[9].x;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R0i.z)));
R0i.w = 0x3f800000;
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[6].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(PV0ix));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(PV0iy));
R6i.w = 0x3f800000;
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R16i.y));
// 2
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1iz)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PV1ix)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].x), intBitsToFloat(uf_remappedVS[11].x)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].x), intBitsToFloat(uf_remappedVS[11].y)));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 3
R7i.x = floatBitsToInt(1.0);
R0i.y = 0;
R124i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[11].w) * 1.0);
PV1iw = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[12].y));
// 4
PV0ix = floatBitsToInt((intBitsToFloat(uf_remappedVS[12].y) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(R127i.z));
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[12].y))?1.0:0.0);
PV0iw = floatBitsToInt(intBitsToFloat(R15i.y) * intBitsToFloat(PS1i));
R125i.w = uf_remappedVS[13].x & 0x80000;
// 5
R123i.x = ((R4i.w == 0)?(PV0iy):(R5i.w));
R127i.y = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iz)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(uf_remappedVS[2].z)) + intBitsToFloat(PV0iw));
R127i.w = ((intBitsToFloat(R8i.x) > 0.5)?-1:0);
R126i.x = floatBitsToInt(-(intBitsToFloat(R10i.x)) + 1.0);
// 6
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R123i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R123i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R123i.x)));
R127i.x = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt(intBitsToFloat(R9i.z) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(intBitsToFloat(R9i.y) + intBitsToFloat(PV0iz));
R127i.y = uf_remappedVS[13].x & 0x100000;
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(PV1ix)));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.x),intBitsToFloat(R127i.x)) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(PV1iz)));
R126i.w = ((intBitsToFloat(R8i.y) > 0.5)?-1:0);
// 9
R127i.x = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV0iy));
R125i.y = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV0ix));
R125i.z = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(-(intBitsToFloat(R10i.y)) + 1.0);
R127i.w = ((R127i.w == 0)?(R10i.x):(R126i.x));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R125i.z),intBitsToFloat(R0i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R1i.w = tempi.x;
R126i.y = ((R126i.w == 0)?(R10i.y):(PV1iw));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R125i.z),intBitsToFloat(R0i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R3i.w = tempi.x;
R127i.z = (R125i.w == 0x80000)?-1:0;
// 12
R3i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(R14i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R124i.y),intBitsToFloat(R0i.z),intBitsToFloat(R6i.w))));
PV0iy = R3i.x;
PV0iz = R3i.x;
PV0iw = R3i.x;
R126i.x = (R127i.y == 0x100000)?-1:0;
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),intBitsToFloat(R12i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R124i.y),intBitsToFloat(R0i.z),intBitsToFloat(R6i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R3i.z = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(uf_remappedVS[11].z)));
// 14
R10i.x = ((R127i.z == 0)?(R10i.x):(R127i.w));
R10i.y = ((R126i.x == 0)?(R10i.y):(R126i.y));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(uf_remappedVS[11].z)));
PV0iw = floatBitsToInt(intBitsToFloat(PS1i) + intBitsToFloat(R126i.z));
R18i.w = 0;
// 15
R123i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(R124i.w));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R14i.z)));
// 16
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R14i.y)) + intBitsToFloat(PS1i));
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iw = floatBitsToInt(fract(intBitsToFloat(backupReg0i)));
// 17
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R13i.z)));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R20i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R14i.x)) + intBitsToFloat(R123i.x));
// 18
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R13i.y)) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 19
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R12i.z)));
R20i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R13i.x)) + intBitsToFloat(R123i.x));
PV1iz = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R126i.x = floatBitsToInt(cos((intBitsToFloat(PV0iy))/0.1591549367));
// 20
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R125i.z),intBitsToFloat(R0i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R1i.z = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1iz))/0.1591549367));
// 21
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R12i.y)) + intBitsToFloat(R125i.x));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R126i.x)));
R0i.w = PV0ix;
// 22
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R124i.z)));
R20i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R12i.x)) + intBitsToFloat(R123i.x));
// 23
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(0xbccccccd));
// 24
R6i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R124i.y),intBitsToFloat(R0i.z),intBitsToFloat(R6i.w))));
PV0iy = R6i.x;
PV0iz = R6i.x;
PV0iw = R6i.x;
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].y), intBitsToFloat(PV1ix)));
}
if( activeMaskStackC[3] == true ) {
// 0
R124i.x = floatBitsToInt(-(intBitsToFloat(R3i.x)) + intBitsToFloat(uf_remappedVS[14].x));
R124i.y = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(R6i.w));
R125i.z = floatBitsToInt(-(intBitsToFloat(R3i.z)) + intBitsToFloat(uf_remappedVS[14].z));
// 1
R16i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R124i.y),intBitsToFloat(R3i.z),intBitsToFloat(R7i.x)),vec4(intBitsToFloat(uf_remappedVS[15].x),intBitsToFloat(uf_remappedVS[15].y),intBitsToFloat(uf_remappedVS[15].z),intBitsToFloat(uf_remappedVS[15].w))));
PV1iy = R16i.x;
PV1iz = R16i.x;
PV1iw = R16i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R124i.y),intBitsToFloat(R3i.z),intBitsToFloat(R7i.x)),vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),intBitsToFloat(uf_remappedVS[16].w))));
PV0ix = tempi.x;
R16i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R124i.y),intBitsToFloat(R3i.z),intBitsToFloat(R7i.x)),vec4(intBitsToFloat(uf_remappedVS[17].x),intBitsToFloat(uf_remappedVS[17].y),intBitsToFloat(uf_remappedVS[17].z),intBitsToFloat(uf_remappedVS[17].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R16i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R124i.y),intBitsToFloat(R3i.z),intBitsToFloat(R7i.x)),vec4(intBitsToFloat(uf_remappedVS[18].x),intBitsToFloat(uf_remappedVS[18].y),intBitsToFloat(uf_remappedVS[18].z),intBitsToFloat(uf_remappedVS[18].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R16i.w = tempi.x;
// 5
R123i.x = floatBitsToInt(intBitsToFloat(R16i.z) * 0.0 + intBitsToFloat(PV0ix));
R124i.y = floatBitsToInt(-(intBitsToFloat(R124i.y)) + intBitsToFloat(uf_remappedVS[14].y));
PV1iz = PV0ix;
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) / 2.0);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R20i.y), intBitsToFloat(uf_remappedVS[19].x)));
// 6
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(intBitsToFloat(PV1iw) * 0.25 + 0.5);
R123i.x = clampFI32(R123i.x);
R123i.y = floatBitsToInt(intBitsToFloat(R16i.z) * 0.5 + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(R125i.z));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 7
backupReg0i = R123i.x;
R123i.x = floatBitsToInt((intBitsToFloat(R124i.y) * intBitsToFloat(R124i.y) + intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
// 8
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + 8.5);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(uf_remappedVS[1].w)) + -(intBitsToFloat(uf_remappedVS[1].y)));
R124i.z = floatBitsToInt((intBitsToFloat(R124i.x) * intBitsToFloat(R124i.x) + intBitsToFloat(R123i.x)));
// 9
R0i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3daaaaab));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.y));
// 10
R3i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS1i));
tempResultf = 1.0 / sqrt(intBitsToFloat(R124i.z));
PS0i = floatBitsToInt(tempResultf);
// 11
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(PS0i)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PS0i)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PS0i)));
R1i.y = uf_remappedVS[14].y;
}
if( activeMaskStackC[3] == true ) {
R19i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R6i.y),intBitsToFloat(R3i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(intBitsToFloat(uf_remappedVS[20].y) + 1.0);
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(uf_remappedVS[21].x)) + -(intBitsToFloat(uf_remappedVS[21].y)));
R123i.x = clampFI32(R123i.x);
R0i.y = floatBitsToInt(intBitsToFloat(PS0i) * 1.5);
R0i.y = clampFI32(R0i.y);
R125i.z = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
PS1i = int(intBitsToFloat(uf_remappedVS[22].z));
// 2
R124i.x = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
PV0iy = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
R123i.z = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
R6i.w = floatBitsToInt(intBitsToFloat(R9i.z) + -(intBitsToFloat(uf_remappedVS[23].w)));
R6i.z = floatBitsToInt(float(PS1i));
// 3
PV1ix = floatBitsToInt(-(abs(intBitsToFloat(R6i.z))) + 0.0);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(0xbe593484));
PV1iz = floatBitsToInt((0.0 >= abs(intBitsToFloat(R6i.z)))?1.0:0.0);
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[23].w)) + intBitsToFloat(uf_remappedVS[24].w));
tempResultf = max(0.0, intBitsToFloat(PV0iy));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R2i.w = floatBitsToInt(tempResultf);
// 4
R7i.x = ((intBitsToFloat(PV1iz) == 0.0)?(0):(PV1ix));
R2i.y = floatBitsToInt(intBitsToFloat(R9i.z) + -(intBitsToFloat(uf_remappedVS[24].w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[25].y), intBitsToFloat(R2i.w)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R123i.y)) + intBitsToFloat(0x3fc90da4));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(R124i.x)));
// 5
R0i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[23].x)) + intBitsToFloat(uf_remappedVS[24].x));
R6i.y = ((intBitsToFloat(R6i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R2i.z = ((intBitsToFloat(R2i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iw = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f22f983));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 6
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),-(intBitsToFloat(R124i.w))) + 1.0);
R3i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
R0i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[24].w)) + intBitsToFloat(uf_remappedVS[26].w));
R0i.w = floatBitsToInt(intBitsToFloat(R9i.z) + -(intBitsToFloat(uf_remappedVS[26].w)));
R3i.z = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
}
if( activeMaskStackC[3] == true ) {
R4i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y))).xyz);
}
if( activeMaskStackC[3] == true ) {
// 0
R124i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[24].x)) + intBitsToFloat(uf_remappedVS[26].x));
R124i.y = floatBitsToInt(intBitsToFloat(R0i.x) * intBitsToFloat(R3i.z));
PV0iz = floatBitsToInt(abs(intBitsToFloat(R6i.z)) + intBitsToFloat(R7i.x));
R125i.w = ((intBitsToFloat(R0i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.z = floatBitsToInt(1.0 / intBitsToFloat(R6i.z));
// 1
R126i.x = floatBitsToInt(intBitsToFloat(R9i.z) + -(intBitsToFloat(uf_remappedVS[27].w)));
R123i.y = ((-(intBitsToFloat(R7i.x)) > 0.0)?(PV0iz):(R7i.x));
R124i.z = floatBitsToInt(-(intBitsToFloat(R2i.z)) + 1.0);
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[26].w)) + intBitsToFloat(uf_remappedVS[27].w));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R0i.z));
// 2
backupReg0i = R124i.y;
backupReg1i = R124i.x;
R124i.x = floatBitsToInt(-(intBitsToFloat(R6i.y)) + 1.0);
R124i.y = floatBitsToInt(intBitsToFloat(R125i.z) * 0.0);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w),intBitsToFloat(backupReg0i)) + intBitsToFloat(uf_remappedVS[23].x));
R124i.w = floatBitsToInt(intBitsToFloat(backupReg1i) * intBitsToFloat(PS1i));
R125i.x = ((intBitsToFloat(R6i.z) == 0.0)?(0):(R123i.y));
// 3
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[26].x)) + intBitsToFloat(uf_remappedVS[27].x));
R125i.y = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R124i.z)));
R6i.w = ((intBitsToFloat(backupReg0i) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 4
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(trunc(intBitsToFloat(R124i.y)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(uf_remappedVS[28].y)));
R124i.y = floatBitsToInt(intBitsToFloat(R124i.y) * 2.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(uf_remappedVS[28].x)));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) * 2.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[23].x), intBitsToFloat(backupReg0i)));
R126i.y = floatBitsToInt(intBitsToFloat(R0i.y) * 15.0);
// 5
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R124i.z)) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[29].z) + intBitsToFloat(uf_remappedVS[28].x));
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[29].w) + intBitsToFloat(uf_remappedVS[28].y));
R127i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(R127i.z));
R127i.z = floatBitsToInt(-(intBitsToFloat(R6i.w)) + 1.0);
// 6
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(-(intBitsToFloat(R126i.z)) + intBitsToFloat(PV1iy));
R124i.y = floatBitsToInt(-(intBitsToFloat(R124i.y)) + intBitsToFloat(PV1iz));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R124i.w)) + intBitsToFloat(uf_remappedVS[24].x));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R125i.y)));
R124i.w = int(intBitsToFloat(backupReg0i));
// 7
backupReg0i = R126i.x;
backupReg1i = R127i.z;
R126i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[30].x) + intBitsToFloat(uf_remappedVS[30].z));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(PV0iw)) + intBitsToFloat(backupReg0i));
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[30].y) + intBitsToFloat(uf_remappedVS[30].w));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(backupReg1i)));
R126i.w = int(intBitsToFloat(R124i.x));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R127i.w)) + intBitsToFloat(uf_remappedVS[26].x));
R126i.z = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[22].z));
// 9
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(R125i.w)) + intBitsToFloat(R125i.y));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(uf_remappedVS[30].w)) + intBitsToFloat(R127i.z));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(uf_remappedVS[30].z)) + intBitsToFloat(backupReg0i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[22].w));
// 10
backupReg0i = R126i.y;
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R15i.y)),intBitsToFloat(uf_remappedVS[29].x)) + -(intBitsToFloat(R125i.x)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[22].x), intBitsToFloat(R126i.z)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.y),intBitsToFloat(uf_remappedVS[29].y)) + intBitsToFloat(R124i.y));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[22].y), intBitsToFloat(PS1i)));
R0i.w = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 11
backupReg0i = R10i.x;
backupReg1i = R124i.w;
R10i.x = uf_remappedVS[31].z;
R8i.y = uf_remappedVS[31].y;
R2i.z = uf_remappedVS[31].x;
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R126i.y)) + -(0.5));
PS1i = floatBitsToInt(float(backupReg1i));
// 12
R8i.x = uf_remappedVS[32].x;
R2i.y = uf_remappedVS[32].z;
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(PS1i)) + intBitsToFloat(R125i.x));
R1i.w = uf_remappedVS[32].y;
PS0i = floatBitsToInt(float(R126i.w));
// 13
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(R127i.w)) + -(0.5));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.y),intBitsToFloat(uf_remappedVS[28].w)) + intBitsToFloat(R125i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.y),intBitsToFloat(uf_remappedVS[28].z)) + intBitsToFloat(R125i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)),intBitsToFloat(PS0i)) + intBitsToFloat(R126i.z));
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[27].x),intBitsToFloat(R6i.w)) + intBitsToFloat(R126i.x));
// 14
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(R123i.x)) + -(intBitsToFloat(R123i.w)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R124i.w)) + intBitsToFloat(R127i.z));
// 15
R0i.x = floatBitsToInt(intBitsToFloat(R123i.z) + 0.5);
R0i.y = floatBitsToInt(intBitsToFloat(R123i.x) + 0.5);
R0i.z = 0;
}
if( activeMaskStackC[3] == true ) {
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(uf_remappedVS[33].x)) + -(intBitsToFloat(uf_remappedVS[33].y)));
R123i.x = clampFI32(R123i.x);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[25].x), intBitsToFloat(R2i.w)));
// 1
PV1ix = floatBitsToInt(min(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[34].z)));
R123i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[20].y) * 1.0 + intBitsToFloat(R3i.w));
R124i.w = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iy)));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(R0i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[25].z)),intBitsToFloat(PS1i)) + intBitsToFloat(uf_remappedVS[25].z));
R123i.y = clampFI32(R123i.y);
R127i.z = floatBitsToInt(-(intBitsToFloat(R1i.z)) + intBitsToFloat(PV1ix));
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(uf_remappedVS[35].x)));
// 3
R126i.x = floatBitsToInt(intBitsToFloat(R123i.y) + intBitsToFloat(0x80000000));
R126i.x = clampFI32(R126i.x);
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(uf_remappedVS[35].y)));
PV1iz = floatBitsToInt(max(intBitsToFloat(PV0ix), intBitsToFloat(0x3e4ccccd)));
R12i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(uf_remappedVS[35].w)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(uf_remappedVS[35].z)));
// 4
backupReg0i = R2i.y;
backupReg1i = R124i.w;
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(uf_remappedVS[36].x)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(uf_remappedVS[36].y)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[36].z)));
R124i.w = floatBitsToInt(min(intBitsToFloat(PV1iz), 1.0));
tempResultf = max(0.0, intBitsToFloat(backupReg1i));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[34].y),intBitsToFloat(R127i.z)) + intBitsToFloat(uf_remappedVS[34].x));
R123i.x = clampFI32(R123i.x);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[33].w), intBitsToFloat(PS0i)));
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R124i.w)));
// 6
R18i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(uf_remappedVS[37].w)));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R124i.w)));
R13i.w = R126i.x;
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R124i.w)));
// 7
PS1i = floatBitsToInt(exp2(intBitsToFloat(R125i.y)));
// 8
R18i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)),intBitsToFloat(uf_remappedVS[38].w)) + intBitsToFloat(uf_remappedVS[38].w));
R18i.z = R126i.x;
}
if( activeMaskStackC[3] == true ) {
// 0
R4i.x = uf_remappedVS[39].x;
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[40].x)));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(uf_remappedVS[40].x)));
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(uf_remappedVS[40].x)));
// 1
R17i.y = uf_remappedVS[41].x;
}
if( activeMaskStackC[3] == true ) {
// 0
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].x), intBitsToFloat(R2i.x)));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].x), intBitsToFloat(R2i.y)));
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].x), intBitsToFloat(R2i.z)));
R14i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(uf_remappedVS[36].w)));
// 1
R17i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].x) * 1.0 + 0.0);
// 2
R21i.x = R11i.x;
R21i.y = R11i.y;
R21i.z = R11i.z;
R21i.w = R11i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R21i.x), intBitsToFloat(R21i.y), intBitsToFloat(R21i.z), intBitsToFloat(R21i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.z));
// export
passParameterSem8 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.z));
}
