#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader d2aa9a61a5af35aa
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
UNIFORM_BUFFER_LAYOUT(6, 0, 4) uniform uniformBlockVS6
{
vec4 uf_blockVS6[19];
};


UNIFORM_BUFFER_LAYOUT(7, 0, 5) uniform uniformBlockVS7
{
vec4 uf_blockVS7[4096];
};


UNIFORM_BUFFER_LAYOUT(8, 0, 6) uniform uniformBlockVS8
{
vec4 uf_blockVS8[4];
};


UNIFORM_BUFFER_LAYOUT(11, 0, 7) uniform uniformBlockVS11
{
vec4 uf_blockVS11[6];
};


UNIFORM_BUFFER_LAYOUT(13, 0, 8) uniform uniformBlockVS13
{
vec4 uf_blockVS13[29];
};


TEXTURE_LAYOUT(39, 0, 0) uniform sampler2D textureUnitVS7;
TEXTURE_LAYOUT(40, 0, 1) uniform sampler2D textureUnitVS8;
TEXTURE_LAYOUT(44, 0, 2) uniform sampler2DArrayShadow textureUnitVS12;
TEXTURE_LAYOUT(45, 0, 3) uniform sampler2D textureUnitVS13;
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
out vec4 passParameterSem8;
out vec4 passParameterSem10;
out vec4 passParameterSem11;
out vec4 passParameterSem13;
out vec4 passParameterSem14;
out vec4 passParameterSem15;
out vec4 passParameterSem16;
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
ivec4 R23i = ivec4(0);
ivec4 R24i = ivec4(0);
ivec4 R25i = ivec4(0);
ivec4 R26i = ivec4(0);
ivec4 R27i = ivec4(0);
ivec4 R28i = ivec4(0);
ivec4 R29i = ivec4(0);
ivec4 R30i = ivec4(0);
ivec4 R31i = ivec4(0);
ivec4 R32i = ivec4(0);
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
attrDecoder = attrDataSem8;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem3;
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem6;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem7;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem10;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R10i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem9;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R9i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
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
R12i.y = floatBitsToInt(-(intBitsToFloat(R7i.w)) + uf_blockVS8[2].x);
R5i.w = 0;
R7i.w = floatBitsToInt(1.0);
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
R13i.x = 0;
R13i.y = 0;
R13i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R14i.x = 0;
// 1
R4i.w = R7i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R4i.w = R5i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R4i.w == 0);
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
R6i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R12i.y) >= intBitsToFloat(R6i.z));
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
R14i.x = 0;
// 1
R4i.w = R7i.w;
}
activeMaskStack[2] = activeMaskStack[2] == false;
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
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
// 0
R0i.x = 0;
PV0iy = floatBitsToInt((uf_blockVS7[9].x > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > uf_blockVS7[9].x)?1.0:0.0);
PV0iw = floatBitsToInt(max(intBitsToFloat(R9i.x), 0.0));
R0i.y = int(intBitsToFloat(R8i.w));
// 1
PV1ix = floatBitsToInt(min(intBitsToFloat(PV0iw), 0.0));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), uf_blockVS7[10].y));
R126i.z = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[9].x);
// 2
R6i.x = floatBitsToInt(intBitsToFloat(R10i.x) + intBitsToFloat(PV1ix));
R126i.y = floatBitsToInt(-(uf_blockVS7[96].x) + uf_blockVS7[97].x);
R127i.z = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
PV0iw = floatBitsToInt(intBitsToFloat(R12i.y) * intBitsToFloat(PS1i));
R6i.y = floatBitsToInt(1.0 / intBitsToFloat(R6i.z));
// 3
backupReg0i = R127i.y;
R127i.y = floatBitsToInt(-(uf_blockVS7[96].y) + uf_blockVS7[97].y);
PV1iz = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(R12i.y) * intBitsToFloat(R6i.y));
// 4
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R127i.z)));
PV0iy = floatBitsToInt(fract(intBitsToFloat(PV1iz)));
R127i.w = floatBitsToInt(-(uf_blockVS7[96].w) + uf_blockVS7[97].w);
R0i.w = 0x3f800000;
// 5
R1i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w))));
PV1iy = R1i.x;
PV1iz = R1i.x;
PV1iw = R1i.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV0iy)));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w))));
PV0ix = tempi.x;
R15i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.w = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PS1i));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
R126i.z = floatBitsToInt(intBitsToFloat(R126i.w) + -(uf_blockVS7[96].w));
// 8
backupReg0i = R127i.w;
R126i.x = ((intBitsToFloat(R126i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iy = floatBitsToInt(-(uf_blockVS7[97].w) + uf_blockVS7[98].w);
R127i.z = floatBitsToInt(intBitsToFloat(R126i.w) + -(uf_blockVS7[98].w));
R127i.w = floatBitsToInt(intBitsToFloat(R126i.w) + -(uf_blockVS7[97].w));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS0i));
PV1iz = floatBitsToInt(-(uf_blockVS7[97].x) + uf_blockVS7[98].x);
PV1iw = floatBitsToInt(-(uf_blockVS7[97].y) + uf_blockVS7[98].y);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV1ix)));
R126i.w = ((intBitsToFloat(R127i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 11
R125i.x = floatBitsToInt(uf_blockVS7[96].x + intBitsToFloat(PV0iw));
R127i.y = floatBitsToInt(uf_blockVS7[96].y + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0iy)));
R122i.x = ((intBitsToFloat(R127i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 12
R127i.x = floatBitsToInt(uf_blockVS7[97].y + intBitsToFloat(PV1iw));
R124i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[98].x, intBitsToFloat(R122i.x)));
R127i.z = floatBitsToInt(uf_blockVS7[97].x + intBitsToFloat(PV1iz));
R124i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[98].y, intBitsToFloat(R122i.x)));
PS0i = floatBitsToInt(-(intBitsToFloat(R122i.x)) + 1.0);
// 13
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
PV1iz = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
R126i.w = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(R9i.y));
R127i.w = floatBitsToInt(intBitsToFloat(R9i.y) + intBitsToFloat(R9i.z));
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV1iz)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV1ix)));
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].x, intBitsToFloat(PV1iy)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV1ix)));
R126i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].y, intBitsToFloat(PV1iy)));
// 15
PV1ix = floatBitsToInt(intBitsToFloat(R126i.w) * 0.5);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt(intBitsToFloat(R127i.w) * 0.5);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(R9i.z));
// 16
R125i.x = floatBitsToInt(intBitsToFloat(PV1ix) + -(0.5));
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) * 2.0);
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) * 0.5);
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R126i.y));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R127i.z));
R127i.z = floatBitsToInt(intBitsToFloat(PV1iz) + -(0.5));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 2.0);
// 17
PV1ix = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(PV0iz));
R126i.z = floatBitsToInt(intBitsToFloat(PV0iy) + -(0.5));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) * 2.0);
R2i.w = floatBitsToInt(intBitsToFloat(R9i.x) + -(0.5));
R0i.w = floatBitsToInt(intBitsToFloat(R9i.y) + -(0.5));
// 18
R4i.x = floatBitsToInt(intBitsToFloat(R9i.z) + -(0.5));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), uf_blockVS7[115].x));
PV0iz = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(intBitsToFloat(R124i.y) + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), uf_blockVS7[115].y));
// 19
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(PV0iw)));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(PV0iz)));
R2i.z = floatBitsToInt(intBitsToFloat(PV0iy) + uf_blockVS7[114].x);
R1i.w = floatBitsToInt(uf_blockVS7[114].y + intBitsToFloat(PS0i));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), uf_blockVS7[115].z));
// 20
R125i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x40000;
R2i.y = floatBitsToInt(uf_blockVS7[114].z + intBitsToFloat(PS1i));
R126i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x20000;
PV0iw = floatBitsToInt(uf_blockVS7[5].x) & 0x10000;
PS0i = R9i.y;
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 21
R127i.x = R9i.z;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
PV1iw = floatBitsToInt(floor(intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(float(PV0iw));
// 22
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(PV1iw) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PV1iw))?1.0:0.0);
PS0i = floatBitsToInt(float(R126i.z));
// 23
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R4i.y = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iw)));
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iy)));
PS1i = floatBitsToInt(float(R125i.x));
// 24
R10i.x = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R3i.y = floatBitsToInt(floor(intBitsToFloat(R127i.x)));
R3i.z = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iz)));
R3i.w = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R4i.z = int(intBitsToFloat(PV1iw));
}
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R3i.z;
PV0ix = floatBitsToInt(intBitsToFloat(R3i.w) + -(intBitsToFloat(R10i.x)));
PV0iy = 0 - R4i.z;
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), uf_blockVS8[3].z));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), uf_blockVS8[3].y));
R127i.x = int(intBitsToFloat(backupReg0i));
// 1
PV1ix = 0 - R127i.x;
PV1iy = max(R4i.z, PV0iy);
PV1iz = floatBitsToInt((intBitsToFloat(R3i.y) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(R3i.y))?1.0:0.0);
R124i.y = int(intBitsToFloat(PV0ix));
// 2
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iw)));
PV0iy = 0 - R124i.y;
PV0iz = R9i.x;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
PV0iw = max(backupReg0i, PV1ix);
PS0i = floatBitsToInt(float(PV1iy));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 3
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(R4i.y)));
PV1iy = floatBitsToInt(floor(intBitsToFloat(PV0iz)));
PV1iz = max(R124i.y, PV0iy);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), uf_blockVS7[113].x));
PS1i = floatBitsToInt(float(PV0iw));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 4
PV0ix = floatBitsToInt((intBitsToFloat(PV1iy) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(R127i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R125i.x)));
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PV1iy))?1.0:0.0);
R127i.x = floatBitsToInt(float(PV1iz));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R125i.x)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PV0iy)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
R125i.w = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PV0iy)));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV1ix));
PV0iy = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(PS1i));
R127i.z = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.x)), intBitsToFloat(PV1iz)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), uf_blockVS7[113].y));
// 7
R125i.x = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R124i.w));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PV0iw)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV0iw)));
R124i.w = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PS0i));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), uf_blockVS7[113].z));
// 8
R127i.x = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(PV1iz));
R124i.y = ((uf_blockVS7[114].w == 1.0)?-1:0);
PV0iz = floatBitsToInt(-(uf_blockVS7[114].w) + 1.0);
PV0iw = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(PV1iy));
tempResultf = max(0.0, uf_blockVS7[114].w);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 9
R126i.x = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R126i.z));
R2i.y = floatBitsToInt(intBitsToFloat(R8i.z) * 1.0);
PV1iz = (R0i.y == int(1))?-1:0;
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(PS0i)));
R126i.z = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 10
R123i.x = ((PV1iz == 0)?(0x3f800000):(0xbf800000));
PV0iy = (R0i.y == 0x2)?-1:0;
R123i.z = ((PV1iz == 0)?(0xbf800000):(0xbf800000));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iw)));
// 11
backupReg0i = R123i.z;
PV1ix = (R0i.y == 0x3)?-1:0;
PV1iy = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R123i.z = ((PV0iy == 0)?(R123i.x):(0xbf800000));
R123i.w = ((PV0iy == 0)?(backupReg0i):(0x3f800000));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(R126i.z));
R0i.y = ((PV1ix == 0)?(R123i.w):(0x3f800000));
R0i.w = ((PV1ix == 0)?(R123i.z):(0x3f800000));
// 13
R123i.y = ((R124i.y == 0)?(PV0ix):(R12i.y));
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R123i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R123i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R123i.y)));
// 15
PV1iy = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(PV0iz));
// 16
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.w = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
// 17
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
// 18
R123i.x = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.w = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 19
R126i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R124i.y = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
R127i.z = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
// 20
R127i.x = floatBitsToInt(sin((intBitsToFloat(R127i.z))/0.1591549367));
// 21
R125i.y = floatBitsToInt(cos((intBitsToFloat(R127i.z))/0.1591549367));
// 22
R124i.w = floatBitsToInt(sin((intBitsToFloat(R124i.y))/0.1591549367));
// 23
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R124i.w)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R124i.w)));
R127i.z = floatBitsToInt(cos((intBitsToFloat(R124i.y))/0.1591549367));
// 24
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R127i.z)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R127i.z)));
R3i.x = floatBitsToInt(sin((intBitsToFloat(R126i.x))/0.1591549367));
// 25
R5i.x = floatBitsToInt(-(intBitsToFloat(R3i.x)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R125i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R126i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R126i.z)));
R124i.y = floatBitsToInt(cos((intBitsToFloat(R126i.x))/0.1591549367));
// 26
R10i.x = floatBitsToInt(-(intBitsToFloat(R125i.x)) + intBitsToFloat(PV1iw));
R4i.y = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(PV1iz));
R5i.z = floatBitsToInt(-(intBitsToFloat(R126i.z)) + intBitsToFloat(PV1iy));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R124i.y)));
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R124i.y)));
// 27
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R125i.w)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R124i.y)));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R124i.y)));
// 28
R2i.w = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV1ix));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(uf_blockVS7[13].y);
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),uf_blockVS11[0].x) + 0.0);
PV0iz = floatBitsToInt(uf_blockVS7[13].x);
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),uf_blockVS11[0].x) + 0.0);
// 1
PV1iy = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(PV0iz));
PV1iw = floatBitsToInt(intBitsToFloat(R8i.y) + intBitsToFloat(PV0ix));
// 2
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(PV1iw)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(R2i.y)));
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R5i.x)) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(R2i.y)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R2i.y)));
R3i.w = 0x3f800000;
// 4
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R1i.w)) + intBitsToFloat(R123i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R5i.y)) + intBitsToFloat(PV1iz));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R4i.x)) + intBitsToFloat(PV1iy));
// 5
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R4i.y)) + intBitsToFloat(R123i.w));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R5i.z)) + intBitsToFloat(R123i.y));
}
if( activeMaskStackC[3] == true ) {
// 0
R125i.x = floatBitsToInt(uf_blockVS6[12].y);
R127i.y = floatBitsToInt(uf_blockVS6[12].x);
R126i.z = floatBitsToInt(uf_blockVS6[13].y);
R124i.w = floatBitsToInt(uf_blockVS6[13].x);
// 1
PV1ix = floatBitsToInt(uf_blockVS6[12].z);
R3i.y = 0x3f800000;
R125i.z = floatBitsToInt(uf_blockVS6[14].x);
R125i.w = floatBitsToInt(uf_blockVS6[14].y);
// 2
R127i.x = floatBitsToInt(uf_blockVS6[13].z);
R124i.y = floatBitsToInt(uf_blockVS6[14].z);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PV1ix)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PV1ix)));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R124i.y)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R125i.x)) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R127i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R127i.x)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R124i.y)));
// 4
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R125i.x)) + intBitsToFloat(R127i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R125i.w)) + intBitsToFloat(PV1ix));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R126i.z)) + intBitsToFloat(PV1iz));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R126i.z)) + intBitsToFloat(PV1iw));
// 5
R6i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.x)),intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.y));
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(R124i.w)) + intBitsToFloat(R123i.w));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(R125i.z)) + intBitsToFloat(R123i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R125i.w)) + intBitsToFloat(R126i.y));
R17i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.x)),intBitsToFloat(R124i.w)) + intBitsToFloat(R122i.x));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R124i.y)));
R124i.y = floatBitsToInt(intBitsToFloat(R1i.x) + -(uf_blockVS6[17].x));
R7i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.x)),intBitsToFloat(R125i.z)) + intBitsToFloat(R123i.w));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R127i.x)));
R126i.y = floatBitsToInt(intBitsToFloat(R15i.y) + -(uf_blockVS6[17].y));
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x),intBitsToFloat(R125i.x)) + intBitsToFloat(R125i.y));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x),intBitsToFloat(R126i.z)) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(intBitsToFloat(R0i.z) + -(uf_blockVS6[17].z));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x),intBitsToFloat(R125i.w)) + intBitsToFloat(PV0ix));
R127i.z = floatBitsToInt(1.0 / uf_blockVS7[116].x);
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.y),intBitsToFloat(R126i.y),intBitsToFloat(PV1iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.y),intBitsToFloat(R126i.y),intBitsToFloat(PV1iz),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.x));
// 9
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(R124i.w)) + intBitsToFloat(R125i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(R125i.z)) + intBitsToFloat(R125i.w));
R125i.y = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 10
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R7i.z)) + intBitsToFloat(R123i.y));
PV0iy = floatBitsToInt(min(intBitsToFloat(R125i.y), uf_blockVS7[116].x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R17i.y)) + intBitsToFloat(backupReg0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R6i.x)) + intBitsToFloat(R126i.z));
R126i.z = ((intBitsToFloat(R125i.y) > uf_blockVS7[116].x)?-1:0);
// 11
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R11i.x)) + intBitsToFloat(R123i.w));
R18i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R16i.y)) + intBitsToFloat(R123i.z));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R6i.z)) + intBitsToFloat(R123i.x));
R125i.w = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(R127i.z));
R125i.x = floatBitsToInt(max(intBitsToFloat(R125i.y), uf_blockVS7[116].y));
// 12
tempi.x = floatBitsToInt(dot(vec4(uf_blockVS6[12].x,uf_blockVS6[12].y,uf_blockVS6[12].z,uf_blockVS6[12].w),vec4(intBitsToFloat(R5i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R3i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.w = 0x3f800000;
// 13
tempi.x = floatBitsToInt(dot(vec4(uf_blockVS6[13].x,uf_blockVS6[13].y,uf_blockVS6[13].z,uf_blockVS6[13].w),vec4(intBitsToFloat(R5i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R3i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.y = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV0ix));
// 14
tempi.x = floatBitsToInt(dot(vec4(uf_blockVS6[14].x,uf_blockVS6[14].y,uf_blockVS6[14].z,uf_blockVS6[14].w),vec4(intBitsToFloat(R5i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R3i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(intBitsToFloat(R15i.y) + intBitsToFloat(PV1ix));
// 15
backupReg0i = R125i.y;
PV1ix = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV0ix));
R125i.y = floatBitsToInt(-(intBitsToFloat(R15i.y)) + intBitsToFloat(PS0i));
R124i.w = floatBitsToInt(-(intBitsToFloat(R1i.x)) + intBitsToFloat(backupReg0i));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[116].y);
// 16
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R125i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R125i.w)));
R127i.z = floatBitsToInt(-(intBitsToFloat(R0i.z)) + intBitsToFloat(PV1ix));
R127i.w = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(PS1i));
// 17
backupReg0i = R125i.y;
R125i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV0iy));
R125i.y = floatBitsToInt(intBitsToFloat(R15i.y) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R125i.w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R127i.w)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R127i.w)));
// 18
PV0ix = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV1iw));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.w)));
PV0iz = floatBitsToInt(intBitsToFloat(R15i.y) + intBitsToFloat(PS1i));
R127i.w = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV1iz));
// 19
R16i.x = ((R126i.z == 0)?(R125i.x):(PV0ix));
R19i.y = ((R126i.z == 0)?(R125i.y):(PV0iz));
PV1iz = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV0iy));
// 20
R11i.z = ((R126i.z == 0)?(R127i.w):(PV1iz));
R1i.w = R3i.y;
// 21
R20i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R19i.y),intBitsToFloat(R11i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS6[8].x,uf_blockVS6[8].y,uf_blockVS6[8].z,uf_blockVS6[8].w)));
PV1iy = R20i.x;
PV1iz = R20i.x;
PV1iw = R20i.x;
// 22
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R19i.y),intBitsToFloat(R11i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS6[9].x,uf_blockVS6[9].y,uf_blockVS6[9].z,uf_blockVS6[9].w)));
PV0ix = tempi.x;
R20i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 23
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R19i.y),intBitsToFloat(R11i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS6[10].x,uf_blockVS6[10].y,uf_blockVS6[10].z,uf_blockVS6[10].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R20i.z = tempi.x;
PV1iw = tempi.x;
PS1i = ((intBitsToFloat(R9i.x) > 0.5)?-1:0);
// 24
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R19i.y),intBitsToFloat(R11i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS6[11].x,uf_blockVS6[11].y,uf_blockVS6[11].z,uf_blockVS6[11].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R20i.w = tempi.x;
R3i.y = floatBitsToInt(((PS1i == 0)?(intBitsToFloat(R8i.x)):(-(intBitsToFloat(R8i.x)))));
// 25
PV1iy = PV0ix;
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) / 2.0);
R123i.w = floatBitsToInt(intBitsToFloat(R20i.z) * 0.0 + intBitsToFloat(PV0ix));
// 26
R123i.x = floatBitsToInt(intBitsToFloat(R20i.z) * 0.5 + intBitsToFloat(PV1iy));
PV0iy = ((intBitsToFloat(R9i.y) > 0.5)?-1:0);
R123i.z = floatBitsToInt(intBitsToFloat(R20i.z) * 0.0 + intBitsToFloat(PV1iy));
R21i.y = floatBitsToInt(1.0 / intBitsToFloat(R123i.w));
// 27
R5i.x = floatBitsToInt(((PV0iy == 0)?(intBitsToFloat(R8i.y)):(-(intBitsToFloat(R8i.y)))));
R2i.z = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(R21i.y));
R2i.w = floatBitsToInt(intBitsToFloat(R20i.y) * -(0.5) + intBitsToFloat(R123i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),uf_blockVS6[18].w) + -(uf_blockVS6[18].y));
R127i.w = ((intBitsToFloat(R9i.z) > 0.5)?-1:0);
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R15i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS6[10].x,uf_blockVS6[10].y,uf_blockVS6[10].z,uf_blockVS6[10].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R125i.w = tempi.x;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.y));
// 2
R15i.x = floatBitsToInt(-(uf_blockVS6[18].z) * intBitsToFloat(PS1i));
R125i.y = floatBitsToInt(((R127i.w == 0)?(intBitsToFloat(R8i.x)):(-(intBitsToFloat(R8i.x)))));
PS0i = floatBitsToInt(float(floatBitsToInt(uf_blockVS7[6].x)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R15i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS6[11].x,uf_blockVS6[11].y,uf_blockVS6[11].z,uf_blockVS6[11].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(PS0i)));
// 4
PV0ix = floatBitsToInt(uf_blockVS7[5].x) & 0x80000;
PV0iy = PV1ix;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
PV0iz = floatBitsToInt(uf_blockVS7[5].x) & 0x100000;
R123i.w = floatBitsToInt(intBitsToFloat(R125i.w) * 0.0 + intBitsToFloat(PV1ix));
PS0i = int(intBitsToFloat(PS1i));
// 5
R123i.x = floatBitsToInt(intBitsToFloat(R125i.w) * 0.5 + intBitsToFloat(PV0iy));
R2i.y = PS0i + 0x3c;
PV1iz = (PV0ix == 0x80000)?-1:0;
PV1iw = (PV0iz == 0x100000)?-1:0;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.w));
// 6
R3i.x = ((PV1iw == 0)?(R8i.y):(R5i.x));
PV0iy = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(uf_blockVS7[5].x) & 0x200000;
R4i.w = ((PV1iz == 0)?(R8i.x):(R3i.y));
PS0i = floatBitsToInt(uf_blockVS7[5].x) & 0x400000;
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockVS6[18].w, intBitsToFloat(PV0iy)));
PV1iy = (PV0iz == 0x200000)?-1:0;
PV1iz = ((intBitsToFloat(R9i.w) > 0.5)?-1:0);
R125i.w = (PS0i == 0x400000)?-1:0;
PS1i = floatBitsToInt(uf_blockVS7[5].y) & int(1);
// 8
R123i.x = floatBitsToInt(((PV1iz == 0)?(intBitsToFloat(R8i.y)):(-(intBitsToFloat(R8i.y)))));
R1i.y = (int(1) != PS1i)?-1:0;
R4i.z = ((PV1iy == 0)?(R8i.x):(R125i.y));
PV0iw = floatBitsToInt(-(uf_blockVS6[18].y) + intBitsToFloat(PV1ix));
R5i.z = int(uf_blockVS7[17].x);
// 9
R11i.y = ((R125i.w == 0)?(R8i.y):(R123i.x));
R125i.w = floatBitsToInt(uf_blockVS7[5].x) & 0x10;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 10
R7i.y = floatBitsToInt(-(uf_blockVS6[18].z) * intBitsToFloat(PS1i));
R8i.y = int(uf_blockVS7[17].y);
// 11
PV1iw = floatBitsToInt(uf_blockVS7[5].x) & 0x20;
PS1i = floatBitsToInt(float(R125i.w));
// 12
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R8i.x = floatBitsToInt(float(PV1iw));
// 13
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iy)));
// 14
R125i.x = int(intBitsToFloat(PV1iw));
// 15
PV1iz = 0 - R125i.x;
// 16
R3i.y = max(R125i.x, PV1iz);
}
if( activeMaskStackC[3] == true ) {
R2i.xyz = floatBitsToInt(uf_blockVS7[R2i.y].xyz);
}
if( activeMaskStackC[3] == true ) {
// 0
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), uf_blockVS8[0].x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), uf_blockVS8[0].y));
PV0iz = floatBitsToInt((intBitsToFloat(R8i.x) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt(uf_blockVS7[68].x);
PS0i = floatBitsToInt((0.0 > intBitsToFloat(R8i.x))?1.0:0.0);
// 1
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), uf_blockVS7[59].x));
R22i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), uf_blockVS7[59].x));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), uf_blockVS8[0].z));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PS0i)));
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), uf_blockVS8[0].w));
// 2
PV0ix = floatBitsToInt(uf_blockVS7[76].x);
R17i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), uf_blockVS7[59].x));
PV0iw = floatBitsToInt(uf_blockVS7[76].y);
R125i.x = int(intBitsToFloat(PV1iw));
// 3
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), uf_blockVS8[1].x));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), uf_blockVS8[1].y));
PV1iz = floatBitsToInt(uf_blockVS7[76].z);
PV1iw = 0 - R125i.x;
// 4
R4i.y = max(R125i.x, PV1iw);
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), uf_blockVS8[1].z));
}
if( activeMaskStackC[3] == true ) {
// 0
R125i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x80;
R2i.y = floatBitsToInt(uf_blockVS7[84].x);
PV0iw = floatBitsToInt(uf_blockVS7[5].x) & 0x40;
// 1
PS1i = floatBitsToInt(float(PV0iw));
// 2
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(R125i.x));
// 3
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iy)));
// 4
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iy)));
R125i.x = int(intBitsToFloat(PV1iw));
// 5
PV1iz = 0 - R125i.x;
R127i.x = int(intBitsToFloat(PV0iw));
// 6
R5i.y = max(R125i.x, PV1iz);
PV0iz = 0 - R127i.x;
// 7
R0i.y = max(R127i.x, PV0iz);
}
if( activeMaskStackC[3] == true ) {
// 0
R12i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R2i.x)));
R23i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R10i.y)));
R18i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R1i.z)));
R9i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), uf_blockVS8[1].w));
// 1
R127i.w = int(-1) + R5i.z;
R125i.w = floatBitsToInt(float(R5i.z));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(R125i.w)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(R125i.w)));
PS0i = floatBitsToInt(float(R8i.y));
// 3
PV1iz = floatBitsToInt(intBitsToFloat(R6i.y) * intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 4
R126i.z = floatBitsToInt(intBitsToFloat(R12i.y) * intBitsToFloat(PS1i));
PS0i = int(intBitsToFloat(PV1iz));
// 5
R124i.w = R3i.y * PS0i;
// 6
R3i.y = int(intBitsToFloat(R126i.z));
// 7
PS1i = floatBitsToInt(float(R3i.y));
// 8
PV0ix = floatBitsToInt(-(intBitsToFloat(R125i.w)) + intBitsToFloat(PS1i));
R10i.x = floatBitsToInt(float(R5i.z));
// 9
R5i.x = floatBitsToInt(abs(intBitsToFloat(R10i.x)));
R123i.z = ((intBitsToFloat(PV0ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.z = floatBitsToInt(float(R3i.y));
// 10
R126i.y = floatBitsToInt(abs(intBitsToFloat(R126i.z)));
R125i.y = int(intBitsToFloat(R123i.z));
// 11
R127i.x = int(1) - R125i.y;
R8i.y = floatBitsToInt(1.0 / abs(intBitsToFloat(R10i.x)));
// 12
PV0iw = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R126i.z)), intBitsToFloat(R8i.y)));
R125i.y = R125i.y * R127i.w;
// 13
PV1ix = floatBitsToInt(trunc(intBitsToFloat(PV0iw)));
R5i.z = int(intBitsToFloat(R127i.y));
// 14
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(R5i.x)) + intBitsToFloat(R126i.y));
R8i.x = R0i.y * R5i.z;
// 15
PV1ix = floatBitsToInt(-(abs(intBitsToFloat(R10i.x))) + intBitsToFloat(R127i.w));
PV1iz = floatBitsToInt((intBitsToFloat(R127i.w) >= abs(intBitsToFloat(R10i.x)))?1.0:0.0);
// 16
R126i.y = ((intBitsToFloat(PV1iz) == 0.0)?(R127i.w):(PV1ix));
// 17
PV1iw = floatBitsToInt(abs(intBitsToFloat(R10i.x)) + intBitsToFloat(R126i.y));
// 18
R123i.x = ((-(intBitsToFloat(R126i.y)) > 0.0)?(PV1iw):(R126i.y));
// 19
R123i.z = ((-(intBitsToFloat(R126i.z)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.x)))):(R123i.x));
// 20
R123i.y = ((intBitsToFloat(R10i.x) == 0.0)?(R126i.z):(R123i.z));
// 21
PS1i = int(intBitsToFloat(R123i.y));
// 22
PS0i = R127i.x * PS1i;
// 23
PV1iw = PS0i + R125i.y;
// 24
PS0i = R4i.y * PV1iw;
// 25
R2i.x = PS0i + R124i.w;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(uf_blockVS7[5].x) & 0x2000000;
// 1
PS1i = floatBitsToInt(float(PV0ix));
// 2
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iw)));
// 4
R126i.z = int(intBitsToFloat(PV1ix));
// 5
PV1iy = 0 - R126i.z;
// 6
PV0iw = max(R126i.z, PV1iy);
// 7
PS1i = PV0iw * R5i.z;
// 8
PV0iw = R3i.y + PS1i;
// 9
PS1i = R5i.y * PV0iw;
// 10
PV0iz = PS1i + R2i.x;
// 11
PV1iy = R8i.x + PV0iz;
// 12
R127i.w = floatBitsToInt(float(PV1iy));
// 13
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), abs(intBitsToFloat(R127i.w))));
R125i.y = floatBitsToInt(abs(intBitsToFloat(R127i.w)));
// 14
PV0iz = floatBitsToInt(trunc(intBitsToFloat(PV1ix)));
// 15
R124i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iz)),intBitsToFloat(R5i.x)) + intBitsToFloat(R125i.y));
// 16
PV0ix = floatBitsToInt(-(abs(intBitsToFloat(R10i.x))) + intBitsToFloat(R124i.w));
PV0iz = floatBitsToInt((intBitsToFloat(R124i.w) >= abs(intBitsToFloat(R10i.x)))?1.0:0.0);
// 17
R125i.y = ((intBitsToFloat(PV0iz) == 0.0)?(R124i.w):(PV0ix));
// 18
PV0iw = floatBitsToInt(abs(intBitsToFloat(R10i.x)) + intBitsToFloat(R125i.y));
// 19
R123i.x = ((-(intBitsToFloat(R125i.y)) > 0.0)?(PV0iw):(R125i.y));
// 20
R123i.z = ((-(intBitsToFloat(R127i.w)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.x)))):(R123i.x));
// 21
R123i.y = ((intBitsToFloat(R10i.x) == 0.0)?(R127i.w):(R123i.z));
// 22
R127i.w = int(intBitsToFloat(R123i.y));
// 23
R127i.x = floatBitsToInt(float(R127i.w));
// 24
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(R127i.x))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(R127i.x) > 0.0)?1.0:0.0);
R127i.z = floatBitsToInt(float(R127i.w));
// 25
R125i.x = floatBitsToInt(abs(intBitsToFloat(R127i.z)));
PV1iy = floatBitsToInt(abs(intBitsToFloat(R127i.z)) * 0.25);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iy)));
// 26
R123i.x = floatBitsToInt(intBitsToFloat(PV1iw) * 0.5 + intBitsToFloat(R127i.x));
PV0iw = floatBitsToInt(trunc(intBitsToFloat(PV1iy)));
// 27
PV1ix = floatBitsToInt(intBitsToFloat(R123i.x) * 0.25);
R126i.z = floatBitsToInt(-(intBitsToFloat(PV0iw)) * 4.0 + intBitsToFloat(R125i.x));
R0i.w = ((R1i.y == 0)?(R9i.x):(R9i.y));
// 28
PV0ix = floatBitsToInt(trunc(intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt(intBitsToFloat(R126i.z) + -4.0);
PV0iw = floatBitsToInt((intBitsToFloat(R126i.z) >= 4.0)?1.0:0.0);
R8i.x = int(uf_blockVS7[26].x);
// 29
R125i.x = ((intBitsToFloat(PV0iw) == 0.0)?(R126i.z):(PV0iy));
R125i.y = floatBitsToInt(uf_blockVS7[5].x) & 0x100;
PS1i = int(intBitsToFloat(PV0ix));
// 30
R10i.x = PS1i + 0x12;
PV0iz = floatBitsToInt(intBitsToFloat(R125i.x) + 4.0);
R2i.z = int(uf_blockVS7[26].y);
// 31
R123i.y = ((-(intBitsToFloat(R125i.x)) > 0.0)?(PV0iz):(R125i.x));
PS1i = floatBitsToInt(float(R125i.y));
// 32
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R123i.w = ((-(intBitsToFloat(R127i.z)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.y)))):(R123i.y));
// 33
R126i.y = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iz)));
PS1i = int(intBitsToFloat(R123i.w));
// 34
R125i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x200;
R125i.y = 0xfffffffe + PS1i;
PV0iz = int(-1) + PS1i;
R127i.w = 0xfffffffd + PS1i;
PS0i = floatBitsToInt(float(PS1i));
// 35
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PS1i = floatBitsToInt(float(PV0iz));
// 36
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(R125i.y));
// 37
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iy)));
R127i.z = int(intBitsToFloat(PV0ix));
// 38
PV0ix = 0 - R127i.z;
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iy)));
R125i.y = int(intBitsToFloat(PV1iz));
// 39
PV1ix = 0 - R125i.y;
PV1iw = max(R127i.z, PV0ix);
R124i.w = int(intBitsToFloat(PV0iy));
// 40
PV0ix = max(R125i.y, PV1ix);
R5i.y = int(1) - PV1iw;
PV0iz = 0 - R124i.w;
PS0i = floatBitsToInt(float(R127i.w));
// 41
R5i.x = int(1) - PV0ix;
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iz = max(R124i.w, PV0iz);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R124i.w = int(intBitsToFloat(R126i.y));
// 42
PV0ix = 0 - R124i.w;
R8i.y = int(1) - PV1iz;
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iw)));
PS0i = floatBitsToInt(float(R125i.x));
// 43
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R5i.z = max(R124i.w, PV0ix);
R125i.x = int(intBitsToFloat(PV0iw));
// 44
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iy)));
PV0iz = 0 - R125i.x;
// 45
PV1iy = max(R125i.x, PV0iz);
R3i.w = int(intBitsToFloat(PV0iy));
// 46
R8i.w = int(1) - PV1iy;
}
if( activeMaskStackC[3] == true ) {
R10i.xyzw = floatBitsToInt(uf_blockVS7[R10i.x].xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = 0 - R3i.w;
R125i.y = floatBitsToInt(uf_blockVS7[5].x) & 0x400;
R126i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x800;
R125i.w = int(-1) + R8i.x;
R125i.x = R8i.w * R10i.w;
// 1
R8i.z = max(R3i.w, PV0ix);
R127i.z = R8i.y * R10i.z;
// 2
R126i.y = R5i.x * R10i.y;
// 3
PS1i = R5i.y * R10i.x;
// 4
PV0ix = R126i.y + PS1i;
PS0i = floatBitsToInt(float(R125i.y));
// 5
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = R127i.z + PV0ix;
PS1i = floatBitsToInt(float(R126i.z));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iy)));
R5i.y = R125i.x + PV1iz;
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R126i.y = floatBitsToInt(float(R8i.x));
// 7
R125i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x4000000;
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iw)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R126i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(R126i.y)));
R124i.w = int(intBitsToFloat(PV0ix));
// 8
PV0ix = floatBitsToInt(intBitsToFloat(R6i.y) * intBitsToFloat(PV1iw));
PV0iy = 0 - R124i.w;
R127i.w = int(intBitsToFloat(PV1iy));
// 9
PV1ix = 0 - R127i.w;
R10i.z = max(R124i.w, PV0iy);
PS1i = int(intBitsToFloat(PV0ix));
// 10
R125i.z = max(R127i.w, PV1ix);
R125i.y = R5i.z * PS1i;
// 11
PS1i = floatBitsToInt(float(R2i.z));
// 12
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(R12i.y) * intBitsToFloat(PS0i));
R127i.w = floatBitsToInt(float(R8i.x));
// 14
R8i.x = floatBitsToInt(abs(intBitsToFloat(R127i.w)));
R124i.z = int(intBitsToFloat(PV1ix));
// 15
PS1i = floatBitsToInt(float(R124i.z));
// 16
PV0iw = floatBitsToInt(-(intBitsToFloat(R126i.y)) + intBitsToFloat(PS1i));
R127i.x = floatBitsToInt(float(R124i.z));
// 17
R123i.x = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.z = floatBitsToInt(abs(intBitsToFloat(R127i.x)));
R5i.z = floatBitsToInt(1.0 / abs(intBitsToFloat(R127i.w)));
// 18
PV0iy = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R127i.x)), intBitsToFloat(R5i.z)));
PS0i = int(intBitsToFloat(R123i.x));
// 19
R124i.x = int(1) - PS0i;
PV1iw = floatBitsToInt(trunc(intBitsToFloat(PV0iy)));
R2i.z = PS0i * R125i.w;
// 20
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iw)),intBitsToFloat(R8i.x)) + intBitsToFloat(R127i.z));
PS0i = floatBitsToInt(float(R125i.x));
// 21
PV1ix = floatBitsToInt((intBitsToFloat(R126i.y) >= abs(intBitsToFloat(R127i.w)))?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt(-(abs(intBitsToFloat(R127i.w))) + intBitsToFloat(R126i.y));
R126i.x = int(intBitsToFloat(R126i.z));
// 22
backupReg0i = R125i.z;
R125i.z = ((intBitsToFloat(PV1ix) == 0.0)?(R126i.y):(PV1iw));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iy)));
R125i.w = backupReg0i * R126i.x;
// 23
PV1iy = floatBitsToInt(abs(intBitsToFloat(R127i.w)) + intBitsToFloat(R125i.z));
R125i.x = int(intBitsToFloat(PV0iw));
// 24
PV0iz = 0 - R125i.x;
R123i.w = ((-(intBitsToFloat(R125i.z)) > 0.0)?(PV1iy):(R125i.z));
// 25
R123i.x = ((-(intBitsToFloat(R127i.x)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.w)))):(R123i.w));
PV1iy = max(R125i.x, PV0iz);
// 26
R123i.z = ((intBitsToFloat(R127i.w) == 0.0)?(R127i.x):(R123i.x));
PS0i = PV1iy * R126i.x;
// 27
R126i.y = R124i.z + PS0i;
PS1i = int(intBitsToFloat(R123i.z));
// 28
PS0i = R124i.x * PS1i;
// 29
PV1iy = PS0i + R2i.z;
R124i.x = R10i.z * R126i.y;
// 30
PS0i = R8i.z * PV1iy;
// 31
PV1iw = PS0i + R125i.y;
// 32
PV0ix = R124i.x + PV1iw;
// 33
PV1iz = R125i.w + PV0ix;
// 34
R126i.y = floatBitsToInt(float(PV1iz));
// 35
R124i.z = floatBitsToInt(abs(intBitsToFloat(R126i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), abs(intBitsToFloat(R126i.y))));
// 36
PV0ix = floatBitsToInt(trunc(intBitsToFloat(PV1iw)));
// 37
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0ix)),intBitsToFloat(R8i.x)) + intBitsToFloat(R124i.z));
// 38
PV0ix = floatBitsToInt((intBitsToFloat(R125i.y) >= abs(intBitsToFloat(R127i.w)))?1.0:0.0);
PV0iw = floatBitsToInt(-(abs(intBitsToFloat(R127i.w))) + intBitsToFloat(R125i.y));
// 39
R124i.z = ((intBitsToFloat(PV0ix) == 0.0)?(R125i.y):(PV0iw));
// 40
PV0iy = floatBitsToInt(abs(intBitsToFloat(R127i.w)) + intBitsToFloat(R124i.z));
// 41
R123i.w = ((-(intBitsToFloat(R124i.z)) > 0.0)?(PV0iy):(R124i.z));
// 42
R123i.x = ((-(intBitsToFloat(R126i.y)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.w)))):(R123i.w));
// 43
R123i.z = ((intBitsToFloat(R127i.w) == 0.0)?(R126i.y):(R123i.x));
// 44
R126i.y = int(intBitsToFloat(R123i.z));
// 45
R0i.w = floatBitsToInt(float(R126i.y));
// 46
PV0ix = floatBitsToInt((intBitsToFloat(R0i.w) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(R0i.w))?1.0:0.0);
R8i.x = floatBitsToInt(float(R126i.y));
// 47
R6i.y = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iz)));
R5i.z = floatBitsToInt(abs(intBitsToFloat(R8i.x)) * 0.25);
R10i.w = floatBitsToInt(abs(intBitsToFloat(R8i.x)));
// 48
PV0iy = floatBitsToInt(trunc(intBitsToFloat(R5i.z)));
R123i.w = floatBitsToInt(intBitsToFloat(R6i.y) * 0.5 + intBitsToFloat(R0i.w));
// 49
R124i.x = floatBitsToInt(-(intBitsToFloat(PV0iy)) * 4.0 + intBitsToFloat(R10i.w));
PV1iy = floatBitsToInt(intBitsToFloat(R123i.w) * 0.25);
// 50
PV0ix = floatBitsToInt(trunc(intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt((intBitsToFloat(R124i.x) >= 4.0)?1.0:0.0);
PV0iz = floatBitsToInt(intBitsToFloat(R124i.x) + -4.0);
// 51
R127i.w = ((intBitsToFloat(PV0iy) == 0.0)?(R124i.x):(PV0iz));
PS1i = int(intBitsToFloat(PV0ix));
// 52
PV0ix = floatBitsToInt(intBitsToFloat(R127i.w) + 4.0);
R10i.w = PS1i + 0x1b;
PS0i = int(uf_blockVS7[48].z);
// 53
R123i.z = ((-(intBitsToFloat(R127i.w)) > 0.0)?(PV0ix):(R127i.w));
R3i.w = floatBitsToInt(float(PS0i));
// 54
R123i.y = ((-(intBitsToFloat(R8i.x)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.z)))):(R123i.z));
R8i.x = floatBitsToInt(float(R5i.y));
// 55
R0i.w = int(intBitsToFloat(R123i.y));
}
if( activeMaskStackC[3] == true ) {
R10i.xyzw = floatBitsToInt(uf_blockVS7[R10i.w].xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = int(-1) + R0i.w;
R126i.y = 0xfffffffd + R0i.w;
R124i.z = 0xfffffffe + R0i.w;
R125i.w = floatBitsToInt(abs(intBitsToFloat(R3i.w)));
PS0i = floatBitsToInt(float(R0i.w));
// 1
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(float(PV0ix));
// 2
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iy)));
PS0i = floatBitsToInt(float(R124i.z));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R124i.z = floatBitsToInt((intBitsToFloat(R8i.x) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R124i.x = int(intBitsToFloat(PV0iw));
// 4
PV0ix = 0 - R124i.x;
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(R8i.x))?1.0:0.0);
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iy)));
R125i.z = int(intBitsToFloat(PV1ix));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R124i.z) + -(intBitsToFloat(PV0iy)));
PV1iy = max(R124i.x, PV0ix);
PV1iz = 0 - R125i.z;
R125i.y = int(intBitsToFloat(PV0iz));
// 6
R124i.x = floatBitsToInt(intBitsToFloat(PV1ix) * 0.5 + intBitsToFloat(R8i.x));
PV0iy = int(1) - PV1iy;
PV0iz = 0 - R125i.y;
PV0iw = max(R125i.z, PV1iz);
PS0i = floatBitsToInt(float(R126i.y));
// 7
PV1ix = max(R125i.y, PV0iz);
PV1iy = int(1) - PV0iw;
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R125i.y = PV0iy * R10i.x;
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), uf_blockVS7[45].x));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
R126i.y = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iw)));
PV0iz = int(1) - PV1ix;
PV0iw = floatBitsToInt(uf_blockVS7[44].z + uf_blockVS7[45].x);
PS0i = PV1iy * R10i.y;
// 9
backupReg0i = R125i.y;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), uf_blockVS7[45].y));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
R125i.y = floatBitsToInt(-(intBitsToFloat(PV0ix)) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(uf_blockVS7[44].w + uf_blockVS7[45].y);
PV1iw = PS0i + backupReg0i;
PS1i = PV0iz * R10i.z;
// 10
R127i.x = PS1i + PV1iw;
PV0iy = floatBitsToInt(uf_blockVS7[46].x + uf_blockVS7[46].z);
PV0iz = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(PV1iz));
PV0iw = floatBitsToInt(uf_blockVS7[46].y + uf_blockVS7[46].w);
R127i.w = int(intBitsToFloat(R126i.y));
// 11
PV1ix = 0 - R127i.w;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y),uf_blockVS7[44].y) + intBitsToFloat(PV0iz));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),uf_blockVS7[46].w) + intBitsToFloat(PV0iw));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),uf_blockVS7[46].z) + intBitsToFloat(PV0iy));
R124i.z = floatBitsToInt(float(R5i.y));
// 12
backupReg0i = R125i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y),uf_blockVS7[45].z) + intBitsToFloat(R123i.w));
R125i.y = floatBitsToInt(abs(intBitsToFloat(R124i.z)));
PV0iz = max(R127i.w, PV1ix);
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.y)),uf_blockVS7[44].x) + -(intBitsToFloat(backupReg0i)));
PS0i = floatBitsToInt(1.0 / abs(intBitsToFloat(R3i.w)));
// 13
R126i.x = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
PV1iy = int(1) - PV0iz;
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y),uf_blockVS7[45].w) + intBitsToFloat(R125i.z));
PV1iw = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R124i.z)), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R3i.w));
// 14
backupReg0i = R10i.w;
PV0ix = floatBitsToInt(trunc(intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(intBitsToFloat(R124i.x) * intBitsToFloat(PS1i));
R10i.w = floatBitsToInt(intBitsToFloat(R4i.w) + 0.5);
PS0i = PV1iy * backupReg0i;
// 15
R124i.x = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
PV1iy = floatBitsToInt(trunc(intBitsToFloat(PV0iz)));
R127i.z = PS0i + R127i.x;
R125i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0ix)),intBitsToFloat(R125i.w)) + intBitsToFloat(R125i.y));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[48].z);
// 16
PV0ix = floatBitsToInt(-(abs(intBitsToFloat(R3i.w))) + intBitsToFloat(R125i.w));
R124i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].x, intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt((intBitsToFloat(R125i.w) >= abs(intBitsToFloat(R3i.w)))?1.0:0.0);
R124i.w = floatBitsToInt(intBitsToFloat(R3i.x) + -(0.5));
R127i.w = int(intBitsToFloat(PV1iy));
// 17
R123i.x = ((R1i.y == 0)?(0):(int(1)));
R125i.y = ((intBitsToFloat(PV0iz) == 0.0)?(R125i.w):(PV0ix));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[48].w);
// 18
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].y, intBitsToFloat(PS1i)));
R127i.y = (R123i.x == 0x2)?-1:0;
R125i.z = (R123i.x == int(1))?-1:0;
PV0iw = floatBitsToInt(abs(intBitsToFloat(R3i.w)) + intBitsToFloat(R125i.y));
PS0i = floatBitsToInt(float(R127i.w));
// 19
R123i.x = ((-(intBitsToFloat(R125i.y)) > 0.0)?(PV0iw):(R125i.y));
R123i.y = ((R127i.y == 0)?(R9i.x):(R9i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.x)),intBitsToFloat(PS0i)) + intBitsToFloat(R126i.y));
R126i.z = int(uf_blockVS7[53].z);
// 20
backupReg0i = R123i.x;
R123i.x = ((R127i.y == 0)?(R9i.y):(R9i.x));
R127i.y = ((R125i.z == 0)?(R123i.y):(R9i.y));
R123i.z = ((-(intBitsToFloat(R124i.z)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(backupReg0i)))):(backupReg0i));
R124i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.x)),intBitsToFloat(R124i.w)) + -(intBitsToFloat(R123i.w)));
R127i.w = ((R125i.z == 0)?(R9i.x):(R9i.y));
// 21
R127i.x = ((R125i.z == 0)?(R123i.x):(R9i.z));
R123i.y = ((intBitsToFloat(R3i.w) == 0.0)?(R124i.z):(R123i.z));
R9i.z = ((R125i.z == 0)?(R9i.y):(R9i.z));
// 22
PS0i = int(intBitsToFloat(R123i.y));
// 23
backupReg0i = R127i.y;
PV1ix = floatBitsToInt(uf_blockVS7[49].z + uf_blockVS7[50].x);
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[50].y, intBitsToFloat(R127i.x)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
PV1iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[50].x, intBitsToFloat(backupReg0i)));
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 2.0);
PS1i = floatBitsToInt(float(PS0i));
// 24
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(PS1i)) + intBitsToFloat(R126i.w));
R10i.z = floatBitsToInt(-(intBitsToFloat(PV1iw)) + intBitsToFloat(PV1ix));
PV0iw = floatBitsToInt(uf_blockVS7[49].w + uf_blockVS7[50].y);
R1i.y = floatBitsToInt(float(R126i.z));
// 25
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(R10i.w)) + intBitsToFloat(R123i.x));
R9i.y = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(PV0iw));
R5i.z = floatBitsToInt(abs(intBitsToFloat(R1i.y)));
PV1iw = floatBitsToInt(uf_blockVS7[51].x + uf_blockVS7[51].z);
R10i.w = floatBitsToInt(float(R127i.z));
// 26
R5i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.w)),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.x));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R124i.x)) + intBitsToFloat(R124i.w));
R8i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[51].z,intBitsToFloat(R127i.w)) + intBitsToFloat(PV1iw));
R4i.w = floatBitsToInt((intBitsToFloat(R10i.w) > 0.0)?1.0:0.0);
R3i.x = floatBitsToInt(float(R127i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(R10i.w))?1.0:0.0);
R126i.y = floatBitsToInt(intBitsToFloat(R4i.z) + 0.5);
R127i.z = floatBitsToInt(abs(intBitsToFloat(R3i.x)));
PV0iw = floatBitsToInt(uf_blockVS7[51].y + uf_blockVS7[51].w);
PS0i = floatBitsToInt(1.0 / abs(intBitsToFloat(R1i.y)));
// 1
R126i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[51].w,intBitsToFloat(R9i.z)) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R3i.x)), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(intBitsToFloat(R4i.w) + -(intBitsToFloat(PV0ix)));
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.y)),uf_blockVS7[49].x) + -(intBitsToFloat(R10i.z)));
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(R1i.y));
// 2
R124i.x = floatBitsToInt(intBitsToFloat(R11i.y) + -(0.5));
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * 0.5 + intBitsToFloat(R10i.w));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y),uf_blockVS7[49].y) + intBitsToFloat(R9i.y));
PV0iw = floatBitsToInt(trunc(intBitsToFloat(PV1iy)));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[53].z);
// 3
PV1ix = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(R127i.w));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iw)),intBitsToFloat(R5i.z)) + intBitsToFloat(R127i.z));
R125i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[53].x, intBitsToFloat(PS0i)));
R124i.w = floatBitsToInt(intBitsToFloat(R3i.z) + 1.0);
PS1i = floatBitsToInt(1.0 / uf_blockVS7[53].w);
// 4
PV0ix = floatBitsToInt((intBitsToFloat(R127i.y) >= abs(intBitsToFloat(R1i.y)))?1.0:0.0);
R124i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[53].y, intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(trunc(intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(-(abs(intBitsToFloat(R1i.y))) + intBitsToFloat(R127i.y));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y),uf_blockVS7[50].z) + intBitsToFloat(R8i.z));
// 5
backupReg0i = R127i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y),uf_blockVS7[50].w) + intBitsToFloat(R126i.x));
R127i.y = floatBitsToInt(-(intBitsToFloat(R122i.x)) + 1.0);
R127i.z = ((intBitsToFloat(PV0ix) == 0.0)?(backupReg0i):(PV0iw));
R127i.w = floatBitsToInt(intBitsToFloat(R7i.y) + -(uf_blockVS7[93].x));
PS1i = int(intBitsToFloat(PV0iz));
// 6
R126i.x = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
PV0iy = floatBitsToInt(abs(intBitsToFloat(R1i.y)) + intBitsToFloat(R127i.z));
PV0iz = floatBitsToInt(-(uf_blockVS7[93].x) + uf_blockVS7[93].y);
PS0i = floatBitsToInt(float(PS1i));
// 7
R1i.x = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(R1i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.y)),intBitsToFloat(PS0i)) + intBitsToFloat(R126i.z));
R123i.w = ((-(intBitsToFloat(R127i.z)) > 0.0)?(PV0iy):(R127i.z));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 8
R123i.x = ((-(intBitsToFloat(R3i.x)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.w)))):(R123i.w));
R124i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.y)),intBitsToFloat(R124i.x)) + -(intBitsToFloat(R123i.y)));
R5i.z = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
R5i.z = clampFI32(R5i.z);
R0i.y = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(R15i.y));
// 9
R6i.y = floatBitsToInt(uf_blockVS7[104].x);
R123i.z = ((intBitsToFloat(R1i.y) == 0.0)?(R3i.x):(R123i.x));
R0i.z = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(R0i.z));
// 10
PS0i = int(intBitsToFloat(R123i.z));
// 11
PS1i = floatBitsToInt(float(PS0i));
// 12
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(PS1i)) + intBitsToFloat(R126i.w));
// 13
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R126i.y)) + intBitsToFloat(R123i.w));
// 14
R4i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.z)),intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.w));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y),intBitsToFloat(R126i.x)) + intBitsToFloat(R124i.y));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R126i.x = ((intBitsToFloat(R15i.x) > uf_blockVS13[0].y)?-1:0);
R127i.y = ((intBitsToFloat(R15i.x) > uf_blockVS13[0].z)?-1:0);
PV0iw = ((intBitsToFloat(R15i.x) > uf_blockVS13[0].x)?-1:0);
// 1
PV1iz = PV0iw & int(1);
// 2
PV0iy = PV1iz - R126i.x;
// 3
PV1ix = PV0iy - R127i.y;
// 4
R3i.w = floatBitsToInt(float(PV1ix));
// 5
predResult = (intBitsToFloat(R3i.w) == 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R1i.y = R0i.y;
R1i.z = R0i.z;
R1i.w = 0x3f800000;
// 1
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS13[3].x,uf_blockVS13[3].y,uf_blockVS13[3].z,uf_blockVS13[3].w)));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS13[4].x,uf_blockVS13[4].y,uf_blockVS13[4].z,uf_blockVS13[4].w)));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS13[5].x,uf_blockVS13[5].y,uf_blockVS13[5].z,uf_blockVS13[5].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS13[6].x,uf_blockVS13[6].y,uf_blockVS13[6].z,uf_blockVS13[6].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R2i.z = tempi.x;
PV0iw = tempi.x;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
activeMaskStack[4] = activeMaskStack[3];
activeMaskStackC[5] = activeMaskStackC[4];
// 0
predResult = (intBitsToFloat(R3i.w) == 1.0);
activeMaskStack[4] = predResult;
activeMaskStackC[5] = predResult == true && activeMaskStackC[4] == true;
}
else {
activeMaskStack[4] = false;
activeMaskStackC[5] = false;
}
if( activeMaskStackC[5] == true ) {
// 0
R1i.y = R0i.y;
R1i.z = R0i.z;
R1i.w = 0x3f800000;
// 1
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS13[7].x,uf_blockVS13[7].y,uf_blockVS13[7].z,uf_blockVS13[7].w)));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS13[8].x,uf_blockVS13[8].y,uf_blockVS13[8].z,uf_blockVS13[8].w)));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS13[9].x,uf_blockVS13[9].y,uf_blockVS13[9].z,uf_blockVS13[9].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS13[10].x,uf_blockVS13[10].y,uf_blockVS13[10].z,uf_blockVS13[10].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R2i.z = tempi.x;
PV0iw = tempi.x;
}
activeMaskStack[4] = activeMaskStack[4] == false;
activeMaskStackC[5] = activeMaskStack[4] == true && activeMaskStackC[4] == true;
if( activeMaskStackC[5] == true ) {
// 0
R1i.y = R0i.y;
R1i.z = R0i.z;
R1i.w = 0x3f800000;
// 1
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS13[11].x,uf_blockVS13[11].y,uf_blockVS13[11].z,uf_blockVS13[11].w)));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS13[12].x,uf_blockVS13[12].y,uf_blockVS13[12].z,uf_blockVS13[12].w)));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS13[13].x,uf_blockVS13[13].y,uf_blockVS13[13].z,uf_blockVS13[13].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS13[14].x,uf_blockVS13[14].y,uf_blockVS13[14].z,uf_blockVS13[14].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R2i.z = tempi.x;
PV0iw = tempi.x;
}
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(uf_blockVS6[17].x + -(intBitsToFloat(R16i.x)));
R127i.y = floatBitsToInt(uf_blockVS6[17].y + -(intBitsToFloat(R19i.y)));
R127i.z = floatBitsToInt(uf_blockVS6[17].z + -(intBitsToFloat(R11i.z)));
R124i.w = floatBitsToInt(intBitsToFloat(R2i.w) * intBitsToFloat(R21i.y));
R126i.z = floatBitsToInt(1.0 / intBitsToFloat(R2i.z));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.y = floatBitsToInt(intBitsToFloat(R0i.z) * intBitsToFloat(R126i.z));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS13[17].x,uf_blockVS13[17].y,uf_blockVS13[17].z,uf_blockVS13[17].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
R127i.w = floatBitsToInt(tempResultf);
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS13[15].x,uf_blockVS13[15].y,uf_blockVS13[15].z,uf_blockVS13[15].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R126i.w = tempi.x;
R125i.w = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS13[16].x,uf_blockVS13[16].y,uf_blockVS13[16].z,uf_blockVS13[16].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R125i.z = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R127i.w)));
// 5
R0i.x = floatBitsToInt(intBitsToFloat(R0i.x) * intBitsToFloat(R126i.z));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R127i.w)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.w)));
R0i.w = R126i.y;
R0i.w = clampFI32(R0i.w);
R0i.y = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(R126i.z));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(PV1iy),intBitsToFloat(PV1iz),intBitsToFloat(0x80000000)),vec4(uf_blockVS13[28].x,uf_blockVS13[28].y,uf_blockVS13[28].z,0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.z = floatBitsToInt(roundEven(intBitsToFloat(R3i.w)));
// 7
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R125i.w)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R125i.w)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.x),uf_blockVS13[22].x) + -(uf_blockVS13[22].y));
R123i.z = clampFI32(R123i.z);
R126i.w = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
PS1i = floatBitsToInt(-(intBitsToFloat(R124i.w)) + 1.0);
// 8
PV0ix = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
R123i.y = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3f333333) + intBitsToFloat(0x3e19999a));
R123i.y = clampFI32(R123i.y);
R125i.z = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
R123i.w = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
R3i.y = 0;
// 9
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.x),uf_blockVS13[24].x) + -(uf_blockVS13[24].y));
R127i.x = clampFI32(R127i.x);
PV1iy = floatBitsToInt(uf_blockVS13[28].y + 1.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R123i.w)) + intBitsToFloat(0xbe593484));
PV1iw = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R126i.y = floatBitsToInt(tempResultf);
// 10
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) * 1.5);
PV0ix = clampFI32(PV0ix);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R123i.z)) + intBitsToFloat(0x3fc90da4));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + 8.5);
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS13[23].y, intBitsToFloat(R126i.y)));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(R125i.z)));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f22f983));
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) * 15.0);
R3i.z = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3daaaaab));
R1i.w = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 12
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),-(intBitsToFloat(R127i.y))) + 1.0);
R2i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
R1i.z = floatBitsToInt(uf_blockVS13[28].y * 1.0 + intBitsToFloat(R15i.x));
R2i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS13[23].x, intBitsToFloat(R126i.y)));
R4i.y = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
}
if( activeMaskStackC[3] == true ) {
R0i.w = floatBitsToInt(texture(textureUnitVS12, vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))));
R0i.z = floatBitsToInt(texture(textureUnitVS7, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y))).x);
R2i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y))).xyz);
R3i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R3i.z),intBitsToFloat(R3i.y))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R0i.w)) + 1.0);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), uf_blockVS13[1].y));
PV0iw = floatBitsToInt(intBitsToFloat(R1i.z) * intBitsToFloat(R4i.y));
tempResultf = max(0.0, intBitsToFloat(R1i.w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R126i.w = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(min(uf_blockVS6[17].y, uf_blockVS13[27].z));
PV1iy = floatBitsToInt(max(intBitsToFloat(PV0iw), intBitsToFloat(0x3e4ccccd)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R127i.y)) + 1.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(R2i.w)));
// 2
R1i.x = floatBitsToInt(mul_nonIEEE(-(uf_blockVS13[23].z),intBitsToFloat(PS1i)) + uf_blockVS13[23].z);
R1i.x = clampFI32(R1i.x);
R4i.y = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.z));
R125i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS13[24].w, intBitsToFloat(R126i.w)));
PV0iw = floatBitsToInt(-(intBitsToFloat(R15i.y)) + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(min(intBitsToFloat(PV1iy), 1.0));
// 3
backupReg0i = R2i.z;
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PS0i)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PS0i)));
R2i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS13[27].y,intBitsToFloat(PV0iw)) + uf_blockVS13[27].x);
R2i.z = clampFI32(R2i.z);
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PS0i)));
// 4
R2i.w = floatBitsToInt(exp2(intBitsToFloat(R125i.z)));
}
if( activeMaskStackC[3] == true ) {
// 0
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), uf_blockVS13[26].w));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), uf_blockVS11[5].z));
// 1
R0i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.w)),uf_blockVS13[25].w) + uf_blockVS13[25].w);
PV1iy = floatBitsToInt(-(intBitsToFloat(R0i.w)) + intBitsToFloat(R1i.x));
PV1iy = clampFI32(PV1iy);
// 2
R0i.z = PV1iy;
R1i.w = PV1iy;
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R1i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS8[3].x,intBitsToFloat(R5i.z)) + 0.0);
// 1
predResult = (0.0 >= intBitsToFloat(R5i.z));
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R20i.x = 0;
R20i.y = 0;
R20i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R8i.x = 0;
// 1
R24i.x = R6i.x;
R24i.y = R17i.y;
R24i.z = R7i.z;
R25i.x = R4i.x;
// 2
R26i.x = R11i.x;
R25i.y = R18i.y;
R25i.z = R12i.z;
R26i.y = R16i.y;
// 3
R26i.z = R6i.z;
// 4
R1i.x = R8i.x;
R1i.y = R6i.y;
R1i.z = R14i.z;
R5i.w = R7i.w;
// 5
R27i.x = R0i.x;
R27i.y = R0i.y;
R27i.z = R0i.z;
R27i.w = R0i.w;
// 6
R28i.x = R2i.x;
R28i.y = R2i.y;
R28i.z = R8i.z;
R28i.w = R1i.w;
// 7
R29i.x = R3i.x;
R29i.y = R3i.y;
R29i.z = R3i.z;
R29i.w = R3i.w;
// 8
R30i.x = R5i.x;
R30i.y = R5i.y;
R30i.z = R4i.z;
R30i.w = R4i.w;
// 9
R14i.x = R8i.x;
R14i.y = R6i.y;
R14i.z = R14i.z;
// 10
R31i.x = R12i.x;
R31i.y = R23i.y;
R31i.z = R18i.z;
R31i.w = R9i.w;
// 11
R32i.x = R7i.x;
R32i.y = R22i.y;
R32i.z = R17i.z;
R32i.w = R6i.w;
// 12
R13i.x = R20i.x;
R13i.y = R20i.y;
R13i.z = R20i.z;
R13i.w = R20i.w;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R1i.x = R1i.x;
R1i.y = R6i.y;
R1i.z = R14i.z;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R13i.x = ((R5i.w == 0)?(R20i.x):(R13i.x));
R13i.y = ((R5i.w == 0)?(R20i.y):(R13i.y));
R13i.z = ((R5i.w == 0)?(R20i.z):(R13i.z));
R13i.w = ((R5i.w == 0)?(R20i.w):(R13i.w));
// 1
R11i.x = R11i.x;
// 2
R0i.x = ((R5i.w == 0)?(R0i.x):(R27i.x));
R0i.y = ((R5i.w == 0)?(R0i.y):(R27i.y));
R0i.z = ((R5i.w == 0)?(R0i.z):(R27i.z));
R0i.w = ((R5i.w == 0)?(R0i.w):(R27i.w));
R16i.x = ((R5i.w == 0)?(R11i.x):(R26i.x));
// 3
R11i.x = ((R5i.w == 0)?(R2i.x):(R28i.x));
R11i.y = ((R5i.w == 0)?(R2i.y):(R28i.y));
R11i.z = ((R5i.w == 0)?(R8i.z):(R28i.z));
R11i.w = ((R5i.w == 0)?(R1i.w):(R28i.w));
// 4
R15i.x = ((R5i.w == 0)?(R3i.x):(R29i.x));
R15i.y = ((R5i.w == 0)?(R3i.y):(R29i.y));
R15i.z = ((R5i.w == 0)?(R3i.z):(R29i.z));
R15i.w = ((R5i.w == 0)?(R3i.w):(R29i.w));
// 5
R19i.x = ((R5i.w == 0)?(R4i.x):(R25i.x));
R16i.y = ((R5i.w == 0)?(R16i.y):(R26i.y));
R16i.z = ((R5i.w == 0)?(R6i.z):(R26i.z));
R16i.w = R26i.w;
// 6
R20i.x = ((R5i.w == 0)?(R6i.x):(R24i.x));
R19i.y = ((R5i.w == 0)?(R18i.y):(R25i.y));
R19i.z = ((R5i.w == 0)?(R12i.z):(R25i.z));
R19i.w = R25i.w;
// 7
R21i.x = ((R5i.w == 0)?(R5i.x):(R30i.x));
R20i.y = ((R5i.w == 0)?(R17i.y):(R24i.y));
R20i.z = ((R5i.w == 0)?(R7i.z):(R24i.z));
R20i.w = R24i.w;
// 8
R14i.x = ((R5i.w == 0)?(R1i.x):(R14i.x));
R21i.y = ((R5i.w == 0)?(R5i.y):(R30i.y));
R21i.z = ((R5i.w == 0)?(R4i.z):(R30i.z));
R21i.w = ((R5i.w == 0)?(R4i.w):(R30i.w));
// 9
R18i.x = ((R5i.w == 0)?(R12i.x):(R31i.x));
R14i.y = ((R5i.w == 0)?(R1i.y):(R14i.y));
R14i.z = ((R5i.w == 0)?(R1i.z):(R14i.z));
// 10
R17i.x = ((R5i.w == 0)?(R7i.x):(R32i.x));
R18i.y = ((R5i.w == 0)?(R23i.y):(R31i.y));
R18i.z = ((R5i.w == 0)?(R18i.z):(R31i.z));
R18i.w = ((R5i.w == 0)?(R9i.w):(R31i.w));
// 11
R17i.y = ((R5i.w == 0)?(R22i.y):(R32i.y));
R17i.z = ((R5i.w == 0)?(R17i.z):(R32i.z));
R17i.w = ((R5i.w == 0)?(R6i.w):(R32i.w));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R21i.x), intBitsToFloat(R21i.y), intBitsToFloat(R21i.z), intBitsToFloat(R21i.w));
// export
passParameterSem10 = vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.w));
// export
passParameterSem13 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.z));
}
