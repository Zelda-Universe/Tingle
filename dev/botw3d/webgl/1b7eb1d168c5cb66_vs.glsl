#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 1b7eb1d168c5cb66
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[43];
TEXTURE_LAYOUT(45, 0, 0) uniform sampler2D textureUnitVS13;
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
out vec4 passParameterSem2;
out vec4 passParameterSem3;
out vec4 passParameterSem7;
out vec4 passParameterSem8;
out vec4 passParameterSem11;
out vec4 passParameterSem14;
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
R7i.z = floatBitsToInt(-(intBitsToFloat(R7i.y)) + 1.0);
R3i.w = 0;
R7i.w = floatBitsToInt(1.0);
// 1
R4i.w = floatBitsToInt(-(intBitsToFloat(R2i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R2i.w = floatBitsToInt(-(intBitsToFloat(R7i.x)) + 1.0);
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
R10i.x = 0;
R10i.y = 0;
R10i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R11i.x = 0;
// 1
R11i.w = R7i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R11i.w = R3i.w;
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
PS0i = int(intBitsToFloat(R1i.w));
// 1
R12i.x = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R4i.w) >= intBitsToFloat(R12i.x));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R10i.x = 0;
R10i.y = 0;
R10i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R11i.x = 0;
// 1
R3i.w = R7i.w;
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
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].x), intBitsToFloat(R127i.y)));
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].x), intBitsToFloat(R127i.y)));
// 2
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].x), intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R10i.x = 0;
// 1
R14i.x = R10i.x;
// 2
R13i.x = R10i.x;
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
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].y), intBitsToFloat(R127i.x)));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].y), intBitsToFloat(R127i.x)));
// 2
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R14i.y = 0;
R13i.y = 0;
// 1
R10i.y = 0;
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
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].z), intBitsToFloat(R127i.x)));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].z), intBitsToFloat(R127i.x)));
// 2
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R14i.z = 0;
R13i.z = 0;
// 1
R10i.z = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(uf_remappedVS[5].y)));
PV0iy = floatBitsToInt(max(intBitsToFloat(R5i.x), 0.0));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(uf_remappedVS[5].z)));
// 1
R6i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(R4i.w));
PV1iw = floatBitsToInt(min(intBitsToFloat(PV0iy), 0.0));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(uf_remappedVS[6].w)));
// 2
R0i.x = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV1iw));
// 3
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[5].x)));
// 4
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(uf_remappedVS[6].y)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[6].z)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R9i.z = ((intBitsToFloat(uf_remappedVS[7].x) == 1.0)?-1:0);
R1i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].x)) + 1.0);
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[8].z));
// 1
PV1ix = uf_remappedVS[9].x & 0x4;
R126i.y = uf_remappedVS[9].x & int(1);
R127i.z = uf_remappedVS[9].x & 0x2;
PV1iw = floatBitsToInt(intBitsToFloat(R4i.w) + intBitsToFloat(uf_remappedVS[10].z));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(R127i.y));
PS0i = floatBitsToInt(float(PV1ix));
// 3
backupReg0i = R126i.y;
R127i.x = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R126i.y = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(uf_remappedVS[10].x)) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(float(backupReg0i));
// 4
R126i.x = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x40c90fdb));
PS0i = floatBitsToInt(float(R127i.z));
// 5
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R123i.y = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iz)));
R127i.w = floatBitsToInt(intBitsToFloat(R126i.y) + -(intBitsToFloat(R127i.x)));
// 6
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(intBitsToFloat(R126i.x) + -(0.5));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[8].x)),intBitsToFloat(R126i.x)) + 1.0);
R126i.x = int(intBitsToFloat(PV1iw));
// 7
R124i.x = floatBitsToInt(max(intBitsToFloat(R123i.w), -(intBitsToFloat(R123i.w))));
R123i.y = ((intBitsToFloat(PV0iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
R123i.z = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iw = 0 - R126i.x;
R126i.w = int(intBitsToFloat(PV0iy));
// 8
PV0ix = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R126i.y = max(R126i.x, PV1iw);
PV0iz = 0 - R126i.w;
PV0iw = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
R127i.z = int(intBitsToFloat(R127i.w));
// 9
R126i.x = max(R126i.w, PV0iz);
PV1iy = 0 - R127i.z;
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[8].x)),intBitsToFloat(PV0ix)) + 1.0);
PS1i = floatBitsToInt(cos((intBitsToFloat(PV0iw))/0.1591549367));
// 10
R127i.x = max(R127i.z, PV1iy);
R127i.y = floatBitsToInt(max(intBitsToFloat(R123i.w), -(intBitsToFloat(R123i.w))));
PV0iz = floatBitsToInt(intBitsToFloat(PS1i) + 1.0);
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
R125i.x = floatBitsToInt(float(R126i.y));
// 11
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[8].x)),intBitsToFloat(PV0iz)) + 1.0);
R126i.y = floatBitsToInt(float(backupReg0i));
// 12
PS0i = floatBitsToInt(float(R127i.x));
// 13
R6i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R124i.x),intBitsToFloat(R127i.y),0.0)));
PV1iy = R6i.x;
PV1iz = R6i.x;
PV1iw = R6i.x;
// 14
predResult = (R9i.z != 0);
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
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].w), intBitsToFloat(PV0ix)));
// 2
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].x), intBitsToFloat(PV1iw)));
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].y), intBitsToFloat(PV1iw)));
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].z), intBitsToFloat(PV1iw)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
tempResultf = max(0.0, abs(intBitsToFloat(uf_remappedVS[7].x)));
tempResultf = log2(tempResultf);
PS0i = floatBitsToInt(tempResultf);
// 1
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f317218));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[7].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(PS1i)));
R127i.y = ((intBitsToFloat(uf_remappedVS[7].x) == 0.0)?(0xff7fffff):(PV1iz));
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
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].w), intBitsToFloat(PV1ix)));
// 9
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].x), intBitsToFloat(PV0iw)));
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].y), intBitsToFloat(PV0iw)));
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].z), intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = uf_remappedVS[12].y;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
PV0iy = uf_remappedVS[12].x;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R0i.w)));
R0i.w = 0x3f800000;
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[7].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
R0i.x = 0x3f800000;
PV1iy = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R1i.w));
// 2
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(PV1iz)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PV1iy)));
PV0iz = floatBitsToInt(intBitsToFloat(R5i.y) + 1.0);
PV0iw = floatBitsToInt(intBitsToFloat(R5i.x) + 1.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iw)));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(R5i.z) + 1.0);
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedVS[13].x)));
PV1iz = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(uf_remappedVS[13].x)));
PS1i = ((intBitsToFloat(R4i.w) == 0.0)?-1:0);
// 4
backupReg0i = R127i.y;
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(uf_remappedVS[13].x)));
R127i.y = ((PS1i == 0)?(R4i.w):(0x3f800000));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.x), intBitsToFloat(uf_remappedVS[14].w)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(backupReg0i));
R7i.w = floatBitsToInt(1.0);
// 5
R123i.x = ((R9i.z == 0)?(PV0iw):(R6i.z));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R10i.y)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 6
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R10i.z)) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(backupReg0i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(backupReg0i)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(backupReg0i)));
R2i.y = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS1i));
R2i.y = clampFI32(R2i.y);
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R15i.x) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(intBitsToFloat(R15i.z) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(intBitsToFloat(R15i.y) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R13i.z)));
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R10i.x)) + intBitsToFloat(R123i.x));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1ix)));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R13i.y)) + intBitsToFloat(PV1iw));
// 9
R1i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV0iw));
R1i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV0ix));
R1i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0iz));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R14i.z)));
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R13i.x)) + intBitsToFloat(R122i.x));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(PV1iw),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R16i.z = tempi.x;
PV0iw = tempi.x;
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[15].x),intBitsToFloat(uf_remappedVS[15].y),intBitsToFloat(uf_remappedVS[15].z),intBitsToFloat(uf_remappedVS[15].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R1i.w = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),intBitsToFloat(uf_remappedVS[16].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R6i.w = tempi.x;
// 2
R2i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.x))));
PV0iy = R2i.x;
PV0iz = R2i.x;
PV0iw = R2i.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.x))));
PV1ix = tempi.x;
R3i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.z = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(R4i.y));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[17].x),intBitsToFloat(uf_remappedVS[17].y),intBitsToFloat(uf_remappedVS[17].z),intBitsToFloat(uf_remappedVS[17].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R0i.w = tempi.x;
PS0i = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R3i.w));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(R14i.z),intBitsToFloat(PV0ix)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.x))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R2i.z = tempi.x;
PV1iw = tempi.x;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PS0i));
// 6
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R9i.x));
// 7
R3i.z = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R127i.x));
// 8
predResult = (intBitsToFloat(uf_remappedVS[18].y) != 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = uf_remappedVS[16].w;
PV0iz = uf_remappedVS[15].w;
// 1
R127i.x = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(R2i.x)));
R127i.y = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(R3i.y)));
PV1iw = uf_remappedVS[17].w;
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[18].y));
// 2
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(R2i.z)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(R127i.z));
PV1ix = clampFI32(PV1ix);
// 6
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV1ix)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = ((intBitsToFloat(R5i.x) > 0.5)?-1:0);
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[15].w) + intBitsToFloat(uf_remappedVS[16].w));
R1i.z = 0;
PV0iw = ((intBitsToFloat(R5i.z) > 0.5)?-1:0);
R127i.x = ((intBitsToFloat(R5i.y) > 0.5)?-1:0);
// 1
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(uf_remappedVS[19].z)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(uf_remappedVS[19].w)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[14].z), intBitsToFloat(uf_remappedVS[19].w)));
R0i.w = ((PV0ix == 0)?(R7i.x):(R2i.w));
R0i.z = ((PV0iw == 0)?(R7i.x):(R2i.w));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[17].w) + intBitsToFloat(R127i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(PV1iz)));
PV0iz = ((intBitsToFloat(R5i.w) > 0.5)?-1:0);
R1i.w = ((R127i.x == 0)?(R7i.y):(R7i.z));
R3i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].x) * 1.0);
// 3
R0i.y = ((PV0iz == 0)?(R7i.y):(R7i.z));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), intBitsToFloat(uf_remappedVS[14].x)));
R127i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3dd70a3d));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R126i.y));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[14].y), intBitsToFloat(uf_remappedVS[19].z)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R127i.y));
// 5
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0ix));
// 6
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
// 7
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
// 8
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 9
R127i.y = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R127i.w = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 10
PS0i = floatBitsToInt(sin((intBitsToFloat(R127i.w))/0.1591549367));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R126i.x)));
PS1i = floatBitsToInt(cos((intBitsToFloat(R127i.w))/0.1591549367));
// 12
R1i.x = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(PV1ix));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(sin((intBitsToFloat(R127i.y))/0.1591549367));
// 13
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R127i.x)));
R4i.z = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(PV0iy));
// 14
R3i.y = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(PV1iz));
}
if( activeMaskStackC[3] == true ) {
// 0
R10i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R3i.y),intBitsToFloat(R4i.z),intBitsToFloat(R7i.w)),vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w))));
PV0iy = R10i.x;
PV0iz = R10i.x;
PV0iw = R10i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R3i.y),intBitsToFloat(R4i.z),intBitsToFloat(R7i.w)),vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w))));
PV1ix = tempi.x;
R10i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R3i.y),intBitsToFloat(R4i.z),intBitsToFloat(R7i.w)),vec4(intBitsToFloat(uf_remappedVS[22].x),intBitsToFloat(uf_remappedVS[22].y),intBitsToFloat(uf_remappedVS[22].z),intBitsToFloat(uf_remappedVS[22].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R10i.z = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R3i.y),intBitsToFloat(R4i.z),intBitsToFloat(R7i.w)),vec4(intBitsToFloat(uf_remappedVS[23].x),intBitsToFloat(uf_remappedVS[23].y),intBitsToFloat(uf_remappedVS[23].z),intBitsToFloat(uf_remappedVS[23].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R10i.w = tempi.x;
// 4
R127i.x = uf_remappedVS[9].x & 0x80000;
PV0iy = PV1ix;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
PV0iw = uf_remappedVS[9].y & int(1);
// 5
R126i.x = floatBitsToInt(intBitsToFloat(R10i.z) * 0.0 + intBitsToFloat(PV0iy));
R127i.y = uf_remappedVS[9].x & 0x200000;
PV1iz = (int(1) != PV0iw)?-1:0;
R13i.w = floatBitsToInt(intBitsToFloat(R10i.z) * 0.0 + intBitsToFloat(R10i.w));
R13i.z = floatBitsToInt(intBitsToFloat(R10i.z) * 0.5 + intBitsToFloat(PV0iy));
// 6
R123i.x = ((PV1iz == 0)?(0):(int(1)));
R13i.y = floatBitsToInt(intBitsToFloat(R10i.y) * -(0.5) + intBitsToFloat(R126i.x));
R127i.z = (R127i.x == 0x80000)?-1:0;
R127i.w = uf_remappedVS[9].x & 0x100000;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R13i.w));
// 7
backupReg0i = R127i.y;
PV1ix = (R123i.x == 0x2)?-1:0;
R127i.y = (R123i.x == int(1))?-1:0;
R126i.z = (backupReg0i == 0x200000)?-1:0;
PV1iw = floatBitsToInt(intBitsToFloat(R13i.y) * intBitsToFloat(PS0i));
R127i.x = uf_remappedVS[9].x & 0x400000;
// 8
R123i.x = ((PV1ix == 0)?(R5i.z):(R5i.y));
PV0iy = floatBitsToInt(-(intBitsToFloat(PV1iw)) + 1.0);
R123i.z = ((PV1ix == 0)?(R5i.x):(R5i.z));
R123i.w = ((PV1ix == 0)?(R5i.y):(R5i.x));
R0i.w = ((R127i.z == 0)?(R7i.x):(R0i.w));
// 9
backupReg0i = R123i.x;
backupReg1i = R0i.z;
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3f333333) + intBitsToFloat(0x3e19999a));
R123i.x = clampFI32(R123i.x);
R1i.y = ((R127i.y == 0)?(backupReg0i):(R5i.x));
R0i.z = ((R127i.y == 0)?(R123i.w):(R5i.z));
R2i.w = ((R127i.y == 0)?(R123i.z):(R5i.y));
R2i.y = ((R126i.z == 0)?(R7i.x):(backupReg1i));
// 10
R0i.x = ((R127i.y == 0)?(R5i.x):(R5i.y));
PV0iy = (R127i.w == 0x100000)?-1:0;
PV0iz = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
PV0iw = (R127i.x == 0x400000)?-1:0;
R3i.w = ((R127i.y == 0)?(R5i.y):(R5i.z));
// 11
R7i.x = ((PV0iw == 0)?(R7i.y):(R0i.y));
R2i.z = ((PV0iy == 0)?(R7i.y):(R1i.w));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + 8.5);
R13i.x = floatBitsToInt(intBitsToFloat(R10i.x) * 0.5 + intBitsToFloat(R126i.x));
// 12
backupReg0i = R1i.x;
R1i.x = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3daaaaab));
R17i.y = floatBitsToInt(intBitsToFloat(R3i.y) + -(intBitsToFloat(uf_remappedVS[24].y)));
R17i.z = floatBitsToInt(intBitsToFloat(R4i.z) + -(intBitsToFloat(uf_remappedVS[24].z)));
R17i.x = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(uf_remappedVS[24].x)));
}
if( activeMaskStackC[3] == true ) {
R14i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.z))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(uf_remappedVS[25].x)));
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) * 2.0);
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(uf_remappedVS[25].y)));
R124i.y = floatBitsToInt(intBitsToFloat(R124i.y) * 2.0);
PS0i = int(intBitsToFloat(uf_remappedVS[26].z));
// 1
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[27].y) + intBitsToFloat(uf_remappedVS[27].z));
R126i.x = floatBitsToInt(float(PS0i));
// 2
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(uf_remappedVS[27].z)) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt((0.0 >= abs(intBitsToFloat(R126i.x)))?1.0:0.0);
PV0iw = floatBitsToInt(-(abs(intBitsToFloat(R126i.x))) + 0.0);
PS0i = int(intBitsToFloat(uf_remappedVS[28].z));
// 3
R126i.y = ((intBitsToFloat(PV0iz) == 0.0)?(0):(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[29].y) + intBitsToFloat(uf_remappedVS[29].z));
R125i.y = floatBitsToInt(float(PS0i));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[27].x)) + intBitsToFloat(R127i.y));
PV0iy = floatBitsToInt(-(abs(intBitsToFloat(R125i.y))) + 0.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[29].z),intBitsToFloat(R1i.y)) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt((0.0 >= abs(intBitsToFloat(R125i.y)))?1.0:0.0);
PS0i = floatBitsToInt(abs(intBitsToFloat(R126i.x)) + intBitsToFloat(R126i.y));
// 5
R123i.x = floatBitsToInt(-(intBitsToFloat(R123i.x)) * intBitsToFloat(0x3e22f983) + 0.5);
R126i.y = ((-(intBitsToFloat(R126i.y)) > 0.0)?(PS0i):(R126i.y));
R126i.z = ((intBitsToFloat(PV0iw) == 0.0)?(0):(PV0iy));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[29].x)) + intBitsToFloat(R123i.z));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 6
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(-(intBitsToFloat(R123i.w)) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iy = floatBitsToInt(abs(intBitsToFloat(R125i.y)) + intBitsToFloat(R126i.z));
PV0iz = floatBitsToInt(fract(intBitsToFloat(backupReg0i)));
R127i.w = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R125i.y));
// 7
backupReg0i = R123i.x;
R123i.x = ((-(intBitsToFloat(R126i.z)) > 0.0)?(PV0iy):(R126i.z));
R127i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R126i.z = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
PV1iw = floatBitsToInt(fract(intBitsToFloat(backupReg0i)));
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[26].z));
// 8
backupReg0i = R125i.y;
R126i.x = ((intBitsToFloat(R126i.x) == 0.0)?(0):(R126i.y));
R125i.y = floatBitsToInt(trunc(intBitsToFloat(R127i.w)));
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R126i.w = ((intBitsToFloat(backupReg0i) == 0.0)?(0):(R123i.x));
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[28].z));
// 9
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(0x3e22f983));
R1i.y = floatBitsToInt(trunc(intBitsToFloat(R126i.z)));
R125i.z = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[26].x), intBitsToFloat(backupReg0i)));
R126i.z = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[26].w));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[30].w) + intBitsToFloat(uf_remappedVS[25].y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R124i.w)) + -(0.5));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[30].z) + intBitsToFloat(uf_remappedVS[25].x));
R0i.y = int(intBitsToFloat(R126i.x));
// 11
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[28].x), intBitsToFloat(R126i.y)));
R127i.z = floatBitsToInt(-(intBitsToFloat(R125i.x)) + intBitsToFloat(PV0iw));
R125i.w = floatBitsToInt(-(intBitsToFloat(R124i.y)) + intBitsToFloat(PV0ix));
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[28].w));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[31].z) + intBitsToFloat(uf_remappedVS[32].x));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].x), intBitsToFloat(R2i.w)));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].y), intBitsToFloat(R0i.z)));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[31].w) + intBitsToFloat(uf_remappedVS[32].y));
R126i.y = int(intBitsToFloat(R125i.y));
// 13
R125i.x = floatBitsToInt(-(intBitsToFloat(PV0iz)) + intBitsToFloat(PV0iw));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[26].y), intBitsToFloat(R126i.z)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[28].y), intBitsToFloat(R127i.w)));
R127i.w = floatBitsToInt(-(intBitsToFloat(PV0iy)) + intBitsToFloat(PV0ix));
R2i.w = floatBitsToInt(sin((intBitsToFloat(R127i.x))/0.1591549367));
// 14
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[33].x) + intBitsToFloat(uf_remappedVS[33].z));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R1i.x)) + -(0.5));
R126i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[33].y) + intBitsToFloat(uf_remappedVS[33].w));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R124i.y)) + -(0.5));
R124i.z = floatBitsToInt(cos((intBitsToFloat(backupReg0i))/0.1591549367));
// 15
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R127i.y)));
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[34].x) + intBitsToFloat(uf_remappedVS[34].z));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R127i.y)));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[34].y) + intBitsToFloat(uf_remappedVS[34].w));
R0i.z = int(intBitsToFloat(R126i.w));
// 16
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[34].z),intBitsToFloat(R0i.x)) + intBitsToFloat(PV1iy));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(uf_remappedVS[33].w)) + intBitsToFloat(R126i.z));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[34].w),intBitsToFloat(R3i.w)) + intBitsToFloat(PV1iw));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(uf_remappedVS[33].z)) + intBitsToFloat(R127i.x));
R5i.z = int(intBitsToFloat(R1i.y));
// 17
backupReg0i = R127i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[30].y)) + intBitsToFloat(R125i.w));
R1i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.w)),intBitsToFloat(uf_remappedVS[31].x)) + -(intBitsToFloat(R127i.w)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[31].y)) + intBitsToFloat(R125i.x));
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.w)),intBitsToFloat(uf_remappedVS[30].x)) + -(intBitsToFloat(backupReg0i)));
R125i.x = floatBitsToInt(sin((intBitsToFloat(R125i.z))/0.1591549367));
// 18
backupReg0i = R7i.x;
backupReg1i = R125i.z;
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R125i.y)));
R2i.y = uf_remappedVS[35].x;
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R1i.z)) + -(0.5));
R3i.w = uf_remappedVS[35].y;
R125i.w = floatBitsToInt(cos((intBitsToFloat(backupReg1i))/0.1591549367));
// 19
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R125i.y)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R0i.w)) + intBitsToFloat(R2i.z));
R2i.z = uf_remappedVS[35].z;
R5i.w = uf_remappedVS[36].x;
PS1i = floatBitsToInt(float(R0i.y));
// 20
R0i.x = uf_remappedVS[36].y;
R7i.y = uf_remappedVS[36].z;
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(PS1i)) + intBitsToFloat(R127i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.x)),intBitsToFloat(R125i.z)) + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(float(R126i.y));
// 21
backupReg0i = R126i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[25].w)) + intBitsToFloat(R127i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[25].z)) + intBitsToFloat(R126i.w));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[32].z)) + intBitsToFloat(R126i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.y)),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(uf_remappedVS[32].w)) + intBitsToFloat(backupReg0i));
// 22
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(R125i.y)) + -(intBitsToFloat(R123i.w)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R125i.z)) + intBitsToFloat(R7i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.w)),intBitsToFloat(R0i.w)) + intBitsToFloat(backupReg0i));
R0i.w = uf_remappedVS[37].x;
R7i.x = uf_remappedVS[38].x;
// 23
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R123i.z)) + intBitsToFloat(R124i.z));
PS1i = floatBitsToInt(float(R0i.z));
// 24
R15i.x = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
R15i.y = floatBitsToInt(intBitsToFloat(R124i.x) + 0.5);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(PS1i)) + intBitsToFloat(R1i.y));
PS0i = floatBitsToInt(float(R5i.z));
// 25
R1i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.z)),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.z));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.w));
}
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R0i.y;
backupReg1i = R1i.x;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(uf_remappedVS[39].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(uf_remappedVS[39].y)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(uf_remappedVS[39].z)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R5i.y)) + -(intBitsToFloat(backupReg1i)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[39].w)));
// 1
backupReg0i = R0i.x;
backupReg1i = R1i.y;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(uf_remappedVS[40].x)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[40].y)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(uf_remappedVS[40].z)));
R9i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(uf_remappedVS[40].w)));
R15i.z = floatBitsToInt(intBitsToFloat(backupReg1i) + 0.5);
// 2
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(uf_remappedVS[41].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[41].x)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[41].x)));
R15i.w = floatBitsToInt(intBitsToFloat(R127i.w) + 0.5);
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[41].x), intBitsToFloat(backupReg0i)));
// 3
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[41].x), intBitsToFloat(R1i.y)));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[41].x), intBitsToFloat(R1i.z)));
}
if( activeMaskStackC[3] == true ) {
// 0
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R3i.z)) + 0.0);
R11i.y = uf_remappedVS[42].x;
// 1
R18i.x = R8i.x;
R18i.y = R8i.y;
R18i.z = R8i.z;
R18i.w = R8i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w));
// export
passParameterSem2 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.z));
}
