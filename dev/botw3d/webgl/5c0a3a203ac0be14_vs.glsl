#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 5c0a3a203ac0be14
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
vec4 uf_blockVS8[4];
};


UNIFORM_BUFFER_LAYOUT(11, 0, 5) uniform uniformBlockVS11
{
vec4 uf_blockVS11[6];
};


UNIFORM_BUFFER_LAYOUT(13, 0, 6) uniform uniformBlockVS13
{
vec4 uf_blockVS13[29];
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
ATTR_LAYOUT(0, 11) in uvec4 attrDataSem11;
ATTR_LAYOUT(0, 12) in uvec4 attrDataSem12;
ATTR_LAYOUT(0, 13) in uvec4 attrDataSem13;

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
ivec4 R22i = ivec4(0);
ivec4 R23i = ivec4(0);
ivec4 R24i = ivec4(0);
ivec4 R25i = ivec4(0);
ivec4 R26i = ivec4(0);
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
bool activeMaskStack[3];
bool activeMaskStackC[4];
activeMaskStack[0] = false;
activeMaskStack[1] = false;
activeMaskStackC[0] = false;
activeMaskStackC[1] = false;
activeMaskStackC[2] = false;
activeMaskStack[0] = true;
activeMaskStackC[0] = true;
activeMaskStackC[1] = true;
R0i = ivec4(gl_VertexID, 0, 0, gl_InstanceID);
attrDecoder = attrDataSem8;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyz = attrDataSem7.xyz;
attrDecoder.xyz = uvec3((attrDecoder.xyz>>24)|((attrDecoder.xyz>>8)&0xFF00u)|((attrDecoder.xyz<<8)&0xFF0000u)|((attrDecoder.xyz<<24)));
attrDecoder.w = uint(0);
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), 0x3f800000);
attrDecoder = attrDataSem13;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R12i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem12;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R11i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem3;
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem5;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem6;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem10;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R10i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem9;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R9i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
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
R13i.z = floatBitsToInt(-(intBitsToFloat(R11i.y)) + 1.0);
R0i.w = 0;
R8i.w = floatBitsToInt(1.0);
// 1
R16i.w = floatBitsToInt(-(intBitsToFloat(R6i.w)) + uf_blockVS8[2].x);
R7i.w = floatBitsToInt(-(intBitsToFloat(R11i.x)) + 1.0);
// 2
predResult = (0.0 > intBitsToFloat(R16i.w));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R18i.x = 0;
R18i.y = 0;
R18i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R19i.x = 0;
// 1
R6i.w = R8i.w;
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
PS0i = int(intBitsToFloat(R5i.w));
// 1
R5i.x = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R16i.w) >= intBitsToFloat(R5i.x));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R18i.x = 0;
R18i.y = 0;
R18i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R19i.x = 0;
// 1
R0i.w = R8i.w;
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
R126i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x2;
R126i.y = floatBitsToInt(uf_blockVS7[5].x) & 0x4;
PV0iz = floatBitsToInt(uf_blockVS7[5].x) & int(1);
R126i.w = floatBitsToInt(intBitsToFloat(R16i.w) + uf_blockVS7[15].z);
PS0i = floatBitsToInt(max(intBitsToFloat(R9i.x), 0.0));
// 1
PV1ix = floatBitsToInt(min(intBitsToFloat(PS0i), 0.0));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), uf_blockVS7[96].z));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), uf_blockVS7[96].y));
R0i.w = 0x3f800000;
R127i.y = floatBitsToInt(float(PV0iz));
// 2
R1i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w))));
PV0iy = R1i.x;
PV0iz = R1i.x;
PV0iw = R1i.x;
R0i.x = floatBitsToInt(intBitsToFloat(R10i.x) + intBitsToFloat(PV1ix));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w))));
PV1ix = tempi.x;
R5i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.x = floatBitsToInt((intBitsToFloat(R127i.y) > 0.0)?1.0:0.0);
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R5i.z = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt((0.0 > intBitsToFloat(R127i.y))?1.0:0.0);
// 5
PV1iz = floatBitsToInt(intBitsToFloat(R127i.x) + -(intBitsToFloat(PS0i)));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), uf_blockVS7[96].x));
PS1i = floatBitsToInt(float(R126i.x));
// 6
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(R9i.y));
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R127i.y = int(intBitsToFloat(PV1iz));
// 7
PV1ix = 0 - R127i.y;
PV1iy = floatBitsToInt(intBitsToFloat(R9i.y) + intBitsToFloat(R9i.z));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
R127i.w = floatBitsToInt(intBitsToFloat(PV0iy) * 0.5);
PS1i = floatBitsToInt(float(R126i.y));
// 8
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R127i.z = floatBitsToInt(intBitsToFloat(PV1iy) * 0.5);
PV0iw = max(R127i.y, PV1ix);
R127i.y = int(intBitsToFloat(PV1iz));
// 9
PV1ix = 0 - R127i.y;
PV1iy = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(R9i.z));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iy)));
R127i.x = floatBitsToInt(float(PV0iw));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) * 0.5);
R126i.y = floatBitsToInt(intBitsToFloat(R127i.z) + -(0.5));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) * 2.0);
R127i.z = floatBitsToInt(intBitsToFloat(R127i.w) + -(0.5));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 2.0);
PV0iw = max(R127i.y, PV1ix);
R127i.y = int(intBitsToFloat(PV1iz));
// 11
PV1ix = 0 - R127i.y;
R125i.y = floatBitsToInt(intBitsToFloat(PV0ix) + -(0.5));
R125i.y = floatBitsToInt(intBitsToFloat(R125i.y) * 2.0);
R10i.z = floatBitsToInt(intBitsToFloat(R9i.y) + -(0.5));
R0i.w = floatBitsToInt(intBitsToFloat(R9i.x) + -(0.5));
R124i.y = floatBitsToInt(float(PV0iw));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), uf_blockVS7[115].x));
R3i.y = floatBitsToInt(intBitsToFloat(R9i.z) + -(0.5));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), uf_blockVS7[115].y));
PV0iw = max(R127i.y, PV1ix);
PS0i = floatBitsToInt(1.0 / uf_blockVS7[14].z);
// 13
PV1ix = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS0i));
R2i.y = floatBitsToInt(uf_blockVS7[114].y + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), uf_blockVS7[115].z));
R5i.w = floatBitsToInt(intBitsToFloat(PV0ix) + uf_blockVS7[114].x);
R127i.z = floatBitsToInt(float(PV0iw));
// 14
R2i.x = floatBitsToInt(uf_blockVS7[114].z + intBitsToFloat(PV1iz));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),uf_blockVS7[15].x) + intBitsToFloat(PV1ix));
// 15
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV1iy = floatBitsToInt(uf_blockVS7[5].x) & 0x10000;
PV1iz = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x40c90fdb));
// 16
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.z = floatBitsToInt(mul_nonIEEE(-(uf_blockVS7[14].x),intBitsToFloat(PV1ix)) + 1.0);
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + -(0.5));
PS0i = floatBitsToInt(float(PV1iy));
// 17
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R126i.y = floatBitsToInt(max(intBitsToFloat(R123i.z), -(intBitsToFloat(R123i.z))));
R123i.z = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
// 18
PV0ix = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
R127i.y = floatBitsToInt(uf_blockVS7[5].x) & 0x20000;
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PS1i)));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 19
PV1iz = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R123i.w = floatBitsToInt(mul_nonIEEE(-(uf_blockVS7[14].x),intBitsToFloat(PV0ix)) + 1.0);
R125i.y = int(intBitsToFloat(PV0iz));
// 20
PV0ix = 0 - R125i.y;
R126i.z = floatBitsToInt(max(intBitsToFloat(R123i.w), -(intBitsToFloat(R123i.w))));
PS0i = floatBitsToInt(cos((intBitsToFloat(PV1iz))/0.1591549367));
// 21
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) + 1.0);
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) / 2.0);
PV1iw = max(R125i.y, PV0ix);
PS1i = floatBitsToInt(float(R127i.y));
// 22
R123i.x = floatBitsToInt(mul_nonIEEE(-(uf_blockVS7[14].x),intBitsToFloat(PV1ix)) + 1.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R1i.z = floatBitsToInt(float(PV1iw));
R1i.z = floatBitsToInt(intBitsToFloat(R1i.z) * 2.0);
// 23
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R124i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R123i.x),intBitsToFloat(R126i.y),intBitsToFloat(R126i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R6i.z = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
// 24
PV0ix = floatBitsToInt(uf_blockVS7[5].x) & 0x40000;
R2i.z = R9i.z;
R2i.z = floatBitsToInt(intBitsToFloat(R2i.z) * 2.0);
PV0iw = R9i.y;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
R3i.x = int(intBitsToFloat(PS1i));
// 25
R3i.z = floatBitsToInt(floor(intBitsToFloat(PV0iw)));
R3i.w = 0 - R3i.x;
R1i.w = floatBitsToInt(float(PV0ix));
}
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R3i.x;
backupReg1i = R0i.y;
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), uf_blockVS8[3].y));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), uf_blockVS8[3].z));
PV0iz = max(backupReg0i, R3i.w);
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), uf_blockVS8[3].y));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), uf_blockVS8[3].w));
// 1
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(R1i.w))?1.0:0.0);
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt((intBitsToFloat(R1i.w) > 0.0)?1.0:0.0);
R126i.w = floatBitsToInt((intBitsToFloat(R3i.z) > 0.0)?1.0:0.0);
R126i.y = floatBitsToInt(float(PV0iz));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) * 2.0);
// 2
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(R3i.z))?1.0:0.0);
PV0iz = floatBitsToInt(floor(intBitsToFloat(R2i.z)));
PV0iw = R9i.x;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), uf_blockVS7[113].x));
// 3
PV1ix = floatBitsToInt((intBitsToFloat(PV0iz) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PV0iz))?1.0:0.0);
PV1iz = floatBitsToInt(floor(intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(intBitsToFloat(R126i.w) + -(intBitsToFloat(PV0iy)));
R126i.w = int(intBitsToFloat(PV0ix));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.z)), intBitsToFloat(PV1iw)));
PV0iy = 0 - R126i.w;
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt((intBitsToFloat(PV1iz) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt((0.0 > intBitsToFloat(PV1iz))?1.0:0.0);
// 5
R127i.x = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PS0i)));
PV1iy = max(R126i.w, PV0iy);
PV1iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.y)), intBitsToFloat(PV0iz)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV0ix)));
R125i.z = floatBitsToInt(intBitsToFloat(R127i.w) + 0.0);
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV1iz)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), uf_blockVS7[113].y));
R126i.z = floatBitsToInt(intBitsToFloat(R5i.w) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), uf_blockVS7[113].z));
PS0i = floatBitsToInt(float(PV1iy));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 7
R126i.x = floatBitsToInt(intBitsToFloat(PV0iy) + 0.0);
R126i.y = floatBitsToInt(intBitsToFloat(PV0iw) + 0.0);
PV1iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(R127i.x)));
R126i.w = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(PV0ix));
tempResultf = max(0.0, uf_blockVS7[114].w);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.w), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV1iz)));
R127i.z = ((uf_blockVS7[114].w == 1.0)?-1:0);
R127i.w = floatBitsToInt(-(uf_blockVS7[114].w) + 1.0);
// 9
R127i.x = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(PV0iy));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 10
PV0iy = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 11
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 12
R123i.y = ((R127i.z == 0)?(PV1iz):(R16i.w));
// 13
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R123i.y)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R123i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R123i.y)));
// 14
PV0iy = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV1ix));
R10i.z = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV1iy));
// 15
R123i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.z = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3e22f983) + 0.5);
// 16
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
// 17
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 18
R126i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R126i.w = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 19
R1i.z = floatBitsToInt(sin((intBitsToFloat(R126i.w))/0.1591549367));
// 20
R2i.y = floatBitsToInt(cos((intBitsToFloat(R126i.w))/0.1591549367));
// 21
R2i.z = floatBitsToInt(sin((intBitsToFloat(R126i.x))/0.1591549367));
// 22
R3i.y = floatBitsToInt(cos((intBitsToFloat(R126i.x))/0.1591549367));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt((0.0 > uf_blockVS6[16].x)?1.0:0.0);
PV0iy = floatBitsToInt((uf_blockVS6[16].x > 0.0)?1.0:0.0);
R125i.z = ((uf_blockVS6[16].x == 0.0)?-1:0);
R124i.w = ((uf_blockVS6[16].z == 0.0)?-1:0);
PS0i = floatBitsToInt(1.0 / uf_blockVS6[16].z);
// 1
PV1ix = floatBitsToInt(uf_blockVS6[16].x * intBitsToFloat(PS0i));
PV1iy = ((0.0 > uf_blockVS6[16].z)?-1:0);
R125i.w = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
// 2
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PV1ix))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(PV1ix) > 0.0)?1.0:0.0);
R126i.w = floatBitsToInt(max(intBitsToFloat(PV1ix), -(intBitsToFloat(PV1ix))));
R5i.w = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(0x3fc90fdb));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iy)));
R125i.z = ((intBitsToFloat(R126i.w) > 1.0)?-1:0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.w));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3fc90fdb));
R123i.z = ((R125i.z == 0)?(R126i.w):(PS1i));
R127i.w = floatBitsToInt(((R125i.z == 0)?(intBitsToFloat(PV1ix)):(-(intBitsToFloat(PV1ix)))));
// 5
PV1ix = floatBitsToInt(min(intBitsToFloat(R123i.z), 1.0));
R126i.y = ((R125i.z == 0)?(0):(PV0ix));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R3i.y)));
R0i.w = floatBitsToInt(-(intBitsToFloat(R2i.z)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R3i.y)));
// 6
R126i.w = floatBitsToInt(max(intBitsToFloat(PV1ix), -(1.0)));
// 7
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R126i.w)));
// 8
R123i.y = floatBitsToInt(intBitsToFloat(0x3edcf805) * intBitsToFloat(R125i.z) + 1.0);
R123i.w = floatBitsToInt(intBitsToFloat(0x3d6ee04d) * intBitsToFloat(R125i.z) + intBitsToFloat(0x3f43b24e));
// 9
R126i.x = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R126i.w)), intBitsToFloat(R123i.y)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R123i.w)) + 1.0);
// 10
PV0iz = floatBitsToInt(uf_blockVS7[13].y);
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
PV0iw = floatBitsToInt(uf_blockVS7[13].x);
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R123i.z));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(PV0iw));
R125i.z = floatBitsToInt(intBitsToFloat(R8i.y) + intBitsToFloat(PV0iz));
// 12
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PV1iy)));
R123i.w = ((intBitsToFloat(R126i.w) > 0.0)?(PV1ix):(floatBitsToInt(-(intBitsToFloat(PV1ix)))));
// 13
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R123i.w)) + intBitsToFloat(R126i.y));
// 14
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R125i.z)));
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(R126i.z))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(R126i.z) > 0.0)?1.0:0.0);
// 15
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iy)));
// 16
PV0iz = floatBitsToInt(-(intBitsToFloat(R125i.w)) + intBitsToFloat(PV1ix));
// 17
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3fc90fdb));
// 18
PV0ix = floatBitsToInt(intBitsToFloat(R126i.z) + -(intBitsToFloat(PV1iy)));
// 19
R123i.w = ((R127i.x == 0)?(PV0ix):(0x40490fdb));
// 20
R123i.z = ((R124i.w == 0)?(R123i.w):(R5i.w));
// 21
PV1ix = floatBitsToInt(intBitsToFloat(R10i.z) + intBitsToFloat(R123i.z));
// 22
R123i.x = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R0i.y));
// 23
PV1iw = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
// 24
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 25
R126i.y = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
// 26
PS0i = floatBitsToInt(sin((intBitsToFloat(R126i.y))/0.1591549367));
// 27
backupReg0i = R126i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PS0i)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R3i.y)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(cos((intBitsToFloat(backupReg0i))/0.1591549367));
// 28
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R3i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R124i.w)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R127i.x)));
// 29
R126i.x = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV0iz)));
R126i.z = floatBitsToInt(-(intBitsToFloat(PV0iz)) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV0iy)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R126i.y)));
// 30
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(R124i.w)) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R126i.x)));
R125i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R126i.z)));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(R0i.w)) + intBitsToFloat(PS1i));
// 31
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(R127i.z)) + intBitsToFloat(PV0iw));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(R8i.x)) + intBitsToFloat(R122i.x));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R1i.y)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(R124i.y)) + intBitsToFloat(PV0iy));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R1i.y)));
// 32
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(R125i.z)) + intBitsToFloat(R123i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R124i.y)) + intBitsToFloat(PS1i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R127i.z)) + intBitsToFloat(PV1iz));
R13i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.w));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R1i.y)));
// 33
backupReg0i = R123i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R0i.w)) + intBitsToFloat(PS0i));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R125i.z)) + intBitsToFloat(R123i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R127i.x)) + intBitsToFloat(backupReg0i));
R2i.w = 0x3f800000;
R124i.w = 0x3f800000;
// 34
backupReg0i = R8i.x;
R8i.x = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(R123i.y));
R2i.y = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(R123i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(backupReg0i)) + intBitsToFloat(R123i.x));
// 35
R7i.y = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(R123i.w));
PV1iz = floatBitsToInt(-(intBitsToFloat(R5i.y)) + intBitsToFloat(R8i.x));
// 36
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(R127i.y));
// 37
PV1ix = ((0.0 > intBitsToFloat(PV0iw))?-1:0);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(PV0iw)));
PV1iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iw)), intBitsToFloat(PV0iw)));
// 38
R0i.w = ((PV1ix == 0)?(PV1iy):(PV1iz));
// 39
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R124i.w)),vec4(uf_blockVS6[10].x,uf_blockVS6[10].y,uf_blockVS6[10].z,uf_blockVS6[10].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R5i.w = tempi.x;
// 40
R1i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R124i.w)),vec4(uf_blockVS6[11].x,uf_blockVS6[11].y,uf_blockVS6[11].z,uf_blockVS6[11].w)));
PV0iy = R1i.x;
PV0iz = R1i.x;
PV0iw = R1i.x;
}
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R1i.x;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), uf_blockVS14[1].w));
R1i.y = floatBitsToInt(uf_blockVS7[60].x);
PV0iz = backupReg0i;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
R123i.w = floatBitsToInt(intBitsToFloat(R5i.w) * 0.0 + intBitsToFloat(backupReg0i));
R0i.w = floatBitsToInt(uf_blockVS7[60].y);
// 1
R7i.x = floatBitsToInt(uf_blockVS7[60].z);
R123i.y = floatBitsToInt(intBitsToFloat(R5i.w) * 0.5 + intBitsToFloat(PV0iz));
R7i.z = floatBitsToInt(uf_blockVS7[68].x);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.w));
// 2
R5i.z = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(PS1i));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockVS6[18].w, intBitsToFloat(R5i.z)));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), uf_blockVS11[2].y));
// 1
PV1iw = floatBitsToInt(-(uf_blockVS6[18].y) + intBitsToFloat(PV0iy));
// 2
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 3
R10i.z = floatBitsToInt(-(uf_blockVS6[18].z) * intBitsToFloat(PS0i));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(uf_blockVS14[1].z, intBitsToFloat(R5i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockVS14[1].x, intBitsToFloat(R5i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS14[1].y, intBitsToFloat(R5i.z)));
// 1
backupReg0i = R3i.x;
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), uf_blockVS8[0].x));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iw)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0ix)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), uf_blockVS8[0].y));
// 2
R6i.x = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(PV1iz));
R10i.y = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(PV1iy));
R3i.z = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(PV1iw));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), uf_blockVS8[0].z));
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), uf_blockVS8[0].w));
}
if( activeMaskStackC[3] == true ) {
// 0
R10i.x = floatBitsToInt(intBitsToFloat(R6i.x) + -(uf_blockVS6[17].x));
R0i.y = floatBitsToInt(intBitsToFloat(R10i.y) + -(uf_blockVS6[17].y));
R1i.z = floatBitsToInt(intBitsToFloat(R3i.z) + -(uf_blockVS6[17].z));
// 1
backupReg0i = R5i.x;
R5i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R10i.y),intBitsToFloat(R3i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS6[8].x,uf_blockVS6[8].y,uf_blockVS6[8].z,uf_blockVS6[8].w)));
PV1iy = R5i.x;
PV1iz = R5i.x;
PV1iw = R5i.x;
R1i.w = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R10i.y),intBitsToFloat(R3i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS6[9].x,uf_blockVS6[9].y,uf_blockVS6[9].z,uf_blockVS6[9].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R6i.w = tempi.x;
R0i.x = floatBitsToInt(intBitsToFloat(R16i.w) * intBitsToFloat(R1i.w));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R10i.y),intBitsToFloat(R3i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS6[10].x,uf_blockVS6[10].y,uf_blockVS6[10].z,uf_blockVS6[10].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R8i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R10i.y),intBitsToFloat(R3i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS6[11].x,uf_blockVS6[11].y,uf_blockVS6[11].z,uf_blockVS6[11].w)));
PV0ix = tempi.x;
R16i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 5
PV1ix = PV0ix;
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) / 2.0);
R14i.y = floatBitsToInt(intBitsToFloat(R8i.z) * 0.0 + intBitsToFloat(PV0ix));
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), uf_blockVS7[59].x));
R15i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), uf_blockVS7[59].x));
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), uf_blockVS7[59].x));
// 6
R3i.x = floatBitsToInt(uf_blockVS7[76].x);
R2i.y = floatBitsToInt(uf_blockVS7[76].y);
R11i.z = floatBitsToInt(intBitsToFloat(R8i.z) * 0.5 + intBitsToFloat(PV1ix));
R123i.w = floatBitsToInt(intBitsToFloat(R8i.z) * 0.0 + intBitsToFloat(PV1ix));
R0i.z = floatBitsToInt(1.0 / intBitsToFloat(R14i.y));
// 7
R13i.x = floatBitsToInt(intBitsToFloat(R6i.w) * -(0.5) + intBitsToFloat(R123i.w));
PV1iy = floatBitsToInt(intBitsToFloat(R11i.z) * intBitsToFloat(R0i.z));
R7i.z = floatBitsToInt(uf_blockVS7[76].z);
R11i.w = floatBitsToInt(intBitsToFloat(R5i.x) * 0.5 + intBitsToFloat(R123i.w));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),uf_blockVS6[18].w) + -(uf_blockVS6[18].y));
// 9
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.x));
// 10
R8i.y = floatBitsToInt(-(uf_blockVS6[18].z) * intBitsToFloat(PS1i));
// 11
R8i.x = ((intBitsToFloat(R9i.z) > 0.5)?-1:0);
PV1iy = ((intBitsToFloat(R9i.x) > 0.5)?-1:0);
PV1iw = ((intBitsToFloat(R9i.y) > 0.5)?-1:0);
// 12
R7i.x = ((PV1iw == 0)?(R11i.y):(R13i.z));
R0i.w = ((PV1iy == 0)?(R11i.x):(R7i.w));
}
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R2i.y;
PV0ix = floatBitsToInt((uf_blockVS7[8].w > 0.0)?1.0:0.0);
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), uf_blockVS8[1].x));
PV0iz = floatBitsToInt((0.0 > uf_blockVS7[8].w)?1.0:0.0);
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), uf_blockVS8[1].y));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[8].w);
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R16i.w) * intBitsToFloat(PS0i));
R127i.y = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(uf_blockVS7[5].x) & 0x80000;
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), uf_blockVS8[1].z));
PS1i = floatBitsToInt(uf_blockVS7[5].x) & 0x100000;
// 2
R124i.x = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
PV0iy = (PV1iz == 0x80000)?-1:0;
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),uf_blockVS7[10].x) + intBitsToFloat(PV1ix));
PV0iw = (PS1i == 0x100000)?-1:0;
PS0i = floatBitsToInt(uf_blockVS7[5].x) & 0x200000;
// 3
backupReg0i = R8i.x;
R8i.x = ((PV0iy == 0)?(R11i.x):(R0i.w));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
R5i.z = ((PV0iw == 0)?(R11i.y):(R7i.x));
PV1iw = (PS0i == 0x200000)?-1:0;
R122i.x = ((backupReg0i == 0)?(R11i.x):(R7i.w));
// 4
R1i.x = ((PV1iw == 0)?(R11i.x):(R122i.x));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV1iy)));
PV0iz = ((intBitsToFloat(R9i.w) > 0.5)?-1:0);
PV0iw = floatBitsToInt(uf_blockVS7[5].x) & 0x400000;
PS0i = floatBitsToInt(uf_blockVS7[5].x) & 0x800000;
// 5
PV1ix = (PV0iw == 0x400000)?-1:0;
R123i.y = ((PV0iz == 0)?(R11i.y):(R13i.z));
R125i.z = (PS0i == 0x800000)?-1:0;
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R124i.x)) + intBitsToFloat(PV0iy));
PS1i = ((intBitsToFloat(R9i.y) > 0.5)?-1:0);
// 6
R123i.x = ((PS1i == 0)?(R11i.x):(R7i.w));
R7i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x1000000;
R3i.w = ((PV1ix == 0)?(R11i.y):(R123i.y));
// 7
R2i.x = ((R125i.z == 0)?(R11i.x):(R123i.x));
}
if( activeMaskStackC[3] == true ) {
// 0
R124i.x = floatBitsToInt(intBitsToFloat(R0i.w) + -(uf_blockVS7[84].w));
PV0iy = floatBitsToInt(-(uf_blockVS7[84].w) + uf_blockVS7[85].w);
R125i.z = floatBitsToInt(intBitsToFloat(R0i.w) + -(uf_blockVS7[85].w));
// 1
R127i.x = ((intBitsToFloat(R124i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.y = ((intBitsToFloat(R125i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iz = floatBitsToInt(-(uf_blockVS7[84].x) + uf_blockVS7[85].x);
R124i.w = (R7i.z == 0x1000000)?-1:0;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R125i.w = floatBitsToInt(-(uf_blockVS7[85].x) + uf_blockVS7[86].x);
PS0i = ((intBitsToFloat(R9i.z) > 0.5)?-1:0);
// 3
R123i.x = ((PS0i == 0)?(R11i.y):(R13i.z));
PV1iy = floatBitsToInt(intBitsToFloat(R0i.w) + -(uf_blockVS7[86].w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(PV0ix)) + uf_blockVS7[84].x);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV0iy)));
PS1i = floatBitsToInt(mul_nonIEEE(uf_blockVS7[84].x, intBitsToFloat(PV0iz)));
// 4
PV0ix = floatBitsToInt(-(uf_blockVS7[85].w) + uf_blockVS7[86].w);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(PV1iw)) + intBitsToFloat(PS1i));
R2i.z = ((R124i.w == 0)?(R11i.y):(R123i.x));
R124i.w = ((intBitsToFloat(PV1iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 5
PV1ix = floatBitsToInt(-(intBitsToFloat(R124i.w)) + 1.0);
R15i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R5i.w)));
R13i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R2i.y)));
R14i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R2i.w)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(PS1i));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV1ix)));
// 7
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(PV0iy)) + uf_blockVS7[85].x);
// 8
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R127i.z)) + intBitsToFloat(R126i.y));
// 9
R11i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[86].x,intBitsToFloat(R124i.w)) + intBitsToFloat(R123i.w));
}
if( activeMaskStackC[3] == true ) {
// 0
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), uf_blockVS8[1].w));
PV0iy = floatBitsToInt(uf_blockVS7[5].y) & int(1);
R127i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x200;
R124i.w = floatBitsToInt(uf_blockVS7[5].x) & 0x100;
R125i.w = floatBitsToInt(uf_blockVS7[5].x) & 0x400;
// 1
R125i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x800;
R0i.w = (int(1) != PV0iy)?-1:0;
R125i.z = int(uf_blockVS7[26].x);
// 2
R126i.x = ((R0i.w == 0)?(R9i.x):(R9i.y));
R127i.w = int(-1) + R125i.z;
R126i.y = int(uf_blockVS7[26].y);
// 3
PS1i = floatBitsToInt(float(R124i.w));
// 4
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(R127i.z));
// 5
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iy)));
PS1i = floatBitsToInt(float(R125i.w));
// 6
R11i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x4000000;
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iy)));
R127i.x = int(intBitsToFloat(PV1iw));
// 7
PV1iz = 0 - R127i.x;
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iy)));
R124i.x = int(intBitsToFloat(PV0iw));
// 8
R127i.y = max(R127i.x, PV1iz);
PV0iz = 0 - R124i.x;
R127i.x = int(intBitsToFloat(PV1iw));
// 9
R1i.y = max(R124i.x, PV0iz);
PV1iz = 0 - R127i.x;
PS1i = floatBitsToInt(float(R125i.x));
// 10
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R7i.y = max(R127i.x, PV1iz);
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R124i.w = floatBitsToInt(float(R125i.z));
// 11
backupReg0i = R126i.y;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.w), intBitsToFloat(R124i.w)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R124i.w)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0ix)));
R125i.w = floatBitsToInt(float(backupReg0i));
// 12
PV0iz = floatBitsToInt(intBitsToFloat(R1i.w) * intBitsToFloat(PV1ix));
R126i.x = int(intBitsToFloat(PV1iw));
// 13
PV1iz = 0 - R126i.x;
PS1i = int(intBitsToFloat(PV0iz));
// 14
R124i.y = max(R126i.x, PV1iz);
R126i.w = R127i.y * PS1i;
// 15
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R125i.w));
// 16
PV0iz = floatBitsToInt(intBitsToFloat(R16i.w) * intBitsToFloat(PS1i));
R7i.x = floatBitsToInt(float(R125i.z));
// 17
R7i.z = floatBitsToInt(abs(intBitsToFloat(R7i.x)));
R125i.y = int(intBitsToFloat(PV0iz));
// 18
PS0i = floatBitsToInt(float(R125i.y));
// 19
PV1ix = floatBitsToInt(-(intBitsToFloat(R124i.w)) + intBitsToFloat(PS0i));
R127i.z = floatBitsToInt(float(R125i.y));
// 20
R127i.y = floatBitsToInt(abs(intBitsToFloat(R127i.z)));
R123i.z = ((intBitsToFloat(PV1ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
R3i.y = floatBitsToInt(1.0 / abs(intBitsToFloat(R7i.x)));
// 21
PV1iw = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R127i.z)), intBitsToFloat(R3i.y)));
PS1i = int(intBitsToFloat(R123i.z));
// 22
PV0ix = floatBitsToInt(trunc(intBitsToFloat(PV1iw)));
R2i.y = int(1) - PS1i;
R11i.y = PS1i * R127i.w;
// 23
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0ix)),intBitsToFloat(R7i.z)) + intBitsToFloat(R127i.y));
PS1i = floatBitsToInt(float(R11i.x));
// 24
PV0ix = floatBitsToInt(-(abs(intBitsToFloat(R7i.x))) + intBitsToFloat(R127i.w));
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(R127i.w) >= abs(intBitsToFloat(R7i.x)))?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R126i.z = int(intBitsToFloat(R126i.y));
// 25
backupReg0i = R124i.y;
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iw)));
R124i.y = ((intBitsToFloat(PV0iz) == 0.0)?(R127i.w):(PV0ix));
R126i.x = backupReg0i * R126i.z;
// 26
PV0iw = floatBitsToInt(abs(intBitsToFloat(R7i.x)) + intBitsToFloat(R124i.y));
R125i.z = int(intBitsToFloat(PV1ix));
// 27
R123i.x = ((-(intBitsToFloat(R124i.y)) > 0.0)?(PV0iw):(R124i.y));
PV1iy = 0 - R125i.z;
// 28
R123i.z = ((-(intBitsToFloat(R127i.z)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.x)))):(R123i.x));
PV0iw = max(R125i.z, PV1iy);
// 29
R123i.y = ((intBitsToFloat(R7i.x) == 0.0)?(R127i.z):(R123i.z));
PS1i = PV0iw * R126i.z;
// 30
R127i.w = R125i.y + PS1i;
PS0i = int(intBitsToFloat(R123i.y));
// 31
PS1i = R2i.y * PS0i;
// 32
PV0iw = PS1i + R11i.y;
R127i.z = R7i.y * R127i.w;
// 33
PS1i = R1i.y * PV0iw;
// 34
PV0ix = PS1i + R126i.w;
// 35
PV1iz = R127i.z + PV0ix;
// 36
PV0iy = R126i.x + PV1iz;
// 37
R1i.w = floatBitsToInt(float(PV0iy));
// 38
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), abs(intBitsToFloat(R1i.w))));
R3i.y = floatBitsToInt(abs(intBitsToFloat(R1i.w)));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iz = floatBitsToInt(trunc(intBitsToFloat(R11i.x)));
// 1
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iz)),intBitsToFloat(R7i.z)) + intBitsToFloat(R3i.y));
// 2
PV0ix = floatBitsToInt(-(abs(intBitsToFloat(R7i.x))) + intBitsToFloat(R126i.w));
PV0iz = floatBitsToInt((intBitsToFloat(R126i.w) >= abs(intBitsToFloat(R7i.x)))?1.0:0.0);
// 3
R125i.y = ((intBitsToFloat(PV0iz) == 0.0)?(R126i.w):(PV0ix));
// 4
PV0iw = floatBitsToInt(abs(intBitsToFloat(R7i.x)) + intBitsToFloat(R125i.y));
// 5
R123i.x = ((-(intBitsToFloat(R125i.y)) > 0.0)?(PV0iw):(R125i.y));
// 6
R123i.z = ((-(intBitsToFloat(R1i.w)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.x)))):(R123i.x));
// 7
R123i.y = ((intBitsToFloat(R7i.x) == 0.0)?(R1i.w):(R123i.z));
// 8
R126i.w = int(intBitsToFloat(R123i.y));
// 9
R126i.x = floatBitsToInt(float(R126i.w));
// 10
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(R126i.x))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(R126i.x) > 0.0)?1.0:0.0);
R126i.z = floatBitsToInt(float(R126i.w));
// 11
R127i.x = floatBitsToInt(abs(intBitsToFloat(R126i.z)));
PV1iy = floatBitsToInt(abs(intBitsToFloat(R126i.z)) * 0.25);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iy)));
// 12
R123i.x = floatBitsToInt(intBitsToFloat(PV1iw) * 0.5 + intBitsToFloat(R126i.x));
PV0iw = floatBitsToInt(trunc(intBitsToFloat(PV1iy)));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(R123i.x) * 0.25);
R127i.z = floatBitsToInt(-(intBitsToFloat(PV0iw)) * 4.0 + intBitsToFloat(R127i.x));
// 14
PV0ix = floatBitsToInt(trunc(intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.z) + -4.0);
PV0iw = floatBitsToInt((intBitsToFloat(R127i.z) >= 4.0)?1.0:0.0);
// 15
R127i.x = ((intBitsToFloat(PV0iw) == 0.0)?(R127i.z):(PV0iy));
PS1i = int(intBitsToFloat(PV0ix));
// 16
R7i.x = PS1i + 0x1b;
PV0iz = floatBitsToInt(intBitsToFloat(R127i.x) + 4.0);
PS0i = int(uf_blockVS7[48].z);
// 17
R123i.y = ((-(intBitsToFloat(R127i.x)) > 0.0)?(PV0iz):(R127i.x));
R127i.x = floatBitsToInt(float(PS0i));
// 18
PV0iy = floatBitsToInt((0.0 >= abs(intBitsToFloat(R127i.x)))?1.0:0.0);
PV0iz = floatBitsToInt(-(abs(intBitsToFloat(R127i.x))) + 0.0);
R123i.w = ((-(intBitsToFloat(R126i.z)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.y)))):(R123i.y));
// 19
R126i.w = ((intBitsToFloat(PV0iy) == 0.0)?(0):(PV0iz));
PS1i = int(intBitsToFloat(R123i.w));
// 20
PV0ix = floatBitsToInt(abs(intBitsToFloat(R127i.x)) + intBitsToFloat(R126i.w));
R125i.y = 0xfffffffe + PS1i;
PV0iz = int(-1) + PS1i;
R127i.w = 0xfffffffd + PS1i;
PS0i = floatBitsToInt(float(PS1i));
// 21
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R123i.z = ((-(intBitsToFloat(R126i.w)) > 0.0)?(PV0ix):(R126i.w));
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PS1i = floatBitsToInt(float(PV0iz));
// 22
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R127i.z = ((intBitsToFloat(R127i.x) == 0.0)?(0):(R123i.z));
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(R125i.y));
// 23
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iy)));
R126i.z = int(intBitsToFloat(PV0ix));
// 24
PV0ix = 0 - R126i.z;
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iy)));
R125i.y = int(intBitsToFloat(PV1iz));
// 25
PV1ix = 0 - R125i.y;
PV1iw = max(R126i.z, PV0ix);
R126i.w = int(intBitsToFloat(PV0iy));
// 26
PV0ix = max(R125i.y, PV1ix);
R1i.y = int(1) - PV1iw;
PV0iz = 0 - R126i.w;
PS0i = floatBitsToInt(float(R127i.w));
// 27
R3i.x = int(1) - PV0ix;
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iz = max(R126i.w, PV0iz);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R2i.w = int(intBitsToFloat(R127i.z));
// 28
R3i.y = int(1) - PV1iz;
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iw)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 29
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
R127i.x = int(intBitsToFloat(PV0iw));
// 30
PV0iy = floatBitsToInt(trunc(intBitsToFloat(PV1iz)));
PV0iz = 0 - R127i.x;
R11i.x = floatBitsToInt(1.0 / uf_blockVS7[48].z);
// 31
PV1iy = max(R127i.x, PV0iz);
R5i.w = int(intBitsToFloat(PV0iy));
// 32
R1i.w = int(1) - PV1iy;
}
if( activeMaskStackC[3] == true ) {
R7i.xyzw = floatBitsToInt(uf_blockVS7[R7i.x].xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), uf_blockVS7[45].x));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
R124i.y = ((R0i.w == 0)?(0):(int(1)));
R126i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].x, intBitsToFloat(R11i.x)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), uf_blockVS7[45].y));
R126i.w = floatBitsToInt(intBitsToFloat(R126i.w) * 2.0);
R126i.x = R1i.w * R7i.w;
// 1
PV1ix = floatBitsToInt(uf_blockVS7[44].w + uf_blockVS7[45].y);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R126i.z)) + -(0.5));
PV1iz = floatBitsToInt(uf_blockVS7[44].z + uf_blockVS7[45].x);
R124i.w = (R124i.y == int(1))?-1:0;
R127i.z = R3i.y * R7i.z;
// 2
PV0ix = floatBitsToInt(uf_blockVS7[46].x + uf_blockVS7[46].z);
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.w)) + intBitsToFloat(PV1ix));
PV0iw = floatBitsToInt(uf_blockVS7[46].y + uf_blockVS7[46].w);
R125i.y = R3i.x * R7i.y;
// 3
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R16i.w)),uf_blockVS7[44].x) + -(intBitsToFloat(PV0iy)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.w),uf_blockVS7[44].y) + intBitsToFloat(PV0iz));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),uf_blockVS7[46].w) + intBitsToFloat(PV0iw));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),uf_blockVS7[46].z) + intBitsToFloat(PV0ix));
PS1i = R1i.y * R7i.x;
// 4
PV0ix = R125i.y + PS1i;
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.w),uf_blockVS7[45].z) + intBitsToFloat(R123i.w));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.w),uf_blockVS7[45].w) + intBitsToFloat(R123i.z));
PV0iw = (R124i.y == 0x2)?-1:0;
PS0i = floatBitsToInt(1.0 / uf_blockVS7[48].w);
// 5
R123i.x = ((PV0iw == 0)?(R9i.x):(R9i.z));
R124i.y = ((PV0iw == 0)?(R9i.y):(R9i.x));
PV1iz = R127i.z + PV0ix;
R126i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].y, intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(float(R2i.w));
// 6
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(PS1i)) + intBitsToFloat(R127i.x));
R1i.y = R126i.x + PV1iz;
R123i.z = ((R124i.w == 0)?(backupReg0i):(R9i.y));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R126i.w)) + -(0.5));
PS0i = floatBitsToInt(float(R5i.w));
// 7
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R126i.y)) + intBitsToFloat(R123i.x));
R126i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[50].x, intBitsToFloat(R123i.z)));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) * 2.0);
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.w)),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.y));
PS1i = int(uf_blockVS7[53].z);
// 8
R123i.x = ((R124i.w == 0)?(R124i.y):(R9i.z));
R124i.y = ((R124i.w == 0)?(R9i.x):(R9i.y));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R127i.w)) + -(intBitsToFloat(R123i.w)));
R127i.w = ((R124i.w == 0)?(R9i.y):(R9i.z));
R125i.x = floatBitsToInt(float(PS1i));
// 9
PV1ix = floatBitsToInt(uf_blockVS7[49].z + uf_blockVS7[50].x);
R126i.y = floatBitsToInt(abs(intBitsToFloat(R125i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(uf_blockVS7[50].y, intBitsToFloat(R123i.x)));
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 2.0);
PV1iw = floatBitsToInt(uf_blockVS7[49].w + uf_blockVS7[50].y);
R125i.z = floatBitsToInt(float(R1i.y));
// 10
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(R125i.z))?1.0:0.0);
R127i.y = floatBitsToInt(-(intBitsToFloat(PV1iz)) + intBitsToFloat(PV1iw));
PV0iz = floatBitsToInt((intBitsToFloat(R125i.z) > 0.0)?1.0:0.0);
R124i.w = floatBitsToInt(-(intBitsToFloat(R126i.z)) + intBitsToFloat(PV1ix));
R125i.y = floatBitsToInt(float(R1i.y));
// 11
R127i.x = floatBitsToInt(abs(intBitsToFloat(R125i.y)));
PV1iy = floatBitsToInt(uf_blockVS7[51].x + uf_blockVS7[51].z);
PV1iz = floatBitsToInt(uf_blockVS7[51].y + uf_blockVS7[51].w);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(1.0 / abs(intBitsToFloat(R125i.x)));
// 12
R123i.x = floatBitsToInt(intBitsToFloat(PV1iw) * 0.5 + intBitsToFloat(R125i.z));
R124i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[51].z,intBitsToFloat(R124i.y)) + intBitsToFloat(PV1iy));
R125i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[51].w,intBitsToFloat(R127i.w)) + intBitsToFloat(PV1iz));
PV0iw = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R125i.y)), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R125i.x));
// 13
R124i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R16i.w)),uf_blockVS7[49].x) + -(intBitsToFloat(R124i.w)));
PV1iy = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(PS0i));
PV1iz = floatBitsToInt(trunc(intBitsToFloat(PV0iw)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.w),uf_blockVS7[49].y) + intBitsToFloat(R127i.y));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[53].z);
// 14
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iz)),intBitsToFloat(R126i.y)) + intBitsToFloat(R127i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[53].x, intBitsToFloat(PS1i)));
R126i.z = ((R0i.w == 0)?(0):(0x2));
PV0iw = floatBitsToInt(trunc(intBitsToFloat(PV1iy)));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[53].w);
// 15
R126i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[53].y, intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt((intBitsToFloat(R127i.x) >= abs(intBitsToFloat(R125i.x)))?1.0:0.0);
PV1iz = floatBitsToInt(-(abs(intBitsToFloat(R125i.x))) + intBitsToFloat(R127i.x));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.w),uf_blockVS7[50].z) + intBitsToFloat(R124i.y));
PS1i = int(intBitsToFloat(PV0iw));
// 16
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R127i.y)) + -(0.5));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.w),uf_blockVS7[50].w) + intBitsToFloat(R125i.z));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(R126i.x)) + -(0.5));
R127i.w = ((intBitsToFloat(PV1iy) == 0.0)?(backupReg0i):(PV1iz));
PS0i = floatBitsToInt(float(PS1i));
// 17
backupReg0i = R126i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.x)),intBitsToFloat(PS0i)) + intBitsToFloat(R124i.w));
PV1iy = floatBitsToInt(abs(intBitsToFloat(R125i.x)) + intBitsToFloat(R127i.w));
R126i.z = (backupReg0i == int(1))?-1:0;
PV1iw = (backupReg0i == 0x2)?-1:0;
R126i.y = int(uf_blockVS7[58].z);
// 18
backupReg0i = R123i.x;
R123i.x = ((PV1iw == 0)?(R9i.x):(R9i.z));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(R125i.z)) + -(intBitsToFloat(backupReg0i)));
R123i.z = ((-(intBitsToFloat(R127i.w)) > 0.0)?(PV1iy):(R127i.w));
R123i.w = ((PV1iw == 0)?(R9i.y):(R9i.x));
R122i.x = ((PV1iw == 0)?(R9i.z):(R9i.y));
// 19
R126i.x = ((R126i.z == 0)?(R123i.w):(R9i.z));
R123i.y = ((-(intBitsToFloat(R125i.y)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.z)))):(R123i.z));
R125i.z = ((R126i.z == 0)?(R123i.x):(R9i.y));
R5i.w = ((R126i.z == 0)?(R122i.x):(R9i.x));
R3i.x = ((R126i.z == 0)?(R9i.x):(R9i.y));
// 20
R7i.z = ((R126i.z == 0)?(R9i.y):(R9i.z));
R123i.w = ((intBitsToFloat(R125i.x) == 0.0)?(R125i.y):(R123i.y));
R9i.w = floatBitsToInt(float(R126i.y));
// 21
PV1ix = floatBitsToInt(-(abs(intBitsToFloat(R9i.w))) + 0.0);
PV1iz = floatBitsToInt((0.0 >= abs(intBitsToFloat(R9i.w)))?1.0:0.0);
PS1i = int(intBitsToFloat(R123i.w));
// 22
backupReg0i = R125i.z;
PV0ix = floatBitsToInt(uf_blockVS7[54].z + uf_blockVS7[55].x);
R126i.y = ((intBitsToFloat(PV1iz) == 0.0)?(0):(PV1ix));
R125i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[55].y, intBitsToFloat(R126i.x)));
R125i.z = floatBitsToInt(intBitsToFloat(R125i.z) * 2.0);
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[55].x, intBitsToFloat(backupReg0i)));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
PS0i = floatBitsToInt(float(PS1i));
// 23
R1i.x = floatBitsToInt(-(intBitsToFloat(PV0iw)) + intBitsToFloat(PV0ix));
PV1iy = floatBitsToInt(uf_blockVS7[54].w + uf_blockVS7[55].y);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PS0i)) + intBitsToFloat(R124i.x));
PV1iw = floatBitsToInt(abs(intBitsToFloat(R9i.w)) + intBitsToFloat(R126i.y));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R9i.w));
// 24
R9i.x = ((-(intBitsToFloat(R126i.y)) > 0.0)?(PV1iw):(R126i.y));
R9i.y = floatBitsToInt(-(intBitsToFloat(R125i.z)) + intBitsToFloat(PV1iy));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.z));
R3i.w = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
R0i.w = floatBitsToInt(1.0 / uf_blockVS7[58].z);
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(trunc(intBitsToFloat(R3i.w)));
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[58].x, intBitsToFloat(R0i.w)));
R123i.z = ((intBitsToFloat(R9i.w) == 0.0)?(0):(R9i.x));
R1i.w = floatBitsToInt(intBitsToFloat(R7i.x) + 0.5);
PS0i = floatBitsToInt(1.0 / uf_blockVS7[58].w);
// 1
R124i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R16i.w)),uf_blockVS7[54].x) + -(intBitsToFloat(R1i.x)));
R124i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[58].y, intBitsToFloat(PS0i)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R127i.y)) + -(0.5));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.w),uf_blockVS7[54].y) + intBitsToFloat(R9i.y));
R126i.y = int(intBitsToFloat(R123i.z));
// 2
R11i.x = floatBitsToInt(intBitsToFloat(R9i.z) + 0.5);
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R124i.y)) + -(0.5));
PV0iz = floatBitsToInt(uf_blockVS7[57].y + uf_blockVS7[57].z);
R8i.w = floatBitsToInt(intBitsToFloat(R5i.z) + 0.5);
R125i.y = int(intBitsToFloat(R127i.x));
// 3
backupReg0i = R126i.y;
PV1ix = floatBitsToInt(intBitsToFloat(R1i.z) * intBitsToFloat(R1i.z));
R126i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[57].z,intBitsToFloat(R5i.w)) + intBitsToFloat(PV0iz));
R2i.z = floatBitsToInt(intBitsToFloat(R1i.y) + 0.5);
R127i.w = floatBitsToInt(-(uf_blockVS7[92].z) + uf_blockVS7[92].w);
PS1i = floatBitsToInt(float(backupReg0i));
// 4
PV0ix = floatBitsToInt(uf_blockVS7[56].y + uf_blockVS7[56].w);
R123i.y = floatBitsToInt((intBitsToFloat(R0i.y) * intBitsToFloat(R0i.y) + intBitsToFloat(PV1ix)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PS1i)) + intBitsToFloat(R124i.x));
PV0iw = floatBitsToInt(uf_blockVS7[56].x + uf_blockVS7[56].z);
PS0i = floatBitsToInt(float(R125i.y));
// 5
backupReg0i = R123i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.y)),intBitsToFloat(PS0i)) + intBitsToFloat(R126i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[56].z,intBitsToFloat(R3i.x)) + intBitsToFloat(PV0iw));
R123i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[56].w,intBitsToFloat(R7i.z)) + intBitsToFloat(PV0ix));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.w),uf_blockVS7[57].x) + intBitsToFloat(R126i.y));
R122i.x = floatBitsToInt((intBitsToFloat(R10i.x) * intBitsToFloat(R10i.x) + intBitsToFloat(backupReg0i)));
// 6
R123i.x = floatBitsToInt(-(intBitsToFloat(R123i.w)) * intBitsToFloat(0x3e22f983) + 0.5);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.w),uf_blockVS7[55].z) + intBitsToFloat(R123i.y));
R127i.z = floatBitsToInt(intBitsToFloat(R10i.z) + -(uf_blockVS7[93].x));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.w),uf_blockVS7[55].w) + intBitsToFloat(R123i.z));
tempResultf = 1.0 / sqrt(intBitsToFloat(R122i.x));
PS0i = floatBitsToInt(tempResultf);
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PS0i)));
R125i.z = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.y),intBitsToFloat(R15i.x),intBitsToFloat(R13i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV1ix),intBitsToFloat(PV1iy),intBitsToFloat(PV1iw),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 9
R124i.x = floatBitsToInt(-(uf_blockVS7[93].x) + uf_blockVS7[93].y);
PV1iy = floatBitsToInt(max(intBitsToFloat(PV0ix), -(intBitsToFloat(PV0ix))));
R10i.z = floatBitsToInt(intBitsToFloat(R10i.z) + -(uf_blockVS7[93].z));
R127i.w = floatBitsToInt(intBitsToFloat(R122i.x) * intBitsToFloat(0x3e22f983));
R124i.w = floatBitsToInt(-(uf_blockVS7[93].z) + uf_blockVS7[93].w);
// 10
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) + -(uf_blockVS7[92].z));
R124i.y = floatBitsToInt(intBitsToFloat(R0i.x) + 0.0);
R126i.x = floatBitsToInt(sin((intBitsToFloat(R127i.w))/0.1591549367));
// 11
backupReg0i = R127i.w;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R126i.z)));
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(R125i.z));
PV1iy = clampFI32(PV1iy);
R125i.z = floatBitsToInt(intBitsToFloat(R124i.y) + -(uf_blockVS7[104].w));
R127i.w = floatBitsToInt(-(uf_blockVS7[104].w) + uf_blockVS7[105].w);
PS1i = floatBitsToInt(cos((intBitsToFloat(backupReg0i))/0.1591549367));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R126i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(PV1iy)));
R123i.z = floatBitsToInt(-2.0 * intBitsToFloat(PV1iy) + 3.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i),intBitsToFloat(R9i.y)) + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R124i.x));
// 13
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.x)),intBitsToFloat(R9i.y)) + intBitsToFloat(PV0ix));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R123i.z)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R123i.w)) + -(intBitsToFloat(R127i.x)));
R7i.w = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS0i));
R7i.w = clampFI32(R7i.w);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R124i.w));
// 14
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R123i.x)) + intBitsToFloat(R124i.z));
PV0iy = floatBitsToInt(intBitsToFloat(R10i.z) * intBitsToFloat(PS1i));
PV0iy = clampFI32(PV0iy);
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R7i.w)));
R10i.w = floatBitsToInt(intBitsToFloat(R123i.z) + 0.5);
R126i.w = floatBitsToInt(-(uf_blockVS7[104].x) + uf_blockVS7[105].x);
// 15
R9i.x = floatBitsToInt(-(intBitsToFloat(PV0iy)) + 1.0);
R11i.y = floatBitsToInt(intBitsToFloat(R123i.x) + 0.5);
R127i.z = floatBitsToInt(intBitsToFloat(R124i.y) + -(uf_blockVS7[105].w));
PV1iw = floatBitsToInt(-(uf_blockVS7[105].w) + uf_blockVS7[106].w);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 16
PV0ix = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(-(uf_blockVS7[105].x) + uf_blockVS7[106].x);
R1i.z = ((intBitsToFloat(R125i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R9i.x)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 17
R127i.x = floatBitsToInt(intBitsToFloat(R124i.y) + -(uf_blockVS7[106].w));
R1i.y = ((intBitsToFloat(R127i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(PV0ix)) + uf_blockVS7[104].x);
// 18
R2i.x = ((intBitsToFloat(R127i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV1iz)) + uf_blockVS7[105].x);
R127i.z = floatBitsToInt(intBitsToFloat(R124i.y) + -(uf_blockVS7[107].w));
// 19
R1i.x = ((intBitsToFloat(R127i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.w = floatBitsToInt(-(uf_blockVS7[106].x) + uf_blockVS7[107].x);
// 20
PV0iz = floatBitsToInt(-(uf_blockVS7[106].w) + uf_blockVS7[107].w);
// 21
R126i.y = floatBitsToInt(-(uf_blockVS7[107].x) + uf_blockVS7[108].x);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 22
PV0ix = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(-(uf_blockVS7[107].w) + uf_blockVS7[108].w);
R125i.z = floatBitsToInt(intBitsToFloat(R124i.y) + -(uf_blockVS7[108].w));
// 23
R3i.x = ((intBitsToFloat(R125i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R10i.z = floatBitsToInt(intBitsToFloat(R124i.y) + -(uf_blockVS7[109].w));
R9i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PV0ix)) + uf_blockVS7[106].x);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 24
R0i.y = ((intBitsToFloat(R10i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iz = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(PS1i));
R126i.w = floatBitsToInt(-(uf_blockVS7[108].x) + uf_blockVS7[109].x);
// 25
R7i.x = floatBitsToInt(intBitsToFloat(R124i.y) + -(uf_blockVS7[110].w));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV0iz)) + uf_blockVS7[107].x);
// 26
R10i.x = ((intBitsToFloat(R7i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iz = floatBitsToInt(-(uf_blockVS7[108].w) + uf_blockVS7[109].w);
// 27
R9i.y = floatBitsToInt(-(uf_blockVS7[109].x) + uf_blockVS7[110].x);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 28
PV0ix = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(-(uf_blockVS7[109].w) + uf_blockVS7[110].w);
// 29
R0i.x = floatBitsToInt(intBitsToFloat(R124i.y) + -(uf_blockVS7[111].w));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(PV0ix)) + uf_blockVS7[108].x);
R5i.w = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
}
if( activeMaskStackC[3] == true ) {
// 0
R124i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS8[3].x, intBitsToFloat(R0i.w)));
R127i.y = ((intBitsToFloat(R0i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iz = floatBitsToInt(intBitsToFloat(R9i.y) * intBitsToFloat(R5i.w));
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z),intBitsToFloat(PV0iz)) + uf_blockVS7[109].x);
PV1iz = floatBitsToInt(-(intBitsToFloat(R0i.y)) + 1.0);
PV1iw = floatBitsToInt(-(intBitsToFloat(R10i.x)) + 1.0);
PS1i = floatBitsToInt(-(intBitsToFloat(R3i.x)) + 1.0);
// 2
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(PV1ix)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PV1iz)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PV1iw)));
R126i.w = floatBitsToInt(-(uf_blockVS7[110].x) + uf_blockVS7[111].x);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PS1i)));
// 3
PV1ix = floatBitsToInt(-(intBitsToFloat(R1i.y)) + 1.0);
PV1iy = floatBitsToInt(-(intBitsToFloat(R1i.x)) + 1.0);
PV1iz = floatBitsToInt(-(uf_blockVS7[110].w) + uf_blockVS7[111].w);
PV1iw = floatBitsToInt(-(intBitsToFloat(R2i.x)) + 1.0);
PS1i = floatBitsToInt(-(intBitsToFloat(R1i.z)) + 1.0);
// 4
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PV1ix)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[104].x, intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS0i));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(PV0iy)) + intBitsToFloat(PV0iw));
R4i.z = floatBitsToInt(fract(intBitsToFloat(R4i.w)));
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(R125i.z)) + intBitsToFloat(R123i.y));
PV0iy = floatBitsToInt(intBitsToFloat(R16i.w) * 100.0);
PV0iy = clampFI32(PV0iy);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(PV1ix)) + uf_blockVS7[110].x);
// 7
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PV0iy)));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV0iy)));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(PV0iy)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.x));
// 8
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.w));
// 9
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R124i.y)) + intBitsToFloat(R123i.z));
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R124i.z)) + intBitsToFloat(R123i.y));
// 11
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.x));
// 12
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R124i.x)) + 0.0);
R1i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[111].x,intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.w));
}
if( activeMaskStackC[3] == true ) {
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),uf_blockVS13[24].x) + -(uf_blockVS13[24].y));
R123i.x = clampFI32(R123i.x);
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), uf_blockVS11[5].z));
// 1
PV1ix = floatBitsToInt(uf_blockVS13[28].y + 1.0);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),uf_blockVS13[22].x) + -(uf_blockVS13[22].y));
R123i.y = clampFI32(R123i.y);
R124i.z = floatBitsToInt(uf_blockVS13[28].y * 1.0 + intBitsToFloat(R8i.y));
PV1iw = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) * 1.5);
PV0iz = clampFI32(PV0iz);
tempResultf = max(0.0, intBitsToFloat(PV1iw));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 3
R126i.x = floatBitsToInt(intBitsToFloat(PV0iz) * 15.0);
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockVS13[24].w, intBitsToFloat(PS0i)));
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 4
R124i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS13[23].x, intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockVS13[23].y, intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 5
R2i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)),uf_blockVS13[25].w) + uf_blockVS13[25].w);
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 6
R8i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
PS0i = floatBitsToInt(exp2(intBitsToFloat(R124i.x)));
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(-(uf_blockVS13[23].z),intBitsToFloat(PS0i)) + uf_blockVS13[23].z);
R123i.x = clampFI32(R123i.x);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 8
PV0ix = floatBitsToInt(-(intBitsToFloat(R3i.y)) + intBitsToFloat(R123i.x));
PV0ix = clampFI32(PV0ix);
PV0iz = floatBitsToInt(intBitsToFloat(R124i.z) * intBitsToFloat(PS1i));
// 9
PV1iy = floatBitsToInt(max(intBitsToFloat(PV0iz), intBitsToFloat(0x3e4ccccd)));
R4i.z = PV0ix;
R6i.w = PV0ix;
// 10
R7i.x = floatBitsToInt(min(intBitsToFloat(PV1iy), 1.0));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(min(uf_blockVS6[17].y, uf_blockVS13[27].z));
R127i.y = floatBitsToInt(-(intBitsToFloat(R6i.x)) + uf_blockVS6[17].x);
R124i.z = floatBitsToInt(-(intBitsToFloat(R10i.y)) + uf_blockVS6[17].y);
// 1
R127i.z = floatBitsToInt(-(intBitsToFloat(R3i.z)) + uf_blockVS6[17].z);
PV1iw = floatBitsToInt(-(intBitsToFloat(R5i.y)) + intBitsToFloat(PV0ix));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(R127i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS13[27].y,intBitsToFloat(PV1iw)) + uf_blockVS13[27].x);
R123i.z = clampFI32(R123i.z);
// 3
R123i.x = floatBitsToInt((intBitsToFloat(R124i.z) * intBitsToFloat(R124i.z) + intBitsToFloat(PV0ix)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), uf_blockVS13[26].w));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(R13i.x) * intBitsToFloat(R0i.z));
R123i.z = floatBitsToInt((intBitsToFloat(R127i.y) * intBitsToFloat(R127i.y) + intBitsToFloat(R123i.x)));
// 5
R6i.y = 0;
PV1iz = floatBitsToInt(-(intBitsToFloat(PV0iy)) + 1.0);
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.z));
PS1i = floatBitsToInt(tempResultf);
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS1i)));
R123i.w = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3f333333) + intBitsToFloat(0x3e19999a));
R123i.w = clampFI32(R123i.w);
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(uf_blockVS13[28].x,uf_blockVS13[28].y,uf_blockVS13[28].z,0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
// 8
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) + 8.5);
PV0iy = ((0.0 >= intBitsToFloat(R9i.x))?-1:0);
R127i.z = floatBitsToInt(intBitsToFloat(PV1ix) + 0.5);
PV0iw = ((0.0 >= intBitsToFloat(R7i.w))?-1:0);
R0i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
// 9
R4i.x = ((PV0iy == 0)?(PV0iw):(int(-1)));
PV1iy = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R123i.z = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
R0i.w = 0;
R6i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3daaaaab));
// 10
R1i.x = 0;
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(0xbe593484));
R3i.z = ((R4i.x == 0)?(R5i.x):(R0i.w));
R3i.w = 0;
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1iy)));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f22f983));
R0i.y = R15i.x;
R1i.z = R13i.w;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R123i.y)) + intBitsToFloat(0x3fc90da4));
R0i.x = R13i.y;
// 12
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),-(intBitsToFloat(R123i.w))) + 1.0);
R10i.y = ((R4i.x == 0)?(R8i.z):(R0i.z));
R6i.z = ((R4i.x == 0)?(R7i.y):(R3i.w));
R5i.w = R16i.y;
R7i.y = R19i.z;
}
if( activeMaskStackC[3] == true ) {
R8i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y))).xyz);
R9i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R7i.x;
R7i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS11[2].w, uf_blockVS14[0].z));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(backupReg0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(backupReg0i)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(backupReg0i)));
R7i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS11[2].w, uf_blockVS14[0].w));
// 1
R5i.x = ((R4i.x == 0)?(0):(0x3f800000));
R127i.y = ((R4i.x == 0)?(0):(R6i.w));
R8i.z = R1i.y;
R4i.w = ((R4i.x == 0)?(R2i.x):(R1i.x));
R126i.x = ((R4i.x == 0)?(0):(R3i.y));
// 2
R123i.x = ((R4i.x == 0)?(0):(R126i.w));
R126i.y = ((R4i.x == 0)?(0):(R127i.z));
R123i.z = ((R4i.x == 0)?(0):(R5i.y));
R123i.w = ((R4i.x == 0)?(0):(R2i.w));
R125i.y = ((R4i.x == 0)?(0):(R124i.y));
// 3
R21i.x = ((R5i.x == 0)?(R2i.w):(R123i.w));
R21i.y = ((R5i.x == 0)?(R5i.y):(R123i.z));
R21i.z = ((R5i.x == 0)?(R6i.w):(R127i.y));
R21i.w = ((R5i.x == 0)?(R3i.y):(R126i.x));
R22i.x = ((R5i.x == 0)?(R126i.w):(R123i.x));
// 4
R123i.x = ((R4i.x == 0)?(0):(R4i.z));
R22i.y = ((R5i.x == 0)?(R127i.z):(R126i.y));
R22i.z = ((R5i.x == 0)?(R124i.y):(R125i.y));
R126i.w = ((R4i.x == 0)?(0):(R9i.w));
R6i.x = ((R4i.x == 0)?(0):(R0i.w));
// 5
R8i.x = ((R4i.x == 0)?(0):(R0i.y));
R126i.y = ((R4i.x == 0)?(0):(R9i.z));
R127i.z = ((R4i.x == 0)?(0):(R9i.y));
R22i.w = ((R5i.x == 0)?(R4i.z):(R123i.x));
// 6
R5i.y = ((R4i.x == 0)?(0):(R1i.z));
R123i.w = ((R4i.x == 0)?(0):(R9i.x));
R3i.y = ((R4i.x == 0)?(0):(R0i.z));
// 7
R23i.x = ((R5i.x == 0)?(R9i.x):(R123i.w));
R23i.y = ((R5i.x == 0)?(R9i.y):(R127i.z));
R23i.z = ((R5i.x == 0)?(R9i.z):(R126i.y));
R23i.w = ((R5i.x == 0)?(R9i.w):(R126i.w));
// 8
R9i.w = ((R4i.x == 0)?(0):(R0i.x));
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[44].y,intBitsToFloat(R7i.x)) + intBitsToFloat(R1i.w));
R125i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[49].y,intBitsToFloat(R7i.x)) + intBitsToFloat(R11i.x));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockVS7[44].y, intBitsToFloat(R7i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[49].y, intBitsToFloat(R7i.w)));
// 1
R0i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[54].y,intBitsToFloat(R7i.x)) + intBitsToFloat(R11i.y));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),uf_blockVS11[3].w) + intBitsToFloat(R8i.w));
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS11[3].w,intBitsToFloat(PV0iw)) + intBitsToFloat(R2i.z));
PV1iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[54].y, intBitsToFloat(R7i.w)));
R122i.x = ((R4i.x == 0)?(0):(R126i.x));
// 2
R24i.x = ((R5i.x == 0)?(R126i.x):(R122i.x));
R0i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS11[3].w,intBitsToFloat(PV1iw)) + intBitsToFloat(R10i.w));
R123i.z = ((R4i.x == 0)?(0):(R125i.y));
R123i.w = ((R4i.x == 0)?(0):(R126i.y));
R122i.x = ((R4i.x == 0)?(0):(R127i.z));
// 3
R126i.x = ((R4i.x == 0)?(0):(R0i.y));
R24i.y = ((R5i.x == 0)?(R126i.y):(R123i.w));
R24i.z = ((R5i.x == 0)?(R125i.y):(R123i.z));
R24i.w = ((R5i.x == 0)?(R127i.z):(R122i.x));
R124i.z = ((R4i.x == 0)?(0):(R12i.z));
// 4
R124i.x = ((R4i.x == 0)?(0):(R12i.y));
R126i.y = ((R4i.x == 0)?(0):(R12i.w));
R125i.z = R19i.z;
R123i.w = ((R4i.x == 0)?(0):(R0i.x));
R122i.x = ((R4i.x == 0)?(0):(R11i.w));
// 5
R0i.x = ((R5i.x == 0)?(R0i.x):(R123i.w));
R0i.y = ((R5i.x == 0)?(R0i.y):(R126i.x));
PV1iz = R13i.y;
R127i.w = R13i.w;
R25i.x = ((R5i.x == 0)?(R11i.w):(R122i.x));
// 6
R20i.x = ((R5i.x == 0)?(PV1iz):(R9i.w));
R123i.y = ((R4i.x == 0)?(0):(R11i.z));
R127i.z = ((R4i.x == 0)?(0):(R14i.w));
R124i.w = ((R4i.x == 0)?(R19i.y):(R1i.y));
R122i.x = ((R4i.x == 0)?(0):(R13i.x));
// 7
R123i.x = ((R4i.x == 0)?(0):(R14i.y));
R25i.y = ((R5i.x == 0)?(R13i.x):(R122i.x));
R25i.z = ((R5i.x == 0)?(R11i.z):(R123i.y));
R126i.w = ((R4i.x == 0)?(0):(R15i.w));
R126i.x = ((R4i.x == 0)?(0):(R15i.y));
// 8
R127i.x = ((R4i.x == 0)?(R18i.y):(R3i.w));
R123i.y = ((R4i.x == 0)?(0):(R13i.z));
R126i.z = ((R4i.x == 0)?(0):(R15i.z));
R25i.w = ((R5i.x == 0)?(R14i.y):(R123i.x));
R122i.x = ((R4i.x == 0)?(0):(R14i.z));
// 9
R26i.x = ((R5i.x == 0)?(R13i.z):(R123i.y));
R26i.y = ((R5i.x == 0)?(R15i.y):(R126i.x));
R26i.z = ((R5i.x == 0)?(R14i.w):(R127i.z));
R125i.w = ((R4i.x == 0)?(R18i.w):(R16i.y));
R17i.x = ((R5i.x == 0)?(R14i.z):(R122i.x));
// 10
R17i.y = ((R5i.x == 0)?(R15i.w):(R126i.w));
R123i.z = ((R4i.x == 0)?(0):(R14i.x));
R126i.w = ((R4i.x == 0)?(R18i.z):(R0i.z));
R0i.z = ((R5i.x == 0)?(R0i.z):(R3i.y));
// 11
PV1ix = R15i.x;
R26i.w = ((R5i.x == 0)?(R14i.x):(R123i.z));
// 12
R20i.y = ((R5i.x == 0)?(PV1ix):(R8i.x));
R20i.z = ((R5i.x == 0)?(R127i.w):(R5i.y));
R20i.w = R6i.x;
// 13
R123i.x = ((R4i.x == 0)?(0):(R12i.x));
// 14
R14i.x = ((R5i.x == 0)?(R12i.x):(R123i.x));
R14i.y = ((R5i.x == 0)?(R12i.y):(R124i.x));
R14i.z = ((R5i.x == 0)?(R12i.z):(R124i.z));
R14i.w = ((R5i.x == 0)?(R12i.w):(R126i.y));
// 15
R123i.x = ((R4i.x == 0)?(R19i.x):(R1i.x));
// 16
R19i.x = ((R5i.x == 0)?(R4i.w):(R123i.x));
R19i.y = ((R5i.x == 0)?(R8i.z):(R124i.w));
R19i.z = ((R5i.x == 0)?(R7i.y):(R125i.z));
R123i.w = ((R4i.x == 0)?(0):(R16i.x));
// 17
R17i.z = ((R5i.x == 0)?(R16i.x):(R123i.w));
R17i.w = ((R5i.x == 0)?(R15i.z):(R126i.z));
// 18
R123i.y = ((R4i.x == 0)?(R18i.x):(R0i.w));
// 19
R18i.x = ((R5i.x == 0)?(R3i.z):(R123i.y));
R18i.y = ((R5i.x == 0)?(R6i.z):(R127i.x));
R18i.z = ((R5i.x == 0)?(R10i.y):(R126i.w));
R18i.w = ((R5i.x == 0)?(R5i.w):(R125i.w));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R26i.x), intBitsToFloat(R26i.y), intBitsToFloat(R26i.z), intBitsToFloat(R26i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R25i.x), intBitsToFloat(R25i.y), intBitsToFloat(R25i.z), intBitsToFloat(R25i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R24i.x), intBitsToFloat(R24i.y), intBitsToFloat(R24i.z), intBitsToFloat(R24i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R23i.x), intBitsToFloat(R23i.y), intBitsToFloat(R23i.z), intBitsToFloat(R23i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R22i.x), intBitsToFloat(R22i.y), intBitsToFloat(R22i.z), intBitsToFloat(R22i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R21i.x), intBitsToFloat(R21i.y), intBitsToFloat(R21i.z), intBitsToFloat(R21i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.z));
// export
passParameterSem9 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.z));
}
