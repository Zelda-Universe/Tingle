#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 99f12246b58bb8e1
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[77];
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
out vec4 passParameterSem1;
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
ivec4 R21i = ivec4(0);
ivec4 R22i = ivec4(0);
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
attrDecoder = attrDataSem7;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem3;
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem5;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem6;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem9;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R9i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem8;
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
R19i.y = floatBitsToInt(-(intBitsToFloat(R6i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R5i.z = 0;
R6i.z = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R19i.y));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R20i.x = 0;
R20i.y = 0;
R20i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R16i.x = 0;
// 1
R9i.z = R6i.z;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R9i.z = R5i.z;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R9i.z == 0);
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
PS0i = int(intBitsToFloat(R5i.w));
// 1
R13i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R19i.y) >= intBitsToFloat(R13i.z));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R20i.x = 0;
R20i.y = 0;
R20i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R16i.x = 0;
// 1
R5i.z = R6i.z;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R5i.z == 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(uf_remappedVS[2].y)));
R127i.y = floatBitsToInt(max(intBitsToFloat(R8i.x), 0.0));
PV0iz = floatBitsToInt((intBitsToFloat(uf_remappedVS[3].x) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[3].x))?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[3].x));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R19i.y) + intBitsToFloat(uf_remappedVS[4].z));
R126i.y = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iw)));
R125i.z = floatBitsToInt(intBitsToFloat(R19i.y) + intBitsToFloat(uf_remappedVS[4].w));
PV1iw = floatBitsToInt(intBitsToFloat(R19i.y) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[5].z));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(uf_remappedVS[4].x)));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV1iw));
R127i.z = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R13i.z));
// 3
backupReg0i = R127i.y;
PV1ix = floatBitsToInt(fract(intBitsToFloat(PV0iy)));
R127i.y = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iw));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].w)) + intBitsToFloat(uf_remappedVS[7].w));
R14i.w = floatBitsToInt(intBitsToFloat(R19i.y) * intBitsToFloat(PS0i));
R0i.y = floatBitsToInt(min(intBitsToFloat(backupReg0i), 0.0));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.w), intBitsToFloat(R127i.z)));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(0x40c90fdb));
R127i.z = uf_remappedVS[8].x & int(1);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV1ix)));
R127i.w = uf_remappedVS[8].x & 0x2;
// 5
backupReg0i = R126i.z;
R127i.x = uf_remappedVS[8].x & 0x4;
R123i.y = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3e22f983) + 0.5);
R126i.z = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iw));
R0i.w = floatBitsToInt(fract(intBitsToFloat(R127i.y)));
R11i.y = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 6
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].x)) + intBitsToFloat(uf_remappedVS[7].x));
R10i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].y)) + intBitsToFloat(uf_remappedVS[7].y));
R124i.z = floatBitsToInt(intBitsToFloat(R0i.w) + -(0.5));
R125i.w = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R126i.w = floatBitsToInt(float(R127i.z));
// 7
backupReg0i = R127i.w;
R126i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(R11i.y));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.z) + -(intBitsToFloat(uf_remappedVS[9].w)));
R9i.z = floatBitsToInt(intBitsToFloat(R126i.z) + -(intBitsToFloat(uf_remappedVS[7].w)));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].w)) + intBitsToFloat(uf_remappedVS[9].w));
R127i.z = floatBitsToInt(float(backupReg0i));
// 8
backupReg0i = R127i.x;
R127i.x = floatBitsToInt((intBitsToFloat(R126i.w) > 0.0)?1.0:0.0);
R12i.y = floatBitsToInt(intBitsToFloat(R126i.z) + -(intBitsToFloat(uf_remappedVS[6].w)));
R0i.z = ((intBitsToFloat(R9i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.w = floatBitsToInt((0.0 > intBitsToFloat(R126i.w))?1.0:0.0);
R127i.y = floatBitsToInt(float(backupReg0i));
// 9
backupReg0i = R127i.w;
R125i.x = floatBitsToInt((intBitsToFloat(R127i.z) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].x)) + intBitsToFloat(uf_remappedVS[9].x));
R127i.z = floatBitsToInt((0.0 > intBitsToFloat(R127i.z))?1.0:0.0);
R127i.w = floatBitsToInt((intBitsToFloat(R127i.y) > 0.0)?1.0:0.0);
R6i.z = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 10
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(R6i.z));
R125i.y = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(backupReg0i)));
R125i.w = floatBitsToInt((0.0 > intBitsToFloat(R127i.y))?1.0:0.0);
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[5].w));
// 11
backupReg0i = R127i.z;
R10i.x = ((intBitsToFloat(R126i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.y = floatBitsToInt(-(intBitsToFloat(R0i.z)) + 1.0);
R127i.z = floatBitsToInt(intBitsToFloat(R127i.x) + -(intBitsToFloat(R126i.w)));
R126i.w = ((intBitsToFloat(R12i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R124i.w = floatBitsToInt(intBitsToFloat(R125i.x) + -(intBitsToFloat(backupReg0i)));
// 12
R127i.x = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(R127i.y));
R127i.y = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(0x3e22f983));
R125i.z = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(R125i.w)));
R125i.w = ((intBitsToFloat(R124i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(uf_remappedVS[4].y)));
// 13
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].x) + intBitsToFloat(R126i.z));
PV1iy = floatBitsToInt(-(intBitsToFloat(R10i.x)) + 1.0);
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R126i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(backupReg0i)));
R13i.y = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
// 14
backupReg0i = R127i.z;
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PV1iy)));
R126i.y = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].x) + intBitsToFloat(PV1iw));
R4i.w = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R127i.x));
R127i.w = int(intBitsToFloat(backupReg0i));
// 15
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].x), intBitsToFloat(R13i.y)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].x), intBitsToFloat(R0i.w)));
R126i.z = 0 - R127i.w;
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R10i.z)));
R124i.z = int(intBitsToFloat(R124i.w));
// 16
backupReg0i = R125i.z;
PV0ix = 0 - R124i.z;
R124i.y = floatBitsToInt(intBitsToFloat(R4i.w) * intBitsToFloat(0x40c90fdb));
R125i.z = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(PV1ix));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].x), intBitsToFloat(R126i.y)));
R126i.y = int(intBitsToFloat(backupReg0i));
// 17
backupReg0i = R127i.y;
PV1ix = 0 - R126i.y;
R127i.y = max(R127i.w, R126i.z);
R0i.z = max(R124i.z, PV0ix);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R6i.x)));
PS1i = floatBitsToInt(cos((intBitsToFloat(backupReg0i))/0.1591549367));
// 18
R5i.x = max(R126i.y, PV1ix);
R126i.y = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R125i.z));
PV0iz = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
PV0iw = floatBitsToInt(intBitsToFloat(PS1i) + 1.0);
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
R6i.y = floatBitsToInt(-(intBitsToFloat(R124i.w)) + 1.0);
// 19
R0i.x = floatBitsToInt(intBitsToFloat(R124i.y) * intBitsToFloat(0x3e22f983) + 0.5);
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].x), intBitsToFloat(PV0iw)));
R5i.z = floatBitsToInt(max(intBitsToFloat(PV0iz), -(intBitsToFloat(PV0iz))));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].x), intBitsToFloat(R10i.x)));
R0i.w = 0x3f800000;
// 20
R11i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w))));
PV0iy = R11i.x;
PV0iz = R11i.x;
PV0iw = R11i.x;
R1i.x = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(R0i.y));
// 21
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w))));
PV1ix = tempi.x;
R1i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R2i.z = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(R126i.y));
// 22
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R1i.z = tempi.x;
PV0iw = tempi.x;
R3i.x = floatBitsToInt(float(R127i.y));
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(-(intBitsToFloat(R5i.y)) + 1.0);
PV0iy = floatBitsToInt(fract(intBitsToFloat(R0i.x)));
R125i.z = floatBitsToInt(max(intBitsToFloat(R6i.y), -(intBitsToFloat(R6i.y))));
R4i.w = floatBitsToInt(fract(intBitsToFloat(R4i.w)));
R5i.y = floatBitsToInt(float(R0i.z));
// 1
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].y)) + intBitsToFloat(uf_remappedVS[9].y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R2i.z)));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iw = floatBitsToInt(intBitsToFloat(R10i.y) * intBitsToFloat(R11i.y));
R2i.z = floatBitsToInt(float(R5i.x));
// 2
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R5i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R5i.z),intBitsToFloat(R125i.z),0.0)));
PV0iy = R126i.x;
PV0iz = R126i.x;
PV0iw = R126i.x;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(PV1iw)));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(R6i.z));
PV1iy = floatBitsToInt(intBitsToFloat(R4i.w) + -(0.5));
R6i.z = floatBitsToInt(intBitsToFloat(R11i.x) + -(intBitsToFloat(uf_remappedVS[10].x)));
R0i.w = floatBitsToInt(intBitsToFloat(R1i.y) + -(intBitsToFloat(uf_remappedVS[10].y)));
R5i.z = floatBitsToInt(intBitsToFloat(R1i.z) + -(intBitsToFloat(uf_remappedVS[10].z)));
// 4
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R127i.y)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0x3e22f983));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(PV1ix)));
R124i.w = ((intBitsToFloat(PV1iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS0i = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].y) + intBitsToFloat(R126i.y));
// 5
tempi.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R6i.z)),-(intBitsToFloat(R0i.w)),-(intBitsToFloat(R5i.z)),intBitsToFloat(0x80000000)),vec4(-(intBitsToFloat(R6i.z)),-(intBitsToFloat(R0i.w)),-(intBitsToFloat(R5i.z)),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R127i.w = tempi.x;
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R10i.z)));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].y) + intBitsToFloat(R127i.z));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].y), intBitsToFloat(R13i.y)));
R9i.z = 0x3f800000;
R3i.w = floatBitsToInt(-(intBitsToFloat(R124i.w)) + 1.0);
PS0i = floatBitsToInt(cos((intBitsToFloat(R127i.y))/0.1591549367));
// 7
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].y), intBitsToFloat(R10i.x)));
PV1iy = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV0iy));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R6i.x)));
R2i.w = floatBitsToInt(intBitsToFloat(PS0i) + 1.0);
R2i.w = floatBitsToInt(intBitsToFloat(R2i.w) / 2.0);
tempResultf = 1.0 / sqrt(intBitsToFloat(R127i.w));
PS1i = floatBitsToInt(tempResultf);
// 8
R6i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.z)), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PV1iy));
R10i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.w)), intBitsToFloat(PS1i)));
R1i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.z)), intBitsToFloat(PS1i)));
R13i.y = floatBitsToInt(intBitsToFloat(R8i.x) + 1.0);
// 9
R10i.x = floatBitsToInt(intBitsToFloat(R8i.y) + 1.0);
PV1iy = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV0iy));
R125i.z = ((intBitsToFloat(R19i.y) == 0.0)?-1:0);
R9i.w = floatBitsToInt(intBitsToFloat(R8i.z) + 1.0);
R127i.y = int(intBitsToFloat(R7i.w));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.z),intBitsToFloat(R0i.w),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R6i.z),intBitsToFloat(R0i.w),intBitsToFloat(R5i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(PV1iy)));
// 11
backupReg0i = R127i.y;
R126i.x = (backupReg0i == 0x2)?-1:0;
R127i.y = (backupReg0i == 0x3)?-1:0;
PV1iz = (backupReg0i == int(1))?-1:0;
R10i.w = ((R125i.z == 0)?(R19i.y):(0x3f800000));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 12
R123i.x = ((PV1iz == 0)?(0x3f800000):(0xbf800000));
R123i.y = ((PV1iz == 0)?(0xbf800000):(0xbf800000));
R3i.z = uf_remappedVS[11].y;
R12i.w = uf_remappedVS[12].y;
R6i.w = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 13
backupReg0i = R123i.y;
R0i.x = uf_remappedVS[13].y;
R123i.y = ((R126i.x == 0)?(R123i.x):(0xbf800000));
R123i.z = ((R126i.x == 0)?(backupReg0i):(0x3f800000));
R13i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[12].z) * 1.0);
R2i.x = 0;
// 14
R9i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[11].z) * 1.0);
R9i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[13].z) * 1.0);
R0i.z = ((R127i.y == 0)?(R123i.y):(0x3f800000));
R11i.w = ((R127i.y == 0)?(R123i.z):(0x3f800000));
// 15
R14i.x = uf_remappedVS[12].x;
R21i.y = uf_remappedVS[11].x;
// 16
R14i.z = uf_remappedVS[13].x;
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(uf_remappedVS[14].y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), intBitsToFloat(R3i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), intBitsToFloat(R2i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), intBitsToFloat(R4i.w)));
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(PV0iw)) + 1.0);
PV1iy = floatBitsToInt(-(intBitsToFloat(PV0iy)) + 1.0);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[15].z)));
R127i.w = floatBitsToInt(-(intBitsToFloat(PV0iz)) + 1.0);
R127i.y = uf_remappedVS[15].x;
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) / 2.0);
// 2
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(R6i.x)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(R10i.z)));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(R1i.w)));
R124i.w = floatBitsToInt(max(intBitsToFloat(PV1ix), -(intBitsToFloat(PV1ix))));
R125i.z = floatBitsToInt(max(intBitsToFloat(PV1iy), -(intBitsToFloat(PV1iy))));
// 3
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(intBitsToFloat(R6i.z) + intBitsToFloat(R4i.x));
R127i.y = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(R4i.y));
R127i.z = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(R4i.z));
PV1iw = uf_remappedVS[15].y;
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) / 2.0);
R125i.w = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(backupReg0i));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R5i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.w),intBitsToFloat(R124i.w),intBitsToFloat(R125i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R124i.w = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(PV1iw));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R5i.w)));
// 6
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(uf_remappedVS[14].z)));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 7
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(R6i.w));
// 8
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV1iz)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV1iz)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(PV1iz)));
// 9
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R125i.w)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R124i.w)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R5i.y),intBitsToFloat(R2i.z),intBitsToFloat(R9i.z)),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R5i.y),intBitsToFloat(R2i.z),intBitsToFloat(R9i.z)),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R5i.x = floatBitsToInt(intBitsToFloat(R11i.x) + intBitsToFloat(PV0ix));
// 2
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(uf_remappedVS[16].x)));
R6i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y), intBitsToFloat(uf_remappedVS[16].x)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(uf_remappedVS[16].x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.z), intBitsToFloat(uf_remappedVS[17].w)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R5i.y),intBitsToFloat(R2i.z),intBitsToFloat(R9i.z)),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),intBitsToFloat(uf_remappedVS[13].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R124i.w = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV0iz));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(R127i.x));
R2i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(PV0ix));
PV1iy = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(R125i.w));
R5i.z = floatBitsToInt(intBitsToFloat(R10i.w) * intBitsToFloat(PS0i));
R5i.z = clampFI32(R5i.z);
// 6
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.w),intBitsToFloat(uf_remappedVS[18].x)) + 0.0);
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(uf_remappedVS[18].x)) + 0.0);
R0i.w = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(PV1ix));
// 7
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R12i.w)) + intBitsToFloat(R13i.w));
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R3i.z)) + intBitsToFloat(R9i.x));
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R0i.x)) + intBitsToFloat(R9i.y));
// 8
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
PV0ix = uf_remappedVS[20].w;
PV0iy = uf_remappedVS[21].w;
// 1
R127i.x = floatBitsToInt(-(intBitsToFloat(R5i.x)) + intBitsToFloat(PV0iy));
R127i.y = floatBitsToInt(-(intBitsToFloat(R6i.y)) + intBitsToFloat(PV0ix));
PV1iw = uf_remappedVS[22].w;
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[19].y));
// 2
PV0iz = floatBitsToInt(-(intBitsToFloat(R2i.z)) + intBitsToFloat(PV1iw));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV0iz),0.0)));
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
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PV1ix)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[21].w) + intBitsToFloat(uf_remappedVS[20].w));
R3i.y = floatBitsToInt(intBitsToFloat(R14i.w) + 0.0);
PV0iz = ((intBitsToFloat(R8i.x) > 0.5)?-1:0);
R127i.w = ((intBitsToFloat(R8i.y) > 0.5)?-1:0);
R126i.x = ((intBitsToFloat(R8i.z) > 0.5)?-1:0);
// 1
R125i.x = ((intBitsToFloat(R8i.y) > 0.5)?-1:0);
R127i.y = ((intBitsToFloat(R8i.z) > 0.5)?-1:0);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].w), intBitsToFloat(uf_remappedVS[17].z)));
R126i.w = ((intBitsToFloat(R8i.w) > 0.5)?-1:0);
R0i.y = floatBitsToInt(((PV0iz == 0)?(intBitsToFloat(R7i.x)):(-(intBitsToFloat(R7i.x)))));
// 2
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].w), intBitsToFloat(R0i.w)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV1iz)));
R0i.z = floatBitsToInt(((R127i.w == 0)?(intBitsToFloat(R7i.y)):(-(intBitsToFloat(R7i.y)))));
PV0iw = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(uf_remappedVS[22].w));
R0i.w = floatBitsToInt(((R126i.x == 0)?(intBitsToFloat(R7i.x)):(-(intBitsToFloat(R7i.x)))));
// 3
R0i.x = floatBitsToInt(((R126i.w == 0)?(intBitsToFloat(R7i.y)):(-(intBitsToFloat(R7i.y)))));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), intBitsToFloat(uf_remappedVS[17].x)));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3dd70a3d));
R1i.w = floatBitsToInt(((R125i.x == 0)?(intBitsToFloat(R7i.x)):(-(intBitsToFloat(R7i.x)))));
R1i.x = floatBitsToInt(((R127i.y == 0)?(intBitsToFloat(R7i.y)):(-(intBitsToFloat(R7i.y)))));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R126i.y));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].z), intBitsToFloat(uf_remappedVS[17].y)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R127i.x));
R3i.x = floatBitsToInt(intBitsToFloat(R11i.x) + intBitsToFloat(R4i.x));
// 5
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].z), intBitsToFloat(R5i.z)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PV0iy)));
PV1iz = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0ix));
R22i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(R4i.y));
// 6
R11i.x = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(R3i.x));
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
R1i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(R4i.z));
// 7
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
R1i.y = floatBitsToInt(intBitsToFloat(R2i.y) + 1.0);
// 8
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R11i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(R22i.y));
R11i.z = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(R1i.z));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 9
R127i.z = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R126i.w = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 10
PS0i = floatBitsToInt(sin((intBitsToFloat(R127i.z))/0.1591549367));
// 11
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R127i.x)));
PS1i = floatBitsToInt(cos((intBitsToFloat(R127i.z))/0.1591549367));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV1iw));
PS0i = floatBitsToInt(sin((intBitsToFloat(R126i.w))/0.1591549367));
// 13
R127i.x = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R126i.y)));
R13i.x = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV0iz));
// 14
PV0iz = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(PV1iw));
// 15
R14i.y = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV0iz));
R13i.z = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(R127i.x));
R2i.w = 0x3f800000;
}
if( activeMaskStackC[3] == true ) {
// 0
R20i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R14i.y),intBitsToFloat(R13i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[23].x),intBitsToFloat(uf_remappedVS[23].y),intBitsToFloat(uf_remappedVS[23].z),intBitsToFloat(uf_remappedVS[23].w))));
PV0iy = R20i.x;
PV0iz = R20i.x;
PV0iw = R20i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R14i.y),intBitsToFloat(R13i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[24].x),intBitsToFloat(uf_remappedVS[24].y),intBitsToFloat(uf_remappedVS[24].z),intBitsToFloat(uf_remappedVS[24].w))));
PV1ix = tempi.x;
R20i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R14i.y),intBitsToFloat(R13i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[25].x),intBitsToFloat(uf_remappedVS[25].y),intBitsToFloat(uf_remappedVS[25].z),intBitsToFloat(uf_remappedVS[25].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R20i.z = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R14i.y),intBitsToFloat(R13i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[26].x),intBitsToFloat(uf_remappedVS[26].y),intBitsToFloat(uf_remappedVS[26].z),intBitsToFloat(uf_remappedVS[26].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R20i.w = tempi.x;
// 4
R123i.x = floatBitsToInt(intBitsToFloat(R20i.z) * 0.0 + intBitsToFloat(PV1ix));
R126i.y = floatBitsToInt((intBitsToFloat(uf_remappedVS[27].y) > 0.0)?1.0:0.0);
PV0iz = uf_remappedVS[8].y & int(1);
R127i.w = PV1ix;
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) / 2.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[27].y));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R19i.y) * intBitsToFloat(PS0i));
PV1iy = (int(1) != PV0iz)?-1:0;
R123i.z = floatBitsToInt(intBitsToFloat(R20i.z) * 0.5 + intBitsToFloat(R127i.w));
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[27].y))?1.0:0.0);
R19i.x = floatBitsToInt(1.0 / intBitsToFloat(R123i.x));
// 6
R123i.x = ((PV1iy == 0)?(0):(int(1)));
PV0iy = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(R19i.x));
R127i.z = floatBitsToInt(intBitsToFloat(R126i.y) + -(intBitsToFloat(PV1iw)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(uf_remappedVS[3].z)) + intBitsToFloat(PV1ix));
R127i.x = uf_remappedVS[8].x & 0x80000;
// 7
PV1ix = (R123i.x == 0x2)?-1:0;
R126i.y = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(uf_remappedVS[1].w)) + -(intBitsToFloat(uf_remappedVS[1].y)));
R126i.z = (R123i.x == int(1))?-1:0;
// 8
backupReg0i = R123i.w;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV1iz)));
R123i.y = ((PV1ix == 0)?(R8i.x):(R8i.z));
R127i.z = uf_remappedVS[8].x & 0x100000;
R123i.w = ((PV1ix == 0)?(R8i.y):(R8i.x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 9
R125i.x = uf_remappedVS[8].x & 0x200000;
R2i.y = ((R126i.z == 0)?(R123i.w):(R8i.z));
R1i.z = ((R126i.z == 0)?(R123i.y):(R8i.y));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.w),intBitsToFloat(R126i.y)) + intBitsToFloat(PV0ix));
R13i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS0i));
// 10
PV0ix = uf_remappedVS[8].x & 0x800000;
PV0iy = uf_remappedVS[8].x & 0x400000;
R127i.z = (R127i.z == 0x100000)?-1:0;
R126i.w = (R127i.x == 0x80000)?-1:0;
R2i.x = ((R126i.z == 0)?(R8i.x):(R8i.y));
// 11
backupReg0i = R126i.z;
PV1ix = (PV0iy == 0x400000)?-1:0;
PV1iy = (R125i.x == 0x200000)?-1:0;
R126i.z = (PV0ix == 0x800000)?-1:0;
PV1iw = uf_remappedVS[8].x & 0x1000000;
R3i.w = ((backupReg0i == 0)?(R8i.y):(R8i.z));
// 12
R5i.x = ((R126i.w == 0)?(R7i.x):(R0i.y));
R6i.y = ((PV1iy == 0)?(R7i.x):(R0i.w));
PV0iz = (PV1iw == 0x1000000)?-1:0;
R5i.w = ((R127i.z == 0)?(R7i.y):(R0i.z));
R9i.y = ((PV1ix == 0)?(R7i.y):(R0i.x));
// 13
R123i.x = ((R126i.z == 0)?(R7i.x):(R1i.w));
R4i.y = floatBitsToInt(intBitsToFloat(R5i.x) + 0.5);
R3i.z = floatBitsToInt(intBitsToFloat(R5i.w) + -(0.5));
R123i.w = ((PV0iz == 0)?(R7i.y):(R1i.x));
R4i.z = floatBitsToInt(intBitsToFloat(R6i.y) + 0.5);
// 14
R4i.x = floatBitsToInt(intBitsToFloat(R123i.x) + 0.5);
R5i.y = floatBitsToInt(intBitsToFloat(R123i.w) + -(0.5));
R123i.z = floatBitsToInt(intBitsToFloat(R20i.z) * 0.0 + intBitsToFloat(R127i.w));
R4i.w = floatBitsToInt(intBitsToFloat(R9i.y) + -(0.5));
// 15
R8i.z = floatBitsToInt(intBitsToFloat(R20i.y) * -(0.5) + intBitsToFloat(R123i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(intBitsToFloat(R3i.y) + -(intBitsToFloat(uf_remappedVS[28].w)));
R125i.x = int(intBitsToFloat(uf_remappedVS[29].z));
// 1
R127i.x = ((intBitsToFloat(R126i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.z = floatBitsToInt(intBitsToFloat(R3i.y) + -(intBitsToFloat(uf_remappedVS[30].w)));
R126i.z = int(intBitsToFloat(uf_remappedVS[31].z));
// 2
R127i.y = ((intBitsToFloat(R125i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[28].w)) + intBitsToFloat(uf_remappedVS[30].w));
R125i.w = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R7i.w = floatBitsToInt(float(R125i.x));
// 3
backupReg0i = R126i.z;
R125i.x = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
R126i.y = floatBitsToInt((0.0 >= abs(intBitsToFloat(R7i.w)))?1.0:0.0);
R126i.z = floatBitsToInt(-(abs(intBitsToFloat(R7i.w))) + 0.0);
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[28].x)) + intBitsToFloat(uf_remappedVS[30].x));
R0i.y = floatBitsToInt(float(backupReg0i));
// 4
backupReg0i = R127i.z;
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[30].w)) + intBitsToFloat(uf_remappedVS[32].w));
R124i.y = floatBitsToInt(intBitsToFloat(R3i.y) + -(intBitsToFloat(uf_remappedVS[32].w)));
R127i.z = floatBitsToInt(-(abs(intBitsToFloat(R0i.y))) + 0.0);
R126i.w = floatBitsToInt((0.0 >= abs(intBitsToFloat(R0i.y)))?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 5
backupReg0i = R126i.z;
R124i.x = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[30].x)) + intBitsToFloat(uf_remappedVS[32].x));
R126i.z = ((intBitsToFloat(R124i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R124i.w = ((intBitsToFloat(R126i.y) == 0.0)?(0):(backupReg0i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 6
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(intBitsToFloat(R3i.y) + -(intBitsToFloat(uf_remappedVS[33].w)));
R125i.y = ((intBitsToFloat(R126i.w) == 0.0)?(0):(R127i.z));
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[32].w)) + intBitsToFloat(uf_remappedVS[33].w));
R126i.w = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(PS1i));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(backupReg0i)));
// 7
R1i.x = floatBitsToInt(intBitsToFloat(R3i.y) + -(intBitsToFloat(uf_remappedVS[34].w)));
R1i.y = ((intBitsToFloat(R125i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iz = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R124i.x)) + intBitsToFloat(uf_remappedVS[28].x));
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 8
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(abs(intBitsToFloat(R7i.w)) + intBitsToFloat(R124i.w));
R127i.y = floatBitsToInt(abs(intBitsToFloat(R0i.y)) + intBitsToFloat(R125i.y));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1iz)));
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[32].x)) + intBitsToFloat(uf_remappedVS[33].x));
R1i.w = floatBitsToInt(1.0 / intBitsToFloat(R7i.w));
// 9
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[33].w)) + intBitsToFloat(uf_remappedVS[34].w));
R7i.y = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(R126i.y));
R124i.z = ((intBitsToFloat(R1i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iw = floatBitsToInt(-(intBitsToFloat(R1i.y)) + 1.0);
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(R0i.y));
// 10
R124i.x = ((-(intBitsToFloat(R125i.y)) > 0.0)?(R127i.y):(R125i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R126i.w)) + intBitsToFloat(uf_remappedVS[30].x));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[28].x), intBitsToFloat(R125i.w)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV1iw)));
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 11
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[33].x)) + intBitsToFloat(uf_remappedVS[34].x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R127i.x)) + intBitsToFloat(PV0iz));
R126i.z = ((-(intBitsToFloat(R124i.w)) > 0.0)?(R126i.x):(R124i.w));
R124i.w = floatBitsToInt(intBitsToFloat(R126i.y) * 0.0);
R127i.w = floatBitsToInt(-(intBitsToFloat(R124i.z)) + 1.0);
// 12
R6i.x = floatBitsToInt(intBitsToFloat(R3i.y) + -(intBitsToFloat(uf_remappedVS[35].w)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.y));
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[34].w)) + intBitsToFloat(uf_remappedVS[35].w));
R126i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(R126i.w));
R127i.z = floatBitsToInt(intBitsToFloat(R1i.w) * 0.0);
// 13
R127i.x = ((intBitsToFloat(R7i.w) == 0.0)?(0):(R126i.z));
R125i.y = ((intBitsToFloat(R6i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R0i.z = floatBitsToInt(intBitsToFloat(R2i.w) + -(intBitsToFloat(uf_remappedVS[36].w)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(R7i.y)) + intBitsToFloat(uf_remappedVS[32].x));
R124i.y = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 14
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[36].w)) + intBitsToFloat(uf_remappedVS[37].w));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R125i.w)) + intBitsToFloat(R127i.y));
R125i.z = ((intBitsToFloat(R0i.y) == 0.0)?(0):(R124i.x));
PV0iw = floatBitsToInt(intBitsToFloat(R2i.w) + -(intBitsToFloat(uf_remappedVS[37].w)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R127i.w)));
// 15
R124i.x = ((intBitsToFloat(R0i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.y = floatBitsToInt(trunc(intBitsToFloat(R127i.z)));
R9i.z = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[34].x)) + intBitsToFloat(uf_remappedVS[35].x));
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 16
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].w)) + intBitsToFloat(uf_remappedVS[38].w));
R1i.y = floatBitsToInt(intBitsToFloat(R3i.y) + -(intBitsToFloat(uf_remappedVS[38].w)));
R7i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(R124i.y));
R2i.w = floatBitsToInt(trunc(intBitsToFloat(R124i.w)));
R124i.y = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
// 17
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].x), intBitsToFloat(R1i.z)));
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) * 2.0);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R126i.w)) + intBitsToFloat(uf_remappedVS[33].x));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].y), intBitsToFloat(R2i.y)));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 2.0);
R7i.w = ((intBitsToFloat(R1i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 18
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R124i.y)));
PV0iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[36].x)) + intBitsToFloat(uf_remappedVS[37].x));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(R126i.z)) + intBitsToFloat(R127i.y));
R124i.w = floatBitsToInt(-(intBitsToFloat(R9i.z)) + 1.0);
R125i.w = floatBitsToInt(-(intBitsToFloat(R124i.x)) + 1.0);
// 19
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[40].z) + intBitsToFloat(uf_remappedVS[39].x));
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[40].w) + intBitsToFloat(uf_remappedVS[39].y));
R124i.z = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(R127i.w));
PV1iw = floatBitsToInt(-(intBitsToFloat(R7i.w)) + 1.0);
R7i.x = int(intBitsToFloat(R127i.x));
// 20
R3i.x = floatBitsToInt(-(intBitsToFloat(R127i.z)) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].x)) + intBitsToFloat(uf_remappedVS[38].x));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV1iw)));
R0i.w = floatBitsToInt(-(intBitsToFloat(R125i.x)) + intBitsToFloat(PV1ix));
R0i.x = int(intBitsToFloat(R126i.y));
// 21
R9i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(R126i.w));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R124i.w)));
R1i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[38].w)) + intBitsToFloat(uf_remappedVS[41].w));
PV1iw = floatBitsToInt(intBitsToFloat(R3i.y) + -(intBitsToFloat(uf_remappedVS[41].w)));
R2i.z = int(intBitsToFloat(R125i.z));
// 22
R10i.z = ((intBitsToFloat(PV1iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R7i.z)) + intBitsToFloat(uf_remappedVS[34].x));
R1i.w = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[29].z));
// 23
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R126i.x)) + intBitsToFloat(R126i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R124i.z)) + intBitsToFloat(uf_remappedVS[36].x));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].x), intBitsToFloat(R125i.w)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R10i.z)) + 1.0);
R3i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[29].w));
// 24
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(R126i.y)) + intBitsToFloat(PV1iz));
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[42].y) + intBitsToFloat(uf_remappedVS[42].w));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[42].x) + intBitsToFloat(uf_remappedVS[42].z));
R0i.z = int(intBitsToFloat(R2i.w));
// 25
backupReg0i = R2i.x;
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[42].w),intBitsToFloat(R3i.w)) + intBitsToFloat(PV0iy));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[42].z),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV0iw));
R2i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[31].z));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(uf_remappedVS[43].y)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[44].w) + intBitsToFloat(uf_remappedVS[43].y));
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[44].z) + intBitsToFloat(uf_remappedVS[43].x));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(uf_remappedVS[43].x)));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
R0i.y = floatBitsToInt(1.0 / intBitsToFloat(R1i.z));
// 1
R126i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[45].x) + intBitsToFloat(uf_remappedVS[45].z));
R126i.y = floatBitsToInt(-(intBitsToFloat(PV0iw)) + intBitsToFloat(PV0iz));
R126i.z = floatBitsToInt(-(intBitsToFloat(PV0ix)) + intBitsToFloat(PV0iy));
R125i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[45].y) + intBitsToFloat(uf_remappedVS[45].w));
R125i.y = floatBitsToInt(float(R7i.x));
// 2
R124i.x = ((intBitsToFloat(R13i.y) > intBitsToFloat(uf_remappedVS[46].y))?-1:0);
R124i.w = ((intBitsToFloat(R13i.y) > intBitsToFloat(uf_remappedVS[46].x))?-1:0);
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[31].w));
// 3
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(uf_remappedVS[45].z)) + intBitsToFloat(R126i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[29].x), intBitsToFloat(R1i.w)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(uf_remappedVS[45].w)) + intBitsToFloat(R125i.w));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[29].y), intBitsToFloat(R3i.y)));
R124i.z = floatBitsToInt(float(R0i.x));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R19i.y)),intBitsToFloat(uf_remappedVS[44].x)) + -(intBitsToFloat(R126i.y)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.y),intBitsToFloat(uf_remappedVS[44].y)) + intBitsToFloat(R126i.z));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[31].x), intBitsToFloat(R2i.y)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[31].y), intBitsToFloat(R126i.w)));
R126i.w = floatBitsToInt(float(R2i.z));
// 5
PV1ix = R124i.w & int(1);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R125i.y)) + intBitsToFloat(R123i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R19i.y)),intBitsToFloat(uf_remappedVS[40].x)) + -(intBitsToFloat(R0i.w)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.y),intBitsToFloat(uf_remappedVS[40].y)) + intBitsToFloat(R3i.x));
PS1i = floatBitsToInt(float(R0i.z));
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.w)),intBitsToFloat(R124i.z)) + intBitsToFloat(R126i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R126i.w)) + intBitsToFloat(R123i.z));
R124i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)),intBitsToFloat(PS1i)) + intBitsToFloat(R123i.w));
R126i.w = PV1ix - R124i.x;
R0i.w = uf_remappedVS[47].x;
// 7
backupReg0i = R4i.y;
R124i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.w)),intBitsToFloat(R3i.z)) + -(intBitsToFloat(R123i.x)));
R4i.y = uf_remappedVS[47].z;
R3i.z = uf_remappedVS[47].y;
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(backupReg0i)) + intBitsToFloat(R125i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R4i.z)) + intBitsToFloat(R123i.y));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.y),intBitsToFloat(uf_remappedVS[39].w)) + intBitsToFloat(R2i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.y),intBitsToFloat(uf_remappedVS[39].z)) + intBitsToFloat(R7i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.y),intBitsToFloat(uf_remappedVS[43].w)) + intBitsToFloat(R125i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.y),intBitsToFloat(uf_remappedVS[43].z)) + intBitsToFloat(R126i.x));
R125i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)),intBitsToFloat(R4i.w)) + -(intBitsToFloat(R124i.z)));
// 9
PV1ix = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
PV1iy = ((intBitsToFloat(R13i.y) > intBitsToFloat(uf_remappedVS[46].z))?-1:0);
PV1iz = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
R127i.w = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R126i.x = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
// 10
backupReg0i = R124i.x;
R124i.x = R126i.w - PV1iy;
R18i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),intBitsToFloat(PV1iz)) + intBitsToFloat(backupReg0i));
R124i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[48].y)), intBitsToFloat(R5i.y)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[48].x), intBitsToFloat(R4i.x)));
R18i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.x)),intBitsToFloat(PV1ix)) + intBitsToFloat(R125i.w));
// 11
R18i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.y)),intBitsToFloat(R127i.w)) + intBitsToFloat(R127i.y));
R18i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),intBitsToFloat(R126i.x)) + intBitsToFloat(R125i.z));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[48].z));
// 12
R17i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R126i.w)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[48].w));
// 13
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R124i.z)));
R1i.w = floatBitsToInt(float(R124i.x));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[38].x)) + intBitsToFloat(uf_remappedVS[41].x));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(R0i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R9i.x)) + intBitsToFloat(uf_remappedVS[35].x));
R7i.z = uf_remappedVS[49].x;
R4i.w = uf_remappedVS[49].y;
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(PV1ix)) + intBitsToFloat(uf_remappedVS[38].x));
R1i.y = uf_remappedVS[49].z;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(R5i.z)) + intBitsToFloat(R1i.x));
// 3
R0i.y = uf_remappedVS[50].x;
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(R6i.z)) + intBitsToFloat(R123i.w));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[37].x),intBitsToFloat(R9i.z)) + intBitsToFloat(R10i.x));
// 4
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[41].x),intBitsToFloat(R10i.z)) + intBitsToFloat(R123i.z));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[51].x)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(uf_remappedVS[51].y)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(uf_remappedVS[51].z)));
R12i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(uf_remappedVS[51].w)));
// 1
backupReg0i = R0i.y;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(uf_remappedVS[52].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(uf_remappedVS[52].y)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[52].z)));
R10i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[52].w)));
// 2
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[53].x)));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(uf_remappedVS[53].x)));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[53].x)));
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[53].x), intBitsToFloat(R1i.x)));
// 3
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[53].x), intBitsToFloat(R0i.y)));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[53].x), intBitsToFloat(R1i.z)));
// 4
predResult = (intBitsToFloat(R1i.w) == 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R11i.y = R11i.y;
R11i.z = R11i.z;
R11i.w = 0x3f800000;
// 1
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(uf_remappedVS[54].x),intBitsToFloat(uf_remappedVS[54].y),intBitsToFloat(uf_remappedVS[54].z),intBitsToFloat(uf_remappedVS[54].w))));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(uf_remappedVS[55].x),intBitsToFloat(uf_remappedVS[55].y),intBitsToFloat(uf_remappedVS[55].z),intBitsToFloat(uf_remappedVS[55].w))));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(uf_remappedVS[56].x),intBitsToFloat(uf_remappedVS[56].y),intBitsToFloat(uf_remappedVS[56].z),intBitsToFloat(uf_remappedVS[56].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(uf_remappedVS[57].x),intBitsToFloat(uf_remappedVS[57].y),intBitsToFloat(uf_remappedVS[57].z),intBitsToFloat(uf_remappedVS[57].w))));
PV0ix = tempi.x;
R1i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
activeMaskStack[4] = activeMaskStack[3];
activeMaskStackC[5] = activeMaskStackC[4];
// 0
predResult = (intBitsToFloat(R1i.w) == 1.0);
activeMaskStack[4] = predResult;
activeMaskStackC[5] = predResult == true && activeMaskStackC[4] == true;
}
else {
activeMaskStack[4] = false;
activeMaskStackC[5] = false;
}
if( activeMaskStackC[5] == true ) {
// 0
R11i.y = R11i.y;
R11i.z = R11i.z;
R11i.w = 0x3f800000;
// 1
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(uf_remappedVS[58].x),intBitsToFloat(uf_remappedVS[58].y),intBitsToFloat(uf_remappedVS[58].z),intBitsToFloat(uf_remappedVS[58].w))));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(uf_remappedVS[59].x),intBitsToFloat(uf_remappedVS[59].y),intBitsToFloat(uf_remappedVS[59].z),intBitsToFloat(uf_remappedVS[59].w))));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(uf_remappedVS[60].x),intBitsToFloat(uf_remappedVS[60].y),intBitsToFloat(uf_remappedVS[60].z),intBitsToFloat(uf_remappedVS[60].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(uf_remappedVS[61].x),intBitsToFloat(uf_remappedVS[61].y),intBitsToFloat(uf_remappedVS[61].z),intBitsToFloat(uf_remappedVS[61].w))));
PV0ix = tempi.x;
R1i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
}
activeMaskStack[4] = activeMaskStack[4] == false;
activeMaskStackC[5] = activeMaskStack[4] == true && activeMaskStackC[4] == true;
if( activeMaskStackC[5] == true ) {
// 0
R11i.y = R11i.y;
R11i.z = R11i.z;
R11i.w = 0x3f800000;
// 1
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(uf_remappedVS[62].x),intBitsToFloat(uf_remappedVS[62].y),intBitsToFloat(uf_remappedVS[62].z),intBitsToFloat(uf_remappedVS[62].w))));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(uf_remappedVS[63].x),intBitsToFloat(uf_remappedVS[63].y),intBitsToFloat(uf_remappedVS[63].z),intBitsToFloat(uf_remappedVS[63].w))));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(uf_remappedVS[64].x),intBitsToFloat(uf_remappedVS[64].y),intBitsToFloat(uf_remappedVS[64].z),intBitsToFloat(uf_remappedVS[64].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(uf_remappedVS[65].x),intBitsToFloat(uf_remappedVS[65].y),intBitsToFloat(uf_remappedVS[65].z),intBitsToFloat(uf_remappedVS[65].w))));
PV0ix = tempi.x;
R1i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
}
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[10].x) + -(intBitsToFloat(R13i.x)));
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[10].y) + -(intBitsToFloat(R14i.y)));
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[10].z) + -(intBitsToFloat(R13i.z)));
R127i.w = floatBitsToInt(intBitsToFloat(R8i.z) * intBitsToFloat(R19i.x));
R125i.z = floatBitsToInt(1.0 / intBitsToFloat(R1i.y));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.y = floatBitsToInt(intBitsToFloat(R0i.z) * intBitsToFloat(R125i.z));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(uf_remappedVS[66].x),intBitsToFloat(uf_remappedVS[66].y),intBitsToFloat(uf_remappedVS[66].z),intBitsToFloat(uf_remappedVS[66].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
R126i.z = floatBitsToInt(tempResultf);
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(uf_remappedVS[67].x),intBitsToFloat(uf_remappedVS[67].y),intBitsToFloat(uf_remappedVS[67].z),intBitsToFloat(uf_remappedVS[67].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R124i.z = tempi.x;
PV1iw = tempi.x;
R126i.x = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(uf_remappedVS[68].x),intBitsToFloat(uf_remappedVS[68].y),intBitsToFloat(uf_remappedVS[68].z),intBitsToFloat(uf_remappedVS[68].w))));
PV0ix = tempi.x;
R125i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R126i.z)));
// 5
R0i.x = floatBitsToInt(intBitsToFloat(R0i.x) * intBitsToFloat(R125i.z));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R126i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R126i.z)));
R0i.w = R126i.y;
R0i.w = clampFI32(R0i.w);
R0i.y = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(R125i.z));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(PV1iy),intBitsToFloat(PV1iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[69].x),intBitsToFloat(uf_remappedVS[69].y),intBitsToFloat(uf_remappedVS[69].z),0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.z = floatBitsToInt(roundEven(intBitsToFloat(R1i.w)));
// 7
backupReg0i = R127i.w;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R126i.x)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R126i.x)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y),intBitsToFloat(uf_remappedVS[70].x)) + -(intBitsToFloat(uf_remappedVS[70].y)));
R123i.z = clampFI32(R123i.z);
R127i.w = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
PS1i = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
// 8
backupReg0i = R123i.z;
R123i.x = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3f333333) + intBitsToFloat(0x3e19999a));
R123i.x = clampFI32(R123i.x);
R125i.y = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
R123i.z = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
PV0iw = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
R3i.y = 0;
// 9
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[69].y) + 1.0);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R123i.z)) + intBitsToFloat(0xbe593484));
PV1iz = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y),intBitsToFloat(uf_remappedVS[71].x)) + -(intBitsToFloat(uf_remappedVS[71].y)));
R126i.w = clampFI32(R126i.w);
tempResultf = max(0.0, intBitsToFloat(PV0iw));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R127i.y = floatBitsToInt(tempResultf);
// 10
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + 8.5);
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) * 1.5);
PV0iy = clampFI32(PV0iy);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[72].y), intBitsToFloat(R127i.y)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R123i.y)) + intBitsToFloat(0x3fc90da4));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(R125i.y)));
// 11
R3i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3daaaaab));
R5i.y = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * 15.0);
PV1iw = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f22f983));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 12
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),-(intBitsToFloat(R127i.w))) + 1.0);
R2i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[72].x), intBitsToFloat(R127i.y)));
R1i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[69].y) * 1.0 + intBitsToFloat(R13i.y));
R4i.y = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
}
if( activeMaskStackC[3] == true ) {
R0i.w = floatBitsToInt(texture(textureUnitVS12, vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))));
R0i.z = floatBitsToInt(texture(textureUnitVS7, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y))).x);
R2i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y))).xyz);
R11i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R0i.w)) + 1.0);
PV0iy = floatBitsToInt(intBitsToFloat(R1i.w) * intBitsToFloat(R4i.y));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[73].y)));
tempResultf = max(0.0, intBitsToFloat(R5i.y));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R124i.z = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(min(intBitsToFloat(uf_remappedVS[10].y), intBitsToFloat(uf_remappedVS[74].z)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R127i.w)) + 1.0);
PV1iw = floatBitsToInt(max(intBitsToFloat(PV0iy), intBitsToFloat(0x3e4ccccd)));
PS1i = floatBitsToInt(exp2(intBitsToFloat(R1i.z)));
// 2
R3i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[72].z)),intBitsToFloat(PS1i)) + intBitsToFloat(uf_remappedVS[72].z));
R3i.x = clampFI32(R3i.x);
R4i.y = floatBitsToInt(-(intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.z));
PV0iz = floatBitsToInt(-(intBitsToFloat(R22i.y)) + intBitsToFloat(PV1ix));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[71].w), intBitsToFloat(R124i.z)));
R124i.z = floatBitsToInt(min(intBitsToFloat(PV1iw), 1.0));
// 3
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.x),intBitsToFloat(R14i.x)) + intBitsToFloat(R16i.x));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.x),intBitsToFloat(R21i.y)) + intBitsToFloat(R15i.y));
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.x),intBitsToFloat(R14i.z)) + intBitsToFloat(R15i.z));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[74].y),intBitsToFloat(PV0iz)) + intBitsToFloat(uf_remappedVS[74].x));
R0i.w = clampFI32(R0i.w);
R5i.y = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
// 4
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R124i.z)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R124i.z)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R124i.z)));
}
if( activeMaskStackC[3] == true ) {
// 0
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[75].w)));
R15i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[19].z), intBitsToFloat(R4i.y)));
// 1
R15i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.y)),intBitsToFloat(uf_remappedVS[76].w)) + intBitsToFloat(uf_remappedVS[76].w));
PV1iy = floatBitsToInt(-(intBitsToFloat(R15i.w)) + intBitsToFloat(R3i.x));
PV1iy = clampFI32(PV1iy);
// 2
R15i.z = PV1iy;
R0i.w = PV1iy;
}
if( activeMaskStackC[3] == true ) {
// 0
R16i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[14].x) * 1.0 + 0.0);
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.z));
// export
passParameterSem9 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.z));
}
