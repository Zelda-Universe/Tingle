#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 1470c62bd1477ae8
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[54];
TEXTURE_LAYOUT(39, 0, 0) uniform sampler2D textureUnitVS7;
TEXTURE_LAYOUT(40, 0, 1) uniform sampler2D textureUnitVS8;
TEXTURE_LAYOUT(44, 0, 2) uniform sampler2DArrayShadow textureUnitVS12;
TEXTURE_LAYOUT(45, 0, 3) uniform sampler2D textureUnitVS13;
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

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem2;
out vec4 passParameterSem3;
out vec4 passParameterSem7;
out vec4 passParameterSem8;
out vec4 passParameterSem11;
out vec4 passParameterSem12;
out vec4 passParameterSem14;
out vec4 passParameterSem15;
out vec4 passParameterSem16;
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
ivec4 R16i = ivec4(0);
ivec4 R17i = ivec4(0);
ivec4 R18i = ivec4(0);
ivec4 R19i = ivec4(0);
ivec4 R20i = ivec4(0);
ivec4 R21i = ivec4(0);
ivec4 R22i = ivec4(0);
ivec4 R23i = ivec4(0);
ivec4 R24i = ivec4(0);
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
bool activeMaskStack[5];
bool activeMaskStackC[6];
activeMaskStack[0] = false;
activeMaskStack[1] = false;
activeMaskStack[2] = false;
activeMaskStack[3] = false;
activeMaskStackC[0] = false;
activeMaskStackC[1] = false;
activeMaskStackC[2] = false;
activeMaskStackC[3] = false;
activeMaskStackC[4] = false;
activeMaskStack[0] = true;
activeMaskStackC[0] = true;
activeMaskStackC[1] = true;
R0i = ivec4(gl_VertexID, 0, 0, gl_InstanceID);
attrDecoder = attrDataSem6;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyz = attrDataSem5.xyz;
attrDecoder.xyz = uvec3((attrDecoder.xyz>>24)|((attrDecoder.xyz>>8)&0xFF00u)|((attrDecoder.xyz<<8)&0xFF0000u)|((attrDecoder.xyz<<24)));
attrDecoder.w = uint(0);
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), 0x3f800000);
attrDecoder = attrDataSem11;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R11i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem10;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R10i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem3;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem4;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem8;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R9i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem7;
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
R0i.z = floatBitsToInt(-(intBitsToFloat(R10i.y)) + 1.0);
R6i.w = 0;
R7i.w = floatBitsToInt(1.0);
// 1
R0i.w = floatBitsToInt(-(intBitsToFloat(R5i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R5i.w = floatBitsToInt(-(intBitsToFloat(R10i.x)) + 1.0);
// 2
predResult = (0.0 > intBitsToFloat(R0i.w));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R21i.x = 0;
R21i.y = 0;
R21i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R14i.x = 0;
// 1
R10i.w = R7i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R10i.w = R6i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R10i.w == 0);
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
R0i.x = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R0i.w) >= intBitsToFloat(R0i.x));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R21i.x = 0;
R21i.y = 0;
R21i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R14i.x = 0;
// 1
R6i.w = R7i.w;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R6i.w == 0);
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
R127i.x = R1i.y;
R0i.y = R2i.x;
R10i.z = R3i.x;
R127i.w = R2i.y;
R127i.z = R3i.y;
// 1
R126i.x = R1i.z;
R127i.y = R2i.z;
R126i.z = R3i.z;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R0i.y),intBitsToFloat(R10i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R0i.y),intBitsToFloat(R10i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.w),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.w),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R12i.y = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R4i.w = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 5
R0i.y = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 6
predResult = (intBitsToFloat(R12i.y) > 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R12i.y));
// 1
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R127i.y)));
R17i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R127i.y)));
// 2
R16i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R13i.x = 0;
// 1
R16i.x = R13i.x;
// 2
R17i.x = R13i.x;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (intBitsToFloat(R4i.w) > 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R4i.w));
// 1
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R127i.x)));
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R127i.x)));
// 2
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R16i.y = 0;
R17i.y = 0;
// 1
R13i.y = 0;
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
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R127i.x)));
R17i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R127i.x)));
// 2
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R16i.z = 0;
R17i.z = 0;
// 1
R13i.z = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(uf_remappedVS[2].y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(uf_remappedVS[2].z)));
PV0iw = floatBitsToInt(max(intBitsToFloat(R8i.x), 0.0));
R14i.x = 0;
// 1
PV1iz = floatBitsToInt(min(intBitsToFloat(PV0iw), 0.0));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(uf_remappedVS[3].w)));
R10i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(R0i.w));
// 2
R0i.x = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(PV1iz));
// 3
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[2].x)));
// 4
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(uf_remappedVS[3].y)));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[3].z)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R0i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].x)) + 1.0);
R12i.z = ((intBitsToFloat(uf_remappedVS[4].x) == 1.0)?-1:0);
// 1
predResult = (R12i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(R10i.z)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].w), intBitsToFloat(PV0ix)));
// 2
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].x), intBitsToFloat(PV1iw)));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), intBitsToFloat(PV1iw)));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].z), intBitsToFloat(PV1iw)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
tempResultf = max(0.0, abs(intBitsToFloat(uf_remappedVS[4].x)));
tempResultf = log2(tempResultf);
PS0i = floatBitsToInt(tempResultf);
// 1
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f317218));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[4].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(PS1i)));
R127i.y = ((intBitsToFloat(uf_remappedVS[4].x) == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R0i.y));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R10i.z) + -(intBitsToFloat(PV1iz)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].w), intBitsToFloat(PV1ix)));
// 9
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].x), intBitsToFloat(PV0iw)));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), intBitsToFloat(PV0iw)));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].z), intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = uf_remappedVS[6].x;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
PV0iy = uf_remappedVS[6].y;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R4i.w)));
R126i.w = 0x3f800000;
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[4].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(PV0iy));
R124i.y = 0x3f800000;
PV1iz = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(PS0i)));
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R0i.y));
// 2
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1iz)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(PV1ix)));
R125i.z = uf_remappedVS[7].x & 0x80000;
PV0iw = uf_remappedVS[7].y & int(1);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iw)));
// 3
PV1ix = (int(1) != PV0iw)?-1:0;
R7i.y = ((intBitsToFloat(R8i.x) > 0.5)?-1:0);
PV1iz = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R125i.w = uf_remappedVS[7].x & 0x100000;
R127i.y = int(intBitsToFloat(uf_remappedVS[8].z));
// 4
R12i.x = ((intBitsToFloat(R8i.y) > 0.5)?-1:0);
R0i.y = uf_remappedVS[7].x & 0x200000;
R123i.z = ((PV1ix == 0)?(0):(int(1)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(R127i.x));
R126i.y = int(intBitsToFloat(uf_remappedVS[9].z));
// 5
R7i.x = (R123i.z == 0x2)?-1:0;
R123i.y = ((R12i.z == 0)?(PV0iw):(R10i.z));
R7i.z = (R123i.z == int(1))?-1:0;
R124i.w = ((intBitsToFloat(R8i.z) > 0.5)?-1:0);
R0i.x = floatBitsToInt(float(R127i.y));
// 6
backupReg0i = R126i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R123i.y)));
R126i.y = floatBitsToInt(-(abs(intBitsToFloat(R0i.x))) + 0.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R123i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R123i.y)));
R5i.x = floatBitsToInt(float(backupReg0i));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R9i.z) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(intBitsToFloat(R9i.y) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt((0.0 >= abs(intBitsToFloat(R0i.x)))?1.0:0.0);
R127i.w = floatBitsToInt(-(abs(intBitsToFloat(R5i.x))) + 0.0);
// 8
PV0ix = floatBitsToInt((0.0 >= abs(intBitsToFloat(R5i.x)))?1.0:0.0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(PV1iy)));
R127i.y = ((intBitsToFloat(PV1iw) == 0.0)?(0):(R126i.y));
// 9
backupReg0i = R127i.y;
R127i.x = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV0iw));
R126i.y = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV0iy));
R127i.z = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(PV0iz));
R127i.w = ((intBitsToFloat(PV0ix) == 0.0)?(0):(R127i.w));
R4i.x = floatBitsToInt(abs(intBitsToFloat(R0i.x)) + intBitsToFloat(backupReg0i));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R126i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R1i.w = tempi.x;
R125i.x = floatBitsToInt(1.0 / intBitsToFloat(R0i.x));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R126i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R2i.w = tempi.x;
R126i.x = floatBitsToInt(abs(intBitsToFloat(R5i.x)) + intBitsToFloat(R127i.w));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R126i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R3i.w = tempi.x;
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R5i.x));
// 13
R22i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),intBitsToFloat(R124i.y))));
PV1iy = R22i.x;
PV1iz = R22i.x;
PV1iw = R22i.x;
R127i.w = ((-(intBitsToFloat(R127i.w)) > 0.0)?(R126i.x):(R127i.w));
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R17i.x),intBitsToFloat(R17i.y),intBitsToFloat(R17i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),intBitsToFloat(R124i.y))));
PV0ix = tempi.x;
R22i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.w = floatBitsToInt(intBitsToFloat(R125i.x) * 0.0);
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),intBitsToFloat(R124i.y))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R22i.z = tempi.x;
PV1iw = tempi.x;
R4i.w = floatBitsToInt(1.0);
// 16
R123i.x = ((-(intBitsToFloat(R127i.y)) > 0.0)?(R4i.x):(R127i.y));
R124i.y = uf_remappedVS[7].x & 0x400000;
R123i.z = ((R7i.x == 0)?(R8i.y):(R8i.x));
R123i.w = ((R7i.x == 0)?(R8i.x):(R8i.z));
R126i.z = ((intBitsToFloat(R8i.w) > 0.5)?-1:0);
// 17
backupReg0i = R127i.x;
backupReg1i = R127i.w;
R127i.x = ((R7i.z == 0)?(R123i.z):(R8i.z));
R127i.y = ((R7i.z == 0)?(R123i.w):(R8i.y));
R127i.z = ((intBitsToFloat(R0i.x) == 0.0)?(0):(R123i.x));
R127i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * 0.0);
R2i.z = ((intBitsToFloat(R5i.x) == 0.0)?(0):(backupReg1i));
// 18
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(uf_remappedVS[10].x)));
R124i.x = floatBitsToInt(intBitsToFloat(R124i.x) * 2.0);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(uf_remappedVS[10].y)));
R125i.y = floatBitsToInt(intBitsToFloat(R125i.y) * 2.0);
R3i.z = floatBitsToInt(trunc(intBitsToFloat(R126i.w)));
R126i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[11].z) + intBitsToFloat(uf_remappedVS[10].x));
R125i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[11].w) + intBitsToFloat(uf_remappedVS[10].y));
// 19
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].x), intBitsToFloat(R127i.y)));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].y), intBitsToFloat(R127i.x)));
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) * 2.0);
R5i.z = floatBitsToInt(trunc(intBitsToFloat(R127i.w)));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[13].z) + intBitsToFloat(uf_remappedVS[12].x));
PS1i = floatBitsToInt(intBitsToFloat(uf_remappedVS[13].w) + intBitsToFloat(uf_remappedVS[12].y));
// 20
R5i.x = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(PV1iw));
R2i.y = floatBitsToInt(-(intBitsToFloat(PV1iy)) + intBitsToFloat(PS1i));
R10i.z = floatBitsToInt(-(intBitsToFloat(R124i.x)) + intBitsToFloat(R126i.w));
R1i.w = floatBitsToInt(-(intBitsToFloat(R125i.y)) + intBitsToFloat(R125i.x));
R1i.z = (R125i.z == 0x80000)?-1:0;
// 21
backupReg0i = R0i.y;
backupReg1i = R12i.x;
R12i.x = ((R7i.y == 0)?(R10i.x):(R5i.w));
R0i.y = (R125i.w == 0x100000)?-1:0;
R4i.z = (backupReg0i == 0x200000)?-1:0;
R3i.w = ((backupReg1i == 0)?(R10i.y):(R0i.z));
R9i.z = ((R124i.w == 0)?(R10i.x):(R5i.w));
// 22
R0i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[14].y) + intBitsToFloat(uf_remappedVS[14].w));
R7i.y = ((R126i.z == 0)?(R10i.y):(R0i.z));
R0i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[14].x) + intBitsToFloat(uf_remappedVS[14].z));
R2i.w = (R124i.y == 0x400000)?-1:0;
R3i.y = int(intBitsToFloat(R127i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
R21i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R22i.x),intBitsToFloat(R22i.y),intBitsToFloat(R22i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(uf_remappedVS[15].x),intBitsToFloat(uf_remappedVS[15].y),intBitsToFloat(uf_remappedVS[15].z),intBitsToFloat(uf_remappedVS[15].w))));
PV0iy = R21i.x;
PV0iz = R21i.x;
PV0iw = R21i.x;
R124i.y = int(intBitsToFloat(R3i.z));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R22i.x),intBitsToFloat(R22i.y),intBitsToFloat(R22i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),intBitsToFloat(uf_remappedVS[16].w))));
PV1ix = tempi.x;
R21i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R124i.w = ((R7i.z == 0)?(R8i.x):(R8i.y));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R22i.x),intBitsToFloat(R22i.y),intBitsToFloat(R22i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(uf_remappedVS[17].x),intBitsToFloat(uf_remappedVS[17].y),intBitsToFloat(uf_remappedVS[17].z),intBitsToFloat(uf_remappedVS[17].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R21i.z = tempi.x;
PV0iw = tempi.x;
R127i.z = ((R7i.z == 0)?(R8i.y):(R8i.z));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R22i.x),intBitsToFloat(R22i.y),intBitsToFloat(R22i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(uf_remappedVS[18].x),intBitsToFloat(uf_remappedVS[18].y),intBitsToFloat(uf_remappedVS[18].z),intBitsToFloat(uf_remappedVS[18].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R21i.w = tempi.x;
R125i.y = int(intBitsToFloat(R2i.z));
// 4
backupReg0i = R0i.y;
R125i.x = ((R1i.z == 0)?(R10i.x):(R12i.x));
R0i.y = ((R4i.z == 0)?(R10i.x):(R9i.z));
R125i.z = ((backupReg0i == 0)?(R10i.y):(R3i.w));
R125i.w = PV1ix;
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) / 2.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[8].z));
// 5
R126i.x = ((R2i.w == 0)?(R10i.y):(R7i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x), intBitsToFloat(PS0i)));
R15i.z = floatBitsToInt(intBitsToFloat(R21i.z) * 0.5 + intBitsToFloat(R125i.w));
R15i.w = floatBitsToInt(intBitsToFloat(R21i.z) * 0.0 + intBitsToFloat(R21i.w));
R126i.z = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[8].w));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[19].y) + intBitsToFloat(uf_remappedVS[19].w));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y)) + -(0.5));
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[19].x) + intBitsToFloat(uf_remappedVS[19].z));
R2i.w = floatBitsToInt(intBitsToFloat(R21i.z) * 0.0 + intBitsToFloat(R125i.w));
R3i.w = floatBitsToInt(1.0 / intBitsToFloat(R15i.w));
// 7
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(uf_remappedVS[14].w)) + intBitsToFloat(R0i.x));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[19].z),intBitsToFloat(R124i.w)) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(intBitsToFloat(R15i.z) * intBitsToFloat(R3i.w));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[19].w),intBitsToFloat(R127i.z)) + intBitsToFloat(PV0ix));
R7i.y = int(intBitsToFloat(R5i.z));
// 8
backupReg0i = R3i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(uf_remappedVS[1].w)) + -(intBitsToFloat(uf_remappedVS[1].y)));
R3i.y = floatBitsToInt(intBitsToFloat(R12i.y) + 1.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R13i.z)));
R127i.z = floatBitsToInt(float(backupReg0i));
// 9
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(uf_remappedVS[14].z)) + intBitsToFloat(R0i.z));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].y), intBitsToFloat(R126i.z)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R13i.y)) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.x));
// 10
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R8i.y)) + -(0.5));
R4i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS1i));
R125i.x = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[9].z));
// 11
R20i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R13i.x)) + intBitsToFloat(R126i.z));
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.w)),intBitsToFloat(uf_remappedVS[11].x)) + -(intBitsToFloat(R10i.z)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(uf_remappedVS[11].y)) + intBitsToFloat(R1i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R17i.y)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[9].w));
// 12
backupReg0i = R125i.x;
backupReg1i = R124i.y;
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.w)),intBitsToFloat(uf_remappedVS[13].x)) + -(intBitsToFloat(R5i.x)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].y), intBitsToFloat(PS1i)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(uf_remappedVS[13].y)) + intBitsToFloat(R2i.y));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].x), intBitsToFloat(backupReg0i)));
R124i.w = floatBitsToInt(float(backupReg1i));
// 13
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R127i.z)) + intBitsToFloat(R126i.y));
R2i.y = uf_remappedVS[20].y;
R10i.z = uf_remappedVS[20].x;
R1i.w = uf_remappedVS[20].z;
PS1i = floatBitsToInt(float(R125i.y));
// 14
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PS1i)) + intBitsToFloat(R125i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R8i.y)),intBitsToFloat(R124i.w)) + intBitsToFloat(R126i.z));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(uf_remappedVS[10].z)) + intBitsToFloat(R124i.x));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(uf_remappedVS[10].w)) + intBitsToFloat(backupReg0i));
PS0i = floatBitsToInt(float(R7i.y));
// 15
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(uf_remappedVS[12].z)) + intBitsToFloat(R10i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.y)),intBitsToFloat(PS0i)) + intBitsToFloat(R125i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R126i.w)) + -(0.5));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(uf_remappedVS[12].w)) + intBitsToFloat(R125i.w));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R124i.y)) + -(0.5));
// 16
backupReg0i = R127i.x;
backupReg1i = R127i.y;
backupReg2i = R127i.w;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R1i.y)) + intBitsToFloat(R5i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(R123i.z)) + intBitsToFloat(backupReg0i));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(R122i.x)) + -(intBitsToFloat(R123i.y)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(R8i.x)) + -(intBitsToFloat(backupReg1i)));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R17i.z)) + intBitsToFloat(backupReg2i));
// 17
R15i.x = floatBitsToInt(intBitsToFloat(R21i.x) * 0.5 + intBitsToFloat(R2i.w));
R20i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R17i.x)) + intBitsToFloat(R122i.x));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R16i.z)));
R15i.y = floatBitsToInt(intBitsToFloat(R21i.y) * -(0.5) + intBitsToFloat(R2i.w));
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(PV1iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R20i.z = tempi.x;
PV0iw = tempi.x;
R19i.x = floatBitsToInt(intBitsToFloat(R127i.x) + 0.5);
// 19
R0i.x = floatBitsToInt(intBitsToFloat(R14i.x) + intBitsToFloat(R22i.x));
R19i.y = floatBitsToInt(intBitsToFloat(R127i.w) + 0.5);
R19i.z = floatBitsToInt(intBitsToFloat(R127i.y) + 0.5);
R19i.w = floatBitsToInt(intBitsToFloat(R126i.z) + 0.5);
R0i.y = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(R22i.y));
// 20
R1i.z = floatBitsToInt(intBitsToFloat(R14i.x) + intBitsToFloat(R22i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = ((intBitsToFloat(R4i.y) > intBitsToFloat(uf_remappedVS[21].y))?-1:0);
R6i.y = uf_remappedVS[22].y;
R6i.z = uf_remappedVS[22].x;
PV0iw = ((intBitsToFloat(R4i.y) > intBitsToFloat(uf_remappedVS[21].x))?-1:0);
// 1
R6i.x = uf_remappedVS[22].z;
R127i.y = ((intBitsToFloat(R4i.y) > intBitsToFloat(uf_remappedVS[21].z))?-1:0);
PV1iz = PV0iw & int(1);
// 2
R5i.x = uf_remappedVS[23].x;
PV0iy = PV1iz - R127i.x;
R2i.w = uf_remappedVS[24].x;
// 3
PV1ix = PV0iy - R127i.y;
// 4
R4i.w = floatBitsToInt(float(PV1ix));
}
if( activeMaskStackC[3] == true ) {
// 0
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(uf_remappedVS[25].x)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(uf_remappedVS[25].y)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(uf_remappedVS[25].z)));
R17i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(uf_remappedVS[25].w)));
// 1
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(uf_remappedVS[26].x)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(uf_remappedVS[26].y)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(uf_remappedVS[26].z)));
R18i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(uf_remappedVS[26].w)));
// 2
R17i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(uf_remappedVS[27].x)));
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[27].x)));
R17i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[27].x)));
R18i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[27].x), intBitsToFloat(R2i.x)));
// 3
R18i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[27].x), intBitsToFloat(R2i.y)));
R18i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[27].x), intBitsToFloat(R2i.z)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R14i.y = uf_remappedVS[28].x;
// 1
predResult = (intBitsToFloat(R4i.w) == 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R0i.y = R0i.y;
R0i.z = R1i.z;
R0i.w = 0x3f800000;
// 1
R1i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[29].x),intBitsToFloat(uf_remappedVS[29].y),intBitsToFloat(uf_remappedVS[29].z),intBitsToFloat(uf_remappedVS[29].w))));
PV1iy = R1i.x;
PV1iz = R1i.x;
PV1iw = R1i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[30].x),intBitsToFloat(uf_remappedVS[30].y),intBitsToFloat(uf_remappedVS[30].z),intBitsToFloat(uf_remappedVS[30].w))));
PV0ix = tempi.x;
R1i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[31].x),intBitsToFloat(uf_remappedVS[31].y),intBitsToFloat(uf_remappedVS[31].z),intBitsToFloat(uf_remappedVS[31].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R1i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[32].x),intBitsToFloat(uf_remappedVS[32].y),intBitsToFloat(uf_remappedVS[32].z),intBitsToFloat(uf_remappedVS[32].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R2i.z = tempi.x;
PV0iw = tempi.x;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
activeMaskStack[4] = activeMaskStack[3];
activeMaskStackC[5] = activeMaskStackC[4];
// 0
predResult = (intBitsToFloat(R4i.w) == 1.0);
activeMaskStack[4] = predResult;
activeMaskStackC[5] = predResult == true && activeMaskStackC[4] == true;
}
else {
activeMaskStack[4] = false;
activeMaskStackC[5] = false;
}
if( activeMaskStackC[5] == true ) {
// 0
R0i.y = R0i.y;
R0i.z = R1i.z;
R0i.w = 0x3f800000;
// 1
R1i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[33].x),intBitsToFloat(uf_remappedVS[33].y),intBitsToFloat(uf_remappedVS[33].z),intBitsToFloat(uf_remappedVS[33].w))));
PV1iy = R1i.x;
PV1iz = R1i.x;
PV1iw = R1i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[34].x),intBitsToFloat(uf_remappedVS[34].y),intBitsToFloat(uf_remappedVS[34].z),intBitsToFloat(uf_remappedVS[34].w))));
PV0ix = tempi.x;
R1i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[35].x),intBitsToFloat(uf_remappedVS[35].y),intBitsToFloat(uf_remappedVS[35].z),intBitsToFloat(uf_remappedVS[35].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R1i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[36].x),intBitsToFloat(uf_remappedVS[36].y),intBitsToFloat(uf_remappedVS[36].z),intBitsToFloat(uf_remappedVS[36].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R2i.z = tempi.x;
PV0iw = tempi.x;
}
activeMaskStack[4] = activeMaskStack[4] == false;
activeMaskStackC[5] = activeMaskStack[4] == true && activeMaskStackC[4] == true;
if( activeMaskStackC[5] == true ) {
// 0
R0i.y = R0i.y;
R0i.z = R1i.z;
R0i.w = 0x3f800000;
// 1
R1i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[37].x),intBitsToFloat(uf_remappedVS[37].y),intBitsToFloat(uf_remappedVS[37].z),intBitsToFloat(uf_remappedVS[37].w))));
PV1iy = R1i.x;
PV1iz = R1i.x;
PV1iw = R1i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[38].x),intBitsToFloat(uf_remappedVS[38].y),intBitsToFloat(uf_remappedVS[38].z),intBitsToFloat(uf_remappedVS[38].w))));
PV0ix = tempi.x;
R1i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[39].x),intBitsToFloat(uf_remappedVS[39].y),intBitsToFloat(uf_remappedVS[39].z),intBitsToFloat(uf_remappedVS[39].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R1i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[40].x),intBitsToFloat(uf_remappedVS[40].y),intBitsToFloat(uf_remappedVS[40].z),intBitsToFloat(uf_remappedVS[40].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R2i.z = tempi.x;
PV0iw = tempi.x;
}
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(-(intBitsToFloat(R22i.x)) + intBitsToFloat(uf_remappedVS[41].x));
R127i.y = floatBitsToInt(-(intBitsToFloat(R22i.y)) + intBitsToFloat(uf_remappedVS[41].y));
R127i.z = floatBitsToInt(-(intBitsToFloat(R22i.z)) + intBitsToFloat(uf_remappedVS[41].z));
R127i.w = floatBitsToInt(intBitsToFloat(R15i.y) * intBitsToFloat(R3i.w));
R125i.z = floatBitsToInt(1.0 / intBitsToFloat(R2i.z));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.y = floatBitsToInt(intBitsToFloat(R1i.z) * intBitsToFloat(R125i.z));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[42].x),intBitsToFloat(uf_remappedVS[42].y),intBitsToFloat(uf_remappedVS[42].z),intBitsToFloat(uf_remappedVS[42].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
R126i.z = floatBitsToInt(tempResultf);
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[43].x),intBitsToFloat(uf_remappedVS[43].y),intBitsToFloat(uf_remappedVS[43].z),intBitsToFloat(uf_remappedVS[43].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R124i.z = tempi.x;
PV1iw = tempi.x;
R126i.x = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[44].x),intBitsToFloat(uf_remappedVS[44].y),intBitsToFloat(uf_remappedVS[44].z),intBitsToFloat(uf_remappedVS[44].w))));
PV0ix = tempi.x;
R125i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R126i.z)));
// 5
R0i.x = floatBitsToInt(intBitsToFloat(R1i.x) * intBitsToFloat(R125i.z));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R126i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R126i.z)));
R0i.w = R126i.y;
R0i.w = clampFI32(R0i.w);
R0i.y = floatBitsToInt(intBitsToFloat(R1i.y) * intBitsToFloat(R125i.z));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(PV1iy),intBitsToFloat(PV1iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[45].x),intBitsToFloat(uf_remappedVS[45].y),intBitsToFloat(uf_remappedVS[45].z),0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.z = floatBitsToInt(roundEven(intBitsToFloat(R4i.w)));
// 7
backupReg0i = R127i.w;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R126i.x)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R126i.x)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(uf_remappedVS[46].x)) + -(intBitsToFloat(uf_remappedVS[46].y)));
R123i.z = clampFI32(R123i.z);
R127i.w = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
PS1i = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
// 8
backupReg0i = R123i.z;
R123i.x = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3f333333) + intBitsToFloat(0x3e19999a));
R123i.x = clampFI32(R123i.x);
R125i.y = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
R123i.z = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
PV0iw = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
R3i.y = 0;
// 9
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[45].y) + 1.0);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R123i.z)) + intBitsToFloat(0xbe593484));
PV1iz = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(uf_remappedVS[47].x)) + -(intBitsToFloat(uf_remappedVS[47].y)));
R126i.w = clampFI32(R126i.w);
tempResultf = max(0.0, intBitsToFloat(PV0iw));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R127i.y = floatBitsToInt(tempResultf);
// 10
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + 8.5);
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) * 1.5);
PV0iy = clampFI32(PV0iy);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[48].y), intBitsToFloat(R127i.y)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R123i.y)) + intBitsToFloat(0x3fc90da4));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(R125i.y)));
// 11
R3i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3daaaaab));
R5i.y = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * 15.0);
PV1iw = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f22f983));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 12
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),-(intBitsToFloat(R127i.w))) + 1.0);
R2i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[48].x), intBitsToFloat(R127i.y)));
R1i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[45].y) * 1.0 + intBitsToFloat(R4i.y));
R4i.y = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
}
if( activeMaskStackC[3] == true ) {
R0i.w = floatBitsToInt(texture(textureUnitVS12, vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))));
R0i.z = floatBitsToInt(texture(textureUnitVS7, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y))).x);
R2i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y))).xyz);
R16i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R0i.w)) + 1.0);
PV0iy = floatBitsToInt(intBitsToFloat(R1i.w) * intBitsToFloat(R4i.y));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[49].y)));
tempResultf = max(0.0, intBitsToFloat(R5i.y));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R124i.z = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(min(intBitsToFloat(uf_remappedVS[41].y), intBitsToFloat(uf_remappedVS[50].z)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R127i.w)) + 1.0);
PV1iw = floatBitsToInt(max(intBitsToFloat(PV0iy), intBitsToFloat(0x3e4ccccd)));
PS1i = floatBitsToInt(exp2(intBitsToFloat(R1i.z)));
// 2
R3i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[48].z)),intBitsToFloat(PS1i)) + intBitsToFloat(uf_remappedVS[48].z));
R3i.x = clampFI32(R3i.x);
R4i.y = floatBitsToInt(-(intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.z));
PV0iz = floatBitsToInt(-(intBitsToFloat(R22i.y)) + intBitsToFloat(PV1ix));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[47].w), intBitsToFloat(R124i.z)));
PS0i = floatBitsToInt(min(intBitsToFloat(PV1iw), 1.0));
// 3
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PS0i)));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PS0i)));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PS0i)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[50].y),intBitsToFloat(PV0iz)) + intBitsToFloat(uf_remappedVS[50].x));
R0i.w = clampFI32(R0i.w);
R23i.x = floatBitsToInt(intBitsToFloat(R22i.x) + -(intBitsToFloat(uf_remappedVS[41].x)));
// 4
R23i.y = floatBitsToInt(intBitsToFloat(R22i.y) + -(intBitsToFloat(uf_remappedVS[41].y)));
R23i.z = floatBitsToInt(intBitsToFloat(R22i.z) + -(intBitsToFloat(uf_remappedVS[41].z)));
R2i.y = floatBitsToInt(exp2(intBitsToFloat(R127i.w)));
}
if( activeMaskStackC[3] == true ) {
// 0
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[51].w)));
R12i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(uf_remappedVS[52].z)));
// 1
R12i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.y)),intBitsToFloat(uf_remappedVS[53].w)) + intBitsToFloat(uf_remappedVS[53].w));
PV1iy = floatBitsToInt(-(intBitsToFloat(R12i.w)) + intBitsToFloat(R3i.x));
PV1iy = clampFI32(PV1iy);
// 2
R12i.z = PV1iy;
R13i.w = PV1iy;
}
if( activeMaskStackC[3] == true ) {
// 0
R14i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[3].x) * 1.0 + 0.0);
// 1
R24i.x = R11i.x;
R24i.y = R11i.y;
R24i.z = R11i.z;
R24i.w = R11i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R21i.x), intBitsToFloat(R21i.y), intBitsToFloat(R21i.z), intBitsToFloat(R21i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w));
// export
passParameterSem2 = vec4(intBitsToFloat(R23i.x), intBitsToFloat(R23i.y), intBitsToFloat(R23i.z), intBitsToFloat(R23i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R24i.x), intBitsToFloat(R24i.y), intBitsToFloat(R24i.z), intBitsToFloat(R24i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.w));
// export
passParameterSem12 = vec4(intBitsToFloat(R22i.x), intBitsToFloat(R22i.y), intBitsToFloat(R22i.z), intBitsToFloat(R22i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.z));
}
