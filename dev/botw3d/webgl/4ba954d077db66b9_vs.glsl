#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 4ba954d077db66b9
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
UNIFORM_BUFFER_LAYOUT(1, 0, 2) uniform uniformBlockVS1
{
vec4 uf_blockVS1[11];
};


UNIFORM_BUFFER_LAYOUT(3, 0, 3) uniform uniformBlockVS3
{
vec4 uf_blockVS3[1];
};


UNIFORM_BUFFER_LAYOUT(4, 0, 4) uniform uniformBlockVS4
{
vec4 uf_blockVS4[4096];
};


UNIFORM_BUFFER_LAYOUT(5, 0, 5) uniform uniformBlockVS5
{
vec4 uf_blockVS5[1];
};


UNIFORM_BUFFER_LAYOUT(6, 0, 6) uniform uniformBlockVS6
{
vec4 uf_blockVS6[39];
};


UNIFORM_BUFFER_LAYOUT(8, 0, 7) uniform uniformBlockVS8
{
vec4 uf_blockVS8[14];
};


UNIFORM_BUFFER_LAYOUT(11, 0, 8) uniform uniformBlockVS11
{
vec4 uf_blockVS11[8];
};


UNIFORM_BUFFER_LAYOUT(12, 0, 9) uniform uniformBlockVS12
{
vec4 uf_blockVS12[30];
};


UNIFORM_BUFFER_LAYOUT(13, 0, 10) uniform uniformBlockVS13
{
vec4 uf_blockVS13[30];
};


