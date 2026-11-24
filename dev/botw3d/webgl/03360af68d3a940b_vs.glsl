#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 03360af68d3a940b
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[66];
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
ATTR_LAYOUT(0, 10) in uvec4 attrDataSem10;

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem3;
out vec4 passParameterSem7;
out vec4 passParameterSem8;
out vec4 passParameterSem11;
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
attrDecoder.xyz = attrDataSem4.xyz;
attrDecoder.xyz = uvec3((attrDecoder.xyz>>24)|((attrDecoder.xyz>>8)&0xFF00u)|((attrDecoder.xyz<<8)&0xFF0000u)|((attrDecoder.xyz<<24)));
attrDecoder.w = uint(0);
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), 0x3f800000);
attrDecoder = attrDataSem10;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R10i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem9;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R9i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem0;
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem1;
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem2;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem3;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem7;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem6;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R11i.z = floatBitsToInt(-(intBitsToFloat(R9i.x)) + 1.0);
R2i.w = 0;
R5i.w = floatBitsToInt(1.0);
// 1
R6i.w = floatBitsToInt(-(intBitsToFloat(R4i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R8i.w = floatBitsToInt(-(intBitsToFloat(R9i.y)) + 1.0);
// 2
predResult = (0.0 > intBitsToFloat(R6i.w));
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
R15i.x = 0;
// 1
R4i.w = R5i.w;
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
PS0i = int(intBitsToFloat(R3i.w));
// 1
R4i.x = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R6i.w) >= intBitsToFloat(R4i.x));
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
R15i.x = 0;
// 1
R2i.w = R5i.w;
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
// 0
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[2].x))?1.0:0.0);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(uf_remappedVS[3].y)));
R125i.z = floatBitsToInt(max(intBitsToFloat(R7i.x), 0.0));
PV0iw = floatBitsToInt((intBitsToFloat(uf_remappedVS[2].x) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[2].x));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R6i.w) * intBitsToFloat(PS0i));
R125i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].z)) + intBitsToFloat(uf_remappedVS[5].z));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0ix)));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].w)) + intBitsToFloat(uf_remappedVS[5].w));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R4i.x));
// 2
backupReg0i = R127i.y;
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].x)) + intBitsToFloat(uf_remappedVS[5].x));
PV0iz = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV1ix));
R11i.w = floatBitsToInt(intBitsToFloat(R6i.w) * intBitsToFloat(PS1i));
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].y)) + intBitsToFloat(uf_remappedVS[5].y));
// 3
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].w)) + intBitsToFloat(uf_remappedVS[6].w));
PV1iy = floatBitsToInt(fract(intBitsToFloat(PV0iz)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.w), intBitsToFloat(PV0ix)));
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].z)) + intBitsToFloat(uf_remappedVS[6].z));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 4
R126i.x = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV1iy)));
R127i.z = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(PS1i));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(PS1i));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].x)) + intBitsToFloat(uf_remappedVS[6].x));
// 5
R0i.x = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV0iy));
R12i.y = floatBitsToInt(min(intBitsToFloat(R125i.z), 0.0));
PV1iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].y)) + intBitsToFloat(uf_remappedVS[6].y));
R3i.w = 0x3f800000;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 6
R127i.x = floatBitsToInt(intBitsToFloat(R0i.x) + -(intBitsToFloat(uf_remappedVS[5].w)));
R127i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(PS1i));
R126i.z = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
R127i.w = floatBitsToInt(intBitsToFloat(R0i.x) + -(intBitsToFloat(uf_remappedVS[4].w)));
R125i.x = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS1i));
// 7
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].w)) + intBitsToFloat(uf_remappedVS[7].w));
R124i.y = floatBitsToInt(intBitsToFloat(R0i.x) + -(intBitsToFloat(uf_remappedVS[6].w)));
R125i.z = ((intBitsToFloat(R127i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R126i.x)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R127i.z)));
// 8
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R125i.w)));
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].x)) + intBitsToFloat(uf_remappedVS[7].x));
R127i.z = ((intBitsToFloat(R127i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].y)) + intBitsToFloat(uf_remappedVS[7].y));
R124i.x = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 9
backupReg0i = R126i.z;
R3i.x = floatBitsToInt(intBitsToFloat(R0i.x) + -(intBitsToFloat(uf_remappedVS[7].w)));
R3i.y = ((intBitsToFloat(R124i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].z)) + intBitsToFloat(uf_remappedVS[7].z));
R125i.w = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(backupReg0i)));
// 10
backupReg0i = R127i.x;
backupReg1i = R127i.w;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R127i.y)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R125i.x)));
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].w)) + intBitsToFloat(uf_remappedVS[8].w));
R127i.w = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(R124i.x));
R124i.z = floatBitsToInt(intBitsToFloat(backupReg1i) * intBitsToFloat(R124i.x));
// 11
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(R124i.x));
R0i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].z) + intBitsToFloat(backupReg0i));
R126i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].y) + intBitsToFloat(R125i.y));
R126i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].x) + intBitsToFloat(R126i.w));
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 12
R124i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].y)) + intBitsToFloat(uf_remappedVS[8].y));
R125i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].x)) + intBitsToFloat(uf_remappedVS[8].x));
R4i.z = ((intBitsToFloat(R3i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iw = floatBitsToInt(-(intBitsToFloat(R3i.y)) + 1.0);
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R125i.w)));
// 13
backupReg0i = R127i.w;
R125i.x = floatBitsToInt(intBitsToFloat(R0i.x) + -(intBitsToFloat(uf_remappedVS[8].w)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PV0iw)));
R127i.z = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[7].z)) + intBitsToFloat(uf_remappedVS[8].z));
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(backupReg0i)));
// 14
backupReg0i = R127i.y;
backupReg1i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].x) + intBitsToFloat(R124i.w));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R124i.z)));
R3i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].z) + intBitsToFloat(backupReg0i));
R124i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].y) + intBitsToFloat(backupReg1i));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R126i.x)));
// 15
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(R126i.y));
R11i.y = ((intBitsToFloat(backupReg0i) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.z = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(R126i.y));
R127i.w = floatBitsToInt(intBitsToFloat(R124i.x) * intBitsToFloat(R126i.y));
R126i.y = floatBitsToInt(-(intBitsToFloat(R4i.z)) + 1.0);
// 16
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R0i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R0i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].x), intBitsToFloat(R127i.z)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R0i.z)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), intBitsToFloat(R127i.z)));
// 17
backupReg0i = R127i.z;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R126i.y)));
R126i.y = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PS0i));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PV0iz));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), intBitsToFloat(backupReg0i)));
R125i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].x) + intBitsToFloat(R0i.x));
// 18
backupReg0i = R125i.x;
backupReg1i = R124i.z;
backupReg2i = R127i.w;
R125i.x = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV1iw));
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].y) + intBitsToFloat(R127i.y));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(backupReg0i)));
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].z) + intBitsToFloat(backupReg1i));
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(backupReg2i)));
// 19
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R4i.y)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R4i.y)));
PV1iz = floatBitsToInt(-(intBitsToFloat(R11i.y)) + 1.0);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R125i.z)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R4i.y)));
// 20
backupReg0i = R126i.y;
backupReg1i = R127i.z;
R125i.x = floatBitsToInt(intBitsToFloat(PS1i) + intBitsToFloat(R125i.x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PV1iz)));
R127i.z = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(backupReg0i));
R126i.w = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(backupReg1i));
R124i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].x) + intBitsToFloat(R124i.z));
// 21
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].z) + intBitsToFloat(R124i.w));
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].y) + intBitsToFloat(R124i.x));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(backupReg0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(backupReg0i)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(backupReg0i)));
// 22
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R126i.w));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R126i.y)));
R3i.z = floatBitsToInt(intBitsToFloat(PS1i) + intBitsToFloat(R125i.x));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R127i.z));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R126i.y)));
// 23
R0i.x = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(PV0iw));
R4i.y = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PV0ix));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R126i.y)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x), intBitsToFloat(R11i.y)));
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].y), intBitsToFloat(R11i.y)));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].z), intBitsToFloat(R11i.y)));
PV0iy = floatBitsToInt(intBitsToFloat(R3i.x) + intBitsToFloat(R0i.x));
PV0iz = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(R4i.y));
PV0iw = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(R3i.z));
R0i.x = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(R12i.y));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iw));
PV1iy = uf_remappedVS[9].x;
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) / 2.0);
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PV0iy)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV0iz)));
PS1i = uf_remappedVS[9].y;
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 2
R8i.x = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(PS1i));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(PV1ix)));
R8i.z = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV1iy));
R2i.w = 0x3f800000;
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[10].y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(uf_remappedVS[10].z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(uf_remappedVS[10].w)));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[10].y)));
// 1
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R8i.z)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(R8i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(PV0iw)));
PV1iw = uf_remappedVS[11].z;
R126i.y = uf_remappedVS[12].z;
// 2
R4i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),intBitsToFloat(uf_remappedVS[13].w))));
PV0iy = R4i.x;
PV0iz = R4i.x;
PV0iw = R4i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PV1iw)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[14].x),intBitsToFloat(uf_remappedVS[14].y),intBitsToFloat(uf_remappedVS[14].z),intBitsToFloat(uf_remappedVS[14].w))));
PV1ix = tempi.x;
R16i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R126i.y)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[15].x),intBitsToFloat(uf_remappedVS[15].y),intBitsToFloat(uf_remappedVS[15].z),intBitsToFloat(uf_remappedVS[15].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R3i.z = tempi.x;
PV0iw = tempi.x;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.y = uf_remappedVS[11].y;
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R1i.x = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV1ix));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),intBitsToFloat(uf_remappedVS[16].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R1i.y = floatBitsToInt(intBitsToFloat(R16i.y) + intBitsToFloat(PV0ix));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[15].x),intBitsToFloat(uf_remappedVS[15].y),intBitsToFloat(uf_remappedVS[15].z),0.0)));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R1i.z = floatBitsToInt(intBitsToFloat(R3i.z) + intBitsToFloat(PV1ix));
// 9
R0i.x = floatBitsToInt(-(intBitsToFloat(R4i.x)) + intBitsToFloat(R1i.x));
R0i.y = floatBitsToInt(-(intBitsToFloat(R16i.y)) + intBitsToFloat(R1i.y));
R0i.z = floatBitsToInt(-(intBitsToFloat(R3i.z)) + intBitsToFloat(R1i.z));
PV1iw = uf_remappedVS[16].z;
R126i.w = uf_remappedVS[12].y;
// 10
R3i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),0.0)));
PV0iy = R3i.x;
PV0iz = R3i.x;
PV0iw = R3i.x;
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PV1iw)));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[14].x),intBitsToFloat(uf_remappedVS[14].y),intBitsToFloat(uf_remappedVS[14].z),0.0)));
PV1ix = tempi.x;
R2i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R2i.z = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(0x358637bd));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.x = uf_remappedVS[16].y;
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R3i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.y = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R3i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 15
PV1ix = ((intBitsToFloat(R127i.y) > 0.0)?-1:0);
PV1iy = ((intBitsToFloat(PS0i) > 0.0)?-1:0);
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R126i.w)) + intBitsToFloat(R124i.z));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R126i.y)) + intBitsToFloat(R125i.x));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 16
R2i.x = ((PV1ix == 0)?(0):(PV1iy));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PS1i)));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PS1i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R126i.x)) + intBitsToFloat(R125i.y));
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PS1i)));
// 17
PV1ix = uf_remappedVS[12].x;
PV1iw = uf_remappedVS[11].x;
// 18
R23i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(PV1iw)) + intBitsToFloat(R126i.w));
R23i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(PV1ix)) + intBitsToFloat(R124i.z));
PV0iz = uf_remappedVS[16].x;
// 19
R23i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(PV0iz)) + intBitsToFloat(R127i.w));
// 20
predResult = (R2i.x != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(uf_remappedVS[17].x)));
// 1
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(uf_remappedVS[17].x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(uf_remappedVS[17].x)));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PS1i)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R3i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.z)));
// 5
R1i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV0iy));
R1i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV0ix));
R1i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0iw));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R4i.x) + -(intBitsToFloat(uf_remappedVS[18].x)));
PV0iy = floatBitsToInt(intBitsToFloat(R16i.y) + -(intBitsToFloat(uf_remappedVS[18].y)));
PV0iz = floatBitsToInt(intBitsToFloat(R3i.z) + -(intBitsToFloat(uf_remappedVS[18].z)));
R3i.w = 0x3f800000;
R0i.w = floatBitsToInt(-(intBitsToFloat(R4i.x)) + intBitsToFloat(R1i.x));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R2i.z = floatBitsToInt(-(intBitsToFloat(R16i.y)) + intBitsToFloat(R1i.y));
// 2
R0i.y = floatBitsToInt(-(intBitsToFloat(R3i.z)) + intBitsToFloat(R1i.z));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(uf_remappedVS[9].z)));
R0i.x = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 3
R4i.w = 0x3f800000;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R16i.y),intBitsToFloat(R3i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(uf_remappedVS[19].x),intBitsToFloat(uf_remappedVS[19].y),intBitsToFloat(uf_remappedVS[19].z),intBitsToFloat(uf_remappedVS[19].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R127i.z = tempi.x;
PV0iw = tempi.x;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R16i.y),intBitsToFloat(R3i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 6
PV0ix = PV1ix;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
R123i.y = floatBitsToInt(intBitsToFloat(R127i.z) * 0.0 + intBitsToFloat(PV1ix));
// 7
R127i.w = floatBitsToInt(intBitsToFloat(R127i.z) * 0.5 + intBitsToFloat(PV0ix));
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R123i.y));
// 8
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].z), intBitsToFloat(R127i.w)));
// 9
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(R127i.x));
// 10
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[9].z) + -(intBitsToFloat(PV1iw)));
// 11
PV1iy = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(PV0iz)));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PV1iy));
// 13
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].w), intBitsToFloat(PV0ix)));
// 14
R0i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].y)) + intBitsToFloat(PV1iw));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(min(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[21].x)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[21].x));
// 1
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R0i.z));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV1iz)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV1iz)));
R4i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PV1iz)));
// 3
R4i.x = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV0iy));
R8i.y = floatBitsToInt(intBitsToFloat(R16i.y) + intBitsToFloat(PV0ix));
R6i.z = floatBitsToInt(intBitsToFloat(R3i.z) + intBitsToFloat(PV0iw));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R8i.y),intBitsToFloat(R6i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[22].x),intBitsToFloat(uf_remappedVS[22].y),intBitsToFloat(uf_remappedVS[22].z),intBitsToFloat(uf_remappedVS[22].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R5i.z = tempi.x;
PV0iw = tempi.x;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R8i.y),intBitsToFloat(R6i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[23].x),intBitsToFloat(uf_remappedVS[23].y),intBitsToFloat(uf_remappedVS[23].z),intBitsToFloat(uf_remappedVS[23].w))));
PV1ix = tempi.x;
R5i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 6
R11i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R8i.y),intBitsToFloat(R6i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w))));
PV0iy = R11i.x;
PV0iz = R11i.x;
PV0iw = R11i.x;
// 7
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R8i.y),intBitsToFloat(R6i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[24].x),intBitsToFloat(uf_remappedVS[24].y),intBitsToFloat(uf_remappedVS[24].z),intBitsToFloat(uf_remappedVS[24].w))));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
R126i.x = R11i.x;
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) / 2.0);
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R8i.y),intBitsToFloat(R6i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[25].x),intBitsToFloat(uf_remappedVS[25].y),intBitsToFloat(uf_remappedVS[25].z),intBitsToFloat(uf_remappedVS[25].w))));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R9i.z = floatBitsToInt(intBitsToFloat(R11i.x) * 1.0);
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R8i.y),intBitsToFloat(R6i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[26].x),intBitsToFloat(uf_remappedVS[26].y),intBitsToFloat(uf_remappedVS[26].z),intBitsToFloat(uf_remappedVS[26].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R11i.y = floatBitsToInt(intBitsToFloat(R5i.y) * -(0.5) + intBitsToFloat(R126i.x));
// 10
R5i.x = floatBitsToInt(intBitsToFloat(R5i.z) * 0.5 + intBitsToFloat(R126i.x));
R127i.z = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(PV1ix));
R4i.w = floatBitsToInt(1.0 / intBitsToFloat(R9i.z));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R8i.y),intBitsToFloat(R6i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[27].x),intBitsToFloat(uf_remappedVS[27].y),intBitsToFloat(uf_remappedVS[27].z),intBitsToFloat(uf_remappedVS[27].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R127i.w = tempi.x;
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(PV1ix)),vec4(intBitsToFloat(uf_remappedVS[28].x),intBitsToFloat(uf_remappedVS[28].y),intBitsToFloat(uf_remappedVS[28].z),intBitsToFloat(uf_remappedVS[28].w))));
PV0ix = tempi.x;
R126i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w)),vec4(intBitsToFloat(uf_remappedVS[29].x),intBitsToFloat(uf_remappedVS[29].y),intBitsToFloat(uf_remappedVS[29].z),intBitsToFloat(uf_remappedVS[29].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 14
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 15
PV1iz = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(PS0i));
// 16
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(PV1iz)));
// 17
R9i.w = floatBitsToInt(intBitsToFloat(R6i.y) * 0.5 + intBitsToFloat(R126i.x));
// 18
PV0iz = floatBitsToInt(intBitsToFloat(R9i.w) * intBitsToFloat(R4i.w));
// 19
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(uf_remappedVS[1].w)) + -(intBitsToFloat(uf_remappedVS[1].y)));
// 20
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R123i.y));
// 21
R5i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS0i));
}
if( activeMaskStackC[3] == true ) {
// 0
R0i.y = uf_remappedVS[30].z;
R2i.z = uf_remappedVS[30].y;
R3i.w = uf_remappedVS[30].x;
// 1
PV1ix = floatBitsToInt((intBitsToFloat(uf_remappedVS[31].y) > 0.0)?1.0:0.0);
R2i.y = uf_remappedVS[32].x;
R0i.z = uf_remappedVS[32].y;
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[31].y))?1.0:0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[31].y));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R6i.w) * intBitsToFloat(PS1i));
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[33].x)) + intBitsToFloat(uf_remappedVS[34].x));
R127i.z = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iw)));
// 3
R126i.y = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R3i.z = uf_remappedVS[32].z;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(uf_remappedVS[2].z)) + intBitsToFloat(PV0ix));
// 4
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[33].w)) + intBitsToFloat(uf_remappedVS[34].w));
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iz)));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[34].x)) + intBitsToFloat(uf_remappedVS[35].x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 6
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[34].w)) + intBitsToFloat(uf_remappedVS[35].w));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS1i));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.w),intBitsToFloat(R126i.y)) + intBitsToFloat(PV1ix));
// 7
R126i.x = floatBitsToInt(intBitsToFloat(R126i.w) + -(intBitsToFloat(uf_remappedVS[34].w)));
PV1iz = floatBitsToInt(intBitsToFloat(R126i.w) + -(intBitsToFloat(uf_remappedVS[33].w)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 8
PV0ix = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R127i.z)) + intBitsToFloat(uf_remappedVS[33].x));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.w) + -(intBitsToFloat(uf_remappedVS[35].w)));
R127i.w = ((intBitsToFloat(PV1iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.w = ((intBitsToFloat(R126i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 9
PV1ix = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
PV1iy = floatBitsToInt(intBitsToFloat(R126i.w) + -(intBitsToFloat(uf_remappedVS[36].w)));
R127i.z = ((intBitsToFloat(R126i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PV0ix)) + intBitsToFloat(uf_remappedVS[34].x));
R127i.y = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
// 10
R127i.x = ((intBitsToFloat(PV1iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].x)) + intBitsToFloat(uf_remappedVS[36].x));
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV1ix)));
// 11
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].w)) + intBitsToFloat(uf_remappedVS[36].w));
PV1iw = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[33].x), intBitsToFloat(R127i.y)));
PV0iy = floatBitsToInt((intBitsToFloat(uf_remappedVS[31].w) > 0.0)?1.0:0.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[31].w))?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 13
R125i.x = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iw)));
PV1iz = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(PS0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R127i.w)) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[31].w));
// 14
PV0ix = floatBitsToInt(intBitsToFloat(R6i.w) * intBitsToFloat(PS1i));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(PV1iz)) + intBitsToFloat(uf_remappedVS[35].x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.w));
R126i.w = floatBitsToInt(-(intBitsToFloat(R125i.x)) + 1.0);
// 15
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(uf_remappedVS[3].x)) + intBitsToFloat(PV0ix));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(R127i.z)) + intBitsToFloat(R123i.z));
// 16
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].x),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.y));
PV0iw = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
// 17
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PV0iw)));
// 18
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.w),intBitsToFloat(R126i.w)) + intBitsToFloat(PV1iy));
}
if( activeMaskStackC[3] == true ) {
// 0
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[37].w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[37].z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(uf_remappedVS[37].y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(uf_remappedVS[37].x)));
// 1
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(uf_remappedVS[38].x)));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(uf_remappedVS[38].x)));
R12i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedVS[38].x)));
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(intBitsToFloat(R2i.x) + -(intBitsToFloat(uf_remappedVS[39].w)));
PV0iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[40].w)) + intBitsToFloat(uf_remappedVS[39].w));
R126i.w = floatBitsToInt(intBitsToFloat(R2i.x) + -(intBitsToFloat(uf_remappedVS[40].w)));
// 1
R127i.x = ((intBitsToFloat(R126i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.y = ((intBitsToFloat(R126i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[40].x)) + intBitsToFloat(uf_remappedVS[39].x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 2
R125i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[39].x)) + intBitsToFloat(uf_remappedVS[41].x));
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(PS1i));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].x), intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV0iz)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PV0iw)) + intBitsToFloat(uf_remappedVS[40].x));
R125i.w = floatBitsToInt(intBitsToFloat(R2i.x) + -(intBitsToFloat(uf_remappedVS[41].w)));
// 4
R124i.x = ((intBitsToFloat(R125i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(PV1iy)) + intBitsToFloat(PV1ix));
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[39].w)) + intBitsToFloat(uf_remappedVS[41].w));
// 5
PV1ix = floatBitsToInt(-(intBitsToFloat(R124i.x)) + 1.0);
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[41].x)) + intBitsToFloat(uf_remappedVS[42].x));
R126i.w = ((intBitsToFloat(R7i.x) > 0.5)?-1:0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 6
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[41].w)) + intBitsToFloat(uf_remappedVS[42].w));
PV0iy = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(PS1i));
R124i.z = floatBitsToInt(intBitsToFloat(R2i.x) + -(intBitsToFloat(uf_remappedVS[42].w)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV1ix)));
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PV0iy)) + intBitsToFloat(uf_remappedVS[39].x));
R0i.y = ((R126i.w == 0)?(R9i.x):(R11i.z));
R125i.z = ((intBitsToFloat(R124i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.w = floatBitsToInt(intBitsToFloat(R2i.x) + -(intBitsToFloat(uf_remappedVS[43].w)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 8
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[42].x)) + intBitsToFloat(uf_remappedVS[43].x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(R127i.w)) + intBitsToFloat(R127i.z));
R127i.z = ((intBitsToFloat(R126i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iw = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R2i.x) + -(intBitsToFloat(uf_remappedVS[44].w)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(PS0i)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(PV0iw)) + intBitsToFloat(uf_remappedVS[41].x));
PV1iw = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
PS1i = ((intBitsToFloat(R7i.y) > 0.5)?-1:0);
// 10
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(PV1iy)) + intBitsToFloat(R126i.y));
PV0iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[42].w)) + intBitsToFloat(uf_remappedVS[43].w));
R126i.z = ((intBitsToFloat(PV1ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PV1iw)));
R3i.y = ((PS1i == 0)?(R9i.y):(R8i.w));
// 11
PV1ix = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R126i.y = ((intBitsToFloat(R7i.z) > 0.5)?-1:0);
R125i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[43].x)) + intBitsToFloat(uf_remappedVS[44].x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 12
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[43].w)) + intBitsToFloat(uf_remappedVS[44].w));
R2i.w = R9i.y;
R0i.x = R11i.z;
// 13
backupReg0i = R0i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(PV0iy)) + intBitsToFloat(uf_remappedVS[42].x));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(uf_remappedVS[45].x)));
R0i.z = ((R126i.y == 0)?(R9i.x):(R0i.x));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[45].y)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 14
PV0ix = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(PS1i));
R4i.y = ((intBitsToFloat(R7i.w) > 0.5)?-1:0);
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(uf_remappedVS[45].z)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(R125i.w)) + intBitsToFloat(R124i.x));
// 15
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PV0ix)) + intBitsToFloat(uf_remappedVS[43].x));
// 16
PV0ix = ((intBitsToFloat(R7i.y) > 0.5)?-1:0);
PV0iy = ((intBitsToFloat(R7i.z) > 0.5)?-1:0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R126i.x)) + intBitsToFloat(R125i.w));
R3i.x = uf_remappedVS[10].x;
// 17
R2i.x = ((PV0ix == 0)?(R9i.x):(R11i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[44].x),intBitsToFloat(R126i.z)) + intBitsToFloat(R123i.z));
R2i.z = ((PV0iy == 0)?(R9i.y):(R8i.w));
// 18
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(uf_remappedVS[45].w)));
}
if( activeMaskStackC[3] == true ) {
// 0
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].x), intBitsToFloat(R2i.y)));
PV0iy = uf_remappedVS[46].x & 0x80000;
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].x), intBitsToFloat(R3i.z)));
R11i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].x), intBitsToFloat(R3i.w)));
PS0i = uf_remappedVS[46].x & 0x100000;
// 1
PV1ix = (PV0iy == 0x80000)?-1:0;
PV1iy = uf_remappedVS[46].x & 0x200000;
PV1iz = uf_remappedVS[46].x & 0x400000;
PV1iw = (PS0i == 0x100000)?-1:0;
R126i.z = uf_remappedVS[46].y & int(1);
// 2
R124i.x = ((PV1iw == 0)?(R9i.y):(R3i.y));
R124i.y = ((PV1ix == 0)?(R9i.x):(R0i.y));
PV0iz = (PV1iy == 0x200000)?-1:0;
R125i.w = (PV1iz == 0x400000)?-1:0;
PS0i = uf_remappedVS[46].x & 0x800000;
// 3
backupReg0i = R126i.z;
PV1ix = uf_remappedVS[46].x & 0x1000000;
R126i.y = ((PV0iz == 0)?(R9i.y):(R2i.w));
R126i.z = ((PV0iz == 0)?(R9i.x):(R0i.z));
PV1iw = (PS0i == 0x800000)?-1:0;
R127i.y = (int(1) != backupReg0i)?-1:0;
// 4
R125i.x = ((PV1iw == 0)?(R9i.x):(R2i.x));
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
R123i.z = ((R4i.y == 0)?(R126i.z):(R126i.z));
PV0iw = (PV1ix == 0x1000000)?-1:0;
PS0i = int(intBitsToFloat(uf_remappedVS[47].z));
// 5
R123i.x = ((R4i.y == 0)?(R126i.y):(PV0iy));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(uf_remappedVS[48].x)));
R125i.y = floatBitsToInt(intBitsToFloat(R125i.y) * 2.0);
R124i.z = ((R125i.w == 0)?(R126i.z):(R123i.z));
R124i.w = ((PV0iw == 0)?(R9i.y):(R2i.z));
R126i.w = floatBitsToInt(float(PS0i));
// 6
PV0ix = floatBitsToInt((0.0 >= abs(intBitsToFloat(R126i.w)))?1.0:0.0);
R126i.y = ((R125i.w == 0)?(R126i.y):(R123i.x));
PV0iz = floatBitsToInt(-(abs(intBitsToFloat(R126i.w))) + 0.0);
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[49].z) + intBitsToFloat(uf_remappedVS[48].x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.w));
// 7
R126i.x = ((intBitsToFloat(PV0ix) == 0.0)?(0):(PV0iz));
R125i.y = floatBitsToInt(-(intBitsToFloat(R125i.y)) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(uf_remappedVS[48].y)));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) * 2.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[47].z));
// 8
R127i.x = ((R127i.y == 0)?(0):(0x2));
PV0iy = floatBitsToInt(trunc(intBitsToFloat(PV1iz)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[47].x), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(abs(intBitsToFloat(R126i.w)) + intBitsToFloat(R126i.x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[47].w));
// 9
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[47].y), intBitsToFloat(PS0i)));
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.w)),intBitsToFloat(uf_remappedVS[49].x)) + -(intBitsToFloat(R125i.y)));
R123i.z = ((-(intBitsToFloat(backupReg0i)) > 0.0)?(PV0iw):(backupReg0i));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(R126i.z)) + -(0.5));
PS1i = int(intBitsToFloat(PV0iy));
// 10
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(R126i.x)) + -(0.5));
R123i.y = ((intBitsToFloat(R126i.w) == 0.0)?(0):(R123i.z));
R127i.z = (R127i.x == int(1))?-1:0;
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[49].w) + intBitsToFloat(uf_remappedVS[48].y));
R125i.z = floatBitsToInt(float(PS1i));
// 11
R127i.x = (R127i.x == 0x2)?-1:0;
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[50].x) + intBitsToFloat(uf_remappedVS[50].z));
PV1iz = floatBitsToInt(-(intBitsToFloat(R125i.w)) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[50].y) + intBitsToFloat(uf_remappedVS[50].w));
PS1i = int(intBitsToFloat(R123i.y));
// 12
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(uf_remappedVS[50].z)) + intBitsToFloat(PV1iy));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w),intBitsToFloat(uf_remappedVS[49].y)) + intBitsToFloat(PV1iz));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(uf_remappedVS[50].w)) + intBitsToFloat(PV1iw));
R125i.w = ((R127i.x == 0)?(R7i.x):(R7i.z));
PS0i = floatBitsToInt(float(PS1i));
// 13
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.x)),intBitsToFloat(R125i.z)) + intBitsToFloat(R123i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w),intBitsToFloat(uf_remappedVS[48].z)) + intBitsToFloat(backupReg0i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w),intBitsToFloat(uf_remappedVS[48].w)) + intBitsToFloat(R123i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(PS0i)) + intBitsToFloat(R125i.y));
R125i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[51].z));
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(uf_remappedVS[51].x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(uf_remappedVS[51].y)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R124i.x)) + -(intBitsToFloat(R123i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.w));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[51].w));
// 15
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(PV0iy)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV0ix)));
R123i.z = ((R127i.z == 0)?(R125i.w):(R7i.y));
R123i.w = ((R127i.x == 0)?(R7i.y):(R7i.x));
R9i.x = ((R127i.z == 0)?(R7i.x):(R7i.y));
// 16
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[52].x), intBitsToFloat(R123i.z)));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
R123i.y = ((R127i.z == 0)?(R123i.w):(R7i.z));
R0i.z = floatBitsToInt(intBitsToFloat(R127i.w) + 0.5);
R7i.w = ((R127i.z == 0)?(R7i.y):(R7i.z));
PS0i = int(intBitsToFloat(uf_remappedVS[53].z));
// 17
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[54].z) + intBitsToFloat(uf_remappedVS[52].x));
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[54].w) + intBitsToFloat(uf_remappedVS[52].y));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[52].y), intBitsToFloat(R123i.y)));
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 2.0);
R8i.w = floatBitsToInt(intBitsToFloat(R124i.z) + 0.5);
R126i.y = floatBitsToInt(float(PS0i));
// 18
PV0ix = floatBitsToInt(-(intBitsToFloat(PV1iz)) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(-(abs(intBitsToFloat(R126i.y))) + 0.0);
PV0iz = floatBitsToInt((0.0 >= abs(intBitsToFloat(R126i.y)))?1.0:0.0);
PV0iw = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.y));
// 19
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
R4i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.w)),intBitsToFloat(uf_remappedVS[54].x)) + -(intBitsToFloat(PV0iw)));
R124i.z = ((intBitsToFloat(PV0iz) == 0.0)?(0):(PV0iy));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w),intBitsToFloat(uf_remappedVS[54].y)) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[53].z));
// 20
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[53].x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(abs(intBitsToFloat(R126i.y)) + intBitsToFloat(R124i.z));
R8i.z = R125i.y;
PV0iw = floatBitsToInt(trunc(intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[53].w));
// 21
R123i.x = ((-(intBitsToFloat(R124i.z)) > 0.0)?(PV0iy):(R124i.z));
R9i.y = R124i.x;
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[53].y), intBitsToFloat(PS0i)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R0i.x)) + -(0.5));
PS1i = int(intBitsToFloat(PV0iw));
// 22
R7i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[55].x) + intBitsToFloat(uf_remappedVS[55].z));
R7i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[55].y) + intBitsToFloat(uf_remappedVS[55].w));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(R7i.z)) + -(0.5));
R3i.w = ((intBitsToFloat(R126i.y) == 0.0)?(0):(R123i.x));
R2i.x = floatBitsToInt(float(PS1i));
}
if( activeMaskStackC[3] == true ) {
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[55].w),intBitsToFloat(R7i.w)) + intBitsToFloat(R7i.y));
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.z)),intBitsToFloat(R2i.x)) + intBitsToFloat(R2i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[55].z),intBitsToFloat(R9i.x)) + intBitsToFloat(R7i.x));
R124i.w = floatBitsToInt(intBitsToFloat(R4i.z) + -(intBitsToFloat(uf_remappedVS[56].x)));
PS0i = int(intBitsToFloat(R3i.w));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w),intBitsToFloat(uf_remappedVS[52].w)) + intBitsToFloat(R123i.x));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w),intBitsToFloat(uf_remappedVS[52].z)) + intBitsToFloat(R123i.z));
PV1iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[56].x)) + intBitsToFloat(uf_remappedVS[56].y));
R1i.w = floatBitsToInt(fract(intBitsToFloat(R1i.w)));
PS1i = floatBitsToInt(float(PS0i));
// 2
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(R2i.z)) + -(intBitsToFloat(R126i.y)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(PS1i)) + intBitsToFloat(R4i.y));
R124i.z = floatBitsToInt(intBitsToFloat(R6i.w) * 100.0);
R124i.z = clampFI32(R124i.z);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
// 3
backupReg0i = R5i.z;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R124i.z)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R0i.w)) + intBitsToFloat(R123i.y));
R5i.z = floatBitsToInt(intBitsToFloat(R124i.w) * intBitsToFloat(PS0i));
R5i.z = clampFI32(R5i.z);
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R124i.z)));
R0i.y = uf_remappedVS[57].x;
// 4
R9i.x = floatBitsToInt(intBitsToFloat(R123i.y) + 0.5);
R2i.y = floatBitsToInt(intBitsToFloat(R125i.x) + 0.5);
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R124i.z)));
// 5
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R5i.z)) + 0.0);
R6i.y = floatBitsToInt(intBitsToFloat(R11i.y) * intBitsToFloat(R4i.w));
}
if( activeMaskStackC[3] == true ) {
// 0
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(uf_remappedVS[58].z)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),intBitsToFloat(uf_remappedVS[59].x)) + -(intBitsToFloat(uf_remappedVS[59].y)));
R123i.w = clampFI32(R123i.w);
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),intBitsToFloat(uf_remappedVS[60].x)) + -(intBitsToFloat(uf_remappedVS[60].y)));
R123i.x = clampFI32(R123i.x);
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[61].y) + 1.0);
PV1iz = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[61].y) * 1.0 + intBitsToFloat(R5i.w));
PS1i = floatBitsToInt(-(intBitsToFloat(R6i.y)) + 1.0);
// 2
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) * 1.5);
PV0ix = clampFI32(PV0ix);
R6i.y = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3f333333) + intBitsToFloat(0x3e19999a));
R6i.y = clampFI32(R6i.y);
PV0iw = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
tempResultf = max(0.0, intBitsToFloat(PV1iz));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[59].w), intBitsToFloat(PS0i)));
R124i.w = floatBitsToInt(intBitsToFloat(PV0ix) * 15.0);
tempResultf = max(0.0, intBitsToFloat(PV0iw));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 4
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[62].x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[62].y), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
// 5
R1i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)),intBitsToFloat(uf_remappedVS[63].w)) + intBitsToFloat(uf_remappedVS[63].w));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iy)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 6
R3i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
PS0i = floatBitsToInt(exp2(intBitsToFloat(R125i.x)));
// 7
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[62].z)),intBitsToFloat(PS0i)) + intBitsToFloat(uf_remappedVS[62].z));
R123i.w = clampFI32(R123i.w);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R124i.w));
// 8
PV0ix = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(-(intBitsToFloat(R1i.x)) + intBitsToFloat(R123i.w));
PV0iw = clampFI32(PV0iw);
// 9
R2i.x = PV0iw;
R5i.y = PV0iw;
PV1iz = floatBitsToInt(max(intBitsToFloat(PV0ix), intBitsToFloat(0x3e4ccccd)));
// 10
R5i.w = floatBitsToInt(min(intBitsToFloat(PV1iz), 1.0));
}
if( activeMaskStackC[3] == true ) {
// 0
R125i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[18].x) + -(intBitsToFloat(R4i.x)));
R125i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[18].y) + -(intBitsToFloat(R8i.y)));
PV0iw = floatBitsToInt(min(intBitsToFloat(uf_remappedVS[18].y), intBitsToFloat(uf_remappedVS[64].z)));
// 1
R124i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[18].z) + -(intBitsToFloat(R6i.z)));
PV1iy = floatBitsToInt(-(intBitsToFloat(R6i.y)) + 1.0);
PV1iz = floatBitsToInt(-(intBitsToFloat(R16i.y)) + intBitsToFloat(PV0iw));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R124i.x) * intBitsToFloat(R124i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[64].y),intBitsToFloat(PV1iz)) + intBitsToFloat(uf_remappedVS[64].x));
R123i.y = clampFI32(R123i.y);
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + 2.5);
// 3
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(uf_remappedVS[65].w)));
R6i.y = 0;
R6i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3daaaaab));
R122i.x = floatBitsToInt((intBitsToFloat(R125i.y) * intBitsToFloat(R125i.y) + intBitsToFloat(PV0ix)));
// 4
R4i.x = ((0.0 >= intBitsToFloat(R5i.z))?-1:0);
R123i.y = floatBitsToInt((intBitsToFloat(R125i.x) * intBitsToFloat(R125i.x) + intBitsToFloat(R122i.x)));
R5i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R4i.w = 0;
R3i.w = 0;
// 5
R7i.x = 0;
R4i.y = ((R4i.x == 0)?(R2i.z):(R5i.z));
R2i.z = ((R4i.x == 0)?(R0i.x):(R3i.w));
R2i.w = ((R4i.x == 0)?(R0i.w):(R4i.w));
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.y));
PS1i = floatBitsToInt(tempResultf);
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(PS1i)));
R13i.x = R23i.x;
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[61].x),intBitsToFloat(uf_remappedVS[61].y),intBitsToFloat(uf_remappedVS[61].z),0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R1i.y = R23i.y;
// 8
R0i.x = R11i.x;
R8i.y = R0i.y;
R124i.z = floatBitsToInt(intBitsToFloat(PV1ix) + 0.5);
R1i.w = R15i.z;
R3i.z = R23i.z;
// 9
PV1ix = floatBitsToInt(-(intBitsToFloat(R124i.z)) + 1.0);
R7i.y = ((R4i.x == 0)?(0):(0x3f800000));
R123i.z = floatBitsToInt(intBitsToFloat(R124i.z) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
R0i.w = ((R4i.x == 0)?(R3i.x):(R7i.x));
R125i.y = ((R4i.x == 0)?(0):(R5i.y));
// 10
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(0xbe593484));
R123i.z = ((R4i.x == 0)?(0):(R127i.x));
R123i.w = ((R4i.x == 0)?(0):(R1i.z));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 11
R16i.x = ((R7i.y == 0)?(R1i.z):(R123i.w));
R16i.y = ((R7i.y == 0)?(R127i.x):(R123i.z));
R16i.z = ((R7i.y == 0)?(R5i.y):(R125i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R123i.y)) + intBitsToFloat(0x3fc90da4));
PS1i = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f22f983));
// 12
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i),-(intBitsToFloat(R123i.w))) + 1.0);
R5i.y = ((R4i.x == 0)?(0):(R1i.x));
R1i.z = ((R4i.x == 0)?(0):(R2i.x));
R7i.w = ((R4i.x == 0)?(0):(R1i.y));
R1i.y = ((R4i.x == 0)?(0):(R3i.z));
}
if( activeMaskStackC[3] == true ) {
R3i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y))).xyz);
R6i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R6i.z),intBitsToFloat(R6i.y))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R5i.w)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R5i.w)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R5i.w)));
R16i.w = ((R7i.y == 0)?(R1i.x):(R5i.y));
R126i.y = ((R4i.x == 0)?(0):(R6i.z));
// 1
R123i.x = ((R4i.x == 0)?(0):(R6i.x));
R123i.y = ((R4i.x == 0)?(0):(R124i.z));
R123i.z = ((R4i.x == 0)?(0):(R127i.x));
R123i.w = ((R4i.x == 0)?(0):(R125i.y));
R127i.z = ((R4i.x == 0)?(0):(R6i.y));
// 2
R17i.x = ((R7i.y == 0)?(R125i.y):(R123i.w));
R17i.y = ((R7i.y == 0)?(R127i.x):(R123i.z));
R17i.z = ((R7i.y == 0)?(R124i.z):(R123i.y));
R17i.w = ((R7i.y == 0)?(R2i.x):(R1i.z));
R18i.x = ((R7i.y == 0)?(R6i.x):(R123i.x));
// 3
R123i.x = ((R4i.x == 0)?(0):(R6i.w));
R18i.y = ((R7i.y == 0)?(R6i.y):(R127i.z));
R18i.z = ((R7i.y == 0)?(R6i.z):(R126i.y));
R125i.w = ((R4i.x == 0)?(0):(R13i.x));
R125i.x = ((R4i.x == 0)?(0):(R13i.w));
// 4
backupReg0i = R123i.x;
R123i.x = ((R4i.x == 0)?(0):(R9i.x));
R124i.y = ((R4i.x == 0)?(0):(R9i.z));
R123i.z = ((R4i.x == 0)?(0):(R2i.y));
R18i.w = ((R7i.y == 0)?(R6i.w):(backupReg0i));
R122i.x = ((R4i.x == 0)?(0):(R0i.z));
// 5
R3i.x = ((R7i.y == 0)?(R9i.x):(R123i.x));
R3i.y = ((R7i.y == 0)?(R2i.y):(R123i.z));
R123i.z = ((R4i.x == 0)?(0):(R8i.z));
R123i.w = ((R4i.x == 0)?(0):(R8i.w));
R19i.x = ((R7i.y == 0)?(R0i.z):(R122i.x));
// 6
R123i.x = ((R4i.x == 0)?(0):(R9i.y));
R19i.y = ((R7i.y == 0)?(R8i.w):(R123i.w));
R19i.z = ((R7i.y == 0)?(R8i.z):(R123i.z));
R123i.w = ((R4i.x == 0)?(0):(R10i.x));
R127i.z = ((R4i.x == 0)?(0):(R10i.z));
// 7
R20i.x = ((R7i.y == 0)?(R10i.x):(R123i.w));
R126i.y = ((R4i.x == 0)?(0):(R10i.w));
R126i.z = R15i.z;
R19i.w = ((R7i.y == 0)?(R9i.y):(R123i.x));
R127i.w = ((R4i.x == 0)?(0):(R9i.w));
// 8
R123i.x = ((R4i.x == 0)?(R15i.x):(R7i.x));
R125i.y = ((R4i.x == 0)?(0):(R11i.w));
R124i.z = ((R4i.x == 0)?(0):(R9i.z));
R123i.w = ((R4i.x == 0)?(0):(R10i.y));
R127i.x = ((R4i.x == 0)?(0):(R11i.y));
// 9
R15i.x = ((R7i.y == 0)?(R0i.w):(R123i.x));
R20i.y = ((R7i.y == 0)?(R10i.y):(R123i.w));
R20i.z = ((R7i.y == 0)?(R10i.z):(R127i.z));
R20i.w = ((R7i.y == 0)?(R10i.w):(R126i.y));
R122i.x = ((R4i.x == 0)?(0):(R5i.x));
// 10
R21i.x = ((R7i.y == 0)?(R5i.x):(R122i.x));
R21i.y = ((R7i.y == 0)?(R11i.y):(R127i.x));
R21i.z = ((R7i.y == 0)?(R9i.w):(R127i.w));
R21i.w = ((R7i.y == 0)?(R9i.z):(R124i.z));
R124i.z = ((R4i.x == 0)?(0):(R12i.y));
// 11
R127i.x = ((R4i.x == 0)?(0):(R11i.z));
R123i.y = ((R4i.x == 0)?(0):(R8i.x));
R127i.z = ((R4i.x == 0)?(0):(R12i.w));
R123i.w = ((R4i.x == 0)?(R15i.y):(R0i.y));
R127i.w = ((R4i.x == 0)?(0):(R13i.y));
// 12
R22i.x = ((R7i.y == 0)?(R8i.x):(R123i.y));
R15i.y = ((R7i.y == 0)?(R8i.y):(R123i.w));
R15i.z = ((R7i.y == 0)?(R1i.w):(R126i.z));
R124i.w = ((R4i.x == 0)?(0):(R12i.x));
R22i.y = ((R7i.y == 0)?(R11i.w):(R125i.y));
// 13
R13i.x = ((R7i.y == 0)?(R12i.w):(R127i.z));
R123i.y = ((R4i.x == 0)?(R14i.x):(R4i.w));
R22i.z = ((R7i.y == 0)?(R11i.z):(R127i.x));
R22i.w = ((R7i.y == 0)?(R12i.y):(R124i.z));
// 14
R14i.x = ((R7i.y == 0)?(R2i.w):(R123i.y));
R123i.y = ((R4i.x == 0)?(0):(R12i.z));
R123i.z = ((R4i.x == 0)?(R14i.y):(R3i.w));
R126i.w = ((R4i.x == 0)?(R14i.z):(R5i.z));
R127i.z = ((R4i.x == 0)?(R14i.w):(R11i.x));
// 15
backupReg0i = R13i.y;
PV1ix = R23i.x;
R13i.y = ((R7i.y == 0)?(R12i.z):(R123i.y));
R13i.z = ((R7i.y == 0)?(backupReg0i):(R127i.w));
R13i.w = ((R7i.y == 0)?(R12i.x):(R124i.w));
R14i.y = ((R7i.y == 0)?(R2i.z):(R123i.z));
// 16
backupReg0i = R0i.x;
R0i.x = ((R7i.y == 0)?(PV1ix):(R125i.w));
PV0iy = R23i.y;
R14i.z = ((R7i.y == 0)?(R4i.y):(R126i.w));
R14i.w = ((R7i.y == 0)?(backupReg0i):(R127i.z));
PS0i = R23i.z;
// 17
R0i.y = ((R7i.y == 0)?(PV0iy):(R7i.w));
R0i.z = ((R7i.y == 0)?(PS0i):(R1i.y));
R0i.w = R125i.x;
R3i.z = ((R7i.y == 0)?(R9i.z):(R124i.y));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R22i.x), intBitsToFloat(R22i.y), intBitsToFloat(R22i.z), intBitsToFloat(R22i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R21i.x), intBitsToFloat(R21i.y), intBitsToFloat(R21i.z), intBitsToFloat(R21i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.z));
// export
passParameterSem9 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.z));
}
