#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader cb134e6e130c24a7
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[40];
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem2;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem3;
ATTR_LAYOUT(0, 4) in uvec4 attrDataSem4;
ATTR_LAYOUT(0, 5) in uvec4 attrDataSem5;
ATTR_LAYOUT(0, 6) in uvec4 attrDataSem6;
ATTR_LAYOUT(0, 7) in uvec4 attrDataSem7;
ATTR_LAYOUT(0, 8) in uvec4 attrDataSem8;

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
ivec4 R13i = ivec4(0);
ivec4 R14i = ivec4(0);
ivec4 R15i = ivec4(0);
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
attrDecoder = attrDataSem3;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem8;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem7;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem0;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem1;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem5;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem4;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R11i.x = floatBitsToInt(-(intBitsToFloat(R2i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R0i.z = 0;
R10i.w = floatBitsToInt(-(intBitsToFloat(R6i.x)) + 1.0);
R6i.z = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R11i.x));
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
R12i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R13i.x = 0;
// 1
R8i.z = R6i.z;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R8i.z = R0i.z;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R8i.z == 0);
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
R0i.y = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R11i.x) >= intBitsToFloat(R0i.y));
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
R12i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R13i.x = 0;
// 1
R0i.z = R6i.z;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R0i.z == 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R11i.x) + intBitsToFloat(uf_remappedVS[2].z));
PV0iz = floatBitsToInt(max(intBitsToFloat(R4i.x), 0.0));
R127i.w = floatBitsToInt(intBitsToFloat(R11i.x) + intBitsToFloat(uf_remappedVS[2].w));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[3].z));
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(uf_remappedVS[2].y)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(uf_remappedVS[2].x)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(PS0i));
R124i.w = floatBitsToInt(min(intBitsToFloat(PV0iz), 0.0));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[3].w));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(PV1iz));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
PV0iz = uf_remappedVS[4].x & int(1);
R127i.w = uf_remappedVS[4].x & 0x2;
R127i.y = uf_remappedVS[4].x & 0x4;
// 3
PV1ix = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(uf_remappedVS[5].y)));
R125i.w = floatBitsToInt(fract(intBitsToFloat(PV0ix)));
R127i.x = floatBitsToInt(float(PV0iz));
// 4
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
R125i.y = floatBitsToInt(fract(intBitsToFloat(PV1ix)));
R127i.z = floatBitsToInt((intBitsToFloat(R127i.x) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb));
R126i.x = floatBitsToInt(float(R127i.w));
// 5
backupReg0i = R127i.y;
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
R127i.y = floatBitsToInt((0.0 > intBitsToFloat(R127i.x))?1.0:0.0);
R123i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
R127i.w = floatBitsToInt((intBitsToFloat(R126i.x) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(float(backupReg0i));
// 6
backupReg0i = R126i.x;
R126i.x = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(backupReg0i))?1.0:0.0);
R126i.w = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R126i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 7
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iy = floatBitsToInt(intBitsToFloat(R125i.y) + -(0.5));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(R127i.y)));
PV1iw = floatBitsToInt(intBitsToFloat(R125i.w) + -(0.5));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(PV0iz)));
// 8
R127i.x = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(0x3e22f983));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.w) + -(intBitsToFloat(R126i.x)));
R123i.z = ((intBitsToFloat(PV1iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.w = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
R122i.x = ((intBitsToFloat(PV1iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 9
PV1ix = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].x), intBitsToFloat(R125i.w)));
PV1iz = floatBitsToInt(-(intBitsToFloat(R122i.x)) + 1.0);
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].y), intBitsToFloat(R125i.y)));
R126i.x = int(intBitsToFloat(R127i.z));
// 10
backupReg0i = R127i.y;
R124i.x = floatBitsToInt(-(intBitsToFloat(PV1iy)) + 1.0);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].y), intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].x), intBitsToFloat(PV1ix)));
PV0iw = 0 - R126i.x;
R125i.x = int(intBitsToFloat(backupReg0i));
// 11
backupReg0i = R126i.y;
R0i.x = floatBitsToInt(-(intBitsToFloat(PV0iz)) + 1.0);
R126i.y = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
R127i.z = max(R126i.x, PV0iw);
PV1iw = 0 - R125i.x;
R126i.x = int(intBitsToFloat(backupReg0i));
// 12
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
R127i.y = floatBitsToInt(max(intBitsToFloat(R124i.x), -(intBitsToFloat(R124i.x))));
R126i.z = max(R125i.x, PV1iw);
PV0iw = 0 - R126i.x;
PS0i = floatBitsToInt(cos((intBitsToFloat(backupReg0i))/0.1591549367));
// 13
backupReg0i = R126i.y;
backupReg1i = R126i.w;
R126i.x = max(R126i.x, PV0iw);
R126i.y = floatBitsToInt(max(intBitsToFloat(R0i.x), -(intBitsToFloat(R0i.x))));
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) + 1.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) / 2.0);
R126i.w = floatBitsToInt(max(intBitsToFloat(backupReg0i), -(intBitsToFloat(backupReg0i))));
PS1i = floatBitsToInt(cos((intBitsToFloat(backupReg1i))/0.1591549367));
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].x), intBitsToFloat(PV1iz)));
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + 1.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
R125i.z = floatBitsToInt(max(intBitsToFloat(R127i.x), -(intBitsToFloat(R127i.x))));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(uf_remappedVS[5].z)));
R0i.x = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(R124i.w));
// 15
backupReg0i = R127i.z;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].y), intBitsToFloat(PV0iy)));
R7i.y = floatBitsToInt(intBitsToFloat(PV0iw) * 1.0);
R127i.z = floatBitsToInt(-(intBitsToFloat(PV0ix)) + 1.0);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[5].x)));
R127i.x = floatBitsToInt(float(backupReg0i));
// 16
R125i.x = floatBitsToInt(-(intBitsToFloat(PV1ix)) + 1.0);
R8i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].x)) + 1.0);
R1i.w = ((intBitsToFloat(uf_remappedVS[6].x) == 1.0)?-1:0);
R125i.y = floatBitsToInt(float(R126i.z));
// 17
R126i.z = floatBitsToInt(float(R126i.x));
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.z),intBitsToFloat(R127i.y),intBitsToFloat(R126i.y),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.w),intBitsToFloat(R125i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R124i.w)));
// 20
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R124i.z)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[7].y)));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[7].z)));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(uf_remappedVS[7].w)));
// 1
R7i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(R11i.x));
// 2
predResult = (R1i.w != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R7i.z)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].w), intBitsToFloat(PV0ix)));
// 2
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x), intBitsToFloat(PV1iw)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].y), intBitsToFloat(PV1iw)));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].z), intBitsToFloat(PV1iw)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
tempResultf = max(0.0, abs(intBitsToFloat(uf_remappedVS[6].x)));
tempResultf = log2(tempResultf);
PS0i = floatBitsToInt(tempResultf);
// 1
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f317218));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[6].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(PS1i)));
R127i.y = ((intBitsToFloat(uf_remappedVS[6].x) == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R8i.y));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R7i.z) + -(intBitsToFloat(PV1iz)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].w), intBitsToFloat(PV1ix)));
// 9
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x), intBitsToFloat(PV0iw)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].y), intBitsToFloat(PV0iw)));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].z), intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(R4i.y));
PV0iy = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(R4i.z));
PV0iz = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(R4i.z));
R0i.w = 0x3f800000;
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[6].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) * 0.5);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * 0.5);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) * 0.5);
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R8i.y));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) + -(0.5));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
R0i.y = floatBitsToInt(intBitsToFloat(R4i.x) + -(0.5));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iz) + -(0.5));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
R127i.w = floatBitsToInt(intBitsToFloat(PV1iw) + -(0.5));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
// 3
R0i.x = floatBitsToInt(intBitsToFloat(R4i.y) + -(0.5));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedVS[9].x)));
R6i.z = floatBitsToInt(intBitsToFloat(R4i.z) + -(0.5));
PV1iw = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(uf_remappedVS[9].y)));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(R127i.y));
R7i.y = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(uf_remappedVS[10].x));
R0i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[10].y) + intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(uf_remappedVS[9].z)));
// 5
PV1ix = uf_remappedVS[4].x & 0x10000;
R8i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[10].z) + intBitsToFloat(PV0iw));
R123i.z = ((R1i.w == 0)?(PV0ix):(R7i.z));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R123i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R123i.z)));
R127i.z = uf_remappedVS[4].x & 0x20000;
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.z)));
PS0i = floatBitsToInt(float(PV1ix));
// 7
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(PV0iy));
PS1i = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
// 8
PV0ix = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV1iy)));
R127i.w = floatBitsToInt(float(R127i.z));
// 9
R5i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV0iy));
R1i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV0iz));
R5i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0iw));
R126i.w = floatBitsToInt((intBitsToFloat(R127i.w) > 0.0)?1.0:0.0);
R127i.z = int(intBitsToFloat(PV0ix));
// 10
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(R127i.w))?1.0:0.0);
PV0iy = uf_remappedVS[4].x & 0x40000;
PV0iz = R4i.y;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
PV0iw = 0 - R127i.z;
PS0i = R4i.z;
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 11
PV1ix = floatBitsToInt(floor(intBitsToFloat(PV0iz)));
PV1iy = max(R127i.z, PV0iw);
R127i.z = floatBitsToInt(intBitsToFloat(R126i.w) + -(intBitsToFloat(PV0ix)));
R1i.w = floatBitsToInt(floor(intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(float(PV0iy));
// 12
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt((intBitsToFloat(PV1ix) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PV1ix))?1.0:0.0);
R127i.x = floatBitsToInt(float(PV1iy));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
// 13
R1i.x = floatBitsToInt((intBitsToFloat(R1i.w) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iz)));
R126i.w = int(intBitsToFloat(R127i.z));
// 14
PV0iy = 0 - R126i.w;
R5i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.x)), intBitsToFloat(PV1iy)));
R127i.y = int(intBitsToFloat(PV1iw));
// 15
PV1ix = max(R126i.w, PV0iy);
PV1iy = 0 - R127i.y;
// 16
PV0iz = max(R127i.y, PV1iy);
R1i.z = floatBitsToInt(float(PV1ix));
R1i.z = floatBitsToInt(intBitsToFloat(R1i.z) * 2.0);
// 17
R2i.w = floatBitsToInt(float(PV0iz));
R2i.w = floatBitsToInt(intBitsToFloat(R2i.w) * 2.0);
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R1i.y),intBitsToFloat(R5i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w))));
PV0ix = tempi.x;
R5i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
R8i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R1i.y),intBitsToFloat(R5i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w))));
PV1iy = R8i.x;
PV1iz = R8i.x;
PV1iw = R8i.x;
PS1i = floatBitsToInt((0.0 > intBitsToFloat(R1i.w))?1.0:0.0);
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R1i.x) + -(intBitsToFloat(PS1i)));
// 3
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.z)), intBitsToFloat(PV0ix)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R1i.y),intBitsToFloat(R5i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),intBitsToFloat(uf_remappedVS[13].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R1i.z = tempi.x;
PV0iw = tempi.x;
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[14].x)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(R5i.w)));
PV1iz = R4i.x;
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 2.0);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R127i.z)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[14].y)));
// 6
R127i.x = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(PV1iy));
R126i.y = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV1iw));
R127i.z = floatBitsToInt(intBitsToFloat(PV1ix) + 0.0);
PV0iw = floatBitsToInt(floor(intBitsToFloat(PV1iz)));
R125i.w = floatBitsToInt(intBitsToFloat(PS1i) + 0.0);
// 7
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PV0iw))?1.0:0.0);
PV1iy = floatBitsToInt((intBitsToFloat(PV0iw) > 0.0)?1.0:0.0);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(uf_remappedVS[14].z)));
R126i.w = ((intBitsToFloat(uf_remappedVS[10].w) == 1.0)?-1:0);
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[10].w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 8
R126i.x = floatBitsToInt(intBitsToFloat(PV1iz) + 0.0);
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[10].w)) + 1.0);
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(PS1i)));
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.w)), intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
// 10
PV0ix = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(PS0i));
R127i.w = floatBitsToInt(intBitsToFloat(R8i.y) + intBitsToFloat(PV0iz));
// 12
R123i.z = ((R126i.w == 0)?(PV1ix):(R11i.x));
// 13
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R123i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R123i.z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R123i.z)));
// 14
R5i.x = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1iw));
PV0iz = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV1iz));
// 15
R123i.x = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.w = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3e22f983) + 0.5);
// 16
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
// 17
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 18
R0i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R127i.z = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 19
R2i.w = floatBitsToInt(sin((intBitsToFloat(R127i.z))/0.1591549367));
// 20
R8i.y = floatBitsToInt(cos((intBitsToFloat(R127i.z))/0.1591549367));
// 21
R5i.w = floatBitsToInt(sin((intBitsToFloat(R0i.x))/0.1591549367));
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.y = floatBitsToInt(-(intBitsToFloat(R1i.z)) + intBitsToFloat(uf_remappedVS[15].z));
R125i.w = floatBitsToInt(-(intBitsToFloat(R5i.y)) + intBitsToFloat(uf_remappedVS[15].x));
// 1
PV1ix = floatBitsToInt((0.0 > -(intBitsToFloat(R125i.w)))?1.0:0.0);
PV1iy = floatBitsToInt((-(intBitsToFloat(R125i.w)) > 0.0)?1.0:0.0);
R124i.z = ((intBitsToFloat(R126i.y) == 0.0)?-1:0);
R127i.w = ((-(intBitsToFloat(R125i.w)) == 0.0)?-1:0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.y));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R125i.w)) * intBitsToFloat(PS1i));
PV0iy = ((0.0 > intBitsToFloat(R126i.y))?-1:0);
R125i.z = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1ix)));
R127i.y = floatBitsToInt(cos((intBitsToFloat(R0i.x))/0.1591549367));
// 3
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PV0ix))?1.0:0.0);
R127i.z = floatBitsToInt(max(intBitsToFloat(PV0ix), -(intBitsToFloat(PV0ix))));
PV1iw = floatBitsToInt((intBitsToFloat(PV0ix) > 0.0)?1.0:0.0);
R6i.z = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(0x3fc90fdb));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iy)));
R127i.w = ((intBitsToFloat(R127i.z) > 1.0)?-1:0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3fc90fdb));
R126i.z = floatBitsToInt(((R127i.w == 0)?(intBitsToFloat(PV0ix)):(-(intBitsToFloat(PV0ix)))));
R123i.w = ((R127i.w == 0)?(R127i.z):(PS0i));
// 6
PV0ix = floatBitsToInt(min(intBitsToFloat(R123i.w), 1.0));
R126i.y = ((R127i.w == 0)?(0):(PV1ix));
R5i.z = floatBitsToInt(-(intBitsToFloat(R5i.w)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(R127i.y)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R127i.y)));
// 7
R127i.z = floatBitsToInt(max(intBitsToFloat(PV0ix), -(1.0)));
// 8
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.z)));
// 9
R123i.y = floatBitsToInt(intBitsToFloat(0x3edcf805) * intBitsToFloat(R127i.w) + 1.0);
R123i.z = floatBitsToInt(intBitsToFloat(0x3d6ee04d) * intBitsToFloat(R127i.w) + intBitsToFloat(0x3f43b24e));
// 10
R126i.x = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R127i.z)), intBitsToFloat(R123i.y)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R123i.z)) + 1.0);
// 11
R125i.x = floatBitsToInt(intBitsToFloat(R5i.y) + -(intBitsToFloat(uf_remappedVS[15].x)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.x), intBitsToFloat(uf_remappedVS[16].z)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.w));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS1i)));
R125i.y = floatBitsToInt(intBitsToFloat(R8i.x) + -(intBitsToFloat(uf_remappedVS[15].y)));
// 13
R126i.x = floatBitsToInt(intBitsToFloat(R1i.z) + -(intBitsToFloat(uf_remappedVS[15].z)));
R123i.z = ((intBitsToFloat(R127i.z) > 0.0)?(PV0ix):(floatBitsToInt(-(intBitsToFloat(PV0ix)))));
// 14
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(R126i.y));
// 15
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(R127i.w))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(R127i.w) > 0.0)?1.0:0.0);
// 16
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iy)));
// 17
PV1iw = floatBitsToInt(-(intBitsToFloat(R125i.z)) + intBitsToFloat(PV0ix));
// 18
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3fc90fdb));
// 19
PV1ix = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(PV0iy)));
// 20
R123i.z = ((R127i.x == 0)?(PV1ix):(0x40490fdb));
// 21
R123i.w = ((R124i.z == 0)?(R123i.z):(R6i.z));
// 22
PV0ix = floatBitsToInt(intBitsToFloat(R5i.x) + -(intBitsToFloat(R123i.w)));
// 23
R123i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iy = uf_remappedVS[16].y;
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) / 2.0);
PV1iw = uf_remappedVS[16].x;
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) / 2.0);
// 24
R5i.x = floatBitsToInt(intBitsToFloat(R3i.x) + intBitsToFloat(PV1iw));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
R0i.z = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(PV1iy));
// 25
R123i.w = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 26
R126i.y = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
// 27
tempi.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R125i.x)),-(intBitsToFloat(R125i.y)),-(intBitsToFloat(R126i.x)),intBitsToFloat(0x80000000)),vec4(-(intBitsToFloat(R125i.x)),-(intBitsToFloat(R125i.y)),-(intBitsToFloat(R126i.x)),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R124i.z = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(sin((intBitsToFloat(R126i.y))/0.1591549367));
// 28
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PS1i)));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R127i.y)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(cos((intBitsToFloat(R126i.y))/0.1591549367));
// 29
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R127i.y)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(R125i.z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(R127i.x)));
// 30
R1i.x = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV1iy)));
R5i.w = floatBitsToInt(-(intBitsToFloat(PV1iw)) + intBitsToFloat(PV1iz));
tempResultf = 1.0 / sqrt(intBitsToFloat(R124i.z));
PS0i = floatBitsToInt(tempResultf);
// 31
R7i.x = floatBitsToInt(-(intBitsToFloat(R125i.z)) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.x)), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)), intBitsToFloat(PS0i)));
R2i.w = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.x)), intBitsToFloat(PS0i)));
// 32
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV1iz)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV1iy)));
R2i.z = 0x3f800000;
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PS1i)));
// 33
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.x),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.x),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(R1i.y));
// 34
R10i.x = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(R1i.y));
PV0iy = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(R9i.x));
PV0iz = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(R1i.w));
R3i.w = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(R9i.x));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 35
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.z = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 36
R7i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(R1i.w));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 37
PV1iw = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(R125i.z));
// 38
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(PV1iw)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.x), intBitsToFloat(PV1iw)));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(PV1iw)));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R6i.z)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R0i.z)));
R0i.z = 0x3f800000;
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(R5i.x)));
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(R0i.x));
// 1
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV0ix)));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R5i.z)) + intBitsToFloat(PV1iz));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R0i.w)) + intBitsToFloat(PV1iw));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(PV1iy));
// 3
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R2i.w)) + intBitsToFloat(R123i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R2i.x)) + intBitsToFloat(backupReg0i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R7i.x)) + intBitsToFloat(R123i.w));
// 4
R2i.x = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(R123i.z));
R0i.y = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(R123i.x));
R125i.z = uf_remappedVS[17].x;
R2i.w = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(R123i.y));
R124i.z = uf_remappedVS[17].y;
// 5
R125i.y = uf_remappedVS[18].x;
PV1iz = floatBitsToInt(-(intBitsToFloat(R8i.x)) + intBitsToFloat(R0i.y));
R125i.w = uf_remappedVS[17].z;
// 6
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(uf_remappedVS[19].x)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(R127i.w));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(uf_remappedVS[19].y)));
// 7
PV1ix = ((0.0 > intBitsToFloat(PV0iy))?-1:0);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(uf_remappedVS[19].z)));
PV1iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iy)), intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(PV0iy)));
// 8
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(uf_remappedVS[19].w)));
R5i.y = ((PV1ix == 0)?(PV1iw):(PV1iz));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(uf_remappedVS[20].x)));
// 9
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(uf_remappedVS[20].x)));
R8i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(uf_remappedVS[20].x)));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(uf_remappedVS[21].w)));
// 1
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedVS[22].y)));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[21].z), intBitsToFloat(PV1iz)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[21].y), intBitsToFloat(PV1iz)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[21].x), intBitsToFloat(PV1iz)));
// 3
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PV0iy)));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(PV1iy));
// 5
backupReg0i = R9i.x;
R9i.x = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV0ix));
R1i.y = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV0iz));
R1i.z = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(PV0iw));
// 6
PV0ix = ((intBitsToFloat(R4i.x) > 0.5)?-1:0);
// 7
R6i.z = uf_remappedVS[23].z;
R6i.w = uf_remappedVS[23].w;
R5i.z = ((PV0ix == 0)?(R6i.x):(R10i.w));
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R2i.z)),vec4(intBitsToFloat(uf_remappedVS[24].x),intBitsToFloat(uf_remappedVS[24].y),intBitsToFloat(uf_remappedVS[24].z),intBitsToFloat(uf_remappedVS[24].w))));
PV0ix = tempi.x;
R7i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
R2i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R2i.z)),vec4(intBitsToFloat(uf_remappedVS[25].x),intBitsToFloat(uf_remappedVS[25].y),intBitsToFloat(uf_remappedVS[25].z),intBitsToFloat(uf_remappedVS[25].w))));
PV1iy = R2i.x;
PV1iz = R2i.x;
PV1iw = R2i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R2i.z)),vec4(intBitsToFloat(uf_remappedVS[26].x),intBitsToFloat(uf_remappedVS[26].y),intBitsToFloat(uf_remappedVS[26].z),intBitsToFloat(uf_remappedVS[26].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R0i.w = tempi.x;
R125i.z = ((intBitsToFloat(R4i.y) > 0.5)?-1:0);
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R2i.z)),vec4(intBitsToFloat(uf_remappedVS[27].x),intBitsToFloat(uf_remappedVS[27].y),intBitsToFloat(uf_remappedVS[27].z),intBitsToFloat(uf_remappedVS[27].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R11i.z = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(-(intBitsToFloat(R6i.y)) + 1.0);
// 4
PV0ix = PV1ix;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
R0i.y = ((R125i.z == 0)?(R6i.y):(PS1i));
R3i.z = floatBitsToInt(intBitsToFloat(R0i.w) * 0.0 + intBitsToFloat(PV1ix));
R1i.w = uf_remappedVS[28].x;
R9i.x = uf_remappedVS[28].y;
// 5
R123i.x = floatBitsToInt(intBitsToFloat(R0i.w) * 0.0 + intBitsToFloat(PV0ix));
R1i.y = uf_remappedVS[29].x;
R1i.z = uf_remappedVS[28].z;
R5i.w = floatBitsToInt(intBitsToFloat(R0i.w) * 0.5 + intBitsToFloat(PV0ix));
// 6
R8i.x = floatBitsToInt(intBitsToFloat(R7i.y) * 0.5 + intBitsToFloat(R123i.x));
R3i.y = floatBitsToInt(intBitsToFloat(R2i.x) * -(0.5) + intBitsToFloat(R123i.x));
R125i.z = ((intBitsToFloat(R4i.z) > 0.5)?-1:0);
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R3i.w),intBitsToFloat(R7i.z),intBitsToFloat(R0i.z)),vec4(intBitsToFloat(uf_remappedVS[26].x),intBitsToFloat(uf_remappedVS[26].y),intBitsToFloat(uf_remappedVS[26].z),intBitsToFloat(uf_remappedVS[26].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R124i.z = tempi.x;
PV1iw = tempi.x;
R0i.x = R10i.w;
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R3i.w),intBitsToFloat(R7i.z),intBitsToFloat(R0i.z)),vec4(intBitsToFloat(uf_remappedVS[27].x),intBitsToFloat(uf_remappedVS[27].y),intBitsToFloat(uf_remappedVS[27].z),intBitsToFloat(uf_remappedVS[27].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.z = ((R125i.z == 0)?(R6i.x):(R0i.x));
// 9
R10i.x = R6i.y;
PV1iy = PV0ix;
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) / 2.0);
R123i.z = floatBitsToInt(intBitsToFloat(R124i.z) * 0.0 + intBitsToFloat(PV0ix));
// 10
R123i.x = floatBitsToInt(intBitsToFloat(R124i.z) * 0.5 + intBitsToFloat(PV1iy));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R123i.z));
// 11
PV1iy = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(PS0i));
R3i.w = ((intBitsToFloat(R4i.w) > 0.5)?-1:0);
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].w), intBitsToFloat(PV1iy)));
// 13
PV1iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].y)) + intBitsToFloat(PV0ix));
// 14
R8i.y = uf_remappedVS[1].y;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
// 15
R5i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS0i));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(uf_remappedVS[30].y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(uf_remappedVS[30].x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(uf_remappedVS[30].z)));
R7i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[30].w)));
// 1
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[20].x), intBitsToFloat(PV0ix)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[20].x), intBitsToFloat(PV0iy)));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[20].x), intBitsToFloat(PV0iz)));
PS1i = int(intBitsToFloat(uf_remappedVS[31].z));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(uf_remappedVS[32].x)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[33].w) + intBitsToFloat(uf_remappedVS[32].y));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(uf_remappedVS[32].y)));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[33].z) + intBitsToFloat(uf_remappedVS[32].x));
R125i.x = floatBitsToInt(float(PS1i));
// 3
PV1ix = floatBitsToInt(-(abs(intBitsToFloat(R125i.x))) + 0.0);
R1i.y = floatBitsToInt(-(intBitsToFloat(PV0ix)) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt((0.0 >= abs(intBitsToFloat(R125i.x)))?1.0:0.0);
R1i.w = floatBitsToInt(-(intBitsToFloat(PV0iz)) + intBitsToFloat(PV0iy));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R125i.x));
// 4
R124i.z = ((intBitsToFloat(PV1iz) == 0.0)?(0):(PV1ix));
PV0iw = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[31].z));
// 5
PV1ix = floatBitsToInt(abs(intBitsToFloat(R125i.x)) + intBitsToFloat(R124i.z));
PV1iy = floatBitsToInt(trunc(intBitsToFloat(PV0iw)));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[31].x), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[31].w));
// 6
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[31].y), intBitsToFloat(PS1i)));
R123i.w = ((-(intBitsToFloat(R124i.z)) > 0.0)?(PV1ix):(R124i.z));
R1i.z = int(intBitsToFloat(PV1iy));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[34].x) + intBitsToFloat(uf_remappedVS[34].z));
R123i.y = ((intBitsToFloat(R125i.x) == 0.0)?(0):(R123i.w));
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[34].y) + intBitsToFloat(uf_remappedVS[34].w));
// 8
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(uf_remappedVS[34].z)) + intBitsToFloat(PV1ix));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(uf_remappedVS[34].w)) + intBitsToFloat(PV1iz));
R4i.z = int(intBitsToFloat(R123i.y));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iy = uf_remappedVS[4].x & 0x100000;
PV0iw = uf_remappedVS[4].x & 0x80000;
// 1
PV1ix = (PV0iy == 0x100000)?-1:0;
PV1iy = (PV0iw == 0x80000)?-1:0;
PV1iz = uf_remappedVS[4].x & 0x200000;
PV1iw = uf_remappedVS[4].x & 0x400000;
R127i.y = floatBitsToInt(float(R4i.z));
// 2
R125i.x = ((PV1ix == 0)?(R6i.y):(R0i.y));
PV0iy = (PV1iz == 0x200000)?-1:0;
R124i.z = (PV1iw == 0x400000)?-1:0;
R126i.w = ((PV1iy == 0)?(R6i.x):(R5i.z));
R122i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R11i.x)),intBitsToFloat(uf_remappedVS[33].x)) + -(intBitsToFloat(R1i.y)));
// 3
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R127i.y)) + intBitsToFloat(R122i.x));
R127i.y = ((PV0iy == 0)?(R6i.y):(R10i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x),intBitsToFloat(uf_remappedVS[33].y)) + intBitsToFloat(R1i.w));
R125i.w = ((PV0iy == 0)?(R6i.x):(R0i.z));
PS1i = floatBitsToInt(float(R1i.z));
// 4
R123i.x = ((R3i.w == 0)?(R125i.w):(R125i.w));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
R125i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.z)),intBitsToFloat(PS1i)) + intBitsToFloat(R123i.z));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x),intBitsToFloat(uf_remappedVS[32].z)) + intBitsToFloat(R7i.z));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x),intBitsToFloat(uf_remappedVS[32].w)) + intBitsToFloat(R4i.w));
// 5
backupReg0i = R123i.x;
R123i.x = ((R3i.w == 0)?(R127i.y):(PV0iy));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R2i.z)) + -(0.5));
R123i.w = ((R124i.z == 0)?(R125i.w):(backupReg0i));
R125i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[35].z));
// 6
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R2i.w)) + -(0.5));
R123i.y = ((R124i.z == 0)?(R127i.y):(backupReg0i));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(uf_remappedVS[35].x)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R123i.z)) + -(intBitsToFloat(R125i.z)));
R125i.z = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[35].w));
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(R123i.x)) + intBitsToFloat(R126i.x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV0iz)));
R2i.z = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(uf_remappedVS[35].y)));
R6i.y = floatBitsToInt(intBitsToFloat(R8i.y) * 5.0);
// 8
R6i.x = floatBitsToInt(intBitsToFloat(R123i.x) + 0.5);
R8i.y = 0;
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PV1iw)));
R2i.w = 0;
}
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = 0;
R125i.y = floatBitsToInt(intBitsToFloat(R5i.y) + -(intBitsToFloat(uf_remappedVS[36].x)));
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[36].x)) + intBitsToFloat(uf_remappedVS[36].y));
R1i.y = uf_remappedVS[37].x;
// 1
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[22].w), intBitsToFloat(R6i.w)));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[22].w), intBitsToFloat(R6i.z)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 2
R6i.w = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(PS1i));
R6i.w = clampFI32(R6i.w);
// 3
R0i.z = ((0.0 >= intBitsToFloat(R6i.w))?-1:0);
// 4
R126i.x = ((R0i.z == 0)?(R2i.x):(R8i.y));
R125i.y = ((R0i.z == 0)?(R7i.y):(R2i.w));
R124i.z = R11i.z;
R124i.w = ((R0i.z == 0)?(R0i.w):(R6i.y));
R3i.w = R13i.z;
// 5
R2i.x = R1i.y;
R7i.y = ((R0i.z == 0)?(R13i.x):(R0i.x));
R1i.z = ((R0i.z == 0)?(0):(0x3f800000));
R0i.w = ((R0i.z == 0)?(R13i.y):(R1i.y));
R4i.w = R13i.z;
// 6
R123i.x = ((R0i.z == 0)?(0):(R5i.w));
R123i.y = ((R0i.z == 0)?(0):(R3i.y));
R123i.z = ((R0i.z == 0)?(0):(R8i.x));
R123i.w = ((R0i.z == 0)?(0):(R3i.z));
R122i.x = ((R0i.z == 0)?(0):(R2i.y));
// 7
R14i.x = ((R1i.z == 0)?(R8i.x):(R123i.z));
R14i.y = ((R1i.z == 0)?(R3i.y):(R123i.y));
R14i.z = ((R1i.z == 0)?(R5i.w):(R123i.x));
R14i.w = ((R1i.z == 0)?(R3i.z):(R123i.w));
R15i.x = ((R1i.z == 0)?(R2i.y):(R122i.x));
// 8
R123i.x = ((R0i.z == 0)?(0):(R8i.z));
R123i.y = ((R0i.z == 0)?(0):(R9i.x));
R125i.z = ((R0i.z == 0)?(0):(R7i.x));
R123i.w = ((R0i.z == 0)?(0):(R7i.w));
R125i.x = ((R0i.z == 0)?(0):(R8i.w));
// 9
backupReg0i = R123i.x;
R123i.x = ((R0i.z == 0)?(R12i.x):(R2i.w));
R15i.y = ((R1i.z == 0)?(R9i.x):(R123i.y));
R15i.z = ((R1i.z == 0)?(R8i.z):(backupReg0i));
R15i.w = ((R1i.z == 0)?(R7i.w):(R123i.w));
R122i.x = ((R0i.z == 0)?(R12i.y):(R8i.y));
// 10
R12i.x = ((R1i.z == 0)?(R125i.y):(R123i.x));
R12i.y = ((R1i.z == 0)?(R126i.x):(R122i.x));
R123i.z = ((R0i.z == 0)?(0):(R9i.z));
// 11
R9i.x = ((R1i.z == 0)?(R9i.z):(R123i.z));
// 12
R123i.x = ((R0i.z == 0)?(R12i.z):(R6i.y));
R123i.y = ((R0i.z == 0)?(0):(R10i.z));
// 13
R9i.y = ((R1i.z == 0)?(R10i.z):(R123i.y));
R9i.z = ((R1i.z == 0)?(R8i.w):(R125i.x));
R9i.w = ((R1i.z == 0)?(R7i.x):(R125i.z));
R12i.z = ((R1i.z == 0)?(R124i.w):(R123i.x));
// 14
R123i.w = ((R0i.z == 0)?(R12i.w):(R11i.z));
// 15
R12i.w = ((R1i.z == 0)?(R124i.z):(R123i.w));
R8i.w = uf_remappedVS[38].w;
}
if( activeMaskStackC[3] == true ) {
// 0
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(uf_remappedVS[39].y)) + intBitsToFloat(R0i.y));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[33].y),intBitsToFloat(R6i.z)) + intBitsToFloat(R6i.x));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(uf_remappedVS[39].y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[33].y), intBitsToFloat(R10i.x)));
// 1
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(R6i.w)) + 0.0);
R123i.y = ((R0i.z == 0)?(0):(R125i.y));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R8i.w)) + intBitsToFloat(R2i.z));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w),intBitsToFloat(PV0iz)) + intBitsToFloat(R7i.z));
// 2
R7i.x = ((R1i.z == 0)?(R125i.y):(R123i.y));
R123i.y = ((R0i.z == 0)?(R1i.x):(R0i.x));
R123i.z = ((R0i.z == 0)?(0):(R124i.z));
R123i.w = ((R0i.z == 0)?(0):(R125i.x));
R122i.x = ((R0i.z == 0)?(0):(R124i.w));
// 3
R13i.x = ((R1i.z == 0)?(R123i.y):(R7i.y));
R7i.y = ((R1i.z == 0)?(R124i.z):(R123i.z));
R7i.z = ((R1i.z == 0)?(R125i.x):(R123i.w));
R7i.w = ((R1i.z == 0)?(R124i.w):(R122i.x));
R13i.y = ((R1i.z == 0)?(R2i.x):(R0i.w));
// 4
R13i.z = ((R1i.z == 0)?(R3i.w):(R4i.w));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.y), intBitsToFloat(R7i.z), intBitsToFloat(R7i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.z));
}
