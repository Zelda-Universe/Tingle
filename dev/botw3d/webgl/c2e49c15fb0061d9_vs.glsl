#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader c2e49c15fb0061d9
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[66];
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
ATTR_LAYOUT(0, 10) in uvec4 attrDataSem10;

out vec4 passParameterSem0;
out vec4 passParameterSem1;
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
R0i.y = floatBitsToInt(-(intBitsToFloat(R7i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R0i.w = 0;
R4i.w = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R0i.y));
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
R6i.x = 0;
// 1
R5i.w = R4i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R5i.w = R0i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R5i.w == 0);
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
R7i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R0i.y) >= intBitsToFloat(R7i.z));
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
R6i.x = 0;
// 1
R0i.w = R4i.w;
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
// 0
PV0ix = floatBitsToInt((intBitsToFloat(uf_remappedVS[2].x) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt(max(intBitsToFloat(R9i.x), 0.0));
R0i.z = 0;
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[2].x))?1.0:0.0);
R4i.w = int(intBitsToFloat(R8i.w));
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(uf_remappedVS[3].y)));
R127i.y = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(min(intBitsToFloat(PV0iy), 0.0));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[2].x));
// 2
R7i.x = floatBitsToInt(intBitsToFloat(R10i.x) + intBitsToFloat(PV1iw));
PV0iy = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(PS1i));
R127i.z = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].x)) + intBitsToFloat(uf_remappedVS[5].x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R7i.z));
// 3
R0i.x = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0iy));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].y)) + intBitsToFloat(uf_remappedVS[5].y));
// 4
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R127i.z)));
PV0iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].w)) + intBitsToFloat(uf_remappedVS[5].w));
PV0iw = floatBitsToInt(fract(intBitsToFloat(PV1iy)));
// 5
backupReg0i = R127i.y;
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].x)) + intBitsToFloat(uf_remappedVS[6].x));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iw)));
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].y)) + intBitsToFloat(uf_remappedVS[6].y));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 6
R126i.x = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV1iz));
PV0iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].w)) + intBitsToFloat(uf_remappedVS[6].w));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS1i));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
// 7
R127i.x = floatBitsToInt(intBitsToFloat(R126i.x) + -(intBitsToFloat(uf_remappedVS[5].w)));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.x) + -(intBitsToFloat(uf_remappedVS[4].w)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R127i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R126i.z)));
PV0iz = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS1i));
R125i.z = floatBitsToInt(intBitsToFloat(R126i.x) + -(intBitsToFloat(uf_remappedVS[6].w)));
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV0iw)));
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].y) + intBitsToFloat(PV0iy));
R124i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].x) + intBitsToFloat(PV0ix));
R127i.w = ((intBitsToFloat(R126i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 10
backupReg0i = R127i.x;
R127i.x = ((intBitsToFloat(R125i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].x) + intBitsToFloat(PV1ix));
R126i.z = ((intBitsToFloat(backupReg0i) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].y) + intBitsToFloat(PV1iy));
PS0i = floatBitsToInt(intBitsToFloat(R126i.x) + -(intBitsToFloat(uf_remappedVS[7].w)));
// 11
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].x)) + intBitsToFloat(uf_remappedVS[7].x));
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].y)) + intBitsToFloat(uf_remappedVS[7].y));
PV1iz = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R126i.w = ((intBitsToFloat(PS0i) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS1i = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
// 12
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV1iz)));
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].w)) + intBitsToFloat(uf_remappedVS[7].w));
R125i.y = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
// 13
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].y), intBitsToFloat(R126i.w)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R125i.x)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].x), intBitsToFloat(R126i.w)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iy)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 14
backupReg0i = R127i.z;
PV0ix = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS1i));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R125i.x)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R126i.z)));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R126i.z)));
// 15
backupReg0i = R125i.z;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].x), intBitsToFloat(R125i.y)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), intBitsToFloat(R125i.y)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iy)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0ix)));
R0i.w = 0x3f800000;
// 16
R1i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w))));
PV0iy = R1i.x;
PV0iz = R1i.x;
PV0iw = R1i.x;
R125i.x = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(PV1ix));
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w))));
PV1ix = tempi.x;
R7i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.y = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(R125i.y));
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R10i.z = tempi.x;
PV0iw = tempi.x;
R125i.w = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(R125i.x));
// 19
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].x) + intBitsToFloat(R124i.w));
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].y) + intBitsToFloat(R125i.z));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(R125i.y));
PV1iw = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(R9i.y));
PS1i = floatBitsToInt(intBitsToFloat(R9i.y) + intBitsToFloat(R9i.z));
// 20
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R126i.w)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) * 0.5);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R126i.w)));
PV0iw = floatBitsToInt(intBitsToFloat(PS1i) * 0.5);
PS0i = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(R9i.z));
// 21
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(R125i.w));
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R127i.z));
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * 0.5);
R125i.w = floatBitsToInt(intBitsToFloat(PV0iy) + -(0.5));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) * 2.0);
R127i.z = floatBitsToInt(intBitsToFloat(PV0iw) + -(0.5));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 2.0);
// 22
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(PV1iz) + -(0.5));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
R3i.y = floatBitsToInt(intBitsToFloat(R9i.x) + -(0.5));
PV0iz = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(intBitsToFloat(R124i.z) + intBitsToFloat(PV1ix));
R0i.w = floatBitsToInt(intBitsToFloat(R9i.y) + -(0.5));
// 23
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(PV0iw)));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(PV0iz)));
R4i.z = floatBitsToInt(intBitsToFloat(R9i.z) + -(0.5));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(uf_remappedVS[8].x)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(uf_remappedVS[8].y)));
// 24
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[8].z)));
R4i.y = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(uf_remappedVS[9].x));
R2i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].y) + intBitsToFloat(PS1i));
PV0iw = R9i.y;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
R1i.w = R9i.z;
R1i.w = floatBitsToInt(intBitsToFloat(R1i.w) * 2.0);
// 25
R3i.x = uf_remappedVS[10].x & 0x40000;
R2i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].z) + intBitsToFloat(PV0ix));
R3i.z = uf_remappedVS[10].x & 0x20000;
R3i.w = uf_remappedVS[10].x & 0x10000;
R2i.w = floatBitsToInt(floor(intBitsToFloat(PV0iw)));
}
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R3i.w;
PV0ix = floatBitsToInt((intBitsToFloat(R2i.w) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(R2i.w))?1.0:0.0);
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(uf_remappedVS[11].z)));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(uf_remappedVS[11].y)));
PS0i = floatBitsToInt(float(backupReg0i));
// 1
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R126i.y = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iy)));
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R125i.w = floatBitsToInt(floor(intBitsToFloat(R1i.w)));
PS1i = floatBitsToInt(float(R3i.z));
// 2
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R127i.z = floatBitsToInt((intBitsToFloat(R125i.w) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iz)));
PS0i = floatBitsToInt(float(R3i.x));
// 3
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(R125i.w))?1.0:0.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R124i.z = int(intBitsToFloat(PV0iw));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1ix)));
PV0iy = 0 - R124i.z;
PV0iz = R9i.x;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
R125i.w = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(PV1iy)));
R127i.x = int(intBitsToFloat(PV1iz));
// 5
PV1ix = 0 - R127i.x;
PV1iy = max(R124i.z, PV0iy);
PV1iz = floatBitsToInt(floor(intBitsToFloat(PV0iz)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(uf_remappedVS[12].x)));
R125i.y = int(intBitsToFloat(PV0ix));
// 6
PV0ix = 0 - R125i.y;
PV0iy = floatBitsToInt((intBitsToFloat(PV1iz) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PV1iz))?1.0:0.0);
PV0iw = max(R127i.x, PV1ix);
PS0i = floatBitsToInt(float(PV1iy));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 7
R127i.x = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(R126i.y)));
PV1iz = max(R125i.y, PV0ix);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[12].y)));
PS1i = floatBitsToInt(float(PV0iw));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(R125i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PV1iy)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(uf_remappedVS[12].z)));
PS0i = floatBitsToInt(float(PV1iz));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(R127i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV0iy)));
R127i.w = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PV0iy)));
// 10
R125i.x = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R126i.w));
PV0iy = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(PS1i));
R127i.z = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(PV1iz));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV1iy)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PV1iy)));
// 11
R127i.x = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(PV0iw));
R125i.y = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(R124i.w));
R124i.z = ((intBitsToFloat(uf_remappedVS[9].w) == 1.0)?-1:0);
PV1iw = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(PS0i));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[9].w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 12
R126i.x = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R125i.w));
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].w)) + 1.0);
R3i.z = floatBitsToInt(intBitsToFloat(R8i.z) * 1.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PS1i)));
PS0i = (R4i.w == int(1))?-1:0;
// 13
R123i.x = ((PS0i == 0)?(0x3f800000):(0xbf800000));
PV1iy = (R4i.w == 0x2)?-1:0;
R123i.z = ((PS0i == 0)?(0xbf800000):(0xbf800000));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
// 14
backupReg0i = R123i.z;
PV0ix = (R4i.w == 0x3)?-1:0;
PV0iy = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
R123i.z = ((PV1iy == 0)?(R123i.x):(0xbf800000));
R123i.w = ((PV1iy == 0)?(backupReg0i):(0x3f800000));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.y));
// 15
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
R10i.y = ((PV0ix == 0)?(R123i.w):(0x3f800000));
R2i.w = ((PV0ix == 0)?(R123i.z):(0x3f800000));
// 16
R123i.y = ((R124i.z == 0)?(PV1ix):(R0i.y));
// 17
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R123i.y)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R123i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R123i.y)));
// 18
PV0iy = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(PV1iw));
PV0iz = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV1ix));
PV0iw = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(PV1iz));
// 19
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.w = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
// 20
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
// 21
R123i.x = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 22
R126i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R125i.y = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
R127i.z = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
// 23
R3i.x = floatBitsToInt(sin((intBitsToFloat(R127i.z))/0.1591549367));
// 24
R5i.y = floatBitsToInt(cos((intBitsToFloat(R127i.z))/0.1591549367));
// 25
R0i.w = floatBitsToInt(sin((intBitsToFloat(R125i.y))/0.1591549367));
// 26
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R0i.w)));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R0i.w)));
R5i.z = floatBitsToInt(cos((intBitsToFloat(R125i.y))/0.1591549367));
// 27
backupReg0i = R5i.z;
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(backupReg0i)));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(backupReg0i)));
R4i.x = floatBitsToInt(sin((intBitsToFloat(R126i.x))/0.1591549367));
// 28
R10i.x = floatBitsToInt(-(intBitsToFloat(R4i.x)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R5i.x)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R3i.y)));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R4i.z)));
R4i.y = floatBitsToInt(cos((intBitsToFloat(R126i.x))/0.1591549367));
}
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R2i.y;
R2i.x = floatBitsToInt(-(intBitsToFloat(R5i.x)) + intBitsToFloat(R4i.w));
R2i.y = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(R2i.z));
R2i.z = floatBitsToInt(-(intBitsToFloat(R4i.z)) + intBitsToFloat(backupReg0i));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R4i.y)));
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R4i.y)));
// 1
backupReg0i = R4i.y;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R1i.w)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(backupReg0i)));
PV1iz = uf_remappedVS[13].x;
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) / 2.0);
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(backupReg0i)));
PS1i = uf_remappedVS[13].y;
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 2
backupReg0i = R2i.w;
PV0ix = floatBitsToInt(intBitsToFloat(R8i.y) + intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(PV1iz));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(uf_remappedVS[14].x)) + 0.0);
R2i.w = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(PV1ix));
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(uf_remappedVS[14].x)) + 0.0);
// 3
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PV0ix)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R3i.z)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(PV0iy)));
// 4
backupReg0i = R10i.x;
R10i.x = 0x3f800000;
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R3i.z)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R3i.z)));
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R5i.x)) + intBitsToFloat(PV0iw));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R4i.w)) + intBitsToFloat(R123i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R4i.y)) + intBitsToFloat(PV0iy));
// 6
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R2i.y)) + intBitsToFloat(R123i.x));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R2i.z)) + intBitsToFloat(R123i.w));
}
if( activeMaskStackC[3] == true ) {
// 0
R125i.x = uf_remappedVS[15].y;
R127i.y = uf_remappedVS[15].x;
R124i.z = uf_remappedVS[16].y;
R125i.w = uf_remappedVS[16].x;
// 1
PV1ix = uf_remappedVS[15].z;
R125i.z = uf_remappedVS[17].x;
R127i.w = uf_remappedVS[17].y;
// 2
R126i.x = uf_remappedVS[16].z;
R126i.y = uf_remappedVS[17].z;
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV1ix)));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PV1ix)));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R126i.y)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R125i.x)) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R126i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R126i.x)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R126i.y)));
// 4
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R125i.x)) + intBitsToFloat(R127i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R127i.w)) + intBitsToFloat(PV1ix));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R124i.z)) + intBitsToFloat(PV1iz));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R124i.z)) + intBitsToFloat(PV1iw));
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R127i.w)) + intBitsToFloat(R125i.y));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(R125i.w)) + intBitsToFloat(R123i.w));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.x)),intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.y));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(R125i.z)) + intBitsToFloat(R123i.z));
R124i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.x)),intBitsToFloat(R125i.w)) + intBitsToFloat(R122i.x));
// 6
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R126i.x)));
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.x)),intBitsToFloat(R125i.z)) + intBitsToFloat(R123i.x));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R126i.y)));
R1i.w = 0x3f800000;
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R124i.z)) + intBitsToFloat(PV0iy));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iw));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R125i.x)) + intBitsToFloat(R127i.x));
// 8
backupReg0i = R123i.x;
backupReg1i = R123i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R125i.z)) + intBitsToFloat(R123i.y));
R2i.y = uf_remappedVS[18].x;
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R125i.w)) + intBitsToFloat(backupReg0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R127i.y)) + intBitsToFloat(backupReg1i));
R4i.y = uf_remappedVS[18].y;
// 9
backupReg0i = R3i.x;
backupReg1i = R123i.z;
R3i.x = uf_remappedVS[18].z;
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R126i.z)) + intBitsToFloat(R123i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R124i.w)) + intBitsToFloat(backupReg1i));
// 10
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R124i.x)) + intBitsToFloat(R123i.y));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R125i.y)) + intBitsToFloat(R123i.w));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R126i.w)) + intBitsToFloat(R123i.z));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedVS[15].x),intBitsToFloat(uf_remappedVS[15].y),intBitsToFloat(uf_remappedVS[15].z),intBitsToFloat(uf_remappedVS[15].w)),vec4(intBitsToFloat(R3i.y),intBitsToFloat(R10i.y),intBitsToFloat(R3i.z),intBitsToFloat(R10i.x))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),intBitsToFloat(uf_remappedVS[16].w)),vec4(intBitsToFloat(R3i.y),intBitsToFloat(R10i.y),intBitsToFloat(R3i.z),intBitsToFloat(R10i.x))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R11i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV1ix));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedVS[17].x),intBitsToFloat(uf_remappedVS[17].y),intBitsToFloat(uf_remappedVS[17].z),intBitsToFloat(uf_remappedVS[17].w)),vec4(intBitsToFloat(R3i.y),intBitsToFloat(R10i.y),intBitsToFloat(R3i.z),intBitsToFloat(R10i.x))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R5i.y = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(PV0ix));
// 14
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[19].x)) + intBitsToFloat(uf_remappedVS[20].x));
R2i.z = floatBitsToInt(intBitsToFloat(R10i.z) + intBitsToFloat(PV1ix));
R0i.w = 0x3f800000;
// 15
R13i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R5i.y),intBitsToFloat(R2i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w))));
PV1iy = R13i.x;
PV1iz = R13i.x;
PV1iw = R13i.x;
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R5i.y),intBitsToFloat(R2i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[22].x),intBitsToFloat(uf_remappedVS[22].y),intBitsToFloat(uf_remappedVS[22].z),intBitsToFloat(uf_remappedVS[22].w))));
PV0ix = tempi.x;
R13i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R5i.y),intBitsToFloat(R2i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[23].x),intBitsToFloat(uf_remappedVS[23].y),intBitsToFloat(uf_remappedVS[23].z),intBitsToFloat(uf_remappedVS[23].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R4i.z = tempi.x;
PV1iw = tempi.x;
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R5i.y),intBitsToFloat(R2i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[24].x),intBitsToFloat(uf_remappedVS[24].y),intBitsToFloat(uf_remappedVS[24].z),intBitsToFloat(uf_remappedVS[24].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R4i.w = tempi.x;
// 19
R124i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[19].w)) + intBitsToFloat(uf_remappedVS[20].w));
R123i.z = floatBitsToInt(intBitsToFloat(R4i.z) * 0.0 + intBitsToFloat(PV0ix));
PV1iw = PV0ix;
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) / 2.0);
// 20
R123i.x = floatBitsToInt(intBitsToFloat(R4i.z) * 0.5 + intBitsToFloat(PV1iw));
R123i.y = floatBitsToInt(intBitsToFloat(R4i.z) * 0.0 + intBitsToFloat(PV1iw));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[20].x)) + intBitsToFloat(uf_remappedVS[25].x));
R2i.w = floatBitsToInt(1.0 / intBitsToFloat(R123i.z));
// 21
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[20].w)) + intBitsToFloat(uf_remappedVS[25].w));
PV1iy = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(R2i.w));
R5i.z = floatBitsToInt(intBitsToFloat(R13i.y) * -(0.5) + intBitsToFloat(R123i.y));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R124i.x));
// 22
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(uf_remappedVS[1].w)) + -(intBitsToFloat(uf_remappedVS[1].y)));
R3i.y = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 23
R10i.x = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS0i));
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[25].x)) + intBitsToFloat(uf_remappedVS[26].x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.x));
// 24
R3i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS1i));
// 25
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R7i.y),intBitsToFloat(R10i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[23].x),intBitsToFloat(uf_remappedVS[23].y),intBitsToFloat(uf_remappedVS[23].z),intBitsToFloat(uf_remappedVS[23].w))));
PV1ix = tempi.x;
R125i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 26
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R7i.y),intBitsToFloat(R10i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[24].x),intBitsToFloat(uf_remappedVS[24].y),intBitsToFloat(uf_remappedVS[24].z),intBitsToFloat(uf_remappedVS[24].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 27
PV1ix = PV0ix;
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) / 2.0);
R123i.y = floatBitsToInt(intBitsToFloat(R125i.y) * 0.0 + intBitsToFloat(PV0ix));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[25].w)) + intBitsToFloat(uf_remappedVS[26].w));
// 28
R123i.z = floatBitsToInt(intBitsToFloat(R125i.y) * 0.5 + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R123i.y));
// 29
PV1ix = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 30
R10i.y = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS1i));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].w), intBitsToFloat(PV1ix)));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt((intBitsToFloat(uf_remappedVS[27].y) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].y)) + intBitsToFloat(R3i.z));
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[27].y))?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[27].y));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(PS0i));
R125i.y = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 2
R2i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS1i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(uf_remappedVS[2].z)) + intBitsToFloat(PV1ix));
R126i.w = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
// 3
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV1iy)));
// 5
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R126i.w)) + intBitsToFloat(PV0ix));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R3i.z) + -(intBitsToFloat(uf_remappedVS[20].w)));
PV0iy = floatBitsToInt(intBitsToFloat(R3i.z) + -(intBitsToFloat(uf_remappedVS[19].w)));
// 1
R127i.x = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.y = ((intBitsToFloat(PV0ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R10i.x)) + intBitsToFloat(uf_remappedVS[20].x));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R3i.y)) + intBitsToFloat(uf_remappedVS[19].x));
PS1i = ((intBitsToFloat(R9i.x) > 0.5)?-1:0);
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
PV0iy = floatBitsToInt(intBitsToFloat(R3i.z) + -(intBitsToFloat(uf_remappedVS[25].w)));
PV0iz = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
PV0iw = floatBitsToInt(intBitsToFloat(R3i.z) + -(intBitsToFloat(uf_remappedVS[26].w)));
R0i.w = floatBitsToInt(((PS1i == 0)?(intBitsToFloat(R8i.x)):(-(intBitsToFloat(R8i.x)))));
// 3
backupReg0i = R127i.x;
R127i.x = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.y = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iz)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R10i.y)) + intBitsToFloat(uf_remappedVS[25].x));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[19].x), intBitsToFloat(PV0ix)));
// 4
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(uf_remappedVS[28].y)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PV1iz)) + intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(uf_remappedVS[28].x)));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV0iw)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV0ix)));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(uf_remappedVS[28].z)));
R126i.w = uf_remappedVS[29].x;
R125i.z = uf_remappedVS[29].y;
// 6
PV0ix = uf_remappedVS[29].z;
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV1ix)) + intBitsToFloat(R126i.z));
R127i.z = ((intBitsToFloat(R9i.y) > 0.5)?-1:0);
PV0iw = uf_remappedVS[30].x;
R124i.x = ((intBitsToFloat(R9i.z) > 0.5)?-1:0);
// 7
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(uf_remappedVS[31].x)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(uf_remappedVS[31].y)));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedVS[31].z)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.y));
R10i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedVS[31].w)));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[26].x),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.w));
R2i.y = floatBitsToInt(((R127i.z == 0)?(intBitsToFloat(R8i.y)):(-(intBitsToFloat(R8i.y)))));
PV0iz = ((intBitsToFloat(R9i.w) > 0.5)?-1:0);
R3i.z = floatBitsToInt(((R124i.x == 0)?(intBitsToFloat(R8i.x)):(-(intBitsToFloat(R8i.x)))));
// 9
R4i.y = floatBitsToInt(((PV0iz == 0)?(intBitsToFloat(R8i.y)):(-(intBitsToFloat(R8i.y)))));
R13i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(uf_remappedVS[28].w)));
}
if( activeMaskStackC[3] == true ) {
// 0
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[32].x)));
R18i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(uf_remappedVS[32].x)));
R18i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(uf_remappedVS[32].x)));
PV0iw = uf_remappedVS[10].x & 0x80000;
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].x), intBitsToFloat(R3i.x)));
// 1
PV1ix = (PV0iw == 0x80000)?-1:0;
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].x), intBitsToFloat(R1i.y)));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].x), intBitsToFloat(R9i.z)));
PV1iw = uf_remappedVS[10].x & 0x100000;
PS1i = uf_remappedVS[10].x & 0x200000;
// 2
R125i.x = ((PV1ix == 0)?(R8i.x):(R0i.w));
PV0iy = (PV1iw == 0x100000)?-1:0;
PV0iz = uf_remappedVS[10].x & 0x400000;
PV0iw = (PS1i == 0x200000)?-1:0;
PS0i = int(intBitsToFloat(uf_remappedVS[33].z));
// 3
PV1ix = (PV0iz == 0x400000)?-1:0;
R127i.y = ((PV0iw == 0)?(R8i.x):(R3i.z));
R124i.z = ((PV0iy == 0)?(R8i.y):(R2i.y));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(uf_remappedVS[34].x)));
R126i.w = floatBitsToInt(intBitsToFloat(R126i.w) * 2.0);
R127i.z = floatBitsToInt(float(PS0i));
// 4
PV0ix = floatBitsToInt((0.0 >= abs(intBitsToFloat(R127i.z)))?1.0:0.0);
PV0iy = floatBitsToInt(-(abs(intBitsToFloat(R127i.z))) + 0.0);
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[35].z) + intBitsToFloat(uf_remappedVS[34].x));
R124i.w = ((PV1ix == 0)?(R8i.y):(R4i.y));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 5
R127i.x = ((intBitsToFloat(PV0ix) == 0.0)?(0):(PV0iy));
PV1iy = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(uf_remappedVS[34].y)));
R125i.z = floatBitsToInt(intBitsToFloat(R125i.z) * 2.0);
R126i.w = floatBitsToInt(-(intBitsToFloat(R126i.w)) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[33].z));
// 6
R124i.x = floatBitsToInt(intBitsToFloat(R125i.x) + 0.5);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[33].x), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(abs(intBitsToFloat(R127i.z)) + intBitsToFloat(R127i.x));
PV0iw = floatBitsToInt(trunc(intBitsToFloat(PV1iy)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[33].w));
// 7
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[33].y), intBitsToFloat(PS0i)));
R123i.y = ((-(intBitsToFloat(backupReg0i)) > 0.0)?(PV0iz):(backupReg0i));
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.y)),intBitsToFloat(uf_remappedVS[35].x)) + -(intBitsToFloat(R126i.w)));
R126i.w = floatBitsToInt(intBitsToFloat(R124i.z) + -(0.5));
PS1i = int(intBitsToFloat(PV0iw));
// 8
R126i.x = floatBitsToInt(intBitsToFloat(R124i.w) + -(0.5));
R126i.y = floatBitsToInt(intBitsToFloat(R127i.y) + 0.5);
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[35].w) + intBitsToFloat(uf_remappedVS[34].y));
R123i.w = ((intBitsToFloat(R127i.z) == 0.0)?(0):(R123i.y));
R127i.y = floatBitsToInt(float(PS1i));
// 9
R8i.x = floatBitsToInt(intBitsToFloat(R1i.z) + 1.0);
PV1iy = floatBitsToInt(-(intBitsToFloat(R125i.z)) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[36].y) + intBitsToFloat(uf_remappedVS[36].w));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[36].x) + intBitsToFloat(uf_remappedVS[36].z));
PS1i = int(intBitsToFloat(R123i.w));
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(uf_remappedVS[36].z)) + intBitsToFloat(PV1iw));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),intBitsToFloat(uf_remappedVS[36].w)) + intBitsToFloat(PV1iz));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(uf_remappedVS[35].y)) + intBitsToFloat(PV1iy));
PS0i = floatBitsToInt(float(PS1i));
// 11
backupReg0i = R123i.x;
backupReg1i = R123i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.x)),intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(uf_remappedVS[34].z)) + intBitsToFloat(backupReg0i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(PS0i)) + intBitsToFloat(R126i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(uf_remappedVS[34].w)) + intBitsToFloat(backupReg1i));
R126i.z = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[37].z));
// 12
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.x)),intBitsToFloat(R126i.w)) + -(intBitsToFloat(R123i.x)));
PV0iy = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R124i.x)) + intBitsToFloat(R123i.z));
PV0iw = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[37].x), intBitsToFloat(R126i.y)));
// 13
R9i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.x)),intBitsToFloat(PV0iw)) + intBitsToFloat(R123i.z));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(PV0iy)) + intBitsToFloat(R123i.x));
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[37].y)), intBitsToFloat(R126i.x)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[37].w));
// 14
R1i.x = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(R1i.x));
R0i.y = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(R7i.y));
R0i.z = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(R10i.z));
R11i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(PV1iw)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[38].x)) + intBitsToFloat(uf_remappedVS[38].y));
R14i.y = uf_remappedVS[39].x;
R126i.w = floatBitsToInt(intBitsToFloat(R2i.x) + -(intBitsToFloat(uf_remappedVS[38].x)));
// 1
R126i.x = ((intBitsToFloat(R3i.w) > intBitsToFloat(uf_remappedVS[40].y))?-1:0);
R126i.y = ((intBitsToFloat(R3i.w) > intBitsToFloat(uf_remappedVS[40].z))?-1:0);
PV1iw = ((intBitsToFloat(R3i.w) > intBitsToFloat(uf_remappedVS[40].x))?-1:0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 2
PV0ix = PV1iw & int(1);
R10i.z = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS1i));
R10i.z = clampFI32(R10i.z);
// 3
PV1iy = PV0ix - R126i.x;
// 4
PV0ix = PV1iy - R126i.y;
// 5
R0i.w = floatBitsToInt(float(PV0ix));
// 6
predResult = (intBitsToFloat(R0i.w) == 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R1i.y = R0i.y;
R1i.z = R0i.z;
R1i.w = 0x3f800000;
// 1
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[41].x),intBitsToFloat(uf_remappedVS[41].y),intBitsToFloat(uf_remappedVS[41].z),intBitsToFloat(uf_remappedVS[41].w))));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[42].x),intBitsToFloat(uf_remappedVS[42].y),intBitsToFloat(uf_remappedVS[42].z),intBitsToFloat(uf_remappedVS[42].w))));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[43].x),intBitsToFloat(uf_remappedVS[43].y),intBitsToFloat(uf_remappedVS[43].z),intBitsToFloat(uf_remappedVS[43].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[44].x),intBitsToFloat(uf_remappedVS[44].y),intBitsToFloat(uf_remappedVS[44].z),intBitsToFloat(uf_remappedVS[44].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R3i.z = tempi.x;
PV0iw = tempi.x;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
activeMaskStack[4] = activeMaskStack[3];
activeMaskStackC[5] = activeMaskStackC[4];
// 0
predResult = (intBitsToFloat(R0i.w) == 1.0);
activeMaskStack[4] = predResult;
activeMaskStackC[5] = predResult == true && activeMaskStackC[4] == true;
}
else {
activeMaskStack[4] = false;
activeMaskStackC[5] = false;
}
if( activeMaskStackC[5] == true ) {
// 0
R1i.y = R0i.y;
R1i.z = R0i.z;
R1i.w = 0x3f800000;
// 1
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[45].x),intBitsToFloat(uf_remappedVS[45].y),intBitsToFloat(uf_remappedVS[45].z),intBitsToFloat(uf_remappedVS[45].w))));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[46].x),intBitsToFloat(uf_remappedVS[46].y),intBitsToFloat(uf_remappedVS[46].z),intBitsToFloat(uf_remappedVS[46].w))));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[47].x),intBitsToFloat(uf_remappedVS[47].y),intBitsToFloat(uf_remappedVS[47].z),intBitsToFloat(uf_remappedVS[47].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[48].x),intBitsToFloat(uf_remappedVS[48].y),intBitsToFloat(uf_remappedVS[48].z),intBitsToFloat(uf_remappedVS[48].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R3i.z = tempi.x;
PV0iw = tempi.x;
}
activeMaskStack[4] = activeMaskStack[4] == false;
activeMaskStackC[5] = activeMaskStack[4] == true && activeMaskStackC[4] == true;
if( activeMaskStackC[5] == true ) {
// 0
R1i.y = R0i.y;
R1i.z = R0i.z;
R1i.w = 0x3f800000;
// 1
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[49].x),intBitsToFloat(uf_remappedVS[49].y),intBitsToFloat(uf_remappedVS[49].z),intBitsToFloat(uf_remappedVS[49].w))));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[50].x),intBitsToFloat(uf_remappedVS[50].y),intBitsToFloat(uf_remappedVS[50].z),intBitsToFloat(uf_remappedVS[50].w))));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[51].x),intBitsToFloat(uf_remappedVS[51].y),intBitsToFloat(uf_remappedVS[51].z),intBitsToFloat(uf_remappedVS[51].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[52].x),intBitsToFloat(uf_remappedVS[52].y),intBitsToFloat(uf_remappedVS[52].z),intBitsToFloat(uf_remappedVS[52].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R3i.z = tempi.x;
PV0iw = tempi.x;
}
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R2i.x = 0;
R2i.y = 0;
R8i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R7i.w = ((0.0 >= intBitsToFloat(R10i.z))?-1:0);
R126i.x = floatBitsToInt(-(intBitsToFloat(R11i.x)) + intBitsToFloat(uf_remappedVS[53].x));
// 1
R127i.x = ((R7i.w == 0)?(R13i.x):(R2i.x));
R127i.y = R4i.w;
R127i.z = ((R7i.w == 0)?(R4i.z):(R8i.z));
R127i.w = ((R7i.w == 0)?(R13i.y):(R2i.y));
R8i.y = ((R7i.w == 0)?(0):(0x3f800000));
// 2
R123i.x = ((R7i.w == 0)?(R12i.y):(R2i.y));
R123i.y = ((R7i.w == 0)?(R12i.x):(R2i.x));
R123i.z = ((R7i.w == 0)?(R12i.w):(R4i.w));
R123i.w = ((R7i.w == 0)?(R12i.z):(R8i.z));
R126i.y = floatBitsToInt(-(intBitsToFloat(R5i.y)) + intBitsToFloat(uf_remappedVS[53].y));
// 3
R12i.x = ((R8i.y == 0)?(R127i.x):(R123i.y));
R12i.y = ((R8i.y == 0)?(R127i.w):(R123i.x));
R12i.z = ((R8i.y == 0)?(R127i.z):(R123i.w));
R12i.w = ((R8i.y == 0)?(R127i.y):(R123i.z));
R127i.z = floatBitsToInt(-(intBitsToFloat(R2i.z)) + intBitsToFloat(uf_remappedVS[53].z));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R3i.z));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[54].x),intBitsToFloat(uf_remappedVS[54].y),intBitsToFloat(uf_remappedVS[54].z),intBitsToFloat(uf_remappedVS[54].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 6
backupReg0i = R127i.z;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS1i)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS1i)));
R127i.z = floatBitsToInt(intBitsToFloat(R0i.z) * intBitsToFloat(R127i.x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PS1i)));
R125i.w = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 7
R125i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[55].x),intBitsToFloat(uf_remappedVS[55].y),intBitsToFloat(uf_remappedVS[55].z),intBitsToFloat(uf_remappedVS[55].w))));
PV1iy = R125i.x;
PV1iz = R125i.x;
PV1iw = R125i.x;
R0i.x = floatBitsToInt(intBitsToFloat(R0i.x) * intBitsToFloat(R127i.x));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[56].x),intBitsToFloat(uf_remappedVS[56].y),intBitsToFloat(uf_remappedVS[56].z),intBitsToFloat(uf_remappedVS[56].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R126i.w = tempi.x;
R0i.y = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(R127i.x));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[57].x),intBitsToFloat(uf_remappedVS[57].y),intBitsToFloat(uf_remappedVS[57].z),0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R0i.z = floatBitsToInt(roundEven(intBitsToFloat(R0i.w)));
// 10
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R125i.w)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R125i.w)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(uf_remappedVS[58].x)) + -(intBitsToFloat(uf_remappedVS[58].y)));
R123i.z = clampFI32(R123i.z);
R0i.w = R127i.z;
R0i.w = clampFI32(R0i.w);
R125i.x = floatBitsToInt(intBitsToFloat(PV1ix) + 0.5);
// 11
PV1ix = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
PV1iy = floatBitsToInt(intBitsToFloat(R5i.z) * intBitsToFloat(R2i.w));
R123i.z = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
R126i.w = floatBitsToInt(-(intBitsToFloat(R125i.x)) + 1.0);
R3i.y = 0;
// 12
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[57].y) + 1.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(uf_remappedVS[59].x)) + -(intBitsToFloat(uf_remappedVS[59].y)));
R126i.y = clampFI32(R126i.y);
PV0iz = floatBitsToInt(-(intBitsToFloat(PV1iy)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R123i.z)) + intBitsToFloat(0xbe593484));
tempResultf = max(0.0, intBitsToFloat(PV1ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R126i.x = floatBitsToInt(tempResultf);
// 13
R123i.x = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3f333333) + intBitsToFloat(0x3e19999a));
R123i.x = clampFI32(R123i.x);
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) * 1.5);
PV1iy = clampFI32(PV1iy);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R123i.w)) + intBitsToFloat(0x3fc90da4));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[60].y), intBitsToFloat(R126i.x)));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(R126i.w)));
// 14
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3f22f983));
PV0iy = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
R126i.z = floatBitsToInt(intBitsToFloat(PV1iy) * 15.0);
R1i.w = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iw)));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 15
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),-(intBitsToFloat(R127i.z))) + 1.0);
R2i.y = floatBitsToInt(intBitsToFloat(PS0i) + 0.5);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) + 8.5);
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[60].x), intBitsToFloat(R126i.x)));
R4i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[57].y) * 1.0 + intBitsToFloat(R3i.w));
// 16
R3i.x = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3daaaaab));
R5i.y = floatBitsToInt(min(intBitsToFloat(uf_remappedVS[53].y), intBitsToFloat(uf_remappedVS[61].z)));
R8i.z = R6i.z;
R8i.w = R14i.y;
R1i.z = floatBitsToInt(1.0 / intBitsToFloat(R126i.z));
}
if( activeMaskStackC[3] == true ) {
R0i.w = floatBitsToInt(texture(textureUnitVS12, vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))));
R0i.z = floatBitsToInt(texture(textureUnitVS7, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y))).x);
R2i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y))).xyz);
R3i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[62].y)));
PV0iy = floatBitsToInt(-(intBitsToFloat(R0i.w)) + 1.0);
PV0iz = floatBitsToInt(-(intBitsToFloat(R7i.y)) + intBitsToFloat(R5i.y));
PV0iw = floatBitsToInt(intBitsToFloat(R4i.y) * intBitsToFloat(R1i.z));
tempResultf = max(0.0, intBitsToFloat(R1i.w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R126i.x)) + 1.0);
PV1iy = floatBitsToInt(max(intBitsToFloat(PV0iw), intBitsToFloat(0x3e4ccccd)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[59].w), intBitsToFloat(PS0i)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[61].y),intBitsToFloat(PV0iz)) + intBitsToFloat(uf_remappedVS[61].x));
R123i.w = clampFI32(R123i.w);
PS1i = floatBitsToInt(exp2(intBitsToFloat(R2i.w)));
// 2
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[60].z)),intBitsToFloat(PS1i)) + intBitsToFloat(uf_remappedVS[60].z));
R126i.x = clampFI32(R126i.x);
PV0iy = floatBitsToInt(min(intBitsToFloat(PV1iy), 1.0));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(uf_remappedVS[63].w)));
PV0iw = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + intBitsToFloat(R123i.x));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iz)));
// 3
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)),intBitsToFloat(uf_remappedVS[64].w)) + intBitsToFloat(uf_remappedVS[64].w));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV0iy)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedVS[65].z)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV0iy)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV0iy)));
// 4
PV0ix = floatBitsToInt(-(intBitsToFloat(R124i.z)) + intBitsToFloat(R126i.x));
PV0ix = clampFI32(PV0ix);
R126i.y = ((R7i.w == 0)?(0):(R125i.x));
R2i.z = ((R7i.w == 0)?(0):(R124i.z));
R126i.w = ((R7i.w == 0)?(0):(R126i.z));
R8i.x = 0;
// 5
R0i.x = R4i.x;
R0i.y = R11i.y;
R127i.z = PV0ix;
R124i.w = PV0ix;
R1i.z = R7i.z;
// 6
R126i.x = ((R7i.w == 0)?(0):(R127i.y));
R124i.y = ((R7i.w == 0)?(0):(R125i.y));
R125i.z = ((R7i.w == 0)?(0):(R127i.z));
R127i.w = ((R7i.w == 0)?(0):(R125i.w));
R127i.x = ((R7i.w == 0)?(0):(R3i.x));
// 7
R1i.x = ((R7i.w == 0)?(0):(R0i.x));
R2i.y = ((R7i.w == 0)?(0):(R124i.w));
R0i.z = ((R7i.w == 0)?(0):(R3i.z));
R2i.w = ((R7i.w == 0)?(0):(R3i.y));
R0i.w = ((R7i.w == 0)?(0):(R0i.y));
// 8
R124i.x = ((R7i.w == 0)?(0):(R9i.x));
R4i.y = ((R7i.w == 0)?(0):(R3i.w));
R1i.z = ((R7i.w == 0)?(0):(R1i.z));
R4i.w = ((R7i.w == 0)?(0):(R9i.y));
R4i.z = ((R7i.w == 0)?(0):(R14i.z));
// 9
backupReg0i = R4i.x;
R4i.x = ((R7i.w == 0)?(R6i.x):(R8i.x));
R7i.y = ((R7i.w == 0)?(0):(R0i.w));
R9i.z = R6i.z;
R9i.w = ((R7i.w == 0)?(R6i.y):(R14i.y));
R5i.y = backupReg0i;
// 10
R2i.x = ((R7i.w == 0)?(0):(R7i.x));
R0i.y = ((R7i.w == 0)?(0):(R11i.w));
R5i.z = ((R7i.w == 0)?(0):(R10i.y));
R5i.w = ((R7i.w == 0)?(0):(R11i.z));
R6i.y = ((R7i.w == 0)?(0):(R5i.x));
// 11
R0i.x = ((R7i.w == 0)?(0):(R18i.y));
R1i.y = R11i.y;
R6i.z = ((R7i.w == 0)?(0):(R10i.w));
R6i.w = ((R7i.w == 0)?(0):(R18i.z));
R1i.w = R7i.z;
// 12
R16i.x = ((R8i.y == 0)?(R125i.x):(R126i.y));
R7i.z = ((R7i.w == 0)?(0):(R13i.w));
R17i.x = ((R8i.y == 0)?(R127i.y):(R126i.x));
// 13
R15i.x = ((R8i.y == 0)?(R3i.x):(R127i.x));
R16i.y = ((R8i.y == 0)?(R126i.z):(R126i.w));
R16i.z = ((R8i.y == 0)?(R127i.z):(R125i.z));
R17i.y = ((R8i.y == 0)?(R125i.w):(R127i.w));
// 14
R14i.x = ((R8i.y == 0)?(R9i.x):(R124i.x));
R17i.z = ((R8i.y == 0)?(R125i.y):(R124i.y));
R16i.w = ((R8i.y == 0)?(R124i.z):(R2i.z));
// 15
R11i.x = ((R8i.y == 0)?(R7i.x):(R2i.x));
R15i.y = ((R8i.y == 0)?(R3i.y):(R2i.w));
R15i.z = ((R8i.y == 0)?(R3i.z):(R0i.z));
R17i.w = ((R8i.y == 0)?(R124i.w):(R2i.y));
// 16
R13i.x = ((R8i.y == 0)?(R5i.y):(R1i.x));
R15i.w = ((R8i.y == 0)?(R3i.w):(R4i.y));
// 17
R13i.y = ((R8i.y == 0)?(R1i.y):(R0i.w));
R13i.z = ((R8i.y == 0)?(R1i.w):(R1i.z));
R14i.y = ((R8i.y == 0)?(R9i.y):(R4i.w));
// 18
R14i.z = ((R8i.y == 0)?(R14i.z):(R4i.z));
R14i.w = ((R8i.y == 0)?(R11i.w):(R0i.y));
R11i.y = ((R8i.y == 0)?(R10i.y):(R5i.z));
// 19
R18i.x = ((R8i.y == 0)?(R5i.x):(R6i.y));
R18i.y = ((R8i.y == 0)?(R18i.y):(R0i.x));
R11i.z = ((R8i.y == 0)?(R11i.z):(R5i.w));
R11i.w = ((R8i.y == 0)?(R10i.w):(R6i.z));
// 20
R18i.z = ((R8i.y == 0)?(R18i.z):(R6i.w));
R18i.w = ((R8i.y == 0)?(R13i.w):(R7i.z));
R13i.w = R7i.y;
}
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(R10i.z)) + 0.0);
// 1
R123i.x = ((R7i.w == 0)?(R0i.x):(R8i.x));
// 2
R6i.x = ((R8i.y == 0)?(R123i.x):(R4i.x));
R6i.y = ((R8i.y == 0)?(R8i.w):(R9i.w));
R6i.z = ((R8i.y == 0)?(R8i.z):(R9i.z));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.z), intBitsToFloat(R6i.z));
}
