#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 868a47ab19193e83
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
ATTR_LAYOUT(0, 5) in uvec4 attrDataSem5;
ATTR_LAYOUT(0, 6) in uvec4 attrDataSem6;

out vec4 passParameterSem0;
out vec4 passParameterSem1;
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
R0i.x = 0;
R10i.z = 0;
R10i.w = floatBitsToInt(-(intBitsToFloat(R3i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R2i.x = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R10i.w));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R9i.x = 0;
R9i.y = 0;
R9i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R7i.x = 0;
// 1
R10i.x = R2i.x;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R10i.x = R0i.x;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R10i.x == 0);
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
R2i.y = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R10i.w) >= intBitsToFloat(R2i.y));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R9i.x = 0;
R9i.y = 0;
R9i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R7i.x = 0;
// 1
R0i.x = R2i.x;
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
R127i.x = uf_remappedVS[2].x & 0x4;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(uf_remappedVS[3].x)));
R127i.z = uf_remappedVS[2].x & 0x2;
PV0iw = uf_remappedVS[2].x & int(1);
PS0i = floatBitsToInt(max(intBitsToFloat(R5i.x), 0.0));
// 1
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[4].x))?1.0:0.0);
PV1iy = floatBitsToInt(min(intBitsToFloat(PS0i), 0.0));
R126i.z = floatBitsToInt(intBitsToFloat(R10i.w) + intBitsToFloat(uf_remappedVS[3].z));
PV1iw = floatBitsToInt((intBitsToFloat(uf_remappedVS[4].x) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(float(PV0iw));
// 2
R6i.x = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV1iy));
R124i.y = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PS0i = floatBitsToInt(float(R127i.z));
// 3
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(uf_remappedVS[5].y)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iw)));
PS1i = floatBitsToInt(float(R127i.x));
// 4
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R127i.z = int(intBitsToFloat(PV1iw));
// 5
PV1iy = 0 - R127i.z;
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iw)));
R127i.y = int(intBitsToFloat(PV0iz));
// 6
PV0ix = 0 - R127i.y;
R125i.y = floatBitsToInt(-(intBitsToFloat(R124i.y)) + 1.0);
PV0iw = max(R127i.z, PV1iy);
R127i.x = int(intBitsToFloat(PV1iz));
// 7
PV1iy = 0 - R127i.x;
PV1iw = max(R127i.y, PV0ix);
R125i.x = floatBitsToInt(float(PV0iw));
// 8
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].x)) + intBitsToFloat(uf_remappedVS[7].x));
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].y)) + intBitsToFloat(uf_remappedVS[7].y));
PV0iw = max(backupReg0i, PV1iy);
R0i.y = floatBitsToInt(float(PV1iw));
// 9
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].w)) + intBitsToFloat(uf_remappedVS[7].w));
R124i.z = floatBitsToInt(float(PV0iw));
// 10
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[8].z));
// 11
PV1iw = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[4].x));
// 12
backupReg0i = R2i.y;
PV0ix = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV1iw));
R2i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].x)) + intBitsToFloat(uf_remappedVS[9].x));
PV0iz = floatBitsToInt(intBitsToFloat(R10i.w) * intBitsToFloat(PS1i));
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].y)) + intBitsToFloat(uf_remappedVS[9].y));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 13
PV1ix = floatBitsToInt(fract(intBitsToFloat(PV0ix)));
PV1iy = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb));
R8i.w = floatBitsToInt(intBitsToFloat(R10i.w) * intBitsToFloat(PS0i));
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x), intBitsToFloat(PV1ix)));
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + -(0.5));
PV0iw = floatBitsToInt(fract(intBitsToFloat(PV1iy)));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(R125i.y)));
// 15
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iy = floatBitsToInt(-(intBitsToFloat(PV0ix)) + 1.0);
R123i.z = ((intBitsToFloat(PV0iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PV0iw)));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(R126i.y));
// 16
backupReg0i = R127i.y;
R123i.x = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.y = floatBitsToInt(max(intBitsToFloat(PV1iy), -(intBitsToFloat(PV1iy))));
R125i.z = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
R127i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(R126i.y));
// 17
R126i.x = floatBitsToInt(intBitsToFloat(R125i.z) + -(intBitsToFloat(uf_remappedVS[6].w)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x), intBitsToFloat(PV0iw)));
PV1iz = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 18
PV0ix = floatBitsToInt(-(intBitsToFloat(PV1iy)) + 1.0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R127i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R127i.x)));
R127i.w = floatBitsToInt(intBitsToFloat(R125i.z) + -(intBitsToFloat(uf_remappedVS[7].w)));
PS0i = floatBitsToInt(cos((intBitsToFloat(PV1iz))/0.1591549367));
// 19
R9i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].x) + intBitsToFloat(PV0iz));
R8i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].y) + intBitsToFloat(PV0iy));
R127i.z = floatBitsToInt(max(intBitsToFloat(PV0ix), -(intBitsToFloat(PV0ix))));
PV1iw = floatBitsToInt(intBitsToFloat(PS0i) + 1.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) / 2.0);
R125i.w = floatBitsToInt(intBitsToFloat(R125i.z) + -(intBitsToFloat(uf_remappedVS[9].w)));
// 20
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x), intBitsToFloat(PV1iw)));
// 21
PV1ix = floatBitsToInt(-(intBitsToFloat(PV0iz)) + 1.0);
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].w)) + intBitsToFloat(uf_remappedVS[9].w));
// 22
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R0i.y),intBitsToFloat(R124i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV1ix),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R3i.w = tempi.x;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 23
PV1ix = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(intBitsToFloat(R2i.y) * intBitsToFloat(PS0i));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].x)) + intBitsToFloat(uf_remappedVS[10].x));
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].y)) + intBitsToFloat(uf_remappedVS[10].y));
R7i.y = ((intBitsToFloat(R126i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 24
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[9].w)) + intBitsToFloat(uf_remappedVS[10].w));
R0i.y = floatBitsToInt(intBitsToFloat(R125i.z) + -(intBitsToFloat(uf_remappedVS[10].w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV1iy)));
R7i.x = ((intBitsToFloat(R127i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 25
R8i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].y) + intBitsToFloat(PV0iz));
R3i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].x) + intBitsToFloat(PV0iw));
R2i.z = ((intBitsToFloat(R0i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R1i.w = ((intBitsToFloat(R125i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 26
R2i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[10].y)) + intBitsToFloat(uf_remappedVS[11].y));
PV0iy = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS1i));
R2i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[10].x)) + intBitsToFloat(uf_remappedVS[11].x));
PS0i = floatBitsToInt(-(intBitsToFloat(R2i.z)) + 1.0);
// 27
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV0iz)));
R2i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[10].w)) + intBitsToFloat(uf_remappedVS[11].w));
R0i.z = floatBitsToInt(intBitsToFloat(R125i.z) + -(intBitsToFloat(uf_remappedVS[11].w)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV0iy)));
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PS0i)));
}
if( activeMaskStackC[3] == true ) {
// 0
R123i.x = ((intBitsToFloat(R0i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].y) + intBitsToFloat(R0i.w));
R125i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].x) + intBitsToFloat(R0i.x));
R125i.w = floatBitsToInt(-(intBitsToFloat(R1i.w)) + 1.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R2i.y));
// 1
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].x), intBitsToFloat(R123i.x)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].y), intBitsToFloat(R123i.x)));
PV1iz = floatBitsToInt(intBitsToFloat(R2i.x) * intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(intBitsToFloat(R2i.w) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
// 2
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PV1iz)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R3i.x)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R3i.x)));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(R125i.w)));
PV1iy = floatBitsToInt(-(intBitsToFloat(R7i.x)) + 1.0);
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[10].y) + intBitsToFloat(PV0iz));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[10].x) + intBitsToFloat(PV0iy));
R127i.y = floatBitsToInt(-(intBitsToFloat(R7i.y)) + 1.0);
// 4
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(PV1ix)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(PV1ix)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(backupReg0i)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(backupReg0i)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PV1iy)));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].x), intBitsToFloat(R127i.y)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].y), intBitsToFloat(R127i.y)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(PS0i)));
R0i.w = 0x3f800000;
// 6
PV0ix = uf_remappedVS[12].x;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PV1iy));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(PV1ix));
PV0iw = uf_remappedVS[12].y;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
R5i.z = floatBitsToInt(intBitsToFloat(R4i.z) * 1.0);
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV0iz));
R8i.y = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV0ix));
R0i.z = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV0iy));
R2i.w = 0x3f800000;
// 8
PV0iy = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV1iw));
PV0iz = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV1ix));
R5i.w = 0x3f800000;
R6i.z = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[13].x));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(PV0iz));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iy));
// 10
PV0iy = floatBitsToInt(intBitsToFloat(R124i.y) + intBitsToFloat(PV1iw));
PV0iz = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(PV1ix));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(PV0iz)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(PV0iy)));
// 12
PV0ix = floatBitsToInt((intBitsToFloat(uf_remappedVS[14].x) > 0.0)?1.0:0.0);
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(PV1iw)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[14].x))?1.0:0.0);
// 13
R6i.x = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[14].x));
// 14
R3i.z = floatBitsToInt(intBitsToFloat(R10i.w) * intBitsToFloat(PS1i));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(uf_remappedVS[15].y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(uf_remappedVS[15].z)));
// 1
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R8i.y)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(R0i.z)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(uf_remappedVS[4].y)) + intBitsToFloat(R3i.z));
R125i.w = floatBitsToInt(-(intBitsToFloat(R6i.x)) + 1.0);
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),intBitsToFloat(uf_remappedVS[16].w))));
PV0ix = tempi.x;
R6i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
// 3
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(PS0i)));
// 4
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),intBitsToFloat(R125i.w)) + intBitsToFloat(PV1iz));
// 5
R6i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[17].x),intBitsToFloat(uf_remappedVS[17].y),intBitsToFloat(uf_remappedVS[17].z),intBitsToFloat(uf_remappedVS[17].w))));
PV1iy = R6i.x;
PV1iz = R6i.x;
PV1iw = R6i.x;
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[18].x),intBitsToFloat(uf_remappedVS[18].y),intBitsToFloat(uf_remappedVS[18].z),intBitsToFloat(uf_remappedVS[18].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R0i.w = tempi.x;
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R8i.y),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[19].x),intBitsToFloat(uf_remappedVS[19].y),intBitsToFloat(uf_remappedVS[19].z),intBitsToFloat(uf_remappedVS[19].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R8i.y),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.w = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(PV0ix));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R8i.y),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.z = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV1ix));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(R6i.y) + -(intBitsToFloat(uf_remappedVS[22].x)));
R124i.y = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(intBitsToFloat(R6i.x) + -(intBitsToFloat(uf_remappedVS[22].y)));
PV1iw = floatBitsToInt(intBitsToFloat(R0i.w) + -(intBitsToFloat(uf_remappedVS[22].z)));
R5i.z = floatBitsToInt(-(intBitsToFloat(R6i.y)) + intBitsToFloat(R125i.w));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(PV1ix),intBitsToFloat(PV1iz),intBitsToFloat(PV1iw),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV1ix),intBitsToFloat(PV1iz),intBitsToFloat(PV1iw),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R8i.y = floatBitsToInt(-(intBitsToFloat(R6i.x)) + intBitsToFloat(R127i.z));
// 5
R1i.x = floatBitsToInt(-(intBitsToFloat(R0i.w)) + intBitsToFloat(R124i.y));
R1i.y = floatBitsToInt(intBitsToFloat(R7i.y) + -(intBitsToFloat(uf_remappedVS[23].w)));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[23].z)) + intBitsToFloat(uf_remappedVS[24].z));
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[23].w)) + intBitsToFloat(uf_remappedVS[24].w));
R2i.w = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 6
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[23].y)) + intBitsToFloat(uf_remappedVS[24].y));
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[23].x)) + intBitsToFloat(uf_remappedVS[24].x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(PS0i));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(PS0i));
R4i.w = floatBitsToInt(intBitsToFloat(R7i.y) + -(intBitsToFloat(uf_remappedVS[24].w)));
R124i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[24].z)) + intBitsToFloat(uf_remappedVS[25].z));
// 8
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(PV1ix)) + intBitsToFloat(uf_remappedVS[23].z));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(PV1iy)) + intBitsToFloat(uf_remappedVS[23].y));
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(PV1iz)) + intBitsToFloat(uf_remappedVS[23].x));
// 9
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[24].y)) + intBitsToFloat(uf_remappedVS[25].y));
R125i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[24].x)) + intBitsToFloat(uf_remappedVS[25].x));
// 10
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[24].w)) + intBitsToFloat(uf_remappedVS[25].w));
R3i.y = floatBitsToInt(intBitsToFloat(R7i.y) + -(intBitsToFloat(uf_remappedVS[25].w)));
// 11
R1i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[25].y)) + intBitsToFloat(uf_remappedVS[26].y));
R3i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[25].x)) + intBitsToFloat(uf_remappedVS[26].x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(R124i.y) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(PS1i));
R1i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[25].z)) + intBitsToFloat(uf_remappedVS[26].z));
R9i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[25].w)) + intBitsToFloat(uf_remappedVS[26].w));
// 13
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(PV0ix)) + intBitsToFloat(uf_remappedVS[24].z));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(PV0iy)) + intBitsToFloat(uf_remappedVS[24].y));
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(PV0iz)) + intBitsToFloat(uf_remappedVS[24].x));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iw = floatBitsToInt(min(intBitsToFloat(R2i.w), intBitsToFloat(uf_remappedVS[13].x)));
// 1
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(R6i.z));
R125i.w = floatBitsToInt(1.0 / intBitsToFloat(R9i.x));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PV1iy)));
PV0iz = floatBitsToInt(intBitsToFloat(R3i.w) * intBitsToFloat(R125i.w));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PV1iy)));
R124i.y = floatBitsToInt(intBitsToFloat(R1i.z) * intBitsToFloat(R125i.w));
// 3
backupReg0i = R6i.x;
R6i.x = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(PV0ix));
R6i.y = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV0iw));
R1i.z = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(intBitsToFloat(R1i.w) * intBitsToFloat(R125i.w));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(PV0iz)) + intBitsToFloat(uf_remappedVS[25].x));
// 4
R1i.x = ((intBitsToFloat(R1i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(PV1iw)) + intBitsToFloat(uf_remappedVS[25].z));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R124i.y)) + intBitsToFloat(uf_remappedVS[25].y));
R4i.w = ((intBitsToFloat(R4i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R5i.z = ((intBitsToFloat(R3i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
}
if( activeMaskStackC[3] == true ) {
// 0
R9i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R1i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedVS[27].x),intBitsToFloat(uf_remappedVS[27].y),intBitsToFloat(uf_remappedVS[27].z),intBitsToFloat(uf_remappedVS[27].w))));
PV0iy = R9i.x;
PV0iz = R9i.x;
PV0iw = R9i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R1i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedVS[28].x),intBitsToFloat(uf_remappedVS[28].y),intBitsToFloat(uf_remappedVS[28].z),intBitsToFloat(uf_remappedVS[28].w))));
PV1ix = tempi.x;
R9i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R1i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedVS[29].x),intBitsToFloat(uf_remappedVS[29].y),intBitsToFloat(uf_remappedVS[29].z),intBitsToFloat(uf_remappedVS[29].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R9i.z = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R1i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedVS[30].x),intBitsToFloat(uf_remappedVS[30].y),intBitsToFloat(uf_remappedVS[30].z),intBitsToFloat(uf_remappedVS[30].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R9i.w = tempi.x;
PS1i = floatBitsToInt(-(intBitsToFloat(R5i.z)) + 1.0);
// 4
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(intBitsToFloat(R7i.y) + -(intBitsToFloat(uf_remappedVS[26].w)));
PV0iz = floatBitsToInt(-(intBitsToFloat(R1i.x)) + 1.0);
PV0iw = floatBitsToInt(-(intBitsToFloat(R4i.w)) + 1.0);
// 5
R126i.x = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[23].x), intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[23].y), intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[23].z), intBitsToFloat(PV0iz)));
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(PV1iz)) + intBitsToFloat(PV1iw));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w),intBitsToFloat(PV1iz)) + intBitsToFloat(PV1iy));
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(PV1iz)) + intBitsToFloat(PS1i));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[31].x)) + intBitsToFloat(uf_remappedVS[32].x));
// 7
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(R125i.x)) + intBitsToFloat(R123i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R125i.x)) + intBitsToFloat(backupReg0i));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PV0iz)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R125i.x)) + intBitsToFloat(R123i.w));
PS1i = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[31].w)) + intBitsToFloat(uf_remappedVS[32].w));
// 8
backupReg0i = R123i.y;
R125i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[32].x)) + intBitsToFloat(uf_remappedVS[33].x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(PV1iz)) + intBitsToFloat(R123i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(PV1iz)) + intBitsToFloat(backupReg0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(PV1iz)) + intBitsToFloat(R123i.x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 9
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[26].x),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.w));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[26].y),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.z));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[26].z),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.y));
R0i.w = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS0i));
// 10
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[32].w)) + intBitsToFloat(uf_remappedVS[33].w));
// 11
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[33].x)) + intBitsToFloat(uf_remappedVS[34].x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 12
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[33].w)) + intBitsToFloat(uf_remappedVS[34].w));
R2i.y = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(PS1i));
// 13
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 14
R7i.w = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS1i));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[14].y))?1.0:0.0);
PV0iy = floatBitsToInt((intBitsToFloat(uf_remappedVS[14].y) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(uf_remappedVS[14].z) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[14].z))?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[14].y));
// 1
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(uf_remappedVS[35].x)));
PV1iy = floatBitsToInt(intBitsToFloat(R10i.w) * intBitsToFloat(PS0i));
R125i.z = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iw)));
R125i.w = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[35].y)));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(uf_remappedVS[4].z)) + intBitsToFloat(PV1iy));
R124i.y = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
R127i.z = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(uf_remappedVS[35].z)));
// 3
PV1iw = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[14].z));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R10i.w) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV1iw)));
// 5
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),intBitsToFloat(R127i.z)) + intBitsToFloat(PV0iy));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(uf_remappedVS[4].w)) + intBitsToFloat(PV0ix));
// 6
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PV0iz)));
// 8
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),intBitsToFloat(R124i.y)) + intBitsToFloat(PV1ix));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iy = floatBitsToInt(intBitsToFloat(R1i.x) + -(intBitsToFloat(uf_remappedVS[32].w)));
PV0iw = floatBitsToInt(intBitsToFloat(R1i.x) + -(intBitsToFloat(uf_remappedVS[31].w)));
// 1
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R2i.y)) + intBitsToFloat(uf_remappedVS[32].x));
R124i.y = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R0i.w)) + intBitsToFloat(uf_remappedVS[31].x));
R125i.w = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
PV0iy = floatBitsToInt(-(intBitsToFloat(R124i.y)) + 1.0);
PV0iz = floatBitsToInt(intBitsToFloat(R1i.x) + -(intBitsToFloat(uf_remappedVS[34].w)));
PV0iw = floatBitsToInt(intBitsToFloat(R1i.x) + -(intBitsToFloat(uf_remappedVS[33].w)));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PV0ix)));
R124i.y = ((intBitsToFloat(PV0iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R7i.w)) + intBitsToFloat(uf_remappedVS[33].x));
R126i.w = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[31].x), intBitsToFloat(PV0iy)));
// 4
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(PV1ix)) + intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(-(intBitsToFloat(R124i.y)) + 1.0);
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
R124i.w = floatBitsToInt(intBitsToFloat(R6i.w) + -(intBitsToFloat(uf_remappedVS[36].w)));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[36].z)) + intBitsToFloat(uf_remappedVS[37].z));
// 5
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[36].x)) + intBitsToFloat(uf_remappedVS[37].x));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV0iz)));
R125i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[36].y)) + intBitsToFloat(uf_remappedVS[37].y));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV0iy)));
// 6
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(intBitsToFloat(R6i.w) + -(intBitsToFloat(uf_remappedVS[37].w)));
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[36].w)) + intBitsToFloat(uf_remappedVS[37].w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(PV1iy)) + intBitsToFloat(R126i.x));
// 7
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[37].y)) + intBitsToFloat(uf_remappedVS[38].y));
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[37].x)) + intBitsToFloat(uf_remappedVS[38].x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R126i.w)) + intBitsToFloat(R123i.w));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 8
backupReg0i = R125i.z;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS1i));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[34].x),intBitsToFloat(R124i.y)) + intBitsToFloat(R123i.z));
R125i.z = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
R127i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(PS1i));
R124i.z = floatBitsToInt(intBitsToFloat(R6i.w) + -(intBitsToFloat(uf_remappedVS[38].w)));
// 9
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[39].x)));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[39].x)));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[39].x)));
R11i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(uf_remappedVS[35].w)));
R127i.z = ((intBitsToFloat(R124i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 10
backupReg0i = R125i.z;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(R127i.w)) + intBitsToFloat(uf_remappedVS[36].y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(R127i.x)) + intBitsToFloat(uf_remappedVS[36].x));
R125i.z = ((intBitsToFloat(R125i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(backupReg0i)) + intBitsToFloat(uf_remappedVS[36].z));
R124i.x = ((intBitsToFloat(R124i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 11
PV1ix = floatBitsToInt(-(intBitsToFloat(R124i.x)) + 1.0);
PV1iy = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
PV1iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[37].w)) + intBitsToFloat(uf_remappedVS[38].w));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[37].z)) + intBitsToFloat(uf_remappedVS[38].z));
R124i.w = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
// 12
backupReg0i = R127i.z;
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[38].y)) + intBitsToFloat(uf_remappedVS[40].y));
R124i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[38].x)) + intBitsToFloat(uf_remappedVS[40].x));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PV1ix)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV1iy)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(PS0i));
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[38].z)) + intBitsToFloat(uf_remappedVS[40].z));
PV1iz = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[38].w)) + intBitsToFloat(uf_remappedVS[40].w));
// 14
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(PV1iw)) + intBitsToFloat(uf_remappedVS[37].y));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(PV1ix)) + intBitsToFloat(uf_remappedVS[37].x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(PV1iz)) + intBitsToFloat(uf_remappedVS[37].z));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 15
PV1ix = floatBitsToInt(intBitsToFloat(R124i.y) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(intBitsToFloat(R6i.w) + -(intBitsToFloat(uf_remappedVS[40].w)));
PV1iz = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].x), intBitsToFloat(R124i.w)));
// 16
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(PV1iw)) + intBitsToFloat(uf_remappedVS[38].y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(PV1ix)) + intBitsToFloat(uf_remappedVS[38].x));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(PV1iz)) + intBitsToFloat(uf_remappedVS[38].z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R125i.w)) + intBitsToFloat(PS1i));
R125i.z = ((intBitsToFloat(PV1iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 17
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.w));
PV1iy = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].y), intBitsToFloat(R124i.w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].z), intBitsToFloat(R124i.w)));
// 18
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(PV1iy)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R125i.w)) + intBitsToFloat(PV1iw));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R125i.w)) + intBitsToFloat(PV1iz));
// 19
backupReg0i = R123i.y;
backupReg1i = R123i.z;
PV1ix = ((intBitsToFloat(R5i.x) > 0.5)?-1:0);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R124i.x)) + intBitsToFloat(R127i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R127i.z)) + intBitsToFloat(backupReg0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R127i.z)) + intBitsToFloat(backupReg1i));
// 20
backupReg0i = R124i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R124i.x)) + intBitsToFloat(R123i.w));
PV0iy = ((intBitsToFloat(R5i.y) > 0.5)?-1:0);
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].x),intBitsToFloat(R125i.z)) + intBitsToFloat(R123i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R124i.x)) + intBitsToFloat(R123i.z));
R6i.z = floatBitsToInt(((PV1ix == 0)?(intBitsToFloat(R4i.x)):(-(intBitsToFloat(R4i.x)))));
// 21
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].z),intBitsToFloat(R125i.z)) + intBitsToFloat(R123i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].y),intBitsToFloat(R125i.z)) + intBitsToFloat(backupReg0i));
R3i.z = floatBitsToInt(((PV0iy == 0)?(intBitsToFloat(R4i.y)):(-(intBitsToFloat(R4i.y)))));
// 22
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(uf_remappedVS[41].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(uf_remappedVS[41].y)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(uf_remappedVS[41].z)));
// 23
R6i.w = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[42].z));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = uf_remappedVS[2].x & 0x100000;
PV0iy = uf_remappedVS[2].x & 0x80000;
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[14].w))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(uf_remappedVS[14].w) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[14].w));
// 1
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[43].x)) + intBitsToFloat(uf_remappedVS[44].x));
R127i.y = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
PV1iz = (PV0iy == 0x80000)?-1:0;
PV1iw = floatBitsToInt(intBitsToFloat(R10i.w) * intBitsToFloat(PS0i));
PS1i = (PV0ix == 0x100000)?-1:0;
// 2
R123i.x = ((PS1i == 0)?(R4i.y):(R3i.z));
R123i.y = ((PV1iz == 0)?(R4i.x):(R6i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(uf_remappedVS[5].x)) + intBitsToFloat(PV1iw));
R127i.w = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
// 3
R4i.x = floatBitsToInt(intBitsToFloat(R123i.x) + -(0.5));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
R3i.z = floatBitsToInt(intBitsToFloat(R123i.y) + 0.5);
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[43].w)) + intBitsToFloat(uf_remappedVS[44].w));
// 4
R124i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[44].x)) + intBitsToFloat(uf_remappedVS[45].x));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV1iy)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iw));
// 5
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[44].w)) + intBitsToFloat(uf_remappedVS[45].w));
R127i.y = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(PS0i));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iw));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R125i.z) + -(intBitsToFloat(uf_remappedVS[43].w)));
R127i.w = floatBitsToInt(intBitsToFloat(R125i.z) + -(intBitsToFloat(uf_remappedVS[44].w)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 7
backupReg0i = R125i.z;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R127i.y)) + intBitsToFloat(uf_remappedVS[43].x));
R127i.y = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.z = ((intBitsToFloat(R127i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iw = floatBitsToInt(intBitsToFloat(R124i.z) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(uf_remappedVS[45].w)));
// 8
R124i.x = ((intBitsToFloat(PS1i) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV1iw)) + intBitsToFloat(uf_remappedVS[44].x));
PV0iw = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[43].x), intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(-(intBitsToFloat(R124i.x)) + 1.0);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV0iw)));
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PV1iy)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PV1iz)) + intBitsToFloat(PV1ix));
// 11
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(PV0ix)) + intBitsToFloat(R123i.w));
// 12
R8i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[45].x),intBitsToFloat(R124i.x)) + intBitsToFloat(R123i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].x), intBitsToFloat(R0i.x)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].x), intBitsToFloat(R0i.y)));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].x), intBitsToFloat(R0i.z)));
R8i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(uf_remappedVS[41].w)));
// 1
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[42].x), intBitsToFloat(R3i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[42].y)), intBitsToFloat(R4i.x)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[42].w));
// 2
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1iy)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(PV1iz)));
R7i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[15].x) * 1.0);
}
if( activeMaskStackC[3] == true ) {
// 0
R7i.y = uf_remappedVS[46].x;
// 1
R3i.x = R0i.x;
R3i.y = R0i.y;
R3i.z = R10i.z;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R8i.x), intBitsToFloat(R8i.y), intBitsToFloat(R8i.z), intBitsToFloat(R8i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.y), intBitsToFloat(R7i.z), intBitsToFloat(R7i.z));
// export
passParameterSem8 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.z));
}
