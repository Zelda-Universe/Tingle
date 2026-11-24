#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;

vec4 zmCube(sampler2DArray s, vec2 st, int face, float cubeIndex, float lod) {
	return textureLod(s, vec3(st - 1.0, float(face) + cubeIndex * 6.0), lod);
}
// shader 9a635cf22fff1eca
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[2];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2DArray textureUnitPS0;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem5;
in vec4 passParameterSem7;
layout(location = 0) out vec4 passPixelColor0;
// end of shader inputs/outputs
void redcCUBE(vec4 src0, vec4 src1, out vec3 stm, out int faceId)
{
// stm -> x .. s, y .. t, z .. MajorAxis*2.0
vec3 inputCoord = normalize(vec3(src1.y, src1.x, src0.x));
float rx = inputCoord.x;
float ry = inputCoord.y;
float rz = inputCoord.z;
if( abs(rx) > abs(ry) && abs(rx) > abs(rz) )
{
stm.z = rx*2.0;
stm.xy = vec2(ry,rz);	
if( rx >= 0.0 )
{
faceId = 0;
}
else
{
faceId = 1;
}
}
else if( abs(ry) > abs(rx) && abs(ry) > abs(rz) )
{
stm.z = ry*2.0;
stm.xy = vec2(rx,rz);	
if( ry >= 0.0 )
{
faceId = 2;
}
else
{
faceId = 3;
}
}
else //if( abs(rz) > abs(ry) && abs(rz) > abs(rx) )
{
stm.z = rz*2.0;
stm.xy = vec2(rx,ry);	
if( rz >= 0.0 )
{
faceId = 4;
}
else
{
faceId = 5;
}
}
}
vec3 redcCUBEReverse(vec2 st, int faceId)
{
st.yx = st.xy;
vec3 v;
float majorAxis = 1.0;
if( faceId == 0 )
{
v.yz = (st-vec2(1.5))*(majorAxis*2.0);
v.x = 1.0;
}
else if( faceId == 1 )
{
v.yz = (st-vec2(1.5))*(majorAxis*2.0);
v.x = -1.0;
}
else if( faceId == 2 )
{
v.xz = (st-vec2(1.5))*(majorAxis*2.0);
v.y = 1.0;
}
else if( faceId == 3 )
{
v.xz = (st-vec2(1.5))*(majorAxis*2.0);
v.y = -1.0;
}
else if( faceId == 4 )
{
v.xy = (st-vec2(1.5))*(majorAxis*2.0);
v.z = 1.0;
}
else
{
v.xy = (st-vec2(1.5))*(majorAxis*2.0);
v.z = -1.0;
}
return v;
}
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
ivec4 R122i = ivec4(0);
ivec4 R123i = ivec4(0);
ivec4 R124i = ivec4(0);
ivec4 R125i = ivec4(0);
ivec4 R126i = ivec4(0);
ivec4 R127i = ivec4(0);
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
vec3 cubeMapSTM;
int cubeMapFaceId;
float cubeMapArrayIndex0 = 0.0;
R0i = floatBitsToInt(passParameterSem0);
R1i = floatBitsToInt(passParameterSem1);
R2i = floatBitsToInt(passParameterSem3);
R3i = floatBitsToInt(passParameterSem4);
R4i = floatBitsToInt(passParameterSem5);
R5i = floatBitsToInt(passParameterSem7);
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(intBitsToFloat(R2i.z) * intBitsToFloat(R2i.z));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 2
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PS1i)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PS1i)));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PS1i)));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 3
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PS0i)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PS0i)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PS0i)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 5
R6i.z = floatBitsToInt(intBitsToFloat(PV0ix) + 1.0);
// 6
predResult = (intBitsToFloat(R6i.z) > 0.0);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R2i.x)));
PV0iy = R6i.z;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R2i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R2i.y)));
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.y)),intBitsToFloat(R2i.z)) + intBitsToFloat(PV0iw));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.x)),intBitsToFloat(R2i.y)) + intBitsToFloat(PV0ix));
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.z)),intBitsToFloat(R2i.x)) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0iy)));
// 2
PV0iy = PS1i;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
R0i.w = PS1i;
// 3
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 4
R2i.x = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS1i));
R2i.y = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
R2i.z = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(PS1i));
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R2i.x = 0;
R2i.y = 0;
R2i.z = 0;
R0i.w = 0x3f800000;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R0i.w)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R2i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R0i.w)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R2i.z)));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R2i.x)));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(R127i.w));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R0i.w)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R2i.z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y)));
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R2i.z)));
// 2
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV1iw));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
R125i.y = floatBitsToInt(-(intBitsToFloat(PV1ix)) + 0.5);
R125i.y = floatBitsToInt(intBitsToFloat(R125i.y) * 2.0);
PV0iz = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(R127i.w));
R125i.w = floatBitsToInt(-(intBitsToFloat(R127i.z)) + intBitsToFloat(R126i.z));
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) * 2.0);
R2i.z = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + intBitsToFloat(PV1iw));
R2i.z = floatBitsToInt(intBitsToFloat(R2i.z) * 2.0);
// 3
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(-(intBitsToFloat(PV0iz)) + 0.5);
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) * 2.0);
PV1iy = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(R127i.y));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R125i.y)));
R124i.w = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(R125i.x));
R124i.w = floatBitsToInt(intBitsToFloat(R124i.w) * 2.0);
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.x)));
// 4
R2i.x = floatBitsToInt(-(intBitsToFloat(R126i.y)) + intBitsToFloat(R125i.x));
R2i.x = floatBitsToInt(intBitsToFloat(R2i.x) * 2.0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R125i.w)));
R126i.z = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(R126i.z));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) * 2.0);
R0i.w = floatBitsToInt(-(intBitsToFloat(PV1iy)) + 0.5);
R0i.w = floatBitsToInt(intBitsToFloat(R0i.w) * 2.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R125i.y)));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R127i.x)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R126i.x)) + intBitsToFloat(R124i.z));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R125i.w)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R2i.z)) + intBitsToFloat(R125i.z));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R124i.w)) + intBitsToFloat(PV0iy));
// 6
backupReg0i = R123i.y;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R124i.w)) + intBitsToFloat(PV1iz));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R2i.z)) + intBitsToFloat(R127i.z));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R0i.w)) + intBitsToFloat(R122i.x));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R126i.x)) + intBitsToFloat(PV1ix));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R2i.x)) + intBitsToFloat(backupReg0i));
// 7
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R126i.z)) + intBitsToFloat(R127i.w));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R127i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R125i.w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R125i.y)));
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R126i.z)) + intBitsToFloat(R123i.y));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R2i.z)) + intBitsToFloat(PV1iw));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R2i.x)) + intBitsToFloat(R126i.w));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R0i.w)) + intBitsToFloat(R125i.x));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R126i.x)) + intBitsToFloat(PV1iy));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R124i.w)) + intBitsToFloat(PV1iz));
// 9
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R127i.x)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R125i.y)));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)) + intBitsToFloat(R122i.x));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R125i.w)));
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R126i.z)) + intBitsToFloat(R123i.x));
// 10
redcCUBE(vec4(intBitsToFloat(R124i.z),intBitsToFloat(R124i.z),intBitsToFloat(R124i.x),intBitsToFloat(R124i.y)),vec4(intBitsToFloat(R124i.y),intBitsToFloat(R124i.x),intBitsToFloat(R124i.z),intBitsToFloat(R124i.z)),cubeMapSTM,cubeMapFaceId);
R5i.x = floatBitsToInt(cubeMapSTM.x);
R5i.y = floatBitsToInt(cubeMapSTM.y);
R5i.z = floatBitsToInt(cubeMapSTM.z);
R5i.w = cubeMapFaceId;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R2i.z)) + intBitsToFloat(PV1iy));
// 11
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(R126i.z)) + intBitsToFloat(R122i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R124i.w)) + intBitsToFloat(R125i.w));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R126i.x)) + intBitsToFloat(R127i.x));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R2i.x)) + intBitsToFloat(R126i.w));
R127i.x = floatBitsToInt(1.0 / abs(intBitsToFloat(R5i.z)));
// 12
backupReg0i = R0i.w;
redcCUBE(vec4(intBitsToFloat(R3i.z),intBitsToFloat(R3i.z),intBitsToFloat(R3i.x),intBitsToFloat(R3i.y)),vec4(intBitsToFloat(R3i.y),intBitsToFloat(R3i.x),intBitsToFloat(R3i.z),intBitsToFloat(R3i.z)),cubeMapSTM,cubeMapFaceId);
R0i.x = floatBitsToInt(cubeMapSTM.x);
R0i.y = floatBitsToInt(cubeMapSTM.y);
R0i.z = floatBitsToInt(cubeMapSTM.z);
R0i.w = cubeMapFaceId;
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(backupReg0i)) + intBitsToFloat(R123i.y));
// 13
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(R2i.x)) + intBitsToFloat(R126i.z));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R127i.x)) + 1.5);
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R127i.x)) + 1.5);
R126i.w = floatBitsToInt(1.0 / abs(intBitsToFloat(R0i.z)));
// 14
redcCUBE(vec4(intBitsToFloat(R4i.z),intBitsToFloat(R4i.z),intBitsToFloat(R4i.x),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(R4i.w),intBitsToFloat(R4i.x),intBitsToFloat(R4i.z),intBitsToFloat(R4i.z)),cubeMapSTM,cubeMapFaceId);
R127i.x = floatBitsToInt(cubeMapSTM.x);
R127i.y = floatBitsToInt(cubeMapSTM.y);
R127i.z = floatBitsToInt(cubeMapSTM.z);
R127i.w = cubeMapFaceId;
R2i.x = floatBitsToInt(float(uf_remappedPS[0].x));
// 15
R4i.x = R126i.z;
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R126i.w)) + 1.5);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R126i.w)) + 1.5);
R4i.w = uf_remappedPS[1].x;
R4i.y = R125i.w;
// 16
R5i.x = R123i.y;
R5i.y = R123i.z;
R4i.z = R5i.w;
R5i.w = uf_remappedPS[1].x;
R125i.y = floatBitsToInt(1.0 / abs(intBitsToFloat(R127i.z)));
// 17
backupReg0i = R124i.x;
backupReg1i = R124i.y;
backupReg2i = R124i.z;
redcCUBE(vec4(intBitsToFloat(backupReg2i),intBitsToFloat(backupReg2i),intBitsToFloat(backupReg0i),intBitsToFloat(backupReg1i)),vec4(intBitsToFloat(backupReg1i),intBitsToFloat(backupReg0i),intBitsToFloat(backupReg2i),intBitsToFloat(backupReg2i)),cubeMapSTM,cubeMapFaceId);
R124i.x = floatBitsToInt(cubeMapSTM.x);
R124i.y = floatBitsToInt(cubeMapSTM.y);
R124i.z = floatBitsToInt(cubeMapSTM.z);
R124i.w = cubeMapFaceId;
R5i.z = R0i.w;
// 18
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y)) + 1.5);
R0i.z = R127i.w;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R125i.y)) + 1.5);
PS0i = floatBitsToInt(1.0 / abs(intBitsToFloat(R124i.z)));
// 19
R0i.x = R123i.w;
R0i.y = R123i.x;
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),intBitsToFloat(PS0i)) + 1.5);
R0i.w = uf_remappedPS[1].x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(PS0i)) + 1.5);
// 20
R1i.x = R122i.x;
R1i.y = R123i.z;
R1i.z = R124i.w;
R1i.w = uf_remappedPS[1].x;
}
if( activeMaskStackC[1] == true ) {
cubeMapArrayIndex0 = intBitsToFloat(R2i.x);
R4i.xyzw = floatBitsToInt(zmCube(textureUnitPS0, intBitsToFloat(R4i.xy), R4i.z, cubeMapArrayIndex0, intBitsToFloat(R4i.w)).xyzw);
cubeMapArrayIndex0 = intBitsToFloat(R2i.x);
R5i.xyzw = floatBitsToInt(zmCube(textureUnitPS0, intBitsToFloat(R5i.xy), R5i.z, cubeMapArrayIndex0, intBitsToFloat(R5i.w)).xyzw);
cubeMapArrayIndex0 = intBitsToFloat(R2i.x);
R0i.xyzw = floatBitsToInt(zmCube(textureUnitPS0, intBitsToFloat(R0i.xy), R0i.z, cubeMapArrayIndex0, intBitsToFloat(R0i.w)).xyzw);
cubeMapArrayIndex0 = intBitsToFloat(R2i.x);
R1i.xyzw = floatBitsToInt(zmCube(textureUnitPS0, intBitsToFloat(R1i.xy), R1i.z, cubeMapArrayIndex0, intBitsToFloat(R1i.w)).xyzw);
}
if( activeMaskStackC[1] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R4i.y) * 0.390625);
PV0iy = floatBitsToInt(intBitsToFloat(R4i.x) * 0.390625);
PV0iz = floatBitsToInt(intBitsToFloat(R4i.w) * 0.390625);
PV0iw = floatBitsToInt(intBitsToFloat(R4i.z) * 0.390625);
// 1
R123i.x = floatBitsToInt(intBitsToFloat(R5i.y) * 0.109375 + intBitsToFloat(PV0ix));
R123i.y = floatBitsToInt(intBitsToFloat(R5i.x) * 0.109375 + intBitsToFloat(PV0iy));
R123i.z = floatBitsToInt(intBitsToFloat(R5i.w) * 0.109375 + intBitsToFloat(PV0iz));
R123i.w = floatBitsToInt(intBitsToFloat(R5i.z) * 0.109375 + intBitsToFloat(PV0iw));
// 2
backupReg0i = R123i.x;
backupReg1i = R123i.y;
backupReg2i = R123i.z;
R123i.x = floatBitsToInt(intBitsToFloat(R0i.z) * 0.390625 + intBitsToFloat(R123i.w));
R123i.y = floatBitsToInt(intBitsToFloat(R0i.y) * 0.390625 + intBitsToFloat(backupReg0i));
R123i.z = floatBitsToInt(intBitsToFloat(R0i.x) * 0.390625 + intBitsToFloat(backupReg1i));
R123i.w = floatBitsToInt(intBitsToFloat(R0i.w) * 0.390625 + intBitsToFloat(backupReg2i));
// 3
backupReg0i = R123i.x;
backupReg1i = R123i.y;
backupReg2i = R123i.z;
R123i.x = floatBitsToInt(intBitsToFloat(R1i.w) * 0.109375 + intBitsToFloat(R123i.w));
R123i.y = floatBitsToInt(intBitsToFloat(R1i.z) * 0.109375 + intBitsToFloat(backupReg0i));
R123i.z = floatBitsToInt(intBitsToFloat(R1i.y) * 0.109375 + intBitsToFloat(backupReg1i));
R123i.w = floatBitsToInt(intBitsToFloat(R1i.x) * 0.109375 + intBitsToFloat(backupReg2i));
// 4
R1i.x = floatBitsToInt(max(intBitsToFloat(R123i.w), 0.0));
R1i.y = floatBitsToInt(max(intBitsToFloat(R123i.z), 0.0));
R1i.z = floatBitsToInt(max(intBitsToFloat(R123i.y), 0.0));
R1i.w = floatBitsToInt(max(intBitsToFloat(R123i.x), 0.0));
}
// export
passPixelColor0 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
}
