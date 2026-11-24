#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 0676996820618bc3
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_uniformRegisterVS[256];
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;

out vec4 passParameterSem0;
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
ivec4 R123i = ivec4(0);
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
bool activeMaskStack[14];
bool activeMaskStackC[15];
activeMaskStack[0] = false;
activeMaskStack[1] = false;
activeMaskStack[2] = false;
activeMaskStack[3] = false;
activeMaskStack[4] = false;
activeMaskStack[5] = false;
activeMaskStack[6] = false;
activeMaskStack[7] = false;
activeMaskStack[8] = false;
activeMaskStack[9] = false;
activeMaskStack[10] = false;
activeMaskStack[11] = false;
activeMaskStack[12] = false;
activeMaskStackC[0] = false;
activeMaskStackC[1] = false;
activeMaskStackC[2] = false;
activeMaskStackC[3] = false;
activeMaskStackC[4] = false;
activeMaskStackC[5] = false;
activeMaskStackC[6] = false;
activeMaskStackC[7] = false;
activeMaskStackC[8] = false;
activeMaskStackC[9] = false;
activeMaskStackC[10] = false;
activeMaskStackC[11] = false;
activeMaskStackC[12] = false;
activeMaskStackC[13] = false;
activeMaskStack[0] = true;
activeMaskStackC[0] = true;
activeMaskStackC[1] = true;
R0i = ivec4(gl_VertexID, 0, 0, gl_InstanceID);
attrDecoder.xy = attrDataSem0.xy;
attrDecoder.xy = uvec2((attrDecoder.xy>>24)|((attrDecoder.xy>>8)&0xFF00u)|((attrDecoder.xy<<8)&0xFF0000u)|((attrDecoder.xy<<24)));
attrDecoder.z = uint(0);
attrDecoder.w = uint(0);
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), 0, 0x3f800000);
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(uf_uniformRegisterVS[11].x)));
R0i.y = floatBitsToInt(-(intBitsToFloat(R1i.y)));
R127i.z = 0;
R127i.w = 0x3f800000;
R126i.w = floatBitsToInt(1.0);
// 1
R127i.x = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(uf_uniformRegisterVS[11].z));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_uniformRegisterVS[11].y)));
// 2
R127i.y = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(uf_uniformRegisterVS[11].w));
R0i.w = uf_uniformRegisterVS[2].x & 0x40000000;
// 3
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w)),vec4(intBitsToFloat(uf_uniformRegisterVS[3].x),intBitsToFloat(uf_uniformRegisterVS[3].y),intBitsToFloat(uf_uniformRegisterVS[3].z),intBitsToFloat(uf_uniformRegisterVS[3].w))));
PV1iy = R126i.x;
PV1iz = R126i.x;
PV1iw = R126i.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w)),vec4(intBitsToFloat(uf_uniformRegisterVS[4].x),intBitsToFloat(uf_uniformRegisterVS[4].y),intBitsToFloat(uf_uniformRegisterVS[4].z),intBitsToFloat(uf_uniformRegisterVS[4].w))));
PV0ix = tempi.x;
R126i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w)),vec4(intBitsToFloat(uf_uniformRegisterVS[5].x),intBitsToFloat(uf_uniformRegisterVS[5].y),intBitsToFloat(uf_uniformRegisterVS[5].z),intBitsToFloat(uf_uniformRegisterVS[5].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R127i.z = tempi.x;
PV1iw = tempi.x;
// 6
R5i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(PV1ix),intBitsToFloat(R126i.w)),vec4(intBitsToFloat(uf_uniformRegisterVS[7].x),intBitsToFloat(uf_uniformRegisterVS[7].y),intBitsToFloat(uf_uniformRegisterVS[7].z),intBitsToFloat(uf_uniformRegisterVS[7].w))));
PV0iy = R5i.x;
PV0iz = R5i.x;
PV0iw = R5i.x;
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R126i.w)),vec4(intBitsToFloat(uf_uniformRegisterVS[8].x),intBitsToFloat(uf_uniformRegisterVS[8].y),intBitsToFloat(uf_uniformRegisterVS[8].z),intBitsToFloat(uf_uniformRegisterVS[8].w))));
PV1ix = tempi.x;
R5i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R126i.w)),vec4(intBitsToFloat(uf_uniformRegisterVS[9].x),intBitsToFloat(uf_uniformRegisterVS[9].y),intBitsToFloat(uf_uniformRegisterVS[9].z),intBitsToFloat(uf_uniformRegisterVS[9].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R5i.z = tempi.x;
PV0iw = tempi.x;
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R126i.w)),vec4(intBitsToFloat(uf_uniformRegisterVS[10].x),intBitsToFloat(uf_uniformRegisterVS[10].y),intBitsToFloat(uf_uniformRegisterVS[10].z),intBitsToFloat(uf_uniformRegisterVS[10].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R5i.w = tempi.x;
// 10
predResult = (0 != R0i.w);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R0i.x = 0x437f0000;
R0i.y = 0x437f0000;
R0i.z = 0x437f0000;
R0i.w = 0x437f0000;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
R0i.x = uf_uniformRegisterVS[2].x & 0x2;
PV0iz = uf_uniformRegisterVS[2].x >> 0x8;
// 1
R0i.y = PV0iz & 0xf;
// 2
predResult = (0 != R0i.x);
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
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_uniformRegisterVS[6].x));
// 1
R0i.x = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(uf_uniformRegisterVS[1].x));
R2i.y = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(uf_uniformRegisterVS[1].y));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_uniformRegisterVS[6].y));
// 2
R2i.x = floatBitsToInt(intBitsToFloat(uf_uniformRegisterVS[1].z) * intBitsToFloat(PS1i));
R3i.y = floatBitsToInt(intBitsToFloat(uf_uniformRegisterVS[1].w) * intBitsToFloat(PS1i));
R3i.x = floatBitsToInt(-(intBitsToFloat(R0i.x)) + 1.0);
// 3
R4i.x = floatBitsToInt(-(intBitsToFloat(R2i.y)) + intBitsToFloat(R3i.x));
R0i.w = floatBitsToInt(-(intBitsToFloat(R2i.x)) + 1.0);
R6i.x = floatBitsToInt(-(intBitsToFloat(R2i.y)) + 1.0);
// 4
R0i.z = floatBitsToInt(-(intBitsToFloat(R3i.y)) + intBitsToFloat(R0i.w));
R1i.w = floatBitsToInt(-(intBitsToFloat(R3i.y)) + 1.0);
// 5
predResult = (R0i.y == 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R0i.x)));
R0i.y = R2i.x;
// 1
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R0i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
activeMaskStack[4] = activeMaskStack[3];
activeMaskStackC[5] = activeMaskStackC[4];
// 0
predResult = (R0i.y == int(1));
activeMaskStack[4] = predResult;
activeMaskStackC[5] = predResult == true && activeMaskStackC[4] == true;
}
else {
activeMaskStack[4] = false;
activeMaskStackC[5] = false;
}
if( activeMaskStackC[5] == true ) {
// 0
R0i.y = 0;
PV0iz = R2i.x;
PV0iw = R2i.y;
// 1
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(PV0iw)) + intBitsToFloat(R6i.x));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(PV0iz)) + intBitsToFloat(R0i.y));
}
activeMaskStack[4] = activeMaskStack[4] == false;
activeMaskStackC[5] = activeMaskStack[4] == true && activeMaskStackC[4] == true;
if( activeMaskStackC[5] == true ) {
activeMaskStack[5] = activeMaskStack[4];
activeMaskStackC[6] = activeMaskStackC[5];
// 0
predResult = (R0i.y == 0x2);
activeMaskStack[5] = predResult;
activeMaskStackC[6] = predResult == true && activeMaskStackC[5] == true;
}
else {
activeMaskStack[5] = false;
activeMaskStackC[6] = false;
}
if( activeMaskStackC[6] == true ) {
// 0
R3i.y = R3i.y;
PV0iz = R1i.w;
PV0iw = 0;
// 1
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R0i.x)) + intBitsToFloat(PV0iw));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R3i.y)) + intBitsToFloat(PV0iz));
}
activeMaskStack[5] = activeMaskStack[5] == false;
activeMaskStackC[6] = activeMaskStack[5] == true && activeMaskStackC[5] == true;
if( activeMaskStackC[6] == true ) {
activeMaskStack[6] = activeMaskStack[5];
activeMaskStackC[7] = activeMaskStackC[6];
// 0
predResult = (R0i.y == 0x3);
activeMaskStack[6] = predResult;
activeMaskStackC[7] = predResult == true && activeMaskStackC[6] == true;
}
else {
activeMaskStack[6] = false;
activeMaskStackC[7] = false;
}
if( activeMaskStackC[7] == true ) {
// 0
R0i.y = R1i.w;
PV0iz = R3i.y;
PV0iw = R2i.y;
// 1
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(PV0iw)) + intBitsToFloat(R6i.x));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(PV0iz)) + intBitsToFloat(R0i.y));
}
activeMaskStack[6] = activeMaskStack[6] == false;
activeMaskStackC[7] = activeMaskStack[6] == true && activeMaskStackC[6] == true;
if( activeMaskStackC[7] == true ) {
activeMaskStack[7] = activeMaskStack[6];
activeMaskStackC[8] = activeMaskStackC[7];
// 0
predResult = (R0i.y == 0x4);
activeMaskStack[7] = predResult;
activeMaskStackC[8] = predResult == true && activeMaskStackC[7] == true;
}
else {
activeMaskStack[7] = false;
activeMaskStackC[8] = false;
}
if( activeMaskStackC[8] == true ) {
// 0
R0i.y = R0i.z;
PV0iz = R2i.x;
PV0iw = 0;
// 1
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R0i.x)) + intBitsToFloat(PV0iw));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(PV0iz));
}
activeMaskStack[7] = activeMaskStack[7] == false;
activeMaskStackC[8] = activeMaskStack[7] == true && activeMaskStackC[7] == true;
if( activeMaskStackC[8] == true ) {
activeMaskStack[8] = activeMaskStack[7];
activeMaskStackC[9] = activeMaskStackC[8];
// 0
predResult = (R0i.y == 0x5);
activeMaskStack[8] = predResult;
activeMaskStackC[9] = predResult == true && activeMaskStackC[8] == true;
}
else {
activeMaskStack[8] = false;
activeMaskStackC[9] = false;
}
if( activeMaskStackC[9] == true ) {
// 0
R0i.y = R2i.x;
PV0iz = R0i.z;
PV0iw = R2i.y;
// 1
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(PV0iw)) + intBitsToFloat(R6i.x));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(PV0iz)) + intBitsToFloat(R0i.y));
}
activeMaskStack[8] = activeMaskStack[8] == false;
activeMaskStackC[9] = activeMaskStack[8] == true && activeMaskStackC[8] == true;
if( activeMaskStackC[9] == true ) {
activeMaskStack[9] = activeMaskStack[8];
activeMaskStackC[10] = activeMaskStackC[9];
// 0
predResult = (R0i.y == 0x6);
activeMaskStack[9] = predResult;
activeMaskStackC[10] = predResult == true && activeMaskStackC[9] == true;
}
else {
activeMaskStack[9] = false;
activeMaskStackC[10] = false;
}
if( activeMaskStackC[10] == true ) {
// 0
R0i.y = R2i.x;
R2i.y = 0;
// 1
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R4i.x)) + intBitsToFloat(R0i.x));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(R2i.y));
}
activeMaskStack[9] = activeMaskStack[9] == false;
activeMaskStackC[10] = activeMaskStack[9] == true && activeMaskStackC[9] == true;
if( activeMaskStackC[10] == true ) {
activeMaskStack[10] = activeMaskStack[9];
activeMaskStackC[11] = activeMaskStackC[10];
// 0
predResult = (R0i.y == 0x7);
activeMaskStack[10] = predResult;
activeMaskStackC[11] = predResult == true && activeMaskStackC[10] == true;
}
else {
activeMaskStack[10] = false;
activeMaskStackC[11] = false;
}
if( activeMaskStackC[11] == true ) {
// 0
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R4i.x)) + intBitsToFloat(R0i.x));
R3i.y = R3i.y;
R0i.y = R1i.w;
// 1
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R3i.y)) + intBitsToFloat(R0i.y));
}
activeMaskStack[10] = activeMaskStack[10] == false;
activeMaskStackC[11] = activeMaskStack[10] == true && activeMaskStackC[10] == true;
if( activeMaskStackC[11] == true ) {
activeMaskStack[11] = activeMaskStack[10];
activeMaskStackC[12] = activeMaskStackC[11];
// 0
predResult = (R0i.y == 0x8);
activeMaskStack[11] = predResult;
activeMaskStackC[12] = predResult == true && activeMaskStackC[11] == true;
}
else {
activeMaskStack[11] = false;
activeMaskStackC[12] = false;
}
if( activeMaskStackC[12] == true ) {
// 0
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R6i.x)));
R0i.y = R2i.x;
// 1
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R0i.y)));
}
activeMaskStack[11] = activeMaskStack[11] == false;
activeMaskStackC[12] = activeMaskStack[11] == true && activeMaskStackC[11] == true;
if( activeMaskStackC[12] == true ) {
activeMaskStack[12] = activeMaskStack[11];
activeMaskStackC[13] = activeMaskStackC[12];
// 0
predResult = (R0i.y == 0x9);
activeMaskStack[12] = predResult;
activeMaskStackC[13] = predResult == true && activeMaskStackC[12] == true;
}
else {
activeMaskStack[12] = false;
activeMaskStackC[13] = false;
}
if( activeMaskStackC[13] == true ) {
// 0
R0i.y = 0;
PV0iz = R1i.w;
PV0iw = R2i.y;
// 1
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(PV0iw)) + intBitsToFloat(R6i.x));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(PV0iz)) + intBitsToFloat(R0i.y));
}
activeMaskStack[12] = activeMaskStack[12] == false;
activeMaskStackC[13] = activeMaskStack[12] == true && activeMaskStackC[12] == true;
if( activeMaskStackC[13] == true ) {
activeMaskStack[13] = activeMaskStack[12];
activeMaskStackC[14] = activeMaskStackC[13];
// 0
predResult = (R0i.y == 0xa);
activeMaskStack[13] = predResult;
activeMaskStackC[14] = predResult == true && activeMaskStackC[13] == true;
}
else {
activeMaskStack[13] = false;
activeMaskStackC[14] = false;
}
if( activeMaskStackC[14] == true ) {
// 0
R0i.y = R0i.w;
PV0iz = R2i.x;
PV0iw = 0;
// 1
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R0i.x)) + intBitsToFloat(PV0iw));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(PV0iz));
}
activeMaskStack[13] = activeMaskStack[13] == false;
activeMaskStackC[14] = activeMaskStack[13] == true && activeMaskStackC[13] == true;
if( activeMaskStackC[14] == true ) {
// 0
backupReg0i = R0i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R6i.x)));
R0i.y = R0i.z;
R127i.z = (backupReg0i == 0xc)?-1:0;
R127i.w = (backupReg0i == 0xb)?-1:0;
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R0i.y)));
R0i.y = R1i.w;
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R3i.x)) + intBitsToFloat(R0i.x));
R123i.w = ((R127i.z == 0)?(0):(PV0ix));
// 2
R1i.x = ((R127i.w == 0)?(R123i.w):(R123i.z));
R123i.z = ((R127i.z == 0)?(0):(PV1ix));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R3i.y)) + intBitsToFloat(R0i.y));
// 3
R1i.y = ((R127i.w == 0)?(R123i.z):(R123i.w));
}
activeMaskStackC[13] = activeMaskStack[12] == true && activeMaskStackC[12] == true;
activeMaskStackC[11] = activeMaskStack[10] == true && activeMaskStackC[10] == true;
activeMaskStackC[9] = activeMaskStack[8] == true && activeMaskStackC[8] == true;
activeMaskStackC[7] = activeMaskStack[6] == true && activeMaskStackC[6] == true;
activeMaskStackC[5] = activeMaskStack[4] == true && activeMaskStackC[4] == true;
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(-(intBitsToFloat(R1i.y)) + 1.0);
R126i.y = floatBitsToInt(-(intBitsToFloat(R1i.x)) + 1.0);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_uniformRegisterVS[12].w)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_uniformRegisterVS[12].z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_uniformRegisterVS[12].y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_uniformRegisterVS[12].x)));
// 2
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(uf_uniformRegisterVS[14].w)) + intBitsToFloat(PV1ix));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(uf_uniformRegisterVS[14].z)) + intBitsToFloat(PV1iy));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(uf_uniformRegisterVS[14].y)) + intBitsToFloat(PV1iz));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(uf_uniformRegisterVS[14].x)) + intBitsToFloat(PV1iw));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_uniformRegisterVS[13].w)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_uniformRegisterVS[13].z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_uniformRegisterVS[13].y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_uniformRegisterVS[13].x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R123i.w)));
// 4
backupReg0i = R127i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(uf_uniformRegisterVS[15].w)) + intBitsToFloat(PV1ix));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(uf_uniformRegisterVS[15].z)) + intBitsToFloat(PV1iy));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(uf_uniformRegisterVS[15].y)) + intBitsToFloat(PV1iz));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(uf_uniformRegisterVS[15].x)) + intBitsToFloat(PV1iw));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(backupReg0i)));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R126i.x)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R127i.y)));
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R123i.w)) + intBitsToFloat(R127i.w));
// 6
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R127i.z)) + intBitsToFloat(R126i.z));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R125i.y)) + intBitsToFloat(PV1iy));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R127i.x)) + intBitsToFloat(PV1ix));
}
activeMaskStack[2] = activeMaskStack[2] == false;
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
PS0i = int(intBitsToFloat(R1i.y));
// 1
R0i.w = PS0i << int(1);
R0i.z = int(intBitsToFloat(R1i.x));
// 2
predResult = (R0i.y == 0xd);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_uniformRegisterVS[6].y));
// 1
PV1iz = floatBitsToInt(intBitsToFloat(uf_uniformRegisterVS[1].w) * intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(intBitsToFloat(uf_uniformRegisterVS[1].z) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_uniformRegisterVS[6].x));
// 2
R127i.x = PV1iz;
R127i.y = PV1iw;
R127i.z = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(uf_uniformRegisterVS[1].x));
R127i.w = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(uf_uniformRegisterVS[1].y));
// 3
PV1iz = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
PV1iw = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
// 4
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(PV1iz));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.w)) + intBitsToFloat(PV1iw));
// 5
backupReg0i = R127i.z;
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(PV0ix)) + intBitsToFloat(R127i.y));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(PV0iy)) + intBitsToFloat(backupReg0i));
// 6
R127i.x = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R126i.y = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_uniformRegisterVS[12].w)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_uniformRegisterVS[12].z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_uniformRegisterVS[12].y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_uniformRegisterVS[12].x)));
// 8
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(uf_uniformRegisterVS[14].w)) + intBitsToFloat(PV1ix));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(uf_uniformRegisterVS[14].z)) + intBitsToFloat(PV1iy));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(uf_uniformRegisterVS[14].y)) + intBitsToFloat(PV1iz));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(uf_uniformRegisterVS[14].x)) + intBitsToFloat(PV1iw));
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_uniformRegisterVS[13].w)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_uniformRegisterVS[13].z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_uniformRegisterVS[13].y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_uniformRegisterVS[13].x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R123i.w)));
// 10
backupReg0i = R127i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(uf_uniformRegisterVS[15].w)) + intBitsToFloat(PV1ix));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(uf_uniformRegisterVS[15].z)) + intBitsToFloat(PV1iy));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(uf_uniformRegisterVS[15].y)) + intBitsToFloat(PV1iz));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(uf_uniformRegisterVS[15].x)) + intBitsToFloat(PV1iw));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R126i.z)));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R126i.x)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R127i.y)));
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R123i.w)) + intBitsToFloat(R127i.w));
// 12
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R127i.z)) + intBitsToFloat(R126i.z));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R125i.y)) + intBitsToFloat(PV1iy));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R127i.x)) + intBitsToFloat(PV1ix));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
PV0iy = R0i.w + R0i.z;
// 1
R127i.x = floatBitsToInt(float(PV0iy));
// 2
tempResultf = intBitsToFloat(R127i.x);
tempResultf = floor(tempResultf);
tempResultf = clamp(tempResultf, -256.0, 255.0);
ARi.x = int(tempResultf);
PV0ix = floatBitsToInt(tempResultf);
// 3
R0i.x = uf_uniformRegisterVS[ARi.x+12].x;
R0i.y = uf_uniformRegisterVS[ARi.x+12].y;
R0i.z = uf_uniformRegisterVS[ARi.x+12].z;
R0i.w = uf_uniformRegisterVS[ARi.x+12].w;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_uniformRegisterVS[0].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_uniformRegisterVS[0].y)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_uniformRegisterVS[0].z)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_uniformRegisterVS[0].w)));
}
// export
SET_POSITION(vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.z), intBitsToFloat(R5i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
}
