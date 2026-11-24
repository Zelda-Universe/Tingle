#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 7c3ab94e9d4e1df5
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[43];
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
attrDecoder = attrDataSem7;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem3;
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem5;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem6;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem9;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R9i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem8;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
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
R0i.x = 0;
R9i.z = 0;
R12i.w = floatBitsToInt(-(intBitsToFloat(R6i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R5i.x = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R12i.w));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R11i.x = 0;
R11i.y = 0;
R11i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R12i.x = 0;
// 1
R18i.x = R5i.x;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R18i.x = R0i.x;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R18i.x == 0);
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
R0i.y = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R12i.w) >= intBitsToFloat(R0i.y));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R11i.x = 0;
R11i.y = 0;
R11i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R12i.x = 0;
// 1
R0i.x = R5i.x;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R0i.x == 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = uf_remappedVS[2].x & int(1);
R127i.y = uf_remappedVS[2].x & 0x4;
R127i.z = uf_remappedVS[2].x & 0x2;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(uf_remappedVS[3].x)));
R9i.w = int(intBitsToFloat(R7i.w));
// 1
PV1ix = floatBitsToInt((intBitsToFloat(uf_remappedVS[4].x) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[4].x))?1.0:0.0);
PV1iz = floatBitsToInt(max(intBitsToFloat(R8i.x), 0.0));
R127i.w = floatBitsToInt(intBitsToFloat(R12i.w) + intBitsToFloat(uf_remappedVS[3].z));
PS1i = floatBitsToInt(float(PV0ix));
// 2
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R125i.y = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iy)));
PV0iz = floatBitsToInt(min(intBitsToFloat(PV1iz), 0.0));
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PS0i = floatBitsToInt(float(R127i.z));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(uf_remappedVS[5].y)));
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R6i.x = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(PV0iz));
// 4
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iw)));
R127i.z = int(intBitsToFloat(PV1ix));
// 5
PV1iy = 0 - R127i.z;
R126i.y = int(intBitsToFloat(PV0iz));
// 6
backupReg0i = R127i.y;
PV0ix = 0 - R126i.y;
R127i.y = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
PV0iw = max(R127i.z, PV1iy);
PS0i = floatBitsToInt(float(backupReg0i));
// 7
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iw = max(R126i.y, PV0ix);
R125i.x = floatBitsToInt(float(PV0iw));
// 8
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].x)) + intBitsToFloat(uf_remappedVS[7].x));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iy)));
R125i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].y)) + intBitsToFloat(uf_remappedVS[7].y));
R126i.y = floatBitsToInt(float(PV1iw));
// 9
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].w)) + intBitsToFloat(uf_remappedVS[7].w));
R127i.x = int(intBitsToFloat(PV0iz));
// 10
PV0iw = 0 - R127i.x;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[8].z));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS0i));
PV1iy = max(R127i.x, PV0iw);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[4].x));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV1ix));
R124i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].x)) + intBitsToFloat(uf_remappedVS[9].x));
PV0iz = floatBitsToInt(intBitsToFloat(R12i.w) * intBitsToFloat(PS1i));
R125i.z = floatBitsToInt(float(PV1iy));
// 13
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].y)) + intBitsToFloat(uf_remappedVS[9].y));
PV1iy = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(fract(intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R0i.y));
// 14
PV0ix = floatBitsToInt(fract(intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x), intBitsToFloat(PV1iz)));
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + -(0.5));
R6i.z = floatBitsToInt(intBitsToFloat(R12i.w) * intBitsToFloat(PS1i));
// 15
PV1ix = floatBitsToInt(-(intBitsToFloat(PV0iy)) + 1.0);
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
R123i.z = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R127i.y)));
// 16
backupReg0i = R127i.z;
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.y = floatBitsToInt(max(intBitsToFloat(PV1ix), -(intBitsToFloat(PV1ix))));
R127i.z = floatBitsToInt(intBitsToFloat(PS1i) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 17
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(uf_remappedVS[6].w)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x), intBitsToFloat(PV0iw)));
PV1iz = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
PS1i = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(PS0i));
// 18
R124i.x = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(uf_remappedVS[7].w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV1iz)));
PV0iw = floatBitsToInt(-(intBitsToFloat(PV1iy)) + 1.0);
PS0i = floatBitsToInt(cos((intBitsToFloat(PV1iw))/0.1591549367));
// 19
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].x) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(intBitsToFloat(PS0i) + 1.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) / 2.0);
R126i.z = floatBitsToInt(max(intBitsToFloat(PV0iw), -(intBitsToFloat(PV0iw))));
R126i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].y) + intBitsToFloat(PV0iy));
R125i.w = ((intBitsToFloat(backupReg0i) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 20
PV0iy = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(uf_remappedVS[9].w)));
R127i.z = ((intBitsToFloat(R124i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x), intBitsToFloat(PV1iy)));
// 21
PV1ix = floatBitsToInt(-(intBitsToFloat(PV0iw)) + 1.0);
R125i.y = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].w)) + intBitsToFloat(uf_remappedVS[9].w));
// 22
R5i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV1ix),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),0.0)));
PV0iy = R5i.x;
PV0iz = R5i.x;
PV0iw = R5i.x;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 23
PV1ix = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(intBitsToFloat(R124i.y) * intBitsToFloat(PS0i));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].y), intBitsToFloat(R125i.y)));
R8i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].x), intBitsToFloat(R125i.y)));
PS1i = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
// 24
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1iy)));
PS0i = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
// 25
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].y) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].x) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV0iy)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].x), intBitsToFloat(PS0i)));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].y), intBitsToFloat(PS0i)));
// 26
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV1iz)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV1iz)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R124i.x)));
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R124i.x)));
R7i.w = 0x3f800000;
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R7i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R1i.z = tempi.x;
PV0iw = tempi.x;
R127i.z = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(R0i.w));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R7i.w))));
PV1ix = tempi.x;
R1i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.y = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(R5i.w));
// 2
R3i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R7i.w))));
PV0iy = R3i.x;
PV0iz = R3i.x;
PV0iw = R3i.x;
PS0i = floatBitsToInt(intBitsToFloat(R6i.w) + intBitsToFloat(R127i.z));
// 3
PV1ix = uf_remappedVS[10].x;
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) / 2.0);
PV1iy = uf_remappedVS[10].y;
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) / 2.0);
PV1iz = floatBitsToInt(intBitsToFloat(R8i.w) + intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(R125i.y));
R0i.z = floatBitsToInt(intBitsToFloat(R7i.z) * 1.0);
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(PV1iz)));
PV0iy = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(PV1iw));
R127i.z = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(PV1ix));
R126i.w = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(PV1iy));
PS0i = (R9i.w == int(1))?-1:0;
// 5
R123i.x = ((PS0i == 0)?(0xbf800000):(0xbf800000));
R123i.y = ((PS0i == 0)?(0x3f800000):(0xbf800000));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(PV0iy)));
PS1i = (R9i.w == 0x2)?-1:0;
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(uf_remappedVS[11].y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PV1iw)));
R123i.z = ((PS1i == 0)?(R123i.y):(0xbf800000));
R123i.w = ((PS1i == 0)?(R123i.x):(0x3f800000));
PS0i = (R9i.w == 0x3)?-1:0;
// 7
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R127i.z)));
R9i.y = ((PS0i == 0)?(R123i.w):(0x3f800000));
R5i.z = ((PS0i == 0)?(R123i.z):(0x3f800000));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(uf_remappedVS[11].z)));
R9i.w = 0x3f800000;
// 8
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R126i.w)));
// 9
R8i.w = 0x3f800000;
}
if( activeMaskStackC[3] == true ) {
// 0
R124i.x = uf_remappedVS[12].x;
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(uf_remappedVS[13].x)) + 0.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),intBitsToFloat(uf_remappedVS[13].x)) + 0.0);
R126i.w = uf_remappedVS[12].y;
// 1
R126i.x = uf_remappedVS[14].y;
R124i.y = uf_remappedVS[15].y;
R126i.z = uf_remappedVS[15].x;
R125i.w = uf_remappedVS[14].x;
// 2
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[14].z) * 1.0);
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[12].z) * 1.0);
// 3
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[15].z) * 1.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R126i.x)) + intBitsToFloat(PV0iy));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R126i.w)) + intBitsToFloat(PV0iz));
// 4
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R124i.x)) + intBitsToFloat(R123i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R124i.y)) + intBitsToFloat(PV1ix));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R125i.w)) + intBitsToFloat(R123i.z));
// 5
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R126i.z)) + intBitsToFloat(R123i.y));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R3i.y),intBitsToFloat(R0i.z),intBitsToFloat(R9i.w)),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 7
R9i.x = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0ix));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R3i.y),intBitsToFloat(R0i.z),intBitsToFloat(R9i.w)),vec4(intBitsToFloat(uf_remappedVS[14].x),intBitsToFloat(uf_remappedVS[14].y),intBitsToFloat(uf_remappedVS[14].z),intBitsToFloat(uf_remappedVS[14].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R3i.y),intBitsToFloat(R0i.z),intBitsToFloat(R9i.w)),vec4(intBitsToFloat(uf_remappedVS[15].x),intBitsToFloat(uf_remappedVS[15].y),intBitsToFloat(uf_remappedVS[15].z),intBitsToFloat(uf_remappedVS[15].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R3i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV0ix));
// 10
R0i.z = floatBitsToInt(intBitsToFloat(R3i.x) + intBitsToFloat(PV1ix));
}
if( activeMaskStackC[3] == true ) {
// 0
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[16].z)));
R124i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[16].w) * 1.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(uf_remappedVS[16].z)));
R3i.w = uf_remappedVS[17].x;
R6i.w = uf_remappedVS[17].y;
// 1
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].x), intBitsToFloat(uf_remappedVS[16].y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].x), intBitsToFloat(uf_remappedVS[16].x)));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R124i.x) + intBitsToFloat(PV1iy));
R9i.y = uf_remappedVS[17].z;
PV0iz = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1iw));
// 3
R123i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e22f983) + 0.5);
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[19].x)) + intBitsToFloat(uf_remappedVS[20].x));
R123i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e22f983) + 0.5);
// 4
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[19].w)) + intBitsToFloat(uf_remappedVS[20].w));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
// 5
R123i.x = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
R125i.y = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
R9i.w = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS1i));
// 7
R125i.w = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 8
PS0i = floatBitsToInt(cos((intBitsToFloat(R125i.y))/0.1591549367));
// 9
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PS0i)));
// 10
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(R124i.y)));
// 11
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(0xbccccccd));
// 12
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].y), intBitsToFloat(PV1iy)));
// 13
R2i.y = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(PV0iz));
// 14
R5i.x = uf_remappedVS[21].y;
R3i.y = uf_remappedVS[21].x;
R2i.w = uf_remappedVS[21].z;
}
if( activeMaskStackC[3] == true ) {
// 0
R2i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R2i.y),intBitsToFloat(R0i.z),intBitsToFloat(R8i.w)),vec4(intBitsToFloat(uf_remappedVS[22].x),intBitsToFloat(uf_remappedVS[22].y),intBitsToFloat(uf_remappedVS[22].z),intBitsToFloat(uf_remappedVS[22].w))));
PV0iy = R2i.x;
PV0iz = R2i.x;
PV0iw = R2i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R2i.y),intBitsToFloat(R0i.z),intBitsToFloat(R8i.w)),vec4(intBitsToFloat(uf_remappedVS[23].x),intBitsToFloat(uf_remappedVS[23].y),intBitsToFloat(uf_remappedVS[23].z),intBitsToFloat(uf_remappedVS[23].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R1i.z = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R2i.y),intBitsToFloat(R0i.z),intBitsToFloat(R8i.w)),vec4(intBitsToFloat(uf_remappedVS[24].x),intBitsToFloat(uf_remappedVS[24].y),intBitsToFloat(uf_remappedVS[24].z),intBitsToFloat(uf_remappedVS[24].w))));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R2i.y),intBitsToFloat(R0i.z),intBitsToFloat(R8i.w)),vec4(intBitsToFloat(uf_remappedVS[25].x),intBitsToFloat(uf_remappedVS[25].y),intBitsToFloat(uf_remappedVS[25].z),intBitsToFloat(uf_remappedVS[25].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R11i.w = tempi.x;
// 4
PV0ix = PV1ix;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
PV0iy = floatBitsToInt((intBitsToFloat(uf_remappedVS[26].y) > 0.0)?1.0:0.0);
R123i.z = floatBitsToInt(intBitsToFloat(R0i.y) * 0.0 + intBitsToFloat(PV1ix));
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[26].y))?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[26].y));
// 5
R123i.x = floatBitsToInt(intBitsToFloat(R0i.y) * 0.5 + intBitsToFloat(PV0ix));
PV1iy = floatBitsToInt(intBitsToFloat(R12i.w) * intBitsToFloat(PS0i));
R125i.w = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iw)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.z));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(PS1i));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(uf_remappedVS[4].z)) + intBitsToFloat(PV1iy));
R127i.z = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
PV0iw = uf_remappedVS[2].x & 0x80000;
// 7
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R124i.y = (PV0iw == 0x80000)?-1:0;
PV1iz = ((intBitsToFloat(R8i.x) > 0.5)?-1:0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(uf_remappedVS[1].w)) + -(intBitsToFloat(uf_remappedVS[1].y)));
// 8
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV1ix)));
R123i.z = floatBitsToInt(((PV1iz == 0)?(intBitsToFloat(R7i.x)):(-(intBitsToFloat(R7i.x)))));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R123i.w));
// 9
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R127i.z)) + intBitsToFloat(PV0iy));
R123i.y = ((R124i.y == 0)?(R7i.x):(R123i.z));
R6i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS0i));
// 10
PV0ix = uf_remappedVS[2].x & 0x100000;
R4i.y = floatBitsToInt(intBitsToFloat(R123i.y) + 0.5);
PV0iz = ((intBitsToFloat(R8i.y) > 0.5)?-1:0);
R4i.w = floatBitsToInt(fract(intBitsToFloat(R4i.w)));
// 11
R123i.y = floatBitsToInt(((PV0iz == 0)?(intBitsToFloat(R7i.y)):(-(intBitsToFloat(R7i.y)))));
PV1iw = (PV0ix == 0x100000)?-1:0;
// 12
R123i.x = ((PV1iw == 0)?(R7i.y):(R123i.y));
// 13
R8i.x = uf_remappedVS[27].x;
R8i.y = uf_remappedVS[27].y;
R8i.z = uf_remappedVS[27].z;
R7i.x = floatBitsToInt(intBitsToFloat(R123i.x) + -(0.5));
}
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R3i.x;
R3i.x = floatBitsToInt(-(intBitsToFloat(R9i.x)) + intBitsToFloat(R8i.x));
PV0iy = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(uf_remappedVS[20].w)));
R0i.z = floatBitsToInt(-(intBitsToFloat(R0i.z)) + intBitsToFloat(R8i.z));
PV0iw = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(uf_remappedVS[19].w)));
// 1
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(uf_remappedVS[28].x)));
R124i.y = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R9i.w)) + intBitsToFloat(uf_remappedVS[19].x));
R125i.w = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(uf_remappedVS[28].y)));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R124i.y)) + 1.0);
R125i.y = uf_remappedVS[29].x;
PV0iz = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
R126i.w = floatBitsToInt(intBitsToFloat(R12i.w) * 100.0);
R126i.w = clampFI32(R126i.w);
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(uf_remappedVS[28].z)));
// 3
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(uf_remappedVS[30].x)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PV0iz)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[19].x), intBitsToFloat(PV0ix)));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(uf_remappedVS[30].y)));
// 4
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R126i.w)));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R126i.w)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV1iy)) + intBitsToFloat(PV1iw));
R16i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(uf_remappedVS[30].w)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(uf_remappedVS[30].z)));
// 5
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R126i.w)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(R125i.w)) + intBitsToFloat(R123i.z));
// 6
R15i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(uf_remappedVS[28].w)));
// 7
R2i.x = uf_remappedVS[11].x;
R2i.y = floatBitsToInt(-(intBitsToFloat(R2i.y)) + intBitsToFloat(R8i.y));
}
if( activeMaskStackC[3] == true ) {
// 0
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(uf_remappedVS[31].x)));
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(uf_remappedVS[31].x)));
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(uf_remappedVS[31].x)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].x), intBitsToFloat(R4i.y)));
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[31].x), intBitsToFloat(R4i.x)));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R0i.z) * intBitsToFloat(R0i.z));
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[31].x), intBitsToFloat(R3i.y)));
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[31].x), intBitsToFloat(R1i.z)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[32].z));
// 2
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R126i.w)));
R123i.y = floatBitsToInt((intBitsToFloat(R2i.y) * intBitsToFloat(R2i.y) + intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[32].y)), intBitsToFloat(R7i.x)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[32].w));
// 3
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(PV0iz)));
R123i.z = floatBitsToInt((intBitsToFloat(R3i.x) * intBitsToFloat(R3i.x) + intBitsToFloat(R123i.y)));
R12i.y = uf_remappedVS[33].x;
// 4
R12i.x = floatBitsToInt(intBitsToFloat(R2i.x) * 1.0 + 0.0);
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.z));
PS0i = floatBitsToInt(tempResultf);
// 5
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PS0i)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PS0i)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PS0i)));
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R2i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[34].x),intBitsToFloat(uf_remappedVS[34].y),intBitsToFloat(uf_remappedVS[34].z),0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(intBitsToFloat(uf_remappedVS[34].y) + 1.0);
// 1
R124i.x = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
R124i.y = floatBitsToInt(intBitsToFloat(PS0i) * 1.5);
R124i.y = clampFI32(R124i.y);
PV1iz = floatBitsToInt(min(intBitsToFloat(R8i.y), intBitsToFloat(uf_remappedVS[35].z)));
R13i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(uf_remappedVS[36].z)));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(uf_remappedVS[37].x)) + -(intBitsToFloat(uf_remappedVS[37].y)));
R123i.x = clampFI32(R123i.x);
PV0iy = floatBitsToInt(-(intBitsToFloat(R1i.y)) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(-(intBitsToFloat(R124i.x)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(uf_remappedVS[38].x)) + -(intBitsToFloat(uf_remappedVS[38].y)));
R123i.w = clampFI32(R123i.w);
R122i.x = floatBitsToInt(intBitsToFloat(R124i.x) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
// 3
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R122i.x)) + intBitsToFloat(0xbe593484));
R125i.y = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
PV1iz = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].y),intBitsToFloat(PV0iy)) + intBitsToFloat(uf_remappedVS[35].x));
R123i.w = clampFI32(R123i.w);
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0iz)));
// 4
R8i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[34].y) * 1.0 + intBitsToFloat(R6i.z));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(uf_remappedVS[39].w)));
PV0iz = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3f22f983));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R123i.x)) + intBitsToFloat(0x3fc90da4));
tempResultf = max(0.0, intBitsToFloat(PV1iz));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 5
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),-(intBitsToFloat(R123i.w))) + 1.0);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[37].w), intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(intBitsToFloat(R124i.y) * 15.0);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(uf_remappedVS[40].x)));
tempResultf = max(0.0, intBitsToFloat(R125i.y));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[41].y), intBitsToFloat(PS1i)));
R123i.y = floatBitsToInt(intBitsToFloat(PV1iw) * 0.25 + 0.5);
R123i.y = clampFI32(R123i.y);
R6i.z = 0;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[41].x), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 7
R13i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)),intBitsToFloat(uf_remappedVS[42].w)) + intBitsToFloat(uf_remappedVS[42].w));
PV1iz = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 8
R2i.x = R0i.x;
R1i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + 8.5);
PS0i = floatBitsToInt(exp2(intBitsToFloat(R126i.w)));
// 9
R6i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3daaaaab));
R8i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[41].z)),intBitsToFloat(PS0i)) + intBitsToFloat(uf_remappedVS[41].z));
R8i.y = clampFI32(R8i.y);
R0i.x = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
}
if( activeMaskStackC[3] == true ) {
R1i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y))).xyz);
R14i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R6i.x),intBitsToFloat(R6i.z))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
R124i.x = floatBitsToInt(-(intBitsToFloat(R13i.w)) + intBitsToFloat(R8i.y));
R124i.x = clampFI32(R124i.x);
R2i.y = R5i.w;
PV0iw = floatBitsToInt(intBitsToFloat(R8i.x) * intBitsToFloat(R0i.x));
// 1
PV1iz = floatBitsToInt(max(intBitsToFloat(PV0iw), intBitsToFloat(0x3e4ccccd)));
R13i.z = R124i.x;
// 2
PV0iy = floatBitsToInt(min(intBitsToFloat(PV1iz), 1.0));
// 3
R17i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PV0iy)));
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PV0iy)));
R17i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PV0iy)));
R17i.w = R124i.x;
// 4
R6i.x = R4i.x;
R6i.y = R0i.y;
R6i.z = R9i.z;
// 5
R10i.x = R2i.x;
R10i.y = R2i.y;
R10i.z = R5i.z;
R10i.w = 0;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.z));
// export
passParameterSem8 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.z), intBitsToFloat(R6i.z));
}
