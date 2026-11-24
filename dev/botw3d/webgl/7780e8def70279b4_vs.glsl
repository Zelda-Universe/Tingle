#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 7780e8def70279b4
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[47];
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem2;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem3;
ATTR_LAYOUT(0, 4) in uvec4 attrDataSem4;

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem3;
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
R10i.y = floatBitsToInt(-(intBitsToFloat(R2i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R5i.z = 0;
R10i.z = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R10i.y));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R7i.x = 0;
R7i.y = 0;
R7i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R9i.x = 0;
// 1
R0i.z = R10i.z;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R0i.z = R5i.z;
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
PS0i = int(intBitsToFloat(R1i.w));
// 1
R0i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R10i.y) >= intBitsToFloat(R0i.z));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R7i.x = 0;
R7i.y = 0;
R7i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R9i.x = 0;
// 1
R5i.z = R10i.z;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R5i.z == 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R7i.x = floatBitsToInt(max(intBitsToFloat(R4i.x), 0.0));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(uf_remappedVS[2].y)));
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[3].x))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(uf_remappedVS[3].x) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[3].x));
// 1
R127i.x = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt(intBitsToFloat(R10i.y) + intBitsToFloat(uf_remappedVS[4].z));
PV1iz = floatBitsToInt(intBitsToFloat(R10i.y) * intBitsToFloat(PS0i));
R127i.w = floatBitsToInt(intBitsToFloat(R10i.y) + intBitsToFloat(uf_remappedVS[4].w));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[5].z));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV1iz));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(uf_remappedVS[4].x)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(PS1i));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(uf_remappedVS[4].y)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[5].w));
// 3
PV1ix = floatBitsToInt(fract(intBitsToFloat(PV0ix)));
PV1iy = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS0i));
R127i.z = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R127i.w = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R0i.z));
// 4
R125i.x = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV1iy));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x40c90fdb));
PV0iz = floatBitsToInt(intBitsToFloat(R10i.y) * intBitsToFloat(PS1i));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV1ix)));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].w)) + intBitsToFloat(uf_remappedVS[7].w));
// 5
R127i.x = uf_remappedVS[8].x & int(1);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(R127i.z)));
PV1iz = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(0x40c90fdb));
R125i.w = uf_remappedVS[8].x & 0x2;
R127i.z = uf_remappedVS[8].x & 0x4;
// 6
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].x)) + intBitsToFloat(uf_remappedVS[7].x));
R125i.z = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R126i.w));
R123i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3e22f983) + 0.5);
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].y)) + intBitsToFloat(uf_remappedVS[7].y));
// 7
R0i.x = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R0i.y = floatBitsToInt(fract(intBitsToFloat(R127i.w)));
R6i.z = floatBitsToInt(intBitsToFloat(R125i.z) + -(intBitsToFloat(uf_remappedVS[7].w)));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].w)) + intBitsToFloat(uf_remappedVS[9].w));
R124i.x = floatBitsToInt(1.0 / intBitsToFloat(R126i.z));
// 8
backupReg0i = R127i.y;
R6i.x = floatBitsToInt(fract(intBitsToFloat(R125i.x)));
R127i.y = floatBitsToInt(fract(intBitsToFloat(R126i.x)));
R124i.z = floatBitsToInt(intBitsToFloat(R125i.z) + -(intBitsToFloat(uf_remappedVS[6].w)));
R124i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(R124i.x));
R127i.x = floatBitsToInt(float(R127i.x));
// 9
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].x)) + intBitsToFloat(uf_remappedVS[9].x));
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].y)) + intBitsToFloat(uf_remappedVS[9].y));
R7i.z = ((intBitsToFloat(R6i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.w = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(backupReg0i));
R126i.z = floatBitsToInt(float(R125i.w));
// 10
backupReg0i = R127i.x;
backupReg1i = R127i.z;
R127i.x = floatBitsToInt(intBitsToFloat(R125i.z) + -(intBitsToFloat(uf_remappedVS[9].w)));
R125i.y = floatBitsToInt((intBitsToFloat(R126i.z) > 0.0)?1.0:0.0);
R127i.z = floatBitsToInt((intBitsToFloat(backupReg0i) > 0.0)?1.0:0.0);
R125i.w = floatBitsToInt((0.0 > intBitsToFloat(backupReg0i))?1.0:0.0);
PS0i = floatBitsToInt(float(backupReg1i));
// 11
backupReg0i = R127i.w;
R126i.x = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R124i.y = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R125i.z = floatBitsToInt(intBitsToFloat(R0i.x) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.w = floatBitsToInt((0.0 > intBitsToFloat(R126i.z))?1.0:0.0);
R126i.z = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 12
backupReg0i = R126i.w;
R125i.x = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.y = floatBitsToInt(intBitsToFloat(R6i.x) + -(0.5));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R124i.w)));
R126i.w = floatBitsToInt(intBitsToFloat(R0i.y) + -(0.5));
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(backupReg0i)));
// 13
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R124i.x) * intBitsToFloat(R126i.z));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(R126i.z));
R8i.z = ((intBitsToFloat(backupReg0i) >= 0.0)?(floatBitsToInt(1.0)):(0));
R124i.w = ((intBitsToFloat(R124i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R124i.x = floatBitsToInt(-(intBitsToFloat(R7i.z)) + 1.0);
// 14
backupReg0i = R126i.x;
backupReg1i = R125i.z;
R126i.x = floatBitsToInt(intBitsToFloat(R125i.y) + -(intBitsToFloat(R127i.w)));
R125i.y = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(R125i.w)));
R125i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(R124i.y)));
R125i.w = floatBitsToInt(intBitsToFloat(backupReg1i) * intBitsToFloat(0x3e22f983));
R127i.z = ((intBitsToFloat(R126i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 15
backupReg0i = R127i.x;
R127i.x = ((intBitsToFloat(R127i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].x) + intBitsToFloat(R0i.z));
R124i.z = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(0x3e22f983));
R126i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].y) + intBitsToFloat(R0i.x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(backupReg0i)));
// 16
backupReg0i = R126i.y;
PV0ix = floatBitsToInt(-(intBitsToFloat(R8i.z)) + 1.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R124i.x)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(backupReg0i)));
R124i.w = floatBitsToInt(-(intBitsToFloat(R124i.w)) + 1.0);
R124i.x = int(intBitsToFloat(R125i.y));
// 17
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(PV0ix)));
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].x) + intBitsToFloat(R127i.w));
R127i.w = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
R7i.z = int(intBitsToFloat(R126i.x));
// 18
backupReg0i = R127i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].x), intBitsToFloat(R124i.w)));
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].y) + intBitsToFloat(R126i.z));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R126i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R126i.y)));
R6i.y = int(intBitsToFloat(R125i.z));
// 19
R126i.x = 0 - R124i.x;
R126i.y = 0 - R7i.z;
R125i.z = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].y), intBitsToFloat(R124i.w)));
PS1i = floatBitsToInt(cos((intBitsToFloat(R125i.w))/0.1591549367));
// 20
backupReg0i = R0i.y;
R0i.x = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV1iw));
R0i.y = 0 - R6i.y;
R126i.z = floatBitsToInt(intBitsToFloat(PS1i) + 1.0);
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) / 2.0);
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].x), intBitsToFloat(backupReg0i)));
PS0i = floatBitsToInt(cos((intBitsToFloat(R124i.z))/0.1591549367));
// 21
backupReg0i = R6i.x;
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].x), intBitsToFloat(R127i.x)));
R7i.y = floatBitsToInt(intBitsToFloat(PS0i) + 1.0);
R7i.y = floatBitsToInt(intBitsToFloat(R7i.y) / 2.0);
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), intBitsToFloat(R127i.w)));
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), intBitsToFloat(backupReg0i)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R125i.y)));
// 22
R8i.x = max(R7i.z, R126i.y);
R8i.y = floatBitsToInt(intBitsToFloat(PS1i) + intBitsToFloat(R125i.z));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R125i.y)));
R7i.w = max(R124i.x, R126i.x);
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].x), intBitsToFloat(R126i.z)));
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(intBitsToFloat(R7i.z) + intBitsToFloat(R0i.x));
R127i.y = floatBitsToInt(-(intBitsToFloat(R0i.w)) + 1.0);
R126i.z = floatBitsToInt(-(intBitsToFloat(R6i.x)) + 1.0);
R127i.w = max(R6i.y, R0i.y);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), intBitsToFloat(R7i.y)));
// 1
R124i.x = floatBitsToInt(-(intBitsToFloat(R6i.z)) + 1.0);
PV1iy = floatBitsToInt(min(intBitsToFloat(R7i.x), 0.0));
R127i.z = floatBitsToInt(-(intBitsToFloat(R6i.w)) + 1.0);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].x), intBitsToFloat(R8i.z)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].y), intBitsToFloat(R8i.z)));
// 2
R0i.x = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV1iy));
R126i.y = floatBitsToInt(intBitsToFloat(PS1i) + intBitsToFloat(R126i.x));
R124i.z = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R8i.y));
R125i.w = floatBitsToInt(-(intBitsToFloat(R9i.y)) + 1.0);
R126i.x = floatBitsToInt(float(R7i.w));
// 3
backupReg0i = R127i.z;
R127i.x = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
R127i.y = floatBitsToInt(max(intBitsToFloat(R127i.y), -(intBitsToFloat(R127i.y))));
R127i.z = floatBitsToInt(max(intBitsToFloat(R126i.z), -(intBitsToFloat(R126i.z))));
R124i.w = floatBitsToInt(max(intBitsToFloat(backupReg0i), -(intBitsToFloat(backupReg0i))));
R125i.y = floatBitsToInt(float(R8i.x));
// 4
backupReg0i = R126i.y;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R124i.z)));
R126i.z = floatBitsToInt(max(intBitsToFloat(R124i.x), -(intBitsToFloat(R124i.x))));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(backupReg0i)));
R0i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[10].x)) + 1.0);
// 5
R7i.y = ((intBitsToFloat(uf_remappedVS[10].x) == 1.0)?-1:0);
R124i.z = floatBitsToInt(float(R127i.w));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R125i.y),intBitsToFloat(R124i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.w),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R125i.y),intBitsToFloat(R124i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R124i.w),intBitsToFloat(R126i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R126i.y)));
// 8
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R126i.w)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
backupReg0i = R8i.x;
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(uf_remappedVS[11].y)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[11].z)));
// 1
R1i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(R10i.y));
// 2
predResult = (R7i.y != 0);
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
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].w), intBitsToFloat(PV0ix)));
// 2
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].x), intBitsToFloat(PV1iw)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].y), intBitsToFloat(PV1iw)));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].z), intBitsToFloat(PV1iw)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
tempResultf = max(0.0, abs(intBitsToFloat(uf_remappedVS[10].x)));
tempResultf = log2(tempResultf);
PS0i = floatBitsToInt(tempResultf);
// 1
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f317218));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[10].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PS1i)));
R127i.y = ((intBitsToFloat(uf_remappedVS[10].x) == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R0i.z));
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
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].w), intBitsToFloat(PV1ix)));
// 9
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].x), intBitsToFloat(PV0iw)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].y), intBitsToFloat(PV0iw)));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].z), intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R6i.x = 0x3f800000;
R6i.y = floatBitsToInt(intBitsToFloat(R3i.z) * 1.0);
PV0iz = uf_remappedVS[13].y;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
PV0iw = uf_remappedVS[13].x;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[10].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R3i.x) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(PV0iz));
R0i.w = 0x3f800000;
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R0i.z));
// 2
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(PV1ix)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PV1iz)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(uf_remappedVS[13].z)));
R6i.w = 0x3f800000;
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 3
R127i.x = uf_remappedVS[8].x & 0x80000;
R126i.y = uf_remappedVS[8].x & 0x100000;
R125i.z = ((intBitsToFloat(R4i.x) > 0.5)?-1:0);
PV1iw = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R0i.x = floatBitsToInt(1.0 / intBitsToFloat(R8i.y));
// 4
R126i.x = ((intBitsToFloat(R4i.y) > 0.5)?-1:0);
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(R127i.z));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(uf_remappedVS[14].y)));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) * 2.0);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(uf_remappedVS[14].x)));
R126i.w = floatBitsToInt(intBitsToFloat(R126i.w) * 2.0);
PS0i = int(intBitsToFloat(uf_remappedVS[15].z));
// 5
R123i.x = ((R7i.y == 0)?(PV0iy):(R1i.w));
R125i.y = (R127i.x == 0x80000)?-1:0;
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[16].z) + intBitsToFloat(uf_remappedVS[14].x));
R125i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[16].w) + intBitsToFloat(uf_remappedVS[14].y));
R127i.w = floatBitsToInt(float(PS0i));
// 6
PV0ix = floatBitsToInt(-(abs(intBitsToFloat(R127i.w))) + 0.0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R123i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R123i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.x)));
PS0i = floatBitsToInt((0.0 >= abs(intBitsToFloat(R127i.w)))?1.0:0.0);
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV0iw));
R127i.y = ((intBitsToFloat(PS0i) == 0.0)?(0):(PV0ix));
PV1iz = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(abs(intBitsToFloat(R127i.w)) + intBitsToFloat(R127i.y));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV1iz)));
PS0i = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
// 9
R5i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV0iy));
R1i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV0ix));
R1i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0iw));
R123i.w = ((-(intBitsToFloat(R127i.y)) > 0.0)?(PV0iz):(R127i.y));
R127i.y = floatBitsToInt(trunc(intBitsToFloat(PS0i)));
// 10
backupReg0i = R125i.z;
backupReg1i = R126i.y;
R127i.x = floatBitsToInt(-(intBitsToFloat(R126i.w)) + intBitsToFloat(R127i.z));
R126i.y = ((intBitsToFloat(R127i.w) == 0.0)?(0):(R123i.w));
R125i.z = floatBitsToInt(-(intBitsToFloat(R126i.z)) + intBitsToFloat(R125i.w));
R127i.w = floatBitsToInt(((backupReg0i == 0)?(intBitsToFloat(R3i.x)):(-(intBitsToFloat(R3i.x)))));
R127i.z = (backupReg1i == 0x100000)?-1:0;
// 11
R123i.x = floatBitsToInt(((R126i.x == 0)?(intBitsToFloat(R3i.y)):(-(intBitsToFloat(R3i.y)))));
R124i.y = ((intBitsToFloat(R4i.z) > 0.5)?-1:0);
R126i.z = uf_remappedVS[8].x & 0x200000;
R126i.w = uf_remappedVS[8].x & 0x400000;
R125i.w = ((intBitsToFloat(R4i.w) > 0.5)?-1:0);
// 12
R1i.x = ((R125i.y == 0)?(R3i.x):(R127i.w));
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[17].x) + intBitsToFloat(uf_remappedVS[17].z));
R127i.z = ((R127i.z == 0)?(R3i.y):(R123i.x));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[17].y) + intBitsToFloat(uf_remappedVS[17].w));
R126i.x = int(intBitsToFloat(R126i.y));
// 13
backupReg0i = R127i.y;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(uf_remappedVS[17].z)) + intBitsToFloat(PV0iy));
R127i.y = (R126i.z == 0x200000)?-1:0;
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(uf_remappedVS[17].w)) + intBitsToFloat(PV0iw));
R127i.w = floatBitsToInt(((R124i.y == 0)?(intBitsToFloat(R3i.x)):(-(intBitsToFloat(R3i.x)))));
R124i.x = int(intBitsToFloat(backupReg0i));
// 14
PV0ix = (R126i.w == 0x400000)?-1:0;
R124i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R10i.y)),intBitsToFloat(uf_remappedVS[16].x)) + -(intBitsToFloat(R127i.x)));
R123i.z = floatBitsToInt(((R125i.w == 0)?(intBitsToFloat(R3i.y)):(-(intBitsToFloat(R3i.y)))));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(uf_remappedVS[16].y)) + intBitsToFloat(R125i.z));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[15].z));
// 15
R127i.x = ((R127i.y == 0)?(R3i.x):(R127i.w));
R126i.y = ((PV0ix == 0)?(R3i.y):(R123i.z));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[15].x), intBitsToFloat(PS0i)));
R127i.w = floatBitsToInt(intBitsToFloat(R1i.x) + 0.5);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[15].w));
// 16
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[15].y), intBitsToFloat(PS1i)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.z) + -(0.5));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(uf_remappedVS[14].w)) + intBitsToFloat(R126i.z));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(uf_remappedVS[14].z)) + intBitsToFloat(R125i.x));
PS0i = floatBitsToInt(float(backupReg0i));
// 17
R3i.x = uf_remappedVS[18].x;
R3i.y = uf_remappedVS[18].z;
R3i.z = uf_remappedVS[18].y;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(PS0i)) + intBitsToFloat(R124i.y));
PS1i = floatBitsToInt(float(R124i.x));
// 18
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.x)),intBitsToFloat(PS1i)) + intBitsToFloat(R126i.w));
PV0iy = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
R126i.z = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.w));
PS0i = floatBitsToInt(intBitsToFloat(R127i.x) + 0.5);
// 19
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.x)),intBitsToFloat(R127i.y)) + -(intBitsToFloat(R123i.x)));
R4i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.x)),intBitsToFloat(PV0iy)) + intBitsToFloat(R123i.w));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[19].x), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(intBitsToFloat(R126i.y) + -(0.5));
R1i.w = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[19].z));
// 20
R4i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[19].y)), intBitsToFloat(PV1iw)));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R126i.z)) + intBitsToFloat(R123i.x));
R1i.x = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[19].w));
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R6i.x)),vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w))));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R0i.y),intBitsToFloat(R6i.y),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(uf_remappedVS[22].x)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(uf_remappedVS[22].y)));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(uf_remappedVS[22].z)));
R4i.w = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV1ix));
// 3
PV1iy = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(R4i.w));
// 4
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(R0i.x));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iw)), intBitsToFloat(PV0iw)));
PV1iz = ((0.0 > intBitsToFloat(PV0iw))?-1:0);
// 6
R3i.w = ((PV1iz == 0)?(PV1ix):(PV1iy));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R6i.x)),vec4(intBitsToFloat(uf_remappedVS[23].x),intBitsToFloat(uf_remappedVS[23].y),intBitsToFloat(uf_remappedVS[23].z),intBitsToFloat(uf_remappedVS[23].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R127i.z = tempi.x;
PV1iw = tempi.x;
// 8
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R6i.x)),vec4(intBitsToFloat(uf_remappedVS[24].x),intBitsToFloat(uf_remappedVS[24].y),intBitsToFloat(uf_remappedVS[24].z),intBitsToFloat(uf_remappedVS[24].w))));
PV0iy = R126i.x;
PV0iz = R126i.x;
PV0iw = R126i.x;
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R0i.y),intBitsToFloat(R6i.y),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[25].x),intBitsToFloat(uf_remappedVS[25].y),intBitsToFloat(uf_remappedVS[25].z),intBitsToFloat(uf_remappedVS[25].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R0i.y),intBitsToFloat(R6i.y),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[26].x),intBitsToFloat(uf_remappedVS[26].y),intBitsToFloat(uf_remappedVS[26].z),intBitsToFloat(uf_remappedVS[26].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R6i.x = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1ix));
// 11
R3i.z = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV0ix));
}
if( activeMaskStackC[3] == true ) {
// 0
R7i.x = uf_remappedVS[27].x;
R0i.y = uf_remappedVS[27].y;
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(uf_remappedVS[28].w)));
// 1
R5i.x = uf_remappedVS[29].x;
R3i.w = uf_remappedVS[27].z;
// 2
R6i.y = uf_remappedVS[30].x;
}
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R0i.y;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(uf_remappedVS[31].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(uf_remappedVS[32].y)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[31].y)));
// 1
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(uf_remappedVS[31].z)));
R11i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(uf_remappedVS[22].w)));
R12i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(uf_remappedVS[31].w)));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[28].x), intBitsToFloat(R0i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[28].z), intBitsToFloat(R0i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[28].y), intBitsToFloat(R0i.y)));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(PV0iz)));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].w), intBitsToFloat(uf_remappedVS[33].w)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].w), intBitsToFloat(uf_remappedVS[33].z)));
// 2
R6i.x = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV1iy));
R6i.y = floatBitsToInt(intBitsToFloat(R4i.w) + intBitsToFloat(PV1ix));
R3i.z = floatBitsToInt(intBitsToFloat(R3i.z) + intBitsToFloat(PV1iz));
R4i.w = uf_remappedVS[34].w;
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R3i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(uf_remappedVS[35].x),intBitsToFloat(uf_remappedVS[35].y),intBitsToFloat(uf_remappedVS[35].z),intBitsToFloat(uf_remappedVS[35].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(uf_remappedVS[36].y)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[36].y)));
R127i.z = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV0ix));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[16].y), intBitsToFloat(R3i.w)));
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(R0i.y)) + intBitsToFloat(R4i.y));
// 2
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R3i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(uf_remappedVS[37].x),intBitsToFloat(uf_remappedVS[37].y),intBitsToFloat(uf_remappedVS[37].z),intBitsToFloat(uf_remappedVS[37].w))));
PV0iy = R126i.x;
PV0iz = R126i.x;
PV0iw = R126i.x;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(PV1ix)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R3i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(uf_remappedVS[38].x),intBitsToFloat(uf_remappedVS[38].y),intBitsToFloat(uf_remappedVS[38].z),intBitsToFloat(uf_remappedVS[38].w))));
PV1ix = tempi.x;
R124i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R4i.w)) + intBitsToFloat(R4i.z));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R3i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(uf_remappedVS[39].x),intBitsToFloat(uf_remappedVS[39].y),intBitsToFloat(uf_remappedVS[39].z),intBitsToFloat(uf_remappedVS[39].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R127i.w = tempi.x;
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(R2i.z)) + intBitsToFloat(R127i.y));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R124i.y),intBitsToFloat(R127i.z),intBitsToFloat(PV0ix)),vec4(intBitsToFloat(uf_remappedVS[40].x),intBitsToFloat(uf_remappedVS[40].y),intBitsToFloat(uf_remappedVS[40].z),intBitsToFloat(uf_remappedVS[40].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R8i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R4i.x)) + intBitsToFloat(R126i.y));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R124i.y),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w)),vec4(intBitsToFloat(uf_remappedVS[41].x),intBitsToFloat(uf_remappedVS[41].y),intBitsToFloat(uf_remappedVS[41].z),intBitsToFloat(uf_remappedVS[41].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 7
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(uf_remappedVS[42].x)));
R124i.y = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(PS0i));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(uf_remappedVS[42].x)));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(uf_remappedVS[42].x)));
// 8
R7i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R3i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(uf_remappedVS[43].x),intBitsToFloat(uf_remappedVS[43].y),intBitsToFloat(uf_remappedVS[43].z),intBitsToFloat(uf_remappedVS[43].w))));
PV0iy = R7i.x;
PV0iz = R7i.x;
PV0iw = R7i.x;
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R3i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(uf_remappedVS[44].x),intBitsToFloat(uf_remappedVS[44].y),intBitsToFloat(uf_remappedVS[44].z),intBitsToFloat(uf_remappedVS[44].w))));
PV1ix = tempi.x;
R7i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R3i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(uf_remappedVS[45].x),intBitsToFloat(uf_remappedVS[45].y),intBitsToFloat(uf_remappedVS[45].z),intBitsToFloat(uf_remappedVS[45].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R7i.w = tempi.x;
// 11
PV1ix = PV0ix;
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) / 2.0);
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[42].x), intBitsToFloat(R1i.y)));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R124i.y)));
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[42].x), intBitsToFloat(R0i.x)));
// 12
R6i.x = floatBitsToInt(intBitsToFloat(R7i.x) * 0.5 + intBitsToFloat(PV1ix));
R6i.y = floatBitsToInt(intBitsToFloat(R7i.y) * -(0.5) + intBitsToFloat(PV1ix));
R6i.z = floatBitsToInt(intBitsToFloat(R7i.z) * 0.5 + intBitsToFloat(PV1ix));
R6i.w = floatBitsToInt(intBitsToFloat(R7i.w) * 1.0);
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[42].x), intBitsToFloat(R1i.z)));
}
if( activeMaskStackC[3] == true ) {
// 0
R9i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[11].x) * 1.0 + 0.0);
R9i.y = uf_remappedVS[46].x;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.y), intBitsToFloat(R7i.z), intBitsToFloat(R7i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.z), intBitsToFloat(R6i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R8i.x), intBitsToFloat(R8i.y), intBitsToFloat(R8i.z), intBitsToFloat(R8i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.z));
}
