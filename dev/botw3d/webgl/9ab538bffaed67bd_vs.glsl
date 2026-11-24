#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 9ab538bffaed67bd
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
UNIFORM_BUFFER_LAYOUT(6, 0, 0) uniform uniformBlockVS6
{
vec4 uf_blockVS6[19];
};


UNIFORM_BUFFER_LAYOUT(7, 0, 1) uniform uniformBlockVS7
{
vec4 uf_blockVS7[4096];
};


UNIFORM_BUFFER_LAYOUT(8, 0, 2) uniform uniformBlockVS8
{
vec4 uf_blockVS8[11];
};


UNIFORM_BUFFER_LAYOUT(11, 0, 3) uniform uniformBlockVS11
{
vec4 uf_blockVS11[1];
};


ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem2;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem3;
ATTR_LAYOUT(0, 4) in uvec4 attrDataSem4;

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem8;
out vec4 passParameterSem10;
out vec4 passParameterSem11;
out vec4 passParameterSem13;
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
attrDecoder = attrDataSem2;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem0;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem1;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem4;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem3;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R11i.y = floatBitsToInt(-(intBitsToFloat(R2i.w)) + uf_blockVS8[2].x);
R5i.z = 0;
R11i.z = floatBitsToInt(1.0);
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
R7i.x = 0;
R7i.y = 0;
R7i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R13i.x = 0;
// 1
R0i.z = R11i.z;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R0i.z = R5i.z;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R0i.z == 0);
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
R0i.z = floatBitsToInt(float(PS0i));
// 2
predResult = (intBitsToFloat(R11i.y) >= intBitsToFloat(R0i.z));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R7i.x = 0;
R7i.y = 0;
R7i.z = floatBitsToInt(uf_blockVS6[18].y * 5.0);
R13i.x = 0;
// 1
R5i.z = R11i.z;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R5i.z == 0);
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
R13i.x = int(intBitsToFloat(R3i.w));
// 1
tempi.x = floatBitsToInt(dot(vec4(uf_blockVS8[9].x,uf_blockVS8[9].y,uf_blockVS8[9].z,intBitsToFloat(0x80000000)),vec4(uf_blockVS8[9].x,uf_blockVS8[9].y,uf_blockVS8[9].z,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R5i.z = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 2
tempi.x = floatBitsToInt(dot(vec4(uf_blockVS8[10].x,uf_blockVS8[10].y,uf_blockVS8[10].z,intBitsToFloat(0x80000000)),vec4(uf_blockVS8[10].x,uf_blockVS8[10].y,uf_blockVS8[10].z,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.w = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 3
R6i.z = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 4
predResult = (intBitsToFloat(R5i.z) > 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R5i.z));
// 1
R9i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS8[8].x, intBitsToFloat(R127i.y)));
R8i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS8[9].x, intBitsToFloat(R127i.y)));
// 2
R7i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS8[10].x, intBitsToFloat(R127i.y)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R9i.x = 0;
// 1
R7i.x = R9i.x;
// 2
R8i.x = R9i.x;
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
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(R0i.w));
// 1
R8i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS8[9].y, intBitsToFloat(R127i.w)));
R8i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS8[8].y, intBitsToFloat(R127i.w)));
// 2
R10i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS8[10].y, intBitsToFloat(R127i.w)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R10i.x = 0;
R8i.y = 0;
R8i.z = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (intBitsToFloat(R6i.z) > 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(R6i.z));
// 1
R12i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS8[9].z, intBitsToFloat(R127i.w)));
R9i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS8[8].z, intBitsToFloat(R127i.w)));
// 2
R12i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS8[10].z, intBitsToFloat(R127i.w)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R12i.x = 0;
R12i.y = 0;
R9i.z = 0;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt((0.0 > uf_blockVS7[9].x)?1.0:0.0);
PV0iy = floatBitsToInt((uf_blockVS7[9].x > 0.0)?1.0:0.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), uf_blockVS7[10].y));
PV0iw = floatBitsToInt(max(intBitsToFloat(R4i.x), 0.0));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[9].x);
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R11i.y) * intBitsToFloat(PS0i));
R126i.y = floatBitsToInt(min(intBitsToFloat(PV0iw), 0.0));
R126i.z = floatBitsToInt(-(uf_blockVS7[96].w) + uf_blockVS7[97].w);
R127i.w = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
R13i.y = floatBitsToInt(1.0 / intBitsToFloat(R0i.z));
// 2
backupReg0i = R127i.z;
R11i.x = floatBitsToInt(intBitsToFloat(R11i.y) * intBitsToFloat(R13i.y));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
R127i.z = floatBitsToInt(-(uf_blockVS7[96].x) + uf_blockVS7[97].x);
PV0iw = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV1ix));
R127i.x = floatBitsToInt(-(uf_blockVS7[96].y) + uf_blockVS7[97].y);
// 3
R126i.x = floatBitsToInt(-(uf_blockVS7[97].w) + uf_blockVS7[98].w);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(PV0iy)));
PV1iz = floatBitsToInt(fract(intBitsToFloat(PV0iw)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.z));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV1iz)));
R124i.y = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS1i));
R126i.z = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS1i));
R127i.w = floatBitsToInt(-(uf_blockVS7[97].x) + uf_blockVS7[98].x);
R125i.y = floatBitsToInt(-(uf_blockVS7[97].y) + uf_blockVS7[98].y);
// 5
R0i.x = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(R126i.y));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV0ix));
R2i.w = floatBitsToInt(-(uf_blockVS7[12].x) + 1.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R126i.x));
// 6
R126i.x = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
R125i.y = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(PS1i));
R125i.z = floatBitsToInt(intBitsToFloat(R127i.z) + -(uf_blockVS7[97].w));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.z) + -(uf_blockVS7[96].w));
// 7
backupReg0i = R127i.z;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R124i.y)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R126i.z)));
R127i.z = ((intBitsToFloat(R125i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iw = floatBitsToInt(intBitsToFloat(backupReg0i) + -(uf_blockVS7[98].w));
R127i.x = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
// 8
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(uf_blockVS7[96].x + intBitsToFloat(PV1ix));
R124i.y = ((intBitsToFloat(PV1iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.z = floatBitsToInt(uf_blockVS7[96].y + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(backupReg0i)));
// 9
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iw)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R125i.y)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R124i.y)) + 1.0);
R127i.w = floatBitsToInt(uf_blockVS7[97].x + intBitsToFloat(PS0i));
// 10
PV0ix = floatBitsToInt(uf_blockVS7[97].y + intBitsToFloat(PV1iz));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV1iy)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV1iy)));
PS0i = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].x, intBitsToFloat(R127i.x)));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockVS7[96].y, intBitsToFloat(R127i.x)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0iy)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PS0i));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(PV0iy)));
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[98].x, intBitsToFloat(R124i.y)));
// 12
PV0iy = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(PV1iz));
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[98].y, intBitsToFloat(R124i.y)));
PV0iw = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV1ix));
R7i.z = ((uf_blockVS7[12].x == 1.0)?-1:0);
// 13
PV1ix = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0iy));
// 14
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1iz)));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1ix));
// 15
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PV0iw)));
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), uf_blockVS8[3].y));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), uf_blockVS8[3].z));
// 1
R0i.z = floatBitsToInt(uf_blockVS8[2].w + intBitsToFloat(R11i.y));
// 2
predResult = (R7i.z != 0);
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
PV1iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].w, intBitsToFloat(PV0ix)));
// 2
R5i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].x, intBitsToFloat(PV1iw)));
R5i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].y, intBitsToFloat(PV1iw)));
R5i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].z, intBitsToFloat(PV1iw)));
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
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PS1i)));
R127i.y = ((uf_blockVS7[12].x == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R2i.w));
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
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].w, intBitsToFloat(PV1ix)));
// 9
R5i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].x, intBitsToFloat(PV0iw)));
R5i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].y, intBitsToFloat(PV0iw)));
R5i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].z, intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(R5i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(R5i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(R5i.y)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R5i.x)));
tempResultf = max(0.0, uf_blockVS7[12].x);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(R5i.y)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(R5i.x)));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PS0i)));
R126i.x = floatBitsToInt(1.0 / intBitsToFloat(R2i.w));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(R127i.w));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(R5i.z)));
R126i.z = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(R5i.z)));
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iw)));
// 3
backupReg0i = R127i.z;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.x), intBitsToFloat(R5i.z)));
PV1iy = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R127i.z = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PV0ix));
R127i.w = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(backupReg0i));
// 4
R127i.y = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R126i.z));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(R126i.x));
// 5
R123i.z = ((R7i.z == 0)?(PV0iw):(R0i.z));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R123i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R123i.z)));
// 7
R14i.x = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0iy));
R10i.y = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0ix));
R10i.z = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV0iw));
// 8
predResult = (R7i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(R11i.y)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
// 1
PV1iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].w, intBitsToFloat(PV0ix)));
// 2
R15i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].x, intBitsToFloat(PV1iw)));
R14i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].y, intBitsToFloat(PV1iw)));
R11i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].z, intBitsToFloat(PV1iw)));
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
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(PS1i)));
R127i.y = ((uf_blockVS7[12].x == 0.0)?(0xff7fffff):(PV1iz));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R2i.w));
// 3
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(PS0i));
// 6
PV0iy = floatBitsToInt(intBitsToFloat(R11i.y) + -(intBitsToFloat(PV1iz)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].w, intBitsToFloat(PV1ix)));
// 9
R15i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].x, intBitsToFloat(PV0iw)));
R14i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].y, intBitsToFloat(PV0iw)));
R11i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[11].z, intBitsToFloat(PV0iw)));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(R10i.z)));
R7i.y = 0x3f800000;
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(R10i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(R14i.x)));
PS0i = floatBitsToInt(uf_blockVS7[5].x) & 0x20000;
// 1
R6i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV0iw));
R6i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV0iz));
R6i.z = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(uf_blockVS7[5].x) & 0x10000;
R127i.z = floatBitsToInt(float(PS0i));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z),intBitsToFloat(R7i.y)),vec4(uf_blockVS8[6].x,uf_blockVS8[6].y,uf_blockVS8[6].z,uf_blockVS8[6].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R8i.w = tempi.x;
R127i.w = floatBitsToInt(float(PV1iw));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z),intBitsToFloat(R7i.y)),vec4(uf_blockVS8[4].x,uf_blockVS8[4].y,uf_blockVS8[4].z,uf_blockVS8[4].w)));
PV1ix = tempi.x;
R9i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.y = floatBitsToInt((intBitsToFloat(R127i.z) > 0.0)?1.0:0.0);
// 4
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(R127i.z))?1.0:0.0);
PV0iy = floatBitsToInt((intBitsToFloat(R127i.w) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt(uf_blockVS7[5].x) & 0x40000;
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(R127i.w))?1.0:0.0);
R127i.x = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(R4i.z));
// 5
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iw)));
R127i.y = R4i.z;
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
R127i.z = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(R4i.y));
PV1iw = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(float(PV0iz));
// 6
PV0ix = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R126i.y = floatBitsToInt(intBitsToFloat(R127i.x) * 0.5);
R125i.z = R4i.y;
R125i.z = floatBitsToInt(intBitsToFloat(R125i.z) * 2.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R126i.z = int(intBitsToFloat(PV1iw));
// 7
backupReg0i = R126i.z;
backupReg1i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(R127i.z) * 0.5);
PV1iy = 0 - backupReg0i;
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
R127i.w = floatBitsToInt(floor(intBitsToFloat(R127i.y)));
R126i.w = int(intBitsToFloat(backupReg1i));
// 8
R127i.x = max(R126i.z, PV1iy);
PV0iy = 0 - R126i.w;
R126i.z = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(R4i.z));
R1i.w = floatBitsToInt(intBitsToFloat(R126i.y) + -(0.5));
R1i.w = floatBitsToInt(intBitsToFloat(R1i.w) * 2.0);
R126i.y = int(intBitsToFloat(PV1iz));
// 9
R125i.x = floatBitsToInt(floor(intBitsToFloat(R125i.z)));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(R127i.w))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(R127i.w) > 0.0)?1.0:0.0);
R127i.w = R4i.x;
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
R125i.y = max(R126i.w, PV0iy);
// 10
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iy)));
R127i.y = floatBitsToInt(intBitsToFloat(R126i.z) * 0.5);
R1i.z = floatBitsToInt(intBitsToFloat(R126i.x) + -(0.5));
R1i.z = floatBitsToInt(intBitsToFloat(R1i.z) * 2.0);
PV0iw = 0 - R126i.y;
PS0i = floatBitsToInt(float(R127i.x));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 11
PV1ix = floatBitsToInt(floor(intBitsToFloat(R127i.w)));
R126i.y = max(R126i.y, PV0iw);
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(R125i.x))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(R125i.x) > 0.0)?1.0:0.0);
R5i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(PV0ix)));
// 12
PV0ix = floatBitsToInt((intBitsToFloat(PV1ix) > 0.0)?1.0:0.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
R0i.z = floatBitsToInt(intBitsToFloat(R127i.y) + -(0.5));
R0i.z = floatBitsToInt(intBitsToFloat(R0i.z) * 2.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PV1ix))?1.0:0.0);
PS0i = floatBitsToInt(float(R125i.y));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 13
R1i.x = floatBitsToInt(intBitsToFloat(R4i.y) + -(0.5));
R5i.y = floatBitsToInt(intBitsToFloat(R4i.x) + -(0.5));
R5i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS0i)), intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
PS1i = floatBitsToInt(float(R126i.y));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) * 2.0);
// 14
R5i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(PV1iw)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(R14i.y)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(R15i.x)));
R0i.w = floatBitsToInt(intBitsToFloat(R4i.z) + -(0.5));
tempResultf = max(0.0, uf_blockVS7[12].x);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 15
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(R14i.y)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(R15i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(PS0i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R15i.x)));
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(R2i.w));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iz)));
// 17
PV1ix = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
PV1iy = floatBitsToInt(uf_blockVS7[13].y);
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) / 2.0);
R125i.z = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(R127i.w));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(R14i.y)));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
R125i.x = floatBitsToInt(tempResultf);
// 18
R127i.x = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(PV1iy));
R127i.y = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R127i.y));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(R126i.w));
R126i.w = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(R126i.z));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(R11i.z)));
// 19
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(R11i.z)));
R126i.y = ((R7i.z == 0)?(PV0iz):(R11i.y));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.x), intBitsToFloat(R11i.z)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R125i.x)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R125i.x)));
// 20
R7i.x = floatBitsToInt(intBitsToFloat(R3i.z) * 1.0);
R124i.y = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(R126i.w));
PV0iz = floatBitsToInt(uf_blockVS7[13].x);
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R125i.x)));
R1i.y = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R125i.z));
// 21
PV1ix = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(R127i.y));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R127i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R126i.y)));
R125i.w = floatBitsToInt(intBitsToFloat(R3i.x) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R126i.y)));
// 22
backupReg0i = R2i.y;
PV0ix = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0x3a83126f));
R2i.y = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x3a83126f));
R2i.z = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(0x3a83126f));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R126i.y)));
R6i.w = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PS1i));
// 23
R2i.x = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV0iw));
R1i.y = floatBitsToInt(intBitsToFloat(R124i.y) + intBitsToFloat(R127i.z));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R125i.w)));
R2i.w = ((intBitsToFloat(0x3a83126f) > intBitsToFloat(R11i.y))?-1:0);
R0i.y = floatBitsToInt(intBitsToFloat(R14i.x) + -(intBitsToFloat(PV0ix)));
}
if( activeMaskStackC[3] == true ) {
// 0
R126i.x = floatBitsToInt(intBitsToFloat(R10i.y) + -(intBitsToFloat(R2i.y)));
R127i.y = floatBitsToInt(-(intBitsToFloat(R8i.w)) + uf_blockVS6[17].z);
R125i.z = floatBitsToInt(-(intBitsToFloat(R9i.y)) + uf_blockVS6[17].x);
R7i.w = floatBitsToInt(intBitsToFloat(R10i.z) + -(intBitsToFloat(R2i.z)));
R124i.x = (R13i.x == int(1))?-1:0;
// 1
PV1ix = floatBitsToInt((0.0 > -(intBitsToFloat(R125i.z)))?1.0:0.0);
PV1iy = floatBitsToInt((-(intBitsToFloat(R125i.z)) > 0.0)?1.0:0.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), uf_blockVS7[115].y));
R127i.w = floatBitsToInt(-(uf_blockVS7[114].w) + 1.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 2
R0i.x = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1ix)));
R126i.y = ((uf_blockVS7[114].w == 1.0)?-1:0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), uf_blockVS7[115].x));
PV0iw = floatBitsToInt(-(intBitsToFloat(R125i.z)) * intBitsToFloat(PS1i));
tempResultf = max(0.0, uf_blockVS7[114].w);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 3
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PV0iw))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(PV0iw) > 0.0)?1.0:0.0);
R125i.w = floatBitsToInt(max(intBitsToFloat(PV0iw), -(intBitsToFloat(PV0iw))));
R126i.w = floatBitsToInt(uf_blockVS7[114].y + intBitsToFloat(R127i.z));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iy)));
R125i.y = floatBitsToInt(intBitsToFloat(R126i.z) + uf_blockVS7[114].x);
R126i.z = ((intBitsToFloat(R125i.w) > 1.0)?-1:0);
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), uf_blockVS7[115].z));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R125i.w));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3fc90fdb));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R5i.w)));
R123i.z = ((R126i.z == 0)?(R125i.w):(PS0i));
R125i.w = floatBitsToInt(((R126i.z == 0)?(intBitsToFloat(PV0ix)):(-(intBitsToFloat(PV0ix)))));
PS1i = floatBitsToInt(exp2(intBitsToFloat(R127i.x)));
// 6
PV0ix = floatBitsToInt(min(intBitsToFloat(R123i.z), 1.0));
R2i.y = ((R126i.z == 0)?(0):(PV1ix));
R126i.z = ((-(intBitsToFloat(R125i.z)) == 0.0)?-1:0);
PV0iw = floatBitsToInt(-(intBitsToFloat(PS1i)) + 1.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(PS0i));
PV1iy = ((0.0 > intBitsToFloat(R127i.y))?-1:0);
R125i.z = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(R124i.y));
R127i.w = floatBitsToInt(max(intBitsToFloat(PV0ix), -(1.0)));
R124i.y = floatBitsToInt(uf_blockVS7[114].z + intBitsToFloat(R124i.w));
// 8
backupReg0i = R1i.x;
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R5i.z)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R127i.w)));
R124i.w = ((R126i.y == 0)?(PV1ix):(R11i.y));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), uf_blockVS7[113].y));
// 9
R125i.x = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(PV0iy));
R123i.y = floatBitsToInt(intBitsToFloat(0x3edcf805) * intBitsToFloat(R126i.z) + 1.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R5i.x)));
R123i.w = floatBitsToInt(intBitsToFloat(0x3d6ee04d) * intBitsToFloat(R126i.z) + intBitsToFloat(0x3f43b24e));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), uf_blockVS7[113].x));
// 10
R127i.x = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R127i.w)), intBitsToFloat(R123i.y)));
PV0iy = floatBitsToInt(intBitsToFloat(R126i.w) + 0.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R123i.w)) + 1.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R124i.w)));
R126i.w = ((intBitsToFloat(R127i.y) == 0.0)?-1:0);
// 11
R5i.x = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PV0iw));
R125i.y = floatBitsToInt(intBitsToFloat(R125i.y) + 0.0);
PV1iz = floatBitsToInt(intBitsToFloat(R124i.y) + intBitsToFloat(R127i.z));
R5i.w = floatBitsToInt(intBitsToFloat(R0i.x) * intBitsToFloat(0x3fc90fdb));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.z));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), uf_blockVS7[113].z));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R124i.w)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(R124i.w)));
R122i.x = ((R2i.w == 0)?(R1i.y):(R0i.y));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) + 0.0);
PV1iy = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(PV0iz));
R123i.z = ((R2i.w == 0)?(R2i.x):(R126i.x));
R123i.w = ((intBitsToFloat(R127i.w) > 0.0)?(PV0ix):(floatBitsToInt(-(intBitsToFloat(PV0ix)))));
R2i.x = floatBitsToInt(intBitsToFloat(R14i.x) + -(intBitsToFloat(R122i.x)));
// 14
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
R5i.y = floatBitsToInt(intBitsToFloat(R10i.y) + -(intBitsToFloat(R123i.z)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R123i.w)) + intBitsToFloat(R2i.y));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R124i.w));
R127i.z = ((R124i.x == 0)?(0xbf800000):(0xbf800000));
// 15
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(R126i.z))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(R126i.z) > 0.0)?1.0:0.0);
R123i.w = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
R122i.x = ((R2i.w == 0)?(R6i.w):(R7i.w));
// 16
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iy)));
R123i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R2i.w = floatBitsToInt(intBitsToFloat(R10i.z) + -(intBitsToFloat(R122i.x)));
R125i.y = ((R124i.x == 0)?(0x3f800000):(0xbf800000));
// 17
R123i.x = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iy = (R13i.x == 0x2)?-1:0;
PV1iz = floatBitsToInt(-(intBitsToFloat(R0i.x)) + intBitsToFloat(PV0ix));
R125i.w = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
// 18
R124i.x = ((PV1iy == 0)?(R127i.z):(0x3f800000));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3fc90fdb));
R127i.z = ((PV1iy == 0)?(R125i.y):(0xbf800000));
R124i.w = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
R0i.z = floatBitsToInt(sin((intBitsToFloat(R125i.w))/0.1591549367));
// 19
PV1ix = floatBitsToInt(intBitsToFloat(R126i.z) + -(intBitsToFloat(PV0iy)));
PV1iy = (R13i.x == 0x3)?-1:0;
R2i.y = floatBitsToInt(cos((intBitsToFloat(R125i.w))/0.1591549367));
// 20
backupReg0i = R1i.x;
R1i.x = ((PV1iy == 0)?(R124i.x):(0x3f800000));
R5i.z = ((PV1iy == 0)?(R127i.z):(0x3f800000));
R123i.w = ((backupReg0i == 0)?(PV1ix):(0x40490fdb));
R1i.z = floatBitsToInt(sin((intBitsToFloat(R124i.w))/0.1591549367));
// 21
R0i.x = floatBitsToInt(-(intBitsToFloat(R1i.z)));
R123i.z = ((R126i.w == 0)?(R123i.w):(R5i.w));
R0i.y = floatBitsToInt(cos((intBitsToFloat(R124i.w))/0.1591549367));
// 22
R5i.x = floatBitsToInt(intBitsToFloat(R5i.x) + -(intBitsToFloat(R123i.z)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R0i.y)));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R0i.y)));
R12i.x = floatBitsToInt(-(intBitsToFloat(R1i.z)) * 1.0);
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R123i.x = floatBitsToInt(intBitsToFloat(R5i.x) * intBitsToFloat(0x3e22f983) + 0.5);
R12i.y = floatBitsToInt(intBitsToFloat(R1i.y) * 1.0);
R12i.z = floatBitsToInt(intBitsToFloat(R5i.w) * 1.0);
R125i.w = floatBitsToInt(1.0 / uf_blockVS8[2].w);
// 1
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),uf_blockVS11[0].x) + 0.0);
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),uf_blockVS11[0].x) + 0.0);
PV1iw = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
// 2
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 3
R125i.y = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
// 4
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z),intBitsToFloat(R7i.y)),vec4(uf_blockVS8[5].x,uf_blockVS8[5].y,uf_blockVS8[5].z,uf_blockVS8[5].w)));
PV0iy = R127i.x;
PV0iz = R127i.x;
PV0iw = R127i.x;
PS0i = floatBitsToInt(sin((intBitsToFloat(R125i.y))/0.1591549367));
// 5
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PS0i)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R0i.y)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PS0i)));
R126i.w = floatBitsToInt(cos((intBitsToFloat(R125i.y))/0.1591549367));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R124i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R126i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R126i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R124i.x)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R7i.x)));
// 7
R126i.x = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PV0iw));
R127i.y = floatBitsToInt(-(intBitsToFloat(PV0iz)) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PV0iz)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PV0iy)));
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R0i.y)));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R0i.x)) + intBitsToFloat(R125i.y));
R0i.y = floatBitsToInt(intBitsToFloat(R124i.x) + intBitsToFloat(PV1iw));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R7i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R7i.x)));
R3i.z = floatBitsToInt(-(intBitsToFloat(R124i.w)) + intBitsToFloat(PV1iz));
// 9
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(R124i.y) * 1.0);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R1i.y)) + intBitsToFloat(PV0iw));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z),intBitsToFloat(R5i.x)) + intBitsToFloat(R123i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R5i.w)) + intBitsToFloat(PV0iz));
R124i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * 1.0);
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z),intBitsToFloat(R0i.y)) + intBitsToFloat(R123i.y));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z),intBitsToFloat(R3i.z)) + intBitsToFloat(R123i.w));
R6i.x = floatBitsToInt(intBitsToFloat(R9i.y) + intBitsToFloat(R123i.z));
// 11
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(-(intBitsToFloat(R9i.y)) + intBitsToFloat(R6i.x));
R6i.y = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(R123i.x));
R6i.z = floatBitsToInt(intBitsToFloat(R8i.w) + intBitsToFloat(R123i.w));
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(backupReg0i)) + intBitsToFloat(R126i.x));
// 12
R9i.x = floatBitsToInt(intBitsToFloat(R5i.x) * 1.0);
R2i.y = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(R6i.y));
R0i.z = floatBitsToInt(-(intBitsToFloat(R8i.w)) + intBitsToFloat(R6i.z));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(R1i.y)) + intBitsToFloat(R127i.y));
// 13
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R5i.y),intBitsToFloat(R2i.w),intBitsToFloat(0x80000000)),vec4(uf_blockVS8[4].x,uf_blockVS8[4].y,uf_blockVS8[4].z,0.0)));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(R5i.w)) + intBitsToFloat(R124i.w));
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R5i.y),intBitsToFloat(R2i.w),intBitsToFloat(0x80000000)),vec4(uf_blockVS8[5].x,uf_blockVS8[5].y,uf_blockVS8[5].z,0.0)));
PV0ix = tempi.x;
R125i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R8i.x = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(R125i.w));
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R5i.y),intBitsToFloat(R2i.w),intBitsToFloat(0x80000000)),vec4(uf_blockVS8[6].x,uf_blockVS8[6].y,uf_blockVS8[6].z,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R127i.z = tempi.x;
PV1iw = tempi.x;
R1i.y = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(R125i.w));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R2i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R2i.y),intBitsToFloat(R0i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R2i.z = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(R125i.w));
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R125i.w = tempi.x;
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R124i.y = ((intBitsToFloat(PS1i) > 0.0)?-1:0);
// 19
R9i.y = floatBitsToInt(intBitsToFloat(R0i.y) * 1.0);
R9i.z = floatBitsToInt(intBitsToFloat(R3i.z) * 1.0);
PS1i = floatBitsToInt(sqrt(intBitsToFloat(R125i.w)));
// 20
PV0ix = ((intBitsToFloat(PS1i) > 0.0)?-1:0);
tempResultf = 1.0 / sqrt(intBitsToFloat(R127i.y));
PS0i = floatBitsToInt(tempResultf);
// 21
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
R5i.y = ((R124i.y == 0)?(0):(PV0ix));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PS0i)));
// 22
predResult = (R5i.y != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R2i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R2i.y),intBitsToFloat(R0i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), uf_blockVS7[95].x));
// 1
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), uf_blockVS7[95].x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), uf_blockVS7[95].x));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PS1i)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R8i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0iy),intBitsToFloat(PV0iz),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R127i.z)));
// 5
R6i.x = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV0iy));
R6i.y = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(PV0ix));
R6i.z = floatBitsToInt(intBitsToFloat(R6i.z) + intBitsToFloat(PV0iw));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R5i.x)) + intBitsToFloat(R7i.x));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R0i.y)) + intBitsToFloat(R7i.y));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R3i.z)) + intBitsToFloat(R1i.z));
R0i.w = 0x3f800000;
R127i.y = floatBitsToInt((uf_blockVS7[8].x > 0.0)?1.0:0.0);
// 1
R7i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS6[8].x,uf_blockVS6[8].y,uf_blockVS6[8].z,uf_blockVS6[8].w)));
PV1iy = R7i.x;
PV1iz = R7i.x;
PV1iw = R7i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS6[9].x,uf_blockVS6[9].y,uf_blockVS6[9].z,uf_blockVS6[9].w)));
PV0ix = tempi.x;
R7i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS6[10].x,uf_blockVS6[10].y,uf_blockVS6[10].z,uf_blockVS6[10].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R7i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z),intBitsToFloat(R0i.w)),vec4(uf_blockVS6[11].x,uf_blockVS6[11].y,uf_blockVS6[11].z,uf_blockVS6[11].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R7i.w = tempi.x;
// 5
PV1ix = floatBitsToInt((0.0 > uf_blockVS7[8].x)?1.0:0.0);
PV1iy = floatBitsToInt((uf_blockVS7[8].y > 0.0)?1.0:0.0);
PV1iz = floatBitsToInt((0.0 > uf_blockVS7[8].y)?1.0:0.0);
PV1iw = PV0ix;
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) / 2.0);
PS1i = floatBitsToInt(1.0 / uf_blockVS7[8].x);
// 6
R123i.x = floatBitsToInt(intBitsToFloat(R7i.z) * 0.0 + intBitsToFloat(PV1iw));
PV0iy = floatBitsToInt(intBitsToFloat(R11i.y) * intBitsToFloat(PS1i));
R126i.z = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PV1iz)));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.y) + -(intBitsToFloat(PV1ix)));
R8i.z = floatBitsToInt(intBitsToFloat(R7i.z) * 0.5 + intBitsToFloat(PV1iw));
// 7
R8i.x = floatBitsToInt(intBitsToFloat(R7i.x) * 0.5 + intBitsToFloat(R123i.x));
R8i.y = floatBitsToInt(intBitsToFloat(R7i.y) * -(0.5) + intBitsToFloat(R123i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),uf_blockVS7[9].y) + intBitsToFloat(PV0iy));
R8i.w = floatBitsToInt(intBitsToFloat(R7i.z) * 0.0 + intBitsToFloat(R7i.w));
R127i.z = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
// 8
R127i.y = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
PV0iw = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[8].y);
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R11i.y) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0iw)));
// 10
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x),intBitsToFloat(R127i.z)) + intBitsToFloat(PV1iy));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),uf_blockVS7[9].z) + intBitsToFloat(PV1ix));
// 11
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV1iz)));
// 13
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x),intBitsToFloat(R127i.y)) + intBitsToFloat(PV0ix));
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(-(uf_blockVS7[60].z) + uf_blockVS7[61].z);
PV0iy = floatBitsToInt(-(uf_blockVS7[60].w) + uf_blockVS7[61].w);
PV0iz = floatBitsToInt(intBitsToFloat(R0i.x) + -(uf_blockVS7[61].w));
R127i.w = floatBitsToInt(intBitsToFloat(R0i.x) + -(uf_blockVS7[60].w));
// 1
R126i.x = ((intBitsToFloat(PV0iz) >= 0.0)?(floatBitsToInt(1.0)):(0));
PV1iy = floatBitsToInt(-(uf_blockVS7[60].y) + uf_blockVS7[61].y);
PV1iz = floatBitsToInt(-(uf_blockVS7[60].x) + uf_blockVS7[61].x);
R126i.w = ((intBitsToFloat(R127i.w) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
PV0iw = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS1i));
R126i.z = floatBitsToInt(-(intBitsToFloat(R126i.w)) + 1.0);
// 3
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV0iw)) + uf_blockVS7[60].z);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV0ix)) + uf_blockVS7[60].y);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV0iy)) + uf_blockVS7[60].x);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(mul_nonIEEE(uf_blockVS7[60].x, intBitsToFloat(R126i.z)));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(uf_blockVS7[60].y, intBitsToFloat(R126i.z)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[60].z, intBitsToFloat(R126i.z)));
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iw));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R127i.w)) + intBitsToFloat(PV0ix));
R127i.z = floatBitsToInt(intBitsToFloat(R0i.w) + -(uf_blockVS7[68].w));
R126i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[61].x,intBitsToFloat(R126i.x)) + intBitsToFloat(R123i.z));
// 6
backupReg0i = R126i.x;
R126i.x = ((intBitsToFloat(R127i.z) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[61].z,intBitsToFloat(backupReg0i)) + intBitsToFloat(R123i.x));
R126i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[61].y,intBitsToFloat(backupReg0i)) + intBitsToFloat(R123i.y));
// 7
R127i.y = floatBitsToInt(-(uf_blockVS7[68].x) + uf_blockVS7[69].x);
R127i.w = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
// 8
PV0ix = floatBitsToInt(-(uf_blockVS7[68].w) + uf_blockVS7[69].w);
PV0iw = floatBitsToInt(intBitsToFloat(R0i.w) + -(uf_blockVS7[69].w));
// 9
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[68].x, intBitsToFloat(R127i.w)));
R125i.y = floatBitsToInt(uf_blockVS7[76].x);
R125i.z = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.w = floatBitsToInt(uf_blockVS7[76].y);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 10
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), uf_blockVS8[0].x));
PV0iy = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 1.0);
PV0iz = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(PS1i));
R126i.w = floatBitsToInt(uf_blockVS7[76].z);
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), uf_blockVS8[0].y));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV0iy)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV0iz)) + uf_blockVS7[68].x);
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), uf_blockVS8[0].z));
// 12
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), uf_blockVS8[1].x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(PV1ix)) + intBitsToFloat(R127i.x));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), uf_blockVS8[1].z));
PV0iw = ((intBitsToFloat(R4i.x) > 0.5)?-1:0);
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), uf_blockVS8[1].y));
// 13
PV1ix = ((intBitsToFloat(R4i.y) > 0.5)?-1:0);
R0i.y = floatBitsToInt(((PV0iw == 0)?(intBitsToFloat(R3i.x)):(-(intBitsToFloat(R3i.x)))));
R123i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[69].x,intBitsToFloat(R125i.z)) + intBitsToFloat(R123i.y));
// 14
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), uf_blockVS7[59].x));
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), uf_blockVS7[59].x));
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), uf_blockVS7[59].x));
R15i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), uf_blockVS8[0].w));
R0i.x = floatBitsToInt(((PV1ix == 0)?(intBitsToFloat(R3i.y)):(-(intBitsToFloat(R3i.y)))));
// 15
PV1ix = ((intBitsToFloat(R4i.z) > 0.5)?-1:0);
PV1iw = ((intBitsToFloat(R4i.w) > 0.5)?-1:0);
// 16
R0i.z = floatBitsToInt(((PV1iw == 0)?(intBitsToFloat(R3i.y)):(-(intBitsToFloat(R3i.y)))));
R0i.w = floatBitsToInt(((PV1ix == 0)?(intBitsToFloat(R3i.x)):(-(intBitsToFloat(R3i.x)))));
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt((0.0 > uf_blockVS7[8].w)?1.0:0.0);
PV0iy = floatBitsToInt((uf_blockVS7[8].w > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt(uf_blockVS7[5].x) & 0x80000;
PS0i = floatBitsToInt(1.0 / uf_blockVS7[8].w);
// 1
PV1ix = (PV0iz == 0x80000)?-1:0;
PV1iy = floatBitsToInt(intBitsToFloat(R11i.y) * intBitsToFloat(PS0i));
R127i.z = floatBitsToInt(-(uf_blockVS7[84].x) + uf_blockVS7[85].x);
R127i.w = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0ix)));
// 2
R2i.x = ((PV1ix == 0)?(R3i.x):(R0i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),uf_blockVS7[10].x) + intBitsToFloat(PV1iy));
R125i.z = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
PV0iw = floatBitsToInt(uf_blockVS7[5].x) & 0x100000;
PS0i = ((intBitsToFloat(R4i.y) > 0.5)?-1:0);
// 3
R127i.x = floatBitsToInt(((PS0i == 0)?(intBitsToFloat(R3i.x)):(-(intBitsToFloat(R3i.x)))));
PV1iy = floatBitsToInt(-(uf_blockVS7[84].w) + uf_blockVS7[85].w);
PV1iz = (PV0iw == 0x100000)?-1:0;
PV1iw = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
// 4
PV0ix = floatBitsToInt(uf_blockVS7[5].x) & 0x400000;
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(uf_blockVS7[5].x) & 0x200000;
R2i.w = ((PV1iz == 0)?(R3i.y):(R0i.x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x),intBitsToFloat(R125i.z)) + intBitsToFloat(PV0iy));
PV1iy = (PV0iz == 0x200000)?-1:0;
PV1iz = (PV0ix == 0x400000)?-1:0;
R127i.w = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(uf_blockVS7[5].x) & 0x800000;
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R123i.x) + -(uf_blockVS7[85].w));
R2i.y = ((PV1iz == 0)?(R3i.y):(R0i.z));
R5i.z = ((PV1iy == 0)?(R3i.x):(R0i.w));
PV0iw = floatBitsToInt(intBitsToFloat(R123i.x) + -(uf_blockVS7[84].w));
PS0i = (PS1i == 0x800000)?-1:0;
// 7
R5i.x = ((PS0i == 0)?(R3i.x):(R127i.x));
R125i.y = ((intBitsToFloat(PV0iw) >= 0.0)?(floatBitsToInt(1.0)):(0));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R127i.w)) + uf_blockVS7[84].x);
R127i.w = ((intBitsToFloat(PV0ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
PS1i = floatBitsToInt(uf_blockVS7[5].x) & 0x1000000;
// 8
PV0ix = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
R126i.y = (PS1i == 0x1000000)?-1:0;
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
PV0iw = ((intBitsToFloat(R4i.z) > 0.5)?-1:0);
PS0i = floatBitsToInt(uf_blockVS7[5].y) & int(1);
// 9
R123i.x = floatBitsToInt(((PV0iw == 0)?(intBitsToFloat(R3i.y)):(-(intBitsToFloat(R3i.y)))));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV0iz)));
R2i.z = (int(1) != PS0i)?-1:0;
PV1iw = floatBitsToInt(mul_nonIEEE(uf_blockVS7[84].x, intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(uf_blockVS7[5].x) & 0x1000;
// 10
R3i.x = ((R2i.z == 0)?(R4i.x):(R4i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV1iy)) + intBitsToFloat(PV1iw));
R0i.w = ((R126i.y == 0)?(R3i.y):(R123i.x));
PS0i = floatBitsToInt(float(PS1i));
// 11
R3i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[85].x,intBitsToFloat(R127i.w)) + intBitsToFloat(R123i.z));
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
// 12
R127i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x2000;
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
// 13
R126i.x = int(intBitsToFloat(PV0iy));
// 14
PV0iw = 0 - R126i.x;
PS0i = floatBitsToInt(float(R127i.x));
// 15
PV1ix = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R3i.z = max(R126i.x, PV0iw);
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
// 16
R0i.y = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1ix)));
}
if( activeMaskStackC[3] == true ) {
// 0
R14i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R1i.x)));
R14i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R1i.y)));
R14i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[59].x, intBitsToFloat(R1i.z)));
R14i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), uf_blockVS8[1].w));
// 1
R126i.w = int(uf_blockVS7[35].x);
// 2
R125i.y = int(-1) + R126i.w;
R127i.z = int(uf_blockVS7[35].y);
// 3
R126i.x = int(intBitsToFloat(R0i.y));
// 4
PV0iw = 0 - R126i.x;
R126i.y = floatBitsToInt(float(R126i.w));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(R126i.y)));
R126i.z = max(R126i.x, PV0iw);
PS1i = floatBitsToInt(float(R127i.z));
// 6
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R126i.y)));
PV0iw = floatBitsToInt(intBitsToFloat(R13i.y) * intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 7
R127i.w = floatBitsToInt(intBitsToFloat(R11i.y) * intBitsToFloat(PS0i));
PS1i = int(intBitsToFloat(PV0iw));
// 8
R127i.y = R3i.z * PS1i;
// 9
R3i.z = int(intBitsToFloat(R127i.w));
// 10
PS0i = floatBitsToInt(float(R3i.z));
// 11
PV1ix = floatBitsToInt(-(intBitsToFloat(R126i.y)) + intBitsToFloat(PS0i));
R1i.x = floatBitsToInt(float(R126i.w));
// 12
R0i.x = floatBitsToInt(abs(intBitsToFloat(R1i.x)));
R123i.w = ((intBitsToFloat(PV1ix) >= 0.0)?(floatBitsToInt(1.0)):(0));
R126i.w = floatBitsToInt(float(R3i.z));
// 13
R125i.z = floatBitsToInt(abs(intBitsToFloat(R126i.w)));
R127i.z = int(intBitsToFloat(R123i.w));
// 14
R127i.x = int(1) - R127i.z;
R0i.z = floatBitsToInt(1.0 / abs(intBitsToFloat(R1i.x)));
// 15
PV1iy = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R126i.w)), intBitsToFloat(R0i.z)));
R127i.z = R127i.z * R125i.y;
// 16
PV0ix = floatBitsToInt(trunc(intBitsToFloat(PV1iy)));
R3i.w = int(intBitsToFloat(R126i.x));
// 17
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0ix)),intBitsToFloat(R0i.x)) + intBitsToFloat(R125i.z));
// 18
PV0ix = floatBitsToInt(-(abs(intBitsToFloat(R1i.x))) + intBitsToFloat(R125i.y));
PV0iw = floatBitsToInt((intBitsToFloat(R125i.y) >= abs(intBitsToFloat(R1i.x)))?1.0:0.0);
// 19
R125i.z = ((intBitsToFloat(PV0iw) == 0.0)?(R125i.y):(PV0ix));
// 20
PV0iy = floatBitsToInt(abs(intBitsToFloat(R1i.x)) + intBitsToFloat(R125i.z));
// 21
R123i.x = ((-(intBitsToFloat(R125i.z)) > 0.0)?(PV0iy):(R125i.z));
// 22
R123i.w = ((-(intBitsToFloat(R126i.w)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.x)))):(R123i.x));
// 23
R123i.z = ((intBitsToFloat(R1i.x) == 0.0)?(R126i.w):(R123i.w));
// 24
PS0i = int(intBitsToFloat(R123i.z));
// 25
PS1i = R127i.x * PS0i;
// 26
PV0iy = PS1i + R127i.z;
// 27
PS1i = R126i.z * PV0iy;
// 28
R3i.x = PS1i + R127i.y;
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x8000;
PV0iy = floatBitsToInt(uf_blockVS7[5].x) & 0x4000;
// 1
R126i.x = floatBitsToInt(uf_blockVS7[5].x) & 0x8000000;
PS1i = floatBitsToInt(float(PV0iy));
// 2
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(float(R127i.x));
// 3
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iw = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PS1i = floatBitsToInt(float(R126i.x));
// 4
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + -(intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
R126i.x = int(intBitsToFloat(PV1iy));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0ix)));
PV1iw = 0 - R126i.x;
R127i.x = int(intBitsToFloat(PV0iy));
// 6
R126i.z = max(R126i.x, PV1iw);
PV0iw = 0 - R127i.x;
R126i.w = int(intBitsToFloat(PV1ix));
// 7
PV1ix = 0 - R126i.w;
PV1iz = max(R127i.x, PV0iw);
// 8
PV0iy = max(R126i.w, PV1ix);
R127i.x = PV1iz * R3i.w;
// 9
PS1i = PV0iy * R3i.w;
// 10
PV0iy = R3i.z + PS1i;
// 11
PS1i = R126i.z * PV0iy;
// 12
PV0iw = PS1i + R3i.x;
// 13
PV1iz = R127i.x + PV0iw;
// 14
R125i.y = floatBitsToInt(float(PV1iz));
// 15
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), abs(intBitsToFloat(R125i.y))));
R126i.z = floatBitsToInt(abs(intBitsToFloat(R125i.y)));
// 16
PV0iw = floatBitsToInt(trunc(intBitsToFloat(PV1ix)));
// 17
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iw)),intBitsToFloat(R0i.x)) + intBitsToFloat(R126i.z));
// 18
PV0ix = floatBitsToInt(-(abs(intBitsToFloat(R1i.x))) + intBitsToFloat(R127i.y));
PV0iw = floatBitsToInt((intBitsToFloat(R127i.y) >= abs(intBitsToFloat(R1i.x)))?1.0:0.0);
// 19
R126i.z = ((intBitsToFloat(PV0iw) == 0.0)?(R127i.y):(PV0ix));
// 20
PV0iy = floatBitsToInt(abs(intBitsToFloat(R1i.x)) + intBitsToFloat(R126i.z));
// 21
R123i.x = ((-(intBitsToFloat(R126i.z)) > 0.0)?(PV0iy):(R126i.z));
// 22
R123i.w = ((-(intBitsToFloat(R125i.y)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.x)))):(R123i.x));
// 23
R123i.z = ((intBitsToFloat(R1i.x) == 0.0)?(R125i.y):(R123i.w));
// 24
R125i.y = int(intBitsToFloat(R123i.z));
// 25
R127i.x = floatBitsToInt(float(R125i.y));
// 26
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(R127i.x))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(R127i.x) > 0.0)?1.0:0.0);
R127i.w = floatBitsToInt(float(R125i.y));
// 27
R126i.x = floatBitsToInt(abs(intBitsToFloat(R127i.w)));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(abs(intBitsToFloat(R127i.w)) * 0.25);
// 28
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * 0.5 + intBitsToFloat(R127i.x));
PV0iy = floatBitsToInt(trunc(intBitsToFloat(PV1iz)));
// 29
PV1ix = floatBitsToInt(intBitsToFloat(R123i.x) * 0.25);
R126i.w = floatBitsToInt(-(intBitsToFloat(PV0iy)) * 4.0 + intBitsToFloat(R126i.x));
// 30
PV0ix = floatBitsToInt(trunc(intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt((intBitsToFloat(R126i.w) >= 4.0)?1.0:0.0);
PV0iz = floatBitsToInt(intBitsToFloat(R126i.w) + -4.0);
// 31
R126i.x = ((intBitsToFloat(PV0iy) == 0.0)?(R126i.w):(PV0iz));
PS1i = int(intBitsToFloat(PV0ix));
// 32
R1i.x = PS1i + 0x24;
PV0iw = floatBitsToInt(intBitsToFloat(R126i.x) + 4.0);
PS0i = int(uf_blockVS7[48].z);
// 33
R123i.z = ((-(intBitsToFloat(R126i.x)) > 0.0)?(PV0iw):(R126i.x));
R3i.x = floatBitsToInt(float(PS0i));
// 34
R123i.y = ((-(intBitsToFloat(R127i.w)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.z)))):(R123i.z));
PV0iz = floatBitsToInt((0.0 >= abs(intBitsToFloat(R3i.x)))?1.0:0.0);
PV0iw = floatBitsToInt(-(abs(intBitsToFloat(R3i.x))) + 0.0);
// 35
R0i.y = ((intBitsToFloat(PV0iz) == 0.0)?(0):(PV0iw));
R0i.x = int(intBitsToFloat(R123i.y));
}
if( activeMaskStackC[3] == true ) {
R1i.xyzw = floatBitsToInt(uf_blockVS7[R1i.x].xyzw);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(abs(intBitsToFloat(R3i.x)) + intBitsToFloat(R0i.y));
R125i.y = 0xfffffffd + R0i.x;
R126i.z = 0xfffffffe + R0i.x;
PV0iw = int(-1) + R0i.x;
PS0i = floatBitsToInt(float(R0i.x));
// 1
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
PV1iz = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
R123i.w = ((-(intBitsToFloat(R0i.y)) > 0.0)?(PV0ix):(R0i.y));
PS1i = floatBitsToInt(float(PV0iw));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + -(intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt((intBitsToFloat(PS1i) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(PS1i))?1.0:0.0);
R126i.w = ((intBitsToFloat(R3i.x) == 0.0)?(0):(R123i.w));
PS0i = floatBitsToInt(float(R126i.z));
// 3
PV1ix = floatBitsToInt((intBitsToFloat(PS0i) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt((0.0 > intBitsToFloat(PS0i))?1.0:0.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), uf_blockVS7[45].x));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) * 2.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iz)));
R127i.w = int(intBitsToFloat(PV0ix));
// 4
PV0ix = 0 - R127i.w;
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(uf_blockVS7[44].z + uf_blockVS7[45].x);
R127i.z = int(intBitsToFloat(PV1iw));
// 5
PV1ix = 0 - R127i.z;
PV1iy = max(R127i.w, PV0ix);
R126i.z = floatBitsToInt(-(intBitsToFloat(R126i.z)) + intBitsToFloat(PV0iw));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), uf_blockVS7[45].y));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
R127i.y = int(intBitsToFloat(PV0iz));
// 6
PV0ix = max(R127i.z, PV1ix);
PV0iy = int(1) - PV1iy;
PV0iz = 0 - R127i.y;
PV0iw = floatBitsToInt(uf_blockVS7[44].w + uf_blockVS7[45].y);
R126i.x = floatBitsToInt(float(R125i.y));
// 7
R127i.x = floatBitsToInt(-(intBitsToFloat(R127i.w)) + intBitsToFloat(PV0iw));
PV1iy = int(1) - PV0ix;
R127i.z = floatBitsToInt((intBitsToFloat(R126i.x) > 0.0)?1.0:0.0);
PV1iw = max(R127i.y, PV0iz);
R127i.y = PV0iy * R1i.x;
// 8
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(R126i.x))?1.0:0.0);
PV0iy = floatBitsToInt(uf_blockVS7[46].x + uf_blockVS7[46].z);
PV0iz = int(1) - PV1iw;
PV0iw = floatBitsToInt(uf_blockVS7[46].y + uf_blockVS7[46].w);
PS0i = PV1iy * R1i.y;
// 9
PV1ix = PS0i + R127i.y;
PV1iy = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(PV0ix)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),uf_blockVS7[46].z) + intBitsToFloat(PV0iy));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),uf_blockVS7[46].w) + intBitsToFloat(PV0iw));
PS1i = PV0iz * R1i.z;
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y),uf_blockVS7[45].z) + intBitsToFloat(R123i.z));
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R11i.y)),uf_blockVS7[44].x) + -(intBitsToFloat(R126i.z)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y),uf_blockVS7[44].y) + intBitsToFloat(R127i.x));
R125i.w = PS1i + PV1ix;
R127i.x = int(intBitsToFloat(PV1iy));
// 11
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y),uf_blockVS7[45].w) + intBitsToFloat(R127i.w));
R124i.y = floatBitsToInt(intBitsToFloat(R2i.x) + 0.5);
R125i.z = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + 1.0);
PV1iw = 0 - R127i.x;
R127i.y = int(intBitsToFloat(R126i.w));
// 12
R126i.x = floatBitsToInt(intBitsToFloat(R2i.w) + -(0.5));
R123i.y = ((R2i.z == 0)?(0):(int(1)));
PV0iz = max(R127i.x, PV1iw);
R126i.w = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R3i.x));
// 13
R127i.x = (R123i.y == int(1))?-1:0;
PV1iy = int(1) - PV0iz;
PV1iz = (R123i.y == 0x2)?-1:0;
PV1iw = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
PS1i = floatBitsToInt(1.0 / uf_blockVS7[48].z);
// 14
R123i.x = ((PV1iz == 0)?(R4i.y):(R4i.x));
R123i.y = ((PV1iz == 0)?(R4i.x):(R4i.z));
PV0iz = floatBitsToInt(trunc(intBitsToFloat(PV1iw)));
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].x, intBitsToFloat(PS1i)));
PS0i = PV1iy * R1i.w;
// 15
R123i.x = ((R127i.x == 0)?(R123i.x):(R4i.z));
R1i.y = ((R127i.x == 0)?(R4i.x):(R4i.y));
R3i.z = PS0i + R125i.w;
R123i.w = ((R127i.x == 0)?(R123i.y):(R4i.y));
R126i.y = int(intBitsToFloat(PV0iz));
// 16
R127i.x = ((R127i.x == 0)?(R4i.y):(R4i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[50].x, intBitsToFloat(R123i.w)));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 2.0);
R125i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[50].y, intBitsToFloat(R123i.x)));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) * 2.0);
PS0i = floatBitsToInt(1.0 / uf_blockVS7[48].w);
// 17
backupReg0i = R127i.y;
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[48].y, intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(float(backupReg0i));
// 18
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PS1i)) + intBitsToFloat(R125i.y));
PV0iy = floatBitsToInt(uf_blockVS7[49].z + uf_blockVS7[50].x);
PV0iz = floatBitsToInt(uf_blockVS7[49].w + uf_blockVS7[50].y);
PS0i = floatBitsToInt(float(R126i.y));
// 19
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(R124i.y)) + intBitsToFloat(R123i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)),intBitsToFloat(PS0i)) + intBitsToFloat(R126i.z));
R127i.z = floatBitsToInt(-(intBitsToFloat(R127i.z)) + intBitsToFloat(PV0iy));
R127i.w = floatBitsToInt(-(intBitsToFloat(R125i.w)) + intBitsToFloat(PV0iz));
PS1i = int(uf_blockVS7[53].z);
// 20
R6i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.x)),intBitsToFloat(R125i.z)) + intBitsToFloat(R123i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)),intBitsToFloat(R126i.x)) + -(intBitsToFloat(R123i.y)));
PV0iz = floatBitsToInt(uf_blockVS7[51].x + uf_blockVS7[51].z);
PV0iw = floatBitsToInt(uf_blockVS7[51].y + uf_blockVS7[51].w);
R1i.z = floatBitsToInt(float(PS1i));
// 21
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[51].w,intBitsToFloat(R127i.x)) + intBitsToFloat(PV0iw));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R126i.w)) + intBitsToFloat(R123i.y));
PV1iz = floatBitsToInt(-(abs(intBitsToFloat(R1i.z))) + 0.0);
R123i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[51].z,intBitsToFloat(R1i.y)) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt((0.0 >= abs(intBitsToFloat(R1i.z)))?1.0:0.0);
// 22
R0i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R11i.y)),uf_blockVS7[49].x) + -(intBitsToFloat(R127i.z)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y),uf_blockVS7[49].y) + intBitsToFloat(R127i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y),uf_blockVS7[50].z) + intBitsToFloat(R123i.w));
R127i.w = ((intBitsToFloat(PS1i) == 0.0)?(0):(PV1iz));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R1i.z));
// 23
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y),uf_blockVS7[50].w) + intBitsToFloat(R127i.x));
PV1iy = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
PV1iz = floatBitsToInt(abs(intBitsToFloat(R1i.z)) + intBitsToFloat(R127i.w));
R1i.w = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
PS1i = floatBitsToInt(1.0 / uf_blockVS7[53].z);
// 24
R2i.x = floatBitsToInt(trunc(intBitsToFloat(PV1iy)));
R1i.y = ((-(intBitsToFloat(R127i.w)) > 0.0)?(PV1iz):(R127i.w));
R0i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[53].x, intBitsToFloat(PS1i)));
R2i.w = floatBitsToInt(intBitsToFloat(R5i.z) + 0.5);
R1i.x = floatBitsToInt(1.0 / uf_blockVS7[53].w);
}
if( activeMaskStackC[3] == true ) {
// 0
R123i.x = ((intBitsToFloat(R1i.z) == 0.0)?(0):(R1i.y));
R124i.y = floatBitsToInt(-(intBitsToFloat(R3i.x)) + 1.0);
R127i.z = floatBitsToInt(intBitsToFloat(R2i.y) + -(0.5));
R126i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS7[53].y, intBitsToFloat(R1i.x)));
R127i.w = int(intBitsToFloat(R2i.x));
// 1
R123i.z = ((R2i.z == 0)?(0):(0x2));
PS1i = int(intBitsToFloat(R123i.x));
// 2
PV0ix = (R123i.z == 0x2)?-1:0;
R127i.y = (R123i.z == int(1))?-1:0;
R125i.z = floatBitsToInt(uf_blockVS7[54].z + uf_blockVS7[55].x);
PS0i = floatBitsToInt(float(PS1i));
// 3
R123i.x = ((PV0ix == 0)?(R4i.y):(R4i.x));
R126i.y = ((R127i.y == 0)?(R4i.x):(R4i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(PS0i)) + intBitsToFloat(R0i.x));
R123i.w = ((PV0ix == 0)?(R4i.x):(R4i.z));
PS1i = floatBitsToInt(float(R127i.w));
// 4
R123i.x = ((R127i.y == 0)?(R123i.x):(R4i.z));
R123i.y = ((R127i.y == 0)?(R123i.w):(R4i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R2i.w)) + intBitsToFloat(R123i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.w)),intBitsToFloat(PS1i)) + intBitsToFloat(R0i.y));
R126i.z = ((R127i.y == 0)?(R4i.y):(R4i.z));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockVS7[55].x, intBitsToFloat(R123i.y)));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS7[55].y, intBitsToFloat(R123i.x)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
R6i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.z)),intBitsToFloat(R1i.w)) + intBitsToFloat(R123i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.w)),intBitsToFloat(R127i.z)) + -(intBitsToFloat(R123i.w)));
PS1i = int(uf_blockVS7[58].z);
// 6
backupReg0i = R124i.y;
PV0ix = floatBitsToInt(uf_blockVS7[54].w + uf_blockVS7[55].y);
R124i.y = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(R125i.z));
R124i.z = floatBitsToInt(intBitsToFloat(R5i.x) + 0.5);
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(backupReg0i)) + intBitsToFloat(R123i.w));
R124i.x = floatBitsToInt(float(PS1i));
// 7
R126i.x = floatBitsToInt(abs(intBitsToFloat(R124i.x)));
PV1iy = floatBitsToInt(uf_blockVS7[56].x + uf_blockVS7[56].z);
R125i.z = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(uf_blockVS7[56].y + uf_blockVS7[56].w);
R126i.w = floatBitsToInt(float(R3i.z));
// 8
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[56].z,intBitsToFloat(R126i.y)) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(R126i.w))?1.0:0.0);
R126i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[56].w,intBitsToFloat(R126i.z)) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt((intBitsToFloat(R126i.w) > 0.0)?1.0:0.0);
R127i.z = floatBitsToInt(float(R3i.z));
// 9
backupReg0i = R125i.z;
R125i.x = floatBitsToInt(abs(intBitsToFloat(R127i.z)));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iy)));
R125i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R11i.y)),uf_blockVS7[54].x) + -(intBitsToFloat(R124i.y)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y),uf_blockVS7[54].y) + intBitsToFloat(backupReg0i));
PS1i = floatBitsToInt(1.0 / abs(intBitsToFloat(R124i.x)));
// 10
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * 0.5 + intBitsToFloat(R126i.w));
PV0iy = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R127i.z)), intBitsToFloat(PS1i)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y),uf_blockVS7[55].w) + intBitsToFloat(R126i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y),uf_blockVS7[55].z) + intBitsToFloat(R127i.x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R124i.x));
// 11
R127i.x = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
R126i.y = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
PV1iz = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(trunc(intBitsToFloat(PV0iy)));
PS1i = floatBitsToInt(1.0 / uf_blockVS7[58].z);
// 12
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iw)),intBitsToFloat(R126i.x)) + intBitsToFloat(R125i.x));
PV0iy = floatBitsToInt(trunc(intBitsToFloat(PV1iz)));
R126i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS7[58].x, intBitsToFloat(PS1i)));
R126i.w = floatBitsToInt(intBitsToFloat(R0i.w) + -(0.5));
PS0i = floatBitsToInt(1.0 / uf_blockVS7[58].w);
// 13
R125i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS7[58].y, intBitsToFloat(PS0i)));
R13i.y = floatBitsToInt(uf_blockVS7[104].x);
PV1iz = floatBitsToInt((intBitsToFloat(R126i.x) >= abs(intBitsToFloat(R124i.x)))?1.0:0.0);
PV1iw = floatBitsToInt(-(abs(intBitsToFloat(R124i.x))) + intBitsToFloat(R126i.x));
PS1i = int(intBitsToFloat(PV0iy));
// 14
R124i.y = ((intBitsToFloat(PV1iz) == 0.0)?(R126i.x):(PV1iw));
PS0i = floatBitsToInt(float(PS1i));
// 15
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.x)),intBitsToFloat(PS0i)) + intBitsToFloat(R127i.w));
PV1iy = floatBitsToInt(abs(intBitsToFloat(R124i.x)) + intBitsToFloat(R124i.y));
// 16
backupReg0i = R123i.x;
R123i.x = ((-(intBitsToFloat(R124i.y)) > 0.0)?(PV1iy):(R124i.y));
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.x)),intBitsToFloat(R126i.w)) + -(intBitsToFloat(backupReg0i)));
// 17
R123i.z = ((-(intBitsToFloat(R127i.z)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.x)))):(R123i.x));
// 18
R123i.y = ((intBitsToFloat(R124i.x) == 0.0)?(R127i.z):(R123i.z));
// 19
PS1i = int(intBitsToFloat(R123i.y));
// 20
PS0i = floatBitsToInt(float(PS1i));
// 21
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(PS0i)) + intBitsToFloat(R125i.z));
// 22
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(R124i.z)) + intBitsToFloat(R123i.w));
// 23
R16i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.x)),intBitsToFloat(R126i.y)) + intBitsToFloat(R123i.w));
R16i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R127i.x)) + intBitsToFloat(R126i.w));
}
if( activeMaskStackC[3] == true ) {
// 0
R13i.x = floatBitsToInt(uf_blockVS8[3].x * 1.0 + 0.0);
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
SET_POSITION(vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.y), intBitsToFloat(R7i.z), intBitsToFloat(R7i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
// skipped export to semanticId 255
// export
passParameterSem8 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.z), intBitsToFloat(R6i.w));
// export
passParameterSem10 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
// export
passParameterSem11 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w));
// export
passParameterSem13 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.z));
// export
passParameterSem9 = vec4(intBitsToFloat(R16i.x), intBitsToFloat(R16i.y), intBitsToFloat(R16i.z), intBitsToFloat(R16i.z));
}
