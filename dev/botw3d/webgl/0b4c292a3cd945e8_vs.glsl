#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 0b4c292a3cd945e8
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[51];
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
ivec4 R19i = ivec4(0);
ivec4 R20i = ivec4(0);
ivec4 R21i = ivec4(0);
ivec4 R22i = ivec4(0);
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
R11i.z = floatBitsToInt(-(intBitsToFloat(R7i.y)) + 1.0);
R0i.w = 0;
R3i.w = floatBitsToInt(1.0);
// 1
R9i.w = floatBitsToInt(-(intBitsToFloat(R2i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R4i.w = floatBitsToInt(-(intBitsToFloat(R7i.x)) + 1.0);
// 2
predResult = (0.0 > intBitsToFloat(R9i.w));
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
R2i.w = R3i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R2i.w = R0i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R2i.w == 0);
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
R0i.x = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R9i.w) >= intBitsToFloat(R0i.x));
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
R0i.w = R3i.w;
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
PV0ix = floatBitsToInt(max(intBitsToFloat(R5i.x), 0.0));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(uf_remappedVS[2].y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(uf_remappedVS[2].z)));
// 1
PV1iw = floatBitsToInt(min(intBitsToFloat(PV0ix), 0.0));
R1i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(R9i.w));
// 2
R0i.x = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV1iw));
// 3
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[2].x)));
// 4
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(uf_remappedVS[3].y)));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(uf_remappedVS[3].z)));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(uf_remappedVS[3].w)));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(uf_remappedVS[3].y)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R10i.y = ((intBitsToFloat(uf_remappedVS[4].x) == 1.0)?-1:0);
R0i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].x)) + 1.0);
// 1
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
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].w), intBitsToFloat(PV0ix)));
// 2
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].x), intBitsToFloat(PV1iw)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), intBitsToFloat(PV1iw)));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].z), intBitsToFloat(PV1iw)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
tempResultf = max(0.0, abs(intBitsToFloat(uf_remappedVS[4].x)));
tempResultf = log2(tempResultf);
PS0i = floatBitsToInt(tempResultf);
// 1
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f317218));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[4].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PS1i)));
R127i.y = ((intBitsToFloat(uf_remappedVS[4].x) == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R0i.z));
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
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].w), intBitsToFloat(PV1ix)));
// 9
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].x), intBitsToFloat(PV0iw)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), intBitsToFloat(PV0iw)));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].z), intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(R5i.y));
PV0iy = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(R5i.z));
PV0iz = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(R5i.z));
R0i.w = 0x3f800000;
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[4].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) * 0.5);
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) * 0.5);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) * 0.5);
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R0i.z));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(PV1ix) + -(0.5));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
R0i.y = floatBitsToInt(intBitsToFloat(R5i.x) + -(0.5));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) + -(0.5));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
R127i.w = floatBitsToInt(intBitsToFloat(PV1iw) + -(0.5));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iz)));
// 3
R9i.x = floatBitsToInt(intBitsToFloat(R5i.z) + -(0.5));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(uf_remappedVS[6].x)));
R0i.z = floatBitsToInt(intBitsToFloat(R5i.y) + -(0.5));
PV1iw = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedVS[6].y)));
// 4
R0i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].y) + intBitsToFloat(PS1i));
R9i.y = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(uf_remappedVS[7].x));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(R127i.y));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(uf_remappedVS[6].z)));
// 5
R123i.x = ((R10i.y == 0)?(PV0iz):(R1i.w));
R10i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].z) + intBitsToFloat(PV0iw));
PV1iz = uf_remappedVS[8].x & 0x10000;
R127i.w = uf_remappedVS[8].x & 0x20000;
R126i.w = uf_remappedVS[8].x & 0x40000;
// 6
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R123i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R123i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.x)));
PS0i = floatBitsToInt(float(PV1iz));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(intBitsToFloat(R6i.z) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(PV0iy));
PS1i = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1iy)));
R127i.w = floatBitsToInt(float(R127i.w));
// 9
R1i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV0ix));
R1i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV0iy));
R1i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0iw));
R125i.w = floatBitsToInt((intBitsToFloat(R127i.w) > 0.0)?1.0:0.0);
R127i.x = int(intBitsToFloat(PV0iz));
// 10
R126i.x = R5i.z;
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) * 2.0);
PV0iy = R5i.y;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(R127i.w))?1.0:0.0);
PV0iw = 0 - R127i.x;
PS0i = floatBitsToInt(float(R126i.w));
// 11
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R125i.w) + -(intBitsToFloat(PV0iz)));
PV1iy = max(backupReg0i, PV0iw);
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PS1i = floatBitsToInt(floor(intBitsToFloat(PV0iy)));
// 12
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iz = floatBitsToInt(floor(intBitsToFloat(R126i.x)));
R125i.w = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iw)));
R127i.z = floatBitsToInt(float(PV1iy));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 2.0);
// 13
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PV0iz))?1.0:0.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt((intBitsToFloat(PV0iz) > 0.0)?1.0:0.0);
R127i.w = int(intBitsToFloat(R127i.x));
// 14
backupReg0i = R127i.z;
PV0iy = 0 - R127i.w;
R127i.z = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1ix)));
R1i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)), intBitsToFloat(PV1iy)));
R127i.y = int(intBitsToFloat(R125i.w));
// 15
PV1ix = 0 - R127i.y;
PV1iz = max(R127i.w, PV0iy);
// 16
PV0ix = max(R127i.y, PV1ix);
PS0i = floatBitsToInt(float(PV1iz));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 17
R6i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(R127i.z)));
R6i.w = floatBitsToInt(float(PV0ix));
R6i.w = floatBitsToInt(intBitsToFloat(R6i.w) * 2.0);
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w))));
PV0ix = tempi.x;
R6i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R7i.z = tempi.x;
PV1iw = tempi.x;
PS1i = R5i.x;
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 2
R1i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w))));
PV0iy = R1i.x;
PV0iz = R1i.x;
PV0iw = R1i.x;
PS0i = floatBitsToInt(floor(intBitsToFloat(PS1i)));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(R1i.w)));
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R6i.x)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[12].x)));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iz)));
R126i.y = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV1iw));
R127i.z = floatBitsToInt(intBitsToFloat(R9i.y) + intBitsToFloat(PV1ix));
R126i.w = floatBitsToInt(intBitsToFloat(PS1i) + 0.0);
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[12].y)));
// 5
R127i.x = ((intBitsToFloat(uf_remappedVS[7].w) == 1.0)?-1:0);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(uf_remappedVS[12].z)));
PV1iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.w)), intBitsToFloat(PV0ix)));
R125i.w = floatBitsToInt(intBitsToFloat(PS0i) + 0.0);
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[7].w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(PV1iz)));
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].w)) + 1.0);
R126i.z = floatBitsToInt(intBitsToFloat(PV1iy) + 0.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(PS1i)));
// 7
R127i.w = floatBitsToInt(intBitsToFloat(R10i.y) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
// 8
PV0ix = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 9
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(PS0i));
// 10
R123i.x = ((R127i.x == 0)?(PV1iz):(R9i.w));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R123i.x)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R123i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R123i.x)));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV1ix));
PV0iy = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV1iw));
R0i.z = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(PV1iy));
// 13
R123i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.w = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3e22f983) + 0.5);
// 14
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
// 15
R123i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 16
R127i.x = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
R10i.y = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 17
R6i.w = floatBitsToInt(sin((intBitsToFloat(R127i.x))/0.1591549367));
// 18
R9i.y = floatBitsToInt(cos((intBitsToFloat(R127i.x))/0.1591549367));
// 19
R1i.w = floatBitsToInt(sin((intBitsToFloat(R10i.y))/0.1591549367));
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.y = floatBitsToInt(-(intBitsToFloat(R1i.x)) + intBitsToFloat(uf_remappedVS[13].z));
R126i.w = floatBitsToInt(-(intBitsToFloat(R6i.y)) + intBitsToFloat(uf_remappedVS[13].x));
// 1
R124i.x = ((intBitsToFloat(R126i.y) == 0.0)?-1:0);
PV1iy = floatBitsToInt((-(intBitsToFloat(R126i.w)) > 0.0)?1.0:0.0);
PV1iz = floatBitsToInt((0.0 > -(intBitsToFloat(R126i.w)))?1.0:0.0);
R125i.w = ((-(intBitsToFloat(R126i.w)) == 0.0)?-1:0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.y));
// 2
R125i.x = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iz)));
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.w)) * intBitsToFloat(PS1i));
PV0iz = ((0.0 > intBitsToFloat(R126i.y))?-1:0);
R127i.y = floatBitsToInt(cos((intBitsToFloat(R10i.y))/0.1591549367));
// 3
R127i.x = floatBitsToInt(max(intBitsToFloat(PV0iy), -(intBitsToFloat(PV0iy))));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PV0iy))?1.0:0.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV0iz)));
PV1iw = floatBitsToInt((intBitsToFloat(PV0iy) > 0.0)?1.0:0.0);
R9i.x = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(0x3fc90fdb));
// 4
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iy)));
R125i.w = ((intBitsToFloat(R127i.x) > 1.0)?-1:0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 5
R126i.x = floatBitsToInt(((R125i.w == 0)?(intBitsToFloat(PV0iz)):(-(intBitsToFloat(PV0iz)))));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3fc90fdb));
R123i.w = ((R125i.w == 0)?(R127i.x):(PS0i));
// 6
R6i.x = floatBitsToInt(-(intBitsToFloat(R1i.w)));
R126i.y = ((R125i.w == 0)?(0):(PV1iz));
PV0iz = floatBitsToInt(min(intBitsToFloat(R123i.w), 1.0));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(R127i.y)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(R127i.y)));
// 7
R127i.x = floatBitsToInt(max(intBitsToFloat(PV0iz), -(1.0)));
// 8
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R127i.x)));
// 9
R123i.x = floatBitsToInt(intBitsToFloat(0x3d6ee04d) * intBitsToFloat(R125i.w) + intBitsToFloat(0x3f43b24e));
R123i.y = floatBitsToInt(intBitsToFloat(0x3edcf805) * intBitsToFloat(R125i.w) + 1.0);
// 10
R126i.z = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R127i.x)), intBitsToFloat(R123i.y)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R123i.x)) + 1.0);
// 11
R0i.x = floatBitsToInt(intBitsToFloat(R6i.y) + -(intBitsToFloat(uf_remappedVS[13].x)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(uf_remappedVS[14].z)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.w));
// 12
R125i.y = floatBitsToInt(intBitsToFloat(R7i.z) + -(intBitsToFloat(uf_remappedVS[13].y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS1i)));
// 13
R123i.x = ((intBitsToFloat(R127i.x) > 0.0)?(PV0iz):(floatBitsToInt(-(intBitsToFloat(PV0iz)))));
R126i.z = floatBitsToInt(intBitsToFloat(R1i.x) + -(intBitsToFloat(uf_remappedVS[13].z)));
// 14
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R123i.x)) + intBitsToFloat(R126i.y));
// 15
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(R125i.w))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(R125i.w) > 0.0)?1.0:0.0);
// 16
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iy)));
// 17
PV1iw = floatBitsToInt(-(intBitsToFloat(R125i.x)) + intBitsToFloat(PV0iz));
// 18
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3fc90fdb));
// 19
PV1iz = floatBitsToInt(intBitsToFloat(R125i.w) + -(intBitsToFloat(PV0iy)));
// 20
R123i.x = ((R127i.z == 0)?(PV1iz):(0x40490fdb));
// 21
R123i.w = ((R124i.x == 0)?(R123i.x):(R9i.x));
// 22
PV0iz = floatBitsToInt(intBitsToFloat(R0i.z) + -(intBitsToFloat(R123i.w)));
// 23
PV1iy = uf_remappedVS[14].y;
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) / 2.0);
R123i.z = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iw = uf_remappedVS[14].x;
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) / 2.0);
// 24
R9i.x = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
R0i.z = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV1iw));
// 25
R123i.w = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 26
R126i.y = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
// 27
R124i.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R0i.x)),-(intBitsToFloat(R125i.y)),-(intBitsToFloat(R126i.z)),intBitsToFloat(0x80000000)),vec4(-(intBitsToFloat(R0i.x)),-(intBitsToFloat(R125i.y)),-(intBitsToFloat(R126i.z)),0.0)));
PV1iy = R124i.x;
PV1iz = R124i.x;
PV1iw = R124i.x;
PS1i = floatBitsToInt(sin((intBitsToFloat(R126i.y))/0.1591549367));
// 28
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(PS1i)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R127i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(cos((intBitsToFloat(R126i.y))/0.1591549367));
// 29
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(R125i.x)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(PS0i)));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R127i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(R127i.z)));
// 30
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PV1iw)));
R1i.z = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(PS1i));
R1i.w = floatBitsToInt(-(intBitsToFloat(PV1iw)) + intBitsToFloat(PV1ix));
tempResultf = 1.0 / sqrt(intBitsToFloat(R124i.x));
PS0i = floatBitsToInt(tempResultf);
// 31
PV1ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.x)), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)), intBitsToFloat(PS0i)));
R2i.z = floatBitsToInt(-(intBitsToFloat(R125i.x)) + intBitsToFloat(PV0iy));
R6i.w = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.z)), intBitsToFloat(PS0i)));
// 32
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R0i.y)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV1ix)));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PS1i)));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV1iy)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R1i.w)));
// 33
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R124i.x = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(R2i.y));
// 34
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R6i.x)) + intBitsToFloat(R125i.x));
PV0iy = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(R2i.w));
PV0iz = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(R9i.z));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R0i.w)) + intBitsToFloat(R126i.w));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 35
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R0i.x = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 36
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R6i.z)) + intBitsToFloat(R125i.x));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R1i.z)));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R6i.w)) + intBitsToFloat(R126i.w));
R3i.w = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(R2i.y));
R9i.y = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
}
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R9i.y;
backupReg1i = R0i.x;
R0i.x = 0x3f800000;
R9i.y = floatBitsToInt(intBitsToFloat(R7i.z) + intBitsToFloat(R2i.w));
R10i.z = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(R9i.z));
R126i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(backupReg1i));
// 1
backupReg0i = R10i.y;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.z), intBitsToFloat(R126i.w)));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(R126i.w)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R1i.y)) + intBitsToFloat(backupReg0i));
// 2
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R2i.z)) + intBitsToFloat(R123i.w));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(R126i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PV1ix)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(R0i.z)));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R9i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PV0iz)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PV0iz)));
R125i.y = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R6i.x)) + intBitsToFloat(PV1iw));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R1i.y)) + intBitsToFloat(PV1iz));
R1i.z = 0x3f800000;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R0i.w)) + intBitsToFloat(PV1ix));
// 5
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R6i.w)) + intBitsToFloat(R123i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R6i.z)) + intBitsToFloat(backupReg0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R2i.z)) + intBitsToFloat(R123i.y));
// 6
R1i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(R123i.w));
R6i.y = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(R123i.z));
R2i.z = floatBitsToInt(intBitsToFloat(R7i.z) + intBitsToFloat(R123i.x));
// 7
R127i.y = uf_remappedVS[15].x;
PV1iw = floatBitsToInt(-(intBitsToFloat(R7i.z)) + intBitsToFloat(R2i.z));
// 8
R125i.x = uf_remappedVS[15].z;
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(R125i.y));
R126i.w = uf_remappedVS[15].y;
// 9
PV1ix = ((0.0 > intBitsToFloat(PV0iz))?-1:0);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(PV0iz)));
PV1iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iz)), intBitsToFloat(PV0iz)));
// 10
R6i.x = uf_remappedVS[16].x;
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(uf_remappedVS[17].x)));
R7i.z = ((PV1ix == 0)?(PV1iy):(PV1iw));
// 11
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(uf_remappedVS[17].z)));
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(uf_remappedVS[17].y)));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(uf_remappedVS[18].w)));
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedVS[19].y)));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].z), intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].x), intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].y), intBitsToFloat(PV1iw)));
// 3
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(PV0iy)));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(PV1iw));
PV0iy = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV1iz));
PV0iw = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(PV1iy));
// 5
R3i.x = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(PV0ix));
R3i.y = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(PV0iw));
R9i.z = floatBitsToInt(intBitsToFloat(R9i.z) + intBitsToFloat(PV0iy));
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R9i.z),intBitsToFloat(R0i.x)),vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R1i.w = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R9i.z),intBitsToFloat(R0i.x)),vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R2i.z = tempi.x;
PV1iw = tempi.x;
PS1i = ((intBitsToFloat(R5i.x) > 0.5)?-1:0);
// 2
R2i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R9i.z),intBitsToFloat(R0i.x)),vec4(intBitsToFloat(uf_remappedVS[22].x),intBitsToFloat(uf_remappedVS[22].y),intBitsToFloat(uf_remappedVS[22].z),intBitsToFloat(uf_remappedVS[22].w))));
PV0iy = R2i.x;
PV0iz = R2i.x;
PV0iw = R2i.x;
R2i.w = ((PS1i == 0)?(R7i.x):(R4i.w));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R9i.z),intBitsToFloat(R0i.x)),vec4(intBitsToFloat(uf_remappedVS[23].x),intBitsToFloat(uf_remappedVS[23].y),intBitsToFloat(uf_remappedVS[23].z),intBitsToFloat(uf_remappedVS[23].w))));
PV1ix = tempi.x;
R13i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(uf_remappedVS[17].w)));
PV0iy = ((intBitsToFloat(R5i.y) > 0.5)?-1:0);
R0i.z = floatBitsToInt(intBitsToFloat(R2i.x) * 0.0 + intBitsToFloat(PV1ix));
PV0iw = PV1ix;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
// 5
R123i.x = floatBitsToInt(intBitsToFloat(R2i.x) * 0.0 + intBitsToFloat(PV0iw));
R6i.y = ((PV0iy == 0)?(R7i.y):(R11i.z));
R7i.z = floatBitsToInt(intBitsToFloat(R2i.x) * 0.5 + intBitsToFloat(PV0iw));
R0i.w = floatBitsToInt(1.0 / intBitsToFloat(R0i.z));
// 6
R10i.x = floatBitsToInt(intBitsToFloat(R1i.w) * 0.5 + intBitsToFloat(R123i.x));
R11i.y = floatBitsToInt(intBitsToFloat(R2i.z) * -(0.5) + intBitsToFloat(R123i.x));
PV0iz = floatBitsToInt(intBitsToFloat(R7i.z) * intBitsToFloat(R0i.w));
// 7
PV1ix = ((intBitsToFloat(R5i.z) > 0.5)?-1:0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(uf_remappedVS[1].w)) + -(intBitsToFloat(uf_remappedVS[1].y)));
// 8
R1i.x = ((PV1ix == 0)?(R7i.x):(R4i.w));
PV0iy = ((intBitsToFloat(R5i.w) > 0.5)?-1:0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R123i.z));
// 9
R4i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS0i));
R10i.y = ((PV0iy == 0)?(R7i.y):(R11i.z));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.w),intBitsToFloat(R9i.y),intBitsToFloat(R10i.z),intBitsToFloat(R1i.z)),vec4(intBitsToFloat(uf_remappedVS[22].x),intBitsToFloat(uf_remappedVS[22].y),intBitsToFloat(uf_remappedVS[22].z),intBitsToFloat(uf_remappedVS[22].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R126i.w = tempi.x;
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.w),intBitsToFloat(R9i.y),intBitsToFloat(R10i.z),intBitsToFloat(R1i.z)),vec4(intBitsToFloat(uf_remappedVS[23].x),intBitsToFloat(uf_remappedVS[23].y),intBitsToFloat(uf_remappedVS[23].z),intBitsToFloat(uf_remappedVS[23].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 12
PV0ix = PV1ix;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
R123i.w = floatBitsToInt(intBitsToFloat(R126i.w) * 0.0 + intBitsToFloat(PV1ix));
// 13
R123i.y = floatBitsToInt(intBitsToFloat(R126i.w) * 0.5 + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.w));
// 14
PV0ix = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(PS1i));
// 15
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].w), intBitsToFloat(PV0ix)));
// 16
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].y)) + intBitsToFloat(PV1iy));
// 17
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 18
R9i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS1i));
}
if( activeMaskStackC[3] == true ) {
// 0
R6i.x = uf_remappedVS[24].x;
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[25].x)));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(uf_remappedVS[25].x)));
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(uf_remappedVS[25].x)));
R1i.y = uf_remappedVS[24].y;
// 1
R6i.z = uf_remappedVS[26].x;
R6i.w = uf_remappedVS[24].z;
// 2
PS0i = int(intBitsToFloat(uf_remappedVS[27].z));
// 3
R126i.w = floatBitsToInt(float(PS0i));
// 4
PV0ix = floatBitsToInt((0.0 >= abs(intBitsToFloat(R126i.w)))?1.0:0.0);
PV0iz = floatBitsToInt(-(abs(intBitsToFloat(R126i.w))) + 0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.w));
// 5
R127i.y = ((intBitsToFloat(PV0ix) == 0.0)?(0):(PV0iz));
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[27].z));
// 6
PV0ix = floatBitsToInt(trunc(intBitsToFloat(PV1iz)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[27].x), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(abs(intBitsToFloat(R126i.w)) + intBitsToFloat(R127i.y));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[27].w));
// 7
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[27].y), intBitsToFloat(PS0i)));
R123i.z = ((-(intBitsToFloat(R127i.y)) > 0.0)?(PV0iw):(R127i.y));
R2i.y = int(intBitsToFloat(PV0ix));
// 8
R123i.x = ((intBitsToFloat(R126i.w) == 0.0)?(0):(R123i.z));
// 9
PS1i = int(intBitsToFloat(R123i.x));
// 10
R0i.x = floatBitsToInt(float(PS1i));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(uf_remappedVS[28].x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[28].y)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(uf_remappedVS[28].w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(uf_remappedVS[28].z)));
// 1
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[25].x), intBitsToFloat(PV0ix)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[25].x), intBitsToFloat(PV0iy)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(uf_remappedVS[29].x)));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) * 2.0);
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[25].x), intBitsToFloat(PV0iw)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(uf_remappedVS[29].y)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
// 2
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[30].z) + intBitsToFloat(uf_remappedVS[29].x));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[30].w) + intBitsToFloat(uf_remappedVS[29].y));
R127i.z = floatBitsToInt(float(R2i.y));
// 3
PV1ix = floatBitsToInt(-(intBitsToFloat(R126i.z)) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[31].x) + intBitsToFloat(uf_remappedVS[31].z));
PV1iz = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[31].y) + intBitsToFloat(uf_remappedVS[31].w));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.w)),intBitsToFloat(uf_remappedVS[30].x)) + -(intBitsToFloat(PV1ix)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(uf_remappedVS[31].z)) + intBitsToFloat(PV1iy));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(uf_remappedVS[31].w)) + intBitsToFloat(PV1iw));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w),intBitsToFloat(uf_remappedVS[30].y)) + intBitsToFloat(PV1iz));
// 5
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w),intBitsToFloat(uf_remappedVS[29].z)) + intBitsToFloat(R123i.y));
R2i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.y)),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.w));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w),intBitsToFloat(uf_remappedVS[29].w)) + intBitsToFloat(R123i.z));
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(backupReg0i)) + intBitsToFloat(R123i.x));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = uf_remappedVS[8].x & 0x100000;
PV0iy = uf_remappedVS[8].x & 0x200000;
PV0iz = uf_remappedVS[8].x & 0x80000;
PV0iw = uf_remappedVS[8].x & 0x400000;
PS0i = uf_remappedVS[8].y & int(1);
// 1
PV1ix = (PV0iz == 0x80000)?-1:0;
PV1iy = (PV0ix == 0x100000)?-1:0;
PV1iz = (PV0iw == 0x400000)?-1:0;
PV1iw = (PV0iy == 0x200000)?-1:0;
R125i.x = (int(1) != PS0i)?-1:0;
// 2
R123i.x = ((PV1iy == 0)?(R7i.y):(R6i.y));
R125i.y = ((PV1iw == 0)?(R7i.x):(R1i.x));
R123i.z = ((PV1ix == 0)?(R7i.x):(R2i.w));
R125i.w = ((PV1iz == 0)?(R7i.y):(R10i.y));
// 3
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R1i.z)) + -(0.5));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R0i.y)) + -(0.5));
R123i.z = ((R125i.x == 0)?(0):(int(1)));
PS1i = int(intBitsToFloat(uf_remappedVS[32].z));
// 4
PV0ix = (R123i.z == 0x2)?-1:0;
R127i.y = (R123i.z == int(1))?-1:0;
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R123i.y)) + -(intBitsToFloat(R2i.y)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R123i.x)) + intBitsToFloat(R6i.w));
R126i.w = floatBitsToInt(float(PS1i));
// 5
R123i.x = ((PV0ix == 0)?(R5i.y):(R5i.x));
R126i.y = ((R127i.y == 0)?(R5i.x):(R5i.y));
R123i.z = ((PV0ix == 0)?(R5i.x):(R5i.z));
R124i.w = ((R127i.y == 0)?(R5i.y):(R5i.z));
R127i.z = floatBitsToInt(-(abs(intBitsToFloat(R126i.w))) + 0.0);
// 6
PV0ix = floatBitsToInt((0.0 >= abs(intBitsToFloat(R126i.w)))?1.0:0.0);
R123i.y = ((R127i.y == 0)?(R123i.z):(R5i.y));
R126i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[33].z) + intBitsToFloat(uf_remappedVS[34].x));
R123i.w = ((R127i.y == 0)?(R123i.x):(R5i.z));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.w));
// 7
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[34].y), intBitsToFloat(R123i.w)));
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) * 2.0);
R127i.y = ((intBitsToFloat(PV0ix) == 0.0)?(0):(R127i.z));
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[34].x), intBitsToFloat(R123i.y)));
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 2.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[32].z));
// 8
PV0ix = floatBitsToInt(-(intBitsToFloat(PV1iw)) + intBitsToFloat(R126i.z));
PV0iy = floatBitsToInt(trunc(intBitsToFloat(PV1iz)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].x), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(abs(intBitsToFloat(R126i.w)) + intBitsToFloat(R127i.y));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[32].w));
// 9
backupReg0i = R127i.y;
R124i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.w)),intBitsToFloat(uf_remappedVS[33].x)) + -(intBitsToFloat(PV0ix)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].y), intBitsToFloat(PS0i)));
R123i.z = ((-(intBitsToFloat(backupReg0i)) > 0.0)?(PV0iw):(backupReg0i));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R126i.z)) + -(0.5));
PS1i = int(intBitsToFloat(PV0iy));
// 10
R123i.x = ((intBitsToFloat(R126i.w) == 0.0)?(0):(R123i.z));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R127i.y)) + -(0.5));
R6i.z = floatBitsToInt(intBitsToFloat(R127i.w) + 0.5);
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[33].w) + intBitsToFloat(uf_remappedVS[34].y));
R127i.z = floatBitsToInt(float(PS1i));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[35].x) + intBitsToFloat(uf_remappedVS[35].z));
R2i.y = floatBitsToInt(intBitsToFloat(R125i.z) + 0.5);
PV1iz = floatBitsToInt(-(intBitsToFloat(R125i.x)) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[35].y) + intBitsToFloat(uf_remappedVS[35].w));
PS1i = int(intBitsToFloat(R123i.x));
// 12
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w),intBitsToFloat(uf_remappedVS[33].y)) + intBitsToFloat(PV1iz));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].z),intBitsToFloat(R126i.y)) + intBitsToFloat(PV1ix));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].w),intBitsToFloat(R124i.w)) + intBitsToFloat(PV1iw));
R2i.w = 0;
PS0i = floatBitsToInt(float(PS1i));
// 13
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w),intBitsToFloat(uf_remappedVS[34].z)) + intBitsToFloat(R123i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)),intBitsToFloat(R127i.z)) + intBitsToFloat(backupReg0i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w),intBitsToFloat(uf_remappedVS[34].w)) + intBitsToFloat(R123i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(PS0i)) + intBitsToFloat(R124i.x));
R6i.w = 0;
// 14
PV0ix = floatBitsToInt(intBitsToFloat(R7i.z) * intBitsToFloat(R7i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R125i.y)) + -(intBitsToFloat(R123i.y)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(R5i.w)) + intBitsToFloat(R123i.w));
// 15
R123i.x = floatBitsToInt((intBitsToFloat(R11i.y) * intBitsToFloat(R11i.y) + intBitsToFloat(PV0ix)));
R10i.z = floatBitsToInt(intBitsToFloat(R123i.z) + 0.5);
R3i.w = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
// 16
R123i.z = floatBitsToInt((intBitsToFloat(R10i.x) * intBitsToFloat(R10i.x) + intBitsToFloat(R123i.x)));
// 17
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.z));
PS1i = floatBitsToInt(tempResultf);
// 18
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(PS1i)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(PS1i)));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(PS1i)));
}
if( activeMaskStackC[3] == true ) {
// 0
R124i.x = floatBitsToInt(intBitsToFloat(R9i.x) + -(intBitsToFloat(uf_remappedVS[36].z)));
PV0iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[36].z)) + intBitsToFloat(uf_remappedVS[36].w));
R6i.y = uf_remappedVS[37].x;
// 1
R125i.x = uf_remappedVS[38].y;
R125i.y = uf_remappedVS[39].y;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 2
PV0ix = uf_remappedVS[40].y;
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[13].x) + -(intBitsToFloat(R3i.x)));
PV0iz = floatBitsToInt(intBitsToFloat(R124i.x) * intBitsToFloat(PS1i));
PV0iz = clampFI32(PV0iz);
R124i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[13].y) + -(intBitsToFloat(R3i.y)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R5i.z)),vec4(-(intBitsToFloat(R125i.x)),-(intBitsToFloat(R125i.y)),-(intBitsToFloat(PV0ix)),-(intBitsToFloat(R6i.w)))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R0i.x = floatBitsToInt(-(intBitsToFloat(PV0iz)) + 1.0);
// 4
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[13].z) + -(intBitsToFloat(R9i.z)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(0x3edc28f6));
PV0iw = clampFI32(PV0iw);
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.y),intBitsToFloat(R124i.w),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.y),intBitsToFloat(R124i.w),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
tempResultf = max(0.0, intBitsToFloat(PV0iw));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R5i.z = floatBitsToInt(tempResultf);
// 6
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 7
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(PS0i)));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R9i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[41].x),intBitsToFloat(uf_remappedVS[41].y),intBitsToFloat(uf_remappedVS[41].z),0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
PV1iz = floatBitsToInt(min(intBitsToFloat(uf_remappedVS[13].y), intBitsToFloat(uf_remappedVS[42].z)));
R124i.w = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[43].z), intBitsToFloat(R5i.z)));
PV0iy = floatBitsToInt(-(intBitsToFloat(R9i.y)) + intBitsToFloat(PV1iz));
R127i.z = floatBitsToInt(-(intBitsToFloat(R124i.w)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(uf_remappedVS[44].x)) + -(intBitsToFloat(uf_remappedVS[44].y)));
R123i.w = clampFI32(R123i.w);
R122i.x = floatBitsToInt(intBitsToFloat(R124i.w) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[42].y),intBitsToFloat(PV0iy)) + intBitsToFloat(uf_remappedVS[42].x));
R123i.x = clampFI32(R123i.x);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(uf_remappedVS[45].x)) + -(intBitsToFloat(uf_remappedVS[45].y)));
R123i.y = clampFI32(R123i.y);
PV1iz = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(R122i.x)) + intBitsToFloat(0xbe593484));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(uf_remappedVS[46].w)));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[43].w)),intBitsToFloat(PS1i)) + 1.0);
PV0iz = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(R123i.w)) + intBitsToFloat(0x3fc90da4));
tempResultf = max(0.0, intBitsToFloat(PV1iz));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[43].x), intBitsToFloat(PS0i)));
R126i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[41].y) * 1.0 + intBitsToFloat(R4i.x));
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[41].y) + 1.0);
tempResultf = max(0.0, intBitsToFloat(PV0iz));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 6
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) * 1.5);
PV0ix = clampFI32(PV0ix);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[47].x), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[47].y), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R11i.y) * intBitsToFloat(R0i.w));
PV1iz = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R127i.w = floatBitsToInt(intBitsToFloat(PV0ix) * 15.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(R127i.y)));
R4i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
PV0iz = floatBitsToInt(-(intBitsToFloat(PV1ix)) + 1.0);
PS0i = floatBitsToInt(sqrt(intBitsToFloat(R127i.z)));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f22f983));
R123i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3f333333) + intBitsToFloat(0x3e19999a));
R123i.y = clampFI32(R123i.y);
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedVS[48].w)));
PS1i = floatBitsToInt(exp2(intBitsToFloat(R125i.y)));
// 10
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),-(intBitsToFloat(R124i.w))) + 1.0);
PV0iy = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R5i.z = 0;
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[47].z)),intBitsToFloat(PS1i)) + intBitsToFloat(uf_remappedVS[47].z));
R123i.w = clampFI32(R123i.w);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 11
R1i.x = ((0.0 >= intBitsToFloat(R0i.x))?-1:0);
PV1iy = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(PS0i));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) + 2.5);
PV1iw = floatBitsToInt(intBitsToFloat(R123i.w) + intBitsToFloat(0x80000000));
PV1iw = clampFI32(PV1iw);
R10i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
// 12
R3i.x = floatBitsToInt(max(intBitsToFloat(PV1iy), intBitsToFloat(0x3e4ccccd)));
R9i.y = PV1iw;
R9i.z = PV1iw;
R6i.w = 0;
R5i.x = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3daaaaab));
}
if( activeMaskStackC[3] == true ) {
R4i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y))).xyz);
R5i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R5i.x),intBitsToFloat(R5i.z))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R3i.x;
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[19].w), intBitsToFloat(uf_remappedVS[49].z)));
R3i.y = 0;
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[19].w), intBitsToFloat(uf_remappedVS[49].w)));
PV0iw = floatBitsToInt(min(intBitsToFloat(backupReg0i), 1.0));
R7i.x = 0;
// 1
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PV0iw)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(PV0iw)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PV0iw)));
R9i.w = ((R1i.x == 0)?(R1i.w):(R6i.w));
R4i.x = R12i.x;
// 2
R2i.x = ((R1i.x == 0)?(R2i.x):(R10i.w));
R7i.y = R12i.z;
R4i.z = R13i.x;
R11i.w = ((R1i.x == 0)?(R2i.z):(R3i.y));
R4i.y = R13i.y;
// 3
R123i.x = ((R1i.x == 0)?(0):(R0i.w));
R0i.y = ((R1i.x == 0)?(0):(0x3f800000));
R2i.z = R15i.z;
R1i.w = R6i.y;
R122i.x = ((R1i.x == 0)?(0):(R9i.x));
// 4
R16i.x = ((R0i.y == 0)?(R0i.w):(R123i.x));
R16i.y = ((R0i.y == 0)?(R9i.x):(R122i.x));
R123i.z = ((R1i.x == 0)?(0):(R9i.z));
R123i.w = ((R1i.x == 0)?(0):(R2i.w));
R122i.x = ((R1i.x == 0)?(0):(R127i.z));
// 5
R17i.x = ((R0i.y == 0)?(R127i.z):(R122i.x));
R123i.y = ((R1i.x == 0)?(0):(R126i.y));
R16i.z = ((R0i.y == 0)?(R9i.z):(R123i.z));
R16i.w = ((R0i.y == 0)?(R2i.w):(R123i.w));
R122i.x = ((R1i.x == 0)?(0):(R125i.x));
// 6
R123i.x = ((R1i.x == 0)?(0):(R9i.y));
R17i.y = ((R0i.y == 0)?(R126i.y):(R123i.y));
R17i.z = ((R0i.y == 0)?(R125i.x):(R122i.x));
R127i.w = ((R1i.x == 0)?(0):(R5i.z));
R126i.y = ((R1i.x == 0)?(0):(R5i.w));
// 7
backupReg0i = R9i.y;
backupReg1i = R123i.x;
R123i.x = ((R1i.x == 0)?(0):(R5i.x));
R9i.y = ((R1i.x == 0)?(0):(R4i.w));
R4i.z = ((R1i.x == 0)?(0):(R4i.z));
R17i.w = ((R0i.y == 0)?(backupReg0i):(backupReg1i));
R127i.z = ((R1i.x == 0)?(0):(R8i.z));
// 8
R18i.x = ((R0i.y == 0)?(R5i.x):(R123i.x));
R125i.y = ((R1i.x == 0)?(0):(R8i.w));
R9i.z = R15i.z;
R123i.w = ((R1i.x == 0)?(0):(R5i.y));
// 9
R5i.x = ((R1i.x == 0)?(0):(R4i.x));
R18i.y = ((R0i.y == 0)?(R5i.y):(R123i.w));
R18i.z = ((R0i.y == 0)?(R5i.z):(R127i.w));
R18i.w = ((R0i.y == 0)?(R5i.w):(R126i.y));
// 10
R123i.x = ((R1i.x == 0)?(0):(R8i.x));
R2i.w = ((R1i.x == 0)?(0):(R7i.y));
R122i.x = ((R1i.x == 0)?(0):(R8i.y));
// 11
R20i.x = ((R0i.y == 0)?(R8i.x):(R123i.x));
R20i.y = ((R0i.y == 0)?(R8i.y):(R122i.x));
R20i.z = ((R0i.y == 0)?(R8i.z):(R127i.z));
R20i.w = ((R0i.y == 0)?(R8i.w):(R125i.y));
// 12
R8i.x = ((R1i.x == 0)?(R15i.x):(R7i.x));
R5i.w = ((R1i.x == 0)?(R15i.y):(R6i.y));
// 13
R123i.y = ((R1i.x == 0)?(0):(R10i.x));
// 14
R21i.x = ((R0i.y == 0)?(R10i.x):(R123i.y));
R8i.w = uf_remappedVS[50].w;
}
if( activeMaskStackC[3] == true ) {
// 0
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[33].y),intBitsToFloat(R3i.x)) + intBitsToFloat(R3i.w));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[30].y), intBitsToFloat(R1i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[33].y), intBitsToFloat(R1i.z)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[30].y),intBitsToFloat(R3i.x)) + intBitsToFloat(R6i.z));
// 1
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R8i.w)) + intBitsToFloat(R2i.y));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),intBitsToFloat(PV0iz)) + intBitsToFloat(R10i.z));
R123i.z = ((R1i.x == 0)?(0):(R127i.w));
R124i.w = ((R1i.x == 0)?(0):(R124i.x));
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(R0i.x)) + 0.0);
// 2
R123i.x = ((R1i.x == 0)?(R0i.x):(R7i.x));
R123i.y = ((R1i.x == 0)?(0):(R125i.y));
R127i.z = ((R1i.x == 0)?(0):(R11i.y));
R123i.w = ((R1i.x == 0)?(0):(R125i.x));
R19i.x = ((R0i.y == 0)?(R127i.w):(R123i.z));
// 3
R15i.x = ((R0i.y == 0)?(R123i.x):(R8i.x));
R19i.y = ((R0i.y == 0)?(R125i.x):(R123i.w));
R19i.z = ((R0i.y == 0)?(R124i.x):(R124i.w));
R19i.w = ((R0i.y == 0)?(R125i.y):(R123i.y));
R15i.y = ((R0i.y == 0)?(R1i.w):(R5i.w));
// 4
R123i.x = ((R1i.x == 0)?(0):(R6i.x));
R21i.y = ((R0i.y == 0)?(R11i.y):(R127i.z));
R15i.z = ((R0i.y == 0)?(R2i.z):(R9i.z));
// 5
R22i.x = ((R0i.y == 0)?(R6i.x):(R123i.x));
R123i.y = ((R1i.x == 0)?(0):(R1i.y));
R123i.z = ((R1i.x == 0)?(0):(R0i.z));
R123i.w = ((R1i.x == 0)?(0):(R7i.z));
R122i.x = ((R1i.x == 0)?(0):(R4i.w));
// 6
R123i.x = ((R1i.x == 0)?(0):(R3i.z));
R22i.y = ((R0i.y == 0)?(R1i.y):(R123i.y));
R21i.z = ((R0i.y == 0)?(R7i.z):(R123i.w));
R21i.w = ((R0i.y == 0)?(R0i.z):(R123i.z));
R22i.z = ((R0i.y == 0)?(R4i.w):(R122i.x));
// 7
backupReg0i = R123i.x;
R123i.x = ((R1i.x == 0)?(0):(R7i.w));
R123i.y = ((R1i.x == 0)?(0):(R12i.y));
R123i.z = ((R1i.x == 0)?(0):(R11i.z));
R22i.w = ((R0i.y == 0)?(R3i.z):(backupReg0i));
// 8
R10i.x = ((R0i.y == 0)?(R12i.y):(R123i.y));
R10i.y = ((R0i.y == 0)?(R7i.w):(R123i.x));
R10i.z = ((R0i.y == 0)?(R11i.z):(R123i.z));
R123i.w = ((R1i.x == 0)?(0):(R11i.x));
R122i.x = ((R1i.x == 0)?(R14i.x):(R6i.w));
// 9
R14i.x = ((R0i.y == 0)?(R9i.w):(R122i.x));
R123i.y = ((R1i.x == 0)?(R14i.y):(R3i.y));
R123i.z = ((R1i.x == 0)?(R14i.z):(R10i.w));
R10i.w = ((R0i.y == 0)?(R11i.x):(R123i.w));
PS1i = R12i.x;
// 10
R12i.x = ((R0i.y == 0)?(PS1i):(R5i.x));
R14i.y = ((R0i.y == 0)?(R11i.w):(R123i.y));
R14i.z = ((R0i.y == 0)?(R2i.x):(R123i.z));
R123i.w = ((R1i.x == 0)?(R14i.w):(R13i.y));
PS0i = R12i.z;
// 11
PV1ix = R13i.x;
R12i.y = ((R0i.y == 0)?(PS0i):(R2i.w));
R14i.w = ((R0i.y == 0)?(R4i.y):(R123i.w));
// 12
R12i.z = ((R0i.y == 0)?(PV1ix):(R4i.z));
R12i.w = R9i.y;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R22i.x), intBitsToFloat(R22i.y), intBitsToFloat(R22i.z), intBitsToFloat(R22i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R21i.x), intBitsToFloat(R21i.y), intBitsToFloat(R21i.z), intBitsToFloat(R21i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.z));
}
