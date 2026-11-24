#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;

vec4 zmCube(sampler2DArray s, vec2 st, int face, float cubeIndex, float lod) {
	return textureLod(s, vec3(st - 1.0, float(face) + cubeIndex * 6.0), lod);
}
// shader a1f4730122a952aa
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[1];
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
vec4 R0f = vec4(0.0);
vec4 R1f = vec4(0.0);
vec4 R2f = vec4(0.0);
vec4 R3f = vec4(0.0);
vec4 R4f = vec4(0.0);
vec4 R5f = vec4(0.0);
vec4 R6f = vec4(0.0);
vec4 R7f = vec4(0.0);
vec4 R122f = vec4(0.0);
vec4 R123f = vec4(0.0);
vec4 R124f = vec4(0.0);
vec4 R125f = vec4(0.0);
vec4 R126f = vec4(0.0);
vec4 R127f = vec4(0.0);
float backupReg0f, backupReg1f, backupReg2f, backupReg3f, backupReg4f;
float PV0fx = 0.0, PV0fy = 0.0, PV0fz = 0.0, PV0fw = 0.0, PV1fx = 0.0, PV1fy = 0.0, PV1fz = 0.0, PV1fw = 0.0;
float PS0f = 0.0, PS1f = 0.0;
vec4 tempf = vec4(0.0);
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
R0f = passParameterSem0;
R1f = passParameterSem1;
R2f = passParameterSem3;
R3f = passParameterSem4;
R4f = passParameterSem5;
R5f = passParameterSem7;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
tempf.x = dot(vec4(R5f.x,R5f.y,R5f.z,intBitsToFloat(0x80000000)),vec4(R5f.x,R5f.y,R5f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = R2f.z * R2f.z;
// 1
tempf.x = dot(vec4(R2f.x,R2f.y,PS0f,intBitsToFloat(0x80000000)),vec4(R2f.x,R2f.y,1.0,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
tempResultf = 1.0 / sqrt(PV0fx);
PS1f = tempResultf;
// 2
R5f.x = mul_nonIEEE(R5f.x, PS1f);
R5f.y = mul_nonIEEE(R5f.y, PS1f);
R5f.z = mul_nonIEEE(R5f.z, PS1f);
tempResultf = 1.0 / sqrt(PV1fx);
PS0f = tempResultf;
// 3
R2f.x = mul_nonIEEE(R2f.x, PS0f);
R2f.y = mul_nonIEEE(R2f.y, PS0f);
R2f.z = mul_nonIEEE(R2f.z, PS0f);
// 4
tempf.x = dot(vec4(R5f.x,R5f.y,R5f.z,intBitsToFloat(0x80000000)),vec4(R2f.x,R2f.y,R2f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 5
R6f.z = PV0fx + 1.0;
// 6
predResult = (R6f.z > 0.0);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
PV0fx = mul_nonIEEE(R5f.y, R2f.x);
PV0fy = R6f.z;
PV0fy /= 2.0;
PV0fz = mul_nonIEEE(R5f.x, R2f.z);
PV0fw = mul_nonIEEE(R5f.z, R2f.y);
// 1
R127f.x = mul_nonIEEE(-(R5f.y),R2f.z) + PV0fw;
R127f.z = mul_nonIEEE(-(R5f.x),R2f.y) + PV0fx;
R127f.w = mul_nonIEEE(-(R5f.z),R2f.x) + PV0fz;
PS1f = sqrt(PV0fy);
// 2
PV0fy = PS1f;
PV0fy *= 2.0;
R0f.w = PS1f;
// 3
PS1f = 1.0 / PV0fy;
// 4
R2f.x = R127f.x * PS1f;
R2f.y = R127f.w * PS1f;
R2f.z = R127f.z * PS1f;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R2f.x = 0.0;
R2f.y = 0.0;
R2f.z = 0.0;
R0f.w = 1.0;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R127f.x = mul_nonIEEE(R2f.y, R2f.y);
R127f.y = mul_nonIEEE(R2f.y, R0f.w);
R127f.z = mul_nonIEEE(R2f.z, R2f.z);
R127f.w = mul_nonIEEE(R2f.z, R0f.w);
R126f.w = mul_nonIEEE(R2f.x, R2f.x);
// 1
PV1fx = R127f.x + R127f.z;
R126f.y = mul_nonIEEE(R2f.x, R2f.z);
PV1fz = mul_nonIEEE(R2f.x, R2f.y);
R125f.w = mul_nonIEEE(R2f.x, R0f.w);
R124f.w = mul_nonIEEE(R2f.y, R2f.z);
// 2
backupReg0f = R127f.w;
R126f.x = -(PV1fx) + 0.5;
R126f.x *= 2.0;
PV0fy = R126f.w + R127f.z;
R125f.z = -(R127f.y) + R126f.y;
R125f.z *= 2.0;
R127f.w = backupReg0f + PV1fz;
R127f.w *= 2.0;
R5f.y = -(backupReg0f) + PV1fz;
R5f.y *= 2.0;
// 3
PV1fx = R126f.w + R127f.x;
R125f.y = mul_nonIEEE(R3f.x, R126f.x);
R124f.z = R125f.w + R124f.w;
R124f.z *= 2.0;
R126f.w = -(PV0fy) + 0.5;
R126f.w *= 2.0;
R124f.y = mul_nonIEEE(R3f.x, R127f.w);
// 4
PV0fx = mul_nonIEEE(R3f.x, R125f.z);
R126f.y = R127f.y + R126f.y;
R126f.y *= 2.0;
R5f.z = -(R125f.w) + R124f.w;
R5f.z *= 2.0;
R124f.w = -(PV1fx) + 0.5;
R124f.w *= 2.0;
R127f.y = mul_nonIEEE(R4f.x, R126f.x);
// 5
R123f.x = mul_nonIEEE(R3f.y,R124f.z) + PV0fx;
PV1fy = mul_nonIEEE(R4f.x, R125f.z);
R127f.z = mul_nonIEEE(R3f.y,R5f.y) + R125f.y;
PV1fw = mul_nonIEEE(R4f.x, R127f.w);
R126f.z = mul_nonIEEE(R0f.x, R126f.x);
// 6
backupReg0f = R124f.y;
backupReg1f = R123f.x;
R123f.x = mul_nonIEEE(R4f.y,R124f.z) + PV1fy;
R124f.y = mul_nonIEEE(R0f.x, R125f.z);
R123f.z = mul_nonIEEE(R4f.y,R126f.w) + PV1fw;
R123f.w = mul_nonIEEE(R3f.y,R126f.w) + backupReg0f;
R2f.z = mul_nonIEEE(R3f.z,R124f.w) + backupReg1f;
// 7
backupReg0f = R123f.x;
R123f.x = mul_nonIEEE(R4f.y,R5f.y) + R127f.y;
R2f.y = mul_nonIEEE(R3f.z,R5f.z) + R123f.w;
PV1fz = mul_nonIEEE(R0f.x, R127f.w);
R6f.w = mul_nonIEEE(R4f.z,R5f.z) + R123f.z;
R6f.z = mul_nonIEEE(R4f.z,R124f.w) + backupReg0f;
// 8
backupReg0f = R127f.w;
R2f.x = mul_nonIEEE(R3f.z,R126f.y) + R127f.z;
R6f.y = mul_nonIEEE(R4f.z,R126f.y) + R123f.x;
R3f.z = mul_nonIEEE(R1f.x, R126f.x);
R127f.w = mul_nonIEEE(R0f.y,R126f.w) + PV1fz;
R127f.z = mul_nonIEEE(R1f.x, backupReg0f);
// 9
R126f.x = mul_nonIEEE(R0f.y,R124f.z) + R124f.y;
R124f.y = mul_nonIEEE(R0f.y,R5f.y) + R126f.z;
R126f.z = mul_nonIEEE(R1f.x, R125f.z);
R4f.w = intBitsToFloat(uf_remappedPS[0].x);
R7f.w = intBitsToFloat(uf_remappedPS[0].x);
// 10
redcCUBE(vec4(R2f.z,R2f.z,R2f.x,R2f.y),vec4(R2f.y,R2f.x,R2f.z,R2f.z),cubeMapSTM,cubeMapFaceId);
R125f.x = cubeMapSTM.x;
R125f.y = cubeMapSTM.y;
R125f.z = cubeMapSTM.z;
R125f.w = intBitsToFloat(cubeMapFaceId);
R126f.w = mul_nonIEEE(R1f.y,R126f.w) + R127f.z;
// 11
backupReg0f = R126f.x;
R126f.x = mul_nonIEEE(R1f.y,R124f.z) + R126f.z;
R2f.z = mul_nonIEEE(R0f.z,R124f.w) + backupReg0f;
R2f.w = mul_nonIEEE(R0f.z,R126f.y) + R124f.y;
PS1f = 1.0 / abs(R125f.z);
// 12
R125f.x = mul_nonIEEE(R125f.x,PS1f) + 1.5;
R2f.y = mul_nonIEEE(R0f.z,R5f.z) + R127f.w;
R125f.z = mul_nonIEEE(R125f.y,PS1f) + 1.5;
R123f.w = mul_nonIEEE(R1f.y,R5f.y) + R3f.z;
R4f.z = R125f.w;
// 13
redcCUBE(vec4(R6f.z,R6f.z,R6f.y,R6f.w),vec4(R6f.w,R6f.y,R6f.z,R6f.z),cubeMapSTM,cubeMapFaceId);
R127f.x = cubeMapSTM.x;
R127f.y = cubeMapSTM.y;
R127f.z = cubeMapSTM.z;
R127f.w = intBitsToFloat(cubeMapFaceId);
R124f.x = mul_nonIEEE(R1f.z,R126f.y) + R123f.w;
// 14
R4f.x = R125f.z;
R124f.y = mul_nonIEEE(R1f.z,R5f.z) + R126f.w;
R124f.z = mul_nonIEEE(R1f.z,R124f.w) + R126f.x;
R1f.w = intBitsToFloat(uf_remappedPS[0].x);
R126f.w = 1.0 / abs(R127f.z);
// 15
backupReg0f = R2f.y;
backupReg1f = R2f.z;
redcCUBE(vec4(backupReg1f,backupReg1f,R2f.w,backupReg0f),vec4(backupReg0f,R2f.w,backupReg1f,backupReg1f),cubeMapSTM,cubeMapFaceId);
R2f.x = cubeMapSTM.x;
R2f.y = cubeMapSTM.y;
R2f.z = cubeMapSTM.z;
R2f.w = intBitsToFloat(cubeMapFaceId);
R125f.z = mul_nonIEEE(R127f.x,R126f.w) + 1.5;
// 16
R127f.y = mul_nonIEEE(R127f.y,R126f.w) + 1.5;
R7f.z = R127f.w;
R5f.w = intBitsToFloat(uf_remappedPS[0].x);
R4f.y = R125f.x;
// 17
backupReg0f = R124f.x;
backupReg1f = R124f.y;
backupReg2f = R124f.z;
redcCUBE(vec4(backupReg2f,backupReg2f,backupReg0f,backupReg1f),vec4(backupReg1f,backupReg0f,backupReg2f,backupReg2f),cubeMapSTM,cubeMapFaceId);
R124f.x = cubeMapSTM.x;
R124f.y = cubeMapSTM.y;
R124f.z = cubeMapSTM.z;
R124f.w = intBitsToFloat(cubeMapFaceId);
PS1f = 1.0 / abs(R2f.z);
// 18
R7f.x = R127f.y;
R7f.y = R125f.z;
R123f.z = mul_nonIEEE(R2f.x,PS1f) + 1.5;
R123f.w = mul_nonIEEE(R2f.y,PS1f) + 1.5;
PS0f = 1.0 / abs(R124f.z);
// 19
R1f.x = R123f.w;
R1f.y = R123f.z;
R1f.z = R2f.w;
R123f.w = mul_nonIEEE(R124f.x,PS0f) + 1.5;
R122f.x = mul_nonIEEE(R124f.y,PS0f) + 1.5;
// 20
R5f.x = R122f.x;
R5f.y = R123f.w;
R5f.z = R124f.w;
}
if( activeMaskStackC[1] == true ) {
R4f.xyzw = (zmCube(textureUnitPS0, R4f.xy, floatBitsToInt(R4f.z), cubeMapArrayIndex0, R4f.w).xyzw);
R7f.xyzw = (zmCube(textureUnitPS0, R7f.xy, floatBitsToInt(R7f.z), cubeMapArrayIndex0, R7f.w).xyzw);
R1f.xyzw = (zmCube(textureUnitPS0, R1f.xy, floatBitsToInt(R1f.z), cubeMapArrayIndex0, R1f.w).xyzw);
R5f.xyzw = (zmCube(textureUnitPS0, R5f.xy, floatBitsToInt(R5f.z), cubeMapArrayIndex0, R5f.w).xyzw);
}
if( activeMaskStackC[1] == true ) {
// 0
PV0fx = R4f.y * 0.390625;
PV0fy = R4f.x * 0.390625;
PV0fz = R4f.w * 0.390625;
PV0fw = R4f.z * 0.390625;
// 1
R123f.x = R7f.y * 0.109375 + PV0fx;
R123f.y = R7f.x * 0.109375 + PV0fy;
R123f.z = R7f.w * 0.109375 + PV0fz;
R123f.w = R7f.z * 0.109375 + PV0fw;
// 2
backupReg0f = R123f.x;
backupReg1f = R123f.y;
backupReg2f = R123f.z;
R123f.x = R1f.z * 0.390625 + R123f.w;
R123f.y = R1f.y * 0.390625 + backupReg0f;
R123f.z = R1f.x * 0.390625 + backupReg1f;
R123f.w = R1f.w * 0.390625 + backupReg2f;
// 3
backupReg0f = R123f.x;
backupReg1f = R123f.y;
backupReg2f = R123f.z;
R123f.x = R5f.w * 0.109375 + R123f.w;
R123f.y = R5f.z * 0.109375 + backupReg0f;
R123f.z = R5f.y * 0.109375 + backupReg1f;
R123f.w = R5f.x * 0.109375 + backupReg2f;
// 4
R5f.x = max(R123f.w, 0.0);
R5f.y = max(R123f.z, 0.0);
R5f.z = max(R123f.y, 0.0);
R5f.w = max(R123f.x, 0.0);
}
// export
passPixelColor0 = vec4(R5f.x, R5f.y, R5f.z, R5f.w);
}
