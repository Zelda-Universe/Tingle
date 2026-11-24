#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader a29bf1c370bc52d4
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

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem3;
out vec4 passParameterSem5;
out vec4 passParameterSem8;
out vec4 passParameterSem11;
out vec4 passParameterSem12;
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
R26i.y = floatBitsToInt(-(intBitsToFloat(R5i.w)) + uf_blockVS8[2].x);
R0i.w = 0;
R2i.w = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R26i.y));
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
R16i.x = 0;
// 1
R3i.w = R2i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R3i.w = R0i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R3i.w == 0);
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
R11i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R26i.y) >= intBitsToFloat(R11i.z));
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
R16i.x = 0;
// 1
R0i.w = R2i.w;
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
PV0ix = floatBitsToInt(uf_blockVS7[5].x) & int(1);
R127i.y = floatBitsToInt(uf_blockVS7[5].x) & 0x4;
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), uf_blockVS7[15].x));
R127i.w = floatBitsToInt(uf_blockVS7[5].x) & 0x2;
R10i.z = int(intBitsToFloat(R6i.w));
// 1
R126i.x = floatBitsToInt(intBitsToFloat(R26i.y) + uf_blockVS7[15].z);
PV1iy = floatBitsToInt((0.0 > uf_blockVS7[9].x)?1.0:0.0);
PV1iz = floatBitsToInt((uf_blockVS7[9].x > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt(max(intBitsToFloat(R7i.x), 0.0));
PS1i = floatBitsToInt(float(PV0ix));
// 2
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R125i.y = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iy)));
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = floatBitsToInt(min(intBitsToFloat(PV1iw), 0.0));
PS0i = floatBitsToInt(float(R127i.w));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), uf_blockVS7[10].y));
R8i.x = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(PV0iw));
// 4
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iz)));
R127i.w = int(intBitsToFloat(PV1ix));
// 5
PV1iy = 0 - R127i.w;
R126i.y = int(intBitsToFloat(PV0iw));
// 6
backupReg0i = R127i.y;
PV0ix = 0 - R126i.y;
R127i.y = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
PV0iz = max(R127i.w, PV1iy);
PS0i = floatBitsToInt(float(backupReg0i));
// 7
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = max(R126i.y, PV0ix);
R124i.x = floatBitsToInt(float(PV0iz));
// 8
R125i.x = floatBitsToInt(-(uf_blockVS7[96].y) + uf_blockVS7[97].y);
R126i.y = floatBitsToInt(-(uf_blockVS7[96].x) + uf_blockVS7[97].x);
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iy)));
R124i.y = floatBitsToInt(float(PV1iz));
// 9
R127i.w = floatBitsToInt(-(uf_blockVS7[96].w) + uf_blockVS7[97].w);
R127i.x = int(intBitsToFloat(PV0iw));
// 10
PV0iy = 0 - R127i.x;
PS0i = floatBitsToInt(1.0 / uf_blockVS7[14].z);
// 11
PV1ix = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(PS0i));
PV1iw = max(R127i.x, PV0iy);
PS1i = floatBitsToInt(1.0 / uf_blockVS7[9].x);
// 12
R127i.x = floatBitsToInt(-(uf_blockVS7[97].x) + uf_blockVS7[98].x);
PV0iz = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1ix));
PV0iw = floatBitsToInt(intBitsToFloat(R26i.y) * intBitsToFloat(PS1i));
R127i.z = floatBitsToInt(float(PV1iw));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb));
PV1iy = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(fract(intBitsToFloat(PV0iz)));
R126i.w = floatBitsToInt(-(uf_blockVS7[97].y) + uf_blockVS7[98].y);
R11i.w = floatBitsToInt(1.0 / intBitsToFloat(R11i.z));
// 14
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + -(0.5));
R123i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iz = floatBitsToInt(fract(intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[14].x, intBitsToFloat(PV1iz)));
R18i.z = floatBitsToInt(intBitsToFloat(R26i.y) * intBitsToFloat(R11i.w));
// 15
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.z), intBitsToFloat(R127i.y)));
PV1iz = floatBitsToInt(-(intBitsToFloat(PV0iw)) + 1.0);
PV1iw = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R122i.x = ((intBitsToFloat(PV0ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 16
backupReg0i = R127i.w;
PV0ix = floatBitsToInt(-(intBitsToFloat(R122i.x)) + 1.0);
R127i.y = floatBitsToInt(max(intBitsToFloat(PV1iz), -(intBitsToFloat(PV1iz))));
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.w = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 17
backupReg0i = R126i.y;
PV1ix = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
R126i.y = floatBitsToInt(intBitsToFloat(R127i.w) + -(uf_blockVS7[96].w));
PV1iz = floatBitsToInt(mul_nonIEEE(uf_blockVS7[14].x, intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(PS0i));
// 18
R125i.x = floatBitsToInt(intBitsToFloat(R127i.w) + -(uf_blockVS7[97].w));
PV0iy = floatBitsToInt(-(intBitsToFloat(PV1iz)) + 1.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV1iw)));
PS0i = floatBitsToInt(cos((intBitsToFloat(PV1ix))/0.1591549367));
// 19
R9i.x = floatBitsToInt(uf_blockVS7[96].y + intBitsToFloat(PV0iz));
R11i.y = floatBitsToInt(uf_blockVS7[96].x + intBitsToFloat(PV0iw));
R126i.z = floatBitsToInt(max(intBitsToFloat(PV0iy), -(intBitsToFloat(PV0iy))));
PV1iw = floatBitsToInt(intBitsToFloat(PS0i) + 1.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) / 2.0);
R126i.x = floatBitsToInt(intBitsToFloat(R127i.w) + -(uf_blockVS7[98].w));
// 20
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockVS7[14].x, intBitsToFloat(PV1iw)));
// 21
PV1ix = floatBitsToInt(-(intBitsToFloat(PV0iz)) + 1.0);
PV1iy = floatBitsToInt(-(uf_blockVS7[97].w) + uf_blockVS7[98].w);
// 22
R10i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R124i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV1ix),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),0.0)));
PV0iy = R10i.x;
PV0iz = R10i.x;
PV0iw = R10i.x;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 23
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(uf_blockVS7[98].y) + uf_blockVS7[99].y);
PV1iy = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS0i));
PV1iz = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(PS0i));
R126i.w = floatBitsToInt(-(uf_blockVS7[98].x) + uf_blockVS7[99].x);
R8i.z = ((intBitsToFloat(R126i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 24
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PV1iz)));
PV0iy = floatBitsToInt(-(uf_blockVS7[98].w) + uf_blockVS7[99].w);
R4i.z = floatBitsToInt(intBitsToFloat(R127i.w) + -(uf_blockVS7[99].w));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PV1iy)));
R9i.y = ((intBitsToFloat(R125i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 25
R4i.x = ((intBitsToFloat(R126i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R10i.y = floatBitsToInt(uf_blockVS7[97].y + intBitsToFloat(PV0iw));
R5i.z = floatBitsToInt(uf_blockVS7[97].x + intBitsToFloat(PV0ix));
R2i.w = ((intBitsToFloat(R4i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 26
R5i.x = floatBitsToInt(-(uf_blockVS7[99].x) + uf_blockVS7[100].x);
R4i.y = floatBitsToInt(-(uf_blockVS7[99].y) + uf_blockVS7[100].y);
PV0iz = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(-(intBitsToFloat(R2i.w)) + 1.0);
// 27
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV0iz)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV0iw)));
R0i.z = floatBitsToInt(-(uf_blockVS7[99].w) + uf_blockVS7[100].w);
R0i.w = floatBitsToInt(intBitsToFloat(R127i.w) + -(uf_blockVS7[100].w));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PS0i)));
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(-(intBitsToFloat(R4i.x)) + 1.0);
R123i.y = ((intBitsToFloat(R0i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.z = floatBitsToInt(uf_blockVS7[98].y + intBitsToFloat(R0i.x));
R127i.w = floatBitsToInt(uf_blockVS7[98].x + intBitsToFloat(R0i.y));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R0i.z));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R5i.x) * intBitsToFloat(PS0i));
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[100].x, intBitsToFloat(R123i.y)));
R125i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[100].y, intBitsToFloat(R123i.y)));
PV1iw = floatBitsToInt(intBitsToFloat(R4i.y) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PV1iw)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PV1ix)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R5i.y)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R5i.y)));
// 3
PV1ix = floatBitsToInt(uf_blockVS7[99].x + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(R126i.x)));
PV1iz = floatBitsToInt(-(intBitsToFloat(R9i.y)) + 1.0);
PV1iw = floatBitsToInt(uf_blockVS7[99].y + intBitsToFloat(PV0ix));
R127i.z = floatBitsToInt(-(intBitsToFloat(R8i.z)) + 1.0);
// 4
backupReg0i = R126i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(backupReg0i)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PV1iy)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(PV1iy)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(backupReg0i)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(PV1iz)));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].x, intBitsToFloat(R127i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].y, intBitsToFloat(R127i.z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(PS0i)));
R5i.w = 0x3f800000;
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(R7i.z));
PV0iy = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(R7i.y));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(PV1iz));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PV1iy));
PS0i = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(R7i.z));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * 0.5);
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) * 0.5);
PS1i = floatBitsToInt(intBitsToFloat(PS0i) * 0.5);
// 8
R127i.x = floatBitsToInt(intBitsToFloat(PV1iz) + -(0.5));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
R126i.y = floatBitsToInt(intBitsToFloat(PV1iw) + -(0.5));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) * 2.0);
PV0iz = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV1ix));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1iy));
R124i.y = floatBitsToInt(intBitsToFloat(PS1i) + -(0.5));
R124i.y = floatBitsToInt(intBitsToFloat(R124i.y) * 2.0);
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV0iw));
R4i.z = floatBitsToInt(intBitsToFloat(R7i.x) + -(0.5));
R4i.w = floatBitsToInt(intBitsToFloat(R7i.y) + -(0.5));
R9i.z = floatBitsToInt(intBitsToFloat(R7i.z) + -(0.5));
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), uf_blockVS7[115].y));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), uf_blockVS7[115].x));
PV0iz = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV1ix));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV1iy));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), uf_blockVS7[115].z));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(PV0iw)));
R0i.z = floatBitsToInt(intBitsToFloat(PV0iy) + uf_blockVS7[114].x);
R3i.w = floatBitsToInt(uf_blockVS7[114].y + intBitsToFloat(PV0ix));
R8i.x = floatBitsToInt(uf_blockVS7[114].z + intBitsToFloat(PS0i));
// 12
PV0ix = floatBitsToInt(uf_blockVS7[5].x) & 0x10000;
R127i.y = floatBitsToInt(uf_blockVS7[5].x) & 0x20000;
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(PV1ix)));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(PV1iy)));
R126i.y = floatBitsToInt(uf_blockVS7[5].x) & 0x40000;
// 13
R10i.x = R7i.y;
R10i.x = floatBitsToInt(intBitsToFloat(R10i.x) * 2.0);
PS1i = floatBitsToInt(float(PV0ix));
// 14
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(R127i.y));
// 15
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(float(R126i.y));
// 16
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R125i.z = int(intBitsToFloat(PV1iw));
// 17
PV1ix = 0 - R125i.z;
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0ix)));
R126i.y = int(intBitsToFloat(PV0iz));
// 18
PV0ix = max(R125i.z, PV1ix);
PV0iy = 0 - R126i.y;
R127i.x = int(intBitsToFloat(PV1iy));
// 19
PV1ix = 0 - R127i.x;
PV1iw = max(R126i.y, PV0iy);
R0i.w = floatBitsToInt(float(PV0ix));
R0i.w = floatBitsToInt(intBitsToFloat(R0i.w) * 2.0);
// 20
PV0iz = max(R127i.x, PV1ix);
R8i.z = floatBitsToInt(float(PV1iw));
R8i.z = floatBitsToInt(intBitsToFloat(R8i.z) * 2.0);
// 21
R8i.y = floatBitsToInt(float(PV0iz));
R8i.y = floatBitsToInt(intBitsToFloat(R8i.y) * 2.0);
}
if( activeMaskStackC[3] == true ) {
// 0
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), uf_blockVS8[3].y));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), uf_blockVS8[3].z));
// 1
R9i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS8[4].x,uf_blockVS8[4].y,uf_blockVS8[4].z,0.0)));
PV1iy = R9i.x;
PV1iz = R9i.x;
PV1iw = R9i.x;
R125i.w = floatBitsToInt(floor(intBitsToFloat(R10i.x)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS8[5].x,uf_blockVS8[5].y,uf_blockVS8[5].z,0.0)));
PV0ix = tempi.x;
R4i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.z = floatBitsToInt((intBitsToFloat(R125i.w) > 0.0)?1.0:0.0);
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS8[6].x,uf_blockVS8[6].y,uf_blockVS8[6].z,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt((0.0 > intBitsToFloat(R125i.w))?1.0:0.0);
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R125i.z) + -(intBitsToFloat(PS1i)));
R5i.z = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(0x358637bd));
PV0iw = R7i.z;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
// 5
R127i.x = R7i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.w)), intBitsToFloat(PV0ix)));
R125i.z = floatBitsToInt(floor(intBitsToFloat(PV0iw)));
// 6
R4i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R5i.w)),vec4(uf_blockVS8[4].x,uf_blockVS8[4].y,uf_blockVS8[4].z,uf_blockVS8[4].w)));
PV0iy = R4i.x;
PV0iz = R4i.x;
PV0iw = R4i.x;
R126i.y = floatBitsToInt((intBitsToFloat(R125i.z) > 0.0)?1.0:0.0);
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R5i.w)),vec4(uf_blockVS8[5].x,uf_blockVS8[5].y,uf_blockVS8[5].z,uf_blockVS8[5].w)));
PV1ix = tempi.x;
R18i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt((0.0 > intBitsToFloat(R125i.z))?1.0:0.0);
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R5i.w)),vec4(uf_blockVS8[6].x,uf_blockVS8[6].y,uf_blockVS8[6].z,uf_blockVS8[6].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R1i.z = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(intBitsToFloat(R126i.y) + -(intBitsToFloat(PS1i)));
// 9
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R8i.z)), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(floor(intBitsToFloat(backupReg0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R127i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.y)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), uf_blockVS7[113].x));
// 10
PV0ix = floatBitsToInt((intBitsToFloat(PV1iy) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt(intBitsToFloat(R3i.x) + intBitsToFloat(PV1iw));
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PV1iy))?1.0:0.0);
R127i.w = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV1iz));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R127i.x)));
// 11
R126i.x = floatBitsToInt(intBitsToFloat(R3i.w) + intBitsToFloat(PS0i));
R125i.y = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(R125i.z));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iz)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R127i.x)));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), uf_blockVS7[113].y));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(PV1iw));
R127i.y = ((uf_blockVS7[114].w == 1.0)?-1:0);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), uf_blockVS7[113].z));
PV0iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R8i.y)), intBitsToFloat(PV1iz)));
tempResultf = max(0.0, uf_blockVS7[114].w);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 13
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R26i.y), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(PV0iw)));
R126i.w = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R127i.x));
R125i.w = floatBitsToInt(-(uf_blockVS7[114].w) + 1.0);
// 14
R126i.y = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(PV1iz));
PV0iw = floatBitsToInt(intBitsToFloat(R3i.z) + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 15
PV1ix = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R3i.y = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R125i.z));
R9i.z = floatBitsToInt(intBitsToFloat(R6i.z) * 1.0);
PV1iw = (R10i.z == int(1))?-1:0;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R125i.w));
// 16
R123i.x = ((PV1iw == 0)?(0x3f800000):(0xbf800000));
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(PS1i));
R123i.z = ((PV1iw == 0)?(0xbf800000):(0xbf800000));
PV0iw = (R10i.z == 0x2)?-1:0;
R124i.y = (R10i.z == 0x3)?-1:0;
// 17
backupReg0i = R123i.x;
backupReg1i = R123i.z;
R123i.x = ((R127i.y == 0)?(PV0iy):(R26i.y));
R123i.z = ((PV0iw == 0)?(backupReg0i):(0xbf800000));
R123i.w = ((PV0iw == 0)?(backupReg1i):(0x3f800000));
// 18
R2i.x = ((R124i.y == 0)?(R123i.w):(0x3f800000));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R123i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R123i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R123i.x)));
R0i.w = ((R124i.y == 0)?(R123i.z):(0x3f800000));
// 19
PV1ix = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV0iz));
// 20
R123i.x = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.w = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
// 21
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
// 22
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 23
R126i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R3i.y = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
R125i.z = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
// 24
R2i.y = floatBitsToInt(sin((intBitsToFloat(R125i.z))/0.1591549367));
// 25
R3i.x = floatBitsToInt(cos((intBitsToFloat(R125i.z))/0.1591549367));
// 26
R3i.w = floatBitsToInt(sin((intBitsToFloat(R126i.x))/0.1591549367));
// 27
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R3i.w)));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R3i.w)));
R10i.z = floatBitsToInt(cos((intBitsToFloat(R126i.x))/0.1591549367));
// 28
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R10i.z)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R10i.z)));
R11i.y = floatBitsToInt(sin((intBitsToFloat(R3i.y))/0.1591549367));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(R8i.y)));
R125i.y = floatBitsToInt(-(intBitsToFloat(R11i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(R8i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(R3i.z)));
R126i.x = floatBitsToInt(cos((intBitsToFloat(R3i.y))/0.1591549367));
// 1
R10i.x = floatBitsToInt(intBitsToFloat(R4i.w) + intBitsToFloat(PV0iz));
R3i.y = floatBitsToInt(-(intBitsToFloat(R8i.y)) + intBitsToFloat(PV0iw));
R3i.z = floatBitsToInt(-(intBitsToFloat(R3i.z)) + intBitsToFloat(PV0ix));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(R126i.x)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R126i.x)));
// 2
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R126i.x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(R4i.w)));
PV0iz = floatBitsToInt(uf_blockVS7[13].x);
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R126i.x)));
PS0i = floatBitsToInt(uf_blockVS7[13].y);
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 3
backupReg0i = R0i.w;
PV1ix = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(PS0i));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),uf_blockVS11[0].x) + 0.0);
R0i.w = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(PV0iy));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),uf_blockVS11[0].x) + 0.0);
// 4
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PV1iy)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R9i.z)));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R9i.z)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R9i.z)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R125i.y)) + intBitsToFloat(PV0iw));
R4i.w = 0x3f800000;
R2i.y = floatBitsToInt(intBitsToFloat(R7i.x) + 1.0);
// 6
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R2i.w)) + intBitsToFloat(R123i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R3i.x)) + intBitsToFloat(PV1ix));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R8i.y)) + intBitsToFloat(PV1iy));
// 7
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R10i.x)) + intBitsToFloat(R123i.w));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R3i.z)) + intBitsToFloat(R123i.y));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R125i.x = floatBitsToInt(uf_blockVS6[12].x);
R125i.y = floatBitsToInt(uf_blockVS6[12].y);
R126i.z = floatBitsToInt(uf_blockVS6[13].y);
R125i.w = floatBitsToInt(uf_blockVS6[13].x);
// 1
PV1ix = floatBitsToInt(uf_blockVS6[12].z);
R127i.y = floatBitsToInt(intBitsToFloat(R7i.y) + 1.0);
R127i.z = floatBitsToInt(uf_blockVS6[14].x);
R127i.w = floatBitsToInt(uf_blockVS6[14].y);
R126i.w = floatBitsToInt(intBitsToFloat(R7i.z) + 1.0);
// 2
R127i.x = floatBitsToInt(uf_blockVS6[14].z);
R126i.y = floatBitsToInt(uf_blockVS6[13].z);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(PV1ix)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV1ix)));
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x),intBitsToFloat(R125i.y)) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R127i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R126i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R126i.y)));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.x)));
// 4
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R125i.y)) + intBitsToFloat(R125i.z));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R125i.x)) + intBitsToFloat(backupReg0i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x),intBitsToFloat(R127i.w)) + intBitsToFloat(PV1iy));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x),intBitsToFloat(R126i.z)) + intBitsToFloat(PV1iz));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R126i.z)) + intBitsToFloat(PV1iw));
// 5
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R125i.w)) + intBitsToFloat(R123i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R127i.w)) + intBitsToFloat(backupReg0i));
R125i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R11i.y)),intBitsToFloat(R125i.x)) + intBitsToFloat(R123i.x));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.z));
R124i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R11i.y)),intBitsToFloat(R125i.w)) + intBitsToFloat(R122i.x));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R126i.y)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), uf_blockVS11[2].x));
R124i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R11i.y)),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.y));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R127i.x)));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), uf_blockVS11[2].x));
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iw));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R126i.z)) + intBitsToFloat(PV0ix));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R125i.y)) + intBitsToFloat(R124i.y));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), uf_blockVS11[1].w));
// 8
backupReg0i = R123i.y;
backupReg1i = R125i.x;
backupReg2i = R123i.z;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), uf_blockVS11[2].x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(R125i.w)) + intBitsToFloat(backupReg0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(backupReg1i)) + intBitsToFloat(backupReg2i));
PS0i = ((intBitsToFloat(R26i.y) == 0.0)?-1:0);
// 9
backupReg0i = R123i.y;
backupReg1i = R123i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(R125i.z)) + intBitsToFloat(R123i.w));
R123i.y = ((PS0i == 0)?(R26i.y):(0x3f800000));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(R124i.z)) + intBitsToFloat(backupReg0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(R124i.w)) + intBitsToFloat(backupReg1i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 10
R26i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z),intBitsToFloat(R9i.y)) + intBitsToFloat(R123i.x));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.w));
R17i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z),intBitsToFloat(R2i.w)) + intBitsToFloat(R123i.z));
R0i.z = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(PS1i));
R0i.z = clampFI32(R0i.z);
// 11
tempi.x = floatBitsToInt(dot(vec4(uf_blockVS6[12].x,uf_blockVS6[12].y,uf_blockVS6[12].z,uf_blockVS6[12].w),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R5i.y),intBitsToFloat(R9i.z),intBitsToFloat(R4i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 12
R0i.x = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV1ix));
// 13
R127i.w = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(R126i.y));
// 14
tempi.x = floatBitsToInt(dot(vec4(uf_blockVS6[13].x,uf_blockVS6[13].y,uf_blockVS6[13].z,uf_blockVS6[13].w),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R5i.y),intBitsToFloat(R9i.z),intBitsToFloat(R4i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 15
R1i.y = floatBitsToInt(intBitsToFloat(R18i.y) + intBitsToFloat(PV0ix));
// 16
PV0iz = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(R125i.x));
// 17
R125i.x = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0iz));
// 18
tempi.x = floatBitsToInt(dot(vec4(uf_blockVS6[14].x,uf_blockVS6[14].y,uf_blockVS6[14].z,uf_blockVS6[14].w),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R5i.y),intBitsToFloat(R9i.z),intBitsToFloat(R4i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 19
R2i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0ix));
// 20
PV0iy = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(R127i.x));
// 21
R0i.w = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(R125i.x));
// 22
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
PV0ix = floatBitsToInt(uf_blockVS8[5].w);
PV0iy = floatBitsToInt(uf_blockVS8[4].w);
// 1
R127i.x = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(R0i.x)));
R127i.y = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(R1i.y)));
PV1iw = floatBitsToInt(uf_blockVS8[6].w);
R126i.y = floatBitsToInt(1.0 / uf_blockVS11[5].y);
// 2
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(R2i.z)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV0iz),0.0)));
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
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PV1ix)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0iy = floatBitsToInt(-(intBitsToFloat(R18i.y)) + intBitsToFloat(R1i.y));
R127i.w = floatBitsToInt(uf_blockVS8[4].w + uf_blockVS8[5].w);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R0i.y));
// 1
R127i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
PV1iz = floatBitsToInt(mul_nonIEEE(uf_blockVS11[0].w, uf_blockVS11[1].z));
// 2
PV0ix = floatBitsToInt(uf_blockVS8[6].w + intBitsToFloat(R127i.w));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV1iz)));
R127i.z = ((0.0 > intBitsToFloat(R127i.x))?-1:0);
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS11[0].w, intBitsToFloat(R0i.w)));
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.x)), intBitsToFloat(R127i.x)));
// 3
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockVS8[2].x, uf_blockVS11[1].x));
R126i.z = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3dd70a3d));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R127i.x)));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R127i.w));
R0i.y = ((R127i.z == 0)?(PV1iw):(R126i.y));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockVS11[0].z, uf_blockVS11[1].y));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R127i.y));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV0iw));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV0ix));
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS11[0].z, intBitsToFloat(R0i.z)));
// 6
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.z = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
// 7
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV1iw = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
// 8
R123i.x = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.w = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 9
R127i.x = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R126i.z = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R4i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R9i.x),intBitsToFloat(R4i.y),intBitsToFloat(R5i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R126i.w = tempi.x;
PS0i = floatBitsToInt(sin((intBitsToFloat(R126i.z))/0.1591549367));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R127i.w)));
PS1i = floatBitsToInt(cos((intBitsToFloat(R126i.z))/0.1591549367));
// 12
R0i.z = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV1ix));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(sin((intBitsToFloat(R127i.x))/0.1591549367));
// 13
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R127i.y)));
R2i.y = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(PV0iw));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(R126i.w)));
// 14
R3i.y = ((intBitsToFloat(PS1i) > 0.0)?-1:0);
R2i.z = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV1ix));
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R4i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R9i.x),intBitsToFloat(R4i.y),intBitsToFloat(R5i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 16
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 17
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(PS0i)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(PS0i)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PS0i)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), uf_blockVS14[1].w));
// 1
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockVS11[2].y, intBitsToFloat(PV0iz)));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(uf_blockVS14[1].y, intBitsToFloat(PV1iy)));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockVS14[1].z, intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS14[1].x, intBitsToFloat(PV1iy)));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PV0ix)));
// 4
backupReg0i = R2i.y;
R2i.x = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV1iy));
R2i.y = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(PV1iw));
R2i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV1ix));
// 5
R1i.x = floatBitsToInt(-(intBitsToFloat(R4i.x)) + intBitsToFloat(R2i.x));
R0i.y = floatBitsToInt(-(intBitsToFloat(R18i.y)) + intBitsToFloat(R2i.y));
R0i.z = floatBitsToInt(-(intBitsToFloat(R1i.z)) + intBitsToFloat(R2i.z));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 7
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 8
PV0ix = ((intBitsToFloat(PS1i) > 0.0)?-1:0);
// 9
R3i.x = ((PV0ix == 0)?(0):(R3i.y));
// 10
predResult = (R3i.x != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), uf_blockVS7[95].x));
// 1
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), uf_blockVS7[95].x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), uf_blockVS7[95].x));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PS1i)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R1i.y),intBitsToFloat(R3i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.z)));
// 5
R2i.x = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(PV0iy));
R2i.y = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(PV0ix));
R2i.z = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(PV0iw));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R4i.x) + -(uf_blockVS6[17].x));
PV0iy = floatBitsToInt(intBitsToFloat(R18i.y) + -(uf_blockVS6[17].y));
PV0iz = floatBitsToInt(intBitsToFloat(R1i.z) + -(uf_blockVS6[17].z));
R2i.w = 0x3f800000;
R0i.y = floatBitsToInt(-(intBitsToFloat(R4i.x)) + intBitsToFloat(R2i.x));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R0i.x = floatBitsToInt(-(intBitsToFloat(R18i.y)) + intBitsToFloat(R2i.y));
// 2
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), uf_blockVS7[13].z));
R0i.w = floatBitsToInt(-(intBitsToFloat(R1i.z)) + intBitsToFloat(R2i.z));
R0i.z = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 3
R3i.w = 0x3f800000;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R18i.y),intBitsToFloat(R1i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS6[10].x,uf_blockVS6[10].y,uf_blockVS6[10].z,uf_blockVS6[10].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R127i.w = tempi.x;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R18i.y),intBitsToFloat(R1i.z),intBitsToFloat(R3i.w)),vec4(uf_blockVS6[11].x,uf_blockVS6[11].y,uf_blockVS6[11].z,uf_blockVS6[11].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 6
R123i.x = floatBitsToInt(intBitsToFloat(R127i.w) * 0.0 + intBitsToFloat(PV1ix));
PV0iz = PV1ix;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
// 7
R127i.y = floatBitsToInt(intBitsToFloat(R127i.w) * 0.5 + intBitsToFloat(PV0iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R123i.x));
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[13].z, intBitsToFloat(R127i.y)));
// 9
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(R127i.z));
// 10
PV0iw = floatBitsToInt(uf_blockVS7[13].z + -(intBitsToFloat(PV1iy)));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(R127i.y) + -(intBitsToFloat(PV0iw)));
// 12
R2i.z = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PV1ix));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iz = floatBitsToInt(min(intBitsToFloat(R0i.z), uf_blockVS7[116].x));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[116].x);
// 1
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockVS6[18].w, intBitsToFloat(R2i.z)));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt(-(uf_blockVS6[18].y) + intBitsToFloat(PV1iy));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PV1ix)));
// 3
R11i.x = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV0iw));
R8i.y = floatBitsToInt(intBitsToFloat(R18i.y) + intBitsToFloat(PV0iz));
R8i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 4
R17i.x = R11i.x;
R17i.y = R8i.y;
R14i.z = R8i.z;
R5i.w = floatBitsToInt(-(uf_blockVS6[18].z) * intBitsToFloat(PS1i));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS6[8].x,uf_blockVS6[8].y,uf_blockVS6[8].z,uf_blockVS6[8].w)));
PV1ix = tempi.x;
R5i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 6
R9i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS6[9].x,uf_blockVS6[9].y,uf_blockVS6[9].z,uf_blockVS6[9].w)));
PV0iy = R9i.x;
PV0iz = R9i.x;
PV0iw = R9i.x;
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS6[11].x,uf_blockVS6[11].y,uf_blockVS6[11].z,uf_blockVS6[11].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R13i.w = tempi.x;
// 8
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS6[0].x,uf_blockVS6[0].y,uf_blockVS6[0].z,uf_blockVS6[0].w)));
PV0iy = R127i.x;
PV0iz = R127i.x;
PV0iw = R127i.x;
R126i.w = PV1ix;
R126i.w = floatBitsToInt(intBitsToFloat(R126i.w) / 2.0);
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS6[1].x,uf_blockVS6[1].y,uf_blockVS6[1].z,uf_blockVS6[1].w)));
PV1ix = tempi.x;
R127i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R10i.y = floatBitsToInt(intBitsToFloat(R13i.w) * 1.0);
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS6[2].x,uf_blockVS6[2].y,uf_blockVS6[2].z,uf_blockVS6[2].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R12i.x = floatBitsToInt(intBitsToFloat(R9i.x) * -(0.5) + intBitsToFloat(R126i.w));
// 11
R127i.z = floatBitsToInt(intBitsToFloat(R3i.z) + intBitsToFloat(PV0ix));
R8i.w = floatBitsToInt(intBitsToFloat(R5i.y) * 0.5 + intBitsToFloat(R126i.w));
R9i.z = floatBitsToInt(1.0 / intBitsToFloat(R10i.y));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS6[3].x,uf_blockVS6[3].y,uf_blockVS6[3].z,uf_blockVS6[3].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R127i.w = tempi.x;
// 13
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(PV0ix)),vec4(uf_blockVS6[6].x,uf_blockVS6[6].y,uf_blockVS6[6].z,uf_blockVS6[6].w)));
PV1iy = R126i.x;
PV1iz = R126i.x;
PV1iw = R126i.x;
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w)),vec4(uf_blockVS6[7].x,uf_blockVS6[7].y,uf_blockVS6[7].z,uf_blockVS6[7].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 15
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 16
PV0iy = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(PS1i));
// 17
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.w), intBitsToFloat(PV0iy)));
// 18
R10i.z = floatBitsToInt(intBitsToFloat(R10i.x) * 0.5 + intBitsToFloat(R126i.w));
// 19
PV1iy = floatBitsToInt(intBitsToFloat(R10i.z) * intBitsToFloat(R9i.z));
// 20
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),uf_blockVS6[18].w) + -(uf_blockVS6[18].y));
// 21
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.x));
// 22
R9i.y = floatBitsToInt(-(uf_blockVS6[18].z) * intBitsToFloat(PS1i));
}
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = floatBitsToInt(uf_blockVS7[60].z);
R2i.y = floatBitsToInt(uf_blockVS7[60].x);
R2i.w = floatBitsToInt(uf_blockVS7[60].y);
// 1
PV1iy = floatBitsToInt((0.0 > uf_blockVS7[8].y)?1.0:0.0);
PV1iz = floatBitsToInt((uf_blockVS7[8].y > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(1.0 / uf_blockVS7[8].y);
// 2
R127i.x = floatBitsToInt(-(uf_blockVS7[68].x) + uf_blockVS7[69].x);
PV0iz = floatBitsToInt(intBitsToFloat(R26i.y) * intBitsToFloat(PS1i));
R126i.w = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iy)));
// 3
R126i.x = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),uf_blockVS7[9].z) + intBitsToFloat(PV0iz));
// 4
PV0iz = floatBitsToInt(-(uf_blockVS7[68].w) + uf_blockVS7[69].w);
PV0iw = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
// 5
R127i.y = floatBitsToInt(-(uf_blockVS7[69].x) + uf_blockVS7[70].x);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV0iw)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 6
PV0ix = floatBitsToInt(-(uf_blockVS7[69].w) + uf_blockVS7[70].w);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.z),intBitsToFloat(R126i.x)) + intBitsToFloat(PV1iz));
R126i.w = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS1i));
// 7
R127i.z = floatBitsToInt(intBitsToFloat(R126i.y) + -(uf_blockVS7[69].w));
PV1iw = floatBitsToInt(intBitsToFloat(R126i.y) + -(uf_blockVS7[68].w));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 8
backupReg0i = R127i.y;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(R126i.w)) + uf_blockVS7[68].x);
R127i.y = ((intBitsToFloat(PV1iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iz = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(PS1i));
R126i.w = floatBitsToInt(intBitsToFloat(R126i.y) + -(uf_blockVS7[70].w));
R127i.x = ((intBitsToFloat(R127i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 9
R126i.x = ((intBitsToFloat(R126i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV0iz)) + uf_blockVS7[69].x);
R126i.z = floatBitsToInt(intBitsToFloat(R126i.y) + -(uf_blockVS7[71].w));
PV1iw = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R127i.z = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
// 10
R125i.x = floatBitsToInt(-(uf_blockVS7[70].x) + uf_blockVS7[71].x);
R0i.y = ((intBitsToFloat(R126i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV1iw)));
PS0i = ((intBitsToFloat(R7i.x) > 0.5)?-1:0);
// 11
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(((PS0i == 0)?(intBitsToFloat(R6i.x)):(-(intBitsToFloat(R6i.x)))));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(-(uf_blockVS7[70].w) + uf_blockVS7[71].w);
PV1iw = floatBitsToInt(-(intBitsToFloat(R0i.y)) + 1.0);
// 12
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV1iw)));
R127i.y = floatBitsToInt(-(uf_blockVS7[71].x) + uf_blockVS7[72].x);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
// 13
PV1ix = floatBitsToInt(-(uf_blockVS7[71].w) + uf_blockVS7[72].w);
PV1iy = floatBitsToInt(intBitsToFloat(R126i.y) + -(uf_blockVS7[72].w));
PV1iw = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(PS0i));
// 14
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PV1iw)) + uf_blockVS7[70].x);
R126i.y = ((intBitsToFloat(PV1iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockVS7[68].x, intBitsToFloat(R127i.z)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 15
PV1ix = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
R3i.y = floatBitsToInt(uf_blockVS7[76].x);
PV1iz = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iz));
R2i.x = floatBitsToInt(uf_blockVS7[76].y);
// 16
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R124i.y)) + intBitsToFloat(R123i.w));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(PV1iz)) + uf_blockVS7[71].x);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PV1ix)));
R3i.w = floatBitsToInt(uf_blockVS7[76].z);
PS0i = ((intBitsToFloat(R7i.z) > 0.5)?-1:0);
// 17
PV1ix = ((intBitsToFloat(R7i.y) > 0.5)?-1:0);
PV1iy = floatBitsToInt(uf_blockVS7[5].x) & 0x80000;
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.x));
PV1iw = floatBitsToInt(uf_blockVS7[5].x) & 0x100000;
R127i.w = floatBitsToInt(((PS0i == 0)?(intBitsToFloat(R6i.x)):(-(intBitsToFloat(R6i.x)))));
// 18
PV0ix = (PV1iw == 0x100000)?-1:0;
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R126i.z)) + intBitsToFloat(R123i.z));
R123i.z = floatBitsToInt(((PV1ix == 0)?(intBitsToFloat(R6i.y)):(-(intBitsToFloat(R6i.y)))));
PV0iw = (PV1iy == 0x80000)?-1:0;
PS0i = floatBitsToInt(uf_blockVS7[5].x) & 0x200000;
// 19
R5i.x = ((PV0ix == 0)?(R6i.y):(R123i.z));
R0i.y = ((PV0iw == 0)?(R6i.x):(R127i.x));
PV1iz = (PS0i == 0x200000)?-1:0;
R0i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[72].x,intBitsToFloat(R126i.y)) + intBitsToFloat(R123i.y));
PS1i = floatBitsToInt(uf_blockVS7[5].x) & 0x400000;
// 20
R8i.x = ((PV1iz == 0)?(R6i.x):(R127i.w));
R126i.y = (PS1i == 0x400000)?-1:0;
PV0iz = floatBitsToInt(uf_blockVS7[5].x) & 0x800000;
PV0iw = ((intBitsToFloat(R7i.w) > 0.5)?-1:0);
PS0i = ((intBitsToFloat(R7i.y) > 0.5)?-1:0);
// 21
R123i.x = floatBitsToInt(((PV0iw == 0)?(intBitsToFloat(R6i.y)):(-(intBitsToFloat(R6i.y)))));
PV1iy = floatBitsToInt(uf_blockVS7[5].x) & 0x1000000;
R123i.z = floatBitsToInt(((PS0i == 0)?(intBitsToFloat(R6i.x)):(-(intBitsToFloat(R6i.x)))));
PV1iw = (PV0iz == 0x800000)?-1:0;
PS1i = ((intBitsToFloat(R7i.z) > 0.5)?-1:0);
// 22
PV0ix = (PV1iy == 0x1000000)?-1:0;
R4i.y = ((PV1iw == 0)?(R6i.x):(R123i.z));
R5i.z = ((R126i.y == 0)?(R6i.y):(R123i.x));
R123i.w = floatBitsToInt(((PS1i == 0)?(intBitsToFloat(R6i.y)):(-(intBitsToFloat(R6i.y)))));
PS0i = floatBitsToInt(uf_blockVS7[5].y) & int(1);
// 23
R2i.z = (int(1) != PS0i)?-1:0;
R4i.w = ((PV0ix == 0)?(R6i.y):(R123i.w));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), uf_blockVS8[0].x));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), uf_blockVS8[0].z));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), uf_blockVS8[0].y));
R10i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), uf_blockVS8[0].w));
// 1
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), uf_blockVS7[59].x));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), uf_blockVS7[59].x));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), uf_blockVS7[59].x));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), uf_blockVS8[1].x));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), uf_blockVS8[1].y));
// 2
R13i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), uf_blockVS8[1].z));
R9i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(PV1iw)));
// 3
R12i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(PV0iz)));
}
if( activeMaskStackC[3] == true ) {
// 0
R3i.y = floatBitsToInt(uf_blockVS7[84].x);
R2i.y = int(uf_blockVS7[17].x);
// 1
PV1ix = floatBitsToInt(uf_blockVS7[5].x) & 0x10;
R0i.w = int(uf_blockVS7[17].y);
// 2
PV0ix = floatBitsToInt(uf_blockVS7[5].x) & 0x20;
PS0i = floatBitsToInt(float(PV1ix));
// 3
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PS1i = floatBitsToInt(float(PV0ix));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
// 5
R2i.x = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iw)));
R126i.z = int(intBitsToFloat(PV0ix));
// 6
PV0iy = 0 - R126i.z;
// 7
R3i.w = max(R126i.z, PV0iy);
}
if( activeMaskStackC[3] == true ) {
// 0
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), uf_blockVS8[1].w));
// 1
PV1ix = floatBitsToInt(uf_blockVS7[5].x) & 0x40;
R126i.y = floatBitsToInt(uf_blockVS7[5].x) & 0x80;
R125i.z = int(-1) + R2i.y;
R126i.z = int(intBitsToFloat(R2i.x));
// 2
PV0iy = 0 - R126i.z;
R124i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x2000000;
PS0i = floatBitsToInt(float(PV1ix));
// 3
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R6i.w = max(R126i.z, PV0iy);
PS1i = floatBitsToInt(float(R126i.y));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R127i.x = floatBitsToInt(float(R2i.y));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iw)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(R127i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R26i.y), intBitsToFloat(R127i.x)));
R126i.z = int(intBitsToFloat(PV0ix));
// 6
PV0ix = 0 - R126i.z;
PV0iy = floatBitsToInt(intBitsToFloat(R11i.w) * intBitsToFloat(PV1iz));
R127i.z = int(intBitsToFloat(PV1ix));
// 7
PV1iy = 0 - R127i.z;
R2i.w = max(R126i.z, PV0ix);
PS1i = int(intBitsToFloat(PV0iy));
// 8
R126i.w = max(R127i.z, PV1iy);
R125i.x = R3i.w * PS1i;
// 9
PS1i = floatBitsToInt(float(R0i.w));
// 10
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 11
PV1iy = floatBitsToInt(intBitsToFloat(R26i.y) * intBitsToFloat(PS0i));
R127i.z = floatBitsToInt(float(R2i.y));
// 12
R127i.y = floatBitsToInt(abs(intBitsToFloat(R127i.z)));
R125i.w = int(intBitsToFloat(PV1iy));
// 13
PS1i = floatBitsToInt(float(R125i.w));
// 14
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(PS1i));
R125i.y = floatBitsToInt(float(R125i.w));
// 15
R123i.y = ((intBitsToFloat(PV0iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.w = floatBitsToInt(abs(intBitsToFloat(R125i.y)));
R0i.w = floatBitsToInt(1.0 / abs(intBitsToFloat(R127i.z)));
// 16
PV0ix = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R125i.y)), intBitsToFloat(R0i.w)));
PS0i = int(intBitsToFloat(R123i.y));
// 17
R126i.x = int(1) - PS0i;
PV1iz = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
R124i.w = PS0i * R125i.z;
// 18
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iz)),intBitsToFloat(R127i.y)) + intBitsToFloat(R127i.w));
PS0i = floatBitsToInt(float(R124i.z));
// 19
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iy = floatBitsToInt((intBitsToFloat(R127i.x) >= abs(intBitsToFloat(R127i.z)))?1.0:0.0);
PV1iz = floatBitsToInt(-(abs(intBitsToFloat(R127i.z))) + intBitsToFloat(R127i.x));
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R124i.y = int(intBitsToFloat(R126i.y));
// 20
backupReg0i = R126i.w;
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1ix)));
R126i.w = ((intBitsToFloat(PV1iy) == 0.0)?(R127i.x):(PV1iz));
R124i.z = backupReg0i * R124i.y;
// 21
PV1ix = floatBitsToInt(abs(intBitsToFloat(R127i.z)) + intBitsToFloat(R126i.w));
R126i.y = int(intBitsToFloat(PV0iz));
// 22
R123i.z = ((-(intBitsToFloat(R126i.w)) > 0.0)?(PV1ix):(R126i.w));
PV0iw = 0 - R126i.y;
// 23
PV1ix = max(R126i.y, PV0iw);
R123i.y = ((-(intBitsToFloat(R125i.y)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.z)))):(R123i.z));
// 24
R123i.w = ((intBitsToFloat(R127i.z) == 0.0)?(R125i.y):(R123i.y));
PS0i = PV1ix * R124i.y;
// 25
R127i.x = R125i.w + PS0i;
PS1i = int(intBitsToFloat(R123i.w));
// 26
PS0i = R126i.x * PS1i;
// 27
PV1ix = PS0i + R124i.w;
R125i.y = R2i.w * R127i.x;
// 28
PS0i = R6i.w * PV1ix;
// 29
PV1iz = PS0i + R125i.x;
// 30
PV0iy = R125i.y + PV1iz;
// 31
PV1iw = R124i.z + PV0iy;
// 32
R127i.x = floatBitsToInt(float(PV1iw));
// 33
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), abs(intBitsToFloat(R127i.x))));
R124i.w = floatBitsToInt(abs(intBitsToFloat(R127i.x)));
// 34
PV0iy = floatBitsToInt(trunc(intBitsToFloat(PV1iz)));
// 35
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iy)),intBitsToFloat(R127i.y)) + intBitsToFloat(R124i.w));
// 36
PV0iy = floatBitsToInt((intBitsToFloat(R125i.x) >= abs(intBitsToFloat(R127i.z)))?1.0:0.0);
PV0iz = floatBitsToInt(-(abs(intBitsToFloat(R127i.z))) + intBitsToFloat(R125i.x));
// 37
R124i.w = ((intBitsToFloat(PV0iy) == 0.0)?(R125i.x):(PV0iz));
// 38
PV0ix = floatBitsToInt(abs(intBitsToFloat(R127i.z)) + intBitsToFloat(R124i.w));
// 39
R123i.z = ((-(intBitsToFloat(R124i.w)) > 0.0)?(PV0ix):(R124i.w));
// 40
R123i.y = ((-(intBitsToFloat(R127i.x)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.z)))):(R123i.z));
// 41
R123i.w = ((intBitsToFloat(R127i.z) == 0.0)?(R127i.x):(R123i.y));
// 42
R127i.x = int(intBitsToFloat(R123i.w));
// 43
R127i.z = floatBitsToInt(float(R127i.x));
// 44
PV0iy = floatBitsToInt((intBitsToFloat(R127i.z) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(R127i.z))?1.0:0.0);
R6i.y = floatBitsToInt(float(R127i.x));
// 45
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iw)));
R124i.z = floatBitsToInt(abs(intBitsToFloat(R6i.y)));
PV1iw = floatBitsToInt(abs(intBitsToFloat(R6i.y)) * 0.25);
// 46
PV0ix = floatBitsToInt(trunc(intBitsToFloat(PV1iw)));
R123i.z = floatBitsToInt(intBitsToFloat(PV1ix) * 0.5 + intBitsToFloat(R127i.z));
// 47
PV1ix = floatBitsToInt(intBitsToFloat(R123i.z) * 0.25);
R2i.y = floatBitsToInt(-(intBitsToFloat(PV0ix)) * 4.0 + intBitsToFloat(R124i.z));
// 48
R2i.x = floatBitsToInt((intBitsToFloat(R2i.y) >= 4.0)?1.0:0.0);
R3i.y = floatBitsToInt(trunc(intBitsToFloat(PV1ix)));
R0i.w = floatBitsToInt(intBitsToFloat(R2i.y) + -4.0);
}
if( activeMaskStackC[3] == true ) {
// 0
R124i.z = ((intBitsToFloat(R2i.x) == 0.0)?(R2i.y):(R0i.w));
PS0i = int(intBitsToFloat(R3i.y));
// 1
PV1iy = floatBitsToInt(intBitsToFloat(R124i.z) + 4.0);
R6i.z = PS0i + 0x12;
PS1i = int(uf_blockVS7[48].z);
// 2
R123i.w = ((-(intBitsToFloat(R124i.z)) > 0.0)?(PV1iy):(R124i.z));
R4i.z = floatBitsToInt(float(PS1i));
// 3
R123i.x = ((-(intBitsToFloat(R6i.y)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.w)))):(R123i.w));
// 4
PS0i = int(intBitsToFloat(R123i.x));
// 5
R127i.x = 0xfffffffd + PS0i;
PV1iy = int(-1) + PS0i;
R0i.z = floatBitsToInt(abs(intBitsToFloat(R4i.z)));
R124i.w = 0xfffffffe + PS0i;
PS1i = floatBitsToInt(float(PS0i));
// 6
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(PV1iy));
// 7
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(float(R124i.w));
// 8
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iy)));
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R127i.y = int(intBitsToFloat(PV1iz));
// 9
PV1ix = 0 - R127i.y;
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0ix)));
R124i.w = int(intBitsToFloat(PV0iy));
// 10
PV0ix = max(R127i.y, PV1ix);
PV0iy = 0 - R124i.w;
R125i.x = int(intBitsToFloat(PV1iw));
// 11
R6i.x = int(1) - PV0ix;
PV1iy = 0 - R125i.x;
PV1iz = max(R124i.w, PV0iy);
PS1i = floatBitsToInt(float(R127i.x));
// 12
R0i.x = int(1) - PV1iz;
PV0iy = max(R125i.x, PV1iy);
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R4i.x = floatBitsToInt(1.0 / abs(intBitsToFloat(R4i.z)));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iw)));
R0i.w = int(1) - PV0iy;
// 14
R124i.z = int(intBitsToFloat(PV1ix));
// 15
PV1iy = 0 - R124i.z;
// 16
PV0iw = max(R124i.z, PV1iy);
// 17
R2i.x = int(1) - PV0iw;
}
if( activeMaskStackC[3] == true ) {
R3i.xyzw = floatBitsToInt(uf_blockVS7[R6i.z].xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(uf_blockVS7[44].w + uf_blockVS7[45].y);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), uf_blockVS7[45].x));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), uf_blockVS7[45].y));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
PV0iw = floatBitsToInt(uf_blockVS7[44].z + uf_blockVS7[45].x);
R124i.z = R2i.x * R3i.w;
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(PV0iy)) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(uf_blockVS7[46].x + uf_blockVS7[46].z);
PV1iz = floatBitsToInt(uf_blockVS7[46].y + uf_blockVS7[46].w);
PV1iw = floatBitsToInt(-(intBitsToFloat(PV0iz)) + intBitsToFloat(PV0ix));
R127i.y = R0i.w * R3i.z;
// 2
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R26i.y)),uf_blockVS7[44].x) + -(intBitsToFloat(PV1ix)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R26i.y),uf_blockVS7[44].y) + intBitsToFloat(PV1iw));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),uf_blockVS7[46].z) + intBitsToFloat(PV1iy));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),uf_blockVS7[46].w) + intBitsToFloat(PV1iz));
R124i.w = backupReg0i * R3i.y;
// 3
R127i.x = floatBitsToInt(intBitsToFloat(R5i.x) + -(0.5));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R26i.y),uf_blockVS7[45].z) + intBitsToFloat(R123i.z));
R125i.z = floatBitsToInt(intBitsToFloat(R0i.y) + 0.5);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R26i.y),uf_blockVS7[45].w) + intBitsToFloat(R123i.w));
PS1i = R6i.x * R3i.x;
// 4
R6i.x = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
PV0iz = R124i.w + PS1i;
R126i.w = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
R124i.y = floatBitsToInt(1.0 / intBitsToFloat(R4i.z));
// 5
PV1iy = R127i.y + PV0iz;
PS1i = floatBitsToInt(1.0 / uf_blockVS7[48].z);
// 6
R3i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].x, intBitsToFloat(PS1i)));
R124i.w = R124i.z + PV1iy;
PS0i = floatBitsToInt(1.0 / uf_blockVS7[48].w);
// 7
R123i.y = ((R2i.z == 0)?(0):(int(1)));
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].y, intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(float(R124i.w));
// 8
R125i.x = (R123i.y == int(1))?-1:0;
PV0iy = floatBitsToInt((intBitsToFloat(R127i.y) > 0.0)?1.0:0.0);
PV0iz = (R123i.y == 0x2)?-1:0;
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(R127i.y))?1.0:0.0);
R125i.w = floatBitsToInt(float(R124i.w));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iw)));
R125i.y = floatBitsToInt(abs(intBitsToFloat(R125i.w)));
PV1iz = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R125i.w)), intBitsToFloat(R4i.x)));
R123i.w = ((PV0iz == 0)?(R7i.x):(R7i.z));
R122i.x = ((PV0iz == 0)?(R7i.y):(R7i.x));
// 10
R124i.x = ((R125i.x == 0)?(R122i.x):(R7i.z));
PV0iy = floatBitsToInt(trunc(intBitsToFloat(PV1iz)));
R123i.z = floatBitsToInt(intBitsToFloat(PV1ix) * 0.5 + intBitsToFloat(R127i.y));
R127i.w = ((R125i.x == 0)?(R123i.w):(R7i.y));
R126i.z = ((R125i.x == 0)?(R7i.x):(R7i.y));
// 11
backupReg0i = R124i.y;
R124i.y = ((R125i.x == 0)?(R7i.y):(R7i.z));
R124i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iy)),intBitsToFloat(R0i.z)) + intBitsToFloat(R125i.y));
PV1iw = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(backupReg0i));
PS1i = int(uf_blockVS7[53].z);
// 12
PV0ix = floatBitsToInt(trunc(intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(-(abs(intBitsToFloat(R4i.z))) + intBitsToFloat(R124i.z));
PV0iw = floatBitsToInt((intBitsToFloat(R124i.z) >= abs(intBitsToFloat(R4i.z)))?1.0:0.0);
R126i.x = floatBitsToInt(float(PS1i));
// 13
R125i.x = ((intBitsToFloat(PV0iw) == 0.0)?(R124i.z):(PV0iy));
PV1iy = floatBitsToInt((0.0 >= abs(intBitsToFloat(R126i.x)))?1.0:0.0);
PV1iz = floatBitsToInt(-(abs(intBitsToFloat(R126i.x))) + 0.0);
PS1i = int(intBitsToFloat(PV0ix));
// 14
PV0iz = floatBitsToInt(abs(intBitsToFloat(R4i.z)) + intBitsToFloat(R125i.x));
R124i.w = ((intBitsToFloat(PV1iy) == 0.0)?(0):(PV1iz));
PS0i = floatBitsToInt(float(PS1i));
// 15
PV1ix = floatBitsToInt(abs(intBitsToFloat(R126i.x)) + intBitsToFloat(R124i.w));
R123i.y = ((-(intBitsToFloat(R125i.x)) > 0.0)?(PV0iz):(R125i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.z)),intBitsToFloat(PS0i)) + intBitsToFloat(R126i.y));
// 16
R123i.x = ((-(intBitsToFloat(R124i.w)) > 0.0)?(PV1ix):(R124i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.z)),intBitsToFloat(R127i.x)) + -(intBitsToFloat(R123i.z)));
R123i.w = ((-(intBitsToFloat(R125i.w)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.y)))):(R123i.y));
// 17
backupReg0i = R123i.x;
R123i.x = ((intBitsToFloat(R4i.z) == 0.0)?(R125i.w):(R123i.w));
R126i.y = ((intBitsToFloat(R126i.x) == 0.0)?(0):(backupReg0i));
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R126i.w)) + intBitsToFloat(R123i.z));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 18
PV0iz = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
PS0i = int(intBitsToFloat(R123i.x));
// 19
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockVS7[50].x, intBitsToFloat(R127i.w)));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
R125i.y = floatBitsToInt(trunc(intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(uf_blockVS7[49].z + uf_blockVS7[50].x);
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[50].y, intBitsToFloat(R124i.x)));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
PS1i = floatBitsToInt(float(PS0i));
// 20
R124i.x = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(PV1iz));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(PS1i)) + intBitsToFloat(R0i.x));
PV0iz = floatBitsToInt(uf_blockVS7[49].w + uf_blockVS7[50].y);
R126i.w = int(intBitsToFloat(R126i.y));
// 21
PV1ix = floatBitsToInt(uf_blockVS7[51].x + uf_blockVS7[51].z);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R125i.z)) + intBitsToFloat(R123i.y));
R125i.z = floatBitsToInt(-(intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iz));
PV1iw = floatBitsToInt(uf_blockVS7[51].y + uf_blockVS7[51].w);
R127i.w = int(intBitsToFloat(R125i.y));
// 22
backupReg0i = R126i.z;
R127i.x = floatBitsToInt(intBitsToFloat(R8i.x) + 0.5);
R0i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.y)),intBitsToFloat(R6i.x)) + intBitsToFloat(R123i.y));
R126i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[51].w,intBitsToFloat(R124i.y)) + intBitsToFloat(PV1iw));
R125i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[51].z,intBitsToFloat(backupReg0i)) + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[53].z);
// 23
R126i.x = floatBitsToInt(intBitsToFloat(R4i.y) + 0.5);
R125i.y = floatBitsToInt(intBitsToFloat(R5i.z) + -(0.5));
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[53].x, intBitsToFloat(PS0i)));
R124i.w = floatBitsToInt(intBitsToFloat(R4i.w) + -(0.5));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[53].w);
// 24
backupReg0i = R126i.w;
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R26i.y)),uf_blockVS7[49].x) + -(intBitsToFloat(R124i.x)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R26i.y),uf_blockVS7[49].y) + intBitsToFloat(R125i.z));
R4i.z = floatBitsToInt(fract(intBitsToFloat(R1i.w)));
R126i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[53].y, intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(float(backupReg0i));
// 25
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PS0i)) + intBitsToFloat(R123i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R26i.y),uf_blockVS7[50].z) + intBitsToFloat(R125i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R26i.y),uf_blockVS7[50].w) + intBitsToFloat(R126i.z));
R4i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[58].x, intBitsToFloat(R126i.x)));
PS1i = floatBitsToInt(float(R127i.w));
// 26
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.x));
PV0iy = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R1i.z = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.w)),intBitsToFloat(PS1i)) + intBitsToFloat(R124i.y));
R6i.x = floatBitsToInt(1.0 / uf_blockVS7[58].z);
// 27
R1i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R8i.x)),intBitsToFloat(PV0iy)) + intBitsToFloat(R123i.x));
R1i.y = floatBitsToInt(intBitsToFloat(R26i.y) * 100.0);
R1i.y = clampFI32(R1i.y);
R0i.z = floatBitsToInt(mul_nonIEEE(-(uf_blockVS7[58].y), intBitsToFloat(R124i.w)));
R1i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.w)),intBitsToFloat(R125i.y)) + -(intBitsToFloat(R123i.w)));
R0i.w = floatBitsToInt(1.0 / uf_blockVS7[58].w);
}
if( activeMaskStackC[3] == true ) {
// 0
R4i.x = R18i.z;
R125i.y = floatBitsToInt(intBitsToFloat(R5i.w) + -(uf_blockVS7[93].x));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R1i.z)) + intBitsToFloat(R1i.w));
PV0iw = floatBitsToInt(-(uf_blockVS7[93].x) + uf_blockVS7[93].y);
R2i.y = floatBitsToInt(uf_blockVS7[104].x);
// 1
backupReg0i = R9i.x;
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R1i.y)));
R3i.y = floatBitsToInt(uf_blockVS7[104].y);
R2i.z = floatBitsToInt(uf_blockVS7[104].z);
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R1i.y)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 2
R5i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS11[5].z, intBitsToFloat(R4i.z)));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(R1i.y)));
R3i.w = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(PS1i));
R3i.w = clampFI32(R3i.w);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(min(uf_blockVS6[17].y, uf_blockVS13[27].z));
R125i.y = floatBitsToInt(uf_blockVS6[17].x + -(intBitsToFloat(R11i.x)));
R126i.z = floatBitsToInt(uf_blockVS6[17].y + -(intBitsToFloat(R8i.y)));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),uf_blockVS13[24].x) + -(uf_blockVS13[24].y));
R123i.x = clampFI32(R123i.x);
R125i.z = floatBitsToInt(uf_blockVS6[17].z + -(intBitsToFloat(R8i.z)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R18i.y)) + intBitsToFloat(PV0ix));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(R125i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),uf_blockVS13[22].x) + -(uf_blockVS13[22].y));
R123i.y = clampFI32(R123i.y);
R123i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS13[27].y,intBitsToFloat(PV1iw)) + uf_blockVS13[27].x);
R123i.z = clampFI32(R123i.z);
PV0iw = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
// 3
R123i.x = floatBitsToInt((intBitsToFloat(R126i.z) * intBitsToFloat(R126i.z) + intBitsToFloat(PV0ix)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), uf_blockVS13[26].w));
PV1iz = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
PV1iw = floatBitsToInt(uf_blockVS13[28].y + 1.0);
tempResultf = max(0.0, intBitsToFloat(PV0iw));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) * 1.5);
PV0ix = clampFI32(PV0ix);
PV0iy = floatBitsToInt(mul_nonIEEE(uf_blockVS13[24].w, intBitsToFloat(PS1i)));
R127i.z = floatBitsToInt((intBitsToFloat(R125i.y) * intBitsToFloat(R125i.y) + intBitsToFloat(R123i.x)));
R126i.w = floatBitsToInt(uf_blockVS13[28].y * 1.0 + intBitsToFloat(R9i.y));
tempResultf = max(0.0, intBitsToFloat(PV1iz));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 5
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS13[23].x, intBitsToFloat(PS0i)));
R124i.y = floatBitsToInt(intBitsToFloat(PV0ix) * 15.0);
R124i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS13[23].y, intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iy)));
// 6
R5i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)),uf_blockVS13[25].w) + uf_blockVS13[25].w);
tempResultf = 1.0 / sqrt(intBitsToFloat(R127i.z));
PS0i = floatBitsToInt(tempResultf);
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(exp2(intBitsToFloat(R124i.z)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(PV1ix),intBitsToFloat(PV1iy),intBitsToFloat(PV1iz),intBitsToFloat(0x80000000)),vec4(uf_blockVS13[28].x,uf_blockVS13[28].y,uf_blockVS13[28].z,0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R8i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R12i.x) * intBitsToFloat(R9i.z));
R11i.y = 0;
R126i.z = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
R12i.w = ((0.0 >= intBitsToFloat(R3i.w))?-1:0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(R127i.x)));
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(-(uf_blockVS13[23].z),intBitsToFloat(PS1i)) + uf_blockVS13[23].z);
R123i.x = clampFI32(R123i.x);
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R123i.z = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
PV0iw = floatBitsToInt(-(intBitsToFloat(PV1ix)) + 1.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R124i.y));
// 11
PV1ix = floatBitsToInt(-(intBitsToFloat(R5i.y)) + intBitsToFloat(R123i.x));
PV1ix = clampFI32(PV1ix);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(0xbe593484));
PV1iz = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS0i));
R126i.w = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3f333333) + intBitsToFloat(0x3e19999a));
R126i.w = clampFI32(R126i.w);
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0iy)));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3f22f983));
PV0iy = floatBitsToInt(max(intBitsToFloat(PV1iz), intBitsToFloat(0x3e4ccccd)));
R9i.z = PV1ix;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R123i.y)) + intBitsToFloat(0x3fc90da4));
R1i.z = PV1ix;
// 13
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),-(intBitsToFloat(R123i.w))) + 1.0);
R9i.y = floatBitsToInt(min(intBitsToFloat(PV0iy), 1.0));
PV1iz = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
R6i.w = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R4i.y = 0;
// 14
backupReg0i = R9i.x;
R9i.x = 0;
R7i.y = ((R12i.w == 0)?(backupReg0i):(R4i.y));
R4i.z = ((R12i.w == 0)?(R4i.z):(R6i.w));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + 2.5);
R2i.x = 0;
// 15
R11i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3daaaaab));
R6i.y = R14i.y;
R3i.z = R17i.z;
R2i.w = ((R12i.w == 0)?(R1i.w):(R9i.x));
R3i.x = R26i.x;
}
if( activeMaskStackC[3] == true ) {
R8i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y))).xyz);
R11i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R8i.x;
R8i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS11[2].w, uf_blockVS14[0].z));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R9i.y)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(R9i.y)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R9i.y)));
R5i.x = R13i.w;
// 1
R0i.x = ((R12i.w == 0)?(0):(0x3f800000));
R8i.y = R16i.z;
R8i.z = R2i.y;
R1i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS11[2].w, uf_blockVS14[0].w));
R122i.x = ((R12i.w == 0)?(0):(R5i.w));
// 2
R20i.x = ((R0i.x == 0)?(R5i.w):(R122i.x));
R123i.y = ((R12i.w == 0)?(0):(R9i.z));
R123i.z = ((R12i.w == 0)?(0):(R1i.y));
R123i.w = ((R12i.w == 0)?(0):(R11i.x));
R122i.x = ((R12i.w == 0)?(0):(R5i.y));
// 3
R22i.x = ((R0i.x == 0)?(R11i.x):(R123i.w));
R20i.y = ((R0i.x == 0)?(R1i.y):(R123i.z));
R20i.z = ((R0i.x == 0)?(R9i.z):(R123i.y));
R20i.w = ((R0i.x == 0)?(R5i.y):(R122i.x));
R122i.x = ((R12i.w == 0)?(0):(R126i.w));
// 4
R21i.x = ((R0i.x == 0)?(R126i.w):(R122i.x));
R123i.y = ((R12i.w == 0)?(0):(R124i.y));
R123i.z = ((R12i.w == 0)?(0):(R126i.z));
R123i.w = ((R12i.w == 0)?(0):(R17i.x));
R122i.x = ((R12i.w == 0)?(0):(R1i.z));
// 5
R18i.x = ((R0i.x == 0)?(R17i.x):(R123i.w));
R21i.y = ((R0i.x == 0)?(R126i.z):(R123i.z));
R21i.z = ((R0i.x == 0)?(R124i.y):(R123i.y));
R21i.w = ((R0i.x == 0)?(R1i.z):(R122i.x));
R122i.x = ((R12i.w == 0)?(0):(R11i.y));
// 6
R123i.x = ((R12i.w == 0)?(0):(R11i.z));
R22i.y = ((R0i.x == 0)?(R11i.y):(R122i.x));
R123i.z = ((R12i.w == 0)?(0):(R11i.w));
R123i.w = ((R12i.w == 0)?(0):(R17i.y));
R122i.x = ((R12i.w == 0)?(0):(R14i.z));
// 7
R11i.x = ((R12i.w == 0)?(0):(R3i.x));
R18i.y = ((R0i.x == 0)?(R17i.y):(R123i.w));
R22i.z = ((R0i.x == 0)?(R11i.z):(R123i.x));
R22i.w = ((R0i.x == 0)?(R11i.w):(R123i.z));
R18i.z = ((R0i.x == 0)?(R14i.z):(R122i.x));
// 8
R10i.x = ((R12i.w == 0)?(0):(R17i.w));
R11i.y = ((R12i.w == 0)?(0):(R3i.z));
R11i.z = ((R12i.w == 0)?(0):(R6i.y));
// 9
R3i.x = ((R12i.w == 0)?(0):(R3i.w));
R11i.w = floatBitsToInt(uf_blockVS11[3].w);
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[44].y,intBitsToFloat(R8i.x)) + intBitsToFloat(R0i.y));
R125i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[49].y,intBitsToFloat(R8i.x)) + intBitsToFloat(R1i.x));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockVS7[44].y, intBitsToFloat(R1i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[49].y, intBitsToFloat(R1i.w)));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), uf_blockVS7[54].y));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R11i.w)) + intBitsToFloat(R7i.w));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.w),intBitsToFloat(PV0iw)) + intBitsToFloat(R5i.z));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), uf_blockVS7[54].y));
// 2
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R4i.w)) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.w), intBitsToFloat(PV1iw)));
R6i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS8[3].x,intBitsToFloat(R3i.w)) + 0.0);
// 3
R123i.x = ((R12i.w == 0)?(0):(R1i.x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R0i.z)) + intBitsToFloat(PV0iz));
R125i.z = ((R12i.w == 0)?(0):(R1i.z));
R126i.w = ((R12i.w == 0)?(R6i.x):(R2i.x));
R122i.x = ((R12i.w == 0)?(0):(R127i.x));
// 4
R17i.x = ((R0i.x == 0)?(R1i.x):(R123i.x));
R123i.y = ((R12i.w == 0)?(0):(R125i.y));
R123i.z = ((R12i.w == 0)?(0):(R0i.y));
R123i.w = ((R12i.w == 0)?(0):(R124i.y));
R23i.x = ((R0i.x == 0)?(R127i.x):(R122i.x));
// 5
backupReg0i = R123i.w;
R123i.x = ((R12i.w == 0)?(0):(R126i.z));
R17i.y = ((R0i.x == 0)?(R0i.y):(R123i.z));
R23i.z = ((R0i.x == 0)?(R125i.y):(R123i.y));
R123i.w = ((R12i.w == 0)?(0):(R4i.x));
R23i.y = ((R0i.x == 0)?(R124i.y):(backupReg0i));
// 6
R19i.x = ((R0i.x == 0)?(R4i.x):(R123i.w));
R123i.y = ((R12i.w == 0)?(0):(R3i.y));
R123i.z = ((R12i.w == 0)?(0):(R2i.z));
R23i.w = ((R0i.x == 0)?(R126i.z):(R123i.x));
R125i.y = ((R12i.w == 0)?(0):(R4i.w));
// 7
R123i.x = ((R12i.w == 0)?(R16i.x):(R2i.x));
R19i.y = ((R0i.x == 0)?(R3i.y):(R123i.y));
R19i.z = ((R0i.x == 0)?(R2i.z):(R123i.z));
R123i.w = ((R12i.w == 0)?(R16i.y):(R2i.y));
R122i.x = R16i.z;
// 8
R16i.x = ((R0i.x == 0)?(R126i.w):(R123i.x));
R16i.y = ((R0i.x == 0)?(R8i.z):(R123i.w));
R16i.z = ((R0i.x == 0)?(R8i.y):(R122i.x));
R123i.w = ((R12i.w == 0)?(0):(R8i.w));
R122i.x = ((R12i.w == 0)?(0):(R12i.x));
// 9
R24i.x = ((R0i.x == 0)?(R8i.w):(R123i.w));
R24i.y = ((R0i.x == 0)?(R12i.x):(R122i.x));
R123i.z = ((R12i.w == 0)?(0):(R10i.y));
R123i.w = ((R12i.w == 0)?(0):(R10i.z));
R127i.x = ((R12i.w == 0)?(0):(R13i.x));
// 10
R123i.x = ((R12i.w == 0)?(0):(R12i.z));
R123i.y = ((R12i.w == 0)?(0):(R9i.w));
R24i.z = ((R0i.x == 0)?(R10i.z):(R123i.w));
R24i.w = ((R0i.x == 0)?(R10i.y):(R123i.z));
R122i.x = ((R12i.w == 0)?(0):(R12i.y));
// 11
R25i.x = ((R0i.x == 0)?(R9i.w):(R123i.y));
R25i.y = ((R0i.x == 0)?(R13i.x):(R127i.x));
R25i.z = ((R0i.x == 0)?(R12i.z):(R123i.x));
R25i.w = ((R0i.x == 0)?(R12i.y):(R122i.x));
R127i.x = ((R12i.w == 0)?(0):(R13i.z));
// 12
R126i.x = R14i.y;
R123i.y = ((R12i.w == 0)?(0):(R14i.x));
R123i.z = ((R12i.w == 0)?(0):(R10i.w));
R123i.w = ((R12i.w == 0)?(0):(R13i.y));
R122i.x = ((R12i.w == 0)?(R15i.x):(R4i.y));
// 13
R14i.x = ((R0i.x == 0)?(R14i.x):(R123i.y));
R14i.y = ((R0i.x == 0)?(R13i.z):(R127i.x));
R14i.z = ((R0i.x == 0)?(R13i.y):(R123i.w));
R14i.w = ((R0i.x == 0)?(R10i.w):(R123i.z));
R15i.x = ((R0i.x == 0)?(R7i.y):(R122i.x));
// 14
R123i.x = ((R12i.w == 0)?(R15i.y):(R9i.x));
PV0iy = R26i.x;
PV0iz = R17i.z;
R126i.w = ((R12i.w == 0)?(R15i.z):(R6i.w));
R19i.w = ((R0i.x == 0)?(R4i.w):(R125i.y));
// 15
R9i.x = ((R0i.x == 0)?(PV0iy):(R11i.x));
R9i.y = ((R0i.x == 0)?(R126i.x):(R11i.z));
R9i.z = ((R0i.x == 0)?(PV0iz):(R11i.y));
R15i.y = ((R0i.x == 0)?(R2i.w):(R123i.x));
// 16
R15i.z = ((R0i.x == 0)?(R4i.z):(R126i.w));
R18i.w = ((R0i.x == 0)?(R17i.w):(R10i.x));
R9i.w = R3i.x;
// 17
R123i.z = ((R12i.w == 0)?(R15i.w):(R13i.w));
R17i.z = ((R0i.x == 0)?(R1i.z):(R125i.z));
// 18
R15i.w = ((R0i.x == 0)?(R5i.x):(R123i.z));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R25i.x), intBitsToFloat(R25i.y), intBitsToFloat(R25i.z), intBitsToFloat(R25i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R24i.x), intBitsToFloat(R24i.y), intBitsToFloat(R24i.z), intBitsToFloat(R24i.w));
// export
passParameterSem5 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R23i.x), intBitsToFloat(R23i.y), intBitsToFloat(R23i.z), intBitsToFloat(R23i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w));
// export
passParameterSem12 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R22i.x), intBitsToFloat(R22i.y), intBitsToFloat(R22i.z), intBitsToFloat(R22i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R21i.x), intBitsToFloat(R21i.y), intBitsToFloat(R21i.z), intBitsToFloat(R21i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.z));
// export
passParameterSem9 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.z));
}
