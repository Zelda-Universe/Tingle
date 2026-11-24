#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 52ed372b031d9b4a
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
ATTR_LAYOUT(0, 8) in uvec4 attrDataSem8;
ATTR_LAYOUT(0, 9) in uvec4 attrDataSem9;
ATTR_LAYOUT(0, 10) in uvec4 attrDataSem10;

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem7;
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
ivec4 R19i = ivec4(0);
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
R15i.y = floatBitsToInt(-(intBitsToFloat(R3i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R3i.w = 0;
R4i.w = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R15i.y));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R0i.x = 0;
R0i.y = 0;
R0i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R16i.x = 0;
// 1
R5i.w = R4i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R5i.w = R3i.w;
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
PS0i = int(intBitsToFloat(R2i.w));
// 1
R2i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R15i.y) >= intBitsToFloat(R2i.z));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = 0;
R0i.y = 0;
R0i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R16i.x = 0;
// 1
R3i.w = R4i.w;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R3i.w == 0);
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
R0i.w = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedVS[4].x),intBitsToFloat(uf_remappedVS[4].y),intBitsToFloat(uf_remappedVS[4].z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[4].x),intBitsToFloat(uf_remappedVS[4].y),intBitsToFloat(uf_remappedVS[4].z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.y = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 3
R0i.z = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 4
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
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R0i.w));
// 1
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].x), intBitsToFloat(R127i.y)));
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].x), intBitsToFloat(R127i.y)));
// 2
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].x), intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R3i.x = 0;
// 1
R11i.x = R3i.x;
// 2
R10i.x = R3i.x;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
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
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R0i.y));
// 1
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].y), intBitsToFloat(R127i.x)));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].y), intBitsToFloat(R127i.x)));
// 2
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R11i.y = 0;
R10i.y = 0;
// 1
R3i.y = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
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
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R0i.z));
// 1
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].z), intBitsToFloat(R127i.x)));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].z), intBitsToFloat(R127i.x)));
// 2
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R11i.z = 0;
R10i.z = 0;
// 1
R3i.z = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[5].x))?1.0:0.0);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(uf_remappedVS[6].y)));
PV0iz = floatBitsToInt((intBitsToFloat(uf_remappedVS[5].x) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt(max(intBitsToFloat(R6i.x), 0.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[5].x));
// 1
PV1ix = floatBitsToInt(min(intBitsToFloat(PV0iw), 0.0));
R126i.y = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0ix)));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].x)) + intBitsToFloat(uf_remappedVS[8].x));
PV1iw = floatBitsToInt(intBitsToFloat(R15i.y) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R2i.z));
// 2
R0i.x = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(PV1ix));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV1iw));
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
R3i.w = floatBitsToInt(intBitsToFloat(R15i.y) * intBitsToFloat(PS1i));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].y)) + intBitsToFloat(uf_remappedVS[8].y));
// 3
PV1ix = floatBitsToInt(fract(intBitsToFloat(PV0iy)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].w)) + intBitsToFloat(uf_remappedVS[8].w));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].z)) + intBitsToFloat(uf_remappedVS[8].z));
// 4
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].y)) + intBitsToFloat(uf_remappedVS[9].y));
R125i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].x)) + intBitsToFloat(uf_remappedVS[9].x));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
// 5
backupReg0i = R127i.y;
R127i.x = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS0i));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS0i));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS0i));
R125i.w = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV0iz));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].z)) + intBitsToFloat(uf_remappedVS[9].z));
// 6
R126i.y = floatBitsToInt(intBitsToFloat(R125i.w) + -(intBitsToFloat(uf_remappedVS[7].w)));
R127i.w = floatBitsToInt(intBitsToFloat(R125i.w) + -(intBitsToFloat(uf_remappedVS[8].w)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R127i.z)));
PV1iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].w)) + intBitsToFloat(uf_remappedVS[9].w));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R127i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R127i.y)));
R127i.z = floatBitsToInt(intBitsToFloat(R125i.w) + -(intBitsToFloat(uf_remappedVS[9].w)));
// 8
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].y) + intBitsToFloat(PV1iz));
R124i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].x) + intBitsToFloat(PV1ix));
R124i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].z) + intBitsToFloat(PV1iw));
R0i.w = ((intBitsToFloat(R126i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(PS0i));
R125i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].x)) + intBitsToFloat(uf_remappedVS[10].x));
PV1iz = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS0i));
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].y)) + intBitsToFloat(uf_remappedVS[10].y));
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV1iz)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV1iw)));
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].z)) + intBitsToFloat(uf_remappedVS[10].z));
PS0i = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].w)) + intBitsToFloat(uf_remappedVS[10].w));
// 11
R126i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].z) + intBitsToFloat(PV0iz));
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].y) + intBitsToFloat(PV0ix));
R125i.z = ((intBitsToFloat(R127i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].x) + intBitsToFloat(PV0iy));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS1i));
R126i.w = ((intBitsToFloat(R127i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS0i = floatBitsToInt(intBitsToFloat(R125i.w) + -(intBitsToFloat(uf_remappedVS[10].w)));
// 13
backupReg0i = R127i.z;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0ix)));
R127i.z = ((intBitsToFloat(PS0i) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iy)));
PS1i = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
// 14
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R126i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].z) + intBitsToFloat(PV1ix));
R126i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].x) + intBitsToFloat(PV1iw));
R125i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].y) + intBitsToFloat(PV1iy));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PS1i)));
// 15
backupReg0i = R127i.w;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].x), intBitsToFloat(R127i.z)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].z), intBitsToFloat(R127i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV0ix)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].y), intBitsToFloat(R127i.z)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R124i.w)));
// 16
backupReg0i = R126i.z;
backupReg1i = R126i.x;
backupReg2i = R124i.w;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV1iz)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV1iz)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(backupReg2i)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1iz)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), intBitsToFloat(backupReg2i)));
// 17
PV1ix = uf_remappedVS[11].x;
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) / 2.0);
R127i.y = floatBitsToInt(-(intBitsToFloat(R0i.w)) + 1.0);
PV1iz = uf_remappedVS[11].y;
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) / 2.0);
PV1iw = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
R4i.w = 0x3f800000;
// 18
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV1iw)));
R2i.y = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(PV1iz));
R0i.z = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV1ix));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].x), intBitsToFloat(R127i.y)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].y), intBitsToFloat(R127i.y)));
// 19
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PV0ix)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].z), intBitsToFloat(R127i.y)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(PV0ix)));
R0i.w = 0x3f800000;
// 20
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R125i.z));
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R125i.w));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(PV1iy));
R2i.w = floatBitsToInt(1.0);
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R3i.z)));
// 21
PV1ix = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(PV0iy));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R3i.y)) + intBitsToFloat(PS0i));
// 22
R18i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R3i.x)) + intBitsToFloat(R122i.x));
PV0iy = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV1iy));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R10i.z)));
// 23
PV1ix = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(PV0iy));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R10i.y)) + intBitsToFloat(PS0i));
// 24
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PV1iz)));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1ix)));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R11i.z)));
R18i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R10i.x)) + intBitsToFloat(R122i.x));
// 25
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(PV0iw),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R18i.z = tempi.x;
PV1iw = tempi.x;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(uf_remappedVS[12].w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(uf_remappedVS[12].z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(uf_remappedVS[12].y)));
// 1
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R0i.z)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R2i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PV0ix)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].x), intBitsToFloat(uf_remappedVS[14].x)));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].x), intBitsToFloat(uf_remappedVS[14].y)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(uf_remappedVS[15].x),intBitsToFloat(uf_remappedVS[15].y),intBitsToFloat(uf_remappedVS[15].z),intBitsToFloat(uf_remappedVS[15].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R2i.z = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),intBitsToFloat(uf_remappedVS[16].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R5i.w = tempi.x;
R6i.w = PV0ix;
// 4
R5i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(PV1ix)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R0i.w))));
PV0iy = R5i.x;
PV0iz = R5i.x;
PV0iw = R5i.x;
R126i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[14].w) * 1.0);
// 5
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R0i.w))));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(uf_remappedVS[14].z)));
// 6
PV0iw = floatBitsToInt(intBitsToFloat(PS1i) + intBitsToFloat(R127i.w));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(uf_remappedVS[17].x),intBitsToFloat(uf_remappedVS[17].y),intBitsToFloat(uf_remappedVS[17].z),intBitsToFloat(uf_remappedVS[17].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R4i.w = tempi.x;
R122i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(PV1ix)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R0i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R0i.z = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(fract(intBitsToFloat(R122i.x)));
// 9
R123i.x = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedVS[14].z)));
// 10
PV0iy = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R126i.x));
// 11
R123i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e22f983) + 0.5);
R126i.x = floatBitsToInt(cos((intBitsToFloat(PV0iy))/0.1591549367));
// 12
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
// 13
R123i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 14
PV0iz = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
// 15
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0iz))/0.1591549367));
// 16
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R126i.x)));
// 17
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R126i.z)));
// 18
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(0xbccccccd));
// 19
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].y), intBitsToFloat(PV0ix)));
// 20
R7i.y = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV1iw));
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R7i.y),intBitsToFloat(R0i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[18].x),intBitsToFloat(uf_remappedVS[18].y),intBitsToFloat(uf_remappedVS[18].z),intBitsToFloat(uf_remappedVS[18].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R5i.z = tempi.x;
PV0iw = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R7i.y),intBitsToFloat(R0i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[19].x),intBitsToFloat(uf_remappedVS[19].y),intBitsToFloat(uf_remappedVS[19].z),intBitsToFloat(uf_remappedVS[19].w))));
PV1ix = tempi.x;
R5i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R7i.y),intBitsToFloat(R0i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R0i.w = tempi.x;
// 3
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R7i.y),intBitsToFloat(R0i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w))));
PV1iy = R126i.x;
PV1iz = R126i.x;
PV1iw = R126i.x;
R124i.w = PV0ix;
R124i.w = floatBitsToInt(intBitsToFloat(R124i.w) / 2.0);
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R7i.y),intBitsToFloat(R0i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[22].x),intBitsToFloat(uf_remappedVS[22].y),intBitsToFloat(uf_remappedVS[22].z),intBitsToFloat(uf_remappedVS[22].w))));
PV0ix = tempi.x;
R126i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(intBitsToFloat(R0i.w) * 1.0);
// 5
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R7i.y),intBitsToFloat(R0i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[23].x),intBitsToFloat(uf_remappedVS[23].y),intBitsToFloat(uf_remappedVS[23].z),intBitsToFloat(uf_remappedVS[23].w))));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
R124i.z = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R7i.y),intBitsToFloat(R0i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[24].x),intBitsToFloat(uf_remappedVS[24].y),intBitsToFloat(uf_remappedVS[24].z),intBitsToFloat(uf_remappedVS[24].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R127i.w = tempi.x;
// 7
PV1ix = floatBitsToInt((intBitsToFloat(uf_remappedVS[25].y) > 0.0)?1.0:0.0);
R126i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[11].z) + intBitsToFloat(R127i.x));
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[25].y))?1.0:0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[25].y));
// 8
R125i.y = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iw)));
R127i.z = floatBitsToInt(intBitsToFloat(R15i.y) * intBitsToFloat(PS1i));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R126i.z),intBitsToFloat(R127i.w)),vec4(intBitsToFloat(uf_remappedVS[26].x),intBitsToFloat(uf_remappedVS[26].y),intBitsToFloat(uf_remappedVS[26].z),intBitsToFloat(uf_remappedVS[26].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R125i.z = tempi.x;
PV1iw = tempi.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R126i.z),intBitsToFloat(R127i.w)),vec4(intBitsToFloat(uf_remappedVS[27].x),intBitsToFloat(uf_remappedVS[27].y),intBitsToFloat(uf_remappedVS[27].z),intBitsToFloat(uf_remappedVS[27].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 11
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(uf_remappedVS[5].z)) + intBitsToFloat(R127i.z));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
// 13
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV0iy)));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV0ix)));
// 14
R123i.y = floatBitsToInt(intBitsToFloat(R7i.z) * 0.5 + intBitsToFloat(R124i.w));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(R127i.x)) + intBitsToFloat(PV1ix));
// 15
PV1iw = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(R124i.z));
// 16
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(uf_remappedVS[1].w)) + -(intBitsToFloat(uf_remappedVS[1].y)));
// 17
R3i.x = uf_remappedVS[28].x;
R3i.y = uf_remappedVS[28].y;
R3i.z = uf_remappedVS[28].z;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.y));
// 18
R6i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS1i));
}
if( activeMaskStackC[3] == true ) {
// 0
R7i.x = floatBitsToInt(-(intBitsToFloat(R5i.x)) + intBitsToFloat(R3i.x));
R126i.y = uf_remappedVS[29].y;
R4i.z = floatBitsToInt(-(intBitsToFloat(R0i.z)) + intBitsToFloat(R3i.z));
R125i.w = uf_remappedVS[29].x;
R124i.x = uf_remappedVS[29].z;
// 1
R127i.x = floatBitsToInt(intBitsToFloat(R2i.w) + -(intBitsToFloat(uf_remappedVS[30].w)));
R125i.y = floatBitsToInt(intBitsToFloat(R2i.w) + -(intBitsToFloat(uf_remappedVS[31].w)));
PV1iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[31].w)) + intBitsToFloat(uf_remappedVS[30].w));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[31].x)) + intBitsToFloat(uf_remappedVS[30].x));
R124i.z = ((intBitsToFloat(R125i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.w = ((intBitsToFloat(R127i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
// 3
PV1ix = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(PS0i));
PV1iz = floatBitsToInt(-(intBitsToFloat(R124i.z)) + 1.0);
R124i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[30].x)) + intBitsToFloat(uf_remappedVS[32].x));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(PV1iy)) + intBitsToFloat(uf_remappedVS[31].x));
R125i.y = floatBitsToInt(intBitsToFloat(R2i.w) + -(intBitsToFloat(uf_remappedVS[32].w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[31].x), intBitsToFloat(PV1iz)));
// 5
R5i.x = ((intBitsToFloat(R125i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[30].w)) + intBitsToFloat(uf_remappedVS[32].w));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(PV0iz)) + intBitsToFloat(PV0iw));
// 6
R125i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[32].x)) + intBitsToFloat(uf_remappedVS[33].x));
PV0iy = floatBitsToInt(-(intBitsToFloat(R5i.x)) + 1.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 7
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[32].w)) + intBitsToFloat(uf_remappedVS[33].w));
PV1iz = floatBitsToInt(intBitsToFloat(R124i.w) * intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(intBitsToFloat(R2i.w) + -(intBitsToFloat(uf_remappedVS[33].w)));
// 8
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(uf_remappedVS[34].x)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(uf_remappedVS[34].y)));
R125i.z = ((intBitsToFloat(PV1iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PV1iz)) + intBitsToFloat(uf_remappedVS[30].x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(PS0i));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R126i.x)) + intBitsToFloat(R126i.w));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(uf_remappedVS[34].z)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
R124i.z = uf_remappedVS[35].x;
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(PV1ix)) + intBitsToFloat(uf_remappedVS[32].x));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PV1iw)));
R127i.z = uf_remappedVS[35].y;
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(PV0iy)) + intBitsToFloat(R126i.y));
R126i.y = uf_remappedVS[35].z;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(uf_remappedVS[36].x)));
// 12
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(uf_remappedVS[36].y)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[33].x),intBitsToFloat(R125i.z)) + intBitsToFloat(R123i.x));
// 13
R17i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[37].x)));
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[37].x)));
R17i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[37].x)));
R17i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(uf_remappedVS[34].w)));
R127i.z = ((intBitsToFloat(R6i.x) > 0.5)?-1:0);
// 14
PV0ix = floatBitsToInt(-(intBitsToFloat(R8i.y)) + 1.0);
PV0iy = ((intBitsToFloat(R6i.y) > 0.5)?-1:0);
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(uf_remappedVS[36].z)));
PV0iw = floatBitsToInt(-(intBitsToFloat(R8i.x)) + 1.0);
// 15
R2i.y = ((R127i.z == 0)?(R8i.x):(PV0iw));
R0i.z = ((PV0iy == 0)?(R8i.y):(PV0ix));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = uf_remappedVS[38].x & 0x100000;
PV0iy = uf_remappedVS[38].x & 0x80000;
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[25].w))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(uf_remappedVS[25].w) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[25].w));
// 1
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[39].x)) + intBitsToFloat(uf_remappedVS[40].x));
R126i.y = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
PV1iz = (PV0iy == 0x80000)?-1:0;
PV1iw = floatBitsToInt(intBitsToFloat(R15i.y) * intBitsToFloat(PS0i));
PS1i = (PV0ix == 0x100000)?-1:0;
// 2
R8i.x = ((PV1iz == 0)?(R8i.x):(R2i.y));
R125i.y = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(uf_remappedVS[6].x)) + intBitsToFloat(PV1iw));
R2i.w = ((PS1i == 0)?(R8i.y):(R0i.z));
// 3
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[39].w)) + intBitsToFloat(uf_remappedVS[40].w));
// 4
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[40].x)) + intBitsToFloat(uf_remappedVS[41].x));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV1iy)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 5
backupReg0i = R125i.y;
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[40].w)) + intBitsToFloat(uf_remappedVS[41].w));
R125i.y = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(PS0i));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV0iw));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R125i.z) + -(intBitsToFloat(uf_remappedVS[39].w)));
R126i.w = floatBitsToInt(intBitsToFloat(R125i.z) + -(intBitsToFloat(uf_remappedVS[40].w)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 7
backupReg0i = R127i.z;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R125i.y)) + intBitsToFloat(uf_remappedVS[39].x));
R125i.y = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.z = ((intBitsToFloat(R126i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iw = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(intBitsToFloat(R125i.z) + -(intBitsToFloat(uf_remappedVS[41].w)));
// 8
R125i.x = ((intBitsToFloat(PS1i) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iy = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PV1iw)) + intBitsToFloat(uf_remappedVS[40].x));
PV0iw = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].x), intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(-(intBitsToFloat(R125i.x)) + 1.0);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV0iw)));
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV1iy)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PV1iz)) + intBitsToFloat(PV1ix));
// 11
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(PV0ix)) + intBitsToFloat(R123i.w));
// 12
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[41].x),intBitsToFloat(R125i.x)) + intBitsToFloat(R123i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[37].x), intBitsToFloat(R1i.x)));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[37].x), intBitsToFloat(R0i.y)));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[37].x), intBitsToFloat(R1i.z)));
R10i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(uf_remappedVS[36].w)));
// 1
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(uf_remappedVS[42].x)));
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) * 2.0);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(uf_remappedVS[42].y)));
R125i.y = floatBitsToInt(intBitsToFloat(R125i.y) * 2.0);
R1i.z = floatBitsToInt(fract(intBitsToFloat(R1i.w)));
R125i.w = floatBitsToInt(intBitsToFloat(R15i.y) * 100.0);
R125i.w = clampFI32(R125i.w);
PS1i = int(intBitsToFloat(uf_remappedVS[43].z));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[44].w) + intBitsToFloat(uf_remappedVS[42].y));
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[44].z) + intBitsToFloat(uf_remappedVS[42].x));
R126i.x = floatBitsToInt(float(PS1i));
// 3
PV1ix = floatBitsToInt(-(abs(intBitsToFloat(R126i.x))) + 0.0);
PV1iy = floatBitsToInt((0.0 >= abs(intBitsToFloat(R126i.x)))?1.0:0.0);
PV1iz = floatBitsToInt(-(intBitsToFloat(R125i.y)) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(-(intBitsToFloat(R125i.x)) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 4
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R15i.y)),intBitsToFloat(uf_remappedVS[44].x)) + -(intBitsToFloat(PV1iw)));
R125i.y = ((intBitsToFloat(PV1iy) == 0.0)?(0):(PV1ix));
PV0iz = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.y),intBitsToFloat(uf_remappedVS[44].y)) + intBitsToFloat(PV1iz));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[43].z));
// 5
PV1ix = floatBitsToInt(abs(intBitsToFloat(R126i.x)) + intBitsToFloat(R125i.y));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[43].x), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(trunc(intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[43].w));
// 6
backupReg0i = R125i.y;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R125i.w)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[43].y), intBitsToFloat(PS1i)));
R123i.z = ((-(intBitsToFloat(backupReg0i)) > 0.0)?(PV1ix):(backupReg0i));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R125i.z)) + -(0.5));
PS0i = int(intBitsToFloat(PV1iw));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[45].x) + intBitsToFloat(uf_remappedVS[45].z));
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[45].y) + intBitsToFloat(uf_remappedVS[45].w));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R125i.y)) + -(0.5));
R123i.w = ((intBitsToFloat(R126i.x) == 0.0)?(0):(R123i.z));
PS1i = floatBitsToInt(float(PS0i));
// 8
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)),intBitsToFloat(PS1i)) + intBitsToFloat(R126i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(uf_remappedVS[45].z)) + intBitsToFloat(PV1ix));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(uf_remappedVS[45].w)) + intBitsToFloat(PV1iy));
PS0i = int(intBitsToFloat(R123i.w));
// 9
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.y),intBitsToFloat(uf_remappedVS[42].z)) + intBitsToFloat(R123i.y));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R125i.w)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.y),intBitsToFloat(uf_remappedVS[42].w)) + intBitsToFloat(R123i.z));
PS1i = floatBitsToInt(float(PS0i));
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(PS1i)) + intBitsToFloat(R125i.x));
R125i.y = floatBitsToInt(-(intBitsToFloat(R7i.y)) + intBitsToFloat(R3i.y));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R125i.w)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R127i.z)) + -(intBitsToFloat(R126i.x)));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(R4i.z) * intBitsToFloat(R4i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.x));
// 12
R11i.x = floatBitsToInt(intBitsToFloat(R123i.z) + 0.5);
R11i.y = floatBitsToInt(intBitsToFloat(R125i.w) + 0.5);
R11i.z = 0;
R122i.x = floatBitsToInt((intBitsToFloat(R125i.y) * intBitsToFloat(R125i.y) + intBitsToFloat(PV1ix)));
// 13
R123i.z = floatBitsToInt((intBitsToFloat(R7i.x) * intBitsToFloat(R7i.x) + intBitsToFloat(R122i.x)));
// 14
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.z));
PS0i = floatBitsToInt(tempResultf);
// 15
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(PS0i)));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PS0i)));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PS0i)));
R6i.x = uf_remappedVS[12].x;
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[46].x),intBitsToFloat(uf_remappedVS[46].y),intBitsToFloat(uf_remappedVS[46].z),0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(intBitsToFloat(uf_remappedVS[46].y) + 1.0);
// 1
R124i.x = floatBitsToInt(intBitsToFloat(PS0i) * 1.5);
R124i.x = clampFI32(R124i.x);
R16i.y = uf_remappedVS[47].x;
R127i.z = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
PV1iw = floatBitsToInt(min(intBitsToFloat(R3i.y), intBitsToFloat(uf_remappedVS[48].z)));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(uf_remappedVS[49].x)) + -(intBitsToFloat(uf_remappedVS[49].y)));
R123i.x = clampFI32(R123i.x);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(uf_remappedVS[50].x)) + -(intBitsToFloat(uf_remappedVS[50].y)));
R123i.y = clampFI32(R123i.y);
PV0iz = floatBitsToInt(-(intBitsToFloat(R2i.z)) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R122i.x = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
// 3
R126i.x = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[48].y),intBitsToFloat(PV0iz)) + intBitsToFloat(uf_remappedVS[48].x));
R7i.y = clampFI32(R7i.y);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R122i.x)) + intBitsToFloat(0xbe593484));
PV1iw = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0iw)));
// 4
backupReg0i = R127i.z;
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3f22f983));
R125i.y = floatBitsToInt(intBitsToFloat(R124i.x) * 15.0);
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[46].y) * 1.0 + intBitsToFloat(R6i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R123i.z)) + intBitsToFloat(0x3fc90da4));
tempResultf = max(0.0, intBitsToFloat(PV1iw));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 5
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),-(intBitsToFloat(R123i.w))) + 1.0);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[49].w), intBitsToFloat(PS0i)));
tempResultf = max(0.0, intBitsToFloat(R126i.x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 6
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[51].x), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[51].y), intBitsToFloat(PS1i)));
R1i.w = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 7
R16i.x = floatBitsToInt(intBitsToFloat(R6i.x) * 1.0 + 0.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 8
R3i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
PS0i = floatBitsToInt(exp2(intBitsToFloat(R126i.x)));
// 9
R5i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[51].z)),intBitsToFloat(PS0i)) + intBitsToFloat(uf_remappedVS[51].z));
R5i.y = clampFI32(R5i.y);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R125i.y));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS1i));
// 11
PV1iz = floatBitsToInt(max(intBitsToFloat(PV0ix), intBitsToFloat(0x3e4ccccd)));
// 12
R2i.w = floatBitsToInt(min(intBitsToFloat(PV1iz), 1.0));
}
if( activeMaskStackC[3] == true ) {
R3i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y))).xyz);
}
if( activeMaskStackC[3] == true ) {
// 0
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R2i.w)));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(uf_remappedVS[52].w)));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R2i.w)));
R13i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(uf_remappedVS[53].z)));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R2i.w)));
// 1
R13i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.w)),intBitsToFloat(uf_remappedVS[54].w)) + intBitsToFloat(uf_remappedVS[54].w));
PV1iy = floatBitsToInt(-(intBitsToFloat(R13i.w)) + intBitsToFloat(R5i.y));
PV1iy = clampFI32(PV1iy);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.y), intBitsToFloat(uf_remappedVS[55].x)));
R1i.w = 0;
// 2
R123i.x = floatBitsToInt(intBitsToFloat(PV1iz) * 0.25 + 0.5);
R123i.x = clampFI32(R123i.x);
R13i.z = PV1iy;
R12i.w = PV1iy;
// 3
PV1iw = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
// 4
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + 8.5);
// 5
R1i.x = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3daaaaab));
}
if( activeMaskStackC[3] == true ) {
R14i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.w))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
R19i.x = R9i.x;
R19i.y = R9i.y;
R19i.z = R9i.z;
R19i.w = R9i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.z));
// export
passParameterSem8 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.z));
}
