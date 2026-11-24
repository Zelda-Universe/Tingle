#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 0b41a9b5de38cf5d
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
UNIFORM_BUFFER_LAYOUT(6, 0, 3) uniform uniformBlockVS6
{
vec4 uf_blockVS6[19];
};


UNIFORM_BUFFER_LAYOUT(7, 0, 4) uniform uniformBlockVS7
{
vec4 uf_blockVS7[4096];
};


UNIFORM_BUFFER_LAYOUT(8, 0, 5) uniform uniformBlockVS8
{
vec4 uf_blockVS8[4];
};


UNIFORM_BUFFER_LAYOUT(11, 0, 6) uniform uniformBlockVS11
{
vec4 uf_blockVS11[6];
};


UNIFORM_BUFFER_LAYOUT(13, 0, 7) uniform uniformBlockVS13
{
vec4 uf_blockVS13[18];
};


TEXTURE_LAYOUT(39, 0, 0) uniform sampler2D textureUnitVS7;
TEXTURE_LAYOUT(44, 0, 1) uniform sampler2DArrayShadow textureUnitVS12;
TEXTURE_LAYOUT(45, 0, 2) uniform sampler2D textureUnitVS13;
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

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem11;
out vec4 passParameterSem14;
out vec4 passParameterSem4;
out vec4 passParameterSem8;
out vec4 passParameterSem15;
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
bool activeMaskStack[5];
bool activeMaskStackC[6];
activeMaskStack[0] = false;
activeMaskStack[1] = false;
activeMaskStack[2] = false;
activeMaskStack[3] = false;
activeMaskStackC[0] = false;
activeMaskStackC[1] = false;
activeMaskStackC[2] = false;
activeMaskStackC[3] = false;
activeMaskStackC[4] = false;
activeMaskStack[0] = true;
activeMaskStackC[0] = true;
activeMaskStackC[1] = true;
R0i = ivec4(gl_VertexID, 0, 0, gl_InstanceID);
attrDecoder = attrDataSem7;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem3;
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem5;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem6;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem9;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R9i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem8;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
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
R0i.y = floatBitsToInt(-(intBitsToFloat(R6i.w)) + uf_blockVS8[2].x);
R0i.z = 0;
R9i.z = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R0i.y));
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
R10i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R6i.x = 0;
// 1
R8i.z = R9i.z;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R8i.z = R0i.z;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R8i.z == 0);
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
R8i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R0i.y) >= intBitsToFloat(R8i.z));
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
R10i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R6i.x = 0;
// 1
R0i.z = R9i.z;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R0i.z == 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt((0.0 > uf_blockVS7[9].x)?1.0:0.0);
PV0iy = floatBitsToInt(max(intBitsToFloat(R8i.x), 0.0));
R5i.z = 0;
PV0iw = floatBitsToInt((uf_blockVS7[9].x > 0.0)?1.0:0.0);
R0i.w = int(intBitsToFloat(R7i.w));
// 1
PV1ix = floatBitsToInt(min(intBitsToFloat(PV0iy), 0.0));
R126i.y = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0ix)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), uf_blockVS7[10].y));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[9].x);
// 2
R0i.x = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(PV1ix));
R127i.y = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
PV0iz = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(PS1i));
R127i.w = floatBitsToInt(-(uf_blockVS7[96].x) + uf_blockVS7[97].x);
R4i.w = floatBitsToInt(1.0 / intBitsToFloat(R8i.z));
// 3
PV1iy = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iz));
R0i.z = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(R4i.w));
R126i.w = floatBitsToInt(-(uf_blockVS7[96].y) + uf_blockVS7[97].y);
// 4
PV0ix = floatBitsToInt(fract(intBitsToFloat(PV1iy)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R127i.y)));
PV0iz = floatBitsToInt(-(uf_blockVS7[96].w) + uf_blockVS7[97].w);
// 5
backupReg0i = R126i.y;
R126i.x = floatBitsToInt(-(uf_blockVS7[97].y) + uf_blockVS7[98].y);
R126i.y = floatBitsToInt(-(uf_blockVS7[97].x) + uf_blockVS7[98].x);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 6
R127i.x = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(-(uf_blockVS7[97].w) + uf_blockVS7[98].w);
R126i.z = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV1iw));
R127i.w = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS1i));
// 7
R127i.y = floatBitsToInt(intBitsToFloat(R126i.z) + -(uf_blockVS7[96].w));
R127i.z = floatBitsToInt(intBitsToFloat(R126i.z) + -(uf_blockVS7[97].w));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 8
PV0ix = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R127i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R127i.x)));
PV0iw = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(PS1i));
R125i.w = floatBitsToInt(intBitsToFloat(R126i.z) + -(uf_blockVS7[98].w));
// 9
R124i.x = floatBitsToInt(uf_blockVS7[96].x + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iw)));
R126i.w = floatBitsToInt(uf_blockVS7[96].y + intBitsToFloat(PV0iy));
R127i.x = ((intBitsToFloat(R127i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 10
backupReg0i = R127i.z;
R125i.x = floatBitsToInt(uf_blockVS7[97].y + intBitsToFloat(PV1iz));
R127i.y = floatBitsToInt(uf_blockVS7[97].x + intBitsToFloat(PV1iy));
R127i.z = ((intBitsToFloat(R125i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.w = ((intBitsToFloat(backupReg0i) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS0i = floatBitsToInt(intBitsToFloat(R126i.z) + -(uf_blockVS7[99].w));
// 11
R126i.x = ((intBitsToFloat(PS0i) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.y = floatBitsToInt(-(uf_blockVS7[98].y) + uf_blockVS7[99].y);
R126i.z = floatBitsToInt(-(uf_blockVS7[98].x) + uf_blockVS7[99].x);
PV1iw = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
PS1i = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
// 12
PV0ix = floatBitsToInt(-(uf_blockVS7[98].w) + uf_blockVS7[99].w);
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV1iw)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS1i)));
R125i.y = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
// 13
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R125i.z)));
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[99].y, intBitsToFloat(R126i.x)));
R124i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[99].x, intBitsToFloat(R126i.x)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 14
backupReg0i = R124i.x;
backupReg1i = R127i.w;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R125i.z)));
PV0iy = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS1i));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(backupReg1i)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(backupReg1i)));
// 15
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].x, intBitsToFloat(R125i.y)));
R125i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].y, intBitsToFloat(R125i.y)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV0iy)));
R5i.w = 0x3f800000;
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R5i.w))));
PV0ix = tempi.x;
R1i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1iy));
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R5i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R1i.w = tempi.x;
R126i.x = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PS0i));
// 18
R1i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R5i.w))));
PV0iy = R1i.x;
PV0iz = R1i.x;
PV0iw = R1i.x;
PS0i = floatBitsToInt(uf_blockVS7[98].x + intBitsToFloat(R125i.x));
// 19
PV1ix = floatBitsToInt(uf_blockVS7[98].y + intBitsToFloat(R125i.w));
PV1iy = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(R125i.z));
R126i.z = floatBitsToInt(uf_blockVS7[13].x);
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) / 2.0);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R127i.x)));
PS1i = floatBitsToInt(uf_blockVS7[13].y);
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 20
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.x)));
R3i.y = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R126i.x));
PV0iw = floatBitsToInt(intBitsToFloat(R124i.x) + intBitsToFloat(PV1iy));
R2i.z = floatBitsToInt(intBitsToFloat(R7i.z) * 1.0);
// 21
PV1ix = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iw));
PV1iz = (R0i.w == int(1))?-1:0;
R3i.w = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(R126i.z));
R127i.x = (R0i.w == 0x2)?-1:0;
// 22
R123i.x = ((PV1iz == 0)?(0xbf800000):(0xbf800000));
R123i.y = ((PV1iz == 0)?(0x3f800000):(0xbf800000));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1iy));
R127i.y = (R0i.w == 0x3)?-1:0;
// 23
R3i.x = 0x3f800000;
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(PV0iw)));
R123i.z = ((R127i.x == 0)?(R123i.y):(0xbf800000));
R123i.w = ((R127i.x == 0)?(R123i.x):(0x3f800000));
R2i.w = 0x3f800000;
// 24
R4i.z = ((R127i.y == 0)?(R123i.z):(0x3f800000));
R0i.w = ((R127i.y == 0)?(R123i.w):(0x3f800000));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), uf_blockVS8[3].y));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), uf_blockVS8[3].z));
// 1
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R3i.w)));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R3i.y)));
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),uf_blockVS11[0].x) + 0.0);
// 2
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),uf_blockVS11[0].x) + 0.0);
}
if( activeMaskStackC[3] == true ) {
// 0
R6i.x = floatBitsToInt(uf_blockVS6[12].x);
R2i.y = floatBitsToInt(uf_blockVS6[13].x);
R127i.z = floatBitsToInt(uf_blockVS6[12].y);
R124i.w = floatBitsToInt(uf_blockVS6[13].y);
// 1
PV1ix = floatBitsToInt(uf_blockVS6[12].z * 1.0);
R127i.y = floatBitsToInt(uf_blockVS6[14].y);
R7i.z = floatBitsToInt(uf_blockVS6[14].x);
// 2
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R127i.z)) + intBitsToFloat(PV1ix));
PV0iy = floatBitsToInt(uf_blockVS6[13].z * 1.0);
PV0iw = floatBitsToInt(uf_blockVS6[14].z * 1.0);
// 3
R4i.x = floatBitsToInt(uf_blockVS7[60].x);
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R124i.w)) + intBitsToFloat(PV0iy));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R127i.y)) + intBitsToFloat(PV0iw));
R0i.w = floatBitsToInt(uf_blockVS7[60].y);
R2i.x = floatBitsToInt(uf_blockVS7[60].z);
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R3i.y),intBitsToFloat(R2i.z),intBitsToFloat(R3i.x)),vec4(uf_blockVS6[12].x,uf_blockVS6[12].y,uf_blockVS6[12].z,uf_blockVS6[12].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R3i.y),intBitsToFloat(R2i.z),intBitsToFloat(R3i.x)),vec4(uf_blockVS6[13].x,uf_blockVS6[13].y,uf_blockVS6[13].z,uf_blockVS6[13].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.x = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV0ix));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R3i.y),intBitsToFloat(R2i.z),intBitsToFloat(R3i.x)),vec4(uf_blockVS6[14].x,uf_blockVS6[14].y,uf_blockVS6[14].z,uf_blockVS6[14].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.y = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(PV1ix));
// 7
R126i.x = floatBitsToInt(-(uf_blockVS7[68].x) + uf_blockVS7[69].x);
R127i.z = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV0ix));
// 8
R10i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS6[8].x,uf_blockVS6[8].y,uf_blockVS6[8].z,uf_blockVS6[8].w)));
PV0iy = R10i.x;
PV0iz = R10i.x;
PV0iw = R10i.x;
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS6[9].x,uf_blockVS6[9].y,uf_blockVS6[9].z,uf_blockVS6[9].w)));
PV1ix = tempi.x;
R10i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS6[10].x,uf_blockVS6[10].y,uf_blockVS6[10].z,uf_blockVS6[10].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R10i.z = tempi.x;
PV0iw = tempi.x;
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS6[11].x,uf_blockVS6[11].y,uf_blockVS6[11].z,uf_blockVS6[11].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R10i.w = tempi.x;
// 12
R123i.x = floatBitsToInt(intBitsToFloat(R10i.z) * 0.0 + intBitsToFloat(PV1ix));
R127i.y = floatBitsToInt(-(uf_blockVS7[68].w) + uf_blockVS7[69].w);
PV0iw = PV1ix;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
// 13
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(intBitsToFloat(R10i.z) * 0.5 + intBitsToFloat(PV0iw));
R123i.y = floatBitsToInt(intBitsToFloat(R10i.z) * 0.0 + intBitsToFloat(PV0iw));
R2i.z = floatBitsToInt(uf_blockVS7[76].x);
R2i.w = floatBitsToInt(uf_blockVS7[76].y);
R9i.z = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 14
R3i.x = floatBitsToInt(uf_blockVS7[76].z);
PV0iy = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(R9i.z));
R11i.z = floatBitsToInt(intBitsToFloat(R10i.y) * -(0.5) + intBitsToFloat(R123i.y));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 15
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),uf_blockVS6[18].w) + -(uf_blockVS6[18].y));
R4i.z = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(PS0i));
// 16
PV0iz = ((intBitsToFloat(R8i.x) > 0.5)?-1:0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R123i.x));
// 17
R9i.x = floatBitsToInt(((PV0iz == 0)?(intBitsToFloat(R7i.x)):(-(intBitsToFloat(R7i.x)))));
R5i.w = floatBitsToInt(-(uf_blockVS6[18].z) * intBitsToFloat(PS0i));
// 18
PV0ix = ((intBitsToFloat(R8i.y) > 0.5)?-1:0);
// 19
R3i.w = floatBitsToInt(((PV0ix == 0)?(intBitsToFloat(R7i.y)):(-(intBitsToFloat(R7i.y)))));
}
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), uf_blockVS8[0].x));
PV0iy = floatBitsToInt((0.0 > uf_blockVS7[8].y)?1.0:0.0);
PV0iw = floatBitsToInt((uf_blockVS7[8].y > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(1.0 / uf_blockVS7[8].y);
// 1
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), uf_blockVS8[0].y));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(PS0i));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), uf_blockVS8[0].z));
// 2
R126i.x = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),uf_blockVS7[9].z) + intBitsToFloat(PV1iw));
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), uf_blockVS8[1].x));
// 3
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), uf_blockVS8[1].y));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), uf_blockVS8[1].z));
// 4
backupReg0i = R127i.z;
PV0ix = floatBitsToInt(uf_blockVS7[5].x) & 0x80000;
PV0iy = floatBitsToInt(uf_blockVS7[5].x) & 0x100000;
R127i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x10;
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1iz)));
R2i.z = int(uf_blockVS7[17].x);
// 5
PV1ix = (PV0ix == 0x80000)?-1:0;
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R126i.x)) + intBitsToFloat(PV0iw));
PV1iz = (PV0iy == 0x100000)?-1:0;
R3i.x = int(uf_blockVS7[17].y);
// 6
R4i.y = ((PV1iz == 0)?(R7i.y):(R3i.w));
R7i.w = ((PV1ix == 0)?(R7i.x):(R9i.x));
PS0i = floatBitsToInt(float(R127i.z));
// 7
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
// 8
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1ix)));
// 9
R127i.y = int(intBitsToFloat(PV0iw));
// 10
PV0iz = 0 - R127i.y;
// 11
R7i.x = max(R127i.y, PV0iz);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iy = floatBitsToInt(intBitsToFloat(R3i.y) + -(uf_blockVS7[69].w));
PV0iz = floatBitsToInt(intBitsToFloat(R3i.y) + -(uf_blockVS7[68].w));
// 1
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R4i.z)) + uf_blockVS7[68].x);
PV1iy = floatBitsToInt(uf_blockVS7[84].x);
R127i.z = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
R124i.w = ((intBitsToFloat(PV0iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
PV0iy = floatBitsToInt(-(intBitsToFloat(R124i.w)) + 1.0);
R14i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), uf_blockVS8[1].w));
// 3
PV1iz = floatBitsToInt(mul_nonIEEE(uf_blockVS7[68].x, intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(PV0ix)));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PV1iw)) + intBitsToFloat(PV1iz));
// 5
R123i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[69].x,intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.x));
// 6
R13i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), uf_blockVS8[0].w));
}
if( activeMaskStackC[3] == true ) {
// 0
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), uf_blockVS7[59].x));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), uf_blockVS7[59].x));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z), uf_blockVS7[59].x));
PV0iw = floatBitsToInt(uf_blockVS7[5].x) & 0x20;
R14i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R2i.x)));
// 1
R126i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x80;
R14i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R5i.y)));
R14i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R3i.z)));
PV1iw = floatBitsToInt(uf_blockVS7[5].x) & 0x40;
PS1i = floatBitsToInt(float(PV0iw));
// 2
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R126i.y = floatBitsToInt(uf_blockVS7[5].x) & 0x2000000;
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R125i.w = int(-1) + R2i.z;
PS0i = floatBitsToInt(float(PV1iw));
// 3
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(float(R126i.x));
// 4
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1ix)));
R127i.y = int(intBitsToFloat(PV1iw));
// 5
PV1iz = 0 - R127i.y;
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0ix)));
R125i.y = int(intBitsToFloat(PV0iw));
// 6
R2i.x = max(R127i.y, PV1iz);
PV0iz = 0 - R125i.y;
R127i.y = int(intBitsToFloat(PV1iw));
// 7
R9i.x = max(R125i.y, PV0iz);
PV1iz = 0 - R127i.y;
R124i.w = floatBitsToInt(float(R2i.z));
// 8
backupReg0i = R124i.w;
R124i.x = max(R127i.y, PV1iz);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(backupReg0i)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(backupReg0i)));
PS0i = floatBitsToInt(float(R3i.x));
// 9
PV1iz = floatBitsToInt(intBitsToFloat(R4i.w) * intBitsToFloat(PV0iy));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 10
R127i.z = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(PS1i));
PS0i = int(intBitsToFloat(PV1iz));
// 11
R127i.w = R7i.x * PS0i;
// 12
R125i.x = int(intBitsToFloat(R127i.z));
// 13
PS1i = floatBitsToInt(float(R125i.x));
// 14
PV0iy = floatBitsToInt(-(intBitsToFloat(R124i.w)) + intBitsToFloat(PS1i));
R125i.y = floatBitsToInt(float(R2i.z));
// 15
R3i.x = floatBitsToInt(abs(intBitsToFloat(R125i.y)));
R123i.z = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.z = floatBitsToInt(float(R125i.x));
// 16
R127i.x = floatBitsToInt(abs(intBitsToFloat(R125i.z)));
R126i.x = int(intBitsToFloat(R123i.z));
// 17
R127i.y = int(1) - R126i.x;
R7i.x = floatBitsToInt(1.0 / abs(intBitsToFloat(R125i.y)));
// 18
PV0iw = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R125i.z)), intBitsToFloat(R7i.x)));
R126i.x = R126i.x * R125i.w;
// 19
PV1iy = floatBitsToInt(trunc(intBitsToFloat(PV0iw)));
PS1i = floatBitsToInt(float(R126i.y));
// 20
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R125i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iy)),intBitsToFloat(R3i.x)) + intBitsToFloat(R127i.x));
R127i.z = int(intBitsToFloat(R126i.z));
// 21
PV1ix = floatBitsToInt(-(abs(intBitsToFloat(R125i.y))) + intBitsToFloat(R125i.w));
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iy)));
PV1iz = floatBitsToInt((intBitsToFloat(R125i.w) >= abs(intBitsToFloat(R125i.y)))?1.0:0.0);
R126i.y = R124i.x * R127i.z;
// 22
R124i.x = ((intBitsToFloat(PV1iz) == 0.0)?(R125i.w):(PV1ix));
R126i.z = int(intBitsToFloat(PV1iy));
// 23
PV1ix = 0 - R126i.z;
PV1iw = floatBitsToInt(abs(intBitsToFloat(R125i.y)) + intBitsToFloat(R124i.x));
// 24
R123i.y = ((-(intBitsToFloat(R124i.x)) > 0.0)?(PV1iw):(R124i.x));
PV0iw = max(R126i.z, PV1ix);
// 25
R123i.z = ((-(intBitsToFloat(R125i.z)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.y)))):(R123i.y));
PS1i = PV0iw * R127i.z;
// 26
backupReg0i = R125i.x;
R125i.x = ((intBitsToFloat(R125i.y) == 0.0)?(R125i.z):(R123i.z));
PV0iw = backupReg0i + PS1i;
// 27
R125i.z = R9i.x * PV0iw;
// 28
PS0i = int(intBitsToFloat(R125i.x));
// 29
PS1i = R127i.y * PS0i;
// 30
PV0iw = PS1i + R126i.x;
// 31
PS1i = R2i.x * PV0iw;
// 32
PV0iy = PS1i + R127i.w;
// 33
PV1iz = R125i.z + PV0iy;
// 34
PV0ix = R126i.y + PV1iz;
// 35
R125i.w = floatBitsToInt(float(PV0ix));
// 36
R126i.x = floatBitsToInt(abs(intBitsToFloat(R125i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), abs(intBitsToFloat(R125i.w))));
// 37
PV1iz = floatBitsToInt(trunc(intBitsToFloat(PV0iy)));
// 38
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iz)),intBitsToFloat(R3i.x)) + intBitsToFloat(R126i.x));
// 39
PV1iy = floatBitsToInt(-(abs(intBitsToFloat(R125i.y))) + intBitsToFloat(R127i.w));
PV1iz = floatBitsToInt((intBitsToFloat(R127i.w) >= abs(intBitsToFloat(R125i.y)))?1.0:0.0);
// 40
R126i.x = ((intBitsToFloat(PV1iz) == 0.0)?(R127i.w):(PV1iy));
// 41
PV1iw = floatBitsToInt(abs(intBitsToFloat(R125i.y)) + intBitsToFloat(R126i.x));
// 42
R123i.y = ((-(intBitsToFloat(R126i.x)) > 0.0)?(PV1iw):(R126i.x));
// 43
R123i.z = ((-(intBitsToFloat(R125i.w)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.y)))):(R123i.y));
// 44
R123i.x = ((intBitsToFloat(R125i.y) == 0.0)?(R125i.w):(R123i.z));
// 45
R4i.w = int(intBitsToFloat(R123i.x));
// 46
R125i.y = floatBitsToInt(float(R4i.w));
// 47
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(R125i.y))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(R125i.y) > 0.0)?1.0:0.0);
R127i.z = floatBitsToInt(float(R4i.w));
// 48
PV0ix = floatBitsToInt(abs(intBitsToFloat(R127i.z)) * 0.25);
R126i.y = floatBitsToInt(abs(intBitsToFloat(R127i.z)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1ix)));
// 49
R123i.y = floatBitsToInt(intBitsToFloat(PV0iw) * 0.5 + intBitsToFloat(R125i.y));
PV1iw = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
// 50
PV0ix = floatBitsToInt(intBitsToFloat(R123i.y) * 0.25);
R125i.z = floatBitsToInt(-(intBitsToFloat(PV1iw)) * 4.0 + intBitsToFloat(R126i.y));
// 51
PV1ix = floatBitsToInt(intBitsToFloat(R125i.z) + -4.0);
PV1iy = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt((intBitsToFloat(R125i.z) >= 4.0)?1.0:0.0);
// 52
R126i.y = ((intBitsToFloat(PV1iw) == 0.0)?(R125i.z):(PV1ix));
PS0i = int(intBitsToFloat(PV1iy));
// 53
R3i.y = PS0i + 0x12;
PV1iz = floatBitsToInt(intBitsToFloat(R126i.y) + 4.0);
PS1i = int(uf_blockVS7[48].z);
// 54
R123i.x = ((-(intBitsToFloat(R126i.y)) > 0.0)?(PV1iz):(R126i.y));
R9i.y = floatBitsToInt(float(PS1i));
// 55
R123i.w = ((-(intBitsToFloat(R127i.z)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.x)))):(R123i.x));
// 56
R7i.y = int(intBitsToFloat(R123i.w));
}
if( activeMaskStackC[3] == true ) {
R3i.xyzw = floatBitsToInt(uf_blockVS7[R3i.y].xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = 0xfffffffe + R7i.y;
R125i.y = floatBitsToInt(abs(intBitsToFloat(R9i.y)));
PV0iz = int(-1) + R7i.y;
R125i.w = 0xfffffffd + R7i.y;
PS0i = floatBitsToInt(float(R7i.y));
// 1
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PS1i = floatBitsToInt(float(PV0iz));
// 2
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(R126i.x));
// 3
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0ix)));
R127i.z = int(intBitsToFloat(PV0iy));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1ix)));
PV0iy = 0 - R127i.z;
R126i.x = int(intBitsToFloat(PV1iz));
// 5
PV1ix = 0 - R126i.x;
PV1iw = max(R127i.z, PV0iy);
R127i.w = int(intBitsToFloat(PV0ix));
// 6
PV0ix = int(1) - PV1iw;
PV0iy = max(R126i.x, PV1ix);
PV0iz = 0 - R127i.w;
PS0i = floatBitsToInt(float(R125i.w));
// 7
PV1ix = int(1) - PV0iy;
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iz = max(R127i.w, PV0iz);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R127i.w = PV0ix * R3i.x;
// 8
PV0ix = int(1) - PV1iz;
PV0iy = floatBitsToInt(uf_blockVS7[44].z + uf_blockVS7[45].x);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), uf_blockVS7[45].x));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
R125i.w = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iw)));
PS0i = PV1ix * R3i.y;
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), uf_blockVS7[45].y));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
PV1iy = PS0i + R127i.w;
PV1iz = floatBitsToInt(uf_blockVS7[44].w + uf_blockVS7[45].y);
R127i.w = floatBitsToInt(-(intBitsToFloat(PV0iz)) + intBitsToFloat(PV0iy));
PS1i = PV0ix * R3i.z;
// 10
R126i.x = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(PV1iz));
PV0iy = floatBitsToInt(uf_blockVS7[46].y + uf_blockVS7[46].w);
R127i.z = PS1i + PV1iy;
PV0iw = floatBitsToInt(uf_blockVS7[46].x + uf_blockVS7[46].z);
R126i.y = int(intBitsToFloat(R125i.w));
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),uf_blockVS7[46].w) + intBitsToFloat(PV0iy));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),uf_blockVS7[46].z) + intBitsToFloat(PV0iw));
PV1iz = 0 - R126i.y;
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.y)),uf_blockVS7[44].x) + -(intBitsToFloat(R127i.w)));
R127i.w = floatBitsToInt(1.0 / abs(intBitsToFloat(R9i.y)));
// 12
PV0ix = max(R126i.y, PV1iz);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),uf_blockVS7[45].w) + intBitsToFloat(R123i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),uf_blockVS7[45].z) + intBitsToFloat(R123i.y));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),uf_blockVS7[44].y) + intBitsToFloat(R126i.x));
R125i.z = floatBitsToInt(1.0 / intBitsToFloat(R9i.y));
// 13
R127i.x = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
PV1iw = int(1) - PV0ix;
PS1i = floatBitsToInt(1.0 / uf_blockVS7[48].z);
// 14
R124i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].x, intBitsToFloat(PS1i)));
R127i.y = floatBitsToInt(intBitsToFloat(R7i.w) + 0.5);
PS0i = PV1iw * R3i.w;
// 15
R126i.x = PS0i + R127i.z;
R124i.y = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
R124i.w = floatBitsToInt(intBitsToFloat(R4i.y) + -(0.5));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[48].w);
// 16
R3i.x = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(R1i.y));
R126i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].y, intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(intBitsToFloat(R1i.z) + 1.0);
R127i.z = floatBitsToInt(float(R126i.x));
// 17
PV1ix = floatBitsToInt((intBitsToFloat(R127i.z) > 0.0)?1.0:0.0);
R0i.y = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(R1i.w));
R0i.z = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(R1i.x));
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(R127i.z))?1.0:0.0);
R125i.x = floatBitsToInt(float(R126i.x));
// 18
R126i.x = floatBitsToInt(abs(intBitsToFloat(R125i.x)));
PV0iy = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R125i.x)), intBitsToFloat(R127i.w)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iw)));
R6i.y = floatBitsToInt(uf_blockVS7[104].x);
// 19
R123i.y = floatBitsToInt(intBitsToFloat(PV0iw) * 0.5 + intBitsToFloat(R127i.z));
PV1iz = floatBitsToInt(trunc(intBitsToFloat(PV0iy)));
// 20
PV0ix = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(R125i.z));
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iz)),intBitsToFloat(R125i.y)) + intBitsToFloat(R126i.x));
// 21
PV1ix = floatBitsToInt((intBitsToFloat(R125i.y) >= abs(intBitsToFloat(R9i.y)))?1.0:0.0);
PV1iz = floatBitsToInt(-(abs(intBitsToFloat(R9i.y))) + intBitsToFloat(R125i.y));
PV1iw = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
// 22
R127i.w = ((intBitsToFloat(PV1ix) == 0.0)?(R125i.y):(PV1iz));
PS0i = int(intBitsToFloat(PV1iw));
// 23
PV1iy = floatBitsToInt(abs(intBitsToFloat(R9i.y)) + intBitsToFloat(R127i.w));
PS1i = floatBitsToInt(float(PS0i));
// 24
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.y)),intBitsToFloat(PS1i)) + intBitsToFloat(R125i.w));
R123i.z = ((-(intBitsToFloat(R127i.w)) > 0.0)?(PV1iy):(R127i.w));
// 25
R123i.x = ((-(intBitsToFloat(R125i.x)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.z)))):(R123i.z));
R124i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.y)),intBitsToFloat(R124i.w)) + -(intBitsToFloat(R123i.y)));
// 26
R123i.w = ((intBitsToFloat(R9i.y) == 0.0)?(R125i.x):(R123i.x));
// 27
PS1i = int(intBitsToFloat(R123i.w));
// 28
PS0i = floatBitsToInt(float(PS1i));
// 29
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(PS0i)) + intBitsToFloat(R126i.w));
// 30
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.z));
// 31
R5i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.w)),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.z));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R124i.y)) + intBitsToFloat(R124i.w));
R5i.z = 0;
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R127i.x = ((intBitsToFloat(R5i.w) > uf_blockVS13[0].y)?-1:0);
R124i.y = ((intBitsToFloat(R5i.w) > uf_blockVS13[0].z)?-1:0);
PV0iw = ((intBitsToFloat(R5i.w) > uf_blockVS13[0].x)?-1:0);
// 1
PV1iz = PV0iw & int(1);
// 2
PV0iy = PV1iz - R127i.x;
// 3
PV1ix = PV0iy - R124i.y;
// 4
R0i.w = floatBitsToInt(float(PV1ix));
// 5
predResult = (intBitsToFloat(R0i.w) == 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R3i.y = R0i.y;
R3i.z = R0i.z;
R3i.w = 0x3f800000;
// 1
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS13[3].x,uf_blockVS13[3].y,uf_blockVS13[3].z,uf_blockVS13[3].w)));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS13[4].x,uf_blockVS13[4].y,uf_blockVS13[4].z,uf_blockVS13[4].w)));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS13[5].x,uf_blockVS13[5].y,uf_blockVS13[5].z,uf_blockVS13[5].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS13[6].x,uf_blockVS13[6].y,uf_blockVS13[6].z,uf_blockVS13[6].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R1i.z = tempi.x;
PV0iw = tempi.x;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
activeMaskStack[4] = activeMaskStack[3];
activeMaskStackC[5] = activeMaskStackC[4];
// 0
predResult = (intBitsToFloat(R0i.w) == 1.0);
activeMaskStack[4] = predResult;
activeMaskStackC[5] = predResult == true && activeMaskStackC[4] == true;
}
else {
activeMaskStack[4] = false;
activeMaskStackC[5] = false;
}
if( activeMaskStackC[5] == true ) {
// 0
R3i.y = R0i.y;
R3i.z = R0i.z;
R3i.w = 0x3f800000;
// 1
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS13[7].x,uf_blockVS13[7].y,uf_blockVS13[7].z,uf_blockVS13[7].w)));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS13[8].x,uf_blockVS13[8].y,uf_blockVS13[8].z,uf_blockVS13[8].w)));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS13[9].x,uf_blockVS13[9].y,uf_blockVS13[9].z,uf_blockVS13[9].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS13[10].x,uf_blockVS13[10].y,uf_blockVS13[10].z,uf_blockVS13[10].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R1i.z = tempi.x;
PV0iw = tempi.x;
}
activeMaskStack[4] = activeMaskStack[4] == false;
activeMaskStackC[5] = activeMaskStack[4] == true && activeMaskStackC[4] == true;
if( activeMaskStackC[5] == true ) {
// 0
R3i.y = R0i.y;
R3i.z = R0i.z;
R3i.w = 0x3f800000;
// 1
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS13[11].x,uf_blockVS13[11].y,uf_blockVS13[11].z,uf_blockVS13[11].w)));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS13[12].x,uf_blockVS13[12].y,uf_blockVS13[12].z,uf_blockVS13[12].w)));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS13[13].x,uf_blockVS13[13].y,uf_blockVS13[13].z,uf_blockVS13[13].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS13[14].x,uf_blockVS13[14].y,uf_blockVS13[14].z,uf_blockVS13[14].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R1i.z = tempi.x;
PV0iw = tempi.x;
}
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS13[17].x,uf_blockVS13[17].y,uf_blockVS13[17].z,uf_blockVS13[17].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R127i.z = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R1i.z));
// 1
R0i.x = floatBitsToInt(intBitsToFloat(R0i.x) * intBitsToFloat(PS0i));
R127i.y = floatBitsToInt(intBitsToFloat(R0i.z) * intBitsToFloat(PS0i));
R0i.z = floatBitsToInt(roundEven(intBitsToFloat(R0i.w)));
R125i.w = floatBitsToInt(intBitsToFloat(R11i.z) * intBitsToFloat(R9i.z));
R0i.y = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(PS0i));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS13[15].x,uf_blockVS13[15].y,uf_blockVS13[15].z,uf_blockVS13[15].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R127i.w = tempi.x;
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS13[16].x,uf_blockVS13[16].y,uf_blockVS13[16].z,uf_blockVS13[16].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R0i.w = R127i.y;
R0i.w = clampFI32(R0i.w);
// 4
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R126i.w)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R126i.w)));
PV0iz = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
R2i.w = 0;
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x),intBitsToFloat(R6i.x)) + intBitsToFloat(R12i.x));
// 5
R123i.x = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3f333333) + intBitsToFloat(0x3e19999a));
R123i.x = clampFI32(R123i.x);
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x),intBitsToFloat(R2i.y)) + intBitsToFloat(R11i.y));
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x),intBitsToFloat(R7i.z)) + intBitsToFloat(R8i.z));
// 6
R6i.x = floatBitsToInt(uf_blockVS8[3].x * 1.0 + 0.0);
PV0iz = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
// 7
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + 8.5);
// 8
R2i.x = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3daaaaab));
}
if( activeMaskStackC[3] == true ) {
R0i.w = floatBitsToInt(texture(textureUnitVS12, vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))));
R0i.z = floatBitsToInt(texture(textureUnitVS7, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y))).x);
R12i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.w))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R0i.w)) + 1.0);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), uf_blockVS13[1].y));
// 1
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R127i.y)) + 1.0);
// 2
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.y));
// 3
R11i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), uf_blockVS11[5].z));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.z), intBitsToFloat(R6i.z));
// export
passParameterSem8 = vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.z), intBitsToFloat(R5i.z));
// export
passParameterSem15 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.x), intBitsToFloat(R11i.x), intBitsToFloat(R11i.w));
}
