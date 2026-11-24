#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 9ff0de51cfff6c9b
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
UNIFORM_BUFFER_LAYOUT(6, 0, 0) uniform uniformBlockVS6
{
vec4 uf_blockVS6[19];
};


UNIFORM_BUFFER_LAYOUT(7, 0, 1) uniform uniformBlockVS7
{
vec4 uf_blockVS7[4096];
};


UNIFORM_BUFFER_LAYOUT(8, 0, 2) uniform uniformBlockVS8
{
vec4 uf_blockVS8[4];
};


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
out vec4 passParameterSem7;
out vec4 passParameterSem8;
out vec4 passParameterSem10;
out vec4 passParameterSem11;
out vec4 passParameterSem13;
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
attrDecoder = attrDataSem12;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R12i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem14;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R14i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem13;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R13i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
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
R6i.z = floatBitsToInt(-(intBitsToFloat(R13i.y)) + 1.0);
R4i.w = 0;
R5i.w = floatBitsToInt(1.0);
// 1
R7i.w = floatBitsToInt(-(intBitsToFloat(R7i.w)) + uf_blockVS8[2].x);
R8i.w = floatBitsToInt(-(intBitsToFloat(R13i.x)) + 1.0);
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
R15i.x = 0;
R15i.y = 0;
R15i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R7i.x = 0;
// 1
R9i.w = R5i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R9i.w = R4i.w;
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
R15i.x = 0;
R15i.y = 0;
R15i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R7i.x = 0;
// 1
R4i.w = R5i.w;
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
R17i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R127i.y)));
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R127i.y)));
// 2
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R17i.x = 0;
// 1
R15i.x = R17i.x;
// 2
R16i.x = R17i.x;
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
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R127i.x)));
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R127i.x)));
// 2
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R15i.y = 0;
R16i.y = 0;
// 1
R17i.y = 0;
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
R17i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R127i.x)));
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R127i.x)));
// 2
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R15i.z = 0;
R16i.z = 0;
// 1
R17i.z = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt((0.0 > uf_blockVS7[9].x)?1.0:0.0);
PV0iy = floatBitsToInt((uf_blockVS7[9].x > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt(max(intBitsToFloat(R10i.x), 0.0));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), uf_blockVS7[10].y));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[9].x);
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R7i.w) * intBitsToFloat(PS0i));
R127i.y = floatBitsToInt(-(uf_blockVS7[96].x) + uf_blockVS7[97].x);
R127i.z = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(min(intBitsToFloat(PV0iz), 0.0));
R6i.y = floatBitsToInt(1.0 / intBitsToFloat(R6i.x));
// 2
R0i.x = floatBitsToInt(intBitsToFloat(R11i.x) + intBitsToFloat(PV1iw));
PV0iy = floatBitsToInt(intBitsToFloat(R7i.w) * intBitsToFloat(R6i.y));
PV0iz = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1ix));
PV0iw = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R126i.y = floatBitsToInt(-(uf_blockVS7[96].y) + uf_blockVS7[97].y);
// 3
PV1ix = floatBitsToInt(fract(intBitsToFloat(PV0iz)));
R125i.y = floatBitsToInt(-(uf_blockVS7[96].z) + uf_blockVS7[97].z);
R126i.z = floatBitsToInt(-(uf_blockVS7[96].w) + uf_blockVS7[97].w);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(PV0iw)));
R0i.w = 0x3f800000;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R6i.w = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV1ix)));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R9i.w = tempi.x;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PS0i));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R11i.w = tempi.x;
R127i.z = floatBitsToInt(intBitsToFloat(R127i.x) + -(uf_blockVS7[96].w));
// 7
backupReg0i = R127i.x;
R127i.x = ((intBitsToFloat(R127i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R124i.y = floatBitsToInt(intBitsToFloat(R10i.x) + intBitsToFloat(R10i.y));
PV1iz = floatBitsToInt(intBitsToFloat(backupReg0i) + -(uf_blockVS7[97].w));
R126i.w = floatBitsToInt(intBitsToFloat(R10i.y) + intBitsToFloat(R10i.z));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.z));
// 8
PV0ix = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(PS1i));
R127i.w = ((intBitsToFloat(PV1iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.y = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0ix)));
R126i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[97].x, intBitsToFloat(R127i.w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
R125i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[97].y, intBitsToFloat(R127i.w)));
// 10
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
R127i.y = floatBitsToInt(uf_blockVS7[96].z + intBitsToFloat(PV1ix));
R127i.z = floatBitsToInt(uf_blockVS7[96].x + intBitsToFloat(PV1iw));
R125i.w = floatBitsToInt(uf_blockVS7[96].y + intBitsToFloat(PV1iy));
R126i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].x, intBitsToFloat(R126i.y)));
// 11
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].y, intBitsToFloat(R126i.y)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0ix)));
R125i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[97].z, intBitsToFloat(R127i.w)));
R127i.w = floatBitsToInt(intBitsToFloat(R124i.y) * 0.5);
R124i.y = floatBitsToInt(intBitsToFloat(R126i.w) * 0.5);
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].z, intBitsToFloat(R126i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV1iy)));
PS0i = floatBitsToInt(intBitsToFloat(R10i.x) + intBitsToFloat(R10i.z));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(R127i.x));
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R126i.x));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(intBitsToFloat(PS0i) * 0.5);
R127i.z = floatBitsToInt(intBitsToFloat(R127i.w) + -(0.5));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 2.0);
// 14
backupReg0i = R126i.z;
PV0ix = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV1iz));
PV0iy = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(PV1ix));
R126i.z = floatBitsToInt(intBitsToFloat(R124i.y) + -(0.5));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) * 2.0);
PV0iw = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV1iy));
R125i.x = floatBitsToInt(intBitsToFloat(PV1iw) + -(0.5));
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) * 2.0);
// 15
backupReg0i = R11i.y;
R2i.x = floatBitsToInt(intBitsToFloat(R10i.x) + -(0.5));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), intBitsToFloat(PV0ix)));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV0iw)));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iy)));
R3i.z = floatBitsToInt(intBitsToFloat(R10i.y) + -(0.5));
// 16
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), uf_blockVS7[115].x));
R4i.y = floatBitsToInt(intBitsToFloat(R10i.z) + -(0.5));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), uf_blockVS7[115].y));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), uf_blockVS7[115].z));
PS0i = R10i.y;
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 17
R1i.x = floatBitsToInt(uf_blockVS7[114].z + intBitsToFloat(PV0iw));
R3i.y = floatBitsToInt(uf_blockVS7[114].y + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(floor(intBitsToFloat(PS0i)));
R4i.w = floatBitsToInt(intBitsToFloat(PV0ix) + uf_blockVS7[114].x);
R127i.z = R10i.z;
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 2.0);
// 18
R125i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x40000;
R124i.y = floatBitsToInt(uf_blockVS7[5].x) & 0x20000;
PV0iz = floatBitsToInt(uf_blockVS7[5].x) & 0x10000;
PV0iw = floatBitsToInt((intBitsToFloat(PV1iz) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt((0.0 > intBitsToFloat(PV1iz))?1.0:0.0);
// 19
PV1iy = floatBitsToInt(floor(intBitsToFloat(R127i.z)));
R1i.w = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(float(PV0iz));
// 20
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt((intBitsToFloat(PV1iy) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PV1iy))?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PS0i = floatBitsToInt(float(R124i.y));
// 21
R4i.x = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(float(R125i.x));
// 22
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iy)));
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R124i.y = int(intBitsToFloat(PV1iz));
// 23
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0ix)));
PV1iy = 0 - R124i.y;
R11i.x = int(intBitsToFloat(PV0iy));
// 24
R3i.x = 0 - R11i.x;
R2i.w = max(R124i.y, PV1iy);
R0i.w = int(intBitsToFloat(PV1ix));
}
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R3i.x;
backupReg1i = R11i.y;
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), uf_blockVS8[3].y));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), uf_blockVS8[3].z));
PV0iz = max(R11i.x, backupReg0i);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), uf_blockVS8[3].w));
PS0i = floatBitsToInt(float(R2i.w));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(R1i.w)));
PV1iy = R10i.x;
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) * 2.0);
PV1iz = 0 - R0i.w;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(PV0iw)));
PS1i = floatBitsToInt(float(PV0iz));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 2
PV0ix = floatBitsToInt(floor(intBitsToFloat(PV1iy)));
PV0iy = max(R0i.w, PV1iz);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(PV1ix)));
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(R4i.x)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PV1ix)));
// 3
R127i.x = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PS0i));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PV0ix))?1.0:0.0);
R127i.z = floatBitsToInt(intBitsToFloat(R4i.w) + intBitsToFloat(PV0iz));
PV1iw = floatBitsToInt((intBitsToFloat(PV0ix) > 0.0)?1.0:0.0);
R125i.x = floatBitsToInt(float(PV0iy));
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) * 2.0);
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R127i.w)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iy)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R127i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), uf_blockVS7[113].x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), uf_blockVS7[113].y));
// 5
R126i.x = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0iw));
R127i.y = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.x)), intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(PV0ix));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), uf_blockVS7[113].z));
// 6
R127i.x = ((uf_blockVS7[114].w == 1.0)?-1:0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PV1iz)));
R126i.z = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R127i.w));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PV1iz)));
tempResultf = max(0.0, uf_blockVS7[114].w);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 7
R125i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(PV0iw));
R127i.w = floatBitsToInt(-(uf_blockVS7[114].w) + 1.0);
// 8
R124i.x = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R124i.y));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R12i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(R12i.z)));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(R12i.y)));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.y)),intBitsToFloat(R8i.z)) + intBitsToFloat(PV0iz));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.z)),intBitsToFloat(R8i.x)) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 10
backupReg0i = R123i.y;
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(PS1i));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.x)),intBitsToFloat(R8i.y)) + intBitsToFloat(PV1ix));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.w), intBitsToFloat(backupReg0i)));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.w), intBitsToFloat(R123i.z)));
// 11
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.w), intBitsToFloat(R123i.y)));
R123i.w = ((R127i.x == 0)?(PV0ix):(R7i.w));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R123i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R123i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R123i.w)));
// 13
PV1iy = floatBitsToInt(intBitsToFloat(R124i.x) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV0iz));
// 14
R123i.x = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.z = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
R3i.w = floatBitsToInt(intBitsToFloat(R126i.w) * 0.0 + 1.0);
// 15
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV1iw = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
// 16
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 17
R126i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R127i.y = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
R127i.w = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 18
R124i.x = floatBitsToInt(sin((intBitsToFloat(R127i.y))/0.1591549367));
// 19
R125i.w = floatBitsToInt(cos((intBitsToFloat(R127i.y))/0.1591549367));
// 20
R126i.z = floatBitsToInt(sin((intBitsToFloat(R127i.w))/0.1591549367));
// 21
R4i.x = floatBitsToInt(-(intBitsToFloat(R126i.z)));
R127i.y = floatBitsToInt(cos((intBitsToFloat(R127i.w))/0.1591549367));
// 22
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R127i.y)));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R127i.y)));
PS0i = floatBitsToInt(sin((intBitsToFloat(R126i.x))/0.1591549367));
// 23
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(PS0i)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PS0i)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R126i.w)));
PS1i = floatBitsToInt(cos((intBitsToFloat(backupReg0i))/0.1591549367));
// 24
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R126i.x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PS1i)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R127i.z)));
// 25
R2i.x = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PV0ix));
R3i.y = floatBitsToInt(-(intBitsToFloat(PV0iw)) + intBitsToFloat(PS0i));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV0iw)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R125i.z)));
// 26
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R126i.w)));
R5i.y = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV1iz));
R5i.z = floatBitsToInt(-(intBitsToFloat(R127i.z)) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R3i.y)));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R2i.w)) + intBitsToFloat(PS1i));
// 27
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R126i.w)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R2i.x)) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R5i.y)));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R4i.x)) + intBitsToFloat(R122i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z), intBitsToFloat(R5i.y)));
// 28
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z), intBitsToFloat(R3i.y)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R1i.y)) + intBitsToFloat(R123i.y));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z), intBitsToFloat(R125i.z)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R5i.z)) + intBitsToFloat(PV1iz));
// 29
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R3i.z)) + intBitsToFloat(R123i.w));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y),intBitsToFloat(R2i.x)) + intBitsToFloat(PV0ix));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y),intBitsToFloat(R2i.w)) + intBitsToFloat(PV0iz));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y),intBitsToFloat(R5i.z)) + intBitsToFloat(R127i.y));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R4i.y)));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(uf_blockVS7[13].y);
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
PV0iy = floatBitsToInt(uf_blockVS7[13].x);
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.x),intBitsToFloat(R3i.z)) + intBitsToFloat(R4i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.x),intBitsToFloat(R1i.y)) + intBitsToFloat(R8i.y));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.x),intBitsToFloat(R4i.x)) + intBitsToFloat(R8i.z));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R4i.y)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.z), intBitsToFloat(R126i.z)));
PV1iz = floatBitsToInt(intBitsToFloat(R9i.y) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(PV0iy));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.z), intBitsToFloat(R5i.w)));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(PV1iz)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R4i.y)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(R5i.z)) + intBitsToFloat(PV1ix));
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.x),intBitsToFloat(R8i.x)) + intBitsToFloat(PS1i));
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R5i.z)) + intBitsToFloat(R1i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R2i.w)) + intBitsToFloat(R0i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(R2i.x)) + intBitsToFloat(PV0iz));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R2i.x)) + intBitsToFloat(R5i.x));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(R2i.w)) + intBitsToFloat(R2i.y));
// 4
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R3i.z)) + intBitsToFloat(R123i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R1i.y)) + intBitsToFloat(R123i.w));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R4i.x)) + intBitsToFloat(R123i.y));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z),intBitsToFloat(R3i.z)) + intBitsToFloat(R126i.w));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z),intBitsToFloat(R1i.y)) + intBitsToFloat(R123i.z));
// 5
backupReg0i = R4i.x;
R4i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R17i.x),intBitsToFloat(R17i.y),intBitsToFloat(R17i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R125i.z),intBitsToFloat(R3i.w))));
PV1iy = R4i.x;
PV1iz = R4i.x;
PV1iw = R4i.x;
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z),intBitsToFloat(backupReg0i)) + intBitsToFloat(R125i.w));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R9i.w)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R125i.z),intBitsToFloat(R3i.w))));
PV0ix = tempi.x;
R4i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.x),intBitsToFloat(R127i.z)) + intBitsToFloat(R124i.y));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),intBitsToFloat(R15i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R125i.z),intBitsToFloat(R3i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R3i.z = tempi.x;
PV1iw = tempi.x;
R19i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.y),intBitsToFloat(R127i.w)) + intBitsToFloat(R122i.x));
// 8
R20i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(R124i.x));
R1i.y = floatBitsToInt(uf_blockVS7[68].x);
R125i.z = ((intBitsToFloat(R10i.x) > 0.5)?-1:0);
R0i.w = 0x3f800000;
PS0i = floatBitsToInt(float(floatBitsToInt(uf_blockVS7[6].x)));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R0i.y),intBitsToFloat(R5i.w),0.0)));
PV1ix = tempi.x;
R20i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(PS0i)));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),intBitsToFloat(R15i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R0i.y),intBitsToFloat(R5i.w),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R20i.z = tempi.x;
PV0iw = tempi.x;
PS0i = int(intBitsToFloat(PS1i));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.z),intBitsToFloat(R127i.w),intBitsToFloat(R126i.z),0.0)));
PV1ix = tempi.x;
R19i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R5i.w = PS0i + 0x3c;
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),intBitsToFloat(R15i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.z),intBitsToFloat(R127i.w),intBitsToFloat(R126i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R19i.z = tempi.x;
PV0iw = tempi.x;
R3i.y = floatBitsToInt(uf_blockVS7[76].x);
// 13
R21i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R17i.x),intBitsToFloat(R17i.y),intBitsToFloat(R17i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.w),intBitsToFloat(R126i.y),intBitsToFloat(R124i.z),0.0)));
PV1iy = R21i.x;
PV1iz = R21i.x;
PV1iw = R21i.x;
R8i.x = floatBitsToInt(uf_blockVS7[76].y);
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.w),intBitsToFloat(R126i.y),intBitsToFloat(R124i.z),0.0)));
PV0ix = tempi.x;
R21i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R11i.z = floatBitsToInt(uf_blockVS7[76].z);
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),intBitsToFloat(R15i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.w),intBitsToFloat(R126i.y),intBitsToFloat(R124i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R21i.z = tempi.x;
PV1iw = tempi.x;
R3i.w = floatBitsToInt(uf_blockVS7[84].x);
// 16
PV0ix = floatBitsToInt(uf_blockVS7[5].x) & 0x100000;
PV0iy = floatBitsToInt(uf_blockVS7[5].x) & 0x80000;
R125i.z = ((R125i.z == 0)?(R13i.x):(R8i.w));
PV0iw = ((intBitsToFloat(R10i.y) > 0.5)?-1:0);
PS0i = floatBitsToInt(uf_blockVS7[5].x) & 0x200000;
// 17
PV1ix = (PV0iy == 0x80000)?-1:0;
R123i.y = ((PV0iw == 0)?(R13i.y):(R6i.z));
R124i.z = (PS0i == 0x200000)?-1:0;
PV1iw = (PV0ix == 0x100000)?-1:0;
PS1i = ((intBitsToFloat(R10i.z) > 0.5)?-1:0);
// 18
R2i.x = ((PV1iw == 0)?(R13i.y):(R123i.y));
R11i.y = ((PV1ix == 0)?(R13i.x):(R125i.z));
R123i.z = ((PS1i == 0)?(R13i.x):(R8i.w));
PV0iw = floatBitsToInt(uf_blockVS7[5].x) & 0x400000;
// 19
R2i.y = (PV0iw == 0x400000)?-1:0;
R2i.w = ((R124i.z == 0)?(R13i.x):(R123i.z));
}
if( activeMaskStackC[3] == true ) {
R0i.xyz = floatBitsToInt(uf_blockVS7[R5i.w].xyz);
}
if( activeMaskStackC[3] == true ) {
// 0
R15i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R3i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS6[8].x,uf_blockVS6[8].y,uf_blockVS6[8].z,uf_blockVS6[8].w)));
PV0iy = R15i.x;
PV0iz = R15i.x;
PV0iw = R15i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R3i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS6[9].x,uf_blockVS6[9].y,uf_blockVS6[9].z,uf_blockVS6[9].w)));
PV1ix = tempi.x;
R15i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = ((intBitsToFloat(R10i.w) > 0.5)?-1:0);
// 2
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), uf_blockVS8[0].x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), uf_blockVS8[0].y));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), uf_blockVS8[0].z));
R123i.w = ((PS1i == 0)?(R13i.y):(R6i.z));
R17i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), uf_blockVS8[0].w));
// 3
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), uf_blockVS8[1].x));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), uf_blockVS8[1].y));
R9i.z = ((R2i.y == 0)?(R13i.y):(R123i.w));
R18i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), uf_blockVS8[1].w));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), uf_blockVS8[1].z));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R3i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS6[10].x,uf_blockVS6[10].y,uf_blockVS6[10].z,uf_blockVS6[10].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R15i.z = tempi.x;
PV0iw = tempi.x;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R3i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS6[11].x,uf_blockVS6[11].y,uf_blockVS6[11].z,uf_blockVS6[11].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R15i.w = tempi.x;
// 6
PV0iz = PV1ix;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
// 7
R16i.z = floatBitsToInt(intBitsToFloat(R15i.z) * 0.5 + intBitsToFloat(PV0iz));
R123i.w = floatBitsToInt(intBitsToFloat(R15i.z) * 0.0 + intBitsToFloat(PV0iz));
R16i.w = floatBitsToInt(intBitsToFloat(R15i.z) * 0.0 + intBitsToFloat(R15i.w));
// 8
R16i.x = floatBitsToInt(intBitsToFloat(R15i.x) * 0.5 + intBitsToFloat(R123i.w));
R16i.y = floatBitsToInt(intBitsToFloat(R15i.y) * -(0.5) + intBitsToFloat(R123i.w));
}
if( activeMaskStackC[3] == true ) {
// 0
R17i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), uf_blockVS7[59].x));
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), uf_blockVS7[59].x));
R17i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), uf_blockVS7[59].x));
PV0iw = floatBitsToInt(uf_blockVS7[5].y) & int(1);
R18i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R1i.x)));
// 1
R1i.x = (int(1) != PV0iw)?-1:0;
R18i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R1i.y)));
R18i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R1i.z)));
R127i.w = int(uf_blockVS7[17].x);
// 2
R124i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x20;
PV0iy = floatBitsToInt(uf_blockVS7[5].x) & 0x10;
R124i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x40;
R126i.w = floatBitsToInt(uf_blockVS7[5].x) & 0x80;
R125i.z = int(uf_blockVS7[17].y);
// 3
R124i.y = int(-1) + R127i.w;
PS1i = floatBitsToInt(float(PV0iy));
// 4
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(R124i.x));
// 5
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(float(R124i.z));
// 6
R125i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x2000000;
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R124i.x = int(intBitsToFloat(PV1iy));
// 7
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
PV1iw = 0 - R124i.x;
R126i.x = int(intBitsToFloat(PV0iy));
// 8
R124i.z = max(R124i.x, PV1iw);
PV0iw = 0 - R126i.x;
R124i.x = int(intBitsToFloat(PV1iy));
// 9
R0i.z = max(R126i.x, PV0iw);
PV1iw = 0 - R124i.x;
PS1i = floatBitsToInt(float(R126i.w));
// 10
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R11i.z = max(R124i.x, PV1iw);
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R127i.y = floatBitsToInt(float(R127i.w));
// 11
backupReg0i = R125i.z;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(R127i.y)));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0ix)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(R127i.y)));
R126i.y = floatBitsToInt(float(backupReg0i));
// 12
PV0iw = floatBitsToInt(intBitsToFloat(R6i.y) * intBitsToFloat(PV1ix));
R124i.x = int(intBitsToFloat(PV1iy));
// 13
PV1iw = 0 - R124i.x;
PS1i = int(intBitsToFloat(PV0iw));
// 14
R127i.z = max(R124i.x, PV1iw);
R125i.y = R124i.z * PS1i;
// 15
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.y));
// 16
PV0iw = floatBitsToInt(intBitsToFloat(R7i.w) * intBitsToFloat(PS1i));
R4i.x = floatBitsToInt(float(R127i.w));
// 17
R0i.w = floatBitsToInt(abs(intBitsToFloat(R4i.x)));
R126i.z = int(intBitsToFloat(PV0iw));
// 18
PS0i = floatBitsToInt(float(R126i.z));
// 19
PV1ix = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(PS0i));
R126i.w = floatBitsToInt(float(R126i.z));
// 20
R124i.z = floatBitsToInt(abs(intBitsToFloat(R126i.w)));
R123i.w = ((intBitsToFloat(PV1ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
R5i.z = floatBitsToInt(1.0 / abs(intBitsToFloat(R4i.x)));
// 21
PV1iy = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R126i.w)), intBitsToFloat(R5i.z)));
PS1i = int(intBitsToFloat(R123i.w));
// 22
PV0ix = floatBitsToInt(trunc(intBitsToFloat(PV1iy)));
R127i.y = int(1) - PS1i;
R3i.z = PS1i * R124i.y;
// 23
R124i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0ix)),intBitsToFloat(R0i.w)) + intBitsToFloat(R124i.z));
PS1i = floatBitsToInt(float(R125i.x));
// 24
PV0ix = floatBitsToInt(-(abs(intBitsToFloat(R4i.x))) + intBitsToFloat(R124i.y));
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(R124i.y) >= abs(intBitsToFloat(R4i.x)))?1.0:0.0);
R125i.w = int(intBitsToFloat(R125i.z));
// 25
backupReg0i = R127i.z;
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iy)));
R127i.z = ((intBitsToFloat(PV0iw) == 0.0)?(R124i.y):(PV0ix));
R125i.x = backupReg0i * R125i.w;
// 26
PV0iy = floatBitsToInt(abs(intBitsToFloat(R4i.x)) + intBitsToFloat(R127i.z));
R127i.w = int(intBitsToFloat(PV1ix));
// 27
R123i.x = ((-(intBitsToFloat(R127i.z)) > 0.0)?(PV0iy):(R127i.z));
PV1iz = 0 - R127i.w;
// 28
PV0iy = max(R127i.w, PV1iz);
R123i.w = ((-(intBitsToFloat(R126i.w)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.x)))):(R123i.x));
// 29
R123i.z = ((intBitsToFloat(R4i.x) == 0.0)?(R126i.w):(R123i.w));
PS1i = PV0iy * R125i.w;
// 30
R124i.y = R126i.z + PS1i;
PS0i = int(intBitsToFloat(R123i.z));
// 31
PS1i = R127i.y * PS0i;
// 32
PV0iy = PS1i + R3i.z;
R126i.w = R11i.z * R124i.y;
// 33
PS1i = R0i.z * PV0iy;
// 34
PV0ix = PS1i + R125i.y;
// 35
PV1iw = R126i.w + PV0ix;
// 36
PV0iz = R125i.x + PV1iw;
// 37
R4i.y = floatBitsToInt(float(PV0iz));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), abs(intBitsToFloat(R4i.y))));
R126i.z = floatBitsToInt(abs(intBitsToFloat(R4i.y)));
// 1
PV1iw = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
// 2
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iw)),intBitsToFloat(R0i.w)) + intBitsToFloat(R126i.z));
// 3
PV1ix = floatBitsToInt(-(abs(intBitsToFloat(R4i.x))) + intBitsToFloat(R125i.y));
PV1iw = floatBitsToInt((intBitsToFloat(R125i.y) >= abs(intBitsToFloat(R4i.x)))?1.0:0.0);
// 4
R126i.z = ((intBitsToFloat(PV1iw) == 0.0)?(R125i.y):(PV1ix));
// 5
PV1iy = floatBitsToInt(abs(intBitsToFloat(R4i.x)) + intBitsToFloat(R126i.z));
// 6
R123i.x = ((-(intBitsToFloat(R126i.z)) > 0.0)?(PV1iy):(R126i.z));
// 7
R123i.w = ((-(intBitsToFloat(R4i.y)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.x)))):(R123i.x));
// 8
R123i.z = ((intBitsToFloat(R4i.x) == 0.0)?(R4i.y):(R123i.w));
// 9
R125i.y = int(intBitsToFloat(R123i.z));
// 10
R125i.x = floatBitsToInt(float(R125i.y));
// 11
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(R125i.x))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(R125i.x) > 0.0)?1.0:0.0);
R125i.w = floatBitsToInt(float(R125i.y));
// 12
R124i.x = floatBitsToInt(abs(intBitsToFloat(R125i.w)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(abs(intBitsToFloat(R125i.w)) * 0.25);
// 13
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * 0.5 + intBitsToFloat(R125i.x));
PV1iy = floatBitsToInt(trunc(intBitsToFloat(PV0iz)));
// 14
PV0ix = floatBitsToInt(intBitsToFloat(R123i.x) * 0.25);
R13i.y = ((R1i.x == 0)?(R10i.x):(R10i.y));
R126i.w = floatBitsToInt(-(intBitsToFloat(PV1iy)) * 4.0 + intBitsToFloat(R124i.x));
// 15
PV1ix = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
PV1iy = floatBitsToInt((intBitsToFloat(R126i.w) >= 4.0)?1.0:0.0);
PV1iz = floatBitsToInt(intBitsToFloat(R126i.w) + -4.0);
R13i.x = int(uf_blockVS7[26].x);
// 16
R124i.x = ((intBitsToFloat(PV1iy) == 0.0)?(R126i.w):(PV1iz));
R126i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x100;
PS0i = int(intBitsToFloat(PV1ix));
// 17
R4i.x = PS0i + 0x12;
PV1iw = floatBitsToInt(intBitsToFloat(R124i.x) + 4.0);
R5i.w = int(uf_blockVS7[26].y);
// 18
R123i.z = ((-(intBitsToFloat(R124i.x)) > 0.0)?(PV1iw):(R124i.x));
PS0i = floatBitsToInt(float(R126i.z));
// 19
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R123i.y = ((-(intBitsToFloat(R125i.w)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.z)))):(R123i.z));
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
// 20
R127i.z = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iw)));
PS0i = int(intBitsToFloat(R123i.y));
// 21
R124i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x200;
R125i.y = 0xfffffffd + PS0i;
R126i.z = 0xfffffffe + PS0i;
PV1iw = int(-1) + PS0i;
PS1i = floatBitsToInt(float(PS0i));
// 22
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(PV1iw));
// 23
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PS1i = floatBitsToInt(float(R126i.z));
// 24
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iz)));
R125i.w = int(intBitsToFloat(PV1ix));
// 25
PV1ix = 0 - R125i.w;
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iy)));
R126i.z = int(intBitsToFloat(PV0iw));
// 26
PV0ix = 0 - R126i.z;
PV0iy = max(R125i.w, PV1ix);
R124i.y = int(intBitsToFloat(PV1iz));
// 27
PV1ix = max(R126i.z, PV0ix);
R3i.y = int(1) - PV0iy;
PV1iz = 0 - R124i.y;
PS1i = floatBitsToInt(float(R125i.y));
// 28
R8i.x = int(1) - PV1ix;
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = max(R124i.y, PV1iz);
R124i.y = int(intBitsToFloat(R127i.z));
// 29
PV1ix = 0 - R124i.y;
PV1iy = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iz)));
R5i.z = int(1) - PV0iw;
PS1i = floatBitsToInt(float(R124i.x));
// 30
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R3i.w = max(R124i.y, PV1ix);
R124i.x = int(intBitsToFloat(PV1iy));
// 31
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iy)));
PV1iw = 0 - R124i.x;
// 32
PV0iz = max(R124i.x, PV1iw);
R2i.y = int(intBitsToFloat(PV1iz));
// 33
R4i.y = int(1) - PV0iz;
}
if( activeMaskStackC[3] == true ) {
R0i.xyzw = floatBitsToInt(uf_blockVS7[R4i.x].xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = 0 - R2i.y;
R124i.y = floatBitsToInt(uf_blockVS7[5].x) & 0x800;
R126i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x400;
R126i.w = int(-1) + R13i.x;
R124i.x = R4i.y * R0i.w;
// 1
R1i.w = max(R2i.y, PV0ix);
R125i.w = R5i.z * R0i.z;
// 2
R127i.z = R8i.x * R0i.y;
// 3
PS1i = R3i.y * R0i.x;
// 4
PV0ix = R127i.z + PS1i;
PS0i = floatBitsToInt(float(R126i.z));
// 5
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iw = R125i.w + PV0ix;
PS1i = floatBitsToInt(float(R124i.y));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R5i.z = R124i.x + PV1iw;
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R127i.z = floatBitsToInt(float(R13i.x));
// 7
R124i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x4000000;
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(R127i.z)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iw)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y), intBitsToFloat(R127i.z)));
R124i.y = int(intBitsToFloat(PV0ix));
// 8
PV0ix = floatBitsToInt(intBitsToFloat(R6i.y) * intBitsToFloat(PV1iy));
PV0iy = 0 - R124i.y;
R125i.y = int(intBitsToFloat(PV1iz));
// 9
PV1ix = 0 - R125i.y;
R0i.w = max(R124i.y, PV0iy);
PS1i = int(intBitsToFloat(PV0ix));
// 10
R124i.w = max(R125i.y, PV1ix);
R126i.z = R3i.w * PS1i;
// 11
PS1i = floatBitsToInt(float(R5i.w));
// 12
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(R7i.w) * intBitsToFloat(PS0i));
R124i.y = floatBitsToInt(float(R13i.x));
// 14
R13i.x = floatBitsToInt(abs(intBitsToFloat(R124i.y)));
R5i.w = int(intBitsToFloat(PV1ix));
// 15
PS1i = floatBitsToInt(float(R5i.w));
// 16
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.z)) + intBitsToFloat(PS1i));
R125i.x = floatBitsToInt(float(R5i.w));
// 17
R123i.x = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.w = floatBitsToInt(abs(intBitsToFloat(R125i.x)));
R3i.w = floatBitsToInt(1.0 / abs(intBitsToFloat(R124i.y)));
// 18
PV0iz = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R125i.x)), intBitsToFloat(R3i.w)));
PS0i = int(intBitsToFloat(R123i.x));
// 19
R127i.x = int(1) - PS0i;
PV1iy = floatBitsToInt(trunc(intBitsToFloat(PV0iz)));
R126i.w = PS0i * R126i.w;
// 20
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iy)),intBitsToFloat(R13i.x)) + intBitsToFloat(R125i.w));
PS0i = floatBitsToInt(float(R124i.x));
// 21
PV1ix = floatBitsToInt((intBitsToFloat(R127i.z) >= abs(intBitsToFloat(R124i.y)))?1.0:0.0);
PV1iy = floatBitsToInt(-(abs(intBitsToFloat(R124i.y))) + intBitsToFloat(R127i.z));
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R126i.x = int(intBitsToFloat(R127i.w));
// 22
backupReg0i = R124i.w;
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
R124i.w = ((intBitsToFloat(PV1ix) == 0.0)?(R127i.z):(PV1iy));
R125i.y = backupReg0i * R126i.x;
// 23
PV1iz = floatBitsToInt(abs(intBitsToFloat(R124i.y)) + intBitsToFloat(R124i.w));
R124i.x = int(intBitsToFloat(PV0iy));
// 24
R123i.y = ((-(intBitsToFloat(R124i.w)) > 0.0)?(PV1iz):(R124i.w));
PV0iw = 0 - R124i.x;
// 25
R123i.x = ((-(intBitsToFloat(R125i.x)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.y)))):(R123i.y));
PV1iz = max(R124i.x, PV0iw);
// 26
R123i.w = ((intBitsToFloat(R124i.y) == 0.0)?(R125i.x):(R123i.x));
PS0i = PV1iz * R126i.x;
// 27
R127i.z = R5i.w + PS0i;
PS1i = int(intBitsToFloat(R123i.w));
// 28
PS0i = R127i.x * PS1i;
// 29
PV1iz = PS0i + R126i.w;
R127i.x = R0i.w * R127i.z;
// 30
PS0i = R1i.w * PV1iz;
// 31
PV1iy = PS0i + R126i.z;
// 32
PV0ix = R127i.x + PV1iy;
// 33
PV1iw = R125i.y + PV0ix;
// 34
R127i.z = floatBitsToInt(float(PV1iw));
// 35
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), abs(intBitsToFloat(R127i.z))));
R126i.w = floatBitsToInt(abs(intBitsToFloat(R127i.z)));
// 36
PV0ix = floatBitsToInt(trunc(intBitsToFloat(PV1iy)));
// 37
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0ix)),intBitsToFloat(R13i.x)) + intBitsToFloat(R126i.w));
// 38
PV0ix = floatBitsToInt((intBitsToFloat(R126i.z) >= abs(intBitsToFloat(R124i.y)))?1.0:0.0);
PV0iy = floatBitsToInt(-(abs(intBitsToFloat(R124i.y))) + intBitsToFloat(R126i.z));
// 39
R126i.w = ((intBitsToFloat(PV0ix) == 0.0)?(R126i.z):(PV0iy));
// 40
PV0iz = floatBitsToInt(abs(intBitsToFloat(R124i.y)) + intBitsToFloat(R126i.w));
// 41
R123i.y = ((-(intBitsToFloat(R126i.w)) > 0.0)?(PV0iz):(R126i.w));
// 42
R123i.x = ((-(intBitsToFloat(R127i.z)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.y)))):(R123i.y));
// 43
R123i.w = ((intBitsToFloat(R124i.y) == 0.0)?(R127i.z):(R123i.x));
// 44
R127i.z = int(intBitsToFloat(R123i.w));
// 45
R124i.y = floatBitsToInt(float(R127i.z));
// 46
PV0ix = floatBitsToInt((intBitsToFloat(R124i.y) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(R124i.y))?1.0:0.0);
R13i.x = floatBitsToInt(float(R127i.z));
// 47
R6i.y = floatBitsToInt(abs(intBitsToFloat(R13i.x)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(abs(intBitsToFloat(R13i.x)) * 0.25);
// 48
R13i.y = floatBitsToInt(intBitsToFloat(PV1iz) * 0.5 + intBitsToFloat(R124i.y));
R0i.z = floatBitsToInt(trunc(intBitsToFloat(PV1iw)));
// 49
R127i.x = floatBitsToInt(-(intBitsToFloat(R0i.z)) * 4.0 + intBitsToFloat(R6i.y));
PV1iy = floatBitsToInt(intBitsToFloat(R13i.y) * 0.25);
// 50
PV0ix = floatBitsToInt(trunc(intBitsToFloat(PV1iy)));
PV0iz = floatBitsToInt((intBitsToFloat(R127i.x) >= 4.0)?1.0:0.0);
PV0iw = floatBitsToInt(intBitsToFloat(R127i.x) + -4.0);
// 51
R124i.y = ((intBitsToFloat(PV0iz) == 0.0)?(R127i.x):(PV0iw));
PS1i = int(intBitsToFloat(PV0ix));
// 52
PV0ix = floatBitsToInt(intBitsToFloat(R124i.y) + 4.0);
R6i.y = PS1i + 0x1b;
PS0i = int(uf_blockVS7[48].z);
// 53
R123i.w = ((-(intBitsToFloat(R124i.y)) > 0.0)?(PV0ix):(R124i.y));
R0i.y = floatBitsToInt(float(PS0i));
// 54
R123i.z = ((-(intBitsToFloat(R13i.x)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.w)))):(R123i.w));
R13i.x = floatBitsToInt(float(R5i.z));
// 55
R13i.y = int(intBitsToFloat(R123i.z));
}
if( activeMaskStackC[3] == true ) {
R6i.xyzw = floatBitsToInt(uf_blockVS7[R6i.y].xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = int(-1) + R13i.y;
R125i.y = floatBitsToInt(abs(intBitsToFloat(R0i.y)));
R127i.z = 0xfffffffd + R13i.y;
R126i.w = 0xfffffffe + R13i.y;
PS0i = floatBitsToInt(float(R13i.y));
// 1
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(float(PV0ix));
// 2
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(R126i.w));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0ix)));
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R126i.w = floatBitsToInt((intBitsToFloat(R13i.x) > 0.0)?1.0:0.0);
R127i.x = int(intBitsToFloat(PV0iy));
// 4
PV0ix = 0 - R127i.x;
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(R13i.x))?1.0:0.0);
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iz)));
R124i.w = int(intBitsToFloat(PV1ix));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R126i.w) + -(intBitsToFloat(PV0iy)));
PV1iy = 0 - R124i.w;
PV1iz = max(R127i.x, PV0ix);
R126i.z = int(intBitsToFloat(PV0iw));
// 6
R127i.x = floatBitsToInt(intBitsToFloat(PV1ix) * 0.5 + intBitsToFloat(R13i.x));
PV0iy = max(R124i.w, PV1iy);
PV0iz = int(1) - PV1iz;
PV0iw = 0 - R126i.z;
PS0i = floatBitsToInt(float(R127i.z));
// 7
PV1ix = max(R126i.z, PV0iw);
PV1iy = int(1) - PV0iy;
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R126i.z = PV0iz * R6i.x;
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), uf_blockVS7[45].x));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
PV0iy = floatBitsToInt(uf_blockVS7[44].z + uf_blockVS7[45].x);
R127i.z = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iw)));
PV0iw = int(1) - PV1ix;
PS0i = PV1iy * R6i.y;
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), uf_blockVS7[45].y));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
PV1iy = PS0i + R126i.z;
R126i.z = floatBitsToInt(-(intBitsToFloat(PV0ix)) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(uf_blockVS7[44].w + uf_blockVS7[45].y);
PS1i = PV0iw * R6i.z;
// 10
R126i.x = PS1i + PV1iy;
PV0iy = floatBitsToInt(uf_blockVS7[46].y + uf_blockVS7[46].w);
PV0iz = floatBitsToInt(uf_blockVS7[46].x + uf_blockVS7[46].z);
R124i.w = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(PV1iw));
R124i.y = int(intBitsToFloat(R127i.z));
// 11
PV1ix = 0 - R124i.y;
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x),uf_blockVS7[46].z) + intBitsToFloat(PV0iz));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.w)),uf_blockVS7[44].x) + -(intBitsToFloat(R126i.z)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),uf_blockVS7[46].w) + intBitsToFloat(PV0iy));
R127i.w = floatBitsToInt(float(R5i.z));
// 12
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),uf_blockVS7[44].y) + intBitsToFloat(R124i.w));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),uf_blockVS7[45].z) + intBitsToFloat(R123i.y));
R126i.z = floatBitsToInt(abs(intBitsToFloat(R127i.w)));
PV0iw = max(R124i.y, PV1ix);
PS0i = floatBitsToInt(1.0 / abs(intBitsToFloat(R0i.y)));
// 13
PV1iy = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R127i.w)), intBitsToFloat(PS0i)));
PV1iz = int(1) - PV0iw;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),uf_blockVS7[45].w) + intBitsToFloat(R126i.w));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R0i.y));
// 14
PV0ix = floatBitsToInt(trunc(intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS1i));
PS0i = PV1iz * R6i.w;
// 15
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0ix)),intBitsToFloat(R125i.y)) + intBitsToFloat(R126i.z));
PV1iz = floatBitsToInt(trunc(intBitsToFloat(PV0iw)));
R125i.w = PS0i + R126i.x;
PS1i = floatBitsToInt(1.0 / uf_blockVS7[48].z);
// 16
PV0ix = floatBitsToInt(-(abs(intBitsToFloat(R0i.y))) + intBitsToFloat(R125i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].x, intBitsToFloat(PS1i)));
R123i.z = ((R1i.x == 0)?(0):(int(1)));
PV0iw = floatBitsToInt((intBitsToFloat(R125i.y) >= abs(intBitsToFloat(R0i.y)))?1.0:0.0);
R124i.y = int(intBitsToFloat(PV1iz));
// 17
backupReg0i = R125i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y),intBitsToFloat(R127i.y)) + -(0.5));
R125i.y = (R123i.z == int(1))?-1:0;
R126i.z = ((intBitsToFloat(PV0iw) == 0.0)?(backupReg0i):(PV0ix));
PV1iw = (R123i.z == 0x2)?-1:0;
PS1i = floatBitsToInt(1.0 / uf_blockVS7[48].w);
// 18
PV0ix = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].y, intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(abs(intBitsToFloat(R0i.y)) + intBitsToFloat(R126i.z));
R123i.z = ((PV1iw == 0)?(R10i.y):(R10i.x));
R123i.w = ((PV1iw == 0)?(R10i.x):(R10i.z));
PS0i = floatBitsToInt(float(R124i.y));
// 19
backupReg0i = R123i.z;
R123i.x = ((-(intBitsToFloat(R126i.z)) > 0.0)?(PV0iy):(R126i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0ix)),intBitsToFloat(PS0i)) + intBitsToFloat(R125i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(PV0ix)) + -(0.5));
R124i.w = ((R125i.y == 0)?(R123i.w):(R10i.y));
R125i.x = ((R125i.y == 0)?(backupReg0i):(R10i.z));
// 20
backupReg0i = R125i.y;
R123i.x = ((-(intBitsToFloat(R127i.w)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.x)))):(R123i.x));
R125i.y = ((backupReg0i == 0)?(R10i.x):(R10i.y));
R6i.z = ((backupReg0i == 0)?(R10i.y):(R10i.z));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R123i.z)) + -(intBitsToFloat(R123i.y)));
PS0i = int(uf_blockVS7[53].z);
// 21
R123i.z = ((intBitsToFloat(R0i.y) == 0.0)?(R127i.w):(R123i.x));
R2i.x = floatBitsToInt(float(PS0i));
// 22
R0i.z = floatBitsToInt(abs(intBitsToFloat(R2i.x)));
PS0i = int(intBitsToFloat(R123i.z));
// 23
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockVS7[50].y, intBitsToFloat(R125i.x)));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
PV1iy = floatBitsToInt(uf_blockVS7[49].w + uf_blockVS7[50].y);
PV1iz = floatBitsToInt(uf_blockVS7[49].z + uf_blockVS7[50].x);
PV1iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[50].x, intBitsToFloat(R124i.w)));
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 2.0);
PS1i = floatBitsToInt(float(PS0i));
// 24
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PS1i)) + intBitsToFloat(R127i.z));
R0i.y = floatBitsToInt(-(intBitsToFloat(PV1iw)) + intBitsToFloat(PV1iz));
R5i.z = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(uf_blockVS7[51].x + uf_blockVS7[51].z);
R6i.w = floatBitsToInt(float(R125i.w));
// 25
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.x));
R10i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[51].z,intBitsToFloat(R125i.y)) + intBitsToFloat(PV0iw));
R10i.z = floatBitsToInt((0.0 > intBitsToFloat(R6i.w))?1.0:0.0);
R10i.w = floatBitsToInt((intBitsToFloat(R6i.w) > 0.0)?1.0:0.0);
R3i.z = floatBitsToInt(float(R125i.w));
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(abs(intBitsToFloat(R3i.z)));
PV0iy = floatBitsToInt(intBitsToFloat(R10i.w) + -(intBitsToFloat(R10i.z)));
PV0iw = floatBitsToInt(uf_blockVS7[51].y + uf_blockVS7[51].w);
PS0i = floatBitsToInt(1.0 / abs(intBitsToFloat(R2i.x)));
// 1
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * 0.5 + intBitsToFloat(R6i.w));
PV1iy = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R3i.z)), intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[51].w,intBitsToFloat(R6i.z)) + intBitsToFloat(PV0iw));
R124i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.w)),uf_blockVS7[49].x) + -(intBitsToFloat(R0i.y)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R2i.x));
// 2
R0i.x = floatBitsToInt(intBitsToFloat(R10i.x) + 0.5);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),uf_blockVS7[49].y) + intBitsToFloat(R5i.z));
PV0iz = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(trunc(intBitsToFloat(PV1iy)));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[53].z);
// 3
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iw)),intBitsToFloat(R0i.z)) + intBitsToFloat(R126i.x));
PV1iy = floatBitsToInt(trunc(intBitsToFloat(PV0iz)));
R126i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[53].x, intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[53].w);
// 4
R125i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[53].y, intBitsToFloat(PS1i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),uf_blockVS7[50].z) + intBitsToFloat(R10i.y));
PV0iz = floatBitsToInt((intBitsToFloat(R126i.x) >= abs(intBitsToFloat(R2i.x)))?1.0:0.0);
PV0iw = floatBitsToInt(-(abs(intBitsToFloat(R2i.x))) + intBitsToFloat(R126i.x));
PS0i = int(intBitsToFloat(PV1iy));
// 5
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R126i.z)) + -(0.5));
R125i.y = ((intBitsToFloat(PV0iz) == 0.0)?(backupReg0i):(PV0iw));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),uf_blockVS7[50].w) + intBitsToFloat(R127i.z));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z),intBitsToFloat(R125i.x)) + -(0.5));
PS1i = floatBitsToInt(float(PS0i));
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.x)),intBitsToFloat(PS1i)) + intBitsToFloat(R126i.y));
PV0iy = floatBitsToInt(abs(intBitsToFloat(R2i.x)) + intBitsToFloat(R125i.y));
R0i.y = floatBitsToInt(intBitsToFloat(R3i.w) + 0.5);
// 7
R7i.y = floatBitsToInt(uf_blockVS7[104].x);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R125i.w)) + -(intBitsToFloat(R123i.x)));
R123i.w = ((-(intBitsToFloat(R125i.y)) > 0.0)?(PV0iy):(R125i.y));
// 8
R123i.z = ((-(intBitsToFloat(R3i.z)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.w)))):(R123i.w));
// 9
R123i.y = ((intBitsToFloat(R2i.x) == 0.0)?(R3i.z):(R123i.z));
// 10
PS0i = int(intBitsToFloat(R123i.y));
// 11
PS1i = floatBitsToInt(float(PS0i));
// 12
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(PS1i)) + intBitsToFloat(R124i.w));
// 13
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.w));
// 14
R0i.z = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
R0i.w = floatBitsToInt(intBitsToFloat(R127i.z) + 0.5);
}
if( activeMaskStackC[3] == true ) {
// 0
R7i.x = floatBitsToInt(uf_blockVS8[3].x * 1.0 + 0.0);
// 1
R22i.x = R14i.x;
R22i.y = R14i.y;
R22i.z = R14i.z;
R22i.w = R14i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
// skipped export to semanticId 255
// export
// skipped export to semanticId 255
// export
passParameterSem7 = vec4(intBitsToFloat(R22i.x), intBitsToFloat(R22i.y), intBitsToFloat(R22i.z), intBitsToFloat(R22i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem10 = vec4(intBitsToFloat(R21i.x), intBitsToFloat(R21i.y), intBitsToFloat(R21i.z), intBitsToFloat(R21i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.w));
// export
passParameterSem13 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.y), intBitsToFloat(R7i.z), intBitsToFloat(R7i.z));
}
