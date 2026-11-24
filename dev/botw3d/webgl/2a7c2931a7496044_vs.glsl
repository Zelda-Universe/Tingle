#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 2a7c2931a7496044
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[71];
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

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem5;
out vec4 passParameterSem7;
out vec4 passParameterSem8;
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
attrDecoder = attrDataSem4;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyz = attrDataSem3.xyz;
attrDecoder.xyz = uvec3((attrDecoder.xyz>>24)|((attrDecoder.xyz>>8)&0xFF00u)|((attrDecoder.xyz<<8)&0xFF0000u)|((attrDecoder.xyz<<24)));
attrDecoder.w = uint(0);
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), 0x3f800000);
attrDecoder = attrDataSem9;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R9i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem8;
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
R8i.z = floatBitsToInt(-(intBitsToFloat(R8i.y)) + 1.0);
R1i.w = 0;
R8i.w = floatBitsToInt(1.0);
// 1
R4i.w = floatBitsToInt(-(intBitsToFloat(R3i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R5i.w = floatBitsToInt(-(intBitsToFloat(R8i.x)) + 1.0);
// 2
predResult = (0.0 > intBitsToFloat(R4i.w));
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
R3i.w = R8i.w;
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
PS0i = int(intBitsToFloat(R2i.w));
// 1
R11i.x = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R4i.w) >= intBitsToFloat(R11i.x));
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
R1i.w = R8i.w;
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
R0i.y = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedVS[4].x),intBitsToFloat(uf_remappedVS[4].y),intBitsToFloat(uf_remappedVS[4].z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[4].x),intBitsToFloat(uf_remappedVS[4].y),intBitsToFloat(uf_remappedVS[4].z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.w = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 3
R0i.x = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 4
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
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].x), intBitsToFloat(R127i.y)));
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].x), intBitsToFloat(R127i.y)));
// 2
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].x), intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R12i.x = 0;
// 1
R14i.x = R12i.x;
// 2
R13i.x = R12i.x;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
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
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].y), intBitsToFloat(R127i.x)));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].y), intBitsToFloat(R127i.x)));
// 2
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R14i.y = 0;
R13i.y = 0;
// 1
R12i.y = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (intBitsToFloat(R0i.x) > 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R0i.x));
// 1
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].z), intBitsToFloat(R127i.x)));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].z), intBitsToFloat(R127i.x)));
// 2
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R14i.z = 0;
R13i.z = 0;
// 1
R12i.z = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R125i.x = floatBitsToInt(max(intBitsToFloat(R6i.x), 0.0));
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[5].x))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(uf_remappedVS[5].x) > 0.0)?1.0:0.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(uf_remappedVS[6].y)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[5].x));
// 1
R127i.x = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(intBitsToFloat(R4i.w) * intBitsToFloat(PS0i));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].w)) + intBitsToFloat(uf_remappedVS[8].w));
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].z)) + intBitsToFloat(uf_remappedVS[8].z));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R11i.x));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R11i.z = floatBitsToInt(intBitsToFloat(R4i.w) * intBitsToFloat(PS1i));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].x)) + intBitsToFloat(uf_remappedVS[8].x));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].y)) + intBitsToFloat(uf_remappedVS[8].y));
// 3
backupReg0i = R127i.z;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), intBitsToFloat(PV0iy)));
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].w)) + intBitsToFloat(uf_remappedVS[9].w));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].z)) + intBitsToFloat(uf_remappedVS[9].z));
PV1iw = floatBitsToInt(fract(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 4
R124i.x = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV1iw)));
R127i.w = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS1i));
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].x)) + intBitsToFloat(uf_remappedVS[9].x));
// 5
backupReg0i = R127i.y;
R0i.x = floatBitsToInt(min(intBitsToFloat(R125i.x), 0.0));
R127i.y = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV0iz));
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].y)) + intBitsToFloat(uf_remappedVS[9].y));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 6
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.y) + -(intBitsToFloat(uf_remappedVS[7].w)));
R125i.y = floatBitsToInt(intBitsToFloat(R127i.y) + -(intBitsToFloat(uf_remappedVS[8].w)));
R126i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(PS1i));
R126i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(PS1i));
R124i.y = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS1i));
// 7
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].w)) + intBitsToFloat(uf_remappedVS[10].w));
R10i.y = ((intBitsToFloat(R125i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R0i.z = floatBitsToInt(intBitsToFloat(R127i.y) + -(intBitsToFloat(uf_remappedVS[9].w)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R124i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R126i.y)));
// 8
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].x)) + intBitsToFloat(uf_remappedVS[10].x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R127i.w)));
R125i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].y)) + intBitsToFloat(uf_remappedVS[10].y));
R127i.w = ((intBitsToFloat(backupReg0i) >= 0.0)?(floatBitsToInt(1.0)):(0));
R0i.y = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 9
backupReg0i = R126i.w;
R124i.x = floatBitsToInt(intBitsToFloat(R127i.y) + -(intBitsToFloat(uf_remappedVS[10].w)));
R127i.y = ((intBitsToFloat(R0i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R124i.z = floatBitsToInt(-(intBitsToFloat(R10i.y)) + 1.0);
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].z)) + intBitsToFloat(uf_remappedVS[10].z));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(backupReg0i)));
// 10
backupReg0i = R126i.y;
R125i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].x) + intBitsToFloat(R125i.w));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R126i.z)));
R126i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].z) + intBitsToFloat(backupReg0i));
R125i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].y) + intBitsToFloat(R127i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R124i.y)));
// 11
backupReg0i = R0i.y;
backupReg1i = R125i.z;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(backupReg0i));
R0i.y = ((intBitsToFloat(R124i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.z = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(backupReg0i));
R126i.w = floatBitsToInt(intBitsToFloat(backupReg1i) * intBitsToFloat(backupReg0i));
PS1i = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
// 12
backupReg0i = R126i.x;
backupReg1i = R126i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R124i.z)));
R126i.y = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(PS1i)));
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].x) + intBitsToFloat(backupReg0i));
R124i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].y) + intBitsToFloat(backupReg1i));
// 13
backupReg0i = R127i.x;
backupReg1i = R127i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R126i.w)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(backupReg0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R125i.z)));
R124i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].z) + intBitsToFloat(backupReg1i));
R126i.w = floatBitsToInt(-(intBitsToFloat(R0i.y)) + 1.0);
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].x), intBitsToFloat(R126i.y)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R126i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R126i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R126i.x)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].y), intBitsToFloat(R126i.y)));
// 15
R126i.x = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0ix));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].z), intBitsToFloat(R126i.y)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R126i.w)));
R126i.w = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PS0i));
R126i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].x) + intBitsToFloat(R125i.y));
// 16
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].z) + intBitsToFloat(R127i.z));
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].y) + intBitsToFloat(backupReg0i));
R127i.z = floatBitsToInt(intBitsToFloat(R124i.y) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R124i.z)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R124i.z)));
// 17
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(R126i.w));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R126i.x));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R124i.z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R125i.z)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R125i.z)));
// 18
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R125i.z)));
R124i.y = floatBitsToInt(intBitsToFloat(PS1i) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R127i.z));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].x), intBitsToFloat(R0i.y)));
// 19
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].y), intBitsToFloat(R0i.y)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].z), intBitsToFloat(R0i.y)));
PV1iw = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(PV0iz));
R0i.x = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(R0i.x));
// 20
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R124i.y));
R10i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[11].x)) + 1.0);
// 21
R10i.y = ((intBitsToFloat(uf_remappedVS[11].x) == 1.0)?-1:0);
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(PV0iy)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PV0iz)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[12].y)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[12].z)));
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[12].w)));
// 1
R1i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(R4i.w));
// 2
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
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].w), intBitsToFloat(PV0ix)));
// 2
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].x), intBitsToFloat(PV1iw)));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].y), intBitsToFloat(PV1iw)));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].z), intBitsToFloat(PV1iw)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
tempResultf = max(0.0, abs(intBitsToFloat(uf_remappedVS[11].x)));
tempResultf = log2(tempResultf);
PS0i = floatBitsToInt(tempResultf);
// 1
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f317218));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[11].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PS1i)));
R127i.y = ((intBitsToFloat(uf_remappedVS[11].x) == 0.0)?(0xff7fffff):(PV1iz));
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
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].w), intBitsToFloat(PV1ix)));
// 9
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].x), intBitsToFloat(PV0iw)));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].y), intBitsToFloat(PV0iw)));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].z), intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = uf_remappedVS[14].x & 0x10000;
R127i.y = uf_remappedVS[14].x & 0x40000;
PV0iz = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(R6i.y));
R127i.w = uf_remappedVS[14].x & 0x20000;
R126i.y = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(R6i.z));
// 1
R127i.x = floatBitsToInt(intBitsToFloat(PV0iz) * 0.5);
R125i.y = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(R6i.z));
PV1iz = R6i.y;
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 2.0);
R126i.w = R6i.x;
R126i.w = floatBitsToInt(intBitsToFloat(R126i.w) * 2.0);
PS1i = floatBitsToInt(float(PV0ix));
// 2
R126i.x = floatBitsToInt(intBitsToFloat(R126i.y) * 0.5);
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R125i.w = floatBitsToInt(floor(intBitsToFloat(PV1iz)));
PS0i = floatBitsToInt(float(R127i.y));
// 3
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iz)));
R126i.z = R6i.z;
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) * 2.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PS1i = floatBitsToInt(float(R127i.w));
// 4
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R127i.w = floatBitsToInt(floor(intBitsToFloat(R126i.w)));
R126i.w = int(intBitsToFloat(PV1iy));
// 5
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R125i.y) * 0.5);
PV1iy = 0 - R126i.w;
R125i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + -(0.5));
R125i.z = floatBitsToInt(intBitsToFloat(R125i.z) * 2.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0ix)));
R127i.z = int(intBitsToFloat(PV0iy));
// 6
PV0ix = 0 - R127i.z;
R127i.y = floatBitsToInt(intBitsToFloat(R126i.x) + -(0.5));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
R124i.z = max(R126i.w, PV1iy);
R126i.w = floatBitsToInt((intBitsToFloat(R125i.w) > 0.0)?1.0:0.0);
R125i.y = int(intBitsToFloat(PV1iw));
// 7
R126i.x = floatBitsToInt(floor(intBitsToFloat(R126i.z)));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(R125i.w))?1.0:0.0);
PV1iz = 0 - R125i.y;
R125i.w = max(R127i.z, PV0ix);
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[15].w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 8
backupReg0i = R125i.y;
backupReg1i = R126i.w;
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(R127i.w))?1.0:0.0);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt((intBitsToFloat(R127i.w) > 0.0)?1.0:0.0);
R126i.w = max(backupReg0i, PV1iz);
R127i.z = floatBitsToInt(intBitsToFloat(backupReg1i) + -(intBitsToFloat(PV1iy)));
// 9
backupReg0i = R127i.y;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) + -(0.5));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(uf_remappedVS[16].x)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[16].z)));
R127i.w = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(float(R124i.z));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 10
backupReg0i = R126i.x;
backupReg1i = R125i.w;
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[15].w)) + 1.0);
PV0iy = floatBitsToInt((intBitsToFloat(backupReg0i) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(backupReg0i))?1.0:0.0);
R125i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(R127i.z)));
PS0i = floatBitsToInt(float(backupReg1i));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 11
backupReg0i = R127i.y;
backupReg1i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iz)));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(R127i.w)));
R127i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(uf_remappedVS[15].x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), intBitsToFloat(uf_remappedVS[16].y)));
PS1i = floatBitsToInt(exp2(intBitsToFloat(R125i.y)));
// 12
backupReg0i = R126i.w;
R125i.x = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
R126i.y = floatBitsToInt(intBitsToFloat(R6i.x) + -(0.5));
R125i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[15].z) + intBitsToFloat(R125i.z));
R126i.w = floatBitsToInt(intBitsToFloat(R6i.z) + -(0.5));
PS0i = floatBitsToInt(float(backupReg0i));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 13
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R125i.w)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R125i.w)));
R124i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(R127i.x)));
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[15].y) + intBitsToFloat(R127i.w));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 14
PV0ix = ((intBitsToFloat(uf_remappedVS[15].w) == 1.0)?-1:0);
PV0iy = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R127i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R127i.y)));
R125i.x = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1ix));
// 15
R127i.x = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV0iw));
R125i.y = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(R125i.y));
R125i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0iz));
R125i.w = ((PV0ix == 0)?(PV0iy):(R4i.w));
PS1i = floatBitsToInt(intBitsToFloat(R6i.y) + -(0.5));
// 16
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R124i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R124i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(uf_remappedVS[17].z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(uf_remappedVS[17].x)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(uf_remappedVS[17].y)));
// 17
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R125i.w)));
// 18
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R124i.z));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R125i.w)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R125i.w)));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[11].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 19
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PS0i)));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iw = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(PV0iy));
R124i.z = floatBitsToInt(1.0 / intBitsToFloat(R10i.z));
// 20
R123i.x = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV0iw = uf_remappedVS[18].y;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 21
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iy = floatBitsToInt(fract(intBitsToFloat(backupReg0i)));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iw = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R0i.x = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(PV0iw));
// 22
R1i.x = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R1i.y = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(R124i.z));
R1i.z = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R0i.w = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R10i.x)));
}
if( activeMaskStackC[3] == true ) {
// 0
R123i.x = ((R10i.y == 0)?(R1i.y):(R1i.w));
PV0iy = uf_remappedVS[18].x;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
R124i.z = floatBitsToInt(intBitsToFloat(R1i.z) * intBitsToFloat(0x3e22f983));
R125i.w = floatBitsToInt(intBitsToFloat(R1i.x) * intBitsToFloat(0x3e22f983));
R127i.z = floatBitsToInt(cos((intBitsToFloat(R0i.w))/0.1591549367));
// 1
R126i.x = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R123i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R123i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R123i.x)));
R127i.y = floatBitsToInt(sin((intBitsToFloat(R125i.w))/0.1591549367));
// 2
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.y)));
PV0iy = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(PV1iw));
PV0iz = floatBitsToInt(intBitsToFloat(R7i.z) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(PV1iz));
R3i.z = floatBitsToInt(cos((intBitsToFloat(R125i.w))/0.1591549367));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(PV0iy)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(PV0iz)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R3i.z)));
R126i.y = floatBitsToInt(sin((intBitsToFloat(R0i.w))/0.1591549367));
// 4
R7i.x = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(PV1iy));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R127i.y)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R3i.z)));
R124i.w = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(PV1ix));
R127i.x = floatBitsToInt(sin((intBitsToFloat(R124i.z))/0.1591549367));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R125i.w)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R125i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R125i.z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R125i.y)));
R127i.w = floatBitsToInt(cos((intBitsToFloat(R124i.z))/0.1591549367));
// 6
backupReg0i = R125i.y;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.w)));
R125i.y = floatBitsToInt(-(intBitsToFloat(R125i.x)) + intBitsToFloat(PV1iz));
R127i.z = floatBitsToInt(-(intBitsToFloat(R125i.z)) + intBitsToFloat(PV1iy));
R126i.w = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV1ix));
R7i.y = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(PV1iw));
// 7
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R0i.x)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R127i.w)));
R125i.z = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(R126i.z));
R2i.w = 0x3f800000;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R10i.x)));
// 8
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R10i.x)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R3i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R10i.x)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R127i.y)));
R3i.y = floatBitsToInt(-(intBitsToFloat(backupReg0i)));
// 9
R0i.x = floatBitsToInt(intBitsToFloat(R6i.z) + 1.0);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.x), intBitsToFloat(R126i.x)));
R126i.z = ((intBitsToFloat(R4i.w) == 0.0)?-1:0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R125i.y)) + intBitsToFloat(R126i.y));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R7i.y)) + intBitsToFloat(PV0iz));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R124i.w),intBitsToFloat(R125i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[19].x),intBitsToFloat(uf_remappedVS[19].y),intBitsToFloat(uf_remappedVS[19].z),intBitsToFloat(uf_remappedVS[19].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R7i.z = tempi.x;
PV0iw = tempi.x;
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R2i.y)) + intBitsToFloat(R127i.x));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R124i.w),intBitsToFloat(R125i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R1i.w = tempi.x;
R3i.w = PV0ix;
// 12
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R124i.y)) + intBitsToFloat(R127i.w));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R0i.w)) + intBitsToFloat(R126i.y));
R3i.z = floatBitsToInt(intBitsToFloat(R6i.x) + 1.0);
R127i.w = floatBitsToInt(intBitsToFloat(R10i.x) * 0.0 + 1.0);
R2i.z = ((R126i.z == 0)?(R4i.w):(0x3f800000));
// 13
backupReg0i = R127i.z;
backupReg1i = R124i.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R126i.w)));
R5i.y = floatBitsToInt(intBitsToFloat(R6i.y) + 1.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R3i.y)) + intBitsToFloat(R125i.w));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(backupReg0i)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(backupReg1i)));
// 14
R1i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),intBitsToFloat(R12i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w))));
PV0iy = R1i.x;
PV0iz = R1i.x;
PV0iw = R1i.x;
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R124i.w),intBitsToFloat(R125i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R1i.w = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R125i.y)) + intBitsToFloat(R124i.x));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w))));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R124i.y)) + intBitsToFloat(R122i.x));
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(R14i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
// 18
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R7i.y)) + intBitsToFloat(R126i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R2i.y)) + intBitsToFloat(R125i.w));
// 19
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R0i.w)) + intBitsToFloat(R123i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R3i.y)) + intBitsToFloat(R123i.w));
// 20
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R123i.y),intBitsToFloat(R123i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R1i.z = tempi.x;
PV0iw = tempi.x;
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(uf_remappedVS[22].x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[22].x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(uf_remappedVS[22].x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(uf_remappedVS[23].w)));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(PV0iz));
R127i.z = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 2
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(PV1ix));
R1i.w = floatBitsToInt(intBitsToFloat(R2i.z) * intBitsToFloat(PS1i));
R1i.w = clampFI32(R1i.w);
// 3
R0i.x = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iy));
// 4
predResult = (intBitsToFloat(uf_remappedVS[24].y) != 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0iy = uf_remappedVS[19].w;
PV0iz = uf_remappedVS[20].w;
// 1
PV1ix = uf_remappedVS[21].w;
R127i.y = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(R1i.x)));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(R0i.y)));
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[24].y));
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
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PV1ix)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[20].w) + intBitsToFloat(uf_remappedVS[19].w));
R0i.w = 0x3f800000;
// 1
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(uf_remappedVS[25].z)));
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[21].w) + intBitsToFloat(PV0iz));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[25].w)));
// 2
R127i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3dd70a3d));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), intBitsToFloat(uf_remappedVS[23].x)));
// 3
PV1iy = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R127i.z));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[23].z), intBitsToFloat(uf_remappedVS[25].w)));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[23].y), intBitsToFloat(uf_remappedVS[25].z)));
// 5
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PV0iz)));
R123i.y = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iw = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0iy));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV1iw));
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
// 7
R123i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.z = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e22f983) + 0.5);
// 8
R127i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
// 9
R123i.w = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS1i = floatBitsToInt(sin((intBitsToFloat(R127i.x))/0.1591549367));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R126i.x)));
PS0i = floatBitsToInt(cos((intBitsToFloat(R127i.x))/0.1591549367));
// 11
R1i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R125i.x)));
R0i.z = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV1iy));
// 13
R0i.x = uf_remappedVS[26].x;
R4i.y = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(PV0ix));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt((intBitsToFloat(uf_remappedVS[27].x) > 0.0)?1.0:0.0);
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R0i.x)));
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[27].x))?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[27].x));
// 1
R125i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[28].y)) + intBitsToFloat(uf_remappedVS[29].y));
PV1iy = floatBitsToInt(intBitsToFloat(R4i.w) * intBitsToFloat(PS0i));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[28].x)) + intBitsToFloat(uf_remappedVS[29].x));
R127i.w = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iz)));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(uf_remappedVS[5].y)) + intBitsToFloat(PV1iy));
R127i.z = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
// 3
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[28].z)) + intBitsToFloat(uf_remappedVS[29].z));
PV1iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[28].w)) + intBitsToFloat(uf_remappedVS[29].w));
PV1iw = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
// 4
R0i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[29].y)) + intBitsToFloat(uf_remappedVS[30].y));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV1iw)));
R1i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[29].x)) + intBitsToFloat(uf_remappedVS[30].x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 5
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z),intBitsToFloat(R127i.z)) + intBitsToFloat(PV0iy));
R127i.y = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS0i));
R127i.z = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(PS0i));
R127i.w = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(PS0i));
// 6
R2i.x = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(uf_remappedVS[29].w)));
R1i.w = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(uf_remappedVS[28].w)));
// 7
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(R127i.w)) + intBitsToFloat(uf_remappedVS[28].z));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(R127i.z)) + intBitsToFloat(uf_remappedVS[28].y));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(R127i.y)) + intBitsToFloat(uf_remappedVS[28].x));
}
if( activeMaskStackC[3] == true ) {
// 0
R14i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R4i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[31].x),intBitsToFloat(uf_remappedVS[31].y),intBitsToFloat(uf_remappedVS[31].z),intBitsToFloat(uf_remappedVS[31].w))));
PV0iy = R14i.x;
PV0iz = R14i.x;
PV0iw = R14i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R4i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[32].x),intBitsToFloat(uf_remappedVS[32].y),intBitsToFloat(uf_remappedVS[32].z),intBitsToFloat(uf_remappedVS[32].w))));
PV1ix = tempi.x;
R14i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R4i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[33].x),intBitsToFloat(uf_remappedVS[33].y),intBitsToFloat(uf_remappedVS[33].z),intBitsToFloat(uf_remappedVS[33].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R14i.w = tempi.x;
// 3
R125i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R4i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[34].x),intBitsToFloat(uf_remappedVS[34].y),intBitsToFloat(uf_remappedVS[34].z),intBitsToFloat(uf_remappedVS[34].w))));
PV1iy = R125i.x;
PV1iz = R125i.x;
PV1iw = R125i.x;
R126i.y = PV0ix;
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) / 2.0);
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R4i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[35].x),intBitsToFloat(uf_remappedVS[35].y),intBitsToFloat(uf_remappedVS[35].z),intBitsToFloat(uf_remappedVS[35].w))));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(intBitsToFloat(R14i.w) * 1.0);
// 5
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R4i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[36].x),intBitsToFloat(uf_remappedVS[36].y),intBitsToFloat(uf_remappedVS[36].z),intBitsToFloat(uf_remappedVS[36].w))));
PV1iy = R126i.x;
PV1iz = R126i.x;
PV1iw = R126i.x;
R125i.z = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R4i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[37].x),intBitsToFloat(uf_remappedVS[37].y),intBitsToFloat(uf_remappedVS[37].z),intBitsToFloat(uf_remappedVS[37].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R127i.w = tempi.x;
// 7
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[18].z) + intBitsToFloat(R126i.x));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w)),vec4(intBitsToFloat(uf_remappedVS[38].x),intBitsToFloat(uf_remappedVS[38].y),intBitsToFloat(uf_remappedVS[38].z),intBitsToFloat(uf_remappedVS[38].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R126i.z = tempi.x;
PV0iw = tempi.x;
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w)),vec4(intBitsToFloat(uf_remappedVS[39].x),intBitsToFloat(uf_remappedVS[39].y),intBitsToFloat(uf_remappedVS[39].z),intBitsToFloat(uf_remappedVS[39].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 10
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 11
PV1iw = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS0i));
// 12
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.w), intBitsToFloat(PV1iw)));
// 13
R123i.x = floatBitsToInt(intBitsToFloat(R14i.z) * 0.5 + intBitsToFloat(R126i.y));
R127i.w = ((intBitsToFloat(R1i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 14
PV0iy = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(R125i.z));
R2i.z = ((intBitsToFloat(R2i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 15
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(uf_remappedVS[1].w)) + -(intBitsToFloat(uf_remappedVS[1].y)));
// 16
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R123i.x));
// 17
R5i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS0i));
// 18
R4i.x = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
PV0iz = floatBitsToInt(-(intBitsToFloat(R2i.z)) + 1.0);
// 19
R10i.x = uf_remappedVS[40].x;
R10i.y = uf_remappedVS[40].y;
R10i.z = uf_remappedVS[40].z;
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0iz)));
}
if( activeMaskStackC[3] == true ) {
// 0
R1i.x = floatBitsToInt(-(intBitsToFloat(R1i.x)) + intBitsToFloat(R10i.x));
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[29].z)) + intBitsToFloat(uf_remappedVS[30].z));
R4i.z = floatBitsToInt(-(intBitsToFloat(R0i.z)) + intBitsToFloat(R10i.z));
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[29].w)) + intBitsToFloat(uf_remappedVS[30].w));
R127i.w = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(uf_remappedVS[30].w)));
// 1
R125i.x = ((intBitsToFloat(R127i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[30].y)) + intBitsToFloat(uf_remappedVS[41].y));
R125i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[30].x)) + intBitsToFloat(uf_remappedVS[41].x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R0i.x) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(intBitsToFloat(R1i.z) * intBitsToFloat(PS1i));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[30].z)) + intBitsToFloat(uf_remappedVS[41].z));
PV0iw = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[30].w)) + intBitsToFloat(uf_remappedVS[41].w));
// 3
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(PV0iw)) + intBitsToFloat(uf_remappedVS[29].z));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(PV0ix)) + intBitsToFloat(uf_remappedVS[29].y));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(PV0iy)) + intBitsToFloat(uf_remappedVS[29].x));
PV1iw = floatBitsToInt(-(intBitsToFloat(R125i.x)) + 1.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS1i));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV1iw)));
PS0i = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(uf_remappedVS[41].w)));
// 5
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV0iz)) + intBitsToFloat(uf_remappedVS[30].z));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV0ix)) + intBitsToFloat(uf_remappedVS[30].y));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV0iy)) + intBitsToFloat(uf_remappedVS[30].x));
R127i.w = ((intBitsToFloat(PS0i) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS1i = ((intBitsToFloat(R6i.x) > 0.5)?-1:0);
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[28].y), intBitsToFloat(R4i.x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[28].z), intBitsToFloat(R4i.x)));
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[28].x), intBitsToFloat(R4i.x)));
R2i.y = ((PS1i == 0)?(R8i.x):(R5i.w));
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R1i.y)) + intBitsToFloat(PV0iw));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PV0iz)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R1i.y)) + intBitsToFloat(PV0iy));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R1i.y)) + intBitsToFloat(PV0ix));
R0i.w = uf_remappedVS[42].x;
// 8
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R126i.w)) + intBitsToFloat(R123i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R126i.w)) + intBitsToFloat(backupReg0i));
R2i.z = uf_remappedVS[43].x;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R126i.w)) + intBitsToFloat(R123i.z));
R1i.z = uf_remappedVS[43].y;
// 9
backupReg0i = R123i.x;
backupReg1i = R123i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y)) + intBitsToFloat(R123i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R125i.y)) + intBitsToFloat(backupReg0i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R125i.y)) + intBitsToFloat(backupReg1i));
R2i.w = uf_remappedVS[43].z;
R1i.y = uf_remappedVS[44].x;
// 10
PV0ix = ((intBitsToFloat(R6i.y) > 0.5)?-1:0);
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[41].z),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.x));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[41].y),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.y));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[41].x),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.z));
PS0i = ((intBitsToFloat(R6i.z) > 0.5)?-1:0);
// 11
R5i.x = ((PV0ix == 0)?(R8i.y):(R8i.z));
PV1iy = ((intBitsToFloat(R6i.w) > 0.5)?-1:0);
PV1iz = ((intBitsToFloat(R6i.y) > 0.5)?-1:0);
R3i.w = ((PS0i == 0)?(R8i.x):(R5i.w));
PS1i = ((intBitsToFloat(R6i.z) > 0.5)?-1:0);
// 12
R4i.x = ((PS1i == 0)?(R8i.y):(R8i.z));
R3i.y = ((PV1iz == 0)?(R8i.x):(R5i.w));
R0i.z = ((PV1iy == 0)?(R8i.y):(R8i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R0i.y;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(uf_remappedVS[45].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(uf_remappedVS[45].y)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[45].z)));
R16i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[45].w)));
// 1
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[46].x)));
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[46].x)));
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(uf_remappedVS[46].x)));
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(uf_remappedVS[47].x)));
// 2
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(uf_remappedVS[47].y)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(uf_remappedVS[47].z)));
R17i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[47].w)));
// 3
R17i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[46].x), intBitsToFloat(R0i.x)));
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[46].x), intBitsToFloat(R0i.y)));
R17i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[46].x), intBitsToFloat(R1i.z)));
PS1i = int(intBitsToFloat(uf_remappedVS[48].z));
// 4
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(uf_remappedVS[49].x)));
R2i.w = floatBitsToInt(intBitsToFloat(R2i.w) * 2.0);
R127i.w = floatBitsToInt(float(PS1i));
// 5
PV1iy = floatBitsToInt((0.0 >= abs(intBitsToFloat(R127i.w)))?1.0:0.0);
PV1iz = floatBitsToInt(-(abs(intBitsToFloat(R127i.w))) + 0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 6
R127i.x = ((intBitsToFloat(PV1iy) == 0.0)?(0):(PV1iz));
PV0iz = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[48].z));
// 7
PV1iy = floatBitsToInt(trunc(intBitsToFloat(PV0iz)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[48].x), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(abs(intBitsToFloat(R127i.w)) + intBitsToFloat(R127i.x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[48].w));
// 8
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[48].y), intBitsToFloat(PS1i)));
R123i.z = ((-(intBitsToFloat(R127i.x)) > 0.0)?(PV1iw):(R127i.x));
R2i.x = int(intBitsToFloat(PV1iy));
// 9
R123i.y = ((intBitsToFloat(R127i.w) == 0.0)?(0):(R123i.z));
// 10
R7i.x = uf_remappedVS[12].x;
R3i.x = int(intBitsToFloat(R123i.y));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = uf_remappedVS[14].x & 0x80000;
PV0iw = uf_remappedVS[14].x & 0x100000;
// 1
PV1ix = uf_remappedVS[14].x & 0x200000;
PV1iy = uf_remappedVS[14].x & 0x400000;
PV1iz = (PV0iw == 0x100000)?-1:0;
PV1iw = (PV0ix == 0x80000)?-1:0;
// 2
R126i.x = ((PV1iw == 0)?(R8i.x):(R2i.y));
PV0iy = (PV1ix == 0x200000)?-1:0;
PV0iz = (PV1iy == 0x400000)?-1:0;
R127i.w = ((PV1iz == 0)?(R8i.y):(R5i.x));
PS0i = uf_remappedVS[14].x & 0x800000;
// 3
PV1ix = uf_remappedVS[14].x & 0x1000000;
R2i.y = ((PV0iz == 0)?(R8i.y):(R0i.z));
R0i.z = ((PV0iy == 0)?(R8i.x):(R3i.w));
PV1iw = (PS0i == 0x800000)?-1:0;
PS1i = uf_remappedVS[14].y & int(1);
// 4
R5i.x = ((PV1iw == 0)?(R8i.x):(R3i.y));
R3i.y = (int(1) != PS1i)?-1:0;
PV0iz = (PV1ix == 0x1000000)?-1:0;
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[50].z) + intBitsToFloat(uf_remappedVS[49].x));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(uf_remappedVS[49].y)));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
// 5
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[50].w) + intBitsToFloat(uf_remappedVS[49].y));
R127i.y = floatBitsToInt(-(intBitsToFloat(R2i.w)) + intBitsToFloat(PV0iw));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R0i.x)) + -(0.5));
R3i.w = ((PV0iz == 0)?(R8i.y):(R4i.x));
R127i.w = floatBitsToInt(float(R3i.x));
// 6
R123i.x = ((R3i.y == 0)?(0):(int(1)));
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[51].y) + intBitsToFloat(uf_remappedVS[51].z));
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(PV1ix));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R1i.z)) + -(0.5));
R127i.x = floatBitsToInt(float(R2i.x));
// 7
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(uf_remappedVS[51].z)) + intBitsToFloat(PV0iy));
R125i.y = (R123i.x == int(1))?-1:0;
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.w)),intBitsToFloat(uf_remappedVS[50].x)) + -(intBitsToFloat(R127i.y)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[50].y)) + intBitsToFloat(PV0iz));
R126i.z = (R123i.x == 0x2)?-1:0;
// 8
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[52].y) + intBitsToFloat(uf_remappedVS[52].w));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.x)),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.w));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[52].x) + intBitsToFloat(uf_remappedVS[52].z));
R127i.y = ((R126i.z == 0)?(R6i.x):(R6i.z));
// 9
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(uf_remappedVS[52].w)) + intBitsToFloat(PV0ix));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[51].x)) + intBitsToFloat(R126i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(uf_remappedVS[52].z)) + intBitsToFloat(PV0iw));
R123i.w = ((R126i.z == 0)?(R6i.y):(R6i.x));
R127i.w = ((R126i.z == 0)?(R6i.z):(R6i.y));
// 10
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[49].z)) + intBitsToFloat(R123i.z));
R127i.y = ((R125i.y == 0)?(R127i.y):(R6i.y));
R123i.z = floatBitsToInt(-(intBitsToFloat(R123i.y)) * intBitsToFloat(0x3e22f983) + 0.5);
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[49].w)) + intBitsToFloat(R123i.x));
R126i.y = ((R125i.y == 0)?(R123i.w):(R6i.z));
// 11
R127i.x = ((R125i.y == 0)?(R127i.w):(R6i.x));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
R2i.z = ((R125i.y == 0)?(R6i.y):(R6i.z));
R124i.w = ((R125i.y == 0)?(R6i.x):(R6i.y));
PS1i = int(intBitsToFloat(uf_remappedVS[53].z));
// 12
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[54].x), intBitsToFloat(R127i.y)));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[54].y), intBitsToFloat(R126i.y)));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) * 2.0);
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[55].z) + intBitsToFloat(uf_remappedVS[54].x));
R126i.x = floatBitsToInt(float(PS1i));
// 13
PV1ix = floatBitsToInt(-(abs(intBitsToFloat(R126i.x))) + 0.0);
PV1iy = floatBitsToInt((0.0 >= abs(intBitsToFloat(R126i.x)))?1.0:0.0);
R1i.z = floatBitsToInt(-(intBitsToFloat(PV0iy)) + intBitsToFloat(PV0iw));
R127i.w = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 14
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[55].w) + intBitsToFloat(uf_remappedVS[54].y));
R127i.y = ((intBitsToFloat(PV1iy) == 0.0)?(0):(PV1ix));
PV0iw = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
R125i.z = floatBitsToInt(sin((intBitsToFloat(R127i.w))/0.1591549367));
// 15
backupReg0i = R127i.w;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R126i.w)));
PV1iy = floatBitsToInt(abs(intBitsToFloat(R126i.x)) + intBitsToFloat(R127i.y));
PV1iz = floatBitsToInt(trunc(intBitsToFloat(PV0iw)));
R127i.w = floatBitsToInt(-(intBitsToFloat(R126i.z)) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(cos((intBitsToFloat(backupReg0i))/0.1591549367));
// 16
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i),intBitsToFloat(R124i.z)) + intBitsToFloat(PV1ix));
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[56].y) + intBitsToFloat(uf_remappedVS[56].z));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R126i.w)));
R123i.w = ((-(intBitsToFloat(R127i.y)) > 0.0)?(PV1iy):(R127i.y));
R127i.y = int(intBitsToFloat(PV1iz));
// 17
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.z)),intBitsToFloat(R124i.z)) + intBitsToFloat(PV0iz));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(backupReg0i)) + -(intBitsToFloat(R127i.z)));
R123i.z = ((intBitsToFloat(R126i.x) == 0.0)?(0):(R123i.w));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[56].z),intBitsToFloat(R127i.x)) + intBitsToFloat(PV0iy));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[53].z));
// 18
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.w)),intBitsToFloat(uf_remappedVS[55].x)) + -(intBitsToFloat(R1i.z)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[55].y)) + intBitsToFloat(R127i.w));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R123i.x)) + intBitsToFloat(R124i.y));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[53].x), intBitsToFloat(PS1i)));
R124i.y = int(intBitsToFloat(R123i.z));
// 19
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R127i.w)) + -(0.5));
R123i.y = ((R3i.y == 0)?(0):(0x2));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[56].x)) + intBitsToFloat(R125i.w));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[53].w));
// 20
backupReg0i = R124i.y;
R0i.x = (R123i.y == int(1))?-1:0;
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[53].y), intBitsToFloat(PS1i)));
R0i.z = (R123i.y == 0x2)?-1:0;
R123i.w = floatBitsToInt(-(intBitsToFloat(R123i.z)) * intBitsToFloat(0x3e22f983) + 0.5);
PS0i = floatBitsToInt(float(backupReg0i));
// 21
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[57].x) + intBitsToFloat(uf_remappedVS[57].z));
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[57].y) + intBitsToFloat(uf_remappedVS[57].w));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PS0i)) + intBitsToFloat(R125i.x));
PV1iw = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PS1i = floatBitsToInt(float(R127i.y));
// 22
backupReg0i = R2i.y;
R3i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.y)),intBitsToFloat(PS1i)) + intBitsToFloat(R126i.y));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[57].w),intBitsToFloat(R2i.z)) + intBitsToFloat(PV1iy));
R2i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[57].z),intBitsToFloat(R124i.w)) + intBitsToFloat(PV1ix));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R124i.y)) + -(0.5));
}
if( activeMaskStackC[3] == true ) {
// 0
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[54].w)) + intBitsToFloat(R2i.y));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[54].z)) + intBitsToFloat(R2i.w));
R127i.z = floatBitsToInt(intBitsToFloat(R2i.z) * intBitsToFloat(0x3e22f983));
R123i.w = ((R0i.z == 0)?(R6i.x):(R6i.z));
R122i.x = ((R0i.z == 0)?(R6i.y):(R6i.x));
// 1
R123i.x = ((R0i.z == 0)?(R6i.z):(R6i.y));
R127i.y = ((R0i.x == 0)?(R6i.x):(R6i.y));
R125i.z = ((R0i.x == 0)?(R122i.x):(R6i.z));
R123i.w = ((R0i.x == 0)?(R123i.w):(R6i.y));
R124i.w = floatBitsToInt(sin((intBitsToFloat(R127i.z))/0.1591549367));
// 2
backupReg0i = R127i.z;
R127i.x = ((R0i.x == 0)?(R123i.x):(R6i.x));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R2i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[58].x), intBitsToFloat(R123i.w)));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 2.0);
R127i.w = ((R0i.x == 0)?(R6i.y):(R6i.z));
PS0i = floatBitsToInt(cos((intBitsToFloat(backupReg0i))/0.1591549367));
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i),intBitsToFloat(R3i.y)) + intBitsToFloat(PV0iy));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[58].y), intBitsToFloat(R125i.z)));
R125i.z = floatBitsToInt(intBitsToFloat(R125i.z) * 2.0);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R2i.x)));
PS1i = int(intBitsToFloat(uf_remappedVS[59].z));
// 4
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.w)),intBitsToFloat(R3i.y)) + intBitsToFloat(PV1iw));
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[60].z) + intBitsToFloat(uf_remappedVS[58].x));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(backupReg0i)) + -(intBitsToFloat(R3i.x)));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[60].w) + intBitsToFloat(uf_remappedVS[58].y));
R124i.y = floatBitsToInt(float(PS1i));
// 5
backupReg0i = R126i.y;
R125i.x = floatBitsToInt(-(intBitsToFloat(R127i.z)) + intBitsToFloat(PV0iy));
R126i.y = floatBitsToInt(-(intBitsToFloat(R125i.z)) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(-(abs(intBitsToFloat(R124i.y))) + 0.0);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R123i.x)) + intBitsToFloat(R1i.z));
PS1i = floatBitsToInt((0.0 >= abs(intBitsToFloat(R124i.y)))?1.0:0.0);
// 6
R12i.x = floatBitsToInt(intBitsToFloat(R3i.z) + 0.5);
R12i.y = floatBitsToInt(intBitsToFloat(R8i.y) + 0.5);
R127i.z = ((intBitsToFloat(PS1i) == 0.0)?(0):(PV1iz));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[61].y) + intBitsToFloat(uf_remappedVS[61].z));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R124i.y));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
PV1iy = floatBitsToInt(abs(intBitsToFloat(R124i.y)) + intBitsToFloat(R127i.z));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[61].z),intBitsToFloat(R127i.x)) + intBitsToFloat(PV0iw));
R13i.w = 0;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[59].z));
// 8
R123i.x = ((-(intBitsToFloat(R127i.z)) > 0.0)?(PV1iy):(R127i.z));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[59].x), intBitsToFloat(PS1i)));
R12i.z = floatBitsToInt(intBitsToFloat(R124i.w) + 0.5);
PV0iw = floatBitsToInt(trunc(intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[59].w));
// 9
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.w)),intBitsToFloat(uf_remappedVS[60].x)) + -(intBitsToFloat(R125i.x)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[60].y)) + intBitsToFloat(R126i.y));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[59].y), intBitsToFloat(PS0i)));
R123i.w = ((intBitsToFloat(R124i.y) == 0.0)?(0):(R123i.x));
R127i.z = int(intBitsToFloat(PV0iw));
// 10
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R125i.y)) + -(0.5));
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[62].x) + intBitsToFloat(uf_remappedVS[62].z));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(R124i.z)) + -(0.5));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[62].y) + intBitsToFloat(uf_remappedVS[62].w));
PS0i = int(intBitsToFloat(R123i.w));
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[62].z),intBitsToFloat(R127i.y)) + intBitsToFloat(PV0iy));
R127i.y = floatBitsToInt(-(intBitsToFloat(R4i.y)) + intBitsToFloat(R10i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[62].w),intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iw));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[61].x)) + intBitsToFloat(R125i.z));
PS1i = floatBitsToInt(float(PS0i));
// 12
backupReg0i = R123i.x;
backupReg1i = R125i.y;
backupReg2i = R127i.z;
R123i.x = floatBitsToInt(-(intBitsToFloat(R123i.w)) * intBitsToFloat(0x3e22f983) + 0.5);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[58].w)) + intBitsToFloat(R123i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[58].z)) + intBitsToFloat(backupReg0i));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i),intBitsToFloat(PS1i)) + intBitsToFloat(R125i.x));
PS0i = floatBitsToInt(float(backupReg2i));
// 13
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.z)),intBitsToFloat(PS0i)) + intBitsToFloat(R126i.y));
R15i.y = uf_remappedVS[63].x;
PV1iz = floatBitsToInt(intBitsToFloat(R4i.z) * intBitsToFloat(R4i.z));
PV1iw = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
R12i.w = floatBitsToInt(intBitsToFloat(R126i.z) + 0.5);
// 14
R18i.x = R11i.z;
R18i.y = uf_remappedVS[63].y;
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.w = floatBitsToInt((intBitsToFloat(R127i.y) * intBitsToFloat(R127i.y) + intBitsToFloat(PV1iz)));
R18i.z = uf_remappedVS[63].z;
// 15
R125i.x = floatBitsToInt((intBitsToFloat(R1i.x) * intBitsToFloat(R1i.x) + intBitsToFloat(R123i.w)));
R126i.y = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
// 16
R124i.x = floatBitsToInt(sin((intBitsToFloat(R126i.y))/0.1591549367));
// 17
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R127i.x)));
PS1i = floatBitsToInt(cos((intBitsToFloat(R126i.y))/0.1591549367));
// 18
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R127i.x)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i),intBitsToFloat(R3i.z)) + intBitsToFloat(PV1iz));
tempResultf = 1.0 / sqrt(intBitsToFloat(R125i.x));
PS0i = floatBitsToInt(tempResultf);
// 19
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PS0i)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R123i.y)) + -(intBitsToFloat(R126i.x)));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.x)),intBitsToFloat(R3i.z)) + intBitsToFloat(PV0ix));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PS0i)));
// 20
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R123i.w)) + intBitsToFloat(R127i.w));
// 21
R19i.x = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
R19i.y = floatBitsToInt(intBitsToFloat(R126i.z) + 0.5);
// 22
R15i.x = floatBitsToInt(intBitsToFloat(R7i.x) * 1.0 + 0.0);
R5i.y = floatBitsToInt(intBitsToFloat(R5i.y) * 0.25 + 0.5);
R5i.y = clampFI32(R5i.y);
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R4i.y),intBitsToFloat(R3i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[64].x),intBitsToFloat(uf_remappedVS[64].y),intBitsToFloat(uf_remappedVS[64].z),0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(intBitsToFloat(uf_remappedVS[64].y) + 1.0);
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(uf_remappedVS[65].x)) + -(intBitsToFloat(uf_remappedVS[65].y)));
R123i.x = clampFI32(R123i.x);
PV1iy = floatBitsToInt(min(intBitsToFloat(R10i.y), intBitsToFloat(uf_remappedVS[66].z)));
R126i.z = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
R127i.w = floatBitsToInt(intBitsToFloat(PS0i) * 1.5);
R127i.w = clampFI32(R127i.w);
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
R127i.y = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(uf_remappedVS[67].x)) + -(intBitsToFloat(uf_remappedVS[67].y)));
R123i.z = clampFI32(R123i.z);
PV0iw = floatBitsToInt(-(intBitsToFloat(R7i.z)) + intBitsToFloat(PV1iy));
R122i.x = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
// 3
R1i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[64].y) * 1.0 + intBitsToFloat(R5i.z));
PV1iy = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[66].y),intBitsToFloat(PV0iw)) + intBitsToFloat(uf_remappedVS[66].x));
R123i.z = clampFI32(R123i.z);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R122i.x)) + intBitsToFloat(0xbe593484));
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[65].w), intBitsToFloat(PS1i)));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(uf_remappedVS[68].w)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R123i.w)) + intBitsToFloat(0x3fc90da4));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 15.0);
tempResultf = max(0.0, intBitsToFloat(PV1iy));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 5
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[69].x), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(-(intBitsToFloat(R5i.y)) + 1.0);
R10i.z = 0;
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[69].y), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 6
R13i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)),intBitsToFloat(uf_remappedVS[70].w)) + intBitsToFloat(uf_remappedVS[70].w));
R10i.y = 0;
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) + 8.5);
R10i.w = 0x3d2aaaab;
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iw)));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 7
R10i.x = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3daaaaab));
R5i.y = floatBitsToInt(intBitsToFloat(PS0i) + 0.5);
PS1i = floatBitsToInt(sqrt(intBitsToFloat(R127i.y)));
// 8
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3f22f983));
PS0i = floatBitsToInt(exp2(intBitsToFloat(R126i.x)));
// 9
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),-(intBitsToFloat(R126i.z))) + 1.0);
R5i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[69].z)),intBitsToFloat(PS0i)) + intBitsToFloat(uf_remappedVS[69].z));
R5i.z = clampFI32(R5i.z);
R7i.x = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
}
if( activeMaskStackC[3] == true ) {
R3i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y))).xyz);
R20i.xyz = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R10i.x),intBitsToFloat(R10i.z))).xyz);
R20i.w = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R10i.w),intBitsToFloat(R10i.y))).z);
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.z = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(0x80000000));
R126i.z = clampFI32(R126i.z);
PV0iw = floatBitsToInt(intBitsToFloat(R1i.x) * intBitsToFloat(R7i.x));
// 1
PV1iy = floatBitsToInt(max(intBitsToFloat(PV0iw), intBitsToFloat(0x3e4ccccd)));
R13i.z = R126i.z;
// 2
PV0iw = floatBitsToInt(min(intBitsToFloat(PV1iy), 1.0));
// 3
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PV0iw)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(PV0iw)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(PV0iw)));
R0i.w = R126i.z;
// 4
R10i.x = R9i.x;
R10i.y = R9i.y;
R10i.z = R9i.z;
R10i.w = R9i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem5 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.z));
// export
passParameterSem9 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.z));
}
