#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader aaa7743d7fa5ae91
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


UNIFORM_BUFFER_LAYOUT(11, 0, 5) uniform uniformBlockVS11
{
vec4 uf_blockVS11[6];
};


UNIFORM_BUFFER_LAYOUT(13, 0, 6) uniform uniformBlockVS13
{
vec4 uf_blockVS13[29];
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

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem11;
out vec4 passParameterSem14;
out vec4 passParameterSem15;
out vec4 passParameterSem16;
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
attrDecoder = attrDataSem5;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem0;
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem1;
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
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
attrDecoder = attrDataSem2;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R13i.y = floatBitsToInt(-(intBitsToFloat(R5i.w)) + uf_blockVS8[2].x);
R2i.w = 0;
R3i.w = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R13i.y));
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
R15i.x = 0;
// 1
R5i.w = R3i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R5i.w = R2i.w;
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
R4i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R13i.y) >= intBitsToFloat(R4i.z));
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
R15i.x = 0;
// 1
R2i.w = R3i.w;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R2i.w == 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x20000;
PV0iy = floatBitsToInt(uf_blockVS7[5].x) & 0x10000;
R127i.z = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(R7i.y));
R127i.w = floatBitsToInt(uf_blockVS7[5].x) & 0x40000;
R127i.y = floatBitsToInt(1.0 / uf_blockVS7[9].x);
// 1
R126i.x = R7i.z;
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) * 2.0);
R126i.y = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(R7i.z));
R126i.z = R7i.y;
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) * 2.0);
R126i.w = floatBitsToInt((uf_blockVS7[9].x > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(float(PV0iy));
// 2
backupReg0i = R127i.x;
R127i.x = floatBitsToInt((0.0 > uf_blockVS7[9].x)?1.0:0.0);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), uf_blockVS7[10].y));
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(backupReg0i));
// 3
backupReg0i = R127i.w;
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R127i.w = floatBitsToInt(intBitsToFloat(R13i.y) * intBitsToFloat(R127i.y));
PS1i = floatBitsToInt(float(backupReg0i));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R124i.w = floatBitsToInt(intBitsToFloat(R127i.z) * 0.5);
R125i.x = int(intBitsToFloat(PV1ix));
// 5
R124i.x = floatBitsToInt(intBitsToFloat(R126i.y) * 0.5);
R126i.y = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(R7i.z));
R127i.z = 0 - R125i.x;
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iz)));
R125i.w = int(intBitsToFloat(PV0ix));
// 6
R126i.x = floatBitsToInt(floor(intBitsToFloat(R126i.x)));
R127i.y = floatBitsToInt(floor(intBitsToFloat(R126i.z)));
PV0iz = 0 - R125i.w;
R0i.w = R7i.x;
R0i.w = floatBitsToInt(intBitsToFloat(R0i.w) * 2.0);
R126i.z = int(intBitsToFloat(PV1iw));
// 7
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(R127i.w));
R125i.y = max(R125i.w, PV0iz);
R124i.z = max(R125i.x, R127i.z);
R126i.w = floatBitsToInt(intBitsToFloat(R126i.w) + -(intBitsToFloat(backupReg0i)));
tempResultf = max(0.0, uf_blockVS7[114].w);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R127i.z = floatBitsToInt(tempResultf);
// 8
backupReg0i = R126i.y;
R124i.x = floatBitsToInt(intBitsToFloat(R124i.x) + -(0.5));
R124i.x = floatBitsToInt(intBitsToFloat(R124i.x) * 2.0);
R126i.y = floatBitsToInt(intBitsToFloat(R124i.w) + -(0.5));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) * 2.0);
R125i.z = floatBitsToInt(intBitsToFloat(backupReg0i) * 0.5);
R124i.w = 0 - R126i.z;
R12i.y = floatBitsToInt(1.0 / intBitsToFloat(R4i.z));
// 9
PV1ix = floatBitsToInt((intBitsToFloat(R127i.y) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((intBitsToFloat(R126i.x) > 0.0)?1.0:0.0);
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(R126i.x))?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(R127i.y))?1.0:0.0);
R127i.w = floatBitsToInt(floor(intBitsToFloat(R0i.w)));
// 10
R126i.x = max(R126i.z, R124i.w);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y), intBitsToFloat(R127i.z)));
R127i.z = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iw)));
R124i.w = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iz)));
R127i.x = floatBitsToInt(fract(intBitsToFloat(R127i.x)));
// 11
PV1ix = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), uf_blockVS7[115].x));
R9i.z = floatBitsToInt(intBitsToFloat(R13i.y) * intBitsToFloat(R12i.y));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.z) + -(0.5));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) * 2.0);
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), uf_blockVS7[115].y));
// 12
R124i.x = floatBitsToInt(-(uf_blockVS7[114].w) + 1.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(R127i.w))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(R127i.w) > 0.0)?1.0:0.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(float(R124i.z));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 13
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(backupReg0i)));
R125i.z = floatBitsToInt(intBitsToFloat(R126i.y) + uf_blockVS7[114].x);
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(R127i.z)));
PS1i = floatBitsToInt(float(R125i.y));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 14
R125i.x = floatBitsToInt(uf_blockVS7[114].y + intBitsToFloat(R124i.y));
R10i.y = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1iy));
R124i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(R124i.w)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), uf_blockVS7[115].z));
PS0i = floatBitsToInt(exp2(intBitsToFloat(R127i.y)));
// 15
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(-(uf_blockVS7[96].w) + uf_blockVS7[97].w);
R124i.y = floatBitsToInt(intBitsToFloat(R7i.x) + -(0.5));
R127i.z = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R125i.w = floatBitsToInt(intBitsToFloat(R7i.y) + -(0.5));
PS1i = floatBitsToInt(float(backupReg0i));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 16
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R126i.w)));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(R127i.x)));
R126i.z = floatBitsToInt(uf_blockVS7[114].z + intBitsToFloat(R127i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R126i.w)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R124i.x));
// 17
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R124i.z)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R124i.z)));
PV1iz = ((uf_blockVS7[114].w == 1.0)?-1:0);
PV1iw = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS0i));
R125i.y = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV0ix));
// 18
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(PV1iy));
R126i.y = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(PV1ix));
R0i.z = ((PV1iz == 0)?(PV1iw):(R13i.y));
R127i.w = floatBitsToInt(intBitsToFloat(R3i.x) + intBitsToFloat(R127i.w));
R126i.w = floatBitsToInt(-(uf_blockVS7[96].y) + uf_blockVS7[97].y);
// 19
R4i.x = floatBitsToInt(intBitsToFloat(R10i.y) + -(uf_blockVS7[97].w));
R0i.y = floatBitsToInt(intBitsToFloat(R7i.z) + -(0.5));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R127i.y)));
R124i.w = floatBitsToInt(-(uf_blockVS7[97].w) + uf_blockVS7[98].w);
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 20
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), uf_blockVS7[113].x));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), uf_blockVS7[113].y));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R127i.y)));
R2i.w = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV1iz));
R4i.z = floatBitsToInt(intBitsToFloat(R10i.y) + -(uf_blockVS7[96].w));
// 21
R126i.x = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV0iy));
R5i.y = floatBitsToInt(intBitsToFloat(R3i.z) + intBitsToFloat(PV0iz));
R126i.z = floatBitsToInt(-(uf_blockVS7[96].x) + uf_blockVS7[97].x);
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0ix));
R0i.w = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(R127i.z));
// 22
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R0i.z)));
R3i.y = floatBitsToInt(-(uf_blockVS7[97].y) + uf_blockVS7[98].y);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R0i.z)));
R3i.w = ((intBitsToFloat(R4i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R3i.x = floatBitsToInt(1.0 / intBitsToFloat(R124i.w));
// 23
R0i.x = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV0iz));
R4i.y = floatBitsToInt(-(uf_blockVS7[98].w) + uf_blockVS7[99].w);
R3i.z = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0ix));
R4i.w = floatBitsToInt(intBitsToFloat(R10i.y) + -(uf_blockVS7[98].w));
R9i.y = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(R127i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), uf_blockVS7[113].z));
R125i.y = floatBitsToInt(intBitsToFloat(R3i.y) * intBitsToFloat(R3i.x));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R0i.w)));
R127i.w = ((intBitsToFloat(R4i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R124i.w = floatBitsToInt(1.0 / intBitsToFloat(R4i.y));
// 1
R124i.x = ((intBitsToFloat(R4i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.y = floatBitsToInt(-(intBitsToFloat(R3i.w)) + 1.0);
PV1iz = floatBitsToInt(-(uf_blockVS7[97].x) + uf_blockVS7[98].x);
PV1iw = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R0i.z)));
// 2
R126i.x = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(R3i.x));
R127i.y = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(-(uf_blockVS7[98].y) + uf_blockVS7[99].y);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R9i.y)));
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R125i.y)));
// 3
backupReg0i = R126i.y;
R127i.x = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(R124i.w));
R126i.y = floatBitsToInt(-(intBitsToFloat(R124i.x)) + 1.0);
PV1iz = floatBitsToInt(intBitsToFloat(R10i.y) + -(uf_blockVS7[99].w));
R125i.w = floatBitsToInt(uf_blockVS7[96].y + intBitsToFloat(R127i.z));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(backupReg0i)));
// 4
PV0ix = floatBitsToInt(-(uf_blockVS7[98].x) + uf_blockVS7[99].x);
R9i.y = ((intBitsToFloat(PV1iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.z = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
R127i.w = floatBitsToInt(intBitsToFloat(R3i.z) * intBitsToFloat(0x3e22f983) + 0.5);
R125i.y = floatBitsToInt(intBitsToFloat(R0i.x) * intBitsToFloat(0x3e22f983) + 0.5);
// 5
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(R124i.w));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R126i.y)));
R127i.z = floatBitsToInt(uf_blockVS7[96].x + intBitsToFloat(R126i.w));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(backupReg0i)));
R126i.y = floatBitsToInt(uf_blockVS7[97].y + intBitsToFloat(R125i.x));
// 6
backupReg0i = R127i.w;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R124i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].y, intBitsToFloat(R126i.z)));
PV0iz = floatBitsToInt(-(intBitsToFloat(R9i.y)) + 1.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(R127i.x)));
R125i.z = floatBitsToInt(fract(intBitsToFloat(backupReg0i)));
// 7
backupReg0i = R124i.x;
backupReg1i = R127i.y;
backupReg2i = R126i.w;
R124i.x = floatBitsToInt(fract(intBitsToFloat(R125i.y)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iz)));
R124i.z = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iy));
R126i.w = floatBitsToInt(intBitsToFloat(backupReg1i) * intBitsToFloat(0x3e22f983) + 0.5);
R3i.z = floatBitsToInt(uf_blockVS7[97].x + intBitsToFloat(backupReg2i));
// 8
backupReg0i = R127i.z;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R10i.y)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(R126i.x)));
R127i.z = floatBitsToInt(uf_blockVS7[98].y + intBitsToFloat(R127i.w));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R124i.y)));
PS0i = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].x, intBitsToFloat(R126i.z)));
// 9
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PS0i));
R123i.y = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R125i.z = floatBitsToInt(fract(intBitsToFloat(R126i.w)));
R123i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R126i.w = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R124i.z));
// 10
R126i.x = floatBitsToInt(uf_blockVS7[98].x + intBitsToFloat(R126i.y));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.y)));
R127i.z = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R10i.y)));
R124i.z = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
// 11
R124i.x = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R124i.x));
R123i.y = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(R126i.w));
PV1iw = floatBitsToInt(max(intBitsToFloat(R7i.x), 0.0));
PS1i = floatBitsToInt(mul_nonIEEE(uf_blockVS7[99].y, intBitsToFloat(R9i.y)));
// 12
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + intBitsToFloat(PV1iz));
R125i.z = floatBitsToInt(min(intBitsToFloat(PV1iw), 0.0));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R127i.y)));
R127i.w = floatBitsToInt(sin((intBitsToFloat(R127i.z))/0.1591549367));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R124i.x));
PV1iy = floatBitsToInt(uf_blockVS7[13].y);
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) / 2.0);
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[99].x, intBitsToFloat(R9i.y)));
R127i.z = floatBitsToInt(cos((intBitsToFloat(R127i.z))/0.1591549367));
// 14
R0i.x = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(R125i.z));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(PV1ix));
R0i.z = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(PV1iy));
R126i.w = floatBitsToInt(uf_blockVS7[13].x);
R126i.w = floatBitsToInt(intBitsToFloat(R126i.w) / 2.0);
R127i.y = floatBitsToInt(sin((intBitsToFloat(R124i.z))/0.1591549367));
// 15
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.y)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R127i.y)));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV0iy)));
R125i.w = floatBitsToInt(intBitsToFloat(R6i.z) * 1.0);
R127i.x = floatBitsToInt(cos((intBitsToFloat(R124i.z))/0.1591549367));
// 16
R4i.x = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(R126i.w));
R10i.y = 0x3f800000;
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.x)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R127i.x)));
R9i.w = floatBitsToInt(sin((intBitsToFloat(R126i.x))/0.1591549367));
// 17
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(R124i.x)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(R124i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(R126i.y)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(R126i.w)));
R125i.z = floatBitsToInt(cos((intBitsToFloat(R126i.x))/0.1591549367));
// 18
R3i.x = floatBitsToInt(intBitsToFloat(R124i.z) + intBitsToFloat(PV1iz));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R125i.z)));
R5i.z = floatBitsToInt(-(intBitsToFloat(R9i.w)));
R0i.w = floatBitsToInt(-(intBitsToFloat(R126i.w)) + intBitsToFloat(PV1ix));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R125i.z)));
// 19
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R125i.w)));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R125i.w)));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R125i.z)));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R125i.w)));
R5i.w = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(R124i.y));
// 20
backupReg0i = R6i.w;
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R125i.z)));
R5i.y = floatBitsToInt(-(intBitsToFloat(R124i.x)) + intBitsToFloat(R124i.w));
R6i.w = 0x3f800000;
PS0i = int(intBitsToFloat(backupReg0i));
// 21
PV1iy = (PS0i == int(1))?-1:0;
R125i.z = (PS0i == 0x2)?-1:0;
R4i.w = (PS0i == 0x3)?-1:0;
// 22
R123i.x = ((PV1iy == 0)?(0xbf800000):(0xbf800000));
R123i.w = ((PV1iy == 0)?(0x3f800000):(0xbf800000));
// 23
R8i.x = ((R125i.z == 0)?(R123i.w):(0xbf800000));
R8i.y = ((R125i.z == 0)?(R123i.x):(0x3f800000));
}
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R3i.z;
R8i.x = ((R4i.w == 0)?(R8i.x):(0x3f800000));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), uf_blockVS8[3].y));
R3i.z = ((R4i.w == 0)?(R8i.y):(0x3f800000));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), uf_blockVS8[3].z));
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R4i.x)));
R124i.y = floatBitsToInt(uf_blockVS6[12].z);
R127i.z = floatBitsToInt(uf_blockVS6[13].z);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R0i.z)));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(R2i.w)) + intBitsToFloat(R9i.y));
R127i.y = floatBitsToInt(uf_blockVS6[14].z);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(R8i.z)) + intBitsToFloat(R3i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(R5i.z)) + intBitsToFloat(R0i.x));
R126i.w = floatBitsToInt(uf_blockVS6[12].y);
// 3
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R5i.x)) + intBitsToFloat(R123i.w));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R5i.w)) + intBitsToFloat(R123i.x));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R5i.y)) + intBitsToFloat(R123i.z));
R4i.w = floatBitsToInt(uf_blockVS6[13].y);
R9i.y = floatBitsToInt(uf_blockVS6[14].y);
// 4
R4i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R6i.w)),vec4(uf_blockVS8[4].x,uf_blockVS8[4].y,uf_blockVS8[4].z,uf_blockVS8[4].w)));
PV0iy = R4i.x;
PV0iz = R4i.x;
PV0iw = R4i.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R124i.y)));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R6i.w)),vec4(uf_blockVS8[5].x,uf_blockVS8[5].y,uf_blockVS8[5].z,uf_blockVS8[5].w)));
PV1ix = tempi.x;
R16i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R127i.z)));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R6i.w)),vec4(uf_blockVS8[6].x,uf_blockVS8[6].y,uf_blockVS8[6].z,uf_blockVS8[6].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R5i.z = tempi.x;
PV0iw = tempi.x;
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R127i.y)));
// 7
tempi.x = floatBitsToInt(dot(vec4(uf_blockVS6[12].x,uf_blockVS6[12].y,uf_blockVS6[12].z,uf_blockVS6[12].w),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),intBitsToFloat(R10i.y))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R124i.y)));
// 8
tempi.x = floatBitsToInt(dot(vec4(uf_blockVS6[13].x,uf_blockVS6[13].y,uf_blockVS6[13].z,uf_blockVS6[13].w),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),intBitsToFloat(R10i.y))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R1i.x = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV1ix));
// 9
tempi.x = floatBitsToInt(dot(vec4(uf_blockVS6[14].x,uf_blockVS6[14].y,uf_blockVS6[14].z,uf_blockVS6[14].w),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),intBitsToFloat(R10i.y))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R1i.y = floatBitsToInt(intBitsToFloat(R16i.y) + intBitsToFloat(PV0ix));
// 10
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS8[6].x,uf_blockVS8[6].y,uf_blockVS8[6].z,0.0)));
PV0iy = R127i.x;
PV0iz = R127i.x;
PV0iw = R127i.x;
R1i.z = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(PV1ix));
// 11
R0i.x = floatBitsToInt(-(intBitsToFloat(R4i.x)) + intBitsToFloat(R1i.x));
R3i.y = floatBitsToInt(-(intBitsToFloat(R16i.y)) + intBitsToFloat(R1i.y));
R0i.z = floatBitsToInt(-(intBitsToFloat(R5i.z)) + intBitsToFloat(R1i.z));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.z)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.y)));
// 12
R3i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS8[4].x,uf_blockVS8[4].y,uf_blockVS8[4].z,0.0)));
PV0iy = R3i.x;
PV0iz = R3i.x;
PV0iw = R3i.x;
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R124i.y)));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS8[5].x,uf_blockVS8[5].y,uf_blockVS8[5].z,0.0)));
PV1ix = tempi.x;
R4i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R4i.z = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(0x358637bd));
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R3i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R3i.y),intBitsToFloat(R0i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.z = floatBitsToInt(uf_blockVS6[12].x);
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R3i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R124i.y = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R3i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 17
PV1ix = ((intBitsToFloat(R124i.y) > 0.0)?-1:0);
PV1iy = ((intBitsToFloat(PS0i) > 0.0)?-1:0);
R126i.z = floatBitsToInt(uf_blockVS6[13].x);
R10i.w = floatBitsToInt(uf_blockVS6[14].x);
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 18
R9i.x = ((PV1ix == 0)?(0):(PV1iy));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(PS1i)));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PS1i)));
R8i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R127i.z)));
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PS1i)));
// 19
backupReg0i = R127i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R9i.y)) + intBitsToFloat(R124i.z));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R126i.w)) + intBitsToFloat(R124i.x));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(backupReg0i)));
// 20
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R4i.w)) + intBitsToFloat(R124i.w));
// 21
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R126i.w)) + intBitsToFloat(R127i.w));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R9i.y)) + intBitsToFloat(R126i.y));
// 22
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R125i.z)) + intBitsToFloat(R123i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R4i.w)) + intBitsToFloat(R125i.w));
// 23
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),intBitsToFloat(R9i.y)) + intBitsToFloat(R3i.w));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R126i.z)) + intBitsToFloat(R123i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),intBitsToFloat(R126i.w)) + intBitsToFloat(R125i.y));
// 24
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),intBitsToFloat(R4i.w)) + intBitsToFloat(R8i.w));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R125i.z)) + intBitsToFloat(R123i.z));
// 25
backupReg0i = R0i.y;
R2i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.w)),intBitsToFloat(R10i.w)) + intBitsToFloat(R127i.x));
R0i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.w)),intBitsToFloat(R126i.z)) + intBitsToFloat(R124i.x));
R2i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.w)),intBitsToFloat(R125i.z)) + intBitsToFloat(R127i.y));
R9i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R10i.w)) + intBitsToFloat(R124i.z));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R126i.z)) + intBitsToFloat(R123i.y));
// 26
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R10i.w)) + intBitsToFloat(R126i.x));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),uf_blockVS11[0].x) + 0.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),uf_blockVS11[0].x) + 0.0);
// 1
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R0i.y)) + intBitsToFloat(R9i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R2i.z)) + intBitsToFloat(R5i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R2i.x)) + intBitsToFloat(R9i.w));
// 2
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R4i.w)) + intBitsToFloat(R123i.z));
R18i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R8i.z)) + intBitsToFloat(R123i.y));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R2i.y)) + intBitsToFloat(R123i.w));
// 3
predResult = (R9i.x != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R3i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R3i.y),intBitsToFloat(R0i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), uf_blockVS7[95].x));
// 1
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), uf_blockVS7[95].x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), uf_blockVS7[95].x));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PS1i)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R8i.y),intBitsToFloat(R7i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.z)));
// 5
R1i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV0iy));
R1i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV0ix));
R1i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0iw));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R4i.x) + -(uf_blockVS6[17].x));
PV0iy = floatBitsToInt(intBitsToFloat(R16i.y) + -(uf_blockVS6[17].y));
PV0iz = floatBitsToInt(intBitsToFloat(R5i.z) + -(uf_blockVS6[17].z));
R127i.w = 0x3f800000;
R127i.x = floatBitsToInt(-(intBitsToFloat(R4i.x)) + intBitsToFloat(R1i.x));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.w = floatBitsToInt(-(intBitsToFloat(R16i.y)) + intBitsToFloat(R1i.y));
// 2
R127i.y = floatBitsToInt(-(intBitsToFloat(R5i.z)) + intBitsToFloat(R1i.z));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 3
R126i.x = ((intBitsToFloat(PS0i) > uf_blockVS7[116].x)?-1:0);
PV1iz = floatBitsToInt(min(intBitsToFloat(PS0i), uf_blockVS7[116].x));
R126i.w = floatBitsToInt(max(intBitsToFloat(PS0i), uf_blockVS7[116].y));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[116].x);
// 4
R125i.x = R127i.w;
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[116].y);
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV0iw)));
R127i.z = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV0iw)));
R2i.w = 0x3f800000;
// 6
backupReg0i = R125i.w;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R127i.z)));
R126i.y = floatBitsToInt(intBitsToFloat(R16i.y) + intBitsToFloat(PV1ix));
R126i.z = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(PV1iw));
R125i.w = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV1iy));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R127i.z)));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R16i.y) + intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R127i.z)));
PV1iz = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV0ix));
// 8
R9i.x = ((R126i.x == 0)?(R125i.w):(PV1iz));
R9i.y = ((R126i.x == 0)?(R126i.y):(PV1ix));
PV0iw = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(PV1iy));
// 9
R8i.z = ((R126i.x == 0)?(R126i.z):(PV0iw));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R8i.z),intBitsToFloat(R125i.x)),vec4(uf_blockVS6[8].x,uf_blockVS6[8].y,uf_blockVS6[8].z,uf_blockVS6[8].w)));
PV0ix = tempi.x;
R3i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R8i.z),intBitsToFloat(R125i.x)),vec4(uf_blockVS6[9].x,uf_blockVS6[9].y,uf_blockVS6[9].z,uf_blockVS6[9].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R3i.z = tempi.x;
PV1iw = tempi.x;
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R8i.z),intBitsToFloat(R125i.x)),vec4(uf_blockVS6[11].x,uf_blockVS6[11].y,uf_blockVS6[11].z,uf_blockVS6[11].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R8i.w = tempi.x;
// 13
R2i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R8i.z),intBitsToFloat(R125i.x)),vec4(uf_blockVS6[0].x,uf_blockVS6[0].y,uf_blockVS6[0].z,uf_blockVS6[0].w)));
PV1iy = R2i.x;
PV1iz = R2i.x;
PV1iw = R2i.x;
R2i.z = PV0ix;
R2i.z = floatBitsToInt(intBitsToFloat(R2i.z) / 2.0);
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R8i.z),intBitsToFloat(R125i.x)),vec4(uf_blockVS6[1].x,uf_blockVS6[1].y,uf_blockVS6[1].z,uf_blockVS6[1].w)));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R3i.w = floatBitsToInt(intBitsToFloat(R3i.z) * -(0.5) + intBitsToFloat(R2i.z));
// 15
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R8i.z),intBitsToFloat(R125i.x)),vec4(uf_blockVS6[2].x,uf_blockVS6[2].y,uf_blockVS6[2].z,uf_blockVS6[2].w)));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
PS1i = floatBitsToInt(intBitsToFloat(R8i.w) * 1.0);
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R8i.z),intBitsToFloat(R125i.x)),vec4(uf_blockVS6[3].x,uf_blockVS6[3].y,uf_blockVS6[3].z,uf_blockVS6[3].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R0i.w = tempi.x;
R4i.z = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 17
R125i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R16i.y),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS6[10].x,uf_blockVS6[10].y,uf_blockVS6[10].z,uf_blockVS6[10].w)));
PV1iy = R125i.x;
PV1iz = R125i.x;
PV1iw = R125i.x;
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R16i.y),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS6[11].x,uf_blockVS6[11].y,uf_blockVS6[11].z,uf_blockVS6[11].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 19
R123i.y = floatBitsToInt(intBitsToFloat(R125i.x) * 0.0 + intBitsToFloat(PV0ix));
PV1iw = PV0ix;
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) / 2.0);
// 20
R0i.z = floatBitsToInt(intBitsToFloat(R125i.x) * 0.5 + intBitsToFloat(PV1iw));
R2i.w = floatBitsToInt(1.0 / intBitsToFloat(R123i.y));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(uf_blockVS7[13].z, intBitsToFloat(R0i.z)));
R126i.z = floatBitsToInt(uf_blockVS7[13].z + intBitsToFloat(R0i.x));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R0i.y),intBitsToFloat(R126i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS6[6].x,uf_blockVS6[6].y,uf_blockVS6[6].z,uf_blockVS6[6].w)));
PV1ix = tempi.x;
R126i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.z = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(R2i.w));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R0i.y),intBitsToFloat(R126i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS6[7].x,uf_blockVS6[7].y,uf_blockVS6[7].z,uf_blockVS6[7].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
PV1ix = floatBitsToInt(uf_blockVS7[13].z + -(intBitsToFloat(R127i.z)));
PV1iy = floatBitsToInt((uf_blockVS7[8].w > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > uf_blockVS7[8].w)?1.0:0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(R0i.z) + -(intBitsToFloat(PV1ix)));
R127i.z = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[8].w);
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R13i.y) * intBitsToFloat(PS0i));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(PV0iw)));
R126i.z = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
PV1iw = floatBitsToInt(intBitsToFloat(R2i.w) * intBitsToFloat(PV0iy));
// 6
R123i.x = floatBitsToInt(intBitsToFloat(R4i.y) * 0.5 + intBitsToFloat(R2i.z));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockVS6[18].w, intBitsToFloat(PV1iw)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),uf_blockVS7[10].x) + intBitsToFloat(PV1ix));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(R4i.z));
PV1iy = floatBitsToInt(-(uf_blockVS6[18].y) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
// 8
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV1iz)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),uf_blockVS6[18].w) + -(uf_blockVS6[18].y));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 9
R8i.x = floatBitsToInt(-(uf_blockVS6[18].z) * intBitsToFloat(PS0i));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z),intBitsToFloat(R126i.z)) + intBitsToFloat(PV0iy));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.w));
// 10
R0i.z = floatBitsToInt(-(uf_blockVS6[18].z) * intBitsToFloat(PS1i));
// 11
PV1iy = floatBitsToInt(uf_blockVS7[5].x) & 0x80000;
PV1iz = ((intBitsToFloat(R7i.x) > 0.5)?-1:0);
// 12
R123i.x = floatBitsToInt(((PV1iz == 0)?(intBitsToFloat(R6i.x)):(-(intBitsToFloat(R6i.x)))));
PV0iw = (PV1iy == 0x80000)?-1:0;
// 13
R8i.y = ((PV0iw == 0)?(R6i.x):(R123i.x));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(uf_blockVS7[60].y);
R126i.y = floatBitsToInt(uf_blockVS7[60].z);
PV0iz = floatBitsToInt(uf_blockVS7[60].x);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), uf_blockVS8[0].y));
PV1iy = ((intBitsToFloat(R7i.y) > 0.5)?-1:0);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), uf_blockVS8[0].x));
PV1iw = floatBitsToInt(uf_blockVS7[68].x);
// 2
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), uf_blockVS7[59].x));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), uf_blockVS8[0].z));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), uf_blockVS7[59].x));
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), uf_blockVS8[0].w));
R0i.y = floatBitsToInt(((PV1iy == 0)?(intBitsToFloat(R6i.y)):(-(intBitsToFloat(R6i.y)))));
// 3
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), uf_blockVS7[59].x));
PV1iz = floatBitsToInt(uf_blockVS7[76].y);
PV1iw = floatBitsToInt(uf_blockVS7[76].x);
// 4
PV0ix = floatBitsToInt(uf_blockVS7[76].z);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), uf_blockVS8[1].y));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), uf_blockVS8[1].x));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), uf_blockVS8[1].z));
R9i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(PV0iz)));
R4i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(PV0iw)));
// 6
R10i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(PV1ix)));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iy = floatBitsToInt(-(uf_blockVS7[84].w) + uf_blockVS7[85].w);
R126i.z = floatBitsToInt(intBitsToFloat(R2i.w) + -(uf_blockVS7[84].w));
PV0iw = floatBitsToInt(intBitsToFloat(R2i.w) + -(uf_blockVS7[85].w));
// 1
PV1ix = floatBitsToInt(-(uf_blockVS7[84].x) + uf_blockVS7[85].x);
R126i.y = ((intBitsToFloat(R126i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.z = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
PV0iy = floatBitsToInt(uf_blockVS7[5].x) & 0x100000;
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
R2i.z = int(uf_blockVS7[17].x);
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(PV0iz)) + uf_blockVS7[84].x);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt(mul_nonIEEE(uf_blockVS7[84].x, intBitsToFloat(PV0iw)));
PV1iw = (PV0iy == 0x100000)?-1:0;
R126i.x = int(uf_blockVS7[17].y);
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(PV1iy)) + intBitsToFloat(PV1iz));
PV0iy = floatBitsToInt(uf_blockVS7[5].x) & 0x10;
R126i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x20;
R2i.w = ((PV1iw == 0)?(R6i.y):(R0i.y));
// 5
R125i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x40;
R0i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[85].x,intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.x));
PS1i = floatBitsToInt(float(PV0iy));
// 6
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R126i.y = floatBitsToInt(uf_blockVS7[5].x) & 0x80;
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(R126i.z));
// 7
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(float(R125i.x));
// 8
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R125i.w = int(intBitsToFloat(PV1iy));
// 9
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0ix)));
PV1iz = 0 - R125i.w;
R126i.w = int(intBitsToFloat(PV0iy));
// 10
R125i.x = max(R125i.w, PV1iz);
PV0iz = 0 - R126i.w;
R125i.w = int(intBitsToFloat(PV1iy));
// 11
R3i.x = max(R126i.w, PV0iz);
PV1iz = 0 - R125i.w;
PS1i = floatBitsToInt(float(R126i.y));
// 12
R0i.x = max(R125i.w, PV1iz);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R6i.y = floatBitsToInt(float(R2i.z));
// 13
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y), intBitsToFloat(R6i.y)));
R126i.y = floatBitsToInt(float(R126i.x));
// 14
PV0iz = floatBitsToInt(intBitsToFloat(R12i.y) * intBitsToFloat(PV1iw));
R125i.w = int(intBitsToFloat(PV1iy));
// 15
PV1iz = 0 - R125i.w;
PS1i = int(intBitsToFloat(PV0iz));
// 16
R6i.x = max(R125i.w, PV1iz);
R2i.y = R125i.x * PS1i;
// 17
R6i.w = floatBitsToInt(1.0 / intBitsToFloat(R126i.y));
}
if( activeMaskStackC[3] == true ) {
// 0
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), uf_blockVS8[1].w));
// 1
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(R6i.y)));
R126i.y = int(-1) + R2i.z;
PV1iz = floatBitsToInt(intBitsToFloat(R13i.y) * intBitsToFloat(R6i.w));
R125i.w = floatBitsToInt(uf_blockVS7[5].x) & 0x2000000;
R126i.w = floatBitsToInt(float(R2i.z));
// 2
R124i.z = floatBitsToInt(abs(intBitsToFloat(R126i.w)));
R127i.x = int(intBitsToFloat(PV1iz));
// 3
PS1i = floatBitsToInt(float(R127i.x));
// 4
PV0iw = floatBitsToInt(-(intBitsToFloat(R6i.y)) + intBitsToFloat(PS1i));
R127i.z = floatBitsToInt(float(R127i.x));
// 5
R125i.x = floatBitsToInt(abs(intBitsToFloat(R127i.z)));
R123i.z = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
R4i.x = floatBitsToInt(1.0 / abs(intBitsToFloat(R126i.w)));
// 6
PV0iy = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R127i.z)), intBitsToFloat(R4i.x)));
PS0i = int(intBitsToFloat(R123i.z));
// 7
R124i.x = int(1) - PS0i;
PV1iw = floatBitsToInt(trunc(intBitsToFloat(PV0iy)));
R2i.x = PS0i * R126i.y;
// 8
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iw)),intBitsToFloat(R124i.z)) + intBitsToFloat(R125i.x));
PS0i = floatBitsToInt(float(R125i.w));
// 9
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(R126i.y) >= abs(intBitsToFloat(R126i.w)))?1.0:0.0);
PV1iw = floatBitsToInt(-(abs(intBitsToFloat(R126i.w))) + intBitsToFloat(R126i.y));
R125i.z = int(intBitsToFloat(R126i.x));
// 10
R126i.x = ((intBitsToFloat(PV1iz) == 0.0)?(R126i.y):(PV1iw));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iy)));
R125i.w = R6i.x * R125i.z;
// 11
PV1iy = floatBitsToInt(abs(intBitsToFloat(R126i.w)) + intBitsToFloat(R126i.x));
R126i.z = int(intBitsToFloat(PV0iw));
// 12
PV0ix = 0 - R126i.z;
R123i.w = ((-(intBitsToFloat(R126i.x)) > 0.0)?(PV1iy):(R126i.x));
// 13
PV1iy = max(R126i.z, PV0ix);
R123i.z = ((-(intBitsToFloat(R127i.z)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.w)))):(R123i.w));
// 14
R123i.x = ((intBitsToFloat(R126i.w) == 0.0)?(R127i.z):(R123i.z));
PS0i = PV1iy * R125i.z;
// 15
R126i.y = R127i.x + PS0i;
PS1i = int(intBitsToFloat(R123i.x));
// 16
PS0i = R124i.x * PS1i;
// 17
PV1iy = PS0i + R2i.x;
R127i.z = R0i.x * R126i.y;
// 18
PS0i = R3i.x * PV1iy;
// 19
PV1iw = PS0i + R2i.y;
// 20
PV0iz = R127i.z + PV1iw;
// 21
PV1ix = R125i.w + PV0iz;
// 22
R127i.y = floatBitsToInt(float(PV1ix));
// 23
R124i.x = floatBitsToInt(abs(intBitsToFloat(R127i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), abs(intBitsToFloat(R127i.y))));
// 24
PV0iz = floatBitsToInt(trunc(intBitsToFloat(PV1iw)));
// 25
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iz)),intBitsToFloat(R124i.z)) + intBitsToFloat(R124i.x));
// 26
PV0iz = floatBitsToInt((intBitsToFloat(R126i.y) >= abs(intBitsToFloat(R126i.w)))?1.0:0.0);
PV0iw = floatBitsToInt(-(abs(intBitsToFloat(R126i.w))) + intBitsToFloat(R126i.y));
// 27
R124i.x = ((intBitsToFloat(PV0iz) == 0.0)?(R126i.y):(PV0iw));
// 28
PV0iy = floatBitsToInt(abs(intBitsToFloat(R126i.w)) + intBitsToFloat(R124i.x));
// 29
R123i.w = ((-(intBitsToFloat(R124i.x)) > 0.0)?(PV0iy):(R124i.x));
// 30
R123i.z = ((-(intBitsToFloat(R127i.y)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.w)))):(R123i.w));
// 31
R123i.x = ((intBitsToFloat(R126i.w) == 0.0)?(R127i.y):(R123i.z));
// 32
R127i.y = int(intBitsToFloat(R123i.x));
// 33
R126i.w = floatBitsToInt(float(R127i.y));
// 34
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(R126i.w))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(R126i.w) > 0.0)?1.0:0.0);
R127i.z = floatBitsToInt(float(R127i.y));
// 35
PV1ix = floatBitsToInt(abs(intBitsToFloat(R127i.z)) * 0.25);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0ix)));
R125i.w = floatBitsToInt(abs(intBitsToFloat(R127i.z)));
// 36
PV0iy = floatBitsToInt(trunc(intBitsToFloat(PV1ix)));
R123i.w = floatBitsToInt(intBitsToFloat(PV1iy) * 0.5 + intBitsToFloat(R126i.w));
// 37
PV1ix = floatBitsToInt(intBitsToFloat(R123i.w) * 0.25);
R124i.z = floatBitsToInt(-(intBitsToFloat(PV0iy)) * 4.0 + intBitsToFloat(R125i.w));
// 38
PV0ix = floatBitsToInt(intBitsToFloat(R124i.z) + -4.0);
PV0iy = floatBitsToInt((intBitsToFloat(R124i.z) >= 4.0)?1.0:0.0);
PV0iz = floatBitsToInt(trunc(intBitsToFloat(PV1ix)));
// 39
R125i.w = ((intBitsToFloat(PV0iy) == 0.0)?(R124i.z):(PV0ix));
PS1i = int(intBitsToFloat(PV0iz));
// 40
PV0iz = floatBitsToInt(intBitsToFloat(R125i.w) + 4.0);
R6i.w = PS1i + 0x12;
// 41
R123i.x = ((-(intBitsToFloat(R125i.w)) > 0.0)?(PV0iz):(R125i.w));
// 42
R123i.y = ((-(intBitsToFloat(R127i.z)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.x)))):(R123i.x));
// 43
PS1i = int(intBitsToFloat(R123i.y));
// 44
R124i.x = 0xfffffffe + PS1i;
R6i.y = 0xfffffffd + PS1i;
PV0iz = int(-1) + PS1i;
PS0i = floatBitsToInt(float(PS1i));
// 45
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PS1i = floatBitsToInt(float(PV0iz));
// 46
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iy)));
PS0i = floatBitsToInt(float(R124i.x));
// 47
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R127i.z = int(intBitsToFloat(PV0iw));
// 48
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1ix)));
PV0iy = 0 - R127i.z;
R4i.x = int(intBitsToFloat(PV1iz));
// 49
R3i.x = 0 - R4i.x;
R2i.y = max(R127i.z, PV0iy);
R0i.y = int(intBitsToFloat(PV0ix));
}
if( activeMaskStackC[3] == true ) {
R5i.xyzw = floatBitsToInt(uf_blockVS7[R6i.w].xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = int(1) - R2i.y;
PV0iy = 0 - R0i.y;
PV0iw = max(R4i.x, R3i.x);
PS0i = floatBitsToInt(float(R6i.y));
// 1
PV1ix = int(1) - PV0iw;
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iz = max(R0i.y, PV0iy);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R127i.y = PV0ix * R5i.x;
// 2
PV0ix = int(1) - PV1iz;
R126i.y = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), uf_blockVS7[45].x));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
PV0iw = floatBitsToInt(uf_blockVS7[44].z + uf_blockVS7[45].x);
PS0i = PV1ix * R5i.y;
// 3
backupReg0i = R127i.y;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), uf_blockVS7[45].y));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
R127i.y = floatBitsToInt(-(intBitsToFloat(PV0iz)) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(uf_blockVS7[44].w + uf_blockVS7[45].y);
PV1iw = PS0i + backupReg0i;
PS1i = PV0ix * R5i.z;
// 4
R124i.x = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(PV1iz));
PV0iy = floatBitsToInt(uf_blockVS7[46].x + uf_blockVS7[46].z);
R127i.z = PS1i + PV1iw;
PV0iw = floatBitsToInt(uf_blockVS7[46].y + uf_blockVS7[46].w);
R125i.w = int(intBitsToFloat(R126i.y));
// 5
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),uf_blockVS7[46].w) + intBitsToFloat(PV0iw));
PV1iz = 0 - R125i.w;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),uf_blockVS7[46].z) + intBitsToFloat(PV0iy));
PS1i = int(uf_blockVS7[48].z);
// 6
PV0ix = max(R125i.w, PV1iz);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y),uf_blockVS7[44].y) + intBitsToFloat(R124i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y),uf_blockVS7[45].z) + intBitsToFloat(R123i.w));
R124i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R13i.y)),uf_blockVS7[44].x) + -(intBitsToFloat(R127i.y)));
R127i.w = floatBitsToInt(float(PS1i));
// 7
R124i.x = floatBitsToInt(abs(intBitsToFloat(R127i.w)));
PV1iy = int(1) - PV0ix;
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y),uf_blockVS7[45].w) + intBitsToFloat(R127i.x));
R6i.w = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
R127i.y = floatBitsToInt(1.0 / abs(intBitsToFloat(R127i.w)));
// 8
backupReg0i = R5i.w;
R5i.w = floatBitsToInt(intBitsToFloat(R8i.y) + 0.5);
PS0i = PV1iy * backupReg0i;
// 9
R127i.x = PS0i + R127i.z;
R124i.y = floatBitsToInt(-(intBitsToFloat(R124i.z)) + 1.0);
R126i.z = floatBitsToInt(intBitsToFloat(R2i.w) + -(0.5));
R124i.z = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 10
R5i.y = 0;
R125i.z = floatBitsToInt(-(uf_blockVS7[93].z) + uf_blockVS7[93].w);
R125i.w = floatBitsToInt(intBitsToFloat(R8i.x) + -(uf_blockVS7[93].z));
R127i.z = floatBitsToInt(float(R127i.x));
// 11
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(R127i.z))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(R127i.z) > 0.0)?1.0:0.0);
R126i.x = floatBitsToInt(float(R127i.x));
// 12
R127i.x = floatBitsToInt(abs(intBitsToFloat(R126i.x)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R126i.x)), intBitsToFloat(R127i.y)));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[48].z);
// 13
R125i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].x, intBitsToFloat(PS0i)));
R1i.y = floatBitsToInt(fract(intBitsToFloat(R1i.w)));
PV1iz = floatBitsToInt(trunc(intBitsToFloat(PV0iw)));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iy) * 0.5 + intBitsToFloat(R127i.z));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[48].w);
// 14
backupReg0i = R125i.z;
PV0ix = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(R124i.z));
R125i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].y, intBitsToFloat(PS1i)));
R125i.z = floatBitsToInt(intBitsToFloat(R13i.y) * 100.0);
R125i.z = clampFI32(R125i.z);
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iz)),intBitsToFloat(R124i.x)) + intBitsToFloat(R127i.x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 15
PV1ix = floatBitsToInt((intBitsToFloat(R126i.w) >= abs(intBitsToFloat(R127i.w)))?1.0:0.0);
PV1iy = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt(-(abs(intBitsToFloat(R127i.w))) + intBitsToFloat(R126i.w));
PV1iw = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(PS0i));
PV1iw = clampFI32(PV1iw);
R2i.y = floatBitsToInt(uf_blockVS7[104].x);
// 16
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R125i.z)));
R127i.y = ((intBitsToFloat(PV1ix) == 0.0)?(R126i.w):(PV1iz));
R5i.z = floatBitsToInt(-(intBitsToFloat(PV1iw)) + 1.0);
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R125i.z)));
PS0i = int(intBitsToFloat(PV1iy));
// 17
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R125i.z)));
PV1iw = floatBitsToInt(abs(intBitsToFloat(R127i.w)) + intBitsToFloat(R127i.y));
R127i.x = floatBitsToInt(float(PS0i));
// 18
R123i.z = ((-(intBitsToFloat(R127i.y)) > 0.0)?(PV1iw):(R127i.y));
// 19
R123i.x = ((-(intBitsToFloat(R126i.x)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.z)))):(R123i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)),intBitsToFloat(R127i.x)) + intBitsToFloat(R126i.y));
// 20
R123i.y = ((intBitsToFloat(R127i.w) == 0.0)?(R126i.x):(R123i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)),intBitsToFloat(R126i.z)) + -(intBitsToFloat(R123i.w)));
// 21
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R124i.y)) + intBitsToFloat(R123i.w));
PS1i = int(intBitsToFloat(R123i.y));
// 22
PS0i = floatBitsToInt(float(PS1i));
// 23
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(PS0i)) + intBitsToFloat(R124i.w));
// 24
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R5i.w)) + intBitsToFloat(R123i.z));
// 25
R7i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R8i.y)),intBitsToFloat(R6i.w)) + intBitsToFloat(R123i.z));
// 26
R1i.x = floatBitsToInt(intBitsToFloat(R3i.w) * intBitsToFloat(R4i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), uf_blockVS11[5].z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),uf_blockVS13[24].x) + -(uf_blockVS13[24].y));
R123i.w = clampFI32(R123i.w);
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),uf_blockVS13[22].x) + -(uf_blockVS13[22].y));
R123i.x = clampFI32(R123i.x);
PV1iy = floatBitsToInt(uf_blockVS13[28].y + 1.0);
PV1iz = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
R127i.w = floatBitsToInt(uf_blockVS13[28].y * 1.0 + intBitsToFloat(R0i.z));
PS1i = floatBitsToInt(-(intBitsToFloat(R1i.x)) + 1.0);
// 2
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) * 1.5);
PV0ix = clampFI32(PV0ix);
R1i.y = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3f333333) + intBitsToFloat(0x3e19999a));
R1i.y = clampFI32(R1i.y);
PV0iw = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
tempResultf = max(0.0, intBitsToFloat(PV1iz));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockVS13[24].w, intBitsToFloat(PS0i)));
R124i.w = floatBitsToInt(intBitsToFloat(PV0ix) * 15.0);
tempResultf = max(0.0, intBitsToFloat(PV0iw));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 4
R125i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS13[23].x, intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockVS13[23].y, intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
// 5
R0i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)),uf_blockVS13[25].w) + uf_blockVS13[25].w);
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iy)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 6
R3i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
PS0i = floatBitsToInt(exp2(intBitsToFloat(R125i.x)));
// 7
R123i.w = floatBitsToInt(mul_nonIEEE(-(uf_blockVS13[23].z),intBitsToFloat(PS0i)) + uf_blockVS13[23].z);
R123i.w = clampFI32(R123i.w);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R124i.w));
// 8
PV0ix = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(-(intBitsToFloat(R5i.x)) + intBitsToFloat(R123i.w));
PV0iw = clampFI32(PV0iw);
// 9
R1i.x = PV0iw;
R8i.y = PV0iw;
PV1iz = floatBitsToInt(max(intBitsToFloat(PV0ix), intBitsToFloat(0x3e4ccccd)));
// 10
R3i.w = floatBitsToInt(min(intBitsToFloat(PV1iz), 1.0));
}
if( activeMaskStackC[3] == true ) {
// 0
R125i.x = floatBitsToInt(uf_blockVS6[17].x + -(intBitsToFloat(R9i.x)));
R124i.y = floatBitsToInt(uf_blockVS6[17].y + -(intBitsToFloat(R9i.y)));
PV0iw = floatBitsToInt(min(uf_blockVS6[17].y, uf_blockVS13[27].z));
// 1
R126i.x = floatBitsToInt(uf_blockVS6[17].z + -(intBitsToFloat(R8i.z)));
PV1iy = floatBitsToInt(-(intBitsToFloat(R1i.y)) + 1.0);
PV1iz = floatBitsToInt(-(intBitsToFloat(R16i.y)) + intBitsToFloat(PV0iw));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(R126i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS13[27].y,intBitsToFloat(PV1iz)) + uf_blockVS13[27].x);
R123i.y = clampFI32(R123i.y);
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + 8.5);
// 3
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), uf_blockVS13[26].w));
R1i.y = 0;
R1i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3daaaaab));
R122i.x = floatBitsToInt((intBitsToFloat(R124i.y) * intBitsToFloat(R124i.y) + intBitsToFloat(PV0ix)));
// 4
R9i.x = ((0.0 >= intBitsToFloat(R5i.z))?-1:0);
R123i.y = floatBitsToInt((intBitsToFloat(R125i.x) * intBitsToFloat(R125i.x) + intBitsToFloat(R122i.x)));
R8i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R5i.w = 0;
R6i.w = 0;
// 5
R2i.x = 0;
R9i.y = ((R9i.x == 0)?(R4i.y):(R8i.z));
R2i.z = ((R9i.x == 0)?(R8i.x):(R6i.w));
R2i.w = ((R9i.x == 0)?(R1i.w):(R5i.w));
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.y));
PS1i = floatBitsToInt(tempResultf);
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS1i)));
R6i.x = R13i.x;
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(uf_blockVS13[28].x,uf_blockVS13[28].y,uf_blockVS13[28].z,0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R0i.y = R18i.y;
// 8
R4i.x = R8i.w;
R4i.y = R2i.y;
R126i.z = floatBitsToInt(intBitsToFloat(PV1ix) + 0.5);
R1i.w = R15i.z;
R3i.z = R6i.z;
// 9
PV1ix = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R7i.y = ((R9i.x == 0)?(0):(0x3f800000));
R123i.z = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
R123i.w = ((R9i.x == 0)?(0):(R0i.z));
R122i.x = ((R9i.x == 0)?(0):(R127i.x));
// 10
R16i.x = ((R7i.y == 0)?(R0i.z):(R123i.w));
R16i.y = ((R7i.y == 0)?(R127i.x):(R122i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(0xbe593484));
R123i.w = ((R9i.x == 0)?(0):(R8i.y));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f22f983));
R123i.y = ((R9i.x == 0)?(0):(R5i.x));
R16i.z = ((R7i.y == 0)?(R8i.y):(R123i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(0x3fc90da4));
R8i.x = ((R9i.x == 0)?(0):(R1i.x));
// 12
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),-(intBitsToFloat(R123i.w))) + 1.0);
R8i.y = ((R9i.x == 0)?(0):(R3i.z));
R4i.z = ((R9i.x == 0)?(0):(R0i.y));
R16i.w = ((R7i.y == 0)?(R5i.x):(R123i.y));
R5i.x = ((R9i.x == 0)?(0):(R6i.w));
}
if( activeMaskStackC[3] == true ) {
R3i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y))).xyz);
R0i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R1i.z),intBitsToFloat(R1i.y))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R3i.w)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R3i.w)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R3i.w)));
R127i.w = ((R9i.x == 0)?(0):(R0i.y));
R3i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS8[3].x,intBitsToFloat(R5i.z)) + 0.0);
// 1
R123i.x = ((R9i.x == 0)?(0):(R124i.y));
R123i.y = ((R9i.x == 0)?(0):(R126i.z));
R123i.z = ((R9i.x == 0)?(0):(R127i.x));
R124i.w = ((R9i.x == 0)?(R3i.x):(R2i.x));
R125i.y = ((R9i.x == 0)?(0):(R0i.z));
// 2
R17i.x = ((R7i.y == 0)?(R124i.y):(R123i.x));
R17i.y = ((R7i.y == 0)?(R127i.x):(R123i.z));
R17i.z = ((R7i.y == 0)?(R126i.z):(R123i.y));
R17i.w = ((R7i.y == 0)?(R1i.x):(R8i.x));
R125i.w = R6i.z;
// 3
R123i.x = ((R9i.x == 0)?(0):(R0i.w));
R123i.y = ((R9i.x == 0)?(0):(R7i.z));
R126i.z = ((R9i.x == 0)?(0):(R5i.y));
R123i.w = ((R9i.x == 0)?(0):(R0i.x));
R126i.w = ((R9i.x == 0)?(R15i.y):(R2i.y));
// 4
R12i.x = ((R7i.y == 0)?(R0i.x):(R123i.w));
R12i.y = ((R7i.y == 0)?(R0i.y):(R127i.w));
R12i.z = ((R7i.y == 0)?(R0i.z):(R125i.y));
R12i.w = ((R7i.y == 0)?(R0i.w):(R123i.x));
R19i.x = ((R7i.y == 0)?(R7i.z):(R123i.y));
// 5
R127i.x = ((R9i.x == 0)?(0):(R10i.y));
R123i.y = ((R9i.x == 0)?(0):(R4i.w));
R125i.z = R15i.z;
R127i.w = ((R9i.x == 0)?(0):(R6i.x));
R122i.x = ((R9i.x == 0)?(0):(R9i.z));
// 6
R0i.x = ((R7i.y == 0)?(R4i.w):(R123i.y));
R0i.y = ((R7i.y == 0)?(R9i.z):(R122i.x));
R123i.z = ((R9i.x == 0)?(0):(R7i.x));
R123i.w = ((R9i.x == 0)?(0):(R10i.x));
R4i.w = ((R9i.x == 0)?(0):(R11i.y));
// 7
R19i.y = ((R7i.y == 0)?(R7i.x):(R123i.z));
R19i.z = ((R7i.y == 0)?(R5i.y):(R126i.z));
R0i.w = ((R7i.y == 0)?(R10i.y):(R127i.x));
R0i.z = ((R7i.y == 0)?(R10i.x):(R123i.w));
// 8
backupReg0i = R6i.w;
R123i.x = ((R9i.x == 0)?(R15i.x):(R2i.x));
R125i.y = R18i.y;
R126i.z = ((R9i.x == 0)?(0):(R7i.w));
R6i.w = ((R9i.x == 0)?(R14i.z):(R8i.z));
R127i.x = ((R9i.x == 0)?(R14i.y):(backupReg0i));
// 9
R15i.x = ((R7i.y == 0)?(R124i.w):(R123i.x));
R15i.y = ((R7i.y == 0)?(R4i.y):(R126i.w));
R15i.z = ((R7i.y == 0)?(R1i.w):(R125i.z));
R123i.w = ((R9i.x == 0)?(0):(R10i.z));
PS1i = R13i.x;
// 10
backupReg0i = R10i.z;
backupReg1i = R123i.w;
R10i.x = ((R7i.y == 0)?(PS1i):(R127i.w));
R10i.y = ((R7i.y == 0)?(R125i.y):(R4i.z));
R10i.z = ((R7i.y == 0)?(R125i.w):(R8i.y));
R123i.w = ((R9i.x == 0)?(R14i.x):(R5i.w));
R18i.x = ((R7i.y == 0)?(backupReg0i):(backupReg1i));
// 11
R14i.x = ((R7i.y == 0)?(R2i.w):(R123i.w));
R14i.y = ((R7i.y == 0)?(R2i.z):(R127i.x));
R14i.z = ((R7i.y == 0)?(R9i.y):(R6i.w));
R123i.w = ((R9i.x == 0)?(0):(R11i.x));
// 12
R18i.y = ((R7i.y == 0)?(R11i.x):(R123i.w));
R18i.z = ((R7i.y == 0)?(R11i.y):(R4i.w));
R18i.w = ((R7i.y == 0)?(R7i.w):(R126i.z));
R10i.w = R5i.x;
// 13
R123i.z = ((R9i.x == 0)?(R14i.w):(R8i.w));
// 14
R14i.w = ((R7i.y == 0)?(R4i.x):(R123i.z));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.z));
// export
passParameterSem8 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.z));
}
