#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 0fedf5915600e6d7
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[37];
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
out vec4 passParameterSem3;
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
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
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
R11i.y = floatBitsToInt(-(intBitsToFloat(R2i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R2i.w = 0;
R3i.w = floatBitsToInt(1.0);
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
R0i.x = 0;
R0i.y = 0;
R0i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R12i.x = 0;
// 1
R4i.w = R3i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R4i.w = R2i.w;
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
PS0i = int(intBitsToFloat(R1i.w));
// 1
R4i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R11i.y) >= intBitsToFloat(R4i.z));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = 0;
R0i.y = 0;
R0i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R12i.x = 0;
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
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedVS[2].x),intBitsToFloat(uf_remappedVS[2].y),intBitsToFloat(uf_remappedVS[2].z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[2].x),intBitsToFloat(uf_remappedVS[2].y),intBitsToFloat(uf_remappedVS[2].z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R0i.w = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedVS[4].x),intBitsToFloat(uf_remappedVS[4].y),intBitsToFloat(uf_remappedVS[4].z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[4].x),intBitsToFloat(uf_remappedVS[4].y),intBitsToFloat(uf_remappedVS[4].z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.y = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 3
R0i.z = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 4
predResult = (intBitsToFloat(R0i.w) > 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R0i.w));
// 1
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].x), intBitsToFloat(R127i.y)));
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].x), intBitsToFloat(R127i.y)));
// 2
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].x), intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R13i.x = 0;
// 1
R9i.x = R13i.x;
// 2
R10i.x = R13i.x;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (intBitsToFloat(R0i.y) > 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R0i.y));
// 1
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].y), intBitsToFloat(R127i.x)));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].y), intBitsToFloat(R127i.x)));
// 2
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R9i.y = 0;
R10i.y = 0;
// 1
R13i.y = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (intBitsToFloat(R0i.z) > 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R0i.z));
// 1
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].z), intBitsToFloat(R127i.x)));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].z), intBitsToFloat(R127i.x)));
// 2
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R9i.z = 0;
R10i.z = 0;
// 1
R13i.z = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(uf_remappedVS[5].y)));
PV0iy = floatBitsToInt(max(intBitsToFloat(R4i.x), 0.0));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(uf_remappedVS[5].z)));
// 1
R0i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(R11i.y));
PV1iw = floatBitsToInt(min(intBitsToFloat(PV0iy), 0.0));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(uf_remappedVS[6].w)));
// 2
R0i.x = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV1iw));
// 3
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[5].x)));
// 4
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(uf_remappedVS[6].y)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[6].z)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R6i.z = ((intBitsToFloat(uf_remappedVS[7].x) == 1.0)?-1:0);
R1i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].x)) + 1.0);
// 1
predResult = (R6i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R0i.z)));
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
tempResultf = max(0.0, abs(intBitsToFloat(uf_remappedVS[7].x)));
tempResultf = log2(tempResultf);
PS0i = floatBitsToInt(tempResultf);
// 1
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f317218));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[7].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PS1i)));
R127i.y = ((intBitsToFloat(uf_remappedVS[7].x) == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R1i.w));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R0i.z) + -(intBitsToFloat(PV1iz)));
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
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R0i.w)));
PV0iy = uf_remappedVS[9].y;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
PV0iz = uf_remappedVS[9].x;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
R3i.w = 0x3f800000;
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[7].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R3i.x) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(PV0iy));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PS0i)));
R4i.w = 0x3f800000;
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(R1i.w));
// 2
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1ix)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PV1iy)));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[10].w)) + intBitsToFloat(uf_remappedVS[11].w));
R6i.w = floatBitsToInt(1.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iz)));
// 3
PV1ix = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R3i.y = ((intBitsToFloat(R4i.x) > 0.5)?-1:0);
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[10].x)) + intBitsToFloat(uf_remappedVS[11].x));
R0i.w = floatBitsToInt(-(intBitsToFloat(R6i.x)) + 1.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R4i.z));
// 4
R126i.x = ((intBitsToFloat(R4i.y) > 0.5)?-1:0);
PV0iy = floatBitsToInt(intBitsToFloat(R11i.y) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(R127i.w));
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[11].w)) + intBitsToFloat(uf_remappedVS[12].w));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 5
backupReg0i = R126i.z;
R3i.x = floatBitsToInt(intBitsToFloat(PV0iy) + 0.0);
R123i.y = ((R6i.z == 0)?(PV0iz):(R0i.z));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[11].x)) + intBitsToFloat(uf_remappedVS[12].x));
R127i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(PS0i));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.y)));
R127i.y = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(uf_remappedVS[10].w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R123i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R123i.y)));
R124i.y = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(uf_remappedVS[11].w)));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV0ix));
R125i.z = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(uf_remappedVS[12].w)));
PV1iw = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(PV0iz));
R125i.y = ((intBitsToFloat(R127i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV1iy)));
R126i.w = ((intBitsToFloat(R124i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[12].w)) + intBitsToFloat(uf_remappedVS[13].w));
// 9
R5i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV0iz));
R1i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV0iy));
R5i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0ix));
R1i.w = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(uf_remappedVS[13].w)));
R125i.w = ((intBitsToFloat(R125i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 10
backupReg0i = R127i.y;
PV0ix = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
R127i.y = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(R127i.z));
R127i.z = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R127i.w)) + intBitsToFloat(uf_remappedVS[10].x));
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R126i.y));
// 11
R124i.x = ((intBitsToFloat(R1i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iy = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
PV1iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[12].x)) + intBitsToFloat(uf_remappedVS[13].x));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV0ix)));
R125i.x = floatBitsToInt(-(intBitsToFloat(R6i.y)) + 1.0);
// 12
R1i.x = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(uf_remappedVS[14].w)));
R125i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(R127i.x));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[13].w)) + intBitsToFloat(uf_remappedVS[14].w));
PS0i = floatBitsToInt(-(intBitsToFloat(R124i.x)) + 1.0);
// 13
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(R127i.y)) + intBitsToFloat(uf_remappedVS[11].x));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].x), intBitsToFloat(R127i.z)));
R124i.z = ((intBitsToFloat(R1i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 14
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R124i.w)) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[13].x)) + intBitsToFloat(uf_remappedVS[14].x));
PV0iz = floatBitsToInt(-(intBitsToFloat(R124i.z)) + 1.0);
R124i.w = ((R3i.y == 0)?(R6i.x):(R0i.w));
R1i.z = ((R126i.x == 0)?(R6i.y):(R125i.x));
// 15
R125i.x = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(uf_remappedVS[15].w)));
PV1iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[14].w)) + intBitsToFloat(uf_remappedVS[15].w));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(R127i.z));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R126i.z)) + intBitsToFloat(R123i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(PV0iz)));
// 16
R124i.x = ((intBitsToFloat(R125i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R125i.y)) + intBitsToFloat(uf_remappedVS[12].x));
R5i.w = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(uf_remappedVS[16].w)));
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 17
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R125i.w)) + intBitsToFloat(R127i.w));
PV1iy = floatBitsToInt(-(intBitsToFloat(R124i.x)) + 1.0);
PV1iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[14].x)) + intBitsToFloat(uf_remappedVS[15].x));
R125i.w = ((intBitsToFloat(R5i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 18
R127i.x = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(R127i.x));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(PV1iy)));
PV0iz = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[15].w)) + intBitsToFloat(uf_remappedVS[16].w));
// 19
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(R127i.z)) + intBitsToFloat(uf_remappedVS[13].x));
PV1iy = uf_remappedVS[17].x & 0x80000;
PV1iz = uf_remappedVS[17].x & 0x100000;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(PV0iz)));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 20
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[15].x)) + intBitsToFloat(uf_remappedVS[16].x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(R127i.y)) + intBitsToFloat(R126i.x));
PV0iz = (PV1iy == 0x80000)?-1:0;
PV0iw = (PV1iz == 0x100000)?-1:0;
// 21
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(R127i.z));
PV1iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[16].w)) + intBitsToFloat(uf_remappedVS[18].w));
PV1iz = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(uf_remappedVS[18].w)));
R1i.w = ((PV0iz == 0)?(R6i.x):(R124i.w));
R0i.w = ((PV0iw == 0)?(R6i.y):(R1i.z));
// 22
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(PV1ix)) + intBitsToFloat(uf_remappedVS[15].x));
R5i.y = ((intBitsToFloat(PV1iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R127i.x)) + intBitsToFloat(uf_remappedVS[14].x));
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 23
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R125i.y)) + intBitsToFloat(R127i.y));
PV1iy = floatBitsToInt(-(intBitsToFloat(R5i.y)) + 1.0);
PV1iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[16].x)) + intBitsToFloat(uf_remappedVS[18].x));
// 24
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.x));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV1iy)));
R1i.z = uf_remappedVS[19].x;
R2i.w = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(R127i.x));
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R1i.y),intBitsToFloat(R5i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R9i.w = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R1i.y),intBitsToFloat(R5i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R8i.w = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R1i.y),intBitsToFloat(R5i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[22].x),intBitsToFloat(uf_remappedVS[22].y),intBitsToFloat(uf_remappedVS[22].z),intBitsToFloat(uf_remappedVS[22].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R3i.w = tempi.x;
// 3
R5i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R9i.w)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R8i.x),intBitsToFloat(R4i.w))));
PV1iy = R5i.x;
PV1iz = R5i.x;
PV1iw = R5i.x;
PS1i = int(intBitsToFloat(uf_remappedVS[23].z));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(R8i.w)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R8i.x),intBitsToFloat(R4i.w))));
PV0ix = tempi.x;
R6i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(float(PS1i));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R9i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R8i.x),intBitsToFloat(R4i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R5i.z = tempi.x;
PV1iw = tempi.x;
R127i.z = floatBitsToInt(-(abs(intBitsToFloat(R127i.x))) + 0.0);
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(uf_remappedVS[24].x)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(uf_remappedVS[24].y)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[25].z) + intBitsToFloat(uf_remappedVS[24].x));
PV0iw = floatBitsToInt((0.0 >= abs(intBitsToFloat(R127i.x)))?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[25].w) + intBitsToFloat(uf_remappedVS[24].y));
R125i.y = ((intBitsToFloat(PV0iw) == 0.0)?(0):(R127i.z));
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
PV1iw = floatBitsToInt(-(intBitsToFloat(PV0ix)) + intBitsToFloat(PV0iz));
// 8
PV0ix = floatBitsToInt(abs(intBitsToFloat(R127i.x)) + intBitsToFloat(R125i.y));
R124i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R11i.y)),intBitsToFloat(uf_remappedVS[25].x)) + -(intBitsToFloat(PV1iw)));
R127i.z = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(PV1ix));
PV0iw = floatBitsToInt(trunc(intBitsToFloat(PV1iz)));
R125i.x = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[23].z));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[26].y) + intBitsToFloat(uf_remappedVS[26].w));
R123i.z = ((-(intBitsToFloat(R125i.y)) > 0.0)?(PV0ix):(R125i.y));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[26].x) + intBitsToFloat(uf_remappedVS[26].z));
R126i.y = int(intBitsToFloat(PV0iw));
// 10
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(uf_remappedVS[26].z)) + intBitsToFloat(PV1iw));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(uf_remappedVS[26].w)) + intBitsToFloat(PV1ix));
R123i.w = ((intBitsToFloat(R127i.x) == 0.0)?(0):(R123i.z));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[23].w));
// 11
backupReg0i = R127i.z;
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[23].y), intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[23].x), intBitsToFloat(R125i.x)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y),intBitsToFloat(uf_remappedVS[25].y)) + intBitsToFloat(backupReg0i));
R127i.y = int(intBitsToFloat(R123i.w));
// 12
PV0ix = uf_remappedVS[27].x;
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(R127i.z)) + -(0.5));
PV0iz = uf_remappedVS[27].y;
R127i.w = uf_remappedVS[27].z;
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R4i.y)) + -(0.5));
// 13
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y),intBitsToFloat(uf_remappedVS[24].z)) + intBitsToFloat(R125i.y));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(uf_remappedVS[28].y)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y),intBitsToFloat(uf_remappedVS[24].w)) + intBitsToFloat(R124i.z));
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedVS[28].x)));
// 14
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(uf_remappedVS[28].z)));
PS0i = floatBitsToInt(float(R127i.y));
// 15
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PS0i)) + intBitsToFloat(R124i.y));
PS1i = floatBitsToInt(float(R126i.y));
// 16
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R0i.y)) + intBitsToFloat(R123i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.y)),intBitsToFloat(PS1i)) + intBitsToFloat(R125i.w));
// 17
R13i.x = floatBitsToInt(intBitsToFloat(R123i.x) + 0.5);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R1i.y)) + -(intBitsToFloat(R123i.y)));
// 18
R13i.y = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
R13i.z = 0;
}
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R6i.y),intBitsToFloat(R5i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(uf_remappedVS[29].x),intBitsToFloat(uf_remappedVS[29].y),intBitsToFloat(uf_remappedVS[29].z),intBitsToFloat(uf_remappedVS[29].w))));
PV0iy = R0i.x;
PV0iz = R0i.x;
PV0iw = R0i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R6i.y),intBitsToFloat(R5i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(uf_remappedVS[30].x),intBitsToFloat(uf_remappedVS[30].y),intBitsToFloat(uf_remappedVS[30].z),intBitsToFloat(uf_remappedVS[30].w))));
PV1ix = tempi.x;
R0i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R6i.y),intBitsToFloat(R5i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(uf_remappedVS[31].x),intBitsToFloat(uf_remappedVS[31].y),intBitsToFloat(uf_remappedVS[31].z),intBitsToFloat(uf_remappedVS[31].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R0i.z = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R6i.y),intBitsToFloat(R5i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(uf_remappedVS[32].x),intBitsToFloat(uf_remappedVS[32].y),intBitsToFloat(uf_remappedVS[32].z),intBitsToFloat(uf_remappedVS[32].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R0i.w = tempi.x;
// 4
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),intBitsToFloat(R2i.w)) + intBitsToFloat(uf_remappedVS[16].x));
PV0iw = PV1ix;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
// 5
R123i.y = floatBitsToInt(intBitsToFloat(R0i.z) * 0.0 + intBitsToFloat(PV0iw));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R3i.y)) + intBitsToFloat(R1i.x));
R14i.w = floatBitsToInt(intBitsToFloat(R0i.z) * 0.0 + intBitsToFloat(R0i.w));
R14i.z = floatBitsToInt(intBitsToFloat(R0i.z) * 0.5 + intBitsToFloat(PV0iw));
// 6
R14i.x = floatBitsToInt(intBitsToFloat(R0i.x) * 0.5 + intBitsToFloat(R123i.y));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].x),intBitsToFloat(R5i.y)) + intBitsToFloat(R123i.z));
R14i.y = floatBitsToInt(intBitsToFloat(R0i.y) * -(0.5) + intBitsToFloat(R123i.y));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = uf_remappedVS[33].x;
R124i.z = uf_remappedVS[33].z;
PV0iw = uf_remappedVS[33].y;
// 1
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedVS[34].x)));
PV1iy = uf_remappedVS[35].x;
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedVS[34].y)));
// 2
backupReg0i = R1i.z;
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(uf_remappedVS[34].z)));
R8i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(uf_remappedVS[28].w)));
R9i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[34].w)));
// 3
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(uf_remappedVS[36].x)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(uf_remappedVS[36].x)));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(uf_remappedVS[36].x)));
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].x), intBitsToFloat(R1i.x)));
// 4
R12i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].x) * 1.0 + 0.0);
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].x), intBitsToFloat(R1i.y)));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].x), intBitsToFloat(R1i.z)));
// 5
R10i.x = R7i.x;
R10i.y = R7i.y;
R10i.z = R7i.z;
R10i.w = R7i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R8i.x), intBitsToFloat(R8i.y), intBitsToFloat(R8i.z), intBitsToFloat(R8i.w));
// export
// skipped export to semanticId 255
// export
passParameterSem3 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.z));
// export
passParameterSem8 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.z));
}
