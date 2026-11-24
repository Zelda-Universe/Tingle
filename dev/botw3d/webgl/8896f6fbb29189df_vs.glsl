#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 8896f6fbb29189df
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
vec4 uf_blockVS13[39];
};


UNIFORM_BUFFER_LAYOUT(14, 0, 7) uniform uniformBlockVS14
{
vec4 uf_blockVS14[2];
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
ATTR_LAYOUT(0, 9) in uvec4 attrDataSem9;
ATTR_LAYOUT(0, 10) in uvec4 attrDataSem10;

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem3;
out vec4 passParameterSem8;
out vec4 passParameterSem11;
out vec4 passParameterSem14;
out vec4 passParameterSem15;
out vec4 passParameterSem16;
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
ivec4 R21i = ivec4(0);
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
attrDecoder.xyz = attrDataSem4.xyz;
attrDecoder.xyz = uvec3((attrDecoder.xyz>>24)|((attrDecoder.xyz>>8)&0xFF00u)|((attrDecoder.xyz<<8)&0xFF0000u)|((attrDecoder.xyz<<24)));
attrDecoder.w = uint(0);
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), 0x3f800000);
attrDecoder = attrDataSem9;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R9i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem0;
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem1;
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem2;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem3;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem7;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem6;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R9i.z = floatBitsToInt(-(intBitsToFloat(R9i.y)) + 1.0);
R0i.w = 0;
R1i.w = floatBitsToInt(1.0);
// 1
R5i.w = floatBitsToInt(-(intBitsToFloat(R4i.w)) + uf_blockVS8[2].x);
R8i.w = floatBitsToInt(-(intBitsToFloat(R9i.x)) + 1.0);
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
R13i.x = 0;
R13i.y = 0;
R13i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R19i.x = 0;
// 1
R2i.w = R1i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R2i.w = R0i.w;
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
PS0i = int(intBitsToFloat(R3i.w));
// 1
R10i.x = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R5i.w) >= intBitsToFloat(R10i.x));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R13i.x = 0;
R13i.y = 0;
R13i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R19i.x = 0;
// 1
R0i.w = R1i.w;
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
// 0
R127i.x = floatBitsToInt((uf_blockVS7[9].x > 0.0)?1.0:0.0);
R127i.y = floatBitsToInt((0.0 > uf_blockVS7[9].x)?1.0:0.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), uf_blockVS7[10].y));
R0i.w = 0x3f800000;
PS0i = floatBitsToInt(1.0 / uf_blockVS7[9].x);
// 1
R12i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS8[4].x,uf_blockVS8[4].y,uf_blockVS8[4].z,uf_blockVS8[4].w)));
PV1iy = R12i.x;
PV1iz = R12i.x;
PV1iw = R12i.x;
R126i.y = floatBitsToInt(intBitsToFloat(R5i.w) * intBitsToFloat(PS0i));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS8[5].x,uf_blockVS8[5].y,uf_blockVS8[5].z,uf_blockVS8[5].w)));
PV0ix = tempi.x;
R11i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.z = floatBitsToInt(intBitsToFloat(R127i.x) + -(intBitsToFloat(R127i.y)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS8[6].x,uf_blockVS8[6].y,uf_blockVS8[6].z,uf_blockVS8[6].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R14i.z = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(R126i.y));
// 4
R127i.x = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
PV0iy = floatBitsToInt(fract(intBitsToFloat(PS1i)));
R127i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x10000;
PV0iw = floatBitsToInt(uf_blockVS7[5].x) & 0x20000;
R11i.x = floatBitsToInt(1.0 / intBitsToFloat(R10i.x));
// 5
R126i.x = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(R7i.z));
R126i.y = floatBitsToInt(uf_blockVS7[5].x) & 0x40000;
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV0iy)));
R9i.w = floatBitsToInt(intBitsToFloat(R5i.w) * intBitsToFloat(R11i.x));
PS1i = floatBitsToInt(float(PV0iw));
// 6
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R127i.y = R7i.z;
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(R127i.x)));
PS0i = floatBitsToInt(float(R127i.z));
// 7
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R1i.z = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R126i.z));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(float(R126i.y));
// 8
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R125i.y = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(R7i.y));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R126i.y = int(intBitsToFloat(PV1iw));
// 9
PV1ix = 0 - R126i.y;
R124i.y = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
R126i.z = R7i.y;
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) * 2.0);
PV1iw = floatBitsToInt(intBitsToFloat(R126i.x) * 0.5);
R127i.w = int(intBitsToFloat(PV0iz));
// 10
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(intBitsToFloat(R125i.y) * 0.5);
R127i.y = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(R7i.z));
R127i.z = max(R126i.y, PV1ix);
PV0iw = floatBitsToInt(floor(intBitsToFloat(backupReg0i)));
R0i.w = floatBitsToInt(intBitsToFloat(PV1iw) + -(0.5));
R0i.w = floatBitsToInt(intBitsToFloat(R0i.w) * 2.0);
// 11
PV1ix = floatBitsToInt((intBitsToFloat(PV0iw) > 0.0)?1.0:0.0);
PV1iy = 0 - R127i.w;
R126i.z = floatBitsToInt(floor(intBitsToFloat(R126i.z)));
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PV0iw))?1.0:0.0);
R127i.x = int(intBitsToFloat(R124i.y));
// 12
backupReg0i = R126i.x;
R126i.x = max(R127i.w, PV1iy);
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 0.5);
R125i.z = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iw)));
PV0iw = R7i.x;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
R0i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + -(0.5));
R0i.z = floatBitsToInt(intBitsToFloat(R0i.z) * 2.0);
// 13
R125i.x = floatBitsToInt(floor(intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(R126i.z))?1.0:0.0);
PV1iz = 0 - R127i.x;
PV1iw = floatBitsToInt((intBitsToFloat(R126i.z) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(float(R127i.z));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 14
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iy)));
R1i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(R125i.z)));
R3i.z = floatBitsToInt(intBitsToFloat(R127i.y) + -(0.5));
R3i.z = floatBitsToInt(intBitsToFloat(R3i.z) * 2.0);
R127i.w = max(R127i.x, PV1iz);
PS0i = floatBitsToInt(float(R126i.x));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 15
PV1ix = floatBitsToInt((intBitsToFloat(R125i.x) > 0.0)?1.0:0.0);
R0i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(R125i.x))?1.0:0.0);
PV1iw = floatBitsToInt(max(intBitsToFloat(R7i.x), 0.0));
R4i.z = floatBitsToInt(intBitsToFloat(R7i.y) + -(0.5));
// 16
R1i.x = floatBitsToInt(intBitsToFloat(R7i.x) + -(0.5));
R3i.y = floatBitsToInt(intBitsToFloat(R7i.z) + -(0.5));
PV0iz = floatBitsToInt(min(intBitsToFloat(PV1iw), 0.0));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iz)));
PS0i = floatBitsToInt(float(R127i.w));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 17
R0i.x = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(uf_blockVS7[13].y);
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) / 2.0);
R10i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(uf_blockVS7[13].x);
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) / 2.0);
R10i.y = floatBitsToInt(intBitsToFloat(R7i.x) + 1.0);
// 18
R4i.x = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(PV1iy));
R4i.y = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV1iw));
R12i.z = floatBitsToInt(intBitsToFloat(R7i.y) + 1.0);
R6i.w = floatBitsToInt(intBitsToFloat(R7i.z) + 1.0);
PS0i = ((intBitsToFloat(R5i.w) == 0.0)?-1:0);
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS8[6].x,uf_blockVS8[6].y,uf_blockVS8[6].z,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R127i.w = tempi.x;
R13i.z = ((PS0i == 0)?(R5i.w):(0x3f800000));
// 20
R6i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS8[4].x,uf_blockVS8[4].y,uf_blockVS8[4].z,0.0)));
PV0iy = R6i.x;
PV0iz = R6i.x;
PV0iw = R6i.x;
// 21
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS8[5].x,uf_blockVS8[5].y,uf_blockVS8[5].z,0.0)));
PV1ix = tempi.x;
R6i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R15i.z = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(0x358637bd));
}
if( activeMaskStackC[3] == true ) {
// 0
R124i.x = floatBitsToInt(-(intBitsToFloat(R14i.z)) + uf_blockVS6[17].z);
R126i.y = floatBitsToInt(-(intBitsToFloat(R12i.x)) + uf_blockVS6[17].x);
R2i.z = floatBitsToInt(intBitsToFloat(R12i.x) + -(uf_blockVS6[17].x));
R4i.w = floatBitsToInt(intBitsToFloat(R11i.y) + -(uf_blockVS6[17].y));
R11i.z = floatBitsToInt(intBitsToFloat(R14i.z) + -(uf_blockVS6[17].z));
// 1
PV1ix = floatBitsToInt(-(uf_blockVS7[96].w) + uf_blockVS7[97].w);
PV1iy = floatBitsToInt(intBitsToFloat(R1i.z) + -(uf_blockVS7[97].w));
R126i.z = floatBitsToInt(intBitsToFloat(R1i.z) + -(uf_blockVS7[96].w));
R127i.w = floatBitsToInt((-(intBitsToFloat(R126i.y)) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R124i.x));
// 2
PV0ix = floatBitsToInt(-(uf_blockVS7[96].x) + uf_blockVS7[97].x);
R2i.y = ((intBitsToFloat(PV1iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.z = floatBitsToInt((0.0 > -(intBitsToFloat(R126i.y)))?1.0:0.0);
PV0iw = floatBitsToInt(-(intBitsToFloat(R126i.y)) * intBitsToFloat(PS1i));
R3i.w = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 3
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PV0iw))?1.0:0.0);
PV1iy = floatBitsToInt((intBitsToFloat(PV0iw) > 0.0)?1.0:0.0);
R127i.z = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(R3i.w));
R126i.w = floatBitsToInt(max(intBitsToFloat(PV0iw), -(intBitsToFloat(PV0iw))));
tempResultf = max(0.0, uf_blockVS7[114].w);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 4
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PS1i)));
R127i.y = ((intBitsToFloat(R126i.w) > 1.0)?-1:0);
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1ix)));
R2i.w = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(R125i.z)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.w));
// 5
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R127i.z)));
R123i.y = ((R127i.y == 0)?(R126i.w):(PS0i));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3fc90fdb));
R1i.w = floatBitsToInt(((R127i.y == 0)?(intBitsToFloat(PV0iz)):(-(intBitsToFloat(PV0iz)))));
R124i.y = ((intBitsToFloat(R126i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 6
R126i.x = ((R127i.y == 0)?(0):(PV1iz));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), uf_blockVS7[115].y));
PV0iz = floatBitsToInt(min(intBitsToFloat(R123i.y), 1.0));
PV0iw = floatBitsToInt(-(intBitsToFloat(R2i.y)) + 1.0);
R125i.x = floatBitsToInt(exp2(intBitsToFloat(R125i.x)));
// 7
R127i.x = floatBitsToInt(uf_blockVS7[96].x + intBitsToFloat(R127i.x));
PV1iy = floatBitsToInt(-(uf_blockVS7[114].w) + 1.0);
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PV0iw)));
R127i.w = floatBitsToInt(max(intBitsToFloat(PV0iz), -(1.0)));
R1i.z = floatBitsToInt(-(intBitsToFloat(R124i.y)) + 1.0);
// 8
backupReg0i = R125i.x;
backupReg1i = R127i.y;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), uf_blockVS7[115].x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R127i.w)));
PV0iz = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
R126i.w = floatBitsToInt(uf_blockVS7[114].y + intBitsToFloat(backupReg1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 9
R123i.x = floatBitsToInt(intBitsToFloat(0x3edcf805) * intBitsToFloat(R127i.y) + 1.0);
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R124i.z)));
R125i.z = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(PS0i));
R123i.w = floatBitsToInt(intBitsToFloat(0x3d6ee04d) * intBitsToFloat(R127i.y) + intBitsToFloat(0x3f43b24e));
R125i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].x, intBitsToFloat(R1i.z)));
// 10
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) + uf_blockVS7[114].x);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R123i.w)) + 1.0);
R127i.z = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R127i.w)), intBitsToFloat(R123i.x)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), uf_blockVS7[115].z));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R1i.y)));
// 11
PV1ix = ((0.0 > intBitsToFloat(R124i.x))?-1:0);
PV1iy = ((-(intBitsToFloat(R126i.y)) == 0.0)?-1:0);
PV1iz = ((uf_blockVS7[114].w == 1.0)?-1:0);
R124i.w = floatBitsToInt(intBitsToFloat(R124i.y) + intBitsToFloat(R125i.y));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.y));
// 12
R127i.x = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(R127i.y));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS1i)));
R126i.w = ((PV1iz == 0)?(R125i.z):(R5i.w));
PS0i = floatBitsToInt(mul_nonIEEE(uf_blockVS7[97].x, intBitsToFloat(R2i.y)));
// 13
R2i.x = floatBitsToInt(uf_blockVS7[114].z + intBitsToFloat(R125i.w));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R0i.y)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), uf_blockVS7[113].y));
R123i.w = ((intBitsToFloat(R127i.w) > 0.0)?(PV0iz):(floatBitsToInt(-(intBitsToFloat(PV0iz)))));
R127i.w = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(R124i.w));
// 14
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(-(uf_blockVS7[96].y) + uf_blockVS7[97].y);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(R123i.w)) + intBitsToFloat(backupReg0i));
R125i.z = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(PV1iy));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R10i.z)));
R127i.y = floatBitsToInt(intBitsToFloat(PV1iz) + 0.0);
// 15
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(R126i.y))?1.0:0.0);
PV1iy = floatBitsToInt((intBitsToFloat(R126i.y) > 0.0)?1.0:0.0);
R127i.z = floatBitsToInt(-(uf_blockVS7[96].z) + uf_blockVS7[97].z);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R126i.w)));
R1i.w = ((intBitsToFloat(R124i.x) == 0.0)?-1:0);
// 16
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), uf_blockVS7[113].x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R127i.w)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1ix)));
R127i.w = floatBitsToInt(intBitsToFloat(R2i.w) * intBitsToFloat(0x3fc90fdb));
R125i.y = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(R125i.w));
// 17
PV1ix = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(R3i.w));
PV1iy = floatBitsToInt(-(intBitsToFloat(R2i.w)) + intBitsToFloat(PV0iz));
R10i.z = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(R124i.w));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(R3i.w));
R127i.z = floatBitsToInt(intBitsToFloat(PV0ix) + 0.0);
// 18
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3fc90fdb));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), uf_blockVS7[113].z));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R126i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV1ix)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV1iw)));
// 19
PV1ix = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iy) + 0.0);
PV1iz = floatBitsToInt(intBitsToFloat(R126i.y) + -(intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R126i.w)));
PS1i = floatBitsToInt(uf_blockVS7[96].y + intBitsToFloat(PV0iw));
// 20
R1i.x = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(PV1iw));
R123i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iz = floatBitsToInt(uf_blockVS7[96].z + intBitsToFloat(R127i.y));
R123i.w = ((R124i.y == 0)?(PV1iz):(0x40490fdb));
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R124i.z)));
// 21
backupReg0i = R123i.y;
R0i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].y, intBitsToFloat(R1i.z)));
R123i.y = ((R1i.w == 0)?(R123i.w):(R127i.w));
R1i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].z, intBitsToFloat(R1i.z)));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(R124i.z)));
R3i.x = floatBitsToInt(fract(intBitsToFloat(backupReg0i)));
// 22
tempi.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R2i.z)),-(intBitsToFloat(R4i.w)),-(intBitsToFloat(R11i.z)),intBitsToFloat(0x80000000)),vec4(-(intBitsToFloat(R2i.z)),-(intBitsToFloat(R4i.w)),-(intBitsToFloat(R11i.z)),0.0)));
PV0ix = tempi.x;
R3i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R10i.z = floatBitsToInt(intBitsToFloat(R10i.z) + -(intBitsToFloat(R123i.y)));
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(intBitsToFloat(R1i.x) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), uf_blockVS8[3].y));
R123i.z = floatBitsToInt(intBitsToFloat(R10i.z) * intBitsToFloat(0x3e22f983) + 0.5);
R2i.w = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(R0i.x));
tempResultf = 1.0 / sqrt(intBitsToFloat(R3i.y));
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.w)), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R11i.z)), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.z)), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), uf_blockVS7[13].z));
R127i.w = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
// 2
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(PV1iz)));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(PV1ix)));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(PV1iy)));
R1i.w = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(R1i.z));
R124i.z = floatBitsToInt(intBitsToFloat(R3i.x) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 3
R126i.x = floatBitsToInt(fract(intBitsToFloat(R126i.x)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.z = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(R13i.x));
R127i.w = floatBitsToInt(intBitsToFloat(R4i.w) + intBitsToFloat(R3i.y));
R126i.z = floatBitsToInt(intBitsToFloat(R11i.z) + intBitsToFloat(R10i.z));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.z),intBitsToFloat(R4i.w),intBitsToFloat(R11i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R2i.z),intBitsToFloat(R4i.w),intBitsToFloat(R11i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R126i.w = tempi.x;
R124i.w = floatBitsToInt(intBitsToFloat(R124i.z) * intBitsToFloat(0x3e22f983));
// 5
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.z),intBitsToFloat(R127i.w),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.z),intBitsToFloat(R127i.w),intBitsToFloat(R126i.z),0.0)));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
R124i.x = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(0x3e22f983));
// 6
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), uf_blockVS8[3].y));
R123i.z = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R126i.w = floatBitsToInt(sqrt(intBitsToFloat(R126i.w)));
// 7
R127i.w = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
R125i.x = floatBitsToInt(cos((intBitsToFloat(R124i.w))/0.1591549367));
// 8
R126i.z = floatBitsToInt(sin((intBitsToFloat(R124i.x))/0.1591549367));
// 9
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R126i.z)));
R127i.z = floatBitsToInt(sqrt(intBitsToFloat(R127i.x)));
// 10
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.w));
// 11
R3i.x = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS0i));
R126i.y = floatBitsToInt(sin((intBitsToFloat(R124i.w))/0.1591549367));
// 12
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R3i.x)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R126i.z)));
R124i.w = floatBitsToInt(cos((intBitsToFloat(R124i.x))/0.1591549367));
// 13
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R124i.w)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R124i.w)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.x), intBitsToFloat(R4i.y)));
R127i.y = floatBitsToInt(sin((intBitsToFloat(R127i.w))/0.1591549367));
// 14
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R127i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R125i.w)));
R11i.z = floatBitsToInt(-(intBitsToFloat(R127i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R124i.z)));
R124i.x = floatBitsToInt(cos((intBitsToFloat(R127i.w))/0.1591549367));
// 15
R0i.x = floatBitsToInt(-(intBitsToFloat(R124i.y)) + intBitsToFloat(PV0iy));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R124i.x)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R124i.x)));
R3i.w = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iw));
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R124i.x)));
// 16
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R124i.x)));
R1i.y = floatBitsToInt(intBitsToFloat(R124i.z) + intBitsToFloat(R126i.x));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R2i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R124i.y)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R0i.x)));
// 17
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R3i.w)));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R4i.y)) + intBitsToFloat(PS0i));
R3i.z = floatBitsToInt(-(intBitsToFloat(R125i.w)) + intBitsToFloat(PV0iw));
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R11i.z)) + intBitsToFloat(PV0iz));
// 18
R4i.z = floatBitsToInt(uf_blockVS8[3].z);
R4i.w = floatBitsToInt(uf_blockVS8[3].w);
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R1i.x)) + intBitsToFloat(PV1ix));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(uf_blockVS7[97].z, intBitsToFloat(R2i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockVS7[97].y, intBitsToFloat(R2i.y)));
// 1
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), uf_blockVS11[2].x));
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R1i.w));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(R2i.w));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z), uf_blockVS11[2].x));
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), uf_blockVS11[2].x));
// 2
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), uf_blockVS11[1].w));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PV1iz)));
// 3
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(R4i.w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R4i.z)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 4
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R3i.x)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(R3i.x)));
R1i.w = floatBitsToInt(intBitsToFloat(R13i.z) * intBitsToFloat(PS1i));
R1i.w = clampFI32(R1i.w);
// 5
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R0i.z)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R4i.x)));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV1iy)));
// 7
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R1i.x)) + intBitsToFloat(PV0ix));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R11i.z)) + intBitsToFloat(PV0iw));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R4i.y)) + intBitsToFloat(PV0iy));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R8i.x)) + intBitsToFloat(R123i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R1i.y)) + intBitsToFloat(R123i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R3i.z)) + intBitsToFloat(R123i.y));
// 9
R0i.x = floatBitsToInt(intBitsToFloat(R12i.x) + intBitsToFloat(R123i.x));
R2i.y = floatBitsToInt(intBitsToFloat(R11i.y) + intBitsToFloat(R123i.z));
R1i.z = floatBitsToInt(intBitsToFloat(R14i.z) + intBitsToFloat(R123i.w));
// 10
R127i.y = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(R124i.x));
PV0iz = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(R125i.w));
PV0iw = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(R126i.x));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0iz));
// 12
R0i.z = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV1ix));
// 13
predResult = (uf_blockVS11[5].y != 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0iy = floatBitsToInt(uf_blockVS8[5].w);
PV0iz = floatBitsToInt(uf_blockVS8[4].w);
// 1
PV1ix = floatBitsToInt(uf_blockVS8[6].w);
R127i.y = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(R0i.x)));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(R2i.y)));
R126i.y = floatBitsToInt(1.0 / uf_blockVS11[5].y);
// 2
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(R1i.z)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(R126i.y));
PV1ix = clampFI32(PV1ix);
// 6
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PV1ix)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(uf_blockVS8[4].w + uf_blockVS8[5].w);
PV0iy = floatBitsToInt(-(intBitsToFloat(R11i.y)) + intBitsToFloat(R2i.y));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R0i.y));
// 1
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), uf_blockVS11[0].w));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), uf_blockVS11[0].z));
PV1iz = floatBitsToInt(mul_nonIEEE(uf_blockVS11[1].z, uf_blockVS11[0].w));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iw)), intBitsToFloat(PV1iw)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PV1iz)));
PV0iz = ((0.0 > intBitsToFloat(PV1iw))?-1:0);
PV0iw = floatBitsToInt(uf_blockVS8[6].w + intBitsToFloat(R127i.x));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(PV1iw)));
// 3
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockVS8[2].x, uf_blockVS11[1].x));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3dd70a3d));
R0i.w = ((PV0iz == 0)?(PS0i):(PV0ix));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R127i.y));
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockVS11[1].y, uf_blockVS11[0].z));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R126i.x));
// 5
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PV0iy)));
PV1iz = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0ix));
// 6
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
// 7
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
// 8
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 9
R127i.z = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R127i.w = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R15i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R15i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R126i.z = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(sin((intBitsToFloat(R127i.z))/0.1591549367));
// 11
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R126i.y)));
PS1i = floatBitsToInt(cos((intBitsToFloat(R127i.z))/0.1591549367));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS1i)));
R0i.z = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV1iw));
PS0i = floatBitsToInt(sin((intBitsToFloat(R127i.w))/0.1591549367));
// 13
R0i.x = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R126i.x)));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(R126i.z)));
// 14
R1i.x = ((intBitsToFloat(PS1i) > 0.0)?-1:0);
R1i.z = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(PV1iw));
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R15i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R15i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 16
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 17
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(PS0i)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(PS0i)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.z), intBitsToFloat(PS0i)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), uf_blockVS14[1].w));
// 1
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockVS11[2].y, intBitsToFloat(PV0iz)));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(uf_blockVS14[1].x, intBitsToFloat(PV1iy)));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockVS14[1].z, intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS14[1].y, intBitsToFloat(PV1iy)));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.x), intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.x), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.x), intBitsToFloat(PV0iz)));
// 4
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV1iy));
R0i.y = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV1ix));
R0i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV1iw));
// 5
R4i.x = floatBitsToInt(-(intBitsToFloat(R12i.x)) + intBitsToFloat(R0i.x));
R4i.y = floatBitsToInt(-(intBitsToFloat(R11i.y)) + intBitsToFloat(R0i.y));
R1i.z = floatBitsToInt(-(intBitsToFloat(R14i.z)) + intBitsToFloat(R0i.z));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R1i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R1i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 7
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 8
PV0iw = ((intBitsToFloat(PS1i) > 0.0)?-1:0);
// 9
R0i.w = ((PV0iw == 0)?(0):(R1i.x));
// 10
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
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R1i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R1i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), uf_blockVS7[95].x));
// 1
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.z), uf_blockVS7[95].x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), uf_blockVS7[95].x));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PS1i)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.z)));
// 5
R0i.x = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV0iy));
R0i.y = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(PV0ix));
R0i.z = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV0iw));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R6i.x = floatBitsToInt(intBitsToFloat(R13i.x) + intBitsToFloat(R0i.x));
R8i.y = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(R0i.y));
R6i.z = floatBitsToInt(intBitsToFloat(R10i.z) + intBitsToFloat(R0i.z));
R4i.w = floatBitsToInt(intBitsToFloat(R11i.y) + intBitsToFloat(R3i.y));
R127i.w = 0x3f800000;
// 1
R20i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R8i.x)) + intBitsToFloat(R2i.x));
R20i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R1i.y)) + intBitsToFloat(R12i.y));
R20i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R3i.z)) + intBitsToFloat(R5i.z));
R0i.w = floatBitsToInt(uf_blockVS7[60].x);
R5i.x = floatBitsToInt(uf_blockVS7[60].y);
// 2
R13i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R8i.y),intBitsToFloat(R6i.z),intBitsToFloat(R127i.w)),vec4(uf_blockVS6[8].x,uf_blockVS6[8].y,uf_blockVS6[8].z,uf_blockVS6[8].w)));
PV0iy = R13i.x;
PV0iz = R13i.x;
PV0iw = R13i.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R8i.y),intBitsToFloat(R6i.z),intBitsToFloat(R127i.w)),vec4(uf_blockVS6[9].x,uf_blockVS6[9].y,uf_blockVS6[9].z,uf_blockVS6[9].w)));
PV1ix = tempi.x;
R13i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R8i.y),intBitsToFloat(R6i.z),intBitsToFloat(R127i.w)),vec4(uf_blockVS6[10].x,uf_blockVS6[10].y,uf_blockVS6[10].z,uf_blockVS6[10].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R13i.z = tempi.x;
PV0iw = tempi.x;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R8i.y),intBitsToFloat(R6i.z),intBitsToFloat(R127i.w)),vec4(uf_blockVS6[11].x,uf_blockVS6[11].y,uf_blockVS6[11].z,uf_blockVS6[11].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R13i.w = tempi.x;
// 6
PV0ix = PV1ix;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
R5i.z = floatBitsToInt(uf_blockVS7[60].z);
// 7
R127i.x = floatBitsToInt(-(uf_blockVS7[68].x) + uf_blockVS7[69].x);
R123i.z = floatBitsToInt(intBitsToFloat(R13i.z) * 0.0 + intBitsToFloat(PV0ix));
R16i.w = floatBitsToInt(intBitsToFloat(R13i.z) * 0.0 + intBitsToFloat(R13i.w));
R16i.z = floatBitsToInt(intBitsToFloat(R13i.z) * 0.5 + intBitsToFloat(PV0ix));
// 8
R16i.x = floatBitsToInt(intBitsToFloat(R13i.x) * 0.5 + intBitsToFloat(R123i.z));
R16i.y = floatBitsToInt(intBitsToFloat(R13i.y) * -(0.5) + intBitsToFloat(R123i.z));
PV0iz = floatBitsToInt(-(uf_blockVS7[68].w) + uf_blockVS7[69].w);
R11i.y = floatBitsToInt(1.0 / intBitsToFloat(R16i.w));
// 9
R126i.x = floatBitsToInt(-(uf_blockVS7[69].x) + uf_blockVS7[70].x);
PV1iw = floatBitsToInt(intBitsToFloat(R16i.z) * intBitsToFloat(R11i.y));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 10
R0i.x = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS1i));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),uf_blockVS6[18].w) + -(uf_blockVS6[18].y));
// 11
PV1ix = floatBitsToInt(-(uf_blockVS7[69].w) + uf_blockVS7[70].w);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.y));
// 12
R10i.y = floatBitsToInt(-(uf_blockVS6[18].z) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 13
R5i.y = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(PS0i));
R127i.z = floatBitsToInt(-(uf_blockVS7[70].x) + uf_blockVS7[71].x);
// 14
PV0iy = floatBitsToInt(-(uf_blockVS7[70].w) + uf_blockVS7[71].w);
// 15
R2i.x = floatBitsToInt(uf_blockVS7[76].y);
R1i.y = floatBitsToInt(uf_blockVS7[76].x);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 16
R1i.x = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS1i));
}
if( activeMaskStackC[3] == true ) {
// 0
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), uf_blockVS8[0].x));
PV0iy = floatBitsToInt((uf_blockVS7[8].y > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > uf_blockVS7[8].y)?1.0:0.0);
PS0i = floatBitsToInt(1.0 / uf_blockVS7[8].y);
// 1
R126i.x = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(intBitsToFloat(R5i.w) * intBitsToFloat(PS0i));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), uf_blockVS8[0].z));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), uf_blockVS8[0].y));
// 2
PV0ix = floatBitsToInt((uf_blockVS7[8].w > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt((0.0 > uf_blockVS7[8].w)?1.0:0.0);
R127i.z = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),uf_blockVS7[9].z) + intBitsToFloat(PV1iy));
// 3
R127i.x = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[8].w);
// 4
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV1iy)));
PV0iz = floatBitsToInt(intBitsToFloat(R5i.w) * intBitsToFloat(PS1i));
// 5
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),uf_blockVS7[10].x) + intBitsToFloat(PV0iz));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w),intBitsToFloat(R127i.z)) + intBitsToFloat(PV0iy));
// 6
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R127i.w = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
// 7
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV0ix)));
// 8
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w),intBitsToFloat(R127i.w)) + intBitsToFloat(PV1iz));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R0i.w) + -(uf_blockVS7[68].w));
PV0iy = floatBitsToInt(intBitsToFloat(R0i.w) + -(uf_blockVS7[69].w));
// 1
R127i.x = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.y = ((intBitsToFloat(PV0ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R0i.x)) + uf_blockVS7[68].x);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R5i.y)) + uf_blockVS7[69].x);
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R0i.w) + -(uf_blockVS7[70].w));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
PV0iz = floatBitsToInt(intBitsToFloat(R0i.w) + -(uf_blockVS7[71].w));
PV0iw = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
// 3
backupReg0i = R127i.y;
R126i.x = ((intBitsToFloat(PV0ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.y = ((intBitsToFloat(PV0iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R1i.x)) + uf_blockVS7[70].x);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iw)));
PS1i = floatBitsToInt(mul_nonIEEE(uf_blockVS7[68].x, intBitsToFloat(PV0iy)));
// 4
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
R2i.y = floatBitsToInt(uf_blockVS7[76].z);
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV1iw)) + intBitsToFloat(PS1i));
R125i.x = floatBitsToInt(intBitsToFloat(R0i.y) + -(uf_blockVS7[84].w));
// 5
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV0ix)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iz)));
R127i.z = ((intBitsToFloat(R125i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.w = floatBitsToInt(-(uf_blockVS7[84].x) + uf_blockVS7[85].x);
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV1iy)) + intBitsToFloat(R126i.w));
R125i.y = floatBitsToInt(intBitsToFloat(R0i.y) + -(uf_blockVS7[85].w));
PV0iz = floatBitsToInt(-(uf_blockVS7[84].w) + uf_blockVS7[85].w);
R127i.w = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
// 7
backupReg0i = R127i.x;
R127i.x = ((intBitsToFloat(R125i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.y = floatBitsToInt(-(uf_blockVS7[85].x) + uf_blockVS7[86].x);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(backupReg0i)) + intBitsToFloat(R123i.x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 8
PV0ix = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(PS1i));
R124i.y = floatBitsToInt(intBitsToFloat(R0i.y) + -(uf_blockVS7[86].w));
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[71].x,intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.z));
// 9
backupReg0i = R123i.w;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iz)));
R5i.y = ((intBitsToFloat(R124i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iz = floatBitsToInt(mul_nonIEEE(uf_blockVS7[84].x, intBitsToFloat(R127i.w)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(PV0ix)) + uf_blockVS7[84].x);
R14i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), uf_blockVS8[0].w));
// 10
PV0ix = floatBitsToInt(-(uf_blockVS7[85].w) + uf_blockVS7[86].w);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(PV1ix)) + intBitsToFloat(PV1iz));
PV0iw = floatBitsToInt(-(intBitsToFloat(R5i.y)) + 1.0);
// 11
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV0iw)));
R127i.w = floatBitsToInt(-(uf_blockVS7[86].x) + uf_blockVS7[87].x);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 12
PV0ix = floatBitsToInt(-(uf_blockVS7[86].w) + uf_blockVS7[87].w);
PV0iz = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(intBitsToFloat(R0i.y) + -(uf_blockVS7[87].w));
// 13
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), uf_blockVS8[1].x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(PV0iz)) + uf_blockVS7[85].x);
R126i.z = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 14
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(R127i.z)) + intBitsToFloat(R127i.y));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), uf_blockVS8[1].y));
// 15
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PV0iz)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), uf_blockVS8[1].z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(PV0iy)) + uf_blockVS7[86].x);
// 16
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(PV1ix)) + intBitsToFloat(R127i.x));
// 17
R5i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[87].x,intBitsToFloat(R126i.z)) + intBitsToFloat(R123i.w));
}
if( activeMaskStackC[3] == true ) {
// 0
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), uf_blockVS7[59].x));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), uf_blockVS7[59].x));
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), uf_blockVS7[59].x));
// 1
R15i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R0i.x)));
R15i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R0i.y)));
R15i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R1i.z)));
R15i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), uf_blockVS8[1].w));
PS1i = ((intBitsToFloat(R7i.x) > 0.5)?-1:0);
// 2
PV0ix = ((intBitsToFloat(R7i.y) > 0.5)?-1:0);
PV0iy = ((intBitsToFloat(R7i.z) > 0.5)?-1:0);
R5i.z = ((PS1i == 0)?(R9i.x):(R8i.w));
PV0iw = ((intBitsToFloat(R7i.w) > 0.5)?-1:0);
R126i.z = ((intBitsToFloat(R7i.y) > 0.5)?-1:0);
// 3
R2i.x = ((PV0iw == 0)?(R9i.y):(R9i.z));
R2i.y = ((PV0ix == 0)?(R9i.y):(R9i.z));
R0i.z = R9i.y;
R0i.w = ((PV0iy == 0)?(R9i.x):(R8i.w));
R0i.x = R8i.w;
// 4
R8i.x = floatBitsToInt(uf_blockVS8[3].x);
R5i.y = ((R126i.z == 0)?(R9i.x):(R0i.x));
R1i.w = ((intBitsToFloat(R7i.z) > 0.5)?-1:0);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iy = floatBitsToInt(uf_blockVS7[5].x) & 0x80000;
PV0iw = floatBitsToInt(uf_blockVS7[5].x) & 0x100000;
// 1
PV1ix = (PV0iw == 0x100000)?-1:0;
PV1iy = floatBitsToInt(uf_blockVS7[5].x) & 0x200000;
PV1iz = floatBitsToInt(uf_blockVS7[5].x) & 0x400000;
PV1iw = (PV0iy == 0x80000)?-1:0;
// 2
PV0ix = (PV1iz == 0x400000)?-1:0;
R6i.y = ((PV1iw == 0)?(R9i.x):(R5i.z));
PV0iz = (PV1iy == 0x200000)?-1:0;
R2i.w = ((PV1ix == 0)?(R9i.y):(R2i.y));
PS0i = floatBitsToInt(uf_blockVS7[5].x) & 0x800000;
// 3
R4i.x = ((PV0iz == 0)?(R9i.x):(R0i.w));
PV1iy = floatBitsToInt(uf_blockVS7[5].x) & 0x1000000;
R3i.z = ((PV0ix == 0)?(R9i.y):(R2i.x));
PV1iw = (PS0i == 0x800000)?-1:0;
PS1i = floatBitsToInt(uf_blockVS7[5].y) & int(1);
// 4
R127i.x = (PV1iy == 0x1000000)?-1:0;
R4i.y = (int(1) != PS1i)?-1:0;
R126i.z = ((PV1iw == 0)?(R9i.y):(R0i.z));
R127i.w = ((PV1iw == 0)?(R9i.x):(R5i.y));
R125i.z = int(uf_blockVS7[26].x);
// 5
PV1ix = floatBitsToInt(uf_blockVS7[5].x) & 0x100;
R123i.y = ((R1i.w == 0)?(R127i.w):(R127i.w));
PV1iz = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R124i.w = ((R4i.y == 0)?(R7i.x):(R7i.y));
R124i.y = int(uf_blockVS7[26].y);
// 6
R123i.x = ((R1i.w == 0)?(R126i.z):(PV1iz));
PV0iy = floatBitsToInt(uf_blockVS7[5].x) & 0x200;
R127i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x400;
R3i.w = ((R127i.x == 0)?(R127i.w):(R123i.y));
PS0i = floatBitsToInt(float(PV1ix));
// 7
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R4i.z = ((R127i.x == 0)?(R126i.z):(R123i.x));
R126i.w = floatBitsToInt(uf_blockVS7[5].x) & 0x800;
PS1i = floatBitsToInt(float(PV0iy));
// 8
PV0ix = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R1i.w = int(-1) + R125i.z;
PS0i = floatBitsToInt(float(R127i.z));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R127i.w = int(intBitsToFloat(PV0ix));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iy)));
PV0iz = 0 - R127i.w;
R125i.w = int(intBitsToFloat(PV1ix));
// 11
R127i.y = max(R127i.w, PV0iz);
PV1iz = 0 - R125i.w;
R127i.w = int(intBitsToFloat(PV0ix));
// 12
backupReg0i = R126i.w;
R0i.y = max(R125i.w, PV1iz);
PV0iz = 0 - R127i.w;
R126i.w = floatBitsToInt(uf_blockVS7[5].x) & 0x4000000;
PS0i = floatBitsToInt(float(backupReg0i));
// 13
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R1i.y = max(R127i.w, PV0iz);
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R125i.x = floatBitsToInt(float(R125i.z));
// 14
backupReg0i = R124i.y;
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1ix)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R125i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(R125i.x)));
R127i.x = floatBitsToInt(float(backupReg0i));
// 15
PV1iz = floatBitsToInt(intBitsToFloat(R11i.x) * intBitsToFloat(PV0iw));
R124i.w = int(intBitsToFloat(PV0ix));
// 16
PV0iz = 0 - R124i.w;
PS0i = int(intBitsToFloat(PV1iz));
// 17
R125i.y = max(R124i.w, PV0iz);
R1i.x = R127i.y * PS0i;
// 18
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 19
PV1iz = floatBitsToInt(intBitsToFloat(R5i.w) * intBitsToFloat(PS0i));
R0i.w = floatBitsToInt(float(R125i.z));
// 20
R2i.z = floatBitsToInt(abs(intBitsToFloat(R0i.w)));
R9i.y = int(intBitsToFloat(PV1iz));
// 21
PS1i = floatBitsToInt(float(R9i.y));
// 22
PV0iw = floatBitsToInt(-(intBitsToFloat(R125i.x)) + intBitsToFloat(PS1i));
R5i.z = floatBitsToInt(float(R9i.y));
// 23
R127i.y = floatBitsToInt(abs(intBitsToFloat(R5i.z)));
R123i.z = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
R3i.y = floatBitsToInt(1.0 / abs(intBitsToFloat(R0i.w)));
// 24
PV0ix = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R5i.z)), intBitsToFloat(R3i.y)));
PS0i = int(intBitsToFloat(R123i.z));
// 25
R2i.x = int(1) - PS0i;
PV1iw = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
R2i.y = PS0i * R1i.w;
// 26
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iw)),intBitsToFloat(R2i.z)) + intBitsToFloat(R127i.y));
PS0i = floatBitsToInt(float(R126i.w));
// 27
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(R125i.x) >= abs(intBitsToFloat(R0i.w)))?1.0:0.0);
PV1iw = floatBitsToInt(-(abs(intBitsToFloat(R0i.w))) + intBitsToFloat(R125i.x));
R1i.z = int(intBitsToFloat(R124i.y));
// 28
R5i.y = ((intBitsToFloat(PV1iz) == 0.0)?(R125i.x):(PV1iw));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1ix)));
R1i.w = R125i.y * R1i.z;
// 29
R9i.x = floatBitsToInt(abs(intBitsToFloat(R0i.w)) + intBitsToFloat(R5i.y));
R0i.z = int(intBitsToFloat(PV0iw));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iy = 0 - R0i.z;
R123i.w = ((-(intBitsToFloat(R5i.y)) > 0.0)?(R9i.x):(R5i.y));
// 1
PV1ix = max(R0i.z, PV0iy);
R123i.z = ((-(intBitsToFloat(R5i.z)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.w)))):(R123i.w));
// 2
R123i.y = ((intBitsToFloat(R0i.w) == 0.0)?(R5i.z):(R123i.z));
PS0i = PV1ix * R1i.z;
// 3
R125i.x = R9i.y + PS0i;
PS1i = int(intBitsToFloat(R123i.y));
// 4
PS0i = R2i.x * PS1i;
// 5
PV1ix = PS0i + R2i.y;
R125i.z = R1i.y * R125i.x;
// 6
PS0i = R0i.y * PV1ix;
// 7
PV1iw = PS0i + R1i.x;
// 8
PV0iz = R125i.z + PV1iw;
// 9
PV1iy = R1i.w + PV0iz;
// 10
R127i.x = floatBitsToInt(float(PV1iy));
// 11
R125i.y = floatBitsToInt(abs(intBitsToFloat(R127i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), abs(intBitsToFloat(R127i.x))));
// 12
PV0iz = floatBitsToInt(trunc(intBitsToFloat(PV1iw)));
// 13
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iz)),intBitsToFloat(R2i.z)) + intBitsToFloat(R125i.y));
// 14
PV0iz = floatBitsToInt((intBitsToFloat(R125i.x) >= abs(intBitsToFloat(R0i.w)))?1.0:0.0);
PV0iw = floatBitsToInt(-(abs(intBitsToFloat(R0i.w))) + intBitsToFloat(R125i.x));
// 15
R125i.y = ((intBitsToFloat(PV0iz) == 0.0)?(R125i.x):(PV0iw));
// 16
PV0ix = floatBitsToInt(abs(intBitsToFloat(R0i.w)) + intBitsToFloat(R125i.y));
// 17
R123i.w = ((-(intBitsToFloat(R125i.y)) > 0.0)?(PV0ix):(R125i.y));
// 18
R123i.z = ((-(intBitsToFloat(R127i.x)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.w)))):(R123i.w));
// 19
R123i.y = ((intBitsToFloat(R0i.w) == 0.0)?(R127i.x):(R123i.z));
// 20
R127i.x = int(intBitsToFloat(R123i.y));
// 21
R126i.w = floatBitsToInt(float(R127i.x));
// 22
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(R126i.w))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(R126i.w) > 0.0)?1.0:0.0);
R127i.z = floatBitsToInt(float(R127i.x));
// 23
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(abs(intBitsToFloat(R127i.z)) * 0.25);
R124i.w = floatBitsToInt(abs(intBitsToFloat(R127i.z)));
// 24
PV0ix = floatBitsToInt(trunc(intBitsToFloat(PV1iy)));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * 0.5 + intBitsToFloat(R126i.w));
// 25
PV1ix = floatBitsToInt(intBitsToFloat(R123i.w) * 0.25);
R125i.z = floatBitsToInt(-(intBitsToFloat(PV0ix)) * 4.0 + intBitsToFloat(R124i.w));
// 26
PV0ix = floatBitsToInt((intBitsToFloat(R125i.z) >= 4.0)?1.0:0.0);
PV0iy = floatBitsToInt(intBitsToFloat(R125i.z) + -4.0);
PV0iz = floatBitsToInt(trunc(intBitsToFloat(PV1ix)));
// 27
R124i.w = ((intBitsToFloat(PV0ix) == 0.0)?(R125i.z):(PV0iy));
PS1i = int(intBitsToFloat(PV0iz));
// 28
PV0iz = floatBitsToInt(intBitsToFloat(R124i.w) + 4.0);
R0i.w = PS1i + 0x1b;
PS0i = int(uf_blockVS7[48].z);
// 29
R123i.y = ((-(intBitsToFloat(R124i.w)) > 0.0)?(PV0iz):(R124i.w));
R124i.w = floatBitsToInt(float(PS0i));
// 30
R123i.x = ((-(intBitsToFloat(R127i.z)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.y)))):(R123i.y));
PV0iy = floatBitsToInt((0.0 >= abs(intBitsToFloat(R124i.w)))?1.0:0.0);
PV0iz = floatBitsToInt(-(abs(intBitsToFloat(R124i.w))) + 0.0);
// 31
R127i.x = ((intBitsToFloat(PV0iy) == 0.0)?(0):(PV0iz));
PS1i = int(intBitsToFloat(R123i.x));
// 32
R125i.x = 0xfffffffd + PS1i;
R125i.y = 0xfffffffe + PS1i;
PV0iz = int(-1) + PS1i;
PV0iw = floatBitsToInt(abs(intBitsToFloat(R124i.w)) + intBitsToFloat(R127i.x));
PS0i = floatBitsToInt(float(PS1i));
// 33
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R123i.z = ((-(intBitsToFloat(R127i.x)) > 0.0)?(PV0iw):(R127i.x));
PS1i = floatBitsToInt(float(PV0iz));
// 34
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R125i.z = ((intBitsToFloat(R124i.w) == 0.0)?(0):(R123i.z));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(float(R125i.y));
// 35
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R127i.z = int(intBitsToFloat(PV0iw));
// 36
PV0ix = 0 - R127i.z;
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1ix)));
R125i.y = int(intBitsToFloat(PV1iz));
// 37
PV1ix = max(R127i.z, PV0ix);
PV1iy = 0 - R125i.y;
R127i.x = int(intBitsToFloat(PV0iy));
// 38
R9i.x = int(1) - PV1ix;
PV0iy = 0 - R127i.x;
PV0iw = max(R125i.y, PV1iy);
PS0i = floatBitsToInt(float(R125i.x));
// 39
R2i.x = int(1) - PV0iw;
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iz = max(R127i.x, PV0iy);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R5i.x = int(intBitsToFloat(R125i.z));
// 40
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iw)));
R3i.y = int(1) - PV1iz;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R124i.w));
// 41
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
R124i.w = int(intBitsToFloat(PV0ix));
// 42
PV0iy = floatBitsToInt(trunc(intBitsToFloat(PV1iz)));
PV0iz = 0 - R124i.w;
R1i.w = floatBitsToInt(1.0 / uf_blockVS7[48].z);
// 43
PV1iy = max(R124i.w, PV0iz);
R3i.x = int(intBitsToFloat(PV0iy));
// 44
R1i.x = int(1) - PV1iy;
}
if( activeMaskStackC[3] == true ) {
R0i.xyzw = floatBitsToInt(uf_blockVS7[R0i.w].xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), uf_blockVS7[45].y));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
R124i.y = ((R4i.y == 0)?(0):(int(1)));
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].x, intBitsToFloat(R1i.w)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), uf_blockVS7[45].x));
R124i.w = floatBitsToInt(intBitsToFloat(R124i.w) * 2.0);
R126i.w = R1i.x * R0i.w;
// 1
R124i.x = (R124i.y == int(1))?-1:0;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R127i.z)) + -(0.5));
PV1iz = floatBitsToInt(uf_blockVS7[44].z + uf_blockVS7[45].x);
PV1iw = floatBitsToInt(uf_blockVS7[44].w + uf_blockVS7[45].y);
R125i.z = R3i.y * R0i.z;
// 2
PV0ix = floatBitsToInt(uf_blockVS7[46].x + uf_blockVS7[46].z);
PV0iy = floatBitsToInt(-(intBitsToFloat(R124i.w)) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(uf_blockVS7[46].y + uf_blockVS7[46].w);
R125i.y = R2i.x * R0i.y;
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),uf_blockVS7[46].z) + intBitsToFloat(PV0ix));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.w)),uf_blockVS7[44].x) + -(intBitsToFloat(PV0iy)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),uf_blockVS7[46].w) + intBitsToFloat(PV0iw));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),uf_blockVS7[44].y) + intBitsToFloat(PV0iz));
PS1i = R9i.x * R0i.x;
// 4
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),uf_blockVS7[45].z) + intBitsToFloat(R123i.x));
PV0iy = (R124i.y == 0x2)?-1:0;
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),uf_blockVS7[45].w) + intBitsToFloat(R123i.z));
PV0iw = R125i.y + PS1i;
PS0i = floatBitsToInt(1.0 / uf_blockVS7[48].w);
// 5
R125i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].y, intBitsToFloat(PS0i)));
R123i.y = ((PV0iy == 0)?(R7i.x):(R7i.z));
PV1iz = R125i.z + PV0iw;
R127i.w = ((PV0iy == 0)?(R7i.y):(R7i.x));
PS1i = floatBitsToInt(float(R5i.x));
// 6
backupReg0i = R127i.z;
backupReg1i = R127i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R125i.x)) + -(0.5));
R127i.y = R126i.w + PV1iz;
R127i.z = ((R124i.x == 0)?(R123i.y):(R7i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(PS1i)) + intBitsToFloat(backupReg1i));
PS0i = floatBitsToInt(float(R3i.x));
// 7
backupReg0i = R126i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.x)),intBitsToFloat(PS0i)) + intBitsToFloat(R124i.w));
R126i.y = ((R124i.x == 0)?(R127i.w):(R7i.z));
R125i.z = ((R124i.x == 0)?(R7i.y):(R7i.z));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(backupReg0i)) + intBitsToFloat(R123i.w));
PS1i = int(uf_blockVS7[53].z);
// 8
backupReg0i = R126i.x;
R126i.x = ((R124i.x == 0)?(R7i.x):(R7i.y));
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockVS7[50].x, intBitsToFloat(R127i.z)));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(backupReg0i)) + -(intBitsToFloat(R123i.x)));
PV0iw = floatBitsToInt(uf_blockVS7[49].z + uf_blockVS7[50].x);
R126i.w = floatBitsToInt(float(PS1i));
// 9
backupReg0i = R126i.y;
R124i.x = floatBitsToInt(-(intBitsToFloat(PV0iy)) + intBitsToFloat(PV0iw));
R126i.y = floatBitsToInt(abs(intBitsToFloat(R126i.w)));
PV1iz = floatBitsToInt(uf_blockVS7[49].w + uf_blockVS7[50].y);
PV1iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[50].y, intBitsToFloat(backupReg0i)));
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 2.0);
R127i.z = floatBitsToInt(float(R127i.y));
// 10
backupReg0i = R127i.y;
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(R127i.z))?1.0:0.0);
R127i.y = floatBitsToInt(-(intBitsToFloat(PV1iw)) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt((intBitsToFloat(R127i.z) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt(uf_blockVS7[51].x + uf_blockVS7[51].z);
R7i.y = floatBitsToInt(float(backupReg0i));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0ix)));
R125i.y = floatBitsToInt(abs(intBitsToFloat(R7i.y)));
PV1iz = floatBitsToInt(uf_blockVS7[51].y + uf_blockVS7[51].w);
R124i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[51].z,intBitsToFloat(R126i.x)) + intBitsToFloat(PV0iw));
PS1i = floatBitsToInt(1.0 / abs(intBitsToFloat(R126i.w)));
// 12
backupReg0i = R127i.z;
PV0ix = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R7i.y)), intBitsToFloat(PS1i)));
R124i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[51].w,intBitsToFloat(R125i.z)) + intBitsToFloat(PV1iz));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.w)),uf_blockVS7[49].x) + -(intBitsToFloat(R124i.x)));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * 0.5 + intBitsToFloat(backupReg0i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.w));
// 13
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),uf_blockVS7[49].y) + intBitsToFloat(R127i.y));
PV1iy = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(PS0i));
PV1iz = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
R2i.w = floatBitsToInt(intBitsToFloat(R127i.w) + 0.5);
PS1i = floatBitsToInt(1.0 / uf_blockVS7[53].z);
// 14
backupReg0i = R125i.y;
PV0ix = floatBitsToInt(trunc(intBitsToFloat(PV1iy)));
R125i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[53].x, intBitsToFloat(PS1i)));
R7i.z = floatBitsToInt(intBitsToFloat(R126i.z) + 0.5);
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iz)),intBitsToFloat(R126i.y)) + intBitsToFloat(backupReg0i));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[53].w);
// 15
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),uf_blockVS7[50].z) + intBitsToFloat(R124i.w));
PV1iy = floatBitsToInt((intBitsToFloat(R127i.w) >= abs(intBitsToFloat(R126i.w)))?1.0:0.0);
PV1iz = floatBitsToInt(-(abs(intBitsToFloat(R126i.w))) + intBitsToFloat(R127i.w));
R124i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[53].y, intBitsToFloat(PS0i)));
PS1i = int(intBitsToFloat(PV0ix));
// 16
R126i.x = ((intBitsToFloat(PV1iy) == 0.0)?(R127i.w):(PV1iz));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),uf_blockVS7[50].w) + intBitsToFloat(R124i.y));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R125i.y)) + -(0.5));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R124i.w)) + -(0.5));
PS0i = floatBitsToInt(float(PS1i));
// 17
PV1ix = floatBitsToInt(abs(intBitsToFloat(R126i.w)) + intBitsToFloat(R126i.x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), uf_blockVS7[58].y));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), uf_blockVS7[58].x));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.w)),intBitsToFloat(PS0i)) + intBitsToFloat(R124i.x));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[58].z);
// 18
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(PV1iz)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(R127i.w)) + -(intBitsToFloat(R123i.w)));
R123i.z = ((-(intBitsToFloat(R126i.x)) > 0.0)?(PV1ix):(R126i.x));
R7i.w = floatBitsToInt(intBitsToFloat(R9i.w) + 0.0);
PS0i = floatBitsToInt(1.0 / uf_blockVS7[58].w);
// 19
R5i.x = floatBitsToInt(intBitsToFloat(R123i.y) + 0.5);
R123i.y = ((-(intBitsToFloat(R7i.y)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.z)))):(R123i.z));
R125i.z = floatBitsToInt(intBitsToFloat(R7i.w) + -(uf_blockVS7[104].w));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R126i.y)));
PS1i = floatBitsToInt(-(uf_blockVS7[104].w) + uf_blockVS7[105].w);
// 20
R123i.x = ((intBitsToFloat(R126i.w) == 0.0)?(R7i.y):(R123i.y));
PV0iy = floatBitsToInt(-(uf_blockVS7[104].x) + uf_blockVS7[105].x);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 21
R126i.x = floatBitsToInt(-(uf_blockVS7[105].w) + uf_blockVS7[106].w);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
R126i.w = floatBitsToInt(intBitsToFloat(R7i.w) + -(uf_blockVS7[105].w));
PS1i = int(intBitsToFloat(R123i.x));
// 22
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(PV1iy)) + uf_blockVS7[104].x);
R0i.y = floatBitsToInt(intBitsToFloat(R7i.w) + -(uf_blockVS7[106].w));
PS0i = floatBitsToInt(float(PS1i));
// 23
PV1ix = floatBitsToInt(-(uf_blockVS7[105].x) + uf_blockVS7[106].x);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.z));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 24
R4i.x = floatBitsToInt(-(uf_blockVS7[106].x) + uf_blockVS7[107].x);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R126i.z)) + intBitsToFloat(R123i.z));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(PS1i));
// 25
R3i.x = floatBitsToInt(intBitsToFloat(R123i.z) + 0.5);
R7i.y = ((intBitsToFloat(R125i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PV0iw)) + uf_blockVS7[105].x);
R3i.w = floatBitsToInt(intBitsToFloat(R7i.w) + -(uf_blockVS7[107].w));
R4i.z = ((intBitsToFloat(R126i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = ((intBitsToFloat(R3i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.y = ((intBitsToFloat(R0i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iz = floatBitsToInt(-(intBitsToFloat(R4i.z)) + 1.0);
PV0iw = floatBitsToInt(-(uf_blockVS7[106].w) + uf_blockVS7[107].w);
R124i.x = floatBitsToInt(-(intBitsToFloat(R7i.y)) + 1.0);
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
PV1iy = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
R125i.z = floatBitsToInt(-(uf_blockVS7[107].x) + uf_blockVS7[108].x);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 2
PV0ix = floatBitsToInt(-(uf_blockVS7[107].w) + uf_blockVS7[108].w);
PV0iy = floatBitsToInt(intBitsToFloat(R4i.x) * intBitsToFloat(PS1i));
R126i.z = floatBitsToInt(intBitsToFloat(R7i.w) + -(uf_blockVS7[108].w));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PV1iy)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV1ix)));
// 3
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(PV0iy)) + uf_blockVS7[106].x);
R125i.y = ((intBitsToFloat(R126i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.w = floatBitsToInt(intBitsToFloat(R7i.w) + -(uf_blockVS7[109].w));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 4
backupReg0i = R125i.z;
R126i.x = floatBitsToInt(-(uf_blockVS7[108].x) + uf_blockVS7[109].x);
PV0iy = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
R125i.z = ((intBitsToFloat(R126i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iw = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(PS1i));
R17i.w = 0;
// 5
PV1ix = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
R0i.y = floatBitsToInt(intBitsToFloat(R7i.w) + -(uf_blockVS7[110].w));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(PV0iw)) + uf_blockVS7[107].x);
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV0iy)));
// 6
R127i.x = ((intBitsToFloat(R0i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(-(uf_blockVS7[108].w) + uf_blockVS7[109].w);
PS0i = floatBitsToInt(intBitsToFloat(R16i.z) * intBitsToFloat(R16i.z));
// 7
PV1ix = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R123i.y = floatBitsToInt((intBitsToFloat(R16i.y) * intBitsToFloat(R16i.y) + intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(-(uf_blockVS7[109].x) + uf_blockVS7[110].x);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 8
backupReg0i = R125i.z;
PV0ix = floatBitsToInt(-(uf_blockVS7[109].w) + uf_blockVS7[110].w);
PV0iy = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(PS1i));
R125i.z = floatBitsToInt((intBitsToFloat(R16i.x) * intBitsToFloat(R16i.x) + intBitsToFloat(R123i.y)));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1ix)));
// 9
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(PV0iy)) + uf_blockVS7[108].x);
PV1iy = floatBitsToInt(intBitsToFloat(R7i.w) + -(uf_blockVS7[111].w));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 10
R126i.x = floatBitsToInt(-(uf_blockVS7[110].x) + uf_blockVS7[111].x);
R3i.y = ((intBitsToFloat(PV1iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS1i));
tempResultf = 1.0 / sqrt(intBitsToFloat(R125i.z));
R127i.z = floatBitsToInt(tempResultf);
// 11
PV1ix = floatBitsToInt(-(intBitsToFloat(R3i.y)) + 1.0);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.x), intBitsToFloat(R127i.z)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PV0iw)) + uf_blockVS7[109].x);
PV1iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[104].x, intBitsToFloat(R124i.x)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y), intBitsToFloat(R127i.z)));
// 12
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.z), intBitsToFloat(R127i.z)));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV1ix)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(R127i.w)) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(-(uf_blockVS7[110].w) + uf_blockVS7[111].w);
R127i.w = 0;
// 13
R127i.x = floatBitsToInt(uf_blockVS6[0].y);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R124i.w)) + intBitsToFloat(R123i.z));
R127i.z = floatBitsToInt(uf_blockVS6[1].y);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 14
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R126i.y)) + intBitsToFloat(R123i.y));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(uf_blockVS6[2].y);
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.y),intBitsToFloat(R124i.y),intBitsToFloat(R124i.x),intBitsToFloat(R124i.x)),vec4(-(intBitsToFloat(R127i.x)),-(intBitsToFloat(R127i.z)),-(intBitsToFloat(PV0iz)),-(intBitsToFloat(R127i.w)))));
PV1ix = tempi.x;
R125i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R125i.w)) + intBitsToFloat(R123i.x));
// 16
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R126i.y)) + uf_blockVS7[110].x);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R127i.y)) + intBitsToFloat(R122i.x));
// 17
PV1ix = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(0x3edc28f6));
PV1ix = clampFI32(PV1ix);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R3i.w)) + intBitsToFloat(R123i.z));
R125i.z = floatBitsToInt(uf_blockVS6[17].x + -(intBitsToFloat(R6i.x)));
R127i.w = floatBitsToInt(uf_blockVS6[17].y + -(intBitsToFloat(R8i.y)));
R127i.z = floatBitsToInt(uf_blockVS6[17].z + -(intBitsToFloat(R6i.z)));
// 18
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R7i.y)) + intBitsToFloat(R123i.y));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(R127i.z));
tempResultf = max(0.0, intBitsToFloat(PV1ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R3i.w = floatBitsToInt(tempResultf);
// 19
backupReg0i = R123i.x;
R123i.x = floatBitsToInt((intBitsToFloat(R127i.w) * intBitsToFloat(R127i.w) + intBitsToFloat(PV0iy)));
R19i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[111].x,intBitsToFloat(R3i.y)) + intBitsToFloat(backupReg0i));
// 20
R123i.y = floatBitsToInt((intBitsToFloat(R125i.z) * intBitsToFloat(R125i.z) + intBitsToFloat(R123i.x)));
// 21
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.y));
PS1i = floatBitsToInt(tempResultf);
// 22
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PS1i)));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PS1i)));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS1i)));
R7i.y = floatBitsToInt(uf_blockVS6[17].y);
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R3i.y),intBitsToFloat(R6i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS13[28].x,uf_blockVS13[28].y,uf_blockVS13[28].z,0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
R127i.x = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
PV1iz = floatBitsToInt(mul_nonIEEE(uf_blockVS13[38].z, intBitsToFloat(R3i.w)));
PV1iw = floatBitsToInt(min(intBitsToFloat(R7i.y), uf_blockVS13[27].z));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),uf_blockVS13[37].x) + -(uf_blockVS13[37].y));
R123i.x = clampFI32(R123i.x);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),uf_blockVS13[22].x) + -(uf_blockVS13[22].y));
R123i.y = clampFI32(R123i.y);
PV0iz = floatBitsToInt(-(intBitsToFloat(R4i.w)) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iz)));
// 3
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS13[27].y,intBitsToFloat(PV0iz)) + uf_blockVS13[27].x);
R123i.x = clampFI32(R123i.x);
R125i.y = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R125i.z = floatBitsToInt(mul_nonIEEE(-(uf_blockVS13[38].w),intBitsToFloat(PS0i)) + 1.0);
PV1iw = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0iw)));
// 4
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), uf_blockVS13[26].w));
R127i.z = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3f22f983));
R123i.w = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
tempResultf = max(0.0, intBitsToFloat(PV1iw));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R123i.w)) + intBitsToFloat(0xbe593484));
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockVS13[38].x, intBitsToFloat(PS0i)));
R126i.z = floatBitsToInt(uf_blockVS13[28].y * 1.0 + intBitsToFloat(R10i.y));
PV1iw = floatBitsToInt(uf_blockVS13[28].y + 1.0);
tempResultf = max(0.0, intBitsToFloat(R125i.y));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(uf_blockVS13[23].y, intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) * 1.5);
PV0iy = clampFI32(PV0iy);
R124i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS13[23].x, intBitsToFloat(PS1i)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R123i.x)) + intBitsToFloat(0x3fc90da4));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 7
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),-(intBitsToFloat(R123i.w))) + 1.0);
R125i.y = floatBitsToInt(intBitsToFloat(PV0iy) * 15.0);
PV1iw = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 8
R10i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R125i.z)));
PS0i = floatBitsToInt(exp2(intBitsToFloat(R124i.z)));
// 9
R17i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), uf_blockVS13[25].w));
R123i.y = floatBitsToInt(mul_nonIEEE(-(uf_blockVS13[23].z),intBitsToFloat(PS0i)) + uf_blockVS13[23].z);
R123i.y = clampFI32(R123i.y);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R125i.y));
// 10
backupReg0i = R11i.y;
R19i.x = floatBitsToInt(intBitsToFloat(R8i.x) * 1.0 + 0.0);
R11i.y = floatBitsToInt(intBitsToFloat(R123i.y) + intBitsToFloat(0x80000000));
R11i.y = clampFI32(R11i.y);
PV0iz = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(intBitsToFloat(R16i.y) * intBitsToFloat(backupReg0i));
R8i.y = 0;
// 11
PV1ix = floatBitsToInt(max(intBitsToFloat(PV0iz), intBitsToFloat(0x3e4ccccd)));
PV1iy = floatBitsToInt(-(intBitsToFloat(PV0iw)) + 1.0);
R17i.z = R11i.y;
// 12
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3f333333) + intBitsToFloat(0x3e19999a));
R123i.x = clampFI32(R123i.x);
R4i.w = floatBitsToInt(min(intBitsToFloat(PV1ix), 1.0));
// 13
PV1iz = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
// 14
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + 2.5);
// 15
R8i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3daaaaab));
}
if( activeMaskStackC[3] == true ) {
R10i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y))).xyz);
R18i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R11i.y;
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(R4i.w)));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(R4i.w)));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(R4i.w)));
R11i.w = backupReg0i;
R10i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS11[2].w, uf_blockVS14[0].z));
// 1
R10i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS11[2].w, uf_blockVS14[0].w));
}
if( activeMaskStackC[3] == true ) {
// 0
R12i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[44].y,intBitsToFloat(R10i.z)) + intBitsToFloat(R2i.w));
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockVS7[49].y, intBitsToFloat(R10i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[44].y, intBitsToFloat(R10i.x)));
// 1
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),uf_blockVS11[3].w) + intBitsToFloat(R7i.z));
R12i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[49].y,intBitsToFloat(R10i.z)) + intBitsToFloat(R3i.x));
R12i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS11[3].w,intBitsToFloat(PV0iy)) + intBitsToFloat(R5i.x));
// 2
R21i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z),uf_blockVS7[54].y) + intBitsToFloat(R0i.x));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), uf_blockVS7[54].y));
// 3
R21i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS11[3].w,intBitsToFloat(PV0iz)) + intBitsToFloat(R0i.w));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.z));
// export
passParameterSem9 = vec4(intBitsToFloat(R21i.x), intBitsToFloat(R21i.y), intBitsToFloat(R21i.z), intBitsToFloat(R21i.z));
}
