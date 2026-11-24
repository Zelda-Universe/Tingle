#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 961cf134642327cc
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[68];
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
out vec4 passParameterSem3;
out vec4 passParameterSem7;
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
ivec4 R23i = ivec4(0);
ivec4 R24i = ivec4(0);
ivec4 R25i = ivec4(0);
ivec4 R26i = ivec4(0);
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
R10i.z = floatBitsToInt(-(intBitsToFloat(R10i.y)) + 1.0);
R0i.w = 0;
R6i.w = floatBitsToInt(1.0);
// 1
R15i.w = floatBitsToInt(-(intBitsToFloat(R5i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R22i.w = floatBitsToInt(-(intBitsToFloat(R10i.x)) + 1.0);
// 2
predResult = (0.0 > intBitsToFloat(R15i.w));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R23i.x = 0;
R23i.y = 0;
R23i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R22i.x = 0;
// 1
R5i.w = R6i.w;
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
PS0i = int(intBitsToFloat(R4i.w));
// 1
R24i.x = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R15i.w) >= intBitsToFloat(R24i.x));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R23i.x = 0;
R23i.y = 0;
R23i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R22i.x = 0;
// 1
R0i.w = R6i.w;
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
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(uf_remappedVS[2].y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(uf_remappedVS[2].z)));
PV0iw = floatBitsToInt(max(intBitsToFloat(R8i.x), 0.0));
// 1
PV1iz = floatBitsToInt(min(intBitsToFloat(PV0iw), 0.0));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(uf_remappedVS[3].w)));
// 2
R0i.x = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(PV1iz));
R14i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(R15i.w));
// 3
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[2].x)));
// 4
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(uf_remappedVS[3].y)));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[3].z)));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(uf_remappedVS[3].y)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R17i.x = ((intBitsToFloat(uf_remappedVS[4].x) == 1.0)?-1:0);
R12i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].x)) + 1.0);
// 1
predResult = (R17i.x != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.z), intBitsToFloat(R14i.z)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].w), intBitsToFloat(PV0ix)));
// 2
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].x), intBitsToFloat(PV1iw)));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), intBitsToFloat(PV1iw)));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].z), intBitsToFloat(PV1iw)));
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
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.z), intBitsToFloat(PS1i)));
R127i.y = ((intBitsToFloat(uf_remappedVS[4].x) == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R12i.y));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R14i.z) + -(intBitsToFloat(PV1iz)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].w), intBitsToFloat(PV1ix)));
// 9
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].x), intBitsToFloat(PV0iw)));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), intBitsToFloat(PV0iw)));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].z), intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = uf_remappedVS[6].x & 0x20000;
R127i.y = uf_remappedVS[6].x & 0x10000;
PV0iz = floatBitsToInt(intBitsToFloat(R8i.y) + intBitsToFloat(R8i.z));
R125i.w = uf_remappedVS[6].x & 0x40000;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[7].z));
// 1
R126i.x = floatBitsToInt(intBitsToFloat(PV0iz) * 0.5);
R126i.y = R8i.z;
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) * 2.0);
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].x) * intBitsToFloat(PS0i));
R124i.w = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(R8i.y));
R127i.w = floatBitsToInt(float(PV0ix));
// 2
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PV1iz))?1.0:0.0);
PV0iy = floatBitsToInt((intBitsToFloat(PV1iz) > 0.0)?1.0:0.0);
R127i.z = floatBitsToInt(max(intBitsToFloat(PV1iz), -(intBitsToFloat(PV1iz))));
R126i.w = floatBitsToInt((intBitsToFloat(R127i.w) > 0.0)?1.0:0.0);
R127i.x = floatBitsToInt(float(R127i.y));
// 3
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(R127i.w))?1.0:0.0);
R127i.y = ((intBitsToFloat(R127i.z) > 1.0)?-1:0);
R126i.z = floatBitsToInt((intBitsToFloat(R127i.x) > 0.0)?1.0:0.0);
R127i.w = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R126i.w) + -(intBitsToFloat(PV1ix)));
R123i.y = ((R127i.y == 0)?(R127i.z):(PS1i));
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(R127i.x))?1.0:0.0);
R126i.w = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x3fc90fdb));
PS0i = floatBitsToInt(float(R125i.w));
// 5
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt(intBitsToFloat(R126i.z) + -(intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iw = floatBitsToInt(min(intBitsToFloat(R123i.y), 1.0));
R125i.w = int(intBitsToFloat(PV0ix));
// 6
R124i.x = floatBitsToInt(((R127i.y == 0)?(intBitsToFloat(R127i.w)):(-(intBitsToFloat(R127i.w)))));
R125i.y = ((R127i.y == 0)?(0):(R126i.w));
R126i.z = floatBitsToInt(max(intBitsToFloat(PV1iw), -(1.0)));
R127i.w = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iz)));
R125i.x = int(intBitsToFloat(PV1iy));
// 7
backupReg0i = R126i.y;
backupReg1i = R124i.w;
R127i.x = R8i.y;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R126i.z)));
PV1iz = 0 - R125i.w;
R124i.w = floatBitsToInt(floor(intBitsToFloat(backupReg0i)));
R127i.z = floatBitsToInt(intBitsToFloat(backupReg1i) * 0.5);
// 8
R123i.x = floatBitsToInt(intBitsToFloat(0x3edcf805) * intBitsToFloat(R126i.y) + 1.0);
R127i.y = max(R125i.w, PV1iz);
R123i.z = floatBitsToInt(intBitsToFloat(0x3d6ee04d) * intBitsToFloat(R126i.y) + intBitsToFloat(0x3f43b24e));
R125i.w = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(R8i.z));
R0i.x = floatBitsToInt(intBitsToFloat(R126i.x) + -(0.5));
R0i.x = floatBitsToInt(intBitsToFloat(R0i.x) * 2.0);
// 9
backupReg0i = R127i.x;
backupReg1i = R127i.w;
R127i.x = 0 - R125i.x;
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R123i.z)) + 1.0);
R125i.z = floatBitsToInt(floor(intBitsToFloat(backupReg0i)));
R127i.w = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R126i.z)), intBitsToFloat(R123i.x)));
R124i.z = int(intBitsToFloat(backupReg1i));
// 10
R126i.x = R8i.x;
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) * 2.0);
R126i.y = floatBitsToInt((intBitsToFloat(uf_remappedVS[7].x) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(R124i.w))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(R124i.w) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R123i.y));
// 11
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[7].x))?1.0:0.0);
R124i.y = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
R12i.z = max(R125i.x, R127i.x);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PS0i)));
R0i.z = floatBitsToInt(intBitsToFloat(R125i.w) * 0.5);
// 12
R125i.x = floatBitsToInt(intBitsToFloat(R126i.y) + -(intBitsToFloat(PV1ix)));
R0i.y = floatBitsToInt(intBitsToFloat(R127i.z) + -(0.5));
R0i.y = floatBitsToInt(intBitsToFloat(R0i.y) * 2.0);
R123i.z = ((intBitsToFloat(R126i.z) > 0.0)?(PV1iw):(floatBitsToInt(-(intBitsToFloat(PV1iw)))));
PV0iw = 0 - R124i.z;
R127i.x = floatBitsToInt(float(R127i.y));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
// 13
backupReg0i = R125i.z;
PV1ix = floatBitsToInt((intBitsToFloat(backupReg0i) > 0.0)?1.0:0.0);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R123i.z)) + intBitsToFloat(R125i.y));
R125i.z = floatBitsToInt(floor(intBitsToFloat(R126i.x)));
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(backupReg0i))?1.0:0.0);
R126i.x = max(R124i.z, PV0iw);
// 14
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(R125i.y))?1.0:0.0);
PV0iy = floatBitsToInt((intBitsToFloat(R125i.y) > 0.0)?1.0:0.0);
R124i.z = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iw)));
R6i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.x)), intBitsToFloat(R124i.y)));
R0i.w = floatBitsToInt(intBitsToFloat(R0i.z) + -(0.5));
R0i.w = floatBitsToInt(intBitsToFloat(R0i.w) * 2.0);
// 15
R12i.x = floatBitsToInt(intBitsToFloat(R8i.y) + -(0.5));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(R125i.z))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(R125i.z) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(float(R12i.z));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 16
backupReg0i = R124i.z;
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt(-(intBitsToFloat(R125i.x)) + intBitsToFloat(PV1iw));
R124i.z = ((intBitsToFloat(uf_remappedVS[7].x) == 0.0)?-1:0);
R7i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(backupReg0i)));
PS0i = floatBitsToInt(float(R126i.x));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 17
PV1ix = ((0.0 > intBitsToFloat(uf_remappedVS[7].z))?-1:0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3fc90fdb));
R12i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(PV0ix)));
R12i.w = floatBitsToInt(intBitsToFloat(R8i.x) + -(0.5));
R13i.x = floatBitsToInt(intBitsToFloat(R8i.z) + -(0.5));
// 18
backupReg0i = R124i.z;
PV0ix = floatBitsToInt(intBitsToFloat(R125i.y) + -(intBitsToFloat(PV1iy)));
R125i.y = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(0x3fc90fdb));
R124i.z = ((intBitsToFloat(uf_remappedVS[7].z) == 0.0)?-1:0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1ix)));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[4].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 19
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R13i.z)));
PV1iy = uf_remappedVS[8].y;
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) / 2.0);
R123i.z = ((PV0iw == 0)?(PV0ix):(0x40490fdb));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.z), intBitsToFloat(PS0i)));
R125i.z = floatBitsToInt(1.0 / intBitsToFloat(R12i.y));
// 20
R16i.x = 0x3f800000;
R12i.y = ((R124i.z == 0)?(R123i.z):(R125i.y));
PV0iz = uf_remappedVS[8].x;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
PV0iw = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(PV1iy));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iw)));
// 21
PV1ix = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PV1iy = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(PV0iz));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y), intBitsToFloat(PV0iw)));
R14i.w = floatBitsToInt(intBitsToFloat(R8i.x) + 1.0);
R7i.x = floatBitsToInt(intBitsToFloat(R8i.y) + 1.0);
// 22
backupReg0i = R14i.x;
R14i.x = floatBitsToInt(intBitsToFloat(R8i.z) + 1.0);
R7i.y = ((intBitsToFloat(R15i.w) == 0.0)?-1:0);
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1iy)));
R13i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(R125i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[9].x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[9].y)));
R126i.z = ((intBitsToFloat(uf_remappedVS[10].w) == 1.0)?-1:0);
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[10].w)) + 1.0);
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[10].w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
R125i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[10].y) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[9].z)));
R125i.z = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(uf_remappedVS[10].x));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.w), intBitsToFloat(PS0i)));
R124i.z = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R7i.w)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.x), intBitsToFloat(uf_remappedVS[11].y)));
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[10].z) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R6i.w)));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iw)));
// 3
PV1ix = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R124i.y = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV0ix));
R125i.z = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R12i.z)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.w), intBitsToFloat(uf_remappedVS[11].x)));
// 4
R125i.x = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1iw));
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(R124i.z));
R127i.z = floatBitsToInt(intBitsToFloat(PS1i) + 0.0);
R127i.w = floatBitsToInt(intBitsToFloat(R125i.y) + 0.0);
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.x), intBitsToFloat(uf_remappedVS[11].z)));
// 5
R123i.x = ((R126i.z == 0)?(PV0iy):(R15i.w));
R125i.y = floatBitsToInt(intBitsToFloat(PS0i) + 0.0);
R126i.z = ((R17i.x == 0)?(R13i.w):(R14i.z));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.w), intBitsToFloat(uf_remappedVS[12].x)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(uf_remappedVS[12].x)));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R123i.x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R126i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R123i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R123i.x)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R126i.z)));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R126i.z)));
R125i.y = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(PV0iy));
// 8
R123i.x = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iz = floatBitsToInt(intBitsToFloat(R9i.y) + intBitsToFloat(R125i.z));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R12i.y));
R125i.z = floatBitsToInt(intBitsToFloat(R9i.z) + intBitsToFloat(PV1iw));
// 9
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(R125i.y)));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(PV0iz)));
// 10
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(R125i.z)));
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R124i.x = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV1iz));
// 11
R126i.x = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
R123i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R125i.z = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R124i.w = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(R125i.y));
R126i.z = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(PV0iy));
// 12
backupReg0i = R7i.y;
R125i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.x), intBitsToFloat(uf_remappedVS[12].x)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R24i.x), intBitsToFloat(uf_remappedVS[13].w)));
R4i.w = ((backupReg0i == 0)?(R15i.w):(0x3f800000));
R127i.x = floatBitsToInt(cos((intBitsToFloat(R125i.z))/0.1591549367));
// 13
R5i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R124i.w),intBitsToFloat(R126i.z),intBitsToFloat(R16i.x))));
PV1iy = R5i.x;
PV1iz = R5i.x;
PV1iw = R5i.x;
R127i.w = floatBitsToInt(sin((intBitsToFloat(R125i.x))/0.1591549367));
// 14
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R127i.w)));
R127i.y = floatBitsToInt(sin((intBitsToFloat(R125i.z))/0.1591549367));
// 15
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R127i.w)));
R125i.z = floatBitsToInt(cos((intBitsToFloat(R125i.x))/0.1591549367));
// 16
backupReg0i = R125i.z;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(backupReg0i)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(backupReg0i)));
R125i.y = floatBitsToInt(sin((intBitsToFloat(R126i.x))/0.1591549367));
// 17
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R125i.w)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R125i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R127i.z)));
R1i.w = floatBitsToInt(-(intBitsToFloat(R125i.y)));
R126i.x = floatBitsToInt(cos((intBitsToFloat(R126i.x))/0.1591549367));
// 18
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R126i.x)));
R1i.y = floatBitsToInt(-(intBitsToFloat(R124i.y)) + intBitsToFloat(PV1iz));
R1i.z = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(PV1ix));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R126i.x)));
R4i.y = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(PV1iy));
// 19
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R126i.x)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R15i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R124i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R15i.x)));
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R126i.x)));
// 20
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R15i.x)));
R9i.y = floatBitsToInt(-(intBitsToFloat(R127i.z)) + intBitsToFloat(PV1iz));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z),intBitsToFloat(R1i.w)) + intBitsToFloat(PV1iw));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z),intBitsToFloat(R1i.x)) + intBitsToFloat(PV1iy));
// 21
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R124i.w),intBitsToFloat(R126i.z),intBitsToFloat(R16i.x))));
PV1ix = tempi.x;
R12i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R4i.y)) + intBitsToFloat(R123i.w));
// 22
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R4i.x)) + intBitsToFloat(R127i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z),intBitsToFloat(R14i.x)) + intBitsToFloat(backupReg0i));
// 23
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R124i.w),intBitsToFloat(R126i.z),intBitsToFloat(R16i.x))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R9i.z = tempi.x;
PV1iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R9i.y)) + intBitsToFloat(R123i.y));
// 24
R0i.x = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(R126i.x));
R0i.y = floatBitsToInt(intBitsToFloat(R12i.y) + intBitsToFloat(R125i.z));
R2i.z = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R122i.x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R124i.z));
// 25
backupReg0i = R4i.w;
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R127i.w)));
R7i.y = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(R7i.y));
R0i.z = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(R126i.y));
R4i.w = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(R126i.w));
R3i.z = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(PS0i));
R3i.z = clampFI32(R3i.z);
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R4i.w) + intBitsToFloat(R0i.z));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R1i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R1i.y)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R1i.w)) + intBitsToFloat(R3i.x));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R1i.x)) + intBitsToFloat(PV0iz));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R14i.x)) + intBitsToFloat(PV0iy));
R2i.w = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(PV0ix));
// 2
R18i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R4i.x)) + intBitsToFloat(R127i.w));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R4i.y)) + intBitsToFloat(R123i.x));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R9i.y)) + intBitsToFloat(R123i.z));
// 3
predResult = (intBitsToFloat(uf_remappedVS[14].y) != 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = uf_remappedVS[15].w;
PV0iy = uf_remappedVS[16].w;
// 1
R127i.x = floatBitsToInt(-(intBitsToFloat(R0i.x)) + intBitsToFloat(PV0iy));
R127i.y = floatBitsToInt(-(intBitsToFloat(R0i.y)) + intBitsToFloat(PV0ix));
PV1iw = uf_remappedVS[17].w;
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[14].y));
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
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(PV1ix)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[16].w) + intBitsToFloat(uf_remappedVS[15].w));
PV0iy = floatBitsToInt(-(intBitsToFloat(R12i.y)) + intBitsToFloat(R0i.y));
R1i.w = 0x3f800000;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R14i.y));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(uf_remappedVS[17].w));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(uf_remappedVS[18].w)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(uf_remappedVS[18].z)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 2
PV0ix = ((0.0 > intBitsToFloat(PV1iw))?-1:0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), intBitsToFloat(uf_remappedVS[13].x)));
R127i.z = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3dd70a3d));
PV0iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iw)), intBitsToFloat(PV1iw)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(PV1iw)));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(R127i.y));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].z), intBitsToFloat(uf_remappedVS[18].w)));
R0i.w = ((PV0ix == 0)?(PS0i):(PV0iw));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].y), intBitsToFloat(uf_remappedVS[18].z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1ix));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV0iy));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(PV0ix)));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e22f983) + 0.5);
// 6
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1ix));
// 7
R123i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 8
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
R127i.z = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
// 9
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS1i = floatBitsToInt(sin((intBitsToFloat(R127i.z))/0.1591549367));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R126i.z)));
PS0i = floatBitsToInt(cos((intBitsToFloat(R127i.z))/0.1591549367));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS0i)));
R1i.z = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV0iw));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R126i.y)));
R2i.w = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(PV1ix));
// 13
R2i.z = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(PV0ix));
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R5i.x) + -(intBitsToFloat(uf_remappedVS[19].x)));
R126i.y = floatBitsToInt(intBitsToFloat(R12i.y) + -(intBitsToFloat(uf_remappedVS[19].y)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[20].w)));
// 1
PV1iz = floatBitsToInt(intBitsToFloat(R9i.z) + -(intBitsToFloat(uf_remappedVS[19].z)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(PV1iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(PV1iz),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
R0i.y = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
}
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R0i.y;
PV0ix = floatBitsToInt(min(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[21].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].y), intBitsToFloat(R0i.z)));
R126i.z = floatBitsToInt(max(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[21].y)));
R0i.w = ((intBitsToFloat(backupReg0i) > intBitsToFloat(uf_remappedVS[21].x))?-1:0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[21].x));
// 1
R0i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(PS0i));
R1i.w = R1i.w;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[21].y));
// 2
R1i.y = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS1i));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[20].x), intBitsToFloat(R0i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[20].z), intBitsToFloat(R0i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[20].y), intBitsToFloat(R0i.y)));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV0iz)));
R6i.w = 0x3f800000;
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(PV1iw));
PV0iy = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV1iy));
// 3
PV1ix = floatBitsToInt(-(intBitsToFloat(R12i.y)) + intBitsToFloat(PV0iy));
R0i.y = uf_remappedVS[22].x;
R126i.z = floatBitsToInt(-(intBitsToFloat(R9i.z)) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(-(intBitsToFloat(R5i.x)) + intBitsToFloat(PV0iz));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R1i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R0i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R0i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R0i.x)));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R1i.y)));
// 5
backupReg0i = R126i.z;
PV1ix = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV0iz));
R126i.y = floatBitsToInt(intBitsToFloat(R9i.z) + intBitsToFloat(PV0iw));
R126i.z = floatBitsToInt(intBitsToFloat(R12i.y) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R1i.y)));
PS1i = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV0ix));
// 6
R2i.x = ((R0i.w == 0)?(PV1ix):(PS1i));
PV0iy = floatBitsToInt(intBitsToFloat(R9i.z) + intBitsToFloat(PV1iw));
R1i.z = uf_remappedVS[22].y;
PV0iw = floatBitsToInt(intBitsToFloat(R12i.y) + intBitsToFloat(R127i.x));
R2i.z = uf_remappedVS[22].z;
// 7
R0i.x = uf_remappedVS[23].x;
R4i.y = ((R0i.w == 0)?(R126i.z):(PV0iw));
R4i.z = ((R0i.w == 0)?(R126i.y):(PV0iy));
R0i.w = uf_remappedVS[24].x;
R1i.x = uf_remappedVS[24].y;
// 8
R2i.w = uf_remappedVS[24].z;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R24i.x));
// 9
R5i.z = uf_remappedVS[25].z;
R5i.w = uf_remappedVS[25].w;
R3i.z = floatBitsToInt(intBitsToFloat(R15i.w) * intBitsToFloat(PS0i));
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[26].x),intBitsToFloat(uf_remappedVS[26].y),intBitsToFloat(uf_remappedVS[26].z),intBitsToFloat(uf_remappedVS[26].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R6i.z = tempi.x;
PV0iw = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[27].x),intBitsToFloat(uf_remappedVS[27].y),intBitsToFloat(uf_remappedVS[27].z),intBitsToFloat(uf_remappedVS[27].w))));
PV1ix = tempi.x;
R5i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[28].x),intBitsToFloat(uf_remappedVS[28].y),intBitsToFloat(uf_remappedVS[28].z),intBitsToFloat(uf_remappedVS[28].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R4i.w = tempi.x;
// 3
R12i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[29].x),intBitsToFloat(uf_remappedVS[29].y),intBitsToFloat(uf_remappedVS[29].z),intBitsToFloat(uf_remappedVS[29].w))));
PV1iy = R12i.x;
PV1iz = R12i.x;
PV1iw = R12i.x;
// 4
R6i.x = floatBitsToInt(intBitsToFloat(R4i.w) * 0.0 + intBitsToFloat(R12i.x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[30].x)));
PV0iz = R12i.x;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(uf_remappedVS[30].y)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(uf_remappedVS[30].z)));
// 5
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[30].w)));
R123i.y = floatBitsToInt(intBitsToFloat(R4i.w) * 0.0 + intBitsToFloat(PV0iz));
R7i.w = floatBitsToInt(intBitsToFloat(R4i.w) * 0.5 + intBitsToFloat(PV0iz));
R3i.w = floatBitsToInt(1.0 / intBitsToFloat(R6i.x));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R7i.w) * intBitsToFloat(R3i.w));
R7i.y = floatBitsToInt(intBitsToFloat(R6i.z) * 0.5 + intBitsToFloat(R123i.y));
R7i.z = floatBitsToInt(intBitsToFloat(R5i.y) * -(0.5) + intBitsToFloat(R123i.y));
// 7
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(uf_remappedVS[1].w)) + -(intBitsToFloat(uf_remappedVS[1].y)));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R12i.y),intBitsToFloat(R9i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(uf_remappedVS[28].x),intBitsToFloat(uf_remappedVS[28].y),intBitsToFloat(uf_remappedVS[28].z),intBitsToFloat(uf_remappedVS[28].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R127i.w = tempi.x;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R123i.z));
// 9
R0i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS0i));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R12i.y),intBitsToFloat(R9i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(uf_remappedVS[29].x),intBitsToFloat(uf_remappedVS[29].y),intBitsToFloat(uf_remappedVS[29].z),intBitsToFloat(uf_remappedVS[29].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 11
PV1iy = PV0ix;
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) / 2.0);
R123i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 0.0 + intBitsToFloat(PV0ix));
// 12
R123i.x = floatBitsToInt(intBitsToFloat(R127i.w) * 0.5 + intBitsToFloat(PV1iy));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R123i.w));
// 13
PV1iy = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(PS0i));
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].w), intBitsToFloat(PV1iy)));
// 15
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].y)) + intBitsToFloat(PV0ix));
// 16
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 17
R3i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS0i));
// 18
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(uf_remappedVS[31].y)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[31].x)));
R2i.z = ((intBitsToFloat(R8i.x) > 0.5)?-1:0);
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(uf_remappedVS[31].z)));
}
if( activeMaskStackC[3] == true ) {
// 0
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[32].x)));
PV0iy = floatBitsToInt((intBitsToFloat(uf_remappedVS[33].w) > 0.0)?1.0:0.0);
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(uf_remappedVS[32].x)));
R10i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(uf_remappedVS[32].x)));
PS0i = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[33].w))?1.0:0.0);
// 1
R127i.x = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PS0i)));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].x), intBitsToFloat(R1i.y)));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].x), intBitsToFloat(R1i.x)));
R9i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].x), intBitsToFloat(R0i.w)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[33].w));
// 2
PV0ix = uf_remappedVS[6].x & 0x80000;
R126i.y = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
PV0iz = floatBitsToInt(intBitsToFloat(R15i.w) * intBitsToFloat(PS1i));
R127i.w = ((R2i.z == 0)?(R10i.x):(R22i.w));
PS0i = uf_remappedVS[6].x & 0x100000;
// 3
PV1ix = (PV0ix == 0x80000)?-1:0;
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(uf_remappedVS[34].x)) + intBitsToFloat(PV0iz));
R126i.z = (PS0i == 0x100000)?-1:0;
PV1iw = ((intBitsToFloat(R8i.y) > 0.5)?-1:0);
PS1i = uf_remappedVS[6].x & 0x200000;
// 4
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R123i.y = ((PV1iw == 0)?(R10i.y):(R10i.z));
R1i.z = ((PV1ix == 0)?(R10i.x):(R127i.w));
R127i.w = (PS1i == 0x200000)?-1:0;
PS0i = ((intBitsToFloat(R8i.z) > 0.5)?-1:0);
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV0ix)));
R1i.y = ((R126i.z == 0)?(R10i.y):(R123i.y));
R123i.z = ((PS0i == 0)?(R10i.x):(R22i.w));
PV1iw = uf_remappedVS[6].x & 0x400000;
PS1i = ((intBitsToFloat(R8i.w) > 0.5)?-1:0);
// 6
R1i.x = ((R127i.w == 0)?(R10i.x):(R123i.z));
R123i.y = ((PS1i == 0)?(R10i.y):(R10i.z));
PV0iz = (PV1iw == 0x400000)?-1:0;
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R126i.y)) + intBitsToFloat(PV1ix));
// 7
R2i.z = uf_remappedVS[6].x & 0x800000;
R1i.w = ((PV0iz == 0)?(R10i.y):(R123i.y));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].w)) + intBitsToFloat(uf_remappedVS[36].w));
R126i.y = floatBitsToInt(intBitsToFloat(R0i.w) + -(intBitsToFloat(uf_remappedVS[36].w)));
R126i.z = floatBitsToInt(intBitsToFloat(R0i.w) + -(intBitsToFloat(uf_remappedVS[35].w)));
// 1
R127i.x = ((intBitsToFloat(R126i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].x)) + intBitsToFloat(uf_remappedVS[36].x));
R127i.z = ((intBitsToFloat(R126i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.w = (R2i.z == 0x800000)?-1:0;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(PS1i));
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[36].x)) + intBitsToFloat(uf_remappedVS[37].x));
PS0i = ((intBitsToFloat(R8i.y) > 0.5)?-1:0);
// 3
PV1ix = floatBitsToInt(intBitsToFloat(R0i.w) + -(intBitsToFloat(uf_remappedVS[37].w)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(PV0iz)) + intBitsToFloat(uf_remappedVS[35].x));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0ix)));
R123i.w = ((PS0i == 0)?(R10i.x):(R22i.w));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].x), intBitsToFloat(PV0iy)));
// 4
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(PV1iz)) + intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[36].w)) + intBitsToFloat(uf_remappedVS[37].w));
R0i.z = ((R127i.w == 0)?(R10i.x):(R123i.w));
R127i.w = ((intBitsToFloat(PV1ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS0i = ((intBitsToFloat(R8i.z) > 0.5)?-1:0);
// 5
PV1ix = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
PV1iy = uf_remappedVS[6].x & 0x1000000;
R127i.z = ((PS0i == 0)?(R10i.y):(R10i.z));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS1i));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV1ix)));
PV0iz = (PV1iy == 0x1000000)?-1:0;
PV0iw = uf_remappedVS[6].y & int(1);
// 7
R10i.x = (int(1) != PV0iw)?-1:0;
R0i.y = ((PV0iz == 0)?(R10i.y):(R127i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(PV0ix)) + intBitsToFloat(uf_remappedVS[36].x));
// 8
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R127i.y)) + intBitsToFloat(R126i.x));
// 9
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[37].x),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.w));
}
if( activeMaskStackC[3] == true ) {
// 0
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(uf_remappedVS[31].w)));
PS0i = int(intBitsToFloat(uf_remappedVS[38].z));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[39].z) + intBitsToFloat(uf_remappedVS[40].x));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(uf_remappedVS[40].x)));
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) * 2.0);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(uf_remappedVS[40].y)));
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 2.0);
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[39].w) + intBitsToFloat(uf_remappedVS[40].y));
R127i.y = floatBitsToInt(float(PS0i));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(PV1iz)) + intBitsToFloat(PV1iw));
PV0iy = floatBitsToInt(-(abs(intBitsToFloat(R127i.y))) + 0.0);
PV0iz = floatBitsToInt((0.0 >= abs(intBitsToFloat(R127i.y)))?1.0:0.0);
PV0iw = floatBitsToInt(-(intBitsToFloat(PV1iy)) + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R15i.w)),intBitsToFloat(uf_remappedVS[39].x)) + -(intBitsToFloat(PV0iw)));
R127i.z = ((intBitsToFloat(PV0iz) == 0.0)?(0):(PV0iy));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.w),intBitsToFloat(uf_remappedVS[39].y)) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[38].z));
// 4
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(abs(intBitsToFloat(R127i.y)) + intBitsToFloat(R127i.z));
R126i.z = ((R10i.x == 0)?(0):(int(1)));
PV0iw = floatBitsToInt(trunc(intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[38].w));
// 5
R123i.x = ((-(intBitsToFloat(R127i.z)) > 0.0)?(PV0iy):(R127i.z));
R125i.y = (R126i.z == int(1))?-1:0;
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].y), intBitsToFloat(PS0i)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(R126i.x)) + -(0.5));
PS1i = int(intBitsToFloat(PV0iw));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[41].x) + intBitsToFloat(uf_remappedVS[41].z));
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[41].y) + intBitsToFloat(uf_remappedVS[41].w));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R127i.z)) + -(0.5));
R123i.w = ((intBitsToFloat(R127i.y) == 0.0)?(0):(R123i.x));
PS0i = floatBitsToInt(float(PS1i));
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(uf_remappedVS[41].z)) + intBitsToFloat(PV0ix));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(uf_remappedVS[41].w)) + intBitsToFloat(PV0iy));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.z)),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.w));
PV1iw = (R126i.z == 0x2)?-1:0;
PS1i = int(intBitsToFloat(R123i.w));
// 8
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.w),intBitsToFloat(uf_remappedVS[40].w)) + intBitsToFloat(R123i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.w),intBitsToFloat(uf_remappedVS[40].z)) + intBitsToFloat(backupReg0i));
R123i.z = ((PV1iw == 0)?(R8i.x):(R8i.z));
R123i.w = ((PV1iw == 0)?(R8i.y):(R8i.x));
PS0i = floatBitsToInt(float(PS1i));
// 9
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(R125i.z)) + -(intBitsToFloat(R127i.z)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PS0i)) + intBitsToFloat(R126i.y));
R123i.z = ((R125i.y == 0)?(R123i.z):(R8i.y));
R123i.w = ((R125i.y == 0)?(R123i.w):(R8i.z));
R127i.x = ((R125i.y == 0)?(R8i.x):(R8i.y));
// 10
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[42].x), intBitsToFloat(R123i.z)));
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) * 2.0);
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R126i.w)) + intBitsToFloat(R123i.y));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[42].y), intBitsToFloat(R123i.w)));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 2.0);
R127i.w = ((R125i.y == 0)?(R8i.y):(R8i.z));
PS0i = int(intBitsToFloat(uf_remappedVS[43].z));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[44].z) + intBitsToFloat(uf_remappedVS[42].x));
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[44].w) + intBitsToFloat(uf_remappedVS[42].y));
R126i.w = ((R10i.x == 0)?(0):(0x2));
R127i.y = floatBitsToInt(float(PS0i));
// 12
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.z)) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(-(abs(intBitsToFloat(R127i.y))) + 0.0);
PV0iz = floatBitsToInt((0.0 >= abs(intBitsToFloat(R127i.y)))?1.0:0.0);
PV0iw = floatBitsToInt(-(intBitsToFloat(R126i.x)) + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R15i.w)),intBitsToFloat(uf_remappedVS[44].x)) + -(intBitsToFloat(PV0iw)));
R127i.z = ((intBitsToFloat(PV0iz) == 0.0)?(0):(PV0iy));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.w),intBitsToFloat(uf_remappedVS[44].y)) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[43].z));
// 14
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[43].x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(abs(intBitsToFloat(R127i.y)) + intBitsToFloat(R127i.z));
R126i.z = (R126i.w == int(1))?-1:0;
PV0iw = floatBitsToInt(trunc(intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[43].w));
// 15
R123i.x = ((-(intBitsToFloat(R127i.z)) > 0.0)?(PV0iy):(R127i.z));
R125i.y = (R126i.w == 0x2)?-1:0;
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[43].y), intBitsToFloat(PS0i)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R126i.x)) + -(0.5));
PS1i = int(intBitsToFloat(PV0iw));
// 16
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[45].x) + intBitsToFloat(uf_remappedVS[45].z));
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[45].y) + intBitsToFloat(uf_remappedVS[45].w));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(R127i.z)) + -(0.5));
R123i.w = ((intBitsToFloat(R127i.y) == 0.0)?(0):(R123i.x));
PS0i = floatBitsToInt(float(PS1i));
// 17
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[45].w),intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iy));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.z)),intBitsToFloat(PS0i)) + intBitsToFloat(R125i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[45].z),intBitsToFloat(R127i.x)) + intBitsToFloat(PV0ix));
R127i.w = ((R125i.y == 0)?(R8i.x):(R8i.z));
PS1i = int(intBitsToFloat(R123i.w));
// 18
backupReg0i = R125i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.w),intBitsToFloat(uf_remappedVS[42].w)) + intBitsToFloat(R123i.x));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.w),intBitsToFloat(uf_remappedVS[42].z)) + intBitsToFloat(R123i.z));
R123i.z = ((backupReg0i == 0)?(R8i.z):(R8i.y));
R123i.w = ((backupReg0i == 0)?(R8i.y):(R8i.x));
PS0i = floatBitsToInt(float(PS1i));
// 19
backupReg0i = R123i.z;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(R125i.z)) + -(intBitsToFloat(R127i.y)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PS0i)) + intBitsToFloat(R126i.y));
R123i.z = ((R126i.z == 0)?(R127i.w):(R8i.y));
R127i.w = ((R126i.z == 0)?(R123i.w):(R8i.z));
R0i.w = ((R126i.z == 0)?(backupReg0i):(R8i.x));
// 20
R10i.x = ((R126i.z == 0)?(R8i.y):(R8i.z));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R126i.w)) + intBitsToFloat(R123i.y));
R1i.z = ((R126i.z == 0)?(R8i.x):(R8i.y));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[46].x), intBitsToFloat(R123i.z)));
R126i.w = floatBitsToInt(intBitsToFloat(R126i.w) * 2.0);
PS0i = int(intBitsToFloat(uf_remappedVS[47].z));
// 21
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[46].y), intBitsToFloat(R127i.w)));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
R6i.y = floatBitsToInt(intBitsToFloat(R124i.y) + 0.5);
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[48].z) + intBitsToFloat(uf_remappedVS[46].x));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[48].w) + intBitsToFloat(uf_remappedVS[46].y));
R1i.w = floatBitsToInt(float(PS0i));
// 22
PV0ix = floatBitsToInt(-(abs(intBitsToFloat(R1i.w))) + 0.0);
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.w)) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt((0.0 >= abs(intBitsToFloat(R1i.w)))?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R1i.w));
// 23
R8i.x = ((intBitsToFloat(PV0iw) == 0.0)?(0):(PV0ix));
R2i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R15i.w)),intBitsToFloat(uf_remappedVS[48].x)) + -(intBitsToFloat(PV0iy)));
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.w),intBitsToFloat(uf_remappedVS[48].y)) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[47].z));
// 24
R3i.x = floatBitsToInt(intBitsToFloat(R125i.x) + 0.5);
R8i.y = floatBitsToInt(trunc(intBitsToFloat(PV1iz)));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[47].x), intBitsToFloat(PS1i)));
R8i.w = floatBitsToInt(abs(intBitsToFloat(R1i.w)) + intBitsToFloat(R8i.x));
R1i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[47].w));
}
if( activeMaskStackC[3] == true ) {
// 0
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[47].y), intBitsToFloat(R1i.y)));
R1i.y = floatBitsToInt(intBitsToFloat(R10i.y) + 0.5);
R123i.z = ((-(intBitsToFloat(R8i.x)) > 0.0)?(R8i.w):(R8i.x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R8i.z)) + -(0.5));
PS0i = int(intBitsToFloat(R8i.y));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[49].y) + intBitsToFloat(uf_remappedVS[49].z));
R123i.y = ((intBitsToFloat(R1i.w) == 0.0)?(0):(R123i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R125i.x)) + -(0.5));
R6i.w = floatBitsToInt(intBitsToFloat(R1i.x) + 0.5);
PS1i = floatBitsToInt(float(PS0i));
// 2
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[49].z),intBitsToFloat(R0i.w)) + intBitsToFloat(PV1ix));
R124i.y = floatBitsToInt(intBitsToFloat(R3i.y) + -(intBitsToFloat(uf_remappedVS[50].x)));
R125i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)),intBitsToFloat(PS1i)) + intBitsToFloat(R2i.w));
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[50].x)) + intBitsToFloat(uf_remappedVS[50].y));
PS0i = int(intBitsToFloat(R123i.y));
// 3
R1i.x = floatBitsToInt(intBitsToFloat(R3i.z) + 0.0);
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[51].y) + intBitsToFloat(uf_remappedVS[51].w));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[51].x) + intBitsToFloat(uf_remappedVS[51].z));
PS1i = floatBitsToInt(float(PS0i));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[51].w),intBitsToFloat(R10i.x)) + intBitsToFloat(PV1iy));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z),intBitsToFloat(PS1i)) + intBitsToFloat(R2i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[51].z),intBitsToFloat(R1i.z)) + intBitsToFloat(PV1iw));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.w),intBitsToFloat(uf_remappedVS[49].x)) + intBitsToFloat(R125i.x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.w));
// 5
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.w),intBitsToFloat(uf_remappedVS[46].z)) + intBitsToFloat(R123i.z));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.w),intBitsToFloat(uf_remappedVS[46].w)) + intBitsToFloat(R123i.x));
R123i.z = floatBitsToInt(-(intBitsToFloat(R123i.w)) * intBitsToFloat(0x3e22f983) + 0.5);
R1i.w = floatBitsToInt(intBitsToFloat(R124i.y) * intBitsToFloat(PS0i));
R1i.w = clampFI32(R1i.w);
R126i.z = floatBitsToInt(intBitsToFloat(R3i.y) + -(intBitsToFloat(uf_remappedVS[50].z)));
// 6
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[50].z)) + intBitsToFloat(uf_remappedVS[50].w));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
R125i.w = floatBitsToInt(intBitsToFloat(R1i.x) + -(intBitsToFloat(uf_remappedVS[52].w)));
// 7
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R124i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[52].x)) + intBitsToFloat(uf_remappedVS[53].x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 8
R125i.x = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
R124i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[52].w)) + intBitsToFloat(uf_remappedVS[53].w));
R1i.z = floatBitsToInt(intBitsToFloat(R1i.x) + -(intBitsToFloat(uf_remappedVS[53].w)));
PV0iw = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS1i));
PV0iw = clampFI32(PV0iw);
// 9
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[53].x)) + intBitsToFloat(uf_remappedVS[54].x));
R2i.z = floatBitsToInt(-(intBitsToFloat(PV0iw)) + 1.0);
R126i.z = floatBitsToInt(sin((intBitsToFloat(R125i.x))/0.1591549367));
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R127i.w)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(R2i.z)));
R8i.z = floatBitsToInt(intBitsToFloat(R1i.x) + -(intBitsToFloat(uf_remappedVS[54].w)));
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[53].w)) + intBitsToFloat(uf_remappedVS[54].w));
PS0i = floatBitsToInt(cos((intBitsToFloat(R125i.x))/0.1591549367));
// 11
R124i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[54].x)) + intBitsToFloat(uf_remappedVS[55].x));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R127i.w)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i),intBitsToFloat(R127i.z)) + intBitsToFloat(PV0ix));
R125i.x = floatBitsToInt(1.0 / intBitsToFloat(R124i.y));
// 12
backupReg0i = R126i.w;
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.z)),intBitsToFloat(R127i.z)) + intBitsToFloat(PV1iz));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R123i.w)) + -(intBitsToFloat(R125i.z)));
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[54].w)) + intBitsToFloat(uf_remappedVS[55].w));
R126i.w = floatBitsToInt(intBitsToFloat(R1i.x) + -(intBitsToFloat(uf_remappedVS[55].w)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 13
R5i.x = floatBitsToInt(intBitsToFloat(R123i.y) + 0.5);
PV1iy = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS0i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R123i.x)) + intBitsToFloat(R127i.y));
PV1iw = floatBitsToInt(intBitsToFloat(R124i.z) * intBitsToFloat(R125i.x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 14
R4i.x = floatBitsToInt(intBitsToFloat(R123i.z) + 0.5);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(PV1iy)) + intBitsToFloat(uf_remappedVS[53].x));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(PV1iw)) + intBitsToFloat(uf_remappedVS[52].x));
PV0iw = floatBitsToInt(intBitsToFloat(R124i.x) * intBitsToFloat(PS1i));
// 15
R124i.x = ((intBitsToFloat(R1i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.y = ((intBitsToFloat(R125i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z),intBitsToFloat(PV0iw)) + intBitsToFloat(uf_remappedVS[54].x));
R127i.w = floatBitsToInt(intBitsToFloat(R1i.x) + -(intBitsToFloat(uf_remappedVS[56].w)));
R125i.w = ((intBitsToFloat(R8i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 16
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[55].x)) + intBitsToFloat(uf_remappedVS[56].x));
R125i.y = ((intBitsToFloat(R127i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R124i.z = ((intBitsToFloat(R126i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iw = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
PS0i = floatBitsToInt(-(intBitsToFloat(R124i.x)) + 1.0);
// 17
PV1ix = floatBitsToInt(-(intBitsToFloat(R124i.z)) + 1.0);
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(PV0iw)));
PV1iz = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[55].w)) + intBitsToFloat(uf_remappedVS[56].w));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
// 18
R124i.x = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(PV1iz)));
R124i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[56].x)) + intBitsToFloat(uf_remappedVS[57].x));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 19
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[56].w)) + intBitsToFloat(uf_remappedVS[57].w));
PV1iy = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS0i));
R127i.z = floatBitsToInt(intBitsToFloat(R1i.x) + -(intBitsToFloat(uf_remappedVS[57].w)));
R8i.w = 0;
// 20
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PV1iy)) + intBitsToFloat(uf_remappedVS[55].x));
R127i.y = ((intBitsToFloat(R127i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.w = floatBitsToInt(intBitsToFloat(R1i.x) + -(intBitsToFloat(uf_remappedVS[58].w)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 21
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[57].x)) + intBitsToFloat(uf_remappedVS[58].x));
R124i.y = ((intBitsToFloat(R126i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iz = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
PV1iw = floatBitsToInt(intBitsToFloat(R124i.z) * intBitsToFloat(PS0i));
// 22
PV0ix = floatBitsToInt(intBitsToFloat(R1i.x) + -(intBitsToFloat(uf_remappedVS[59].w)));
PV0iy = floatBitsToInt(-(intBitsToFloat(R124i.y)) + 1.0);
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV1iw)) + intBitsToFloat(uf_remappedVS[56].x));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV1iz)));
// 23
R8i.x = ((intBitsToFloat(PV0ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[57].w)) + intBitsToFloat(uf_remappedVS[58].w));
// 24
PV0ix = floatBitsToInt(-(intBitsToFloat(R8i.x)) + 1.0);
R124i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[58].x)) + intBitsToFloat(uf_remappedVS[59].x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 25
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[58].w)) + intBitsToFloat(uf_remappedVS[59].w));
PV1iy = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS0i));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PV0ix)));
// 26
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV1iy)) + intBitsToFloat(uf_remappedVS[57].x));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[52].x), intBitsToFloat(R124i.x)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 27
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R124i.w)) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(intBitsToFloat(R124i.z) * intBitsToFloat(PS0i));
// 28
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PV1iw)) + intBitsToFloat(uf_remappedVS[58].x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R3i.y)) + intBitsToFloat(R123i.x));
// 29
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R125i.w)) + intBitsToFloat(R123i.w));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(min(intBitsToFloat(uf_remappedVS[19].y), intBitsToFloat(uf_remappedVS[60].z)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x),intBitsToFloat(R2i.y)) + intBitsToFloat(R1i.z));
R126i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[19].x) + -(intBitsToFloat(R2i.x)));
R125i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[19].y) + -(intBitsToFloat(R4i.y)));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z),intBitsToFloat(R0i.w)) + intBitsToFloat(R123i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(uf_remappedVS[61].x)) + -(intBitsToFloat(uf_remappedVS[61].y)));
R123i.y = clampFI32(R123i.y);
R124i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[19].z) + -(intBitsToFloat(R4i.z)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R12i.y)) + intBitsToFloat(PV0ix));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(uf_remappedVS[62].x)) + -(intBitsToFloat(uf_remappedVS[62].y)));
R123i.y = clampFI32(R123i.y);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[60].y),intBitsToFloat(PV1iw)) + intBitsToFloat(uf_remappedVS[60].x));
R123i.z = clampFI32(R123i.z);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R0i.y)) + intBitsToFloat(R123i.x));
PS0i = floatBitsToInt(intBitsToFloat(R124i.z) * intBitsToFloat(R124i.z));
// 3
R123i.x = floatBitsToInt((intBitsToFloat(R125i.w) * intBitsToFloat(R125i.w) + intBitsToFloat(PS0i)));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(uf_remappedVS[63].w)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R2i.w)) + intBitsToFloat(R123i.w));
PV1iw = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 4
R126i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[64].y) * 1.0 + intBitsToFloat(R0i.x));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[61].w), intBitsToFloat(PS1i)));
R125i.z = floatBitsToInt((intBitsToFloat(R126i.z) * intBitsToFloat(R126i.z) + intBitsToFloat(R123i.x)));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[64].y) + 1.0);
tempResultf = max(0.0, intBitsToFloat(PV1iw));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 5
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[65].x), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) * 1.5);
PV1iy = clampFI32(PV1iy);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[65].y), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iy)));
// 6
R127i.x = floatBitsToInt(intBitsToFloat(PV1iy) * 15.0);
R2i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)),intBitsToFloat(uf_remappedVS[66].w)) + intBitsToFloat(uf_remappedVS[66].w));
tempResultf = 1.0 / sqrt(intBitsToFloat(R125i.z));
PS0i = floatBitsToInt(tempResultf);
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(exp2(intBitsToFloat(R127i.z)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(PV1ix),intBitsToFloat(PV1iy),intBitsToFloat(PV1iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[64].x),intBitsToFloat(uf_remappedVS[64].y),intBitsToFloat(uf_remappedVS[64].z),0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
// 9
R127i.z = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
PS1i = floatBitsToInt(exp2(intBitsToFloat(R124i.x)));
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[65].z)),intBitsToFloat(PS1i)) + intBitsToFloat(uf_remappedVS[65].z));
R123i.x = clampFI32(R123i.x);
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R123i.z = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(R123i.x) + intBitsToFloat(0x80000000));
PV1ix = clampFI32(PV1ix);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(0xbe593484));
PV1iz = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0iy)));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3f22f983));
PV0iy = floatBitsToInt(max(intBitsToFloat(PV1iz), intBitsToFloat(0x3e4ccccd)));
R4i.z = PV1ix;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R123i.y)) + intBitsToFloat(0x3fc90da4));
R8i.z = PV1ix;
// 13
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),-(intBitsToFloat(R123i.w))) + 1.0);
R2i.y = floatBitsToInt(min(intBitsToFloat(PV0iy), 1.0));
R4i.y = uf_remappedVS[1].y;
}
if( activeMaskStackC[3] == true ) {
R0i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R2i.y)));
R18i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[59].x),intBitsToFloat(R8i.x)) + intBitsToFloat(R3i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R2i.y)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R2i.y)));
// 1
backupReg0i = R2i.z;
PV1ix = floatBitsToInt(intBitsToFloat(R7i.z) * intBitsToFloat(R3i.w));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].w), intBitsToFloat(R5i.z)));
R2i.z = 0;
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].w), intBitsToFloat(R5i.w)));
R126i.y = ((0.0 >= intBitsToFloat(backupReg0i))?-1:0);
// 2
R8i.x = floatBitsToInt(intBitsToFloat(R4i.y) * 5.0);
R4i.y = 0;
PV0iz = floatBitsToInt(-(intBitsToFloat(PV1ix)) + 1.0);
PV0iw = ((0.0 >= intBitsToFloat(R1i.w))?-1:0);
R1i.w = 0;
// 3
R1i.x = ((R126i.y == 0)?(PV0iw):(int(-1)));
R123i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3f333333) + intBitsToFloat(0x3e19999a));
R123i.y = clampFI32(R123i.y);
R24i.x = 0;
// 4
R10i.x = R18i.x;
R2i.y = R13i.y;
R0i.z = R13i.z;
PV0iw = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R0i.w = ((R1i.x == 0)?(R6i.z):(R4i.y));
// 5
R0i.x = ((R1i.x == 0)?(R5i.y):(R1i.w));
R10i.y = ((R1i.x == 0)?(R4i.w):(R8i.x));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) + 2.5);
R4i.w = R22i.z;
R13i.x = R12i.x;
// 6
R2i.x = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3daaaaab));
R12i.y = ((R1i.x == 0)?(0):(0x3f800000));
R6i.z = R18i.y;
R123i.w = ((R1i.x == 0)?(0):(R2i.w));
R126i.y = ((R1i.x == 0)?(0):(R4i.z));
// 7
R14i.x = ((R12i.y == 0)?(R2i.w):(R123i.w));
R123i.y = ((R1i.x == 0)?(0):(R8i.w));
R123i.z = ((R1i.x == 0)?(0):(R3i.y));
R126i.w = ((R1i.x == 0)?(0):(R127i.z));
R124i.y = ((R1i.x == 0)?(0):(R126i.x));
// 8
R123i.x = ((R1i.x == 0)?(0):(R125i.w));
R14i.y = ((R12i.y == 0)?(R3i.y):(R123i.z));
R14i.z = ((R12i.y == 0)?(R4i.z):(R126i.y));
R14i.w = ((R12i.y == 0)?(R8i.w):(R123i.y));
R122i.x = ((R1i.x == 0)?(0):(R8i.z));
// 9
R16i.x = ((R12i.y == 0)?(R125i.w):(R123i.x));
R16i.y = ((R12i.y == 0)?(R127i.z):(R126i.w));
R16i.z = ((R12i.y == 0)?(R126i.x):(R124i.y));
R16i.w = ((R12i.y == 0)?(R8i.z):(R122i.x));
R8i.w = uf_remappedVS[67].w;
// 10
backupReg0i = R10i.x;
R10i.x = ((R1i.x == 0)?(0):(R10i.w));
R3i.y = ((R1i.x == 0)?(0):(R0i.z));
R8i.z = ((R1i.x == 0)?(0):(R2i.y));
R5i.w = ((R1i.x == 0)?(0):(backupReg0i));
R5i.y = ((R1i.x == 0)?(0):(R2i.z));
}
if( activeMaskStackC[3] == true ) {
R2i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.z))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].y),intBitsToFloat(R0i.y)) + intBitsToFloat(R6i.y));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[44].y),intBitsToFloat(R0i.y)) + intBitsToFloat(R1i.y));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].y), intBitsToFloat(R3i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[44].y), intBitsToFloat(R3i.w)));
R122i.x = ((R1i.x == 0)?(0):(R2i.x));
// 1
R17i.x = ((R12i.y == 0)?(R2i.x):(R122i.x));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R8i.w)) + intBitsToFloat(R3i.x));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),intBitsToFloat(PV0iw)) + intBitsToFloat(R6i.w));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[48].y), intBitsToFloat(R3i.w)));
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[48].y),intBitsToFloat(R0i.y)) + intBitsToFloat(R4i.x));
// 2
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(R8i.y)) + 0.0);
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),intBitsToFloat(PV1iw)) + intBitsToFloat(R5i.x));
R123i.z = ((R1i.x == 0)?(0):(R2i.y));
R123i.w = ((R1i.x == 0)?(0):(R2i.z));
R122i.x = ((R1i.x == 0)?(0):(R2i.w));
// 3
R124i.x = ((R1i.x == 0)?(R3i.x):(R24i.x));
R17i.y = ((R12i.y == 0)?(R2i.y):(R123i.z));
R17i.z = ((R12i.y == 0)?(R2i.z):(R123i.w));
R17i.w = ((R12i.y == 0)?(R2i.w):(R122i.x));
R127i.z = ((R1i.x == 0)?(0):(R0i.y));
// 4
R127i.x = ((R1i.x == 0)?(0):(R124i.y));
R127i.y = ((R1i.x == 0)?(0):(R124i.z));
R125i.z = ((R1i.x == 0)?(0):(R11i.w));
R123i.w = ((R1i.x == 0)?(0):(R2i.x));
R126i.z = ((R1i.x == 0)?(0):(R126i.y));
// 5
R15i.x = ((R12i.y == 0)?(R2i.x):(R123i.w));
R15i.y = ((R12i.y == 0)?(R0i.y):(R127i.z));
R127i.z = ((R1i.x == 0)?(0):(R11i.z));
R126i.w = ((R1i.x == 0)?(0):(R7i.w));
R122i.x = ((R1i.x == 0)?(0):(R7i.y));
// 6
R21i.x = ((R12i.y == 0)?(R7i.y):(R122i.x));
R123i.y = ((R1i.x == 0)?(0):(R126i.x));
R2i.z = R22i.z;
R124i.w = ((R1i.x == 0)?(0):(R10i.w));
R122i.x = ((R1i.x == 0)?(0):(R7i.z));
// 7
R19i.x = ((R12i.y == 0)?(R126i.x):(R123i.y));
R19i.y = ((R12i.y == 0)?(R124i.y):(R127i.x));
R19i.z = ((R12i.y == 0)?(R126i.y):(R126i.z));
R125i.w = ((R1i.x == 0)?(0):(R9i.w));
R21i.y = ((R12i.y == 0)?(R7i.z):(R122i.x));
// 8
R123i.x = ((R1i.x == 0)?(0):(R11i.x));
R123i.y = ((R1i.x == 0)?(0):(R9i.y));
R21i.z = ((R12i.y == 0)?(R7i.w):(R126i.w));
R19i.w = ((R12i.y == 0)?(R124i.z):(R127i.y));
R124i.z = ((R1i.x == 0)?(0):(R10i.z));
// 9
backupReg0i = R123i.y;
R20i.x = ((R12i.y == 0)?(R11i.x):(R123i.x));
R123i.y = ((R1i.x == 0)?(0):(R9i.z));
R123i.z = ((R1i.x == 0)?(0):(R6i.x));
R126i.w = R13i.z;
R25i.x = ((R12i.y == 0)?(R9i.y):(backupReg0i));
// 10
R123i.x = ((R1i.x == 0)?(0):(R11i.y));
R25i.y = ((R12i.y == 0)?(R9i.z):(R123i.y));
R25i.z = ((R12i.y == 0)?(R9i.w):(R125i.w));
R21i.w = ((R12i.y == 0)?(R6i.x):(R123i.z));
R25i.w = ((R12i.y == 0)?(R10i.z):(R124i.z));
// 11
backupReg0i = R123i.x;
R123i.x = ((R1i.x == 0)?(R22i.x):(R24i.x));
R20i.y = ((R12i.y == 0)?(R11i.y):(backupReg0i));
R20i.z = ((R12i.y == 0)?(R11i.z):(R127i.z));
R20i.w = ((R12i.y == 0)?(R11i.w):(R125i.z));
// 12
R22i.x = ((R12i.y == 0)?(R124i.x):(R123i.x));
R127i.y = ((R1i.x == 0)?(0):(R12i.z));
R127i.z = ((R1i.x == 0)?(0):(R9i.x));
R123i.w = ((R1i.x == 0)?(R22i.y):(R18i.y));
// 13
R123i.x = ((R1i.x == 0)?(0):(R7i.x));
R22i.y = ((R12i.y == 0)?(R6i.z):(R123i.w));
R22i.z = ((R12i.y == 0)?(R4i.w):(R2i.z));
R125i.w = ((R1i.x == 0)?(R23i.y):(R1i.w));
R124i.x = R13i.y;
// 14
R26i.x = ((R12i.y == 0)?(R7i.x):(R123i.x));
R26i.y = ((R12i.y == 0)?(R10i.w):(R124i.w));
R26i.z = ((R12i.y == 0)?(R12i.z):(R127i.y));
R26i.w = ((R12i.y == 0)?(R9i.x):(R127i.z));
PS0i = R18i.x;
// 15
R18i.x = ((R12i.y == 0)?(PS0i):(R5i.w));
R18i.y = ((R12i.y == 0)?(R124i.x):(R8i.z));
R18i.z = ((R12i.y == 0)?(R126i.w):(R3i.y));
R123i.w = ((R1i.x == 0)?(R23i.x):(R4i.y));
// 16
R23i.x = ((R12i.y == 0)?(R0i.w):(R123i.w));
R23i.y = ((R12i.y == 0)?(R0i.x):(R125i.w));
R15i.z = ((R12i.y == 0)?(R2i.z):(R5i.y));
R123i.w = ((R1i.x == 0)?(R23i.z):(R8i.x));
// 17
R123i.x = ((R1i.x == 0)?(R23i.w):(R12i.x));
R23i.z = ((R12i.y == 0)?(R10i.y):(R123i.w));
R18i.w = R10i.x;
// 18
R23i.w = ((R12i.y == 0)?(R13i.x):(R123i.x));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R23i.x), intBitsToFloat(R23i.y), intBitsToFloat(R23i.z), intBitsToFloat(R23i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R26i.x), intBitsToFloat(R26i.y), intBitsToFloat(R26i.z), intBitsToFloat(R26i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R25i.x), intBitsToFloat(R25i.y), intBitsToFloat(R25i.z), intBitsToFloat(R25i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R21i.x), intBitsToFloat(R21i.y), intBitsToFloat(R21i.z), intBitsToFloat(R21i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R22i.x), intBitsToFloat(R22i.y), intBitsToFloat(R22i.z), intBitsToFloat(R22i.z));
// export
passParameterSem9 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.z));
}
