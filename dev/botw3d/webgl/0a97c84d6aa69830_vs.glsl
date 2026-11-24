#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 0a97c84d6aa69830
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[45];
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
out vec4 passParameterSem2;
out vec4 passParameterSem3;
out vec4 passParameterSem8;
out vec4 passParameterSem11;
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
R11i.z = floatBitsToInt(-(intBitsToFloat(R11i.y)) + 1.0);
R7i.w = 0;
R8i.w = floatBitsToInt(1.0);
// 1
R4i.w = floatBitsToInt(-(intBitsToFloat(R6i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R6i.w = floatBitsToInt(-(intBitsToFloat(R11i.x)) + 1.0);
// 2
predResult = (0.0 > intBitsToFloat(R4i.w));
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
R18i.x = 0;
// 1
R11i.w = R8i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R11i.w = R7i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R11i.w == 0);
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
R16i.x = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R4i.w) >= intBitsToFloat(R16i.x));
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
R18i.x = 0;
// 1
R7i.w = R8i.w;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R7i.w == 0);
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
R0i.y = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.w = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 5
R12i.y = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 6
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
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R0i.y));
// 1
R20i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R127i.y)));
R21i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R127i.y)));
// 2
R19i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R20i.x = 0;
// 1
R19i.x = R20i.x;
// 2
R21i.x = R20i.x;
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
R20i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R127i.x)));
R21i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R127i.x)));
// 2
R19i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R19i.y = 0;
R21i.y = 0;
// 1
R20i.y = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (intBitsToFloat(R12i.y) > 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R12i.y));
// 1
R20i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R127i.x)));
R21i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R127i.x)));
// 2
R19i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R19i.z = 0;
R21i.z = 0;
// 1
R20i.z = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[2].x))?1.0:0.0);
PV0iy = floatBitsToInt((intBitsToFloat(uf_remappedVS[2].x) > 0.0)?1.0:0.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(uf_remappedVS[3].y)));
R16i.w = floatBitsToInt(max(intBitsToFloat(R9i.x), 0.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[2].x));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R4i.w) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(intBitsToFloat(R4i.w) + intBitsToFloat(uf_remappedVS[4].z));
R126i.z = floatBitsToInt(intBitsToFloat(R4i.w) + intBitsToFloat(uf_remappedVS[4].w));
R127i.w = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[5].z));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(PS1i));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(uf_remappedVS[4].y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(uf_remappedVS[4].x)));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[5].w));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS0i));
R126i.y = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(fract(intBitsToFloat(PV0iw)));
R126i.w = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R16i.x));
// 4
backupReg0i = R127i.y;
PV0ix = floatBitsToInt(intBitsToFloat(R4i.w) * intBitsToFloat(PS1i));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV1iz)));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(0x40c90fdb));
R125i.w = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV1ix));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].w)) + intBitsToFloat(uf_remappedVS[7].w));
// 5
R127i.x = uf_remappedVS[8].x & int(1);
PV1iy = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(0x40c90fdb));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R126i.w)));
R124i.w = uf_remappedVS[8].x & 0x2;
R0i.w = uf_remappedVS[8].x & 0x4;
// 6
R125i.x = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R127i.y));
R123i.y = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0x3e22f983) + 0.5);
R126i.z = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].x)) + intBitsToFloat(uf_remappedVS[7].x));
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].y)) + intBitsToFloat(uf_remappedVS[7].y));
// 7
backupReg0i = R127i.w;
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].z)) + intBitsToFloat(uf_remappedVS[7].z));
R12i.y = floatBitsToInt(intBitsToFloat(R125i.x) + -(intBitsToFloat(uf_remappedVS[7].w)));
R12i.z = floatBitsToInt(fract(intBitsToFloat(R126i.y)));
R127i.w = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 8
backupReg0i = R127i.z;
backupReg1i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].w)) + intBitsToFloat(uf_remappedVS[9].w));
R126i.y = floatBitsToInt(fract(intBitsToFloat(R126i.z)));
R13i.z = floatBitsToInt(fract(intBitsToFloat(R125i.w)));
R125i.w = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(backupReg0i));
R126i.w = floatBitsToInt(float(backupReg1i));
// 9
R124i.x = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(R127i.z));
R125i.y = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(R127i.z));
R0i.z = ((intBitsToFloat(R12i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R12i.w = floatBitsToInt(intBitsToFloat(R125i.x) + -(intBitsToFloat(uf_remappedVS[6].w)));
R127i.y = floatBitsToInt(float(R124i.w));
// 10
R0i.x = floatBitsToInt((0.0 > intBitsToFloat(R126i.w))?1.0:0.0);
R124i.y = floatBitsToInt((intBitsToFloat(R126i.w) > 0.0)?1.0:0.0);
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].y)) + intBitsToFloat(uf_remappedVS[9].y));
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].x)) + intBitsToFloat(uf_remappedVS[9].x));
R126i.x = floatBitsToInt(float(R0i.w));
// 11
backupReg0i = R127i.y;
backupReg1i = R127i.x;
R127i.x = floatBitsToInt((intBitsToFloat(backupReg0i) > 0.0)?1.0:0.0);
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].z)) + intBitsToFloat(uf_remappedVS[9].z));
R126i.z = floatBitsToInt((0.0 > intBitsToFloat(backupReg0i))?1.0:0.0);
R0i.w = floatBitsToInt(intBitsToFloat(R125i.x) + -(intBitsToFloat(uf_remappedVS[9].w)));
R124i.w = floatBitsToInt(1.0 / intBitsToFloat(backupReg1i));
// 12
backupReg0i = R126i.x;
backupReg1i = R126i.y;
R126i.x = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R126i.y = floatBitsToInt((0.0 > intBitsToFloat(backupReg0i))?1.0:0.0);
R125i.z = floatBitsToInt((intBitsToFloat(backupReg0i) > 0.0)?1.0:0.0);
R127i.w = floatBitsToInt(intBitsToFloat(R12i.z) + -(0.5));
R13i.w = floatBitsToInt(intBitsToFloat(backupReg1i) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 13
backupReg0i = R124i.x;
backupReg1i = R125i.y;
backupReg2i = R127i.z;
R124i.x = floatBitsToInt(intBitsToFloat(R13i.z) + -(0.5));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.w), intBitsToFloat(backupReg0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.w), intBitsToFloat(R125i.w)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.w), intBitsToFloat(backupReg1i)));
R0i.y = floatBitsToInt(intBitsToFloat(backupReg2i) * intBitsToFloat(R124i.w));
// 14
R125i.x = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(R124i.w));
R127i.y = ((intBitsToFloat(R12i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R124i.z = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(R124i.w));
R126i.w = floatBitsToInt(-(intBitsToFloat(R0i.z)) + 1.0);
R0i.x = floatBitsToInt(intBitsToFloat(R124i.y) + -(intBitsToFloat(R0i.x)));
// 15
backupReg0i = R126i.x;
backupReg1i = R127i.w;
R126i.x = floatBitsToInt(intBitsToFloat(R125i.z) + -(intBitsToFloat(R126i.y)));
R124i.y = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3e22f983));
R17i.z = ((intBitsToFloat(R0i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.x) + -(intBitsToFloat(R126i.z)));
R127i.x = ((intBitsToFloat(backupReg1i) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 16
backupReg0i = R124i.x;
backupReg1i = R127i.z;
backupReg2i = R125i.w;
R124i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].y) + intBitsToFloat(R125i.y));
R13i.y = floatBitsToInt(intBitsToFloat(R13i.w) * intBitsToFloat(0x3e22f983));
R127i.z = ((intBitsToFloat(backupReg0i) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].x) + intBitsToFloat(backupReg1i));
R126i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].z) + intBitsToFloat(backupReg2i));
// 17
backupReg0i = R124i.z;
backupReg1i = R126i.w;
PV1ix = floatBitsToInt(-(intBitsToFloat(R17i.z)) + 1.0);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(R125i.x)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(R0i.y)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(backupReg0i)));
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(backupReg1i)));
// 18
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PV1ix)));
R14i.z = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R13i.w = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
R12i.w = int(intBitsToFloat(R0i.x));
// 19
backupReg0i = R125i.y;
R0i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].x) + intBitsToFloat(R126i.w));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R125i.x)));
R15i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].z) + intBitsToFloat(backupReg0i));
R0i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].y) + intBitsToFloat(R124i.z));
R12i.y = int(intBitsToFloat(R127i.w));
// 20
backupReg0i = R12i.y;
R12i.x = 0 - R12i.w;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R125i.x)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R125i.x)));
R14i.w = 0 - backupReg0i;
R13i.x = int(intBitsToFloat(R126i.x));
// 21
R14i.x = 0 - R13i.x;
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].z), intBitsToFloat(R127i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].y), intBitsToFloat(R127i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].x), intBitsToFloat(R127i.x)));
PS1i = floatBitsToInt(cos((intBitsToFloat(R124i.y))/0.1591549367));
// 22
backupReg0i = R13i.y;
R15i.x = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(PV1iw));
R13i.y = floatBitsToInt(intBitsToFloat(PS1i) + 1.0);
R13i.y = floatBitsToInt(intBitsToFloat(R13i.y) / 2.0);
R16i.z = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV1iy));
R15i.w = floatBitsToInt(intBitsToFloat(R124i.z) + intBitsToFloat(PV1iz));
R0i.z = floatBitsToInt(cos((intBitsToFloat(backupReg0i))/0.1591549367));
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(intBitsToFloat(R0i.z) + 1.0);
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) / 2.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), intBitsToFloat(R13i.z)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].x), intBitsToFloat(R13i.w)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].x), intBitsToFloat(R12i.z)));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y)));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R0i.y)));
R125i.y = max(R12i.w, R12i.x);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.z), intBitsToFloat(R0i.y)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), intBitsToFloat(R14i.z)));
R127i.z = max(R12i.y, R14i.w);
// 2
backupReg0i = R127i.w;
R125i.x = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R15i.w));
R124i.y = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R16i.z));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].x), intBitsToFloat(R13i.y)));
R127i.w = max(R13i.x, R14i.x);
R125i.z = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
// 3
backupReg0i = R127i.x;
backupReg1i = R126i.y;
backupReg2i = R126i.w;
R127i.x = floatBitsToInt(-(intBitsToFloat(R124i.z)) + 1.0);
R126i.y = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(R15i.x));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), intBitsToFloat(R126i.x)));
R126i.w = floatBitsToInt(-(intBitsToFloat(backupReg1i)) + 1.0);
R126i.x = floatBitsToInt(-(intBitsToFloat(backupReg2i)) + 1.0);
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].y), intBitsToFloat(R17i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].x), intBitsToFloat(R17i.z)));
PV0iz = floatBitsToInt(min(intBitsToFloat(R16i.w), 0.0));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].z), intBitsToFloat(R17i.z)));
R124i.x = floatBitsToInt(float(R125i.y));
// 5
backupReg0i = R126i.y;
backupReg1i = R127i.z;
R0i.x = floatBitsToInt(intBitsToFloat(R10i.x) + intBitsToFloat(PV0iz));
R126i.y = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R125i.x));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(backupReg0i));
R125i.w = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R124i.y));
R125i.y = floatBitsToInt(float(backupReg1i));
// 6
backupReg0i = R127i.x;
backupReg1i = R127i.w;
R127i.x = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R124i.y = floatBitsToInt(max(intBitsToFloat(R125i.z), -(intBitsToFloat(R125i.z))));
R126i.z = floatBitsToInt(max(intBitsToFloat(backupReg0i), -(intBitsToFloat(backupReg0i))));
R127i.w = floatBitsToInt(-(intBitsToFloat(R124i.z)) + 1.0);
R125i.z = floatBitsToInt(float(backupReg1i));
// 7
backupReg0i = R126i.x;
backupReg1i = R127i.z;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(R126i.y)));
R126i.y = floatBitsToInt(max(intBitsToFloat(R126i.w), -(intBitsToFloat(R126i.w))));
R127i.z = floatBitsToInt(max(intBitsToFloat(backupReg0i), -(intBitsToFloat(backupReg0i))));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(backupReg1i)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(R125i.w)));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R124i.y),intBitsToFloat(R126i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R17i.z = floatBitsToInt(intBitsToFloat(PS1i) * 1.0);
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.w),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R126i.w)));
// 10
R0i.x = ((intBitsToFloat(uf_remappedVS[10].x) == 1.0)?-1:0);
R0i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[10].x)) + 1.0);
R16i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R126i.x)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.x), intBitsToFloat(uf_remappedVS[11].y)));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.w), intBitsToFloat(uf_remappedVS[11].z)));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.z), intBitsToFloat(uf_remappedVS[11].w)));
// 1
R10i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(R4i.w));
// 2
predResult = (R0i.x != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(R10i.z)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].w), intBitsToFloat(PV0ix)));
// 2
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].x), intBitsToFloat(PV1iw)));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].y), intBitsToFloat(PV1iw)));
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].z), intBitsToFloat(PV1iw)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
tempResultf = max(0.0, abs(intBitsToFloat(uf_remappedVS[10].x)));
tempResultf = log2(tempResultf);
PS0i = floatBitsToInt(tempResultf);
// 1
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f317218));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[10].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(PS1i)));
R127i.y = ((intBitsToFloat(uf_remappedVS[10].x) == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R0i.y));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R10i.z) + -(intBitsToFloat(PV1iz)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].w), intBitsToFloat(PV1ix)));
// 9
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].x), intBitsToFloat(PV0iw)));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].y), intBitsToFloat(PV0iw)));
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].z), intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R9i.y) + intBitsToFloat(R9i.z));
PV0iy = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(R9i.y));
R127i.z = uf_remappedVS[8].x & 0x20000;
PV0iw = uf_remappedVS[8].x & 0x10000;
R127i.x = R9i.y;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
// 1
R126i.x = floatBitsToInt(intBitsToFloat(PV0iy) * 0.5);
R127i.y = uf_remappedVS[8].x & 0x40000;
R125i.z = floatBitsToInt(intBitsToFloat(PV0ix) * 0.5);
R127i.w = R9i.z;
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
PS1i = floatBitsToInt(float(PV0iw));
// 2
backupReg0i = R127i.z;
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R127i.z = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(R9i.z));
R126i.w = floatBitsToInt(floor(intBitsToFloat(R127i.x)));
PS0i = floatBitsToInt(float(backupReg0i));
// 3
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
R124i.z = floatBitsToInt(floor(intBitsToFloat(R127i.w)));
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PS1i = floatBitsToInt(float(R127i.y));
// 4
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R126i.y = R9i.x;
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) * 2.0);
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R126i.z = int(intBitsToFloat(PV1iy));
// 5
PV1ix = 0 - R126i.z;
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0ix)));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 0.5);
R125i.w = floatBitsToInt(intBitsToFloat(R126i.x) + -(0.5));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) * 2.0);
R127i.y = int(intBitsToFloat(PV0iz));
// 6
PV0ix = 0 - R127i.y;
R125i.y = max(R126i.z, PV1ix);
R125i.z = floatBitsToInt(intBitsToFloat(R125i.z) + -(0.5));
R125i.z = floatBitsToInt(intBitsToFloat(R125i.z) * 2.0);
R127i.w = floatBitsToInt((intBitsToFloat(R126i.w) > 0.0)?1.0:0.0);
R126i.x = int(intBitsToFloat(PV1iy));
// 7
PV1ix = 0 - R126i.x;
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(R126i.w))?1.0:0.0);
R126i.z = floatBitsToInt((intBitsToFloat(R124i.z) > 0.0)?1.0:0.0);
R126i.w = max(R127i.y, PV0ix);
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[13].w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 8
backupReg0i = R127i.w;
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(R124i.z))?1.0:0.0);
R126i.y = floatBitsToInt(floor(intBitsToFloat(R126i.y)));
R124i.z = max(R126i.x, PV1ix);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(PS1i)));
R126i.x = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(PV1iy)));
// 9
backupReg0i = R125i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(uf_remappedVS[14].x)));
R125i.y = floatBitsToInt(intBitsToFloat(R127i.z) + -(0.5));
R125i.y = floatBitsToInt(intBitsToFloat(R125i.y) * 2.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(uf_remappedVS[14].y)));
R125i.w = floatBitsToInt(intBitsToFloat(R126i.z) + -(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(float(backupReg0i));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 10
backupReg0i = R126i.y;
PV0ix = floatBitsToInt((intBitsToFloat(backupReg0i) > 0.0)?1.0:0.0);
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[13].w)) + 1.0);
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(R126i.x)));
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(backupReg0i))?1.0:0.0);
PS0i = floatBitsToInt(float(R126i.w));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 11
backupReg0i = R127i.z;
backupReg1i = R127i.w;
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(R125i.w)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(uf_remappedVS[13].x));
R127i.z = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[13].y) + intBitsToFloat(backupReg0i));
PS1i = floatBitsToInt(exp2(intBitsToFloat(backupReg1i)));
// 12
backupReg0i = R124i.z;
R127i.x = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(uf_remappedVS[14].z)));
R124i.z = floatBitsToInt(intBitsToFloat(R9i.x) + -(0.5));
R126i.w = floatBitsToInt(intBitsToFloat(R9i.y) + -(0.5));
PS0i = floatBitsToInt(float(backupReg0i));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 13
backupReg0i = R127i.z;
R125i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[13].z) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R126i.z)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R126i.z)));
R125i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(backupReg0i)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.y));
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R126i.x)));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS1i));
PV0iz = ((intBitsToFloat(uf_remappedVS[13].w) == 1.0)?-1:0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R126i.x)));
R124i.w = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV1iy));
// 15
R127i.x = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV0ix));
R127i.y = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(R127i.z));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0iw));
R127i.w = ((PV0iz == 0)?(PV0iy):(R4i.w));
PS1i = floatBitsToInt(intBitsToFloat(R9i.z) + -(0.5));
// 16
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R125i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(uf_remappedVS[15].x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R125i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(uf_remappedVS[15].y)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(uf_remappedVS[15].z)));
// 17
PV1ix = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(PV0iz));
R126i.z = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R127i.w)));
// 18
PV0ix = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R124i.z));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R127i.w)));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[10].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 19
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(PS0i)));
R123i.y = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV0iz));
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R0i.y));
// 20
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R21i.x), intBitsToFloat(R12i.y)));
R123i.w = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
// 21
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iy = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R123i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R20i.x), intBitsToFloat(R12i.x)));
// 22
R4i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(R127i.y));
R4i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R4i.z = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R0i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R21i.y), intBitsToFloat(R12i.y)));
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R4i.y) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R20i.y), intBitsToFloat(R12i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R21i.z), intBitsToFloat(R12i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R20i.z), intBitsToFloat(R12i.x)));
R4i.y = floatBitsToInt(sin((intBitsToFloat(R4i.z))/0.1591549367));
// 1
R125i.x = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV0iy));
R127i.y = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0iw));
R126i.z = floatBitsToInt(intBitsToFloat(R0i.w) * intBitsToFloat(0x3e22f983));
R124i.w = ((R0i.x == 0)?(R4i.x):(R10i.z));
R126i.x = floatBitsToInt(cos((intBitsToFloat(R4i.z))/0.1591549367));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.x), intBitsToFloat(R14i.z)));
PV0iy = floatBitsToInt(intBitsToFloat(R12i.z) + intBitsToFloat(R13i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R124i.w)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.y), intBitsToFloat(R14i.z)));
R126i.w = floatBitsToInt(sin((intBitsToFloat(R127i.x))/0.1591549367));
// 3
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R126i.w)));
R126i.y = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iy));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.z), intBitsToFloat(R14i.z)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R126i.w)));
R125i.z = floatBitsToInt(cos((intBitsToFloat(R127i.x))/0.1591549367));
// 4
backupReg0i = R127i.y;
backupReg1i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R124i.w)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R124i.w)));
R124i.z = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(backupReg0i));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(backupReg1i));
R124i.y = floatBitsToInt(sin((intBitsToFloat(R126i.z))/0.1591549367));
// 5
backupReg0i = R126i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R125i.z)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R125i.z)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R124i.x)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R125i.w)));
R6i.x = floatBitsToInt(cos((intBitsToFloat(backupReg0i))/0.1591549367));
// 6
backupReg0i = R127i.z;
R125i.x = floatBitsToInt(intBitsToFloat(R124i.z) + intBitsToFloat(R125i.x));
PV0iy = uf_remappedVS[16].y;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
R127i.z = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R127i.y));
R127i.w = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(backupReg0i));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R5i.w)));
// 7
R4i.x = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(R124i.w));
R6i.y = floatBitsToInt(-(intBitsToFloat(R125i.y)) + intBitsToFloat(R126i.z));
PV1iz = floatBitsToInt(intBitsToFloat(R8i.y) + intBitsToFloat(PV0iy));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R6i.x)));
PS1i = uf_remappedVS[16].x;
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 8
backupReg0i = R127i.z;
backupReg1i = R125i.x;
R125i.x = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(PS1i));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(PV1iz)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(R127i.w)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(backupReg0i)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(backupReg1i)));
// 9
backupReg0i = R127i.x;
backupReg1i = R4i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R125i.y)));
R4i.y = floatBitsToInt(-(intBitsToFloat(R124i.y)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(backupReg0i)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R6i.x)));
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), intBitsToFloat(R6i.x)));
// 10
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R6i.z)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R6i.z)));
R127i.z = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(R127i.z));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R6i.z)));
R124i.y = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(R127i.w));
// 11
backupReg0i = R127i.x;
R127i.x = 0x3f800000;
R5i.y = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(R124i.z));
R124i.z = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(R126i.z));
R10i.w = floatBitsToInt(-(intBitsToFloat(R124i.x)) + intBitsToFloat(backupReg0i));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R4i.y)) + intBitsToFloat(PV0iw));
// 12
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R124i.w)) + intBitsToFloat(R125i.y));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(R125i.x)));
R6i.z = floatBitsToInt(intBitsToFloat(R6i.z) * 0.0 + 1.0);
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R6i.x)));
R125i.z = floatBitsToInt(intBitsToFloat(R9i.y) + 1.0);
// 13
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R5i.w)) + intBitsToFloat(R126i.z));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R5i.y)) + intBitsToFloat(R123i.x));
R126i.z = floatBitsToInt(intBitsToFloat(R9i.x) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R8i.x)) + intBitsToFloat(backupReg0i));
R127i.y = floatBitsToInt(intBitsToFloat(R9i.z) + 1.0);
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R127i.z),intBitsToFloat(R124i.y),intBitsToFloat(R124i.z),intBitsToFloat(R127i.x))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R0i.w = tempi.x;
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R10i.w)) + intBitsToFloat(R123i.w));
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R127i.z),intBitsToFloat(R124i.y),intBitsToFloat(R124i.z),intBitsToFloat(R127i.x))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R1i.w = tempi.x;
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(uf_remappedVS[17].x)));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R127i.z),intBitsToFloat(R124i.y),intBitsToFloat(R124i.z),intBitsToFloat(R127i.x))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R2i.w = tempi.x;
R127i.x = ((intBitsToFloat(R4i.w) == 0.0)?-1:0);
// 17
R2i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R1i.z),intBitsToFloat(R6i.z))));
PV1iy = R2i.x;
PV1iz = R2i.x;
PV1iw = R2i.x;
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.x), intBitsToFloat(uf_remappedVS[18].w)));
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R21i.x),intBitsToFloat(R21i.y),intBitsToFloat(R21i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R1i.z),intBitsToFloat(R6i.z))));
PV0ix = tempi.x;
R2i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.w = ((R127i.x == 0)?(R4i.w):(0x3f800000));
// 19
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(uf_remappedVS[17].x)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(uf_remappedVS[17].x)));
R124i.y = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 20
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R19i.x),intBitsToFloat(R19i.y),intBitsToFloat(R19i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R1i.z),intBitsToFloat(R6i.z))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R1i.z = tempi.x;
PV0iw = tempi.x;
R126i.y = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(PV1ix));
// 21
backupReg0i = R127i.w;
PV1ix = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(R125i.w));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R126i.w)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R6i.y)));
R127i.w = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R2i.z));
R3i.x = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(R124i.y));
R3i.x = clampFI32(R3i.x);
// 22
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R4i.x)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(R4i.y)) + intBitsToFloat(PV1iy));
PV0iz = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV1ix));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(R124i.w)) + intBitsToFloat(PV1iz));
// 23
backupReg0i = R8i.x;
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(R5i.w)) + intBitsToFloat(R123i.y));
R0i.y = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0iz));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(R5i.y)) + intBitsToFloat(R123i.w));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV0ix));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(R10i.w)) + intBitsToFloat(R5i.w));
// 1
R14i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R2i.z),intBitsToFloat(R127i.z),0.0)));
PV1iy = R14i.x;
PV1iz = R14i.x;
PV1iw = R14i.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R21i.z), intBitsToFloat(R127i.z)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R21i.x),intBitsToFloat(R21i.y),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R2i.z),1.0,0.0)));
PV0ix = tempi.x;
R14i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R19i.z), intBitsToFloat(R127i.z)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R19i.x),intBitsToFloat(R19i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R2i.z),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R14i.z = tempi.x;
PV1iw = tempi.x;
// 4
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
PV0iy = uf_remappedVS[20].w;
PV0iz = uf_remappedVS[21].w;
// 1
R127i.x = floatBitsToInt(-(intBitsToFloat(R2i.x)) + intBitsToFloat(PV0iz));
R127i.y = floatBitsToInt(-(intBitsToFloat(R2i.y)) + intBitsToFloat(PV0iy));
PV1iw = uf_remappedVS[22].w;
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[19].y));
// 2
PV0iz = floatBitsToInt(-(intBitsToFloat(R1i.z)) + intBitsToFloat(PV1iw));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 5
PV1iy = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(R127i.z));
PV1iy = clampFI32(PV1iy);
// 6
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PV1iy)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = ((intBitsToFloat(R9i.x) > 0.5)?-1:0);
R127i.y = ((intBitsToFloat(R9i.y) > 0.5)?-1:0);
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[21].w) + intBitsToFloat(uf_remappedVS[20].w));
R0i.w = 0x3f800000;
R127i.w = ((intBitsToFloat(R9i.z) > 0.5)?-1:0);
// 1
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(uf_remappedVS[23].z)));
PV1iy = ((intBitsToFloat(R9i.w) > 0.5)?-1:0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[23].w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].z), intBitsToFloat(uf_remappedVS[23].w)));
R0i.z = ((PV0ix == 0)?(R11i.x):(R6i.w));
// 2
backupReg0i = R0i.y;
backupReg1i = R127i.z;
R0i.x = ((R127i.y == 0)?(R11i.y):(R11i.z));
R0i.y = ((R127i.w == 0)?(R11i.x):(R6i.w));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(intBitsToFloat(backupReg1i) + intBitsToFloat(uf_remappedVS[22].w));
R1i.x = ((PV1iy == 0)?(R11i.y):(R11i.z));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), intBitsToFloat(uf_remappedVS[18].x)));
R127i.y = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3dd70a3d));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R127i.z));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].y), intBitsToFloat(uf_remappedVS[23].z)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R126i.z));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV0iw));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PV0iz)));
// 6
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
// 7
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
// 8
R123i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.w = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 9
R127i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R127i.y = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
// 10
PS0i = floatBitsToInt(sin((intBitsToFloat(R127i.y))/0.1591549367));
// 11
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R126i.x)));
PS1i = floatBitsToInt(cos((intBitsToFloat(R127i.y))/0.1591549367));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS1i)));
R1i.y = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(PV1iw));
PS0i = floatBitsToInt(sin((intBitsToFloat(R127i.x))/0.1591549367));
// 13
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R127i.z)));
R1i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0ix));
// 14
R2i.y = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(PV1ix));
}
if( activeMaskStackC[3] == true ) {
// 0
R12i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.y),intBitsToFloat(R2i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[24].x),intBitsToFloat(uf_remappedVS[24].y),intBitsToFloat(uf_remappedVS[24].z),intBitsToFloat(uf_remappedVS[24].w))));
PV0iy = R12i.x;
PV0iz = R12i.x;
PV0iw = R12i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.y),intBitsToFloat(R2i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[25].x),intBitsToFloat(uf_remappedVS[25].y),intBitsToFloat(uf_remappedVS[25].z),intBitsToFloat(uf_remappedVS[25].w))));
PV1ix = tempi.x;
R12i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.y),intBitsToFloat(R2i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[26].x),intBitsToFloat(uf_remappedVS[26].y),intBitsToFloat(uf_remappedVS[26].z),intBitsToFloat(uf_remappedVS[26].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R12i.z = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.y),intBitsToFloat(R2i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[27].x),intBitsToFloat(uf_remappedVS[27].y),intBitsToFloat(uf_remappedVS[27].z),intBitsToFloat(uf_remappedVS[27].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R12i.w = tempi.x;
// 4
PV0ix = uf_remappedVS[8].x & 0x80000;
R127i.z = PV1ix;
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) / 2.0);
PV0iw = uf_remappedVS[8].y & int(1);
// 5
PV1ix = uf_remappedVS[8].x & 0x100000;
PV1iy = (int(1) != PV0iw)?-1:0;
PV1iz = uf_remappedVS[8].x & 0x200000;
PV1iw = (PV0ix == 0x80000)?-1:0;
R127i.w = floatBitsToInt(intBitsToFloat(R12i.z) * 0.0 + intBitsToFloat(R127i.z));
// 6
PV0ix = (PV1ix == 0x100000)?-1:0;
R123i.y = ((PV1iy == 0)?(0):(int(1)));
PV0iz = uf_remappedVS[8].x & 0x400000;
PV0iw = (PV1iz == 0x200000)?-1:0;
R0i.w = ((PV1iw == 0)?(R11i.x):(R0i.z));
// 7
backupReg0i = R0i.y;
R127i.x = (R123i.y == int(1))?-1:0;
R0i.y = ((PV0ix == 0)?(R11i.y):(R0i.x));
PV1iz = (R123i.y == 0x2)?-1:0;
PV1iw = (PV0iz == 0x400000)?-1:0;
R0i.x = ((PV0iw == 0)?(R11i.x):(backupReg0i));
// 8
R11i.x = ((R127i.x == 0)?(R9i.x):(R9i.y));
R123i.y = ((PV1iz == 0)?(R9i.y):(R9i.x));
R2i.z = ((R127i.x == 0)?(R9i.y):(R9i.z));
R123i.w = ((PV1iz == 0)?(R9i.x):(R9i.z));
R3i.z = ((PV1iw == 0)?(R11i.y):(R1i.x));
// 9
R1i.x = ((R127i.x == 0)?(R123i.w):(R9i.y));
R15i.y = floatBitsToInt(intBitsToFloat(R12i.y) * -(0.5) + intBitsToFloat(R127i.w));
R0i.z = ((R127i.x == 0)?(R123i.y):(R9i.z));
R15i.w = floatBitsToInt(intBitsToFloat(R12i.z) * 0.0 + intBitsToFloat(R12i.w));
R15i.z = floatBitsToInt(intBitsToFloat(R12i.z) * 0.5 + intBitsToFloat(R127i.z));
// 10
R15i.x = floatBitsToInt(intBitsToFloat(R12i.x) * 0.5 + intBitsToFloat(R127i.w));
R17i.y = floatBitsToInt(intBitsToFloat(R2i.y) + -(intBitsToFloat(uf_remappedVS[28].y)));
R17i.z = floatBitsToInt(intBitsToFloat(R1i.z) + -(intBitsToFloat(uf_remappedVS[28].z)));
R17i.x = floatBitsToInt(intBitsToFloat(R1i.y) + -(intBitsToFloat(uf_remappedVS[28].x)));
}
if( activeMaskStackC[3] == true ) {
// 0
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(uf_remappedVS[29].y)));
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) * 2.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(uf_remappedVS[29].x)));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 2.0);
R127i.x = int(intBitsToFloat(uf_remappedVS[30].z));
// 1
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[31].y), intBitsToFloat(R0i.z)));
R124i.x = floatBitsToInt(intBitsToFloat(R124i.x) * 2.0);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[31].x), intBitsToFloat(R1i.x)));
R125i.z = floatBitsToInt(intBitsToFloat(R125i.z) * 2.0);
R126i.x = int(intBitsToFloat(uf_remappedVS[32].z));
// 2
R126i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[33].w) + intBitsToFloat(uf_remappedVS[29].y));
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[33].z) + intBitsToFloat(uf_remappedVS[29].x));
R124i.z = floatBitsToInt(float(R127i.x));
// 3
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[34].z) + intBitsToFloat(uf_remappedVS[31].x));
PV1iy = floatBitsToInt((0.0 >= abs(intBitsToFloat(R124i.z)))?1.0:0.0);
R0i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[34].w) + intBitsToFloat(uf_remappedVS[31].y));
PV1iw = floatBitsToInt(-(abs(intBitsToFloat(R124i.z))) + 0.0);
R1i.z = floatBitsToInt(float(R126i.x));
// 4
R126i.x = ((intBitsToFloat(PV1iy) == 0.0)?(0):(PV1iw));
PV0iy = floatBitsToInt((0.0 >= abs(intBitsToFloat(R1i.z)))?1.0:0.0);
R127i.z = floatBitsToInt(-(intBitsToFloat(R127i.z)) + intBitsToFloat(R127i.w));
PV0iw = floatBitsToInt(-(abs(intBitsToFloat(R1i.z))) + 0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R124i.z));
// 5
backupReg0i = R125i.x;
R125i.x = ((intBitsToFloat(PV0iy) == 0.0)?(0):(PV0iw));
R125i.y = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + intBitsToFloat(R126i.z));
PV1iz = floatBitsToInt(abs(intBitsToFloat(R124i.z)) + intBitsToFloat(R126i.x));
PV1iw = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R1i.z));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
PV0iy = floatBitsToInt(trunc(intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(abs(intBitsToFloat(R1i.z)) + intBitsToFloat(R125i.x));
R123i.w = ((-(intBitsToFloat(R126i.x)) > 0.0)?(PV1iz):(R126i.x));
R124i.y = floatBitsToInt(-(intBitsToFloat(R125i.z)) + intBitsToFloat(R127i.x));
// 7
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
R123i.y = ((intBitsToFloat(R124i.z) == 0.0)?(0):(R123i.w));
R124i.z = floatBitsToInt(-(intBitsToFloat(R124i.x)) + intBitsToFloat(R0i.z));
R123i.w = ((-(intBitsToFloat(backupReg0i)) > 0.0)?(PV0iz):(backupReg0i));
R127i.x = int(intBitsToFloat(PV0iy));
// 8
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[35].x) + intBitsToFloat(uf_remappedVS[35].z));
R127i.y = ((intBitsToFloat(R1i.z) == 0.0)?(0):(R123i.w));
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[35].y) + intBitsToFloat(uf_remappedVS[35].w));
R124i.x = int(intBitsToFloat(R123i.y));
// 9
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(uf_remappedVS[35].z)) + intBitsToFloat(PV0ix));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),intBitsToFloat(uf_remappedVS[35].w)) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[30].z));
// 10
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[30].x), intBitsToFloat(PS1i)));
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[30].w));
// 11
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R127i.w)) + -(0.5));
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[36].x) + intBitsToFloat(uf_remappedVS[36].z));
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[36].y) + intBitsToFloat(uf_remappedVS[36].w));
R9i.x = int(intBitsToFloat(R127i.y));
// 12
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].z),intBitsToFloat(R11i.x)) + intBitsToFloat(PV1iy));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[30].y), intBitsToFloat(R126i.y)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].w),intBitsToFloat(R2i.z)) + intBitsToFloat(PV1iz));
R2i.x = int(intBitsToFloat(R125i.x));
// 13
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.w)),intBitsToFloat(uf_remappedVS[33].x)) + -(intBitsToFloat(R127i.z)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[33].y)) + intBitsToFloat(R125i.y));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R126i.y)) + -(0.5));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[32].z));
// 14
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].x), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[32].w));
// 15
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].y), intBitsToFloat(PS0i)));
R124i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.w)),intBitsToFloat(uf_remappedVS[34].x)) + -(intBitsToFloat(R124i.y)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[34].y)) + intBitsToFloat(R124i.z));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R124i.w)) + -(0.5));
PS1i = floatBitsToInt(float(backupReg0i));
// 16
R0i.x = uf_remappedVS[37].y;
R0i.y = uf_remappedVS[37].x;
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PS1i)) + intBitsToFloat(R125i.x));
R9i.w = uf_remappedVS[37].z;
PS0i = floatBitsToInt(float(R127i.x));
// 17
backupReg0i = R3i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.y)),intBitsToFloat(PS0i)) + intBitsToFloat(R125i.y));
R1i.y = uf_remappedVS[38].x;
R3i.z = uf_remappedVS[38].y;
R1i.w = uf_remappedVS[38].z;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R124i.x)) + -(0.5));
// 18
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[31].z)) + intBitsToFloat(R11i.x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[31].w)) + intBitsToFloat(R125i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[29].z)) + intBitsToFloat(backupReg0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[29].w)) + intBitsToFloat(R126i.w));
PS0i = floatBitsToInt(float(R9i.x));
// 19
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R1i.x)) + intBitsToFloat(R124i.z));
R9i.y = uf_remappedVS[39].x;
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(PS0i)) + intBitsToFloat(R124i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R127i.z)) + -(intBitsToFloat(R127i.x)));
R2i.z = uf_remappedVS[40].x;
// 20
R13i.x = floatBitsToInt(intBitsToFloat(R123i.x) + 0.5);
R13i.y = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R0i.w)) + intBitsToFloat(R123i.z));
PS0i = floatBitsToInt(float(R2i.x));
// 21
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.x)),intBitsToFloat(PS0i)) + intBitsToFloat(R125i.z));
R13i.z = floatBitsToInt(intBitsToFloat(R123i.z) + 0.5);
// 22
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R125i.x)) + -(intBitsToFloat(R123i.x)));
// 23
R13i.w = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
}
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[41].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[41].y)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(uf_remappedVS[41].z)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(uf_remappedVS[41].w)));
// 1
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[42].x)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(uf_remappedVS[42].y)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(uf_remappedVS[42].z)));
R19i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(uf_remappedVS[42].w)));
// 2
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[43].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[43].x)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[43].x)));
R19i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[43].x), intBitsToFloat(R1i.x)));
// 3
R19i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[43].x), intBitsToFloat(R1i.y)));
R19i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[43].x), intBitsToFloat(R1i.z)));
}
if( activeMaskStackC[3] == true ) {
// 0
R18i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[11].x) * 1.0 + 0.0);
R18i.y = uf_remappedVS[44].x;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.w));
// export
passParameterSem2 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.z));
}
