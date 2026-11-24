#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 32da5dcfc3d8dbaa
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
UNIFORM_BUFFER_LAYOUT(6, 0, 2) uniform uniformBlockVS6
{
vec4 uf_blockVS6[19];
};


UNIFORM_BUFFER_LAYOUT(7, 0, 3) uniform uniformBlockVS7
{
vec4 uf_blockVS7[4096];
};


UNIFORM_BUFFER_LAYOUT(8, 0, 4) uniform uniformBlockVS8
{
vec4 uf_blockVS8[7];
};


UNIFORM_BUFFER_LAYOUT(13, 0, 5) uniform uniformBlockVS13
{
vec4 uf_blockVS13[39];
};


TEXTURE_LAYOUT(40, 0, 0) uniform sampler2D textureUnitVS8;
TEXTURE_LAYOUT(45, 0, 1) uniform sampler2D textureUnitVS13;
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
out vec4 passParameterSem3;
out vec4 passParameterSem11;
out vec4 passParameterSem14;
out vec4 passParameterSem15;
out vec4 passParameterSem16;
out vec4 passParameterSem4;
out vec4 passParameterSem8;
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
R4i.w = floatBitsToInt(1.0);
// 1
R5i.w = floatBitsToInt(-(intBitsToFloat(R2i.w)) + uf_blockVS8[2].x);
R7i.w = floatBitsToInt(-(intBitsToFloat(R7i.x)) + 1.0);
// 2
predResult = (0.0 > intBitsToFloat(R5i.w));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R9i.x = 0;
R9i.y = 0;
R9i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R10i.x = 0;
// 1
R2i.w = R4i.w;
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
R18i.x = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R5i.w) >= intBitsToFloat(R18i.x));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R9i.x = 0;
R9i.y = 0;
R9i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R10i.x = 0;
// 1
R3i.w = R4i.w;
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
// 0
R124i.x = floatBitsToInt(max(intBitsToFloat(R5i.x), 0.0));
PV0iy = floatBitsToInt((0.0 > uf_blockVS7[9].x)?1.0:0.0);
PV0iz = floatBitsToInt((uf_blockVS7[9].x > 0.0)?1.0:0.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), uf_blockVS7[10].y));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[9].x);
// 1
R127i.x = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(intBitsToFloat(R5i.w) * intBitsToFloat(PS0i));
R127i.z = floatBitsToInt(-(uf_blockVS7[96].w) + uf_blockVS7[97].w);
R126i.w = floatBitsToInt(-(uf_blockVS7[96].z) + uf_blockVS7[97].z);
R10i.x = floatBitsToInt(1.0 / intBitsToFloat(R18i.x));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1iy));
R127i.y = floatBitsToInt(-(uf_blockVS7[96].x) + uf_blockVS7[97].x);
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R2i.w = floatBitsToInt(intBitsToFloat(R5i.w) * intBitsToFloat(R10i.x));
R126i.x = floatBitsToInt(-(uf_blockVS7[96].y) + uf_blockVS7[97].y);
// 3
R125i.x = floatBitsToInt(-(uf_blockVS7[97].w) + uf_blockVS7[98].w);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PV0iz)));
R126i.z = floatBitsToInt(-(uf_blockVS7[97].z) + uf_blockVS7[98].z);
PV1iw = floatBitsToInt(fract(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV1iw)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS1i));
R125i.z = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS1i));
R127i.w = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(PS1i));
R127i.z = floatBitsToInt(-(uf_blockVS7[97].x) + uf_blockVS7[98].x);
// 5
R127i.x = floatBitsToInt(min(intBitsToFloat(R124i.x), 0.0));
PV1iy = floatBitsToInt(-(uf_blockVS7[97].y) + uf_blockVS7[98].y);
R126i.w = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R125i.x));
// 6
R125i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(PS1i));
R126i.y = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS1i));
R127i.z = floatBitsToInt(intBitsToFloat(R126i.w) + -(uf_blockVS7[96].w));
R125i.w = floatBitsToInt(intBitsToFloat(R126i.w) + -(uf_blockVS7[97].w));
R124i.w = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS1i));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.w)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.y)));
PV1iz = floatBitsToInt(intBitsToFloat(R126i.w) + -(uf_blockVS7[98].w));
R126i.w = ((intBitsToFloat(R125i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R125i.z)));
// 8
R124i.x = ((intBitsToFloat(R127i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.y = ((intBitsToFloat(PV1iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.z = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
R0i.w = floatBitsToInt(uf_blockVS7[96].x + intBitsToFloat(PV1iy));
R127i.y = floatBitsToInt(uf_blockVS7[96].y + intBitsToFloat(PV1ix));
// 9
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(uf_blockVS7[96].z + intBitsToFloat(R127i.w));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(backupReg0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R126i.y)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R124i.w)));
PS1i = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
// 10
backupReg0i = R124i.x;
backupReg1i = R127i.z;
R124i.x = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PS1i)));
R127i.z = floatBitsToInt(uf_blockVS7[97].x + intBitsToFloat(PV1iz));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(backupReg1i)));
R125i.z = floatBitsToInt(uf_blockVS7[97].y + intBitsToFloat(PV1iy));
// 11
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV0iw)));
R127i.y = floatBitsToInt(uf_blockVS7[97].z + intBitsToFloat(R127i.w));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV0iw)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iw)));
PS1i = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].x, intBitsToFloat(R124i.x)));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].z, intBitsToFloat(R124i.x)));
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].y, intBitsToFloat(R124i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R126i.y)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PS1i));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R126i.y)));
// 13
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R126i.y)));
PV1iy = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(PV0iy));
R127i.w = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0iw));
R125i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[98].x, intBitsToFloat(R125i.y)));
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(uf_blockVS7[98].y, intBitsToFloat(R125i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockVS7[98].z, intBitsToFloat(R125i.y)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1iz));
R0i.x = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(R127i.x));
// 15
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(R127i.w));
R8i.z = floatBitsToInt(-(uf_blockVS7[12].x) + 1.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PV0iz));
R1i.w = ((uf_blockVS7[12].x == 1.0)?-1:0);
// 16
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(PV1iw)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(PV1ix)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1iy)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), uf_blockVS8[3].y));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), uf_blockVS8[3].z));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), uf_blockVS8[3].w));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), uf_blockVS8[3].y));
// 1
R8i.y = floatBitsToInt(uf_blockVS8[2].w + intBitsToFloat(R5i.w));
// 2
predResult = (R1i.w != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(R8i.y)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].w, intBitsToFloat(PV0ix)));
// 2
R0i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].x, intBitsToFloat(PV1iw)));
R0i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].y, intBitsToFloat(PV1iw)));
R0i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].z, intBitsToFloat(PV1iw)));
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
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PS1i)));
R127i.y = ((uf_blockVS7[12].x == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R8i.z));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R8i.y) + -(intBitsToFloat(PV1iz)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].w, intBitsToFloat(PV1ix)));
// 9
R0i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].x, intBitsToFloat(PV0iw)));
R0i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].y, intBitsToFloat(PV0iw)));
R0i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].z, intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(uf_blockVS7[13].y);
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
PV0iy = floatBitsToInt(uf_blockVS7[13].x);
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R6i.z)));
R0i.w = 0x3f800000;
tempResultf = max(0.0, uf_blockVS7[12].x);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(uf_blockVS6[12].x);
PV1iz = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV0iy));
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R8i.z));
// 2
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(PV1iw)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(PV1iz)));
R126i.z = floatBitsToInt(uf_blockVS6[13].x);
R127i.w = floatBitsToInt(uf_blockVS6[14].x);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
// 3
R126i.x = floatBitsToInt(uf_blockVS6[13].y);
PV1iy = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R127i.z = floatBitsToInt(uf_blockVS6[12].y);
R126i.w = 0x3f800000;
R3i.w = 0x3f800000;
// 4
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(uf_blockVS6[14].y);
PV0iy = floatBitsToInt(uf_blockVS6[12].z);
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(backupReg0i));
// 5
PV1ix = floatBitsToInt(uf_blockVS6[13].z);
R126i.y = floatBitsToInt(uf_blockVS6[14].z);
R123i.z = ((R1i.w == 0)?(PV0iw):(R8i.y));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(PV0iy)));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.z)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R127i.z)) + intBitsToFloat(PV1iw));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R123i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R123i.z)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(PV1ix)));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV0ix));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R126i.x)) + intBitsToFloat(PS0i));
R17i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.y));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1ix)));
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R126i.z)) + intBitsToFloat(R123i.w));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1iz)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R126i.y)));
// 9
R1i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV0iw));
R1i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV0iz));
R1i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0ix));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R127i.x)) + intBitsToFloat(PS0i));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), uf_blockVS7[13].z));
// 10
R17i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.w));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R125i.y),intBitsToFloat(R125i.z),intBitsToFloat(R126i.w)),vec4(uf_blockVS6[12].x,uf_blockVS6[12].y,uf_blockVS6[12].z,uf_blockVS6[12].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R3i.z = tempi.x;
PV1iw = tempi.x;
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R125i.y),intBitsToFloat(R125i.z),intBitsToFloat(R126i.w)),vec4(uf_blockVS6[13].x,uf_blockVS6[13].y,uf_blockVS6[13].z,uf_blockVS6[13].w)));
PV0ix = tempi.x;
R3i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 13
R3i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R125i.y),intBitsToFloat(R125i.z),intBitsToFloat(R126i.w)),vec4(uf_blockVS6[14].x,uf_blockVS6[14].y,uf_blockVS6[14].z,uf_blockVS6[14].w)));
PV1iy = R3i.x;
PV1iz = R3i.x;
PV1iw = R3i.x;
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS8[4].x,uf_blockVS8[4].y,uf_blockVS8[4].z,uf_blockVS8[4].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
R4i.x = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R3i.z));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS8[5].x,uf_blockVS8[5].y,uf_blockVS8[5].z,uf_blockVS8[5].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R4i.w = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS8[6].x,uf_blockVS8[6].y,uf_blockVS8[6].z,uf_blockVS8[6].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R8i.y = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R3i.y));
// 4
R1i.x = floatBitsToInt(uf_blockVS7[60].y);
R1i.y = floatBitsToInt(uf_blockVS7[60].z);
R4i.z = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R3i.x));
R1i.w = floatBitsToInt(uf_blockVS7[60].x);
// 5
R125i.y = floatBitsToInt(-(uf_blockVS7[68].x) + uf_blockVS7[69].x);
// 6
PV0ix = floatBitsToInt(-(uf_blockVS7[68].w) + uf_blockVS7[69].w);
// 7
R0i.w = floatBitsToInt(-(uf_blockVS7[69].x) + uf_blockVS7[70].x);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 8
R3i.x = floatBitsToInt(-(uf_blockVS7[69].w) + uf_blockVS7[70].w);
R1i.z = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(PS1i));
}
if( activeMaskStackC[3] == true ) {
// 0
R9i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R8i.y),intBitsToFloat(R4i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS6[8].x,uf_blockVS6[8].y,uf_blockVS6[8].z,uf_blockVS6[8].w)));
PV0iy = R9i.x;
PV0iz = R9i.x;
PV0iw = R9i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R8i.y),intBitsToFloat(R4i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS6[9].x,uf_blockVS6[9].y,uf_blockVS6[9].z,uf_blockVS6[9].w)));
PV1ix = tempi.x;
R9i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R3i.x));
// 2
R3i.x = floatBitsToInt(intBitsToFloat(R0i.w) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt((uf_blockVS7[8].y > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > uf_blockVS7[8].y)?1.0:0.0);
PS0i = floatBitsToInt(1.0 / uf_blockVS7[8].y);
// 3
R125i.x = floatBitsToInt(intBitsToFloat(R5i.w) * intBitsToFloat(PS0i));
R125i.z = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iw)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R8i.y),intBitsToFloat(R4i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS6[11].x,uf_blockVS6[11].y,uf_blockVS6[11].z,uf_blockVS6[11].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R9i.w = tempi.x;
R125i.y = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
// 5
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R8i.y),intBitsToFloat(R4i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS6[0].x,uf_blockVS6[0].y,uf_blockVS6[0].z,uf_blockVS6[0].w)));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
R127i.y = PV0ix;
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) / 2.0);
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R8i.y),intBitsToFloat(R4i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS6[1].x,uf_blockVS6[1].y,uf_blockVS6[1].z,uf_blockVS6[1].w)));
PV0ix = tempi.x;
R126i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R8i.y),intBitsToFloat(R4i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS6[2].x,uf_blockVS6[2].y,uf_blockVS6[2].z,uf_blockVS6[2].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 8
R126i.z = floatBitsToInt(intBitsToFloat(R6i.z) + intBitsToFloat(PV1ix));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),uf_blockVS7[9].z) + intBitsToFloat(R125i.x));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R8i.y),intBitsToFloat(R4i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS6[3].x,uf_blockVS6[3].y,uf_blockVS6[3].z,uf_blockVS6[3].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R126i.w = tempi.x;
PS1i = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PS1i)));
// 11
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R125i.y)) + intBitsToFloat(PV0ix));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R126i.z),intBitsToFloat(R126i.w)),vec4(uf_blockVS6[6].x,uf_blockVS6[6].y,uf_blockVS6[6].z,uf_blockVS6[6].w)));
PV0ix = tempi.x;
R125i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R126i.z),intBitsToFloat(R126i.w)),vec4(uf_blockVS6[7].x,uf_blockVS6[7].y,uf_blockVS6[7].z,uf_blockVS6[7].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 14
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 15
PV1iw = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(PS0i));
// 16
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(PV1iw)));
// 17
R11i.x = floatBitsToInt(intBitsToFloat(R9i.x) * 0.5 + intBitsToFloat(R127i.y));
R11i.y = floatBitsToInt(intBitsToFloat(R9i.y) * -(0.5) + intBitsToFloat(R127i.y));
R11i.z = floatBitsToInt(intBitsToFloat(R9i.z) * 0.5 + intBitsToFloat(R127i.y));
R11i.w = floatBitsToInt(intBitsToFloat(R9i.w) * 1.0);
// 18
R8i.x = floatBitsToInt(1.0 / intBitsToFloat(R11i.w));
// 19
PV1iw = floatBitsToInt(intBitsToFloat(R11i.z) * intBitsToFloat(R8i.x));
// 20
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),uf_blockVS6[18].w) + -(uf_blockVS6[18].y));
// 21
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.z));
// 22
R0i.x = floatBitsToInt(-(uf_blockVS6[18].z) * intBitsToFloat(PS1i));
// 23
PV1ix = floatBitsToInt((uf_blockVS7[8].w > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > uf_blockVS7[8].w)?1.0:0.0);
PS1i = floatBitsToInt(1.0 / uf_blockVS7[8].w);
// 24
PV0ix = floatBitsToInt(intBitsToFloat(R5i.w) * intBitsToFloat(PS1i));
R126i.z = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iw)));
// 25
R127i.y = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),uf_blockVS7[10].x) + intBitsToFloat(PV0ix));
// 26
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
// 27
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV0iz)));
// 28
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R127i.y)) + intBitsToFloat(PV1ix));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R3i.w) + -(uf_blockVS7[69].w));
PV0iz = floatBitsToInt(intBitsToFloat(R3i.w) + -(uf_blockVS7[68].w));
// 1
R127i.x = ((intBitsToFloat(PV0iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R1i.z)) + uf_blockVS7[68].x);
R125i.z = ((intBitsToFloat(PV0ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R3i.x)) + uf_blockVS7[69].x);
// 2
PV0ix = floatBitsToInt(-(uf_blockVS7[70].w) + uf_blockVS7[71].w);
PV0iy = floatBitsToInt(intBitsToFloat(R3i.w) + -(uf_blockVS7[71].w));
R126i.z = floatBitsToInt(intBitsToFloat(R3i.w) + -(uf_blockVS7[70].w));
PV0iw = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
R127i.y = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
// 3
backupReg0i = R127i.x;
R127i.x = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iy = floatBitsToInt(-(uf_blockVS7[70].x) + uf_blockVS7[71].x);
R127i.z = ((intBitsToFloat(R126i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iw)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(uf_blockVS7[68].x, intBitsToFloat(R127i.y)));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), uf_blockVS8[0].x));
// 5
backupReg0i = R125i.y;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PV0iy)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(PV0iz)) + uf_blockVS7[70].x);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iw)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R126i.w)) + intBitsToFloat(PV0ix));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), uf_blockVS8[0].y));
// 6
R6i.x = floatBitsToInt(uf_blockVS7[76].y);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV1ix)) + intBitsToFloat(R123i.w));
R2i.w = floatBitsToInt(uf_blockVS7[76].x);
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), uf_blockVS8[0].z));
// 7
R2i.x = floatBitsToInt(uf_blockVS7[76].z);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.z));
R1i.z = floatBitsToInt(intBitsToFloat(R0i.w) + -(uf_blockVS7[84].w));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[71].x,intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.y));
R1i.y = floatBitsToInt(intBitsToFloat(R0i.w) + -(uf_blockVS7[85].w));
// 9
R6i.z = floatBitsToInt(intBitsToFloat(R0i.w) + -(uf_blockVS7[86].w));
R13i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), uf_blockVS8[0].w));
// 10
R125i.y = floatBitsToInt(-(uf_blockVS7[84].x) + uf_blockVS7[85].x);
// 11
PV1ix = floatBitsToInt(-(uf_blockVS7[84].w) + uf_blockVS7[85].w);
// 12
R127i.w = floatBitsToInt(-(uf_blockVS7[85].x) + uf_blockVS7[86].x);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 13
PV1ix = floatBitsToInt(-(uf_blockVS7[85].w) + uf_blockVS7[86].w);
PV1iz = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(PS0i));
// 14
R1i.x = floatBitsToInt(intBitsToFloat(R0i.w) + -(uf_blockVS7[87].w));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(PV1iz)) + uf_blockVS7[84].x);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 15
PV1ix = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS0i));
R125i.y = floatBitsToInt(-(uf_blockVS7[86].x) + uf_blockVS7[87].x);
// 16
R3i.z = floatBitsToInt(intBitsToFloat(R0i.w) + -(uf_blockVS7[88].w));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(PV1ix)) + uf_blockVS7[85].x);
// 17
PV1ix = floatBitsToInt(-(uf_blockVS7[86].w) + uf_blockVS7[87].w);
// 18
R127i.w = floatBitsToInt(-(uf_blockVS7[87].x) + uf_blockVS7[88].x);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 19
PV1ix = floatBitsToInt(-(uf_blockVS7[87].w) + uf_blockVS7[88].w);
PV1iz = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(PS0i));
// 20
R3i.x = floatBitsToInt(intBitsToFloat(R0i.w) + -(uf_blockVS7[89].w));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(PV1iz)) + uf_blockVS7[86].x);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 21
PV1ix = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS0i));
R125i.y = floatBitsToInt(-(uf_blockVS7[88].x) + uf_blockVS7[89].x);
// 22
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(PV1ix)) + uf_blockVS7[87].x);
// 23
PV1ix = floatBitsToInt(-(uf_blockVS7[88].w) + uf_blockVS7[89].w);
// 24
R127i.w = floatBitsToInt(-(uf_blockVS7[89].x) + uf_blockVS7[90].x);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 25
PV1ix = floatBitsToInt(-(uf_blockVS7[89].w) + uf_blockVS7[90].w);
PV1iz = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(PS0i));
// 26
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(PV1iz)) + uf_blockVS7[88].x);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 27
PV1ix = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS0i));
// 28
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(PV1ix)) + uf_blockVS7[89].x);
}
if( activeMaskStackC[3] == true ) {
// 0
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.x), uf_blockVS7[59].x));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), uf_blockVS7[59].x));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), uf_blockVS7[59].x));
// 1
R127i.x = ((intBitsToFloat(R6i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.y = ((intBitsToFloat(R1i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.z = ((intBitsToFloat(R1i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.w = ((intBitsToFloat(R1i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.z = ((intBitsToFloat(R3i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R0i.w) + -(uf_blockVS7[90].w));
R127i.y = ((intBitsToFloat(R3i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
PV0iw = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
PS0i = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
// 3
PV1ix = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0iz)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV0iw)));
R126i.w = ((intBitsToFloat(PV0ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PS0i)));
// 4
PV0ix = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV1ix)));
PS0i = ((intBitsToFloat(R5i.x) > 0.5)?-1:0);
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockVS7[84].x, intBitsToFloat(PV0iy)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV0iz)));
R1i.z = ((PS0i == 0)?(R7i.x):(R7i.w));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV0ix)));
PS1i = ((intBitsToFloat(R5i.y) > 0.5)?-1:0);
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(PV1iw)) + intBitsToFloat(PV1ix));
PV0iy = ((intBitsToFloat(R5i.y) > 0.5)?-1:0);
R3i.z = ((PS1i == 0)?(R7i.y):(R7i.z));
PV0iw = ((intBitsToFloat(R5i.z) > 0.5)?-1:0);
// 7
R3i.x = ((PV0iw == 0)?(R7i.y):(R7i.z));
R3i.y = ((PV0iy == 0)?(R7i.x):(R7i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(R126i.y)) + intBitsToFloat(R123i.x));
// 8
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R125i.z)) + intBitsToFloat(R123i.w));
// 9
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(R124i.y)) + intBitsToFloat(R123i.z));
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.y));
// 11
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w),intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.x));
// 12
R6i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[90].x,intBitsToFloat(R126i.w)) + intBitsToFloat(R123i.w));
}
if( activeMaskStackC[3] == true ) {
// 0
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), uf_blockVS8[1].x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), uf_blockVS8[1].y));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), uf_blockVS8[1].z));
R14i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), uf_blockVS8[1].w));
// 1
R14i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R1i.x)));
R14i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R0i.y)));
R14i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R0i.z)));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(uf_blockVS7[5].x) & 0x800000;
PV0iy = floatBitsToInt(uf_blockVS7[5].x) & 0x100000;
PV0iz = floatBitsToInt(uf_blockVS7[5].x) & 0x80000;
PV0iw = floatBitsToInt(uf_blockVS7[5].x) & 0x1000000;
PS0i = floatBitsToInt(uf_blockVS7[5].y) & int(1);
// 1
PV1ix = (PV0iy == 0x100000)?-1:0;
PV1iy = (PV0iz == 0x80000)?-1:0;
PV1iz = (PV0iw == 0x1000000)?-1:0;
PV1iw = (PV0ix == 0x800000)?-1:0;
R6i.y = (int(1) != PS0i)?-1:0;
// 2
R6i.x = ((PV1iw == 0)?(R7i.x):(R3i.y));
R1i.y = ((PV1ix == 0)?(R7i.y):(R3i.z));
R6i.z = ((PV1iy == 0)?(R7i.x):(R1i.z));
R0i.w = ((PV1iz == 0)?(R7i.y):(R3i.x));
R125i.x = int(uf_blockVS7[17].x);
// 3
R127i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x20;
R127i.y = floatBitsToInt(uf_blockVS7[5].x) & 0x40;
PV1iz = floatBitsToInt(uf_blockVS7[5].x) & 0x10;
R126i.w = floatBitsToInt(uf_blockVS7[5].x) & 0x80;
R127i.w = int(uf_blockVS7[17].y);
// 4
R127i.z = int(-1) + R125i.x;
PS0i = floatBitsToInt(float(PV1iz));
// 5
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PS1i = floatBitsToInt(float(R127i.x));
// 6
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PS0i = floatBitsToInt(float(R127i.y));
// 7
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R126i.y = floatBitsToInt(uf_blockVS7[5].x) & 0x2000000;
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R127i.y = int(intBitsToFloat(PV0iz));
// 8
PV0ix = 0 - R127i.y;
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iw)));
R124i.y = int(intBitsToFloat(PV1iz));
// 9
PV1ix = 0 - R124i.y;
R125i.w = max(R127i.y, PV0ix);
R127i.y = int(intBitsToFloat(PV0iz));
// 10
PV0ix = 0 - R127i.y;
R3i.w = max(R124i.y, PV1ix);
PS0i = floatBitsToInt(float(R126i.w));
// 11
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R6i.w = max(R127i.y, PV0ix);
R126i.z = floatBitsToInt(float(R125i.x));
// 12
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R126i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(R126i.z)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iy)));
R125i.z = floatBitsToInt(float(R127i.w));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(R10i.x) * intBitsToFloat(PV0iy));
R127i.y = int(intBitsToFloat(PV0iz));
// 14
PV0ix = 0 - R127i.y;
PS0i = int(intBitsToFloat(PV1ix));
// 15
R127i.w = max(R127i.y, PV0ix);
R3i.z = R125i.w * PS0i;
// 16
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R125i.z));
// 17
PV1ix = floatBitsToInt(intBitsToFloat(R5i.w) * intBitsToFloat(PS0i));
R7i.y = floatBitsToInt(float(R125i.x));
// 18
R7i.x = floatBitsToInt(abs(intBitsToFloat(R7i.y)));
R126i.w = int(intBitsToFloat(PV1ix));
// 19
PS1i = floatBitsToInt(float(R126i.w));
// 20
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.z)) + intBitsToFloat(PS1i));
R125i.x = floatBitsToInt(float(R126i.w));
// 21
R123i.x = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.w = floatBitsToInt(abs(intBitsToFloat(R125i.x)));
R1i.w = floatBitsToInt(1.0 / abs(intBitsToFloat(R7i.y)));
// 22
PV0iz = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R125i.x)), intBitsToFloat(R1i.w)));
PS0i = int(intBitsToFloat(R123i.x));
// 23
R124i.x = int(1) - PS0i;
PV1iy = floatBitsToInt(trunc(intBitsToFloat(PV0iz)));
R2i.w = PS0i * R127i.z;
// 24
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iy)),intBitsToFloat(R7i.x)) + intBitsToFloat(R125i.w));
PS0i = floatBitsToInt(float(R126i.y));
// 25
PV1ix = floatBitsToInt((intBitsToFloat(R127i.z) >= abs(intBitsToFloat(R7i.y)))?1.0:0.0);
PV1iy = floatBitsToInt(-(abs(intBitsToFloat(R7i.y))) + intBitsToFloat(R127i.z));
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R126i.x = int(intBitsToFloat(R127i.x));
// 26
backupReg0i = R127i.w;
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
R127i.w = ((intBitsToFloat(PV1ix) == 0.0)?(R127i.z):(PV1iy));
R3i.y = backupReg0i * R126i.x;
// 27
PV1iz = floatBitsToInt(abs(intBitsToFloat(R7i.y)) + intBitsToFloat(R127i.w));
R127i.x = int(intBitsToFloat(PV0iy));
// 28
R123i.y = ((-(intBitsToFloat(R127i.w)) > 0.0)?(PV1iz):(R127i.w));
PV0iw = 0 - R127i.x;
// 29
R123i.x = ((-(intBitsToFloat(R125i.x)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.y)))):(R123i.y));
PV1iz = max(R127i.x, PV0iw);
// 30
R123i.w = ((intBitsToFloat(R7i.y) == 0.0)?(R125i.x):(R123i.x));
PS0i = PV1iz * R126i.x;
// 31
R1i.z = R126i.w + PS0i;
PS1i = int(intBitsToFloat(R123i.w));
// 32
R3i.x = R124i.x * PS1i;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iz = R3i.x + R2i.w;
R124i.x = R6i.w * R1i.z;
// 1
PS1i = R3i.w * PV0iz;
// 2
PV0iy = PS1i + R3i.z;
// 3
PV1ix = R124i.x + PV0iy;
// 4
PV0iw = R3i.y + PV1ix;
// 5
R126i.z = floatBitsToInt(float(PV0iw));
// 6
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), abs(intBitsToFloat(R126i.z))));
R126i.w = floatBitsToInt(abs(intBitsToFloat(R126i.z)));
// 7
PV1ix = floatBitsToInt(trunc(intBitsToFloat(PV0iy)));
// 8
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(R7i.x)) + intBitsToFloat(R126i.w));
// 9
PV1ix = floatBitsToInt((intBitsToFloat(R127i.z) >= abs(intBitsToFloat(R7i.y)))?1.0:0.0);
PV1iy = floatBitsToInt(-(abs(intBitsToFloat(R7i.y))) + intBitsToFloat(R127i.z));
// 10
R126i.w = ((intBitsToFloat(PV1ix) == 0.0)?(R127i.z):(PV1iy));
// 11
PV1iz = floatBitsToInt(abs(intBitsToFloat(R7i.y)) + intBitsToFloat(R126i.w));
// 12
R123i.y = ((-(intBitsToFloat(R126i.w)) > 0.0)?(PV1iz):(R126i.w));
// 13
R123i.x = ((-(intBitsToFloat(R126i.z)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.y)))):(R123i.y));
// 14
R123i.w = ((intBitsToFloat(R7i.y) == 0.0)?(R126i.z):(R123i.x));
// 15
R126i.z = int(intBitsToFloat(R123i.w));
// 16
R126i.y = floatBitsToInt(float(R126i.z));
// 17
PV1ix = floatBitsToInt((intBitsToFloat(R126i.y) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(R126i.y))?1.0:0.0);
R126i.x = floatBitsToInt(float(R126i.z));
// 18
R127i.y = floatBitsToInt(abs(intBitsToFloat(R126i.x)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(abs(intBitsToFloat(R126i.x)) * 0.25);
// 19
R123i.y = floatBitsToInt(intBitsToFloat(PV0iz) * 0.5 + intBitsToFloat(R126i.y));
PV1iz = floatBitsToInt(trunc(intBitsToFloat(PV0iw)));
// 20
R124i.x = floatBitsToInt(-(intBitsToFloat(PV1iz)) * 4.0 + intBitsToFloat(R127i.y));
PV0iy = floatBitsToInt(intBitsToFloat(R123i.y) * 0.25);
// 21
PV1ix = floatBitsToInt(trunc(intBitsToFloat(PV0iy)));
PV1iz = floatBitsToInt((intBitsToFloat(R124i.x) >= 4.0)?1.0:0.0);
PV1iw = floatBitsToInt(intBitsToFloat(R124i.x) + -4.0);
// 22
R127i.y = ((intBitsToFloat(PV1iz) == 0.0)?(R124i.x):(PV1iw));
PS0i = int(intBitsToFloat(PV1ix));
// 23
PV1ix = floatBitsToInt(intBitsToFloat(R127i.y) + 4.0);
R7i.y = PS0i + 0x12;
PS1i = int(uf_blockVS7[48].z);
// 24
R123i.w = ((-(intBitsToFloat(R127i.y)) > 0.0)?(PV1ix):(R127i.y));
R0i.y = floatBitsToInt(float(PS1i));
// 25
R123i.z = ((-(intBitsToFloat(R126i.x)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.w)))):(R123i.w));
// 26
PS0i = int(intBitsToFloat(R123i.z));
// 27
PV1ix = int(-1) + PS0i;
R4i.y = floatBitsToInt(abs(intBitsToFloat(R0i.y)));
R126i.z = 0xfffffffd + PS0i;
R126i.w = 0xfffffffe + PS0i;
PS1i = floatBitsToInt(float(PS0i));
// 28
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(PV1ix));
// 29
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(float(R126i.w));
// 30
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R126i.x = int(intBitsToFloat(PV1iy));
// 31
PV1ix = 0 - R126i.x;
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iz)));
R126i.w = int(intBitsToFloat(PV0ix));
// 32
PV0ix = 0 - R126i.w;
PV0iz = max(R126i.x, PV1ix);
R127i.z = int(intBitsToFloat(PV1iw));
// 33
R7i.x = int(1) - PV0iz;
PV1iy = max(R126i.w, PV0ix);
PV1iz = 0 - R127i.z;
PS1i = floatBitsToInt(float(R126i.z));
// 34
PV0ix = max(R127i.z, PV1iz);
R3i.y = int(1) - PV1iy;
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R1i.z = floatBitsToInt(1.0 / abs(intBitsToFloat(R0i.y)));
// 35
PV1iz = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iw)));
R1i.w = int(1) - PV0ix;
// 36
R127i.y = int(intBitsToFloat(PV1iz));
// 37
PV1ix = 0 - R127i.y;
// 38
PV0iw = max(R127i.y, PV1ix);
// 39
R3i.z = int(1) - PV0iw;
}
if( activeMaskStackC[3] == true ) {
R2i.xyzw = floatBitsToInt(uf_blockVS7[R7i.y].xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), uf_blockVS7[45].x));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), uf_blockVS7[45].y));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
PV0iz = floatBitsToInt(uf_blockVS7[44].w + uf_blockVS7[45].y);
PV0iw = floatBitsToInt(uf_blockVS7[44].z + uf_blockVS7[45].x);
R127i.y = R3i.z * R2i.w;
// 1
PV1ix = floatBitsToInt(uf_blockVS7[46].x + uf_blockVS7[46].z);
PV1iy = floatBitsToInt(uf_blockVS7[46].y + uf_blockVS7[46].w);
PV1iz = floatBitsToInt(-(intBitsToFloat(PV0ix)) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(-(intBitsToFloat(PV0iy)) + intBitsToFloat(PV0iz));
R126i.x = R1i.w * R2i.z;
// 2
R3i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.w)),uf_blockVS7[44].x) + -(intBitsToFloat(PV1iz)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),uf_blockVS7[46].z) + intBitsToFloat(PV1ix));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),uf_blockVS7[44].y) + intBitsToFloat(PV1iw));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),uf_blockVS7[46].w) + intBitsToFloat(PV1iy));
R126i.w = R3i.y * R2i.y;
// 3
backupReg0i = R2i.x;
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),uf_blockVS7[45].z) + intBitsToFloat(R123i.y));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),uf_blockVS7[45].w) + intBitsToFloat(R123i.w));
PS1i = R7i.x * backupReg0i;
// 4
PV0iy = R126i.w + PS1i;
R125i.x = floatBitsToInt(1.0 / intBitsToFloat(R0i.y));
// 5
PV1ix = R126i.x + PV0iy;
PS1i = floatBitsToInt(1.0 / uf_blockVS7[48].z);
// 6
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].x, intBitsToFloat(PS1i)));
R126i.w = R127i.y + PV1ix;
PS0i = floatBitsToInt(1.0 / uf_blockVS7[48].w);
// 7
R126i.x = ((R6i.y == 0)?(0):(0x2));
R126i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].y, intBitsToFloat(PS0i)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R127i.x)) + -(0.5));
R124i.x = floatBitsToInt(float(R126i.w));
// 8
PV0ix = floatBitsToInt((intBitsToFloat(R124i.x) > 0.0)?1.0:0.0);
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R126i.y)) + -(0.5));
R127i.z = (R126i.x == int(1))?-1:0;
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(R124i.x))?1.0:0.0);
R126i.w = floatBitsToInt(float(R126i.w));
// 9
backupReg0i = R126i.w;
backupReg1i = R126i.x;
R126i.x = floatBitsToInt(abs(intBitsToFloat(backupReg0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(backupReg0i)), intBitsToFloat(R1i.z)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
PV1iw = (backupReg1i == 0x2)?-1:0;
R125i.w = ((R127i.z == 0)?(R5i.x):(R5i.y));
// 10
PV0ix = floatBitsToInt(trunc(intBitsToFloat(PV1iy)));
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * 0.5 + intBitsToFloat(R124i.x));
R123i.z = ((PV1iw == 0)?(R5i.y):(R5i.x));
R123i.w = ((PV1iw == 0)?(R5i.x):(R5i.z));
R1i.z = ((R127i.z == 0)?(R5i.y):(R5i.z));
// 11
backupReg0i = R125i.x;
R125i.x = ((R127i.z == 0)?(R123i.w):(R5i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0ix)),intBitsToFloat(R4i.y)) + intBitsToFloat(R126i.x));
R125i.z = ((R127i.z == 0)?(R123i.z):(R5i.z));
PV1iw = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(backupReg0i));
PS1i = int(uf_blockVS7[58].z);
// 12
PV0ix = floatBitsToInt(-(abs(intBitsToFloat(R0i.y))) + intBitsToFloat(R127i.y));
PV0iz = floatBitsToInt(trunc(intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt((intBitsToFloat(R127i.y) >= abs(intBitsToFloat(R0i.y)))?1.0:0.0);
R126i.x = floatBitsToInt(float(PS1i));
// 13
PV1ix = floatBitsToInt((0.0 >= abs(intBitsToFloat(R126i.x)))?1.0:0.0);
R127i.z = ((intBitsToFloat(PV0iw) == 0.0)?(R127i.y):(PV0ix));
PV1iw = floatBitsToInt(-(abs(intBitsToFloat(R126i.x))) + 0.0);
PS1i = int(intBitsToFloat(PV0iz));
// 14
PV0ix = floatBitsToInt(abs(intBitsToFloat(R0i.y)) + intBitsToFloat(R127i.z));
R127i.y = ((intBitsToFloat(PV1ix) == 0.0)?(0):(PV1iw));
PS0i = floatBitsToInt(float(PS1i));
// 15
R123i.x = ((-(intBitsToFloat(R127i.z)) > 0.0)?(PV0ix):(R127i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.y)),intBitsToFloat(PS0i)) + intBitsToFloat(R126i.z));
PV1iz = floatBitsToInt(abs(intBitsToFloat(R126i.x)) + intBitsToFloat(R127i.y));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 16
backupReg0i = R123i.x;
backupReg1i = R123i.y;
R123i.x = ((-(intBitsToFloat(R127i.y)) > 0.0)?(PV1iz):(R127i.y));
R123i.y = ((-(intBitsToFloat(R126i.w)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(backupReg0i)))):(backupReg0i));
PV0iz = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R124i.y)) + -(intBitsToFloat(backupReg1i)));
// 17
R126i.x = ((intBitsToFloat(R126i.x) == 0.0)?(0):(R123i.x));
R127i.y = floatBitsToInt(trunc(intBitsToFloat(PV0iz)));
R123i.z = ((intBitsToFloat(R0i.y) == 0.0)?(R126i.w):(R123i.y));
// 18
PS0i = int(intBitsToFloat(R123i.z));
// 19
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockVS7[55].x, intBitsToFloat(R125i.x)));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockVS7[55].y, intBitsToFloat(R125i.z)));
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) * 2.0);
PV1iz = floatBitsToInt(uf_blockVS7[54].w + uf_blockVS7[55].y);
PV1iw = floatBitsToInt(uf_blockVS7[54].z + uf_blockVS7[55].x);
PS1i = floatBitsToInt(float(PS0i));
// 20
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PS1i)) + intBitsToFloat(R3i.x));
PV0iy = floatBitsToInt(uf_blockVS7[56].x + uf_blockVS7[56].z);
R125i.z = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(PV1iw));
R126i.w = floatBitsToInt(-(intBitsToFloat(PV1iy)) + intBitsToFloat(PV1iz));
R124i.y = int(intBitsToFloat(R126i.x));
// 21
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R124i.z)) + intBitsToFloat(R123i.x));
R126i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[56].z,intBitsToFloat(R125i.w)) + intBitsToFloat(PV0iy));
PV1iz = floatBitsToInt(uf_blockVS7[56].y + uf_blockVS7[56].w);
R127i.y = int(intBitsToFloat(R127i.y));
// 22
R15i.x = floatBitsToInt(intBitsToFloat(R123i.x) + 0.5);
R15i.y = floatBitsToInt(intBitsToFloat(R127i.w) + 0.5);
R15i.z = 0;
R125i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[56].w,intBitsToFloat(R1i.z)) + intBitsToFloat(PV1iz));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[58].z);
// 23
R2i.x = 0;
R125i.y = floatBitsToInt(intBitsToFloat(R11i.z) * intBitsToFloat(R11i.z));
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[58].x, intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[58].w);
// 24
backupReg0i = R124i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.w)),uf_blockVS7[54].x) + -(intBitsToFloat(R125i.z)));
R124i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[58].y, intBitsToFloat(PS1i)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),uf_blockVS7[54].y) + intBitsToFloat(R126i.w));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R127i.w)) + -(0.5));
PS0i = floatBitsToInt(float(backupReg0i));
// 25
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PS0i)) + intBitsToFloat(R123i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),uf_blockVS7[55].z) + intBitsToFloat(R126i.y));
R5i.z = floatBitsToInt(uf_blockVS6[2].y);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),uf_blockVS7[55].w) + intBitsToFloat(R125i.w));
PS1i = floatBitsToInt(float(R127i.y));
// 26
backupReg0i = R123i.y;
backupReg1i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R124i.y)) + -(0.5));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.y)),intBitsToFloat(PS1i)) + intBitsToFloat(R125i.z));
R123i.z = floatBitsToInt((intBitsToFloat(R11i.y) * intBitsToFloat(R11i.y) + intBitsToFloat(R125i.y)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R126i.w)) + intBitsToFloat(backupReg1i));
R12i.w = 0;
// 27
R16i.x = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
R0i.y = floatBitsToInt((intBitsToFloat(R11i.x) * intBitsToFloat(R11i.x) + intBitsToFloat(R123i.z)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R123i.x)) + -(intBitsToFloat(R123i.y)));
R0i.w = floatBitsToInt(uf_blockVS6[0].y);
R4i.y = floatBitsToInt(uf_blockVS6[1].y);
}
if( activeMaskStackC[3] == true ) {
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),uf_blockVS13[37].x) + -(uf_blockVS13[37].y));
R123i.x = clampFI32(R123i.x);
R16i.y = floatBitsToInt(intBitsToFloat(R1i.z) + 0.5);
R10i.y = floatBitsToInt(uf_blockVS7[104].x);
// 1
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),uf_blockVS13[22].x) + -(uf_blockVS13[22].y));
R123i.x = clampFI32(R123i.x);
PV1iz = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
tempResultf = 1.0 / sqrt(intBitsToFloat(R0i.y));
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), intBitsToFloat(PS1i)));
R127i.w = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
tempResultf = max(0.0, intBitsToFloat(PV1iz));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 3
tempi.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R0i.w)),-(intBitsToFloat(R4i.y)),-(intBitsToFloat(R5i.z)),-(intBitsToFloat(R2i.x))),vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),intBitsToFloat(PV0iz))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(uf_blockVS13[38].x, intBitsToFloat(PS0i)));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(0x3edc28f6));
PV0ix = clampFI32(PV0ix);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PS1i)));
// 5
R125i.z = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 6
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS13[38].z, intBitsToFloat(PS1i)));
tempResultf = max(0.0, intBitsToFloat(R127i.w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 7
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS13[23].x, intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(uf_blockVS13[23].y, intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
// 8
R123i.w = floatBitsToInt(mul_nonIEEE(-(uf_blockVS13[38].w),intBitsToFloat(PS1i)) + 1.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iz)));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 9
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R123i.w)));
R2i.z = floatBitsToInt(intBitsToFloat(PS0i) + 0.5);
PS1i = floatBitsToInt(exp2(intBitsToFloat(R127i.x)));
// 10
R5i.z = floatBitsToInt(mul_nonIEEE(-(uf_blockVS13[23].z),intBitsToFloat(PS1i)) + uf_blockVS13[23].z);
R5i.z = clampFI32(R5i.z);
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(-(intBitsToFloat(R4i.x)) + uf_blockVS6[17].x);
PV0iy = floatBitsToInt(min(uf_blockVS6[17].y, uf_blockVS13[27].z));
R125i.z = floatBitsToInt(-(intBitsToFloat(R8i.y)) + uf_blockVS6[17].y);
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(R4i.w)) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(uf_blockVS13[28].y + 1.0);
R124i.z = floatBitsToInt(-(intBitsToFloat(R4i.z)) + uf_blockVS6[17].z);
// 2
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) * 1.5);
PV0ix = clampFI32(PV0ix);
R123i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS13[27].y,intBitsToFloat(PV1ix)) + uf_blockVS13[27].x);
R123i.w = clampFI32(R123i.w);
PS0i = floatBitsToInt(intBitsToFloat(R124i.z) * intBitsToFloat(R124i.z));
// 3
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), uf_blockVS13[25].w));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), uf_blockVS13[26].w));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) * 15.0);
R122i.x = floatBitsToInt((intBitsToFloat(R125i.z) * intBitsToFloat(R125i.z) + intBitsToFloat(PS0i)));
// 4
R123i.x = floatBitsToInt(uf_blockVS13[28].y * 1.0 + intBitsToFloat(R0i.x));
R4i.y = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(0x80000000));
R4i.y = clampFI32(R4i.y);
PV0iz = floatBitsToInt(intBitsToFloat(R11i.y) * intBitsToFloat(R8i.x));
R123i.w = floatBitsToInt((intBitsToFloat(R127i.x) * intBitsToFloat(R127i.x) + intBitsToFloat(R122i.x)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(-(intBitsToFloat(PV0iz)) + 1.0);
R12i.z = R4i.y;
R0i.w = 0;
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.w));
PS1i = floatBitsToInt(tempResultf);
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(max(intBitsToFloat(PV1ix), intBitsToFloat(0x3e4ccccd)));
R127i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3f333333) + intBitsToFloat(0x3e19999a));
R127i.x = clampFI32(R127i.x);
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(uf_blockVS13[28].x,uf_blockVS13[28].y,uf_blockVS13[28].z,0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R5i.z = floatBitsToInt(min(intBitsToFloat(PV0iw), 1.0));
// 8
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R125i.z = floatBitsToInt(intBitsToFloat(PV1ix) + 0.5);
// 9
PV1iy = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
R123i.z = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + 2.5);
// 10
R0i.x = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3daaaaab));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(0xbe593484));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1iy)));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f22f983));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R123i.y)) + intBitsToFloat(0x3fc90da4));
// 12
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),-(intBitsToFloat(R123i.w))) + 1.0);
}
if( activeMaskStackC[3] == true ) {
R2i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.z))).xyz);
R8i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.w))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R5i.z)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R5i.z)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R5i.z)));
R0i.w = R4i.y;
// 1
R10i.x = floatBitsToInt(uf_blockVS8[3].x * 1.0 + 0.0);
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R8i.x), intBitsToFloat(R8i.y), intBitsToFloat(R8i.z), intBitsToFloat(R8i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.z));
// export
passParameterSem8 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.z));
// export
passParameterSem9 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.z));
}
