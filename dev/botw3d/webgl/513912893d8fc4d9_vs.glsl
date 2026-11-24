#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 513912893d8fc4d9
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[57];
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

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem7;
out vec4 passParameterSem8;
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
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyz = attrDataSem4.xyz;
attrDecoder.xyz = uvec3((attrDecoder.xyz>>24)|((attrDecoder.xyz>>8)&0xFF00u)|((attrDecoder.xyz<<8)&0xFF0000u)|((attrDecoder.xyz<<24)));
attrDecoder.w = uint(0);
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), 0x3f800000);
attrDecoder = attrDataSem10;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R9i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem9;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem0;
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem2;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem3;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem7;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem6;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R3i.z = floatBitsToInt(-(intBitsToFloat(R8i.y)) + 1.0);
R4i.w = 0;
R5i.w = floatBitsToInt(1.0);
// 1
R3i.w = floatBitsToInt(-(intBitsToFloat(R3i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R7i.w = floatBitsToInt(-(intBitsToFloat(R8i.x)) + 1.0);
// 2
predResult = (0.0 > intBitsToFloat(R3i.w));
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
R11i.x = 0;
// 1
R8i.w = R5i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R8i.w = R4i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R8i.w == 0);
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
R2i.x = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R3i.w) >= intBitsToFloat(R2i.x));
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
R11i.x = 0;
// 1
R4i.w = R5i.w;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R4i.w == 0);
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
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].x), intBitsToFloat(R127i.y)));
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].x), intBitsToFloat(R127i.y)));
// 2
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].x), intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R10i.x = 0;
// 1
R14i.x = R10i.x;
// 2
R12i.x = R10i.x;
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
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].y), intBitsToFloat(R127i.x)));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].y), intBitsToFloat(R127i.x)));
// 2
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R14i.y = 0;
R12i.y = 0;
// 1
R10i.y = 0;
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
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].z), intBitsToFloat(R127i.x)));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].z), intBitsToFloat(R127i.x)));
// 2
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R14i.z = 0;
R12i.z = 0;
// 1
R10i.z = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[5].x))?1.0:0.0);
PV0iy = floatBitsToInt((intBitsToFloat(uf_remappedVS[5].x) > 0.0)?1.0:0.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(uf_remappedVS[6].y)));
PV0iw = floatBitsToInt(max(intBitsToFloat(R6i.x), 0.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[5].x));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R3i.w) * intBitsToFloat(PS0i));
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].x)) + intBitsToFloat(uf_remappedVS[8].x));
PV1iz = floatBitsToInt(min(intBitsToFloat(PV0iw), 0.0));
R127i.w = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R2i.x));
// 2
R2i.x = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(PV1iz));
R2i.y = floatBitsToInt(intBitsToFloat(R3i.w) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
PV0iw = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1ix));
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].y)) + intBitsToFloat(uf_remappedVS[8].y));
// 3
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV0iz)));
R125i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].z)) + intBitsToFloat(uf_remappedVS[8].z));
PV1iz = floatBitsToInt(fract(intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].w)) + intBitsToFloat(uf_remappedVS[8].w));
// 4
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV1iz)));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].y)) + intBitsToFloat(uf_remappedVS[9].y));
R125i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].x)) + intBitsToFloat(uf_remappedVS[9].x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 5
R125i.x = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0iy));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS0i));
R127i.z = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(PS0i));
R127i.w = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(PS0i));
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].z)) + intBitsToFloat(uf_remappedVS[9].z));
// 6
R127i.x = floatBitsToInt(intBitsToFloat(R125i.x) + -(intBitsToFloat(uf_remappedVS[8].w)));
R126i.w = floatBitsToInt(intBitsToFloat(R125i.x) + -(intBitsToFloat(uf_remappedVS[7].w)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R127i.w)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R127i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R127i.y)));
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].w)) + intBitsToFloat(uf_remappedVS[9].w));
R127i.y = floatBitsToInt(intBitsToFloat(R125i.x) + -(intBitsToFloat(uf_remappedVS[9].w)));
// 8
R0i.x = ((intBitsToFloat(R126i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R124i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].z) + intBitsToFloat(PV1ix));
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].y) + intBitsToFloat(PV1iy));
R124i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].x) + intBitsToFloat(PV1iz));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS0i));
PV1iz = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(PS0i));
R125i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].x)) + intBitsToFloat(uf_remappedVS[10].x));
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].y)) + intBitsToFloat(uf_remappedVS[10].y));
// 10
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].z)) + intBitsToFloat(uf_remappedVS[10].z));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV1iz)));
PS0i = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].w)) + intBitsToFloat(uf_remappedVS[10].w));
// 11
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].x) + intBitsToFloat(PV0iw));
R125i.y = ((intBitsToFloat(backupReg0i) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].z) + intBitsToFloat(PV0iy));
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].y) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 12
backupReg0i = R126i.x;
R126i.x = ((intBitsToFloat(R127i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iy = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(intBitsToFloat(R125i.x) + -(intBitsToFloat(uf_remappedVS[10].w)));
// 13
backupReg0i = R127i.y;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iw)));
R127i.y = ((intBitsToFloat(PS0i) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
// 14
R125i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].y) + intBitsToFloat(PV1iw));
R126i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].x) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
R126i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].z) + intBitsToFloat(PV1iz));
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PS1i)));
// 15
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].x), intBitsToFloat(R127i.y)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV0iz)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].y), intBitsToFloat(R127i.y)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].z), intBitsToFloat(R127i.y)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R124i.x)));
// 16
backupReg0i = R124i.x;
backupReg1i = R126i.z;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV1iy)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(backupReg0i)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV1iy)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PV1iy)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), intBitsToFloat(backupReg0i)));
// 17
PV1ix = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
PV1iy = uf_remappedVS[11].x;
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) / 2.0);
PV1iz = uf_remappedVS[11].y;
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) / 2.0);
R127i.w = floatBitsToInt(-(intBitsToFloat(R0i.x)) + 1.0);
R4i.w = 0x3f800000;
// 18
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].x), intBitsToFloat(R127i.w)));
R0i.y = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV1iy));
R0i.z = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(PV1iz));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1ix)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].y), intBitsToFloat(R127i.w)));
// 19
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iw)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].z), intBitsToFloat(R127i.w)));
R2i.w = 0x3f800000;
// 20
R0i.x = floatBitsToInt(1.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PV1iw));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R125i.y));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R125i.x));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R10i.z)));
// 21
PV1ix = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV0iz));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R10i.x)) + intBitsToFloat(PS0i));
// 22
PV0ix = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV1iw));
PV0iy = floatBitsToInt(intBitsToFloat(R124i.x) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R12i.z)));
PV0iw = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV1iz));
R18i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R10i.y)) + intBitsToFloat(R122i.x));
// 23
PV1ix = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0iy));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R12i.y)) + intBitsToFloat(PV0iz));
// 24
backupReg0i = R7i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R14i.z)));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(PV1ix)));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1iy)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV1iz)));
R18i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R12i.x)) + intBitsToFloat(R122i.x));
// 25
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(PV0ix),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R18i.z = tempi.x;
PV1iw = tempi.x;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[12].y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(uf_remappedVS[12].w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(uf_remappedVS[12].z)));
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R0i.y)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R0i.z)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PV0iz)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].x), intBitsToFloat(uf_remappedVS[14].x)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].x), intBitsToFloat(uf_remappedVS[14].y)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(uf_remappedVS[15].x),intBitsToFloat(uf_remappedVS[15].y),intBitsToFloat(uf_remappedVS[15].z),intBitsToFloat(uf_remappedVS[15].w))));
PV0ix = tempi.x;
R13i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),intBitsToFloat(uf_remappedVS[16].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R0i.w = tempi.x;
R5i.w = PV0ix;
// 4
R5i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(PV1ix)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R125i.z),intBitsToFloat(R2i.w))));
PV0iy = R5i.x;
PV0iz = R5i.x;
PV0iw = R5i.x;
R125i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[14].w) * 1.0);
// 5
R124i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),intBitsToFloat(R12i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R125i.z),intBitsToFloat(R2i.w))));
PV1iy = R124i.x;
PV1iz = R124i.x;
PV1iw = R124i.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(uf_remappedVS[14].z)));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + intBitsToFloat(R126i.w));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(uf_remappedVS[17].x),intBitsToFloat(uf_remappedVS[17].y),intBitsToFloat(uf_remappedVS[17].z),intBitsToFloat(uf_remappedVS[17].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R0i.w = tempi.x;
R122i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3e22f983) + 0.5);
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(R14i.z),intBitsToFloat(PV1ix)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R125i.z),intBitsToFloat(R2i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R0i.z = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(fract(intBitsToFloat(R122i.x)));
// 9
R123i.x = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedVS[14].z)));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R126i.z));
// 11
R123i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
R126i.z = floatBitsToInt(cos((intBitsToFloat(PV0ix))/0.1591549367));
// 12
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
// 13
R123i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 14
PV0iw = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
// 15
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0iw))/0.1591549367));
// 16
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R126i.z)));
// 17
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R125i.w)));
// 18
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(0xbccccccd));
// 19
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].y), intBitsToFloat(PV0iz)));
// 20
R11i.y = floatBitsToInt(intBitsToFloat(R124i.x) + intBitsToFloat(PV1iw));
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R11i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.x)),vec4(intBitsToFloat(uf_remappedVS[18].x),intBitsToFloat(uf_remappedVS[18].y),intBitsToFloat(uf_remappedVS[18].z),intBitsToFloat(uf_remappedVS[18].w))));
PV0ix = tempi.x;
R3i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R11i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.x)),vec4(intBitsToFloat(uf_remappedVS[19].x),intBitsToFloat(uf_remappedVS[19].y),intBitsToFloat(uf_remappedVS[19].z),intBitsToFloat(uf_remappedVS[19].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R4i.z = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R11i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.x)),vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R15i.w = tempi.x;
// 3
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R11i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.x)),vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w))));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
R125i.x = PV0ix;
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) / 2.0);
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R11i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.x)),vec4(intBitsToFloat(uf_remappedVS[22].x),intBitsToFloat(uf_remappedVS[22].y),intBitsToFloat(uf_remappedVS[22].z),intBitsToFloat(uf_remappedVS[22].w))));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(intBitsToFloat(R15i.w) * 1.0);
// 5
R124i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R11i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.x)),vec4(intBitsToFloat(uf_remappedVS[23].x),intBitsToFloat(uf_remappedVS[23].y),intBitsToFloat(uf_remappedVS[23].z),intBitsToFloat(uf_remappedVS[23].w))));
PV1iy = R124i.x;
PV1iz = R124i.x;
PV1iw = R124i.x;
R124i.y = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R11i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.x)),vec4(intBitsToFloat(uf_remappedVS[24].x),intBitsToFloat(uf_remappedVS[24].y),intBitsToFloat(uf_remappedVS[24].z),intBitsToFloat(uf_remappedVS[24].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R125i.w = tempi.x;
// 7
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[25].y))?1.0:0.0);
PV1iy = floatBitsToInt((intBitsToFloat(uf_remappedVS[25].y) > 0.0)?1.0:0.0);
R126i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[11].z) + intBitsToFloat(R124i.x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[25].y));
// 8
R126i.y = floatBitsToInt(intBitsToFloat(R3i.w) * intBitsToFloat(PS1i));
R126i.w = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1ix)));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R125i.w)),vec4(intBitsToFloat(uf_remappedVS[26].x),intBitsToFloat(uf_remappedVS[26].y),intBitsToFloat(uf_remappedVS[26].z),intBitsToFloat(uf_remappedVS[26].w))));
PV1ix = tempi.x;
R125i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.z = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R125i.w)),vec4(intBitsToFloat(uf_remappedVS[27].x),intBitsToFloat(uf_remappedVS[27].y),intBitsToFloat(uf_remappedVS[27].z),intBitsToFloat(uf_remappedVS[27].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(uf_remappedVS[5].z)) + intBitsToFloat(R126i.y));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 12
PV0iz = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
// 13
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV0iw)));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.w), intBitsToFloat(PV0iz)));
// 14
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R125i.z)) + intBitsToFloat(PV1ix));
R123i.w = floatBitsToInt(intBitsToFloat(R10i.y) * 0.5 + intBitsToFloat(R125i.x));
// 15
PV1ix = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(R124i.y));
// 16
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(uf_remappedVS[1].w)) + -(intBitsToFloat(uf_remappedVS[1].y)));
// 17
R12i.x = uf_remappedVS[28].x;
R12i.y = uf_remappedVS[28].y;
R12i.z = uf_remappedVS[28].z;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.w));
// 18
R14i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS1i));
}
if( activeMaskStackC[3] == true ) {
// 0
R5i.x = floatBitsToInt(-(intBitsToFloat(R5i.x)) + intBitsToFloat(R12i.x));
R124i.y = uf_remappedVS[29].x;
R2i.z = floatBitsToInt(-(intBitsToFloat(R0i.z)) + intBitsToFloat(R12i.z));
R127i.w = uf_remappedVS[29].y;
R125i.z = uf_remappedVS[29].z;
// 1
R124i.x = floatBitsToInt(intBitsToFloat(R0i.x) + -(intBitsToFloat(uf_remappedVS[30].w)));
PV1iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[31].w)) + intBitsToFloat(uf_remappedVS[30].w));
PV1iz = ((intBitsToFloat(R6i.x) > 0.5)?-1:0);
R126i.w = floatBitsToInt(intBitsToFloat(R0i.x) + -(intBitsToFloat(uf_remappedVS[31].w)));
R125i.x = ((intBitsToFloat(R6i.y) > 0.5)?-1:0);
// 2
R127i.x = ((intBitsToFloat(R124i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R2i.y = ((PV1iz == 0)?(R8i.x):(R7i.w));
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[31].x)) + intBitsToFloat(uf_remappedVS[30].x));
R125i.w = ((intBitsToFloat(R126i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 3
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[30].x)) + intBitsToFloat(uf_remappedVS[32].x));
PV1iy = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
PV1iz = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(PS0i));
R2i.w = ((backupReg0i == 0)?(R8i.y):(R3i.z));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt(intBitsToFloat(R0i.x) + -(intBitsToFloat(uf_remappedVS[32].w)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PV1iw)) + intBitsToFloat(uf_remappedVS[31].x));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[31].x), intBitsToFloat(PV1iz)));
PS0i = ((intBitsToFloat(R6i.z) > 0.5)?-1:0);
// 5
R126i.x = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(PV0ix)) + intBitsToFloat(PV0iw));
R0i.z = ((PS0i == 0)?(R8i.x):(R7i.w));
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[30].w)) + intBitsToFloat(uf_remappedVS[32].w));
PS1i = ((intBitsToFloat(R6i.w) > 0.5)?-1:0);
// 6
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(uf_remappedVS[33].x)));
R0i.y = ((PS1i == 0)?(R8i.y):(R3i.z));
R127i.z = uf_remappedVS[34].x;
PV0iw = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 7
backupReg0i = R127i.w;
PV1iy = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(PS0i));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV0iw)));
R127i.w = uf_remappedVS[34].y;
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[33].y)));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(PV1iy)) + intBitsToFloat(uf_remappedVS[30].x));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(uf_remappedVS[33].z)));
// 9
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(R126i.z)) + intBitsToFloat(R125i.y));
R125i.y = uf_remappedVS[34].z;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(uf_remappedVS[35].x)));
// 10
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(uf_remappedVS[35].y)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].x),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.x));
// 11
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[36].x)));
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(uf_remappedVS[36].x)));
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(uf_remappedVS[36].x)));
R16i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(uf_remappedVS[33].w)));
// 12
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(uf_remappedVS[35].z)));
PS0i = int(intBitsToFloat(uf_remappedVS[37].z));
// 13
R126i.x = floatBitsToInt(float(PS0i));
// 14
PV0iz = floatBitsToInt((0.0 >= abs(intBitsToFloat(R126i.x)))?1.0:0.0);
PV0iw = floatBitsToInt(-(abs(intBitsToFloat(R126i.x))) + 0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 15
R125i.y = ((intBitsToFloat(PV0iz) == 0.0)?(0):(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[37].z));
// 16
PV0ix = floatBitsToInt(abs(intBitsToFloat(R126i.x)) + intBitsToFloat(R125i.y));
PV0iz = floatBitsToInt(trunc(intBitsToFloat(PV1iw)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[37].x), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[37].w));
// 17
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[37].y), intBitsToFloat(PS0i)));
R123i.w = ((-(intBitsToFloat(R125i.y)) > 0.0)?(PV0ix):(R125i.y));
R7i.y = int(intBitsToFloat(PV0iz));
// 18
R123i.z = ((intBitsToFloat(R126i.x) == 0.0)?(0):(R123i.w));
// 19
R5i.y = int(intBitsToFloat(R123i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = uf_remappedVS[38].x;
PV0iy = uf_remappedVS[39].x & 0x200000;
PV0iz = uf_remappedVS[39].x & 0x100000;
PV0iw = uf_remappedVS[39].x & 0x80000;
PS0i = uf_remappedVS[39].x & 0x400000;
// 1
PV1ix = (PV0iy == 0x200000)?-1:0;
PV1iy = (PV0iz == 0x100000)?-1:0;
PV1iz = (PV0iw == 0x80000)?-1:0;
PV1iw = (PS0i == 0x400000)?-1:0;
PS1i = uf_remappedVS[39].y & int(1);
// 2
backupReg0i = R8i.x;
R8i.x = ((PV1iw == 0)?(R8i.y):(R0i.y));
R0i.y = ((PV1ix == 0)?(backupReg0i):(R0i.z));
R0i.z = ((PV1iy == 0)?(R8i.y):(R2i.w));
R2i.w = ((PV1iz == 0)?(backupReg0i):(R2i.y));
R7i.z = (int(1) != PS1i)?-1:0;
// 3
R5i.z = floatBitsToInt(float(R5i.y));
}
if( activeMaskStackC[3] == true ) {
// 0
R17i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].x), intBitsToFloat(R1i.x)));
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].x), intBitsToFloat(R1i.y)));
R17i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].x), intBitsToFloat(R1i.z)));
R17i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[35].w)));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(uf_remappedVS[40].x)));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(uf_remappedVS[40].y)));
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) * 2.0);
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[41].w) + intBitsToFloat(uf_remappedVS[40].y));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[41].z) + intBitsToFloat(uf_remappedVS[40].x));
R127i.w = floatBitsToInt(float(R7i.y));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[42].x) + intBitsToFloat(uf_remappedVS[42].z));
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[42].y) + intBitsToFloat(uf_remappedVS[42].w));
PV0iz = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(-(intBitsToFloat(PV1iy)) + intBitsToFloat(PV1iz));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R0i.w)) + -(0.5));
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.w)),intBitsToFloat(uf_remappedVS[41].x)) + -(intBitsToFloat(PV0iz)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(uf_remappedVS[42].z)) + intBitsToFloat(PV0ix));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(uf_remappedVS[41].y)) + intBitsToFloat(PV0iw));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(uf_remappedVS[42].w)) + intBitsToFloat(PV0iy));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R4i.y)) + -(0.5));
// 4
backupReg0i = R123i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R5i.z)) + intBitsToFloat(R123i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.y)),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(uf_remappedVS[40].z)) + intBitsToFloat(backupReg0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(uf_remappedVS[40].w)) + intBitsToFloat(R123i.w));
R122i.x = ((R7i.z == 0)?(0):(int(1)));
// 5
backupReg0i = R125i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.x));
R125i.y = (R122i.x == int(1))?-1:0;
PV1iz = (R122i.x == 0x2)?-1:0;
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(backupReg0i)) + -(intBitsToFloat(R123i.y)));
PS1i = int(intBitsToFloat(uf_remappedVS[43].z));
// 6
R125i.x = ((R125i.y == 0)?(R6i.x):(R6i.y));
R124i.y = ((R125i.y == 0)?(R6i.y):(R6i.z));
R123i.z = ((PV1iz == 0)?(R6i.y):(R6i.x));
R123i.w = ((PV1iz == 0)?(R6i.x):(R6i.z));
R124i.x = floatBitsToInt(float(PS1i));
// 7
R123i.x = ((R125i.y == 0)?(R123i.z):(R6i.z));
R123i.y = ((R125i.y == 0)?(R123i.w):(R6i.y));
PV1iz = floatBitsToInt((0.0 >= abs(intBitsToFloat(R124i.x)))?1.0:0.0);
PV1iw = floatBitsToInt(-(abs(intBitsToFloat(R124i.x))) + 0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R124i.x));
// 8
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[44].x), intBitsToFloat(R123i.y)));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
R125i.y = ((intBitsToFloat(PV1iz) == 0.0)?(0):(PV1iw));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[44].y), intBitsToFloat(R123i.x)));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 2.0);
PV0iw = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[43].z));
// 9
PV1ix = floatBitsToInt(abs(intBitsToFloat(R124i.x)) + intBitsToFloat(R125i.y));
R1i.y = floatBitsToInt(fract(intBitsToFloat(R1i.w)));
PV1iz = floatBitsToInt(trunc(intBitsToFloat(PV0iw)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[43].x), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[43].w));
// 10
backupReg0i = R125i.y;
R0i.x = floatBitsToInt(intBitsToFloat(R126i.x) + 0.5);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[43].y), intBitsToFloat(PS1i)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R127i.w)) + -(0.5));
R123i.w = ((-(intBitsToFloat(backupReg0i)) > 0.0)?(PV1ix):(backupReg0i));
PS0i = int(intBitsToFloat(PV1iz));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[45].w) + intBitsToFloat(uf_remappedVS[44].y));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R125i.y)) + -(0.5));
R123i.z = ((intBitsToFloat(R124i.x) == 0.0)?(0):(R123i.w));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[45].z) + intBitsToFloat(uf_remappedVS[44].x));
R126i.w = floatBitsToInt(float(PS0i));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[46].x) + intBitsToFloat(uf_remappedVS[46].z));
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[46].y) + intBitsToFloat(uf_remappedVS[46].w));
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(-(intBitsToFloat(R127i.z)) + intBitsToFloat(PV1ix));
PS0i = int(intBitsToFloat(R123i.z));
// 13
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.w)),intBitsToFloat(uf_remappedVS[45].x)) + -(intBitsToFloat(PV0iz)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[46].z),intBitsToFloat(R125i.x)) + intBitsToFloat(PV0ix));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(uf_remappedVS[45].y)) + intBitsToFloat(PV0iw));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[46].w),intBitsToFloat(R124i.y)) + intBitsToFloat(PV0iy));
PS1i = floatBitsToInt(float(PS0i));
// 14
backupReg0i = R123i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PS1i)) + intBitsToFloat(R123i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)),intBitsToFloat(R126i.w)) + intBitsToFloat(R123i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(uf_remappedVS[44].z)) + intBitsToFloat(backupReg0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(uf_remappedVS[44].w)) + intBitsToFloat(R123i.w));
R125i.x = floatBitsToInt(intBitsToFloat(R3i.w) * 100.0);
R125i.x = clampFI32(R125i.x);
// 15
backupReg0i = R123i.z;
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R125i.x)));
R0i.y = floatBitsToInt(intBitsToFloat(R125i.w) + 0.5);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R126i.y)) + -(intBitsToFloat(R123i.y)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R126i.z)) + intBitsToFloat(R123i.x));
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R125i.x)));
// 16
R126i.y = floatBitsToInt(-(intBitsToFloat(R11i.y)) + intBitsToFloat(R12i.y));
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(R125i.x)));
R0i.w = floatBitsToInt(intBitsToFloat(R123i.z) + 0.5);
R0i.z = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R126i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R5i.x),intBitsToFloat(R126i.y),intBitsToFloat(R2i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 18
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 19
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PS0i)));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS0i)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PS0i)));
R8i.x = uf_remappedVS[12].x;
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R10i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[47].x),intBitsToFloat(uf_remappedVS[47].y),intBitsToFloat(uf_remappedVS[47].z),0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(intBitsToFloat(uf_remappedVS[47].y) + 1.0);
// 1
R125i.x = floatBitsToInt(intBitsToFloat(PS0i) * 1.5);
R125i.x = clampFI32(R125i.x);
R11i.y = uf_remappedVS[48].x;
R126i.z = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
PV1iw = floatBitsToInt(min(intBitsToFloat(R12i.y), intBitsToFloat(uf_remappedVS[49].z)));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y),intBitsToFloat(uf_remappedVS[50].x)) + -(intBitsToFloat(uf_remappedVS[50].y)));
R123i.x = clampFI32(R123i.x);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y),intBitsToFloat(uf_remappedVS[51].x)) + -(intBitsToFloat(uf_remappedVS[51].y)));
R123i.y = clampFI32(R123i.y);
PV0iz = floatBitsToInt(-(intBitsToFloat(R13i.y)) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R122i.x = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
// 3
R127i.x = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[49].y),intBitsToFloat(PV0iz)) + intBitsToFloat(uf_remappedVS[49].x));
R13i.y = clampFI32(R13i.y);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R122i.x)) + intBitsToFloat(0xbe593484));
PV1iw = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0iw)));
// 4
backupReg0i = R126i.z;
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3f22f983));
R126i.y = floatBitsToInt(intBitsToFloat(R125i.x) * 15.0);
R126i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[47].y) * 1.0 + intBitsToFloat(R14i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R123i.z)) + intBitsToFloat(0x3fc90da4));
tempResultf = max(0.0, intBitsToFloat(PV1iw));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 5
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),-(intBitsToFloat(R123i.w))) + 1.0);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[50].w), intBitsToFloat(PS0i)));
tempResultf = max(0.0, intBitsToFloat(R127i.x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 6
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[52].x), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[52].y), intBitsToFloat(PS1i)));
R6i.w = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 7
R11i.x = floatBitsToInt(intBitsToFloat(R8i.x) * 1.0 + 0.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 8
R14i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
PS0i = floatBitsToInt(exp2(intBitsToFloat(R127i.x)));
// 9
R12i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[52].z)),intBitsToFloat(PS0i)) + intBitsToFloat(uf_remappedVS[52].z));
R12i.y = clampFI32(R12i.y);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.y));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS1i));
// 11
PV1iz = floatBitsToInt(max(intBitsToFloat(PV0ix), intBitsToFloat(0x3e4ccccd)));
// 12
R1i.w = floatBitsToInt(min(intBitsToFloat(PV1iz), 1.0));
}
if( activeMaskStackC[3] == true ) {
R14i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y))).xyz);
}
if( activeMaskStackC[3] == true ) {
// 0
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.x), intBitsToFloat(R1i.w)));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y), intBitsToFloat(uf_remappedVS[53].w)));
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.z), intBitsToFloat(R1i.w)));
R13i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[54].z)));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y), intBitsToFloat(R1i.w)));
// 1
R13i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.w)),intBitsToFloat(uf_remappedVS[55].w)) + intBitsToFloat(uf_remappedVS[55].w));
PV1iy = floatBitsToInt(-(intBitsToFloat(R13i.w)) + intBitsToFloat(R12i.y));
PV1iy = clampFI32(PV1iy);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.y), intBitsToFloat(uf_remappedVS[56].x)));
R6i.w = 0;
// 2
R123i.x = floatBitsToInt(intBitsToFloat(PV1iz) * 0.25 + 0.5);
R123i.x = clampFI32(R123i.x);
R13i.z = PV1iy;
R14i.w = PV1iy;
// 3
PV1iw = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
// 4
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + 8.5);
// 5
R6i.x = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3daaaaab));
}
if( activeMaskStackC[3] == true ) {
R10i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R6i.x),intBitsToFloat(R6i.w))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
R12i.x = R9i.x;
R12i.y = R9i.y;
R12i.z = R9i.z;
R12i.w = R9i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.z));
}
