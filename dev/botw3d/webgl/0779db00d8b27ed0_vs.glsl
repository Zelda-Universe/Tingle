#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 0779db00d8b27ed0
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

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem3;
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
attrDecoder = attrDataSem2;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem0;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem1;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem4;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem3;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R16i.y = floatBitsToInt(-(intBitsToFloat(R2i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R5i.z = 0;
R10i.z = floatBitsToInt(1.0);
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
R17i.x = 0;
R17i.y = 0;
R17i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R18i.x = 0;
// 1
R0i.z = R10i.z;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R0i.z = R5i.z;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R0i.z == 0);
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
R0i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R16i.y) >= intBitsToFloat(R0i.z));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R17i.x = 0;
R17i.y = 0;
R17i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R18i.x = 0;
// 1
R5i.z = R10i.z;
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
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(uf_remappedVS[2].y)));
R6i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(R16i.y));
PV0iw = floatBitsToInt(max(intBitsToFloat(R4i.x), 0.0));
R7i.x = int(intBitsToFloat(R3i.w));
// 1
PV1iz = floatBitsToInt(min(intBitsToFloat(PV0iw), 0.0));
// 2
R0i.x = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV1iz));
// 3
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[2].x)));
// 4
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(uf_remappedVS[3].y)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[3].z)));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(uf_remappedVS[3].y)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R7i.z = ((intBitsToFloat(uf_remappedVS[4].x) == 1.0)?-1:0);
R1i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].x)) + 1.0);
// 1
predResult = (R7i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R6i.z)));
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
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(PS1i)));
R127i.y = ((intBitsToFloat(uf_remappedVS[4].x) == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R1i.w));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R6i.z) + -(intBitsToFloat(PV1iz)));
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
PV0ix = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(R4i.y));
PV0iy = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(R4i.z));
PV0iz = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(R4i.z));
R0i.w = 0x3f800000;
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[4].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) * 0.5);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) * 0.5);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) * 0.5);
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R1i.w));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(PV1ix) + -(0.5));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + -(0.5));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
R0i.z = floatBitsToInt(intBitsToFloat(R4i.x) + -(0.5));
R127i.w = floatBitsToInt(intBitsToFloat(PV1iw) + -(0.5));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 3
R6i.x = floatBitsToInt(intBitsToFloat(R4i.z) + -(0.5));
R0i.y = floatBitsToInt(intBitsToFloat(R4i.y) + -(0.5));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(uf_remappedVS[6].x)));
PV1iw = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedVS[6].y)));
// 4
R0i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].y) + intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(R127i.z));
R5i.z = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(uf_remappedVS[7].x));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(uf_remappedVS[6].z)));
// 5
R123i.x = ((R7i.z == 0)?(PV0iy):(R6i.z));
PV1iy = uf_remappedVS[8].x & 0x10000;
R6i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].z) + intBitsToFloat(PV0iw));
R127i.w = uf_remappedVS[8].x & 0x20000;
R126i.w = uf_remappedVS[8].x & 0x40000;
// 6
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R123i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R123i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.x)));
PS0i = floatBitsToInt(float(PV1iy));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iz = floatBitsToInt(intBitsToFloat(R9i.z) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(intBitsToFloat(R9i.y) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV1iz)));
R127i.w = floatBitsToInt(float(R127i.w));
// 9
R1i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV0ix));
R1i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV0iz));
R1i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0iw));
R125i.w = floatBitsToInt((intBitsToFloat(R127i.w) > 0.0)?1.0:0.0);
R127i.x = int(intBitsToFloat(PV0iy));
// 10
R126i.x = R4i.z;
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) * 2.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(R127i.w))?1.0:0.0);
PV0iz = R4i.y;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
PV0iw = 0 - R127i.x;
PS0i = floatBitsToInt(float(R126i.w));
// 11
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R125i.w) + -(intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iz = max(backupReg0i, PV0iw);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PS1i = floatBitsToInt(floor(intBitsToFloat(PV0iz)));
// 12
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iz = floatBitsToInt(floor(intBitsToFloat(R126i.x)));
R125i.w = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iw)));
R127i.y = floatBitsToInt(float(PV1iz));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
// 13
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PV0iz))?1.0:0.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt((intBitsToFloat(PV0iz) > 0.0)?1.0:0.0);
R127i.w = int(intBitsToFloat(R127i.x));
// 14
backupReg0i = R127i.y;
R127i.y = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1ix)));
PV0iz = 0 - R127i.w;
R1i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)), intBitsToFloat(PV1iz)));
R127i.z = int(intBitsToFloat(R125i.w));
// 15
PV1ix = 0 - R127i.z;
PV1iy = max(R127i.w, PV0iz);
// 16
PV0ix = max(R127i.z, PV1ix);
PS0i = floatBitsToInt(float(PV1iy));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 17
R5i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(R127i.y)));
R5i.w = floatBitsToInt(float(PV0ix));
R5i.w = floatBitsToInt(intBitsToFloat(R5i.w) * 2.0);
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R2i.z = tempi.x;
PV0iw = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w))));
PV1ix = tempi.x;
R5i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = R4i.x;
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 2
R2i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w))));
PV0iy = R2i.x;
PV0iz = R2i.x;
PV0iw = R2i.x;
PS0i = floatBitsToInt(floor(intBitsToFloat(PS1i)));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R1i.w)));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R5i.x)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[12].x)));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iy)));
R127i.y = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(PV1ix));
R126i.z = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV1iw));
R126i.w = floatBitsToInt(intBitsToFloat(PS1i) + 0.0);
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[12].y)));
// 5
R127i.x = ((intBitsToFloat(uf_remappedVS[7].w) == 1.0)?-1:0);
PV1iy = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.w)), intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(uf_remappedVS[12].z)));
R125i.w = floatBitsToInt(intBitsToFloat(PS0i) + 0.0);
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[7].w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(PV1iy)));
R126i.y = floatBitsToInt(intBitsToFloat(PV1iz) + 0.0);
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].w)) + 1.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y), intBitsToFloat(PS1i)));
// 7
R127i.w = floatBitsToInt(intBitsToFloat(R6i.z) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
// 8
PV0ix = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 9
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(PS0i));
// 10
R123i.x = ((R127i.x == 0)?(PV1iy):(R16i.y));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R123i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R123i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R123i.x)));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV1ix));
R1i.y = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV1iw));
// 13
R123i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.w = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e22f983) + 0.5);
// 14
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
// 15
R123i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 16
R127i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R0i.y = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 17
R5i.w = floatBitsToInt(sin((intBitsToFloat(R127i.x))/0.1591549367));
// 18
R6i.z = floatBitsToInt(cos((intBitsToFloat(R127i.x))/0.1591549367));
// 19
R1i.w = floatBitsToInt(sin((intBitsToFloat(R0i.y))/0.1591549367));
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.z = floatBitsToInt(-(intBitsToFloat(R2i.x)) + intBitsToFloat(uf_remappedVS[13].z));
R126i.w = floatBitsToInt(-(intBitsToFloat(R2i.z)) + intBitsToFloat(uf_remappedVS[13].x));
// 1
R124i.x = ((intBitsToFloat(R126i.z) == 0.0)?-1:0);
PV1iy = floatBitsToInt((0.0 > -(intBitsToFloat(R126i.w)))?1.0:0.0);
PV1iz = floatBitsToInt((-(intBitsToFloat(R126i.w)) > 0.0)?1.0:0.0);
R125i.w = ((-(intBitsToFloat(R126i.w)) == 0.0)?-1:0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.z));
// 2
R125i.x = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.w)) * intBitsToFloat(PS1i));
PV0iz = ((0.0 > intBitsToFloat(R126i.z))?-1:0);
R127i.z = floatBitsToInt(cos((intBitsToFloat(R0i.y))/0.1591549367));
// 3
R127i.x = floatBitsToInt(max(intBitsToFloat(PV0iy), -(intBitsToFloat(PV0iy))));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PV0iy))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(PV0iy) > 0.0)?1.0:0.0);
R6i.x = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(0x3fc90fdb));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
R125i.w = ((intBitsToFloat(R127i.x) > 1.0)?-1:0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 5
R126i.x = floatBitsToInt(((R125i.w == 0)?(intBitsToFloat(PV0iy)):(-(intBitsToFloat(PV0iy)))));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3fc90fdb));
R123i.w = ((R125i.w == 0)?(R127i.x):(PS0i));
// 6
R1i.x = floatBitsToInt(-(intBitsToFloat(R1i.w)));
PV0iy = floatBitsToInt(min(intBitsToFloat(R123i.w), 1.0));
R126i.z = ((R125i.w == 0)?(0):(PV1iy));
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R127i.z)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(R127i.z)));
// 7
R127i.x = floatBitsToInt(max(intBitsToFloat(PV0iy), -(1.0)));
// 8
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R127i.x)));
// 9
R123i.x = floatBitsToInt(intBitsToFloat(0x3d6ee04d) * intBitsToFloat(R125i.w) + intBitsToFloat(0x3f43b24e));
R123i.z = floatBitsToInt(intBitsToFloat(0x3edcf805) * intBitsToFloat(R125i.w) + 1.0);
// 10
R126i.y = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R127i.x)), intBitsToFloat(R123i.z)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R123i.x)) + 1.0);
// 11
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(uf_remappedVS[14].z)));
R125i.y = floatBitsToInt(intBitsToFloat(R2i.z) + -(intBitsToFloat(uf_remappedVS[13].x)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.w));
// 12
R5i.x = floatBitsToInt(intBitsToFloat(R5i.y) + -(intBitsToFloat(uf_remappedVS[13].y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS1i)));
// 13
R123i.x = ((intBitsToFloat(R127i.x) > 0.0)?(PV0iy):(floatBitsToInt(-(intBitsToFloat(PV0iy)))));
R125i.z = floatBitsToInt(intBitsToFloat(R2i.x) + -(intBitsToFloat(uf_remappedVS[13].z)));
// 14
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R123i.x)) + intBitsToFloat(R126i.z));
// 15
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(R125i.w))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(R125i.w) > 0.0)?1.0:0.0);
// 16
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
// 17
PV1iw = floatBitsToInt(-(intBitsToFloat(R125i.x)) + intBitsToFloat(PV0iy));
// 18
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3fc90fdb));
// 19
PV1iy = floatBitsToInt(intBitsToFloat(R125i.w) + -(intBitsToFloat(PV0iz)));
// 20
R123i.x = ((R127i.y == 0)?(PV1iy):(0x40490fdb));
// 21
R123i.w = ((R124i.x == 0)?(R123i.x):(R6i.x));
// 22
PV0iy = floatBitsToInt(intBitsToFloat(R1i.y) + -(intBitsToFloat(R123i.w)));
// 23
PV1ix = uf_remappedVS[14].x;
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) / 2.0);
R123i.y = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3e22f983) + 0.5);
R126i.z = (R7i.x == int(1))?-1:0;
PV1iw = uf_remappedVS[14].y;
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) / 2.0);
// 24
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R1i.y = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(PV1iw));
R5i.z = floatBitsToInt(intBitsToFloat(R3i.x) + intBitsToFloat(PV1ix));
R125i.w = ((R126i.z == 0)?(0xbf800000):(0xbf800000));
// 25
R126i.x = ((R126i.z == 0)?(0x3f800000):(0xbf800000));
R123i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 26
R125i.x = (R7i.x == 0x2)?-1:0;
R126i.z = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
// 27
tempi.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R125i.y)),-(intBitsToFloat(R5i.x)),-(intBitsToFloat(R125i.z)),intBitsToFloat(0x80000000)),vec4(-(intBitsToFloat(R125i.y)),-(intBitsToFloat(R5i.x)),-(intBitsToFloat(R125i.z)),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R126i.w = tempi.x;
PS1i = floatBitsToInt(sin((intBitsToFloat(R126i.z))/0.1591549367));
// 28
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(PS1i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PS1i)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R127i.z)));
R0i.w = ((R125i.x == 0)?(R125i.w):(0x3f800000));
PS0i = floatBitsToInt(cos((intBitsToFloat(R126i.z))/0.1591549367));
// 29
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(R124i.x)));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R127i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(R127i.y)));
// 30
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PV1iz)));
R0i.y = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PV1iw)));
R6i.w = floatBitsToInt(-(intBitsToFloat(PV1iw)) + intBitsToFloat(PV1ix));
tempResultf = 1.0 / sqrt(intBitsToFloat(R126i.w));
PS0i = floatBitsToInt(tempResultf);
// 31
PV1ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)), intBitsToFloat(PS0i)));
R14i.y = floatBitsToInt(-(intBitsToFloat(R124i.x)) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.x)), intBitsToFloat(PS0i)));
R8i.w = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.z)), intBitsToFloat(PS0i)));
// 32
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PS1i)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1iz)));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1ix)));
R2i.w = ((R125i.x == 0)?(R126i.x):(0xbf800000));
R6i.z = floatBitsToInt(intBitsToFloat(R0i.z) * 1.0);
// 33
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.y),intBitsToFloat(R5i.x),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.y),intBitsToFloat(R5i.x),intBitsToFloat(R125i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.x = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(R7i.z));
// 34
R0i.x = floatBitsToInt(intBitsToFloat(R6i.w) * 1.0);
PV0iy = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(R2i.y));
PV0iz = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(R6i.x));
R5i.w = (R7i.x == 0x3)?-1:0;
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 35
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R1i.w = tempi.x;
R5i.x = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(intBitsToFloat(R0i.y) * 1.0);
R10i.y = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(R2i.y));
R123i.z = ((R5i.w == 0)?(R0i.w):(0x3f800000));
R0i.w = 0x3f800000;
PS0i = floatBitsToInt(sqrt(intBitsToFloat(R1i.w)));
// 1
backupReg0i = R5i.x;
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(uf_remappedVS[15].x)) + 0.0);
R123i.y = ((R5i.w == 0)?(R2i.w):(0x3f800000));
PV1iw = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(backupReg0i));
// 2
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(PV1iw)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(uf_remappedVS[15].x)) + 0.0);
// 3
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(R5i.z)));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R1i.x)) + intBitsToFloat(R6i.z));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R7i.w)) + intBitsToFloat(R0i.x));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R1i.y)));
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R1i.z)) + intBitsToFloat(backupReg0i));
// 4
backupReg0i = R0i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R125i.x)));
R0i.y = uf_remappedVS[16].x;
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R125i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(R125i.x)));
R6i.w = uf_remappedVS[16].y;
// 5
backupReg0i = R1i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R7i.w)) + intBitsToFloat(PV0iw));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R1i.x)) + intBitsToFloat(PV0ix));
R1i.z = uf_remappedVS[16].z;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV0iz));
R1i.y = uf_remappedVS[17].x;
// 6
backupReg0i = R123i.x;
backupReg1i = R123i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R14i.y)) + intBitsToFloat(R123i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R8i.w)) + intBitsToFloat(backupReg0i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R12i.y)) + intBitsToFloat(backupReg1i));
R7i.w = uf_remappedVS[18].x;
R2i.w = uf_remappedVS[18].y;
// 7
backupReg0i = R2i.x;
R2i.x = uf_remappedVS[18].z;
PV1iy = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(R123i.x));
PV1iz = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(R123i.y));
PV1iw = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(R123i.z));
PS1i = ((intBitsToFloat(R4i.x) > 0.5)?-1:0);
// 8
R1i.x = floatBitsToInt(intBitsToFloat(R7i.z) + intBitsToFloat(PV1iw));
R9i.y = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(PV1iz));
R0i.z = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV1iy));
R5i.w = floatBitsToInt(((PS1i == 0)?(intBitsToFloat(R3i.x)):(-(intBitsToFloat(R3i.x)))));
PS0i = ((intBitsToFloat(R4i.y) > 0.5)?-1:0);
// 9
R6i.x = ((intBitsToFloat(R4i.z) > 0.5)?-1:0);
R2i.y = floatBitsToInt(((PS0i == 0)?(intBitsToFloat(R3i.y)):(-(intBitsToFloat(R3i.y)))));
}
if( activeMaskStackC[3] == true ) {
// 0
R17i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R9i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[19].x),intBitsToFloat(uf_remappedVS[19].y),intBitsToFloat(uf_remappedVS[19].z),intBitsToFloat(uf_remappedVS[19].w))));
PV0iy = R17i.x;
PV0iz = R17i.x;
PV0iw = R17i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R9i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w))));
PV1ix = tempi.x;
R17i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R6i.x = floatBitsToInt(((R6i.x == 0)?(intBitsToFloat(R3i.x)):(-(intBitsToFloat(R3i.x)))));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R9i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R17i.z = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R9i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[22].x),intBitsToFloat(uf_remappedVS[22].y),intBitsToFloat(uf_remappedVS[22].z),intBitsToFloat(uf_remappedVS[22].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R17i.w = tempi.x;
R126i.x = ((intBitsToFloat(R4i.w) > 0.5)?-1:0);
// 4
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[23].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(uf_remappedVS[23].y)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(uf_remappedVS[23].z)));
PV0iw = PV1ix;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
R19i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[23].w)));
// 5
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(uf_remappedVS[24].x)));
R18i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(uf_remappedVS[24].y)));
R123i.z = floatBitsToInt(intBitsToFloat(R17i.z) * 0.0 + intBitsToFloat(PV0iw));
R20i.w = floatBitsToInt(intBitsToFloat(R17i.z) * 0.0 + intBitsToFloat(R17i.w));
R20i.z = floatBitsToInt(intBitsToFloat(R17i.z) * 0.5 + intBitsToFloat(PV0iw));
// 6
R20i.x = floatBitsToInt(intBitsToFloat(R17i.x) * 0.5 + intBitsToFloat(R123i.z));
R20i.y = floatBitsToInt(intBitsToFloat(R17i.y) * -(0.5) + intBitsToFloat(R123i.z));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(uf_remappedVS[24].z)));
R7i.w = floatBitsToInt(((R126i.x == 0)?(intBitsToFloat(R3i.y)):(-(intBitsToFloat(R3i.y)))));
R8i.y = floatBitsToInt(1.0 / intBitsToFloat(R20i.w));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R20i.z) * intBitsToFloat(R8i.y));
PV1iw = ((intBitsToFloat(R4i.y) > 0.5)?-1:0);
// 8
PV0ix = ((intBitsToFloat(R4i.z) > 0.5)?-1:0);
R7i.z = floatBitsToInt(((PV1iw == 0)?(intBitsToFloat(R3i.x)):(-(intBitsToFloat(R3i.x)))));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(uf_remappedVS[1].w)) + -(intBitsToFloat(uf_remappedVS[1].y)));
// 9
R6i.y = floatBitsToInt(((PV0ix == 0)?(intBitsToFloat(R3i.y)):(-(intBitsToFloat(R3i.y)))));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.w));
// 10
R11i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS1i));
}
if( activeMaskStackC[3] == true ) {
// 0
R19i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[25].x)));
R19i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[25].x)));
R19i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(uf_remappedVS[25].x)));
R2i.w = uf_remappedVS[26].x;
// 1
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(uf_remappedVS[27].x)));
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) * 2.0);
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(uf_remappedVS[27].y)));
R0i.y = floatBitsToInt(intBitsToFloat(R0i.y) * 2.0);
PS1i = int(intBitsToFloat(uf_remappedVS[28].z));
// 2
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[29].z) + intBitsToFloat(uf_remappedVS[27].x));
R125i.x = floatBitsToInt(float(PS1i));
// 3
PV1ix = floatBitsToInt((0.0 >= abs(intBitsToFloat(R125i.x)))?1.0:0.0);
R1i.z = floatBitsToInt(-(intBitsToFloat(R126i.x)) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(-(abs(intBitsToFloat(R125i.x))) + 0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R125i.x));
// 4
R125i.y = ((intBitsToFloat(PV1ix) == 0.0)?(0):(PV1iw));
PV0iw = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[28].z));
// 5
PV1ix = floatBitsToInt(abs(intBitsToFloat(R125i.x)) + intBitsToFloat(R125i.y));
PV1iz = floatBitsToInt(trunc(intBitsToFloat(PV0iw)));
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[28].x), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[28].w));
// 6
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[28].y), intBitsToFloat(PS1i)));
R123i.w = ((-(intBitsToFloat(R125i.y)) > 0.0)?(PV1ix):(R125i.y));
R5i.y = int(intBitsToFloat(PV1iz));
// 7
R123i.z = ((intBitsToFloat(R125i.x) == 0.0)?(0):(R123i.w));
// 8
R1i.y = int(intBitsToFloat(R123i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
R21i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[25].x), intBitsToFloat(R7i.x)));
R21i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[25].x), intBitsToFloat(R18i.y)));
R21i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[25].x), intBitsToFloat(R2i.z)));
R21i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(uf_remappedVS[24].w)));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[29].w) + intBitsToFloat(uf_remappedVS[27].y));
// 2
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[30].x) + intBitsToFloat(uf_remappedVS[30].z));
R2i.w = floatBitsToInt(-(intBitsToFloat(R0i.y)) + intBitsToFloat(PV1ix));
// 3
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(uf_remappedVS[30].z)) + intBitsToFloat(PV0iz));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = uf_remappedVS[8].x & 0x100000;
PV0iy = uf_remappedVS[8].x & 0x80000;
PV0iz = uf_remappedVS[8].x & 0x400000;
PV0iw = uf_remappedVS[8].x & 0x200000;
PS0i = uf_remappedVS[8].y & int(1);
// 1
PV1ix = (PV0iy == 0x80000)?-1:0;
PV1iy = (PV0iz == 0x400000)?-1:0;
PV1iz = (PV0iw == 0x200000)?-1:0;
PV1iw = (PV0ix == 0x100000)?-1:0;
R127i.z = (int(1) != PS0i)?-1:0;
// 2
R126i.x = ((PV1iw == 0)?(R3i.y):(R2i.y));
R125i.y = ((PV1ix == 0)?(R3i.x):(R5i.w));
R2i.z = ((PV1iy == 0)?(R3i.y):(R7i.w));
R127i.w = ((PV1iz == 0)?(R3i.x):(R6i.x));
PS0i = uf_remappedVS[8].x & 0x800000;
// 3
PV1ix = (PS0i == 0x800000)?-1:0;
PV1iy = uf_remappedVS[8].x & 0x1000000;
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R16i.y)),intBitsToFloat(uf_remappedVS[29].x)) + -(intBitsToFloat(R1i.z)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y),intBitsToFloat(uf_remappedVS[29].y)) + intBitsToFloat(R2i.w));
PS1i = floatBitsToInt(float(R1i.y));
// 4
backupReg0i = R5i.y;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w),intBitsToFloat(PS1i)) + intBitsToFloat(R123i.z));
R5i.y = ((PV1ix == 0)?(R3i.x):(R7i.z));
R125i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[30].y) + intBitsToFloat(uf_remappedVS[30].w));
PV0iw = (PV1iy == 0x1000000)?-1:0;
PS0i = floatBitsToInt(float(backupReg0i));
// 5
R6i.x = ((PV0iw == 0)?(R3i.y):(R6i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.y)),intBitsToFloat(PS0i)) + intBitsToFloat(R126i.w));
PV1iz = floatBitsToInt(intBitsToFloat(R126i.x) + -(0.5));
R123i.w = ((R127i.z == 0)?(0):(int(1)));
// 6
backupReg0i = R125i.z;
backupReg1i = R123i.w;
PV0ix = floatBitsToInt(intBitsToFloat(R125i.y) + 0.5);
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.y)),intBitsToFloat(PV1iz)) + -(intBitsToFloat(R123i.y)));
R125i.z = (backupReg1i == int(1))?-1:0;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(uf_remappedVS[30].w)) + intBitsToFloat(backupReg0i));
PS0i = (backupReg1i == 0x2)?-1:0;
// 7
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w),intBitsToFloat(PV0ix)) + intBitsToFloat(R125i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y),intBitsToFloat(uf_remappedVS[27].z)) + intBitsToFloat(R0i.y));
R123i.z = ((PS0i == 0)?(R4i.x):(R4i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y),intBitsToFloat(uf_remappedVS[27].w)) + intBitsToFloat(R123i.w));
R122i.x = ((PS0i == 0)?(R4i.y):(R4i.x));
// 8
R123i.x = ((R125i.z == 0)?(R123i.z):(R4i.y));
R126i.y = ((R125i.z == 0)?(R122i.x):(R4i.z));
PV0iz = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
PV0iw = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
R124i.y = ((R125i.z == 0)?(R4i.x):(R4i.y));
// 9
R22i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)),intBitsToFloat(PV0iz)) + intBitsToFloat(R125i.x));
R22i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PV0iw)) + intBitsToFloat(R127i.y));
R126i.z = ((R125i.z == 0)?(R4i.y):(R4i.z));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[31].x), intBitsToFloat(R123i.x)));
R126i.w = floatBitsToInt(intBitsToFloat(R126i.w) * 2.0);
PS1i = int(intBitsToFloat(uf_remappedVS[32].z));
// 10
R125i.x = floatBitsToInt(intBitsToFloat(R127i.w) + 0.5);
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[33].z) + intBitsToFloat(uf_remappedVS[31].x));
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[33].w) + intBitsToFloat(uf_remappedVS[31].y));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[31].y), intBitsToFloat(R126i.y)));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
R125i.z = floatBitsToInt(float(PS1i));
// 11
PV1ix = floatBitsToInt(-(intBitsToFloat(R126i.w)) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(-(intBitsToFloat(PV0iw)) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(-(abs(intBitsToFloat(R125i.z))) + 0.0);
PV1iw = floatBitsToInt((0.0 >= abs(intBitsToFloat(R125i.z)))?1.0:0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R125i.z));
// 12
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R16i.y)),intBitsToFloat(uf_remappedVS[33].x)) + -(intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y),intBitsToFloat(uf_remappedVS[33].y)) + intBitsToFloat(PV1iy));
R126i.w = ((intBitsToFloat(PV1iw) == 0.0)?(0):(PV1iz));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[32].z));
// 13
PV1ix = floatBitsToInt(trunc(intBitsToFloat(PV0iy)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].x), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(abs(intBitsToFloat(R125i.z)) + intBitsToFloat(R126i.w));
R125i.w = floatBitsToInt(intBitsToFloat(R2i.z) + -(0.5));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[32].w));
// 14
R123i.y = ((-(intBitsToFloat(R126i.w)) > 0.0)?(PV1iz):(R126i.w));
R127i.z = ((R127i.z == 0)?(0):(0x2));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].y), intBitsToFloat(PS1i)));
PS0i = int(intBitsToFloat(PV1ix));
// 15
R123i.x = ((intBitsToFloat(R125i.z) == 0.0)?(0):(R123i.y));
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[34].x) + intBitsToFloat(uf_remappedVS[34].z));
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[34].y) + intBitsToFloat(uf_remappedVS[34].w));
R124i.w = (R127i.z == int(1))?-1:0;
PS1i = floatBitsToInt(float(PS0i));
// 16
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.w)),intBitsToFloat(PS1i)) + intBitsToFloat(R124i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[34].w),intBitsToFloat(R126i.z)) + intBitsToFloat(PV1iz));
R127i.z = (R127i.z == 0x2)?-1:0;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[34].z),intBitsToFloat(R124i.y)) + intBitsToFloat(PV1iy));
PS0i = int(intBitsToFloat(backupReg0i));
// 17
R124i.x = ((R127i.z == 0)?(R4i.x):(R4i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y),intBitsToFloat(uf_remappedVS[31].w)) + intBitsToFloat(R123i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y),intBitsToFloat(uf_remappedVS[31].z)) + intBitsToFloat(R123i.w));
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.w)),intBitsToFloat(R125i.w)) + -(intBitsToFloat(R123i.x)));
PS1i = floatBitsToInt(float(PS0i));
// 18
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
R124i.y = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(PS1i)) + intBitsToFloat(backupReg0i));
R123i.w = ((R127i.z == 0)?(R4i.y):(R4i.x));
R122i.x = ((R127i.z == 0)?(R4i.z):(R4i.y));
// 19
R123i.x = ((R124i.w == 0)?(R124i.x):(R4i.y));
R0i.y = ((R124i.w == 0)?(R122i.x):(R4i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R125i.x)) + intBitsToFloat(R123i.z));
R125i.w = ((R124i.w == 0)?(R123i.w):(R4i.z));
R7i.y = ((R124i.w == 0)?(R4i.x):(R4i.y));
// 20
backupReg0i = R124i.y;
R3i.x = ((R124i.w == 0)?(R4i.y):(R4i.z));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].x), intBitsToFloat(R123i.x)));
R124i.y = floatBitsToInt(intBitsToFloat(R124i.y) * 2.0);
R22i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.z));
R22i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(backupReg0i)) + intBitsToFloat(R126i.w));
PS0i = int(intBitsToFloat(uf_remappedVS[36].z));
// 21
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[37].z) + intBitsToFloat(uf_remappedVS[35].x));
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[37].w) + intBitsToFloat(uf_remappedVS[35].y));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].y), intBitsToFloat(R125i.w)));
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 2.0);
R3i.z = floatBitsToInt(float(PS0i));
// 22
R4i.x = floatBitsToInt(-(intBitsToFloat(R124i.y)) + intBitsToFloat(PV1iy));
R4i.y = floatBitsToInt(-(intBitsToFloat(PV1iw)) + intBitsToFloat(PV1iz));
R2i.z = floatBitsToInt(-(abs(intBitsToFloat(R3i.z))) + 0.0);
R4i.w = floatBitsToInt((0.0 >= abs(intBitsToFloat(R3i.z)))?1.0:0.0);
R4i.z = floatBitsToInt(1.0 / intBitsToFloat(R3i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R16i.y)),intBitsToFloat(uf_remappedVS[37].x)) + -(intBitsToFloat(R4i.x)));
PV0iy = floatBitsToInt(intBitsToFloat(R4i.z) * 0.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y),intBitsToFloat(uf_remappedVS[37].y)) + intBitsToFloat(R4i.y));
R125i.w = ((intBitsToFloat(R4i.w) == 0.0)?(0):(R2i.z));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[36].z));
// 1
PV1ix = floatBitsToInt(trunc(intBitsToFloat(PV0iy)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].x), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(abs(intBitsToFloat(R3i.z)) + intBitsToFloat(R125i.w));
R6i.w = 0;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[36].w));
// 2
R123i.y = ((-(intBitsToFloat(R125i.w)) > 0.0)?(PV1iz):(R125i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].y), intBitsToFloat(PS1i)));
PS0i = int(intBitsToFloat(PV1ix));
// 3
R123i.x = ((intBitsToFloat(R3i.z) == 0.0)?(0):(R123i.y));
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[38].y) + intBitsToFloat(uf_remappedVS[38].z));
PS1i = floatBitsToInt(float(PS0i));
// 4
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)),intBitsToFloat(PS1i)) + intBitsToFloat(R127i.z));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].z),intBitsToFloat(R0i.y)) + intBitsToFloat(PV1iy));
PS0i = int(intBitsToFloat(R123i.x));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[39].y) + intBitsToFloat(uf_remappedVS[39].w));
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[39].x) + intBitsToFloat(uf_remappedVS[39].z));
PS1i = floatBitsToInt(float(PS0i));
// 6
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PS1i)) + intBitsToFloat(R126i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].z),intBitsToFloat(R7i.y)) + intBitsToFloat(PV1iz));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y),intBitsToFloat(uf_remappedVS[38].x)) + intBitsToFloat(R125i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].w),intBitsToFloat(R3i.x)) + intBitsToFloat(PV1ix));
// 7
backupReg0i = R123i.y;
R123i.y = floatBitsToInt(-(intBitsToFloat(R123i.z)) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y),intBitsToFloat(uf_remappedVS[35].w)) + intBitsToFloat(R123i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y),intBitsToFloat(uf_remappedVS[35].z)) + intBitsToFloat(backupReg0i));
R18i.y = uf_remappedVS[40].x;
// 8
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R125i.y = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
R125i.w = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
// 9
R123i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 10
R127i.z = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
// 11
R124i.y = floatBitsToInt(sin((intBitsToFloat(R127i.z))/0.1591549367));
// 12
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R124i.y)));
PS0i = floatBitsToInt(cos((intBitsToFloat(R127i.z))/0.1591549367));
// 13
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(PS0i)) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PS0i)));
// 14
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.x)),intBitsToFloat(R124i.y)) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(intBitsToFloat(R125i.x) + -(0.5));
// 15
PV1ix = floatBitsToInt(intBitsToFloat(R127i.z) + 0.5);
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)),intBitsToFloat(PV0iw)) + -(intBitsToFloat(R126i.y)));
// 16
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PV1ix)) + intBitsToFloat(R126i.x));
// 17
R23i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.z)),intBitsToFloat(R125i.w)) + intBitsToFloat(R123i.y));
R23i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R125i.y)) + intBitsToFloat(R126i.z));
// 18
PV0iw = floatBitsToInt(intBitsToFloat(R20i.y) * intBitsToFloat(R8i.y));
// 19
PV1iy = floatBitsToInt(-(intBitsToFloat(PV0iw)) + 1.0);
// 20
R6i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3f333333) + intBitsToFloat(0x3e19999a));
R6i.x = clampFI32(R6i.x);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(min(intBitsToFloat(uf_remappedVS[13].y), intBitsToFloat(uf_remappedVS[41].z)));
R125i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[13].x) + -(intBitsToFloat(R1i.x)));
R126i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[13].y) + -(intBitsToFloat(R9i.y)));
// 1
R126i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[13].z) + -(intBitsToFloat(R0i.z)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y),intBitsToFloat(uf_remappedVS[42].x)) + -(intBitsToFloat(uf_remappedVS[42].y)));
R123i.y = clampFI32(R123i.y);
PV1iz = floatBitsToInt(-(intBitsToFloat(R10i.y)) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(-(intBitsToFloat(R6i.x)) + 1.0);
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y),intBitsToFloat(uf_remappedVS[43].x)) + -(intBitsToFloat(uf_remappedVS[43].y)));
R123i.y = clampFI32(R123i.y);
R127i.z = floatBitsToInt(intBitsToFloat(PV1iw) + 2.5);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[41].y),intBitsToFloat(PV1iz)) + intBitsToFloat(uf_remappedVS[41].x));
R123i.w = clampFI32(R123i.w);
PS0i = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(R126i.x));
// 3
R123i.x = floatBitsToInt((intBitsToFloat(R126i.z) * intBitsToFloat(R126i.z) + intBitsToFloat(PS0i)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(uf_remappedVS[44].w)));
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[45].y) + 1.0);
PV1iw = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 4
R125i.x = floatBitsToInt((intBitsToFloat(R125i.y) * intBitsToFloat(R125i.y) + intBitsToFloat(R123i.x)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) * 1.5);
PV0iy = clampFI32(PV0iy);
R124i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[45].y) * 1.0 + intBitsToFloat(R11i.y));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[42].w), intBitsToFloat(PS1i)));
tempResultf = max(0.0, intBitsToFloat(PV1iw));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 5
backupReg0i = R127i.z;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[46].x), intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(intBitsToFloat(PV0iy) * 15.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[46].y), intBitsToFloat(PS0i)));
R10i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3daaaaab));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
// 6
R6i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)),intBitsToFloat(uf_remappedVS[47].w)) + intBitsToFloat(uf_remappedVS[47].w));
R10i.y = 0;
tempResultf = 1.0 / sqrt(intBitsToFloat(R125i.x));
PS0i = floatBitsToInt(tempResultf);
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(exp2(intBitsToFloat(R127i.z)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(PV1ix),intBitsToFloat(PV1iy),intBitsToFloat(PV1iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[45].x),intBitsToFloat(uf_remappedVS[45].y),intBitsToFloat(uf_remappedVS[45].z),0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R11i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
// 9
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R12i.y)) + intBitsToFloat(R13i.y));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R8i.w)) + intBitsToFloat(R5i.z));
R127i.z = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
PS1i = floatBitsToInt(exp2(intBitsToFloat(R124i.x)));
// 10
R123i.x = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R14i.y)) + intBitsToFloat(R15i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[46].z)),intBitsToFloat(PS1i)) + intBitsToFloat(uf_remappedVS[46].z));
R123i.w = clampFI32(R123i.w);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(R124i.z) * intBitsToFloat(PS0i));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R123i.x)) + intBitsToFloat(0xbe593484));
R0i.z = floatBitsToInt(intBitsToFloat(R123i.w) + intBitsToFloat(0x80000000));
R0i.z = clampFI32(R0i.z);
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0iy)));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3f22f983));
PV0iy = floatBitsToInt(max(intBitsToFloat(PV1ix), intBitsToFloat(0x3e4ccccd)));
R6i.z = R0i.z;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R123i.y)) + intBitsToFloat(0x3fc90da4));
// 13
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),-(intBitsToFloat(R123i.w))) + 1.0);
R5i.z = floatBitsToInt(min(intBitsToFloat(PV0iy), 1.0));
}
if( activeMaskStackC[3] == true ) {
R11i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y))).xyz);
R7i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R10i.w),intBitsToFloat(R10i.y))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(R5i.z)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(R5i.z)));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), intBitsToFloat(R5i.z)));
R8i.w = R0i.z;
// 1
R18i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[3].x) * 1.0 + 0.0);
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R21i.x), intBitsToFloat(R21i.y), intBitsToFloat(R21i.z), intBitsToFloat(R21i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R22i.x), intBitsToFloat(R22i.y), intBitsToFloat(R22i.z), intBitsToFloat(R22i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.y), intBitsToFloat(R7i.z), intBitsToFloat(R7i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R8i.x), intBitsToFloat(R8i.y), intBitsToFloat(R8i.z), intBitsToFloat(R8i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.z), intBitsToFloat(R6i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.z));
// export
passParameterSem9 = vec4(intBitsToFloat(R23i.x), intBitsToFloat(R23i.y), intBitsToFloat(R23i.z), intBitsToFloat(R23i.z));
}
