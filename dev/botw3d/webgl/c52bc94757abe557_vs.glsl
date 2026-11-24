#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader c52bc94757abe557
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


UNIFORM_BUFFER_LAYOUT(11, 0, 3) uniform uniformBlockVS11
{
vec4 uf_blockVS11[1];
};


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
out vec4 passParameterSem8;
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
attrDecoder = attrDataSem5;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem0;
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem3;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem4;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem7;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem6;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem2;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R8i.y = floatBitsToInt(-(intBitsToFloat(R4i.w)) + uf_blockVS8[2].x);
R1i.w = 0;
R2i.w = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R8i.y));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R12i.x = 0;
R12i.y = 0;
R12i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R10i.x = 0;
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
R3i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R8i.y) >= intBitsToFloat(R3i.z));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R12i.x = 0;
R12i.y = 0;
R12i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R10i.x = 0;
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
R127i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x2;
R127i.y = floatBitsToInt(uf_blockVS7[5].x) & 0x4;
PV0iz = floatBitsToInt(uf_blockVS7[5].x) & int(1);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), uf_blockVS7[15].x));
R4i.w = int(intBitsToFloat(R5i.w));
// 1
R125i.x = floatBitsToInt(intBitsToFloat(R8i.y) + uf_blockVS7[15].z);
PV1iy = floatBitsToInt(max(intBitsToFloat(R6i.x), 0.0));
PV1iz = floatBitsToInt((0.0 > uf_blockVS7[9].x)?1.0:0.0);
PV1iw = floatBitsToInt((uf_blockVS7[9].x > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(float(PV0iz));
// 2
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R125i.y = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(min(intBitsToFloat(PV1iy), 0.0));
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PS0i = floatBitsToInt(float(R127i.x));
// 3
R3i.x = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PS1i = floatBitsToInt(float(R127i.y));
// 4
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), uf_blockVS7[10].y));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R127i.x = int(intBitsToFloat(PV1iz));
// 5
PV1ix = 0 - R127i.x;
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0ix)));
R126i.x = int(intBitsToFloat(PV0iz));
// 6
PV0ix = 0 - R126i.x;
R126i.y = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
PV0iw = max(R127i.x, PV1ix);
R127i.x = int(intBitsToFloat(PV1iy));
// 7
PV1iz = max(R126i.x, PV0ix);
PV1iw = 0 - R127i.x;
R126i.x = floatBitsToInt(float(PV0iw));
// 8
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(uf_blockVS7[96].x) + uf_blockVS7[97].x);
PV0iy = max(backupReg0i, PV1iw);
R126i.w = floatBitsToInt(-(uf_blockVS7[96].y) + uf_blockVS7[97].y);
R124i.y = floatBitsToInt(float(PV1iz));
// 9
R127i.z = floatBitsToInt(-(uf_blockVS7[96].w) + uf_blockVS7[97].w);
R125i.z = floatBitsToInt(float(PV0iy));
// 10
PS0i = floatBitsToInt(1.0 / uf_blockVS7[14].z);
// 11
PV1iy = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[9].x);
// 12
PV0ix = floatBitsToInt(intBitsToFloat(R8i.y) * intBitsToFloat(PS1i));
R0i.y = floatBitsToInt(-(uf_blockVS7[97].x) + uf_blockVS7[98].x);
PV0iz = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1iy));
R127i.w = floatBitsToInt(-(uf_blockVS7[97].y) + uf_blockVS7[98].y);
R7i.w = floatBitsToInt(1.0 / intBitsToFloat(R3i.z));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb));
PV1iy = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(intBitsToFloat(R8i.y) * intBitsToFloat(R7i.w));
PV1iw = floatBitsToInt(fract(intBitsToFloat(PV0iz)));
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 14
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(R126i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockVS7[14].x, intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + -(0.5));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
PS0i = floatBitsToInt(fract(intBitsToFloat(PV1iy)));
// 15
R123i.x = ((intBitsToFloat(PV0iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV1iz = floatBitsToInt(-(intBitsToFloat(PV0iy)) + 1.0);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PS0i)));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(R127i.y));
// 16
backupReg0i = R123i.x;
backupReg1i = R127i.y;
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.y = floatBitsToInt(max(intBitsToFloat(PV1iz), -(intBitsToFloat(PV1iz))));
R126i.z = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
R126i.w = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(backupReg1i));
// 17
PV1ix = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockVS7[14].x, intBitsToFloat(PV0iw)));
R127i.z = floatBitsToInt(intBitsToFloat(R126i.z) + -(uf_blockVS7[96].w));
// 18
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R126i.z) + -(uf_blockVS7[97].w));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R126i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(backupReg0i)));
PV0iw = floatBitsToInt(-(intBitsToFloat(PV1iy)) + 1.0);
PS0i = floatBitsToInt(cos((intBitsToFloat(PV1ix))/0.1591549367));
// 19
backupReg0i = R127i.z;
R124i.x = floatBitsToInt(uf_blockVS7[96].x + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(intBitsToFloat(PS0i) + 1.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) / 2.0);
R127i.z = floatBitsToInt(max(intBitsToFloat(PV0iw), -(intBitsToFloat(PV0iw))));
R125i.w = floatBitsToInt(uf_blockVS7[96].y + intBitsToFloat(PV0iy));
R126i.w = ((intBitsToFloat(backupReg0i) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 20
R125i.x = ((intBitsToFloat(R127i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iy = floatBitsToInt(intBitsToFloat(R126i.z) + -(uf_blockVS7[98].w));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockVS7[14].x, intBitsToFloat(PV1iy)));
// 21
PV1ix = floatBitsToInt(-(intBitsToFloat(PV0iz)) + 1.0);
R125i.y = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iw = floatBitsToInt(-(uf_blockVS7[97].w) + uf_blockVS7[98].w);
// 22
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R124i.y),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV1ix),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R4i.z = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 23
PV1ix = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(PS0i));
R3i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[98].y, intBitsToFloat(R125i.y)));
R3i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[98].x, intBitsToFloat(R125i.y)));
PS1i = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
// 24
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(-(intBitsToFloat(R125i.x)) + 1.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1iy)));
PS0i = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
// 25
PV1ix = floatBitsToInt(uf_blockVS7[97].y + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(uf_blockVS7[97].x + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV0iy)));
R0i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].x, intBitsToFloat(PS0i)));
R1i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].y, intBitsToFloat(PS0i)));
// 26
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(PV1iz)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV1iz)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.x)));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R127i.x)));
R5i.w = 0x3f800000;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(R6i.y));
PV0iy = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(R1i.w));
PV0iz = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(R0i.w));
PV0iw = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(R6i.z));
PS0i = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(R6i.z));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) * 0.5);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) * 0.5);
PV1iw = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV0iy));
PS1i = floatBitsToInt(intBitsToFloat(PS0i) * 0.5);
// 2
R127i.x = floatBitsToInt(intBitsToFloat(PV1iy) + -(0.5));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
PV0iy = floatBitsToInt(intBitsToFloat(R3i.z) + intBitsToFloat(PV1iw));
PV0iz = floatBitsToInt(intBitsToFloat(R3i.w) + intBitsToFloat(PV1ix));
R125i.w = floatBitsToInt(intBitsToFloat(PV1iz) + -(0.5));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) * 2.0);
R127i.z = floatBitsToInt(intBitsToFloat(PS1i) + -(0.5));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 2.0);
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PV0iz)));
R127i.y = floatBitsToInt(intBitsToFloat(R6i.x) + -(0.5));
R125i.z = floatBitsToInt(intBitsToFloat(R6i.y) + -(0.5));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PV0iy)));
R7i.x = floatBitsToInt(intBitsToFloat(R6i.z) + -(0.5));
// 4
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), uf_blockVS7[115].x));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PV1ix)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), uf_blockVS7[115].y));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), uf_blockVS7[115].z));
// 5
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), uf_blockVS8[3].y));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), uf_blockVS8[3].z));
PV1iw = R6i.y;
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 2.0);
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R5i.w)),vec4(uf_blockVS8[4].x,uf_blockVS8[4].y,uf_blockVS8[4].z,uf_blockVS8[4].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R1i.w = tempi.x;
R125i.y = floatBitsToInt(floor(intBitsToFloat(PV1iw)));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R5i.w)),vec4(uf_blockVS8[5].x,uf_blockVS8[5].y,uf_blockVS8[5].z,uf_blockVS8[5].w)));
PV1ix = tempi.x;
R4i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.x = floatBitsToInt((intBitsToFloat(R125i.y) > 0.0)?1.0:0.0);
// 8
R3i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R5i.w)),vec4(uf_blockVS8[6].x,uf_blockVS8[6].y,uf_blockVS8[6].z,uf_blockVS8[6].w)));
PV0iy = R3i.x;
PV0iz = R3i.x;
PV0iw = R3i.x;
PS0i = floatBitsToInt((0.0 > intBitsToFloat(R125i.y))?1.0:0.0);
// 9
R1i.x = floatBitsToInt(intBitsToFloat(R124i.x) + uf_blockVS7[114].x);
R7i.y = floatBitsToInt(uf_blockVS7[114].y + intBitsToFloat(R125i.w));
R4i.z = floatBitsToInt(uf_blockVS7[114].z + intBitsToFloat(R127i.z));
R3i.w = floatBitsToInt(intBitsToFloat(R127i.x) + -(intBitsToFloat(PS0i)));
PS1i = R6i.z;
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 10
PV0ix = floatBitsToInt(floor(intBitsToFloat(PS1i)));
PV0iy = R6i.x;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), uf_blockVS7[113].x));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), uf_blockVS7[113].y));
// 11
PV1ix = floatBitsToInt(floor(intBitsToFloat(PV0iy)));
PV1iz = floatBitsToInt((intBitsToFloat(PV0ix) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PV0ix))?1.0:0.0);
// 12
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PV1ix))?1.0:0.0);
R1i.y = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt((intBitsToFloat(PV1ix) > 0.0)?1.0:0.0);
// 13
R0i.x = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0ix)));
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x20000;
PV0iy = floatBitsToInt(uf_blockVS7[5].x) & 0x10000;
R125i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x40000;
// 1
PS1i = floatBitsToInt(float(PV0iy));
// 2
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), uf_blockVS7[113].z));
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PS0i = floatBitsToInt(float(R127i.x));
// 3
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(float(R125i.z));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R127i.x = int(intBitsToFloat(PV1iy));
// 5
PV1ix = 0 - R127i.x;
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iz)));
R125i.z = int(intBitsToFloat(PV0ix));
// 6
PV0ix = 0 - R125i.z;
R127i.z = ((uf_blockVS7[114].w == 1.0)?-1:0);
PV0iw = max(R127i.x, PV1ix);
R125i.w = int(intBitsToFloat(PV1iz));
// 7
PV1ix = 0 - R125i.w;
PV1iy = max(R125i.z, PV0ix);
PS1i = floatBitsToInt(float(PV0iw));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 8
PV0ix = max(R125i.w, PV1ix);
R127i.y = floatBitsToInt(-(uf_blockVS7[114].w) + 1.0);
PV0iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(R3i.w)));
PS0i = floatBitsToInt(float(PV1iy));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV0iz)));
PV1iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(R1i.y)));
PS1i = floatBitsToInt(float(PV0ix));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(R0i.x)));
R125i.y = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PV1iw)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV1iw)));
// 11
R127i.x = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PV0ix)));
R124i.z = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(R1i.z));
PV1iw = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(PS0i));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV0ix)));
// 12
R125i.x = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R2i.w));
PV0iy = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(PS1i));
R126i.z = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(PV1iy));
tempResultf = max(0.0, uf_blockVS7[114].w);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 13
PV1ix = floatBitsToInt(uf_blockVS7[13].x);
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) / 2.0);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PS0i)));
R2i.z = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(R124i.x));
PV1iw = floatBitsToInt(uf_blockVS7[13].y);
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) / 2.0);
R124i.x = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 14
R2i.x = floatBitsToInt(intBitsToFloat(R5i.z) * 1.0);
PV0iy = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(PV1iw));
PV0iz = (R4i.w == int(1))?-1:0;
PV0iw = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 15
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PV0iw)));
R127i.y = ((PV0iz == 0)?(0xbf800000):(0xbf800000));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R125i.z = ((PV0iz == 0)?(0x3f800000):(0xbf800000));
// 16
backupReg0i = R124i.x;
R124i.x = (R4i.w == 0x3)?-1:0;
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(backupReg0i));
PV0iw = (R4i.w == 0x2)?-1:0;
// 17
R123i.x = ((PV0iw == 0)?(R125i.z):(0xbf800000));
R123i.y = ((PV0iw == 0)?(R127i.y):(0x3f800000));
R123i.w = ((R127i.z == 0)?(PV0iz):(R8i.y));
// 18
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R123i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R123i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R123i.w)));
R2i.w = ((R124i.x == 0)?(R123i.y):(0x3f800000));
R1i.y = ((R124i.x == 0)?(R123i.x):(0x3f800000));
// 19
PV1ix = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(intBitsToFloat(R124i.z) + intBitsToFloat(PV0iy));
// 20
R123i.x = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
// 21
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
PV1iw = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
// 22
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.z = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 23
R125i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R125i.y = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
R125i.w = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
// 24
R2i.z = floatBitsToInt(sin((intBitsToFloat(R125i.x))/0.1591549367));
// 25
R126i.w = floatBitsToInt(cos((intBitsToFloat(R125i.x))/0.1591549367));
// 26
R2i.y = floatBitsToInt(sin((intBitsToFloat(R125i.w))/0.1591549367));
// 27
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R2i.y)));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R2i.y)));
R125i.x = floatBitsToInt(cos((intBitsToFloat(R125i.w))/0.1591549367));
// 28
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R125i.x)));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R125i.x)));
R3i.z = floatBitsToInt(sin((intBitsToFloat(R125i.y))/0.1591549367));
// 29
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R3i.w)));
R0i.y = floatBitsToInt(-(intBitsToFloat(R3i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R127i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R124i.z)));
R4i.w = floatBitsToInt(cos((intBitsToFloat(R125i.y))/0.1591549367));
// 30
R1i.x = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(PV1ix));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R4i.w)));
R4i.z = floatBitsToInt(-(intBitsToFloat(R124i.z)) + intBitsToFloat(PV1iz));
R0i.w = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(PV1iw));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R4i.w)));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R7i.y)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R4i.w)));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),uf_blockVS11[0].x) + 0.0);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R4i.w)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),uf_blockVS11[0].x) + 0.0);
// 1
R124i.x = floatBitsToInt(uf_blockVS6[13].x);
R125i.y = floatBitsToInt(intBitsToFloat(R3i.w) + intBitsToFloat(PV0ix));
R127i.z = floatBitsToInt(uf_blockVS6[12].y);
R3i.w = floatBitsToInt(uf_blockVS6[12].x);
R127i.w = floatBitsToInt(uf_blockVS6[13].y);
// 2
R126i.x = floatBitsToInt(uf_blockVS6[14].x);
R127i.y = floatBitsToInt(uf_blockVS6[14].y);
R124i.z = floatBitsToInt(uf_blockVS6[12].z);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R2i.x)));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R2i.x)));
// 3
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(R0i.y)) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R124i.z)));
R126i.z = floatBitsToInt(uf_blockVS6[13].z);
R125i.w = floatBitsToInt(uf_blockVS6[14].z);
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R124i.z)));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R126i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R126i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R125i.w)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R127i.z)) + intBitsToFloat(PV1iy));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R125i.w)));
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R127i.y)) + intBitsToFloat(PV0iz));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R127i.w)) + intBitsToFloat(PV0ix));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R3i.w)) + intBitsToFloat(R123i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R127i.z)) + intBitsToFloat(R127i.x));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iy));
// 6
R8i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.z)),intBitsToFloat(R3i.w)) + intBitsToFloat(R123i.w));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R127i.y)) + intBitsToFloat(R126i.w));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R124i.x)) + intBitsToFloat(R123i.y));
R2i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.z)),intBitsToFloat(R124i.x)) + intBitsToFloat(R122i.x));
// 7
R9i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.z)),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.z));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R125i.w)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R124i.z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R126i.z)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R2i.x)));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R127i.z)) + intBitsToFloat(PV1iz));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(R124i.w)) + intBitsToFloat(PS1i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(PV1iw));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R127i.y)) + intBitsToFloat(PV1iy));
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R3i.y)) + intBitsToFloat(R125i.x));
// 9
backupReg0i = R123i.x;
backupReg1i = R123i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(R124i.x)) + intBitsToFloat(R123i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(R3i.w)) + intBitsToFloat(backupReg0i));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R0i.w)) + intBitsToFloat(backupReg1i));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(R0i.z)) + intBitsToFloat(R2i.w));
// 10
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R2i.y)) + intBitsToFloat(R123i.x));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R1i.x)) + intBitsToFloat(R122i.x));
R126i.z = 0x3f800000;
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R8i.x)) + intBitsToFloat(R123i.y));
R124i.w = 0x3f800000;
// 11
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R9i.x)) + intBitsToFloat(R127i.z));
// 12
tempi.x = floatBitsToInt(dot(vec4(uf_blockVS6[12].x,uf_blockVS6[12].y,uf_blockVS6[12].z,uf_blockVS6[12].w),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R124i.y),intBitsToFloat(R127i.w),intBitsToFloat(R126i.z))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 13
R126i.x = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(PV0ix));
// 14
tempi.x = floatBitsToInt(dot(vec4(uf_blockVS6[13].x,uf_blockVS6[13].y,uf_blockVS6[13].z,uf_blockVS6[13].w),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R124i.y),intBitsToFloat(R127i.w),intBitsToFloat(R126i.z))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 15
R127i.y = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV0ix));
// 16
tempi.x = floatBitsToInt(dot(vec4(uf_blockVS6[14].x,uf_blockVS6[14].y,uf_blockVS6[14].z,uf_blockVS6[14].w),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R124i.y),intBitsToFloat(R127i.w),intBitsToFloat(R126i.z))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 17
R126i.z = floatBitsToInt(intBitsToFloat(R3i.x) + intBitsToFloat(PV0ix));
// 18
R12i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R124i.w)),vec4(uf_blockVS6[8].x,uf_blockVS6[8].y,uf_blockVS6[8].z,uf_blockVS6[8].w)));
PV0iy = R12i.x;
PV0iz = R12i.x;
PV0iw = R12i.x;
PS0i = ((intBitsToFloat(R6i.x) > 0.5)?-1:0);
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R124i.w)),vec4(uf_blockVS6[9].x,uf_blockVS6[9].y,uf_blockVS6[9].z,uf_blockVS6[9].w)));
PV1ix = tempi.x;
R12i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R4i.y = floatBitsToInt(((PS0i == 0)?(intBitsToFloat(R5i.x)):(-(intBitsToFloat(R5i.x)))));
// 20
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R124i.w)),vec4(uf_blockVS6[11].x,uf_blockVS6[11].y,uf_blockVS6[11].z,uf_blockVS6[11].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R12i.w = tempi.x;
R124i.y = ((intBitsToFloat(R6i.y) > 0.5)?-1:0);
// 21
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R124i.w)),vec4(uf_blockVS6[0].x,uf_blockVS6[0].y,uf_blockVS6[0].z,uf_blockVS6[0].w)));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
R7i.x = PV0ix;
R7i.x = floatBitsToInt(intBitsToFloat(R7i.x) / 2.0);
// 22
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R124i.w)),vec4(uf_blockVS6[1].x,uf_blockVS6[1].y,uf_blockVS6[1].z,uf_blockVS6[1].w)));
PV0ix = tempi.x;
R3i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R3i.x = floatBitsToInt(((R124i.y == 0)?(intBitsToFloat(R5i.y)):(-(intBitsToFloat(R5i.y)))));
// 23
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R124i.w)),vec4(uf_blockVS6[2].x,uf_blockVS6[2].y,uf_blockVS6[2].z,uf_blockVS6[2].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
// 24
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R124i.w)),vec4(uf_blockVS6[3].x,uf_blockVS6[3].y,uf_blockVS6[3].z,uf_blockVS6[3].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R1i.w = tempi.x;
}
if( activeMaskStackC[3] == true ) {
// 0
R1i.x = floatBitsToInt(uf_blockVS7[60].y);
R1i.z = floatBitsToInt(uf_blockVS7[60].x);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), uf_blockVS7[13].z));
// 1
R2i.x = floatBitsToInt(uf_blockVS7[68].x);
R0i.y = floatBitsToInt(uf_blockVS7[60].z);
R0i.z = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R0i.z));
PV1iw = ((intBitsToFloat(R6i.z) > 0.5)?-1:0);
PS1i = ((intBitsToFloat(R6i.w) > 0.5)?-1:0);
// 2
R126i.x = floatBitsToInt(((PV1iw == 0)?(intBitsToFloat(R5i.x)):(-(intBitsToFloat(R5i.x)))));
R1i.y = floatBitsToInt(uf_blockVS7[76].z);
R4i.z = floatBitsToInt(uf_blockVS7[76].y);
R0i.w = floatBitsToInt(uf_blockVS7[76].x);
R124i.w = floatBitsToInt(((PS1i == 0)?(intBitsToFloat(R5i.y)):(-(intBitsToFloat(R5i.y)))));
// 3
PV1ix = floatBitsToInt(uf_blockVS7[5].x) & 0x80000;
PV1iy = floatBitsToInt(uf_blockVS7[5].x) & 0x400000;
PV1iz = floatBitsToInt(uf_blockVS7[5].x) & 0x100000;
PV1iw = floatBitsToInt(uf_blockVS7[5].x) & 0x200000;
R4i.x = floatBitsToInt(uf_blockVS7[5].y) & int(1);
// 4
PV0ix = (PV1iy == 0x400000)?-1:0;
PV0iy = (PV1iw == 0x200000)?-1:0;
PV0iz = (PV1ix == 0x80000)?-1:0;
PV0iw = (PV1iz == 0x100000)?-1:0;
// 5
backupReg0i = R5i.y;
backupReg1i = R5i.x;
R5i.x = ((PV0iz == 0)?(backupReg1i):(R4i.y));
R5i.y = ((PV0ix == 0)?(backupReg0i):(R124i.w));
R2i.z = ((PV0iw == 0)?(backupReg0i):(R3i.x));
R8i.w = ((PV0iy == 0)?(backupReg1i):(R126i.x));
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R3i.y),intBitsToFloat(R0i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS6[6].x,uf_blockVS6[6].y,uf_blockVS6[6].z,uf_blockVS6[6].w)));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R3i.y),intBitsToFloat(R0i.z),intBitsToFloat(R1i.w)),vec4(uf_blockVS6[7].x,uf_blockVS6[7].y,uf_blockVS6[7].z,uf_blockVS6[7].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R5i.z = (int(1) != R4i.x)?-1:0;
// 2
backupReg0i = R0i.y;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), uf_blockVS8[0].x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), uf_blockVS8[0].y));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), uf_blockVS8[0].z));
R15i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), uf_blockVS8[0].w));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 3
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), uf_blockVS8[1].x));
PV1iy = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS0i));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), uf_blockVS8[1].z));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), uf_blockVS8[1].y));
// 4
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.w), intBitsToFloat(PV1iy)));
// 5
R14i.x = floatBitsToInt(intBitsToFloat(R12i.x) * 0.5 + intBitsToFloat(R7i.x));
R14i.y = floatBitsToInt(intBitsToFloat(R12i.y) * -(0.5) + intBitsToFloat(R7i.x));
R14i.z = floatBitsToInt(intBitsToFloat(R12i.z) * 0.5 + intBitsToFloat(R7i.x));
R14i.w = floatBitsToInt(intBitsToFloat(R12i.w) * 1.0);
}
if( activeMaskStackC[3] == true ) {
// 0
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), uf_blockVS7[59].x));
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), uf_blockVS7[59].x));
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), uf_blockVS7[59].x));
R0i.w = floatBitsToInt(uf_blockVS7[84].x);
}
if( activeMaskStackC[3] == true ) {
// 0
R16i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R1i.x)));
R16i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R1i.y)));
R16i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R1i.z)));
R16i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), uf_blockVS8[1].w));
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x10;
R127i.y = floatBitsToInt(uf_blockVS7[5].x) & 0x20;
R126i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x40;
R124i.w = floatBitsToInt(uf_blockVS7[5].x) & 0x80;
R127i.w = int(uf_blockVS7[17].x);
// 1
R124i.x = int(-1) + R127i.w;
R124i.y = int(uf_blockVS7[17].y);
// 2
PS0i = floatBitsToInt(float(R126i.x));
// 3
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(float(R127i.y));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(R126i.z));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R125i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x2000000;
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R126i.z = int(intBitsToFloat(PV0ix));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iy)));
PV0iw = 0 - R126i.z;
R127i.z = int(intBitsToFloat(PV1ix));
// 7
R127i.y = max(R126i.z, PV0iw);
PV1iw = 0 - R127i.z;
R126i.z = int(intBitsToFloat(PV0ix));
// 8
R3i.y = max(R127i.z, PV1iw);
PV0iw = 0 - R126i.z;
PS0i = floatBitsToInt(float(R124i.w));
// 9
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R0i.y = max(R126i.z, PV0iw);
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R125i.x = floatBitsToInt(float(R127i.w));
// 10
backupReg0i = R124i.y;
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1ix)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R125i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(R125i.x)));
R126i.x = floatBitsToInt(float(backupReg0i));
// 11
PV1iw = floatBitsToInt(intBitsToFloat(R7i.w) * intBitsToFloat(PV0iz));
R126i.z = int(intBitsToFloat(PV0ix));
// 12
PV0iw = 0 - R126i.z;
PS0i = int(intBitsToFloat(PV1iw));
// 13
R125i.y = max(R126i.z, PV0iw);
R127i.x = R127i.y * PS0i;
// 14
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 15
PV1iw = floatBitsToInt(intBitsToFloat(R8i.y) * intBitsToFloat(PS0i));
R4i.z = floatBitsToInt(float(R127i.w));
// 16
R126i.w = floatBitsToInt(abs(intBitsToFloat(R4i.z)));
R126i.y = int(intBitsToFloat(PV1iw));
// 17
PS1i = floatBitsToInt(float(R126i.y));
// 18
PV0iz = floatBitsToInt(-(intBitsToFloat(R125i.x)) + intBitsToFloat(PS1i));
R124i.w = floatBitsToInt(float(R126i.y));
// 19
R127i.y = floatBitsToInt(abs(intBitsToFloat(R124i.w)));
R123i.w = ((intBitsToFloat(PV0iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
R4i.y = floatBitsToInt(1.0 / abs(intBitsToFloat(R4i.z)));
// 20
PV0ix = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R124i.w)), intBitsToFloat(R4i.y)));
PS0i = int(intBitsToFloat(R123i.w));
// 21
R125i.x = int(1) - PS0i;
PV1iz = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
R1i.y = PS0i * R124i.x;
// 22
R124i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iz)),intBitsToFloat(R126i.w)) + intBitsToFloat(R127i.y));
PS0i = floatBitsToInt(float(R125i.z));
// 23
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iz = floatBitsToInt(-(abs(intBitsToFloat(R4i.z))) + intBitsToFloat(R124i.x));
PV1iw = floatBitsToInt((intBitsToFloat(R124i.x) >= abs(intBitsToFloat(R4i.z)))?1.0:0.0);
R125i.w = int(intBitsToFloat(R124i.y));
// 24
backupReg0i = R125i.y;
R125i.y = ((intBitsToFloat(PV1iw) == 0.0)?(R124i.x):(PV1iz));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1ix)));
R125i.z = backupReg0i * R125i.w;
// 25
PV1ix = floatBitsToInt(abs(intBitsToFloat(R4i.z)) + intBitsToFloat(R125i.y));
R127i.w = int(intBitsToFloat(PV0iz));
// 26
PV0iy = 0 - R127i.w;
R123i.z = ((-(intBitsToFloat(R125i.y)) > 0.0)?(PV1ix):(R125i.y));
// 27
PV1ix = max(R127i.w, PV0iy);
R123i.w = ((-(intBitsToFloat(R124i.w)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.z)))):(R123i.z));
// 28
R123i.y = ((intBitsToFloat(R4i.z) == 0.0)?(R124i.w):(R123i.w));
PS0i = PV1ix * R125i.w;
// 29
R124i.x = R126i.y + PS0i;
PS1i = int(intBitsToFloat(R123i.y));
// 30
PS0i = R125i.x * PS1i;
// 31
PV1ix = PS0i + R1i.y;
R125i.w = R0i.y * R124i.x;
// 32
PS0i = R3i.y * PV1ix;
// 33
PV1iz = PS0i + R127i.x;
// 34
PV0iw = R125i.w + PV1iz;
// 35
PV1iy = R125i.z + PV0iw;
// 36
R1i.x = floatBitsToInt(float(PV1iy));
// 37
R126i.y = floatBitsToInt(abs(intBitsToFloat(R1i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), abs(intBitsToFloat(R1i.x))));
// 38
PV0iw = floatBitsToInt(trunc(intBitsToFloat(PV1iz)));
// 39
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iw)),intBitsToFloat(R126i.w)) + intBitsToFloat(R126i.y));
// 40
PV0iz = floatBitsToInt(-(abs(intBitsToFloat(R4i.z))) + intBitsToFloat(R127i.x));
PV0iw = floatBitsToInt((intBitsToFloat(R127i.x) >= abs(intBitsToFloat(R4i.z)))?1.0:0.0);
// 41
R4i.y = ((intBitsToFloat(PV0iw) == 0.0)?(R127i.x):(PV0iz));
// 42
R7i.x = floatBitsToInt(abs(intBitsToFloat(R4i.z)) + intBitsToFloat(R4i.y));
}
if( activeMaskStackC[3] == true ) {
// 0
R123i.z = ((-(intBitsToFloat(R4i.y)) > 0.0)?(R7i.x):(R4i.y));
// 1
R123i.w = ((-(intBitsToFloat(R1i.x)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.z)))):(R123i.z));
// 2
R123i.y = ((intBitsToFloat(R4i.z) == 0.0)?(R1i.x):(R123i.w));
// 3
R127i.x = int(intBitsToFloat(R123i.y));
// 4
R125i.z = floatBitsToInt(float(R127i.x));
// 5
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(R125i.z))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(R125i.z) > 0.0)?1.0:0.0);
R125i.w = floatBitsToInt(float(R127i.x));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt(abs(intBitsToFloat(R125i.w)) * 0.25);
R126i.z = floatBitsToInt(abs(intBitsToFloat(R125i.w)));
// 7
PV1ix = floatBitsToInt(trunc(intBitsToFloat(PV0iy)));
R123i.z = floatBitsToInt(intBitsToFloat(PV0ix) * 0.5 + intBitsToFloat(R125i.z));
// 8
PV0ix = floatBitsToInt(intBitsToFloat(R123i.z) * 0.25);
R0i.y = ((R5i.z == 0)?(R6i.x):(R6i.y));
R126i.w = floatBitsToInt(-(intBitsToFloat(PV1ix)) * 4.0 + intBitsToFloat(R126i.z));
// 9
PV1ix = floatBitsToInt((intBitsToFloat(R126i.w) >= 4.0)?1.0:0.0);
PV1iy = floatBitsToInt(intBitsToFloat(R126i.w) + -4.0);
PV1iz = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
R1i.z = int(uf_blockVS7[26].x);
// 10
R126i.y = floatBitsToInt(uf_blockVS7[5].x) & 0x100;
R126i.z = ((intBitsToFloat(PV1ix) == 0.0)?(R126i.w):(PV1iy));
PS0i = int(intBitsToFloat(PV1iz));
// 11
R4i.z = PS0i + 0x12;
PV1iw = floatBitsToInt(intBitsToFloat(R126i.z) + 4.0);
R1i.w = int(uf_blockVS7[26].y);
// 12
R123i.y = ((-(intBitsToFloat(R126i.z)) > 0.0)?(PV1iw):(R126i.z));
PS0i = floatBitsToInt(float(R126i.y));
// 13
R123i.x = ((-(intBitsToFloat(R125i.w)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.y)))):(R123i.y));
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
// 14
R125i.y = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iw)));
PS0i = int(intBitsToFloat(R123i.x));
// 15
R127i.x = 0xfffffffd + PS0i;
R126i.y = 0xfffffffe + PS0i;
R126i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x200;
PV1iw = int(-1) + PS0i;
PS1i = floatBitsToInt(float(PS0i));
// 16
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(PV1iw));
// 17
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(float(R126i.y));
// 18
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iy)));
R125i.w = int(intBitsToFloat(PV1iz));
// 19
PV1ix = 0 - R125i.w;
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0ix)));
R126i.y = int(intBitsToFloat(PV0iw));
// 20
PV0ix = max(R125i.w, PV1ix);
PV0iy = 0 - R126i.y;
R124i.x = int(intBitsToFloat(PV1iy));
// 21
R0i.x = int(1) - PV0ix;
PV1iy = 0 - R124i.x;
PV1iz = max(R126i.y, PV0iy);
PS1i = floatBitsToInt(float(R127i.x));
// 22
R2i.x = int(1) - PV1iz;
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = max(R124i.x, PV1iy);
R124i.x = int(intBitsToFloat(R125i.y));
// 23
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iz)));
R4i.y = int(1) - PV0iw;
PV1iz = 0 - R124i.x;
PS1i = floatBitsToInt(float(R126i.z));
// 24
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R0i.w = max(R124i.x, PV1iz);
R126i.z = int(intBitsToFloat(PV1ix));
// 25
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0ix)));
PV1iw = 0 - R126i.z;
// 26
PV0iy = max(R126i.z, PV1iw);
R7i.x = int(intBitsToFloat(PV1iy));
// 27
R1i.x = int(1) - PV0iy;
}
if( activeMaskStackC[3] == true ) {
R3i.xyzw = floatBitsToInt(uf_blockVS7[R4i.z].xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
R124i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x800;
R126i.y = floatBitsToInt(uf_blockVS7[5].x) & 0x400;
PV0iz = 0 - R7i.x;
R126i.w = int(-1) + R1i.z;
R126i.z = R1i.x * R3i.w;
// 1
R5i.w = max(R7i.x, PV0iz);
R125i.w = R4i.y * R3i.z;
// 2
R125i.y = R2i.x * R3i.y;
// 3
PS1i = R0i.x * R3i.x;
// 4
PV0iz = R125i.y + PS1i;
PS0i = floatBitsToInt(float(R126i.y));
// 5
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iw = R125i.w + PV0iz;
PS1i = floatBitsToInt(float(R124i.x));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1ix)));
R3i.y = R126i.z + PV1iw;
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R126i.y = floatBitsToInt(float(R1i.z));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(R126i.y)));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iw)));
R126i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x4000000;
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R126i.y)));
R124i.x = int(intBitsToFloat(PV0ix));
// 8
PV0ix = 0 - R124i.x;
PV0iz = floatBitsToInt(intBitsToFloat(R7i.w) * intBitsToFloat(PV1ix));
R127i.x = int(intBitsToFloat(PV1iy));
// 9
PV1iz = 0 - R127i.x;
R7i.w = max(R124i.x, PV0ix);
PS1i = int(intBitsToFloat(PV0iz));
// 10
R127i.w = max(R127i.x, PV1iz);
R124i.y = R0i.w * PS1i;
// 11
PS1i = floatBitsToInt(float(R1i.w));
// 12
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 13
PV1iz = floatBitsToInt(intBitsToFloat(R8i.y) * intBitsToFloat(PS0i));
R124i.x = floatBitsToInt(float(R1i.z));
// 14
R124i.z = floatBitsToInt(abs(intBitsToFloat(R124i.x)));
R1i.w = int(intBitsToFloat(PV1iz));
// 15
PS1i = floatBitsToInt(float(R1i.w));
// 16
PV0ix = floatBitsToInt(-(intBitsToFloat(R126i.y)) + intBitsToFloat(PS1i));
R125i.z = floatBitsToInt(float(R1i.w));
// 17
R123i.z = ((intBitsToFloat(PV0ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.w = floatBitsToInt(abs(intBitsToFloat(R125i.z)));
R0i.w = floatBitsToInt(1.0 / abs(intBitsToFloat(R124i.x)));
// 18
PV0iy = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R125i.z)), intBitsToFloat(R0i.w)));
PS0i = int(intBitsToFloat(R123i.z));
// 19
PV1ix = floatBitsToInt(trunc(intBitsToFloat(PV0iy)));
R125i.y = int(1) - PS0i;
R126i.w = PS0i * R126i.w;
// 20
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(R124i.z)) + intBitsToFloat(R125i.w));
PS0i = floatBitsToInt(float(R126i.z));
// 21
PV1ix = floatBitsToInt(-(abs(intBitsToFloat(R124i.x))) + intBitsToFloat(R126i.y));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(R126i.y) >= abs(intBitsToFloat(R124i.x)))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R127i.z = int(intBitsToFloat(R124i.w));
// 22
backupReg0i = R127i.w;
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iy)));
R127i.w = ((intBitsToFloat(PV1iz) == 0.0)?(R126i.y):(PV1ix));
R127i.x = backupReg0i * R127i.z;
// 23
PV1iy = floatBitsToInt(abs(intBitsToFloat(R124i.x)) + intBitsToFloat(R127i.w));
R126i.z = int(intBitsToFloat(PV0ix));
// 24
R123i.x = ((-(intBitsToFloat(R127i.w)) > 0.0)?(PV1iy):(R127i.w));
PV0iw = 0 - R126i.z;
// 25
PV1iy = max(R126i.z, PV0iw);
R123i.z = ((-(intBitsToFloat(R125i.z)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.x)))):(R123i.x));
// 26
R123i.w = ((intBitsToFloat(R124i.x) == 0.0)?(R125i.z):(R123i.z));
PS0i = PV1iy * R127i.z;
// 27
R126i.y = R1i.w + PS0i;
PS1i = int(intBitsToFloat(R123i.w));
// 28
PS0i = R125i.y * PS1i;
// 29
PV1iy = PS0i + R126i.w;
R127i.z = R7i.w * R126i.y;
// 30
PS0i = R5i.w * PV1iy;
// 31
PV1ix = PS0i + R124i.y;
// 32
PV0iz = R127i.z + PV1ix;
// 33
PV1iw = R127i.x + PV0iz;
// 34
R126i.y = floatBitsToInt(float(PV1iw));
// 35
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), abs(intBitsToFloat(R126i.y))));
R126i.w = floatBitsToInt(abs(intBitsToFloat(R126i.y)));
// 36
PV0iz = floatBitsToInt(trunc(intBitsToFloat(PV1ix)));
// 37
R124i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iz)),intBitsToFloat(R124i.z)) + intBitsToFloat(R126i.w));
// 38
PV0ix = floatBitsToInt(-(abs(intBitsToFloat(R124i.x))) + intBitsToFloat(R124i.y));
PV0iz = floatBitsToInt((intBitsToFloat(R124i.y) >= abs(intBitsToFloat(R124i.x)))?1.0:0.0);
// 39
R126i.w = ((intBitsToFloat(PV0iz) == 0.0)?(R124i.y):(PV0ix));
// 40
PV0iy = floatBitsToInt(abs(intBitsToFloat(R124i.x)) + intBitsToFloat(R126i.w));
// 41
R123i.x = ((-(intBitsToFloat(R126i.w)) > 0.0)?(PV0iy):(R126i.w));
// 42
R123i.z = ((-(intBitsToFloat(R126i.y)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.x)))):(R123i.x));
// 43
R123i.w = ((intBitsToFloat(R124i.x) == 0.0)?(R126i.y):(R123i.z));
// 44
R126i.y = int(intBitsToFloat(R123i.w));
// 45
R124i.x = floatBitsToInt(float(R126i.y));
// 46
PV0iz = floatBitsToInt((intBitsToFloat(R124i.x) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(R124i.x))?1.0:0.0);
R1i.z = floatBitsToInt(float(R126i.y));
// 47
R0i.x = floatBitsToInt(abs(intBitsToFloat(R1i.z)));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(abs(intBitsToFloat(R1i.z)) * 0.25);
// 48
R3i.x = floatBitsToInt(intBitsToFloat(PV1iy) * 0.5 + intBitsToFloat(R124i.x));
R0i.y = floatBitsToInt(trunc(intBitsToFloat(PV1iw)));
// 49
PV1ix = floatBitsToInt(intBitsToFloat(R3i.x) * 0.25);
R124i.z = floatBitsToInt(-(intBitsToFloat(R0i.y)) * 4.0 + intBitsToFloat(R0i.x));
// 50
PV0ix = floatBitsToInt(trunc(intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt((intBitsToFloat(R124i.z) >= 4.0)?1.0:0.0);
PV0iw = floatBitsToInt(intBitsToFloat(R124i.z) + -4.0);
// 51
R124i.x = ((intBitsToFloat(PV0iy) == 0.0)?(R124i.z):(PV0iw));
PS1i = int(intBitsToFloat(PV0ix));
// 52
R0i.x = PS1i + 0x1b;
PV0iz = floatBitsToInt(intBitsToFloat(R124i.x) + 4.0);
PS0i = int(uf_blockVS7[48].z);
// 53
R123i.w = ((-(intBitsToFloat(R124i.x)) > 0.0)?(PV0iz):(R124i.x));
R2i.x = floatBitsToInt(float(PS0i));
// 54
R123i.y = ((-(intBitsToFloat(R1i.z)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.w)))):(R123i.w));
R1i.z = floatBitsToInt(float(R3i.y));
// 55
R3i.x = int(intBitsToFloat(R123i.y));
}
if( activeMaskStackC[3] == true ) {
R0i.xyzw = floatBitsToInt(uf_blockVS7[R0i.x].xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(abs(intBitsToFloat(R2i.x)));
R126i.y = 0xfffffffd + R3i.x;
PV0iz = int(-1) + R3i.x;
R126i.w = 0xfffffffe + R3i.x;
PS0i = floatBitsToInt(float(R3i.x));
// 1
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(float(PV0iz));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PS0i = floatBitsToInt(float(R126i.w));
// 3
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iz)));
R126i.w = floatBitsToInt((intBitsToFloat(R1i.z) > 0.0)?1.0:0.0);
R124i.z = int(intBitsToFloat(PV0ix));
// 4
PV0ix = 0 - R124i.z;
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(R1i.z))?1.0:0.0);
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iy)));
R127i.w = int(intBitsToFloat(PV1iz));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R126i.w) + -(intBitsToFloat(PV0iy)));
PV1iy = max(R124i.z, PV0ix);
PV1iz = 0 - R127i.w;
R124i.y = int(intBitsToFloat(PV0iw));
// 6
PV0ix = max(R127i.w, PV1iz);
R125i.y = floatBitsToInt(intBitsToFloat(PV1ix) * 0.5 + intBitsToFloat(R1i.z));
PV0iz = int(1) - PV1iy;
PV0iw = 0 - R124i.y;
PS0i = floatBitsToInt(float(R126i.y));
// 7
PV1ix = int(1) - PV0ix;
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iz = max(R124i.y, PV0iw);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R124i.y = PV0iz * R0i.x;
// 8
PV0ix = floatBitsToInt(uf_blockVS7[44].z + uf_blockVS7[45].x);
R126i.y = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), uf_blockVS7[45].x));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
PV0iw = int(1) - PV1iz;
PS0i = PV1ix * R0i.y;
// 9
PV1ix = PS0i + R124i.y;
R124i.y = floatBitsToInt(-(intBitsToFloat(PV0iz)) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), uf_blockVS7[45].y));
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 2.0);
PV1iw = floatBitsToInt(uf_blockVS7[44].w + uf_blockVS7[45].y);
PS1i = PV0iw * R0i.z;
// 10
PV0ix = floatBitsToInt(uf_blockVS7[46].y + uf_blockVS7[46].w);
PV0iy = floatBitsToInt(uf_blockVS7[46].x + uf_blockVS7[46].z);
R124i.z = PS1i + PV1ix;
PV0iw = floatBitsToInt(-(intBitsToFloat(PV1iz)) + intBitsToFloat(PV1iw));
R124i.x = int(intBitsToFloat(R126i.y));
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),uf_blockVS7[46].z) + intBitsToFloat(PV0iy));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),uf_blockVS7[44].y) + intBitsToFloat(PV0iw));
PV1iz = 0 - R124i.x;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),uf_blockVS7[46].w) + intBitsToFloat(PV0ix));
R126i.w = floatBitsToInt(float(R3i.y));
// 12
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R8i.y)),uf_blockVS7[44].x) + -(intBitsToFloat(R124i.y)));
R124i.y = floatBitsToInt(abs(intBitsToFloat(R126i.w)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),uf_blockVS7[45].z) + intBitsToFloat(R123i.x));
PV0iw = max(R124i.x, PV1iz);
PS0i = floatBitsToInt(1.0 / abs(intBitsToFloat(R2i.x)));
// 13
PV1ix = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R126i.w)), intBitsToFloat(PS0i)));
PV1iy = int(1) - PV0iw;
R127i.z = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),uf_blockVS7[45].w) + intBitsToFloat(R127i.w));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R2i.x));
// 14
R0i.x = floatBitsToInt(intBitsToFloat(R5i.x) + 0.5);
PV0iz = floatBitsToInt(trunc(intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(PS1i));
PS0i = PV1iy * R0i.w;
// 15
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iz)),intBitsToFloat(R127i.x)) + intBitsToFloat(R124i.y));
PV1iy = floatBitsToInt(trunc(intBitsToFloat(PV0iw)));
R125i.z = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
R125i.w = PS0i + R124i.z;
PS1i = floatBitsToInt(1.0 / uf_blockVS7[48].z);
// 16
R126i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].x, intBitsToFloat(PS1i)));
R127i.y = floatBitsToInt(intBitsToFloat(R2i.z) + -(0.5));
PV0iz = floatBitsToInt(-(abs(intBitsToFloat(R2i.x))) + intBitsToFloat(R127i.x));
PV0iw = floatBitsToInt((intBitsToFloat(R127i.x) >= abs(intBitsToFloat(R2i.x)))?1.0:0.0);
R124i.x = int(intBitsToFloat(PV1iy));
// 17
R124i.y = ((intBitsToFloat(PV0iw) == 0.0)?(R127i.x):(PV0iz));
R123i.z = ((R5i.z == 0)?(0):(int(1)));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[48].w);
// 18
PV0ix = floatBitsToInt(abs(intBitsToFloat(R2i.x)) + intBitsToFloat(R124i.y));
R125i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].y, intBitsToFloat(PS1i)));
R124i.z = (R123i.z == 0x2)?-1:0;
R127i.w = (R123i.z == int(1))?-1:0;
PS0i = floatBitsToInt(float(R124i.x));
// 19
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)),intBitsToFloat(PS0i)) + intBitsToFloat(R126i.y));
R123i.y = ((R124i.z == 0)?(R6i.x):(R6i.z));
R123i.z = ((-(intBitsToFloat(R124i.y)) > 0.0)?(PV0ix):(R124i.y));
R124i.w = int(uf_blockVS7[53].z);
// 20
backupReg0i = R123i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)),intBitsToFloat(R127i.y)) + -(intBitsToFloat(R123i.x)));
R127i.y = ((R127i.w == 0)?(R123i.y):(R6i.y));
R123i.z = ((R124i.z == 0)?(R6i.y):(R6i.x));
R123i.w = ((-(intBitsToFloat(R126i.w)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(backupReg0i)))):(backupReg0i));
R3i.x = ((R127i.w == 0)?(R6i.x):(R6i.y));
// 21
R124i.x = ((R127i.w == 0)?(R123i.z):(R6i.z));
R123i.y = ((intBitsToFloat(R2i.x) == 0.0)?(R126i.w):(R123i.w));
R6i.z = ((R127i.w == 0)?(R6i.y):(R6i.z));
R6i.y = floatBitsToInt(float(R124i.w));
// 22
R5i.z = floatBitsToInt(abs(intBitsToFloat(R6i.y)));
PS0i = int(intBitsToFloat(R123i.y));
// 23
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockVS7[50].x, intBitsToFloat(R127i.y)));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[50].y, intBitsToFloat(R124i.x)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
PV1iz = floatBitsToInt(uf_blockVS7[49].z + uf_blockVS7[50].x);
PS1i = floatBitsToInt(float(PS0i));
// 24
PV0ix = floatBitsToInt(uf_blockVS7[49].w + uf_blockVS7[50].y);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PS1i)) + intBitsToFloat(R125i.x));
R5i.w = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(PV1iz));
R2i.x = floatBitsToInt(float(R125i.w));
// 25
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(PV0ix));
PV1iy = floatBitsToInt((intBitsToFloat(R2i.x) > 0.0)?1.0:0.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(backupReg0i)) + intBitsToFloat(R123i.z));
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(R2i.x))?1.0:0.0);
R0i.z = floatBitsToInt(float(R125i.w));
// 26
R13i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.x)),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.z));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R125i.z)) + intBitsToFloat(R127i.x));
R2i.z = floatBitsToInt(abs(intBitsToFloat(R0i.z)));
R6i.w = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iw)));
R0i.w = floatBitsToInt(1.0 / abs(intBitsToFloat(R6i.y)));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R0i.z)), intBitsToFloat(R0i.w)));
R123i.y = floatBitsToInt(intBitsToFloat(R6i.w) * 0.5 + intBitsToFloat(R2i.x));
PV0iz = floatBitsToInt(uf_blockVS7[51].y + uf_blockVS7[51].w);
PV0iw = floatBitsToInt(uf_blockVS7[51].x + uf_blockVS7[51].z);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R6i.y));
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[51].w,intBitsToFloat(R6i.z)) + intBitsToFloat(PV0iz));
R125i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[51].z,intBitsToFloat(R3i.x)) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[53].z);
// 2
R126i.x = floatBitsToInt(intBitsToFloat(R8i.w) + 0.5);
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iw)),intBitsToFloat(R5i.z)) + intBitsToFloat(R2i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[53].x, intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(trunc(intBitsToFloat(PV1iz)));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[53].w);
// 3
PV1ix = floatBitsToInt(-(abs(intBitsToFloat(R6i.y))) + intBitsToFloat(R127i.y));
R126i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[53].y, intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt((intBitsToFloat(R127i.y) >= abs(intBitsToFloat(R6i.y)))?1.0:0.0);
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R8i.y)),uf_blockVS7[49].x) + -(intBitsToFloat(R5i.w)));
PS1i = int(intBitsToFloat(PV0iw));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),uf_blockVS7[49].y) + intBitsToFloat(R0i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),uf_blockVS7[50].z) + intBitsToFloat(R125i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),uf_blockVS7[50].w) + intBitsToFloat(R127i.x));
R125i.w = ((intBitsToFloat(PV1iz) == 0.0)?(R127i.y):(PV1ix));
PS0i = floatBitsToInt(float(PS1i));
// 5
backupReg0i = R123i.y;
PV1ix = floatBitsToInt(abs(intBitsToFloat(R6i.y)) + intBitsToFloat(R125i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.y)),intBitsToFloat(PS0i)) + intBitsToFloat(R123i.x));
R125i.z = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
R126i.w = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
PS1i = floatBitsToInt(intBitsToFloat(R5i.y) + -(0.5));
// 6
R123i.x = ((-(intBitsToFloat(R125i.w)) > 0.0)?(PV1ix):(R125i.w));
R10i.y = floatBitsToInt(uf_blockVS7[104].x);
R125i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.y)),intBitsToFloat(PS1i)) + -(intBitsToFloat(R123i.y)));
// 7
backupReg0i = R9i.x;
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z),intBitsToFloat(R8i.z)) + intBitsToFloat(R2i.w));
R123i.z = ((-(intBitsToFloat(R0i.z)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.x)))):(R123i.x));
R1i.z = backupReg0i;
// 8
backupReg0i = R11i.x;
R11i.x = R8i.z;
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z),intBitsToFloat(R4i.w)) + intBitsToFloat(R10i.x));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z),intBitsToFloat(R7i.y)) + intBitsToFloat(backupReg0i));
R123i.w = ((intBitsToFloat(R6i.y) == 0.0)?(R0i.z):(R123i.z));
R11i.y = R4i.w;
// 9
R11i.z = R7i.y;
PS1i = int(intBitsToFloat(R123i.w));
// 10
PS0i = floatBitsToInt(float(PS1i));
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.w));
// 12
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.x));
// 13
R13i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R8i.w)),intBitsToFloat(R126i.w)) + intBitsToFloat(R123i.x));
R13i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R125i.z)) + intBitsToFloat(R125i.w));
}
if( activeMaskStackC[3] == true ) {
// 0
R10i.x = floatBitsToInt(uf_blockVS8[3].x * 1.0 + 0.0);
// 1
R0i.x = R8i.x;
R0i.y = R2i.y;
R0i.z = R1i.z;
R0i.w = R8i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
// skipped export to semanticId 255
// export
passParameterSem8 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
// skipped export to semanticId 255
// export
// skipped export to semanticId 255
// export
// skipped export to semanticId 255
// export
passParameterSem4 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.z));
}
