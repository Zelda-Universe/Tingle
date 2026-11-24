#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 678fe7836abe232e
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
vec4 uf_blockVS11[1];
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
attrDecoder = attrDataSem4;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem0;
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem2;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem3;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem6;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem5;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R11i.y = floatBitsToInt(-(intBitsToFloat(R3i.w)) + uf_blockVS8[2].x);
R2i.z = 0;
R3i.z = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R11i.y));
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
R13i.x = 0;
// 1
R0i.z = R3i.z;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R0i.z = R2i.z;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R0i.z == 0);
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
PS0i = int(intBitsToFloat(R2i.w));
// 1
R0i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R11i.y) >= intBitsToFloat(R0i.z));
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
R13i.x = 0;
// 1
R2i.z = R3i.z;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R2i.z == 0);
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
PV0iy = floatBitsToInt(uf_blockVS7[5].x) & int(1);
R127i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x4;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), uf_blockVS7[15].x));
R1i.w = int(intBitsToFloat(R4i.w));
// 1
R126i.x = floatBitsToInt(intBitsToFloat(R11i.y) + uf_blockVS7[15].z);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), uf_blockVS7[15].y));
R126i.z = floatBitsToInt(intBitsToFloat(R11i.y) + uf_blockVS7[15].w);
PS1i = floatBitsToInt(float(PV0iy));
// 2
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PS0i = floatBitsToInt(float(R127i.x));
// 3
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PS1i = floatBitsToInt(float(R127i.z));
// 4
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R127i.x = int(intBitsToFloat(PV1iy));
// 5
PV1ix = 0 - R127i.x;
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
R127i.z = int(intBitsToFloat(PV0iy));
// 6
PV0ix = 0 - R127i.z;
PV0iw = max(R127i.x, PV1ix);
R127i.y = int(intBitsToFloat(PV1iz));
// 7
PV1ix = 0 - R127i.y;
PV1iw = max(R127i.z, PV0ix);
R124i.x = floatBitsToInt(float(PV0iw));
// 8
PV0iz = floatBitsToInt(max(intBitsToFloat(R5i.x), 0.0));
PV0iw = max(R127i.y, PV1ix);
R125i.y = floatBitsToInt(float(PV1iw));
// 9
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), uf_blockVS7[10].y));
PV1iy = floatBitsToInt(min(intBitsToFloat(PV0iz), 0.0));
PV1iz = floatBitsToInt((0.0 > uf_blockVS7[9].x)?1.0:0.0);
PV1iw = floatBitsToInt((uf_blockVS7[9].x > 0.0)?1.0:0.0);
R127i.z = floatBitsToInt(float(PV0iw));
// 10
R3i.x = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV1iy));
R127i.y = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[14].z);
// 11
PV1iz = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[14].w);
// 12
PV0ix = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1iz));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[9].x);
// 13
R126i.x = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV0ix));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb));
PV1iz = floatBitsToInt(intBitsToFloat(R11i.y) * intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(fract(intBitsToFloat(PV0iy)));
R5i.w = floatBitsToInt(1.0 / intBitsToFloat(R0i.z));
// 14
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV1iz));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(0.5));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockVS7[14].x, intBitsToFloat(PV1iw)));
R123i.w = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
PS0i = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(0x40c90fdb));
// 15
PV1ix = floatBitsToInt(-(intBitsToFloat(PV0iz)) + 1.0);
R123i.y = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R123i.w = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3e22f983) + 0.5);
R126i.x = floatBitsToInt(fract(intBitsToFloat(R126i.x)));
// 16
backupReg0i = R123i.y;
R125i.x = floatBitsToInt(max(intBitsToFloat(PV1ix), -(intBitsToFloat(PV1ix))));
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV0iz = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
PV0iw = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PS0i = floatBitsToInt(mul_nonIEEE(uf_blockVS7[14].y, intBitsToFloat(R126i.x)));
// 17
PV1ix = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockVS7[14].x, intBitsToFloat(PV0iz)));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iw = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PS1i = floatBitsToInt(intBitsToFloat(R126i.x) + -(0.5));
// 18
R123i.x = ((intBitsToFloat(PS1i) >= 0.0)?(floatBitsToInt(1.0)):(0));
R124i.y = floatBitsToInt(max(intBitsToFloat(PV1iw), -(intBitsToFloat(PV1iw))));
PV0iz = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
PV0iw = floatBitsToInt(-(intBitsToFloat(PV1iy)) + 1.0);
PS0i = floatBitsToInt(cos((intBitsToFloat(PV1ix))/0.1591549367));
// 19
R127i.x = floatBitsToInt(fract(intBitsToFloat(R127i.x)));
R126i.y = floatBitsToInt(max(intBitsToFloat(PV0iw), -(intBitsToFloat(PV0iw))));
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) + 1.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) / 2.0);
PV1iw = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
PS1i = floatBitsToInt(cos((intBitsToFloat(PV0iz))/0.1591549367));
// 20
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) + 1.0);
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockVS7[14].x, intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockVS7[14].y, intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(intBitsToFloat(R11i.y) * intBitsToFloat(R5i.w));
PS0i = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
// 21
PV1ix = floatBitsToInt(-(intBitsToFloat(PV0iy)) + 1.0);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(PS0i)));
R126i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[14].y, intBitsToFloat(PV0ix)));
R127i.w = floatBitsToInt(-(intBitsToFloat(PV0iz)) + 1.0);
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R127i.x)));
// 22
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV1ix),intBitsToFloat(R125i.x),intBitsToFloat(R126i.y),0.0)));
PV0ix = tempi.x;
R7i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.z = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(PS1i));
// 23
PV1ix = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R2i.y = floatBitsToInt(intBitsToFloat(R0i.z) + -(uf_blockVS7[96].w));
PV1iz = floatBitsToInt(max(intBitsToFloat(R127i.w), -(intBitsToFloat(R127i.w))));
R127i.w = floatBitsToInt(-(uf_blockVS7[96].w) + uf_blockVS7[97].w);
R2i.z = floatBitsToInt(intBitsToFloat(R0i.z) + -(uf_blockVS7[97].w));
// 24
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV1ix),intBitsToFloat(R124i.y),intBitsToFloat(PV1iz),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R2i.w = tempi.x;
R0i.y = floatBitsToInt(-(uf_blockVS7[96].x) + uf_blockVS7[97].x);
// 25
R2i.x = ((intBitsToFloat(R2i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R3i.y = ((intBitsToFloat(R2i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R0i.w = floatBitsToInt(-(uf_blockVS7[96].y) + uf_blockVS7[97].y);
R0i.x = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
}
if( activeMaskStackC[3] == true ) {
// 0
R124i.x = floatBitsToInt(-(uf_blockVS7[97].x) + uf_blockVS7[98].x);
PV0iy = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(R0i.x));
R127i.z = floatBitsToInt(-(uf_blockVS7[97].y) + uf_blockVS7[98].y);
PV0iw = floatBitsToInt(intBitsToFloat(R0i.w) * intBitsToFloat(R0i.x));
PS0i = floatBitsToInt(-(intBitsToFloat(R2i.x)) + 1.0);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV0iw)));
R124i.y = floatBitsToInt(intBitsToFloat(R0i.z) + -(uf_blockVS7[98].w));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(-(uf_blockVS7[97].w) + uf_blockVS7[98].w);
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(PS0i)));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R0i.z) + -(uf_blockVS7[99].w));
R127i.y = floatBitsToInt(uf_blockVS7[96].x + intBitsToFloat(PV1iz));
R126i.z = ((intBitsToFloat(R124i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.w = floatBitsToInt(uf_blockVS7[96].y + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(R124i.x) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS0i));
R127i.z = floatBitsToInt(-(uf_blockVS7[98].x) + uf_blockVS7[99].x);
R127i.w = floatBitsToInt(-(uf_blockVS7[98].y) + uf_blockVS7[99].y);
R125i.y = ((intBitsToFloat(PV0ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 4
R124i.x = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
PV0iy = floatBitsToInt(-(uf_blockVS7[98].w) + uf_blockVS7[99].w);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
// 5
PV1ix = floatBitsToInt(uf_blockVS7[97].x + intBitsToFloat(PV0iw));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PS0i)));
R125i.z = floatBitsToInt(uf_blockVS7[97].y + intBitsToFloat(PV0iz));
R124i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[99].x, intBitsToFloat(R125i.y)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
R125i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[99].y, intBitsToFloat(R125i.y)));
PV0iz = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS1i));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R124i.x)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R126i.y)));
// 7
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R2i.y)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PV0iz)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R126i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PV0ix)));
R4i.w = 0x3f800000;
// 8
PV0ix = floatBitsToInt(uf_blockVS7[98].y + intBitsToFloat(PV1iw));
PV0iy = floatBitsToInt(-(intBitsToFloat(R3i.y)) + 1.0);
PV0iz = floatBitsToInt(uf_blockVS7[98].x + intBitsToFloat(PV1iy));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R2i.y)));
R127i.y = floatBitsToInt(uf_blockVS7[13].x);
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) / 2.0);
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].y, intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].x, intBitsToFloat(PV0iy)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R127i.w)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(R127i.w)));
PS1i = floatBitsToInt(uf_blockVS7[13].y);
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R124i.x) + intBitsToFloat(PV1ix));
R2i.y = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(R127i.y));
PV0iz = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV1iy));
R0i.w = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PS1i));
R0i.z = floatBitsToInt(intBitsToFloat(R4i.z) * 1.0);
// 11
backupReg0i = R125i.z;
PV1ix = (R1i.w == int(1))?-1:0;
PV1iy = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(PV0iz));
R125i.z = (R1i.w == 0x2)?-1:0;
PV1iw = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV0ix));
R126i.z = (R1i.w == 0x3)?-1:0;
// 12
PV0ix = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1iw));
R123i.y = ((PV1ix == 0)?(0xbf800000):(0xbf800000));
PV0iz = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1iy));
R123i.w = ((PV1ix == 0)?(0x3f800000):(0xbf800000));
R3i.w = 0x3f800000;
// 13
R123i.x = ((R125i.z == 0)?(R123i.y):(0x3f800000));
PV1iy = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(PV0iz));
R123i.z = ((R125i.z == 0)?(R123i.w):(0xbf800000));
PV1iw = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(PV0ix));
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(PV1iw)));
R6i.y = ((R126i.z == 0)?(R123i.x):(0x3f800000));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PV1iy)));
R1i.w = ((R126i.z == 0)?(R123i.z):(0x3f800000));
// 15
R2i.x = 0x3f800000;
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PV0iz)));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PV0ix)));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), uf_blockVS8[3].z));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), uf_blockVS8[3].y));
// 1
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(R2i.y)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R0i.w)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),uf_blockVS11[0].x) + 0.0);
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),uf_blockVS11[0].x) + 0.0);
// 2
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R4i.w)),vec4(uf_blockVS8[4].x,uf_blockVS8[4].y,uf_blockVS8[4].z,uf_blockVS8[4].w)));
PV0iy = R0i.x;
PV0iz = R0i.x;
PV0iw = R0i.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R4i.w)),vec4(uf_blockVS8[5].x,uf_blockVS8[5].y,uf_blockVS8[5].z,uf_blockVS8[5].w)));
PV1ix = tempi.x;
R6i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R4i.w)),vec4(uf_blockVS8[6].x,uf_blockVS8[6].y,uf_blockVS8[6].z,uf_blockVS8[6].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R1i.z = tempi.x;
PV0iw = tempi.x;
}
if( activeMaskStackC[3] == true ) {
// 0
R124i.x = floatBitsToInt(uf_blockVS6[12].x);
R125i.y = floatBitsToInt(uf_blockVS6[13].y);
R126i.z = floatBitsToInt(uf_blockVS6[12].y);
R127i.w = floatBitsToInt(uf_blockVS6[13].x);
// 1
PV1ix = floatBitsToInt(uf_blockVS6[12].z * 1.0);
R127i.y = floatBitsToInt(uf_blockVS6[14].x);
R125i.z = 0x3f800000;
R124i.w = floatBitsToInt(uf_blockVS6[14].y);
// 2
PV0ix = floatBitsToInt(uf_blockVS6[14].z * 1.0);
PV0iz = floatBitsToInt(uf_blockVS6[13].z * 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R126i.z)) + intBitsToFloat(PV1ix));
// 3
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R124i.x)) + intBitsToFloat(R123i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R125i.y)) + intBitsToFloat(PV0iz));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R124i.w)) + intBitsToFloat(PV0ix));
R124i.w = floatBitsToInt(intBitsToFloat(R0i.x) + -(uf_blockVS6[17].x));
R125i.y = floatBitsToInt(intBitsToFloat(R6i.y) + -(uf_blockVS6[17].y));
// 4
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R127i.y)) + intBitsToFloat(R123i.z));
PV0iz = floatBitsToInt(intBitsToFloat(R1i.z) + -(uf_blockVS6[17].z));
R9i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.y));
R126i.z = floatBitsToInt(1.0 / uf_blockVS7[116].x);
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.w),intBitsToFloat(R125i.y),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.w),intBitsToFloat(R125i.y),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R2i.y),intBitsToFloat(R0i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS6[12].x,uf_blockVS6[12].y,uf_blockVS6[12].z,uf_blockVS6[12].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.y = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R2i.y),intBitsToFloat(R0i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS6[13].x,uf_blockVS6[13].y,uf_blockVS6[13].z,uf_blockVS6[13].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R124i.w = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV0ix));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R2i.y),intBitsToFloat(R0i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS6[14].x,uf_blockVS6[14].y,uf_blockVS6[14].z,uf_blockVS6[14].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(PV1ix));
// 9
backupReg0i = R125i.y;
PV1ix = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0ix));
R125i.y = floatBitsToInt(-(intBitsToFloat(R0i.x)) + intBitsToFloat(R124i.w));
PV1iz = floatBitsToInt(min(intBitsToFloat(backupReg0i), uf_blockVS7[116].x));
R124i.w = floatBitsToInt(-(intBitsToFloat(R6i.y)) + intBitsToFloat(PS0i));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(R126i.z));
PV0iz = floatBitsToInt(-(intBitsToFloat(R1i.z)) + intBitsToFloat(PV1ix));
// 11
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(PV0ix)));
// 12
R1i.x = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV1iy));
R1i.y = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(PV1iw));
R6i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV1iz));
// 13
R7i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R6i.z),intBitsToFloat(R2i.x)),vec4(uf_blockVS6[8].x,uf_blockVS6[8].y,uf_blockVS6[8].z,uf_blockVS6[8].w)));
PV1iy = R7i.x;
PV1iz = R7i.x;
PV1iw = R7i.x;
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R6i.z),intBitsToFloat(R2i.x)),vec4(uf_blockVS6[9].x,uf_blockVS6[9].y,uf_blockVS6[9].z,uf_blockVS6[9].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R6i.w = tempi.x;
PS0i = ((intBitsToFloat(R5i.x) > 0.5)?-1:0);
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R6i.z),intBitsToFloat(R2i.x)),vec4(uf_blockVS6[10].x,uf_blockVS6[10].y,uf_blockVS6[10].z,uf_blockVS6[10].w)));
PV1ix = tempi.x;
R0i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R3i.w = floatBitsToInt(((PS0i == 0)?(intBitsToFloat(R4i.x)):(-(intBitsToFloat(R4i.x)))));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R6i.z),intBitsToFloat(R2i.x)),vec4(uf_blockVS6[11].x,uf_blockVS6[11].y,uf_blockVS6[11].z,uf_blockVS6[11].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R9i.z = tempi.x;
PV0iw = tempi.x;
PS0i = ((intBitsToFloat(R5i.y) > 0.5)?-1:0);
// 17
PV1ix = PV0ix;
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) / 2.0);
R123i.y = floatBitsToInt(intBitsToFloat(R0i.y) * 0.0 + intBitsToFloat(PV0ix));
R0i.z = floatBitsToInt(((PS0i == 0)?(intBitsToFloat(R4i.y)):(-(intBitsToFloat(R4i.y)))));
// 18
backupReg0i = R123i.y;
R123i.y = floatBitsToInt(intBitsToFloat(R0i.y) * 0.5 + intBitsToFloat(PV1ix));
R123i.w = floatBitsToInt(intBitsToFloat(R0i.y) * 0.0 + intBitsToFloat(PV1ix));
R2i.w = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 19
PV1iy = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(R2i.w));
R5i.z = floatBitsToInt(intBitsToFloat(R6i.w) * -(0.5) + intBitsToFloat(R123i.w));
// 20
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),uf_blockVS6[18].w) + -(uf_blockVS6[18].y));
// 21
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R6i.y),intBitsToFloat(R1i.z),intBitsToFloat(R125i.z)),vec4(uf_blockVS6[10].x,uf_blockVS6[10].y,uf_blockVS6[10].z,uf_blockVS6[10].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R124i.w = tempi.x;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.z));
// 22
R7i.y = floatBitsToInt(-(uf_blockVS6[18].z) * intBitsToFloat(PS1i));
// 23
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R6i.y),intBitsToFloat(R1i.z),intBitsToFloat(R125i.z)),vec4(uf_blockVS6[11].x,uf_blockVS6[11].y,uf_blockVS6[11].z,uf_blockVS6[11].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 24
PV0ix = PV1ix;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
R123i.w = floatBitsToInt(intBitsToFloat(R124i.w) * 0.0 + intBitsToFloat(PV1ix));
// 25
R123i.y = floatBitsToInt(intBitsToFloat(R124i.w) * 0.5 + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.w));
// 26
PV0ix = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(PS1i));
// 27
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockVS6[18].w, intBitsToFloat(PV0ix)));
// 28
PV0iw = floatBitsToInt(-(uf_blockVS6[18].y) + intBitsToFloat(PV1iy));
// 29
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 30
R2i.x = floatBitsToInt(-(uf_blockVS6[18].z) * intBitsToFloat(PS1i));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iy = floatBitsToInt(uf_blockVS7[60].x);
R125i.z = floatBitsToInt(uf_blockVS7[60].z);
PV0iw = floatBitsToInt(uf_blockVS7[60].y);
// 1
PV1ix = floatBitsToInt(uf_blockVS7[68].x);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), uf_blockVS8[0].x));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), uf_blockVS8[0].y));
// 2
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), uf_blockVS8[0].w));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), uf_blockVS7[59].x));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), uf_blockVS8[0].z));
R8i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), uf_blockVS7[59].x));
// 3
PV1ix = floatBitsToInt(uf_blockVS7[76].x);
PV1iy = floatBitsToInt(uf_blockVS7[76].y);
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), uf_blockVS7[59].x));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), uf_blockVS8[1].x));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), uf_blockVS8[1].y));
PV0iw = floatBitsToInt(uf_blockVS7[76].z);
// 5
R9i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(PV0ix)));
R10i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), uf_blockVS8[1].z));
// 6
R10i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(PV1iw)));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(uf_blockVS7[5].x) & 0x80000;
PV0iy = floatBitsToInt(uf_blockVS7[5].x) & 0x100000;
R1i.z = floatBitsToInt(uf_blockVS7[84].x);
R124i.w = floatBitsToInt(uf_blockVS7[5].x) & 0x10;
R125i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x20;
// 1
PV1ix = (PV0ix == 0x80000)?-1:0;
PV1iy = (PV0iy == 0x100000)?-1:0;
R126i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x40;
R127i.w = floatBitsToInt(uf_blockVS7[5].x) & 0x80;
R2i.y = int(uf_blockVS7[17].x);
// 2
R6i.x = ((PV1iy == 0)?(R4i.y):(R0i.z));
R2i.z = ((PV1ix == 0)?(R4i.x):(R3i.w));
R125i.w = int(uf_blockVS7[17].y);
// 3
PS1i = floatBitsToInt(float(R124i.w));
// 4
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PS0i = floatBitsToInt(float(R125i.z));
// 5
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PS1i = floatBitsToInt(float(R126i.z));
// 6
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R124i.x = int(intBitsToFloat(PV1iz));
// 7
PV1iy = 0 - R124i.x;
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iw)));
R125i.x = int(intBitsToFloat(PV0iz));
// 8
PV0iy = 0 - R125i.x;
R124i.w = max(R124i.x, PV1iy);
R124i.x = int(intBitsToFloat(PV1iz));
// 9
PV1iy = 0 - R124i.x;
R1i.w = max(R125i.x, PV0iy);
PS1i = floatBitsToInt(float(R127i.w));
// 10
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R0i.w = max(R124i.x, PV1iy);
R0i.z = floatBitsToInt(float(R2i.y));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(R0i.z)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
R126i.z = floatBitsToInt(float(R125i.w));
// 12
PV0iy = floatBitsToInt(intBitsToFloat(R5i.w) * intBitsToFloat(PV1ix));
R124i.x = int(intBitsToFloat(PV1iz));
// 13
PV1iy = 0 - R124i.x;
PS1i = int(intBitsToFloat(PV0iy));
// 14
R3i.w = max(R124i.x, PV1iy);
R4i.z = R124i.w * PS1i;
// 15
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.z));
// 16
PV0iy = floatBitsToInt(intBitsToFloat(R11i.y) * intBitsToFloat(PS1i));
// 17
R4i.w = int(intBitsToFloat(PV0iy));
// 18
PS0i = floatBitsToInt(float(R4i.w));
// 19
PV1ix = floatBitsToInt(-(intBitsToFloat(R0i.z)) + intBitsToFloat(PS0i));
// 20
R123i.y = ((intBitsToFloat(PV1ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 21
R5i.w = int(intBitsToFloat(R123i.y));
}
if( activeMaskStackC[3] == true ) {
// 0
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), uf_blockVS8[1].w));
// 1
R124i.x = int(1) - R5i.w;
R125i.y = floatBitsToInt(uf_blockVS7[5].x) & 0x2000000;
R126i.z = int(-1) + R2i.y;
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R0i.z)));
R127i.x = floatBitsToInt(float(R2i.y));
// 2
R124i.y = floatBitsToInt(abs(intBitsToFloat(R127i.x)));
R126i.y = floatBitsToInt(float(R4i.w));
// 3
R124i.w = floatBitsToInt(abs(intBitsToFloat(R126i.y)));
R126i.w = floatBitsToInt(1.0 / abs(intBitsToFloat(R127i.x)));
// 4
PV0iz = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R126i.y)), intBitsToFloat(R126i.w)));
R127i.w = R5i.w * R126i.z;
// 5
PV1ix = floatBitsToInt(trunc(intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(float(R125i.y));
// 6
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(R124i.y)) + intBitsToFloat(R124i.w));
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R127i.y = int(intBitsToFloat(R125i.w));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0ix)));
PV1iy = floatBitsToInt(-(abs(intBitsToFloat(R127i.x))) + intBitsToFloat(R126i.z));
PV1iz = floatBitsToInt((intBitsToFloat(R126i.z) >= abs(intBitsToFloat(R127i.x)))?1.0:0.0);
R125i.x = R3i.w * R127i.y;
// 8
R125i.w = ((intBitsToFloat(PV1iz) == 0.0)?(R126i.z):(PV1iy));
R125i.y = int(intBitsToFloat(PV1ix));
// 9
PV1iz = floatBitsToInt(abs(intBitsToFloat(R127i.x)) + intBitsToFloat(R125i.w));
PV1iw = 0 - R125i.y;
// 10
R123i.x = ((-(intBitsToFloat(R125i.w)) > 0.0)?(PV1iz):(R125i.w));
PV0iz = max(R125i.y, PV1iw);
// 11
R123i.y = ((-(intBitsToFloat(R126i.y)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.x)))):(R123i.x));
PS1i = PV0iz * R127i.y;
// 12
PV0iz = R4i.w + PS1i;
R125i.w = ((intBitsToFloat(R127i.x) == 0.0)?(R126i.y):(R123i.y));
// 13
R126i.y = R0i.w * PV0iz;
// 14
PS0i = int(intBitsToFloat(R125i.w));
// 15
PS1i = R124i.x * PS0i;
// 16
PV0iz = PS1i + R127i.w;
// 17
PS1i = R1i.w * PV0iz;
// 18
PV0ix = PS1i + R4i.z;
// 19
PV1iy = R126i.y + PV0ix;
// 20
PV0iw = R125i.x + PV1iy;
// 21
R125i.z = floatBitsToInt(float(PV0iw));
// 22
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), abs(intBitsToFloat(R125i.z))));
R126i.w = floatBitsToInt(abs(intBitsToFloat(R125i.z)));
// 23
PV1iy = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
// 24
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iy)),intBitsToFloat(R124i.y)) + intBitsToFloat(R126i.w));
// 25
PV1ix = floatBitsToInt(-(abs(intBitsToFloat(R127i.x))) + intBitsToFloat(R126i.z));
PV1iy = floatBitsToInt((intBitsToFloat(R126i.z) >= abs(intBitsToFloat(R127i.x)))?1.0:0.0);
// 26
R126i.w = ((intBitsToFloat(PV1iy) == 0.0)?(R126i.z):(PV1ix));
// 27
PV1iz = floatBitsToInt(abs(intBitsToFloat(R127i.x)) + intBitsToFloat(R126i.w));
// 28
R123i.x = ((-(intBitsToFloat(R126i.w)) > 0.0)?(PV1iz):(R126i.w));
// 29
R123i.y = ((-(intBitsToFloat(R125i.z)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.x)))):(R123i.x));
// 30
R123i.w = ((intBitsToFloat(R127i.x) == 0.0)?(R125i.z):(R123i.y));
// 31
R125i.z = int(intBitsToFloat(R123i.w));
// 32
R127i.x = floatBitsToInt(float(R125i.z));
// 33
PV1iy = floatBitsToInt((intBitsToFloat(R127i.x) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(R127i.x))?1.0:0.0);
R126i.y = floatBitsToInt(float(R125i.z));
// 34
R125i.x = floatBitsToInt(abs(intBitsToFloat(R126i.y)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(abs(intBitsToFloat(R126i.y)) * 0.25);
// 35
R123i.x = floatBitsToInt(intBitsToFloat(PV0iz) * 0.5 + intBitsToFloat(R127i.x));
PV1iz = floatBitsToInt(trunc(intBitsToFloat(PV0iw)));
// 36
PV0ix = floatBitsToInt(intBitsToFloat(R123i.x) * 0.25);
R124i.y = floatBitsToInt(-(intBitsToFloat(PV1iz)) * 4.0 + intBitsToFloat(R125i.x));
// 37
PV1ix = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt((intBitsToFloat(R124i.y) >= 4.0)?1.0:0.0);
PV1iw = floatBitsToInt(intBitsToFloat(R124i.y) + -4.0);
// 38
R125i.x = ((intBitsToFloat(PV1iz) == 0.0)?(R124i.y):(PV1iw));
PS0i = int(intBitsToFloat(PV1ix));
// 39
R4i.x = PS0i + 0x12;
PV1iy = floatBitsToInt(intBitsToFloat(R125i.x) + 4.0);
// 40
R123i.w = ((-(intBitsToFloat(R125i.x)) > 0.0)?(PV1iy):(R125i.x));
// 41
R123i.z = ((-(intBitsToFloat(R126i.y)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.w)))):(R123i.w));
// 42
PS0i = int(intBitsToFloat(R123i.z));
// 43
PV1iy = int(-1) + PS0i;
R125i.z = 0xfffffffd + PS0i;
R126i.w = 0xfffffffe + PS0i;
PS1i = floatBitsToInt(float(PS0i));
// 44
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(PV1iy));
// 45
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(float(R126i.w));
// 46
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iy)));
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R126i.y = int(intBitsToFloat(PV1ix));
// 47
PV1ix = 0 - R126i.y;
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iz)));
R126i.w = int(intBitsToFloat(PV0iy));
// 48
PV0ix = 0 - R126i.w;
PV0iz = max(R126i.y, PV1ix);
R126i.z = int(intBitsToFloat(PV1iw));
// 49
PV1ix = max(R126i.w, PV0ix);
R4i.y = int(1) - PV0iz;
PV1iz = 0 - R126i.z;
PS1i = floatBitsToInt(float(R125i.z));
// 50
R0i.x = int(1) - PV1ix;
R2i.y = max(R126i.z, PV1iz);
R4i.z = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R1i.w = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
}
if( activeMaskStackC[3] == true ) {
R3i.xyzw = floatBitsToInt(uf_blockVS7[R4i.x].xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(uf_blockVS7[44].z + uf_blockVS7[45].x);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), uf_blockVS7[45].x));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
R126i.z = floatBitsToInt(intBitsToFloat(R4i.z) + -(intBitsToFloat(R1i.w)));
PV0iw = int(1) - R2i.y;
R126i.w = R0i.x * R3i.y;
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), uf_blockVS7[45].y));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
PV1iy = floatBitsToInt(uf_blockVS7[44].w + uf_blockVS7[45].y);
R125i.z = floatBitsToInt(-(intBitsToFloat(PV0iy)) + intBitsToFloat(PV0ix));
R126i.y = PV0iw * R3i.z;
// 2
PV0iy = floatBitsToInt(uf_blockVS7[46].y + uf_blockVS7[46].w);
PV0iz = floatBitsToInt(uf_blockVS7[46].x + uf_blockVS7[46].z);
R127i.w = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(PV1iy));
PS0i = R4i.y * R3i.x;
// 3
PV1ix = R126i.w + PS0i;
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),uf_blockVS7[46].z) + intBitsToFloat(PV0iz));
R124i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R11i.y)),uf_blockVS7[44].x) + -(intBitsToFloat(R125i.z)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),uf_blockVS7[46].w) + intBitsToFloat(PV0iy));
R125i.x = int(intBitsToFloat(R126i.z));
// 4
PV0ix = 0 - R125i.x;
R126i.y = R126i.y + PV1ix;
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y),uf_blockVS7[44].y) + intBitsToFloat(R127i.w));
PS0i = int(uf_blockVS7[48].z);
// 5
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y),uf_blockVS7[45].w) + intBitsToFloat(R126i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y),uf_blockVS7[45].z) + intBitsToFloat(R124i.y));
PV1iw = max(backupReg0i, PV0ix);
R126i.x = floatBitsToInt(float(PS0i));
// 6
R0i.x = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
PV0iz = int(1) - PV1iw;
R127i.w = floatBitsToInt(abs(intBitsToFloat(R126i.x)));
R126i.z = floatBitsToInt(1.0 / abs(intBitsToFloat(R126i.x)));
// 7
R5i.x = floatBitsToInt(intBitsToFloat(R2i.z) + 0.5);
PS1i = PV0iz * R3i.w;
// 8
R3i.x = floatBitsToInt(-(intBitsToFloat(R125i.x)) + 1.0);
R127i.z = floatBitsToInt(intBitsToFloat(R6i.x) + -(0.5));
R126i.w = PS1i + R126i.y;
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 9
R125i.x = floatBitsToInt(intBitsToFloat(R2i.x) + -(uf_blockVS7[93].x));
R125i.y = floatBitsToInt(-(uf_blockVS7[93].x) + uf_blockVS7[93].y);
R4i.z = 0;
R125i.w = floatBitsToInt(intBitsToFloat(R2i.x) + -(uf_blockVS7[93].z));
R126i.y = floatBitsToInt(float(R126i.w));
// 10
R127i.x = floatBitsToInt(-(uf_blockVS7[93].z) + uf_blockVS7[93].w);
PV0iy = floatBitsToInt((intBitsToFloat(R126i.y) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(R126i.y))?1.0:0.0);
R126i.w = floatBitsToInt(float(R126i.w));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R126i.w)), intBitsToFloat(R126i.z)));
R124i.y = floatBitsToInt(abs(intBitsToFloat(R126i.w)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iw)));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[48].z);
// 12
R123i.x = floatBitsToInt(intBitsToFloat(PV1iz) * 0.5 + intBitsToFloat(R126i.y));
PV0iy = floatBitsToInt(trunc(intBitsToFloat(PV1ix)));
R124i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].x, intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[48].w);
// 13
backupReg0i = R127i.y;
R124i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iy)),intBitsToFloat(R127i.w)) + intBitsToFloat(R124i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].y, intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(backupReg0i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R125i.y));
// 14
PV0ix = floatBitsToInt(trunc(intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(-(abs(intBitsToFloat(R126i.x))) + intBitsToFloat(R124i.x));
R3i.z = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(PS1i));
R3i.z = clampFI32(R3i.z);
PV0iw = floatBitsToInt((intBitsToFloat(R124i.x) >= abs(intBitsToFloat(R126i.x)))?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 15
PV1ix = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(PS0i));
PV1ix = clampFI32(PV1ix);
R2i.y = floatBitsToInt(uf_blockVS7[104].x);
R126i.z = ((intBitsToFloat(PV0iw) == 0.0)?(R124i.x):(PV0iy));
R3i.w = 0;
PS1i = int(intBitsToFloat(PV0ix));
// 16
PV0ix = floatBitsToInt(abs(intBitsToFloat(R126i.x)) + intBitsToFloat(R126i.z));
R3i.y = floatBitsToInt(-(intBitsToFloat(PV1ix)) + 1.0);
PS0i = floatBitsToInt(float(PS1i));
// 17
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)),intBitsToFloat(PS0i)) + intBitsToFloat(R125i.z));
R123i.y = ((-(intBitsToFloat(R126i.z)) > 0.0)?(PV0ix):(R126i.z));
// 18
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)),intBitsToFloat(R127i.z)) + -(intBitsToFloat(R123i.x)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R3i.y)));
R123i.w = ((-(intBitsToFloat(R126i.w)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.y)))):(R123i.y));
// 19
R123i.z = ((intBitsToFloat(R126i.x) == 0.0)?(R126i.w):(R123i.w));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R3i.x)) + intBitsToFloat(R123i.x));
// 20
PS0i = int(intBitsToFloat(R123i.z));
// 21
PS1i = floatBitsToInt(float(PS0i));
// 22
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(PS1i)) + intBitsToFloat(R124i.z));
// 23
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(R5i.x)) + intBitsToFloat(R123i.y));
// 24
R4i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.z)),intBitsToFloat(R0i.x)) + intBitsToFloat(R123i.y));
// 25
PV1iy = floatBitsToInt(intBitsToFloat(R5i.z) * intBitsToFloat(R2i.w));
// 26
PV0iz = floatBitsToInt(-(intBitsToFloat(PV1iy)) + 1.0);
// 27
R0i.x = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3f333333) + intBitsToFloat(0x3e19999a));
R0i.x = clampFI32(R0i.x);
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(uf_blockVS6[17].x + -(intBitsToFloat(R1i.x)));
PV0iy = floatBitsToInt(min(uf_blockVS6[17].y, uf_blockVS13[27].z));
R124i.z = floatBitsToInt(uf_blockVS6[17].y + -(intBitsToFloat(R1i.y)));
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(R6i.y)) + intBitsToFloat(PV0iy));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),uf_blockVS13[24].x) + -(uf_blockVS13[24].y));
R123i.y = clampFI32(R123i.y);
R127i.z = floatBitsToInt(uf_blockVS6[17].z + -(intBitsToFloat(R6i.z)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R0i.x)) + 1.0);
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R127i.y = floatBitsToInt(intBitsToFloat(PV1iw) + 8.5);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),uf_blockVS13[22].x) + -(uf_blockVS13[22].y));
R123i.z = clampFI32(R123i.z);
R123i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS13[27].y,intBitsToFloat(PV1ix)) + uf_blockVS13[27].x);
R123i.w = clampFI32(R123i.w);
PS0i = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(R127i.z));
// 3
R123i.x = floatBitsToInt((intBitsToFloat(R124i.z) * intBitsToFloat(R124i.z) + intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), uf_blockVS13[26].w));
PV1iw = floatBitsToInt(uf_blockVS13[28].y + 1.0);
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) * 1.5);
PV0ix = clampFI32(PV0ix);
R125i.y = floatBitsToInt(uf_blockVS13[28].y * 1.0 + intBitsToFloat(R7i.y));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockVS13[24].w, intBitsToFloat(PS1i)));
R124i.w = floatBitsToInt((intBitsToFloat(R126i.x) * intBitsToFloat(R126i.x) + intBitsToFloat(R123i.x)));
tempResultf = max(0.0, intBitsToFloat(PV1iy));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 5
backupReg0i = R127i.y;
R124i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS13[23].x, intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(intBitsToFloat(PV0ix) * 15.0);
R7i.z = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3daaaaab));
R126i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS13[23].y, intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
// 6
R0i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)),uf_blockVS13[25].w) + uf_blockVS13[25].w);
R7i.y = 0;
PV0iz = ((0.0 >= intBitsToFloat(R3i.y))?-1:0);
PV0iw = ((0.0 >= intBitsToFloat(R3i.z))?-1:0);
tempResultf = 1.0 / sqrt(intBitsToFloat(R124i.w));
PS0i = floatBitsToInt(tempResultf);
// 7
R1i.x = ((PV0iz == 0)?(PV0iw):(int(-1)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(exp2(intBitsToFloat(R126i.w)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(PV1iy),intBitsToFloat(PV1iz),intBitsToFloat(PV1iw),intBitsToFloat(0x80000000)),vec4(uf_blockVS13[28].x,uf_blockVS13[28].y,uf_blockVS13[28].z,0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R3i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
// 9
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
R6i.y = 0;
R5i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R0i.w = 0;
PS1i = floatBitsToInt(exp2(intBitsToFloat(backupReg0i)));
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(-(uf_blockVS13[23].z),intBitsToFloat(PS1i)) + uf_blockVS13[23].z);
R123i.x = clampFI32(R123i.x);
R123i.y = floatBitsToInt(intBitsToFloat(R124i.x) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
R2i.z = ((R1i.x == 0)?(R7i.x):(R6i.y));
PV0iw = floatBitsToInt(-(intBitsToFloat(R124i.x)) + 1.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 11
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R123i.y)) + intBitsToFloat(0xbe593484));
PV1iy = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(0x80000000));
PV1iy = clampFI32(PV1iy);
R0i.z = ((R1i.x == 0)?(R6i.w):(R0i.w));
PV1iw = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0iw)));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3f22f983));
PV0iy = floatBitsToInt(max(intBitsToFloat(PV1iw), intBitsToFloat(0x3e4ccccd)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R123i.x)) + intBitsToFloat(0x3fc90da4));
R6i.w = PV1iy;
R2i.w = PV1iy;
// 13
backupReg0i = R0i.y;
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),-(intBitsToFloat(R123i.z))) + 1.0);
R0i.y = floatBitsToInt(min(intBitsToFloat(PV0iy), 1.0));
R10i.z = ((R1i.x == 0)?(backupReg0i):(R5i.z));
R4i.w = R9i.z;
R2i.x = 0;
}
if( activeMaskStackC[3] == true ) {
R3i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y))).xyz);
R7i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R7i.z),intBitsToFloat(R7i.y))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R3i.x;
R3i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS8[3].x,intBitsToFloat(R5i.y)) + 0.0);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R0i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R0i.y)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R0i.y)));
R4i.x = R10i.x;
// 1
R126i.x = R2i.y;
R0i.y = R9i.w;
R3i.z = R9i.y;
R124i.w = ((R1i.x == 0)?(R3i.x):(R2i.x));
R127i.y = R13i.z;
// 2
R3i.x = ((R1i.x == 0)?(0):(0x3f800000));
R123i.y = ((R1i.x == 0)?(0):(R6i.w));
R123i.z = ((R1i.x == 0)?(0):(R6i.z));
R123i.w = ((R1i.x == 0)?(0):(R0i.x));
R122i.x = ((R1i.x == 0)?(0):(R3i.w));
// 3
R14i.x = ((R3i.x == 0)?(R0i.x):(R123i.w));
R14i.y = ((R3i.x == 0)?(R6i.z):(R123i.z));
R14i.z = ((R3i.x == 0)?(R6i.w):(R123i.y));
R14i.w = ((R3i.x == 0)?(R3i.w):(R122i.x));
R122i.x = ((R1i.x == 0)?(0):(R127i.z));
// 4
R15i.x = ((R3i.x == 0)?(R127i.z):(R122i.x));
R123i.y = ((R1i.x == 0)?(0):(R125i.y));
R123i.z = ((R1i.x == 0)?(0):(R126i.w));
R123i.w = ((R1i.x == 0)?(0):(R2i.w));
R127i.z = ((R1i.x == 0)?(0):(R7i.y));
// 5
R124i.x = ((R1i.x == 0)?(0):(R7i.z));
R15i.y = ((R3i.x == 0)?(R126i.w):(R123i.z));
R15i.z = ((R3i.x == 0)?(R125i.y):(R123i.y));
R15i.w = ((R3i.x == 0)?(R2i.w):(R123i.w));
R124i.z = ((R1i.x == 0)?(0):(R0i.y));
// 6
R123i.x = ((R1i.x == 0)?(0):(R7i.w));
R125i.y = ((R1i.x == 0)?(0):(R3i.z));
R123i.z = ((R1i.x == 0)?(0):(R4i.y));
R123i.w = ((R1i.x == 0)?(0):(R7i.x));
R0i.x = ((R1i.x == 0)?(0):(R4i.w));
// 7
R16i.x = ((R3i.x == 0)?(R7i.x):(R123i.w));
R16i.y = ((R3i.x == 0)?(R7i.y):(R127i.z));
R16i.z = ((R3i.x == 0)?(R7i.z):(R124i.x));
R16i.w = ((R3i.x == 0)?(R7i.w):(R123i.x));
R17i.x = ((R3i.x == 0)?(R4i.y):(R123i.z));
// 8
R127i.x = ((R1i.x == 0)?(0):(R10i.w));
R123i.y = ((R1i.x == 0)?(0):(R4i.z));
R123i.z = ((R1i.x == 0)?(0):(R1i.w));
R127i.w = ((R1i.x == 0)?(0):(R4i.x));
R126i.w = ((R1i.x == 0)?(R13i.y):(R2i.y));
// 9
R124i.x = R13i.z;
R17i.y = ((R3i.x == 0)?(R1i.w):(R123i.z));
R17i.z = ((R3i.x == 0)?(R4i.z):(R123i.y));
R125i.w = ((R1i.x == 0)?(0):(R10i.y));
R122i.x = ((R1i.x == 0)?(0):(R8i.y));
// 10
R18i.x = ((R3i.x == 0)?(R8i.y):(R122i.x));
R123i.y = ((R1i.x == 0)?(0):(R8i.w));
R127i.z = ((R1i.x == 0)?(0):(R1i.z));
R123i.w = ((R1i.x == 0)?(0):(R8i.z));
R7i.x = ((R1i.x == 0)?(R12i.y):(R0i.w));
// 11
R123i.x = ((R1i.x == 0)?(0):(R8i.x));
R18i.y = ((R3i.x == 0)?(R8i.w):(R123i.y));
R18i.z = ((R3i.x == 0)?(R8i.z):(R123i.w));
R8i.w = ((R1i.x == 0)?(R12i.z):(R5i.z));
R125i.x = R9i.w;
// 12
backupReg0i = R8i.x;
R8i.x = R9i.y;
R126i.z = ((R1i.x == 0)?(R12i.w):(R9i.z));
R18i.w = ((R3i.x == 0)?(backupReg0i):(R123i.x));
// 13
R123i.x = ((R1i.x == 0)?(R13i.x):(R2i.x));
// 14
R13i.x = ((R3i.x == 0)?(R124i.w):(R123i.x));
R13i.y = ((R3i.x == 0)?(R126i.x):(R126i.w));
R13i.z = ((R3i.x == 0)?(R127i.y):(R124i.x));
// 15
R123i.y = ((R1i.x == 0)?(0):(R9i.x));
// 16
R9i.x = ((R3i.x == 0)?(R9i.x):(R123i.y));
R9i.y = ((R3i.x == 0)?(R10i.y):(R125i.w));
R9i.z = ((R3i.x == 0)?(R10i.w):(R127i.x));
R9i.w = ((R3i.x == 0)?(R1i.z):(R127i.z));
// 17
PV1ix = R10i.x;
R123i.y = ((R1i.x == 0)?(R12i.x):(R6i.y));
// 18
backupReg0i = R8i.x;
R8i.x = ((R3i.x == 0)?(PV1ix):(R127i.w));
R8i.y = ((R3i.x == 0)?(R125i.x):(R124i.z));
R8i.z = ((R3i.x == 0)?(backupReg0i):(R125i.y));
R12i.x = ((R3i.x == 0)?(R2i.z):(R123i.y));
// 19
R12i.y = ((R3i.x == 0)?(R0i.z):(R7i.x));
R12i.z = ((R3i.x == 0)?(R10i.z):(R8i.w));
R12i.w = ((R3i.x == 0)?(R4i.w):(R126i.z));
// 20
R8i.w = R0i.x;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R8i.x), intBitsToFloat(R8i.y), intBitsToFloat(R8i.z), intBitsToFloat(R8i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.z));
// export
passParameterSem8 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.z));
}
