#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 7de030bde12be252
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

out vec4 passParameterSem0;
out vec4 passParameterSem1;
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
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem3;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem4;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem7;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem6;
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
R12i.y = floatBitsToInt(-(intBitsToFloat(R5i.w)) + uf_blockVS8[2].x);
R0i.w = 0;
R5i.w = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R12i.y));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R11i.x = 0;
R11i.y = 0;
R11i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R13i.x = 0;
// 1
R6i.w = R5i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R6i.w = R0i.w;
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
PS0i = int(intBitsToFloat(R4i.w));
// 1
R7i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R12i.y) >= intBitsToFloat(R7i.z));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R11i.x = 0;
R11i.y = 0;
R11i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R13i.x = 0;
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
R9i.y = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
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
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R0i.w));
// 1
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R127i.x)));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R127i.x)));
// 2
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R13i.y = 0;
// 1
R15i.y = R13i.y;
// 2
R14i.y = R13i.y;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (intBitsToFloat(R9i.y) > 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R9i.y));
// 1
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PS0i)));
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PS0i)));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(PS0i)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R11i.x = 0;
R16i.y = 0;
R4i.w = 0;
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
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R0i.y));
// 1
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PS0i)));
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PS0i)));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(PS0i)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R13i.x = 0;
R17i.y = 0;
R5i.w = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt((0.0 > uf_blockVS7[9].x)?1.0:0.0);
PV0iy = floatBitsToInt((uf_blockVS7[9].x > 0.0)?1.0:0.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), uf_blockVS7[10].y));
R9i.w = floatBitsToInt(max(intBitsToFloat(R7i.x), 0.0));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[9].x);
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R12i.y) * intBitsToFloat(PS0i));
R127i.y = floatBitsToInt(intBitsToFloat(R12i.y) + uf_blockVS7[15].z);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), uf_blockVS7[15].x));
R127i.w = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
R12i.x = floatBitsToInt(1.0 / intBitsToFloat(R7i.z));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
PV0iy = floatBitsToInt(uf_blockVS7[5].x) & int(1);
R8i.z = floatBitsToInt(intBitsToFloat(R12i.y) * intBitsToFloat(R12i.x));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[14].z);
// 3
PV1ix = floatBitsToInt(-(uf_blockVS7[96].w) + uf_blockVS7[97].w);
PV1iy = floatBitsToInt(fract(intBitsToFloat(PV0iw)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS0i));
R124i.w = floatBitsToInt(float(PV0iy));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt(-(uf_blockVS7[96].x) + uf_blockVS7[97].x);
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(-(uf_blockVS7[96].y) + uf_blockVS7[97].y);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0x40c90fdb));
R126i.y = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(-(uf_blockVS7[97].w) + uf_blockVS7[98].w);
R126i.w = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
R127i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(PS0i));
// 6
PV0ix = floatBitsToInt(uf_blockVS7[5].x) & 0x2;
R0i.y = floatBitsToInt(intBitsToFloat(R126i.y) + -(uf_blockVS7[97].w));
R123i.z = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
R127i.w = floatBitsToInt(uf_blockVS7[5].x) & 0x4;
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
// 7
R0i.x = floatBitsToInt(intBitsToFloat(R126i.y) + -(uf_blockVS7[98].w));
R11i.y = ((intBitsToFloat(R0i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.z = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
R125i.w = floatBitsToInt(intBitsToFloat(R126i.y) + -(uf_blockVS7[96].w));
R0i.w = floatBitsToInt(float(PV0ix));
// 8
R10i.x = floatBitsToInt(fract(intBitsToFloat(R126i.z)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R126i.w)));
PV0iz = floatBitsToInt(-(uf_blockVS7[97].y) + uf_blockVS7[98].y);
PV0iw = floatBitsToInt(-(uf_blockVS7[97].x) + uf_blockVS7[98].x);
R125i.y = floatBitsToInt(float(R127i.w));
// 9
backupReg0i = R127i.x;
backupReg1i = R125i.w;
R127i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(R127i.y));
R127i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(R127i.y));
PV1iz = floatBitsToInt(-(uf_blockVS7[98].w) + uf_blockVS7[99].w);
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), intBitsToFloat(backupReg0i)));
R125i.z = ((intBitsToFloat(backupReg1i) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 10
R9i.x = ((intBitsToFloat(R0i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R9i.y = floatBitsToInt(-(uf_blockVS7[98].x) + uf_blockVS7[99].x);
R126i.z = floatBitsToInt(-(intBitsToFloat(R11i.y)) + 1.0);
R127i.w = floatBitsToInt(-(uf_blockVS7[98].y) + uf_blockVS7[99].y);
R126i.x = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
// 11
backupReg0i = R126i.y;
R125i.x = floatBitsToInt((intBitsToFloat(R124i.w) > 0.0)?1.0:0.0);
R126i.y = floatBitsToInt((intBitsToFloat(R0i.w) > 0.0)?1.0:0.0);
R124i.z = floatBitsToInt((0.0 > intBitsToFloat(R124i.w))?1.0:0.0);
R124i.w = floatBitsToInt(intBitsToFloat(backupReg0i) + -(uf_blockVS7[99].w));
R10i.y = floatBitsToInt((0.0 > intBitsToFloat(R0i.w))?1.0:0.0);
// 12
backupReg0i = R125i.y;
R124i.x = floatBitsToInt((0.0 > intBitsToFloat(backupReg0i))?1.0:0.0);
R125i.y = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.z = floatBitsToInt((intBitsToFloat(backupReg0i) > 0.0)?1.0:0.0);
R126i.w = floatBitsToInt(intBitsToFloat(R10i.x) + -(0.5));
R9i.z = floatBitsToInt(uf_blockVS7[96].x + intBitsToFloat(R124i.y));
// 13
backupReg0i = R127i.x;
backupReg1i = R127i.y;
backupReg2i = R127i.w;
R127i.x = floatBitsToInt(uf_blockVS7[96].y + intBitsToFloat(R125i.w));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(backupReg0i)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(backupReg1i)));
R127i.w = floatBitsToInt(intBitsToFloat(R9i.y) * intBitsToFloat(R126i.x));
R125i.w = floatBitsToInt(intBitsToFloat(backupReg2i) * intBitsToFloat(R126i.x));
// 14
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R126i.z)));
R124i.y = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
R10i.z = ((intBitsToFloat(R124i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iw = floatBitsToInt(-(intBitsToFloat(R9i.x)) + 1.0);
R0i.y = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(R124i.z)));
// 15
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(intBitsToFloat(R126i.y) + -(intBitsToFloat(R10i.y)));
R126i.y = ((intBitsToFloat(R126i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(PV0iw)));
R126i.w = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(backupReg0i)));
R126i.z = floatBitsToInt(uf_blockVS7[97].y + intBitsToFloat(R0i.z));
// 16
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R125i.w)));
R127i.y = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(0x3e22f983));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R127i.w)));
R127i.w = floatBitsToInt(uf_blockVS7[97].x + intBitsToFloat(backupReg0i));
PS0i = floatBitsToInt(-(intBitsToFloat(R10i.z)) + 1.0);
// 17
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(R125i.x)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R125i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].x, intBitsToFloat(R124i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].y, intBitsToFloat(R124i.y)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(PS0i)));
// 18
R127i.x = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
R126i.y = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PV1iz));
R127i.z = floatBitsToInt(uf_blockVS7[98].x + intBitsToFloat(R127i.z));
R125i.w = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(PV1iw));
R124i.w = int(intBitsToFloat(R0i.y));
// 19
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R125i.z)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R125i.z)));
R126i.z = 0 - R124i.w;
R127i.w = floatBitsToInt(uf_blockVS7[98].y + intBitsToFloat(R126i.x));
R0i.w = int(intBitsToFloat(R124i.x));
// 20
backupReg0i = R126i.y;
backupReg1i = R126i.w;
R126i.x = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R125i.w));
R126i.y = 0 - R0i.w;
R125i.z = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(backupReg0i));
R126i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[14].x, intBitsToFloat(R10i.x)));
R124i.y = int(intBitsToFloat(backupReg1i));
// 21
PV1ix = 0 - R124i.y;
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R124i.z)));
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[14].x, intBitsToFloat(R127i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R124i.z)));
PS1i = floatBitsToInt(cos((intBitsToFloat(R127i.y))/0.1591549367));
// 22
R9i.x = max(R0i.w, R126i.y);
R11i.y = max(R124i.w, R126i.z);
PV0iz = floatBitsToInt(intBitsToFloat(PS1i) + 1.0);
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
R0i.w = max(R124i.y, PV1ix);
R10i.y = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R125i.z));
// 23
backupReg0i = R9i.w;
R10i.x = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R0i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[14].x, intBitsToFloat(PV0iz)));
R0i.z = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
R9i.w = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R126i.x));
R9i.z = floatBitsToInt(min(intBitsToFloat(backupReg0i), 0.0));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(uf_blockVS7[99].x, intBitsToFloat(R10i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockVS7[99].y, intBitsToFloat(R10i.z)));
R127i.z = floatBitsToInt(-(intBitsToFloat(R0i.y)) + 1.0);
R127i.w = floatBitsToInt(max(intBitsToFloat(R0i.z), -(intBitsToFloat(R0i.z))));
R0i.x = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(R9i.z));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(R9i.w));
R124i.y = floatBitsToInt(max(intBitsToFloat(R10i.x), -(intBitsToFloat(R10i.x))));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R10i.y));
R6i.w = floatBitsToInt(uf_blockVS8[2].w + intBitsToFloat(R12i.y));
R126i.x = floatBitsToInt(float(R11i.y));
// 2
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1iz)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PV1ix)));
R126i.y = floatBitsToInt(float(R9i.x));
// 3
PS1i = floatBitsToInt(float(R0i.w));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.z),intBitsToFloat(R127i.w),intBitsToFloat(R124i.y),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R126i.w)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R127i.y)));
// 6
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), uf_blockVS8[3].y));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), uf_blockVS8[3].z));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R8i.y = ((uf_blockVS7[12].x == 1.0)?-1:0);
R0i.z = floatBitsToInt(-(uf_blockVS7[12].x) + 1.0);
// 1
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
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(R6i.w)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].w, intBitsToFloat(PV0ix)));
// 2
R8i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].x, intBitsToFloat(PV1iw)));
R9i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].y, intBitsToFloat(PV1iw)));
R7i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].z, intBitsToFloat(PV1iw)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
tempResultf = max(0.0, abs(uf_blockVS7[12].x));
tempResultf = log2(tempResultf);
PS0i = floatBitsToInt(tempResultf);
// 1
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f317218));
tempResultf = max(0.0, uf_blockVS7[12].x);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PS1i)));
R127i.y = ((uf_blockVS7[12].x == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R0i.z));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R6i.w) + -(intBitsToFloat(PV1iz)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].w, intBitsToFloat(PV1ix)));
// 9
R8i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].x, intBitsToFloat(PV0iw)));
R9i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].y, intBitsToFloat(PV0iw)));
R7i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].z, intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(R7i.z)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y), intBitsToFloat(R9i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(R9i.y)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.y), intBitsToFloat(R7i.z)));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(R7i.z)));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y), intBitsToFloat(R8i.x)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.x), intBitsToFloat(R9i.y)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y), intBitsToFloat(R8i.x)));
R126i.w = 0x3f800000;
tempResultf = max(0.0, uf_blockVS7[12].x);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.y), intBitsToFloat(R8i.x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV1ix));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R0i.z));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV0ix));
R126i.y = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(uf_blockVS7[13].x);
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) / 2.0);
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iy)));
// 4
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV1ix));
PV0iy = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
PV0iz = floatBitsToInt(uf_blockVS7[13].y);
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
PV0iw = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV1iz));
R0i.z = floatBitsToInt(intBitsToFloat(R6i.z) * 1.0);
// 5
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(PV0iz));
R7i.z = 0x3f800000;
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(R127i.z));
R0i.w = 0x3f800000;
// 6
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PV1iy)));
R123i.y = ((R8i.y == 0)?(PV1iw):(R6i.w));
R10i.x = floatBitsToInt(1.0 / uf_blockVS7[116].x);
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R123i.y)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R123i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R123i.y)));
// 8
PV0ix = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV1iz));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV1iw));
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(PV0iy)));
// 10
R126i.x = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV1iw));
R126i.y = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV1iy));
R127i.z = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(PV1ix));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R126i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R1i.z = tempi.x;
PV1iw = tempi.x;
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R126i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R1i.w = tempi.x;
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R126i.w))));
PV1ix = tempi.x;
R1i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 14
PV0iz = floatBitsToInt((0.0 > uf_blockVS7[8].y)?1.0:0.0);
PV0iw = floatBitsToInt((uf_blockVS7[8].y > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(1.0 / uf_blockVS7[8].y);
// 15
R3i.y = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
PV1iw = floatBitsToInt(intBitsToFloat(R12i.y) * intBitsToFloat(PS0i));
// 16
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),uf_blockVS7[9].z) + intBitsToFloat(PV1iw));
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R9i.x),intBitsToFloat(R0i.z),intBitsToFloat(R7i.z)),vec4(uf_blockVS6[12].x,uf_blockVS6[12].y,uf_blockVS6[12].z,uf_blockVS6[12].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R9i.x),intBitsToFloat(R0i.z),intBitsToFloat(R7i.z)),vec4(uf_blockVS6[13].x,uf_blockVS6[13].y,uf_blockVS6[13].z,uf_blockVS6[13].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.y = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0ix));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R9i.x),intBitsToFloat(R0i.z),intBitsToFloat(R7i.z)),vec4(uf_blockVS6[14].x,uf_blockVS6[14].y,uf_blockVS6[14].z,uf_blockVS6[14].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.x = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(PV1ix));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(R1i.z) + -(uf_blockVS6[17].x));
PV1iy = floatBitsToInt(intBitsToFloat(R1i.w) + -(uf_blockVS6[17].y));
R127i.z = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(intBitsToFloat(R1i.y) + -(uf_blockVS6[17].z));
R0i.x = floatBitsToInt(-(intBitsToFloat(R1i.z)) + intBitsToFloat(R126i.y));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(PV1ix),intBitsToFloat(PV1iy),intBitsToFloat(PV1iw),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV1ix),intBitsToFloat(PV1iy),intBitsToFloat(PV1iw),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.z = floatBitsToInt(-(intBitsToFloat(R1i.w)) + intBitsToFloat(R126i.x));
// 5
R2i.x = floatBitsToInt(uf_blockVS7[60].z);
R4i.y = floatBitsToInt(uf_blockVS7[60].y);
R7i.z = floatBitsToInt(uf_blockVS7[60].x);
R2i.w = floatBitsToInt(-(intBitsToFloat(R1i.y)) + intBitsToFloat(R127i.z));
R2i.y = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 6
R126i.x = floatBitsToInt(-(intBitsToFloat(R3i.y)) + 1.0);
PV0iy = floatBitsToInt(fract(intBitsToFloat(R3i.z)));
R127i.z = floatBitsToInt(-(uf_blockVS7[68].x) + uf_blockVS7[69].x);
// 7
PV1ix = floatBitsToInt(-(uf_blockVS7[68].w) + uf_blockVS7[69].w);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(PV0iy)));
// 8
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(-(uf_blockVS7[69].x) + uf_blockVS7[70].x);
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV1iw));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 9
R9i.x = floatBitsToInt(intBitsToFloat(R3i.z) + -(uf_blockVS7[68].w));
PV1iy = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS0i));
R4i.w = floatBitsToInt(intBitsToFloat(R3i.z) + -(uf_blockVS7[69].w));
// 10
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(PV1iy)) + uf_blockVS7[68].x);
// 11
PV1iy = floatBitsToInt(-(uf_blockVS7[69].w) + uf_blockVS7[70].w);
// 12
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 13
R3i.w = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(PS0i));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iy = floatBitsToInt(min(intBitsToFloat(R2i.y), uf_blockVS7[116].x));
// 1
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(R3i.w)) + uf_blockVS7[69].x);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(R10i.x));
// 2
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(intBitsToFloat(R3i.z) + -(uf_blockVS7[70].w));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PV1iz)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1iz)));
// 3
backupReg0i = R1i.y;
R10i.x = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0iw));
R1i.y = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(PV0iy));
R1i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV0iz));
R126i.w = floatBitsToInt(-(uf_blockVS7[70].x) + uf_blockVS7[71].x);
// 4
R9i.x = ((intBitsToFloat(R9i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iw = floatBitsToInt(-(uf_blockVS7[70].w) + uf_blockVS7[71].w);
// 5
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS1i));
// 7
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(PV0iy)) + uf_blockVS7[70].x);
}
if( activeMaskStackC[3] == true ) {
// 0
R11i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS6[8].x,uf_blockVS6[8].y,uf_blockVS6[8].z,uf_blockVS6[8].w)));
PV0iy = R11i.x;
PV0iz = R11i.x;
PV0iw = R11i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS6[9].x,uf_blockVS6[9].y,uf_blockVS6[9].z,uf_blockVS6[9].w)));
PV1ix = tempi.x;
R11i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.z = ((intBitsToFloat(R4i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS6[11].x,uf_blockVS6[11].y,uf_blockVS6[11].z,uf_blockVS6[11].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R11i.w = tempi.x;
R2i.y = ((intBitsToFloat(R0i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 3
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS6[0].x,uf_blockVS6[0].y,uf_blockVS6[0].z,uf_blockVS6[0].w)));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS6[1].x,uf_blockVS6[1].y,uf_blockVS6[1].z,uf_blockVS6[1].w)));
PV0ix = tempi.x;
R126i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(-(intBitsToFloat(R2i.y)) + 1.0);
// 5
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS6[2].x,uf_blockVS6[2].y,uf_blockVS6[2].z,uf_blockVS6[2].w)));
PV1iy = R126i.x;
PV1iz = R126i.x;
PV1iw = R126i.x;
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS6[3].x,uf_blockVS6[3].y,uf_blockVS6[3].z,uf_blockVS6[3].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R126i.w = tempi.x;
PS0i = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
// 7
backupReg0i = R9i.x;
R9i.x = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(uf_blockVS7[13].z + intBitsToFloat(R126i.x));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R126i.w)),vec4(uf_blockVS6[6].x,uf_blockVS6[6].y,uf_blockVS6[6].z,uf_blockVS6[6].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R127i.w = tempi.x;
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R126i.w)),vec4(uf_blockVS6[7].x,uf_blockVS6[7].y,uf_blockVS6[7].z,uf_blockVS6[7].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 10
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 11
PV1iw = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS0i));
// 12
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.w), intBitsToFloat(PV1iw)));
// 13
PV1ix = ((intBitsToFloat(R7i.y) > 0.5)?-1:0);
PV1iy = ((intBitsToFloat(R7i.x) > 0.5)?-1:0);
PV1iz = floatBitsToInt(uf_blockVS7[5].x) & 0x80000;
PS1i = floatBitsToInt(float(floatBitsToInt(uf_blockVS7[6].z)));
// 14
PV0ix = (PV1iz == 0x80000)?-1:0;
R123i.y = floatBitsToInt(((PV1iy == 0)?(intBitsToFloat(R6i.x)):(-(intBitsToFloat(R6i.x)))));
PV0iz = floatBitsToInt(uf_blockVS7[5].x) & 0x100000;
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(PS1i)));
R127i.z = floatBitsToInt(((PV1ix == 0)?(intBitsToFloat(R6i.y)):(-(intBitsToFloat(R6i.y)))));
// 15
R127i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x10;
PV1iy = (PV0iz == 0x100000)?-1:0;
R1i.z = ((PV0ix == 0)?(R6i.x):(R123i.y));
PS1i = int(intBitsToFloat(PV0iw));
// 16
R6i.x = PS1i + 0x4c;
R2i.w = ((PV1iy == 0)?(R6i.y):(R127i.z));
R3i.y = int(uf_blockVS7[17].x);
// 17
R10i.x = int(uf_blockVS7[17].y);
// 18
PS0i = floatBitsToInt(float(R127i.x));
// 19
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
// 20
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1ix)));
// 21
R127i.w = int(intBitsToFloat(PV0iz));
// 22
PV0iy = 0 - R127i.w;
// 23
R0i.x = max(R127i.w, PV0iy);
}
if( activeMaskStackC[3] == true ) {
R6i.xyz = floatBitsToInt(uf_blockVS7[R6i.x].xyz);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R3i.z) + -(uf_blockVS7[71].w));
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[68].x, intBitsToFloat(R9i.x)));
// 1
backupReg0i = R2i.x;
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), uf_blockVS8[0].x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), uf_blockVS8[0].y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R1i.y)) + intBitsToFloat(PV0iw));
R127i.w = ((intBitsToFloat(PV0ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), uf_blockVS8[0].z));
// 2
backupReg0i = R1i.x;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), uf_blockVS8[1].x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R4i.w)) + intBitsToFloat(R123i.z));
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
PV0iw = floatBitsToInt(uf_blockVS7[84].x);
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), uf_blockVS8[1].y));
// 3
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV0iz)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), uf_blockVS8[1].z));
R14i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), uf_blockVS8[1].w));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(PV1iy)) + intBitsToFloat(R126i.y));
// 5
R123i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[71].x,intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.x));
// 6
R9i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), uf_blockVS8[0].w));
}
if( activeMaskStackC[3] == true ) {
// 0
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), uf_blockVS7[59].x));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), uf_blockVS7[59].x));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), uf_blockVS7[59].x));
PV0iw = floatBitsToInt(uf_blockVS7[5].x) & 0x20;
R14i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R1i.x)));
// 1
PV1ix = floatBitsToInt(uf_blockVS7[5].x) & 0x40;
R14i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R1i.y)));
R14i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R2i.z)));
PS1i = floatBitsToInt(float(PV0iw));
// 2
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt(uf_blockVS7[5].x) & 0x80;
R125i.w = int(-1) + R3i.y;
PS0i = floatBitsToInt(float(PV1ix));
// 3
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
R124i.w = floatBitsToInt(uf_blockVS7[5].x) & 0x2000000;
PS1i = floatBitsToInt(float(PV0iz));
// 4
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1ix)));
R127i.w = int(intBitsToFloat(PV1iz));
// 5
PV1iy = 0 - R127i.w;
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
R126i.w = int(intBitsToFloat(PV0iz));
// 6
R6i.x = max(R127i.w, PV1iy);
PV0iy = 0 - R126i.w;
R127i.w = int(intBitsToFloat(PV1iz));
// 7
R4i.x = max(R126i.w, PV0iy);
PV1iy = 0 - R127i.w;
R127i.z = floatBitsToInt(float(R3i.y));
// 8
R125i.x = max(R127i.w, PV1iy);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(R127i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(R127i.z)));
PS0i = floatBitsToInt(float(R10i.x));
// 9
PV1iy = floatBitsToInt(intBitsToFloat(R12i.x) * intBitsToFloat(PV0iw));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 10
R126i.y = floatBitsToInt(intBitsToFloat(R12i.y) * intBitsToFloat(PS1i));
PS0i = int(intBitsToFloat(PV1iy));
// 11
R126i.z = R0i.x * PS0i;
// 12
R124i.x = int(intBitsToFloat(R126i.y));
// 13
PS1i = floatBitsToInt(float(R124i.x));
// 14
PV0iw = floatBitsToInt(-(intBitsToFloat(R127i.z)) + intBitsToFloat(PS1i));
R126i.w = floatBitsToInt(float(R3i.y));
// 15
R10i.x = floatBitsToInt(abs(intBitsToFloat(R126i.w)));
R123i.y = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.y = floatBitsToInt(float(R124i.x));
// 16
R126i.x = floatBitsToInt(abs(intBitsToFloat(R125i.y)));
R127i.x = int(intBitsToFloat(R123i.y));
// 17
R127i.w = int(1) - R127i.x;
R0i.x = floatBitsToInt(1.0 / abs(intBitsToFloat(R126i.w)));
// 18
PV0iz = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R125i.y)), intBitsToFloat(R0i.x)));
R127i.x = R127i.x * R125i.w;
// 19
PV1iw = floatBitsToInt(trunc(intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(float(R124i.w));
// 20
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iw)),intBitsToFloat(R10i.x)) + intBitsToFloat(R126i.x));
R126i.y = int(intBitsToFloat(R127i.y));
// 21
PV1ix = floatBitsToInt(-(abs(intBitsToFloat(R126i.w))) + intBitsToFloat(R127i.z));
PV1iy = floatBitsToInt((intBitsToFloat(R127i.z) >= abs(intBitsToFloat(R126i.w)))?1.0:0.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iy)));
R124i.w = R125i.x * R126i.y;
// 22
R125i.x = ((intBitsToFloat(PV1iy) == 0.0)?(R127i.z):(PV1ix));
R127i.y = int(intBitsToFloat(PV1iw));
// 23
PV1ix = 0 - R127i.y;
PV1iz = floatBitsToInt(abs(intBitsToFloat(R126i.w)) + intBitsToFloat(R125i.x));
// 24
PV0iz = max(R127i.y, PV1ix);
R123i.w = ((-(intBitsToFloat(R125i.x)) > 0.0)?(PV1iz):(R125i.x));
// 25
R123i.y = ((-(intBitsToFloat(R125i.y)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.w)))):(R123i.w));
PS1i = PV0iz * R126i.y;
// 26
backupReg0i = R124i.x;
R124i.x = ((intBitsToFloat(R126i.w) == 0.0)?(R125i.y):(R123i.y));
PV0iz = backupReg0i + PS1i;
// 27
R125i.y = R4i.x * PV0iz;
// 28
PS0i = int(intBitsToFloat(R124i.x));
// 29
PS1i = R127i.w * PS0i;
// 30
PV0iz = PS1i + R127i.x;
// 31
PS1i = R6i.x * PV0iz;
// 32
PV0iw = PS1i + R126i.z;
// 33
PV1iy = R125i.y + PV0iw;
// 34
PV0ix = R124i.w + PV1iy;
// 35
R127i.z = floatBitsToInt(float(PV0ix));
// 36
backupReg0i = R127i.z;
R127i.x = floatBitsToInt(abs(intBitsToFloat(backupReg0i)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), abs(intBitsToFloat(backupReg0i))));
// 37
PV1iy = floatBitsToInt(trunc(intBitsToFloat(PV0iw)));
// 38
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iy)),intBitsToFloat(R10i.x)) + intBitsToFloat(R127i.x));
// 39
PV1iy = floatBitsToInt((intBitsToFloat(R126i.z) >= abs(intBitsToFloat(R126i.w)))?1.0:0.0);
PV1iw = floatBitsToInt(-(abs(intBitsToFloat(R126i.w))) + intBitsToFloat(R126i.z));
// 40
R127i.x = ((intBitsToFloat(PV1iy) == 0.0)?(R126i.z):(PV1iw));
// 41
PV1iz = floatBitsToInt(abs(intBitsToFloat(R126i.w)) + intBitsToFloat(R127i.x));
// 42
R123i.w = ((-(intBitsToFloat(R127i.x)) > 0.0)?(PV1iz):(R127i.x));
// 43
R123i.y = ((-(intBitsToFloat(R127i.z)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.w)))):(R123i.w));
// 44
R123i.x = ((intBitsToFloat(R126i.w) == 0.0)?(R127i.z):(R123i.y));
// 45
R6i.z = int(intBitsToFloat(R123i.x));
// 46
R126i.w = floatBitsToInt(float(R6i.z));
// 47
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(R126i.w))?1.0:0.0);
PV1iy = floatBitsToInt((intBitsToFloat(R126i.w) > 0.0)?1.0:0.0);
R126i.y = floatBitsToInt(float(R6i.z));
// 48
PV0ix = floatBitsToInt(abs(intBitsToFloat(R126i.y)) * 0.25);
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1ix)));
R124i.w = floatBitsToInt(abs(intBitsToFloat(R126i.y)));
// 49
PV1iz = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iz) * 0.5 + intBitsToFloat(R126i.w));
// 50
PV0ix = floatBitsToInt(intBitsToFloat(R123i.w) * 0.25);
R125i.y = floatBitsToInt(-(intBitsToFloat(PV1iz)) * 4.0 + intBitsToFloat(R124i.w));
// 51
PV1ix = floatBitsToInt(intBitsToFloat(R125i.y) + -4.0);
PV1iy = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt((intBitsToFloat(R125i.y) >= 4.0)?1.0:0.0);
// 52
R124i.w = ((intBitsToFloat(PV1iz) == 0.0)?(R125i.y):(PV1ix));
PS0i = int(intBitsToFloat(PV1iy));
// 53
PV1iy = floatBitsToInt(intBitsToFloat(R124i.w) + 4.0);
R4i.w = PS0i + 0x12;
PS1i = int(uf_blockVS7[48].z);
// 54
R123i.x = ((-(intBitsToFloat(R124i.w)) > 0.0)?(PV1iy):(R124i.w));
R1i.w = floatBitsToInt(float(PS1i));
// 55
R123i.z = ((-(intBitsToFloat(R126i.y)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.x)))):(R123i.x));
// 56
R0i.w = int(intBitsToFloat(R123i.z));
}
if( activeMaskStackC[3] == true ) {
R4i.xyzw = floatBitsToInt(uf_blockVS7[R4i.w].xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = 0xfffffffe + R0i.w;
PV0iy = int(-1) + R0i.w;
R127i.z = 0xfffffffd + R0i.w;
R126i.w = floatBitsToInt(abs(intBitsToFloat(R1i.w)));
PS0i = floatBitsToInt(float(R0i.w));
// 1
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PS1i = floatBitsToInt(float(PV0iy));
// 2
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iz)));
PS0i = floatBitsToInt(float(R127i.x));
// 3
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R126i.y = int(intBitsToFloat(PV0iw));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1ix)));
PV0iy = 0 - R126i.y;
R127i.x = int(intBitsToFloat(PV1iy));
// 5
PV1ix = 0 - R127i.x;
PV1iz = max(R126i.y, PV0iy);
R126i.z = int(intBitsToFloat(PV0ix));
// 6
PV0ix = int(1) - PV1iz;
PV0iy = 0 - R126i.z;
PV0iw = max(R127i.x, PV1ix);
PS0i = floatBitsToInt(float(R127i.z));
// 7
PV1ix = int(1) - PV0iw;
PV1iy = max(R126i.z, PV0iy);
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R126i.z = PV0ix * R4i.x;
// 8
PV0ix = int(1) - PV1iy;
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), uf_blockVS7[45].x));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
R127i.z = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(uf_blockVS7[44].z + uf_blockVS7[45].x);
PS0i = PV1ix * R4i.y;
// 9
backupReg0i = R126i.z;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), uf_blockVS7[45].y));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
PV1iy = floatBitsToInt(uf_blockVS7[44].w + uf_blockVS7[45].y);
R126i.z = floatBitsToInt(-(intBitsToFloat(PV0iy)) + intBitsToFloat(PV0iw));
PV1iw = PS0i + backupReg0i;
PS1i = PV0ix * R4i.z;
// 10
R127i.x = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(PV1iy));
R126i.y = PS1i + PV1iw;
PV0iz = floatBitsToInt(uf_blockVS7[46].x + uf_blockVS7[46].z);
PV0iw = floatBitsToInt(uf_blockVS7[46].y + uf_blockVS7[46].w);
R124i.w = int(intBitsToFloat(R127i.z));
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),uf_blockVS7[46].w) + intBitsToFloat(PV0iw));
PV1iy = 0 - R124i.w;
R124i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.y)),uf_blockVS7[44].x) + -(intBitsToFloat(R126i.z)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),uf_blockVS7[46].z) + intBitsToFloat(PV0iz));
R126i.z = floatBitsToInt(1.0 / abs(intBitsToFloat(R1i.w)));
// 12
PV0ix = max(R124i.w, PV1iy);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y),uf_blockVS7[45].z) + intBitsToFloat(R123i.w));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y),uf_blockVS7[44].y) + intBitsToFloat(R127i.x));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y),uf_blockVS7[45].w) + intBitsToFloat(R123i.x));
R125i.y = floatBitsToInt(1.0 / intBitsToFloat(R1i.w));
// 13
R126i.x = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
PV1iz = int(1) - PV0ix;
PS1i = floatBitsToInt(1.0 / uf_blockVS7[48].z);
// 14
R125i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].x, intBitsToFloat(PS1i)));
R127i.w = floatBitsToInt(intBitsToFloat(R1i.z) + 0.5);
PS0i = PV1iz * R4i.w;
// 15
R127i.x = PS0i + R126i.y;
R127i.y = floatBitsToInt(-(intBitsToFloat(R124i.w)) + 1.0);
R125i.z = floatBitsToInt(intBitsToFloat(R2i.w) + -(0.5));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[48].w);
// 16
R13i.x = floatBitsToInt(uf_blockVS8[3].x * 1.0);
R124i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].y, intBitsToFloat(PS1i)));
R126i.y = floatBitsToInt(float(R127i.x));
// 17
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(R126i.y))?1.0:0.0);
PV1iy = floatBitsToInt((intBitsToFloat(R126i.y) > 0.0)?1.0:0.0);
R124i.x = floatBitsToInt(float(R127i.x));
// 18
R127i.x = floatBitsToInt(abs(intBitsToFloat(R124i.x)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R124i.x)), intBitsToFloat(R126i.z)));
// 19
PV1iy = floatBitsToInt(trunc(intBitsToFloat(PV0iw)));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iz) * 0.5 + intBitsToFloat(R126i.y));
// 20
PV0ix = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(R125i.y));
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iy)),intBitsToFloat(R126i.w)) + intBitsToFloat(R127i.x));
// 21
PV1ix = floatBitsToInt((intBitsToFloat(R126i.w) >= abs(intBitsToFloat(R1i.w)))?1.0:0.0);
PV1iy = floatBitsToInt(-(abs(intBitsToFloat(R1i.w))) + intBitsToFloat(R126i.w));
PV1iz = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
// 22
R126i.z = ((intBitsToFloat(PV1ix) == 0.0)?(R126i.w):(PV1iy));
PS0i = int(intBitsToFloat(PV1iz));
// 23
PV1iw = floatBitsToInt(abs(intBitsToFloat(R1i.w)) + intBitsToFloat(R126i.z));
PS1i = floatBitsToInt(float(PS0i));
// 24
R123i.y = ((-(intBitsToFloat(R126i.z)) > 0.0)?(PV1iw):(R126i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.w)),intBitsToFloat(PS1i)) + intBitsToFloat(R127i.z));
// 25
R123i.x = ((-(intBitsToFloat(R124i.x)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.y)))):(R123i.y));
R124i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.w)),intBitsToFloat(R125i.z)) + -(intBitsToFloat(R123i.w)));
// 26
R123i.z = ((intBitsToFloat(R1i.w) == 0.0)?(R124i.x):(R123i.x));
// 27
PS1i = int(intBitsToFloat(R123i.z));
// 28
PS0i = floatBitsToInt(float(PS1i));
// 29
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(PS0i)) + intBitsToFloat(R124i.z));
// 30
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.y));
// 31
R0i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.z)),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.y));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R127i.y)) + intBitsToFloat(R124i.w));
R0i.z = 0;
}
if( activeMaskStackC[3] == true ) {
// 0
R13i.y = floatBitsToInt(uf_blockVS7[104].x);
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.z));
// export
passParameterSem8 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.z));
}
