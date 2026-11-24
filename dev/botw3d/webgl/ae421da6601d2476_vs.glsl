#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader ae421da6601d2476
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[25];
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
attrDecoder = attrDataSem6;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem8;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem7;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
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
R4i.y = floatBitsToInt(-(intBitsToFloat(R2i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R2i.w = 0;
R3i.w = floatBitsToInt(1.0);
// 1
predResult = (0.0 > intBitsToFloat(R4i.y));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R10i.x = 0;
R10i.y = 0;
R10i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R7i.x = 0;
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
predResult = (intBitsToFloat(R4i.y) >= intBitsToFloat(R4i.z));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R10i.x = 0;
R10i.y = 0;
R10i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R7i.x = 0;
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
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].x), intBitsToFloat(R127i.y)));
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].x), intBitsToFloat(R127i.y)));
// 2
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].x), intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R8i.x = 0;
// 1
R10i.x = R8i.x;
// 2
R9i.x = R8i.x;
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
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].y), intBitsToFloat(R127i.x)));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].y), intBitsToFloat(R127i.x)));
// 2
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R10i.y = 0;
R9i.y = 0;
// 1
R8i.y = 0;
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
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].z), intBitsToFloat(R127i.x)));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].z), intBitsToFloat(R127i.x)));
// 2
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R10i.z = 0;
R9i.z = 0;
// 1
R8i.z = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(uf_remappedVS[5].y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(uf_remappedVS[5].z)));
PV0iw = floatBitsToInt(max(intBitsToFloat(R4i.x), 0.0));
// 1
R7i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(R4i.y));
PV1iz = floatBitsToInt(min(intBitsToFloat(PV0iw), 0.0));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(uf_remappedVS[6].w)));
// 2
R0i.x = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV1iz));
// 3
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[5].x)));
// 4
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(uf_remappedVS[6].y)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[6].z)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R0i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].x)) + 1.0);
R4i.z = ((intBitsToFloat(uf_remappedVS[7].x) == 1.0)?-1:0);
// 1
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(R7i.y)));
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
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PS1i)));
R127i.y = ((intBitsToFloat(uf_remappedVS[7].x) == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R0i.z));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R7i.y) + -(intBitsToFloat(PV1iz)));
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
PV0ix = uf_remappedVS[9].x;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R0i.w)));
PV0iz = uf_remappedVS[9].y;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
R0i.w = 0x3f800000;
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[7].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(intBitsToFloat(R3i.x) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PS0i)));
R4i.w = 0x3f800000;
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R0i.z));
// 2
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1iy)));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(PV1ix)));
R3i.z = uf_remappedVS[10].x;
R7i.w = floatBitsToInt(1.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iz)));
// 3
PV1iy = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R0i.z = uf_remappedVS[10].z;
R3i.w = uf_remappedVS[10].y;
// 4
R0i.x = uf_remappedVS[11].y;
R4i.y = uf_remappedVS[11].x;
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(R127i.x));
R8i.w = uf_remappedVS[11].z;
// 5
R4i.x = uf_remappedVS[12].x;
R123i.w = ((R4i.z == 0)?(PV0iz):(R7i.y));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R123i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R123i.w)));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV0iy));
// 8
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV1iy)));
// 9
R1i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV0iz));
R1i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV0iw));
R1i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0iy));
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),intBitsToFloat(uf_remappedVS[13].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R1i.w = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[14].x),intBitsToFloat(uf_remappedVS[14].y),intBitsToFloat(uf_remappedVS[14].z),intBitsToFloat(uf_remappedVS[14].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R2i.w = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[15].x),intBitsToFloat(uf_remappedVS[15].y),intBitsToFloat(uf_remappedVS[15].z),intBitsToFloat(uf_remappedVS[15].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R0i.w = tempi.x;
// 3
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R0i.y),intBitsToFloat(R4i.w))));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(uf_remappedVS[16].x)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R9i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R0i.y),intBitsToFloat(R4i.w))));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(uf_remappedVS[16].y)));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R0i.y),intBitsToFloat(R4i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R127i.z = tempi.x;
PV1iw = tempi.x;
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[16].z)));
// 6
R10i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV1ix),intBitsToFloat(R7i.w)),vec4(intBitsToFloat(uf_remappedVS[17].x),intBitsToFloat(uf_remappedVS[17].y),intBitsToFloat(uf_remappedVS[17].z),intBitsToFloat(uf_remappedVS[17].w))));
PV0iy = R10i.x;
PV0iz = R10i.x;
PV0iw = R10i.x;
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R7i.w)),vec4(intBitsToFloat(uf_remappedVS[18].x),intBitsToFloat(uf_remappedVS[18].y),intBitsToFloat(uf_remappedVS[18].z),intBitsToFloat(uf_remappedVS[18].w))));
PV1ix = tempi.x;
R10i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R7i.w)),vec4(intBitsToFloat(uf_remappedVS[19].x),intBitsToFloat(uf_remappedVS[19].y),intBitsToFloat(uf_remappedVS[19].z),intBitsToFloat(uf_remappedVS[19].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R10i.z = tempi.x;
PV0iw = tempi.x;
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R7i.w)),vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R10i.w = tempi.x;
// 10
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(uf_remappedVS[21].x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[21].y)));
PV0iz = PV1ix;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(uf_remappedVS[21].z)));
// 11
R123i.y = floatBitsToInt(intBitsToFloat(R10i.z) * 0.0 + intBitsToFloat(PV0iz));
R11i.z = floatBitsToInt(intBitsToFloat(R10i.z) * 0.5 + intBitsToFloat(PV0iz));
R11i.w = floatBitsToInt(intBitsToFloat(R10i.z) * 0.0 + intBitsToFloat(R10i.w));
R9i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(uf_remappedVS[16].w)));
// 12
R11i.x = floatBitsToInt(intBitsToFloat(R10i.x) * 0.5 + intBitsToFloat(R123i.y));
R11i.y = floatBitsToInt(intBitsToFloat(R10i.y) * -(0.5) + intBitsToFloat(R123i.y));
}
if( activeMaskStackC[3] == true ) {
// 0
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(uf_remappedVS[22].x)));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[22].x)));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[22].x)));
R8i.w = uf_remappedVS[23].x;
// 1
R7i.y = uf_remappedVS[24].x;
}
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[22].x), intBitsToFloat(R0i.x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[22].x), intBitsToFloat(R0i.y)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[22].x), intBitsToFloat(R1i.z)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.w), intBitsToFloat(uf_remappedVS[21].w)));
// 1
R7i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].x) * 1.0 + 0.0);
// 2
R8i.x = R6i.x;
R8i.y = R6i.y;
R8i.z = R6i.z;
R8i.w = R6i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w));
// export
// skipped export to semanticId 255
// export
passParameterSem3 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R8i.x), intBitsToFloat(R8i.y), intBitsToFloat(R8i.z), intBitsToFloat(R8i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.y), intBitsToFloat(R7i.z), intBitsToFloat(R7i.z));
}
