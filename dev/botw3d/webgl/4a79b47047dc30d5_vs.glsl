#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 4a79b47047dc30d5
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[56];
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
out vec4 passParameterSem3;
out vec4 passParameterSem8;
out vec4 passParameterSem10;
out vec4 passParameterSem11;
out vec4 passParameterSem13;
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
R16i.y = floatBitsToInt(-(intBitsToFloat(R4i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R3i.z = 0;
R4i.z = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R16i.y));
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
R7i.z = R4i.z;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R7i.z = R3i.z;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R7i.z == 0);
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
R16i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R16i.y) >= intBitsToFloat(R16i.z));
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
R3i.z = R4i.z;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R3i.z == 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = uf_remappedVS[2].x & 0x10000;
R127i.y = uf_remappedVS[2].x & 0x40000;
R127i.z = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(R6i.y));
R127i.w = uf_remappedVS[2].x & 0x20000;
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[3].x));
// 1
R127i.x = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(R6i.z));
R125i.y = R6i.z;
R125i.y = floatBitsToInt(intBitsToFloat(R125i.y) * 2.0);
R126i.z = R6i.y;
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) * 2.0);
R126i.w = floatBitsToInt((intBitsToFloat(uf_remappedVS[3].x) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(float(PV0ix));
// 2
backupReg0i = R127i.w;
R126i.x = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[3].x))?1.0:0.0);
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(uf_remappedVS[4].y)));
PS0i = floatBitsToInt(float(backupReg0i));
// 3
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R125i.w = floatBitsToInt(intBitsToFloat(R16i.y) * intBitsToFloat(R126i.y));
PS1i = floatBitsToInt(float(R127i.y));
// 4
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R125i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 0.5);
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1ix)));
R124i.w = int(intBitsToFloat(PV1iy));
// 5
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(R6i.z));
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iy)));
R127i.z = 0 - R124i.w;
R0i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * 0.5);
R127i.y = int(intBitsToFloat(PV0iw));
// 6
backupReg0i = R125i.y;
R125i.x = floatBitsToInt(floor(intBitsToFloat(R126i.z)));
R125i.y = R6i.x;
R125i.y = floatBitsToInt(intBitsToFloat(R125i.y) * 2.0);
PV0iz = 0 - R127i.y;
R2i.w = floatBitsToInt(floor(intBitsToFloat(backupReg0i)));
R124i.z = int(intBitsToFloat(PV1iy));
// 7
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R125i.w));
R124i.y = max(R127i.y, PV0iz);
R0i.z = floatBitsToInt(intBitsToFloat(R126i.w) + -(intBitsToFloat(R126i.x)));
R127i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * 0.5);
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[5].w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R126i.z = floatBitsToInt(tempResultf);
// 8
R126i.x = floatBitsToInt(intBitsToFloat(R125i.z) + -(0.5));
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) * 2.0);
R127i.y = floatBitsToInt((intBitsToFloat(R125i.x) > 0.0)?1.0:0.0);
R127i.z = max(R124i.w, R127i.z);
R124i.w = floatBitsToInt(intBitsToFloat(R0i.w) + -(0.5));
R124i.w = floatBitsToInt(intBitsToFloat(R124i.w) * 2.0);
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(R16i.z));
// 9
PV1ix = 0 - R124i.z;
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(R125i.x))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(R2i.w) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(R2i.w))?1.0:0.0);
R125i.y = floatBitsToInt(floor(intBitsToFloat(R125i.y)));
// 10
backupReg0i = R127i.y;
backupReg1i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y), intBitsToFloat(R126i.z)));
R127i.y = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iw)));
R126i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(PV1iy)));
R125i.w = max(R124i.z, PV1ix);
R126i.w = floatBitsToInt(fract(intBitsToFloat(backupReg1i)));
// 11
R11i.x = floatBitsToInt(intBitsToFloat(R16i.y) * intBitsToFloat(R126i.y));
R126i.y = floatBitsToInt(intBitsToFloat(R127i.w) + -(0.5));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) * 2.0);
PV1iz = floatBitsToInt(-(intBitsToFloat(R0i.z)) + 1.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(uf_remappedVS[6].x)));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(uf_remappedVS[6].y)));
// 12
backupReg0i = R125i.y;
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(backupReg0i))?1.0:0.0);
R125i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].w)) + 1.0);
PV0iz = floatBitsToInt((intBitsToFloat(backupReg0i) > 0.0)?1.0:0.0);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(PV1iz)));
PS0i = floatBitsToInt(float(R127i.z));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 13
backupReg0i = R124i.y;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R126i.w)));
R124i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(R126i.z)));
R124i.z = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(uf_remappedVS[5].x));
R127i.w = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(float(backupReg0i));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 14
backupReg0i = R127i.y;
R10i.x = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(PV1ix));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(uf_remappedVS[6].z)));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(backupReg0i)));
R124i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].y) + intBitsToFloat(R126i.x));
PS0i = floatBitsToInt(exp2(intBitsToFloat(R127i.x)));
// 15
backupReg0i = R125i.w;
R126i.x = floatBitsToInt(intBitsToFloat(R6i.x) + -(0.5));
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].w)) + intBitsToFloat(uf_remappedVS[8].w));
R126i.z = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R125i.w = floatBitsToInt(intBitsToFloat(R6i.y) + -(0.5));
PS1i = floatBitsToInt(float(backupReg0i));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 16
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(R127i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R124i.y)));
R125i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].z) + intBitsToFloat(R127i.y));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R124i.y)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R125i.y));
// 17
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R127i.z)));
PV1iy = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS0i));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R127i.z)));
PV1iw = ((intBitsToFloat(uf_remappedVS[5].w) == 1.0)?-1:0);
R125i.x = floatBitsToInt(intBitsToFloat(R124i.z) + intBitsToFloat(PV0iy));
// 18
R8i.x = ((PV1iw == 0)?(PV1iy):(R16i.y));
R127i.y = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(R127i.w));
R127i.z = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(PV1iz));
R126i.w = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(PV1ix));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].y)) + intBitsToFloat(uf_remappedVS[8].y));
// 19
R0i.x = floatBitsToInt(intBitsToFloat(R6i.z) + -(0.5));
R4i.y = floatBitsToInt(intBitsToFloat(R10i.x) + -(intBitsToFloat(uf_remappedVS[8].w)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R127i.x)));
R124i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].w)) + intBitsToFloat(uf_remappedVS[9].w));
R126i.z = floatBitsToInt(1.0 / intBitsToFloat(R126i.y));
// 20
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(uf_remappedVS[10].y)));
R0i.y = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R127i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(uf_remappedVS[10].x)));
R0i.z = floatBitsToInt(intBitsToFloat(R10i.x) + -(intBitsToFloat(uf_remappedVS[7].w)));
// 21
backupReg0i = R127i.w;
R4i.x = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(PV0iz));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV0iw));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0ix));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].x)) + intBitsToFloat(uf_remappedVS[8].x));
R2i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(R126i.z));
// 22
R2i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].y)) + intBitsToFloat(uf_remappedVS[9].y));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R8i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R8i.x)));
R0i.w = ((intBitsToFloat(R4i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R2i.y = floatBitsToInt(1.0 / intBitsToFloat(R124i.w));
// 23
R3i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].w)) + intBitsToFloat(uf_remappedVS[11].w));
R3i.y = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iz));
R2i.z = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV0iy));
R3i.w = floatBitsToInt(intBitsToFloat(R10i.x) + -(intBitsToFloat(uf_remappedVS[9].w)));
R9i.x = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(R126i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
R125i.x = floatBitsToInt(intBitsToFloat(R2i.x) * intBitsToFloat(R2i.y));
R127i.y = ((intBitsToFloat(R0i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R2i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[10].z)));
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(R3i.x));
// 1
R124i.x = ((intBitsToFloat(R3i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iy = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].x)) + intBitsToFloat(uf_remappedVS[9].x));
R127i.w = floatBitsToInt(-(intBitsToFloat(R0i.w)) + 1.0);
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R8i.x)));
// 2
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(R2i.y));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R9i.x)));
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].y)) + intBitsToFloat(uf_remappedVS[11].y));
R125i.w = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(PS1i));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(backupReg0i)));
// 3
backupReg0i = R127i.w;
R127i.x = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(R126i.w));
R126i.y = floatBitsToInt(-(intBitsToFloat(R124i.x)) + 1.0);
PV1iz = floatBitsToInt(intBitsToFloat(R10i.x) + -(intBitsToFloat(uf_remappedVS[11].w)));
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].y) + intBitsToFloat(R127i.z));
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(backupReg0i)));
// 4
R9i.x = ((intBitsToFloat(PV1iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].x)) + intBitsToFloat(uf_remappedVS[11].x));
R126i.z = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
R124i.w = floatBitsToInt(intBitsToFloat(R2i.z) * intBitsToFloat(0x3e22f983) + 0.5);
R126i.x = floatBitsToInt(intBitsToFloat(R3i.y) * intBitsToFloat(0x3e22f983) + 0.5);
// 5
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R126i.y)));
R126i.y = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(R126i.w));
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].x) + intBitsToFloat(R125i.y));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(backupReg0i)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R127i.x)));
// 6
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].y) + intBitsToFloat(R124i.y));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R10i.x)));
PV0iz = floatBitsToInt(-(intBitsToFloat(R9i.x)) + 1.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].y), intBitsToFloat(R126i.z)));
R125i.z = floatBitsToInt(fract(intBitsToFloat(R124i.w)));
// 7
backupReg0i = R126i.x;
backupReg1i = R126i.w;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(PV0iz)));
R124i.y = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(0x3e22f983) + 0.5);
R124i.z = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PV0iw));
R126i.w = floatBitsToInt(fract(intBitsToFloat(backupReg0i)));
R2i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].x) + intBitsToFloat(backupReg1i));
// 8
backupReg0i = R127i.x;
backupReg1i = R127i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R126i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R125i.x)));
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].y) + intBitsToFloat(R0i.w));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), intBitsToFloat(R10i.x)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].x), intBitsToFloat(R126i.z)));
// 9
R123i.x = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R125i.z = floatBitsToInt(fract(intBitsToFloat(R124i.y)));
R126i.w = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PS0i));
R125i.w = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(R124i.z));
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R126i.x)));
R124i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].x) + intBitsToFloat(R127i.x));
R127i.z = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R125i.x)));
R124i.z = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
// 11
R123i.x = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R126i.y = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R126i.w));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R125i.w));
PV1iw = floatBitsToInt(max(intBitsToFloat(R6i.x), 0.0));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].y), intBitsToFloat(R9i.x)));
// 12
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(min(intBitsToFloat(PV1iw), 0.0));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(backupReg0i)));
R124i.y = floatBitsToInt(sin((intBitsToFloat(R127i.z))/0.1591549367));
// 13
R0i.x = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R126i.y));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].x), intBitsToFloat(R9i.x)));
R127i.z = floatBitsToInt(cos((intBitsToFloat(R127i.z))/0.1591549367));
// 14
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(PV1iy));
PV0iy = uf_remappedVS[12].y;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
R125i.z = floatBitsToInt(intBitsToFloat(R5i.z) * 1.0);
R126i.w = uf_remappedVS[12].x;
R126i.w = floatBitsToInt(intBitsToFloat(R126i.w) / 2.0);
R127i.x = floatBitsToInt(sin((intBitsToFloat(R124i.z))/0.1591549367));
// 15
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R127i.x)));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV0ix)));
R0i.z = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(PV0iy));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.x)));
R127i.w = floatBitsToInt(cos((intBitsToFloat(R124i.z))/0.1591549367));
// 16
R9i.x = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(R126i.w));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R127i.w)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.w)));
R8i.w = 0x3f800000;
R9i.y = floatBitsToInt(sin((intBitsToFloat(R126i.x))/0.1591549367));
// 17
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(R124i.z)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(R126i.y)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(R125i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(R125i.w)));
R126i.z = floatBitsToInt(cos((intBitsToFloat(backupReg0i))/0.1591549367));
// 18
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R126i.z)));
R0i.y = floatBitsToInt(-(intBitsToFloat(R126i.y)) + intBitsToFloat(PV1iw));
R8i.z = floatBitsToInt(intBitsToFloat(R124i.z) + intBitsToFloat(PV1iz));
R3i.w = floatBitsToInt(-(intBitsToFloat(R9i.y)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R126i.z)));
// 19
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R125i.z)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R125i.z)));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R126i.z)));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R125i.z)));
R8i.y = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(R126i.x));
// 20
R8i.x = floatBitsToInt(-(intBitsToFloat(R125i.w)) + intBitsToFloat(R125i.y));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R126i.z)));
R3i.z = floatBitsToInt(intBitsToFloat(R6i.x) + 1.0);
R7i.w = 0x3f800000;
R10i.x = floatBitsToInt(intBitsToFloat(R6i.y) + 1.0);
// 21
PV1ix = ((intBitsToFloat(R16i.y) == 0.0)?-1:0);
R0i.w = floatBitsToInt(intBitsToFloat(R6i.z) + 1.0);
PS1i = int(intBitsToFloat(R5i.w));
// 22
R7i.x = (PS1i == int(1))?-1:0;
R3i.y = (PS1i == 0x2)?-1:0;
R4i.z = ((PV1ix == 0)?(R16i.y):(0x3f800000));
R4i.w = (PS1i == 0x3)?-1:0;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(uf_remappedVS[13].y)));
R125i.y = ((R7i.x == 0)?(0x3f800000):(0xbf800000));
R126i.z = ((R7i.x == 0)?(0xbf800000):(0xbf800000));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(uf_remappedVS[13].z)));
// 1
backupReg0i = R9i.x;
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(uf_remappedVS[14].x)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R0i.z)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(uf_remappedVS[14].x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(backupReg0i)));
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[14].x)));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.z), intBitsToFloat(uf_remappedVS[15].w)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R3i.w)) + intBitsToFloat(R2i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R7i.z)) + intBitsToFloat(R4i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R2i.y)) + intBitsToFloat(R4i.x));
R122i.x = ((R3i.y == 0)?(R126i.z):(0x3f800000));
// 3
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R10i.y)) + intBitsToFloat(R123i.y));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R8i.y)) + intBitsToFloat(R123i.w));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R8i.x)) + intBitsToFloat(R123i.z));
R127i.w = ((R4i.w == 0)?(R122i.x):(0x3f800000));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 4
R2i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R8i.w)),vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),intBitsToFloat(uf_remappedVS[16].w))));
PV0iy = R2i.x;
PV0iz = R2i.x;
PV0iw = R2i.x;
R2i.w = floatBitsToInt(intBitsToFloat(R4i.z) * intBitsToFloat(PS1i));
R2i.w = clampFI32(R2i.w);
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R8i.w)),vec4(intBitsToFloat(uf_remappedVS[17].x),intBitsToFloat(uf_remappedVS[17].y),intBitsToFloat(uf_remappedVS[17].z),intBitsToFloat(uf_remappedVS[17].w))));
PV1ix = tempi.x;
R7i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R122i.x = ((R3i.y == 0)?(R125i.y):(0xbf800000));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R8i.w)),vec4(intBitsToFloat(uf_remappedVS[18].x),intBitsToFloat(uf_remappedVS[18].y),intBitsToFloat(uf_remappedVS[18].z),intBitsToFloat(uf_remappedVS[18].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R1i.z = tempi.x;
PV0iw = tempi.x;
R122i.x = ((R4i.w == 0)?(R122i.x):(0x3f800000));
// 7
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R122i.x),intBitsToFloat(uf_remappedVS[19].x)) + 0.0);
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(uf_remappedVS[19].x)) + 0.0);
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R0i.z),intBitsToFloat(R7i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.w = uf_remappedVS[20].z;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R0i.z),intBitsToFloat(R7i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R1i.x = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(PV0ix));
// 2
R125i.x = uf_remappedVS[21].z;
R1i.y = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(PV1ix));
R126i.z = uf_remappedVS[22].z;
R127i.w = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(R9i.x));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R125i.w)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedVS[22].x),intBitsToFloat(uf_remappedVS[22].y),intBitsToFloat(uf_remappedVS[22].z),intBitsToFloat(uf_remappedVS[22].w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R0i.z),intBitsToFloat(R7i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(R3i.z));
// 4
R126i.x = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PS1i));
R126i.y = uf_remappedVS[20].y;
R0i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV1ix));
R124i.w = uf_remappedVS[21].y;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R125i.x)));
// 5
R124i.x = uf_remappedVS[22].y;
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R126i.z)));
PV1iz = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(R10i.x));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R125i.w)));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R125i.x)));
// 6
backupReg0i = R125i.w;
R10i.x = uf_remappedVS[21].x;
R4i.y = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R126i.x));
R127i.z = uf_remappedVS[20].x;
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R126i.z)));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(backupReg0i)));
// 7
backupReg0i = R125i.y;
backupReg1i = R127i.w;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(R125i.x)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(R126i.z)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R126i.y)) + intBitsToFloat(backupReg0i));
R127i.w = uf_remappedVS[22].x;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R124i.w)) + intBitsToFloat(backupReg1i));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R124i.x)) + intBitsToFloat(R125i.w));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R124i.w)) + intBitsToFloat(R127i.x));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R124i.x)) + intBitsToFloat(R124i.y));
// 9
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R124i.w)) + intBitsToFloat(R125i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R126i.y)) + intBitsToFloat(R126i.w));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R126i.y)) + intBitsToFloat(backupReg0i));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.x));
// 10
R17i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.y)),intBitsToFloat(R127i.z)) + intBitsToFloat(R126i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.y));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R10i.x)) + intBitsToFloat(R125i.z));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R124i.x)) + intBitsToFloat(R125i.y));
// 11
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R17i.x)) + intBitsToFloat(R123i.y));
R17i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.y)),intBitsToFloat(R10i.x)) + intBitsToFloat(R127i.y));
R17i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.y)),intBitsToFloat(R127i.w)) + intBitsToFloat(R125i.w));
// 12
R18i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(R127i.z)) + intBitsToFloat(R124i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R17i.z)) + intBitsToFloat(R126i.w));
R18i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(R127i.w)) + intBitsToFloat(R124i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R17i.y)) + intBitsToFloat(R126i.z));
R18i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(R10i.x)) + intBitsToFloat(R126i.x));
// 13
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(R18i.x)) + intBitsToFloat(R124i.x));
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(R18i.y)) + intBitsToFloat(R123i.w));
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(R18i.z)) + intBitsToFloat(R123i.y));
// 14
predResult = (intBitsToFloat(uf_remappedVS[23].y) != 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0iy = uf_remappedVS[17].w;
PV0iz = uf_remappedVS[16].w;
// 1
PV1ix = uf_remappedVS[18].w;
R127i.y = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(R1i.x)));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(R1i.y)));
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[23].y));
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
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PV1ix)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[16].w) + intBitsToFloat(uf_remappedVS[17].w));
R0i.w = 0x3f800000;
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[19].w), intBitsToFloat(R4i.y)));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[18].w) + intBitsToFloat(PV0ix));
// 2
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), intBitsToFloat(uf_remappedVS[15].x)));
R127i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3dd70a3d));
// 3
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[19].z), intBitsToFloat(R2i.w)));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(backupReg0i));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[19].w), intBitsToFloat(uf_remappedVS[15].z)));
PV0iz = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1iw));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[19].z), intBitsToFloat(uf_remappedVS[15].y)));
R123i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(PV0ix)));
// 6
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV1iw));
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
// 7
PV1iz = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iy));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 8
R123i.x = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
R127i.z = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
// 9
PV1iw = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
PS1i = floatBitsToInt(sin((intBitsToFloat(R127i.z))/0.1591549367));
// 10
R123i.y = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R127i.x)));
PS0i = floatBitsToInt(cos((intBitsToFloat(R127i.z))/0.1591549367));
// 11
R8i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
// 12
R4i.z = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV1iy));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1iz))/0.1591549367));
// 13
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R126i.x)));
// 14
R3i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV1iz));
}
if( activeMaskStackC[3] == true ) {
// 0
R7i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R3i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[24].x),intBitsToFloat(uf_remappedVS[24].y),intBitsToFloat(uf_remappedVS[24].z),intBitsToFloat(uf_remappedVS[24].w))));
PV0iy = R7i.x;
PV0iz = R7i.x;
PV0iw = R7i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R3i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[25].x),intBitsToFloat(uf_remappedVS[25].y),intBitsToFloat(uf_remappedVS[25].z),intBitsToFloat(uf_remappedVS[25].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R3i.z = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R3i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[26].x),intBitsToFloat(uf_remappedVS[26].y),intBitsToFloat(uf_remappedVS[26].z),intBitsToFloat(uf_remappedVS[26].w))));
PV0ix = tempi.x;
R2i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R3i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[27].x),intBitsToFloat(uf_remappedVS[27].y),intBitsToFloat(uf_remappedVS[27].z),intBitsToFloat(uf_remappedVS[27].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R11i.w = tempi.x;
// 4
PV0ix = PV1ix;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
R0i.y = uf_remappedVS[28].x;
R0i.z = uf_remappedVS[28].y;
R0i.w = uf_remappedVS[28].z;
// 5
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[29].x)) + intBitsToFloat(uf_remappedVS[30].x));
R14i.z = floatBitsToInt(intBitsToFloat(R2i.y) * 0.5 + intBitsToFloat(PV0ix));
R123i.w = floatBitsToInt(intBitsToFloat(R2i.y) * 0.0 + intBitsToFloat(PV0ix));
R14i.w = floatBitsToInt(intBitsToFloat(R2i.y) * 0.0 + intBitsToFloat(R11i.w));
// 6
backupReg0i = R14i.w;
R14i.x = floatBitsToInt(intBitsToFloat(R7i.x) * 0.5 + intBitsToFloat(R123i.w));
R14i.y = floatBitsToInt(intBitsToFloat(R3i.z) * -(0.5) + intBitsToFloat(R123i.w));
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[29].w)) + intBitsToFloat(uf_remappedVS[30].w));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 7
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[30].x)) + intBitsToFloat(uf_remappedVS[31].x));
PV1iy = floatBitsToInt(intBitsToFloat(R14i.z) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 8
R0i.x = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(PS1i));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(uf_remappedVS[1].w)) + -(intBitsToFloat(uf_remappedVS[1].y)));
// 9
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[30].w)) + intBitsToFloat(uf_remappedVS[31].w));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.y));
// 10
R3i.x = uf_remappedVS[32].x;
R7i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS1i));
R2i.w = uf_remappedVS[32].y;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 11
R4i.x = uf_remappedVS[32].z;
R2i.z = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS0i));
}
if( activeMaskStackC[3] == true ) {
// 0
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[33].x)));
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[34].y))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(uf_remappedVS[34].y) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[34].y));
// 1
R127i.x = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iy)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[33].y)));
PV1iz = floatBitsToInt(intBitsToFloat(R16i.y) * intBitsToFloat(PS0i));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[33].z)));
// 2
PV0ix = floatBitsToInt((intBitsToFloat(uf_remappedVS[34].w) > 0.0)?1.0:0.0);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(uf_remappedVS[3].z)) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[34].w))?1.0:0.0);
R127i.w = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[34].w));
// 3
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iy = floatBitsToInt(intBitsToFloat(R16i.y) * intBitsToFloat(PS0i));
R126i.w = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iz)));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(uf_remappedVS[4].x)) + intBitsToFloat(PV1iy));
R127i.y = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV1ix)));
// 5
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x),intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iz));
PV1iw = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
// 6
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV1iw)));
// 7
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x),intBitsToFloat(R127i.y)) + intBitsToFloat(PV0iy));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R0i.y) + -(intBitsToFloat(uf_remappedVS[29].w)));
PV0iz = floatBitsToInt(intBitsToFloat(R0i.y) + -(intBitsToFloat(uf_remappedVS[30].w)));
// 1
R127i.x = ((intBitsToFloat(PV0ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R2i.z)) + intBitsToFloat(uf_remappedVS[30].x));
R127i.z = ((intBitsToFloat(PV0iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R0i.x)) + intBitsToFloat(uf_remappedVS[29].x));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
PV0iz = floatBitsToInt(intBitsToFloat(R0i.y) + -(intBitsToFloat(uf_remappedVS[31].w)));
R125i.w = floatBitsToInt(intBitsToFloat(R2i.x) + -(intBitsToFloat(uf_remappedVS[35].w)));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV0ix)));
R126i.y = ((intBitsToFloat(PV0iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.z = floatBitsToInt(intBitsToFloat(R2i.x) + -(intBitsToFloat(uf_remappedVS[36].w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[29].x), intBitsToFloat(PV0iy)));
R127i.w = ((intBitsToFloat(R125i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 4
PV0ix = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
R125i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].x)) + intBitsToFloat(uf_remappedVS[36].x));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PV1ix)) + intBitsToFloat(PV1iw));
R124i.w = ((intBitsToFloat(R125i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.w = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
// 5
PV1ix = floatBitsToInt(-(intBitsToFloat(R124i.w)) + 1.0);
PV1iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].w)) + intBitsToFloat(uf_remappedVS[36].w));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0ix)));
// 6
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV1ix)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PV1iw)) + intBitsToFloat(R126i.z));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[36].x)) + intBitsToFloat(uf_remappedVS[37].x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(intBitsToFloat(R2i.x) + -(intBitsToFloat(uf_remappedVS[37].w)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[31].x),intBitsToFloat(R126i.y)) + intBitsToFloat(R123i.y));
// 8
R126i.x = ((intBitsToFloat(PV1iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].x), intBitsToFloat(R126i.w)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(PV1ix)) + intBitsToFloat(uf_remappedVS[35].x));
R9i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(uf_remappedVS[33].w)));
PS0i = ((intBitsToFloat(R6i.x) > 0.5)?-1:0);
// 9
PV1ix = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R127i.x)) + intBitsToFloat(PV0iy));
R2i.z = floatBitsToInt(((PS0i == 0)?(intBitsToFloat(R5i.x)):(-(intBitsToFloat(R5i.x)))));
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[36].w)) + intBitsToFloat(uf_remappedVS[37].w));
// 10
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(uf_remappedVS[38].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(uf_remappedVS[38].y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 11
PV1iy = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS0i));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(uf_remappedVS[38].z)));
// 12
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(PV1iy)) + intBitsToFloat(uf_remappedVS[36].x));
// 13
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(R127i.z)) + intBitsToFloat(R126i.y));
R4i.x = uf_remappedVS[13].x;
// 14
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[37].x),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.x));
// 15
R10i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(uf_remappedVS[38].w)));
}
if( activeMaskStackC[3] == true ) {
// 0
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(uf_remappedVS[39].x)));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[39].x)));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(uf_remappedVS[39].x)));
PV0iw = uf_remappedVS[2].x & 0x80000;
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].x), intBitsToFloat(R0i.x)));
// 1
PV1ix = (PV0iw == 0x80000)?-1:0;
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].x), intBitsToFloat(R0i.y)));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].x), intBitsToFloat(R0i.z)));
PV1iw = uf_remappedVS[2].x & 0x100000;
PS1i = ((intBitsToFloat(R6i.y) > 0.5)?-1:0);
// 2
PV0ix = (PV1iw == 0x100000)?-1:0;
R123i.y = floatBitsToInt(((PS1i == 0)?(intBitsToFloat(R5i.y)):(-(intBitsToFloat(R5i.y)))));
R127i.z = ((PV1ix == 0)?(R5i.x):(R2i.z));
PV0iw = uf_remappedVS[2].x & 0x200000;
PS0i = ((intBitsToFloat(R6i.z) > 0.5)?-1:0);
// 3
R123i.x = floatBitsToInt(((PS0i == 0)?(intBitsToFloat(R5i.x)):(-(intBitsToFloat(R5i.x)))));
R126i.y = ((PV0ix == 0)?(R5i.y):(R123i.y));
PV1iz = uf_remappedVS[2].x & 0x400000;
PV1iw = (PV0iw == 0x200000)?-1:0;
PS1i = ((intBitsToFloat(R6i.w) > 0.5)?-1:0);
// 4
R126i.x = ((PV1iw == 0)?(R5i.x):(R123i.x));
R123i.y = floatBitsToInt(((PS1i == 0)?(intBitsToFloat(R5i.y)):(-(intBitsToFloat(R5i.y)))));
PV0iz = (PV1iz == 0x400000)?-1:0;
PV0iw = uf_remappedVS[2].x & 0x800000;
PS0i = ((intBitsToFloat(R6i.y) > 0.5)?-1:0);
// 5
R123i.x = floatBitsToInt(((PS0i == 0)?(intBitsToFloat(R5i.x)):(-(intBitsToFloat(R5i.x)))));
PV1iy = (PV0iw == 0x800000)?-1:0;
PV1iz = uf_remappedVS[2].x & 0x1000000;
R124i.w = ((PV0iz == 0)?(R5i.y):(R123i.y));
PS1i = ((intBitsToFloat(R6i.z) > 0.5)?-1:0);
// 6
PV0ix = (PV1iz == 0x1000000)?-1:0;
R123i.y = floatBitsToInt(((PS1i == 0)?(intBitsToFloat(R5i.y)):(-(intBitsToFloat(R5i.y)))));
R126i.z = ((PV1iy == 0)?(R5i.x):(R123i.x));
PV0iw = uf_remappedVS[2].y & int(1);
R125i.z = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[40].z));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R127i.z) + 0.5);
R5i.y = ((PV0ix == 0)?(R5i.y):(R123i.y));
PV1iz = floatBitsToInt(intBitsToFloat(R126i.y) + -(0.5));
R125i.w = (int(1) != PV0iw)?-1:0;
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[40].w));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].x), intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[40].y)), intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(intBitsToFloat(R124i.w) + -(0.5));
PV0iw = floatBitsToInt(intBitsToFloat(R126i.x) + 0.5);
R126i.x = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[41].z));
// 9
R19i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PV0ix)));
R19i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV0iy)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[41].x), intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[41].y)), intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[41].w));
// 10
R123i.x = ((R125i.w == 0)?(0):(0x2));
R124i.y = floatBitsToInt(intBitsToFloat(R126i.z) + 0.5);
R19i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV1iz)));
R19i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(PV1iw)));
PS0i = int(intBitsToFloat(uf_remappedVS[42].z));
// 11
PV1ix = (R123i.x == 0x2)?-1:0;
R126i.y = (R123i.x == int(1))?-1:0;
R125i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[43].w) + intBitsToFloat(uf_remappedVS[44].y));
R126i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[43].z) + intBitsToFloat(uf_remappedVS[44].x));
R125i.x = floatBitsToInt(float(PS0i));
// 12
R126i.x = ((R126i.y == 0)?(R6i.x):(R6i.y));
R127i.y = ((R126i.y == 0)?(R6i.y):(R6i.z));
R123i.z = ((PV1ix == 0)?(R6i.y):(R6i.x));
R123i.w = ((PV1ix == 0)?(R6i.x):(R6i.z));
R125i.w = floatBitsToInt(-(abs(intBitsToFloat(R125i.x))) + 0.0);
// 13
R127i.x = ((R126i.y == 0)?(R123i.z):(R6i.z));
R125i.y = ((R126i.y == 0)?(R123i.w):(R6i.y));
PV1iz = floatBitsToInt((0.0 >= abs(intBitsToFloat(R125i.x)))?1.0:0.0);
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[45].x) + intBitsToFloat(uf_remappedVS[45].z));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R125i.x));
// 14
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[45].z),intBitsToFloat(R126i.x)) + intBitsToFloat(PV1iw));
R126i.y = ((intBitsToFloat(PV1iz) == 0.0)?(0):(R125i.w));
R127i.z = floatBitsToInt(intBitsToFloat(R5i.y) + -(0.5));
PV0iw = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[42].z));
// 15
PV1ix = floatBitsToInt(abs(intBitsToFloat(R125i.x)) + intBitsToFloat(R126i.y));
R1i.y = floatBitsToInt(fract(intBitsToFloat(R1i.w)));
PV1iz = floatBitsToInt(trunc(intBitsToFloat(PV0iw)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[42].x), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[42].w));
// 16
backupReg0i = R126i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[44].x), intBitsToFloat(R125i.y)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[42].y), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[44].y), intBitsToFloat(R127i.x)));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
R123i.w = ((-(intBitsToFloat(backupReg0i)) > 0.0)?(PV1ix):(backupReg0i));
PS0i = int(intBitsToFloat(PV1iz));
// 17
PV1ix = floatBitsToInt(-(intBitsToFloat(PV0ix)) + intBitsToFloat(R126i.w));
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[45].y) + intBitsToFloat(uf_remappedVS[45].w));
R123i.z = ((intBitsToFloat(R125i.x) == 0.0)?(0):(R123i.w));
PV1iw = floatBitsToInt(-(intBitsToFloat(PV0iz)) + intBitsToFloat(R125i.z));
R126i.w = floatBitsToInt(float(PS0i));
// 18
backupReg0i = R127i.y;
backupReg1i = R123i.z;
R125i.x = floatBitsToInt(intBitsToFloat(R16i.y) * 100.0);
R125i.x = clampFI32(R125i.x);
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R16i.y)),intBitsToFloat(uf_remappedVS[43].x)) + -(intBitsToFloat(PV1ix)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y),intBitsToFloat(uf_remappedVS[43].y)) + intBitsToFloat(PV1iw));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[45].w),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV1iy));
PS0i = int(intBitsToFloat(backupReg1i));
// 19
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y),intBitsToFloat(uf_remappedVS[44].z)) + intBitsToFloat(R126i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.y)),intBitsToFloat(R126i.w)) + intBitsToFloat(R123i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y),intBitsToFloat(uf_remappedVS[44].w)) + intBitsToFloat(R123i.w));
PS1i = floatBitsToInt(float(PS0i));
// 20
backupReg0i = R123i.x;
backupReg1i = R127i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(PS1i)) + intBitsToFloat(R127i.y));
R127i.y = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
R127i.z = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.y)),intBitsToFloat(backupReg1i)) + -(intBitsToFloat(R123i.y)));
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(R125i.x)));
// 21
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R124i.y)) + intBitsToFloat(R123i.x));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R125i.x)));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R125i.x)));
// 22
R13i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.z)),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.x));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R127i.y)) + intBitsToFloat(R126i.w));
}
if( activeMaskStackC[3] == true ) {
// 0
R12i.y = uf_remappedVS[46].x;
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[23].z), intBitsToFloat(R1i.y)));
// 1
R12i.x = floatBitsToInt(intBitsToFloat(R4i.x) * 1.0 + 0.0);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.y), intBitsToFloat(uf_remappedVS[47].x)));
// 2
R3i.z = floatBitsToInt(intBitsToFloat(PV1iy) * 0.25 + 0.5);
R3i.z = clampFI32(R3i.z);
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(-(intBitsToFloat(R8i.x)) + intBitsToFloat(uf_remappedVS[48].x));
PV0iy = floatBitsToInt(min(intBitsToFloat(uf_remappedVS[48].y), intBitsToFloat(uf_remappedVS[49].z)));
R127i.z = floatBitsToInt(-(intBitsToFloat(R3i.y)) + intBitsToFloat(uf_remappedVS[48].y));
// 1
R127i.x = floatBitsToInt(-(intBitsToFloat(R4i.z)) + intBitsToFloat(uf_remappedVS[48].z));
PV1iy = floatBitsToInt(-(intBitsToFloat(R3i.z)) + 1.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z),intBitsToFloat(uf_remappedVS[50].x)) + -(intBitsToFloat(uf_remappedVS[50].y)));
R123i.z = clampFI32(R123i.z);
PV1iw = floatBitsToInt(-(intBitsToFloat(R7i.y)) + intBitsToFloat(PV0iy));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[49].y),intBitsToFloat(PV1iw)) + intBitsToFloat(uf_remappedVS[49].x));
R123i.x = clampFI32(R123i.x);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z),intBitsToFloat(uf_remappedVS[51].x)) + -(intBitsToFloat(uf_remappedVS[51].y)));
R123i.y = clampFI32(R123i.y);
R126i.z = floatBitsToInt(intBitsToFloat(PV1iy) + 8.5);
PV0iw = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
PS0i = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(R127i.x));
// 3
backupReg0i = R123i.x;
R123i.x = floatBitsToInt((intBitsToFloat(R127i.z) * intBitsToFloat(R127i.z) + intBitsToFloat(PS0i)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[52].w)));
PV1iz = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[53].y) + 1.0);
tempResultf = max(0.0, intBitsToFloat(PV0iw));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 4
R125i.x = floatBitsToInt((intBitsToFloat(R126i.x) * intBitsToFloat(R126i.x) + intBitsToFloat(R123i.x)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) * 1.5);
PV0iy = clampFI32(PV0iy);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[50].w), intBitsToFloat(PS1i)));
R125i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[53].y) * 1.0 + intBitsToFloat(R7i.z));
tempResultf = max(0.0, intBitsToFloat(PV1iz));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 5
R124i.x = floatBitsToInt(intBitsToFloat(PV0iy) * 15.0);
R1i.y = 0;
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[54].x), intBitsToFloat(PS0i)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[54].y), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
// 6
R0i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)),intBitsToFloat(uf_remappedVS[55].w)) + intBitsToFloat(uf_remappedVS[55].w));
tempResultf = 1.0 / sqrt(intBitsToFloat(R125i.x));
PS0i = floatBitsToInt(tempResultf);
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
R1i.w = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0x3daaaaab));
PS1i = floatBitsToInt(exp2(intBitsToFloat(R126i.w)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(PV1ix),intBitsToFloat(PV1iy),intBitsToFloat(PV1iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[53].x),intBitsToFloat(uf_remappedVS[53].y),intBitsToFloat(uf_remappedVS[53].z),0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R3i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
// 9
R127i.x = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
PS1i = floatBitsToInt(exp2(intBitsToFloat(R125i.z)));
// 10
R123i.x = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[54].z)),intBitsToFloat(PS1i)) + intBitsToFloat(uf_remappedVS[54].z));
R123i.y = clampFI32(R123i.y);
PV0iw = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R124i.x));
// 11
R5i.y = floatBitsToInt(-(intBitsToFloat(R0i.w)) + intBitsToFloat(R123i.y));
R5i.y = clampFI32(R5i.y);
PV1iz = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(PS0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R123i.x)) + intBitsToFloat(0xbe593484));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0iw)));
// 12
PV0ix = floatBitsToInt(max(intBitsToFloat(PV1iz), intBitsToFloat(0x3e4ccccd)));
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3f22f983));
R0i.z = R5i.y;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R123i.w)) + intBitsToFloat(0x3fc90da4));
// 13
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),-(intBitsToFloat(R123i.w))) + 1.0);
R6i.w = floatBitsToInt(min(intBitsToFloat(PV0ix), 1.0));
}
if( activeMaskStackC[3] == true ) {
R3i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y))).xyz);
R8i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R1i.w),intBitsToFloat(R1i.y))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
R20i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R6i.w)));
R20i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R6i.w)));
R20i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R6i.w)));
R20i.w = R5i.y;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.w));
// export
passParameterSem10 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem13 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R8i.x), intBitsToFloat(R8i.y), intBitsToFloat(R8i.z), intBitsToFloat(R8i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.z));
// export
passParameterSem9 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.z));
}
