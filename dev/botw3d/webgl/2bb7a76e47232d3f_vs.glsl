#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 2bb7a76e47232d3f
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
UNIFORM_BUFFER_LAYOUT(6, 0, 2) uniform uniformBlockVS6
{
vec4 uf_blockVS6[19];
};


UNIFORM_BUFFER_LAYOUT(7, 0, 3) uniform uniformBlockVS7
{
vec4 uf_blockVS7[4096];
};


UNIFORM_BUFFER_LAYOUT(8, 0, 4) uniform uniformBlockVS8
{
vec4 uf_blockVS8[11];
};


UNIFORM_BUFFER_LAYOUT(13, 0, 5) uniform uniformBlockVS13
{
vec4 uf_blockVS13[29];
};


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

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem2;
out vec4 passParameterSem3;
out vec4 passParameterSem8;
out vec4 passParameterSem11;
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
attrDecoder = attrDataSem4;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyz = attrDataSem3.xyz;
attrDecoder.xyz = uvec3((attrDecoder.xyz>>24)|((attrDecoder.xyz>>8)&0xFF00u)|((attrDecoder.xyz<<8)&0xFF0000u)|((attrDecoder.xyz<<24)));
attrDecoder.w = uint(0);
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), 0x3f800000);
attrDecoder = attrDataSem8;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem1;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem2;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem6;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem5;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem0;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R9i.z = floatBitsToInt(-(intBitsToFloat(R8i.y)) + 1.0);
R1i.w = 0;
R4i.w = floatBitsToInt(1.0);
// 1
R5i.w = floatBitsToInt(-(intBitsToFloat(R3i.w)) + uf_blockVS8[2].x);
R3i.w = floatBitsToInt(-(intBitsToFloat(R8i.x)) + 1.0);
// 2
predResult = (0.0 > intBitsToFloat(R5i.w));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R13i.x = 0;
R13i.y = 0;
R13i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R11i.x = 0;
// 1
R8i.w = R4i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R8i.w = R1i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R8i.w == 0);
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
R10i.x = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R5i.w) >= intBitsToFloat(R10i.x));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R13i.x = 0;
R13i.y = 0;
R13i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R11i.x = 0;
// 1
R1i.w = R4i.w;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R1i.w == 0);
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
tempi.x = floatBitsToInt(dot(vec4(uf_blockVS8[8].x,uf_blockVS8[8].y,uf_blockVS8[8].z,intBitsToFloat(0x80000000)),vec4(uf_blockVS8[8].x,uf_blockVS8[8].y,uf_blockVS8[8].z,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(uf_blockVS8[9].x,uf_blockVS8[9].y,uf_blockVS8[9].z,intBitsToFloat(0x80000000)),vec4(uf_blockVS8[9].x,uf_blockVS8[9].y,uf_blockVS8[9].z,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R0i.y = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 2
tempi.x = floatBitsToInt(dot(vec4(uf_blockVS8[10].x,uf_blockVS8[10].y,uf_blockVS8[10].z,intBitsToFloat(0x80000000)),vec4(uf_blockVS8[10].x,uf_blockVS8[10].y,uf_blockVS8[10].z,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.w = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 3
R0i.x = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 4
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
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R0i.y));
// 1
R12i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS8[8].x, intBitsToFloat(R127i.y)));
R13i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS8[9].x, intBitsToFloat(R127i.y)));
// 2
R14i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS8[10].x, intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R12i.x = 0;
// 1
R14i.x = R12i.x;
// 2
R13i.x = R12i.x;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
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
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R0i.w));
// 1
R12i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS8[8].y, intBitsToFloat(R127i.x)));
R13i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS8[9].y, intBitsToFloat(R127i.x)));
// 2
R14i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS8[10].y, intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R14i.y = 0;
R13i.y = 0;
// 1
R12i.y = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (intBitsToFloat(R0i.x) > 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R0i.x));
// 1
R12i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS8[8].z, intBitsToFloat(R127i.x)));
R13i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS8[9].z, intBitsToFloat(R127i.x)));
// 2
R14i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS8[10].z, intBitsToFloat(R127i.x)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R14i.z = 0;
R13i.z = 0;
// 1
R12i.z = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), uf_blockVS7[96].z));
PV0iz = floatBitsToInt(max(intBitsToFloat(R6i.x), 0.0));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), uf_blockVS7[96].y));
// 1
PV1iy = floatBitsToInt(min(intBitsToFloat(PV0iz), 0.0));
R10i.z = floatBitsToInt(uf_blockVS8[2].w + intBitsToFloat(R5i.w));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), uf_blockVS8[3].w));
// 2
R0i.x = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(PV1iy));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), uf_blockVS7[96].x));
// 4
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), uf_blockVS8[3].y));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), uf_blockVS8[3].z));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R9i.x = ((uf_blockVS7[12].x == 1.0)?-1:0);
R0i.y = floatBitsToInt(-(uf_blockVS7[12].x) + 1.0);
// 1
predResult = (R9i.x != 0);
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
PV1iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].w, intBitsToFloat(PV0ix)));
// 2
R7i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].x, intBitsToFloat(PV1iw)));
R7i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].y, intBitsToFloat(PV1iw)));
R7i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].z, intBitsToFloat(PV1iw)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
tempResultf = max(0.0, abs(uf_blockVS7[12].x));
tempResultf = log2(tempResultf);
PS0i = floatBitsToInt(tempResultf);
// 1
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f317218));
tempResultf = max(0.0, uf_blockVS7[12].x);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(PS1i)));
R127i.y = ((uf_blockVS7[12].x == 0.0)?(0xff7fffff):(PV1iz));
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
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].w, intBitsToFloat(PV1ix)));
// 9
R7i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].x, intBitsToFloat(PV0iw)));
R7i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].y, intBitsToFloat(PV0iw)));
R7i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].z, intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(R6i.y));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R0i.w)));
PV0iz = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(R6i.z));
R0i.w = 0x3f800000;
tempResultf = max(0.0, uf_blockVS7[12].x);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) * 0.5);
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) * 0.5);
PV1iw = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(R6i.z));
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R0i.y));
// 2
R0i.x = floatBitsToInt(intBitsToFloat(R6i.x) + -(0.5));
R126i.y = floatBitsToInt(intBitsToFloat(PV1iy) + -(0.5));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) * 2.0);
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) * 0.5);
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + -(0.5));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
// 3
R127i.x = floatBitsToInt(intBitsToFloat(PV0iz) + -(0.5));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
R9i.y = floatBitsToInt(intBitsToFloat(R6i.y) + -(0.5));
R8i.z = floatBitsToInt(intBitsToFloat(R6i.z) + -(0.5));
PV1iw = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), uf_blockVS7[115].x));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(R127i.y));
R0i.z = floatBitsToInt(intBitsToFloat(PS1i) + uf_blockVS7[114].x);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), uf_blockVS7[115].y));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), uf_blockVS7[115].z));
R0i.y = floatBitsToInt(uf_blockVS7[114].y + intBitsToFloat(PV0iw));
R123i.z = ((R9i.x == 0)?(PV0ix):(R10i.z));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R123i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R123i.z)));
R3i.z = floatBitsToInt(uf_blockVS7[114].z + intBitsToFloat(PV1ix));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R123i.z)));
PS0i = floatBitsToInt(uf_blockVS7[5].x) & 0x10000;
// 7
R127i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x20000;
PV1iy = floatBitsToInt(intBitsToFloat(R7i.z) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(PV0iy));
PS1i = floatBitsToInt(float(PS0i));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(PV1iz)));
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(PV1iy)));
PS0i = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
// 9
R9i.x = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(PV0ix));
R2i.y = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(PV0iz));
R7i.z = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(float(R127i.x));
// 10
PV0ix = floatBitsToInt(uf_blockVS7[5].x) & 0x40000;
PV0iy = R6i.y;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R127i.y = int(intBitsToFloat(PV1iw));
// 11
PV1ix = 0 - R127i.y;
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iw)));
R127i.z = R6i.z;
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 2.0);
R127i.w = floatBitsToInt(floor(intBitsToFloat(PV0iy)));
PS1i = floatBitsToInt(float(PV0ix));
// 12
R126i.x = floatBitsToInt((intBitsToFloat(R127i.w) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iz = max(R127i.y, PV1ix);
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R127i.x = int(intBitsToFloat(PV1iy));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(R127i.w))?1.0:0.0);
PV1iz = 0 - R127i.x;
PV1iw = floatBitsToInt(floor(intBitsToFloat(R127i.z)));
R127i.w = floatBitsToInt(float(PV0iz));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
// 14
PV0ix = floatBitsToInt((intBitsToFloat(PV1iw) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PV1iw))?1.0:0.0);
PV0iz = floatBitsToInt(intBitsToFloat(R126i.x) + -(intBitsToFloat(PV1iy)));
PV0iw = max(R127i.x, PV1iz);
R127i.z = int(intBitsToFloat(PV1ix));
// 15
R7i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.w)), intBitsToFloat(PV0iz)));
PV1iy = 0 - R127i.z;
PV1iz = R6i.x;
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 2.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iy)));
PS1i = floatBitsToInt(float(PV0iw));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 16
R2i.x = floatBitsToInt(floor(intBitsToFloat(PV1iz)));
PV0iy = max(R127i.z, PV1iy);
R2i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(PV1iw)));
// 17
R3i.x = floatBitsToInt(float(PV0iy));
R3i.x = floatBitsToInt(intBitsToFloat(R3i.x) * 2.0);
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R2i.y),intBitsToFloat(R7i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS8[5].x,uf_blockVS8[5].y,uf_blockVS8[5].z,uf_blockVS8[5].w)));
PV0ix = tempi.x;
R7i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R7i.x)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R7i.x)));
PV1iz = floatBitsToInt((intBitsToFloat(R2i.x) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((0.0 > intBitsToFloat(R2i.x))?1.0:0.0);
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R2i.z)));
// 2
R127i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iw)));
R126i.z = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(PS1i));
R126i.w = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R2i.z)));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), uf_blockVS7[113].y));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), uf_blockVS7[113].x));
PV1iz = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.x)), intBitsToFloat(PV0iy)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), uf_blockVS7[113].z));
// 4
R126i.x = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PV1iw)));
R125i.w = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PV1ix));
tempResultf = max(0.0, uf_blockVS7[114].w);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 5
R127i.x = floatBitsToInt(intBitsToFloat(R3i.z) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PS0i)));
R127i.z = ((uf_blockVS7[114].w == 1.0)?-1:0);
PV1iw = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0iz));
R127i.w = floatBitsToInt(-(uf_blockVS7[114].w) + 1.0);
// 6
R125i.x = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R127i.y));
R1i.w = R7i.y;
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 7
PV1iz = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R2i.w = floatBitsToInt(intBitsToFloat(R10i.y) * 0.0 + 1.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 8
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(PS1i));
// 9
R123i.z = ((R127i.z == 0)?(PV0ix):(R5i.w));
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R123i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R123i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R123i.z)));
// 11
PV1iy = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(PV0iy));
// 12
R123i.x = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.w = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
// 13
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
// 14
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.w = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 15
R126i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R127i.y = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R126i.z = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R2i.y),intBitsToFloat(R7i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS8[4].x,uf_blockVS8[4].y,uf_blockVS8[4].z,uf_blockVS8[4].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R4i.w = tempi.x;
R127i.x = floatBitsToInt(sin((intBitsToFloat(R127i.y))/0.1591549367));
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R2i.y),intBitsToFloat(R7i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS8[6].x,uf_blockVS8[6].y,uf_blockVS8[6].z,uf_blockVS8[6].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R8i.w = tempi.x;
R127i.z = floatBitsToInt(cos((intBitsToFloat(R127i.y))/0.1591549367));
// 18
R125i.w = floatBitsToInt(sin((intBitsToFloat(R126i.z))/0.1591549367));
// 19
R3i.x = 0x3f800000;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R125i.w)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R125i.w)));
R127i.y = floatBitsToInt(cos((intBitsToFloat(R126i.z))/0.1591549367));
// 20
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R127i.y)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.y)));
R124i.x = floatBitsToInt(sin((intBitsToFloat(R126i.x))/0.1591549367));
// 21
R9i.x = floatBitsToInt(-(intBitsToFloat(R124i.x)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R125i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R125i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R126i.y)));
R126i.z = floatBitsToInt(cos((intBitsToFloat(R126i.x))/0.1591549367));
// 22
PV0ix = floatBitsToInt(-(intBitsToFloat(R125i.x)) + intBitsToFloat(PV1iw));
R1i.y = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV1iy));
R3i.z = floatBitsToInt(-(intBitsToFloat(R126i.y)) + intBitsToFloat(PV1iz));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R126i.z)));
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R126i.z)));
// 23
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R126i.w)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R10i.y)));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R126i.z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R126i.z)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PV0ix)));
// 24
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R10i.y)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R0i.x)) + intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV1ix));
// 25
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R9i.x)) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PV0iw)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R10i.y)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R1i.y)) + intBitsToFloat(R123i.y));
// 26
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R0i.w)) + intBitsToFloat(R123i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R7i.z)) + intBitsToFloat(PV1iy));
// 27
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R3i.z)) + intBitsToFloat(R123i.w));
// 28
R16i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),intBitsToFloat(R12i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.w),intBitsToFloat(R125i.z),0.0)));
PV0iy = R16i.x;
PV0iz = R16i.x;
PV0iw = R16i.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.z), intBitsToFloat(R125i.z)));
// 29
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.w),1.0,0.0)));
PV1ix = tempi.x;
R16i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.z), intBitsToFloat(R125i.z)));
// 30
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.w),1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R16i.z = tempi.x;
PV0iw = tempi.x;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(uf_blockVS7[13].y);
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
PV0iy = floatBitsToInt(uf_blockVS7[13].x);
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
R4i.z = floatBitsToInt(uf_blockVS7[60].x);
R7i.w = floatBitsToInt(uf_blockVS7[60].y);
// 1
backupReg0i = R5i.x;
R5i.x = floatBitsToInt(uf_blockVS7[60].z);
PV1iy = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV0iy));
// 2
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(PV1iz)));
PV0iy = floatBitsToInt((0.0 > uf_blockVS7[8].y)?1.0:0.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt((uf_blockVS7[8].y > 0.0)?1.0:0.0);
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R0i.x)) + intBitsToFloat(R2i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R9i.x)) + intBitsToFloat(R1i.x));
R126i.z = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iy)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R7i.z)) + intBitsToFloat(R1i.z));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[8].y);
// 4
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R0i.w)) + intBitsToFloat(R123i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R1i.y)) + intBitsToFloat(R123i.x));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R3i.z)) + intBitsToFloat(R123i.w));
PV0iw = floatBitsToInt(intBitsToFloat(R5i.w) * intBitsToFloat(PS1i));
R0i.x = floatBitsToInt(1.0 / intBitsToFloat(R10i.x));
// 5
R4i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),intBitsToFloat(R12i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R125i.z),intBitsToFloat(R2i.w))));
PV1iy = R4i.x;
PV1iz = R4i.x;
PV1iw = R4i.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),uf_blockVS7[9].z) + intBitsToFloat(PV0iw));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R125i.z),intBitsToFloat(R2i.w))));
PV0ix = tempi.x;
R4i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.y = floatBitsToInt(fract(intBitsToFloat(R122i.x)));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(R14i.z),intBitsToFloat(R8i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R125i.z),intBitsToFloat(R2i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R8i.z = tempi.x;
PV1iw = tempi.x;
R126i.w = floatBitsToInt(intBitsToFloat(R5i.w) * intBitsToFloat(R0i.x));
// 8
R127i.x = floatBitsToInt(-(uf_blockVS7[68].x) + uf_blockVS7[69].x);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R126i.y)));
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
// 9
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PV0iz)) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(-(uf_blockVS7[68].w) + uf_blockVS7[69].w);
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R123i.x) + -(uf_blockVS7[69].w));
R126i.w = floatBitsToInt(intBitsToFloat(R123i.x) + -(uf_blockVS7[68].w));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 11
backupReg0i = R127i.x;
R127i.x = ((intBitsToFloat(PV0ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.y = ((intBitsToFloat(R126i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iw = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(PS0i));
// 12
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.y)) + 1.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PV1iw)) + uf_blockVS7[68].x);
// 13
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[68].x, intBitsToFloat(PV0iy)));
// 14
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(PV1iy)) + intBitsToFloat(PV1iw));
// 15
R2i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[69].x,intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
R13i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R8i.z),intBitsToFloat(R3i.x)),vec4(uf_blockVS6[8].x,uf_blockVS6[8].y,uf_blockVS6[8].z,uf_blockVS6[8].w)));
PV0iy = R13i.x;
PV0iz = R13i.x;
PV0iw = R13i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R8i.z),intBitsToFloat(R3i.x)),vec4(uf_blockVS6[9].x,uf_blockVS6[9].y,uf_blockVS6[9].z,uf_blockVS6[9].w)));
PV1ix = tempi.x;
R13i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R8i.z),intBitsToFloat(R3i.x)),vec4(uf_blockVS6[10].x,uf_blockVS6[10].y,uf_blockVS6[10].z,uf_blockVS6[10].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R13i.z = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R8i.z),intBitsToFloat(R3i.x)),vec4(uf_blockVS6[11].x,uf_blockVS6[11].y,uf_blockVS6[11].z,uf_blockVS6[11].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R13i.w = tempi.x;
// 4
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), uf_blockVS8[0].x));
PV0iy = PV1ix;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), uf_blockVS8[0].z));
R15i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), uf_blockVS8[0].w));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), uf_blockVS8[0].y));
// 5
R123i.x = floatBitsToInt(intBitsToFloat(R13i.z) * 0.0 + intBitsToFloat(PV0iy));
R14i.z = floatBitsToInt(intBitsToFloat(R13i.z) * 0.5 + intBitsToFloat(PV0iy));
R14i.w = floatBitsToInt(intBitsToFloat(R13i.z) * 0.0 + intBitsToFloat(R13i.w));
// 6
R14i.x = floatBitsToInt(intBitsToFloat(R13i.x) * 0.5 + intBitsToFloat(R123i.x));
R14i.y = floatBitsToInt(intBitsToFloat(R13i.y) * -(0.5) + intBitsToFloat(R123i.x));
R1i.w = floatBitsToInt(1.0 / intBitsToFloat(R14i.w));
// 7
PV1iz = floatBitsToInt(intBitsToFloat(R14i.z) * intBitsToFloat(R1i.w));
// 8
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),uf_blockVS6[18].w) + -(uf_blockVS6[18].y));
// 9
R10i.x = floatBitsToInt(uf_blockVS6[17].x);
R10i.y = floatBitsToInt(uf_blockVS6[17].y);
R10i.z = floatBitsToInt(uf_blockVS6[17].z);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.y));
// 10
R4i.w = floatBitsToInt(-(uf_blockVS6[18].z) * intBitsToFloat(PS1i));
// 11
PV1ix = ((intBitsToFloat(R6i.w) > 0.5)?-1:0);
PV1iy = ((intBitsToFloat(R6i.z) > 0.5)?-1:0);
PV1iz = ((intBitsToFloat(R6i.y) > 0.5)?-1:0);
PV1iw = ((intBitsToFloat(R6i.x) > 0.5)?-1:0);
// 12
R3i.x = ((PV1iy == 0)?(R8i.x):(R3i.w));
R1i.y = ((PV1iz == 0)?(R8i.y):(R9i.z));
R3i.z = ((PV1iw == 0)?(R8i.x):(R3i.w));
R0i.w = ((PV1ix == 0)?(R8i.y):(R9i.z));
}
if( activeMaskStackC[3] == true ) {
// 0
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), uf_blockVS7[59].x));
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), uf_blockVS7[59].x));
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), uf_blockVS7[59].x));
R2i.w = floatBitsToInt(uf_blockVS7[76].x);
R5i.x = floatBitsToInt(uf_blockVS7[76].y);
// 1
R4i.z = floatBitsToInt(uf_blockVS7[76].z);
R7i.w = floatBitsToInt(uf_blockVS7[84].x);
}
if( activeMaskStackC[3] == true ) {
// 0
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), uf_blockVS8[1].x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), uf_blockVS8[1].y));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), uf_blockVS8[1].z));
R17i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), uf_blockVS8[1].w));
// 1
R17i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R1i.x)));
R17i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R0i.y)));
R17i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R0i.z)));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(uf_blockVS7[5].x) & 0x100000;
PV0iy = floatBitsToInt(uf_blockVS7[5].x) & 0x80000;
PV0iz = floatBitsToInt(uf_blockVS7[5].x) & 0x400000;
PV0iw = floatBitsToInt(uf_blockVS7[5].x) & 0x200000;
PS0i = floatBitsToInt(uf_blockVS7[5].y) & int(1);
// 1
PV1ix = (PV0iy == 0x80000)?-1:0;
PV1iy = (PV0iz == 0x400000)?-1:0;
PV1iz = (PV0iw == 0x200000)?-1:0;
PV1iw = (PV0ix == 0x100000)?-1:0;
R5i.x = (int(1) != PS0i)?-1:0;
// 2
backupReg0i = R8i.x;
R8i.x = ((PV1iw == 0)?(R8i.y):(R1i.y));
R2i.y = ((PV1ix == 0)?(backupReg0i):(R3i.z));
R5i.z = ((PV1iy == 0)?(R8i.y):(R0i.w));
R7i.w = ((PV1iz == 0)?(backupReg0i):(R3i.x));
R125i.w = int(uf_blockVS7[17].x);
// 3
R127i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x20;
PV1iy = floatBitsToInt(uf_blockVS7[5].x) & 0x10;
R126i.z = floatBitsToInt(uf_blockVS7[5].x) & 0x40;
R126i.w = floatBitsToInt(uf_blockVS7[5].x) & 0x80;
R125i.z = int(uf_blockVS7[17].y);
// 4
R125i.y = int(-1) + R125i.w;
PS0i = floatBitsToInt(float(PV1iy));
// 5
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(float(R127i.x));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(R126i.z));
// 7
R125i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x2000000;
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R127i.x = int(intBitsToFloat(PV0iy));
// 8
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
PV0iw = 0 - R127i.x;
R124i.x = int(intBitsToFloat(PV1iy));
// 9
R126i.z = max(R127i.x, PV0iw);
PV1iw = 0 - R124i.x;
R127i.x = int(intBitsToFloat(PV0iy));
// 10
R1i.z = max(R124i.x, PV1iw);
PV0iw = 0 - R127i.x;
PS0i = floatBitsToInt(float(R126i.w));
// 11
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R4i.z = max(R127i.x, PV0iw);
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R127i.y = floatBitsToInt(float(R125i.w));
// 12
backupReg0i = R125i.z;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(R127i.y)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1ix)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R127i.y)));
R126i.y = floatBitsToInt(float(backupReg0i));
// 13
PV1iw = floatBitsToInt(intBitsToFloat(R0i.x) * intBitsToFloat(PV0ix));
R127i.x = int(intBitsToFloat(PV0iy));
// 14
PV0iw = 0 - R127i.x;
PS0i = int(intBitsToFloat(PV1iw));
// 15
R127i.z = max(R127i.x, PV0iw);
R8i.y = R126i.z * PS0i;
// 16
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.y));
// 17
PV1iw = floatBitsToInt(intBitsToFloat(R5i.w) * intBitsToFloat(PS0i));
R3i.x = floatBitsToInt(float(R125i.w));
// 18
R2i.w = floatBitsToInt(abs(intBitsToFloat(R3i.x)));
R124i.z = int(intBitsToFloat(PV1iw));
// 19
PS1i = floatBitsToInt(float(R124i.z));
// 20
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(PS1i));
R126i.w = floatBitsToInt(float(R124i.z));
// 21
R126i.z = floatBitsToInt(abs(intBitsToFloat(R126i.w)));
R123i.w = ((intBitsToFloat(PV0ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
R7i.z = floatBitsToInt(1.0 / abs(intBitsToFloat(R3i.x)));
// 22
PV0iy = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R126i.w)), intBitsToFloat(R7i.z)));
PS0i = int(intBitsToFloat(R123i.w));
// 23
PV1ix = floatBitsToInt(trunc(intBitsToFloat(PV0iy)));
R127i.y = int(1) - PS0i;
R3i.z = PS0i * R125i.y;
// 24
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1ix)),intBitsToFloat(R2i.w)) + intBitsToFloat(R126i.z));
PS0i = floatBitsToInt(float(R125i.x));
// 25
PV1ix = floatBitsToInt(-(abs(intBitsToFloat(R3i.x))) + intBitsToFloat(R125i.y));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(R125i.y) >= abs(intBitsToFloat(R3i.x)))?1.0:0.0);
R127i.w = int(intBitsToFloat(R125i.z));
// 26
backupReg0i = R127i.z;
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iy)));
R127i.z = ((intBitsToFloat(PV1iw) == 0.0)?(R125i.y):(PV1ix));
R0i.x = backupReg0i * R127i.w;
// 27
PV1iy = floatBitsToInt(abs(intBitsToFloat(R3i.x)) + intBitsToFloat(R127i.z));
R125i.w = int(intBitsToFloat(PV0ix));
// 28
R123i.x = ((-(intBitsToFloat(R127i.z)) > 0.0)?(PV1iy):(R127i.z));
PV0iz = 0 - R125i.w;
// 29
PV1iy = max(R125i.w, PV0iz);
R123i.w = ((-(intBitsToFloat(R126i.w)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.x)))):(R123i.x));
// 30
R123i.z = ((intBitsToFloat(R3i.x) == 0.0)?(R126i.w):(R123i.w));
PS0i = PV1iy * R127i.w;
// 31
R1i.y = R124i.z + PS0i;
PS1i = int(intBitsToFloat(R123i.z));
// 32
R0i.w = R127i.y * PS1i;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iy = R0i.w + R3i.z;
R127i.w = R4i.z * R1i.y;
// 1
PS1i = R1i.z * PV0iy;
// 2
PV0ix = PS1i + R8i.y;
// 3
PV1iw = R127i.w + PV0ix;
// 4
PV0iz = R0i.x + PV1iw;
// 5
R125i.y = floatBitsToInt(float(PV0iz));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), abs(intBitsToFloat(R125i.y))));
R124i.z = floatBitsToInt(abs(intBitsToFloat(R125i.y)));
// 7
PV1iw = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
// 8
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iw)),intBitsToFloat(R2i.w)) + intBitsToFloat(R124i.z));
// 9
PV1ix = floatBitsToInt(-(abs(intBitsToFloat(R3i.x))) + intBitsToFloat(R127i.y));
PV1iw = floatBitsToInt((intBitsToFloat(R127i.y) >= abs(intBitsToFloat(R3i.x)))?1.0:0.0);
// 10
R124i.z = ((intBitsToFloat(PV1iw) == 0.0)?(R127i.y):(PV1ix));
// 11
PV1iy = floatBitsToInt(abs(intBitsToFloat(R3i.x)) + intBitsToFloat(R124i.z));
// 12
R123i.x = ((-(intBitsToFloat(R124i.z)) > 0.0)?(PV1iy):(R124i.z));
// 13
R123i.w = ((-(intBitsToFloat(R125i.y)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.x)))):(R123i.x));
// 14
R123i.z = ((intBitsToFloat(R3i.x) == 0.0)?(R125i.y):(R123i.w));
// 15
R125i.y = int(intBitsToFloat(R123i.z));
// 16
R125i.x = floatBitsToInt(float(R125i.y));
// 17
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(R125i.x))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(R125i.x) > 0.0)?1.0:0.0);
R126i.w = floatBitsToInt(float(R125i.y));
// 18
R127i.x = floatBitsToInt(abs(intBitsToFloat(R126i.w)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(abs(intBitsToFloat(R126i.w)) * 0.25);
// 19
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * 0.5 + intBitsToFloat(R125i.x));
PV1iy = floatBitsToInt(trunc(intBitsToFloat(PV0iz)));
// 20
PV0ix = floatBitsToInt(intBitsToFloat(R123i.x) * 0.25);
R127i.w = floatBitsToInt(-(intBitsToFloat(PV1iy)) * 4.0 + intBitsToFloat(R127i.x));
// 21
PV1ix = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
PV1iy = floatBitsToInt((intBitsToFloat(R127i.w) >= 4.0)?1.0:0.0);
PV1iz = floatBitsToInt(intBitsToFloat(R127i.w) + -4.0);
// 22
R127i.x = ((intBitsToFloat(PV1iy) == 0.0)?(R127i.w):(PV1iz));
PS0i = int(intBitsToFloat(PV1ix));
// 23
R3i.x = PS0i + 0x12;
PV1iw = floatBitsToInt(intBitsToFloat(R127i.x) + 4.0);
PS1i = int(uf_blockVS7[48].z);
// 24
R123i.z = ((-(intBitsToFloat(R127i.x)) > 0.0)?(PV1iw):(R127i.x));
R9i.x = floatBitsToInt(float(PS1i));
// 25
R123i.y = ((-(intBitsToFloat(R126i.w)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.z)))):(R123i.z));
// 26
PS0i = int(intBitsToFloat(R123i.y));
// 27
R1i.x = floatBitsToInt(abs(intBitsToFloat(R9i.x)));
R125i.y = 0xfffffffd + PS0i;
R124i.z = 0xfffffffe + PS0i;
PV1iw = int(-1) + PS0i;
PS1i = floatBitsToInt(float(PS0i));
// 28
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(PV1iw));
// 29
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PS1i = floatBitsToInt(float(R124i.z));
// 30
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iz)));
R126i.w = int(intBitsToFloat(PV1ix));
// 31
PV1ix = 0 - R126i.w;
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iy)));
R124i.z = int(intBitsToFloat(PV0iw));
// 32
PV0ix = 0 - R124i.z;
PV0iy = max(R126i.w, PV1ix);
R127i.y = int(intBitsToFloat(PV1iz));
// 33
PV1ix = max(R124i.z, PV0ix);
R1i.y = int(1) - PV0iy;
PV1iz = 0 - R127i.y;
PS1i = floatBitsToInt(float(R125i.y));
// 34
R0i.x = int(1) - PV1ix;
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = max(R127i.y, PV1iz);
R5i.y = floatBitsToInt(1.0 / abs(intBitsToFloat(R9i.x)));
// 35
PV1iy = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iz)));
R7i.z = int(1) - PV0iw;
// 36
R127i.x = int(intBitsToFloat(PV1iy));
// 37
PV1iw = 0 - R127i.x;
// 38
PV0iz = max(R127i.x, PV1iw);
// 39
R8i.y = int(1) - PV0iz;
}
if( activeMaskStackC[3] == true ) {
R3i.xyzw = floatBitsToInt(uf_blockVS7[R3i.x].xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), uf_blockVS7[45].y));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
PV0iy = floatBitsToInt(uf_blockVS7[44].w + uf_blockVS7[45].y);
PV0iz = floatBitsToInt(uf_blockVS7[44].z + uf_blockVS7[45].x);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), uf_blockVS7[45].x));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
R127i.x = R8i.y * R3i.w;
// 1
PV1ix = floatBitsToInt(uf_blockVS7[46].x + uf_blockVS7[46].z);
PV1iy = floatBitsToInt(-(intBitsToFloat(PV0iw)) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(-(intBitsToFloat(PV0ix)) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(uf_blockVS7[46].y + uf_blockVS7[46].w);
R126i.w = R7i.z * R3i.z;
// 2
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),uf_blockVS7[46].z) + intBitsToFloat(PV1ix));
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.w)),uf_blockVS7[44].x) + -(intBitsToFloat(PV1iy)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),uf_blockVS7[46].w) + intBitsToFloat(PV1iw));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),uf_blockVS7[44].y) + intBitsToFloat(PV1iz));
R124i.z = R0i.x * R3i.y;
// 3
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),uf_blockVS7[45].w) + intBitsToFloat(R123i.z));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),uf_blockVS7[45].z) + intBitsToFloat(R123i.x));
PS1i = R1i.y * R3i.x;
// 4
PV0ix = R124i.z + PS1i;
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(R9i.x));
// 5
PV1iw = R126i.w + PV0ix;
PS1i = floatBitsToInt(1.0 / uf_blockVS7[48].z);
// 6
R126i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].x, intBitsToFloat(PS1i)));
R124i.z = R127i.x + PV1iw;
PS0i = floatBitsToInt(1.0 / uf_blockVS7[48].w);
// 7
R125i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].y, intBitsToFloat(PS0i)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R126i.x)) + -(0.5));
R127i.z = ((R5i.x == 0)?(0):(int(1)));
R126i.w = floatBitsToInt(float(R124i.z));
// 8
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R125i.x)) + -(0.5));
R127i.y = (R127i.z == int(1))?-1:0;
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(R126i.w))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(R126i.w) > 0.0)?1.0:0.0);
R124i.z = floatBitsToInt(float(R124i.z));
// 9
backupReg0i = R127i.z;
PV1ix = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R124i.z)), intBitsToFloat(R5i.y)));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
R127i.z = floatBitsToInt(abs(intBitsToFloat(R124i.z)));
PV1iw = (backupReg0i == 0x2)?-1:0;
R126i.z = ((R127i.y == 0)?(R6i.x):(R6i.y));
// 10
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * 0.5 + intBitsToFloat(R126i.w));
R123i.y = ((PV1iw == 0)?(R6i.y):(R6i.x));
R123i.z = ((PV1iw == 0)?(R6i.x):(R6i.z));
PV0iw = floatBitsToInt(trunc(intBitsToFloat(PV1ix)));
R5i.y = ((R127i.y == 0)?(R6i.y):(R6i.z));
// 11
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iw)),intBitsToFloat(R1i.x)) + intBitsToFloat(R127i.z));
R125i.y = ((R127i.y == 0)?(R123i.z):(R6i.y));
PV1iz = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(R127i.w));
R126i.w = ((R127i.y == 0)?(R123i.y):(R6i.z));
PS1i = int(uf_blockVS7[53].z);
// 12
PV0iy = floatBitsToInt(trunc(intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt((intBitsToFloat(R127i.x) >= abs(intBitsToFloat(R9i.x)))?1.0:0.0);
PV0iw = floatBitsToInt(-(abs(intBitsToFloat(R9i.x))) + intBitsToFloat(R127i.x));
R127i.w = floatBitsToInt(float(PS1i));
// 13
PV1ix = floatBitsToInt((0.0 >= abs(intBitsToFloat(R127i.w)))?1.0:0.0);
R127i.y = ((intBitsToFloat(PV0iz) == 0.0)?(R127i.x):(PV0iw));
PV1iz = floatBitsToInt(-(abs(intBitsToFloat(R127i.w))) + 0.0);
PS1i = int(intBitsToFloat(PV0iy));
// 14
R127i.x = ((intBitsToFloat(PV1ix) == 0.0)?(0):(PV1iz));
PV0iy = floatBitsToInt(abs(intBitsToFloat(R9i.x)) + intBitsToFloat(R127i.y));
PS0i = floatBitsToInt(float(PS1i));
// 15
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.x)),intBitsToFloat(PS0i)) + intBitsToFloat(R125i.w));
PV1iy = floatBitsToInt(abs(intBitsToFloat(R127i.w)) + intBitsToFloat(R127i.x));
R123i.w = ((-(intBitsToFloat(R127i.y)) > 0.0)?(PV0iy):(R127i.y));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 16
backupReg0i = R123i.x;
R123i.x = ((-(intBitsToFloat(R127i.x)) > 0.0)?(PV1iy):(R127i.x));
R123i.y = ((-(intBitsToFloat(R124i.z)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.w)))):(R123i.w));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R124i.x)) + -(intBitsToFloat(backupReg0i)));
PV0iw = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
// 17
R127i.x = ((intBitsToFloat(R127i.w) == 0.0)?(0):(R123i.x));
R123i.y = ((intBitsToFloat(R9i.x) == 0.0)?(R124i.z):(R123i.y));
R124i.z = floatBitsToInt(trunc(intBitsToFloat(PV0iw)));
// 18
PS0i = int(intBitsToFloat(R123i.y));
// 19
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockVS7[50].y, intBitsToFloat(R126i.w)));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
PV1iy = floatBitsToInt(uf_blockVS7[49].w + uf_blockVS7[50].y);
PV1iz = floatBitsToInt(uf_blockVS7[49].z + uf_blockVS7[50].x);
PV1iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[50].x, intBitsToFloat(R125i.y)));
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 2.0);
PS1i = floatBitsToInt(float(PS0i));
// 20
backupReg0i = R126i.y;
PV0ix = floatBitsToInt(uf_blockVS7[51].x + uf_blockVS7[51].z);
R126i.y = floatBitsToInt(-(intBitsToFloat(PV1iw)) + intBitsToFloat(PV1iz));
R127i.z = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(PV1iy));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PS1i)) + intBitsToFloat(backupReg0i));
R127i.x = int(intBitsToFloat(R127i.x));
// 21
R124i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[51].z,intBitsToFloat(R126i.z)) + intBitsToFloat(PV0ix));
PV1iy = floatBitsToInt(uf_blockVS7[51].y + uf_blockVS7[51].w);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(R124i.y)) + intBitsToFloat(R123i.w));
R126i.x = int(intBitsToFloat(R124i.z));
// 22
R12i.x = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
R12i.y = floatBitsToInt(intBitsToFloat(R125i.z) + 0.5);
R126i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[51].w,intBitsToFloat(R5i.y)) + intBitsToFloat(PV1iy));
R0i.w = 0;
PS0i = floatBitsToInt(1.0 / uf_blockVS7[53].z);
// 23
R1i.x = floatBitsToInt(-(intBitsToFloat(R4i.x)) + intBitsToFloat(R10i.x));
R5i.y = floatBitsToInt(-(intBitsToFloat(R4i.y)) + intBitsToFloat(R10i.y));
R125i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[53].x, intBitsToFloat(PS0i)));
R6i.w = floatBitsToInt(-(intBitsToFloat(R8i.z)) + intBitsToFloat(R10i.z));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[53].w);
// 24
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[53].y, intBitsToFloat(PS1i)));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.w)),uf_blockVS7[49].x) + -(intBitsToFloat(R126i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),uf_blockVS7[49].y) + intBitsToFloat(R127i.z));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w),intBitsToFloat(R125i.z)) + -(0.5));
PS0i = floatBitsToInt(float(backupReg0i));
// 25
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),uf_blockVS7[50].z) + intBitsToFloat(R124i.x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R127i.x)) + -(0.5));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),uf_blockVS7[50].w) + intBitsToFloat(R126i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(PS0i)) + intBitsToFloat(R123i.y));
PS1i = floatBitsToInt(float(R126i.x));
// 26
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.x)),intBitsToFloat(PS1i)) + intBitsToFloat(R127i.z));
R11i.y = floatBitsToInt(uf_blockVS7[104].x);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R124i.w)) + intBitsToFloat(R123i.w));
PS0i = floatBitsToInt(intBitsToFloat(R6i.w) * intBitsToFloat(R6i.w));
// 27
backupReg0i = R123i.x;
R123i.x = floatBitsToInt((intBitsToFloat(R5i.y) * intBitsToFloat(R5i.y) + intBitsToFloat(PS0i)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R126i.y)) + -(intBitsToFloat(backupReg0i)));
R12i.z = floatBitsToInt(intBitsToFloat(R123i.w) + 0.5);
// 28
R9i.x = floatBitsToInt((intBitsToFloat(R1i.x) * intBitsToFloat(R1i.x) + intBitsToFloat(R123i.x)));
R12i.w = floatBitsToInt(intBitsToFloat(R123i.z) + 0.5);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(min(intBitsToFloat(R10i.y), uf_blockVS13[27].z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),uf_blockVS13[24].x) + -(uf_blockVS13[24].y));
R123i.y = clampFI32(R123i.y);
R124i.w = floatBitsToInt(intBitsToFloat(R14i.y) * intBitsToFloat(R1i.w));
tempResultf = 1.0 / sqrt(intBitsToFloat(R9i.x));
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PS0i)));
R126i.z = floatBitsToInt(-(intBitsToFloat(R7i.y)) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PS0i)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(PV1iy),intBitsToFloat(PV1iw),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(uf_blockVS13[28].x,uf_blockVS13[28].y,uf_blockVS13[28].z,0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = max(0.0, intBitsToFloat(PV1ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 3
backupReg0i = R126i.z;
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockVS13[24].w, intBitsToFloat(PS0i)));
R126i.y = floatBitsToInt(-(intBitsToFloat(R124i.w)) + 1.0);
R126i.z = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
R123i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS13[27].y,intBitsToFloat(backupReg0i)) + uf_blockVS13[27].x);
R123i.w = clampFI32(R123i.w);
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),uf_blockVS13[22].x) + -(uf_blockVS13[22].y));
R123i.x = clampFI32(R123i.x);
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), uf_blockVS13[26].w));
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R123i.w = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
// 5
R0i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)),uf_blockVS13[25].w) + uf_blockVS13[25].w);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R123i.w)) + intBitsToFloat(0xbe593484));
PV1iz = floatBitsToInt(uf_blockVS13[28].y + 1.0);
PV1iw = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0iz)));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3f22f983));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) * 1.5);
PV0iy = clampFI32(PV0iy);
R5i.z = floatBitsToInt(uf_blockVS13[28].y * 1.0 + intBitsToFloat(R4i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R123i.y)) + intBitsToFloat(0x3fc90da4));
tempResultf = max(0.0, intBitsToFloat(PV1iw));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 7
backupReg0i = R126i.y;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),-(intBitsToFloat(R123i.w))) + 1.0);
R126i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS13[23].x, intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(uf_blockVS13[23].y, intBitsToFloat(PS0i)));
R124i.w = floatBitsToInt(intBitsToFloat(PV0iy) * 15.0);
R122i.x = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3f333333) + intBitsToFloat(0x3e19999a));
R122i.x = clampFI32(R122i.x);
// 8
R11i.x = floatBitsToInt(uf_blockVS8[3].x * 1.0 + 0.0);
R5i.y = 0;
PV0iz = floatBitsToInt(-(intBitsToFloat(R122i.x)) + 1.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iz)));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 9
R18i.x = floatBitsToInt(intBitsToFloat(R4i.x) + -(intBitsToFloat(R10i.x)));
R1i.y = floatBitsToInt(intBitsToFloat(PS0i) + 0.5);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + 2.5);
PS1i = floatBitsToInt(exp2(intBitsToFloat(R126i.y)));
// 10
R10i.x = floatBitsToInt(mul_nonIEEE(-(uf_blockVS13[23].z),intBitsToFloat(PS1i)) + uf_blockVS13[23].z);
R10i.x = clampFI32(R10i.x);
R18i.y = floatBitsToInt(intBitsToFloat(R4i.y) + -(intBitsToFloat(R10i.y)));
R18i.z = floatBitsToInt(intBitsToFloat(R8i.z) + -(intBitsToFloat(R10i.z)));
R5i.w = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3daaaaab));
R4i.y = floatBitsToInt(1.0 / intBitsToFloat(R124i.w));
}
if( activeMaskStackC[3] == true ) {
R1i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y))).xyz);
R19i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R5i.w),intBitsToFloat(R5i.y))).xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R5i.z) * intBitsToFloat(R4i.y));
R126i.y = floatBitsToInt(intBitsToFloat(R10i.x) + intBitsToFloat(0x80000000));
R126i.y = clampFI32(R126i.y);
// 1
R0i.z = R126i.y;
PV1iw = floatBitsToInt(max(intBitsToFloat(PV0ix), intBitsToFloat(0x3e4ccccd)));
// 2
PV0iz = floatBitsToInt(min(intBitsToFloat(PV1iw), 1.0));
// 3
R20i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PV0iz)));
R20i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PV0iz)));
R20i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PV0iz)));
R20i.w = R126i.y;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R17i.x), intBitsToFloat(R17i.y), intBitsToFloat(R17i.z), intBitsToFloat(R17i.w));
// export
passParameterSem2 = vec4(intBitsToFloat(R18i.x), intBitsToFloat(R18i.y), intBitsToFloat(R18i.z), intBitsToFloat(R18i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem8 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.w));
// export
passParameterSem14 = vec4(intBitsToFloat(R19i.x), intBitsToFloat(R19i.y), intBitsToFloat(R19i.z), intBitsToFloat(R19i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R20i.x), intBitsToFloat(R20i.y), intBitsToFloat(R20i.z), intBitsToFloat(R20i.w));
// export
passParameterSem16 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.z));
}
