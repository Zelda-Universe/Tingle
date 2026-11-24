#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader d8a6f839f1a2c9f9
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[62];
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
ATTR_LAYOUT(0, 11) in uvec4 attrDataSem11;
ATTR_LAYOUT(0, 12) in uvec4 attrDataSem12;
ATTR_LAYOUT(0, 13) in uvec4 attrDataSem13;

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
ivec4 R24i = ivec4(0);
ivec4 R25i = ivec4(0);
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
attrDecoder = attrDataSem8;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyz = attrDataSem7.xyz;
attrDecoder.xyz = uvec3((attrDecoder.xyz>>24)|((attrDecoder.xyz>>8)&0xFF00u)|((attrDecoder.xyz<<8)&0xFF0000u)|((attrDecoder.xyz<<24)));
attrDecoder.w = uint(0);
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), 0x3f800000);
attrDecoder = attrDataSem13;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R12i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem12;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R11i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem3;
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem5;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem6;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem10;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R10i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem9;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R9i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
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
R6i.z = floatBitsToInt(-(intBitsToFloat(R11i.y)) + 1.0);
R8i.w = 0;
R10i.w = floatBitsToInt(1.0);
// 1
R7i.w = floatBitsToInt(-(intBitsToFloat(R6i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R13i.w = floatBitsToInt(-(intBitsToFloat(R11i.x)) + 1.0);
// 2
predResult = (0.0 > intBitsToFloat(R7i.w));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R18i.x = 0;
R18i.y = 0;
R18i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R19i.x = 0;
// 1
R6i.w = R10i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R6i.w = R8i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R6i.w == 0);
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
R5i.x = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R7i.w) >= intBitsToFloat(R5i.x));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R18i.x = 0;
R18i.y = 0;
R18i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R19i.x = 0;
// 1
R8i.w = R10i.w;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R8i.w == 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(max(intBitsToFloat(R9i.x), 0.0));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(uf_remappedVS[2].y)));
R127i.z = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(R9i.y));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(uf_remappedVS[2].z)));
R0i.w = 0x3f800000;
// 1
R1i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w))));
PV1iy = R1i.x;
PV1iz = R1i.x;
PV1iw = R1i.x;
PS1i = floatBitsToInt(min(intBitsToFloat(PV0ix), 0.0));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w))));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.x = floatBitsToInt(intBitsToFloat(R10i.x) + intBitsToFloat(PS1i));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R5i.z = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[2].x)));
// 4
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(uf_remappedVS[3].y)));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(uf_remappedVS[3].z)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(uf_remappedVS[3].y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(uf_remappedVS[3].w)));
PS0i = floatBitsToInt(intBitsToFloat(R127i.z) * 0.5);
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(R9i.z));
PV1iy = floatBitsToInt(intBitsToFloat(R9i.y) + intBitsToFloat(R9i.z));
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) + -(0.5));
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 2.0);
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(PV0iw)));
R127i.z = floatBitsToInt(intBitsToFloat(R9i.x) + -(0.5));
// 6
R126i.x = floatBitsToInt(intBitsToFloat(R9i.z) + -(0.5));
R127i.y = floatBitsToInt(intBitsToFloat(R9i.y) + -(0.5));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) * 0.5);
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) * 0.5);
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(uf_remappedVS[4].x)));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + -(0.5));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
PV1iy = R9i.y;
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) * 2.0);
R10i.z = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(uf_remappedVS[5].x));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iw) + -(0.5));
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 2.0);
PS1i = R9i.z;
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(uf_remappedVS[4].z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(uf_remappedVS[4].y)));
PV0iz = floatBitsToInt(floor(intBitsToFloat(PV1iy)));
R127i.w = floatBitsToInt(floor(intBitsToFloat(PS1i)));
R126i.w = R9i.x;
R126i.w = floatBitsToInt(intBitsToFloat(R126i.w) * 2.0);
// 9
PV1ix = floatBitsToInt((intBitsToFloat(PV0iz) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PV0iz))?1.0:0.0);
R1i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].z) + intBitsToFloat(PV0ix));
R2i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].y) + intBitsToFloat(PV0iy));
R127i.x = floatBitsToInt((intBitsToFloat(R127i.w) > 0.0)?1.0:0.0);
// 10
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(R127i.w))?1.0:0.0);
PV0iy = floatBitsToInt(floor(intBitsToFloat(R126i.w)));
R2i.z = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(uf_remappedVS[6].x)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(uf_remappedVS[6].y)));
// 11
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PV0iy))?1.0:0.0);
R3i.y = floatBitsToInt(intBitsToFloat(R127i.x) + -(intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt((intBitsToFloat(PV0iy) > 0.0)?1.0:0.0);
R1i.w = floatBitsToInt(intBitsToFloat(PV0iw) + 0.0);
R3i.x = floatBitsToInt(intBitsToFloat(PS0i) + 0.0);
// 12
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(uf_remappedVS[6].z)));
R3i.w = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1ix)));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[5].w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 13
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(PS0i)));
R2i.y = floatBitsToInt(intBitsToFloat(PV0iz) + 0.0);
// 14
R3i.z = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = uf_remappedVS[7].x & 0x40000;
PV0iy = uf_remappedVS[7].x & 0x10000;
R127i.w = uf_remappedVS[7].x & 0x20000;
// 1
R127i.y = ((intBitsToFloat(uf_remappedVS[5].w) == 1.0)?-1:0);
PS1i = floatBitsToInt(float(PV0iy));
// 2
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R125i.w = floatBitsToInt(-(intBitsToFloat(R3i.z)) + 1.0);
PS0i = floatBitsToInt(float(R127i.w));
// 3
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].w)) + 1.0);
PS1i = floatBitsToInt(float(R126i.x));
// 4
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1ix)));
R127i.w = int(intBitsToFloat(PV1iy));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
PV1iy = 0 - R127i.w;
R126i.x = int(intBitsToFloat(PV0iw));
// 6
PV0ix = 0 - R126i.x;
PV0iz = max(R127i.w, PV1iy);
R127i.z = int(intBitsToFloat(PV1ix));
// 7
PV1ix = 0 - R127i.z;
PV1iy = max(R126i.x, PV0ix);
PS1i = floatBitsToInt(float(PV0iz));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(R2i.z)));
PV0iw = max(R127i.z, PV1ix);
PS0i = floatBitsToInt(float(PV1iy));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 9
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(R3i.y)));
PS1i = floatBitsToInt(float(PV0iw));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(R3i.w)));
R126i.y = floatBitsToInt(intBitsToFloat(R10i.z) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PV1iw)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.w));
// 11
PV1iy = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(PS0i));
R127i.z = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(PV0iz));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PV0ix)));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV1iw));
R123i.w = ((R127i.y == 0)?(PV1iy):(R7i.w));
// 13
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R123i.w)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R123i.w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R123i.w)));
// 14
backupReg0i = R2i.y;
R2i.y = floatBitsToInt(intBitsToFloat(R3i.x) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(PV1ix));
// 15
R123i.x = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
// 16
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
PV0iw = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
// 17
R123i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 18
R126i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R127i.z = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 19
R3i.y = floatBitsToInt(sin((intBitsToFloat(R127i.z))/0.1591549367));
// 20
R1i.w = floatBitsToInt(cos((intBitsToFloat(R127i.z))/0.1591549367));
// 21
R1i.y = floatBitsToInt(sin((intBitsToFloat(R126i.x))/0.1591549367));
// 22
R2i.w = floatBitsToInt(cos((intBitsToFloat(R126i.x))/0.1591549367));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[8].x))?1.0:0.0);
R126i.y = ((intBitsToFloat(uf_remappedVS[8].x) == 0.0)?-1:0);
R124i.z = ((intBitsToFloat(uf_remappedVS[8].z) == 0.0)?-1:0);
PV0iw = floatBitsToInt((intBitsToFloat(uf_remappedVS[8].x) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[8].z));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].x) * intBitsToFloat(PS0i));
R125i.z = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0ix)));
PV1iw = ((0.0 > intBitsToFloat(uf_remappedVS[8].z))?-1:0);
// 2
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt((intBitsToFloat(PV1ix) > 0.0)?1.0:0.0);
R127i.z = floatBitsToInt(max(intBitsToFloat(PV1ix), -(intBitsToFloat(PV1ix))));
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PV1ix))?1.0:0.0);
R1i.z = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(0x3fc90fdb));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iw)));
R126i.y = ((intBitsToFloat(R127i.z) > 1.0)?-1:0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3fc90fdb));
R123i.y = ((R126i.y == 0)?(R127i.z):(PS1i));
R126i.z = floatBitsToInt(((R126i.y == 0)?(intBitsToFloat(PV1ix)):(-(intBitsToFloat(PV1ix)))));
// 5
PV1ix = floatBitsToInt(min(intBitsToFloat(R123i.y), 1.0));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(R2i.w)));
R10i.z = floatBitsToInt(-(intBitsToFloat(R1i.y)));
R125i.w = ((R126i.y == 0)?(0):(PV0ix));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R2i.w)));
// 6
R127i.z = floatBitsToInt(max(intBitsToFloat(PV1ix), -(1.0)));
// 7
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.z)));
// 8
R123i.z = floatBitsToInt(intBitsToFloat(0x3d6ee04d) * intBitsToFloat(R126i.y) + intBitsToFloat(0x3f43b24e));
R123i.w = floatBitsToInt(intBitsToFloat(0x3edcf805) * intBitsToFloat(R126i.y) + 1.0);
// 9
R126i.x = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R127i.z)), intBitsToFloat(R123i.w)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R123i.z)) + 1.0);
// 10
PV0iy = uf_remappedVS[9].y;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
PV0iz = uf_remappedVS[9].x;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R123i.y));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS0i)));
R126i.y = floatBitsToInt(intBitsToFloat(R8i.y) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(PV0iz));
// 12
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PV1iw)));
R123i.z = ((intBitsToFloat(R127i.z) > 0.0)?(PV1ix):(floatBitsToInt(-(intBitsToFloat(PV1ix)))));
// 13
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(R125i.w));
// 14
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(R126i.y)));
PV0iy = floatBitsToInt((intBitsToFloat(R127i.y) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(R127i.y))?1.0:0.0);
// 15
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iw)));
// 16
PV0iy = floatBitsToInt(-(intBitsToFloat(R125i.z)) + intBitsToFloat(PV1ix));
// 17
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3fc90fdb));
// 18
PV0ix = floatBitsToInt(intBitsToFloat(R127i.y) + -(intBitsToFloat(PV1iw)));
// 19
R123i.z = ((R127i.x == 0)?(PV0ix):(0x40490fdb));
// 20
R123i.y = ((R124i.z == 0)?(R123i.z):(R1i.z));
// 21
PV1ix = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(R123i.y));
// 22
R123i.x = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
R10i.y = floatBitsToInt(1.0 / intBitsToFloat(R10i.y));
// 23
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
// 24
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 25
R125i.w = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
// 26
PS0i = floatBitsToInt(sin((intBitsToFloat(R125i.w))/0.1591549367));
// 27
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R2i.w)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(cos((intBitsToFloat(R125i.w))/0.1591549367));
// 28
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R2i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R124i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R127i.x)));
// 29
R126i.x = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PS0i));
R126i.y = floatBitsToInt(-(intBitsToFloat(PV0iy)) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PV0iy)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R127i.y)));
// 30
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(R124i.z)) + intBitsToFloat(PV1iw));
R124i.y = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R126i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R126i.x)));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(R10i.z)) + intBitsToFloat(PS1i));
// 31
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(R125i.y)) + intBitsToFloat(PV0iz));
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(R124i.x)) + intBitsToFloat(R122i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(R126i.w)) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R0i.w)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R0i.w)));
// 32
backupReg0i = R123i.x;
backupReg1i = R126i.y;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R10i.z)) + intBitsToFloat(PV1iw));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R126i.w)) + intBitsToFloat(PS1i));
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.z));
R11i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(R124i.y)) + intBitsToFloat(backupReg0i));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), intBitsToFloat(R0i.w)));
// 33
backupReg0i = R125i.y;
R10i.x = 0x3f800000;
R125i.y = 0x3f800000;
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(backupReg0i)) + intBitsToFloat(PS0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R124i.x)) + intBitsToFloat(R123i.x));
// 34
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R124i.y)) + intBitsToFloat(R123i.z));
R7i.y = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(R123i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R127i.x)) + intBitsToFloat(R126i.y));
// 35
R3i.x = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(R123i.z));
R2i.w = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(R123i.x));
// 36
PV0iz = floatBitsToInt(-(intBitsToFloat(R0i.y)) + intBitsToFloat(R2i.w));
// 37
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(R10i.y));
// 38
PV0ix = ((0.0 > intBitsToFloat(PV1iw))?-1:0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iw)), intBitsToFloat(PV1iw)));
// 39
R0i.w = ((PV0ix == 0)?(PV0iy):(PV0iz));
// 40
R8i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R0i.y),intBitsToFloat(R5i.z),intBitsToFloat(R125i.y)),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w))));
PV0iy = R8i.x;
PV0iz = R8i.x;
PV0iw = R8i.x;
// 41
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R0i.y),intBitsToFloat(R5i.z),intBitsToFloat(R125i.y)),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R1i.w = tempi.x;
}
if( activeMaskStackC[3] == true ) {
// 0
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[12].w)));
R123i.y = floatBitsToInt(intBitsToFloat(R8i.x) * 0.0 + intBitsToFloat(R1i.w));
PV0iz = R1i.w;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
R0i.w = uf_remappedVS[13].x;
R7i.x = uf_remappedVS[13].y;
// 1
backupReg0i = R123i.y;
R123i.y = floatBitsToInt(intBitsToFloat(R8i.x) * 0.5 + intBitsToFloat(PV0iz));
R7i.z = uf_remappedVS[14].x;
R1i.w = uf_remappedVS[13].z;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 2
R8i.x = uf_remappedVS[15].x;
R5i.z = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(PS1i));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].w), intBitsToFloat(R5i.z)));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(uf_remappedVS[16].y)));
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].y)) + intBitsToFloat(PV0iy));
// 2
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 3
R10i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS0i));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].z), intBitsToFloat(R5i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].x), intBitsToFloat(R5i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].y), intBitsToFloat(R5i.z)));
// 1
backupReg0i = R2i.x;
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[17].x)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iw)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0ix)));
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(uf_remappedVS[17].y)));
// 2
R1i.x = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(PV1iz));
R2i.y = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(PV1iy));
R0i.z = floatBitsToInt(intBitsToFloat(R3i.x) + intBitsToFloat(PV1iw));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(uf_remappedVS[17].z)));
R16i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(uf_remappedVS[17].w)));
// 3
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R5i.x));
// 4
R8i.z = uf_remappedVS[18].z;
R8i.w = uf_remappedVS[18].w;
R5i.w = floatBitsToInt(intBitsToFloat(R7i.w) * intBitsToFloat(PS1i));
}
if( activeMaskStackC[3] == true ) {
// 0
R3i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R2i.y),intBitsToFloat(R0i.z),intBitsToFloat(R10i.x)),vec4(intBitsToFloat(uf_remappedVS[19].x),intBitsToFloat(uf_remappedVS[19].y),intBitsToFloat(uf_remappedVS[19].z),intBitsToFloat(uf_remappedVS[19].w))));
PV0iy = R3i.x;
PV0iz = R3i.x;
PV0iw = R3i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R2i.y),intBitsToFloat(R0i.z),intBitsToFloat(R10i.x)),vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R1i.z = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R2i.y),intBitsToFloat(R0i.z),intBitsToFloat(R10i.x)),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w))));
PV0ix = tempi.x;
R10i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R2i.y),intBitsToFloat(R0i.z),intBitsToFloat(R10i.x)),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R10i.w = tempi.x;
// 4
PV0ix = PV1ix;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(uf_remappedVS[21].x)));
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(uf_remappedVS[21].x)));
R6i.w = floatBitsToInt(intBitsToFloat(R10i.y) * 0.0 + intBitsToFloat(PV1ix));
R14i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(uf_remappedVS[21].x)));
// 5
R10i.x = uf_remappedVS[15].y;
R14i.y = floatBitsToInt(intBitsToFloat(R10i.y) * 0.5 + intBitsToFloat(PV0ix));
R123i.z = floatBitsToInt(intBitsToFloat(R10i.y) * 0.0 + intBitsToFloat(PV0ix));
R1i.w = uf_remappedVS[15].z;
R5i.y = floatBitsToInt(1.0 / intBitsToFloat(R6i.w));
// 6
R0i.x = floatBitsToInt(intBitsToFloat(R1i.z) * -(0.5) + intBitsToFloat(R123i.z));
R11i.z = floatBitsToInt(intBitsToFloat(R3i.x) * 0.5 + intBitsToFloat(R123i.z));
PV0iw = floatBitsToInt(intBitsToFloat(R14i.y) * intBitsToFloat(R5i.y));
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(uf_remappedVS[1].w)) + -(intBitsToFloat(uf_remappedVS[1].y)));
// 8
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R123i.x));
// 9
R8i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS0i));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(uf_remappedVS[22].w))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(uf_remappedVS[22].w) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[22].w));
// 1
R125i.y = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
R124i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[23].x)) + intBitsToFloat(uf_remappedVS[24].x));
PV1iw = floatBitsToInt(intBitsToFloat(R7i.w) * intBitsToFloat(PS0i));
// 2
R127i.x = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(uf_remappedVS[25].x)) + intBitsToFloat(PV1iw));
// 3
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[23].w)) + intBitsToFloat(uf_remappedVS[24].w));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
// 4
R125i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[24].x)) + intBitsToFloat(uf_remappedVS[26].x));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV1iy)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 5
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),intBitsToFloat(R127i.x)) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[24].w)) + intBitsToFloat(uf_remappedVS[26].w));
R126i.w = floatBitsToInt(intBitsToFloat(R124i.z) * intBitsToFloat(PS0i));
// 6
R127i.x = ((intBitsToFloat(R9i.x) > 0.5)?-1:0);
R125i.y = floatBitsToInt(intBitsToFloat(R124i.x) + -(intBitsToFloat(uf_remappedVS[24].w)));
PV0iw = floatBitsToInt(intBitsToFloat(R124i.x) + -(intBitsToFloat(uf_remappedVS[23].w)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 7
backupReg0i = R125i.x;
R125i.x = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iy = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(PS0i));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R126i.w)) + intBitsToFloat(uf_remappedVS[23].x));
R126i.w = floatBitsToInt(intBitsToFloat(R124i.x) + -(intBitsToFloat(uf_remappedVS[26].w)));
R124i.z = ((intBitsToFloat(R125i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 8
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(PV1iy)) + intBitsToFloat(uf_remappedVS[24].x));
R126i.y = floatBitsToInt(intBitsToFloat(R124i.x) + -(intBitsToFloat(uf_remappedVS[27].w)));
R125i.z = ((intBitsToFloat(R126i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV0iw = floatBitsToInt(-(intBitsToFloat(R124i.z)) + 1.0);
R125i.y = floatBitsToInt(-(intBitsToFloat(R125i.x)) + 1.0);
// 9
R2i.x = ((intBitsToFloat(R126i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iy = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[26].x)) + intBitsToFloat(uf_remappedVS[27].x));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PV0iw)));
R7i.x = ((R127i.x == 0)?(R11i.x):(R13i.w));
// 10
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[26].w)) + intBitsToFloat(uf_remappedVS[27].w));
PV0iz = ((intBitsToFloat(R9i.y) > 0.5)?-1:0);
PV0iw = floatBitsToInt(-(intBitsToFloat(R2i.x)) + 1.0);
PS0i = ((intBitsToFloat(R9i.z) > 0.5)?-1:0);
// 11
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[27].x)) + intBitsToFloat(uf_remappedVS[28].x));
R124i.y = ((PS0i == 0)?(R11i.x):(R13i.w));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PV0iw)));
R127i.w = ((PV0iz == 0)?(R11i.y):(R6i.z));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 12
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[27].w)) + intBitsToFloat(uf_remappedVS[28].w));
PV0iy = floatBitsToInt(intBitsToFloat(R124i.x) + -(intBitsToFloat(uf_remappedVS[28].w)));
R124i.z = ((intBitsToFloat(R9i.w) > 0.5)?-1:0);
PV0iw = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(PS1i));
PS0i = ((intBitsToFloat(R9i.y) > 0.5)?-1:0);
// 13
backupReg0i = R125i.y;
R124i.x = ((PS0i == 0)?(R11i.x):(R13i.w));
R125i.y = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PV0iw)) + intBitsToFloat(uf_remappedVS[26].x));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[23].x), intBitsToFloat(backupReg0i)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 14
PV0ix = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
PV0iy = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS1i));
PV0iz = uf_remappedVS[7].x & 0x80000;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R125i.w)) + intBitsToFloat(PV1iw));
PS0i = uf_remappedVS[7].x & 0x100000;
// 15
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(PV0iy)) + intBitsToFloat(uf_remappedVS[27].x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV0ix)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R125i.x)) + intBitsToFloat(R123i.w));
PV1iw = (PV0iz == 0x80000)?-1:0;
PS1i = (PS0i == 0x100000)?-1:0;
// 16
PV0ix = uf_remappedVS[7].x & 0x200000;
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R125i.z)) + intBitsToFloat(R123i.z));
R7i.z = ((PS1i == 0)?(R11i.y):(R127i.w));
R0i.w = ((PV1iw == 0)?(R11i.x):(R7i.x));
PS0i = uf_remappedVS[7].x & 0x400000;
// 17
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y)) + intBitsToFloat(R123i.y));
PV1iy = (PV0ix == 0x200000)?-1:0;
R123i.z = ((R124i.z == 0)?(R11i.y):(R6i.z));
PV1iw = (PS0i == 0x400000)?-1:0;
PS1i = uf_remappedVS[7].x & 0x800000;
// 18
R2i.x = ((PV1iw == 0)?(R11i.y):(R123i.z));
R7i.y = ((PV1iy == 0)?(R11i.x):(R124i.y));
PV0iz = (PS1i == 0x800000)?-1:0;
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[28].x),intBitsToFloat(R125i.y)) + intBitsToFloat(R123i.x));
PS0i = uf_remappedVS[7].x & 0x1000000;
// 19
PV1ix = ((intBitsToFloat(R9i.z) > 0.5)?-1:0);
R125i.y = (PS0i == 0x1000000)?-1:0;
PV1iz = uf_remappedVS[7].y & int(1);
R3i.w = ((PV0iz == 0)?(R11i.x):(R124i.x));
// 20
R7i.x = (int(1) != PV1iz)?-1:0;
R123i.w = ((PV1ix == 0)?(R11i.y):(R6i.z));
// 21
R5i.z = ((R125i.y == 0)?(R11i.y):(R123i.w));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(uf_remappedVS[29].z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(uf_remappedVS[29].y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(uf_remappedVS[29].x)));
R13i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(uf_remappedVS[29].w)));
// 1
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[21].x), intBitsToFloat(PV0ix)));
R17i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[21].x), intBitsToFloat(PV0iy)));
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[21].x), intBitsToFloat(PV0iz)));
PS1i = int(intBitsToFloat(uf_remappedVS[30].z));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[31].w) + intBitsToFloat(uf_remappedVS[32].y));
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[31].z) + intBitsToFloat(uf_remappedVS[32].x));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(uf_remappedVS[32].x)));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(uf_remappedVS[32].y)));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
R124i.z = floatBitsToInt(float(PS1i));
// 3
PV1ix = floatBitsToInt(-(intBitsToFloat(PV0iz)) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(-(intBitsToFloat(PV0iw)) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(-(abs(intBitsToFloat(R124i.z))) + 0.0);
PV1iw = floatBitsToInt((0.0 >= abs(intBitsToFloat(R124i.z)))?1.0:0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R124i.z));
// 4
R124i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.w)),intBitsToFloat(uf_remappedVS[31].x)) + -(intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(uf_remappedVS[31].y)) + intBitsToFloat(PV1iy));
R127i.w = ((intBitsToFloat(PV1iw) == 0.0)?(0):(PV1iz));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[30].z));
// 5
PV1ix = floatBitsToInt(trunc(intBitsToFloat(PV0iy)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[30].x), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(abs(intBitsToFloat(R124i.z)) + intBitsToFloat(R127i.w));
R125i.w = ((R7i.x == 0)?(0):(int(1)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[30].w));
// 6
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R125i.y)) + -(0.5));
R123i.y = ((-(intBitsToFloat(R127i.w)) > 0.0)?(PV1iz):(R127i.w));
R125i.z = (R125i.w == int(1))?-1:0;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[30].y), intBitsToFloat(PS1i)));
PS0i = int(intBitsToFloat(PV1ix));
// 7
R123i.x = ((intBitsToFloat(R124i.z) == 0.0)?(0):(R123i.y));
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[33].x) + intBitsToFloat(uf_remappedVS[33].z));
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[33].y) + intBitsToFloat(uf_remappedVS[33].w));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z),intBitsToFloat(R127i.w)) + -(0.5));
PS1i = floatBitsToInt(float(PS0i));
// 8
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(uf_remappedVS[33].z)) + intBitsToFloat(PV1iy));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),intBitsToFloat(uf_remappedVS[33].w)) + intBitsToFloat(PV1iz));
PV0iz = (R125i.w == 0x2)?-1:0;
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)),intBitsToFloat(PS1i)) + intBitsToFloat(R126i.z));
PS0i = int(intBitsToFloat(backupReg0i));
// 9
backupReg0i = R123i.x;
R123i.x = ((PV0iz == 0)?(R9i.x):(R9i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(uf_remappedVS[32].w)) + intBitsToFloat(R123i.y));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(uf_remappedVS[32].z)) + intBitsToFloat(backupReg0i));
R123i.w = ((PV0iz == 0)?(R9i.y):(R9i.x));
PS1i = floatBitsToInt(float(PS0i));
// 10
backupReg0i = R123i.x;
R123i.x = ((R125i.z == 0)?(R123i.w):(R9i.z));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(R126i.w)) + -(intBitsToFloat(R127i.w)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(PS1i)) + intBitsToFloat(R124i.x));
R123i.w = ((R125i.z == 0)?(backupReg0i):(R9i.y));
R124i.y = ((R125i.z == 0)?(R9i.x):(R9i.y));
// 11
R124i.x = ((R125i.z == 0)?(R9i.y):(R9i.z));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[34].x), intBitsToFloat(R123i.w)));
R125i.y = floatBitsToInt(intBitsToFloat(R125i.y) * 2.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.z));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[34].y), intBitsToFloat(R123i.x)));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
PS1i = int(intBitsToFloat(uf_remappedVS[35].z));
// 12
R126i.x = ((R7i.x == 0)?(0):(0x2));
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[36].z) + intBitsToFloat(uf_remappedVS[34].x));
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[36].w) + intBitsToFloat(uf_remappedVS[34].y));
R126i.z = floatBitsToInt(float(PS1i));
// 13
PV1ix = floatBitsToInt(-(intBitsToFloat(R125i.y)) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(-(intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(-(abs(intBitsToFloat(R126i.z))) + 0.0);
PV1iw = floatBitsToInt((0.0 >= abs(intBitsToFloat(R126i.z)))?1.0:0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.z));
// 14
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.w)),intBitsToFloat(uf_remappedVS[36].x)) + -(intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(uf_remappedVS[36].y)) + intBitsToFloat(PV1iy));
R127i.w = ((intBitsToFloat(PV1iw) == 0.0)?(0):(PV1iz));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[35].z));
// 15
PV1ix = floatBitsToInt(trunc(intBitsToFloat(PV0iy)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].x), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(abs(intBitsToFloat(R126i.z)) + intBitsToFloat(R127i.w));
R125i.w = (R126i.x == int(1))?-1:0;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[35].w));
// 16
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(R125i.y)) + -(0.5));
R123i.y = ((-(intBitsToFloat(R127i.w)) > 0.0)?(PV1iz):(R127i.w));
R124i.z = (backupReg0i == 0x2)?-1:0;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].y), intBitsToFloat(PS1i)));
PS0i = int(intBitsToFloat(PV1ix));
// 17
R123i.x = ((intBitsToFloat(R126i.z) == 0.0)?(0):(R123i.y));
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[37].x) + intBitsToFloat(uf_remappedVS[37].z));
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[37].y) + intBitsToFloat(uf_remappedVS[37].w));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R127i.w)) + -(0.5));
PS1i = floatBitsToInt(float(PS0i));
// 18
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)),intBitsToFloat(PS1i)) + intBitsToFloat(R125i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[37].w),intBitsToFloat(backupReg0i)) + intBitsToFloat(PV1iz));
R125i.z = ((R124i.z == 0)?(R9i.x):(R9i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[37].z),intBitsToFloat(R124i.y)) + intBitsToFloat(PV1iy));
PS0i = int(intBitsToFloat(R123i.x));
// 19
backupReg0i = R124i.z;
R123i.x = ((backupReg0i == 0)?(R9i.y):(R9i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(uf_remappedVS[34].w)) + intBitsToFloat(R123i.y));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(uf_remappedVS[34].z)) + intBitsToFloat(R123i.w));
R123i.w = ((backupReg0i == 0)?(R9i.z):(R9i.y));
PS1i = floatBitsToInt(float(PS0i));
// 20
backupReg0i = R123i.x;
R123i.x = ((R125i.w == 0)?(R125i.z):(R9i.y));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(R126i.w)) + -(intBitsToFloat(R124i.x)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(PS1i)) + intBitsToFloat(R125i.x));
R126i.w = ((R125i.w == 0)?(backupReg0i):(R9i.z));
R8i.x = ((R125i.w == 0)?(R123i.w):(R9i.x));
// 21
R10i.x = ((R125i.w == 0)?(R9i.y):(R9i.z));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].x), intBitsToFloat(R123i.x)));
R125i.y = floatBitsToInt(intBitsToFloat(R125i.y) * 2.0);
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.z));
R0i.w = ((R125i.w == 0)?(R9i.x):(R9i.y));
PS1i = int(intBitsToFloat(uf_remappedVS[39].z));
// 22
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[40].w) + intBitsToFloat(uf_remappedVS[38].y));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[38].y), intBitsToFloat(R126i.w)));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
R2i.z = floatBitsToInt(intBitsToFloat(R127i.z) + 0.5);
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[40].z) + intBitsToFloat(uf_remappedVS[38].x));
R7i.x = floatBitsToInt(float(PS1i));
// 23
R9i.x = floatBitsToInt(-(abs(intBitsToFloat(R7i.x))) + 0.0);
R9i.y = floatBitsToInt((0.0 >= abs(intBitsToFloat(R7i.x)))?1.0:0.0);
R9i.z = floatBitsToInt(-(intBitsToFloat(R125i.y)) + intBitsToFloat(PV0iw));
R9i.w = floatBitsToInt(-(intBitsToFloat(PV0iy)) + intBitsToFloat(PV0ix));
R2i.x = floatBitsToInt(1.0 / intBitsToFloat(R7i.x));
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.w)),intBitsToFloat(uf_remappedVS[40].x)) + -(intBitsToFloat(R9i.z)));
R125i.y = ((intBitsToFloat(R9i.y) == 0.0)?(0):(R9i.x));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(uf_remappedVS[40].y)) + intBitsToFloat(R9i.w));
PV0iw = floatBitsToInt(intBitsToFloat(R2i.x) * 0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[39].z));
// 1
PV1ix = floatBitsToInt(abs(intBitsToFloat(R7i.x)) + intBitsToFloat(R125i.y));
R6i.y = floatBitsToInt(intBitsToFloat(R11i.y) + 0.5);
PV1iz = floatBitsToInt(trunc(intBitsToFloat(PV0iw)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].x), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[39].w));
// 2
backupReg0i = R125i.y;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(R126i.w)) + -(0.5));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[39].y), intBitsToFloat(PS1i)));
R9i.z = floatBitsToInt(intBitsToFloat(R7i.z) + 0.5);
R123i.w = ((-(intBitsToFloat(backupReg0i)) > 0.0)?(PV1ix):(backupReg0i));
PS0i = int(intBitsToFloat(PV1iz));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[41].y) + intBitsToFloat(uf_remappedVS[41].z));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R125i.y)) + -(0.5));
R123i.z = ((intBitsToFloat(R7i.x) == 0.0)?(0):(R123i.w));
R9i.w = floatBitsToInt(intBitsToFloat(R7i.y) + 0.5);
PS1i = floatBitsToInt(float(PS0i));
// 4
backupReg0i = R125i.y;
backupReg1i = R127i.z;
R125i.x = floatBitsToInt(intBitsToFloat(R10i.z) + -(intBitsToFloat(uf_remappedVS[42].x)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[41].z),intBitsToFloat(R8i.x)) + intBitsToFloat(PV1ix));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[42].x)) + intBitsToFloat(uf_remappedVS[42].y));
R125i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)),intBitsToFloat(PS1i)) + intBitsToFloat(backupReg1i));
PS0i = int(intBitsToFloat(R123i.z));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[43].x) + intBitsToFloat(uf_remappedVS[43].z));
R11i.y = floatBitsToInt(intBitsToFloat(R5i.w) + 0.0);
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[43].y) + intBitsToFloat(uf_remappedVS[43].w));
PS1i = floatBitsToInt(float(PS0i));
// 6
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(uf_remappedVS[41].x)) + intBitsToFloat(R125i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[43].w),intBitsToFloat(R10i.x)) + intBitsToFloat(PV1iz));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PS1i)) + intBitsToFloat(R126i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[43].z),intBitsToFloat(R0i.w)) + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 7
R2i.x = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(PS0i));
R2i.x = clampFI32(R2i.x);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(uf_remappedVS[38].z)) + intBitsToFloat(R123i.w));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(uf_remappedVS[38].w)) + intBitsToFloat(R123i.y));
R123i.w = floatBitsToInt(-(intBitsToFloat(R123i.x)) * intBitsToFloat(0x3e22f983) + 0.5);
R126i.w = floatBitsToInt(intBitsToFloat(R10i.z) + -(intBitsToFloat(uf_remappedVS[42].z)));
// 8
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[42].z)) + intBitsToFloat(uf_remappedVS[42].w));
R7i.y = floatBitsToInt(intBitsToFloat(R11i.y) + -(intBitsToFloat(uf_remappedVS[44].w)));
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
// 9
R123i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[44].x)) + intBitsToFloat(uf_remappedVS[45].x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS1i));
PV0ix = clampFI32(PV0ix);
R125i.y = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[44].w)) + intBitsToFloat(uf_remappedVS[45].w));
R124i.w = floatBitsToInt(intBitsToFloat(R11i.y) + -(intBitsToFloat(uf_remappedVS[45].w)));
// 11
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[45].x)) + intBitsToFloat(uf_remappedVS[46].x));
R3i.w = floatBitsToInt(-(intBitsToFloat(PV0ix)) + 1.0);
R126i.w = floatBitsToInt(sin((intBitsToFloat(R125i.y))/0.1591549367));
// 12
R125i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[45].w)) + intBitsToFloat(uf_remappedVS[46].w));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R124i.x)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R3i.w)));
R0i.w = floatBitsToInt(intBitsToFloat(R11i.y) + -(intBitsToFloat(uf_remappedVS[46].w)));
PS0i = floatBitsToInt(cos((intBitsToFloat(R125i.y))/0.1591549367));
// 13
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i),intBitsToFloat(R124i.y)) + intBitsToFloat(PV0iy));
R125i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[46].x)) + intBitsToFloat(uf_remappedVS[47].x));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R124i.x)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 14
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.w)),intBitsToFloat(R124i.y)) + intBitsToFloat(PV1iw));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(backupReg0i)) + -(intBitsToFloat(R125i.w)));
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[46].w)) + intBitsToFloat(uf_remappedVS[47].w));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R125i.x));
// 15
R9i.x = floatBitsToInt(intBitsToFloat(R123i.z) + 0.5);
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(PV0iy)) + intBitsToFloat(uf_remappedVS[44].x));
PV1iz = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS0i));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R123i.x)) + intBitsToFloat(R125i.z));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 16
PV0ix = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(PS1i));
R13i.y = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(PV1iz)) + intBitsToFloat(uf_remappedVS[45].x));
R127i.w = floatBitsToInt(intBitsToFloat(R11i.y) + -(intBitsToFloat(uf_remappedVS[47].w)));
// 17
backupReg0i = R0i.w;
R124i.x = floatBitsToInt(intBitsToFloat(R11i.y) + -(intBitsToFloat(uf_remappedVS[48].w)));
R125i.y = ((intBitsToFloat(R124i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
R125i.z = ((intBitsToFloat(R7i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(PV0ix)) + intBitsToFloat(uf_remappedVS[46].x));
R125i.x = ((intBitsToFloat(backupReg0i) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 18
PV0ix = floatBitsToInt(-(intBitsToFloat(R125i.x)) + 1.0);
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[47].x)) + intBitsToFloat(uf_remappedVS[48].x));
R124i.z = ((intBitsToFloat(R124i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
R124i.w = ((intBitsToFloat(R127i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS0i = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
// 19
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[47].w)) + intBitsToFloat(uf_remappedVS[48].w));
PV1iy = floatBitsToInt(-(intBitsToFloat(R124i.w)) + 1.0);
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R124i.z)) + 1.0);
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PS0i)));
// 20
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PV1iy)));
R9i.y = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(PV1iw)));
R124i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[48].x)) + intBitsToFloat(uf_remappedVS[49].x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 21
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[48].w)) + intBitsToFloat(uf_remappedVS[49].w));
R7i.y = floatBitsToInt(intBitsToFloat(R11i.y) + -(intBitsToFloat(uf_remappedVS[49].w)));
PV1iz = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS0i));
R4i.w = floatBitsToInt(fract(intBitsToFloat(R4i.w)));
R127i.y = floatBitsToInt(intBitsToFloat(R7i.w) * 100.0);
R127i.y = clampFI32(R127i.y);
// 22
R4i.x = floatBitsToInt(intBitsToFloat(R11i.y) + -(intBitsToFloat(uf_remappedVS[50].w)));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV1iz)) + intBitsToFloat(uf_remappedVS[47].x));
R125i.z = ((intBitsToFloat(R7i.y) >= 0.0)?(floatBitsToInt(1.0)):(0));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.y)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 23
backupReg0i = R1i.z;
PV1ix = floatBitsToInt(intBitsToFloat(R124i.w) * intBitsToFloat(PS0i));
R4i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[49].x)) + intBitsToFloat(uf_remappedVS[50].x));
R1i.z = ((intBitsToFloat(R4i.x) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iw = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R127i.y)));
// 24
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(intBitsToFloat(R11i.y) + -(intBitsToFloat(uf_remappedVS[51].w)));
PV0iz = floatBitsToInt(-(intBitsToFloat(R1i.z)) + 1.0);
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(PV1ix)) + intBitsToFloat(uf_remappedVS[48].x));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(R127i.y)));
// 25
R3i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[49].w)) + intBitsToFloat(uf_remappedVS[50].w));
R10i.y = ((intBitsToFloat(PV0iy) >= 0.0)?(floatBitsToInt(1.0)):(0));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PV0iz)));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iy = floatBitsToInt(-(intBitsToFloat(R10i.y)) + 1.0);
R124i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[50].x)) + intBitsToFloat(uf_remappedVS[51].x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R3i.x));
// 1
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[50].w)) + intBitsToFloat(uf_remappedVS[51].w));
PV1iz = floatBitsToInt(intBitsToFloat(R4i.y) * intBitsToFloat(PS0i));
// 2
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),intBitsToFloat(PV1iz)) + intBitsToFloat(uf_remappedVS[49].x));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[44].x), intBitsToFloat(R9i.y)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(R124i.w) * intBitsToFloat(PS0i));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R10i.x)) + intBitsToFloat(PV0iz));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(uf_remappedVS[52].z)));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z),intBitsToFloat(R5i.z)) + intBitsToFloat(R123i.y));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(PV1ix)) + intBitsToFloat(uf_remappedVS[50].x));
// 5
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R8i.x)) + intBitsToFloat(R123i.x));
// 6
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R7i.z)) + intBitsToFloat(R123i.w));
// 7
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),intBitsToFloat(R7i.x)) + intBitsToFloat(R123i.z));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R4i.z)) + intBitsToFloat(R123i.y));
// 9
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(R124i.x)) + intBitsToFloat(R123i.x));
R0i.w = uf_remappedVS[53].w;
// 10
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[51].x),intBitsToFloat(R10i.y)) + intBitsToFloat(R123i.w));
// 11
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[16].w), intBitsToFloat(R8i.z)));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[16].w), intBitsToFloat(R8i.w)));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(min(intBitsToFloat(uf_remappedVS[54].y), intBitsToFloat(uf_remappedVS[55].z)));
R127i.y = floatBitsToInt(-(intBitsToFloat(R1i.x)) + intBitsToFloat(uf_remappedVS[54].x));
R124i.z = floatBitsToInt(-(intBitsToFloat(R2i.y)) + intBitsToFloat(uf_remappedVS[54].y));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(uf_remappedVS[56].x)) + -(intBitsToFloat(uf_remappedVS[56].y)));
R123i.x = clampFI32(R123i.x);
R127i.z = floatBitsToInt(-(intBitsToFloat(R0i.z)) + intBitsToFloat(uf_remappedVS[54].z));
PV1iw = floatBitsToInt(-(intBitsToFloat(R0i.y)) + intBitsToFloat(PV0ix));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(R127i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(uf_remappedVS[57].x)) + -(intBitsToFloat(uf_remappedVS[57].y)));
R123i.y = clampFI32(R123i.y);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[55].y),intBitsToFloat(PV1iw)) + intBitsToFloat(uf_remappedVS[55].x));
R123i.z = clampFI32(R123i.z);
PV0iw = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
// 3
R123i.x = floatBitsToInt((intBitsToFloat(R124i.z) * intBitsToFloat(R124i.z) + intBitsToFloat(PV0ix)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(uf_remappedVS[58].w)));
PV1iz = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[59].y) + 1.0);
tempResultf = max(0.0, intBitsToFloat(PV0iw));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) * 1.5);
PV0ix = clampFI32(PV0ix);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[56].w), intBitsToFloat(PS1i)));
R125i.z = floatBitsToInt((intBitsToFloat(R127i.y) * intBitsToFloat(R127i.y) + intBitsToFloat(R123i.x)));
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[59].y) * 1.0 + intBitsToFloat(R8i.y));
tempResultf = max(0.0, intBitsToFloat(PV1iz));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 5
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[60].x), intBitsToFloat(PS0i)));
R125i.y = floatBitsToInt(intBitsToFloat(PV0ix) * 15.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[60].y), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iy)));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R0i.x) * intBitsToFloat(R5i.y));
R4i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)),intBitsToFloat(uf_remappedVS[61].w)) + intBitsToFloat(uf_remappedVS[61].w));
tempResultf = 1.0 / sqrt(intBitsToFloat(R125i.z));
PS0i = floatBitsToInt(tempResultf);
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
R124i.w = floatBitsToInt(-(intBitsToFloat(PV0iy)) + 1.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(R126i.z)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(PV1ix),intBitsToFloat(PV1iy),intBitsToFloat(PV1iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[59].x),intBitsToFloat(uf_remappedVS[59].y),intBitsToFloat(uf_remappedVS[59].z),0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R5i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
// 9
R123i.x = floatBitsToInt(intBitsToFloat(R124i.w) * intBitsToFloat(0x3f333333) + intBitsToFloat(0x3e19999a));
R123i.x = clampFI32(R123i.x);
R8i.y = 0;
R127i.z = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
R3i.w = ((0.0 >= intBitsToFloat(R3i.w))?-1:0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(R124i.x)));
// 10
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[60].z)),intBitsToFloat(PS1i)) + intBitsToFloat(uf_remappedVS[60].z));
R123i.x = clampFI32(R123i.x);
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R123i.z = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
PV0iw = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R125i.y));
// 11
PV1ix = floatBitsToInt(-(intBitsToFloat(R1i.z)) + intBitsToFloat(R123i.x));
PV1ix = clampFI32(PV1ix);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(0xbe593484));
PV1iz = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS0i));
R127i.w = floatBitsToInt(intBitsToFloat(PV0iw) + 8.5);
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0iy)));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3f22f983));
PV0iy = floatBitsToInt(max(intBitsToFloat(PV1iz), intBitsToFloat(0x3e4ccccd)));
R0i.z = PV1ix;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R123i.y)) + intBitsToFloat(0x3fc90da4));
R8i.z = PV1ix;
// 13
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),-(intBitsToFloat(R123i.w))) + 1.0);
R0i.y = floatBitsToInt(min(intBitsToFloat(PV0iy), 1.0));
R4i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
R8i.w = ((0.0 >= intBitsToFloat(R2i.x))?-1:0);
R8i.x = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x3daaaaab));
}
if( activeMaskStackC[3] == true ) {
R5i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y))).xyz);
R7i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
R8i.x = ((R3i.w == 0)?(R8i.w):(int(-1)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R0i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R0i.y)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R0i.y)));
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[31].y),intBitsToFloat(R10i.y)) + intBitsToFloat(R2i.z));
// 1
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].y),intBitsToFloat(R10i.y)) + intBitsToFloat(R9i.z));
R126i.y = 0;
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[31].y), intBitsToFloat(R5i.w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[36].y), intBitsToFloat(R5i.w)));
R125i.w = 0;
// 2
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].y),intBitsToFloat(R10i.y)) + intBitsToFloat(R13i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R0i.w)) + intBitsToFloat(R6i.y));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(PV1iw)) + intBitsToFloat(R9i.w));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[40].y), intBitsToFloat(R5i.w)));
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(R3i.z)) + 0.0);
// 3
R1i.x = 0;
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(PV0iw)) + intBitsToFloat(R9i.x));
R3i.z = ((R8i.x == 0)?(R6i.z):(R4i.z));
R0i.w = ((R8i.x == 0)?(R1i.w):(R126i.y));
R4i.x = R16i.y;
// 4
R127i.x = ((R8i.x == 0)?(R2i.w):(R125i.w));
R3i.y = R11i.w;
R2i.z = R13i.z;
R1i.w = ((R8i.x == 0)?(R3i.x):(R1i.x));
R6i.z = R1i.y;
// 5
R5i.x = R10i.w;
R6i.y = R19i.z;
R9i.z = ((R8i.x == 0)?(0):(0x3f800000));
R123i.w = ((R8i.x == 0)?(0):(R4i.w));
R122i.x = ((R8i.x == 0)?(0):(R2i.y));
// 6
R20i.x = ((R9i.z == 0)?(R4i.w):(R123i.w));
R20i.y = ((R9i.z == 0)?(R2i.y):(R122i.x));
R123i.z = ((R8i.x == 0)?(0):(R0i.z));
R123i.w = ((R8i.x == 0)?(0):(R1i.z));
R122i.x = ((R8i.x == 0)?(0):(R127i.w));
// 7
R21i.x = ((R9i.z == 0)?(R127i.w):(R122i.x));
R123i.y = ((R8i.x == 0)?(0):(R7i.x));
R20i.z = ((R9i.z == 0)?(R0i.z):(R123i.z));
R20i.w = ((R9i.z == 0)?(R1i.z):(R123i.w));
R122i.x = ((R8i.x == 0)?(0):(R7i.y));
// 8
R22i.x = ((R9i.z == 0)?(R7i.x):(R123i.y));
R22i.y = ((R9i.z == 0)?(R7i.y):(R122i.x));
R123i.z = ((R8i.x == 0)?(0):(R127i.z));
R123i.w = ((R8i.x == 0)?(0):(R125i.y));
R124i.x = ((R8i.x == 0)?(0):(R7i.w));
// 9
R123i.x = ((R8i.x == 0)?(0):(R8i.z));
R21i.y = ((R9i.z == 0)?(R127i.z):(R123i.z));
R21i.z = ((R9i.z == 0)?(R125i.y):(R123i.w));
R4i.w = ((R8i.x == 0)?(0):(R4i.x));
R0i.z = ((R8i.x == 0)?(0):(R3i.y));
// 10
R9i.x = ((R8i.x == 0)?(0):(R4i.w));
R123i.y = ((R8i.x == 0)?(0):(R2i.x));
R123i.z = ((R8i.x == 0)?(0):(R0i.y));
R21i.w = ((R9i.z == 0)?(R8i.z):(R123i.x));
R127i.w = ((R8i.x == 0)?(0):(R127i.y));
// 11
R13i.x = ((R9i.z == 0)?(R2i.x):(R123i.y));
R13i.y = ((R9i.z == 0)?(R0i.y):(R123i.z));
R123i.z = ((R8i.x == 0)?(0):(R7i.z));
R124i.w = ((R8i.x == 0)?(0):(R126i.x));
R2i.w = ((R8i.x == 0)?(0):(R12i.y));
// 12
backupReg0i = R124i.x;
R124i.x = ((R8i.x == 0)?(0):(R12i.w));
R125i.y = ((R8i.x == 0)?(0):(R126i.z));
R22i.z = ((R9i.z == 0)?(R7i.z):(R123i.z));
R22i.w = ((R9i.z == 0)?(R7i.w):(backupReg0i));
R7i.w = ((R8i.x == 0)?(R19i.y):(R1i.y));
// 13
R7i.x = ((R8i.x == 0)?(0):(R2i.z));
R124i.y = ((R8i.x == 0)?(0):(R2i.z));
R127i.z = ((R8i.x == 0)?(0):(R0i.x));
R126i.w = ((R8i.x == 0)?(0):(R14i.y));
R124i.z = ((R8i.x == 0)?(0):(R6i.w));
// 14
R123i.x = ((R8i.x == 0)?(0):(R125i.x));
R7i.y = ((R8i.x == 0)?(0):(R17i.y));
R125i.z = ((R8i.x == 0)?(0):(R12i.z));
R5i.w = ((R8i.x == 0)?(0):(R13i.w));
R122i.x = ((R8i.x == 0)?(0):(R11i.z));
// 15
R23i.x = ((R9i.z == 0)?(R125i.x):(R123i.x));
R23i.y = ((R9i.z == 0)?(R127i.y):(R127i.w));
R23i.z = ((R9i.z == 0)?(R126i.x):(R124i.w));
R23i.w = ((R9i.z == 0)?(R126i.z):(R125i.y));
R25i.x = ((R9i.z == 0)?(R11i.z):(R122i.x));
// 16
R123i.x = ((R8i.x == 0)?(0):(R15i.y));
R25i.y = ((R9i.z == 0)?(R0i.x):(R127i.z));
R25i.z = ((R9i.z == 0)?(R14i.y):(R126i.w));
R25i.w = ((R9i.z == 0)?(R6i.w):(R124i.z));
R126i.x = ((R8i.x == 0)?(R18i.y):(R125i.w));
// 17
R14i.x = ((R9i.z == 0)?(R15i.y):(R123i.x));
R123i.y = ((R8i.x == 0)?(0):(R12i.x));
R127i.z = R19i.z;
R125i.w = ((R8i.x == 0)?(R18i.w):(R10i.w));
PS1i = R16i.y;
// 18
R0i.x = ((R9i.z == 0)?(PS1i):(R4i.w));
R24i.y = ((R9i.z == 0)?(R12i.y):(R2i.w));
R24i.z = ((R9i.z == 0)?(R12i.z):(R125i.z));
R123i.w = ((R8i.x == 0)?(R18i.x):(R126i.y));
R24i.x = ((R9i.z == 0)?(R12i.x):(R123i.y));
// 19
R18i.x = ((R9i.z == 0)?(R0i.w):(R123i.w));
R18i.y = ((R9i.z == 0)?(R127i.x):(R126i.x));
PV1iz = R11i.w;
R24i.w = ((R9i.z == 0)?(R12i.w):(R124i.x));
PS1i = R13i.z;
// 20
R123i.x = ((R8i.x == 0)?(R19i.x):(R1i.x));
R0i.y = ((R9i.z == 0)?(PV1iz):(R0i.z));
R0i.z = ((R9i.z == 0)?(PS1i):(R124i.y));
R126i.w = ((R8i.x == 0)?(0):(R14i.z));
// 21
R19i.x = ((R9i.z == 0)?(R1i.w):(R123i.x));
R19i.y = ((R9i.z == 0)?(R6i.z):(R7i.w));
R19i.z = ((R9i.z == 0)?(R6i.y):(R127i.z));
R0i.w = R9i.x;
// 22
R123i.x = ((R8i.x == 0)?(0):(R15i.z));
R14i.y = ((R9i.z == 0)?(R14i.z):(R126i.w));
// 23
R15i.x = ((R9i.z == 0)?(R15i.z):(R123i.x));
R15i.y = ((R9i.z == 0)?(R17i.y):(R7i.y));
R123i.z = ((R8i.x == 0)?(0):(R14i.w));
R123i.w = ((R8i.x == 0)?(0):(R11i.x));
// 24
R123i.x = ((R8i.x == 0)?(R18i.z):(R4i.z));
R15i.z = ((R9i.z == 0)?(R11i.x):(R123i.w));
R15i.w = ((R9i.z == 0)?(R13i.w):(R5i.w));
R14i.z = ((R9i.z == 0)?(R14i.w):(R123i.z));
// 25
backupReg0i = R5i.x;
R5i.x = ((R8i.x == 0)?(0):(R16i.z));
R18i.z = ((R9i.z == 0)?(R3i.z):(R123i.x));
R18i.w = ((R9i.z == 0)?(backupReg0i):(R125i.w));
// 26
R13i.z = ((R9i.z == 0)?(R2i.z):(R7i.x));
R14i.w = ((R9i.z == 0)?(R16i.z):(R5i.x));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R25i.x), intBitsToFloat(R25i.y), intBitsToFloat(R25i.z), intBitsToFloat(R25i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R24i.x), intBitsToFloat(R24i.y), intBitsToFloat(R24i.z), intBitsToFloat(R24i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R23i.x), intBitsToFloat(R23i.y), intBitsToFloat(R23i.z), intBitsToFloat(R23i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R22i.x), intBitsToFloat(R22i.y), intBitsToFloat(R22i.z), intBitsToFloat(R22i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R21i.x), intBitsToFloat(R21i.y), intBitsToFloat(R21i.z), intBitsToFloat(R21i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.z));
// export
passParameterSem9 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.z));
}
