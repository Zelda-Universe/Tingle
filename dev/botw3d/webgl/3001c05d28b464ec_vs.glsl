#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 3001c05d28b464ec
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
R4i.w = 0;
R5i.w = floatBitsToInt(1.0);
// 1
R7i.w = floatBitsToInt(-(intBitsToFloat(R7i.w)) + uf_blockVS8[2].x);
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
R14i.x = 0;
R14i.y = 0;
R14i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R6i.x = 0;
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
R7i.x = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R7i.w) >= intBitsToFloat(R7i.x));
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
R6i.x = 0;
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
PV0ix = floatBitsToInt((0.0 > uf_blockVS7[9].x)?1.0:0.0);
PV0iy = floatBitsToInt((uf_blockVS7[9].x > 0.0)?1.0:0.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), uf_blockVS7[10].y));
PV0iw = floatBitsToInt(max(intBitsToFloat(R10i.x), 0.0));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[9].x);
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R7i.w) * intBitsToFloat(PS0i));
R127i.y = floatBitsToInt(-(uf_blockVS7[96].x) + uf_blockVS7[97].x);
PV1iz = floatBitsToInt(min(intBitsToFloat(PV0iw), 0.0));
R127i.w = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
R6i.y = floatBitsToInt(1.0 / intBitsToFloat(R7i.x));
// 2
R0i.x = floatBitsToInt(intBitsToFloat(R11i.x) + intBitsToFloat(PV1iz));
R0i.y = floatBitsToInt(intBitsToFloat(R7i.w) * intBitsToFloat(R6i.y));
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
PV0iw = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1ix));
R126i.y = floatBitsToInt(-(uf_blockVS7[96].y) + uf_blockVS7[97].y);
// 3
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PV0iz)));
R125i.y = floatBitsToInt(-(uf_blockVS7[96].z) + uf_blockVS7[97].z);
PV1iz = floatBitsToInt(fract(intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(-(uf_blockVS7[96].w) + uf_blockVS7[97].w);
// 4
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV1iz)));
R126i.z = floatBitsToInt(-(uf_blockVS7[97].y) + uf_blockVS7[98].y);
R126i.w = floatBitsToInt(-(uf_blockVS7[97].x) + uf_blockVS7[98].x);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 5
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0iy));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS0i));
R127i.z = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(PS0i));
R127i.w = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(PS0i));
R126i.y = floatBitsToInt(-(uf_blockVS7[97].z) + uf_blockVS7[98].z);
// 6
R126i.x = floatBitsToInt(intBitsToFloat(R127i.x) + -(uf_blockVS7[97].w));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.x) + -(uf_blockVS7[96].w));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R127i.w)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R127i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R127i.y)));
PV1iw = floatBitsToInt(-(uf_blockVS7[97].w) + uf_blockVS7[98].w);
R125i.y = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 8
R125i.x = ((intBitsToFloat(R126i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.y = floatBitsToInt(uf_blockVS7[96].z + intBitsToFloat(PV1ix));
R127i.z = floatBitsToInt(uf_blockVS7[96].y + intBitsToFloat(PV1iy));
R127i.w = floatBitsToInt(uf_blockVS7[96].x + intBitsToFloat(PV1iz));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS0i));
PV1iz = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.x) + -(uf_blockVS7[98].w));
PS1i = floatBitsToInt(-(intBitsToFloat(R125i.x)) + 1.0);
// 10
backupReg0i = R126i.x;
R126i.x = ((intBitsToFloat(PV1iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1iz)));
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PS1i)));
// 11
backupReg0i = R127i.w;
R127i.x = floatBitsToInt(uf_blockVS7[97].x + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
R126i.z = floatBitsToInt(uf_blockVS7[97].z + intBitsToFloat(PV0iy));
R127i.w = floatBitsToInt(uf_blockVS7[97].y + intBitsToFloat(PV0iz));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R124i.x)));
// 12
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[98].x, intBitsToFloat(backupReg0i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PV1iy)));
R124i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[98].y, intBitsToFloat(backupReg0i)));
R125i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[98].z, intBitsToFloat(backupReg0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R124i.x)));
// 13
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV0iy)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R124i.x)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV0iy)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0iy)));
PS1i = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
// 14
R124i.x = floatBitsToInt(intBitsToFloat(R10i.x) + intBitsToFloat(R10i.y));
R125i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].z, intBitsToFloat(PS1i)));
R126i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].y, intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].x, intBitsToFloat(PS1i)));
R0i.w = 0x3f800000;
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R6i.w = tempi.x;
PS1i = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV0iw));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R9i.w = tempi.x;
PS0i = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PS1i));
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R11i.w = tempi.x;
PS1i = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PS0i));
// 18
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(intBitsToFloat(R124i.x) * 0.5);
PV0iz = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(R125i.y));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(R126i.z));
PS0i = floatBitsToInt(intBitsToFloat(R10i.y) + intBitsToFloat(R10i.z));
// 19
PV1ix = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(intBitsToFloat(PS0i) * 0.5);
PV1iz = floatBitsToInt(intBitsToFloat(R10i.x) + intBitsToFloat(R10i.z));
PV1iw = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV0iz));
R125i.z = floatBitsToInt(intBitsToFloat(PV0iy) + -(0.5));
R125i.z = floatBitsToInt(intBitsToFloat(R125i.z) * 2.0);
// 20
PV0ix = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(PV1iw));
PV0iy = floatBitsToInt(intBitsToFloat(R124i.z) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iz) * 0.5);
R125i.w = floatBitsToInt(intBitsToFloat(PV1iy) + -(0.5));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) * 2.0);
R4i.x = floatBitsToInt(intBitsToFloat(R10i.x) + -(0.5));
// 21
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + -(0.5));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), intBitsToFloat(PV0ix)));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(PV0iy)));
R1i.w = floatBitsToInt(intBitsToFloat(R10i.y) + -(0.5));
R0i.w = floatBitsToInt(intBitsToFloat(R10i.z) + -(0.5));
// 22
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), uf_blockVS7[115].z));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), uf_blockVS7[115].x));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), uf_blockVS7[115].y));
PV0iw = R10i.y;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
PS0i = R10i.z;
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 23
R2i.x = floatBitsToInt(intBitsToFloat(PV0iy) + uf_blockVS7[114].x);
R2i.y = floatBitsToInt(uf_blockVS7[114].z + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(floor(intBitsToFloat(PV0iw)));
R4i.w = floatBitsToInt(uf_blockVS7[114].y + intBitsToFloat(PV0iz));
R2i.w = floatBitsToInt(floor(intBitsToFloat(PS0i)));
// 24
R11i.x = floatBitsToInt((intBitsToFloat(PV1iz) > 0.0)?1.0:0.0);
R4i.y = floatBitsToInt(uf_blockVS7[5].x) & 0x40000;
R3i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x10000;
R3i.w = floatBitsToInt(uf_blockVS7[5].x) & 0x20000;
R11i.y = floatBitsToInt((0.0 > intBitsToFloat(PV1iz))?1.0:0.0);
}
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R3i.y;
R126i.x = floatBitsToInt(intBitsToFloat(R11i.x) + -(intBitsToFloat(R11i.y)));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), uf_blockVS8[3].y));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), uf_blockVS8[3].w));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), uf_blockVS8[3].z));
PS0i = floatBitsToInt(float(R3i.z));
// 1
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(PV0iz)));
R125i.w = floatBitsToInt((intBitsToFloat(R2i.w) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(float(R3i.w));
// 2
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(R2i.w))?1.0:0.0);
PS0i = floatBitsToInt(float(R4i.y));
// 3
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R125i.z = floatBitsToInt(intBitsToFloat(R125i.w) + -(intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iy)));
R125i.w = int(intBitsToFloat(PV0iz));
// 4
PV0ix = 0 - R125i.w;
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iy)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), uf_blockVS7[113].x));
PV0iw = R10i.x;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
R127i.y = int(intBitsToFloat(PV1iw));
// 5
PV1ix = max(R125i.w, PV0ix);
PV1iy = 0 - R127i.y;
PV1iz = floatBitsToInt(floor(intBitsToFloat(PV0iw)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), uf_blockVS7[113].y));
R124i.x = int(intBitsToFloat(PV0iy));
// 6
PV0ix = 0 - R124i.x;
PV0iy = floatBitsToInt((intBitsToFloat(PV1iz) > 0.0)?1.0:0.0);
PV0iz = max(R127i.y, PV1iy);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PV1iz))?1.0:0.0);
PS0i = floatBitsToInt(float(PV1ix));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 7
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(backupReg0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), uf_blockVS7[113].z));
PV1iw = max(R124i.x, PV0ix);
PS1i = floatBitsToInt(float(PV0iz));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(R125i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV1iy)));
R125i.z = ((uf_blockVS7[114].w == 1.0)?-1:0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PV1iy)));
PS0i = floatBitsToInt(float(PV1iw));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(R126i.x)));
PV1iy = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV0iw));
R126i.z = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PV0ix)));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(PS1i));
R125i.y = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R124i.z));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV1ix)));
R127i.w = floatBitsToInt(intBitsToFloat(R4i.w) + intBitsToFloat(PV1iw));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PV1ix)));
// 11
R126i.x = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R125i.w));
R127i.y = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(-(uf_blockVS7[114].w) + 1.0);
tempResultf = max(0.0, uf_blockVS7[114].w);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 12
R126i.y = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R127i.z));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(PS1i)));
R125i.w = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 13
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
// 14
PV0ix = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
R2i.w = floatBitsToInt(intBitsToFloat(R3i.z) * 0.0 + 1.0);
// 15
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(R125i.w));
// 16
R123i.x = ((R125i.z == 0)?(PV1iy):(R7i.w));
// 17
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R123i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R123i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R123i.x)));
// 18
PV0ix = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV1iy));
// 19
R123i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.z = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e22f983) + 0.5);
// 20
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
PV0iw = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
// 21
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.z = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 22
R126i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R126i.y = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
R127i.w = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
// 23
R125i.y = floatBitsToInt(sin((intBitsToFloat(R127i.w))/0.1591549367));
// 24
R124i.x = floatBitsToInt(cos((intBitsToFloat(R127i.w))/0.1591549367));
// 25
R126i.z = floatBitsToInt(sin((intBitsToFloat(R126i.x))/0.1591549367));
// 26
R4i.y = floatBitsToInt(-(intBitsToFloat(R126i.z)));
R3i.w = 0x3f800000;
R127i.w = floatBitsToInt(cos((intBitsToFloat(R126i.x))/0.1591549367));
// 27
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R127i.w)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R127i.w)));
PS1i = floatBitsToInt(sin((intBitsToFloat(R126i.y))/0.1591549367));
// 28
backupReg0i = R126i.y;
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R3i.z)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PS1i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(PS1i)));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(cos((intBitsToFloat(backupReg0i))/0.1591549367));
// 29
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R126i.y)));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R127i.z)));
// 30
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV1ix)));
R5i.y = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(PV1iy));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(PS1i));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R125i.z)));
// 31
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R3i.z)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(PV0iw)));
R5i.z = floatBitsToInt(-(intBitsToFloat(R127i.z)) + intBitsToFloat(PV0ix));
R4i.w = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV0iz));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R2i.x)) + intBitsToFloat(PS0i));
}
if( activeMaskStackC[3] == true ) {
// 0
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(R3i.z)));
PV0iy = floatBitsToInt(uf_blockVS7[13].y);
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R4i.w)));
PV0iw = floatBitsToInt(uf_blockVS7[13].x);
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R5i.y)) + intBitsToFloat(R2i.y));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(PV0iw));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R5i.z)) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(intBitsToFloat(R9i.y) + intBitsToFloat(PV0iy));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R1i.w)) + intBitsToFloat(R122i.x));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R4i.y)) + intBitsToFloat(R0i.w));
// 2
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV1iz)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(PV1ix)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R11i.z)) + intBitsToFloat(R123i.y));
R5i.w = floatBitsToInt(uf_blockVS7[60].x);
R0i.w = floatBitsToInt(uf_blockVS7[60].y);
// 3
backupReg0i = R5i.z;
PV1ix = floatBitsToInt((uf_blockVS7[8].y > 0.0)?1.0:0.0);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R5i.y)) + intBitsToFloat(R5i.x));
R5i.z = floatBitsToInt(uf_blockVS7[60].z);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(backupReg0i)) + intBitsToFloat(R124i.x));
PS1i = floatBitsToInt((0.0 > uf_blockVS7[8].y)?1.0:0.0);
// 4
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R11i.z)) + intBitsToFloat(R123i.w));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R1i.w)) + intBitsToFloat(R123i.y));
R125i.z = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PS1i)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R2i.x)) + intBitsToFloat(R4i.x));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[8].y);
// 5
backupReg0i = R126i.y;
R126i.x = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
R126i.y = floatBitsToInt(intBitsToFloat(R7i.w) * intBitsToFloat(PS0i));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R4i.y)) + intBitsToFloat(R123i.w));
R125i.w = floatBitsToInt(-(uf_blockVS7[68].x) + uf_blockVS7[69].x);
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.z), intBitsToFloat(R127i.z)));
// 6
R2i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R124i.z),intBitsToFloat(R2i.w))));
PV0iy = R2i.x;
PV0iz = R2i.x;
PV0iw = R2i.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y),intBitsToFloat(R127i.w)) + intBitsToFloat(PS1i));
// 7
R18i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.x),intBitsToFloat(R126i.z)) + intBitsToFloat(R122i.x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x),uf_blockVS7[9].z) + intBitsToFloat(R126i.y));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.z), intBitsToFloat(R127i.z)));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),intBitsToFloat(R15i.z),intBitsToFloat(R9i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R124i.z),intBitsToFloat(R2i.w))));
PV0ix = tempi.x;
R4i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.y),intBitsToFloat(R127i.w)) + intBitsToFloat(PS1i));
// 9
R124i.x = floatBitsToInt(-(uf_blockVS7[68].w) + uf_blockVS7[69].w);
R18i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.x),intBitsToFloat(R126i.z)) + intBitsToFloat(R122i.x));
PV1iw = floatBitsToInt(fract(intBitsToFloat(R126i.y)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.z), intBitsToFloat(R127i.z)));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.z),intBitsToFloat(R127i.w),1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R18i.z = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PV1iw)));
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R126i.x)) + intBitsToFloat(PS0i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R124i.x));
// 12
R126i.x = floatBitsToInt(intBitsToFloat(R123i.x) + -(uf_blockVS7[68].w));
R126i.y = floatBitsToInt(intBitsToFloat(R123i.x) + -(uf_blockVS7[69].w));
PV0iw = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(PS1i));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(R14i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R124i.z),intBitsToFloat(R2i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R11i.z = tempi.x;
PV1iw = tempi.x;
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PV0iw)) + uf_blockVS7[68].x);
// 14
backupReg0i = R126i.y;
R4i.x = floatBitsToInt(uf_blockVS7[76].x);
R126i.y = ((intBitsToFloat(R126i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R8i.z = floatBitsToInt(uf_blockVS7[76].y);
R125i.w = ((intBitsToFloat(backupReg0i) >= 0.0)?(floatBitsToInt(1.0)):(0));
R9i.z = floatBitsToInt(uf_blockVS7[76].z);
// 15
PV1ix = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
PV1iz = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
// 16
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV1iz)));
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[68].x, intBitsToFloat(PV1ix)));
// 17
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(PV0iy)) + intBitsToFloat(PV0iw));
// 18
R2i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[69].x,intBitsToFloat(R125i.w)) + intBitsToFloat(R123i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
R14i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R4i.y),intBitsToFloat(R11i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS6[8].x,uf_blockVS6[8].y,uf_blockVS6[8].z,uf_blockVS6[8].w)));
PV0iy = R14i.x;
PV0iz = R14i.x;
PV0iw = R14i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R4i.y),intBitsToFloat(R11i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS6[9].x,uf_blockVS6[9].y,uf_blockVS6[9].z,uf_blockVS6[9].w)));
PV1ix = tempi.x;
R14i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R4i.y),intBitsToFloat(R11i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS6[10].x,uf_blockVS6[10].y,uf_blockVS6[10].z,uf_blockVS6[10].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R14i.z = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R4i.y),intBitsToFloat(R11i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS6[11].x,uf_blockVS6[11].y,uf_blockVS6[11].z,uf_blockVS6[11].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R14i.w = tempi.x;
// 4
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), uf_blockVS8[0].x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), uf_blockVS8[0].y));
PV0iz = PV1ix;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), uf_blockVS8[0].z));
// 5
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), uf_blockVS8[1].x));
R123i.y = floatBitsToInt(intBitsToFloat(R14i.z) * 0.0 + intBitsToFloat(PV0iz));
R15i.z = floatBitsToInt(intBitsToFloat(R14i.z) * 0.5 + intBitsToFloat(PV0iz));
R15i.w = floatBitsToInt(intBitsToFloat(R14i.z) * 0.0 + intBitsToFloat(R14i.w));
R16i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), uf_blockVS8[0].w));
// 6
R15i.x = floatBitsToInt(intBitsToFloat(R14i.x) * 0.5 + intBitsToFloat(R123i.y));
R15i.y = floatBitsToInt(intBitsToFloat(R14i.y) * -(0.5) + intBitsToFloat(R123i.y));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), uf_blockVS8[1].z));
PV0iw = ((intBitsToFloat(R10i.x) > 0.5)?-1:0);
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), uf_blockVS8[1].y));
// 7
PV1ix = ((intBitsToFloat(R10i.y) > 0.5)?-1:0);
PV1iy = ((intBitsToFloat(R10i.z) > 0.5)?-1:0);
R8i.z = ((PV0iw == 0)?(R12i.x):(R8i.w));
PV1iw = ((intBitsToFloat(R10i.w) > 0.5)?-1:0);
// 8
R4i.x = ((PV1iy == 0)?(R12i.x):(R8i.w));
R4i.y = ((PV1ix == 0)?(R12i.y):(R7i.z));
R0i.w = ((PV1iw == 0)?(R12i.y):(R7i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), uf_blockVS7[59].x));
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), uf_blockVS7[59].x));
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), uf_blockVS7[59].x));
R2i.w = floatBitsToInt(uf_blockVS7[84].x);
}
if( activeMaskStackC[3] == true ) {
// 0
R17i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R1i.x)));
R17i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R1i.y)));
R17i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R1i.z)));
R17i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), uf_blockVS8[1].w));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(uf_blockVS7[5].x) & 0x100000;
PV0iy = floatBitsToInt(uf_blockVS7[5].x) & 0x80000;
PV0iz = floatBitsToInt(uf_blockVS7[5].x) & 0x400000;
PV0iw = floatBitsToInt(uf_blockVS7[5].x) & 0x200000;
PS0i = floatBitsToInt(uf_blockVS7[5].y) & int(1);
// 1
PV1ix = (PV0iy == 0x80000)?-1:0;
PV1iy = (PV0iz == 0x400000)?-1:0;
PV1iz = (PV0iw == 0x200000)?-1:0;
PV1iw = (PV0ix == 0x100000)?-1:0;
R2i.x = (int(1) != PS0i)?-1:0;
// 2
R5i.x = ((PV1iw == 0)?(R12i.y):(R4i.y));
R0i.y = ((PV1ix == 0)?(R12i.x):(R8i.z));
R3i.z = ((PV1iy == 0)?(R12i.y):(R0i.w));
R5i.w = ((PV1iz == 0)?(R12i.x):(R4i.x));
R127i.w = int(uf_blockVS7[17].x);
// 3
R126i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x20;
PV1iy = floatBitsToInt(uf_blockVS7[5].x) & 0x10;
R124i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x40;
R125i.w = floatBitsToInt(uf_blockVS7[5].x) & 0x80;
R126i.z = int(uf_blockVS7[17].y);
// 4
R127i.y = int(-1) + R127i.w;
PS0i = floatBitsToInt(float(PV1iy));
// 5
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(float(R126i.x));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(R124i.z));
// 7
R124i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x2000000;
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R126i.x = int(intBitsToFloat(PV0iy));
// 8
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
PV0iw = 0 - R126i.x;
R127i.x = int(intBitsToFloat(PV1iy));
// 9
R124i.z = max(R126i.x, PV0iw);
PV1iw = 0 - R127i.x;
R126i.x = int(intBitsToFloat(PV0iy));
// 10
R5i.z = max(R127i.x, PV1iw);
PV0iw = 0 - R126i.x;
PS0i = floatBitsToInt(float(R125i.w));
// 11
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R9i.z = max(R126i.x, PV0iw);
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R125i.y = floatBitsToInt(float(R127i.w));
// 12
backupReg0i = R126i.z;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(R125i.y)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1ix)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(R125i.y)));
R126i.y = floatBitsToInt(float(backupReg0i));
// 13
PV1iw = floatBitsToInt(intBitsToFloat(R6i.y) * intBitsToFloat(PV0ix));
R126i.x = int(intBitsToFloat(PV0iy));
// 14
PV0iw = 0 - R126i.x;
PS0i = int(intBitsToFloat(PV1iw));
// 15
R125i.z = max(R126i.x, PV0iw);
R4i.y = R124i.z * PS0i;
// 16
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.y));
// 17
PV1iw = floatBitsToInt(intBitsToFloat(R7i.w) * intBitsToFloat(PS0i));
R12i.x = floatBitsToInt(float(R127i.w));
// 18
R2i.w = floatBitsToInt(abs(intBitsToFloat(R12i.x)));
R127i.z = int(intBitsToFloat(PV1iw));
// 19
PS1i = floatBitsToInt(float(R127i.z));
// 20
PV0ix = floatBitsToInt(-(intBitsToFloat(R125i.y)) + intBitsToFloat(PS1i));
R125i.w = floatBitsToInt(float(R127i.z));
// 21
R124i.z = floatBitsToInt(abs(intBitsToFloat(R125i.w)));
R123i.w = ((intBitsToFloat(PV0ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
R11i.z = floatBitsToInt(1.0 / abs(intBitsToFloat(R12i.x)));
// 22
PV0iy = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R125i.w)), intBitsToFloat(R11i.z)));
PS0i = int(intBitsToFloat(R123i.w));
// 23
PV1ix = floatBitsToInt(trunc(intBitsToFloat(PV0iy)));
R125i.y = int(1) - PS0i;
R8i.z = PS0i * R127i.y;
// 24
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(R2i.w)) + intBitsToFloat(R124i.z));
PS0i = floatBitsToInt(float(R124i.x));
// 25
PV1ix = floatBitsToInt(-(abs(intBitsToFloat(R12i.x))) + intBitsToFloat(R127i.y));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(R127i.y) >= abs(intBitsToFloat(R12i.x)))?1.0:0.0);
R126i.w = int(intBitsToFloat(R126i.z));
// 26
backupReg0i = R125i.z;
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iy)));
R125i.z = ((intBitsToFloat(PV1iw) == 0.0)?(R127i.y):(PV1ix));
R4i.x = backupReg0i * R126i.w;
// 27
PV1iy = floatBitsToInt(abs(intBitsToFloat(R12i.x)) + intBitsToFloat(R125i.z));
R127i.w = int(intBitsToFloat(PV0ix));
// 28
R123i.x = ((-(intBitsToFloat(R125i.z)) > 0.0)?(PV1iy):(R125i.z));
PV0iz = 0 - R127i.w;
// 29
PV1iy = max(R127i.w, PV0iz);
R123i.w = ((-(intBitsToFloat(R125i.w)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.x)))):(R123i.x));
// 30
R123i.z = ((intBitsToFloat(R12i.x) == 0.0)?(R125i.w):(R123i.w));
PS0i = PV1iy * R126i.w;
// 31
R6i.y = R127i.z + PS0i;
PS1i = int(intBitsToFloat(R123i.z));
// 32
R0i.w = R125i.y * PS1i;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iy = R0i.w + R8i.z;
R126i.w = R9i.z * R6i.y;
// 1
PS1i = R5i.z * PV0iy;
// 2
PV0ix = PS1i + R4i.y;
// 3
PV1iw = R126i.w + PV0ix;
// 4
PV0iz = R4i.x + PV1iw;
// 5
R127i.y = floatBitsToInt(float(PV0iz));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), abs(intBitsToFloat(R127i.y))));
R127i.z = floatBitsToInt(abs(intBitsToFloat(R127i.y)));
// 7
PV1iw = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
// 8
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iw)),intBitsToFloat(R2i.w)) + intBitsToFloat(R127i.z));
// 9
PV1ix = floatBitsToInt(-(abs(intBitsToFloat(R12i.x))) + intBitsToFloat(R125i.y));
PV1iw = floatBitsToInt((intBitsToFloat(R125i.y) >= abs(intBitsToFloat(R12i.x)))?1.0:0.0);
// 10
R127i.z = ((intBitsToFloat(PV1iw) == 0.0)?(R125i.y):(PV1ix));
// 11
PV1iy = floatBitsToInt(abs(intBitsToFloat(R12i.x)) + intBitsToFloat(R127i.z));
// 12
R123i.x = ((-(intBitsToFloat(R127i.z)) > 0.0)?(PV1iy):(R127i.z));
// 13
R123i.w = ((-(intBitsToFloat(R127i.y)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.x)))):(R123i.x));
// 14
R123i.z = ((intBitsToFloat(R12i.x) == 0.0)?(R127i.y):(R123i.w));
// 15
R127i.y = int(intBitsToFloat(R123i.z));
// 16
R124i.x = floatBitsToInt(float(R127i.y));
// 17
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(R124i.x))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(R124i.x) > 0.0)?1.0:0.0);
R125i.w = floatBitsToInt(float(R127i.y));
// 18
R126i.x = floatBitsToInt(abs(intBitsToFloat(R125i.w)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(abs(intBitsToFloat(R125i.w)) * 0.25);
// 19
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * 0.5 + intBitsToFloat(R124i.x));
PV1iy = floatBitsToInt(trunc(intBitsToFloat(PV0iz)));
// 20
PV0ix = floatBitsToInt(intBitsToFloat(R123i.x) * 0.25);
R126i.w = floatBitsToInt(-(intBitsToFloat(PV1iy)) * 4.0 + intBitsToFloat(R126i.x));
// 21
PV1ix = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
PV1iy = floatBitsToInt((intBitsToFloat(R126i.w) >= 4.0)?1.0:0.0);
PV1iz = floatBitsToInt(intBitsToFloat(R126i.w) + -4.0);
// 22
R126i.x = ((intBitsToFloat(PV1iy) == 0.0)?(R126i.w):(PV1iz));
PS0i = int(intBitsToFloat(PV1ix));
// 23
R12i.x = PS0i + 0x12;
PV1iw = floatBitsToInt(intBitsToFloat(R126i.x) + 4.0);
PS1i = int(uf_blockVS7[48].z);
// 24
R123i.z = ((-(intBitsToFloat(R126i.x)) > 0.0)?(PV1iw):(R126i.x));
R8i.x = floatBitsToInt(float(PS1i));
// 25
R123i.y = ((-(intBitsToFloat(R125i.w)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.z)))):(R123i.z));
// 26
R4i.x = int(intBitsToFloat(R123i.y));
}
if( activeMaskStackC[3] == true ) {
R12i.xyzw = floatBitsToInt(uf_blockVS7[R12i.x].xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
R124i.x = floatBitsToInt(abs(intBitsToFloat(R8i.x)));
R127i.y = 0xfffffffd + R4i.x;
R127i.z = 0xfffffffe + R4i.x;
PV0iw = int(-1) + R4i.x;
PS0i = floatBitsToInt(float(R4i.x));
// 1
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(float(PV0iw));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PS0i = floatBitsToInt(float(R127i.z));
// 3
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iz)));
R125i.w = int(intBitsToFloat(PV0ix));
// 4
PV0ix = 0 - R125i.w;
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iy)));
R127i.z = int(intBitsToFloat(PV1iw));
// 5
PV1ix = 0 - R127i.z;
PV1iy = max(R125i.w, PV0ix);
R125i.y = int(intBitsToFloat(PV0iz));
// 6
PV0ix = max(R127i.z, PV1ix);
PV0iy = int(1) - PV1iy;
PV0iz = 0 - R125i.y;
PS0i = floatBitsToInt(float(R127i.y));
// 7
PV1ix = int(1) - PV0ix;
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iw = max(R125i.y, PV0iz);
R125i.y = PV0iy * R12i.x;
// 8
PV0ix = floatBitsToInt(uf_blockVS7[44].z + uf_blockVS7[45].x);
R127i.y = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iz)));
PV0iz = int(1) - PV1iw;
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), uf_blockVS7[45].x));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
PS0i = PV1ix * R12i.y;
// 9
PV1ix = PS0i + R125i.y;
R125i.y = floatBitsToInt(-(intBitsToFloat(PV0iw)) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), uf_blockVS7[45].y));
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 2.0);
PV1iw = floatBitsToInt(uf_blockVS7[44].w + uf_blockVS7[45].y);
PS1i = PV0iz * R12i.z;
// 10
PV0ix = floatBitsToInt(uf_blockVS7[46].y + uf_blockVS7[46].w);
PV0iy = floatBitsToInt(uf_blockVS7[46].x + uf_blockVS7[46].z);
R127i.z = floatBitsToInt(-(intBitsToFloat(PV1iz)) + intBitsToFloat(PV1iw));
R125i.w = PS1i + PV1ix;
R126i.x = int(intBitsToFloat(R127i.y));
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x),uf_blockVS7[46].z) + intBitsToFloat(PV0iy));
R4i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.w)),uf_blockVS7[44].x) + -(intBitsToFloat(R125i.y)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),uf_blockVS7[46].w) + intBitsToFloat(PV0ix));
PV1iw = 0 - R126i.x;
R125i.y = floatBitsToInt(1.0 / abs(intBitsToFloat(R8i.x)));
// 12
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),uf_blockVS7[45].w) + intBitsToFloat(R123i.z));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),uf_blockVS7[44].y) + intBitsToFloat(R127i.z));
PV0iz = max(R126i.x, PV1iw);
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),uf_blockVS7[45].z) + intBitsToFloat(R123i.x));
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(R8i.x));
// 13
PV1iy = int(1) - PV0iz;
PS1i = floatBitsToInt(1.0 / uf_blockVS7[48].z);
// 14
R12i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].x, intBitsToFloat(PS1i)));
PS0i = PV1iy * R12i.w;
// 15
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R12i.z)) + -(0.5));
R127i.z = PS0i + R125i.w;
PS1i = floatBitsToInt(1.0 / uf_blockVS7[48].w);
// 16
R126i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].y, intBitsToFloat(PS1i)));
R127i.y = ((R2i.x == 0)?(0):(int(1)));
R125i.w = floatBitsToInt(float(R127i.z));
// 17
backupReg0i = R125i.w;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R126i.x)) + -(0.5));
R126i.y = (R127i.y == int(1))?-1:0;
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(backupReg0i))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(backupReg0i) > 0.0)?1.0:0.0);
R125i.z = floatBitsToInt(float(R127i.z));
// 18
PV0ix = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R125i.z)), intBitsToFloat(R125i.y)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
R127i.z = floatBitsToInt(abs(intBitsToFloat(R125i.z)));
PV0iw = (R127i.y == 0x2)?-1:0;
R11i.z = ((R126i.y == 0)?(R10i.x):(R10i.y));
// 19
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * 0.5 + intBitsToFloat(R125i.w));
R123i.y = ((PV0iw == 0)?(R10i.y):(R10i.x));
R123i.z = ((PV0iw == 0)?(R10i.x):(R10i.z));
PV1iw = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
R6i.y = ((R126i.y == 0)?(R10i.y):(R10i.z));
// 20
R124i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iw)),intBitsToFloat(R124i.x)) + intBitsToFloat(R127i.z));
R127i.y = ((R126i.y == 0)?(R123i.z):(R10i.y));
PV0iz = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(R126i.w));
R125i.w = ((R126i.y == 0)?(R123i.y):(R10i.z));
PS0i = int(uf_blockVS7[53].z);
// 21
PV1iy = floatBitsToInt(trunc(intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt((intBitsToFloat(R124i.x) >= abs(intBitsToFloat(R8i.x)))?1.0:0.0);
PV1iw = floatBitsToInt(-(abs(intBitsToFloat(R8i.x))) + intBitsToFloat(R124i.x));
R126i.w = floatBitsToInt(float(PS0i));
// 22
PV0ix = floatBitsToInt((0.0 >= abs(intBitsToFloat(R126i.w)))?1.0:0.0);
R126i.y = ((intBitsToFloat(PV1iz) == 0.0)?(R124i.x):(PV1iw));
PV0iz = floatBitsToInt(-(abs(intBitsToFloat(R126i.w))) + 0.0);
PS0i = int(intBitsToFloat(PV1iy));
// 23
R124i.x = ((intBitsToFloat(PV0ix) == 0.0)?(0):(PV0iz));
PV1iy = floatBitsToInt(abs(intBitsToFloat(R8i.x)) + intBitsToFloat(R126i.y));
PS1i = floatBitsToInt(float(PS0i));
// 24
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.x)),intBitsToFloat(PS1i)) + intBitsToFloat(R124i.y));
PV0iy = floatBitsToInt(abs(intBitsToFloat(R126i.w)) + intBitsToFloat(R124i.x));
R123i.w = ((-(intBitsToFloat(R126i.y)) > 0.0)?(PV1iy):(R126i.y));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.w));
// 25
backupReg0i = R123i.x;
R123i.x = ((-(intBitsToFloat(R125i.z)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.w)))):(R123i.w));
PV1iy = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R125i.x)) + -(intBitsToFloat(backupReg0i)));
R122i.x = ((-(intBitsToFloat(R124i.x)) > 0.0)?(PV0iy):(R124i.x));
// 26
R10i.x = ((intBitsToFloat(R126i.w) == 0.0)?(0):(R122i.x));
R123i.y = ((intBitsToFloat(R8i.x) == 0.0)?(R125i.z):(R123i.x));
R5i.z = floatBitsToInt(trunc(intBitsToFloat(PV1iy)));
// 27
PS1i = int(intBitsToFloat(R123i.y));
// 28
R8i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[50].y, intBitsToFloat(R125i.w)));
R8i.x = floatBitsToInt(intBitsToFloat(R8i.x) * 2.0);
R0i.y = floatBitsToInt(uf_blockVS7[49].w + uf_blockVS7[50].y);
R10i.z = floatBitsToInt(uf_blockVS7[49].z + uf_blockVS7[50].x);
R10i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[50].x, intBitsToFloat(R127i.y)));
R10i.w = floatBitsToInt(intBitsToFloat(R10i.w) * 2.0);
R10i.y = floatBitsToInt(float(PS1i));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(uf_blockVS7[51].x + uf_blockVS7[51].z);
R127i.y = floatBitsToInt(-(intBitsToFloat(R10i.w)) + intBitsToFloat(R10i.z));
R125i.z = floatBitsToInt(-(intBitsToFloat(R8i.x)) + intBitsToFloat(R0i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z),intBitsToFloat(R10i.y)) + intBitsToFloat(R4i.y));
R127i.x = int(intBitsToFloat(R10i.x));
// 1
R124i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[51].z,intBitsToFloat(R11i.z)) + intBitsToFloat(PV0ix));
PV1iy = floatBitsToInt(uf_blockVS7[51].y + uf_blockVS7[51].w);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R12i.y)) + intBitsToFloat(R123i.w));
R125i.x = int(intBitsToFloat(R5i.z));
// 2
R0i.x = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
R0i.y = floatBitsToInt(intBitsToFloat(R8i.z) + 0.5);
R126i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[51].w,intBitsToFloat(R6i.y)) + intBitsToFloat(PV1iy));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[53].z);
// 3
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[53].x, intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[53].w);
// 4
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[53].y, intBitsToFloat(PS1i)));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.w)),uf_blockVS7[49].x) + -(intBitsToFloat(R127i.y)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),uf_blockVS7[49].y) + intBitsToFloat(R125i.z));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),intBitsToFloat(R127i.z)) + -(0.5));
PS0i = floatBitsToInt(float(backupReg0i));
// 5
backupReg0i = R127i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),uf_blockVS7[50].z) + intBitsToFloat(R124i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R127i.x)) + -(0.5));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),uf_blockVS7[50].w) + intBitsToFloat(R126i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(PS0i)) + intBitsToFloat(R123i.y));
PS1i = floatBitsToInt(float(R125i.x));
// 6
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.x)),intBitsToFloat(PS1i)) + intBitsToFloat(R125i.z));
R6i.y = floatBitsToInt(uf_blockVS7[104].x);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R125i.w)) + intBitsToFloat(R123i.w));
// 7
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R127i.y)) + -(intBitsToFloat(R123i.x)));
R0i.z = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
// 8
R0i.w = floatBitsToInt(intBitsToFloat(R123i.z) + 0.5);
}
if( activeMaskStackC[3] == true ) {
// 0
R6i.x = floatBitsToInt(uf_blockVS8[3].x * 1.0 + 0.0);
// 1
R19i.x = R13i.x;
R19i.y = R13i.y;
R19i.z = R13i.z;
R19i.w = R13i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
// skipped export to semanticId 255
// export
// skipped export to semanticId 255
// export
passParameterSem7 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.z), intBitsToFloat(R6i.z));
}
