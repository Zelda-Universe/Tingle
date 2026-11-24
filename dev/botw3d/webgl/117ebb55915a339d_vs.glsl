#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 117ebb55915a339d
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
ATTR_LAYOUT(0, 8) in uvec4 attrDataSem8;
ATTR_LAYOUT(0, 9) in uvec4 attrDataSem9;
ATTR_LAYOUT(0, 10) in uvec4 attrDataSem10;

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem3;
out vec4 passParameterSem7;
out vec4 passParameterSem8;
out vec4 passParameterSem11;
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
attrDecoder = attrDataSem10;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R10i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
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
R3i.z = floatBitsToInt(-(intBitsToFloat(R9i.y)) + 1.0);
R2i.w = 0;
R5i.w = floatBitsToInt(1.0);
// 1
R14i.w = floatBitsToInt(-(intBitsToFloat(R4i.w)) + uf_blockVS8[2].x);
R4i.w = floatBitsToInt(-(intBitsToFloat(R9i.x)) + 1.0);
// 2
predResult = (0.0 > intBitsToFloat(R14i.w));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R17i.x = 0;
R17i.y = 0;
R17i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R18i.x = 0;
// 1
R6i.w = R5i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R6i.w = R2i.w;
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
PS0i = int(intBitsToFloat(R3i.w));
// 1
R3i.x = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R14i.w) >= intBitsToFloat(R3i.x));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R17i.x = 0;
R17i.y = 0;
R17i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R18i.x = 0;
// 1
R2i.w = R5i.w;
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
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), uf_blockVS7[10].y));
R124i.y = floatBitsToInt(max(intBitsToFloat(R7i.x), 0.0));
PV0iz = floatBitsToInt((0.0 > uf_blockVS7[9].x)?1.0:0.0);
PV0iw = floatBitsToInt((uf_blockVS7[9].x > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(1.0 / uf_blockVS7[9].x);
// 1
R126i.x = floatBitsToInt(-(uf_blockVS7[96].z) + uf_blockVS7[97].z);
R127i.y = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(intBitsToFloat(R14i.w) * intBitsToFloat(PS0i));
R127i.w = floatBitsToInt(-(uf_blockVS7[96].w) + uf_blockVS7[97].w);
R13i.x = floatBitsToInt(1.0 / intBitsToFloat(R3i.x));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
PV0iy = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV1iz));
R127i.z = floatBitsToInt(-(uf_blockVS7[96].x) + uf_blockVS7[97].x);
R3i.w = floatBitsToInt(intBitsToFloat(R14i.w) * intBitsToFloat(R13i.x));
R126i.y = floatBitsToInt(-(uf_blockVS7[96].y) + uf_blockVS7[97].y);
// 3
PV1ix = floatBitsToInt(fract(intBitsToFloat(PV0iy)));
R125i.y = floatBitsToInt(-(uf_blockVS7[97].w) + uf_blockVS7[98].w);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(PV0ix)));
R126i.w = floatBitsToInt(-(uf_blockVS7[97].z) + uf_blockVS7[98].z);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 4
R127i.x = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV1ix)));
R127i.z = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(PS1i));
R125i.w = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(PS1i));
R127i.w = floatBitsToInt(-(uf_blockVS7[97].x) + uf_blockVS7[98].x);
// 5
R126i.x = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV0iy));
R127i.y = floatBitsToInt(min(intBitsToFloat(R124i.y), 0.0));
PV1iz = floatBitsToInt(-(uf_blockVS7[97].y) + uf_blockVS7[98].y);
R5i.w = 0x3f800000;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R125i.y));
// 6
R125i.x = floatBitsToInt(intBitsToFloat(R126i.x) + -(uf_blockVS7[97].w));
R125i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(PS1i));
R126i.z = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
R127i.w = floatBitsToInt(intBitsToFloat(R126i.x) + -(uf_blockVS7[96].w));
R124i.x = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS1i));
// 7
R0i.x = ((intBitsToFloat(R125i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R127i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R127i.x)));
PV1iw = floatBitsToInt(intBitsToFloat(R126i.x) + -(uf_blockVS7[98].w));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R125i.w)));
// 8
R126i.x = floatBitsToInt(-(intBitsToFloat(R0i.x)) + 1.0);
R124i.y = ((intBitsToFloat(R127i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.z = ((intBitsToFloat(PV1iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.w = floatBitsToInt(uf_blockVS7[96].x + intBitsToFloat(PV1iz));
R127i.z = floatBitsToInt(uf_blockVS7[96].y + intBitsToFloat(PV1iy));
// 9
backupReg0i = R127i.x;
backupReg1i = R125i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R124i.x)));
R125i.y = floatBitsToInt(uf_blockVS7[96].z + intBitsToFloat(backupReg0i));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(backupReg1i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R126i.z)));
PS1i = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R126i.x)));
R124i.y = floatBitsToInt(-(intBitsToFloat(R124i.y)) + 1.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PS1i)));
R125i.w = floatBitsToInt(uf_blockVS7[97].x + intBitsToFloat(PV1iw));
R126i.w = floatBitsToInt(uf_blockVS7[97].y + intBitsToFloat(PV1iz));
// 11
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0ix)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV0ix)));
R127i.z = floatBitsToInt(uf_blockVS7[97].z + intBitsToFloat(backupReg0i));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].x, intBitsToFloat(R124i.y)));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].z, intBitsToFloat(R124i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].y, intBitsToFloat(R124i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R126i.z)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R126i.z)));
// 13
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R126i.z)));
R124i.y = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0iz));
R125i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[98].x, intBitsToFloat(R125i.z)));
// 14
PV0ix = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV1iw));
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockVS7[98].y, intBitsToFloat(R125i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockVS7[98].z, intBitsToFloat(R125i.z)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PV1iz));
R0i.x = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(R127i.y));
// 15
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(R124i.y));
PV1iw = floatBitsToInt(uf_blockVS7[13].x);
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) / 2.0);
PS1i = floatBitsToInt(uf_blockVS7[13].y);
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 16
backupReg0i = R8i.y;
R8i.x = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV1iw));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(PV1ix)));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1iy)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1iz)));
R0i.y = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(PS1i));
// 17
R2i.w = 0x3f800000;
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), uf_blockVS8[3].y));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), uf_blockVS8[3].z));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), uf_blockVS8[3].w));
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), uf_blockVS8[3].y));
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R8i.x)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(R0i.y)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(uf_blockVS6[12].z);
R125i.y = floatBitsToInt(uf_blockVS6[13].z);
// 2
R3i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R5i.w)),vec4(uf_blockVS8[4].x,uf_blockVS8[4].y,uf_blockVS8[4].z,uf_blockVS8[4].w)));
PV0iy = R3i.x;
PV0iz = R3i.x;
PV0iw = R3i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PV1iw)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R5i.w)),vec4(uf_blockVS8[5].x,uf_blockVS8[5].y,uf_blockVS8[5].z,uf_blockVS8[5].w)));
PV1ix = tempi.x;
R14i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R125i.y)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R5i.w)),vec4(uf_blockVS8[6].x,uf_blockVS8[6].y,uf_blockVS8[6].z,uf_blockVS8[6].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R1i.z = tempi.x;
PV0iw = tempi.x;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R124i.y),intBitsToFloat(R125i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS6[12].x,uf_blockVS6[12].y,uf_blockVS6[12].z,uf_blockVS6[12].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.y = floatBitsToInt(uf_blockVS6[12].y);
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R124i.y),intBitsToFloat(R125i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS6[13].x,uf_blockVS6[13].y,uf_blockVS6[13].z,uf_blockVS6[13].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R4i.x = floatBitsToInt(intBitsToFloat(R3i.x) + intBitsToFloat(PV1ix));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R124i.y),intBitsToFloat(R125i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS6[14].x,uf_blockVS6[14].y,uf_blockVS6[14].z,uf_blockVS6[14].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R4i.y = floatBitsToInt(intBitsToFloat(R14i.y) + intBitsToFloat(PV0ix));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS8[6].x,uf_blockVS8[6].y,uf_blockVS8[6].z,0.0)));
PV0ix = tempi.x;
R124i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R4i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV1ix));
// 9
R0i.x = floatBitsToInt(-(intBitsToFloat(R3i.x)) + intBitsToFloat(R4i.x));
R0i.y = floatBitsToInt(-(intBitsToFloat(R14i.y)) + intBitsToFloat(R4i.y));
R0i.z = floatBitsToInt(-(intBitsToFloat(R1i.z)) + intBitsToFloat(R4i.z));
PV1iw = floatBitsToInt(uf_blockVS6[14].z);
R126i.w = floatBitsToInt(uf_blockVS6[13].y);
// 10
R1i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS8[4].x,uf_blockVS8[4].y,uf_blockVS8[4].z,0.0)));
PV0iy = R1i.x;
PV0iz = R1i.x;
PV0iw = R1i.x;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PV1iw)));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS8[5].x,uf_blockVS8[5].y,uf_blockVS8[5].z,0.0)));
PV1ix = tempi.x;
R1i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R2i.z = floatBitsToInt(intBitsToFloat(R124i.y) + intBitsToFloat(0x358637bd));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(uf_blockVS6[14].y);
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R2i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R124i.y = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R2i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 15
PV1ix = ((intBitsToFloat(R124i.y) > 0.0)?-1:0);
PV1iy = ((intBitsToFloat(PS0i) > 0.0)?-1:0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R126i.w)) + intBitsToFloat(R127i.z));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R125i.y)) + intBitsToFloat(R126i.x));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 16
R2i.x = ((PV1ix == 0)?(0):(PV1iy));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PS1i)));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PS1i)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R127i.x)) + intBitsToFloat(R127i.y));
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PS1i)));
// 17
PV1ix = floatBitsToInt(uf_blockVS6[13].x);
PV1iw = floatBitsToInt(uf_blockVS6[12].x);
// 18
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(PV1iw)) + intBitsToFloat(R126i.w));
R21i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(PV1ix)) + intBitsToFloat(R127i.z));
PV0iz = floatBitsToInt(uf_blockVS6[14].x);
// 19
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(PV0iz)) + intBitsToFloat(R125i.w));
// 20
predResult = (R2i.x != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), uf_blockVS7[95].x));
// 1
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), uf_blockVS7[95].x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), uf_blockVS7[95].x));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PS1i)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R2i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.z)));
// 5
R4i.x = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV0iy));
R4i.y = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV0ix));
R4i.z = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(PV0iw));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R3i.x) + -(uf_blockVS6[17].x));
PV0iy = floatBitsToInt(intBitsToFloat(R14i.y) + -(uf_blockVS6[17].y));
PV0iz = floatBitsToInt(intBitsToFloat(R1i.z) + -(uf_blockVS6[17].z));
R2i.w = 0x3f800000;
R0i.w = floatBitsToInt(-(intBitsToFloat(R3i.x)) + intBitsToFloat(R4i.x));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R2i.y = floatBitsToInt(-(intBitsToFloat(R14i.y)) + intBitsToFloat(R4i.y));
// 2
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), uf_blockVS7[13].z));
R0i.z = floatBitsToInt(-(intBitsToFloat(R1i.z)) + intBitsToFloat(R4i.z));
R5i.w = 0x3f800000;
R0i.x = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R14i.y),intBitsToFloat(R1i.z),intBitsToFloat(R5i.w)),vec4(uf_blockVS6[10].x,uf_blockVS6[10].y,uf_blockVS6[10].z,uf_blockVS6[10].w)));
PV1ix = tempi.x;
R127i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R14i.y),intBitsToFloat(R1i.z),intBitsToFloat(R5i.w)),vec4(uf_blockVS6[11].x,uf_blockVS6[11].y,uf_blockVS6[11].z,uf_blockVS6[11].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 5
PV1ix = PV0ix;
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) / 2.0);
R123i.z = floatBitsToInt(intBitsToFloat(R127i.y) * 0.0 + intBitsToFloat(PV0ix));
// 6
R127i.w = floatBitsToInt(intBitsToFloat(R127i.y) * 0.5 + intBitsToFloat(PV1ix));
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R123i.z));
// 7
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockVS7[13].z, intBitsToFloat(R127i.w)));
// 8
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(R127i.x));
// 9
PV1iy = floatBitsToInt(uf_blockVS7[13].z + -(intBitsToFloat(PV0iw)));
// 10
PV0iz = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(PV1iy)));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PV0iz));
// 12
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS6[18].w, intBitsToFloat(PV1ix)));
// 13
R0i.y = floatBitsToInt(-(uf_blockVS6[18].y) + intBitsToFloat(PV0iw));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(min(intBitsToFloat(R0i.x), uf_blockVS7[116].x));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[116].x);
// 1
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R0i.y));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV1iy)));
R5i.y = floatBitsToInt(-(uf_blockVS6[18].z) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PV1iy)));
// 3
R5i.x = floatBitsToInt(intBitsToFloat(R3i.x) + intBitsToFloat(PV0iz));
R8i.y = floatBitsToInt(intBitsToFloat(R14i.y) + intBitsToFloat(PV0ix));
R4i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0iw));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R8i.y),intBitsToFloat(R4i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS6[8].x,uf_blockVS6[8].y,uf_blockVS6[8].z,uf_blockVS6[8].w)));
PV0ix = tempi.x;
R6i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R8i.y),intBitsToFloat(R4i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS6[9].x,uf_blockVS6[9].y,uf_blockVS6[9].z,uf_blockVS6[9].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R8i.w = tempi.x;
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R8i.y),intBitsToFloat(R4i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS6[11].x,uf_blockVS6[11].y,uf_blockVS6[11].z,uf_blockVS6[11].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R6i.z = tempi.x;
PV0iw = tempi.x;
// 7
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R8i.y),intBitsToFloat(R4i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS6[0].x,uf_blockVS6[0].y,uf_blockVS6[0].z,uf_blockVS6[0].w)));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
R126i.z = PV0ix;
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) / 2.0);
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R8i.y),intBitsToFloat(R4i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS6[1].x,uf_blockVS6[1].y,uf_blockVS6[1].z,uf_blockVS6[1].w)));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R11i.y = floatBitsToInt(intBitsToFloat(R6i.z) * 1.0);
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R8i.y),intBitsToFloat(R4i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS6[2].x,uf_blockVS6[2].y,uf_blockVS6[2].z,uf_blockVS6[2].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R12i.w = floatBitsToInt(intBitsToFloat(R8i.w) * -(0.5) + intBitsToFloat(R126i.z));
// 10
R6i.x = floatBitsToInt(intBitsToFloat(R6i.y) * 0.5 + intBitsToFloat(R126i.z));
R127i.z = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(PV1ix));
R3i.x = floatBitsToInt(1.0 / intBitsToFloat(R11i.y));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R8i.y),intBitsToFloat(R4i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS6[3].x,uf_blockVS6[3].y,uf_blockVS6[3].z,uf_blockVS6[3].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R127i.w = tempi.x;
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(PV1ix)),vec4(uf_blockVS6[6].x,uf_blockVS6[6].y,uf_blockVS6[6].z,uf_blockVS6[6].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R126i.w = tempi.x;
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w)),vec4(uf_blockVS6[7].x,uf_blockVS6[7].y,uf_blockVS6[7].z,uf_blockVS6[7].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 14
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 15
PV1iy = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS0i));
// 16
R9i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(PV1iy)));
// 17
R8i.x = floatBitsToInt(intBitsToFloat(R9i.w) * 0.5 + intBitsToFloat(R126i.z));
// 18
PV0iy = floatBitsToInt(intBitsToFloat(R8i.x) * intBitsToFloat(R3i.x));
// 19
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),uf_blockVS6[18].w) + -(uf_blockVS6[18].y));
// 20
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R123i.w));
// 21
R4i.x = floatBitsToInt(-(uf_blockVS6[18].z) * intBitsToFloat(PS0i));
}
if( activeMaskStackC[3] == true ) {
// 0
R2i.y = floatBitsToInt(uf_blockVS7[60].y);
R0i.z = floatBitsToInt(uf_blockVS7[60].z);
R2i.w = floatBitsToInt(uf_blockVS7[60].x);
// 1
PV1ix = floatBitsToInt((uf_blockVS7[8].y > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((uf_blockVS7[8].z > 0.0)?1.0:0.0);
PV1iz = floatBitsToInt((0.0 > uf_blockVS7[8].z)?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > uf_blockVS7[8].y)?1.0:0.0);
PS1i = floatBitsToInt(1.0 / uf_blockVS7[8].y);
// 2
R126i.x = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iz)));
R127i.y = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(intBitsToFloat(R14i.w) * intBitsToFloat(PS1i));
R126i.w = floatBitsToInt(-(uf_blockVS7[68].x) + uf_blockVS7[69].x);
// 3
R126i.z = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),uf_blockVS7[9].z) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[8].z);
// 4
PV0ix = floatBitsToInt(-(uf_blockVS7[68].w) + uf_blockVS7[69].w);
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R127i.z = floatBitsToInt(intBitsToFloat(R14i.w) * intBitsToFloat(PS1i));
R124i.w = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV0iy)));
R127i.w = floatBitsToInt(-(uf_blockVS7[69].x) + uf_blockVS7[70].x);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 6
PV0ix = floatBitsToInt(-(uf_blockVS7[69].w) + uf_blockVS7[70].w);
R127i.y = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS1i));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(R126i.z)) + intBitsToFloat(PV1ix));
// 7
R127i.x = floatBitsToInt(intBitsToFloat(R126i.w) + -(uf_blockVS7[69].w));
PV1iy = floatBitsToInt(intBitsToFloat(R126i.w) + -(uf_blockVS7[68].w));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 8
PV0ix = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.w) + -(uf_blockVS7[70].w));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R127i.y)) + uf_blockVS7[68].x);
R127i.w = ((intBitsToFloat(PV1iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.w = ((intBitsToFloat(R127i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 9
PV1ix = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
R127i.y = ((intBitsToFloat(R126i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iz = floatBitsToInt(intBitsToFloat(R126i.w) + -(uf_blockVS7[71].w));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PV0ix)) + uf_blockVS7[69].x);
R126i.z = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
// 10
R125i.x = ((intBitsToFloat(PV1iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
R124i.z = floatBitsToInt(-(uf_blockVS7[70].x) + uf_blockVS7[71].x);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV1ix)));
// 11
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(-(uf_blockVS7[70].w) + uf_blockVS7[71].w);
PV1iw = floatBitsToInt(-(intBitsToFloat(R125i.x)) + 1.0);
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(uf_blockVS7[68].x, intBitsToFloat(R126i.z)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV1iw)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),uf_blockVS7[9].w) + intBitsToFloat(R127i.z));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 13
backupReg0i = R125i.z;
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV1iy = floatBitsToInt(intBitsToFloat(R124i.z) * intBitsToFloat(PS0i));
R125i.z = floatBitsToInt(-(uf_blockVS7[76].x) + uf_blockVS7[77].x);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R127i.w)) + intBitsToFloat(PV0ix));
R124i.x = floatBitsToInt(-(uf_blockVS7[76].y) + uf_blockVS7[77].y);
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV1ix)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(PV1iy)) + uf_blockVS7[70].x);
// 15
R127i.x = floatBitsToInt(-(uf_blockVS7[76].z) + uf_blockVS7[77].z);
PV1iy = floatBitsToInt(-(uf_blockVS7[76].w) + uf_blockVS7[77].w);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.y));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(R124i.w)) + intBitsToFloat(PV0ix));
// 16
R2i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[71].x,intBitsToFloat(R125i.x)) + intBitsToFloat(R123i.z));
R127i.y = floatBitsToInt(intBitsToFloat(R124i.w) + -(uf_blockVS7[76].w));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 17
PV1ix = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS0i));
R125i.z = ((intBitsToFloat(R127i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iw = floatBitsToInt(intBitsToFloat(R124i.x) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(intBitsToFloat(R124i.w) + -(uf_blockVS7[77].w));
// 18
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PV1iw)) + uf_blockVS7[76].y);
R126i.y = ((intBitsToFloat(PS1i) >= 0.0)?(floatBitsToInt(1.0)):(0));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PV1ix)) + uf_blockVS7[76].x);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PV1iy)) + uf_blockVS7[76].z);
PS0i = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
// 19
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[76].x, intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[76].y, intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[76].z, intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
// 20
PV0ix = floatBitsToInt((0.0 > uf_blockVS7[8].w)?1.0:0.0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt((uf_blockVS7[8].w > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(1.0 / uf_blockVS7[8].w);
// 21
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(PV0iy)) + intBitsToFloat(R127i.y));
R127i.y = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0ix)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(PV0iy)) + intBitsToFloat(R127i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(PV0iy)) + intBitsToFloat(R127i.z));
R124i.w = floatBitsToInt(intBitsToFloat(R14i.w) * intBitsToFloat(PS0i));
// 22
R0i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[77].z,intBitsToFloat(R126i.y)) + intBitsToFloat(R123i.w));
R0i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[77].x,intBitsToFloat(R126i.y)) + intBitsToFloat(R123i.z));
R2i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[77].y,intBitsToFloat(R126i.y)) + intBitsToFloat(R123i.x));
R126i.w = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
// 23
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),uf_blockVS7[10].x) + intBitsToFloat(R124i.w));
// 24
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
// 25
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV0iz)));
// 26
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(R126i.w)) + intBitsToFloat(PV1iw));
}
if( activeMaskStackC[3] == true ) {
// 0
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), uf_blockVS8[0].w));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), uf_blockVS8[0].y));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), uf_blockVS8[0].z));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), uf_blockVS8[0].x));
// 1
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), uf_blockVS7[59].x));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), uf_blockVS7[59].x));
R11i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), uf_blockVS7[59].x));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), uf_blockVS8[1].z));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), uf_blockVS8[1].x));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), uf_blockVS8[1].y));
PV0iw = ((intBitsToFloat(R7i.x) > 0.5)?-1:0);
PS0i = ((intBitsToFloat(R7i.y) > 0.5)?-1:0);
// 3
R11i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(PV0ix)));
R12i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(PV0iy)));
R8i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(PV0iz)));
R2i.w = ((PV0iw == 0)?(R9i.x):(R4i.w));
R0i.w = ((PS0i == 0)?(R9i.y):(R3i.z));
// 4
PV0iy = ((intBitsToFloat(R7i.w) > 0.5)?-1:0);
PV0iw = ((intBitsToFloat(R7i.z) > 0.5)?-1:0);
// 5
R0i.y = ((PV0iw == 0)?(R9i.x):(R4i.w));
R2i.z = ((PV0iy == 0)?(R9i.y):(R3i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iy = floatBitsToInt(intBitsToFloat(R3i.y) + -(uf_blockVS7[85].w));
R127i.z = floatBitsToInt(intBitsToFloat(R3i.y) + -(uf_blockVS7[84].w));
PV0iw = floatBitsToInt(-(uf_blockVS7[84].w) + uf_blockVS7[85].w);
// 1
PV1ix = floatBitsToInt(-(uf_blockVS7[84].x) + uf_blockVS7[85].x);
R124i.z = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.w = ((intBitsToFloat(R127i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R124i.z)) + 1.0);
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(uf_blockVS7[5].x) & 0x80000;
PS0i = floatBitsToInt(uf_blockVS7[5].x) & 0x100000;
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV0iz)) + uf_blockVS7[84].x);
PV1iy = (PV0iw == 0x80000)?-1:0;
PV1iz = floatBitsToInt(mul_nonIEEE(uf_blockVS7[84].x, intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV0ix)));
PS1i = (PS0i == 0x100000)?-1:0;
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(PV1iw)) + intBitsToFloat(PV1iz));
R4i.y = ((PS1i == 0)?(R9i.y):(R0i.w));
PV0iz = floatBitsToInt(uf_blockVS7[5].x) & 0x200000;
R6i.w = ((PV1iy == 0)?(R9i.x):(R2i.w));
PS0i = floatBitsToInt(uf_blockVS7[5].x) & 0x400000;
// 5
PV1ix = (PV0iz == 0x200000)?-1:0;
PV1iy = (PS0i == 0x400000)?-1:0;
PV1iz = floatBitsToInt(uf_blockVS7[5].y) & int(1);
R0i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[85].x,intBitsToFloat(R124i.z)) + intBitsToFloat(R123i.x));
R127i.y = floatBitsToInt(uf_blockVS7[5].x) & 0x100;
// 6
R0i.x = ((PV1iy == 0)?(R9i.y):(R2i.z));
R3i.y = (int(1) != PV1iz)?-1:0;
R3i.z = ((PV1ix == 0)?(R9i.x):(R0i.y));
R126i.w = floatBitsToInt(uf_blockVS7[5].x) & 0x200;
R9i.x = int(uf_blockVS7[26].x);
// 7
R127i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x800;
R126i.y = floatBitsToInt(uf_blockVS7[5].x) & 0x400;
R0i.z = ((R3i.y == 0)?(R7i.x):(R7i.y));
R2i.w = int(uf_blockVS7[26].y);
// 8
PS0i = floatBitsToInt(float(R127i.y));
// 9
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PS1i = floatBitsToInt(float(R126i.w));
// 10
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PS0i = floatBitsToInt(float(R126i.y));
// 11
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R124i.z = int(intBitsToFloat(PV0iy));
// 12
PV0ix = 0 - R124i.z;
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iw)));
R127i.z = int(intBitsToFloat(PV1iy));
// 13
PV1ix = 0 - R127i.z;
R3i.w = max(R124i.z, PV0ix);
R124i.z = int(intBitsToFloat(PV0iy));
// 14
PV0ix = 0 - R124i.z;
R5i.w = max(R127i.z, PV1ix);
PS0i = floatBitsToInt(float(R127i.x));
// 15
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R4i.w = max(R124i.z, PV0ix);
// 16
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iy)));
// 17
R2i.z = int(intBitsToFloat(PV0iy));
}
if( activeMaskStackC[3] == true ) {
// 0
R13i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), uf_blockVS8[1].w));
// 1
PV1ix = 0 - R2i.z;
R127i.y = int(-1) + R9i.x;
R124i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x4000000;
R126i.y = floatBitsToInt(float(R9i.x));
// 2
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R126i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.w), intBitsToFloat(R126i.y)));
R127i.w = max(R2i.z, PV1ix);
PS0i = floatBitsToInt(float(R2i.w));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(R13i.x) * intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 4
R127i.x = floatBitsToInt(intBitsToFloat(R14i.w) * intBitsToFloat(PS1i));
PS0i = int(intBitsToFloat(PV1ix));
// 5
R125i.y = R3i.w * PS0i;
// 6
R125i.w = int(intBitsToFloat(R127i.x));
// 7
PS1i = floatBitsToInt(float(R125i.w));
// 8
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.y)) + intBitsToFloat(PS1i));
R125i.z = floatBitsToInt(float(R9i.x));
// 9
R123i.x = ((intBitsToFloat(PV0iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.y = floatBitsToInt(abs(intBitsToFloat(R125i.z)));
R125i.x = floatBitsToInt(float(R125i.w));
// 10
R124i.w = floatBitsToInt(abs(intBitsToFloat(R125i.x)));
R126i.w = int(intBitsToFloat(R123i.x));
// 11
R127i.z = int(1) - R126i.w;
R3i.w = floatBitsToInt(1.0 / abs(intBitsToFloat(R125i.z)));
// 12
PV0iy = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R125i.x)), intBitsToFloat(R3i.w)));
R126i.w = R126i.w * R127i.y;
// 13
PV1iz = floatBitsToInt(trunc(intBitsToFloat(PV0iy)));
PS1i = floatBitsToInt(float(R124i.z));
// 14
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iz)),intBitsToFloat(R126i.y)) + intBitsToFloat(R124i.w));
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R127i.x = int(intBitsToFloat(R124i.x));
// 15
PV1ix = floatBitsToInt(-(abs(intBitsToFloat(R125i.z))) + intBitsToFloat(R127i.y));
PV1iy = floatBitsToInt((intBitsToFloat(R127i.y) >= abs(intBitsToFloat(R125i.z)))?1.0:0.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0ix)));
R124i.z = R127i.w * R127i.x;
// 16
R127i.w = ((intBitsToFloat(PV1iy) == 0.0)?(R127i.y):(PV1ix));
R124i.x = int(intBitsToFloat(PV1iz));
// 17
PV1iy = floatBitsToInt(abs(intBitsToFloat(R125i.z)) + intBitsToFloat(R127i.w));
PV1iw = 0 - R124i.x;
// 18
PV0iy = max(R124i.x, PV1iw);
R123i.z = ((-(intBitsToFloat(R127i.w)) > 0.0)?(PV1iy):(R127i.w));
// 19
R123i.x = ((-(intBitsToFloat(R125i.x)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.z)))):(R123i.z));
PS1i = PV0iy * R127i.x;
// 20
PV0iy = R125i.w + PS1i;
R125i.w = ((intBitsToFloat(R125i.z) == 0.0)?(R125i.x):(R123i.x));
// 21
R125i.x = R4i.w * PV0iy;
// 22
PS0i = int(intBitsToFloat(R125i.w));
// 23
PS1i = R127i.z * PS0i;
// 24
PV0iy = PS1i + R126i.w;
// 25
PS1i = R5i.w * PV0iy;
// 26
PV0iz = PS1i + R125i.y;
// 27
PV1ix = R125i.x + PV0iz;
// 28
PV0iw = R124i.z + PV1ix;
// 29
R125i.y = floatBitsToInt(float(PV0iw));
// 30
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), abs(intBitsToFloat(R125i.y))));
R126i.w = floatBitsToInt(abs(intBitsToFloat(R125i.y)));
// 31
PV1ix = floatBitsToInt(trunc(intBitsToFloat(PV0iz)));
// 32
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(R126i.y)) + intBitsToFloat(R126i.w));
// 33
PV1ix = floatBitsToInt((intBitsToFloat(R126i.y) >= abs(intBitsToFloat(R125i.z)))?1.0:0.0);
PV1iz = floatBitsToInt(-(abs(intBitsToFloat(R125i.z))) + intBitsToFloat(R126i.y));
// 34
R126i.w = ((intBitsToFloat(PV1ix) == 0.0)?(R126i.y):(PV1iz));
// 35
PV1iy = floatBitsToInt(abs(intBitsToFloat(R125i.z)) + intBitsToFloat(R126i.w));
// 36
R123i.z = ((-(intBitsToFloat(R126i.w)) > 0.0)?(PV1iy):(R126i.w));
// 37
R123i.x = ((-(intBitsToFloat(R125i.y)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.z)))):(R123i.z));
// 38
R123i.w = ((intBitsToFloat(R125i.z) == 0.0)?(R125i.y):(R123i.x));
// 39
R125i.y = int(intBitsToFloat(R123i.w));
// 40
R125i.z = floatBitsToInt(float(R125i.y));
// 41
PV1ix = floatBitsToInt((intBitsToFloat(R125i.z) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(R125i.z))?1.0:0.0);
R127i.x = floatBitsToInt(float(R125i.y));
// 42
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iw)));
R124i.z = floatBitsToInt(abs(intBitsToFloat(R127i.x)));
PV0iw = floatBitsToInt(abs(intBitsToFloat(R127i.x)) * 0.25);
// 43
PV1iy = floatBitsToInt(trunc(intBitsToFloat(PV0iw)));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iy) * 0.5 + intBitsToFloat(R125i.z));
// 44
R125i.x = floatBitsToInt(-(intBitsToFloat(PV1iy)) * 4.0 + intBitsToFloat(R124i.z));
PV0iy = floatBitsToInt(intBitsToFloat(R123i.z) * 0.25);
// 45
PV1ix = floatBitsToInt(trunc(intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt((intBitsToFloat(R125i.x) >= 4.0)?1.0:0.0);
PV1iw = floatBitsToInt(intBitsToFloat(R125i.x) + -4.0);
// 46
R124i.z = ((intBitsToFloat(PV1iy) == 0.0)?(R125i.x):(PV1iw));
PS0i = int(intBitsToFloat(PV1ix));
// 47
PV1ix = floatBitsToInt(intBitsToFloat(R124i.z) + 4.0);
R0i.z = PS0i + 0x1b;
// 48
R123i.w = ((-(intBitsToFloat(R124i.z)) > 0.0)?(PV1ix):(R124i.z));
// 49
R123i.y = ((-(intBitsToFloat(R127i.x)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.w)))):(R123i.w));
// 50
PS0i = int(intBitsToFloat(R123i.y));
// 51
PV1ix = int(-1) + PS0i;
R9i.y = 0xfffffffd + PS0i;
R4i.w = 0xfffffffe + PS0i;
PS1i = floatBitsToInt(float(PS0i));
// 52
R0i.y = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R3i.w = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R5i.w = floatBitsToInt(float(PV1ix));
}
if( activeMaskStackC[3] == true ) {
R2i.xyzw = floatBitsToInt(uf_blockVS7[R0i.z].xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(R5i.w))?1.0:0.0);
PV0iy = floatBitsToInt((intBitsToFloat(R5i.w) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt(intBitsToFloat(R3i.w) + -(intBitsToFloat(R0i.y)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), uf_blockVS7[45].x));
R126i.w = floatBitsToInt(intBitsToFloat(R126i.w) * 2.0);
PS0i = floatBitsToInt(float(R4i.w));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt(uf_blockVS7[44].z + uf_blockVS7[45].x);
R127i.x = int(intBitsToFloat(PV0iz));
// 2
R125i.x = floatBitsToInt(-(intBitsToFloat(R126i.w)) + intBitsToFloat(PV1iw));
PV0iy = 0 - R127i.x;
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iy)));
R126i.w = int(intBitsToFloat(PV1ix));
// 3
PV1ix = 0 - R126i.w;
PV1iy = max(R127i.x, PV0iy);
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), uf_blockVS7[45].y));
R124i.z = floatBitsToInt(intBitsToFloat(R124i.z) * 2.0);
R125i.y = int(intBitsToFloat(PV0iw));
// 4
PV0ix = int(1) - PV1iy;
PV0iy = 0 - R125i.y;
PV0iz = max(R126i.w, PV1ix);
PV0iw = floatBitsToInt(uf_blockVS7[44].w + uf_blockVS7[45].y);
R125i.z = floatBitsToInt(float(R9i.y));
// 5
PV1ix = max(R125i.y, PV0iy);
R126i.y = floatBitsToInt(-(intBitsToFloat(R124i.z)) + intBitsToFloat(PV0iw));
PV1iz = int(1) - PV0iz;
R126i.w = floatBitsToInt((intBitsToFloat(R125i.z) > 0.0)?1.0:0.0);
R125i.y = PV0ix * R2i.x;
// 6
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(R125i.z))?1.0:0.0);
PV0iy = floatBitsToInt(uf_blockVS7[46].x + uf_blockVS7[46].z);
PV0iz = floatBitsToInt(uf_blockVS7[46].y + uf_blockVS7[46].w);
PV0iw = int(1) - PV1ix;
PS0i = PV1iz * R2i.y;
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),uf_blockVS7[46].z) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(intBitsToFloat(R126i.w) + -(intBitsToFloat(PV0ix)));
PV1iz = PS0i + R125i.y;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),uf_blockVS7[46].w) + intBitsToFloat(PV0iz));
PS1i = PV0iw * R2i.z;
// 8
backupReg0i = R125i.x;
R125i.x = PS1i + PV1iz;
R124i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R14i.w)),uf_blockVS7[44].x) + -(intBitsToFloat(backupReg0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.w),uf_blockVS7[45].z) + intBitsToFloat(R123i.x));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.w),uf_blockVS7[44].y) + intBitsToFloat(R126i.y));
R125i.z = int(intBitsToFloat(PV1iy));
// 9
backupReg0i = R3i.y;
PV1ix = 0 - R125i.z;
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.w),uf_blockVS7[45].w) + intBitsToFloat(R126i.w));
R123i.w = ((backupReg0i == 0)?(0):(int(1)));
PS1i = int(uf_blockVS7[48].z);
// 10
backupReg0i = R125i.z;
R125i.y = (R123i.w == int(1))?-1:0;
R125i.z = (R123i.w == 0x2)?-1:0;
PV0iw = max(backupReg0i, PV1ix);
R124i.z = floatBitsToInt(float(PS1i));
// 11
PV1ix = floatBitsToInt(-(abs(intBitsToFloat(R124i.z))) + 0.0);
PV1iy = int(1) - PV0iw;
R123i.z = ((R125i.z == 0)?(R7i.x):(R7i.z));
PV1iw = floatBitsToInt((0.0 >= abs(intBitsToFloat(R124i.z)))?1.0:0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R124i.z));
// 12
backupReg0i = R125i.z;
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
R126i.y = ((intBitsToFloat(PV1iw) == 0.0)?(0):(PV1ix));
R125i.z = ((R125i.y == 0)?(R123i.z):(R7i.y));
R123i.w = ((backupReg0i == 0)?(R7i.y):(R7i.x));
PS0i = PV1iy * R2i.w;
// 13
PV1ix = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
R127i.y = ((R125i.y == 0)?(R123i.w):(R7i.z));
PV1iz = floatBitsToInt(abs(intBitsToFloat(R124i.z)) + intBitsToFloat(R126i.y));
R126i.w = PS0i + R125i.x;
PS1i = floatBitsToInt(1.0 / uf_blockVS7[48].z);
// 14
R123i.x = ((-(intBitsToFloat(R126i.y)) > 0.0)?(PV1iz):(R126i.y));
R126i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].x, intBitsToFloat(PS1i)));
R2i.y = int(intBitsToFloat(PV1ix));
// 15
backupReg0i = R7i.y;
backupReg1i = R124i.z;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w),intBitsToFloat(R126i.y)) + -(0.5));
R7i.y = ((R125i.y == 0)?(R7i.x):(backupReg0i));
R124i.z = ((R125i.y == 0)?(backupReg0i):(R7i.z));
R123i.w = ((intBitsToFloat(backupReg1i) == 0.0)?(0):(R123i.x));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[48].w);
// 16
R125i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].y, intBitsToFloat(PS1i)));
PS0i = int(intBitsToFloat(R123i.w));
// 17
backupReg0i = R127i.y;
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockVS7[50].x, intBitsToFloat(R125i.z)));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R125i.y)) + -(0.5));
R125i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[50].y, intBitsToFloat(backupReg0i)));
R125i.z = floatBitsToInt(intBitsToFloat(R125i.z) * 2.0);
PV1iw = floatBitsToInt(uf_blockVS7[49].z + uf_blockVS7[50].x);
PS1i = floatBitsToInt(float(PS0i));
// 18
backupReg0i = R126i.y;
PV0ix = floatBitsToInt(uf_blockVS7[49].w + uf_blockVS7[50].y);
R126i.y = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(PV1iw));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(PS1i)) + intBitsToFloat(R124i.y));
PS0i = floatBitsToInt(float(R2i.y));
// 19
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)),intBitsToFloat(PS0i)) + intBitsToFloat(R125i.w));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R125i.x)) + intBitsToFloat(R123i.z));
R125i.w = floatBitsToInt(-(intBitsToFloat(R125i.z)) + intBitsToFloat(PV0ix));
PS1i = int(uf_blockVS7[53].z);
// 20
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R127i.y)) + -(intBitsToFloat(R123i.y)));
PV0iy = floatBitsToInt(uf_blockVS7[51].x + uf_blockVS7[51].z);
PV0iz = floatBitsToInt(uf_blockVS7[51].y + uf_blockVS7[51].w);
R2i.z = floatBitsToInt(float(PS1i));
// 21
R124i.x = floatBitsToInt(abs(intBitsToFloat(R2i.z)));
R3i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R14i.w)),uf_blockVS7[49].x) + -(intBitsToFloat(R126i.y)));
R123i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[51].z,intBitsToFloat(R7i.y)) + intBitsToFloat(PV0iy));
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[51].w,intBitsToFloat(R124i.z)) + intBitsToFloat(PV0iz));
R125i.x = floatBitsToInt(float(R126i.w));
// 22
PV0ix = floatBitsToInt((intBitsToFloat(R125i.x) > 0.0)?1.0:0.0);
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.w),uf_blockVS7[49].y) + intBitsToFloat(R125i.w));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.w),uf_blockVS7[50].z) + intBitsToFloat(R123i.z));
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(R125i.x))?1.0:0.0);
R2i.w = floatBitsToInt(float(R126i.w));
// 23
R126i.x = floatBitsToInt(abs(intBitsToFloat(R2i.w)));
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
R5i.z = floatBitsToInt(intBitsToFloat(R127i.z) + 0.5);
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.w),uf_blockVS7[50].w) + intBitsToFloat(R127i.w));
PS1i = floatBitsToInt(1.0 / abs(intBitsToFloat(R2i.z)));
// 24
PV0ix = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R2i.w)), intBitsToFloat(PS1i)));
R9i.y = floatBitsToInt(intBitsToFloat(R127i.x) + 0.5);
R123i.z = floatBitsToInt(intBitsToFloat(PV1iy) * 0.5 + intBitsToFloat(R125i.x));
R7i.w = floatBitsToInt(intBitsToFloat(R5i.y) + -(uf_blockVS7[93].x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R2i.z));
// 25
PV1ix = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
R2i.y = floatBitsToInt(fract(intBitsToFloat(R1i.w)));
R7i.z = floatBitsToInt(-(uf_blockVS7[93].x) + uf_blockVS7[93].y);
PV1iw = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[53].z);
// 26
R1i.x = floatBitsToInt(intBitsToFloat(R14i.w) * 100.0);
R1i.x = clampFI32(R1i.x);
R1i.y = floatBitsToInt(trunc(intBitsToFloat(PV1iw)));
R1i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(R124i.x)) + intBitsToFloat(R126i.x));
R1i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[53].x, intBitsToFloat(PS1i)));
R5i.y = floatBitsToInt(1.0 / uf_blockVS7[53].w);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(-(abs(intBitsToFloat(R2i.z))) + intBitsToFloat(R1i.z));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R1i.w)) + -(0.5));
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[53].y, intBitsToFloat(R5i.y)));
PV0iw = floatBitsToInt((intBitsToFloat(R1i.z) >= abs(intBitsToFloat(R2i.z)))?1.0:0.0);
PS0i = int(intBitsToFloat(R1i.y));
// 1
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R1i.x)));
R126i.y = ((intBitsToFloat(PV0iw) == 0.0)?(R1i.z):(PV0ix));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R127i.z)) + -(0.5));
R8i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(R1i.x)));
PS1i = floatBitsToInt(float(PS0i));
// 2
PV0ix = floatBitsToInt(abs(intBitsToFloat(R2i.z)) + intBitsToFloat(R126i.y));
R22i.y = floatBitsToInt(uf_blockVS7[104].x);
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.z)),intBitsToFloat(PS1i)) + intBitsToFloat(R7i.y));
R9i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(R1i.x)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R7i.z));
// 3
R123i.x = ((-(intBitsToFloat(R126i.y)) > 0.0)?(PV0ix):(R126i.y));
R7i.y = floatBitsToInt(intBitsToFloat(R7i.w) * intBitsToFloat(PS0i));
R7i.y = clampFI32(R7i.y);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w),intBitsToFloat(R124i.z)) + -(intBitsToFloat(R123i.z)));
// 4
R7i.x = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
R123i.w = ((-(intBitsToFloat(R2i.w)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.x)))):(R123i.x));
// 5
R123i.y = ((intBitsToFloat(R2i.z) == 0.0)?(R2i.w):(R123i.w));
// 6
PS0i = int(intBitsToFloat(R123i.y));
// 7
PS1i = floatBitsToInt(float(PS0i));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(PS1i)) + intBitsToFloat(R3i.y));
// 9
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.x));
// 10
R1i.x = floatBitsToInt(intBitsToFloat(R123i.x) + 0.5);
// 11
R1i.w = floatBitsToInt(intBitsToFloat(R12i.w) * intBitsToFloat(R3i.x));
}
if( activeMaskStackC[3] == true ) {
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),uf_blockVS13[24].x) + -(uf_blockVS13[24].y));
R123i.x = clampFI32(R123i.x);
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), uf_blockVS11[5].z));
// 1
R126i.x = floatBitsToInt(uf_blockVS13[28].y * 1.0 + intBitsToFloat(R4i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),uf_blockVS13[22].x) + -(uf_blockVS13[22].y));
R123i.y = clampFI32(R123i.y);
PV1iz = floatBitsToInt(uf_blockVS13[28].y + 1.0);
PV1iw = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
PS1i = floatBitsToInt(-(intBitsToFloat(R1i.w)) + 1.0);
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) * 1.5);
PV0iy = clampFI32(PV0iy);
R0i.z = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3f333333) + intBitsToFloat(0x3e19999a));
R0i.z = clampFI32(R0i.z);
tempResultf = max(0.0, intBitsToFloat(PV1iw));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 3
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockVS13[24].w, intBitsToFloat(PS0i)));
R127i.w = floatBitsToInt(intBitsToFloat(PV0iy) * 15.0);
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 4
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS13[23].x, intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockVS13[23].y, intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 5
R1i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)),uf_blockVS13[25].w) + uf_blockVS13[25].w);
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 6
R4i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
PS0i = floatBitsToInt(exp2(intBitsToFloat(R127i.y)));
// 7
R123i.w = floatBitsToInt(mul_nonIEEE(-(uf_blockVS13[23].z),intBitsToFloat(PS0i)) + uf_blockVS13[23].z);
R123i.w = clampFI32(R123i.w);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 8
PV0iy = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(-(intBitsToFloat(R2i.y)) + intBitsToFloat(R123i.w));
PV0iw = clampFI32(PV0iw);
// 9
PV1ix = floatBitsToInt(max(intBitsToFloat(PV0iy), intBitsToFloat(0x3e4ccccd)));
R3i.y = PV0iw;
R2i.z = PV0iw;
// 10
R2i.w = floatBitsToInt(min(intBitsToFloat(PV1ix), 1.0));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(min(uf_blockVS6[17].y, uf_blockVS13[27].z));
R127i.y = floatBitsToInt(uf_blockVS6[17].x + -(intBitsToFloat(R5i.x)));
R124i.z = floatBitsToInt(uf_blockVS6[17].y + -(intBitsToFloat(R8i.y)));
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(R0i.z)) + 1.0);
R127i.z = floatBitsToInt(uf_blockVS6[17].z + -(intBitsToFloat(R4i.z)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R14i.y)) + intBitsToFloat(PV0ix));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(PV1ix) + 2.5);
R123i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS13[27].y,intBitsToFloat(PV1iw)) + uf_blockVS13[27].x);
R123i.z = clampFI32(R123i.z);
PS0i = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(R127i.z));
// 3
R123i.x = floatBitsToInt((intBitsToFloat(R124i.z) * intBitsToFloat(R124i.z) + intBitsToFloat(PS0i)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), uf_blockVS13[26].w));
R0i.z = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3daaaaab));
R0i.w = 0;
// 4
R3i.x = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R1i.y = ((0.0 >= intBitsToFloat(R7i.y))?-1:0);
R7i.z = 0;
R123i.w = floatBitsToInt((intBitsToFloat(R127i.y) * intBitsToFloat(R127i.y) + intBitsToFloat(R123i.x)));
R5i.y = 0;
// 5
R9i.x = 0;
R6i.y = ((R1i.y == 0)?(R0i.x):(R7i.z));
R1i.z = ((R1i.y == 0)?(R9i.w):(R3i.x));
R9i.w = ((R1i.y == 0)?(R8i.w):(R5i.y));
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.w));
PS1i = floatBitsToInt(tempResultf);
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS1i)));
R0i.x = R14i.x;
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(uf_blockVS13[28].x,uf_blockVS13[28].y,uf_blockVS13[28].z,0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R16i.y = R21i.y;
// 8
R2i.x = ((R1i.y == 0)?(0):(0x3f800000));
R14i.y = R6i.z;
R3i.z = R11i.z;
R127i.w = floatBitsToInt(intBitsToFloat(PV1ix) + 0.5);
R8i.w = R22i.y;
// 9
R5i.x = R18i.z;
R123i.y = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
PV1iz = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
R123i.w = ((R1i.y == 0)?(0):(R1i.w));
R122i.x = ((R1i.y == 0)?(0):(R126i.y));
// 10
R19i.x = ((R2i.x == 0)?(R1i.w):(R123i.w));
R19i.y = ((R2i.x == 0)?(R126i.y):(R122i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R123i.y)) + intBitsToFloat(0xbe593484));
R123i.w = ((R1i.y == 0)?(0):(R2i.z));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1iz)));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f22f983));
R123i.y = ((R1i.y == 0)?(0):(R2i.y));
R19i.z = ((R2i.x == 0)?(R2i.z):(R123i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R123i.z)) + intBitsToFloat(0x3fc90da4));
R8i.y = ((R1i.y == 0)?(0):(R3i.y));
// 12
backupReg0i = R2i.y;
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),-(intBitsToFloat(R123i.w))) + 1.0);
R2i.y = ((R1i.y == 0)?(0):(R0i.x));
R2i.z = ((R1i.y == 0)?(0):(R3i.z));
R19i.w = ((R2i.x == 0)?(backupReg0i):(R123i.y));
R15i.y = ((R1i.y == 0)?(0):(R0i.w));
}
if( activeMaskStackC[3] == true ) {
R4i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y))).xyz);
R0i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R2i.w)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R2i.w)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R2i.w)));
R123i.w = ((R1i.y == 0)?(0):(R0i.x));
R4i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS8[3].x,intBitsToFloat(R7i.y)) + 0.0);
// 1
R0i.x = ((R2i.x == 0)?(R0i.x):(R123i.w));
R125i.y = ((R1i.y == 0)?(R4i.x):(R9i.x));
R124i.z = ((R1i.y == 0)?(0):(R126i.x));
R127i.w = ((R1i.y == 0)?(0):(R126i.y));
R122i.x = ((R1i.y == 0)?(0):(R0i.y));
// 2
R123i.x = ((R1i.y == 0)?(0):(R127i.z));
R0i.y = ((R2i.x == 0)?(R0i.y):(R122i.x));
R123i.z = ((R1i.y == 0)?(0):(R0i.z));
R126i.w = ((R1i.y == 0)?(0):(R0i.w));
R125i.z = ((R1i.y == 0)?(0):(R1i.x));
// 3
R20i.x = ((R2i.x == 0)?(R127i.z):(R123i.x));
R20i.y = ((R2i.x == 0)?(R126i.y):(R127i.w));
R20i.z = ((R2i.x == 0)?(R126i.x):(R124i.z));
R20i.w = ((R2i.x == 0)?(R3i.y):(R8i.y));
R0i.z = ((R2i.x == 0)?(R0i.z):(R123i.z));
// 4
R124i.x = ((R1i.y == 0)?(0):(R16i.y));
R123i.y = ((R1i.y == 0)?(0):(R5i.z));
R126i.z = ((R1i.y == 0)?(0):(R8i.z));
R0i.w = ((R2i.x == 0)?(R0i.w):(R126i.w));
R126i.y = ((R1i.y == 0)?(0):(R7i.x));
// 5
R16i.x = ((R2i.x == 0)?(R5i.z):(R123i.y));
R127i.y = ((R1i.y == 0)?(0):(R10i.x));
R124i.z = ((R1i.y == 0)?(0):(R10i.w));
R123i.w = ((R1i.y == 0)?(0):(R9i.y));
R127i.z = ((R1i.y == 0)?(0):(R10i.z));
// 6
R126i.x = ((R1i.y == 0)?(0):(R13i.w));
R16i.y = ((R2i.x == 0)?(R9i.y):(R123i.w));
R16i.z = ((R2i.x == 0)?(R1i.x):(R125i.z));
R16i.w = ((R2i.x == 0)?(R7i.x):(R126i.y));
R125i.z = R18i.z;
// 7
backupReg0i = R6i.z;
R23i.x = ((R2i.x == 0)?(R10i.x):(R127i.y));
R127i.y = ((R1i.y == 0)?(0):(R12i.w));
R6i.z = ((R1i.y == 0)?(0):(R9i.z));
R126i.w = ((R1i.y == 0)?(0):(R8i.x));
R5i.z = ((R1i.y == 0)?(R17i.w):(backupReg0i));
// 8
R123i.x = ((R1i.y == 0)?(R18i.x):(R9i.x));
R126i.y = R11i.z;
R123i.w = ((R1i.y == 0)?(0):(R10i.y));
R127i.w = ((R1i.y == 0)?(0):(R11i.x));
// 9
R18i.x = ((R2i.x == 0)?(R125i.y):(R123i.x));
R23i.y = ((R2i.x == 0)?(R10i.y):(R123i.w));
R23i.z = ((R2i.x == 0)?(R10i.z):(R127i.z));
R23i.w = ((R2i.x == 0)?(R10i.w):(R124i.z));
R122i.x = ((R1i.y == 0)?(0):(R11i.w));
// 10
R13i.x = ((R2i.x == 0)?(R11i.w):(R122i.x));
R123i.y = ((R1i.y == 0)?(0):(R6i.x));
R123i.w = ((R1i.y == 0)?(R18i.y):(R22i.y));
// 11
R22i.x = ((R2i.x == 0)?(R6i.x):(R123i.y));
R18i.y = ((R2i.x == 0)?(R8i.w):(R123i.w));
R18i.z = ((R2i.x == 0)?(R5i.x):(R125i.z));
R123i.w = ((R1i.y == 0)?(0):(R11i.y));
R22i.y = ((R2i.x == 0)?(R12i.w):(R127i.y));
// 12
R123i.y = ((R1i.y == 0)?(0):(R12i.y));
R22i.z = ((R2i.x == 0)?(R8i.x):(R126i.w));
R22i.w = ((R2i.x == 0)?(R11i.y):(R123i.w));
// 13
backupReg0i = R11i.x;
R11i.x = ((R2i.x == 0)?(R12i.y):(R123i.y));
R11i.y = ((R2i.x == 0)?(R8i.z):(R126i.z));
R11i.z = ((R2i.x == 0)?(backupReg0i):(R127i.w));
R11i.w = ((R2i.x == 0)?(R13i.w):(R126i.x));
R126i.x = R21i.y;
// 14
R123i.x = ((R1i.y == 0)?(0):(R13i.y));
R123i.y = ((R1i.y == 0)?(R17i.x):(R7i.z));
R123i.z = ((R1i.y == 0)?(0):(R12i.x));
R127i.w = ((R1i.y == 0)?(R17i.z):(R3i.x));
// 15
R17i.x = ((R2i.x == 0)?(R6i.y):(R123i.y));
R13i.y = ((R2i.x == 0)?(R13i.y):(R123i.x));
R13i.z = ((R2i.x == 0)?(R9i.z):(R6i.z));
R13i.w = ((R2i.x == 0)?(R12i.x):(R123i.z));
PS1i = R14i.x;
// 16
R12i.x = ((R2i.x == 0)?(PS1i):(R2i.y));
R12i.y = ((R2i.x == 0)?(R126i.x):(R124i.x));
R12i.z = ((R2i.x == 0)?(R126i.y):(R2i.z));
// 17
R123i.x = ((R1i.y == 0)?(R17i.y):(R5i.y));
// 18
R17i.y = ((R2i.x == 0)?(R9i.w):(R123i.x));
R17i.z = ((R2i.x == 0)?(R1i.z):(R127i.w));
R17i.w = ((R2i.x == 0)?(R14i.y):(R5i.z));
R12i.w = R15i.y;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R22i.x), intBitsToFloat(R22i.y), intBitsToFloat(R22i.z), intBitsToFloat(R22i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R23i.x), intBitsToFloat(R23i.y), intBitsToFloat(R23i.z), intBitsToFloat(R23i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.z));
}
