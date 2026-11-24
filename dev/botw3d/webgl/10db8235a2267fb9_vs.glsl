#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 10db8235a2267fb9
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
vec4 uf_blockVS8[11];
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

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem7;
out vec4 passParameterSem8;
out vec4 passParameterSem10;
out vec4 passParameterSem11;
out vec4 passParameterSem13;
out vec4 passParameterSem4;
out vec4 passParameterSem9;
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
attrDecoder = attrDataSem6;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem8;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R9i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem7;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
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
R8i.z = floatBitsToInt(-(intBitsToFloat(R8i.y)) + 1.0);
R3i.w = 0;
R10i.w = floatBitsToInt(1.0);
// 1
R8i.w = floatBitsToInt(-(intBitsToFloat(R2i.w)) + uf_blockVS8[2].x);
R4i.w = floatBitsToInt(-(intBitsToFloat(R8i.x)) + 1.0);
// 2
predResult = (0.0 > intBitsToFloat(R8i.w));
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
R14i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R10i.x = 0;
// 1
R2i.w = R10i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R2i.w = R3i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R2i.w == 0);
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
R20i.x = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R8i.w) >= intBitsToFloat(R20i.x));
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
R14i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R10i.x = 0;
// 1
R3i.w = R10i.w;
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
tempi.x = floatBitsToInt(dot(vec4(uf_blockVS8[8].x,uf_blockVS8[8].y,uf_blockVS8[8].z,intBitsToFloat(0x80000000)),vec4(uf_blockVS8[8].x,uf_blockVS8[8].y,uf_blockVS8[8].z,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(uf_blockVS8[9].x,uf_blockVS8[9].y,uf_blockVS8[9].z,intBitsToFloat(0x80000000)),vec4(uf_blockVS8[9].x,uf_blockVS8[9].y,uf_blockVS8[9].z,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R0i.y = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 2
tempi.x = floatBitsToInt(dot(vec4(uf_blockVS8[10].x,uf_blockVS8[10].y,uf_blockVS8[10].z,intBitsToFloat(0x80000000)),vec4(uf_blockVS8[10].x,uf_blockVS8[10].y,uf_blockVS8[10].z,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R3i.w = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
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
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R0i.y));
// 1
R0i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS8[8].x, intBitsToFloat(R127i.x)));
R1i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS8[9].x, intBitsToFloat(R127i.x)));
// 2
R2i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS8[10].x, intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R0i.w = 0;
// 1
R2i.w = R0i.w;
// 2
R1i.w = R0i.w;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (intBitsToFloat(R3i.w) > 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R3i.w));
// 1
R12i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS8[9].y, intBitsToFloat(R127i.x)));
R3i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS8[8].y, intBitsToFloat(R127i.x)));
// 2
R11i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS8[10].y, intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R11i.y = 0;
R12i.z = 0;
R3i.w = 0;
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
R13i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS8[9].z, intBitsToFloat(R127i.x)));
R10i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS8[8].z, intBitsToFloat(R127i.x)));
// 2
R12i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS8[10].z, intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R12i.y = 0;
R13i.z = 0;
R10i.w = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(max(intBitsToFloat(R5i.x), 0.0));
PV0iy = floatBitsToInt((0.0 > uf_blockVS7[9].x)?1.0:0.0);
PV0iz = floatBitsToInt((uf_blockVS7[9].x > 0.0)?1.0:0.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), uf_blockVS7[10].y));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[9].x);
// 1
R126i.x = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(intBitsToFloat(R8i.w) * intBitsToFloat(PS0i));
R127i.z = floatBitsToInt(-(uf_blockVS7[96].w) + uf_blockVS7[97].w);
R126i.w = floatBitsToInt(-(uf_blockVS7[96].z) + uf_blockVS7[97].z);
R11i.z = floatBitsToInt(1.0 / intBitsToFloat(R20i.x));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1iy));
R10i.y = floatBitsToInt(intBitsToFloat(R8i.w) * intBitsToFloat(R11i.z));
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
R127i.w = floatBitsToInt(-(uf_blockVS7[96].x) + uf_blockVS7[97].x);
R127i.y = floatBitsToInt(-(uf_blockVS7[96].y) + uf_blockVS7[97].y);
// 3
backupReg0i = R127i.z;
PV1ix = floatBitsToInt(min(intBitsToFloat(R127i.x), 0.0));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(PV0iz)));
PV1iw = floatBitsToInt(fract(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 4
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1iw)));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS1i));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS1i));
R0i.x = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV1ix));
// 5
R10i.x = ((uf_blockVS7[12].x == 1.0)?-1:0);
PV1iw = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iy));
R11i.w = floatBitsToInt(-(uf_blockVS7[12].x) + 1.0);
// 6
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + -(uf_blockVS7[97].w));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(uf_blockVS7[96].w));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R126i.x)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R127i.w)));
R127i.z = ((intBitsToFloat(PV0ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R126i.z)));
R127i.w = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 8
R126i.x = floatBitsToInt(uf_blockVS7[96].x + intBitsToFloat(PV1ix));
R127i.y = floatBitsToInt(uf_blockVS7[96].y + intBitsToFloat(PV1iy));
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R126i.w = floatBitsToInt(uf_blockVS7[96].z + intBitsToFloat(PV1iw));
PS0i = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
// 9
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].y, intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0iz)));
R126i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].z, intBitsToFloat(PS0i)));
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].x, intBitsToFloat(PS0i)));
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV1iy)));
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[97].x, intBitsToFloat(R127i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV1iy)));
R126i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[97].y, intBitsToFloat(R127i.z)));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(R126i.z));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R127i.w));
PV1iz = floatBitsToInt(mul_nonIEEE(uf_blockVS7[97].z, intBitsToFloat(R127i.z)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R127i.x));
// 12
PV0iy = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV1iw));
PV0iz = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PV1ix));
// 13
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV0iz)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(PV0iw)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(PV0iy)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
backupReg0i = R0i.y;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), uf_blockVS8[3].y));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), uf_blockVS8[3].z));
R12i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), uf_blockVS8[3].w));
// 1
R0i.z = floatBitsToInt(uf_blockVS8[2].w + intBitsToFloat(R8i.w));
// 2
predResult = (R10i.x != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R0i.z)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].w, intBitsToFloat(PV0ix)));
// 2
R6i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].x, intBitsToFloat(PV1iw)));
R6i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].y, intBitsToFloat(PV1iw)));
R6i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].z, intBitsToFloat(PV1iw)));
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
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PS1i)));
R127i.y = ((uf_blockVS7[12].x == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R11i.w));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R0i.z) + -(intBitsToFloat(PV1iz)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].w, intBitsToFloat(PV1ix)));
// 9
R6i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].x, intBitsToFloat(PV0iw)));
R6i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].y, intBitsToFloat(PV0iw)));
R6i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].z, intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z), intBitsToFloat(R6i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R6i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(R6i.y)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R6i.x)));
tempResultf = max(0.0, uf_blockVS7[12].x);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.z), intBitsToFloat(R6i.y)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(R6i.x)));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PS0i)));
R126i.x = floatBitsToInt(1.0 / intBitsToFloat(R11i.w));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(R127i.w));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(R6i.z)));
R126i.z = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R6i.z)));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iw)));
// 3
backupReg0i = R127i.z;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(R6i.z)));
PV1iy = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R127i.z = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PV0ix));
R127i.w = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(backupReg0i));
// 4
R127i.y = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R126i.z));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(R126i.x));
// 5
R123i.z = ((R10i.x == 0)?(PV0iw):(R0i.z));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R123i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R123i.z)));
// 7
R6i.x = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0iy));
R6i.y = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0ix));
R0i.z = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV0iw));
// 8
predResult = (R10i.x != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(R8i.w)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].w, intBitsToFloat(PV0ix)));
// 2
R11i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].x, intBitsToFloat(PV1iw)));
R13i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].y, intBitsToFloat(PV1iw)));
R6i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].z, intBitsToFloat(PV1iw)));
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
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(PS1i)));
R127i.y = ((uf_blockVS7[12].x == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R11i.w));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R8i.w) + -(intBitsToFloat(PV1iz)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].w, intBitsToFloat(PV1ix)));
// 9
R11i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].x, intBitsToFloat(PV0iw)));
R13i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].y, intBitsToFloat(PV0iw)));
R6i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].z, intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R127i.w = tempi.x;
tempResultf = max(0.0, uf_blockVS7[12].x);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.z), intBitsToFloat(R13i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z), intBitsToFloat(R13i.y)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(R13i.y)));
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(R11i.w));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(R11i.x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R11i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R11i.x)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(R6i.z)));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
// 3
backupReg0i = R127i.y;
backupReg1i = R127i.w;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iy));
R127i.y = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R127i.w = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV0ix));
tempResultf = 1.0 / sqrt(intBitsToFloat(backupReg1i));
R127i.z = floatBitsToInt(tempResultf);
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(R126i.y));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R6i.z)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(R6i.z)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R127i.z)));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R127i.z)));
// 5
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R127i.z)));
PV1iy = floatBitsToInt(uf_blockVS7[13].x);
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) / 2.0);
PV1iz = floatBitsToInt(uf_blockVS7[13].y);
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) / 2.0);
R126i.w = ((R10i.x == 0)?(PV0ix):(R8i.w));
R124i.x = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(R127i.y));
// 6
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV1iy));
R127i.y = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV1iz));
R127i.z = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(R127i.w));
R127i.w = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(backupReg0i));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R126i.w)));
// 7
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R126i.w)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R126i.w)));
R125i.z = floatBitsToInt(intBitsToFloat(R124i.w) * intBitsToFloat(0x3a83126f));
R126i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3a83126f));
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(0x3a83126f));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(R6i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(R6i.x)));
R126i.z = floatBitsToInt(intBitsToFloat(R124i.x) + intBitsToFloat(R126i.z));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(R0i.z)));
R124i.z = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1iy));
// 9
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV0iy));
R126i.y = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(backupReg0i));
R127i.z = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV0ix));
R127i.w = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0iw));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R127i.y)));
// 10
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R127i.x)));
R127i.y = ((intBitsToFloat(0x3a83126f) > intBitsToFloat(R8i.w))?-1:0);
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R12i.w)));
PV0iw = floatBitsToInt(intBitsToFloat(R6i.x) + -(intBitsToFloat(R125i.z)));
PS0i = floatBitsToInt(intBitsToFloat(R6i.y) + -(intBitsToFloat(R126i.w)));
// 11
R1i.x = 0x3f800000;
PV1iy = floatBitsToInt(intBitsToFloat(R0i.z) + -(intBitsToFloat(R125i.x)));
R123i.z = ((R127i.y == 0)?(R126i.z):(PV0iw));
R126i.w = 0x3f800000;
R122i.x = ((R127i.y == 0)?(R124i.z):(PS0i));
// 12
backupReg0i = R127i.y;
R125i.x = floatBitsToInt(intBitsToFloat(R6i.x) + -(intBitsToFloat(R123i.z)));
R127i.y = floatBitsToInt(intBitsToFloat(R6i.y) + -(intBitsToFloat(R122i.x)));
R123i.z = ((backupReg0i == 0)?(R126i.y):(PV1iy));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R7i.x)));
R124i.w = floatBitsToInt(1.0 / uf_blockVS8[2].w);
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w),intBitsToFloat(R126i.w)),vec4(uf_blockVS8[4].x,uf_blockVS8[4].y,uf_blockVS8[4].z,uf_blockVS8[4].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R1i.w = tempi.x;
R126i.z = floatBitsToInt(intBitsToFloat(R0i.z) + -(intBitsToFloat(R123i.z)));
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w),intBitsToFloat(R126i.w)),vec4(uf_blockVS8[5].x,uf_blockVS8[5].y,uf_blockVS8[5].z,uf_blockVS8[5].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R6i.z = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R7i.z)));
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w),intBitsToFloat(R126i.w)),vec4(uf_blockVS8[6].x,uf_blockVS8[6].y,uf_blockVS8[6].z,uf_blockVS8[6].w)));
PV1ix = tempi.x;
R4i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R7i.y)));
// 16
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS8[4].x,uf_blockVS8[4].y,uf_blockVS8[4].z,0.0)));
PV0iy = R126i.x;
PV0iz = R126i.x;
PV0iw = R126i.x;
R6i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.x)),intBitsToFloat(R3i.y)) + intBitsToFloat(PS1i));
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS8[5].x,uf_blockVS8[5].y,uf_blockVS8[5].z,0.0)));
PV1ix = tempi.x;
R126i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R0i.x = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(R124i.w));
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS8[6].x,uf_blockVS8[6].y,uf_blockVS8[6].z,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R126i.z = tempi.x;
PV0iw = tempi.x;
R11i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(R124i.w));
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(PV0ix),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(PV0ix),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R0i.z = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(R124i.w));
// 20
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R126i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 21
R6i.x = ((intBitsToFloat(PS0i) > 0.0)?-1:0);
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.y)),intBitsToFloat(R3i.z)) + intBitsToFloat(R127i.x));
R4i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.z)),intBitsToFloat(R3i.x)) + intBitsToFloat(R125i.w));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 22
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS1i)));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS1i)));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS1i)));
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(R123i.y)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.x)),vec4(uf_blockVS6[12].x,uf_blockVS6[12].y,uf_blockVS6[12].z,uf_blockVS6[12].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(R4i.z)));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.x)),vec4(uf_blockVS6[13].x,uf_blockVS6[13].y,uf_blockVS6[13].z,uf_blockVS6[13].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R2i.x = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(PV0ix));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.x)),vec4(uf_blockVS6[14].x,uf_blockVS6[14].y,uf_blockVS6[14].z,uf_blockVS6[14].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R2i.y = floatBitsToInt(intBitsToFloat(R6i.z) + intBitsToFloat(PV1ix));
// 3
R1i.x = floatBitsToInt(-(intBitsToFloat(R1i.w)) + intBitsToFloat(R2i.x));
R1i.y = floatBitsToInt(-(intBitsToFloat(R6i.z)) + intBitsToFloat(R2i.y));
R2i.z = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV0ix));
R125i.w = floatBitsToInt(uf_blockVS6[12].z);
R124i.w = floatBitsToInt(uf_blockVS6[13].z);
// 4
R126i.x = floatBitsToInt(uf_blockVS6[14].z);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R125i.w)));
R1i.z = floatBitsToInt(-(intBitsToFloat(R4i.y)) + intBitsToFloat(R2i.z));
R126i.w = floatBitsToInt(uf_blockVS6[12].y);
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(R6i.w)));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R124i.z = floatBitsToInt(uf_blockVS6[13].y);
// 6
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R124i.w)));
R125i.y = floatBitsToInt(uf_blockVS6[14].y);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R125i.w)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R126i.x)));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 7
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R125i.w)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R126i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R124i.w)));
PV1iw = ((intBitsToFloat(PS0i) > 0.0)?-1:0);
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R124i.w)));
// 8
R20i.x = floatBitsToInt(uf_blockVS6[12].x);
R4i.y = floatBitsToInt(uf_blockVS6[13].x);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R126i.x)));
R0i.w = ((PV1iw == 0)?(0):(R6i.x));
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R126i.w)) + intBitsToFloat(R126i.y));
// 9
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(R126i.w)) + intBitsToFloat(R126i.z));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R124i.z)) + intBitsToFloat(R127i.x));
R6i.z = floatBitsToInt(uf_blockVS6[14].x);
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R125i.y)) + intBitsToFloat(R127i.w));
// 10
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(R124i.z)) + intBitsToFloat(R127i.z));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(R125i.y)) + intBitsToFloat(R127i.y));
// 11
R18i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R126i.w)) + intBitsToFloat(R125i.x));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R124i.z)) + intBitsToFloat(R125i.w));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R125i.y)) + intBitsToFloat(R125i.z));
// 12
predResult = (R0i.w != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), uf_blockVS7[95].x));
// 1
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), uf_blockVS7[95].x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), uf_blockVS7[95].x));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PS1i)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R12i.y),intBitsToFloat(R13i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.z)));
// 5
R2i.x = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(PV0iy));
R2i.y = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(PV0ix));
R2i.z = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(PV0iw));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt((uf_blockVS7[8].x > 0.0)?1.0:0.0);
R127i.y = floatBitsToInt((uf_blockVS7[8].y > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > uf_blockVS7[8].x)?1.0:0.0);
R1i.w = 0x3f800000;
PS0i = floatBitsToInt(1.0 / uf_blockVS7[8].x);
// 1
R126i.x = floatBitsToInt(-(uf_blockVS7[60].x) + uf_blockVS7[61].x);
R126i.y = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iz)));
R127i.z = floatBitsToInt(-(uf_blockVS7[60].y) + uf_blockVS7[61].y);
PV1iw = floatBitsToInt(intBitsToFloat(R8i.w) * intBitsToFloat(PS0i));
// 2
R127i.x = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
PV0iy = floatBitsToInt((0.0 > uf_blockVS7[8].y)?1.0:0.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),uf_blockVS7[9].y) + intBitsToFloat(PV1iw));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[8].y);
// 3
R0i.x = floatBitsToInt(intBitsToFloat(R127i.y) + -(intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
R126i.z = floatBitsToInt(-(uf_blockVS7[60].z) + uf_blockVS7[61].z);
PV1iw = floatBitsToInt(-(uf_blockVS7[60].w) + uf_blockVS7[61].w);
PS1i = floatBitsToInt(intBitsToFloat(R8i.w) * intBitsToFloat(PS0i));
// 4
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),uf_blockVS7[9].z) + intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV1iy)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 5
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS0i));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS0i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV0iw));
R127i.w = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(PS0i));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R123i.z) + -(uf_blockVS7[61].w));
PV0iy = floatBitsToInt(intBitsToFloat(R123i.z) + -(uf_blockVS7[60].w));
// 7
backupReg0i = R126i.y;
backupReg1i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R127i.w)) + uf_blockVS7[60].x);
R126i.y = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(backupReg0i)) + uf_blockVS7[60].z);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(backupReg1i)) + uf_blockVS7[60].y);
R126i.w = ((intBitsToFloat(PV0ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 8
PV0ix = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockVS7[60].z, intBitsToFloat(PV0ix)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(mul_nonIEEE(uf_blockVS7[60].y, intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[60].x, intBitsToFloat(PV0ix)));
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PV1iy)) + intBitsToFloat(PV1iw));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV1iy)) + intBitsToFloat(PV1ix));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV1iy)) + intBitsToFloat(PV1iz));
// 11
R1i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[61].y,intBitsToFloat(R126i.w)) + intBitsToFloat(R123i.w));
R1i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[61].x,intBitsToFloat(R126i.w)) + intBitsToFloat(R123i.x));
R0i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[61].z,intBitsToFloat(R126i.w)) + intBitsToFloat(R123i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
R14i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS6[8].x,uf_blockVS6[8].y,uf_blockVS6[8].z,uf_blockVS6[8].w)));
PV0iy = R14i.x;
PV0iz = R14i.x;
PV0iw = R14i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS6[9].x,uf_blockVS6[9].y,uf_blockVS6[9].z,uf_blockVS6[9].w)));
PV1ix = tempi.x;
R14i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.x = floatBitsToInt(fract(intBitsToFloat(R0i.y)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS6[10].x,uf_blockVS6[10].y,uf_blockVS6[10].z,uf_blockVS6[10].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R14i.z = tempi.x;
PV0iw = tempi.x;
R126i.w = floatBitsToInt(-(intBitsToFloat(R0i.x)) + 1.0);
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS6[11].x,uf_blockVS6[11].y,uf_blockVS6[11].z,uf_blockVS6[11].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R14i.w = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R127i.x)));
// 4
PV0ix = PV1ix;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(R126i.w)) + intBitsToFloat(PS1i));
// 5
R123i.x = floatBitsToInt(intBitsToFloat(R14i.z) * 0.0 + intBitsToFloat(PV0ix));
R127i.y = floatBitsToInt(intBitsToFloat(R126i.y) + -(uf_blockVS7[68].w));
R15i.z = floatBitsToInt(intBitsToFloat(R14i.z) * 0.5 + intBitsToFloat(PV0ix));
R15i.w = floatBitsToInt(intBitsToFloat(R14i.z) * 0.0 + intBitsToFloat(R14i.w));
// 6
R15i.x = floatBitsToInt(intBitsToFloat(R14i.x) * 0.5 + intBitsToFloat(R123i.x));
R15i.y = floatBitsToInt(intBitsToFloat(R14i.y) * -(0.5) + intBitsToFloat(R123i.x));
R126i.w = floatBitsToInt(-(uf_blockVS7[68].x) + uf_blockVS7[69].x);
// 7
R127i.x = ((intBitsToFloat(R127i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iy = floatBitsToInt(intBitsToFloat(R126i.y) + -(uf_blockVS7[69].w));
PV1iz = floatBitsToInt(-(uf_blockVS7[68].w) + uf_blockVS7[69].w);
// 8
R126i.x = ((intBitsToFloat(PV1iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R0i.z = floatBitsToInt(uf_blockVS7[76].x);
R2i.w = floatBitsToInt(uf_blockVS7[76].y);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS0i));
R126i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[68].x, intBitsToFloat(PV0iy)));
R1i.z = floatBitsToInt(uf_blockVS7[76].z);
PV1iw = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
// 10
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV1iw)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PV1ix)) + uf_blockVS7[68].x);
// 11
R127i.x = floatBitsToInt(-(uf_blockVS7[84].x) + uf_blockVS7[85].x);
PV1iy = ((intBitsToFloat(R5i.x) > 0.5)?-1:0);
PV1iz = ((intBitsToFloat(R5i.y) > 0.5)?-1:0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(PV0iz)) + intBitsToFloat(R126i.y));
// 12
R0i.x = ((PV1iy == 0)?(R8i.x):(R4i.w));
R2i.z = ((PV1iz == 0)?(R8i.y):(R8i.z));
R1i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[69].x,intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.w));
// 13
PV1iw = floatBitsToInt(-(uf_blockVS7[84].w) + uf_blockVS7[85].w);
// 14
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 15
R0i.y = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS0i));
}
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R1i.x;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), uf_blockVS8[0].x));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), uf_blockVS8[0].y));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), uf_blockVS8[0].z));
R16i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), uf_blockVS8[0].w));
// 1
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), uf_blockVS7[59].x));
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), uf_blockVS7[59].x));
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), uf_blockVS7[59].x));
PV1iw = ((intBitsToFloat(R5i.z) > 0.5)?-1:0);
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), uf_blockVS8[1].x));
// 2
R1i.x = ((PV1iw == 0)?(R8i.x):(R4i.w));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), uf_blockVS8[1].y));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), uf_blockVS8[1].z));
PV0iw = ((intBitsToFloat(R5i.w) > 0.5)?-1:0);
PS0i = ((intBitsToFloat(R5i.y) > 0.5)?-1:0);
// 3
R2i.x = ((PV0iw == 0)?(R8i.y):(R8i.z));
R2i.w = ((PS0i == 0)?(R8i.x):(R4i.w));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(uf_blockVS7[5].x) & 0x80000;
PV0iy = floatBitsToInt(uf_blockVS7[5].x) & 0x100000;
PV0iz = floatBitsToInt((0.0 > uf_blockVS7[8].w)?1.0:0.0);
PV0iw = floatBitsToInt((uf_blockVS7[8].w > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(1.0 / uf_blockVS7[8].w);
// 1
PV1ix = (PV0ix == 0x80000)?-1:0;
R126i.y = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
PV1iz = (PV0iy == 0x100000)?-1:0;
PV1iw = floatBitsToInt(intBitsToFloat(R8i.w) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(uf_blockVS7[5].x) & 0x200000;
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),uf_blockVS7[10].x) + intBitsToFloat(PV1iw));
R2i.y = ((PV1iz == 0)?(R8i.y):(R2i.z));
R4i.z = ((PV1ix == 0)?(R8i.x):(R0i.x));
R126i.w = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
PS0i = (PS1i == 0x200000)?-1:0;
// 3
R6i.x = ((PS0i == 0)?(R8i.x):(R1i.x));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
PV1iz = floatBitsToInt(uf_blockVS7[5].x) & 0x800000;
PV1iw = floatBitsToInt(uf_blockVS7[5].x) & 0x400000;
PS1i = floatBitsToInt(uf_blockVS7[5].x) & 0x1000000;
// 4
R127i.x = (PS1i == 0x1000000)?-1:0;
PV0iy = (PV1iz == 0x800000)?-1:0;
PV0iz = (PV1iw == 0x400000)?-1:0;
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV1iy)));
PS0i = ((intBitsToFloat(R5i.z) > 0.5)?-1:0);
// 5
R10i.x = ((PV0iy == 0)?(R8i.x):(R2i.w));
R123i.y = ((PS0i == 0)?(R8i.y):(R8i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(R126i.w)) + intBitsToFloat(PV0iw));
R4i.w = ((PV0iz == 0)?(R8i.y):(R2i.x));
PS1i = floatBitsToInt(uf_blockVS7[5].y) & int(1);
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R123i.z) + -(uf_blockVS7[84].w));
R8i.y = ((R127i.x == 0)?(R8i.y):(R123i.y));
PV0iz = floatBitsToInt(intBitsToFloat(R123i.z) + -(uf_blockVS7[85].w));
R3i.w = (int(1) != PS1i)?-1:0;
// 7
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R0i.y)) + uf_blockVS7[84].x);
R126i.y = ((intBitsToFloat(PV0iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
R2i.z = ((R3i.w == 0)?(R5i.x):(R5i.z));
R126i.w = ((intBitsToFloat(PV0ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS1i = floatBitsToInt(uf_blockVS7[5].x) & 0x1000;
// 8
PV0ix = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
PV0iw = floatBitsToInt(uf_blockVS7[5].x) & 0x2000;
PS0i = floatBitsToInt(float(PS1i));
// 9
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockVS7[84].x, intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(float(PV0iw));
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PV1iw)) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iz)));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iz)));
R2i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[85].x,intBitsToFloat(R126i.y)) + intBitsToFloat(R123i.x));
R127i.z = int(intBitsToFloat(PV0iw));
// 12
PV0iy = 0 - R127i.z;
PV0iw = floatBitsToInt(uf_blockVS7[5].x) & 0x4000;
R126i.z = int(intBitsToFloat(PV1ix));
// 13
R8i.x = max(R127i.z, PV0iy);
PV1iy = 0 - R126i.z;
PS1i = floatBitsToInt(float(PV0iw));
// 14
R2i.x = max(R126i.z, PV1iy);
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
// 15
R0i.w = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iz)));
}
if( activeMaskStackC[3] == true ) {
// 0
R17i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R4i.x)));
R17i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R1i.y)));
R17i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R0i.z)));
R17i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), uf_blockVS8[1].w));
// 1
R127i.y = int(uf_blockVS7[35].x);
// 2
R127i.w = int(-1) + R127i.y;
R127i.x = int(uf_blockVS7[35].y);
// 3
R126i.z = int(intBitsToFloat(R0i.w));
// 4
PV0iy = 0 - R126i.z;
R126i.w = floatBitsToInt(float(R127i.y));
// 5
R1i.x = max(R126i.z, PV0iy);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R126i.w)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(R126i.w)));
PS1i = floatBitsToInt(float(R127i.x));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R11i.z) * intBitsToFloat(PV1iz));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 7
R126i.y = floatBitsToInt(intBitsToFloat(R8i.w) * intBitsToFloat(PS0i));
PS1i = int(intBitsToFloat(PV0iy));
// 8
R125i.w = R8i.x * PS1i;
// 9
R8i.x = int(intBitsToFloat(R126i.y));
// 10
PS0i = floatBitsToInt(float(R8i.x));
// 11
PV1iz = floatBitsToInt(-(intBitsToFloat(R126i.w)) + intBitsToFloat(PS0i));
R1i.z = floatBitsToInt(float(R127i.y));
// 12
R4i.x = floatBitsToInt(abs(intBitsToFloat(R1i.z)));
R123i.y = ((intBitsToFloat(PV1iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.y = floatBitsToInt(float(R8i.x));
// 13
R126i.x = floatBitsToInt(abs(intBitsToFloat(R127i.y)));
R127i.x = int(intBitsToFloat(R123i.y));
// 14
R126i.z = int(1) - R127i.x;
R0i.x = floatBitsToInt(1.0 / abs(intBitsToFloat(R1i.z)));
// 15
PV1iw = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R127i.y)), intBitsToFloat(R0i.x)));
R127i.x = R127i.x * R127i.w;
// 16
PV0iz = floatBitsToInt(trunc(intBitsToFloat(PV1iw)));
R0i.y = int(intBitsToFloat(R125i.y));
// 17
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iz)),intBitsToFloat(R4i.x)) + intBitsToFloat(R126i.x));
// 18
PV0iy = floatBitsToInt((intBitsToFloat(R127i.w) >= abs(intBitsToFloat(R1i.z)))?1.0:0.0);
PV0iz = floatBitsToInt(-(abs(intBitsToFloat(R1i.z))) + intBitsToFloat(R127i.w));
// 19
R126i.x = ((intBitsToFloat(PV0iy) == 0.0)?(R127i.w):(PV0iz));
// 20
PV0iw = floatBitsToInt(abs(intBitsToFloat(R1i.z)) + intBitsToFloat(R126i.x));
// 21
R123i.z = ((-(intBitsToFloat(R126i.x)) > 0.0)?(PV0iw):(R126i.x));
// 22
R123i.y = ((-(intBitsToFloat(R127i.y)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.z)))):(R123i.z));
// 23
R123i.x = ((intBitsToFloat(R1i.z) == 0.0)?(R127i.y):(R123i.y));
// 24
PS0i = int(intBitsToFloat(R123i.x));
// 25
PS1i = R126i.z * PS0i;
// 26
PV0iw = PS1i + R127i.x;
// 27
PS1i = R2i.x * PV0iw;
// 28
R2i.z = PS1i + R125i.w;
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x8000000;
PV0iw = floatBitsToInt(uf_blockVS7[5].x) & 0x8000;
// 1
PS1i = floatBitsToInt(float(PV0iw));
// 2
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(R126i.z));
// 3
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
// 4
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iy)));
R126i.z = int(intBitsToFloat(PV1iw));
// 5
PV1iy = 0 - R126i.z;
R127i.y = int(intBitsToFloat(PV0iz));
// 6
PV0ix = max(R126i.z, PV1iy);
PV0iy = 0 - R127i.y;
// 7
PV1iw = max(R127i.y, PV0iy);
R126i.z = PV0ix * R0i.y;
// 8
PS0i = PV1iw * R0i.y;
// 9
PV1iw = R8i.x + PS0i;
// 10
PS0i = R1i.x * PV1iw;
// 11
PV1iy = PS0i + R2i.z;
// 12
PV0ix = R126i.z + PV1iy;
// 13
R127i.w = floatBitsToInt(float(PV0ix));
// 14
backupReg0i = R127i.w;
R127i.x = floatBitsToInt(abs(intBitsToFloat(backupReg0i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), abs(intBitsToFloat(backupReg0i))));
// 15
PV1iy = floatBitsToInt(trunc(intBitsToFloat(PV0iz)));
// 16
R125i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iy)),intBitsToFloat(R4i.x)) + intBitsToFloat(R127i.x));
// 17
PV1iy = floatBitsToInt((intBitsToFloat(R125i.w) >= abs(intBitsToFloat(R1i.z)))?1.0:0.0);
PV1iz = floatBitsToInt(-(abs(intBitsToFloat(R1i.z))) + intBitsToFloat(R125i.w));
// 18
R127i.x = ((intBitsToFloat(PV1iy) == 0.0)?(R125i.w):(PV1iz));
// 19
PV1iw = floatBitsToInt(abs(intBitsToFloat(R1i.z)) + intBitsToFloat(R127i.x));
// 20
R123i.z = ((-(intBitsToFloat(R127i.x)) > 0.0)?(PV1iw):(R127i.x));
// 21
R123i.y = ((-(intBitsToFloat(R127i.w)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.z)))):(R123i.z));
// 22
R123i.x = ((intBitsToFloat(R1i.z) == 0.0)?(R127i.w):(R123i.y));
// 23
R127i.w = int(intBitsToFloat(R123i.x));
// 24
R126i.z = floatBitsToInt(float(R127i.w));
// 25
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(R126i.z))?1.0:0.0);
PV1iy = floatBitsToInt((intBitsToFloat(R126i.z) > 0.0)?1.0:0.0);
R125i.y = floatBitsToInt(float(R127i.w));
// 26
PV0ix = floatBitsToInt(abs(intBitsToFloat(R125i.y)) * 0.25);
R127i.z = floatBitsToInt(abs(intBitsToFloat(R125i.y)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1ix)));
// 27
R123i.z = floatBitsToInt(intBitsToFloat(PV0iw) * 0.5 + intBitsToFloat(R126i.z));
PV1iw = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
// 28
PV0ix = floatBitsToInt(intBitsToFloat(R123i.z) * 0.25);
R127i.y = floatBitsToInt(-(intBitsToFloat(PV1iw)) * 4.0 + intBitsToFloat(R127i.z));
// 29
PV1ix = floatBitsToInt(intBitsToFloat(R127i.y) + -4.0);
PV1iy = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt((intBitsToFloat(R127i.y) >= 4.0)?1.0:0.0);
// 30
R127i.z = ((intBitsToFloat(PV1iw) == 0.0)?(R127i.y):(PV1ix));
PS0i = int(intBitsToFloat(PV1iy));
// 31
PV1iy = floatBitsToInt(intBitsToFloat(R127i.z) + 4.0);
R1i.z = PS0i + 0x24;
PS1i = int(uf_blockVS7[48].z);
// 32
R123i.x = ((-(intBitsToFloat(R127i.z)) > 0.0)?(PV1iy):(R127i.z));
R0i.z = floatBitsToInt(float(PS1i));
// 33
PV1ix = floatBitsToInt((0.0 >= abs(intBitsToFloat(R0i.z)))?1.0:0.0);
PV1iy = floatBitsToInt(-(abs(intBitsToFloat(R0i.z))) + 0.0);
R123i.w = ((-(intBitsToFloat(R125i.y)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.x)))):(R123i.x));
// 34
R0i.w = ((intBitsToFloat(PV1ix) == 0.0)?(0):(PV1iy));
R2i.z = int(intBitsToFloat(R123i.w));
}
if( activeMaskStackC[3] == true ) {
R1i.xyzw = floatBitsToInt(uf_blockVS7[R1i.z].xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = 0xfffffffe + R2i.z;
PV0iy = int(-1) + R2i.z;
PV0iz = floatBitsToInt(abs(intBitsToFloat(R0i.z)) + intBitsToFloat(R0i.w));
R125i.w = 0xfffffffd + R2i.z;
PS0i = floatBitsToInt(float(R2i.z));
// 1
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R123i.y = ((-(intBitsToFloat(R0i.w)) > 0.0)?(PV0iz):(R0i.w));
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PS1i = floatBitsToInt(float(PV0iy));
// 2
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R127i.y = ((intBitsToFloat(R0i.z) == 0.0)?(0):(R123i.y));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(R127i.x));
// 3
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), uf_blockVS7[45].x));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
R125i.y = int(intBitsToFloat(PV0iz));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1ix)));
PV0iy = 0 - R125i.y;
PV0iz = floatBitsToInt(uf_blockVS7[44].z + uf_blockVS7[45].x);
R127i.x = int(intBitsToFloat(PV1iy));
// 5
R126i.x = floatBitsToInt(-(intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iz));
PV1iy = 0 - R127i.x;
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), uf_blockVS7[45].y));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 2.0);
PV1iw = max(R125i.y, PV0iy);
R127i.w = int(intBitsToFloat(PV0ix));
// 6
PV0ix = int(1) - PV1iw;
PV0iy = 0 - R127i.w;
PV0iz = max(R127i.x, PV1iy);
PV0iw = floatBitsToInt(uf_blockVS7[44].w + uf_blockVS7[45].y);
R126i.z = floatBitsToInt(float(R125i.w));
// 7
R127i.x = floatBitsToInt(-(intBitsToFloat(R127i.z)) + intBitsToFloat(PV0iw));
PV1iy = max(R127i.w, PV0iy);
PV1iz = int(1) - PV0iz;
R127i.w = floatBitsToInt((intBitsToFloat(R126i.z) > 0.0)?1.0:0.0);
R125i.w = PV0ix * R1i.x;
// 8
PV0ix = int(1) - PV1iy;
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(R126i.z))?1.0:0.0);
PV0iz = floatBitsToInt(uf_blockVS7[46].x + uf_blockVS7[46].z);
PV0iw = floatBitsToInt(uf_blockVS7[46].y + uf_blockVS7[46].w);
PS0i = PV1iz * R1i.y;
// 9
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),uf_blockVS7[46].z) + intBitsToFloat(PV0iz));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),uf_blockVS7[46].w) + intBitsToFloat(PV0iw));
PV1iz = PS0i + R125i.w;
PV1iw = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(PV0iy)));
PS1i = PV0ix * R1i.z;
// 10
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),uf_blockVS7[44].y) + intBitsToFloat(R127i.x));
R126i.y = PS1i + PV1iz;
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),uf_blockVS7[45].z) + intBitsToFloat(R123i.x));
R124i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R8i.w)),uf_blockVS7[44].x) + -(intBitsToFloat(R126i.x)));
R126i.z = int(intBitsToFloat(PV1iw));
// 11
backupReg0i = R126i.z;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),uf_blockVS7[45].w) + intBitsToFloat(R125i.y));
PV1iy = 0 - backupReg0i;
R123i.z = ((R3i.w == 0)?(0):(int(1)));
R126i.w = int(intBitsToFloat(R127i.y));
// 12
PV0ix = max(R126i.z, PV1iy);
PV0iz = (R123i.z == 0x2)?-1:0;
R127i.w = (R123i.z == int(1))?-1:0;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R0i.z));
// 13
R123i.x = ((PV0iz == 0)?(R5i.x):(R5i.z));
PV1iy = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
R123i.z = ((PV0iz == 0)?(R5i.y):(R5i.x));
PV1iw = int(1) - PV0ix;
PS1i = floatBitsToInt(1.0 / uf_blockVS7[48].z);
// 14
PV0ix = floatBitsToInt(trunc(intBitsToFloat(PV1iy)));
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].x, intBitsToFloat(PS1i)));
R126i.z = ((R127i.w == 0)?(R123i.z):(R5i.z));
R125i.w = ((R127i.w == 0)?(R123i.x):(R5i.y));
PS0i = PV1iw * R1i.w;
// 15
R4i.x = PS0i + R126i.y;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R127i.y)) + -(0.5));
R125i.z = ((R127i.w == 0)?(R5i.x):(R5i.y));
R1i.w = ((R127i.w == 0)?(R5i.y):(R5i.z));
R127i.w = int(intBitsToFloat(PV0ix));
// 16
backupReg0i = R126i.z;
R126i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[50].x, intBitsToFloat(R125i.w)));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) * 2.0);
R125i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[50].y, intBitsToFloat(backupReg0i)));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) * 2.0);
PS0i = floatBitsToInt(1.0 / uf_blockVS7[48].w);
// 17
backupReg0i = R126i.w;
R126i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].y, intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(float(backupReg0i));
// 18
backupReg0i = R127i.w;
PV0ix = floatBitsToInt(uf_blockVS7[49].w + uf_blockVS7[50].y);
PV0iy = floatBitsToInt(uf_blockVS7[49].z + uf_blockVS7[50].x);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PS1i)) + intBitsToFloat(R124i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R126i.w)) + -(0.5));
PS0i = floatBitsToInt(float(backupReg0i));
// 19
backupReg0i = R126i.y;
backupReg1i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(R126i.z)) + intBitsToFloat(PV0iy));
R126i.y = floatBitsToInt(-(intBitsToFloat(R125i.w)) + intBitsToFloat(PV0ix));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(backupReg0i)) + intBitsToFloat(R123i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.w)),intBitsToFloat(PS0i)) + intBitsToFloat(backupReg1i));
PS1i = int(uf_blockVS7[53].z);
// 20
PV0ix = floatBitsToInt(uf_blockVS7[51].x + uf_blockVS7[51].z);
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R127i.w)) + -(intBitsToFloat(R123i.w)));
PV0iz = floatBitsToInt(uf_blockVS7[51].y + uf_blockVS7[51].w);
R2i.w = ((R3i.w == 0)?(0):(0x2));
R4i.z = floatBitsToInt(float(PS1i));
// 21
PV1ix = floatBitsToInt(-(abs(intBitsToFloat(R4i.z))) + 0.0);
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[51].w,intBitsToFloat(R1i.w)) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt((0.0 >= abs(intBitsToFloat(R4i.z)))?1.0:0.0);
R3i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[51].z,intBitsToFloat(R125i.z)) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R4i.z));
// 22
R1i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R8i.w)),uf_blockVS7[49].x) + -(intBitsToFloat(R127i.x)));
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),uf_blockVS7[49].y) + intBitsToFloat(R126i.y));
R127i.w = ((intBitsToFloat(PV1iz) == 0.0)?(0):(PV1ix));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[53].z);
// 23
PV1ix = floatBitsToInt(trunc(intBitsToFloat(PV0iy)));
R1i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[53].x, intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(abs(intBitsToFloat(R4i.z)) + intBitsToFloat(R127i.w));
R6i.w = (R2i.w == int(1))?-1:0;
PS1i = floatBitsToInt(1.0 / uf_blockVS7[53].w);
// 24
backupReg0i = R6i.x;
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),uf_blockVS7[50].w) + intBitsToFloat(R127i.y));
R2i.y = ((-(intBitsToFloat(R127i.w)) > 0.0)?(PV1iz):(R127i.w));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R1i.y)) + -(0.5));
R0i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[53].y, intBitsToFloat(PS1i)));
R1i.w = int(intBitsToFloat(PV1ix));
}
if( activeMaskStackC[3] == true ) {
// 0
R123i.x = ((intBitsToFloat(R4i.z) == 0.0)?(0):(R2i.y));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),uf_blockVS7[50].z) + intBitsToFloat(R3i.w));
PS0i = floatBitsToInt(float(R1i.w));
// 1
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(R0i.w)) + -(0.5));
PV1iz = (R2i.w == 0x2)?-1:0;
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.w)),intBitsToFloat(PS0i)) + intBitsToFloat(R1i.z));
PS1i = int(intBitsToFloat(backupReg0i));
// 2
backupReg0i = R123i.x;
R123i.x = ((PV1iz == 0)?(R5i.x):(R5i.z));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(backupReg0i)) + -(intBitsToFloat(R123i.w)));
R123i.z = ((PV1iz == 0)?(R5i.y):(R5i.x));
R126i.w = ((R6i.w == 0)?(R5i.x):(R5i.y));
PS0i = floatBitsToInt(float(PS1i));
// 3
backupReg0i = R123i.x;
R123i.x = ((R6i.w == 0)?(R123i.z):(R5i.z));
R126i.y = ((R6i.w == 0)?(R5i.y):(R5i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(PS0i)) + intBitsToFloat(R1i.x));
R123i.w = ((R6i.w == 0)?(backupReg0i):(R5i.y));
PS1i = int(uf_blockVS7[58].z);
// 4
PV0ix = floatBitsToInt(uf_blockVS7[54].z + uf_blockVS7[55].x);
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockVS7[55].x, intBitsToFloat(R123i.w)));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R0i.z)) + intBitsToFloat(R123i.z));
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[55].y, intBitsToFloat(R123i.x)));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
R124i.z = floatBitsToInt(float(PS1i));
// 5
R126i.x = floatBitsToInt(abs(intBitsToFloat(R124i.z)));
PV1iy = floatBitsToInt(uf_blockVS7[54].w + uf_blockVS7[55].y);
R125i.w = floatBitsToInt(-(intBitsToFloat(PV0iy)) + intBitsToFloat(PV0ix));
R127i.y = floatBitsToInt(float(R4i.x));
// 6
backupReg0i = R127i.y;
R127i.x = floatBitsToInt(-(intBitsToFloat(R127i.w)) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt((intBitsToFloat(backupReg0i) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(backupReg0i))?1.0:0.0);
PV0iw = floatBitsToInt(uf_blockVS7[56].x + uf_blockVS7[56].z);
R4i.x = floatBitsToInt(float(R4i.x));
// 7
R125i.x = floatBitsToInt(abs(intBitsToFloat(R4i.x)));
PV1iy = floatBitsToInt(uf_blockVS7[56].y + uf_blockVS7[56].w);
R125i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[56].z,intBitsToFloat(R126i.w)) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(1.0 / abs(intBitsToFloat(R124i.z)));
// 8
R124i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[56].w,intBitsToFloat(R126i.y)) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R4i.x)), intBitsToFloat(PS1i)));
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * 0.5 + intBitsToFloat(R127i.y));
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R8i.w)),uf_blockVS7[54].x) + -(intBitsToFloat(R125i.w)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R124i.z));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(trunc(intBitsToFloat(PV0iy)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),uf_blockVS7[54].y) + intBitsToFloat(R127i.x));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[58].z);
// 10
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[58].x, intBitsToFloat(PS1i)));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iy)),intBitsToFloat(backupReg0i)) + intBitsToFloat(R125i.x));
PV0iw = floatBitsToInt(trunc(intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[58].w);
// 11
backupReg0i = R125i.z;
PV1ix = floatBitsToInt((intBitsToFloat(R127i.z) >= abs(intBitsToFloat(R124i.z)))?1.0:0.0);
PV1iy = floatBitsToInt(-(abs(intBitsToFloat(R124i.z))) + intBitsToFloat(R127i.z));
R125i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[58].y, intBitsToFloat(PS0i)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),uf_blockVS7[55].z) + intBitsToFloat(backupReg0i));
PS1i = int(intBitsToFloat(PV0iw));
// 12
backupReg0i = R127i.z;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),uf_blockVS7[55].w) + intBitsToFloat(R124i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x),intBitsToFloat(R126i.x)) + -(0.5));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R125i.z)) + -(0.5));
R126i.w = ((intBitsToFloat(PV1ix) == 0.0)?(backupReg0i):(PV1iy));
PS0i = floatBitsToInt(float(PS1i));
// 13
PV1ix = floatBitsToInt(abs(intBitsToFloat(R124i.z)) + intBitsToFloat(R126i.w));
R19i.y = floatBitsToInt(intBitsToFloat(R0i.y) + 0.5);
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.z)),intBitsToFloat(PS0i)) + intBitsToFloat(R125i.w));
R19i.x = floatBitsToInt(intBitsToFloat(R2i.z) + 0.5);
// 14
R123i.y = ((-(intBitsToFloat(R126i.w)) > 0.0)?(PV1ix):(R126i.w));
R19i.z = floatBitsToInt(intBitsToFloat(R126i.z) + 0.5);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R127i.z)) + -(intBitsToFloat(R123i.z)));
R19i.w = floatBitsToInt(intBitsToFloat(R125i.y) + 0.5);
// 15
R123i.x = ((-(intBitsToFloat(R4i.x)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.y)))):(R123i.y));
R10i.y = floatBitsToInt(uf_blockVS7[104].x);
// 16
R123i.w = ((intBitsToFloat(R124i.z) == 0.0)?(R4i.x):(R123i.x));
// 17
R18i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x),intBitsToFloat(R20i.x)) + intBitsToFloat(R18i.x));
R18i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x),intBitsToFloat(R4i.y)) + intBitsToFloat(R7i.y));
R18i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x),intBitsToFloat(R6i.z)) + intBitsToFloat(R12i.z));
PS1i = int(intBitsToFloat(R123i.w));
// 18
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R20i.x)) + intBitsToFloat(R13i.x));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R4i.y)) + intBitsToFloat(R6i.y));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R6i.z)) + intBitsToFloat(R7i.z));
PS0i = floatBitsToInt(float(PS1i));
// 19
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.w));
// 20
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(R20i.x)) + intBitsToFloat(R12i.x));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(R4i.y)) + intBitsToFloat(R3i.y));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(R6i.z)) + intBitsToFloat(R3i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.y));
// 21
R11i.x = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
R11i.y = floatBitsToInt(intBitsToFloat(R126i.w) + 0.5);
}
if( activeMaskStackC[3] == true ) {
// 0
R10i.x = floatBitsToInt(uf_blockVS8[3].x * 1.0 + 0.0);
// 1
R0i.x = R9i.x;
R0i.y = R9i.y;
R0i.z = R9i.z;
R0i.w = R9i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
// skipped export to semanticId 255
// export
passParameterSem7 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.w));
// export
passParameterSem10 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem13 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.z));
// export
passParameterSem9 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.z));
}
