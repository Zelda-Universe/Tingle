#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader a3ff51bf48f805d1
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[54];
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
ATTR_LAYOUT(0, 12) in uvec4 attrDataSem12;
ATTR_LAYOUT(0, 13) in uvec4 attrDataSem13;
ATTR_LAYOUT(0, 14) in uvec4 attrDataSem14;

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
attrDecoder = attrDataSem9;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R9i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyz = attrDataSem8.xyz;
attrDecoder.xyz = uvec3((attrDecoder.xyz>>24)|((attrDecoder.xyz>>8)&0xFF00u)|((attrDecoder.xyz<<8)&0xFF0000u)|((attrDecoder.xyz<<24)));
attrDecoder.w = uint(0);
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), 0x3f800000);
attrDecoder = attrDataSem14;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R13i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem13;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R12i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem3;
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem6;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem7;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem11;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R11i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem10;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R10i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
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
R7i.z = floatBitsToInt(-(intBitsToFloat(R12i.y)) + 1.0);
R0i.w = 0;
R5i.w = floatBitsToInt(1.0);
// 1
R7i.w = floatBitsToInt(-(intBitsToFloat(R7i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R8i.w = floatBitsToInt(-(intBitsToFloat(R12i.x)) + 1.0);
// 2
predResult = (0.0 > intBitsToFloat(R7i.w));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R18i.x = 0;
R18i.y = 0;
R18i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R0i.x = 0;
// 1
R9i.w = R5i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R9i.w = R0i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R9i.w == 0);
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
R6i.x = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R7i.w) >= intBitsToFloat(R6i.x));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R18i.x = 0;
R18i.y = 0;
R18i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R0i.x = 0;
// 1
R0i.w = R5i.w;
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
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R127i.x = R1i.y;
R0i.y = R2i.x;
R6i.z = R3i.x;
R127i.w = R2i.y;
R127i.z = R3i.y;
// 1
R126i.x = R1i.z;
R127i.y = R2i.z;
R126i.z = R3i.z;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R0i.y),intBitsToFloat(R6i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R0i.y),intBitsToFloat(R6i.z),0.0)));
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
R6i.y = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.w = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 5
R0i.y = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 6
predResult = (intBitsToFloat(R6i.y) > 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R6i.y));
// 1
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R127i.y)));
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R127i.y)));
// 2
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R16i.x = 0;
// 1
R14i.x = R16i.x;
// 2
R15i.x = R16i.x;
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
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R127i.x)));
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R127i.x)));
// 2
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R14i.y = 0;
R15i.y = 0;
// 1
R16i.y = 0;
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
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R127i.x)));
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R127i.x)));
// 2
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R14i.z = 0;
R15i.z = 0;
// 1
R16i.z = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[2].x))?1.0:0.0);
PV0iy = floatBitsToInt((intBitsToFloat(uf_remappedVS[2].x) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt(max(intBitsToFloat(R10i.x), 0.0));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(uf_remappedVS[3].y)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[2].x));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R7i.w) * intBitsToFloat(PS0i));
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].x)) + intBitsToFloat(uf_remappedVS[5].x));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(min(intBitsToFloat(PV0iz), 0.0));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R6i.x));
// 2
R0i.x = floatBitsToInt(intBitsToFloat(R11i.x) + intBitsToFloat(PV1iw));
R0i.y = floatBitsToInt(intBitsToFloat(R7i.w) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1ix));
PV0iw = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].y)) + intBitsToFloat(uf_remappedVS[5].y));
// 3
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PV0iw)));
R125i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].z)) + intBitsToFloat(uf_remappedVS[5].z));
PV1iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].w)) + intBitsToFloat(uf_remappedVS[5].w));
PV1iw = floatBitsToInt(fract(intBitsToFloat(PV0iz)));
// 4
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV1iw)));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].x)) + intBitsToFloat(uf_remappedVS[6].x));
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].y)) + intBitsToFloat(uf_remappedVS[6].y));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
// 5
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0iy));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS0i));
R127i.z = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(PS0i));
R127i.w = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(PS0i));
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].z)) + intBitsToFloat(uf_remappedVS[6].z));
// 6
R126i.x = floatBitsToInt(intBitsToFloat(R127i.x) + -(intBitsToFloat(uf_remappedVS[5].w)));
PV0iz = floatBitsToInt(intBitsToFloat(R127i.x) + -(intBitsToFloat(uf_remappedVS[4].w)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(R127i.w)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(R127i.z)));
PV1iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].w)) + intBitsToFloat(uf_remappedVS[6].w));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(R127i.y)));
R125i.y = ((intBitsToFloat(PV0iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 8
R125i.x = ((intBitsToFloat(R126i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].z) + intBitsToFloat(PV1ix));
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].x) + intBitsToFloat(PV1iw));
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].y) + intBitsToFloat(PV1iy));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS0i));
PV1iz = floatBitsToInt(intBitsToFloat(R127i.x) + -(intBitsToFloat(uf_remappedVS[6].w)));
PV1iw = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(-(intBitsToFloat(R125i.x)) + 1.0);
// 10
backupReg0i = R126i.x;
R126i.x = ((intBitsToFloat(PV1iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1iy)));
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PS1i)));
// 11
backupReg0i = R127i.z;
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].x) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].y) + intBitsToFloat(PV0iw));
R126i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].z) + intBitsToFloat(PV0iy));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R124i.x)));
// 12
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].x), intBitsToFloat(backupReg0i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PV1iy)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].y), intBitsToFloat(backupReg0i)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].z), intBitsToFloat(backupReg0i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R124i.x)));
// 13
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV0iy)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R124i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV0iy)));
PS1i = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
// 14
R124i.x = floatBitsToInt(intBitsToFloat(R10i.x) + intBitsToFloat(R10i.y));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].x), intBitsToFloat(PS1i)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), intBitsToFloat(PS1i)));
R0i.w = 0x3f800000;
// 15
R7i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w))));
PV1iy = R7i.x;
PV1iz = R7i.x;
PV1iw = R7i.x;
PS1i = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV0iz));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R5i.w = tempi.x;
PS0i = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PS1i));
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R6i.w = tempi.x;
PS1i = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PS0i));
// 18
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(intBitsToFloat(R124i.x) * 0.5);
PV0iz = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R126i.w));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(R125i.y));
PS0i = floatBitsToInt(intBitsToFloat(R10i.y) + intBitsToFloat(R10i.z));
// 19
PV1ix = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(intBitsToFloat(PS0i) * 0.5);
PV1iz = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(R10i.x) + intBitsToFloat(R10i.z));
R127i.y = floatBitsToInt(intBitsToFloat(PV0iy) + -(0.5));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
// 20
PV0ix = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(PV1iz));
PV0iy = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) * 0.5);
R124i.w = floatBitsToInt(intBitsToFloat(PV1iy) + -(0.5));
R124i.w = floatBitsToInt(intBitsToFloat(R124i.w) * 2.0);
R3i.z = floatBitsToInt(intBitsToFloat(R10i.x) + -(0.5));
// 21
backupReg0i = R11i.y;
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + -(0.5));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), intBitsToFloat(PV0ix)));
R1i.z = floatBitsToInt(intBitsToFloat(R10i.y) + -(0.5));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iy)));
R2i.x = floatBitsToInt(intBitsToFloat(R10i.z) + -(0.5));
// 22
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(uf_remappedVS[7].z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(uf_remappedVS[7].y)));
PV0iz = R10i.y;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(uf_remappedVS[7].x)));
PS0i = R10i.z;
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 23
R0i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].y) + intBitsToFloat(PV0iy));
R1i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].z) + intBitsToFloat(PV0ix));
R2i.z = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(uf_remappedVS[8].x));
PV1iw = floatBitsToInt(floor(intBitsToFloat(PV0iz)));
R1i.x = floatBitsToInt(floor(intBitsToFloat(PS0i)));
// 24
R11i.x = uf_remappedVS[9].x & 0x20000;
R3i.y = uf_remappedVS[9].x & 0x10000;
R11i.z = floatBitsToInt((intBitsToFloat(PV1iw) > 0.0)?1.0:0.0);
R2i.w = uf_remappedVS[9].x & 0x40000;
R3i.w = floatBitsToInt((0.0 > intBitsToFloat(PV1iw))?1.0:0.0);
}
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R11i.y;
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(uf_remappedVS[10].y)));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(uf_remappedVS[10].z)));
R127i.z = floatBitsToInt(intBitsToFloat(R11i.z) + -(intBitsToFloat(R3i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[10].w)));
PS0i = floatBitsToInt(float(R3i.y));
// 1
R124i.x = floatBitsToInt((intBitsToFloat(R1i.x) > 0.0)?1.0:0.0);
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(PV0iw)));
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(float(R11i.x));
// 2
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(R1i.x))?1.0:0.0);
PS0i = floatBitsToInt(float(R2i.w));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0ix)));
R127i.y = floatBitsToInt(intBitsToFloat(R124i.x) + -(intBitsToFloat(PV0iw)));
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R124i.x = int(intBitsToFloat(PV0iy));
// 4
PV0ix = 0 - R124i.x;
PV0iy = R10i.x;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(uf_remappedVS[11].x)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iw)));
R124i.w = int(intBitsToFloat(PV1ix));
// 5
PV1ix = 0 - R124i.w;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(uf_remappedVS[11].y)));
PV1iz = max(R124i.x, PV0ix);
PV1iw = floatBitsToInt(floor(intBitsToFloat(PV0iy)));
R125i.z = int(intBitsToFloat(PV0iw));
// 6
PV0ix = 0 - R125i.z;
PV0iy = max(R124i.w, PV1ix);
PV0iz = floatBitsToInt((intBitsToFloat(PV1iw) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PV1iw))?1.0:0.0);
PS0i = floatBitsToInt(float(PV1iz));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 7
backupReg0i = R127i.z;
PV1ix = max(R125i.z, PV0ix);
R125i.y = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iw)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(uf_remappedVS[11].z)));
PV1iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(backupReg0i)));
PS1i = floatBitsToInt(float(PV0iy));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(R127i.y)));
R124i.w = ((intBitsToFloat(uf_remappedVS[8].w) == 1.0)?-1:0);
PS0i = floatBitsToInt(float(PV1ix));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(R125i.y)));
R125i.y = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV0iz)));
PV1iw = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV0iy));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PV0iz)));
// 10
R126i.x = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV1iz));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(PS1i));
R127i.w = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R126i.z));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PV1ix)));
// 11
R127i.x = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(R126i.y));
PV1iy = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(PS0i));
PV1iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].w)) + 1.0);
R125i.w = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV0iy));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[8].w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 12
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(PS1i)));
R126i.w = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R127i.z));
R124i.x = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
// 13
R9i.w = R7i.x;
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iy)));
// 14
PV0iz = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
R0i.w = floatBitsToInt(intBitsToFloat(R3i.y) * 0.0 + 1.0);
// 15
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(R124i.x));
// 16
R123i.z = ((R124i.w == 0)?(PV1iw):(R7i.w));
// 17
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R123i.z)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R123i.z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R123i.z)));
// 18
PV0ix = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV1iw));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1iy));
// 19
R123i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.w = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e22f983) + 0.5);
// 20
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
// 21
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 22
R127i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R125i.y = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
R127i.z = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
// 23
R126i.w = floatBitsToInt(sin((intBitsToFloat(R127i.x))/0.1591549367));
// 24
R126i.z = floatBitsToInt(cos((intBitsToFloat(R127i.x))/0.1591549367));
// 25
R126i.y = floatBitsToInt(sin((intBitsToFloat(R127i.z))/0.1591549367));
// 26
backupReg0i = R126i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(backupReg0i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(backupReg0i)));
R127i.x = floatBitsToInt(cos((intBitsToFloat(R127i.z))/0.1591549367));
// 27
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R127i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R127i.x)));
R125i.w = floatBitsToInt(sin((intBitsToFloat(R125i.y))/0.1591549367));
// 28
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R125i.z)));
R5i.y = floatBitsToInt(-(intBitsToFloat(R125i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R127i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R126i.x)));
R127i.z = floatBitsToInt(cos((intBitsToFloat(R125i.y))/0.1591549367));
// 29
R0i.x = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV0ix));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R127i.z)));
R1i.z = floatBitsToInt(-(intBitsToFloat(R126i.x)) + intBitsToFloat(PV0iz));
PV1iw = floatBitsToInt(-(intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iw));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R127i.z)));
// 30
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R127i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R127i.z)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R127i.z)));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R3i.y)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(PV1iw)));
// 31
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R3i.y)));
R1i.y = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV0ix));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(PV0iy)));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R1i.w)) + intBitsToFloat(PS0i));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = uf_remappedVS[12].x;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R3i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R1i.y)));
PV0iw = uf_remappedVS[12].y;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R0i.x)) + intBitsToFloat(R2i.w));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R5i.y)) + intBitsToFloat(R5i.z));
PV1iy = floatBitsToInt(intBitsToFloat(R9i.y) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(PV0ix));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R2i.z)) + intBitsToFloat(PV0iz));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].x), intBitsToFloat(uf_remappedVS[14].x)));
// 2
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PV1iz)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R2i.y)) + intBitsToFloat(R123i.x));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(PV1iy)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R1i.z)) + intBitsToFloat(R123i.w));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].x), intBitsToFloat(uf_remappedVS[14].y)));
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R5i.y)) + intBitsToFloat(R5i.x));
R5i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[14].w) * 1.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R2i.z)) + intBitsToFloat(R127i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R1i.w)) + intBitsToFloat(R3i.w));
R1i.w = 0x3f800000;
// 4
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R2i.y)) + intBitsToFloat(R123i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R0i.x)) + intBitsToFloat(R123i.w));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R1i.z)) + intBitsToFloat(R123i.z));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.z), intBitsToFloat(R126i.w)));
// 5
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R0i.w))));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y),intBitsToFloat(R125i.y)) + intBitsToFloat(PS0i));
// 6
R21i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.x),intBitsToFloat(R126i.y)) + intBitsToFloat(R122i.x));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[14].z)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.z), intBitsToFloat(R126i.w)));
// 7
R127i.x = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(R125i.z));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.y),intBitsToFloat(R125i.y)) + intBitsToFloat(PS0i));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),intBitsToFloat(R15i.z),intBitsToFloat(R9i.w)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R0i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R125i.w = tempi.x;
R21i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.x),intBitsToFloat(R126i.y)) + intBitsToFloat(R122i.x));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(R14i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.y),intBitsToFloat(R125i.y),intBitsToFloat(R126i.w),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R21i.z = tempi.x;
PV1iw = tempi.x;
R122i.x = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0x3e22f983) + 0.5);
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(R14i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R0i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R1i.z = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(fract(intBitsToFloat(R122i.x)));
// 11
R123i.x = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iy = floatBitsToInt((intBitsToFloat(uf_remappedVS[15].y) > 0.0)?1.0:0.0);
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[15].y))?1.0:0.0);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedVS[14].z)));
// 12
backupReg0i = R124i.y;
R124i.y = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(backupReg0i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[15].y));
// 13
R123i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iw = floatBitsToInt(intBitsToFloat(R7i.w) * intBitsToFloat(PS0i));
R127i.y = floatBitsToInt(cos((intBitsToFloat(PV0iz))/0.1591549367));
// 14
R126i.x = floatBitsToInt(-(intBitsToFloat(R124i.y)) + 1.0);
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x),intBitsToFloat(uf_remappedVS[2].z)) + intBitsToFloat(PV1iw));
// 15
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
// 16
PV0ix = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PV1iy)));
// 17
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R126i.x)) + intBitsToFloat(PV0iw));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 18
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R127i.y)));
// 19
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R5i.y)));
// 20
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(0xbccccccd));
// 21
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].y), intBitsToFloat(PV0iy)));
// 22
R11i.y = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(PV1ix));
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R11i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),intBitsToFloat(uf_remappedVS[16].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R5i.z = tempi.x;
PV0iw = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R11i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[17].x),intBitsToFloat(uf_remappedVS[17].y),intBitsToFloat(uf_remappedVS[17].z),intBitsToFloat(uf_remappedVS[17].w))));
PV1ix = tempi.x;
R9i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R11i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[18].x),intBitsToFloat(uf_remappedVS[18].y),intBitsToFloat(uf_remappedVS[18].z),intBitsToFloat(uf_remappedVS[18].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R18i.w = tempi.x;
// 3
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R11i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[19].x),intBitsToFloat(uf_remappedVS[19].y),intBitsToFloat(uf_remappedVS[19].z),intBitsToFloat(uf_remappedVS[19].w))));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
R125i.z = PV0ix;
R125i.z = floatBitsToInt(intBitsToFloat(R125i.z) / 2.0);
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R11i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w))));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(intBitsToFloat(R18i.w) * 1.0);
// 5
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R11i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w))));
PV1iy = R126i.x;
PV1iz = R126i.x;
PV1iw = R126i.x;
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R11i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[22].x),intBitsToFloat(uf_remappedVS[22].y),intBitsToFloat(uf_remappedVS[22].z),intBitsToFloat(uf_remappedVS[22].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R125i.w = tempi.x;
// 7
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[12].z) + intBitsToFloat(R126i.x));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R125i.w)),vec4(intBitsToFloat(uf_remappedVS[23].x),intBitsToFloat(uf_remappedVS[23].y),intBitsToFloat(uf_remappedVS[23].z),intBitsToFloat(uf_remappedVS[23].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R126i.w = tempi.x;
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R125i.w)),vec4(intBitsToFloat(uf_remappedVS[24].x),intBitsToFloat(uf_remappedVS[24].y),intBitsToFloat(uf_remappedVS[24].z),intBitsToFloat(uf_remappedVS[24].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 10
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS0i));
// 12
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.w), intBitsToFloat(PV1ix)));
// 13
R123i.y = floatBitsToInt(intBitsToFloat(R2i.w) * 0.5 + intBitsToFloat(R125i.z));
// 14
PV0iz = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(R127i.w));
// 15
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(uf_remappedVS[1].w)) + -(intBitsToFloat(uf_remappedVS[1].y)));
// 16
R6i.x = uf_remappedVS[25].x;
R6i.y = uf_remappedVS[25].y;
R6i.z = uf_remappedVS[25].z;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R123i.y));
// 17
R5i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS0i));
}
if( activeMaskStackC[3] == true ) {
// 0
R3i.x = floatBitsToInt(-(intBitsToFloat(R0i.x)) + intBitsToFloat(R6i.x));
R124i.y = uf_remappedVS[26].x;
R9i.z = floatBitsToInt(-(intBitsToFloat(R1i.z)) + intBitsToFloat(R6i.z));
R126i.w = uf_remappedVS[26].y;
R125i.x = uf_remappedVS[26].z;
// 1
R127i.x = floatBitsToInt(intBitsToFloat(R2i.z) + -(intBitsToFloat(uf_remappedVS[27].w)));
R127i.y = floatBitsToInt(intBitsToFloat(R2i.z) + -(intBitsToFloat(uf_remappedVS[28].w)));
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[28].w)) + intBitsToFloat(uf_remappedVS[27].w));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[28].x)) + intBitsToFloat(uf_remappedVS[27].x));
R127i.z = ((intBitsToFloat(R127i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.w = ((intBitsToFloat(R127i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 3
PV1ix = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(PS0i));
R125i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[27].x)) + intBitsToFloat(uf_remappedVS[29].x));
PV1iw = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
PS1i = ((intBitsToFloat(R10i.x) > 0.5)?-1:0);
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PV1iy)) + intBitsToFloat(uf_remappedVS[28].x));
R127i.y = floatBitsToInt(intBitsToFloat(R2i.z) + -(intBitsToFloat(uf_remappedVS[29].w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[28].x), intBitsToFloat(PV1iw)));
R5i.x = ((PS1i == 0)?(R12i.x):(R8i.w));
// 5
R0i.x = ((intBitsToFloat(R127i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[27].w)) + intBitsToFloat(uf_remappedVS[29].w));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(PV0iz)) + intBitsToFloat(PV0iw));
PV1iw = ((intBitsToFloat(R10i.y) > 0.5)?-1:0);
// 6
R124i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[29].x)) + intBitsToFloat(uf_remappedVS[30].x));
PV0iy = floatBitsToInt(-(intBitsToFloat(R0i.x)) + 1.0);
R1i.w = ((PV1iw == 0)?(R12i.y):(R7i.z));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 7
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[29].w)) + intBitsToFloat(uf_remappedVS[30].w));
PV1iz = floatBitsToInt(intBitsToFloat(R2i.z) + -(intBitsToFloat(uf_remappedVS[30].w)));
PV1iw = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(PS0i));
// 8
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(uf_remappedVS[31].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(uf_remappedVS[31].y)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PV1iw)) + intBitsToFloat(uf_remappedVS[27].x));
R127i.w = ((intBitsToFloat(PV1iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R124i.x) * intBitsToFloat(PS0i));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R126i.x)) + intBitsToFloat(R126i.z));
PV1iz = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
R126i.w = uf_remappedVS[32].x;
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(uf_remappedVS[31].z)));
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PV1ix)) + intBitsToFloat(uf_remappedVS[29].x));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1iz)));
PV0iz = ((intBitsToFloat(R10i.z) > 0.5)?-1:0);
R125i.w = uf_remappedVS[32].y;
PS0i = ((intBitsToFloat(R10i.w) > 0.5)?-1:0);
// 11
backupReg0i = R126i.w;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(PV0iy)) + intBitsToFloat(R124i.y));
R5i.y = ((PS0i == 0)?(R12i.y):(R7i.z));
R2i.z = ((PV0iz == 0)?(R12i.x):(R8i.w));
R126i.w = uf_remappedVS[32].z;
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[33].x)));
// 12
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(uf_remappedVS[33].y)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[30].x),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.x));
// 13
R19i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(uf_remappedVS[34].x)));
R19i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[34].x)));
R19i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(uf_remappedVS[34].x)));
R19i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(uf_remappedVS[31].w)));
// 14
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(uf_remappedVS[33].z)));
PS0i = int(intBitsToFloat(uf_remappedVS[35].z));
// 15
R126i.x = floatBitsToInt(float(PS0i));
// 16
PV0iz = floatBitsToInt((0.0 >= abs(intBitsToFloat(R126i.x)))?1.0:0.0);
PV0iw = floatBitsToInt(-(abs(intBitsToFloat(R126i.x))) + 0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 17
R124i.y = ((intBitsToFloat(PV0iz) == 0.0)?(0):(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[35].z));
// 18
PV0ix = floatBitsToInt(abs(intBitsToFloat(R126i.x)) + intBitsToFloat(R124i.y));
PV0iz = floatBitsToInt(trunc(intBitsToFloat(PV1iw)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].x), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[35].w));
// 19
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].y), intBitsToFloat(PS0i)));
R123i.w = ((-(intBitsToFloat(R124i.y)) > 0.0)?(PV0ix):(R124i.y));
R2i.y = int(intBitsToFloat(PV0iz));
// 20
R123i.z = ((intBitsToFloat(R126i.x) == 0.0)?(0):(R123i.w));
// 21
R0i.y = int(intBitsToFloat(R123i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = uf_remappedVS[36].x;
PV0iy = uf_remappedVS[9].x & 0x200000;
PV0iz = uf_remappedVS[9].x & 0x100000;
PV0iw = uf_remappedVS[9].x & 0x80000;
PS0i = uf_remappedVS[9].x & 0x400000;
// 1
PV1ix = (PV0iy == 0x200000)?-1:0;
PV1iy = (PV0iz == 0x100000)?-1:0;
PV1iz = (PV0iw == 0x80000)?-1:0;
PV1iw = (PS0i == 0x400000)?-1:0;
PS1i = uf_remappedVS[9].y & int(1);
// 2
backupReg0i = R5i.x;
R5i.x = ((PV1iw == 0)?(R12i.y):(R5i.y));
R5i.y = ((PV1ix == 0)?(R12i.x):(R2i.z));
R2i.z = ((PV1iy == 0)?(R12i.y):(R1i.w));
R1i.w = ((PV1iz == 0)?(R12i.x):(backupReg0i));
R1i.z = (int(1) != PS1i)?-1:0;
// 3
R8i.z = floatBitsToInt(float(R0i.y));
// 4
R3i.w = floatBitsToInt(float(R2i.y));
}
if( activeMaskStackC[3] == true ) {
// 0
R20i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[34].x), intBitsToFloat(R2i.x)));
R20i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[34].x), intBitsToFloat(R1i.y)));
R20i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[34].x), intBitsToFloat(R3i.z)));
R20i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[33].w)));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(uf_remappedVS[37].x)));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(uf_remappedVS[37].y)));
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) * 2.0);
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[38].w) + intBitsToFloat(uf_remappedVS[37].y));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[38].z) + intBitsToFloat(uf_remappedVS[37].x));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(R0i.w)) + -(0.5));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[39].x) + intBitsToFloat(uf_remappedVS[39].z));
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[39].y) + intBitsToFloat(uf_remappedVS[39].w));
PV0iz = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(-(intBitsToFloat(PV1iy)) + intBitsToFloat(PV1iz));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R8i.y)) + -(0.5));
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.w)),intBitsToFloat(uf_remappedVS[38].x)) + -(intBitsToFloat(PV0iz)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x),intBitsToFloat(uf_remappedVS[39].z)) + intBitsToFloat(PV0ix));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(uf_remappedVS[38].y)) + intBitsToFloat(PV0iw));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(uf_remappedVS[39].w)) + intBitsToFloat(PV0iy));
R127i.z = ((R1i.z == 0)?(0):(int(1)));
// 4
backupReg0i = R123i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R8i.z)) + intBitsToFloat(R123i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R8i.y)),intBitsToFloat(R3i.w)) + intBitsToFloat(R123i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(uf_remappedVS[37].z)) + intBitsToFloat(backupReg0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(uf_remappedVS[37].w)) + intBitsToFloat(R123i.w));
R127i.y = (R127i.z == int(1))?-1:0;
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R126i.z)) + intBitsToFloat(R123i.x));
PV1iy = (R127i.z == 0x2)?-1:0;
R126i.z = ((R127i.y == 0)?(R10i.x):(R10i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R124i.y)) + -(intBitsToFloat(R123i.y)));
R125i.z = ((R127i.y == 0)?(R10i.y):(R10i.z));
// 6
R14i.x = floatBitsToInt(intBitsToFloat(R123i.x) + 0.5);
R14i.y = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
R123i.z = ((PV1iy == 0)?(R10i.y):(R10i.x));
R123i.w = ((PV1iy == 0)?(R10i.x):(R10i.z));
PS0i = int(intBitsToFloat(uf_remappedVS[40].z));
// 7
R123i.x = ((R127i.y == 0)?(R123i.z):(R10i.z));
R123i.y = ((R127i.y == 0)?(R123i.w):(R10i.y));
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[41].w) + intBitsToFloat(uf_remappedVS[42].y));
R126i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[41].z) + intBitsToFloat(uf_remappedVS[42].x));
R126i.x = floatBitsToInt(float(PS0i));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[42].x), intBitsToFloat(R123i.y)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[42].y), intBitsToFloat(R123i.x)));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
PV0iz = floatBitsToInt((0.0 >= abs(intBitsToFloat(R126i.x)))?1.0:0.0);
PV0iw = floatBitsToInt(-(abs(intBitsToFloat(R126i.x))) + 0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 9
backupReg0i = R127i.z;
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
R127i.y = ((intBitsToFloat(PV0iz) == 0.0)?(0):(PV0iw));
R127i.z = floatBitsToInt(-(intBitsToFloat(PV0ix)) + intBitsToFloat(R126i.w));
R126i.w = floatBitsToInt(-(intBitsToFloat(PV0iy)) + intBitsToFloat(backupReg0i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[40].z));
// 10
PV0ix = floatBitsToInt(abs(intBitsToFloat(R126i.x)) + intBitsToFloat(R127i.y));
R4i.y = floatBitsToInt(fract(intBitsToFloat(R4i.w)));
PV0iz = floatBitsToInt(trunc(intBitsToFloat(PV1ix)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].x), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[40].w));
// 11
backupReg0i = R127i.y;
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.w)),intBitsToFloat(uf_remappedVS[41].x)) + -(intBitsToFloat(R127i.z)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].y), intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(uf_remappedVS[41].y)) + intBitsToFloat(R126i.w));
R123i.w = ((-(intBitsToFloat(backupReg0i)) > 0.0)?(PV0ix):(backupReg0i));
PS1i = int(intBitsToFloat(PV0iz));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[43].x) + intBitsToFloat(uf_remappedVS[43].z));
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[43].y) + intBitsToFloat(uf_remappedVS[43].w));
R123i.z = ((intBitsToFloat(R126i.x) == 0.0)?(0):(R123i.w));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R127i.w)) + -(0.5));
PS0i = floatBitsToInt(float(PS1i));
// 13
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[43].z),intBitsToFloat(R126i.z)) + intBitsToFloat(PV0ix));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R127i.y)) + -(0.5));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[43].w),intBitsToFloat(R125i.z)) + intBitsToFloat(PV0iy));
PS1i = int(intBitsToFloat(R123i.z));
// 14
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(uf_remappedVS[42].z)) + intBitsToFloat(R123i.y));
R127i.y = floatBitsToInt(intBitsToFloat(R7i.w) * 100.0);
R127i.y = clampFI32(R127i.y);
R126i.z = floatBitsToInt(-(intBitsToFloat(R11i.y)) + intBitsToFloat(R6i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(uf_remappedVS[42].w)) + intBitsToFloat(R123i.w));
PS0i = floatBitsToInt(float(PS1i));
// 15
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PS0i)) + intBitsToFloat(R125i.x));
R18i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(R127i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R127i.z)) + -(intBitsToFloat(R126i.x)));
PV1iw = floatBitsToInt(intBitsToFloat(R9i.z) * intBitsToFloat(R9i.z));
R18i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R127i.y)));
// 16
backupReg0i = R123i.x;
R123i.x = floatBitsToInt((intBitsToFloat(R126i.z) * intBitsToFloat(R126i.z) + intBitsToFloat(PV1iw)));
R18i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R127i.y)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R126i.w)) + intBitsToFloat(backupReg0i));
// 17
R123i.x = floatBitsToInt((intBitsToFloat(R3i.x) * intBitsToFloat(R3i.x) + intBitsToFloat(R123i.x)));
R14i.z = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
R14i.w = floatBitsToInt(intBitsToFloat(R127i.z) + 0.5);
// 18
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.x));
PS0i = floatBitsToInt(tempResultf);
// 19
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PS0i)));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS0i)));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(PS0i)));
R5i.x = uf_remappedVS[10].x;
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R9i.y),intBitsToFloat(R9i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[44].x),intBitsToFloat(uf_remappedVS[44].y),intBitsToFloat(uf_remappedVS[44].z),0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(intBitsToFloat(uf_remappedVS[44].y) + 1.0);
// 1
R124i.x = floatBitsToInt(intBitsToFloat(PS0i) * 1.5);
R124i.x = clampFI32(R124i.x);
R0i.y = uf_remappedVS[45].x;
R126i.z = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
PV1iw = floatBitsToInt(min(intBitsToFloat(R6i.y), intBitsToFloat(uf_remappedVS[46].z)));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),intBitsToFloat(uf_remappedVS[47].x)) + -(intBitsToFloat(uf_remappedVS[47].y)));
R123i.x = clampFI32(R123i.x);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),intBitsToFloat(uf_remappedVS[48].x)) + -(intBitsToFloat(uf_remappedVS[48].y)));
R123i.y = clampFI32(R123i.y);
PV0iz = floatBitsToInt(-(intBitsToFloat(R7i.x)) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R122i.x = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
// 3
R126i.x = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[46].y),intBitsToFloat(PV0iz)) + intBitsToFloat(uf_remappedVS[46].x));
R6i.y = clampFI32(R6i.y);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R122i.x)) + intBitsToFloat(0xbe593484));
PV1iw = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0iw)));
// 4
backupReg0i = R126i.z;
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3f22f983));
R127i.y = floatBitsToInt(intBitsToFloat(R124i.x) * 15.0);
R126i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[44].y) * 1.0 + intBitsToFloat(R5i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R123i.z)) + intBitsToFloat(0x3fc90da4));
tempResultf = max(0.0, intBitsToFloat(PV1iw));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 5
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),-(intBitsToFloat(R123i.w))) + 1.0);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[47].w), intBitsToFloat(PS0i)));
tempResultf = max(0.0, intBitsToFloat(R126i.x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 6
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[49].x), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[49].y), intBitsToFloat(PS1i)));
R2i.w = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 7
R0i.x = floatBitsToInt(intBitsToFloat(R5i.x) * 1.0 + 0.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 8
R7i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
PS0i = floatBitsToInt(exp2(intBitsToFloat(R126i.x)));
// 9
R9i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[49].z)),intBitsToFloat(PS0i)) + intBitsToFloat(uf_remappedVS[49].z));
R9i.y = clampFI32(R9i.y);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS1i));
// 11
PV1iz = floatBitsToInt(max(intBitsToFloat(PV0ix), intBitsToFloat(0x3e4ccccd)));
// 12
R5i.w = floatBitsToInt(min(intBitsToFloat(PV1iz), 1.0));
}
if( activeMaskStackC[3] == true ) {
R7i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y))).xyz);
}
if( activeMaskStackC[3] == true ) {
// 0
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(R5i.w)));
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(uf_remappedVS[50].w)));
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R5i.w)));
R16i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(uf_remappedVS[51].z)));
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(R5i.w)));
// 1
R16i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.w)),intBitsToFloat(uf_remappedVS[52].w)) + intBitsToFloat(uf_remappedVS[52].w));
PV1iy = floatBitsToInt(-(intBitsToFloat(R16i.w)) + intBitsToFloat(R9i.y));
PV1iy = clampFI32(PV1iy);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R21i.y), intBitsToFloat(uf_remappedVS[53].x)));
R2i.w = 0;
// 2
R123i.x = floatBitsToInt(intBitsToFloat(PV1iz) * 0.25 + 0.5);
R123i.x = clampFI32(R123i.x);
R16i.z = PV1iy;
R15i.w = PV1iy;
// 3
PV1iw = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
// 4
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + 8.5);
// 5
R2i.x = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3daaaaab));
}
if( activeMaskStackC[3] == true ) {
R17i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.w))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
R22i.x = R13i.x;
R22i.y = R13i.y;
R22i.z = R13i.z;
R22i.w = R13i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R22i.x), intBitsToFloat(R22i.y), intBitsToFloat(R22i.z), intBitsToFloat(R22i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R21i.x), intBitsToFloat(R21i.y), intBitsToFloat(R21i.z), intBitsToFloat(R21i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.z));
}
