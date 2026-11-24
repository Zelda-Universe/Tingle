#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 05ed3bc9e35b3820
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[39];
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
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem8;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R9i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem10;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem9;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
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
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem6;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R2i.z = floatBitsToInt(-(intBitsToFloat(R7i.y)) + 1.0);
R1i.w = 0;
R4i.w = floatBitsToInt(1.0);
// 1
R10i.w = floatBitsToInt(-(intBitsToFloat(R3i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R3i.w = floatBitsToInt(-(intBitsToFloat(R7i.x)) + 1.0);
// 2
predResult = (0.0 > intBitsToFloat(R10i.w));
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
R10i.x = 0;
// 1
R6i.w = R4i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R6i.w = R1i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R6i.w == 0);
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
R2i.x = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R10i.w) >= intBitsToFloat(R2i.x));
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
R10i.x = 0;
// 1
R1i.w = R4i.w;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R1i.w == 0);
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
R0i.y = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedVS[4].x),intBitsToFloat(uf_remappedVS[4].y),intBitsToFloat(uf_remappedVS[4].z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[4].x),intBitsToFloat(uf_remappedVS[4].y),intBitsToFloat(uf_remappedVS[4].z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.w = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 3
R0i.x = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 4
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
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].x), intBitsToFloat(R127i.y)));
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].x), intBitsToFloat(R127i.y)));
// 2
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].x), intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R12i.x = 0;
// 1
R15i.x = R12i.x;
// 2
R14i.x = R12i.x;
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
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].y), intBitsToFloat(R127i.x)));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].y), intBitsToFloat(R127i.x)));
// 2
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R15i.y = 0;
R14i.y = 0;
// 1
R12i.y = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (intBitsToFloat(R0i.x) > 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R0i.x));
// 1
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].z), intBitsToFloat(R127i.x)));
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].z), intBitsToFloat(R127i.x)));
// 2
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R15i.z = 0;
R14i.z = 0;
// 1
R12i.z = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(uf_remappedVS[5].y)));
PV0iy = floatBitsToInt(max(intBitsToFloat(R5i.x), 0.0));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(uf_remappedVS[5].z)));
R9i.w = 0x3f800000;
R2i.w = 0x3f800000;
// 1
PV1ix = uf_remappedVS[6].x;
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) / 2.0);
R9i.y = floatBitsToInt(1.0);
PV1iz = uf_remappedVS[6].y;
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) / 2.0);
PV1iw = floatBitsToInt(min(intBitsToFloat(PV0iy), 0.0));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R2i.x));
// 2
R0i.x = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV1iw));
R0i.y = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV1ix));
R3i.z = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV1iz));
PV0iw = floatBitsToInt(intBitsToFloat(R10i.w) * intBitsToFloat(PS1i));
PS0i = uf_remappedVS[7].y & int(1);
// 3
R3i.x = floatBitsToInt(intBitsToFloat(PV0iw) + 0.0);
PV1iy = (int(1) != PS0i)?-1:0;
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[5].x)));
R1i.w = uf_remappedVS[7].x & 0x80000;
R125i.y = ((intBitsToFloat(R5i.x) > 0.5)?-1:0);
// 4
R125i.x = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(uf_remappedVS[8].w)));
PV0iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].w)) + intBitsToFloat(uf_remappedVS[8].w));
R127i.z = ((PV1iy == 0)?(0):(int(1)));
R127i.w = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(uf_remappedVS[9].w)));
R0i.x = ((intBitsToFloat(R5i.y) > 0.5)?-1:0);
// 5
R127i.x = ((intBitsToFloat(R125i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.y = ((intBitsToFloat(R127i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].x)) + intBitsToFloat(uf_remappedVS[8].x));
R125i.w = (R127i.z == 0x2)?-1:0;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 6
R6i.x = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(uf_remappedVS[10].w)));
R126i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].w)) + intBitsToFloat(uf_remappedVS[10].w));
R126i.z = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
// 7
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[8].x)) + intBitsToFloat(uf_remappedVS[10].x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV0iz)));
R125i.z = (R127i.z == int(1))?-1:0;
R0i.w = ((intBitsToFloat(R6i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 8
R2i.x = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(uf_remappedVS[11].w)));
PV0iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[10].w)) + intBitsToFloat(uf_remappedVS[11].w));
R127i.z = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(PS1i));
R126i.w = floatBitsToInt(-(intBitsToFloat(R0i.w)) + 1.0);
R124i.w = ((R125i.w == 0)?(R5i.x):(R5i.z));
// 9
R124i.x = ((intBitsToFloat(R2i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].x), intBitsToFloat(R126i.z)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R126i.y)) + intBitsToFloat(uf_remappedVS[9].x));
R127i.w = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(uf_remappedVS[12].w)));
R126i.x = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 10
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R127i.y)) + intBitsToFloat(PV1iy));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R126i.w)));
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[10].x)) + intBitsToFloat(uf_remappedVS[11].x));
R123i.w = ((R125i.w == 0)?(R5i.y):(R5i.x));
R126i.y = ((intBitsToFloat(R127i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 11
R126i.x = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(R126i.x));
PV1iy = floatBitsToInt(-(intBitsToFloat(R124i.x)) + 1.0);
R7i.z = ((R125i.z == 0)?(R124i.w):(R5i.y));
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[11].w)) + intBitsToFloat(uf_remappedVS[12].w));
R10i.x = ((R125i.z == 0)?(R123i.w):(R5i.z));
// 12
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R127i.z)) + intBitsToFloat(uf_remappedVS[8].x));
R10i.y = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(uf_remappedVS[13].w)));
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV1iy)));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 13
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[11].x)) + intBitsToFloat(uf_remappedVS[12].x));
R6i.y = ((intBitsToFloat(R10i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(PV0iz)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(R127i.y)) + intBitsToFloat(R127i.x));
R125i.w = ((intBitsToFloat(R5i.z) > 0.5)?-1:0);
// 14
R127i.x = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(R127i.z));
PV0iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[12].w)) + intBitsToFloat(uf_remappedVS[13].w));
PV0iz = ((intBitsToFloat(R5i.w) > 0.5)?-1:0);
PV0iw = floatBitsToInt(-(intBitsToFloat(R6i.y)) + 1.0);
R127i.z = (R1i.w == 0x80000)?-1:0;
// 15
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV0iw)));
R127i.y = ((PV0iz == 0)?(R7i.y):(R2i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R126i.x)) + intBitsToFloat(uf_remappedVS[10].x));
R7i.w = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(uf_remappedVS[14].w)));
R126i.x = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 16
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R124i.w)) + intBitsToFloat(R126i.w));
R125i.y = ((R125i.y == 0)?(R7i.x):(R3i.w));
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[12].x)) + intBitsToFloat(uf_remappedVS[13].x));
R0i.w = ((intBitsToFloat(R7i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.w = ((R0i.x == 0)?(R7i.y):(R2i.z));
// 17
R126i.x = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(R126i.x));
R2i.y = ((R125i.z == 0)?(R5i.x):(R5i.y));
R124i.z = ((R125i.w == 0)?(R7i.x):(R3i.w));
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[13].w)) + intBitsToFloat(uf_remappedVS[14].w));
R9i.z = ((R125i.z == 0)?(R5i.y):(R5i.z));
// 18
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R127i.x)) + intBitsToFloat(uf_remappedVS[11].x));
PV0iy = uf_remappedVS[7].x & 0x200000;
PV0iz = uf_remappedVS[7].x & 0x100000;
PV0iw = uf_remappedVS[7].x & 0x400000;
R125i.z = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 19
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[13].x)) + intBitsToFloat(uf_remappedVS[14].x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(R126i.z)) + intBitsToFloat(R124i.x));
R126i.z = (PV0iz == 0x100000)?-1:0;
R125i.w = (PV0iy == 0x200000)?-1:0;
R124i.w = (PV0iw == 0x400000)?-1:0;
// 20
R0i.x = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(R125i.z));
PV0iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[14].w)) + intBitsToFloat(uf_remappedVS[15].w));
PV0iz = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(uf_remappedVS[15].w)));
R1i.w = floatBitsToInt(-(intBitsToFloat(R0i.w)) + 1.0);
R4i.w = ((R127i.z == 0)?(R7i.x):(R125i.y));
// 21
R2i.x = ((R126i.z == 0)?(R7i.y):(R126i.w));
R13i.y = ((intBitsToFloat(PV0iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R126i.x)) + intBitsToFloat(uf_remappedVS[12].x));
R6i.w = ((R125i.w == 0)?(R7i.x):(R124i.z));
R3i.x = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 22
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R125i.x)) + intBitsToFloat(R126i.y));
R7i.y = ((R124i.w == 0)?(R7i.y):(R127i.y));
R2i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[14].x)) + intBitsToFloat(uf_remappedVS[15].x));
R3i.w = floatBitsToInt(-(intBitsToFloat(R13i.y)) + 1.0);
}
if( activeMaskStackC[3] == true ) {
// 0
R3i.x = floatBitsToInt(intBitsToFloat(R2i.z) * intBitsToFloat(R3i.x));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[16].w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(uf_remappedVS[16].z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(uf_remappedVS[16].y)));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R1i.w)));
// 1
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R0i.y)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(R3i.z)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PV0iy)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(uf_remappedVS[17].x)));
R126i.w = floatBitsToInt(intBitsToFloat(R126i.w) * 2.0);
PS1i = int(intBitsToFloat(uf_remappedVS[18].z));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R9i.w)),vec4(intBitsToFloat(uf_remappedVS[19].x),intBitsToFloat(uf_remappedVS[19].y),intBitsToFloat(uf_remappedVS[19].z),intBitsToFloat(uf_remappedVS[19].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R1i.w = tempi.x;
R126i.x = floatBitsToInt(float(PS1i));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R9i.w)),vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R5i.w = tempi.x;
R124i.w = floatBitsToInt(-(abs(intBitsToFloat(R126i.x))) + 0.0);
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R9i.w)),vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R9i.w = tempi.x;
R124i.z = floatBitsToInt((0.0 >= abs(intBitsToFloat(R126i.x)))?1.0:0.0);
// 5
R1i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),intBitsToFloat(R12i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R2i.w))));
PV1iy = R1i.x;
PV1iz = R1i.x;
PV1iw = R1i.x;
PS1i = int(intBitsToFloat(uf_remappedVS[22].z));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(R14i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R2i.w))));
PV0ix = tempi.x;
R3i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R124i.x = floatBitsToInt(float(PS1i));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),intBitsToFloat(R15i.z),intBitsToFloat(R9i.w)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R2i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R1i.z = tempi.x;
PV1iw = tempi.x;
R127i.w = floatBitsToInt(-(abs(intBitsToFloat(R124i.x))) + 0.0);
// 8
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(uf_remappedVS[17].y)));
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) * 2.0);
R127i.y = ((intBitsToFloat(R124i.z) == 0.0)?(0):(R124i.w));
PV0iz = floatBitsToInt((0.0 >= abs(intBitsToFloat(R124i.x)))?1.0:0.0);
R124i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[23].z) + intBitsToFloat(uf_remappedVS[17].x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 9
PV1ix = floatBitsToInt(abs(intBitsToFloat(R126i.x)) + intBitsToFloat(R127i.y));
R126i.y = ((intBitsToFloat(PV0iz) == 0.0)?(0):(R127i.w));
R124i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[23].w) + intBitsToFloat(uf_remappedVS[17].y));
PV1iw = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R124i.x));
// 10
PV0ix = floatBitsToInt(abs(intBitsToFloat(R124i.x)) + intBitsToFloat(R126i.y));
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
R127i.z = floatBitsToInt(trunc(intBitsToFloat(PV1iw)));
R123i.w = ((-(intBitsToFloat(R127i.y)) > 0.0)?(PV1ix):(R127i.y));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[24].x), intBitsToFloat(R7i.z)));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
// 11
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(trunc(intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[25].z) + intBitsToFloat(uf_remappedVS[24].x));
R126i.z = ((intBitsToFloat(backupReg0i) == 0.0)?(0):(R123i.w));
R123i.w = ((-(intBitsToFloat(R126i.y)) > 0.0)?(PV0ix):(R126i.y));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[24].y), intBitsToFloat(R10i.x)));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) * 2.0);
// 12
backupReg0i = R124i.z;
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[25].w) + intBitsToFloat(uf_remappedVS[24].y));
R127i.y = floatBitsToInt(-(intBitsToFloat(R126i.w)) + intBitsToFloat(R124i.w));
R124i.z = ((intBitsToFloat(R124i.x) == 0.0)?(0):(R123i.w));
R126i.w = floatBitsToInt(-(intBitsToFloat(R125i.x)) + intBitsToFloat(backupReg0i));
R125i.z = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(PV1iy));
// 13
backupReg0i = R126i.z;
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[26].y) + intBitsToFloat(uf_remappedVS[26].w));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R3i.w)));
R126i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[26].x) + intBitsToFloat(uf_remappedVS[26].z));
R124i.w = floatBitsToInt(-(intBitsToFloat(R126i.y)) + intBitsToFloat(PV0ix));
R126i.y = int(intBitsToFloat(backupReg0i));
// 14
backupReg0i = R127i.z;
R125i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[27].y) + intBitsToFloat(uf_remappedVS[27].w));
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[27].x) + intBitsToFloat(uf_remappedVS[27].z));
R1i.y = int(intBitsToFloat(backupReg0i));
// 15
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(uf_remappedVS[26].z)) + intBitsToFloat(R126i.z));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(uf_remappedVS[26].w)) + intBitsToFloat(R127i.x));
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[18].z));
// 16
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[27].z),intBitsToFloat(R2i.y)) + intBitsToFloat(R127i.z));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[27].w),intBitsToFloat(R9i.z)) + intBitsToFloat(R125i.x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[18].w));
// 17
backupReg0i = R127i.x;
backupReg1i = R124i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R10i.w)),intBitsToFloat(uf_remappedVS[23].x)) + -(intBitsToFloat(R127i.y)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].y), intBitsToFloat(PS0i)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w),intBitsToFloat(uf_remappedVS[23].y)) + intBitsToFloat(R126i.w));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].x), intBitsToFloat(backupReg0i)));
R2i.y = int(intBitsToFloat(backupReg1i));
// 18
backupReg0i = R126i.x;
R126i.x = uf_remappedVS[28].x;
R5i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R10i.w)),intBitsToFloat(uf_remappedVS[25].x)) + -(intBitsToFloat(R125i.z)));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w),intBitsToFloat(uf_remappedVS[25].y)) + intBitsToFloat(R124i.w));
R124i.w = uf_remappedVS[28].y;
R4i.y = int(intBitsToFloat(backupReg0i));
// 19
R124i.x = uf_remappedVS[28].z;
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R127i.y)) + -(0.5));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(R126i.w)) + -(0.5));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[22].z));
// 20
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[22].x), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[22].w));
// 21
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w),intBitsToFloat(uf_remappedVS[17].z)) + intBitsToFloat(R125i.y));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[22].y), intBitsToFloat(PS0i)));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w),intBitsToFloat(R4i.w)) + -(0.5));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w),intBitsToFloat(uf_remappedVS[17].w)) + intBitsToFloat(R127i.w));
PS1i = floatBitsToInt(float(R126i.y));
// 22
backupReg0i = R7i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PS1i)) + intBitsToFloat(R127i.x));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w),intBitsToFloat(uf_remappedVS[24].z)) + intBitsToFloat(R124i.y));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R6i.y)) + -(0.5));
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w),intBitsToFloat(uf_remappedVS[24].w)) + intBitsToFloat(R125i.w));
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(uf_remappedVS[29].x)));
// 23
backupReg0i = R1i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R125i.z)) + intBitsToFloat(R123i.x));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(uf_remappedVS[29].y)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(uf_remappedVS[29].z)));
PS1i = floatBitsToInt(float(backupReg0i));
// 24
R9i.x = floatBitsToInt(intBitsToFloat(R123i.x) + 0.5);
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)),intBitsToFloat(PS1i)) + intBitsToFloat(R124i.z));
PS0i = floatBitsToInt(float(R2i.y));
// 25
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(PS0i)) + intBitsToFloat(R5i.y));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R0i.y)) + -(intBitsToFloat(R123i.y)));
R4i.w = floatBitsToInt(float(R4i.y));
}
if( activeMaskStackC[3] == true ) {
// 0
R14i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R3i.y),intBitsToFloat(R1i.z),intBitsToFloat(R9i.y)),vec4(intBitsToFloat(uf_remappedVS[30].x),intBitsToFloat(uf_remappedVS[30].y),intBitsToFloat(uf_remappedVS[30].z),intBitsToFloat(uf_remappedVS[30].w))));
PV0iy = R14i.x;
PV0iz = R14i.x;
PV0iw = R14i.x;
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.y)),intBitsToFloat(R4i.w)) + intBitsToFloat(R9i.z));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R3i.y),intBitsToFloat(R1i.z),intBitsToFloat(R9i.y)),vec4(intBitsToFloat(uf_remappedVS[31].x),intBitsToFloat(uf_remappedVS[31].y),intBitsToFloat(uf_remappedVS[31].z),intBitsToFloat(uf_remappedVS[31].w))));
PV1ix = tempi.x;
R14i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(R5i.z)) + intBitsToFloat(R2i.x));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R3i.y),intBitsToFloat(R1i.z),intBitsToFloat(R9i.y)),vec4(intBitsToFloat(uf_remappedVS[32].x),intBitsToFloat(uf_remappedVS[32].y),intBitsToFloat(uf_remappedVS[32].z),intBitsToFloat(uf_remappedVS[32].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R14i.z = tempi.x;
PV0iw = tempi.x;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w),intBitsToFloat(R7i.z)) + -(intBitsToFloat(R127i.y)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R3i.y),intBitsToFloat(R1i.z),intBitsToFloat(R9i.y)),vec4(intBitsToFloat(uf_remappedVS[33].x),intBitsToFloat(uf_remappedVS[33].y),intBitsToFloat(uf_remappedVS[33].z),intBitsToFloat(uf_remappedVS[33].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R14i.w = tempi.x;
R9i.y = floatBitsToInt(intBitsToFloat(R5i.w) + 0.5);
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(R0i.x)) + intBitsToFloat(uf_remappedVS[13].x));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(R3i.x)) + intBitsToFloat(uf_remappedVS[14].x));
R9i.w = floatBitsToInt(intBitsToFloat(R127i.w) + 0.5);
R9i.z = floatBitsToInt(intBitsToFloat(R125i.x) + 0.5);
// 5
backupReg0i = R7i.x;
R7i.x = uf_remappedVS[34].x;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(R11i.y)) + intBitsToFloat(backupReg0i));
// 6
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R12i.y)) + intBitsToFloat(R123i.w));
// 7
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[15].x),intBitsToFloat(R13i.y)) + intBitsToFloat(R123i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.y = uf_remappedVS[35].z;
PV0iz = uf_remappedVS[35].x;
PV0iw = uf_remappedVS[35].y;
// 1
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(uf_remappedVS[36].x)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedVS[36].y)));
PV1iw = uf_remappedVS[37].x;
// 2
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(uf_remappedVS[36].z)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(uf_remappedVS[29].w)));
R11i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(uf_remappedVS[36].w)));
// 3
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(uf_remappedVS[38].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[38].x)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[38].x)));
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].x), intBitsToFloat(backupReg0i)));
// 4
R10i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[16].x) * 1.0 + 0.0);
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].x), intBitsToFloat(R2i.y)));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].x), intBitsToFloat(R1i.z)));
// 5
R12i.x = R8i.x;
R12i.y = R8i.y;
R12i.z = R8i.z;
R12i.w = R8i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.z));
}
