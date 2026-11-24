#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 7163e9768de520dc
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

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem3;
out vec4 passParameterSem7;
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
ivec4 R19i = ivec4(0);
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
attrDecoder = attrDataSem4;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyz = attrDataSem3.xyz;
attrDecoder.xyz = uvec3((attrDecoder.xyz>>24)|((attrDecoder.xyz>>8)&0xFF00u)|((attrDecoder.xyz<<8)&0xFF0000u)|((attrDecoder.xyz<<24)));
attrDecoder.w = uint(0);
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), 0x3f800000);
attrDecoder = attrDataSem9;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem8;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem1;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem2;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem0;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R15i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
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
R10i.y = floatBitsToInt(-(intBitsToFloat(R2i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R2i.w = 0;
R3i.w = floatBitsToInt(1.0);
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
R11i.x = 0;
R11i.y = 0;
R11i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].y) * 5.0);
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
R2i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R10i.y) >= intBitsToFloat(R2i.z));
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
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(uf_remappedVS[2].y)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(uf_remappedVS[2].z)));
R0i.z = 0x3f800000;
PV0iw = floatBitsToInt(max(intBitsToFloat(R5i.x), 0.0));
R1i.w = 0x3f800000;
// 1
PV1ix = uf_remappedVS[3].y;
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) / 2.0);
PV1iy = uf_remappedVS[3].x;
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) / 2.0);
PV1iz = floatBitsToInt(min(intBitsToFloat(PV0iw), 0.0));
R127i.w = uf_remappedVS[4].x & 0x80000;
R127i.y = ((intBitsToFloat(R5i.x) > 0.5)?-1:0);
// 2
R2i.x = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV1iz));
R2i.y = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(-(intBitsToFloat(R7i.x)) + 1.0);
R0i.w = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV1iy));
R126i.y = uf_remappedVS[4].x & 0x100000;
// 3
PV1ix = ((intBitsToFloat(R5i.y) > 0.5)?-1:0);
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(uf_remappedVS[2].x)));
R123i.z = ((R127i.y == 0)?(R7i.x):(PV0iz));
PV1iw = floatBitsToInt(-(intBitsToFloat(R7i.y)) + 1.0);
PS1i = (R127i.w == 0x80000)?-1:0;
// 4
R6i.x = 0;
R123i.y = ((PV1ix == 0)?(R7i.y):(PV1iw));
PV0iz = (R126i.y == 0x100000)?-1:0;
R2i.w = ((PS1i == 0)?(R7i.x):(R123i.z));
R2i.z = uf_remappedVS[5].x;
// 5
R12i.y = uf_remappedVS[6].x;
R6i.z = ((PV0iz == 0)?(R7i.y):(R123i.y));
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[7].w)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[7].z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(uf_remappedVS[7].y)));
// 1
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w))));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(R0i.w)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R127i.w = tempi.x;
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R127i.x)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R127i.z = tempi.x;
PV1iw = tempi.x;
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R2i.y)));
// 4
R127i.x = uf_remappedVS[11].x;
R127i.y = uf_remappedVS[11].y;
R126i.z = uf_remappedVS[11].z;
R126i.w = R0i.x;
R125i.w = R127i.w;
// 5
backupReg0i = R127i.w;
R126i.x = uf_remappedVS[12].x;
R125i.y = uf_remappedVS[12].y;
R125i.z = uf_remappedVS[12].z;
R127i.w = R127i.z;
R6i.y = backupReg0i;
// 6
backupReg0i = R126i.y;
backupReg1i = R127i.z;
R125i.x = uf_remappedVS[13].x;
R126i.y = uf_remappedVS[13].y;
R127i.z = uf_remappedVS[13].z;
R124i.w = floatBitsToInt(intBitsToFloat(backupReg0i) + 1.0);
R4i.z = backupReg1i;
// 7
R2i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R126i.w)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R124i.y),intBitsToFloat(R124i.z),intBitsToFloat(R0i.z))));
PV1iy = R2i.x;
PV1iz = R2i.x;
PV1iw = R2i.x;
PS1i = int(intBitsToFloat(uf_remappedVS[14].z));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R125i.y),intBitsToFloat(R125i.z),intBitsToFloat(R125i.w)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R124i.y),intBitsToFloat(R124i.z),intBitsToFloat(R0i.z))));
PV0ix = tempi.x;
R1i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.w = floatBitsToInt(float(PS1i));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R124i.y),intBitsToFloat(R124i.z),intBitsToFloat(R0i.z))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R1i.z = tempi.x;
PV1iw = tempi.x;
R0i.w = floatBitsToInt(1.0);
// 10
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[15].z) + intBitsToFloat(uf_remappedVS[16].x));
PV0iy = floatBitsToInt(-(abs(intBitsToFloat(R125i.w))) + 0.0);
PV0iz = floatBitsToInt((0.0 >= abs(intBitsToFloat(R125i.w)))?1.0:0.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(uf_remappedVS[16].x)));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R125i.w));
// 11
R125i.x = ((intBitsToFloat(PV0iz) == 0.0)?(0):(PV0iy));
PV1iy = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(uf_remappedVS[16].y)));
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 2.0);
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[15].w) + intBitsToFloat(uf_remappedVS[16].y));
PS1i = floatBitsToInt(-(intBitsToFloat(PV0iw)) + intBitsToFloat(PV0ix));
// 12
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R10i.y)),intBitsToFloat(uf_remappedVS[15].x)) + -(intBitsToFloat(PS1i)));
R126i.y = floatBitsToInt(-(intBitsToFloat(PV1iz)) + intBitsToFloat(PV1iw));
PV0iz = floatBitsToInt(trunc(intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(abs(intBitsToFloat(R125i.w)) + intBitsToFloat(R125i.x));
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[14].z));
// 13
R123i.y = ((-(intBitsToFloat(R125i.x)) > 0.0)?(PV0iw):(R125i.x));
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[17].x) + intBitsToFloat(uf_remappedVS[17].z));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[17].y) + intBitsToFloat(uf_remappedVS[17].w));
R127i.x = int(intBitsToFloat(PV0iz));
// 14
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(uf_remappedVS[17].z)) + intBitsToFloat(PV1iz));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(uf_remappedVS[17].w)) + intBitsToFloat(PV1iw));
R123i.z = ((intBitsToFloat(R125i.w) == 0.0)?(0):(R123i.y));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[14].w));
// 15
backupReg0i = R126i.y;
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[14].y), intBitsToFloat(PS0i)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[14].x), intBitsToFloat(R127i.w)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(uf_remappedVS[15].y)) + intBitsToFloat(backupReg0i));
R124i.x = int(intBitsToFloat(R123i.z));
// 16
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R126i.y)) + -(0.5));
PV0iy = uf_remappedVS[18].y;
R127i.z = uf_remappedVS[18].z;
PV0iw = uf_remappedVS[18].x;
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z),intBitsToFloat(R5i.x)) + -(0.5));
// 17
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedVS[19].x)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(uf_remappedVS[16].w)) + intBitsToFloat(R124i.y));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(uf_remappedVS[16].z)) + intBitsToFloat(R125i.x));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(uf_remappedVS[19].y)));
// 18
backupReg0i = R4i.z;
R0i.x = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(R0i.x));
R0i.y = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(R6i.y));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(uf_remappedVS[19].z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(uf_remappedVS[11].z)));
R0i.z = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(backupReg0i));
// 19
R18i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(PV0iw),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),1.0,0.0)));
PV1iy = R18i.x;
PV1iz = R18i.x;
PV1iw = R18i.x;
PS1i = floatBitsToInt(float(R124i.x));
// 20
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(uf_remappedVS[12].z)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(PS1i)) + intBitsToFloat(R126i.x));
PS0i = floatBitsToInt(float(R127i.x));
// 21
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.x)),intBitsToFloat(PS0i)) + intBitsToFloat(R124i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R1i.x)) + intBitsToFloat(R123i.w));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(uf_remappedVS[12].y)) + intBitsToFloat(PV0ix));
// 22
R16i.x = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
R18i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(uf_remappedVS[12].x)) + intBitsToFloat(R122i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(R4i.x)) + -(intBitsToFloat(R123i.x)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(uf_remappedVS[13].z)));
// 23
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R18i.z = tempi.x;
PV1iw = tempi.x;
R16i.y = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
// 24
R16i.z = 0;
}
if( activeMaskStackC[3] == true ) {
// 0
R11i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w))));
PV0iy = R11i.x;
PV0iz = R11i.x;
PV0iw = R11i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w))));
PV1ix = tempi.x;
R11i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[22].x),intBitsToFloat(uf_remappedVS[22].y),intBitsToFloat(uf_remappedVS[22].z),intBitsToFloat(uf_remappedVS[22].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R11i.z = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[23].x),intBitsToFloat(uf_remappedVS[23].y),intBitsToFloat(uf_remappedVS[23].z),intBitsToFloat(uf_remappedVS[23].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R11i.w = tempi.x;
// 4
R3i.x = uf_remappedVS[24].x;
R3i.y = uf_remappedVS[24].y;
PV0iz = PV1ix;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
R2i.w = uf_remappedVS[24].z;
// 5
R123i.x = floatBitsToInt(intBitsToFloat(R11i.z) * 0.0 + intBitsToFloat(PV0iz));
R5i.y = uf_remappedVS[25].x;
R17i.z = floatBitsToInt(intBitsToFloat(R11i.z) * 0.5 + intBitsToFloat(PV0iz));
R17i.w = floatBitsToInt(intBitsToFloat(R11i.z) * 0.0 + intBitsToFloat(R11i.w));
// 6
R17i.x = floatBitsToInt(intBitsToFloat(R11i.x) * 0.5 + intBitsToFloat(R123i.x));
R17i.y = floatBitsToInt(intBitsToFloat(R11i.y) * -(0.5) + intBitsToFloat(R123i.x));
R2i.y = floatBitsToInt(1.0 / intBitsToFloat(R17i.w));
// 7
PV1iy = floatBitsToInt(intBitsToFloat(R17i.z) * intBitsToFloat(R2i.y));
// 8
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(uf_remappedVS[1].w)) + -(intBitsToFloat(uf_remappedVS[1].y)));
// 9
R4i.x = uf_remappedVS[26].x;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.z));
// 10
R3i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) * intBitsToFloat(PS1i));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R127i.x = ((intBitsToFloat(R3i.w) > intBitsToFloat(uf_remappedVS[27].y))?-1:0);
R124i.y = ((intBitsToFloat(R3i.w) > intBitsToFloat(uf_remappedVS[27].z))?-1:0);
PV0iw = ((intBitsToFloat(R3i.w) > intBitsToFloat(uf_remappedVS[27].x))?-1:0);
// 1
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(uf_remappedVS[28].x)));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(uf_remappedVS[28].y)));
PV1iz = PV0iw & int(1);
R14i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(uf_remappedVS[28].w)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(uf_remappedVS[28].z)));
// 2
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(R4i.x)));
PV0iy = PV1iz - R127i.x;
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R4i.x)));
R13i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(uf_remappedVS[19].w)));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R4i.x)));
// 3
PV1ix = PV0iy - R124i.y;
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R3i.y)));
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R2i.z)));
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R1i.x)));
// 4
R1i.w = floatBitsToInt(float(PV1ix));
// 5
predResult = (intBitsToFloat(R1i.w) == 0.0);
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
R0i.z = R0i.z;
R0i.w = 0x3f800000;
// 1
R3i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[29].x),intBitsToFloat(uf_remappedVS[29].y),intBitsToFloat(uf_remappedVS[29].z),intBitsToFloat(uf_remappedVS[29].w))));
PV1iy = R3i.x;
PV1iz = R3i.x;
PV1iw = R3i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[30].x),intBitsToFloat(uf_remappedVS[30].y),intBitsToFloat(uf_remappedVS[30].z),intBitsToFloat(uf_remappedVS[30].w))));
PV0ix = tempi.x;
R3i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[31].x),intBitsToFloat(uf_remappedVS[31].y),intBitsToFloat(uf_remappedVS[31].z),intBitsToFloat(uf_remappedVS[31].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R3i.z = tempi.x;
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
predResult = (intBitsToFloat(R1i.w) == 1.0);
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
R0i.z = R0i.z;
R0i.w = 0x3f800000;
// 1
R3i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[33].x),intBitsToFloat(uf_remappedVS[33].y),intBitsToFloat(uf_remappedVS[33].z),intBitsToFloat(uf_remappedVS[33].w))));
PV1iy = R3i.x;
PV1iz = R3i.x;
PV1iw = R3i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[34].x),intBitsToFloat(uf_remappedVS[34].y),intBitsToFloat(uf_remappedVS[34].z),intBitsToFloat(uf_remappedVS[34].w))));
PV0ix = tempi.x;
R3i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[35].x),intBitsToFloat(uf_remappedVS[35].y),intBitsToFloat(uf_remappedVS[35].z),intBitsToFloat(uf_remappedVS[35].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R3i.z = tempi.x;
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
R0i.z = R0i.z;
R0i.w = 0x3f800000;
// 1
R3i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[37].x),intBitsToFloat(uf_remappedVS[37].y),intBitsToFloat(uf_remappedVS[37].z),intBitsToFloat(uf_remappedVS[37].w))));
PV1iy = R3i.x;
PV1iz = R3i.x;
PV1iw = R3i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[38].x),intBitsToFloat(uf_remappedVS[38].y),intBitsToFloat(uf_remappedVS[38].z),intBitsToFloat(uf_remappedVS[38].w))));
PV0ix = tempi.x;
R3i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[39].x),intBitsToFloat(uf_remappedVS[39].y),intBitsToFloat(uf_remappedVS[39].z),intBitsToFloat(uf_remappedVS[39].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R3i.z = tempi.x;
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
R127i.x = floatBitsToInt(-(intBitsToFloat(R2i.x)) + intBitsToFloat(uf_remappedVS[41].x));
R127i.y = floatBitsToInt(-(intBitsToFloat(R1i.y)) + intBitsToFloat(uf_remappedVS[41].y));
R127i.z = floatBitsToInt(-(intBitsToFloat(R1i.z)) + intBitsToFloat(uf_remappedVS[41].z));
R124i.w = floatBitsToInt(intBitsToFloat(R17i.y) * intBitsToFloat(R2i.y));
R126i.z = floatBitsToInt(1.0 / intBitsToFloat(R2i.z));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.y = floatBitsToInt(intBitsToFloat(R3i.z) * intBitsToFloat(R126i.z));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[42].x),intBitsToFloat(uf_remappedVS[42].y),intBitsToFloat(uf_remappedVS[42].z),intBitsToFloat(uf_remappedVS[42].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
R127i.w = floatBitsToInt(tempResultf);
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[43].x),intBitsToFloat(uf_remappedVS[43].y),intBitsToFloat(uf_remappedVS[43].z),intBitsToFloat(uf_remappedVS[43].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R126i.w = tempi.x;
R125i.w = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[44].x),intBitsToFloat(uf_remappedVS[44].y),intBitsToFloat(uf_remappedVS[44].z),intBitsToFloat(uf_remappedVS[44].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R125i.z = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R127i.w)));
// 5
R0i.x = floatBitsToInt(intBitsToFloat(R3i.x) * intBitsToFloat(R126i.z));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R127i.w)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.w)));
R0i.w = R126i.y;
R0i.w = clampFI32(R0i.w);
R0i.y = floatBitsToInt(intBitsToFloat(R3i.y) * intBitsToFloat(R126i.z));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(PV1iy),intBitsToFloat(PV1iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[45].x),intBitsToFloat(uf_remappedVS[45].y),intBitsToFloat(uf_remappedVS[45].z),0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.z = floatBitsToInt(roundEven(intBitsToFloat(R1i.w)));
// 7
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R125i.w)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R125i.w)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(uf_remappedVS[46].x)) + -(intBitsToFloat(uf_remappedVS[46].y)));
R123i.z = clampFI32(R123i.z);
R126i.w = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
R3i.y = 0;
// 8
PV0ix = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
PV0iy = floatBitsToInt(-(intBitsToFloat(R124i.w)) + 1.0);
R125i.z = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
R123i.w = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
PS0i = floatBitsToInt(intBitsToFloat(uf_remappedVS[45].y) + 1.0);
// 9
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3f333333) + intBitsToFloat(0x3e19999a));
R123i.x = clampFI32(R123i.x);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),intBitsToFloat(uf_remappedVS[47].x)) + -(intBitsToFloat(uf_remappedVS[47].y)));
R127i.y = clampFI32(R127i.y);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R123i.w)) + intBitsToFloat(0xbe593484));
PV1iw = floatBitsToInt(intBitsToFloat(PS0i) * 1.5);
PV1iw = clampFI32(PV1iw);
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R126i.y = floatBitsToInt(tempResultf);
// 10
backupReg0i = R125i.z;
PV0ix = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R123i.z)) + intBitsToFloat(0x3fc90da4));
R125i.z = floatBitsToInt(intBitsToFloat(PV1iw) * 15.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[48].y), intBitsToFloat(R126i.y)));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(backupReg0i)));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f22f983));
R5i.y = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + 8.5);
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[48].x), intBitsToFloat(R126i.y)));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 12
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),-(intBitsToFloat(R125i.y))) + 1.0);
R2i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
R1i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[45].y) * 1.0 + intBitsToFloat(R3i.w));
R3i.w = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3daaaaab));
R4i.y = floatBitsToInt(1.0 / intBitsToFloat(R125i.z));
}
if( activeMaskStackC[3] == true ) {
R0i.w = floatBitsToInt(texture(textureUnitVS12, vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))));
R0i.z = floatBitsToInt(texture(textureUnitVS7, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y))).x);
R2i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y))).xyz);
R15i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R3i.w),intBitsToFloat(R3i.y))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R0i.w)) + 1.0);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[49].y)));
PV0iw = floatBitsToInt(intBitsToFloat(R1i.z) * intBitsToFloat(R4i.y));
tempResultf = max(0.0, intBitsToFloat(R5i.y));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R126i.w = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(min(intBitsToFloat(uf_remappedVS[41].y), intBitsToFloat(uf_remappedVS[50].z)));
PV1iy = floatBitsToInt(max(intBitsToFloat(PV0iw), intBitsToFloat(0x3e4ccccd)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R125i.y)) + 1.0);
PS1i = floatBitsToInt(exp2(intBitsToFloat(R1i.w)));
// 2
R1i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[48].z)),intBitsToFloat(PS1i)) + intBitsToFloat(uf_remappedVS[48].z));
R1i.x = clampFI32(R1i.x);
R4i.y = floatBitsToInt(-(intBitsToFloat(R125i.y)) + intBitsToFloat(R123i.z));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[47].w), intBitsToFloat(R126i.w)));
PV0iw = floatBitsToInt(-(intBitsToFloat(R6i.y)) + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(min(intBitsToFloat(PV1iy), 1.0));
// 3
backupReg0i = R2i.z;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PS0i)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PS0i)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[50].y),intBitsToFloat(PV0iw)) + intBitsToFloat(uf_remappedVS[50].x));
R2i.z = clampFI32(R2i.z);
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PS0i)));
// 4
R1i.w = floatBitsToInt(exp2(intBitsToFloat(R125i.z)));
}
if( activeMaskStackC[3] == true ) {
// 0
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(uf_remappedVS[51].w)));
R9i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(uf_remappedVS[52].z)));
// 1
R9i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.w)),intBitsToFloat(uf_remappedVS[53].w)) + intBitsToFloat(uf_remappedVS[53].w));
PV1iy = floatBitsToInt(-(intBitsToFloat(R9i.w)) + intBitsToFloat(R1i.x));
PV1iy = clampFI32(PV1iy);
// 2
R9i.z = PV1iy;
R0i.w = PV1iy;
}
if( activeMaskStackC[3] == true ) {
// 0
R12i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].x) * 1.0 + 0.0);
// 1
R19i.x = R8i.x;
R19i.y = R8i.y;
R19i.z = R8i.z;
R19i.w = R8i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.z));
// export
passParameterSem8 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.z));
}
