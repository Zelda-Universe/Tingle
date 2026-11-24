#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader ffee58d3a32eb80e
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[48];
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

out vec4 passParameterSem0;
out vec4 passParameterSem1;
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
attrDecoder = attrDataSem0;
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem3;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem4;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem7;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem6;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem2;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R4i.x = 0;
R13i.z = 0;
R6i.w = floatBitsToInt(-(intBitsToFloat(R4i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R9i.x = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R6i.w));
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
R11i.x = 0;
// 1
R10i.x = R9i.x;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R10i.x = R4i.x;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R10i.x == 0);
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
PS0i = int(intBitsToFloat(R3i.w));
// 1
R4i.y = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R6i.w) >= intBitsToFloat(R4i.y));
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
R11i.x = 0;
// 1
R4i.x = R9i.x;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R4i.x == 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(R6i.y));
R127i.y = uf_remappedVS[2].x & 0x20000;
PV0iz = uf_remappedVS[2].x & 0x10000;
R127i.w = uf_remappedVS[2].x & 0x40000;
PS0i = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(R6i.z));
// 1
PV1ix = R6i.y;
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
R125i.y = floatBitsToInt(intBitsToFloat(PV0ix) * 0.5);
R127i.z = R6i.z;
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 2.0);
R125i.w = floatBitsToInt(intBitsToFloat(PS0i) * 0.5);
PS1i = floatBitsToInt(float(PV0iz));
// 2
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R126i.y = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(R6i.z));
R126i.z = floatBitsToInt(floor(intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(R127i.y));
// 3
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R124i.w = floatBitsToInt(floor(intBitsToFloat(R127i.z)));
PS1i = floatBitsToInt(float(R127i.w));
// 4
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R0i.w = R6i.x;
R0i.w = floatBitsToInt(intBitsToFloat(R0i.w) * 2.0);
R127i.y = int(intBitsToFloat(PV1iy));
// 5
PV1ix = 0 - R127i.y;
R124i.y = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[3].x))?1.0:0.0);
R127i.z = floatBitsToInt((intBitsToFloat(uf_remappedVS[3].x) > 0.0)?1.0:0.0);
R127i.w = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0ix)));
R126i.w = int(intBitsToFloat(PV0iy));
// 6
backupReg0i = R126i.y;
PV0ix = 0 - R126i.w;
R126i.y = max(R127i.y, PV1ix);
R125i.z = floatBitsToInt(intBitsToFloat(backupReg0i) * 0.5);
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(uf_remappedVS[4].y)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[3].x));
// 7
backupReg0i = R127i.w;
R125i.x = floatBitsToInt(intBitsToFloat(R125i.y) + -(0.5));
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) * 2.0);
R125i.y = floatBitsToInt(intBitsToFloat(R6i.w) * intBitsToFloat(PS0i));
R124i.z = max(R126i.w, PV0ix);
R127i.w = floatBitsToInt((intBitsToFloat(R126i.z) > 0.0)?1.0:0.0);
R127i.x = int(intBitsToFloat(backupReg0i));
// 8
R126i.x = floatBitsToInt((intBitsToFloat(R124i.w) > 0.0)?1.0:0.0);
R127i.y = floatBitsToInt(intBitsToFloat(R125i.w) + -(0.5));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
PV0iz = 0 - R127i.x;
R125i.w = floatBitsToInt((0.0 > intBitsToFloat(R126i.z))?1.0:0.0);
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[5].w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 9
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(R124i.w))?1.0:0.0);
R0i.y = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(R124i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PS0i)));
R124i.w = floatBitsToInt(floor(intBitsToFloat(R0i.w)));
R124i.y = max(R127i.x, PV0iz);
// 10
backupReg0i = R126i.x;
backupReg1i = R125i.z;
R126i.x = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(R125i.y));
R125i.y = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(R125i.w)));
R125i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(PV1ix)));
R127i.w = floatBitsToInt(intBitsToFloat(backupReg1i) + -(0.5));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
R0i.z = floatBitsToInt(1.0 / intBitsToFloat(R4i.y));
// 11
PV1ix = floatBitsToInt((intBitsToFloat(R124i.w) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(R124i.w))?1.0:0.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(uf_remappedVS[6].y)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(uf_remappedVS[6].x)));
PS1i = floatBitsToInt(float(R126i.y));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 12
backupReg0i = R124i.z;
R126i.x = floatBitsToInt(fract(intBitsToFloat(R126i.x)));
R127i.y = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iy)));
R124i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].w)) + 1.0);
R125i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(R125i.y)));
PS0i = floatBitsToInt(float(backupReg0i));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 13
backupReg0i = R126i.z;
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(R125i.z)));
R125i.y = floatBitsToInt(-(intBitsToFloat(R0i.y)) + 1.0);
R126i.z = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(uf_remappedVS[5].x));
R126i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].y) + intBitsToFloat(backupReg0i));
PS1i = floatBitsToInt(exp2(intBitsToFloat(R127i.z)));
// 14
backupReg0i = R124i.y;
R12i.x = floatBitsToInt(intBitsToFloat(R6i.w) * intBitsToFloat(R0i.z));
R124i.y = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R126i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(uf_remappedVS[6].z)));
PS0i = floatBitsToInt(float(backupReg0i));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 15
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(intBitsToFloat(R6i.x) + -(0.5));
R127i.y = floatBitsToInt(intBitsToFloat(R6i.y) + -(0.5));
R125i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(backupReg0i)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.x), intBitsToFloat(R125i.y)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R124i.z));
// 16
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].z) + intBitsToFloat(R127i.w));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R125i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R125i.w)));
R127i.w = floatBitsToInt(intBitsToFloat(R124i.y) * intBitsToFloat(PS1i));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R125i.x)));
// 17
PV1ix = ((intBitsToFloat(uf_remappedVS[5].w) == 1.0)?-1:0);
R124i.y = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV0iy));
R0i.z = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(R127i.z));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R125i.x)));
R124i.w = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(PV0iz));
// 18
R125i.x = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(PV1iw));
R125i.y = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(R124i.z));
R124i.z = ((PV1ix == 0)?(R127i.w):(R6i.w));
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].w)) + intBitsToFloat(uf_remappedVS[8].w));
R126i.y = floatBitsToInt(intBitsToFloat(R6i.z) + -(0.5));
// 19
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R125i.z)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R125i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(uf_remappedVS[9].x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(uf_remappedVS[9].y)));
R0i.y = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 20
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(PV1iz));
R127i.y = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(PV1iw));
R125i.z = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(PV1ix));
R124i.w = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV1iy));
PS0i = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].y)) + intBitsToFloat(uf_remappedVS[8].y));
// 21
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].w)) + intBitsToFloat(uf_remappedVS[10].w));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R124i.z)));
R7i.z = floatBitsToInt(intBitsToFloat(R0i.z) + -(intBitsToFloat(uf_remappedVS[8].w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R124i.z)));
R125i.x = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(R0i.y));
// 22
R0i.x = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(uf_remappedVS[9].z)));
R2i.z = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV1iw));
R0i.w = floatBitsToInt(intBitsToFloat(R0i.z) + -(intBitsToFloat(uf_remappedVS[7].w)));
R3i.z = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 23
R2i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].x)) + intBitsToFloat(uf_remappedVS[8].x));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R124i.z)));
R4i.z = ((intBitsToFloat(R7i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R2i.w = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV0iy));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R125i.x)));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R2i.x) * intBitsToFloat(R0i.y));
R127i.y = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(R2i.y));
R125i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].x)) + intBitsToFloat(uf_remappedVS[10].x));
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].y)) + intBitsToFloat(uf_remappedVS[10].y));
R125i.x = ((intBitsToFloat(R0i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(R4i.z)) + 1.0);
PV1iy = floatBitsToInt(intBitsToFloat(R0i.z) + -(intBitsToFloat(uf_remappedVS[10].w)));
R124i.z = floatBitsToInt(intBitsToFloat(R0i.x) * intBitsToFloat(0x3e22f983) + 0.5);
R124i.w = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(R3i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV0ix)));
// 2
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].y) + intBitsToFloat(R3i.y));
R126i.y = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(R3i.z));
R123i.z = floatBitsToInt(intBitsToFloat(R2i.z) * intBitsToFloat(0x3e22f983) + 0.5);
R125i.w = ((intBitsToFloat(PV1iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PV1ix)));
// 3
R125i.x = floatBitsToInt(-(intBitsToFloat(R125i.x)) + 1.0);
PV1iy = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R124i.w)));
R124i.w = floatBitsToInt(fract(intBitsToFloat(R124i.z)));
R125i.y = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
// 4
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PV1iy)));
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].x) + intBitsToFloat(R127i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R126i.y)));
R123i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3e22f983) + 0.5);
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].y) + intBitsToFloat(PV1iz));
// 5
backupReg0i = R125i.y;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].y), intBitsToFloat(R125i.x)));
R125i.y = floatBitsToInt(intBitsToFloat(R124i.w) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R126i.w)));
R124i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.x = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
// 6
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].x) + intBitsToFloat(R127i.z));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R126i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R126i.w)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].x), intBitsToFloat(backupReg0i)));
// 7
R124i.x = floatBitsToInt(intBitsToFloat(R124i.w) * intBitsToFloat(0x3e22f983));
R125i.y = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(0x3e22f983));
R123i.z = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R124i.w = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PS0i));
R127i.x = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0iy));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R126i.x)));
PV0iy = floatBitsToInt(max(intBitsToFloat(R6i.x), 0.0));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].y), intBitsToFloat(R125i.w)));
R127i.w = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
R126i.w = floatBitsToInt(sin((intBitsToFloat(R125i.y))/0.1591549367));
// 9
PV1ix = floatBitsToInt(min(intBitsToFloat(PV0iy), 0.0));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(R127i.x));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].x), intBitsToFloat(R125i.w)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R124i.w));
R127i.x = floatBitsToInt(cos((intBitsToFloat(R125i.y))/0.1591549367));
// 10
R0i.x = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(PV1ix));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PV1iy)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PV1iw));
PV0iw = uf_remappedVS[11].y;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
R127i.z = floatBitsToInt(sin((intBitsToFloat(R124i.x))/0.1591549367));
// 11
R7i.x = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(PV0iw));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R127i.z)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R127i.z)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV0iz)));
R126i.y = floatBitsToInt(cos((intBitsToFloat(R124i.x))/0.1591549367));
// 12
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R126i.y)));
PV0iy = uf_remappedVS[11].x;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
R124i.z = floatBitsToInt(intBitsToFloat(R5i.z) * 1.0);
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R126i.y)));
R10i.w = floatBitsToInt(sin((intBitsToFloat(R127i.w))/0.1591549367));
// 13
backupReg0i = R127i.w;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(R125i.z)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(R125i.y)));
R4i.z = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV0iy));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(R124i.x)));
R126i.x = floatBitsToInt(cos((intBitsToFloat(backupReg0i))/0.1591549367));
// 14
R4i.x = floatBitsToInt(intBitsToFloat(R124i.x) + intBitsToFloat(PV1ix));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(R125i.w)));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R126i.x)));
R8i.w = floatBitsToInt(-(intBitsToFloat(R125i.w)) + intBitsToFloat(PV1iy));
R3i.y = floatBitsToInt(-(intBitsToFloat(R10i.w)));
// 15
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R126i.x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R124i.z)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(R124i.z)));
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R126i.x)));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R124i.z)));
// 16
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R126i.x)));
R2i.y = 0x3f800000;
R0i.z = floatBitsToInt(-(intBitsToFloat(R125i.y)) + intBitsToFloat(R127i.y));
R9i.w = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(R127i.w));
R11i.w = 0x3f800000;
// 17
R0i.x = floatBitsToInt(intBitsToFloat(R6i.y) + 1.0);
PV1iy = ((intBitsToFloat(R6i.w) == 0.0)?-1:0);
R7i.z = floatBitsToInt(intBitsToFloat(R6i.z) + 1.0);
R2i.w = floatBitsToInt(intBitsToFloat(R6i.x) + 1.0);
PS1i = int(intBitsToFloat(R5i.w));
// 18
R126i.x = (PS1i == 0x2)?-1:0;
R127i.y = (PS1i == 0x3)?-1:0;
PV0iz = (PS1i == int(1))?-1:0;
R4i.w = ((PV1iy == 0)?(R6i.w):(0x3f800000));
// 19
R123i.y = ((PV0iz == 0)?(0xbf800000):(0xbf800000));
R123i.w = ((PV0iz == 0)?(0x3f800000):(0xbf800000));
// 20
backupReg0i = R123i.y;
R123i.y = ((R126i.x == 0)?(R123i.w):(0xbf800000));
R123i.z = ((R126i.x == 0)?(backupReg0i):(0x3f800000));
// 21
R2i.x = ((R127i.y == 0)?(R123i.z):(0x3f800000));
R3i.z = ((R127i.y == 0)?(R123i.y):(0x3f800000));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(uf_remappedVS[12].z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[12].y)));
// 1
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(uf_remappedVS[13].x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(R4i.z)));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[13].x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R7i.x)));
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(uf_remappedVS[13].x)));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(R3i.x)) + intBitsToFloat(R3i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(R7i.w)) + intBitsToFloat(R2i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(R3i.y)) + intBitsToFloat(R0i.y));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(uf_remappedVS[14].w)));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(uf_remappedVS[15].x)) + 0.0);
// 3
backupReg0i = R2i.x;
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R8i.x)) + intBitsToFloat(R123i.z));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R9i.w)) + intBitsToFloat(R123i.y));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R0i.z)) + intBitsToFloat(R123i.x));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(uf_remappedVS[15].x)) + 0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 4
R10i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),intBitsToFloat(uf_remappedVS[16].w))));
PV0iy = R10i.x;
PV0iz = R10i.x;
PV0iw = R10i.x;
R4i.y = floatBitsToInt(intBitsToFloat(R4i.w) * intBitsToFloat(PS1i));
R4i.y = clampFI32(R4i.y);
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(uf_remappedVS[17].x),intBitsToFloat(uf_remappedVS[17].y),intBitsToFloat(uf_remappedVS[17].z),intBitsToFloat(uf_remappedVS[17].w))));
PV1ix = tempi.x;
R12i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(uf_remappedVS[18].x),intBitsToFloat(uf_remappedVS[18].y),intBitsToFloat(uf_remappedVS[18].z),intBitsToFloat(uf_remappedVS[18].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R1i.z = tempi.x;
PV0iw = tempi.x;
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedVS[19].x),intBitsToFloat(uf_remappedVS[19].y),intBitsToFloat(uf_remappedVS[19].z),intBitsToFloat(uf_remappedVS[19].w)),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R0i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.y))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.y = uf_remappedVS[19].z;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w)),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R0i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.y))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R1i.x = floatBitsToInt(intBitsToFloat(R10i.x) + intBitsToFloat(PV0ix));
// 2
R127i.x = uf_remappedVS[21].z;
R7i.y = floatBitsToInt(intBitsToFloat(R12i.y) + intBitsToFloat(PV1ix));
R125i.z = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(R0i.x));
R127i.w = uf_remappedVS[20].z;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.y)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w)),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R0i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.y))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(R4i.z));
// 4
R126i.x = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PS1i));
R124i.y = uf_remappedVS[20].y;
R4i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV1ix));
R124i.w = uf_remappedVS[19].y;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.w)));
// 5
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.x)));
R0i.y = uf_remappedVS[19].x;
R124i.z = uf_remappedVS[21].y;
PV1iw = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(R7i.x));
R2i.y = uf_remappedVS[21].x;
// 6
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R127i.w)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R127i.x)));
R2i.z = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(backupReg0i));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R127i.y)));
R127i.z = uf_remappedVS[20].x;
// 7
backupReg0i = R127i.y;
backupReg1i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(R124i.w)) + intBitsToFloat(R126i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R127i.w)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(backupReg0i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(backupReg1i)));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(R124i.z)) + intBitsToFloat(R124i.x));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),intBitsToFloat(R124i.z)) + intBitsToFloat(R125i.y));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(R124i.y)) + intBitsToFloat(R126i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),intBitsToFloat(R124i.y)) + intBitsToFloat(R126i.x));
// 9
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),intBitsToFloat(R124i.w)) + intBitsToFloat(R125i.w));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z),intBitsToFloat(R2i.y)) + intBitsToFloat(R123i.x));
// 10
backupReg0i = R127i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w),intBitsToFloat(R124i.w)) + intBitsToFloat(R125i.z));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w),intBitsToFloat(R124i.z)) + intBitsToFloat(R127i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w),intBitsToFloat(R124i.y)) + intBitsToFloat(backupReg0i));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z),intBitsToFloat(R0i.y)) + intBitsToFloat(R123i.y));
// 11
backupReg0i = R123i.x;
backupReg1i = R123i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R10i.w)),intBitsToFloat(R0i.y)) + intBitsToFloat(R127i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R10i.w)),intBitsToFloat(R2i.y)) + intBitsToFloat(R4i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R10i.w)),intBitsToFloat(R127i.z)) + intBitsToFloat(R125i.y));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R0i.y)) + intBitsToFloat(backupReg0i));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R127i.z)) + intBitsToFloat(backupReg1i));
// 12
backupReg0i = R123i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(R123i.x)) + intBitsToFloat(R125i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R2i.y)) + intBitsToFloat(R127i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(R123i.z)) + intBitsToFloat(R126i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(backupReg0i)) + intBitsToFloat(R125i.w));
// 13
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.x));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.z));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R123i.y)) + intBitsToFloat(R123i.w));
// 14
predResult = (intBitsToFloat(uf_remappedVS[22].y) != 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = uf_remappedVS[17].w;
PV0iz = uf_remappedVS[16].w;
// 1
R127i.x = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(R1i.x)));
R127i.y = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(R7i.y)));
PV1iw = uf_remappedVS[18].w;
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[22].y));
// 2
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(R4i.z)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(R127i.z));
PV1ix = clampFI32(PV1ix);
// 6
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(PV1ix)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R2i.x = floatBitsToInt(intBitsToFloat(R6i.w) * 100.0);
R2i.x = clampFI32(R2i.x);
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[16].w) + intBitsToFloat(uf_remappedVS[17].w));
R0i.z = 0;
R0i.w = 0x3f800000;
R3i.w = 0x3f800000;
// 1
R3i.x = 0;
R0i.y = 0;
PV1iz = ((intBitsToFloat(R6i.x) > 0.5)?-1:0);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[15].w), intBitsToFloat(uf_remappedVS[14].z)));
PS1i = ((intBitsToFloat(R6i.y) > 0.5)?-1:0);
// 2
backupReg0i = R127i.y;
R8i.x = floatBitsToInt(((PV1iz == 0)?(intBitsToFloat(R5i.x)):(-(intBitsToFloat(R5i.x)))));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[15].w), intBitsToFloat(R2i.z)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[18].w) + intBitsToFloat(backupReg0i));
R2i.z = floatBitsToInt(((PS1i == 0)?(intBitsToFloat(R5i.y)):(-(intBitsToFloat(R5i.y)))));
// 3
R127i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3dd70a3d));
R126i.y = floatBitsToInt(fract(intBitsToFloat(R1i.w)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), intBitsToFloat(uf_remappedVS[14].x)));
R1i.w = R13i.x;
// 4
R7i.x = R1i.y;
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R127i.z));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[15].z), intBitsToFloat(uf_remappedVS[14].y)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R127i.y));
R3i.y = R1i.y;
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0iy));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[15].z), intBitsToFloat(R4i.y)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[23].x)));
// 6
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[22].z), intBitsToFloat(R126i.y)));
R123i.y = floatBitsToInt(intBitsToFloat(PS1i) * 0.25 + 0.5);
R123i.y = clampFI32(R123i.y);
R123i.z = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.w = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
R3i.z = R5i.z;
// 7
PV1ix = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R2i.w = R5i.z;
// 8
PV0ix = floatBitsToInt(intBitsToFloat(PV1ix) + 8.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.w = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 9
R127i.x = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R126i.y = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R0i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3daaaaab));
// 10
PS0i = floatBitsToInt(sin((intBitsToFloat(R127i.x))/0.1591549367));
// 11
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R127i.z)));
PS1i = floatBitsToInt(cos((intBitsToFloat(R127i.x))/0.1591549367));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS1i)));
R1i.y = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV1iw));
PS0i = floatBitsToInt(sin((intBitsToFloat(R126i.y))/0.1591549367));
// 13
R1i.x = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R127i.w)));
// 14
R2i.y = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(PV1iz));
}
if( activeMaskStackC[3] == true ) {
R4i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.y),intBitsToFloat(R2i.y),intBitsToFloat(R1i.x),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[24].x),intBitsToFloat(uf_remappedVS[24].y),intBitsToFloat(uf_remappedVS[24].z),intBitsToFloat(uf_remappedVS[24].w))));
PV0iy = R127i.x;
PV0iz = R127i.x;
PV0iw = R127i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.y),intBitsToFloat(R2i.y),intBitsToFloat(R1i.x),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[25].x),intBitsToFloat(uf_remappedVS[25].y),intBitsToFloat(uf_remappedVS[25].z),intBitsToFloat(uf_remappedVS[25].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R126i.z = tempi.x;
PV1iw = tempi.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R2i.x)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R12i.y),intBitsToFloat(R1i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[24].x),intBitsToFloat(uf_remappedVS[24].y),intBitsToFloat(uf_remappedVS[24].z),intBitsToFloat(uf_remappedVS[24].w))));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.y = PV1ix;
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) / 2.0);
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R12i.y),intBitsToFloat(R1i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[25].x),intBitsToFloat(uf_remappedVS[25].y),intBitsToFloat(uf_remappedVS[25].z),intBitsToFloat(uf_remappedVS[25].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 0.0 + intBitsToFloat(R126i.z));
// 4
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[26].x)) + intBitsToFloat(uf_remappedVS[26].y));
R123i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 0.0 + intBitsToFloat(PV1ix));
R125i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
PV0iw = PV1ix;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
R127i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * 0.5 + intBitsToFloat(R126i.y));
// 5
backupReg0i = R127i.y;
R124i.x = floatBitsToInt(-(intBitsToFloat(R1i.y)) + intBitsToFloat(uf_remappedVS[27].x));
R127i.y = floatBitsToInt(-(intBitsToFloat(R2i.y)) + intBitsToFloat(uf_remappedVS[27].y));
R123i.z = floatBitsToInt(intBitsToFloat(backupReg0i) * 0.5 + intBitsToFloat(PV0iw));
R125i.w = floatBitsToInt(-(intBitsToFloat(R1i.x)) + intBitsToFloat(uf_remappedVS[27].z));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.y));
// 6
R10i.x = uf_remappedVS[28].y;
R9i.y = uf_remappedVS[28].x;
R7i.z = uf_remappedVS[28].z;
PV0iw = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(PS1i));
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(R125i.w));
R8i.y = uf_remappedVS[29].x;
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].w), intBitsToFloat(PV0iw)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 8
R126i.x = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].y)) + intBitsToFloat(PV1iz));
R8i.z = uf_remappedVS[30].x;
R127i.x = floatBitsToInt((intBitsToFloat(R127i.y) * intBitsToFloat(R127i.y) + intBitsToFloat(PV1ix)));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.y),intBitsToFloat(R2i.y),intBitsToFloat(R1i.x),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[31].x),intBitsToFloat(uf_remappedVS[31].y),intBitsToFloat(uf_remappedVS[31].z),intBitsToFloat(uf_remappedVS[31].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(uf_remappedVS[1].w)) + -(intBitsToFloat(uf_remappedVS[1].y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R2i.x)));
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS1i));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(uf_remappedVS[26].x)));
R123i.y = floatBitsToInt((intBitsToFloat(R124i.x) * intBitsToFloat(R124i.x) + intBitsToFloat(R127i.x)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.x));
// 12
R0i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS1i));
R9i.z = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(R126i.w));
R9i.z = clampFI32(R9i.z);
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.y));
R126i.w = floatBitsToInt(tempResultf);
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.y),intBitsToFloat(R2i.y),intBitsToFloat(R1i.x),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[32].x),intBitsToFloat(uf_remappedVS[32].y),intBitsToFloat(uf_remappedVS[32].z),intBitsToFloat(uf_remappedVS[32].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R1i.x = ((0.0 >= intBitsToFloat(R9i.z))?-1:0);
// 14
R125i.x = ((R1i.x == 0)?(R125i.x):(R125i.z));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R2i.x)));
R10i.z = ((R1i.x == 0)?(0):(0x3f800000));
R123i.w = ((R1i.x == 0)?(R127i.z):(R0i.z));
R122i.x = ((R1i.x == 0)?(R14i.x):(R0i.z));
// 15
R127i.x = R126i.z;
R123i.y = ((R1i.x == 0)?(R14i.y):(R3i.x));
R123i.z = ((R1i.x == 0)?(PV0iy):(R3i.x));
R127i.w = ((R1i.x == 0)?(R14i.w):(R126i.z));
R14i.x = ((R10i.z == 0)?(R123i.w):(R122i.x));
// 16
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R126i.w)));
R14i.y = ((R10i.z == 0)?(R123i.z):(R123i.y));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R126i.w)));
R123i.w = ((R1i.x == 0)?(R14i.z):(R125i.z));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R126i.w)));
// 17
backupReg0i = R127i.x;
R127i.x = ((R1i.x == 0)?(0):(R4i.y));
R10i.y = R11i.z;
R14i.z = ((R10i.z == 0)?(R125i.x):(R123i.w));
R14i.w = ((R10i.z == 0)?(backupReg0i):(R127i.w));
R125i.x = ((R1i.x == 0)?(0):(R4i.w));
// 18
R2i.x = ((R1i.x == 0)?(0):(R9i.x));
R127i.y = ((R1i.x == 0)?(0):(R4i.z));
R125i.z = ((R1i.x == 0)?(0):(R3i.y));
R126i.w = ((R1i.x == 0)?(0):(R3i.z));
R124i.x = ((R1i.x == 0)?(0):(R13i.w));
// 19
R7i.y = ((R1i.x == 0)?(0):(R13i.z));
R127i.w = ((R1i.x == 0)?(0):(R4i.x));
// 20
R11i.z = R11i.z;
R123i.w = ((R1i.x == 0)?(0):(R13i.x));
// 21
R15i.x = ((R10i.z == 0)?(R4i.x):(R127i.w));
R15i.y = ((R10i.z == 0)?(R4i.y):(R127i.x));
R15i.z = ((R10i.z == 0)?(R4i.z):(R127i.y));
R15i.w = ((R10i.z == 0)?(R4i.w):(R125i.x));
R16i.x = ((R10i.z == 0)?(R1i.w):(R123i.w));
// 22
R16i.y = ((R10i.z == 0)?(R7i.x):(R125i.z));
R16i.z = ((R10i.z == 0)?(R2i.w):(R126i.w));
R16i.w = R124i.x;
R0i.y = uf_remappedVS[27].y;
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R0i.z),intBitsToFloat(R1i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[33].x),intBitsToFloat(uf_remappedVS[33].y),intBitsToFloat(uf_remappedVS[33].z),0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R124i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[33].y) + 1.0);
// 1
R127i.x = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[34].x))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(uf_remappedVS[34].x) > 0.0)?1.0:0.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(uf_remappedVS[35].x)) + -(intBitsToFloat(uf_remappedVS[35].y)));
R123i.w = clampFI32(R123i.w);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[34].x));
// 2
R123i.x = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
R127i.y = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
PV0iz = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
PV0iw = floatBitsToInt(intBitsToFloat(R6i.w) * intBitsToFloat(PS1i));
R125i.x = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iy)));
// 3
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(uf_remappedVS[3].y)) + intBitsToFloat(PV0iw));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(backupReg0i)) + intBitsToFloat(0xbe593484));
R125i.z = floatBitsToInt(intBitsToFloat(R124i.x) * 1.5);
R125i.z = clampFI32(R125i.z);
R127i.w = floatBitsToInt(-(intBitsToFloat(R125i.x)) + 1.0);
tempResultf = max(0.0, intBitsToFloat(PV0iz));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R2i.y = floatBitsToInt(tempResultf);
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].y), intBitsToFloat(R2i.y)));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
R126i.z = uf_remappedVS[2].x & 0x80000;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R123i.y)) + intBitsToFloat(0x3fc90da4));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(R127i.y)));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PV0iy)));
R4i.y = uf_remappedVS[2].x & 0x100000;
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f22f983));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(uf_remappedVS[37].x)) + -(intBitsToFloat(uf_remappedVS[37].y)));
R2i.w = clampFI32(R2i.w);
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 6
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),-(intBitsToFloat(R126i.w))) + 1.0);
R6i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.x),intBitsToFloat(R127i.w)) + intBitsToFloat(PV1ix));
R1i.w = floatBitsToInt(intBitsToFloat(R125i.z) * 15.0);
R1i.y = (R126i.z == 0x80000)?-1:0;
}
if( activeMaskStackC[3] == true ) {
R3i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y))).xyz);
}
if( activeMaskStackC[3] == true ) {
// 0
R125i.x = floatBitsToInt(intBitsToFloat(R6i.z) + -(intBitsToFloat(uf_remappedVS[38].w)));
PV0iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[38].w)) + intBitsToFloat(uf_remappedVS[39].w));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[38].z)) + intBitsToFloat(uf_remappedVS[39].z));
PV0iw = floatBitsToInt(intBitsToFloat(R6i.z) + -(intBitsToFloat(uf_remappedVS[39].w)));
R124i.x = (R4i.y == 0x100000)?-1:0;
// 1
R127i.x = ((intBitsToFloat(R125i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.y = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[38].y)) + intBitsToFloat(uf_remappedVS[39].y));
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[38].x)) + intBitsToFloat(uf_remappedVS[39].x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
R127i.w = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
// 3
backupReg0i = R127i.w;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV0iw)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(PV0ix)) + intBitsToFloat(uf_remappedVS[38].z));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(PV0iy)) + intBitsToFloat(uf_remappedVS[38].y));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(PV0iz)) + intBitsToFloat(uf_remappedVS[38].x));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].x), intBitsToFloat(backupReg0i)));
// 4
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].z), intBitsToFloat(R127i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].y), intBitsToFloat(R127i.w)));
R127i.z = floatBitsToInt(-(intBitsToFloat(R2i.w)) + 1.0);
R127i.w = ((R1i.y == 0)?(R5i.x):(R8i.x));
R126i.x = floatBitsToInt(1.0 / intBitsToFloat(R1i.w));
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R127i.x)) + intBitsToFloat(R126i.z));
R125i.y = ((R124i.x == 0)?(R5i.y):(R2i.z));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].x), intBitsToFloat(R2i.y)));
R123i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[33].y) * 1.0 + intBitsToFloat(R0i.x));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R127i.x)) + intBitsToFloat(PV0iy));
// 6
backupReg0i = R127i.z;
PV0ix = floatBitsToInt(min(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[40].z)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R127i.x)) + intBitsToFloat(R125i.x));
R127i.z = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(R126i.x));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].x),intBitsToFloat(R126i.y)) + intBitsToFloat(R123i.x));
tempResultf = max(0.0, intBitsToFloat(backupReg0i));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R127i.x = floatBitsToInt(tempResultf);
// 7
backupReg0i = R126i.y;
R126i.x = floatBitsToInt(intBitsToFloat(R127i.w) + 0.5);
R126i.y = floatBitsToInt(-(intBitsToFloat(R12i.y)) + intBitsToFloat(PV0ix));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].z),intBitsToFloat(backupReg0i)) + intBitsToFloat(R123i.y));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].y),intBitsToFloat(backupReg0i)) + intBitsToFloat(R125i.z));
PS1i = floatBitsToInt(exp2(intBitsToFloat(R126i.z)));
// 8
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[37].w), intBitsToFloat(R127i.x)));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[36].z)),intBitsToFloat(PS1i)) + intBitsToFloat(uf_remappedVS[36].z));
R123i.y = clampFI32(R123i.y);
PV0iz = floatBitsToInt(max(intBitsToFloat(R127i.z), intBitsToFloat(0x3e4ccccd)));
PV0iw = floatBitsToInt(intBitsToFloat(R125i.y) + -(0.5));
// 9
PV1ix = floatBitsToInt(min(intBitsToFloat(PV0iz), 1.0));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[41].x), intBitsToFloat(R126i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[41].y)), intBitsToFloat(PV0iw)));
R126i.w = floatBitsToInt(-(intBitsToFloat(R9i.x)) + intBitsToFloat(R123i.y));
R126i.w = clampFI32(R126i.w);
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[41].z));
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].y),intBitsToFloat(R126i.y)) + intBitsToFloat(uf_remappedVS[40].x));
R123i.x = clampFI32(R123i.x);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PV1ix)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(PV1ix)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[41].w));
// 11
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R125i.y)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R127i.z)));
R127i.z = R126i.w;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(uf_remappedVS[42].w)));
PS1i = floatBitsToInt(exp2(intBitsToFloat(R127i.x)));
// 12
R127i.x = ((R1i.x == 0)?(0):(R127i.w));
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)),intBitsToFloat(uf_remappedVS[43].w)) + intBitsToFloat(uf_remappedVS[43].w));
R124i.z = R126i.w;
R126i.w = ((R1i.x == 0)?(0):(R127i.z));
R125i.w = ((R1i.x == 0)?(0):(R126i.y));
// 13
R126i.x = ((R1i.x == 0)?(0):(R124i.z));
R127i.y = ((R1i.x == 0)?(0):(R124i.w));
R125i.z = ((R1i.x == 0)?(0):(R126i.z));
R123i.w = ((R1i.x == 0)?(0):(R125i.y));
R5i.w = ((R1i.x == 0)?(0):(R0i.x));
// 14
backupReg0i = R127i.z;
R12i.x = ((R10i.z == 0)?(R125i.y):(R123i.w));
R12i.y = ((R10i.z == 0)?(R127i.w):(R127i.x));
R127i.z = ((R1i.x == 0)?(0):(R0i.y));
R12i.z = ((R10i.z == 0)?(backupReg0i):(R126i.w));
// 15
R17i.x = ((R10i.z == 0)?(R126i.y):(R125i.w));
R17i.y = ((R10i.z == 0)?(R126i.z):(R125i.z));
R17i.z = ((R10i.z == 0)?(R124i.w):(R127i.y));
R12i.w = ((R10i.z == 0)?(R9i.x):(R2i.x));
// 16
R3i.x = ((R10i.z == 0)?(R0i.x):(R5i.w));
R3i.y = ((R10i.z == 0)?(R0i.y):(R127i.z));
R17i.w = ((R10i.z == 0)?(R124i.z):(R126i.x));
// 17
R3i.z = ((R10i.z == 0)?(R13i.z):(R7i.y));
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(uf_remappedVS[44].x)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(uf_remappedVS[44].w)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(uf_remappedVS[44].z)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(uf_remappedVS[44].y)));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(uf_remappedVS[45].y)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(uf_remappedVS[45].x)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(uf_remappedVS[45].w)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(uf_remappedVS[45].z)));
R125i.z = ((R1i.x == 0)?(0):(R125i.y));
// 2
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(uf_remappedVS[46].x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[46].x), intBitsToFloat(PV1iy)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(uf_remappedVS[46].x)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(uf_remappedVS[46].x)));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[46].x), intBitsToFloat(PV1ix)));
// 3
R127i.x = ((R1i.x == 0)?(0):(R126i.x));
R123i.y = ((R1i.x == 0)?(0):(R127i.y));
R127i.z = ((R1i.x == 0)?(0):(R124i.z));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[46].x), intBitsToFloat(R124i.w)));
R126i.y = ((R1i.x == 0)?(0):(R125i.x));
// 4
backupReg0i = R127i.y;
R124i.x = ((R1i.x == 0)?(0):(R125i.w));
R127i.y = ((R1i.x == 0)?(0):(R126i.z));
R123i.w = ((R1i.x == 0)?(0):(R124i.w));
R8i.x = ((R10i.z == 0)?(backupReg0i):(R123i.y));
// 5
R8i.y = ((R10i.z == 0)?(R126i.x):(R127i.x));
R8i.z = ((R10i.z == 0)?(R124i.w):(R123i.w));
R8i.w = ((R10i.z == 0)?(R124i.z):(R127i.z));
R0i.x = ((R10i.z == 0)?(R125i.x):(R126i.y));
// 6
R0i.y = ((R10i.z == 0)?(R125i.w):(R124i.x));
R0i.z = ((R10i.z == 0)?(R126i.z):(R127i.y));
R0i.w = ((R10i.z == 0)?(R125i.y):(R125i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(R9i.z)) + 0.0);
R1i.y = uf_remappedVS[47].x;
R4i.x = 0;
// 1
R123i.x = ((R1i.x == 0)?(R11i.x):(R4i.x));
R123i.y = ((R1i.x == 0)?(R11i.y):(R1i.y));
R123i.z = ((R1i.x == 0)?(R1i.y):(R1i.y));
R123i.w = ((R1i.x == 0)?(R2i.x):(R4i.x));
// 2
R11i.x = ((R10i.z == 0)?(R123i.w):(R123i.x));
R11i.y = ((R10i.z == 0)?(R123i.z):(R123i.y));
R11i.z = ((R10i.z == 0)?(R10i.y):(R11i.z));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R8i.x), intBitsToFloat(R8i.y), intBitsToFloat(R8i.z), intBitsToFloat(R8i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.z));
// export
passParameterSem8 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.z));
}
