#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 3fe779f1b891151e
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
ATTR_LAYOUT(0, 7) in uvec4 attrDataSem7;
ATTR_LAYOUT(0, 8) in uvec4 attrDataSem8;
ATTR_LAYOUT(0, 9) in uvec4 attrDataSem9;
ATTR_LAYOUT(0, 10) in uvec4 attrDataSem10;
ATTR_LAYOUT(0, 11) in uvec4 attrDataSem11;
ATTR_LAYOUT(0, 12) in uvec4 attrDataSem12;
ATTR_LAYOUT(0, 13) in uvec4 attrDataSem13;
ATTR_LAYOUT(0, 14) in uvec4 attrDataSem14;

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem7;
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
bool activeMaskStack[6];
bool activeMaskStackC[7];
activeMaskStack[0] = false;
activeMaskStack[1] = false;
activeMaskStack[2] = false;
activeMaskStack[3] = false;
activeMaskStack[4] = false;
activeMaskStackC[0] = false;
activeMaskStackC[1] = false;
activeMaskStackC[2] = false;
activeMaskStackC[3] = false;
activeMaskStackC[4] = false;
activeMaskStackC[5] = false;
activeMaskStack[0] = true;
activeMaskStackC[0] = true;
activeMaskStackC[1] = true;
R0i = ivec4(gl_VertexID, 0, 0, gl_InstanceID);
attrDecoder = attrDataSem9;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem14;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R12i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem13;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R11i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem3;
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem6;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem7;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem11;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R10i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem10;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R9i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem5;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
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
R16i.y = floatBitsToInt(-(intBitsToFloat(R7i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R5i.w = 0;
R7i.w = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R16i.y));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R14i.x = 0;
R14i.y = 0;
R14i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R6i.x = 0;
// 1
R4i.w = R7i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R4i.w = R5i.w;
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
PS0i = int(intBitsToFloat(R6i.w));
// 1
R11i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R16i.y) >= intBitsToFloat(R11i.z));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R14i.x = 0;
R14i.y = 0;
R14i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R6i.x = 0;
// 1
R4i.w = R7i.w;
}
activeMaskStack[2] = activeMaskStack[2] == false;
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R4i.w = R5i.w;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R4i.w == 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = uf_remappedVS[2].x & 0x40000;
R127i.y = uf_remappedVS[2].x & 0x20000;
PV0iz = uf_remappedVS[2].x & 0x10000;
PV0iw = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(R9i.y));
PS0i = floatBitsToInt(intBitsToFloat(R9i.y) + intBitsToFloat(R9i.z));
// 1
R126i.x = floatBitsToInt(intBitsToFloat(PV0iw) * 0.5);
R125i.y = floatBitsToInt(intBitsToFloat(PS0i) * 0.5);
R127i.z = R9i.z;
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 2.0);
PV1iw = R9i.y;
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 2.0);
PS1i = floatBitsToInt(float(PV0iz));
// 2
backupReg0i = R127i.y;
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R127i.y = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(R9i.z));
R126i.z = floatBitsToInt(floor(intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PS0i = floatBitsToInt(float(backupReg0i));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
R124i.y = floatBitsToInt(floor(intBitsToFloat(R127i.z)));
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(float(R127i.x));
// 4
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R127i.w = R9i.x;
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
R126i.y = int(intBitsToFloat(PV1ix));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0ix)));
PV1iy = 0 - R126i.y;
R125i.z = floatBitsToInt(intBitsToFloat(R126i.x) + -(0.5));
R125i.z = floatBitsToInt(intBitsToFloat(R125i.z) * 2.0);
R124i.w = floatBitsToInt(intBitsToFloat(R127i.y) * 0.5);
R126i.x = int(intBitsToFloat(PV0iy));
// 6
R127i.x = max(R126i.y, PV1iy);
R126i.y = floatBitsToInt(intBitsToFloat(R125i.y) + -(0.5));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) * 2.0);
R127i.z = floatBitsToInt((intBitsToFloat(R126i.z) > 0.0)?1.0:0.0);
PV0iw = 0 - R126i.x;
R126i.w = int(intBitsToFloat(PV1ix));
// 7
PV1ix = 0 - R126i.w;
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(R126i.z))?1.0:0.0);
R126i.z = max(R126i.x, PV0iw);
R125i.w = floatBitsToInt((intBitsToFloat(R124i.y) > 0.0)?1.0:0.0);
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[3].w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 8
backupReg0i = R124i.y;
backupReg1i = R127i.z;
R126i.x = floatBitsToInt(floor(intBitsToFloat(R127i.w)));
R124i.y = max(R126i.w, PV1ix);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(backupReg0i))?1.0:0.0);
R127i.w = floatBitsToInt(intBitsToFloat(backupReg1i) + -(intBitsToFloat(PV1iy)));
// 9
backupReg0i = R126i.y;
backupReg1i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R124i.w) + -(0.5));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(uf_remappedVS[4].x)));
R125i.z = floatBitsToInt(intBitsToFloat(R125i.w) + -(intBitsToFloat(PV0iw)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[4].y)));
PS1i = floatBitsToInt(float(backupReg1i));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 10
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[3].w)) + 1.0);
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(R127i.w)));
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(backupReg0i))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(backupReg0i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(R126i.z));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 11
backupReg0i = R127i.z;
R125i.x = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(uf_remappedVS[3].x));
R126i.y = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[3].y) + intBitsToFloat(R125i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(R125i.z)));
PS1i = floatBitsToInt(exp2(intBitsToFloat(backupReg0i)));
// 12
backupReg0i = R124i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[4].z)));
R124i.y = floatBitsToInt(intBitsToFloat(R9i.x) + -(0.5));
R126i.z = floatBitsToInt(intBitsToFloat(R9i.y) + -(0.5));
R125i.w = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
PS0i = floatBitsToInt(float(backupReg0i));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 13
backupReg0i = R126i.y;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R125i.y)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R125i.y)));
R125i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(backupReg0i)));
R124i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[3].z) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 14
PV0ix = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R127i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.w)));
PV0iw = ((intBitsToFloat(uf_remappedVS[3].w) == 1.0)?-1:0);
R124i.z = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(PV1ix));
// 15
R125i.x = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(R126i.y));
R125i.y = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iz));
R127i.z = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(PV0iy));
R127i.w = ((PV0iw == 0)?(PV0ix):(R16i.y));
R126i.y = floatBitsToInt(intBitsToFloat(R9i.z) + -(0.5));
// 16
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(uf_remappedVS[5].x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R125i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(uf_remappedVS[5].y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R125i.z)));
R0i.w = 0x3f800000;
// 17
backupReg0i = R126i.y;
PV1ix = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(PV0iy));
R126i.y = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(PV0iw));
R124i.w = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[5].z)));
// 18
R125i.x = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PS1i));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R127i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R127i.w)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.w)));
R124i.y = floatBitsToInt(max(intBitsToFloat(R9i.x), 0.0));
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w))));
PV1ix = tempi.x;
R3i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV0iz));
// 20
backupReg0i = R125i.x;
backupReg1i = R125i.y;
R125i.x = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3e22f983) + 0.5);
R125i.y = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(R127i.w));
PV0iz = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(backupReg1i));
R127i.w = floatBitsToInt(min(intBitsToFloat(R124i.y), 0.0));
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(uf_remappedVS[6].z)));
// 21
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R2i.z = tempi.x;
PV1iw = tempi.x;
R124i.z = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e22f983) + 0.5);
// 22
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R0i.w = tempi.x;
PS0i = floatBitsToInt(fract(intBitsToFloat(R125i.x)));
// 23
backupReg0i = R10i.y;
backupReg1i = R10i.x;
R10i.x = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(0x3e22f983) + 0.5);
R10i.y = floatBitsToInt(fract(intBitsToFloat(R124i.z)));
R10i.z = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[6].y)));
R0i.x = floatBitsToInt(intBitsToFloat(backupReg1i) + intBitsToFloat(R127i.w));
}
if( activeMaskStackC[3] == true ) {
// 0
R125i.x = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(uf_remappedVS[7].z));
R123i.y = floatBitsToInt(intBitsToFloat(R10i.y) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R124i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].y) * 1.0);
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].x) * 1.0);
R124i.w = floatBitsToInt(fract(intBitsToFloat(R10i.x)));
// 1
R126i.x = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(uf_remappedVS[7].y));
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].z) * 1.0);
R127i.z = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(uf_remappedVS[7].x));
R125i.w = floatBitsToInt(intBitsToFloat(R10i.z) * intBitsToFloat(0x3e22f983));
R126i.w = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(uf_remappedVS[9].x)) + intBitsToFloat(R127i.w));
R123i.y = floatBitsToInt(intBitsToFloat(R124i.w) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(uf_remappedVS[9].z)) + intBitsToFloat(PV1iy));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(uf_remappedVS[9].y)) + intBitsToFloat(R124i.z));
R124i.x = floatBitsToInt(sin((intBitsToFloat(R125i.w))/0.1591549367));
// 3
backupReg0i = R123i.x;
backupReg1i = R123i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(uf_remappedVS[10].y)) + intBitsToFloat(R123i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(uf_remappedVS[10].x)) + intBitsToFloat(backupReg0i));
R124i.z = floatBitsToInt(intBitsToFloat(backupReg1i) * intBitsToFloat(0x3e22f983));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(uf_remappedVS[10].z)) + intBitsToFloat(R123i.z));
R125i.w = floatBitsToInt(cos((intBitsToFloat(R125i.w))/0.1591549367));
// 4
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(uf_remappedVS[11].z)) + intBitsToFloat(R123i.w));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(uf_remappedVS[11].y)) + intBitsToFloat(R123i.x));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(uf_remappedVS[11].x)) + intBitsToFloat(R123i.y));
R4i.w = 0x3f800000;
R126i.z = floatBitsToInt(sin((intBitsToFloat(R126i.w))/0.1591549367));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(uf_remappedVS[12].w)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R126i.z)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R126i.z)));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(uf_remappedVS[12].z)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[13].x));
// 6
R3i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[14].y) * 1.0);
R10i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[14].x) * 1.0);
PV0iz = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[13].y));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(PS0i));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) / 2.0);
R125i.y = floatBitsToInt(intBitsToFloat(PV0iz) + 0.5);
R1i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[14].z) * 1.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[13].z));
// 8
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(PV1ix) + 0.5);
PV0iz = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
R127i.y = floatBitsToInt(cos((intBitsToFloat(R126i.w))/0.1591549367));
// 9
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R127i.y)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R127i.y)));
R126i.w = floatBitsToInt(intBitsToFloat(PV0iz) + 0.5);
R127i.x = floatBitsToInt(sin((intBitsToFloat(R124i.z))/0.1591549367));
// 10
backupReg0i = R124i.z;
R5i.x = floatBitsToInt(fract(intBitsToFloat(R125i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R126i.y)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R124i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R125i.z)));
R124i.w = floatBitsToInt(cos((intBitsToFloat(backupReg0i))/0.1591549367));
// 11
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R124i.w)));
R0i.y = floatBitsToInt(fract(intBitsToFloat(backupReg0i)));
R0i.z = floatBitsToInt(fract(intBitsToFloat(R126i.w)));
R126i.w = floatBitsToInt(-(intBitsToFloat(R125i.x)) + intBitsToFloat(PV0iy));
R126i.z = floatBitsToInt(intBitsToFloat(R124i.y) + intBitsToFloat(PV0iw));
// 12
R10i.x = floatBitsToInt(-(intBitsToFloat(R127i.x)));
PV0iy = floatBitsToInt(intBitsToFloat(R0i.z) + -(0.5));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R124i.w)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R125i.x)));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R124i.w)));
// 13
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R127i.w)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R127i.w)));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R127i.w)));
PV1iw = floatBitsToInt(intBitsToFloat(R0i.y) + -(0.5));
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 2.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].z), intBitsToFloat(PV0iy)));
// 14
R4i.x = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(R124i.z));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R124i.w)));
R4i.z = floatBitsToInt(-(intBitsToFloat(R126i.y)) + intBitsToFloat(R125i.w));
R125i.w = floatBitsToInt(intBitsToFloat(R5i.x) + -(0.5));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) * 2.0);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].y), intBitsToFloat(PV1iw)));
// 15
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(uf_remappedVS[15].z)) + intBitsToFloat(R1i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(uf_remappedVS[15].y)) + intBitsToFloat(R3i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(uf_remappedVS[15].x)) + intBitsToFloat(R10i.y));
R2i.x = 0x3f800000;
// 16
backupReg0i = R123i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].x), intBitsToFloat(R125i.w)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(uf_remappedVS[16].y)) + intBitsToFloat(R123i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(uf_remappedVS[16].x)) + intBitsToFloat(backupReg0i));
R7i.x = 0;
// 17
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(uf_remappedVS[17].x)) + intBitsToFloat(R123i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(uf_remappedVS[16].z)) + intBitsToFloat(R126i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(uf_remappedVS[17].y)) + intBitsToFloat(R123i.z));
// 18
R3i.x = floatBitsToInt(-(intBitsToFloat(R2i.z)) + intBitsToFloat(R123i.w));
R2i.y = floatBitsToInt(-(intBitsToFloat(R0i.w)) + intBitsToFloat(R123i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(uf_remappedVS[17].z)) + intBitsToFloat(R123i.y));
// 19
R6i.x = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(R2i.y));
R5i.y = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(R3i.x));
R1i.w = floatBitsToInt(-(intBitsToFloat(R3i.y)) + intBitsToFloat(R123i.z));
// 20
R10i.y = uf_remappedVS[12].y;
R3i.z = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(R1i.w));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = uf_remappedVS[18].y;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
PV0iy = uf_remappedVS[18].x;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[6].x)));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(R10i.y)));
PV1iz = floatBitsToInt(intBitsToFloat(R8i.y) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(PV0iy));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PV1iz)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(PV1iw)));
// 3
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R3i.w)) + intBitsToFloat(R1i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R1i.z)) + intBitsToFloat(R1i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R10i.x)) + intBitsToFloat(R10i.z));
// 4
backupReg0i = R4i.x;
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R4i.y)) + intBitsToFloat(R123i.w));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(backupReg0i)) + intBitsToFloat(R123i.z));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R4i.z)) + intBitsToFloat(R123i.y));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedVS[19].x),intBitsToFloat(uf_remappedVS[19].y),intBitsToFloat(uf_remappedVS[19].z),intBitsToFloat(uf_remappedVS[19].w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R4i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R4i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.y = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(PV0ix));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R4i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(PV1ix));
// 3
R1i.x = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(R2i.y));
R1i.y = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(R3i.x));
PV1iw = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(PV0ix));
// 4
R1i.z = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R1i.w));
// 5
predResult = (intBitsToFloat(uf_remappedVS[22].x) == 1.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
activeMaskStack[4] = activeMaskStack[3];
activeMaskStackC[5] = activeMaskStackC[4];
// 0
predResult = (intBitsToFloat(R5i.y) > intBitsToFloat(uf_remappedVS[22].y));
activeMaskStack[4] = predResult;
activeMaskStackC[5] = predResult == true && activeMaskStackC[4] == true;
}
else {
activeMaskStack[4] = false;
activeMaskStackC[5] = false;
}
if( activeMaskStackC[5] == true ) {
// 0
R1i.x = 0;
R1i.y = 0;
R1i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
// 1
R2i.x = R7i.x;
R0i.w = R7i.w;
}
activeMaskStack[4] = activeMaskStack[4] == false;
activeMaskStackC[5] = activeMaskStack[4] == true && activeMaskStackC[4] == true;
if( activeMaskStackC[5] == true ) {
// 0
R0i.w = R5i.w;
}
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R7i.w = R5i.w;
// 1
R5i.w = R0i.w;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
activeMaskStack[4] = activeMaskStack[3];
activeMaskStackC[5] = activeMaskStackC[4];
// 0
predResult = (intBitsToFloat(uf_remappedVS[22].x) == 2.0);
activeMaskStack[4] = predResult;
activeMaskStackC[5] = predResult == true && activeMaskStackC[4] == true;
}
else {
activeMaskStack[4] = false;
activeMaskStackC[5] = false;
}
if( activeMaskStackC[5] == true ) {
activeMaskStack[5] = activeMaskStack[4];
activeMaskStackC[6] = activeMaskStackC[5];
// 0
predResult = (intBitsToFloat(uf_remappedVS[22].y) > intBitsToFloat(R5i.y));
activeMaskStack[5] = predResult;
activeMaskStackC[6] = predResult == true && activeMaskStackC[5] == true;
}
else {
activeMaskStack[5] = false;
activeMaskStackC[6] = false;
}
if( activeMaskStackC[6] == true ) {
// 0
R1i.x = 0;
R1i.y = 0;
R1i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
// 1
R2i.x = R7i.x;
}
activeMaskStack[5] = activeMaskStack[5] == false;
activeMaskStackC[6] = activeMaskStack[5] == true && activeMaskStackC[5] == true;
if( activeMaskStackC[6] == true ) {
// 0
R7i.w = R5i.w;
}
activeMaskStackC[5] = activeMaskStack[4] == true && activeMaskStackC[4] == true;
activeMaskStack[4] = activeMaskStack[4] == false;
activeMaskStackC[5] = activeMaskStack[4] == true && activeMaskStackC[4] == true;
if( activeMaskStackC[5] == true ) {
// 0
R7i.w = R5i.w;
}
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (R5i.w == 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
activeMaskStack[4] = activeMaskStack[3];
activeMaskStackC[5] = activeMaskStackC[4];
// 0
predResult = (R7i.w == 0);
activeMaskStack[4] = predResult;
activeMaskStackC[5] = predResult == true && activeMaskStackC[4] == true;
}
else {
activeMaskStack[4] = false;
activeMaskStackC[5] = false;
}
if( activeMaskStackC[5] == true ) {
// 0
R127i.x = ((intBitsToFloat(uf_remappedVS[23].x) > 0.0)?-1:0);
R123i.y = floatBitsToInt(intBitsToFloat(R0i.z) * 2.0 + -(1.0));
R123i.z = floatBitsToInt(intBitsToFloat(R0i.y) * 2.0 + -(1.0));
R123i.w = floatBitsToInt(intBitsToFloat(R5i.x) * 2.0 + -(1.0));
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[23].x));
// 1
PV1ix = floatBitsToInt(max(intBitsToFloat(R123i.w), -(intBitsToFloat(R123i.w))));
R125i.y = ((intBitsToFloat(uf_remappedVS[23].y) > 0.0)?-1:0);
PV1iz = floatBitsToInt(max(intBitsToFloat(R123i.y), -(intBitsToFloat(R123i.y))));
PV1iw = floatBitsToInt(max(intBitsToFloat(R123i.z), -(intBitsToFloat(R123i.z))));
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[23].y));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(PV1iw)) + 1.0);
PV0iy = floatBitsToInt(-(intBitsToFloat(PV1ix)) + 1.0);
R127i.z = ((intBitsToFloat(uf_remappedVS[23].z) > 0.0)?-1:0);
PV0iw = floatBitsToInt(-(intBitsToFloat(PV1iz)) + 1.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[23].z));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(R127i.y));
PV1ix = clampFI32(PV1ix);
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(R126i.y));
PV1iy = clampFI32(PV1iy);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(PS0i));
PV1iz = clampFI32(PV1iz);
// 4
R123i.x = ((R125i.y == 0)?(0x3f800000):(PV1iy));
R125i.y = ((R127i.z == 0)?(0x3f800000):(PV1iz));
R123i.w = ((R127i.x == 0)?(0x3f800000):(PV1ix));
// 5
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R123i.x)));
// 6
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV1iz)));
// 7
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV0iy)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R6i.x) + -(intBitsToFloat(uf_remappedVS[24].x)));
PV0iy = floatBitsToInt(intBitsToFloat(R5i.y) + -(intBitsToFloat(uf_remappedVS[24].y)));
PV0iz = floatBitsToInt(intBitsToFloat(R3i.z) + -(intBitsToFloat(uf_remappedVS[24].z)));
R127i.w = floatBitsToInt(-(intBitsToFloat(R6i.x)) + intBitsToFloat(R1i.x));
R126i.w = floatBitsToInt(-(intBitsToFloat(R5i.y)) + intBitsToFloat(R1i.y));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[25].x));
// 2
PV0ix = ((intBitsToFloat(R9i.x) > 0.5)?-1:0);
PV0iy = floatBitsToInt(-(intBitsToFloat(R11i.x)) + 1.0);
R126i.z = floatBitsToInt(-(intBitsToFloat(R3i.z)) + intBitsToFloat(R1i.z));
R125i.w = 0x3f800000;
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 3
PV1ix = floatBitsToInt(-(intBitsToFloat(R11i.y)) + 1.0);
PV1iy = ((intBitsToFloat(R9i.y) > 0.5)?-1:0);
R1i.z = ((PV0ix == 0)?(R11i.x):(PV0iy));
PV1iw = floatBitsToInt(min(intBitsToFloat(PS0i), intBitsToFloat(uf_remappedVS[25].x)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R11i.z));
// 4
R0i.x = ((PV1iy == 0)?(R11i.y):(PV1ix));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(R127i.z));
R0i.z = floatBitsToInt(intBitsToFloat(R16i.y) * intBitsToFloat(PS1i));
R6i.y = uf_remappedVS[26].x;
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0iy)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV0iy)));
// 6
R127i.x = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV1ix));
R127i.y = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(PV1iw));
R126i.z = floatBitsToInt(intBitsToFloat(R3i.z) + intBitsToFloat(PV1iz));
// 7
R14i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R125i.w)),vec4(intBitsToFloat(uf_remappedVS[27].x),intBitsToFloat(uf_remappedVS[27].y),intBitsToFloat(uf_remappedVS[27].z),intBitsToFloat(uf_remappedVS[27].w))));
PV1iy = R14i.x;
PV1iz = R14i.x;
PV1iw = R14i.x;
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R125i.w)),vec4(intBitsToFloat(uf_remappedVS[28].x),intBitsToFloat(uf_remappedVS[28].y),intBitsToFloat(uf_remappedVS[28].z),intBitsToFloat(uf_remappedVS[28].w))));
PV0ix = tempi.x;
R14i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R125i.w)),vec4(intBitsToFloat(uf_remappedVS[29].x),intBitsToFloat(uf_remappedVS[29].y),intBitsToFloat(uf_remappedVS[29].z),intBitsToFloat(uf_remappedVS[29].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R14i.z = tempi.x;
PV1iw = tempi.x;
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R125i.w)),vec4(intBitsToFloat(uf_remappedVS[30].x),intBitsToFloat(uf_remappedVS[30].y),intBitsToFloat(uf_remappedVS[30].z),intBitsToFloat(uf_remappedVS[30].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R14i.w = tempi.x;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iy = uf_remappedVS[2].x & 0x80000;
PV0iz = floatBitsToInt((intBitsToFloat(uf_remappedVS[31].y) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[31].y))?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[31].y));
// 1
R126i.x = uf_remappedVS[2].x & 0x100000;
R127i.y = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iw)));
PV1iz = floatBitsToInt(intBitsToFloat(R16i.y) * intBitsToFloat(PS0i));
R125i.w = (PV0iy == 0x80000)?-1:0;
PS1i = int(intBitsToFloat(uf_remappedVS[32].z));
// 2
R127i.x = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(uf_remappedVS[33].x)));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) * 2.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(uf_remappedVS[33].y)));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) * 2.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(uf_remappedVS[34].z)) + intBitsToFloat(PV1iz));
R124i.x = floatBitsToInt(float(PS1i));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[35].z) + intBitsToFloat(uf_remappedVS[33].x));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV1iz = floatBitsToInt(-(abs(intBitsToFloat(R124i.x))) + 0.0);
PV1iw = floatBitsToInt((0.0 >= abs(intBitsToFloat(R124i.x)))?1.0:0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R124i.x));
// 4
R125i.x = ((intBitsToFloat(PV1iw) == 0.0)?(0):(PV1iz));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV1iy)));
PV0iz = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[35].w) + intBitsToFloat(uf_remappedVS[33].y));
R126i.w = floatBitsToInt(-(intBitsToFloat(R126i.y)) + intBitsToFloat(PV1ix));
// 5
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R127i.x)) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(abs(intBitsToFloat(R124i.x)) + intBitsToFloat(R125i.x));
R126i.z = floatBitsToInt(-(intBitsToFloat(R126i.z)) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(trunc(intBitsToFloat(PV0iz)));
R127i.w = (R126i.x == 0x100000)?-1:0;
// 6
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[36].y) + intBitsToFloat(uf_remappedVS[36].w));
R127i.y = ((R125i.w == 0)?(R11i.x):(R1i.z));
R123i.z = ((-(intBitsToFloat(R125i.x)) > 0.0)?(PV1iy):(R125i.x));
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[36].x) + intBitsToFloat(uf_remappedVS[36].z));
R125i.y = int(intBitsToFloat(PV1iw));
// 7
backupReg0i = R9i.y;
backupReg1i = R124i.x;
R124i.x = ((R127i.w == 0)?(R11i.y):(R0i.x));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(uf_remappedVS[36].z)) + intBitsToFloat(PV0iw));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(uf_remappedVS[36].w)) + intBitsToFloat(PV0ix));
R123i.w = ((intBitsToFloat(backupReg1i) == 0.0)?(0):(R123i.z));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[32].z));
// 8
backupReg0i = R126i.z;
R124i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R16i.y)),intBitsToFloat(uf_remappedVS[35].x)) + -(intBitsToFloat(R126i.w)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].x), intBitsToFloat(PS1i)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y),intBitsToFloat(uf_remappedVS[35].y)) + intBitsToFloat(backupReg0i));
R126i.y = int(intBitsToFloat(R123i.w));
// 9
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R126i.z)) + -(0.5));
R11i.y = uf_remappedVS[37].y;
R0i.w = uf_remappedVS[37].x;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[32].w));
// 10
backupReg0i = R126i.y;
R0i.x = uf_remappedVS[37].z;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[32].y), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(float(backupReg0i));
// 11
backupReg0i = R124i.x;
backupReg1i = R125i.y;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(PS0i)) + intBitsToFloat(R124i.y));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R126i.y)) + -(0.5));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y),intBitsToFloat(uf_remappedVS[33].w)) + intBitsToFloat(R127i.z));
PS1i = floatBitsToInt(float(backupReg1i));
// 12
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y),intBitsToFloat(uf_remappedVS[33].z)) + intBitsToFloat(R9i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.y)),intBitsToFloat(PS1i)) + intBitsToFloat(R126i.w));
// 13
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(R125i.x)) + intBitsToFloat(R124i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R125i.y)) + -(intBitsToFloat(R123i.y)));
// 14
R7i.x = floatBitsToInt(intBitsToFloat(R123i.x) + 0.5);
R7i.y = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
R7i.z = 0;
}
if( activeMaskStackC[3] == true ) {
// 0
R125i.x = floatBitsToInt(intBitsToFloat(R1i.x) + -(intBitsToFloat(uf_remappedVS[38].w)));
PV0iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[39].w)) + intBitsToFloat(uf_remappedVS[38].w));
R127i.z = floatBitsToInt(intBitsToFloat(R1i.x) + -(intBitsToFloat(uf_remappedVS[39].w)));
// 1
R124i.x = ((intBitsToFloat(R125i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.y = ((intBitsToFloat(R127i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[39].x)) + intBitsToFloat(uf_remappedVS[38].x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 2
R127i.x = floatBitsToInt(intBitsToFloat(R1i.x) + -(intBitsToFloat(uf_remappedVS[40].w)));
R126i.y = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[38].w)) + intBitsToFloat(uf_remappedVS[40].w));
PV0iw = floatBitsToInt(-(intBitsToFloat(R124i.x)) + 1.0);
R126i.w = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
// 3
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[38].x)) + intBitsToFloat(uf_remappedVS[40].x));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV0iw)));
R125i.z = ((intBitsToFloat(R127i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[40].w)) + intBitsToFloat(uf_remappedVS[41].w));
R126i.z = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
PV0iw = floatBitsToInt(intBitsToFloat(R1i.x) + -(intBitsToFloat(uf_remappedVS[41].w)));
// 5
backupReg0i = R127i.z;
backupReg1i = R126i.y;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].x), intBitsToFloat(R126i.w)));
R126i.y = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(PV0ix)) + intBitsToFloat(uf_remappedVS[38].x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(backupReg1i)) + intBitsToFloat(uf_remappedVS[39].x));
R125i.x = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R125i.y)) + intBitsToFloat(PV1ix));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R126i.z)));
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[40].x)) + intBitsToFloat(uf_remappedVS[41].x));
// 7
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV0iy)) + intBitsToFloat(R123i.x));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(backupReg0i));
R126i.w = uf_remappedVS[42].x;
R127i.w = uf_remappedVS[42].y;
// 8
R127i.z = uf_remappedVS[42].z;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PV1iz)) + intBitsToFloat(uf_remappedVS[40].x));
// 9
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[43].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(uf_remappedVS[43].y)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[43].z)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R125i.y)) + intBitsToFloat(R125i.x));
// 10
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[41].x),intBitsToFloat(R126i.y)) + intBitsToFloat(R123i.w));
PV0iw = uf_remappedVS[44].x;
// 11
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(uf_remappedVS[45].x)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(uf_remappedVS[45].y)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(uf_remappedVS[45].z)));
R13i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedVS[45].w)));
// 12
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[12].x) * 1.0);
R15i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(uf_remappedVS[43].w)));
// 13
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(PV0iz)) + 0.0);
}
if( activeMaskStackC[3] == true ) {
// 0
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[46].x)));
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[46].x)));
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[46].x)));
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[46].x), intBitsToFloat(R1i.x)));
// 1
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[46].x), intBitsToFloat(R1i.y)));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[46].x), intBitsToFloat(R1i.z)));
// 2
R0i.x = R12i.x;
R0i.y = R12i.y;
R0i.z = R12i.z;
R0i.w = R12i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.z), intBitsToFloat(R6i.z));
// export
passParameterSem8 = vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.y), intBitsToFloat(R7i.z), intBitsToFloat(R7i.z));
}
