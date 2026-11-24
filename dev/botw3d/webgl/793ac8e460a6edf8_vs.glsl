#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 793ac8e460a6edf8
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[34];
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

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem7;
out vec4 passParameterSem11;
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
ivec4 R20i = ivec4(0);
ivec4 R21i = ivec4(0);
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
attrDecoder = attrDataSem7;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyz = attrDataSem6.xyz;
attrDecoder.xyz = uvec3((attrDecoder.xyz>>24)|((attrDecoder.xyz>>8)&0xFF00u)|((attrDecoder.xyz<<8)&0xFF0000u)|((attrDecoder.xyz<<24)));
attrDecoder.w = uint(0);
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), 0x3f800000);
attrDecoder = attrDataSem12;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R12i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem11;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R11i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem4;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem5;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem9;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R10i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem8;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R9i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem3;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
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
R17i.y = floatBitsToInt(-(intBitsToFloat(R6i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R4i.w = 0;
R6i.w = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R17i.y));
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
R19i.x = 0;
// 1
R7i.w = R6i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R7i.w = R4i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R7i.w == 0);
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
R11i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R17i.y) >= intBitsToFloat(R11i.z));
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
R19i.x = 0;
// 1
R4i.w = R6i.w;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R4i.w == 0);
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
R0i.w = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R13i.y = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 5
R0i.y = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 6
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
R20i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R127i.y)));
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R127i.y)));
// 2
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R20i.x = 0;
// 1
R14i.x = R20i.x;
// 2
R15i.x = R20i.x;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (intBitsToFloat(R13i.y) > 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R13i.y));
// 1
R20i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R127i.x)));
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
R20i.y = 0;
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
R20i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R127i.x)));
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
R20i.z = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R125i.x = floatBitsToInt(max(intBitsToFloat(R9i.x), 0.0));
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[2].x))?1.0:0.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(uf_remappedVS[3].y)));
PV0iw = floatBitsToInt((intBitsToFloat(uf_remappedVS[2].x) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[2].x));
// 1
R127i.x = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(intBitsToFloat(R17i.y) * intBitsToFloat(PS0i));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].w)) + intBitsToFloat(uf_remappedVS[5].w));
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].z)) + intBitsToFloat(uf_remappedVS[5].z));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R11i.z));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].x)) + intBitsToFloat(uf_remappedVS[5].x));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].y)) + intBitsToFloat(uf_remappedVS[5].y));
R16i.x = floatBitsToInt(intBitsToFloat(R17i.y) * intBitsToFloat(PS1i));
// 3
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.x), intBitsToFloat(PV0iy)));
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].z)) + intBitsToFloat(uf_remappedVS[6].z));
PV1iz = floatBitsToInt(fract(intBitsToFloat(PV0ix)));
R125i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].w)) + intBitsToFloat(uf_remappedVS[6].w));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.z));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV1iz)));
R125i.y = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS1i));
R127i.z = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS1i));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].x)) + intBitsToFloat(uf_remappedVS[6].x));
// 5
backupReg0i = R125i.w;
R13i.x = floatBitsToInt(min(intBitsToFloat(R125i.x), 0.0));
PV1iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].y)) + intBitsToFloat(uf_remappedVS[6].y));
R125i.w = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 6
backupReg0i = R127i.y;
R125i.x = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(PS1i));
R127i.y = floatBitsToInt(intBitsToFloat(R125i.w) + -(intBitsToFloat(uf_remappedVS[4].w)));
R126i.z = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(PS1i));
R124i.w = floatBitsToInt(intBitsToFloat(R125i.w) + -(intBitsToFloat(uf_remappedVS[5].w)));
R0i.w = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(PS1i));
// 7
backupReg0i = R127i.w;
R0i.x = floatBitsToInt(intBitsToFloat(R125i.w) + -(intBitsToFloat(uf_remappedVS[6].w)));
PV1iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].w)) + intBitsToFloat(uf_remappedVS[7].w));
R125i.z = ((intBitsToFloat(R124i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R125i.y)));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(backupReg0i)));
// 8
backupReg0i = R127i.y;
backupReg1i = R127i.z;
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].x)) + intBitsToFloat(uf_remappedVS[7].x));
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].y)) + intBitsToFloat(uf_remappedVS[7].y));
R127i.z = ((intBitsToFloat(backupReg0i) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(backupReg1i)));
R13i.w = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 9
backupReg0i = R126i.z;
R124i.x = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
PV1iy = floatBitsToInt(intBitsToFloat(R125i.w) + -(intBitsToFloat(uf_remappedVS[7].w)));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].z)) + intBitsToFloat(uf_remappedVS[7].z));
R125i.w = ((intBitsToFloat(R0i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(backupReg0i)));
// 10
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].z) + intBitsToFloat(R126i.w));
R126i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].x) + intBitsToFloat(R127i.w));
R124i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].y) + intBitsToFloat(backupReg0i));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R125i.x)));
R13i.z = ((intBitsToFloat(PV1iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 11
backupReg0i = R127i.y;
backupReg1i = R126i.z;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R0i.w)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(R13i.w));
R126i.z = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(R13i.w));
R124i.w = floatBitsToInt(intBitsToFloat(backupReg1i) * intBitsToFloat(R13i.w));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R124i.x)));
// 12
backupReg0i = R125i.y;
PV0ix = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
R125i.y = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].y) + intBitsToFloat(R127i.w));
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].x) + intBitsToFloat(backupReg0i));
R0i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].z) + intBitsToFloat(PV1ix));
// 13
backupReg0i = R125i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R127i.y)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R126i.z)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R124i.w)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0ix)));
R126i.z = floatBitsToInt(-(intBitsToFloat(R13i.z)) + 1.0);
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R124i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].x), intBitsToFloat(R125i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R124i.y)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R124i.y)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), intBitsToFloat(R125i.y)));
// 15
backupReg0i = R125i.y;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R126i.z)));
R125i.y = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0iy));
R126i.z = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), intBitsToFloat(backupReg0i)));
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].x) + intBitsToFloat(R127i.x));
// 16
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(PV1iw));
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].z) + intBitsToFloat(R125i.z));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R126i.w)));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].y) + intBitsToFloat(backupReg0i));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R126i.w)));
// 17
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R126i.w)));
PV1iy = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(R126i.z));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R124i.x)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(R125i.y));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R124i.x)));
// 18
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R124i.x)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PV1iw));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R126i.x));
R126i.w = floatBitsToInt(intBitsToFloat(PS1i) + intBitsToFloat(PV1iy));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].x), intBitsToFloat(R13i.z)));
// 19
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].z), intBitsToFloat(R13i.z)));
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].y), intBitsToFloat(R13i.z)));
R0i.x = floatBitsToInt(intBitsToFloat(R10i.x) + intBitsToFloat(R13i.x));
// 20
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R126i.w));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1iz)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PV1iy));
R13i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].x)) + 1.0);
// 21
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(PV0iw)));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(PV0ix)));
R4i.w = ((intBitsToFloat(uf_remappedVS[8].x) == 1.0)?-1:0);
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[9].y)));
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.z), intBitsToFloat(uf_remappedVS[9].z)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.x), intBitsToFloat(uf_remappedVS[9].w)));
// 1
R5i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(R17i.y));
// 2
predResult = (R4i.w != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(R5i.w)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].w), intBitsToFloat(PV0ix)));
// 2
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].x), intBitsToFloat(PV1iw)));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].y), intBitsToFloat(PV1iw)));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].z), intBitsToFloat(PV1iw)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
tempResultf = max(0.0, abs(intBitsToFloat(uf_remappedVS[8].x)));
tempResultf = log2(tempResultf);
PS0i = floatBitsToInt(tempResultf);
// 1
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f317218));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[8].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PS1i)));
R127i.y = ((intBitsToFloat(uf_remappedVS[8].x) == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R13i.y));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R5i.w) + -(intBitsToFloat(PV1iz)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].w), intBitsToFloat(PV1ix)));
// 9
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].x), intBitsToFloat(PV0iw)));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].y), intBitsToFloat(PV0iw)));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].z), intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = uf_remappedVS[11].x & 0x20000;
PV0iy = uf_remappedVS[11].x & 0x10000;
PV0iz = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(R9i.y));
R127i.w = uf_remappedVS[11].x & 0x40000;
PS0i = floatBitsToInt(intBitsToFloat(R9i.y) + intBitsToFloat(R9i.z));
// 1
R126i.x = floatBitsToInt(intBitsToFloat(PV0iz) * 0.5);
R127i.y = R9i.z;
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
PV1iz = R9i.y;
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 2.0);
R126i.w = floatBitsToInt(intBitsToFloat(PS0i) * 0.5);
PS1i = floatBitsToInt(float(PV0iy));
// 2
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(R9i.z));
R126i.y = floatBitsToInt(floor(intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(backupReg0i));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R125i.w = floatBitsToInt(floor(intBitsToFloat(R127i.y)));
PS1i = floatBitsToInt(float(R127i.w));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R124i.w = R9i.x;
R124i.w = floatBitsToInt(intBitsToFloat(R124i.w) * 2.0);
R125i.x = int(intBitsToFloat(PV1ix));
// 5
PV1ix = 0 - R125i.x;
R127i.y = floatBitsToInt(intBitsToFloat(R126i.x) + -(0.5));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
R125i.z = floatBitsToInt(intBitsToFloat(R127i.x) * 0.5);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iz)));
R127i.w = int(intBitsToFloat(PV0ix));
// 6
R125i.x = max(R125i.x, PV1ix);
R125i.y = floatBitsToInt(intBitsToFloat(R126i.w) + -(0.5));
R125i.y = floatBitsToInt(intBitsToFloat(R125i.y) * 2.0);
PV0iz = 0 - R127i.w;
R126i.w = floatBitsToInt((intBitsToFloat(R126i.y) > 0.0)?1.0:0.0);
R127i.z = int(intBitsToFloat(PV1iw));
// 7
backupReg0i = R126i.y;
PV1ix = 0 - R127i.z;
R126i.y = max(R127i.w, PV0iz);
R126i.z = floatBitsToInt((intBitsToFloat(R125i.w) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(backupReg0i))?1.0:0.0);
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[12].w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 8
backupReg0i = R126i.w;
R127i.x = max(R127i.z, PV1ix);
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.y), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(R125i.w))?1.0:0.0);
R126i.w = floatBitsToInt(floor(intBitsToFloat(R124i.w)));
R127i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(PV1iw)));
// 9
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(uf_remappedVS[13].x)));
R127i.y = floatBitsToInt(intBitsToFloat(R126i.z) + -(intBitsToFloat(PV0iz)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(uf_remappedVS[13].y)));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.z) + -(0.5));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) * 2.0);
PS1i = floatBitsToInt(float(backupReg0i));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 10
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[12].w)) + 1.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(R126i.w))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(R126i.w) > 0.0)?1.0:0.0);
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(R127i.z)));
PS0i = floatBitsToInt(float(R126i.y));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 11
backupReg0i = R125i.x;
backupReg1i = R127i.y;
R125i.x = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iy)));
R127i.y = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(uf_remappedVS[12].x));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(backupReg1i)));
R124i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[12].y) + intBitsToFloat(R126i.z));
PS1i = floatBitsToInt(exp2(intBitsToFloat(R124i.y)));
// 12
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R9i.x) + -(0.5));
R126i.y = floatBitsToInt(intBitsToFloat(R9i.y) + -(0.5));
R126i.z = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(uf_remappedVS[13].z)));
PS0i = floatBitsToInt(float(backupReg0i));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 13
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R126i.w)));
R124i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(R125i.x)));
R125i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[12].z) + intBitsToFloat(PV0iw));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R126i.w)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R127i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R127i.z)));
PV0iz = ((intBitsToFloat(uf_remappedVS[12].w) == 1.0)?-1:0);
PV0iw = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS1i));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV1ix));
// 15
R126i.x = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(PV0iy));
R125i.y = ((PV0iz == 0)?(PV0iw):(R17i.y));
R127i.z = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV0ix));
R126i.w = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(R126i.w));
PS1i = floatBitsToInt(intBitsToFloat(R9i.z) + -(0.5));
// 16
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R124i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[14].x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R124i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(uf_remappedVS[14].y)));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(uf_remappedVS[14].z)));
// 17
PV1ix = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(PV0iz));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R125i.y)));
// 18
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R125i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R125i.y)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R127i.x));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[8].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 19
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PS0i)));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e22f983) + 0.5);
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(R13i.y));
// 20
PV0ix = uf_remappedVS[15].y;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
R123i.y = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iz)));
// 21
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R123i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV1iw = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R0i.y = floatBitsToInt(intBitsToFloat(R8i.y) + intBitsToFloat(PV0ix));
// 22
R4i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R4i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R4i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(R126i.w));
R0i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R0i.z)));
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R4i.y) * intBitsToFloat(0x3e22f983));
R123i.y = ((R4i.w == 0)?(R4i.z):(R5i.w));
R127i.z = floatBitsToInt(intBitsToFloat(R0i.w) * intBitsToFloat(0x3e22f983));
PV0iw = uf_remappedVS[15].x;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
R125i.w = floatBitsToInt(sin((intBitsToFloat(R4i.x))/0.1591549367));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R123i.y)));
R124i.y = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R123i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R123i.y)));
R125i.z = floatBitsToInt(cos((intBitsToFloat(R4i.x))/0.1591549367));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R10i.y) + intBitsToFloat(PV1iw));
PV0iy = floatBitsToInt(intBitsToFloat(R10i.x) + intBitsToFloat(PV1ix));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y), intBitsToFloat(R0i.y)));
R126i.w = floatBitsToInt(intBitsToFloat(R10i.z) + intBitsToFloat(PV1iz));
R125i.y = floatBitsToInt(sin((intBitsToFloat(R127i.z))/0.1591549367));
// 3
backupReg0i = R125i.y;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(backupReg0i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(backupReg0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(PV0iy)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(PV0ix)));
R124i.x = floatBitsToInt(cos((intBitsToFloat(R127i.z))/0.1591549367));
// 4
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(R126i.w)));
R10i.y = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV1iz));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R124i.x)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R124i.x)));
R124i.w = floatBitsToInt(sin((intBitsToFloat(R127i.x))/0.1591549367));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R125i.x)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R127i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R127i.y)));
R10i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R126i.w)));
R126i.z = floatBitsToInt(cos((intBitsToFloat(R127i.x))/0.1591549367));
// 6
R10i.x = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1iz));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R126i.z)));
R10i.z = floatBitsToInt(-(intBitsToFloat(R124i.w)));
R6i.w = floatBitsToInt(-(intBitsToFloat(R126i.w)) + intBitsToFloat(PV1ix));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R126i.z)));
// 7
backupReg0i = R127i.w;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R13i.y)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(R13i.y)));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R126i.z)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(R13i.y)));
R0i.y = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(backupReg0i));
// 8
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R124i.y)));
R5i.y = floatBitsToInt(-(intBitsToFloat(R125i.x)) + intBitsToFloat(R10i.w));
R127i.z = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(backupReg0i));
R10i.w = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(R126i.y));
R125i.w = 0x3f800000;
// 9
backupReg0i = R13i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R10i.z)) + intBitsToFloat(R127i.x));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R126i.z)));
R125i.z = floatBitsToInt(intBitsToFloat(backupReg0i) * 0.0 + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R0i.w)) + intBitsToFloat(R125i.y));
R5i.w = 0x3f800000;
// 10
backupReg0i = R124i.z;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R13i.y)) + intBitsToFloat(R123i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R10i.w)) + intBitsToFloat(R123i.w));
R124i.z = floatBitsToInt((intBitsToFloat(uf_remappedVS[16].y) > 0.0)?1.0:0.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R6i.z)) + intBitsToFloat(R127i.w));
R125i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[16].y));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R10i.y),intBitsToFloat(R0i.y),intBitsToFloat(R127i.z),intBitsToFloat(R125i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R1i.w = tempi.x;
R127i.x = int(intBitsToFloat(uf_remappedVS[17].z));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R10i.y),intBitsToFloat(R0i.y),intBitsToFloat(R127i.z),intBitsToFloat(R125i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R2i.w = tempi.x;
R126i.z = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[16].y))?1.0:0.0);
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R10i.y),intBitsToFloat(R0i.y),intBitsToFloat(R127i.z),intBitsToFloat(R125i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R3i.w = tempi.x;
R127i.z = floatBitsToInt(float(R127i.x));
// 14
backupReg0i = R126i.z;
PV0ix = floatBitsToInt(intBitsToFloat(R17i.y) * intBitsToFloat(R125i.y));
R126i.y = floatBitsToInt(-(abs(intBitsToFloat(R127i.z))) + 0.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R5i.y)) + intBitsToFloat(R127i.w));
R127i.w = floatBitsToInt(intBitsToFloat(R124i.z) + -(intBitsToFloat(backupReg0i)));
R125i.y = floatBitsToInt((0.0 >= abs(intBitsToFloat(R127i.z)))?1.0:0.0);
// 15
R3i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R125i.z))));
PV1iy = R3i.x;
PV1iz = R3i.x;
PV1iw = R3i.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(uf_remappedVS[2].z)) + intBitsToFloat(PV0ix));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),intBitsToFloat(R15i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R125i.z))));
PV0ix = tempi.x;
R10i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.w = floatBitsToInt(fract(intBitsToFloat(R122i.x)));
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(R14i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R125i.z))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R3i.z = tempi.x;
PV1iw = tempi.x;
R127i.y = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
// 18
R124i.x = ((intBitsToFloat(R125i.y) == 0.0)?(0):(R126i.y));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R125i.w)));
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[18].w)) + intBitsToFloat(uf_remappedVS[19].w));
R125i.w = ((intBitsToFloat(R9i.x) > 0.5)?-1:0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 19
backupReg0i = R127i.y;
PV1ix = floatBitsToInt(abs(intBitsToFloat(R127i.z)) + intBitsToFloat(R124i.x));
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[18].x)) + intBitsToFloat(uf_remappedVS[19].x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.x),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV0iy));
R127i.w = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
R126i.z = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 20
R6i.x = floatBitsToInt(intBitsToFloat(R123i.z) + -(intBitsToFloat(uf_remappedVS[18].w)));
R126i.y = floatBitsToInt(-(intBitsToFloat(R11i.x)) + 1.0);
PV0iz = floatBitsToInt(intBitsToFloat(R123i.z) + -(intBitsToFloat(uf_remappedVS[19].w)));
R123i.w = ((-(intBitsToFloat(R124i.x)) > 0.0)?(PV1ix):(R124i.x));
R124i.x = ((intBitsToFloat(R9i.y) > 0.5)?-1:0);
// 21
R5i.x = ((intBitsToFloat(R6i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.y = ((intBitsToFloat(R127i.z) == 0.0)?(0):(R123i.w));
R127i.z = uf_remappedVS[11].x & 0x80000;
R1i.w = ((intBitsToFloat(PV0iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.w = uf_remappedVS[11].x & 0x100000;
// 22
R1i.x = ((R125i.w == 0)?(R11i.x):(R126i.y));
R0i.y = floatBitsToInt(trunc(intBitsToFloat(R127i.w)));
PV0iz = floatBitsToInt(-(intBitsToFloat(R11i.y)) + 1.0);
R2i.w = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(R126i.z));
R2i.y = floatBitsToInt(-(intBitsToFloat(R1i.w)) + 1.0);
// 23
R2i.x = (R127i.z == 0x80000)?-1:0;
R3i.y = (R126i.w == 0x100000)?-1:0;
R2i.z = floatBitsToInt(-(intBitsToFloat(R5i.x)) + 1.0);
R3i.w = ((R124i.x == 0)?(R11i.y):(PV0iz));
R4i.x = int(intBitsToFloat(R125i.y));
}
if( activeMaskStackC[3] == true ) {
// 0
R18i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R10i.y),intBitsToFloat(R3i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w))));
PV0iy = R18i.x;
PV0iz = R18i.x;
PV0iw = R18i.x;
R126i.x = int(intBitsToFloat(R0i.y));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R10i.y),intBitsToFloat(R3i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w))));
PV1ix = tempi.x;
R18i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.y = ((R3i.y == 0)?(R11i.y):(R3i.w));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R10i.y),intBitsToFloat(R3i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedVS[22].x),intBitsToFloat(uf_remappedVS[22].y),intBitsToFloat(uf_remappedVS[22].z),intBitsToFloat(uf_remappedVS[22].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R18i.z = tempi.x;
PV0iw = tempi.x;
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R6i.y)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R10i.y),intBitsToFloat(R3i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedVS[23].x),intBitsToFloat(uf_remappedVS[23].y),intBitsToFloat(uf_remappedVS[23].z),intBitsToFloat(uf_remappedVS[23].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R18i.w = tempi.x;
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R6i.w)));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(uf_remappedVS[24].y)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[25].w) + intBitsToFloat(uf_remappedVS[24].y));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(uf_remappedVS[24].x)));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[25].z) + intBitsToFloat(uf_remappedVS[24].x));
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R10i.x)));
// 5
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(R10i.z)) + intBitsToFloat(R127i.z));
R127i.y = floatBitsToInt(-(intBitsToFloat(PV0iz)) + intBitsToFloat(PV0iw));
R127i.z = ((R2i.x == 0)?(R11i.x):(R1i.x));
R126i.w = floatBitsToInt(-(intBitsToFloat(PV0ix)) + intBitsToFloat(PV0iy));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[17].z));
// 6
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R2i.y)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(R6i.z)) + intBitsToFloat(R124i.x));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(R0i.w)) + intBitsToFloat(R125i.y));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[17].x), intBitsToFloat(PS1i)));
R125i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[17].w));
// 7
R125i.x = R18i.w;
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) / 2.0);
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[26].x) + intBitsToFloat(uf_remappedVS[26].z));
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[26].y) + intBitsToFloat(uf_remappedVS[26].w));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R127i.w)) + -(0.5));
R124i.y = floatBitsToInt(float(R4i.x));
// 8
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(uf_remappedVS[26].z)) + intBitsToFloat(PV1iy));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[17].y), intBitsToFloat(R125i.y)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(R10i.w)) + intBitsToFloat(R126i.z));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),intBitsToFloat(uf_remappedVS[26].w)) + intBitsToFloat(PV1iz));
R125i.w = floatBitsToInt(float(backupReg0i));
// 9
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R17i.y)),intBitsToFloat(uf_remappedVS[25].x)) + -(intBitsToFloat(R127i.y)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.y),intBitsToFloat(uf_remappedVS[25].y)) + intBitsToFloat(R126i.w));
R9i.z = uf_remappedVS[27].x;
R10i.w = uf_remappedVS[27].y;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R125i.y)) + -(0.5));
// 10
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)),intBitsToFloat(R125i.w)) + intBitsToFloat(R123i.y));
R9i.y = uf_remappedVS[27].z;
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R124i.y)) + intBitsToFloat(backupReg0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.y),intBitsToFloat(uf_remappedVS[24].z)) + intBitsToFloat(R126i.x));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.y),intBitsToFloat(uf_remappedVS[24].w)) + intBitsToFloat(R124i.w));
// 11
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(R13i.y)) + intBitsToFloat(R127i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R0i.w)) + intBitsToFloat(R123i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R122i.x),intBitsToFloat(R124i.x)) + -(intBitsToFloat(R123i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(R5i.y)) + intBitsToFloat(R2i.y));
// 12
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(intBitsToFloat(R18i.z) * 0.0 + intBitsToFloat(backupReg0i));
R16i.y = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
R21i.z = floatBitsToInt(intBitsToFloat(R18i.z) * 0.5 + intBitsToFloat(backupReg0i));
R21i.w = floatBitsToInt(intBitsToFloat(R18i.z) * 0.0 + intBitsToFloat(R18i.w));
R16i.x = floatBitsToInt(intBitsToFloat(R123i.z) + 0.5);
// 13
R20i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.z),intBitsToFloat(R127i.z),0.0)));
PV1iy = R20i.x;
PV1iz = R20i.x;
PV1iw = R20i.x;
R21i.y = floatBitsToInt(intBitsToFloat(R18i.y) * -(0.5) + intBitsToFloat(R125i.x));
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),intBitsToFloat(R15i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.z),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
R20i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R16i.z = 0;
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(R14i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.z),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R20i.z = tempi.x;
PV1iw = tempi.x;
// 16
R21i.x = floatBitsToInt(intBitsToFloat(R18i.x) * 0.5 + intBitsToFloat(R125i.x));
}
if( activeMaskStackC[3] == true ) {
// 0
R125i.x = uf_remappedVS[28].x;
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R2i.w)) + intBitsToFloat(uf_remappedVS[18].x));
R127i.z = uf_remappedVS[28].y;
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].x), intBitsToFloat(R2i.z)));
// 1
R127i.x = uf_remappedVS[28].z;
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(R5i.x)) + intBitsToFloat(PV0iw));
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(uf_remappedVS[29].x)));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[19].x),intBitsToFloat(R1i.w)) + intBitsToFloat(R123i.y));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(uf_remappedVS[29].y)));
// 3
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(uf_remappedVS[29].z)));
PV1iw = uf_remappedVS[30].x;
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(uf_remappedVS[29].w)));
// 4
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(uf_remappedVS[31].x)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(uf_remappedVS[31].y)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[31].z)));
R13i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(uf_remappedVS[31].w)));
}
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[32].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[32].x)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[32].x)));
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].x), intBitsToFloat(R1i.x)));
// 1
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].x), intBitsToFloat(R1i.y)));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].x), intBitsToFloat(R1i.z)));
R19i.y = uf_remappedVS[33].x;
}
if( activeMaskStackC[3] == true ) {
// 0
R19i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].x) * 1.0 + 0.0);
// 1
R14i.x = R12i.x;
R14i.y = R12i.y;
R14i.z = R12i.z;
R14i.w = R12i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
// skipped export to semanticId 255
// export
passParameterSem7 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.z));
// export
passParameterSem8 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.z));
}
