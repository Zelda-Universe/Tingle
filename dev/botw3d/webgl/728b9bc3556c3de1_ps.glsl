#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;

vec4 zmCube(sampler2DArray s, vec2 st, int face, float cubeIndex, float lod) {
	return textureLod(s, vec3(st - 1.0, float(face) + cubeIndex * 6.0), lod);
}
// shader 728b9bc3556c3de1
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[8];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2DArray textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 2) uniform sampler2D textureUnitPS2;
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
ivec4 R122i = ivec4(0);
ivec4 R123i = ivec4(0);
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
bool activeMaskStack[8];
bool activeMaskStackC[9];
activeMaskStack[0] = false;
activeMaskStack[1] = false;
activeMaskStack[2] = false;
activeMaskStack[3] = false;
activeMaskStack[4] = false;
activeMaskStack[5] = false;
activeMaskStack[6] = false;
activeMaskStackC[0] = false;
activeMaskStackC[1] = false;
activeMaskStackC[2] = false;
activeMaskStackC[3] = false;
activeMaskStackC[4] = false;
activeMaskStackC[5] = false;
activeMaskStackC[6] = false;
activeMaskStackC[7] = false;
activeMaskStack[0] = true;
activeMaskStackC[0] = true;
activeMaskStackC[1] = true;
vec3 cubeMapSTM;
int cubeMapFaceId;
float cubeMapArrayIndex0 = 0.0;
R0i = floatBitsToInt(GET_FRAGCOORD());
if( activeMaskStackC[1] == true ) {
// 0
R1i.y = 0x3f000000;
R1i.w = 0;
}
if( activeMaskStackC[1] == true ) {
R2i.w = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R1i.y),intBitsToFloat(R1i.y))).x);
R2i.xyz = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R1i.w),intBitsToFloat(R1i.w))).xyz);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(uf_remappedPS[0].w)));
PS0i = floatBitsToInt(intBitsToFloat(R2i.z) * intBitsToFloat(0x3dea4a8c));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R1i.x)));
R122i.x = floatBitsToInt(intBitsToFloat(R2i.y) * intBitsToFloat(0x3f162b6b) + intBitsToFloat(PS0i));
// 2
R0i.z = floatBitsToInt(intBitsToFloat(R2i.x) * intBitsToFloat(0x3e99096c) + intBitsToFloat(R122i.x));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PV1ix)));
// 3
predResult = (1.0 > intBitsToFloat(R0i.x));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R2i.x = R1i.x;
R2i.y = floatBitsToInt(intBitsToFloat(R1i.x) * intBitsToFloat(0x3f99999a));
R2i.y = clampFI32(R2i.y);
R2i.z = uf_remappedPS[1].w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (2.0 > intBitsToFloat(R0i.x));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[2].y)) + intBitsToFloat(uf_remappedPS[2].z));
// 1
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[3].z)) + 1.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R1i.z)) + intBitsToFloat(uf_remappedPS[2].y));
// 2
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].w), intBitsToFloat(uf_remappedPS[2].w)));
PV0iy = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(R123i.z));
// 3
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 4
R2i.x = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(PS1i));
R2i.y = uf_remappedPS[3].y;
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R1i.z)) + intBitsToFloat(uf_remappedPS[3].z));
}
activeMaskStack[2] = activeMaskStack[2] == false;
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (4.0 > intBitsToFloat(R0i.x));
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.x = 0;
PV0iy = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(uf_remappedPS[4].y));
PV0iz = ((intBitsToFloat(R0i.x) > 3.0)?-1:0);
R0i.w = 0x40400000;
// 1
R127i.y = ((PV0iz == 0)?(0x3f800000):(0xbf800000));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 2
backupReg0i = R127i.x;
backupReg1i = R127i.y;
redcCUBE(vec4(intBitsToFloat(backupReg0i),intBitsToFloat(backupReg0i),intBitsToFloat(backupReg0i),intBitsToFloat(backupReg1i)),vec4(intBitsToFloat(backupReg1i),intBitsToFloat(backupReg0i),intBitsToFloat(backupReg0i),intBitsToFloat(backupReg0i)),cubeMapSTM,cubeMapFaceId);
R127i.x = floatBitsToInt(cubeMapSTM.x);
R127i.y = floatBitsToInt(cubeMapSTM.y);
R127i.z = floatBitsToInt(cubeMapSTM.z);
R127i.w = cubeMapFaceId;
R1i.w = floatBitsToInt(intBitsToFloat(uf_remappedPS[1].w) * intBitsToFloat(PS1i));
// 3
R0i.z = R127i.w;
PS1i = floatBitsToInt(1.0 / abs(intBitsToFloat(R127i.z)));
// 4
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PS1i)) + 1.5);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PS1i)) + 1.5);
// 5
R0i.x = R123i.z;
R0i.y = R123i.w;
}
if( activeMaskStackC[4] == true ) {
R0i.xyz = floatBitsToInt(zmCube(textureUnitPS0, intBitsToFloat(R0i.xy), R0i.z, cubeMapArrayIndex0, intBitsToFloat(R0i.w)).xyz);
}
if( activeMaskStackC[4] == true ) {
// 0
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R1i.w)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R1i.w)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R1i.w)));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
activeMaskStack[4] = activeMaskStack[3];
activeMaskStackC[5] = activeMaskStackC[4];
// 0
predResult = (6.0 > intBitsToFloat(R0i.x));
activeMaskStack[4] = predResult;
activeMaskStackC[5] = predResult == true && activeMaskStackC[4] == true;
}
else {
activeMaskStack[4] = false;
activeMaskStackC[5] = false;
}
if( activeMaskStackC[5] == true ) {
// 0
R126i.x = uf_remappedPS[5].x;
PV0iy = ((intBitsToFloat(R0i.x) > 5.0)?-1:0);
R127i.z = uf_remappedPS[5].z;
R0i.w = 0x40400000;
// 1
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[4].z)) + intBitsToFloat(uf_remappedPS[4].w));
R1i.y = floatBitsToInt(intBitsToFloat(uf_remappedPS[6].w) + -(1.0));
R123i.w = ((PV0iy == 0)?(0):(0x3f800000));
// 2
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(uf_remappedPS[6].y)) + intBitsToFloat(uf_remappedPS[6].z));
// 3
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[3].x)) + 1.0);
R127i.y = floatBitsToInt(-2.0 * intBitsToFloat(R123i.z) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(R1i.z)) + intBitsToFloat(uf_remappedPS[4].z));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.z = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(R123i.w));
// 5
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R1i.z)) + intBitsToFloat(uf_remappedPS[3].x));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS1i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS1i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.z));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedPS[1].w) * intBitsToFloat(PS0i));
R127i.z = floatBitsToInt(intBitsToFloat(PV0ix) * -(1.0));
// 8
backupReg0i = R127i.y;
backupReg1i = R127i.z;
redcCUBE(vec4(intBitsToFloat(backupReg1i),intBitsToFloat(backupReg1i),intBitsToFloat(R127i.w),intBitsToFloat(backupReg0i)),vec4(intBitsToFloat(backupReg0i),intBitsToFloat(R127i.w),intBitsToFloat(backupReg1i),intBitsToFloat(backupReg1i)),cubeMapSTM,cubeMapFaceId);
R127i.x = floatBitsToInt(cubeMapSTM.x);
R127i.y = floatBitsToInt(cubeMapSTM.y);
R127i.z = floatBitsToInt(cubeMapSTM.z);
R127i.w = cubeMapFaceId;
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].x), intBitsToFloat(PV1ix)));
// 9
R0i.z = R127i.w;
PS1i = floatBitsToInt(1.0 / abs(intBitsToFloat(R127i.z)));
// 10
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PS1i)) + 1.5);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PS1i)) + 1.5);
// 11
R0i.x = R123i.y;
R0i.y = R123i.z;
}
if( activeMaskStackC[5] == true ) {
R0i.xyz = floatBitsToInt(zmCube(textureUnitPS0, intBitsToFloat(R0i.xy), R0i.z, cubeMapArrayIndex0, intBitsToFloat(R0i.w)).xyz);
}
if( activeMaskStackC[5] == true ) {
// 0
PV0ix = floatBitsToInt(min(intBitsToFloat(R0i.y), intBitsToFloat(R0i.z)));
PV0iz = floatBitsToInt(max(intBitsToFloat(R0i.y), intBitsToFloat(R0i.z)));
// 1
R126i.y = floatBitsToInt(max(intBitsToFloat(R0i.x), intBitsToFloat(PV0iz)));
R127i.w = floatBitsToInt(min(intBitsToFloat(R0i.x), intBitsToFloat(PV0ix)));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(0x2edbe6ff));
R127i.y = floatBitsToInt(intBitsToFloat(R0i.x) + -(intBitsToFloat(R126i.y)));
R127i.z = floatBitsToInt(intBitsToFloat(R0i.z) + -(intBitsToFloat(R126i.y)));
R126i.w = floatBitsToInt(intBitsToFloat(R0i.y) + -(intBitsToFloat(R126i.y)));
// 3
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 4
PV0iz = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
// 5
PV1iy = floatBitsToInt(-(intBitsToFloat(PV0iz)) + 1.0);
// 6
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(0x38d1b717));
// 7
tempResultf = max(0.0, intBitsToFloat(PV0iz));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 8
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PS1i)));
// 9
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iw)));
// 10
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PS1i)));
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PV0iy)) + intBitsToFloat(R126i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PV0iy)) + intBitsToFloat(R126i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV0iy)) + intBitsToFloat(R126i.y));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(R1i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R1i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R1i.z)));
// 13
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(uf_remappedPS[7].x)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedPS[7].y)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedPS[7].z)));
}
activeMaskStack[4] = activeMaskStack[4] == false;
activeMaskStackC[5] = activeMaskStack[4] == true && activeMaskStackC[4] == true;
if( activeMaskStackC[5] == true ) {
activeMaskStack[5] = activeMaskStack[4];
activeMaskStackC[6] = activeMaskStackC[5];
// 0
predResult = (8.0 > intBitsToFloat(R0i.x));
activeMaskStack[5] = predResult;
activeMaskStackC[6] = predResult == true && activeMaskStackC[5] == true;
}
else {
activeMaskStack[5] = false;
activeMaskStackC[6] = false;
}
if( activeMaskStackC[6] == true ) {
// 0
PV0iz = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(uf_remappedPS[4].x));
// 1
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedPS[1].w) * intBitsToFloat(PS1i));
// 3
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PV0ix)));
// 4
R2i.x = PV1iw;
R2i.y = PV1iw;
R2i.z = PV1iw;
}
activeMaskStack[5] = activeMaskStack[5] == false;
activeMaskStackC[6] = activeMaskStack[5] == true && activeMaskStackC[5] == true;
if( activeMaskStackC[6] == true ) {
activeMaskStack[6] = activeMaskStack[5];
activeMaskStackC[7] = activeMaskStackC[6];
// 0
predResult = (10.0 > intBitsToFloat(R0i.x));
activeMaskStack[6] = predResult;
activeMaskStackC[7] = predResult == true && activeMaskStackC[6] == true;
}
else {
activeMaskStack[6] = false;
activeMaskStackC[7] = false;
}
if( activeMaskStackC[7] == true ) {
// 0
R126i.x = uf_remappedPS[5].x;
PV0iy = ((intBitsToFloat(R0i.x) > 9.0)?-1:0);
R127i.z = uf_remappedPS[5].z;
R0i.w = 0x40400000;
R1i.x = floatBitsToInt(0.0 * intBitsToFloat(R1i.z) + 1.0);
// 1
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[2].y)) + intBitsToFloat(uf_remappedPS[2].z));
R123i.w = ((PV0iy == 0)?(0):(0x3f800000));
// 2
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(uf_remappedPS[6].y)) + intBitsToFloat(uf_remappedPS[6].z));
// 3
backupReg0i = R1i.z;
R127i.y = floatBitsToInt(-2.0 * intBitsToFloat(R123i.z) + 1.0);
R1i.z = floatBitsToInt(intBitsToFloat(uf_remappedPS[3].w) + -(1.0));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(backupReg0i)) + intBitsToFloat(uf_remappedPS[2].y));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.z = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(R123i.w));
// 5
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS1i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS1i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.z));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedPS[1].w) * intBitsToFloat(PS0i));
R127i.z = floatBitsToInt(intBitsToFloat(PV0ix) * -(1.0));
// 8
backupReg0i = R127i.y;
backupReg1i = R127i.z;
redcCUBE(vec4(intBitsToFloat(backupReg1i),intBitsToFloat(backupReg1i),intBitsToFloat(R127i.w),intBitsToFloat(backupReg0i)),vec4(intBitsToFloat(backupReg0i),intBitsToFloat(R127i.w),intBitsToFloat(backupReg1i),intBitsToFloat(backupReg1i)),cubeMapSTM,cubeMapFaceId);
R127i.x = floatBitsToInt(cubeMapSTM.x);
R127i.y = floatBitsToInt(cubeMapSTM.y);
R127i.z = floatBitsToInt(cubeMapSTM.z);
R127i.w = cubeMapFaceId;
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].w), intBitsToFloat(PV1ix)));
// 9
R0i.z = R127i.w;
PS1i = floatBitsToInt(1.0 / abs(intBitsToFloat(R127i.z)));
// 10
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PS1i)) + 1.5);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PS1i)) + 1.5);
// 11
R0i.x = R123i.y;
R0i.y = R123i.z;
}
if( activeMaskStackC[7] == true ) {
R0i.xyz = floatBitsToInt(zmCube(textureUnitPS0, intBitsToFloat(R0i.xy), R0i.z, cubeMapArrayIndex0, intBitsToFloat(R0i.w)).xyz);
}
if( activeMaskStackC[7] == true ) {
// 0
PV0ix = floatBitsToInt(min(intBitsToFloat(R0i.y), intBitsToFloat(R0i.z)));
PV0iz = floatBitsToInt(max(intBitsToFloat(R0i.y), intBitsToFloat(R0i.z)));
// 1
R126i.y = floatBitsToInt(max(intBitsToFloat(R0i.x), intBitsToFloat(PV0iz)));
R127i.w = floatBitsToInt(min(intBitsToFloat(R0i.x), intBitsToFloat(PV0ix)));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(0x2edbe6ff));
R127i.y = floatBitsToInt(intBitsToFloat(R0i.x) + -(intBitsToFloat(R126i.y)));
R127i.z = floatBitsToInt(intBitsToFloat(R0i.y) + -(intBitsToFloat(R126i.y)));
R126i.w = floatBitsToInt(intBitsToFloat(R0i.z) + -(intBitsToFloat(R126i.y)));
// 3
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 4
PV0iz = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(PS1i));
// 5
PV1iy = floatBitsToInt(-(intBitsToFloat(PV0iz)) + 1.0);
// 6
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(0x38d1b717));
// 7
tempResultf = max(0.0, intBitsToFloat(PV0iw));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PS1i)));
// 9
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 10
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PS1i)));
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PV0iz)) + intBitsToFloat(R126i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV0iz)) + intBitsToFloat(R126i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PV0iz)) + intBitsToFloat(R126i.y));
// 12
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(R1i.w)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R1i.w)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(R1i.w)));
}
activeMaskStack[6] = activeMaskStack[6] == false;
activeMaskStackC[7] = activeMaskStack[6] == true && activeMaskStackC[6] == true;
if( activeMaskStackC[7] == true ) {
activeMaskStack[7] = activeMaskStack[6];
activeMaskStackC[8] = activeMaskStackC[7];
// 0
predResult = (11.0 > intBitsToFloat(R0i.x));
activeMaskStack[7] = predResult;
activeMaskStackC[8] = predResult == true && activeMaskStackC[7] == true;
}
else {
activeMaskStack[7] = false;
activeMaskStackC[8] = false;
}
if( activeMaskStackC[8] == true ) {
// 0
PV0iw = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(uf_remappedPS[4].x));
// 1
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PS1i)));
// 3
R2i.x = floatBitsToInt(max(intBitsToFloat(PV0iy), intBitsToFloat(0x3dcccccd)));
R2i.y = floatBitsToInt(max(intBitsToFloat(PV0ix), intBitsToFloat(0x3dcccccd)));
R2i.z = floatBitsToInt(max(intBitsToFloat(PV0iw), intBitsToFloat(0x3dcccccd)));
}
activeMaskStack[7] = activeMaskStack[7] == false;
activeMaskStackC[8] = activeMaskStack[7] == true && activeMaskStackC[7] == true;
if( activeMaskStackC[8] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(uf_remappedPS[0].x),intBitsToFloat(uf_remappedPS[0].y),intBitsToFloat(uf_remappedPS[0].z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),intBitsToFloat(0x3dea4a8c),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(PV0ix)) + -(intBitsToFloat(uf_remappedPS[1].y)));
R123i.x = clampFI32(R123i.x);
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[1].x)) + intBitsToFloat(uf_remappedPS[1].z));
// 2
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(R123i.x)) + intBitsToFloat(uf_remappedPS[1].x));
R2i.y = floatBitsToInt(1.0);
R2i.z = floatBitsToInt(1.0);
}
activeMaskStackC[7] = activeMaskStack[6] == true && activeMaskStackC[6] == true;
activeMaskStackC[5] = activeMaskStack[4] == true && activeMaskStackC[4] == true;
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
passPixelColor0 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
}
