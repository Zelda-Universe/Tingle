#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 5bb80d80c4a3f413
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[64];
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

out vec4 passParameterSem0;
out vec4 passParameterSem3;
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
attrDecoder = attrDataSem5;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem3;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem4;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem7;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem6;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
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
R10i.y = floatBitsToInt(-(intBitsToFloat(R5i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R1i.w = 0;
R2i.w = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R10i.y));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R11i.x = 0;
R11i.y = 0;
R11i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R12i.x = 0;
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
R7i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R10i.y) >= intBitsToFloat(R7i.z));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R11i.x = 0;
R11i.y = 0;
R11i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R12i.x = 0;
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
R127i.x = R1i.y;
R0i.y = R2i.x;
R0i.z = R3i.x;
R127i.w = R2i.y;
R127i.z = R3i.y;
// 1
R126i.x = R1i.z;
R127i.y = R2i.z;
R126i.z = R3i.z;
R14i.x = int(intBitsToFloat(R6i.w));
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
R0i.z = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R8i.z = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 5
R9i.z = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 6
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
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R0i.z));
// 1
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R127i.y)));
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R127i.y)));
// 2
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R9i.x = 0;
// 1
R13i.x = R9i.x;
// 2
R11i.x = R9i.x;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (intBitsToFloat(R8i.z) > 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R8i.z));
// 1
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R127i.x)));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R127i.x)));
// 2
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R13i.y = 0;
R11i.y = 0;
// 1
R9i.y = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (intBitsToFloat(R9i.z) > 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R9i.z));
// 1
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R127i.x)));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R127i.x)));
// 2
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R13i.z = 0;
R11i.z = 0;
// 1
R9i.z = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R10i.y) + intBitsToFloat(uf_remappedVS[2].z));
R127i.y = floatBitsToInt(intBitsToFloat(R10i.y) + intBitsToFloat(uf_remappedVS[2].w));
PV0iw = floatBitsToInt(max(intBitsToFloat(R7i.x), 0.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[3].z));
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(uf_remappedVS[2].y)));
R124i.y = floatBitsToInt(min(intBitsToFloat(PV0iw), 0.0));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(uf_remappedVS[2].x)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[3].w));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS1i));
PV0iy = uf_remappedVS[4].x & int(1);
PV0iz = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PV1iw));
R127i.w = uf_remappedVS[4].x & 0x2;
R126i.w = uf_remappedVS[4].x & 0x4;
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb));
R125i.y = floatBitsToInt(fract(intBitsToFloat(PV0iz)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(uf_remappedVS[5].y)));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0ix));
R125i.w = floatBitsToInt(float(PV0iy));
// 4
backupReg0i = R127i.w;
R123i.x = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fdb));
R125i.z = floatBitsToInt(fract(intBitsToFloat(PV1iw)));
R127i.w = floatBitsToInt((intBitsToFloat(R125i.w) > 0.0)?1.0:0.0);
R127i.y = floatBitsToInt(float(backupReg0i));
// 5
backupReg0i = R127i.y;
R127i.x = floatBitsToInt((0.0 > intBitsToFloat(R125i.w))?1.0:0.0);
R126i.y = floatBitsToInt((intBitsToFloat(backupReg0i) > 0.0)?1.0:0.0);
R123i.z = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iw = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
PS1i = floatBitsToInt(float(R126i.w));
// 6
backupReg0i = R127i.y;
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
R127i.y = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(backupReg0i))?1.0:0.0);
R126i.w = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R127i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R125i.z) + -(0.5));
PV1iy = floatBitsToInt(intBitsToFloat(R125i.y) + -(0.5));
R126i.z = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(R127i.x)));
R123i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.w = floatBitsToInt(intBitsToFloat(R126i.y) + -(intBitsToFloat(PV0iz)));
// 8
R127i.x = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0x3e22f983));
R123i.y = ((intBitsToFloat(PV1iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.z = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R126i.w = floatBitsToInt(intBitsToFloat(R127i.y) + -(intBitsToFloat(R126i.w)));
R122i.x = ((intBitsToFloat(PV1ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 9
backupReg0i = R126i.z;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].x), intBitsToFloat(R125i.y)));
PV1iy = floatBitsToInt(-(intBitsToFloat(R122i.x)) + 1.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].y), intBitsToFloat(R125i.z)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R125i.w = int(intBitsToFloat(backupReg0i));
// 10
backupReg0i = R127i.w;
R126i.x = floatBitsToInt(-(intBitsToFloat(PV1ix)) + 1.0);
PV0iy = 0 - R125i.w;
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].x), intBitsToFloat(PV1iw)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].y), intBitsToFloat(PV1iy)));
R125i.y = int(intBitsToFloat(backupReg0i));
// 11
backupReg0i = R126i.z;
backupReg1i = R126i.w;
PV1ix = 0 - R125i.y;
R127i.y = floatBitsToInt(-(intBitsToFloat(PV0iz)) + 1.0);
R126i.z = max(R125i.w, PV0iy);
R126i.w = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
R125i.x = int(intBitsToFloat(backupReg1i));
// 12
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
PV0iy = 0 - R125i.x;
R125i.z = max(R125i.y, PV1ix);
R127i.w = floatBitsToInt(max(intBitsToFloat(R126i.x), -(intBitsToFloat(R126i.x))));
PS0i = floatBitsToInt(cos((intBitsToFloat(backupReg0i))/0.1591549367));
// 13
backupReg0i = R127i.y;
backupReg1i = R127i.z;
R125i.x = max(R125i.x, PV0iy);
R127i.y = floatBitsToInt(max(intBitsToFloat(R126i.w), -(intBitsToFloat(R126i.w))));
R127i.z = floatBitsToInt(max(intBitsToFloat(backupReg0i), -(intBitsToFloat(backupReg0i))));
PV1iw = floatBitsToInt(intBitsToFloat(PS0i) + 1.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) / 2.0);
PS1i = floatBitsToInt(cos((intBitsToFloat(backupReg1i))/0.1591549367));
// 14
R0i.x = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(R124i.y));
R125i.y = floatBitsToInt(max(intBitsToFloat(R127i.x), -(intBitsToFloat(R127i.x))));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].x), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(intBitsToFloat(PS1i) + 1.0);
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
R126i.x = floatBitsToInt(float(R126i.z));
// 15
R127i.x = floatBitsToInt(-(intBitsToFloat(PV0iz)) + 1.0);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].y), intBitsToFloat(PV0iw)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[5].x)));
R124i.y = floatBitsToInt(float(R125i.z));
// 16
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(-(intBitsToFloat(PV1iy)) + 1.0);
R0i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].x)) + 1.0);
R0i.w = ((intBitsToFloat(uf_remappedVS[6].x) == 1.0)?-1:0);
R125i.z = floatBitsToInt(float(backupReg0i));
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R124i.y),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.w),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R12i.x = 0;
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R124i.y),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R125i.y),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R126i.z)));
// 19
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R124i.z)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[7].y)));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[7].z)));
// 1
R0i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(R10i.y));
// 2
predResult = (R0i.w != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R0i.z)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].w), intBitsToFloat(PV0ix)));
// 2
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x), intBitsToFloat(PV1iw)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].y), intBitsToFloat(PV1iw)));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].z), intBitsToFloat(PV1iw)));
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
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PS1i)));
R127i.y = ((intBitsToFloat(uf_remappedVS[6].x) == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R0i.y));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R0i.z) + -(intBitsToFloat(PV1iz)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].w), intBitsToFloat(PV1ix)));
// 9
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x), intBitsToFloat(PV0iw)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].y), intBitsToFloat(PV0iw)));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].z), intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(R8i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(R8i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(R8i.y)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(R8i.x)));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[6].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), intBitsToFloat(R8i.y)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(R8i.x)));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PS0i)));
R126i.x = floatBitsToInt(1.0 / intBitsToFloat(R0i.y));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(R127i.w));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y), intBitsToFloat(R8i.z)));
R126i.z = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.x), intBitsToFloat(R8i.z)));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iw)));
// 3
backupReg0i = R127i.z;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.z), intBitsToFloat(R8i.z)));
PV1iy = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R127i.z = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PV0ix));
R127i.w = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(backupReg0i));
// 4
R127i.y = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R126i.z));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(R126i.x));
// 5
R123i.z = ((R0i.w == 0)?(PV0iw):(R0i.z));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R123i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R123i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R123i.z)));
// 7
R10i.x = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0iy));
R14i.y = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0ix));
R0i.z = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV0iw));
// 8
predResult = (R0i.w != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(R10i.y)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].w), intBitsToFloat(PV0ix)));
// 2
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x), intBitsToFloat(PV1iw)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].y), intBitsToFloat(PV1iw)));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].z), intBitsToFloat(PV1iw)));
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
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(PS1i)));
R127i.y = ((intBitsToFloat(uf_remappedVS[6].x) == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R0i.y));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R10i.y) + -(intBitsToFloat(PV1iz)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].w), intBitsToFloat(PV1ix)));
// 9
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x), intBitsToFloat(PV0iw)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].y), intBitsToFloat(PV0iw)));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].z), intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),0.0)));
PV0iy = R127i.x;
PV0iz = R127i.x;
PV0iw = R127i.x;
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[6].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(R8i.y)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), intBitsToFloat(R8i.y)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(R8i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(PS0i)));
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(R0i.y));
// 2
R126i.x = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PV1iz));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(R8i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(R8i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(R8i.x)));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iw)));
// 3
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV0iw));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.x), intBitsToFloat(R8i.z)));
PV1iz = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R127i.w = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0iy));
tempResultf = 1.0 / sqrt(intBitsToFloat(backupReg0i));
R127i.z = floatBitsToInt(tempResultf);
// 4
backupReg0i = R126i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y), intBitsToFloat(R8i.z)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R127i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.z), intBitsToFloat(R8i.z)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(backupReg0i));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R127i.z)));
// 5
backupReg0i = R127i.y;
R123i.x = ((R0i.w == 0)?(PV0iw):(R10i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R127i.z)));
R127i.z = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R127i.w));
R127i.w = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(R126i.x));
R126i.z = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(R127i.x));
// 6
R127i.x = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(0x3a83126f));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R123i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R123i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R123i.x)));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0x3a83126f));
// 7
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0iz));
R127i.y = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV0iw));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3a83126f));
R127i.w = ((intBitsToFloat(0x3a83126f) > intBitsToFloat(R10i.y))?-1:0);
// 8
PV0ix = floatBitsToInt(intBitsToFloat(R10i.x) + -(intBitsToFloat(R127i.x)));
PV0iy = floatBitsToInt(intBitsToFloat(R0i.z) + -(intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(intBitsToFloat(R14i.y) + -(intBitsToFloat(R126i.y)));
PV0iw = uf_remappedVS[9].y;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
R126i.y = uf_remappedVS[9].x;
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) / 2.0);
// 9
R123i.x = ((R127i.w == 0)?(R127i.z):(PV0iz));
PV1iy = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(PV0iw));
R123i.z = ((R127i.w == 0)?(R127i.y):(PV0iy));
R123i.w = ((R127i.w == 0)?(R126i.x):(PV0ix));
R5i.w = floatBitsToInt(intBitsToFloat(R6i.z) * 1.0);
// 10
backupReg0i = R126i.y;
R126i.x = floatBitsToInt(intBitsToFloat(R10i.x) + -(intBitsToFloat(R123i.w)));
R126i.y = floatBitsToInt(intBitsToFloat(R14i.y) + -(intBitsToFloat(R123i.x)));
R127i.z = floatBitsToInt(intBitsToFloat(R0i.z) + -(intBitsToFloat(R123i.z)));
R125i.w = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(backupReg0i));
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(PV1iy)));
// 11
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R9i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),0.0)));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(R10i.x)));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
R125i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(R14i.y)));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R126i.z = tempi.x;
PV1iw = tempi.x;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(R0i.z)));
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(PV1ix),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(PV1ix),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R8i.x = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(R127i.y));
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R9i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R10i.x),intBitsToFloat(R14i.y),intBitsToFloat(R0i.z),0.0)));
PV1ix = tempi.x;
R127i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 16
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(R126i.w));
R8i.y = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(R127i.w));
R127i.z = ((intBitsToFloat(0x3a83126f) > intBitsToFloat(PS1i))?-1:0);
R8i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R125i.w)));
R4i.w = 0x3f800000;
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R10i.x),intBitsToFloat(R14i.y),intBitsToFloat(R0i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R9i.x = ((R127i.z == 0)?(R127i.x):(R127i.y));
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R10i.x),intBitsToFloat(R14i.y),intBitsToFloat(R0i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R5i.y = ((R127i.z == 0)?(R125i.y):(PV1ix));
// 19
R4i.x = (R14i.x == int(1))?-1:0;
R4i.y = (R14i.x == 0x2)?-1:0;
R4i.z = ((R127i.z == 0)?(R126i.z):(PV0ix));
R0i.w = uf_remappedVS[10].w;
R1i.w = uf_remappedVS[11].w;
// 20
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R5i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R9i.x),intBitsToFloat(R5i.y),intBitsToFloat(R4i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R2i.w = uf_remappedVS[12].w;
// 21
R13i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R0i.x),intBitsToFloat(R4i.w))));
PV1iy = R13i.x;
PV1iz = R13i.x;
PV1iw = R13i.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
R1i.y = floatBitsToInt(tempResultf);
}
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R1i.y;
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(backupReg0i)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(backupReg0i)));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(backupReg0i)));
R127i.w = ((R4i.x == 0)?(0x3f800000):(0xbf800000));
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[0].w));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[13].z)), intBitsToFloat(R10i.x)));
PV1iy = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[13].x)), intBitsToFloat(R1i.y)));
R126i.z = ((R4i.x == 0)?(0xbf800000):(0xbf800000));
PV1iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[13].y)), intBitsToFloat(R6i.z)));
R11i.x = floatBitsToInt(intBitsToFloat(R9i.x) * intBitsToFloat(R126i.w));
// 2
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.y)),-(intBitsToFloat(uf_remappedVS[13].z))) + intBitsToFloat(PV1iw));
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.z)),-(intBitsToFloat(uf_remappedVS[13].x))) + intBitsToFloat(PV1ix));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R10i.x)),-(intBitsToFloat(uf_remappedVS[13].y))) + intBitsToFloat(PV1iy));
R127i.w = ((R4i.y == 0)?(R127i.w):(0xbf800000));
R9i.y = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(R126i.w));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R8i.z = floatBitsToInt(intBitsToFloat(R4i.z) * intBitsToFloat(R126i.w));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R0i.x),intBitsToFloat(R4i.w))));
PV0ix = tempi.x;
R2i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 5
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
PV1iy = (R14i.x == 0x3)?-1:0;
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PS0i)));
R122i.x = ((R4i.y == 0)?(R126i.z):(0x3f800000));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(R5i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R0i.w)));
R2i.z = ((PV1iy == 0)?(R127i.w):(0x3f800000));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R1i.x)));
R2i.x = ((PV1iy == 0)?(R122i.x):(0x3f800000));
// 7
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R10i.x)),intBitsToFloat(R0i.w)) + intBitsToFloat(PV0iw));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.z)),intBitsToFloat(R1i.x)) + intBitsToFloat(PV0ix));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.y)),intBitsToFloat(R5i.z)) + intBitsToFloat(PV0iy));
// 8
R4i.x = floatBitsToInt(intBitsToFloat(R123i.z) * 1.0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(R127i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(R123i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(R123i.z)));
R1i.z = floatBitsToInt(intBitsToFloat(R123i.y) * 1.0);
// 9
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R10i.x)) + intBitsToFloat(PV0iw));
R4i.y = floatBitsToInt(intBitsToFloat(backupReg0i) * 1.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R6i.z)) + intBitsToFloat(PV0iy));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R1i.y)) + intBitsToFloat(PV0iz));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R0i.x),intBitsToFloat(R4i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R3i.z = tempi.x;
PV0iw = tempi.x;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),intBitsToFloat(R5i.z)) + intBitsToFloat(R123i.z));
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),intBitsToFloat(R0i.w)) + intBitsToFloat(R127i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),intBitsToFloat(R1i.x)) + intBitsToFloat(R127i.x));
// 12
R0i.x = floatBitsToInt(intBitsToFloat(R13i.x) + intBitsToFloat(R123i.y));
R0i.y = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(R123i.x));
R0i.z = floatBitsToInt(intBitsToFloat(R3i.z) + intBitsToFloat(R126i.w));
// 13
R3i.x = floatBitsToInt(-(intBitsToFloat(R13i.x)) + intBitsToFloat(R0i.x));
R3i.y = floatBitsToInt(-(intBitsToFloat(R2i.y)) + intBitsToFloat(R0i.y));
R9i.z = floatBitsToInt(-(intBitsToFloat(R3i.z)) + intBitsToFloat(R0i.z));
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R9i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R9i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R5i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R9i.x),intBitsToFloat(R5i.y),intBitsToFloat(R4i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 16
R127i.x = ((intBitsToFloat(PS1i) > 0.0)?-1:0);
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 17
PV1iy = ((intBitsToFloat(PS0i) > 0.0)?-1:0);
// 18
R5i.x = ((R127i.x == 0)?(0):(PV1iy));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(uf_remappedVS[14].x)) + 0.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(uf_remappedVS[14].x)) + 0.0);
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R1i.y)) + intBitsToFloat(R1i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R6i.z)) + intBitsToFloat(R4i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R10i.x)) + intBitsToFloat(R4i.x));
// 2
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R1i.x)) + intBitsToFloat(R123i.w));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R0i.w)) + intBitsToFloat(R123i.x));
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R5i.z)) + intBitsToFloat(R123i.y));
// 3
predResult = (R5i.x != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R9i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R9i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(uf_remappedVS[15].x)));
// 1
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(uf_remappedVS[15].x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(uf_remappedVS[15].x)));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(PS1i)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R1i.y),intBitsToFloat(R6i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.z)));
// 5
R0i.x = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV0iy));
R0i.y = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(PV0ix));
R0i.z = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV0iw));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R13i.x) + -(intBitsToFloat(uf_remappedVS[16].x)));
PV0iy = floatBitsToInt(intBitsToFloat(R2i.y) + -(intBitsToFloat(uf_remappedVS[16].y)));
PV0iz = floatBitsToInt(intBitsToFloat(R3i.z) + -(intBitsToFloat(uf_remappedVS[16].z)));
R126i.w = floatBitsToInt(-(intBitsToFloat(R13i.x)) + intBitsToFloat(R0i.x));
R127i.z = floatBitsToInt(-(intBitsToFloat(R2i.y)) + intBitsToFloat(R0i.y));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[17].x));
// 2
R127i.x = floatBitsToInt(-(intBitsToFloat(R3i.z)) + intBitsToFloat(R0i.z));
PV0iy = ((intBitsToFloat(R7i.y) > 0.5)?-1:0);
PV0iz = ((intBitsToFloat(R7i.x) > 0.5)?-1:0);
R0i.w = 0x3f800000;
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 3
R1i.x = floatBitsToInt(((PV0iz == 0)?(intBitsToFloat(R6i.x)):(-(intBitsToFloat(R6i.x)))));
PV1iy = floatBitsToInt(min(intBitsToFloat(PS0i), intBitsToFloat(uf_remappedVS[17].x)));
R0i.z = floatBitsToInt(((PV0iy == 0)?(intBitsToFloat(R6i.y)):(-(intBitsToFloat(R6i.y)))));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R7i.z));
// 4
R0i.x = floatBitsToInt(intBitsToFloat(R10i.y) * intBitsToFloat(PS1i));
R0i.y = floatBitsToInt(intBitsToFloat(R12i.y) + 1.0);
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(R127i.w));
R12i.y = uf_remappedVS[18].x;
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iz)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV0iz)));
R3i.x = floatBitsToInt(intBitsToFloat(R12i.x) + intBitsToFloat(R13i.x));
// 6
R2i.x = floatBitsToInt(intBitsToFloat(R13i.x) + intBitsToFloat(PV1ix));
R1i.y = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(PV1iy));
R2i.z = floatBitsToInt(intBitsToFloat(R3i.z) + intBitsToFloat(PV1iw));
R3i.y = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(R2i.y));
// 7
R11i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R1i.y),intBitsToFloat(R2i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[19].x),intBitsToFloat(uf_remappedVS[19].y),intBitsToFloat(uf_remappedVS[19].z),intBitsToFloat(uf_remappedVS[19].w))));
PV1iy = R11i.x;
PV1iz = R11i.x;
PV1iw = R11i.x;
R3i.z = floatBitsToInt(intBitsToFloat(R12i.x) + intBitsToFloat(R3i.z));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R1i.y),intBitsToFloat(R2i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w))));
PV0ix = tempi.x;
R11i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R1i.y),intBitsToFloat(R2i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R11i.z = tempi.x;
PV1iw = tempi.x;
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R1i.y),intBitsToFloat(R2i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[22].x),intBitsToFloat(uf_remappedVS[22].y),intBitsToFloat(uf_remappedVS[22].z),intBitsToFloat(uf_remappedVS[22].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R11i.w = tempi.x;
// 11
PV1iz = PV0ix;
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) / 2.0);
// 12
R123i.x = floatBitsToInt(intBitsToFloat(R11i.z) * 0.0 + intBitsToFloat(PV1iz));
R13i.z = floatBitsToInt(intBitsToFloat(R11i.z) * 0.5 + intBitsToFloat(PV1iz));
R13i.w = floatBitsToInt(intBitsToFloat(R11i.z) * 0.0 + intBitsToFloat(R11i.w));
// 13
R13i.x = floatBitsToInt(intBitsToFloat(R11i.x) * 0.5 + intBitsToFloat(R123i.x));
R13i.y = floatBitsToInt(intBitsToFloat(R11i.y) * -(0.5) + intBitsToFloat(R123i.x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R13i.w));
// 14
PV0iy = floatBitsToInt(intBitsToFloat(R13i.z) * intBitsToFloat(PS1i));
// 15
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(uf_remappedVS[1].w)) + -(intBitsToFloat(uf_remappedVS[1].y)));
// 16
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R123i.z));
// 17
R5i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS0i));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt((intBitsToFloat(uf_remappedVS[23].y) > 0.0)?1.0:0.0);
PV0iy = uf_remappedVS[4].x & 0x80000;
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[23].y))?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[23].y));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R10i.y) * intBitsToFloat(PS0i));
R125i.y = (PV0iy == 0x80000)?-1:0;
R127i.z = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
R126i.w = uf_remappedVS[4].x & 0x100000;
PS1i = int(intBitsToFloat(uf_remappedVS[24].z));
// 2
R127i.x = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(uf_remappedVS[25].x)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(uf_remappedVS[25].y)));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) * 2.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(uf_remappedVS[26].z)) + intBitsToFloat(PV1ix));
R126i.y = floatBitsToInt(float(PS1i));
// 3
PV1ix = floatBitsToInt(-(abs(intBitsToFloat(R126i.y))) + 0.0);
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[27].z) + intBitsToFloat(uf_remappedVS[25].x));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV1iw = floatBitsToInt((0.0 >= abs(intBitsToFloat(R126i.y)))?1.0:0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.y));
// 4
R126i.x = ((intBitsToFloat(PV1iw) == 0.0)?(0):(PV1ix));
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV1iz)));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[27].w) + intBitsToFloat(uf_remappedVS[25].y));
R127i.w = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(PV1iy));
// 5
PV1ix = floatBitsToInt(abs(intBitsToFloat(R126i.y)) + intBitsToFloat(R126i.x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R127i.x)) + intBitsToFloat(PV0iz));
R126i.z = floatBitsToInt(-(intBitsToFloat(R126i.z)) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(trunc(intBitsToFloat(PV0iy)));
PS1i = (R126i.w == 0x100000)?-1:0;
// 6
R123i.x = ((-(intBitsToFloat(R126i.x)) > 0.0)?(PV1ix):(R126i.x));
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[28].y) + intBitsToFloat(uf_remappedVS[28].w));
R0i.z = ((PS1i == 0)?(R6i.y):(R0i.z));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[28].x) + intBitsToFloat(uf_remappedVS[28].z));
R127i.z = int(intBitsToFloat(PV1iw));
// 7
backupReg0i = R126i.y;
R125i.x = ((R125i.y == 0)?(R6i.x):(R1i.x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(uf_remappedVS[28].w)) + intBitsToFloat(PV0iy));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(uf_remappedVS[28].z)) + intBitsToFloat(PV0iw));
R123i.w = ((intBitsToFloat(backupReg0i) == 0.0)?(0):(R123i.x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[24].z));
// 8
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[24].x), intBitsToFloat(PS1i)));
R125i.y = floatBitsToInt(intBitsToFloat(R125i.x) + 0.5);
R125i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R10i.y)),intBitsToFloat(uf_remappedVS[27].x)) + -(intBitsToFloat(R127i.w)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(uf_remappedVS[27].y)) + intBitsToFloat(R126i.z));
R126i.z = int(intBitsToFloat(R123i.w));
// 9
R127i.x = floatBitsToInt(intBitsToFloat(R0i.z) + -(0.5));
R6i.z = uf_remappedVS[29].y;
R6i.w = uf_remappedVS[29].x;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[24].w));
// 10
backupReg0i = R126i.z;
R6i.y = uf_remappedVS[29].z;
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[24].y), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(float(backupReg0i));
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(uf_remappedVS[25].z)) + intBitsToFloat(R124i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PS0i)) + intBitsToFloat(R125i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(uf_remappedVS[25].w)) + intBitsToFloat(R126i.y));
PS1i = floatBitsToInt(float(R127i.z));
// 12
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R125i.y)) + intBitsToFloat(R123i.y));
R125i.y = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.z)),intBitsToFloat(PS1i)) + intBitsToFloat(R127i.w));
PV0iw = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
// 13
R17i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.x)),intBitsToFloat(PV0iw)) + intBitsToFloat(R123i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.z)),intBitsToFloat(R127i.x)) + -(intBitsToFloat(R123i.z)));
// 14
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R125i.y)) + intBitsToFloat(R123i.w));
R17i.z = 0;
}
if( activeMaskStackC[3] == true ) {
// 0
R125i.x = floatBitsToInt(intBitsToFloat(R0i.y) + -(intBitsToFloat(uf_remappedVS[30].w)));
R126i.y = floatBitsToInt(intBitsToFloat(R0i.y) + -(intBitsToFloat(uf_remappedVS[31].w)));
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[30].w)) + intBitsToFloat(uf_remappedVS[31].w));
// 1
R127i.x = ((intBitsToFloat(R125i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.y = ((intBitsToFloat(R126i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[30].x)) + intBitsToFloat(uf_remappedVS[31].x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[31].w)) + intBitsToFloat(uf_remappedVS[32].w));
R125i.y = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(intBitsToFloat(R0i.y) + -(intBitsToFloat(uf_remappedVS[32].w)));
PV0iw = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
R126i.x = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
// 3
backupReg0i = R127i.x;
R127i.x = ((intBitsToFloat(PV0iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[31].x)) + intBitsToFloat(uf_remappedVS[32].x));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iw)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 4
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[30].x), intBitsToFloat(R126i.x)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(PS1i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R125i.y)) + intBitsToFloat(uf_remappedVS[30].x));
PS0i = ((intBitsToFloat(R5i.y) > intBitsToFloat(uf_remappedVS[33].x))?-1:0);
// 5
PV1ix = ((intBitsToFloat(R5i.y) > intBitsToFloat(uf_remappedVS[33].y))?-1:0);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(PV0iz)) + intBitsToFloat(uf_remappedVS[31].x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R126i.z)) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV0ix)));
PS1i = PS0i & int(1);
// 6
R126i.x = PS1i - PV1ix;
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(PV1iw)) + intBitsToFloat(R123i.z));
R0i.z = uf_remappedVS[34].x;
R1i.w = uf_remappedVS[34].y;
R1i.z = uf_remappedVS[34].z;
// 7
PV1iy = ((intBitsToFloat(R5i.y) > intBitsToFloat(uf_remappedVS[33].z))?-1:0);
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].x),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.y));
// 8
PV0ix = R126i.x - PV1iy;
R0i.y = uf_remappedVS[35].x;
// 9
R2i.w = floatBitsToInt(float(PV0ix));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
backupReg0i = R6i.y;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(uf_remappedVS[36].x)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(uf_remappedVS[36].y)));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[36].z)));
R14i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[36].w)));
// 1
backupReg0i = R0i.y;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[37].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(uf_remappedVS[37].y)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(uf_remappedVS[37].z)));
R15i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[37].w)));
// 2
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[38].x)));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(uf_remappedVS[38].x)));
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(uf_remappedVS[38].x)));
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].x), intBitsToFloat(R1i.x)));
// 3
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].x), intBitsToFloat(R0i.y)));
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].x), intBitsToFloat(R0i.z)));
// 4
predResult = (intBitsToFloat(R2i.w) == 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R3i.y = R3i.y;
R3i.z = R3i.z;
R3i.w = 0x3f800000;
// 1
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[39].x),intBitsToFloat(uf_remappedVS[39].y),intBitsToFloat(uf_remappedVS[39].z),intBitsToFloat(uf_remappedVS[39].w))));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[40].x),intBitsToFloat(uf_remappedVS[40].y),intBitsToFloat(uf_remappedVS[40].z),intBitsToFloat(uf_remappedVS[40].w))));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[41].x),intBitsToFloat(uf_remappedVS[41].y),intBitsToFloat(uf_remappedVS[41].z),intBitsToFloat(uf_remappedVS[41].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[42].x),intBitsToFloat(uf_remappedVS[42].y),intBitsToFloat(uf_remappedVS[42].z),intBitsToFloat(uf_remappedVS[42].w))));
PV0ix = tempi.x;
R6i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
activeMaskStack[4] = activeMaskStack[3];
activeMaskStackC[5] = activeMaskStackC[4];
// 0
predResult = (intBitsToFloat(R2i.w) == 1.0);
activeMaskStack[4] = predResult;
activeMaskStackC[5] = predResult == true && activeMaskStackC[4] == true;
}
else {
activeMaskStack[4] = false;
activeMaskStackC[5] = false;
}
if( activeMaskStackC[5] == true ) {
// 0
R3i.y = R3i.y;
R3i.z = R3i.z;
R3i.w = 0x3f800000;
// 1
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[43].x),intBitsToFloat(uf_remappedVS[43].y),intBitsToFloat(uf_remappedVS[43].z),intBitsToFloat(uf_remappedVS[43].w))));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[44].x),intBitsToFloat(uf_remappedVS[44].y),intBitsToFloat(uf_remappedVS[44].z),intBitsToFloat(uf_remappedVS[44].w))));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[45].x),intBitsToFloat(uf_remappedVS[45].y),intBitsToFloat(uf_remappedVS[45].z),intBitsToFloat(uf_remappedVS[45].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[46].x),intBitsToFloat(uf_remappedVS[46].y),intBitsToFloat(uf_remappedVS[46].z),intBitsToFloat(uf_remappedVS[46].w))));
PV0ix = tempi.x;
R6i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
}
activeMaskStack[4] = activeMaskStack[4] == false;
activeMaskStackC[5] = activeMaskStack[4] == true && activeMaskStackC[4] == true;
if( activeMaskStackC[5] == true ) {
// 0
R3i.y = R3i.y;
R3i.z = R3i.z;
R3i.w = 0x3f800000;
// 1
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[47].x),intBitsToFloat(uf_remappedVS[47].y),intBitsToFloat(uf_remappedVS[47].z),intBitsToFloat(uf_remappedVS[47].w))));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[48].x),intBitsToFloat(uf_remappedVS[48].y),intBitsToFloat(uf_remappedVS[48].z),intBitsToFloat(uf_remappedVS[48].w))));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[49].x),intBitsToFloat(uf_remappedVS[49].y),intBitsToFloat(uf_remappedVS[49].z),intBitsToFloat(uf_remappedVS[49].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[50].x),intBitsToFloat(uf_remappedVS[50].y),intBitsToFloat(uf_remappedVS[50].z),intBitsToFloat(uf_remappedVS[50].w))));
PV0ix = tempi.x;
R6i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
}
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[16].x) + -(intBitsToFloat(R2i.x)));
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[16].y) + -(intBitsToFloat(R1i.y)));
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[16].z) + -(intBitsToFloat(R2i.z)));
R5i.w = 0;
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(R6i.y));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.x = floatBitsToInt(intBitsToFloat(R0i.z) * intBitsToFloat(R126i.y));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[51].x),intBitsToFloat(uf_remappedVS[51].y),intBitsToFloat(uf_remappedVS[51].z),intBitsToFloat(uf_remappedVS[51].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
R126i.x = floatBitsToInt(tempResultf);
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[52].x),intBitsToFloat(uf_remappedVS[52].y),intBitsToFloat(uf_remappedVS[52].z),intBitsToFloat(uf_remappedVS[52].w))));
PV1ix = tempi.x;
R125i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[53].x),intBitsToFloat(uf_remappedVS[53].y),intBitsToFloat(uf_remappedVS[53].z),intBitsToFloat(uf_remappedVS[53].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R127i.w = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R126i.x)));
// 5
R0i.x = floatBitsToInt(intBitsToFloat(R0i.x) * intBitsToFloat(R126i.y));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R126i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R126i.x)));
R0i.w = R125i.x;
R0i.w = clampFI32(R0i.w);
R0i.y = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(R126i.y));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(PV1iy),intBitsToFloat(PV1iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[54].x),intBitsToFloat(uf_remappedVS[54].y),intBitsToFloat(uf_remappedVS[54].z),0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.z = floatBitsToInt(roundEven(intBitsToFloat(R2i.w)));
// 7
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R126i.w)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R126i.w)));
R127i.z = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(uf_remappedVS[55].x)) + -(intBitsToFloat(uf_remappedVS[55].y)));
R123i.w = clampFI32(R123i.w);
PS1i = floatBitsToInt(intBitsToFloat(uf_remappedVS[54].y) + 1.0);
// 8
R127i.x = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
PV0iy = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
R123i.z = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
PV0iw = floatBitsToInt(intBitsToFloat(PS1i) * 1.5);
PV0iw = clampFI32(PV0iw);
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(uf_remappedVS[56].x)) + -(intBitsToFloat(uf_remappedVS[56].y)));
R122i.x = clampFI32(R122i.x);
// 9
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(0xbe593484));
R125i.y = floatBitsToInt(intBitsToFloat(PV0iw) * 15.0);
R126i.z = floatBitsToInt(-(intBitsToFloat(R122i.x)) + 1.0);
R126i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[54].y) * 1.0 + intBitsToFloat(R5i.y));
tempResultf = max(0.0, intBitsToFloat(PV0iy));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[57].y), intBitsToFloat(PS1i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[57].x), intBitsToFloat(PS1i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R123i.x)) + intBitsToFloat(0x3fc90da4));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(R127i.x)));
// 11
PV1ix = floatBitsToInt(min(intBitsToFloat(uf_remappedVS[16].y), intBitsToFloat(uf_remappedVS[58].z)));
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f22f983));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 12
backupReg0i = R2i.y;
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),-(intBitsToFloat(R127i.w))) + 1.0);
R2i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
PV0iz = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R125i.y));
// 13
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[58].y),intBitsToFloat(PV0iz)) + intBitsToFloat(uf_remappedVS[58].x));
R4i.x = clampFI32(R4i.x);
PV1iw = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS0i));
tempResultf = max(0.0, intBitsToFloat(R126i.z));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 14
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[56].w), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(max(intBitsToFloat(PV1iw), intBitsToFloat(0x3e4ccccd)));
PS0i = floatBitsToInt(exp2(intBitsToFloat(R127i.y)));
// 15
R3i.x = floatBitsToInt(min(intBitsToFloat(PV0iz), 1.0));
R3i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[57].z)),intBitsToFloat(PS0i)) + intBitsToFloat(uf_remappedVS[57].z));
R3i.y = clampFI32(R3i.y);
R1i.w = floatBitsToInt(exp2(intBitsToFloat(PV0iy)));
// 16
R16i.y = R4i.y;
}
if( activeMaskStackC[3] == true ) {
R0i.w = floatBitsToInt(texture(textureUnitVS12, vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))));
R0i.z = floatBitsToInt(texture(textureUnitVS7, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y))).x);
R2i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y))).xyz);
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[59].y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(uf_remappedVS[60].x)));
PV0iz = floatBitsToInt(-(intBitsToFloat(R0i.w)) + 1.0);
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R3i.x)));
// 1
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * 0.25 + 0.5);
R123i.x = clampFI32(R123i.x);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R127i.x)) + 1.0);
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R3i.x)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R3i.x)));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.y));
PV0iz = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
// 3
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(uf_remappedVS[61].w)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + 8.5);
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedVS[62].z)));
// 4
backupReg0i = R1i.w;
R5i.x = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3daaaaab));
R1i.w = floatBitsToInt(-(intBitsToFloat(R0i.w)) + intBitsToFloat(R3i.y));
R1i.w = clampFI32(R1i.w);
R0i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)),intBitsToFloat(uf_remappedVS[63].w)) + intBitsToFloat(uf_remappedVS[63].w));
}
if( activeMaskStackC[3] == true ) {
R9i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R5i.x),intBitsToFloat(R5i.w))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
R12i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].x) * 1.0 + 0.0);
R0i.z = R1i.w;
// 1
R18i.x = R1i.x;
R18i.y = R1i.y;
R18i.z = R1i.z;
R18i.w = R1i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
// skipped export to semanticId 255
// export
passParameterSem3 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.z));
// export
passParameterSem8 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.z));
}