TEXTURE_LAYOUT(32, 0, 0) uniform sampler2DArray textureUnitVS0;
TEXTURE_LAYOUT(33, 0, 1) uniform sampler2DArray textureUnitVS1;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem2;
out vec4 passParameterSem3;
out vec4 passParameterSem4;
out vec4 passParameterSem7;
out vec4 passParameterSem9;
out vec4 passParameterSem10;
out vec4 passParameterSem11;
out vec4 passParameterSem5;
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
bool activeMaskStack[2];
bool activeMaskStackC[3];
activeMaskStack[0] = false;
activeMaskStackC[0] = false;
activeMaskStackC[1] = false;
activeMaskStack[0] = true;
activeMaskStackC[0] = true;
activeMaskStackC[1] = true;
R0i = ivec4(gl_VertexID, 0, 0, gl_InstanceID);
attrDecoder.xy = attrDataSem0.xy;
attrDecoder.xy = uvec2((attrDecoder.xy>>24)|((attrDecoder.xy>>8)&0xFF00u)|((attrDecoder.xy<<8)&0xFF0000u)|((attrDecoder.xy<<24)));
attrDecoder.z = uint(0);
attrDecoder.w = uint(0);
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), 0, 0x3f800000);
if( activeMaskStackC[1] == true ) {
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), uf_blockVS3[0].z));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), uf_blockVS3[0].w));
R5i.x = 0x3f800000;
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), uf_blockVS5[0].y));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), uf_blockVS5[0].x));
// 2
R0i.x = floatBitsToInt(uf_blockVS5[0].z + intBitsToFloat(PV1iy));
R1i.y = floatBitsToInt(uf_blockVS5[0].w + intBitsToFloat(PV1ix));
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), uf_blockVS12[26].y));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), uf_blockVS12[26].x));
// 1
R1i.x = floatBitsToInt(uf_blockVS12[26].z + intBitsToFloat(PV0iw));
R2i.y = floatBitsToInt(uf_blockVS12[26].w + intBitsToFloat(PV0iz));
// 2
predResult = (intBitsToFloat(R0i.y) > 0.5);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), uf_blockVS13[25].x));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), uf_blockVS13[25].x));
// 1
R4i.x = floatBitsToInt(uf_blockVS13[25].z + intBitsToFloat(PV0iy));
R0i.y = floatBitsToInt(uf_blockVS13[25].w + intBitsToFloat(PV0iw));
// 2
R4i.z = R0i.y;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), uf_blockVS12[25].x));
PV0iy = floatBitsToInt(intBitsToFloat(R1i.y) + -(0.5));
PV0iz = floatBitsToInt(intBitsToFloat(R0i.x) + -(0.5));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), uf_blockVS12[25].x));
// 1
PV1ix = floatBitsToInt(max(intBitsToFloat(PV0iz), -(intBitsToFloat(PV0iz))));
R0i.y = floatBitsToInt(uf_blockVS12[25].w + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(max(intBitsToFloat(PV0iy), -(intBitsToFloat(PV0iy))));
R4i.x = floatBitsToInt(uf_blockVS12[25].z + intBitsToFloat(PV0iw));
// 2
PV0iz = floatBitsToInt(max(intBitsToFloat(PV1ix), intBitsToFloat(PV1iw)));
R4i.z = R0i.y;
// 3
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockVS12[28].z, intBitsToFloat(PV0iz)));
// 4
R5i.x = floatBitsToInt(uf_blockVS12[28].w + intBitsToFloat(PV1iy));
R5i.x = clampFI32(R5i.x);
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), uf_blockVS12[29].x));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), uf_blockVS12[29].y));
PV0iw = floatBitsToInt(uf_blockVS12[27].x);
// 1
PV1ix = floatBitsToInt(uf_blockVS13[27].x);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), uf_blockVS13[29].x));
R0i.z = floatBitsToInt(roundEven(intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), uf_blockVS13[29].y));
// 2
R0i.x = floatBitsToInt(uf_blockVS12[29].z + intBitsToFloat(R127i.x));
R0i.y = floatBitsToInt(uf_blockVS12[29].w + intBitsToFloat(R127i.z));
R1i.z = floatBitsToInt(roundEven(intBitsToFloat(PV1ix)));
R1i.w = floatBitsToInt(uf_blockVS13[29].z + intBitsToFloat(PV1iy));
R1i.y = floatBitsToInt(uf_blockVS13[29].w + intBitsToFloat(PV1iw));
}
if( activeMaskStackC[1] == true ) {
R0i.xyzw = floatBitsToInt(texture(textureUnitVS1, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z))).xyzw);
R1i.xyzw = floatBitsToInt(texture(textureUnitVS1, vec3(intBitsToFloat(R1i.w),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z))).xyzw);
}
if( activeMaskStackC[1] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R0i.w)) + intBitsToFloat(R1i.w));
PV0iy = floatBitsToInt(intBitsToFloat(R4i.x) + -(uf_blockVS12[5].z));
R127i.z = floatBitsToInt(-(intBitsToFloat(R0i.y)) + intBitsToFloat(R1i.y));
PV0iw = floatBitsToInt(intBitsToFloat(R4i.z) + -(uf_blockVS12[5].w));
PS0i = floatBitsToInt(1.0 / uf_blockVS12[5].x);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(PS0i)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R5i.x)) + intBitsToFloat(R0i.w));
PV1iw = floatBitsToInt(uf_blockVS12[7].x);
R2i.w = floatBitsToInt(uf_blockVS12[7].y + 1.0);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), uf_blockVS12[9].x));
PV0iy = floatBitsToInt(-(intBitsToFloat(R0i.z)) + intBitsToFloat(R1i.z));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), uf_blockVS12[9].y));
PV0iw = floatBitsToInt(intBitsToFloat(R123i.z) * 255.9961);
R2i.z = floatBitsToInt(roundEven(intBitsToFloat(PV1iw)));
// 3
backupReg0i = R127i.z;
R2i.x = floatBitsToInt(uf_blockVS12[9].z + intBitsToFloat(PV0ix));
R127i.y = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(0x37000080));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R5i.x)) + intBitsToFloat(R0i.z));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R5i.x)) + intBitsToFloat(R0i.y));
R2i.y = floatBitsToInt(uf_blockVS12[9].w + intBitsToFloat(PV0iz));
// 4
PV0ix = floatBitsToInt(-(intBitsToFloat(R0i.x)) + intBitsToFloat(R1i.x));
PV0iy = floatBitsToInt(intBitsToFloat(R4i.z) + -(uf_blockVS13[5].w));
R11i.z = floatBitsToInt(fract(intBitsToFloat(R127i.y)));
PV0iw = floatBitsToInt(intBitsToFloat(R4i.x) + -(uf_blockVS13[5].z));
PS0i = floatBitsToInt(1.0 / uf_blockVS13[5].x);
// 5
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(PS0i)));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(PS0i)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R5i.x)) + intBitsToFloat(R0i.x));
R4i.w = floatBitsToInt(intBitsToFloat(R127i.y) + -(intBitsToFloat(R11i.z)));
R1i.y = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0 + -(1.0));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R4i.w) * 6.0);
R3i.w = floatBitsToInt(intBitsToFloat(R127i.z) * 2.0 + -(1.0));
// 7
R1i.z = int(intBitsToFloat(PV0ix));
// 8
R0i.x = R1i.z + 0x3;
R0i.y = R1i.z + int(1);
R0i.z = R1i.z + 0x5;
R0i.w = R1i.z + 0x2;
R1i.w = R1i.z + 0x4;
}
if( activeMaskStackC[1] == true ) {
R1i.x = floatBitsToInt(textureLod(textureUnitVS0, vec3(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z)),intBitsToFloat(R2i.w)).x);
R2i.xy = floatBitsToInt(uf_blockVS4[R0i.z].xy);
R10i.xyzw = floatBitsToInt(uf_blockVS4[R1i.z].xyzw);
R9i.xyzw = floatBitsToInt(uf_blockVS4[R0i.y].xyzw);
R8i.xyzw = floatBitsToInt(uf_blockVS4[R0i.w].xyzw);
R7i.xyzw = floatBitsToInt(uf_blockVS4[R0i.x].xyzw);
R6i.xyz = floatBitsToInt(uf_blockVS4[R1i.w].xyz);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), uf_blockVS6[38].w));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), uf_blockVS11[0].y));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), uf_blockVS6[38].w));
// 1
R11i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS6[38].x, intBitsToFloat(PV0ix)));
R4i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS6[38].x, intBitsToFloat(PV0iz)));
// 2
predResult = (intBitsToFloat(R5i.x) > intBitsToFloat(0x3c23d70a));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(uf_blockVS13[7].x);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), uf_blockVS13[9].x));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), uf_blockVS13[9].y));
R0i.w = floatBitsToInt(uf_blockVS13[7].y + 1.0);
// 1
R0i.x = floatBitsToInt(uf_blockVS13[9].z + intBitsToFloat(PV0iz));
R0i.y = floatBitsToInt(uf_blockVS13[9].w + intBitsToFloat(PV0iw));
R0i.z = floatBitsToInt(roundEven(intBitsToFloat(PV0ix)));
}
if( activeMaskStackC[2] == true ) {
R0i.z = floatBitsToInt(textureLod(textureUnitVS0, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z)),intBitsToFloat(R0i.w)).x);
}
if( activeMaskStackC[2] == true ) {
// 0
PV0iy = floatBitsToInt(-(intBitsToFloat(R1i.x)) + intBitsToFloat(R0i.z));
// 1
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R5i.x)) + intBitsToFloat(R1i.x));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R4i.x) * intBitsToFloat(0x3eb33333));
PV0iy = floatBitsToInt(max(intBitsToFloat(R2i.x), intBitsToFloat(0x3727c5ac)));
PV0iz = floatBitsToInt(intBitsToFloat(R4i.z) * intBitsToFloat(0x3eb33333));
PV0iw = floatBitsToInt(uf_blockVS6[37].x);
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
PS0i = floatBitsToInt(uf_blockVS6[37].x * intBitsToFloat(0x3fb33333));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockVS11[0].y, intBitsToFloat(R1i.x)));
R127i.y = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0iw));
R127i.z = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PS0i));
R127i.w = floatBitsToInt(intBitsToFloat(R2i.x) * intBitsToFloat(0x3dcccccd));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R1i.y) + -(intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), uf_blockVS11[7].w));
R5i.z = R11i.x;
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PS1i)));
R126i.z = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R127i.z)));
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(0xbccccccd));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) + -3.0);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R127i.y)));
R5i.w = R4i.y;
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R126i.z)));
R123i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iw = floatBitsToInt(max(intBitsToFloat(PV1iz), -(intBitsToFloat(PV1iz))));
R5i.y = R4i.w;
// 5
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
R125i.z = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
R125i.z = clampFI32(R125i.z);
PV1iw = floatBitsToInt(-(intBitsToFloat(PV0iw)) + 0.5);
PV1iw = clampFI32(PV1iw);
// 6
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV0iy = floatBitsToInt(intBitsToFloat(R11i.z) + intBitsToFloat(PV1iw));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 7
R0i.x = ((intBitsToFloat(PV0iy) > intBitsToFloat(0x3eff7cee))?-1:0);
R126i.z = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
PV1iw = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 8
R127i.z = floatBitsToInt(sin((intBitsToFloat(PV1iw))/0.1591549367));
// 9
PS1i = floatBitsToInt(cos((intBitsToFloat(R126i.z))/0.1591549367));
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS1i)));
// 11
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R127i.w)));
// 12
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(0xbccccccd));
// 13
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R125i.z)));
// 14
R1i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV1iz));
R0i.w = 0x3f800000;
R0i.y = floatBitsToInt(uf_blockVS11[7].y);
}
if( activeMaskStackC[1] == true ) {
// 0
R11i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R1i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS1[0].x,uf_blockVS1[0].y,uf_blockVS1[0].z,uf_blockVS1[0].w)));
PV0iy = R11i.x;
PV0iz = R11i.x;
PV0iw = R11i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R1i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS1[1].x,uf_blockVS1[1].y,uf_blockVS1[1].z,uf_blockVS1[1].w)));
PV1ix = tempi.x;
R11i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R1i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS1[2].x,uf_blockVS1[2].y,uf_blockVS1[2].z,uf_blockVS1[2].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R11i.z = tempi.x;
PV0iw = tempi.x;
R0i.w = 0x3f800000;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(PV0ix),intBitsToFloat(R0i.w)),vec4(uf_blockVS1[8].x,uf_blockVS1[8].y,uf_blockVS1[8].z,uf_blockVS1[8].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS1[9].x,uf_blockVS1[9].y,uf_blockVS1[9].z,uf_blockVS1[9].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R125i.z = tempi.x;
PV0iw = tempi.x;
R1i.y = ((R0i.x == 0)?(PV1ix):(PV1ix));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS1[7].x,uf_blockVS1[7].y,uf_blockVS1[7].z,uf_blockVS1[7].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R127i.w = tempi.x;
PS1i = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R0i.y));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS1[10].x,uf_blockVS1[10].y,uf_blockVS1[10].z,uf_blockVS1[10].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R1i.z = ((R0i.x == 0)?(R125i.z):(PS1i));
// 7
R1i.x = R127i.w;
R123i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS8[8].x,intBitsToFloat(R4i.x)) + uf_blockVS8[9].x);
R123i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS8[8].y,intBitsToFloat(R4i.x)) + uf_blockVS8[9].y);
R1i.w = ((R0i.x == 0)?(PV0ix):(PV0ix));
R127i.y = floatBitsToInt(-(intBitsToFloat(R1i.y)));
// 8
R0i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS8[8].z,intBitsToFloat(R4i.z)) + intBitsToFloat(R123i.y));
R0i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS8[8].w,intBitsToFloat(R4i.z)) + intBitsToFloat(R123i.z));
R4i.z = R1i.z;
R4i.w = R1i.w;
R4i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(R1i.w));
R4i.x = floatBitsToInt(intBitsToFloat(R4i.x) / 2.0);
// 9
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS8[2].x,intBitsToFloat(R0i.x)) + uf_blockVS8[3].x);
R4i.y = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(R1i.w));
R4i.y = floatBitsToInt(intBitsToFloat(R4i.y) / 2.0);
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS8[2].y,intBitsToFloat(R0i.x)) + uf_blockVS8[3].y);
// 10
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS8[6].y,intBitsToFloat(R0i.x)) + uf_blockVS8[7].y);
R125i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS8[6].x,intBitsToFloat(R0i.x)) + uf_blockVS8[7].x);
// 11
R126i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS8[12].y,intBitsToFloat(R0i.x)) + uf_blockVS8[13].y);
R126i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS8[12].x,intBitsToFloat(R0i.x)) + uf_blockVS8[13].x);
// 12
R125i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS8[6].w,intBitsToFloat(R0i.y)) + intBitsToFloat(R127i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS8[2].z,intBitsToFloat(R0i.y)) + intBitsToFloat(R127i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS8[2].w,intBitsToFloat(R0i.y)) + intBitsToFloat(R127i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS8[6].z,intBitsToFloat(R0i.y)) + intBitsToFloat(R125i.z));
// 13
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS8[4].x,intBitsToFloat(R0i.x)) + uf_blockVS8[5].x);
R0i.z = R123i.y;
R126i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS8[4].y,intBitsToFloat(R0i.x)) + uf_blockVS8[5].y);
R0i.w = R123i.z;
// 14
backupReg0i = R127i.w;
R125i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS8[10].x,intBitsToFloat(R0i.x)) + uf_blockVS8[11].x);
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS8[10].y,intBitsToFloat(R0i.x)) + uf_blockVS8[11].y);
R2i.z = backupReg0i;
// 15
R123i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS8[12].w,intBitsToFloat(R0i.y)) + intBitsToFloat(R126i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS8[12].z,intBitsToFloat(R0i.y)) + intBitsToFloat(R126i.y));
R2i.w = R125i.x;
R2i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS8[4].z,intBitsToFloat(R0i.y)) + intBitsToFloat(R127i.x));
// 16
R3i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS8[10].z,intBitsToFloat(R0i.y)) + intBitsToFloat(R125i.z));
R2i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS8[4].w,intBitsToFloat(R0i.y)) + intBitsToFloat(R126i.w));
R3i.z = R123i.y;
R3i.w = R123i.x;
R3i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS8[10].w,intBitsToFloat(R0i.y)) + intBitsToFloat(R127i.w));
}
// export
SET_POSITION(vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
// export
passParameterSem2 = vec4(intBitsToFloat(R8i.x), intBitsToFloat(R8i.y), intBitsToFloat(R8i.z), intBitsToFloat(R8i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.y), intBitsToFloat(R7i.z), intBitsToFloat(R7i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w));
// export
passParameterSem9 = vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.z), intBitsToFloat(R5i.w));
// export
passParameterSem10 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.z), intBitsToFloat(R4i.w));
// export
passParameterSem5 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.z), intBitsToFloat(R6i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));
}
