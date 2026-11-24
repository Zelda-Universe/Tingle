#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader ac32d78681f21170
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[42];
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
out vec4 passParameterSem7;
out vec4 passParameterSem8;
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
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem11;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R10i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem10;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R9i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem3;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem4;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
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
attrDecoder = attrDataSem2;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R9i.z = floatBitsToInt(-(intBitsToFloat(R9i.y)) + 1.0);
R6i.w = 0;
R16i.w = floatBitsToInt(1.0);
// 1
R9i.w = floatBitsToInt(-(intBitsToFloat(R5i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R15i.w = floatBitsToInt(-(intBitsToFloat(R9i.x)) + 1.0);
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
R12i.x = 0;
R12i.y = 0;
R12i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R15i.x = 0;
// 1
R5i.w = R16i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R5i.w = R6i.w;
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
R16i.x = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R9i.w) >= intBitsToFloat(R16i.x));
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
R15i.x = 0;
// 1
R6i.w = R16i.w;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R6i.w == 0);
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
R11i.y = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
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
predResult = (intBitsToFloat(R11i.y) > 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R11i.y));
// 1
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R127i.y)));
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R127i.y)));
// 2
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R12i.x = 0;
// 1
R14i.x = R12i.x;
// 2
R13i.x = R12i.x;
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
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R127i.x)));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R127i.x)));
// 2
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R14i.y = 0;
R13i.y = 0;
// 1
R12i.y = 0;
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
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R127i.x)));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R127i.x)));
// 2
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R14i.z = 0;
R13i.z = 0;
// 1
R12i.z = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R125i.x = floatBitsToInt(max(intBitsToFloat(R7i.x), 0.0));
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[2].x))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(uf_remappedVS[2].x) > 0.0)?1.0:0.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(uf_remappedVS[3].y)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[2].x));
// 1
R127i.x = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(intBitsToFloat(R9i.w) * intBitsToFloat(PS0i));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].w)) + intBitsToFloat(uf_remappedVS[5].w));
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].z)) + intBitsToFloat(uf_remappedVS[5].z));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R16i.x));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R11i.z = floatBitsToInt(intBitsToFloat(R9i.w) * intBitsToFloat(PS1i));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].x)) + intBitsToFloat(uf_remappedVS[5].x));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].y)) + intBitsToFloat(uf_remappedVS[5].y));
// 3
backupReg0i = R127i.z;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), intBitsToFloat(PV0iy)));
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].w)) + intBitsToFloat(uf_remappedVS[6].w));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].z)) + intBitsToFloat(uf_remappedVS[6].z));
PV1iw = floatBitsToInt(fract(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 4
R124i.x = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV1iw)));
R127i.w = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS1i));
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].x)) + intBitsToFloat(uf_remappedVS[6].x));
// 5
backupReg0i = R127i.y;
R0i.x = floatBitsToInt(min(intBitsToFloat(R125i.x), 0.0));
R127i.y = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV0iz));
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].y)) + intBitsToFloat(uf_remappedVS[6].y));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 6
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.y) + -(intBitsToFloat(uf_remappedVS[4].w)));
R125i.y = floatBitsToInt(intBitsToFloat(R127i.y) + -(intBitsToFloat(uf_remappedVS[5].w)));
R126i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(PS1i));
R126i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(PS1i));
R124i.y = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS1i));
// 7
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].w)) + intBitsToFloat(uf_remappedVS[7].w));
R11i.y = ((intBitsToFloat(R125i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R0i.z = floatBitsToInt(intBitsToFloat(R127i.y) + -(intBitsToFloat(uf_remappedVS[6].w)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R124i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R126i.y)));
// 8
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].x)) + intBitsToFloat(uf_remappedVS[7].x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R127i.w)));
R125i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].y)) + intBitsToFloat(uf_remappedVS[7].y));
R127i.w = ((intBitsToFloat(backupReg0i) >= 0.0)?(floatBitsToInt(1.0)):(0));
R0i.y = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 9
backupReg0i = R126i.w;
R124i.x = floatBitsToInt(intBitsToFloat(R127i.y) + -(intBitsToFloat(uf_remappedVS[7].w)));
R127i.y = ((intBitsToFloat(R0i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R124i.z = floatBitsToInt(-(intBitsToFloat(R11i.y)) + 1.0);
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].z)) + intBitsToFloat(uf_remappedVS[7].z));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(backupReg0i)));
// 10
backupReg0i = R126i.y;
R125i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].x) + intBitsToFloat(R125i.w));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R126i.z)));
R126i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].z) + intBitsToFloat(backupReg0i));
R125i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].y) + intBitsToFloat(R127i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R124i.y)));
// 11
backupReg0i = R0i.y;
backupReg1i = R125i.z;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(backupReg0i));
R0i.y = ((intBitsToFloat(R124i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.z = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(backupReg0i));
R126i.w = floatBitsToInt(intBitsToFloat(backupReg1i) * intBitsToFloat(backupReg0i));
PS1i = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
// 12
backupReg0i = R126i.x;
backupReg1i = R126i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R124i.z)));
R126i.y = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(PS1i)));
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].x) + intBitsToFloat(backupReg0i));
R124i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].y) + intBitsToFloat(backupReg1i));
// 13
backupReg0i = R127i.x;
backupReg1i = R127i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R126i.w)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(backupReg0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R125i.z)));
R124i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].z) + intBitsToFloat(backupReg1i));
R126i.w = floatBitsToInt(-(intBitsToFloat(R0i.y)) + 1.0);
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].x), intBitsToFloat(R126i.y)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R126i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R126i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R126i.x)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), intBitsToFloat(R126i.y)));
// 15
R126i.x = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0ix));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), intBitsToFloat(R126i.y)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R126i.w)));
R126i.w = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PS0i));
R126i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].x) + intBitsToFloat(R125i.y));
// 16
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].z) + intBitsToFloat(R127i.z));
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].y) + intBitsToFloat(backupReg0i));
R127i.z = floatBitsToInt(intBitsToFloat(R124i.y) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R124i.z)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R124i.z)));
// 17
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(R126i.w));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R126i.x));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R124i.z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R125i.z)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R125i.z)));
// 18
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R125i.z)));
R124i.y = floatBitsToInt(intBitsToFloat(PS1i) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R127i.z));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].x), intBitsToFloat(R0i.y)));
// 19
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].y), intBitsToFloat(R0i.y)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].z), intBitsToFloat(R0i.y)));
PV1iw = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(PV0iz));
R0i.x = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(R0i.x));
// 20
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R124i.y));
R16i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].x)) + 1.0);
// 21
backupReg0i = R8i.y;
R8i.y = ((intBitsToFloat(uf_remappedVS[8].x) == 1.0)?-1:0);
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(PV0iy)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iz)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[9].y)));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[9].z)));
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[9].w)));
// 1
R4i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(R9i.w));
// 2
predResult = (R8i.y != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(R4i.w)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].w), intBitsToFloat(PV0ix)));
// 2
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].x), intBitsToFloat(PV1iw)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].y), intBitsToFloat(PV1iw)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].z), intBitsToFloat(PV1iw)));
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
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(PS1i)));
R127i.y = ((intBitsToFloat(uf_remappedVS[8].x) == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R16i.z));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R4i.w) + -(intBitsToFloat(PV1iz)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].w), intBitsToFloat(PV1ix)));
// 9
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].x), intBitsToFloat(PV0iw)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].y), intBitsToFloat(PV0iw)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].z), intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = uf_remappedVS[11].y;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
PV0iy = uf_remappedVS[11].x;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R11i.x)));
R125i.w = 0x3f800000;
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[8].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(PV0ix));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV0iy));
R124i.w = 0x3f800000;
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(R16i.z));
// 2
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(PV1iz)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(PV1ix)));
R127i.z = floatBitsToInt((intBitsToFloat(uf_remappedVS[12].y) > 0.0)?1.0:0.0);
R0i.w = floatBitsToInt(1.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 3
R127i.x = uf_remappedVS[13].y & int(1);
R6i.y = uf_remappedVS[13].x & 0x80000;
PV1iz = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[12].y))?1.0:0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[12].y));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R9i.w) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(R127i.w));
R126i.z = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(PV1iw)));
R127i.w = floatBitsToInt((intBitsToFloat(uf_remappedVS[12].w) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[12].w));
// 5
R123i.x = ((R8i.y == 0)?(PV0iy):(R4i.w));
R126i.y = (int(1) != R127i.x)?-1:0;
R127i.z = floatBitsToInt(intBitsToFloat(R9i.w) * intBitsToFloat(PS0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(uf_remappedVS[2].z)) + intBitsToFloat(PV0ix));
R127i.x = int(intBitsToFloat(uf_remappedVS[14].z));
// 6
R125i.x = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R123i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R123i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R123i.x)));
R126i.x = int(intBitsToFloat(uf_remappedVS[15].z));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[12].w))?1.0:0.0);
PV1iz = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV0iy));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(uf_remappedVS[3].x)) + intBitsToFloat(R127i.z));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(PV1iz)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(PV1iw)));
R8i.w = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(PV1iy)));
R5i.w = floatBitsToInt(float(R127i.x));
// 9
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV0iy));
R127i.y = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV0ix));
R127i.z = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(PV0iz));
R127i.w = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R4i.w = floatBitsToInt(float(backupReg0i));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R125i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R6i.w = tempi.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R125i.x)));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R125i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R1i.w = tempi.x;
R124i.y = floatBitsToInt(fract(intBitsToFloat(R126i.w)));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R125i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R2i.w = tempi.x;
R127i.z = floatBitsToInt(-(abs(intBitsToFloat(R5i.w))) + 0.0);
// 13
R2i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),intBitsToFloat(R12i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R125i.z),intBitsToFloat(R124i.w))));
PV1iy = R2i.x;
PV1iz = R2i.x;
PV1iw = R2i.x;
R127i.y = floatBitsToInt((0.0 >= abs(intBitsToFloat(R5i.w)))?1.0:0.0);
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R125i.z),intBitsToFloat(R124i.w))));
PV0ix = tempi.x;
R4i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.y = ((R126i.y == 0)?(0):(int(1)));
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(R14i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R125i.z),intBitsToFloat(R124i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R1i.z = tempi.x;
PV1iw = tempi.x;
R125i.z = floatBitsToInt(-(abs(intBitsToFloat(R4i.w))) + 0.0);
// 16
backupReg0i = R125i.x;
R125i.x = ((intBitsToFloat(R127i.y) == 0.0)?(0):(R127i.z));
PV0iy = floatBitsToInt((0.0 >= abs(intBitsToFloat(R4i.w)))?1.0:0.0);
PV0iz = floatBitsToInt(-(intBitsToFloat(R8i.w)) + 1.0);
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(backupReg0i));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(R124i.y)));
// 17
R124i.x = ((intBitsToFloat(PV0iy) == 0.0)?(0):(R125i.z));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z),intBitsToFloat(PV0iz)) + intBitsToFloat(PS0i));
R4i.z = floatBitsToInt(intBitsToFloat(R125i.w) + -(intBitsToFloat(uf_remappedVS[16].w)));
R127i.w = (R126i.y == 0x2)?-1:0;
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[16].w)) + intBitsToFloat(uf_remappedVS[17].w));
// 18
R8i.x = floatBitsToInt(intBitsToFloat(R125i.w) + -(intBitsToFloat(uf_remappedVS[17].w)));
R5i.y = (R126i.y == int(1))?-1:0;
R125i.z = ((R127i.w == 0)?(R7i.x):(R7i.z));
R124i.w = floatBitsToInt(abs(intBitsToFloat(R5i.w)) + intBitsToFloat(R125i.x));
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(R5i.w));
// 19
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[16].x)) + intBitsToFloat(uf_remappedVS[17].x));
R126i.y = ((R127i.w == 0)?(R7i.y):(R7i.x));
R2i.z = ((intBitsToFloat(R4i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iw = floatBitsToInt(abs(intBitsToFloat(R4i.w)) + intBitsToFloat(R124i.x));
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(R4i.w));
// 20
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[17].w)) + intBitsToFloat(uf_remappedVS[18].w));
R127i.y = floatBitsToInt(intBitsToFloat(R125i.w) + -(intBitsToFloat(uf_remappedVS[18].w)));
R127i.z = ((-(intBitsToFloat(backupReg0i)) > 0.0)?(R124i.w):(backupReg0i));
R8i.w = floatBitsToInt(intBitsToFloat(R126i.w) * 0.0);
R126i.z = ((-(intBitsToFloat(R124i.x)) > 0.0)?(PV1iw):(R124i.x));
// 21
R4i.x = ((R5i.y == 0)?(R125i.z):(R7i.y));
R0i.y = ((intBitsToFloat(R8i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R3i.z = floatBitsToInt(intBitsToFloat(R127i.w) * 0.0);
R3i.w = ((R5i.y == 0)?(R126i.y):(R7i.z));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 22
R1i.x = ((intBitsToFloat(R4i.w) == 0.0)?(0):(R126i.z));
R8i.y = ((intBitsToFloat(R5i.w) == 0.0)?(0):(R127i.z));
R8i.z = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS1i));
R4i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[17].x)) + intBitsToFloat(uf_remappedVS[18].x));
R3i.y = floatBitsToInt(1.0 / intBitsToFloat(R125i.x));
// 23
R3i.x = floatBitsToInt(-(intBitsToFloat(R0i.y)) + 1.0);
R2i.y = ((intBitsToFloat(R7i.x) > 0.5)?-1:0);
R5i.z = floatBitsToInt(-(intBitsToFloat(R2i.z)) + 1.0);
R5i.w = ((intBitsToFloat(R127i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R1i.y = uf_remappedVS[13].x & 0x100000;
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R4i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[19].x),intBitsToFloat(uf_remappedVS[19].y),intBitsToFloat(uf_remappedVS[19].z),intBitsToFloat(uf_remappedVS[19].w))));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.w = ((intBitsToFloat(R7i.y) > 0.5)?-1:0);
// 1
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R4i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w))));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
R126i.z = ((intBitsToFloat(R7i.z) > 0.5)?-1:0);
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R4i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w))));
PV0ix = tempi.x;
R126i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R124i.y = ((intBitsToFloat(R7i.w) > 0.5)?-1:0);
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R4i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[22].x),intBitsToFloat(uf_remappedVS[22].y),intBitsToFloat(uf_remappedVS[22].z),intBitsToFloat(uf_remappedVS[22].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R127i.w = tempi.x;
R125i.y = floatBitsToInt(trunc(intBitsToFloat(R8i.w)));
// 4
backupReg0i = R3i.y;
R125i.x = uf_remappedVS[13].x & 0x200000;
R3i.y = floatBitsToInt(trunc(intBitsToFloat(R3i.z)));
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[11].z) + intBitsToFloat(R127i.y));
R125i.w = uf_remappedVS[13].x & 0x400000;
R5i.x = floatBitsToInt(intBitsToFloat(R4i.w) * intBitsToFloat(backupReg0i));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w)),vec4(intBitsToFloat(uf_remappedVS[23].x),intBitsToFloat(uf_remappedVS[23].y),intBitsToFloat(uf_remappedVS[23].z),intBitsToFloat(uf_remappedVS[23].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.z = floatBitsToInt(-(intBitsToFloat(R5i.w)) + 1.0);
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w)),vec4(intBitsToFloat(uf_remappedVS[24].x),intBitsToFloat(uf_remappedVS[24].y),intBitsToFloat(uf_remappedVS[24].z),intBitsToFloat(uf_remappedVS[24].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 7
R127i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(PS0i));
R126i.y = (R6i.y == 0x80000)?-1:0;
R124i.z = ((R2i.y == 0)?(R9i.x):(R15i.w));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R3i.x)));
R126i.x = (R1i.y == 0x100000)?-1:0;
// 8
R12i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R4i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[25].x),intBitsToFloat(uf_remappedVS[25].y),intBitsToFloat(uf_remappedVS[25].z),intBitsToFloat(uf_remappedVS[25].w))));
PV0iy = R12i.x;
PV0iz = R12i.x;
PV0iw = R12i.x;
R127i.z = ((R126i.w == 0)?(R9i.y):(R9i.z));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R4i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[26].x),intBitsToFloat(uf_remappedVS[26].y),intBitsToFloat(uf_remappedVS[26].z),intBitsToFloat(uf_remappedVS[26].w))));
PV1ix = tempi.x;
R12i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.w = (R125i.x == 0x200000)?-1:0;
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R4i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[27].x),intBitsToFloat(uf_remappedVS[27].y),intBitsToFloat(uf_remappedVS[27].z),intBitsToFloat(uf_remappedVS[27].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R12i.w = tempi.x;
R127i.y = ((R126i.z == 0)?(R9i.x):(R15i.w));
// 11
backupReg0i = R127i.x;
R127i.x = (R125i.w == 0x400000)?-1:0;
R124i.y = ((R124i.y == 0)?(R9i.y):(R9i.z));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(backupReg0i)));
R0i.w = ((R126i.x == 0)?(R9i.y):(R127i.z));
R126i.x = int(intBitsToFloat(R8i.y));
// 12
backupReg0i = R5i.y;
R5i.y = ((backupReg0i == 0)?(R7i.y):(R7i.z));
R2i.z = ((backupReg0i == 0)?(R7i.x):(R7i.y));
R125i.x = int(intBitsToFloat(R125i.y));
// 13
backupReg0i = R1i.x;
R1i.x = ((R126i.w == 0)?(R9i.x):(R127i.y));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R125i.z)));
R1i.z = ((R126i.y == 0)?(R9i.x):(R124i.z));
R124i.x = int(intBitsToFloat(backupReg0i));
// 14
R8i.w = ((R127i.x == 0)?(R9i.y):(R124i.y));
R127i.x = int(intBitsToFloat(R3i.y));
// 15
R3i.y = floatBitsToInt(float(R126i.x));
// 16
R3i.z = floatBitsToInt(float(R125i.x));
// 17
R9i.y = floatBitsToInt(float(R124i.x));
// 18
R6i.z = floatBitsToInt(float(R127i.x));
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.y = floatBitsToInt(intBitsToFloat(R11i.y) + -(intBitsToFloat(uf_remappedVS[28].w)));
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[28].w)) + intBitsToFloat(uf_remappedVS[29].w));
PV0iw = floatBitsToInt(intBitsToFloat(R11i.y) + -(intBitsToFloat(uf_remappedVS[29].w)));
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[28].x)) + intBitsToFloat(uf_remappedVS[29].x));
R11i.y = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.z = ((intBitsToFloat(R127i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 2
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(uf_remappedVS[30].y)));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
R124i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[31].w) + intBitsToFloat(uf_remappedVS[30].y));
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[31].z) + intBitsToFloat(uf_remappedVS[30].x));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(uf_remappedVS[30].x)));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
R126i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(PS1i));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].y), intBitsToFloat(R3i.w)));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[33].w) + intBitsToFloat(uf_remappedVS[32].y));
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[33].z) + intBitsToFloat(uf_remappedVS[32].x));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].x), intBitsToFloat(R4i.x)));
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 2.0);
R125i.y = floatBitsToInt(-(intBitsToFloat(PV0iw)) + intBitsToFloat(PV0iz));
// 4
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(PV1iw)) + intBitsToFloat(PV1iz));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R8i.z)) + intBitsToFloat(uf_remappedVS[16].x));
R124i.z = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + intBitsToFloat(R124i.y));
R127i.w = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(PV1iy));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[16].x), intBitsToFloat(R5i.z)));
// 5
PV1ix = floatBitsToInt(-(intBitsToFloat(R11i.y)) + 1.0);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(R4i.w)) + intBitsToFloat(PS0i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R5i.x)) + intBitsToFloat(uf_remappedVS[17].x));
PV1iw = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[14].z));
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R126i.y)) + intBitsToFloat(uf_remappedVS[28].x));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[28].x), intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PV1ix)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R0i.y)) + intBitsToFloat(R123i.y));
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[14].w));
// 7
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(PV0iz)) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[34].x) + intBitsToFloat(uf_remappedVS[34].z));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[34].y) + intBitsToFloat(uf_remappedVS[34].w));
// 8
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(uf_remappedVS[34].z)) + intBitsToFloat(PV1iy));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(uf_remappedVS[34].w)) + intBitsToFloat(PV1iw));
R125i.w = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[15].z));
// 9
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[14].y), intBitsToFloat(R127i.y)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[14].x), intBitsToFloat(R126i.w)));
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[15].w));
// 10
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(R125i.z)) + -(0.5));
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[35].x) + intBitsToFloat(uf_remappedVS[35].z));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R124i.x)) + -(0.5));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[35].y) + intBitsToFloat(uf_remappedVS[35].w));
// 11
backupReg0i = R124i.z;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].z),intBitsToFloat(R2i.z)) + intBitsToFloat(PV0iy));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.w)),intBitsToFloat(uf_remappedVS[31].x)) + -(intBitsToFloat(R125i.y)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].w),intBitsToFloat(R5i.y)) + intBitsToFloat(PV0iw));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w),intBitsToFloat(uf_remappedVS[31].y)) + intBitsToFloat(backupReg0i));
// 12
backupReg0i = R127i.x;
backupReg1i = R125i.z;
backupReg2i = R123i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[15].y), intBitsToFloat(R127i.y)));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.w)),intBitsToFloat(uf_remappedVS[33].x)) + -(intBitsToFloat(backupReg0i)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[15].x), intBitsToFloat(R125i.w)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w),intBitsToFloat(uf_remappedVS[33].y)) + intBitsToFloat(R127i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i),intBitsToFloat(R3i.y)) + intBitsToFloat(backupReg2i));
// 13
R124i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.x)),intBitsToFloat(R3i.z)) + intBitsToFloat(R126i.w));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.x)),intBitsToFloat(R6i.z)) + intBitsToFloat(R123i.w));
R3i.z = uf_remappedVS[36].x;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R9i.y)) + intBitsToFloat(R123i.y));
R6i.z = uf_remappedVS[36].y;
// 14
backupReg0i = R1i.x;
backupReg1i = R8i.w;
R1i.x = uf_remappedVS[37].y;
R9i.y = uf_remappedVS[36].z;
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R125i.z)) + -(0.5));
R8i.w = uf_remappedVS[37].x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i),intBitsToFloat(R127i.x)) + -(0.5));
// 15
R8i.x = uf_remappedVS[37].z;
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w),intBitsToFloat(uf_remappedVS[30].w)) + intBitsToFloat(R127i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w),intBitsToFloat(uf_remappedVS[30].z)) + intBitsToFloat(R125i.x));
// 16
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R7i.x)) + intBitsToFloat(R127i.w));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R126i.z)) + -(intBitsToFloat(R124i.x)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w),intBitsToFloat(uf_remappedVS[32].w)) + intBitsToFloat(R124i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w),intBitsToFloat(uf_remappedVS[32].z)) + intBitsToFloat(R126i.x));
// 17
backupReg0i = R5i.x;
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].x),intBitsToFloat(R5i.w)) + intBitsToFloat(R124i.w));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[29].x),intBitsToFloat(R11i.y)) + intBitsToFloat(backupReg0i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R127i.x)) + -(intBitsToFloat(R127i.y)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R125i.z)) + intBitsToFloat(R126i.w));
R13i.x = floatBitsToInt(intBitsToFloat(R123i.x) + 0.5);
// 18
R13i.y = floatBitsToInt(intBitsToFloat(R125i.y) + 0.5);
R13i.z = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
R13i.w = floatBitsToInt(intBitsToFloat(R123i.z) + 0.5);
}
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(uf_remappedVS[38].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(uf_remappedVS[38].y)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(uf_remappedVS[38].z)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(uf_remappedVS[38].w)));
// 1
backupReg0i = R1i.x;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(uf_remappedVS[39].x)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[39].y)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(uf_remappedVS[39].z)));
R11i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(uf_remappedVS[39].w)));
// 2
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[40].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[40].x)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[40].x)));
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].x), intBitsToFloat(R1i.x)));
// 3
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].x), intBitsToFloat(R1i.y)));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].x), intBitsToFloat(R1i.z)));
}
if( activeMaskStackC[3] == true ) {
// 0
R15i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].x) * 1.0 + 0.0);
R15i.y = uf_remappedVS[41].x;
// 1
R14i.x = R10i.x;
R14i.y = R10i.y;
R14i.z = R10i.z;
R14i.w = R10i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.z));
}
