#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 82a36778e489ab04
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
vec4 uf_blockVS8[7];
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

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem7;
out vec4 passParameterSem8;
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
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem10;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R9i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem9;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
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
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem6;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R3i.z = floatBitsToInt(-(intBitsToFloat(R8i.y)) + 1.0);
R1i.w = 0;
R2i.w = floatBitsToInt(1.0);
// 1
R13i.w = floatBitsToInt(-(intBitsToFloat(R4i.w)) + uf_blockVS8[2].x);
R5i.w = floatBitsToInt(-(intBitsToFloat(R8i.x)) + 1.0);
// 2
predResult = (0.0 > intBitsToFloat(R13i.w));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R15i.x = 0;
R15i.y = 0;
R15i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R12i.x = 0;
// 1
R4i.w = R2i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R4i.w = R1i.w;
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
PS0i = int(intBitsToFloat(R3i.w));
// 1
R3i.x = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R13i.w) >= intBitsToFloat(R3i.x));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R15i.x = 0;
R15i.y = 0;
R15i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R12i.x = 0;
// 1
R1i.w = R2i.w;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R1i.w == 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(max(intBitsToFloat(R6i.x), 0.0));
R127i.y = floatBitsToInt(intBitsToFloat(R13i.w) + uf_blockVS7[15].z);
PV0iz = floatBitsToInt((0.0 > uf_blockVS7[9].x)?1.0:0.0);
PV0iw = floatBitsToInt((uf_blockVS7[9].x > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(1.0 / uf_blockVS7[9].x);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), uf_blockVS7[10].y));
R126i.y = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(intBitsToFloat(R13i.w) * intBitsToFloat(PS0i));
R124i.w = floatBitsToInt(min(intBitsToFloat(PV0ix), 0.0));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[14].z);
// 2
R127i.x = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), uf_blockVS7[15].x));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R3i.x));
// 3
R3i.x = floatBitsToInt(intBitsToFloat(R13i.w) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(uf_blockVS7[5].x) & int(1);
R126i.z = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(fract(intBitsToFloat(PV0iy)));
R127i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x2;
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.x)));
PV0iy = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0x40c90fdb));
R125i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x4;
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV1iw)));
R127i.y = floatBitsToInt(float(PV1iy));
// 5
backupReg0i = R127i.z;
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3e22f983) + 0.5);
R126i.y = floatBitsToInt(-(uf_blockVS7[96].w) + uf_blockVS7[97].w);
R127i.z = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iw));
R125i.w = floatBitsToInt(fract(intBitsToFloat(R126i.z)));
R125i.y = floatBitsToInt(float(backupReg0i));
// 6
backupReg0i = R125i.z;
R127i.x = floatBitsToInt((intBitsToFloat(R127i.y) > 0.0)?1.0:0.0);
R0i.y = floatBitsToInt(intBitsToFloat(R127i.z) + -(uf_blockVS7[97].w));
R125i.z = floatBitsToInt(-(uf_blockVS7[96].z) + uf_blockVS7[97].z);
R127i.w = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
R124i.y = floatBitsToInt(float(backupReg0i));
// 7
backupReg0i = R127i.y;
R126i.x = floatBitsToInt((intBitsToFloat(R125i.y) > 0.0)?1.0:0.0);
R127i.y = floatBitsToInt((0.0 > intBitsToFloat(R125i.y))?1.0:0.0);
R126i.z = floatBitsToInt((intBitsToFloat(R124i.y) > 0.0)?1.0:0.0);
R126i.w = floatBitsToInt((0.0 > intBitsToFloat(backupReg0i))?1.0:0.0);
R124i.x = floatBitsToInt(1.0 / intBitsToFloat(R126i.y));
// 8
R125i.x = floatBitsToInt(intBitsToFloat(R125i.w) + -(0.5));
R125i.y = floatBitsToInt(intBitsToFloat(R127i.z) + -(uf_blockVS7[96].w));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(R124i.y))?1.0:0.0);
R124i.y = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(R124i.x));
// 9
backupReg0i = R126i.x;
backupReg1i = R126i.z;
R126i.x = ((intBitsToFloat(R0i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.y = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(R127i.y)));
R126i.z = floatBitsToInt(intBitsToFloat(R127i.x) + -(intBitsToFloat(R126i.w)));
PV1iw = floatBitsToInt(-(uf_blockVS7[96].y) + uf_blockVS7[97].y);
R124i.z = floatBitsToInt(intBitsToFloat(backupReg1i) + -(intBitsToFloat(PV0iw)));
// 10
PV0ix = floatBitsToInt(-(uf_blockVS7[96].x) + uf_blockVS7[97].x);
R126i.y = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0x3e22f983));
R127i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(R124i.x));
R123i.w = ((intBitsToFloat(R125i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R124i.y)));
// 11
PV1ix = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
R124i.y = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
R123i.z = ((intBitsToFloat(R125i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(R124i.x));
R0i.y = int(intBitsToFloat(R126i.z));
// 12
R124i.x = floatBitsToInt(uf_blockVS7[96].z + intBitsToFloat(R125i.z));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(PV1ix)));
R126i.z = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R127i.z)));
R127i.y = int(intBitsToFloat(R127i.y));
// 13
backupReg0i = R124i.y;
backupReg1i = R124i.z;
R125i.x = 0 - R0i.y;
R124i.y = 0 - R127i.y;
R124i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[14].x, intBitsToFloat(backupReg0i)));
R125i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[14].x, intBitsToFloat(R125i.w)));
R3i.y = int(intBitsToFloat(backupReg1i));
// 14
backupReg0i = R124i.x;
backupReg1i = R126i.y;
R124i.x = 0 - R3i.y;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R126i.w)));
R127i.z = floatBitsToInt(uf_blockVS7[96].y + intBitsToFloat(R127i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R4i.y)));
PS0i = floatBitsToInt(cos((intBitsToFloat(backupReg1i))/0.1591549367));
// 15
backupReg0i = R127i.y;
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].z, intBitsToFloat(R126i.z)));
R127i.y = max(R0i.y, R125i.x);
R125i.z = max(backupReg0i, R124i.y);
PV1iw = floatBitsToInt(intBitsToFloat(PS0i) + 1.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) / 2.0);
R125i.x = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
// 16
backupReg0i = R124i.x;
backupReg1i = R126i.y;
R124i.x = floatBitsToInt(-(intBitsToFloat(R124i.z)) + 1.0);
R126i.y = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockVS7[14].x, intBitsToFloat(PV1iw)));
R127i.w = max(R3i.y, backupReg0i);
R124i.y = floatBitsToInt(uf_blockVS7[96].x + intBitsToFloat(backupReg1i));
// 17
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R4i.y)));
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockVS7[97].z, intBitsToFloat(R126i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].y, intBitsToFloat(R126i.z)));
R125i.w = floatBitsToInt(-(intBitsToFloat(PV0iz)) + 1.0);
R127i.x = floatBitsToInt(float(R127i.y));
// 18
backupReg0i = R125i.z;
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R126i.y));
R127i.y = floatBitsToInt(max(intBitsToFloat(R125i.x), -(intBitsToFloat(R125i.x))));
R125i.z = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PV1iz));
R126i.w = floatBitsToInt(max(intBitsToFloat(R124i.x), -(intBitsToFloat(R124i.x))));
R126i.y = floatBitsToInt(float(backupReg0i));
// 19
backupReg0i = R127i.w;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R4i.y)));
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].x, intBitsToFloat(R126i.z)));
R126i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[97].y, intBitsToFloat(R126i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(float(backupReg0i));
// 20
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.w),intBitsToFloat(R127i.y),intBitsToFloat(R126i.w),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R0i.z = tempi.x;
PV0iw = tempi.x;
R126i.w = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PV1iy));
// 21
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockVS7[97].x, intBitsToFloat(R126i.x)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R127i.w)));
PV1iz = floatBitsToInt(uf_blockVS7[13].y);
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) / 2.0);
PV1iw = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(R125i.z));
R0i.x = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(R124i.w));
// 22
R7i.x = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R126i.w));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PV1iw)));
R7i.z = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(PV1iz));
R0i.w = floatBitsToInt(uf_blockVS7[13].x);
R0i.w = floatBitsToInt(intBitsToFloat(R0i.w) / 2.0);
R1i.w = 0x3f800000;
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS8[6].x,uf_blockVS8[6].y,uf_blockVS8[6].z,0.0)));
PV0iy = R126i.x;
PV0iz = R126i.x;
PV0iw = R126i.x;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R7i.x)));
// 1
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS8[4].x,uf_blockVS8[4].y,uf_blockVS8[4].z,0.0)));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R7i.y)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS8[5].x,uf_blockVS8[5].y,uf_blockVS8[5].z,0.0)));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R2i.z = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(0x358637bd));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(PV0ix),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(PV0ix),intBitsToFloat(R2i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), uf_blockVS8[3].w));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), uf_blockVS8[3].z));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R127i.y)));
R126i.w = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(R0i.w));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 5
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PS0i)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PS0i)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PS0i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R7i.z)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), uf_blockVS8[3].y));
// 6
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R126i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(-(uf_blockVS6[16].x), intBitsToFloat(R2i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(-(uf_blockVS6[16].z), intBitsToFloat(R2i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(-(uf_blockVS6[16].y), intBitsToFloat(R0i.z)));
// 7
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.y)),-(uf_blockVS6[16].z)) + intBitsToFloat(PV0iw));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.z)),-(uf_blockVS6[16].x)) + intBitsToFloat(PV0iz));
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.x)),-(uf_blockVS6[16].y)) + intBitsToFloat(PV0iy));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 9
R7i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS8[4].x,uf_blockVS8[4].y,uf_blockVS8[4].z,uf_blockVS8[4].w)));
PV1iy = R7i.x;
PV1iz = R7i.x;
PV1iw = R7i.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 10
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS1i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS1i)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PS1i)));
// 11
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R126i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R126i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R127i.y)));
// 12
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.y)),intBitsToFloat(R126i.x)) + intBitsToFloat(PV1iw));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.x)),intBitsToFloat(R127i.y)) + intBitsToFloat(PV1iy));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.z)),intBitsToFloat(R126i.z)) + intBitsToFloat(PV1iz));
// 13
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R123i.w)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R123i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R123i.z)));
// 14
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R0i.z)) + intBitsToFloat(PV1iw));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R2i.y)) + intBitsToFloat(PV1ix));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R2i.x)) + intBitsToFloat(PV1iy));
// 15
backupReg0i = R127i.x;
backupReg1i = R126i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.x));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(backupReg1i)) + intBitsToFloat(R123i.z));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS8[5].x,uf_blockVS8[5].y,uf_blockVS8[5].z,uf_blockVS8[5].w)));
PV0ix = tempi.x;
R3i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R4i.x = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(R123i.w));
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS8[6].x,uf_blockVS8[6].y,uf_blockVS8[6].z,uf_blockVS8[6].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R1i.z = tempi.x;
PV1iw = tempi.x;
R4i.y = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R126i.z));
// 18
R1i.x = floatBitsToInt(-(intBitsToFloat(R7i.x)) + intBitsToFloat(R4i.x));
R1i.y = floatBitsToInt(-(intBitsToFloat(R3i.y)) + intBitsToFloat(R4i.y));
R4i.z = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R127i.x));
// 19
R5i.z = floatBitsToInt(-(intBitsToFloat(R1i.z)) + intBitsToFloat(R4i.z));
// 20
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R5i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 21
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R2i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 22
R127i.w = ((intBitsToFloat(PS1i) > 0.0)?-1:0);
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 23
PV1ix = ((intBitsToFloat(PS0i) > 0.0)?-1:0);
// 24
R0i.w = ((R127i.w == 0)?(0):(PV1ix));
// 25
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
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R5i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), uf_blockVS7[95].x));
// 1
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), uf_blockVS7[95].x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), uf_blockVS7[95].x));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PS1i)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),0.0)));
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
PV0ix = floatBitsToInt(intBitsToFloat(R7i.x) + -(uf_blockVS6[17].x));
PV0iy = floatBitsToInt(intBitsToFloat(R3i.y) + -(uf_blockVS6[17].y));
PV0iz = floatBitsToInt(intBitsToFloat(R1i.z) + -(uf_blockVS6[17].z));
R127i.w = floatBitsToInt(-(intBitsToFloat(R7i.x)) + intBitsToFloat(R4i.x));
R127i.x = floatBitsToInt(-(intBitsToFloat(R3i.y)) + intBitsToFloat(R4i.y));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.y = floatBitsToInt(1.0 / uf_blockVS7[116].x);
// 2
R126i.x = 0x3f800000;
R126i.y = ((intBitsToFloat(R6i.y) > 0.5)?-1:0);
R127i.z = ((intBitsToFloat(R6i.x) > 0.5)?-1:0);
R126i.w = floatBitsToInt(-(intBitsToFloat(R1i.z)) + intBitsToFloat(R4i.z));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 3
PV1ix = ((intBitsToFloat(R6i.z) > 0.5)?-1:0);
R125i.y = ((intBitsToFloat(R6i.y) > 0.5)?-1:0);
PV1iz = floatBitsToInt(min(intBitsToFloat(PS0i), uf_blockVS7[116].x));
PV1iw = ((intBitsToFloat(R6i.w) > 0.5)?-1:0);
R124i.y = ((intBitsToFloat(R6i.z) > 0.5)?-1:0);
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(R127i.y));
R5i.y = ((R127i.z == 0)?(R8i.x):(R5i.w));
R4i.z = ((R126i.y == 0)?(R8i.y):(R3i.z));
R12i.w = ((PV1ix == 0)?(R8i.x):(R5i.w));
R7i.z = ((PV1iw == 0)?(R8i.y):(R3i.z));
// 5
R4i.x = ((R125i.y == 0)?(R8i.x):(R5i.w));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0ix)));
R5i.x = ((R124i.y == 0)?(R8i.y):(R3i.z));
// 6
R127i.x = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(PV1iw));
R125i.y = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(PV1iz));
R127i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV1iy));
// 7
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),intBitsToFloat(R126i.x)),vec4(uf_blockVS6[2].x,uf_blockVS6[2].y,uf_blockVS6[2].z,uf_blockVS6[2].w)));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
// 8
R1i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),intBitsToFloat(R126i.x)),vec4(uf_blockVS6[0].x,uf_blockVS6[0].y,uf_blockVS6[0].z,uf_blockVS6[0].w)));
PV0iy = R1i.x;
PV0iz = R1i.x;
PV0iw = R1i.x;
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),intBitsToFloat(R126i.x)),vec4(uf_blockVS6[1].x,uf_blockVS6[1].y,uf_blockVS6[1].z,uf_blockVS6[1].w)));
PV1ix = tempi.x;
R0i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),intBitsToFloat(R126i.x)),vec4(uf_blockVS6[3].x,uf_blockVS6[3].y,uf_blockVS6[3].z,uf_blockVS6[3].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R0i.w = tempi.x;
// 11
R15i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),intBitsToFloat(R126i.x)),vec4(uf_blockVS6[8].x,uf_blockVS6[8].y,uf_blockVS6[8].z,uf_blockVS6[8].w)));
PV1iy = R15i.x;
PV1iz = R15i.x;
PV1iw = R15i.x;
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),intBitsToFloat(R126i.x)),vec4(uf_blockVS6[9].x,uf_blockVS6[9].y,uf_blockVS6[9].z,uf_blockVS6[9].w)));
PV0ix = tempi.x;
R15i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),intBitsToFloat(R126i.x)),vec4(uf_blockVS6[11].x,uf_blockVS6[11].y,uf_blockVS6[11].z,uf_blockVS6[11].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R15i.w = tempi.x;
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.z = floatBitsToInt(uf_blockVS7[13].z + intBitsToFloat(R0i.x));
PS0i = floatBitsToInt(float(floatBitsToInt(uf_blockVS7[6].x)));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R0i.y),intBitsToFloat(R127i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS6[7].x,uf_blockVS6[7].y,uf_blockVS6[7].z,uf_blockVS6[7].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(PS0i)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R0i.y),intBitsToFloat(R127i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS6[6].x,uf_blockVS6[6].y,uf_blockVS6[6].z,uf_blockVS6[6].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt((uf_blockVS7[8].y > 0.0)?1.0:0.0);
R0i.z = floatBitsToInt(uf_blockVS7[5].y) & int(1);
PV1iw = floatBitsToInt((0.0 > uf_blockVS7[8].y)?1.0:0.0);
PS1i = int(intBitsToFloat(R126i.z));
// 4
R1i.x = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iw)));
R1i.y = floatBitsToInt((uf_blockVS7[8].w > 0.0)?1.0:0.0);
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.w), intBitsToFloat(PV1ix)));
R0i.w = PS1i + 0x3c;
R0i.y = floatBitsToInt(1.0 / uf_blockVS7[8].y);
}
if( activeMaskStackC[3] == true ) {
R14i.xyz = floatBitsToInt(uf_blockVS7[R0i.w].xyz);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R13i.w) * intBitsToFloat(R0i.y));
R125i.y = floatBitsToInt(-(intBitsToFloat(R1i.x)) + 1.0);
R126i.z = (int(1) != R0i.z)?-1:0;
PV0iw = floatBitsToInt((0.0 > uf_blockVS7[8].w)?1.0:0.0);
PS0i = floatBitsToInt(1.0 / uf_blockVS7[8].w);
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R13i.w) * intBitsToFloat(PS0i));
R124i.y = ((R126i.z == 0)?(0):(int(1)));
R127i.z = floatBitsToInt(intBitsToFloat(R1i.y) + -(intBitsToFloat(PV0iw)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),uf_blockVS7[9].z) + intBitsToFloat(PV0ix));
R127i.x = int(uf_blockVS7[48].z);
// 2
R124i.x = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R127i.y = ((R126i.z == 0)?(0):(0x2));
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),uf_blockVS7[10].x) + intBitsToFloat(PV1ix));
R126i.x = int(uf_blockVS7[53].z);
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PV0iz)));
R126i.y = (R127i.y == 0x2)?-1:0;
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R127i.w = (R124i.y == 0x2)?-1:0;
R125i.x = int(uf_blockVS7[58].z);
// 4
backupReg0i = R125i.y;
backupReg1i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV1iz)));
R125i.y = floatBitsToInt(-(uf_blockVS7[68].w) + uf_blockVS7[69].w);
R1i.z = (R124i.y == int(1))?-1:0;
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV1ix));
R3i.w = floatBitsToInt(float(backupReg1i));
// 5
R1i.x = floatBitsToInt(intBitsToFloat(R0i.w) + -(uf_blockVS7[68].w));
PV1iy = floatBitsToInt((0.0 >= abs(intBitsToFloat(R3i.w)))?1.0:0.0);
PV1iz = floatBitsToInt(-(abs(intBitsToFloat(R3i.w))) + 0.0);
R10i.w = floatBitsToInt(intBitsToFloat(R0i.w) + -(uf_blockVS7[69].w));
R4i.w = floatBitsToInt(float(R126i.x));
// 6
backupReg0i = R125i.x;
R125i.x = ((intBitsToFloat(PV1iy) == 0.0)?(0):(PV1iz));
PV0iy = floatBitsToInt((0.0 >= abs(intBitsToFloat(R4i.w)))?1.0:0.0);
PV0iz = floatBitsToInt(-(abs(intBitsToFloat(R4i.w))) + 0.0);
R126i.w = floatBitsToInt(-(uf_blockVS7[68].x) + uf_blockVS7[69].x);
R5i.w = floatBitsToInt(float(backupReg0i));
// 7
backupReg0i = R124i.x;
R124i.x = ((intBitsToFloat(PV0iy) == 0.0)?(0):(PV0iz));
PV1iy = floatBitsToInt((0.0 >= abs(intBitsToFloat(R5i.w)))?1.0:0.0);
PV1iz = floatBitsToInt(-(abs(intBitsToFloat(R5i.w))) + 0.0);
R11i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(backupReg0i)) + intBitsToFloat(R127i.x));
R125i.w = floatBitsToInt(1.0 / intBitsToFloat(R125i.y));
// 8
R126i.x = ((intBitsToFloat(PV1iy) == 0.0)?(0):(PV1iz));
R3i.y = floatBitsToInt(intBitsToFloat(R0i.w) + -(uf_blockVS7[70].w));
R126i.z = floatBitsToInt(-(uf_blockVS7[69].w) + uf_blockVS7[70].w);
R7i.w = ((intBitsToFloat(R1i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R8i.w = ((intBitsToFloat(R10i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 9
R127i.x = floatBitsToInt(abs(intBitsToFloat(R4i.w)) + intBitsToFloat(R124i.x));
R125i.y = ((R127i.w == 0)?(R6i.y):(R6i.x));
R127i.z = ((R127i.w == 0)?(R6i.x):(R6i.z));
R127i.w = floatBitsToInt(abs(intBitsToFloat(R3i.w)) + intBitsToFloat(R125i.x));
R1i.w = floatBitsToInt(1.0 / intBitsToFloat(R3i.w));
// 10
R2i.x = (R127i.y == int(1))?-1:0;
R127i.y = ((R126i.y == 0)?(R6i.y):(R6i.x));
R125i.z = ((R126i.y == 0)?(R6i.x):(R6i.z));
R124i.w = floatBitsToInt(abs(intBitsToFloat(R5i.w)) + intBitsToFloat(R126i.x));
R2i.w = floatBitsToInt(1.0 / intBitsToFloat(R4i.w));
// 11
R127i.x = ((-(intBitsToFloat(R124i.x)) > 0.0)?(R127i.x):(R124i.x));
R4i.y = ((intBitsToFloat(R3i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R124i.z = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(R125i.w));
R125i.w = floatBitsToInt(-(uf_blockVS7[69].x) + uf_blockVS7[70].x);
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(R5i.w));
// 12
backupReg0i = R127i.z;
backupReg1i = R126i.x;
R126i.x = floatBitsToInt(-(uf_blockVS7[70].w) + uf_blockVS7[71].w);
R126i.y = floatBitsToInt(intBitsToFloat(R0i.w) + -(uf_blockVS7[71].w));
R127i.z = ((-(intBitsToFloat(R125i.x)) > 0.0)?(R127i.w):(R125i.x));
R0i.w = ((R1i.z == 0)?(backupReg0i):(R6i.y));
R0i.z = ((-(intBitsToFloat(backupReg1i)) > 0.0)?(R124i.w):(backupReg1i));
// 13
backupReg0i = R126i.z;
R125i.x = ((R1i.z == 0)?(R125i.y):(R6i.z));
R124i.y = floatBitsToInt(-(intBitsToFloat(R7i.w)) + 1.0);
R126i.z = floatBitsToInt(intBitsToFloat(R1i.w) * 0.0);
R127i.w = floatBitsToInt(-(intBitsToFloat(R8i.w)) + 1.0);
R125i.y = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 14
backupReg0i = R127i.y;
R124i.x = ((R2i.x == 0)?(R125i.z):(R6i.y));
R127i.y = floatBitsToInt(intBitsToFloat(R126i.w) * 0.0);
R125i.z = floatBitsToInt(intBitsToFloat(R2i.w) * 0.0);
R2i.w = ((R2i.x == 0)?(backupReg0i):(R6i.z));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R124i.z)) + uf_blockVS7[68].x);
// 15
R1i.x = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(R125i.y));
R0i.y = ((intBitsToFloat(R3i.w) == 0.0)?(0):(R127i.z));
R2i.z = ((intBitsToFloat(R4i.w) == 0.0)?(0):(R127i.x));
R125i.w = floatBitsToInt(-(uf_blockVS7[70].x) + uf_blockVS7[71].x);
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 16
R12i.x = ((intBitsToFloat(R126i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R10i.y = ((intBitsToFloat(R5i.w) == 0.0)?(0):(R0i.z));
R127i.z = floatBitsToInt(-(intBitsToFloat(R4i.y)) + 1.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(R127i.w)));
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[68].x, intBitsToFloat(R124i.y)));
// 17
R126i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x80000;
R2i.y = floatBitsToInt(trunc(intBitsToFloat(R126i.z)));
R5i.z = floatBitsToInt(trunc(intBitsToFloat(R125i.z)));
R124i.w = floatBitsToInt(uf_blockVS7[5].x) & 0x100000;
R11i.y = floatBitsToInt(trunc(intBitsToFloat(R127i.y)));
// 18
R3i.x = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(R126i.w));
R126i.y = floatBitsToInt(uf_blockVS7[5].x) & 0x400000;
R126i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x200000;
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R127i.w)) + intBitsToFloat(R127i.x));
R7i.w = floatBitsToInt(-(intBitsToFloat(R12i.x)) + 1.0);
// 19
R0i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x800000;
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(R127i.z)));
R0i.z = (R126i.x == 0x80000)?-1:0;
R8i.w = floatBitsToInt(uf_blockVS7[5].x) & 0x1000000;
R3i.z = (R124i.w == 0x100000)?-1:0;
// 20
R125i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[50].y, intBitsToFloat(R125i.x)));
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) * 2.0);
R127i.y = floatBitsToInt(uf_blockVS7[49].w + uf_blockVS7[50].y);
PV0iz = floatBitsToInt(uf_blockVS7[49].z + uf_blockVS7[50].x);
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[50].x, intBitsToFloat(R0i.w)));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
R7i.y = (R126i.z == 0x200000)?-1:0;
// 21
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockVS7[55].y, intBitsToFloat(R2i.w)));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
PV1iy = floatBitsToInt(uf_blockVS7[54].w + uf_blockVS7[55].y);
PV1iz = floatBitsToInt(uf_blockVS7[54].z + uf_blockVS7[55].x);
PV1iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[55].x, intBitsToFloat(R124i.x)));
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 2.0);
R12i.y = floatBitsToInt(-(intBitsToFloat(PV0iw)) + intBitsToFloat(PV0iz));
// 22
R10i.x = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(PV1iy));
R13i.y = floatBitsToInt(-(intBitsToFloat(PV1iw)) + intBitsToFloat(PV1iz));
R10i.z = floatBitsToInt(-(intBitsToFloat(R125i.x)) + intBitsToFloat(R127i.y));
R10i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w),intBitsToFloat(R1i.x)) + uf_blockVS7[69].x);
R1i.x = (R126i.y == 0x400000)?-1:0;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(-(uf_blockVS7[84].w) + uf_blockVS7[85].w);
R127i.y = (R0i.x == 0x800000)?-1:0;
R126i.z = floatBitsToInt(intBitsToFloat(R11i.w) + -(uf_blockVS7[84].w));
PV0iw = floatBitsToInt(intBitsToFloat(R11i.w) + -(uf_blockVS7[85].w));
R125i.z = (R8i.w == 0x1000000)?-1:0;
// 1
R124i.x = ((intBitsToFloat(R126i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iy = floatBitsToInt(-(uf_blockVS7[84].x) + uf_blockVS7[85].x);
R11i.z = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
R124i.w = ((R1i.z == 0)?(R6i.x):(R6i.y));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), uf_blockVS7[45].y));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
PV0iy = floatBitsToInt(uf_blockVS7[44].w + uf_blockVS7[45].y);
PV0iz = floatBitsToInt(uf_blockVS7[44].z + uf_blockVS7[45].x);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), uf_blockVS7[45].x));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
R127i.z = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(PS1i));
// 3
backupReg0i = R0i.y;
R126i.x = floatBitsToInt(-(intBitsToFloat(R11i.z)) + 1.0);
R0i.y = floatBitsToInt(-(intBitsToFloat(PV0iw)) + intBitsToFloat(PV0iz));
R8i.z = floatBitsToInt(-(intBitsToFloat(PV0ix)) + intBitsToFloat(PV0iy));
R125i.w = floatBitsToInt(-(intBitsToFloat(R124i.x)) + 1.0);
R0i.x = int(intBitsToFloat(backupReg0i));
// 4
backupReg0i = R2i.y;
R125i.x = ((R1i.z == 0)?(R6i.y):(R6i.z));
R2i.y = floatBitsToInt(uf_blockVS7[46].x + uf_blockVS7[46].z);
R124i.z = ((R2i.x == 0)?(R6i.x):(R6i.y));
R8i.w = floatBitsToInt(uf_blockVS7[46].y + uf_blockVS7[46].w);
R7i.x = int(intBitsToFloat(backupReg0i));
// 5
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R3i.x)) + uf_blockVS7[70].x);
R124i.y = ((R2i.x == 0)?(R6i.y):(R6i.z));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w),intBitsToFloat(R1i.y)) + intBitsToFloat(R5i.w));
R5i.w = floatBitsToInt(1.0 / uf_blockVS7[48].z);
// 6
backupReg0i = R4i.y;
R2i.x = ((R0i.z == 0)?(R8i.x):(R5i.y));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R127i.z)) + uf_blockVS7[84].x);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R7i.w)));
R7i.w = ((R7i.y == 0)?(R8i.x):(R12i.w));
R125i.y = floatBitsToInt(1.0 / uf_blockVS7[48].w);
// 7
backupReg0i = R127i.y;
backupReg1i = R4i.x;
backupReg2i = R2i.z;
R4i.x = ((R3i.z == 0)?(R8i.y):(R4i.z));
R127i.y = floatBitsToInt(uf_blockVS7[51].x + uf_blockVS7[51].z);
R2i.z = ((backupReg0i == 0)?(R8i.x):(backupReg1i));
R127i.w = floatBitsToInt(uf_blockVS7[51].y + uf_blockVS7[51].w);
R3i.x = int(intBitsToFloat(backupReg2i));
// 8
backupReg0i = R5i.z;
R8i.x = ((R1i.x == 0)?(R8i.y):(R7i.z));
R126i.y = floatBitsToInt(uf_blockVS7[56].x + uf_blockVS7[56].z);
R5i.z = ((R125i.z == 0)?(R8i.y):(R5i.x));
R126i.w = floatBitsToInt(uf_blockVS7[56].y + uf_blockVS7[56].w);
R1i.x = int(intBitsToFloat(backupReg0i));
// 9
R5i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[51].z,intBitsToFloat(R124i.w)) + intBitsToFloat(R127i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R126i.x)));
R125i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[51].w,intBitsToFloat(R125i.x)) + intBitsToFloat(R127i.w));
R127i.w = floatBitsToInt(1.0 / uf_blockVS7[53].z);
// 10
R11i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[56].z,intBitsToFloat(R124i.z)) + intBitsToFloat(R126i.y));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R127i.z)) + intBitsToFloat(R1i.z));
R126i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[56].w,intBitsToFloat(R124i.y)) + intBitsToFloat(R126i.w));
R126i.y = floatBitsToInt(1.0 / uf_blockVS7[53].w);
// 11
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].x, intBitsToFloat(R5i.w)));
R125i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].y, intBitsToFloat(R125i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[84].x, intBitsToFloat(R125i.w)));
R13i.x = int(intBitsToFloat(R10i.y));
// 12
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),uf_blockVS7[46].z) + intBitsToFloat(R2i.y));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.w),uf_blockVS7[44].y) + intBitsToFloat(R8i.z));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),uf_blockVS7[46].w) + intBitsToFloat(R8i.w));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R127i.x)) + -(0.5));
R2i.x = int(intBitsToFloat(R11i.y));
// 13
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R13i.w)),uf_blockVS7[44].x) + -(intBitsToFloat(R0i.y)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R127i.y)) + intBitsToFloat(R127i.z));
R125i.w = floatBitsToInt(1.0 / uf_blockVS7[58].z);
// 14
backupReg0i = R4i.x;
R4i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[53].y, intBitsToFloat(R126i.y)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R125i.y)) + -(0.5));
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[53].x, intBitsToFloat(R127i.w)));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[58].w);
// 15
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R13i.w)),uf_blockVS7[49].x) + -(intBitsToFloat(R12i.y)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.w),uf_blockVS7[49].y) + intBitsToFloat(R10i.z));
R10i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[58].x, intBitsToFloat(R125i.w)));
R124i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[58].y, intBitsToFloat(PS0i)));
R126i.y = floatBitsToInt(float(R0i.x));
// 16
backupReg0i = R7i.x;
R7i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R13i.w)),uf_blockVS7[54].x) + -(intBitsToFloat(R13i.y)));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.w),uf_blockVS7[54].y) + intBitsToFloat(R10i.x));
R6i.z = floatBitsToInt(uf_blockVS7[76].y);
R6i.w = floatBitsToInt(uf_blockVS7[76].x);
PS0i = floatBitsToInt(float(backupReg0i));
// 17
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)),intBitsToFloat(PS0i)) + intBitsToFloat(R124i.y));
R12i.y = floatBitsToInt(uf_blockVS7[76].z);
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.w),uf_blockVS7[45].w) + intBitsToFloat(R124i.z));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R126i.y)) + intBitsToFloat(R126i.x));
PS1i = floatBitsToInt(float(R3i.x));
// 18
backupReg0i = R127i.z;
backupReg1i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.w),uf_blockVS7[45].z) + intBitsToFloat(R124i.x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(backupReg0i)) + -(0.5));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.w),uf_blockVS7[50].w) + intBitsToFloat(R125i.z));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(PS1i)) + intBitsToFloat(backupReg1i));
PS0i = floatBitsToInt(float(R1i.x));
// 19
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.x)),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R4i.x)) + -(0.5));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.w),uf_blockVS7[55].w) + intBitsToFloat(R126i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.w),uf_blockVS7[50].z) + intBitsToFloat(R5i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R10i.z)) + -(0.5));
// 20
backupReg0i = R127i.x;
backupReg1i = R127i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R124i.w)) + -(0.5));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R126i.y)) + intBitsToFloat(R125i.w));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R0i.y)) + -(intBitsToFloat(backupReg0i)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.w),uf_blockVS7[55].z) + intBitsToFloat(R11i.x));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i),intBitsToFloat(R123i.y)) + -(intBitsToFloat(R123i.x)));
// 21
R12i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[71].x,intBitsToFloat(R12i.x)) + intBitsToFloat(R8i.y));
R4i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[85].x,intBitsToFloat(R11i.z)) + intBitsToFloat(R4i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R126i.w)) + intBitsToFloat(R127i.w));
PS1i = floatBitsToInt(float(R13i.x));
// 22
backupReg0i = R10i.z;
R10i.x = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
R10i.y = floatBitsToInt(intBitsToFloat(R127i.z) + 0.5);
R10i.z = floatBitsToInt(intBitsToFloat(R126i.y) + 0.5);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(PS1i)) + intBitsToFloat(R7i.x));
R10i.w = floatBitsToInt(intBitsToFloat(R124i.z) + 0.5);
// 23
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.w));
PS1i = floatBitsToInt(float(R2i.x));
// 24
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.w)),intBitsToFloat(PS1i)) + intBitsToFloat(R13i.y));
R13i.x = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
// 25
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R127i.x)) + -(intBitsToFloat(R123i.x)));
// 26
R13i.y = floatBitsToInt(intBitsToFloat(R123i.z) + 0.5);
}
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.x), uf_blockVS8[0].x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.y), uf_blockVS8[0].y));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.z), uf_blockVS8[0].z));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.x), uf_blockVS8[0].w));
// 1
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), uf_blockVS8[1].x));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), uf_blockVS8[1].y));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), uf_blockVS8[1].z));
R11i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), uf_blockVS8[1].w));
// 2
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), uf_blockVS7[59].x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), uf_blockVS7[59].x));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), uf_blockVS7[59].x));
R11i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R1i.x)));
// 3
R12i.x = floatBitsToInt(uf_blockVS8[3].x * 1.0);
R11i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R1i.y)));
R11i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R1i.z)));
}
if( activeMaskStackC[3] == true ) {
// 0
R12i.y = floatBitsToInt(uf_blockVS7[104].x);
// 1
R14i.x = R9i.x;
R14i.y = R9i.y;
R14i.z = R9i.z;
R14i.w = R9i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.z));
// export
passParameterSem9 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.z));
}
