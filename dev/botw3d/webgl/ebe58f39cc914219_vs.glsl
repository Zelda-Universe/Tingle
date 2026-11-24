#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader ebe58f39cc914219
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
attrDecoder = attrDataSem2;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem0;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem1;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem4;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem3;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R9i.y = floatBitsToInt(-(intBitsToFloat(R2i.w)) + uf_blockVS8[2].x);
R2i.w = 0;
R3i.w = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R9i.y));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R8i.x = 0;
R8i.y = 0;
R8i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R10i.x = 0;
// 1
R6i.w = R3i.w;
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
PS0i = int(intBitsToFloat(R1i.w));
// 1
R5i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R9i.y) >= intBitsToFloat(R5i.z));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R8i.x = 0;
R8i.y = 0;
R8i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R10i.x = 0;
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
PV0ix = floatBitsToInt((0.0 > uf_blockVS7[9].x)?1.0:0.0);
PV0iy = floatBitsToInt((uf_blockVS7[9].x > 0.0)?1.0:0.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), uf_blockVS7[10].y));
R6i.w = floatBitsToInt(max(intBitsToFloat(R4i.x), 0.0));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[9].x);
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R9i.y) * intBitsToFloat(PS0i));
R127i.y = floatBitsToInt(intBitsToFloat(R9i.y) + uf_blockVS7[15].z);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), uf_blockVS7[15].x));
R127i.w = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
R9i.x = floatBitsToInt(1.0 / intBitsToFloat(R5i.z));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
PV0iy = floatBitsToInt(uf_blockVS7[5].x) & int(1);
R5i.z = floatBitsToInt(intBitsToFloat(R9i.y) * intBitsToFloat(R9i.x));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[14].z);
// 3
PV1ix = floatBitsToInt(-(uf_blockVS7[96].w) + uf_blockVS7[97].w);
PV1iy = floatBitsToInt(fract(intBitsToFloat(PV0iw)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS0i));
R124i.w = floatBitsToInt(float(PV0iy));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt(-(uf_blockVS7[96].x) + uf_blockVS7[97].x);
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(-(uf_blockVS7[96].y) + uf_blockVS7[97].y);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0x40c90fdb));
R126i.y = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(-(uf_blockVS7[97].w) + uf_blockVS7[98].w);
R126i.w = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
R127i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(PS0i));
// 6
PV0ix = floatBitsToInt(uf_blockVS7[5].x) & 0x2;
R0i.y = floatBitsToInt(intBitsToFloat(R126i.y) + -(uf_blockVS7[97].w));
R123i.z = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
R127i.w = floatBitsToInt(uf_blockVS7[5].x) & 0x4;
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
// 7
R0i.x = floatBitsToInt(intBitsToFloat(R126i.y) + -(uf_blockVS7[98].w));
R8i.y = ((intBitsToFloat(R0i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.z = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
R125i.w = floatBitsToInt(intBitsToFloat(R126i.y) + -(uf_blockVS7[96].w));
R0i.w = floatBitsToInt(float(PV0ix));
// 8
R7i.x = floatBitsToInt(fract(intBitsToFloat(R126i.z)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R126i.w)));
PV0iz = floatBitsToInt(-(uf_blockVS7[97].y) + uf_blockVS7[98].y);
PV0iw = floatBitsToInt(-(uf_blockVS7[97].x) + uf_blockVS7[98].x);
R125i.y = floatBitsToInt(float(R127i.w));
// 9
backupReg0i = R127i.x;
backupReg1i = R125i.w;
R127i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(R127i.y));
R127i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(R127i.y));
PV1iz = floatBitsToInt(-(uf_blockVS7[98].w) + uf_blockVS7[99].w);
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), intBitsToFloat(backupReg0i)));
R125i.z = ((intBitsToFloat(backupReg1i) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 10
R6i.x = ((intBitsToFloat(R0i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R6i.y = floatBitsToInt(-(uf_blockVS7[98].x) + uf_blockVS7[99].x);
R126i.z = floatBitsToInt(-(intBitsToFloat(R8i.y)) + 1.0);
R127i.w = floatBitsToInt(-(uf_blockVS7[98].y) + uf_blockVS7[99].y);
R126i.x = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
// 11
backupReg0i = R126i.y;
R125i.x = floatBitsToInt((intBitsToFloat(R124i.w) > 0.0)?1.0:0.0);
R126i.y = floatBitsToInt((intBitsToFloat(R0i.w) > 0.0)?1.0:0.0);
R124i.z = floatBitsToInt((0.0 > intBitsToFloat(R124i.w))?1.0:0.0);
R124i.w = floatBitsToInt(intBitsToFloat(backupReg0i) + -(uf_blockVS7[99].w));
R7i.y = floatBitsToInt((0.0 > intBitsToFloat(R0i.w))?1.0:0.0);
// 12
backupReg0i = R125i.y;
R124i.x = floatBitsToInt((0.0 > intBitsToFloat(backupReg0i))?1.0:0.0);
R125i.y = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.z = floatBitsToInt((intBitsToFloat(backupReg0i) > 0.0)?1.0:0.0);
R126i.w = floatBitsToInt(intBitsToFloat(R7i.x) + -(0.5));
R6i.z = floatBitsToInt(uf_blockVS7[96].x + intBitsToFloat(R124i.y));
// 13
backupReg0i = R127i.x;
backupReg1i = R127i.y;
backupReg2i = R127i.w;
R127i.x = floatBitsToInt(uf_blockVS7[96].y + intBitsToFloat(R125i.w));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(backupReg0i)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(backupReg1i)));
R127i.w = floatBitsToInt(intBitsToFloat(R6i.y) * intBitsToFloat(R126i.x));
R125i.w = floatBitsToInt(intBitsToFloat(backupReg2i) * intBitsToFloat(R126i.x));
// 14
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R126i.z)));
R124i.y = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
R7i.z = ((intBitsToFloat(R124i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iw = floatBitsToInt(-(intBitsToFloat(R6i.x)) + 1.0);
R0i.y = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(R124i.z)));
// 15
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(intBitsToFloat(R126i.y) + -(intBitsToFloat(R7i.y)));
R126i.y = ((intBitsToFloat(R126i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PV0iw)));
R126i.w = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(backupReg0i)));
R126i.z = floatBitsToInt(uf_blockVS7[97].y + intBitsToFloat(R0i.z));
// 16
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R125i.w)));
R127i.y = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(0x3e22f983));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R127i.w)));
R127i.w = floatBitsToInt(uf_blockVS7[97].x + intBitsToFloat(backupReg0i));
PS0i = floatBitsToInt(-(intBitsToFloat(R7i.z)) + 1.0);
// 17
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R125i.x)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R125i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].x, intBitsToFloat(R124i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].y, intBitsToFloat(R124i.y)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(PS0i)));
// 18
R127i.x = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
R126i.y = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PV1iz));
R127i.z = floatBitsToInt(uf_blockVS7[98].x + intBitsToFloat(R127i.z));
R125i.w = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(PV1iw));
R124i.w = int(intBitsToFloat(R0i.y));
// 19
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R125i.z)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R125i.z)));
R126i.z = 0 - R124i.w;
R127i.w = floatBitsToInt(uf_blockVS7[98].y + intBitsToFloat(R126i.x));
R0i.w = int(intBitsToFloat(R124i.x));
// 20
backupReg0i = R126i.y;
backupReg1i = R126i.w;
R126i.x = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R125i.w));
R126i.y = 0 - R0i.w;
R125i.z = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(backupReg0i));
R126i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[14].x, intBitsToFloat(R7i.x)));
R124i.y = int(intBitsToFloat(backupReg1i));
// 21
PV1ix = 0 - R124i.y;
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R124i.z)));
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[14].x, intBitsToFloat(R127i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R124i.z)));
PS1i = floatBitsToInt(cos((intBitsToFloat(R127i.y))/0.1591549367));
// 22
R6i.x = max(R0i.w, R126i.y);
R8i.y = max(R124i.w, R126i.z);
PV0iz = floatBitsToInt(intBitsToFloat(PS1i) + 1.0);
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
R0i.w = max(R124i.y, PV1ix);
R7i.y = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R125i.z));
// 23
backupReg0i = R6i.w;
R7i.x = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R0i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[14].x, intBitsToFloat(PV0iz)));
R0i.z = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
R6i.w = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R126i.x));
R6i.z = floatBitsToInt(min(intBitsToFloat(backupReg0i), 0.0));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(uf_blockVS7[99].x, intBitsToFloat(R7i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockVS7[99].y, intBitsToFloat(R7i.z)));
R127i.z = floatBitsToInt(-(intBitsToFloat(R0i.y)) + 1.0);
R127i.w = floatBitsToInt(max(intBitsToFloat(R0i.z), -(intBitsToFloat(R0i.z))));
R0i.x = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(R6i.z));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(R6i.w));
R124i.y = floatBitsToInt(max(intBitsToFloat(R7i.x), -(intBitsToFloat(R7i.x))));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R7i.y));
R1i.w = floatBitsToInt(uf_blockVS8[2].w + intBitsToFloat(R9i.y));
R126i.x = floatBitsToInt(float(R8i.y));
// 2
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1iz)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PV1ix)));
R126i.y = floatBitsToInt(float(R6i.x));
// 3
PS1i = floatBitsToInt(float(R0i.w));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.z),intBitsToFloat(R127i.w),intBitsToFloat(R124i.y),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R126i.w)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R127i.y)));
// 6
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), uf_blockVS8[3].y));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), uf_blockVS8[3].z));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R5i.y = ((uf_blockVS7[12].x == 1.0)?-1:0);
R7i.z = floatBitsToInt(-(uf_blockVS7[12].x) + 1.0);
// 1
predResult = (R5i.y != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(R1i.w)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].w, intBitsToFloat(PV0ix)));
// 2
R6i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].x, intBitsToFloat(PV1iw)));
R6i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].y, intBitsToFloat(PV1iw)));
R6i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].z, intBitsToFloat(PV1iw)));
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
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PS1i)));
R127i.y = ((uf_blockVS7[12].x == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R7i.z));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R1i.w) + -(intBitsToFloat(PV1iz)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].w, intBitsToFloat(PV1ix)));
// 9
R6i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].x, intBitsToFloat(PV0iw)));
R6i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].y, intBitsToFloat(PV0iw)));
R6i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].z, intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(uf_blockVS7[13].x);
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
PV0iy = floatBitsToInt(uf_blockVS7[13].y);
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
R0i.z = floatBitsToInt(intBitsToFloat(R3i.z) * 1.0);
R0i.w = 0x3f800000;
tempResultf = max(0.0, uf_blockVS7[12].x);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(intBitsToFloat(R3i.x) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(PV0iy));
R3i.w = 0x3f800000;
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R7i.z));
// 2
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1iy)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PV1iz)));
R7i.w = 0x3f800000;
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
// 3
PV1iw = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R6i.w = floatBitsToInt(1.0 / uf_blockVS7[116].x);
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(R127i.y));
// 5
R123i.z = ((R5i.y == 0)?(PV0ix):(R1i.w));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R123i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R123i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.z)));
// 7
PV1iy = floatBitsToInt(intBitsToFloat(R6i.z) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(PV0iy));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV1iy)));
// 9
R1i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV0ix));
R1i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV0iz));
R1i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0iw));
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS8[4].x,uf_blockVS8[4].y,uf_blockVS8[4].z,uf_blockVS8[4].w)));
PV0ix = tempi.x;
R5i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
R5i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS8[5].x,uf_blockVS8[5].y,uf_blockVS8[5].z,uf_blockVS8[5].w)));
PV1iy = R5i.x;
PV1iz = R5i.x;
PV1iw = R5i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS8[6].x,uf_blockVS8[6].y,uf_blockVS8[6].z,uf_blockVS8[6].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R1i.z = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS6[12].x,uf_blockVS6[12].y,uf_blockVS6[12].z,uf_blockVS6[12].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS6[13].x,uf_blockVS6[13].y,uf_blockVS6[13].z,uf_blockVS6[13].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.z = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(PV1ix));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS6[14].x,uf_blockVS6[14].y,uf_blockVS6[14].z,uf_blockVS6[14].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.w = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV0ix));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R5i.y) + -(uf_blockVS6[17].x));
R127i.y = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(intBitsToFloat(R5i.x) + -(uf_blockVS6[17].y));
PV0iw = floatBitsToInt(intBitsToFloat(R1i.z) + -(uf_blockVS6[17].z));
R3i.w = floatBitsToInt(-(intBitsToFloat(R5i.y)) + intBitsToFloat(R127i.z));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iz),intBitsToFloat(PV0iw),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iz),intBitsToFloat(PV0iw),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R0i.y = floatBitsToInt(-(intBitsToFloat(R5i.x)) + intBitsToFloat(R127i.w));
// 8
R0i.x = floatBitsToInt(-(intBitsToFloat(R1i.z)) + intBitsToFloat(R127i.y));
R0i.z = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
}
if( activeMaskStackC[3] == true ) {
// 0
R1i.x = floatBitsToInt(uf_blockVS7[60].x);
PV0iz = floatBitsToInt(min(intBitsToFloat(R0i.z), uf_blockVS7[116].x));
R0i.w = floatBitsToInt(uf_blockVS7[60].y);
// 1
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(R6i.w));
R0i.z = floatBitsToInt(uf_blockVS7[60].z);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(PV1iy)));
R127i.y = floatBitsToInt(-(uf_blockVS7[68].x) + uf_blockVS7[69].x);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1iy)));
// 3
backupReg0i = R5i.x;
R5i.x = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(PV0ix));
R5i.y = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV0iz));
R1i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(-(uf_blockVS7[68].w) + uf_blockVS7[69].w);
// 4
R127i.x = floatBitsToInt(-(uf_blockVS7[69].x) + uf_blockVS7[70].x);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 5
PV1ix = floatBitsToInt(-(uf_blockVS7[69].w) + uf_blockVS7[70].w);
R3i.w = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS0i));
// 6
R127i.z = floatBitsToInt(-(uf_blockVS7[70].x) + uf_blockVS7[71].x);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 7
PV1ix = floatBitsToInt(-(uf_blockVS7[70].w) + uf_blockVS7[71].w);
R0i.y = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS0i));
// 8
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 9
R6i.w = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS0i));
}
if( activeMaskStackC[3] == true ) {
// 0
R8i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R1i.z),intBitsToFloat(R7i.w)),vec4(uf_blockVS6[8].x,uf_blockVS6[8].y,uf_blockVS6[8].z,uf_blockVS6[8].w)));
PV0iy = R8i.x;
PV0iz = R8i.x;
PV0iw = R8i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R1i.z),intBitsToFloat(R7i.w)),vec4(uf_blockVS6[9].x,uf_blockVS6[9].y,uf_blockVS6[9].z,uf_blockVS6[9].w)));
PV1ix = tempi.x;
R8i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R1i.z),intBitsToFloat(R7i.w)),vec4(uf_blockVS6[11].x,uf_blockVS6[11].y,uf_blockVS6[11].z,uf_blockVS6[11].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R8i.w = tempi.x;
// 3
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R1i.z),intBitsToFloat(R7i.w)),vec4(uf_blockVS6[0].x,uf_blockVS6[0].y,uf_blockVS6[0].z,uf_blockVS6[0].w)));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R1i.z),intBitsToFloat(R7i.w)),vec4(uf_blockVS6[1].x,uf_blockVS6[1].y,uf_blockVS6[1].z,uf_blockVS6[1].w)));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R1i.z),intBitsToFloat(R7i.w)),vec4(uf_blockVS6[2].x,uf_blockVS6[2].y,uf_blockVS6[2].z,uf_blockVS6[2].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R127i.z = tempi.x;
PV1iw = tempi.x;
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R1i.z),intBitsToFloat(R7i.w)),vec4(uf_blockVS6[3].x,uf_blockVS6[3].y,uf_blockVS6[3].z,uf_blockVS6[3].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R127i.w = tempi.x;
// 7
PV1ix = floatBitsToInt((0.0 > uf_blockVS7[8].y)?1.0:0.0);
PV1iy = floatBitsToInt((uf_blockVS7[8].y > 0.0)?1.0:0.0);
R127i.z = floatBitsToInt(uf_blockVS7[13].z + intBitsToFloat(R127i.z));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[8].y);
// 8
R126i.y = floatBitsToInt(intBitsToFloat(R9i.y) * intBitsToFloat(PS1i));
R126i.w = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1ix)));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w)),vec4(uf_blockVS6[6].x,uf_blockVS6[6].y,uf_blockVS6[6].z,uf_blockVS6[6].w)));
PV1ix = tempi.x;
R125i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.z = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w)),vec4(uf_blockVS6[7].x,uf_blockVS6[7].y,uf_blockVS6[7].z,uf_blockVS6[7].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),uf_blockVS7[9].z) + intBitsToFloat(R126i.y));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 12
PV0iy = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
// 13
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV0iw)));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(PV0iy)));
// 14
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R126i.z)) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt((uf_blockVS7[8].z > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > uf_blockVS7[8].z)?1.0:0.0);
PS0i = floatBitsToInt(1.0 / uf_blockVS7[8].z);
// 15
PV1iy = floatBitsToInt(intBitsToFloat(R9i.y) * intBitsToFloat(PS0i));
R126i.z = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iz)));
// 16
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),uf_blockVS7[9].w) + intBitsToFloat(PV1iy));
R126i.w = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
// 17
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
// 18
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV1iz)));
// 19
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R126i.w)) + intBitsToFloat(PV0iy));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iy = floatBitsToInt(intBitsToFloat(R5i.x) + -(uf_blockVS7[69].w));
PV0iw = floatBitsToInt(intBitsToFloat(R5i.x) + -(uf_blockVS7[68].w));
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R0i.y)) + uf_blockVS7[69].x);
R125i.y = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R3i.w)) + uf_blockVS7[68].x);
R126i.w = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
PV0iy = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
PV0iz = floatBitsToInt(intBitsToFloat(R5i.x) + -(uf_blockVS7[71].w));
PV0iw = floatBitsToInt(intBitsToFloat(R5i.x) + -(uf_blockVS7[70].w));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV0ix)));
R125i.y = ((intBitsToFloat(PV0iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R6i.w)) + uf_blockVS7[70].x);
R127i.w = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS1i = floatBitsToInt(mul_nonIEEE(uf_blockVS7[68].x, intBitsToFloat(PV0iy)));
// 4
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(PV1ix)) + intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
R125i.w = floatBitsToInt(intBitsToFloat(R0i.x) + -(uf_blockVS7[76].w));
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), uf_blockVS8[0].x));
// 5
R125i.x = ((intBitsToFloat(R125i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV0iz)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), uf_blockVS8[0].z));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0iy)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), uf_blockVS8[0].y));
// 6
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(uf_blockVS7[76].x) + uf_blockVS7[77].x);
R126i.y = floatBitsToInt(-(uf_blockVS7[76].y) + uf_blockVS7[77].y);
R126i.z = floatBitsToInt(-(intBitsToFloat(R125i.x)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(PV1iy)) + intBitsToFloat(R126i.x));
// 7
R126i.x = floatBitsToInt(-(uf_blockVS7[76].z) + uf_blockVS7[77].z);
PV1iy = floatBitsToInt(-(uf_blockVS7[76].w) + uf_blockVS7[77].w);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.w));
R126i.w = floatBitsToInt(intBitsToFloat(R0i.x) + -(uf_blockVS7[77].w));
R1i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[76].z, intBitsToFloat(R126i.z)));
// 8
backupReg0i = R125i.y;
R124i.x = ((intBitsToFloat(R126i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.y = floatBitsToInt(intBitsToFloat(R0i.x) + -(uf_blockVS7[78].w));
R123i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[71].x,intBitsToFloat(backupReg0i)) + intBitsToFloat(R123i.z));
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 9
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), uf_blockVS7[59].x));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), uf_blockVS7[59].x));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), uf_blockVS7[59].x));
R11i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), uf_blockVS8[0].w));
PS1i = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(R127i.w));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(R127i.w));
R124i.y = ((intBitsToFloat(R125i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iz = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(R127i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(PS1i)) + uf_blockVS7[76].x);
PS0i = floatBitsToInt(-(intBitsToFloat(R124i.x)) + 1.0);
// 11
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PS0i)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(PV0ix)) + uf_blockVS7[76].y);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(PV0iz)) + uf_blockVS7[76].z);
PV1iw = floatBitsToInt(-(intBitsToFloat(R124i.y)) + 1.0);
PS1i = floatBitsToInt(mul_nonIEEE(uf_blockVS7[76].x, intBitsToFloat(R126i.z)));
// 12
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(-(uf_blockVS7[77].x) + uf_blockVS7[78].x);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R125i.x)) + intBitsToFloat(R1i.x));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R125i.x)) + intBitsToFloat(PS1i));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1iw)));
R125i.y = floatBitsToInt(-(uf_blockVS7[77].y) + uf_blockVS7[78].y);
// 13
R126i.x = floatBitsToInt(-(uf_blockVS7[77].z) + uf_blockVS7[78].z);
PV1iy = ((intBitsToFloat(R4i.y) > 0.5)?-1:0);
PV1iz = floatBitsToInt(-(uf_blockVS7[77].w) + uf_blockVS7[78].w);
PV1iw = ((intBitsToFloat(R4i.x) > 0.5)?-1:0);
PS1i = ((intBitsToFloat(R4i.z) > 0.5)?-1:0);
// 14
R1i.x = floatBitsToInt(((PV1iy == 0)?(intBitsToFloat(R3i.y)):(-(intBitsToFloat(R3i.y)))));
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockVS7[76].y, intBitsToFloat(R126i.z)));
R0i.z = floatBitsToInt(((PV1iw == 0)?(intBitsToFloat(R3i.x)):(-(intBitsToFloat(R3i.x)))));
R0i.w = floatBitsToInt(((PS1i == 0)?(intBitsToFloat(R3i.x)):(-(intBitsToFloat(R3i.x)))));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
// 15
PV1ix = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(intBitsToFloat(R124i.x) * intBitsToFloat(PS0i));
PV1iz = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(PS0i));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R125i.x)) + intBitsToFloat(PV0iy));
PS1i = ((intBitsToFloat(R4i.w) > 0.5)?-1:0);
// 16
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PV1iz)) + uf_blockVS7[77].z);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PV1ix)) + uf_blockVS7[77].y);
R1i.z = floatBitsToInt(((PS1i == 0)?(intBitsToFloat(R3i.y)):(-(intBitsToFloat(R3i.y)))));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PV1iy)) + uf_blockVS7[77].x);
// 17
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R125i.w)) + intBitsToFloat(R127i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(R125i.w)) + intBitsToFloat(R127i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R125i.w)) + intBitsToFloat(R127i.y));
// 18
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[78].y,intBitsToFloat(R124i.y)) + intBitsToFloat(R123i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[78].x,intBitsToFloat(R124i.y)) + intBitsToFloat(backupReg0i));
R123i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[78].z,intBitsToFloat(R124i.y)) + intBitsToFloat(R123i.w));
// 19
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), uf_blockVS8[1].x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), uf_blockVS8[1].y));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), uf_blockVS8[1].z));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iy = floatBitsToInt(uf_blockVS7[5].x) & 0x80000;
R6i.w = floatBitsToInt(uf_blockVS7[84].x);
// 1
PV1ix = (PV0iy == 0x80000)?-1:0;
PV1iy = floatBitsToInt(uf_blockVS7[5].x) & 0x100000;
PV1iw = floatBitsToInt(uf_blockVS7[5].x) & 0x200000;
// 2
PV0ix = floatBitsToInt(uf_blockVS7[5].x) & 0x400000;
R5i.y = ((PV1ix == 0)?(R3i.x):(R0i.z));
PV0iz = (PV1iw == 0x200000)?-1:0;
PV0iw = (PV1iy == 0x100000)?-1:0;
PS0i = floatBitsToInt(uf_blockVS7[5].y) & int(1);
// 3
R2i.x = ((PV0iw == 0)?(R3i.y):(R1i.x));
PV1iy = (PV0ix == 0x400000)?-1:0;
R5i.z = (int(1) != PS0i)?-1:0;
R3i.w = ((PV0iz == 0)?(R3i.x):(R0i.w));
R0i.w = int(uf_blockVS7[17].x);
// 4
PV0iy = floatBitsToInt(uf_blockVS7[5].x) & 0x10;
R6i.z = ((PV1iy == 0)?(R3i.y):(R1i.z));
R1i.z = int(uf_blockVS7[17].y);
// 5
R126i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x40;
PV1iy = floatBitsToInt(uf_blockVS7[5].x) & 0x20;
PS1i = floatBitsToInt(float(PV0iy));
// 6
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(PV1iy));
// 7
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(float(R126i.x));
// 8
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R126i.x = int(intBitsToFloat(PV1iy));
// 9
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
PV1iw = 0 - R126i.x;
R125i.x = int(intBitsToFloat(PV0iy));
// 10
R3i.z = max(R126i.x, PV1iw);
PV0iw = 0 - R125i.x;
R126i.x = int(intBitsToFloat(PV1iy));
// 11
R0i.z = max(R125i.x, PV0iw);
PV1iw = 0 - R126i.x;
// 12
R2i.z = max(R126i.x, PV1iw);
}
if( activeMaskStackC[3] == true ) {
// 0
R7i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R0i.x)));
R7i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R0i.y)));
R7i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R7i.z)));
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), uf_blockVS8[1].w));
// 1
R127i.y = int(-1) + R0i.w;
R124i.y = floatBitsToInt(float(R0i.w));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(R124i.y)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R124i.y)));
PS0i = floatBitsToInt(float(R1i.z));
// 3
PV1iw = floatBitsToInt(intBitsToFloat(R9i.x) * intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 4
R127i.w = floatBitsToInt(intBitsToFloat(R9i.y) * intBitsToFloat(PS1i));
PS0i = int(intBitsToFloat(PV1iw));
// 5
R125i.y = R3i.z * PS0i;
// 6
R3i.z = int(intBitsToFloat(R127i.w));
// 7
PS1i = floatBitsToInt(float(R3i.z));
// 8
PV0ix = floatBitsToInt(-(intBitsToFloat(R124i.y)) + intBitsToFloat(PS1i));
R0i.x = floatBitsToInt(float(R0i.w));
// 9
R1i.x = floatBitsToInt(abs(intBitsToFloat(R0i.x)));
R123i.w = ((intBitsToFloat(PV0ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.w = floatBitsToInt(float(R3i.z));
// 10
R126i.z = floatBitsToInt(abs(intBitsToFloat(R127i.w)));
R127i.z = int(intBitsToFloat(R123i.w));
// 11
R126i.x = int(1) - R127i.z;
R1i.z = floatBitsToInt(1.0 / abs(intBitsToFloat(R0i.x)));
// 12
PV0iy = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R127i.w)), intBitsToFloat(R1i.z)));
R127i.z = R127i.z * R127i.y;
// 13
PV1ix = floatBitsToInt(trunc(intBitsToFloat(PV0iy)));
R0i.w = int(intBitsToFloat(R126i.y));
// 14
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(R1i.x)) + intBitsToFloat(R126i.z));
// 15
PV1ix = floatBitsToInt(-(abs(intBitsToFloat(R0i.x))) + intBitsToFloat(R126i.y));
PV1iw = floatBitsToInt((intBitsToFloat(R126i.y) >= abs(intBitsToFloat(R0i.x)))?1.0:0.0);
// 16
R126i.z = ((intBitsToFloat(PV1iw) == 0.0)?(R126i.y):(PV1ix));
// 17
PV1iy = floatBitsToInt(abs(intBitsToFloat(R0i.x)) + intBitsToFloat(R126i.z));
// 18
R123i.x = ((-(intBitsToFloat(R126i.z)) > 0.0)?(PV1iy):(R126i.z));
// 19
R123i.w = ((-(intBitsToFloat(R127i.w)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.x)))):(R123i.x));
// 20
R123i.z = ((intBitsToFloat(R0i.x) == 0.0)?(R127i.w):(R123i.w));
// 21
PS1i = int(intBitsToFloat(R123i.z));
// 22
PS0i = R126i.x * PS1i;
// 23
PV1iy = PS0i + R127i.z;
// 24
PS0i = R0i.z * PV1iy;
// 25
R3i.x = PS0i + R125i.y;
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x2000000;
PV0iy = floatBitsToInt(uf_blockVS7[5].x) & 0x80;
// 1
PS1i = floatBitsToInt(float(PV0iy));
// 2
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(R126i.x));
// 3
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1ix)));
R126i.x = int(intBitsToFloat(PV1iy));
// 5
PV1iw = 0 - R126i.x;
R127i.w = int(intBitsToFloat(PV0ix));
// 6
PV0ix = 0 - R127i.w;
PV0iz = max(R126i.x, PV1iw);
// 7
PV1iy = max(R127i.w, PV0ix);
R126i.x = PV0iz * R0i.w;
// 8
PS0i = PV1iy * R0i.w;
// 9
PV1iy = R3i.z + PS0i;
// 10
PS0i = R2i.z * PV1iy;
// 11
PV1iw = PS0i + R3i.x;
// 12
PV0iz = R126i.x + PV1iw;
// 13
R126i.y = floatBitsToInt(float(PV0iz));
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), abs(intBitsToFloat(R126i.y))));
R127i.z = floatBitsToInt(abs(intBitsToFloat(R126i.y)));
// 15
PV1iw = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
// 16
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iw)),intBitsToFloat(R1i.x)) + intBitsToFloat(R127i.z));
// 17
PV1ix = floatBitsToInt(-(abs(intBitsToFloat(R0i.x))) + intBitsToFloat(R125i.y));
PV1iw = floatBitsToInt((intBitsToFloat(R125i.y) >= abs(intBitsToFloat(R0i.x)))?1.0:0.0);
// 18
R127i.z = ((intBitsToFloat(PV1iw) == 0.0)?(R125i.y):(PV1ix));
// 19
PV1iy = floatBitsToInt(abs(intBitsToFloat(R0i.x)) + intBitsToFloat(R127i.z));
// 20
R123i.x = ((-(intBitsToFloat(R127i.z)) > 0.0)?(PV1iy):(R127i.z));
// 21
R123i.w = ((-(intBitsToFloat(R126i.y)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.x)))):(R123i.x));
// 22
R123i.z = ((intBitsToFloat(R0i.x) == 0.0)?(R126i.y):(R123i.w));
// 23
R126i.y = int(intBitsToFloat(R123i.z));
// 24
R126i.x = floatBitsToInt(float(R126i.y));
// 25
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(R126i.x))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(R126i.x) > 0.0)?1.0:0.0);
R125i.w = floatBitsToInt(float(R126i.y));
// 26
backupReg0i = R125i.w;
R125i.x = floatBitsToInt(abs(intBitsToFloat(backupReg0i)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(abs(intBitsToFloat(backupReg0i)) * 0.25);
// 27
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * 0.5 + intBitsToFloat(R126i.x));
PV1iy = floatBitsToInt(trunc(intBitsToFloat(PV0iz)));
// 28
PV0ix = floatBitsToInt(intBitsToFloat(R123i.x) * 0.25);
R127i.w = floatBitsToInt(-(intBitsToFloat(PV1iy)) * 4.0 + intBitsToFloat(R125i.x));
// 29
PV1ix = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
PV1iy = floatBitsToInt((intBitsToFloat(R127i.w) >= 4.0)?1.0:0.0);
PV1iz = floatBitsToInt(intBitsToFloat(R127i.w) + -4.0);
// 30
R125i.x = ((intBitsToFloat(PV1iy) == 0.0)?(R127i.w):(PV1iz));
PS0i = int(intBitsToFloat(PV1ix));
// 31
R0i.x = PS0i + 0x12;
PV1iw = floatBitsToInt(intBitsToFloat(R125i.x) + 4.0);
PS1i = int(uf_blockVS7[48].z);
// 32
R123i.z = ((-(intBitsToFloat(R125i.x)) > 0.0)?(PV1iw):(R125i.x));
R3i.x = floatBitsToInt(float(PS1i));
// 33
R123i.y = ((-(intBitsToFloat(R125i.w)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.z)))):(R123i.z));
// 34
R1i.x = int(intBitsToFloat(R123i.y));
}
if( activeMaskStackC[3] == true ) {
R0i.xyzw = floatBitsToInt(uf_blockVS7[R0i.x].xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(abs(intBitsToFloat(R3i.x)));
R126i.y = 0xfffffffd + R1i.x;
R127i.z = 0xfffffffe + R1i.x;
PV0iw = int(-1) + R1i.x;
PS0i = floatBitsToInt(float(R1i.x));
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
PS0i = floatBitsToInt(float(R126i.y));
// 7
PV1ix = int(1) - PV0ix;
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iw = max(R125i.y, PV0iz);
R125i.y = PV0iy * R0i.x;
// 8
PV0ix = floatBitsToInt(uf_blockVS7[44].z + uf_blockVS7[45].x);
R126i.y = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iz)));
PV0iz = int(1) - PV1iw;
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), uf_blockVS7[45].x));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
PS0i = PV1ix * R0i.y;
// 9
PV1ix = PS0i + R125i.y;
R125i.y = floatBitsToInt(-(intBitsToFloat(PV0iw)) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), uf_blockVS7[45].y));
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 2.0);
PV1iw = floatBitsToInt(uf_blockVS7[44].w + uf_blockVS7[45].y);
PS1i = PV0iz * R0i.z;
// 10
PV0ix = floatBitsToInt(uf_blockVS7[46].y + uf_blockVS7[46].w);
PV0iy = floatBitsToInt(uf_blockVS7[46].x + uf_blockVS7[46].z);
R127i.z = floatBitsToInt(-(intBitsToFloat(PV1iz)) + intBitsToFloat(PV1iw));
R125i.w = PS1i + PV1ix;
R125i.x = int(intBitsToFloat(R126i.y));
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),uf_blockVS7[46].z) + intBitsToFloat(PV0iy));
R3i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.y)),uf_blockVS7[44].x) + -(intBitsToFloat(R125i.y)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),uf_blockVS7[46].w) + intBitsToFloat(PV0ix));
PV1iw = 0 - R125i.x;
R125i.y = floatBitsToInt(1.0 / abs(intBitsToFloat(R3i.x)));
// 12
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),uf_blockVS7[45].w) + intBitsToFloat(R123i.z));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),uf_blockVS7[44].y) + intBitsToFloat(R127i.z));
PV0iz = max(backupReg0i, PV1iw);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),uf_blockVS7[45].z) + intBitsToFloat(R123i.x));
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(R3i.x));
// 13
R1i.x = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
PV1iy = int(1) - PV0iz;
PS1i = floatBitsToInt(1.0 / uf_blockVS7[48].z);
// 14
R0i.x = floatBitsToInt(intBitsToFloat(R5i.y) + 0.5);
R0i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].x, intBitsToFloat(PS1i)));
PS0i = PV1iy * R0i.w;
// 15
R6i.x = floatBitsToInt(-(intBitsToFloat(R125i.x)) + 1.0);
R127i.y = floatBitsToInt(intBitsToFloat(R2i.x) + -(0.5));
R127i.z = PS0i + R125i.w;
PS1i = floatBitsToInt(1.0 / uf_blockVS7[48].w);
// 16
R124i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].y, intBitsToFloat(PS1i)));
R123i.w = ((R5i.z == 0)?(0):(int(1)));
R125i.w = floatBitsToInt(float(R127i.z));
// 17
backupReg0i = R125i.w;
R125i.x = (R123i.w == int(1))?-1:0;
PV1iy = (R123i.w == 0x2)?-1:0;
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(backupReg0i))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(backupReg0i) > 0.0)?1.0:0.0);
R126i.z = floatBitsToInt(float(R127i.z));
// 18
PV0ix = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R126i.z)), intBitsToFloat(R125i.y)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
R127i.z = floatBitsToInt(abs(intBitsToFloat(R126i.z)));
R123i.w = ((PV1iy == 0)?(R4i.x):(R4i.z));
R122i.x = ((PV1iy == 0)?(R4i.y):(R4i.x));
// 19
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * 0.5 + intBitsToFloat(R125i.w));
R0i.y = ((R125i.x == 0)?(R122i.x):(R4i.z));
R125i.z = ((R125i.x == 0)?(R123i.w):(R4i.y));
PV1iw = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
R5i.x = ((R125i.x == 0)?(R4i.x):(R4i.y));
// 20
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iw)),intBitsToFloat(R126i.x)) + intBitsToFloat(R127i.z));
PV0iz = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(R127i.w));
R6i.w = ((R125i.x == 0)?(R4i.y):(R4i.z));
PS0i = int(uf_blockVS7[53].z);
// 21
PV1iy = floatBitsToInt(trunc(intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt((intBitsToFloat(R126i.x) >= abs(intBitsToFloat(R3i.x)))?1.0:0.0);
PV1iw = floatBitsToInt(-(abs(intBitsToFloat(R3i.x))) + intBitsToFloat(R126i.x));
R124i.y = floatBitsToInt(float(PS0i));
// 22
PV0ix = floatBitsToInt(-(abs(intBitsToFloat(R124i.y))) + 0.0);
R125i.y = ((intBitsToFloat(PV1iz) == 0.0)?(R126i.x):(PV1iw));
PV0iw = floatBitsToInt((0.0 >= abs(intBitsToFloat(R124i.y)))?1.0:0.0);
PS0i = int(intBitsToFloat(PV1iy));
// 23
PV1ix = floatBitsToInt(abs(intBitsToFloat(R3i.x)) + intBitsToFloat(R125i.y));
R127i.z = ((intBitsToFloat(PV0iw) == 0.0)?(0):(PV0ix));
PS1i = floatBitsToInt(float(PS0i));
// 24
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.x)),intBitsToFloat(PS1i)) + intBitsToFloat(R126i.y));
R123i.w = ((-(intBitsToFloat(R125i.y)) > 0.0)?(PV1ix):(R125i.y));
// 25
R4i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.x)),intBitsToFloat(R127i.y)) + -(intBitsToFloat(R123i.x)));
PV1iy = floatBitsToInt(abs(intBitsToFloat(R124i.y)) + intBitsToFloat(R127i.z));
R123i.z = ((-(intBitsToFloat(R126i.z)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.w)))):(R123i.w));
// 26
R123i.x = ((-(intBitsToFloat(R127i.z)) > 0.0)?(PV1iy):(R127i.z));
R123i.y = ((intBitsToFloat(R3i.x) == 0.0)?(R126i.z):(R123i.z));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R124i.y));
// 27
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
R127i.w = ((intBitsToFloat(R124i.y) == 0.0)?(0):(R123i.x));
PS1i = int(intBitsToFloat(R123i.y));
// 28
PV0ix = floatBitsToInt(uf_blockVS7[49].z + uf_blockVS7[50].x);
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockVS7[50].x, intBitsToFloat(R125i.z)));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
R4i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[50].y, intBitsToFloat(R0i.y)));
R4i.z = floatBitsToInt(intBitsToFloat(R4i.z) * 2.0);
R0i.w = floatBitsToInt(trunc(intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(float(PS1i));
// 29
backupReg0i = R3i.y;
R3i.x = floatBitsToInt(-(intBitsToFloat(PV0iy)) + intBitsToFloat(PV0ix));
R3i.y = floatBitsToInt(uf_blockVS7[49].w + uf_blockVS7[50].y);
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(PS0i)) + intBitsToFloat(backupReg0i));
R5i.z = int(intBitsToFloat(R127i.w));
}
if( activeMaskStackC[3] == true ) {
// 0
R124i.x = floatBitsToInt(-(intBitsToFloat(R4i.z)) + intBitsToFloat(R3i.y));
PV0iy = floatBitsToInt(uf_blockVS7[51].x + uf_blockVS7[51].z);
PV0iz = floatBitsToInt(uf_blockVS7[51].y + uf_blockVS7[51].w);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R0i.x)) + intBitsToFloat(R4i.w));
R125i.z = int(intBitsToFloat(R0i.w));
// 1
R0i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.y)),intBitsToFloat(R1i.x)) + intBitsToFloat(R123i.w));
R124i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[51].w,intBitsToFloat(R6i.w)) + intBitsToFloat(PV0iz));
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[51].z,intBitsToFloat(R5i.x)) + intBitsToFloat(PV0iy));
R127i.w = floatBitsToInt(intBitsToFloat(R3i.w) + 0.5);
PS1i = floatBitsToInt(1.0 / uf_blockVS7[53].z);
// 2
R126i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[53].x, intBitsToFloat(PS1i)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R6i.x)) + intBitsToFloat(R4i.x));
R126i.w = floatBitsToInt(intBitsToFloat(R6i.z) + -(0.5));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[53].w);
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.y)),uf_blockVS7[49].x) + -(intBitsToFloat(R3i.x)));
R126i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[53].y, intBitsToFloat(PS0i)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),uf_blockVS7[49].y) + intBitsToFloat(R124i.x));
PS1i = floatBitsToInt(float(R5i.z));
// 4
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),uf_blockVS7[50].z) + intBitsToFloat(R127i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PS1i)) + intBitsToFloat(backupReg0i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),uf_blockVS7[50].w) + intBitsToFloat(R124i.y));
PS0i = floatBitsToInt(float(R125i.z));
// 5
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.z)),intBitsToFloat(PS0i)) + intBitsToFloat(R125i.w));
PV1iw = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
R10i.x = floatBitsToInt(uf_blockVS8[3].x * 1.0);
// 6
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.z)),intBitsToFloat(R126i.w)) + -(intBitsToFloat(R123i.z)));
R0i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.w)),intBitsToFloat(PV1iw)) + intBitsToFloat(R123i.y));
// 7
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
R10i.y = floatBitsToInt(uf_blockVS7[104].x);
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R8i.x), intBitsToFloat(R8i.y), intBitsToFloat(R8i.z), intBitsToFloat(R8i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.y), intBitsToFloat(R7i.z), intBitsToFloat(R7i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.z));
}
