#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;

vec4 zmCube(sampler2DArray s, vec2 st, int face, float cubeIndex, float lod) {
	return textureLod(s, vec3(st - 1.0, float(face) + cubeIndex * 6.0), lod);
}
// shader b3a557aaaf1680a3
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2DArray textureUnitPS0;
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
vec4 R8f = vec4(0.0);
vec4 R9f = vec4(0.0);
vec4 R10f = vec4(0.0);
vec4 R11f = vec4(0.0);
vec4 R12f = vec4(0.0);
vec4 R13f = vec4(0.0);
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
vec3 cubeMapSTM;
int cubeMapFaceId;
float cubeMapArrayIndex0 = 0.0;
// 0
redcCUBE(vec4(0.0,0.0,1.0,0.0),vec4(0.0,1.0,0.0,0.0),cubeMapSTM,cubeMapFaceId);
R126f.x = cubeMapSTM.x;
R126f.y = cubeMapSTM.y;
R126f.z = cubeMapSTM.z;
R126f.w = intBitsToFloat(cubeMapFaceId);
R2f.w = 3.0;
// 1
redcCUBE(vec4(0.0,0.0,-(1.0),0.0),vec4(0.0,-(1.0),0.0,0.0),cubeMapSTM,cubeMapFaceId);
R125f.x = cubeMapSTM.x;
R125f.y = cubeMapSTM.y;
R125f.z = cubeMapSTM.z;
R125f.w = intBitsToFloat(cubeMapFaceId);
R127f.y = 1.0 / abs(R126f.z);
// 2
redcCUBE(vec4(0.0,0.0,0.0,1.0),vec4(1.0,0.0,0.0,0.0),cubeMapSTM,cubeMapFaceId);
R0f.x = cubeMapSTM.x;
R0f.y = cubeMapSTM.y;
R0f.z = cubeMapSTM.z;
R0f.w = intBitsToFloat(cubeMapFaceId);
PS0f = 1.0 / abs(R125f.z);
// 3
backupReg0f = R127f.y;
R127f.x = mul_nonIEEE(R126f.x,backupReg0f) + 1.5;
R127f.y = mul_nonIEEE(R125f.x,PS0f) + 1.5;
R127f.z = mul_nonIEEE(R125f.y,PS0f) + 1.5;
R123f.w = mul_nonIEEE(R126f.y,backupReg0f) + 1.5;
R124f.y = 1.0 / abs(R0f.z);
// 4
redcCUBE(vec4(0.0,0.0,0.0,-(1.0)),vec4(-(1.0),0.0,0.0,0.0),cubeMapSTM,cubeMapFaceId);
R1f.x = cubeMapSTM.x;
R1f.y = cubeMapSTM.y;
R1f.z = cubeMapSTM.z;
R1f.w = intBitsToFloat(cubeMapFaceId);
R2f.x = R123f.w;
// 5
R3f.x = R127f.z;
R2f.y = R127f.x;
R2f.z = R126f.w;
R3f.w = 3.0;
R3f.y = R127f.y;
// 6
R125f.x = mul_nonIEEE(R0f.x,R124f.y) + 1.5;
R3f.z = R125f.w;
R123f.w = mul_nonIEEE(R0f.y,R124f.y) + 1.5;
R125f.w = 1.0 / abs(R1f.z);
// 7
redcCUBE(vec4(1.0,1.0,0.0,0.0),vec4(0.0,0.0,1.0,1.0),cubeMapSTM,cubeMapFaceId);
R124f.x = cubeMapSTM.x;
R124f.y = cubeMapSTM.y;
R124f.z = cubeMapSTM.z;
R124f.w = intBitsToFloat(cubeMapFaceId);
R4f.x = R123f.w;
// 8
backupReg0f = R125f.x;
R125f.x = mul_nonIEEE(R1f.x,R125f.w) + 1.5;
R4f.y = backupReg0f;
R4f.z = R0f.w;
R4f.w = 3.0;
R125f.w = mul_nonIEEE(R1f.y,R125f.w) + 1.5;
// 9
redcCUBE(vec4(-(1.0),-(1.0),0.0,0.0),vec4(0.0,0.0,-(1.0),-(1.0)),cubeMapSTM,cubeMapFaceId);
R127f.x = cubeMapSTM.x;
R127f.y = cubeMapSTM.y;
R127f.z = cubeMapSTM.z;
R127f.w = intBitsToFloat(cubeMapFaceId);
R125f.z = 1.0 / abs(R124f.z);
// 10
R1f.x = R125f.w;
R1f.y = R125f.x;
R1f.z = R1f.w;
R1f.w = 3.0;
R122f.x = mul_nonIEEE(R124f.x,R125f.z) + 1.5;
// 11
R123f.x = mul_nonIEEE(R124f.y,R125f.z) + 1.5;
R0f.y = R122f.x;
R0f.z = R124f.w;
R0f.w = 3.0;
R124f.x = 1.0 / abs(R127f.z);
// 12
redcCUBE(vec4(-(1.0),-(1.0),-(1.0),-(1.0)),vec4(-(1.0),-(1.0),-(1.0),-(1.0)),cubeMapSTM,cubeMapFaceId);
R125f.x = cubeMapSTM.x;
R125f.y = cubeMapSTM.y;
R125f.z = cubeMapSTM.z;
R125f.w = intBitsToFloat(cubeMapFaceId);
R0f.x = R123f.x;
// 13
R123f.x = mul_nonIEEE(R127f.y,R124f.x) + 1.5;
R5f.z = R127f.w;
R127f.w = mul_nonIEEE(R127f.x,R124f.x) + 1.5;
R124f.w = 1.0 / abs(R125f.z);
// 14
redcCUBE(vec4(1.0,1.0,-(1.0),-(1.0)),vec4(-(1.0),-(1.0),1.0,1.0),cubeMapSTM,cubeMapFaceId);
R126f.x = cubeMapSTM.x;
R126f.y = cubeMapSTM.y;
R126f.z = cubeMapSTM.z;
R126f.w = intBitsToFloat(cubeMapFaceId);
R5f.x = R123f.x;
// 15
R123f.x = mul_nonIEEE(R125f.y,R124f.w) + 1.5;
R5f.y = R127f.w;
R127f.z = mul_nonIEEE(R125f.x,R124f.w) + 1.5;
R5f.w = 3.0;
R127f.y = 1.0 / abs(R126f.z);
// 16
redcCUBE(vec4(-(1.0),-(1.0),-(1.0),1.0),vec4(1.0,-(1.0),-(1.0),-(1.0)),cubeMapSTM,cubeMapFaceId);
R9f.x = cubeMapSTM.x;
R9f.y = cubeMapSTM.y;
R9f.z = cubeMapSTM.z;
R9f.w = intBitsToFloat(cubeMapFaceId);
R6f.x = R123f.x;
// 17
R125f.x = mul_nonIEEE(R126f.x,R127f.y) + 1.5;
R6f.y = R127f.z;
R6f.z = R125f.w;
R6f.w = 3.0;
R125f.w = mul_nonIEEE(R126f.y,R127f.y) + 1.5;
// 18
redcCUBE(vec4(1.0,1.0,-(1.0),1.0),vec4(1.0,-(1.0),1.0,1.0),cubeMapSTM,cubeMapFaceId);
R10f.x = cubeMapSTM.x;
R10f.y = cubeMapSTM.y;
R10f.z = cubeMapSTM.z;
R10f.w = intBitsToFloat(cubeMapFaceId);
R8f.x = 1.0 / abs(R9f.z);
// 19
R7f.x = R125f.w;
R7f.y = R125f.x;
R7f.z = R126f.w;
R7f.w = 3.0;
R8f.w = mul_nonIEEE(R9f.x,R8f.x) + 1.5;
R2f.xyz = (zmCube(textureUnitPS0, R2f.xy, floatBitsToInt(R2f.z), cubeMapArrayIndex0, R2f.w).xyz);
R3f.xyz = (zmCube(textureUnitPS0, R3f.xy, floatBitsToInt(R3f.z), cubeMapArrayIndex0, R3f.w).xyz);
R4f.xyz = (zmCube(textureUnitPS0, R4f.xy, floatBitsToInt(R4f.z), cubeMapArrayIndex0, R4f.w).xyz);
R1f.xyz = (zmCube(textureUnitPS0, R1f.xy, floatBitsToInt(R1f.z), cubeMapArrayIndex0, R1f.w).xyz);
R0f.xyz = (zmCube(textureUnitPS0, R0f.xy, floatBitsToInt(R0f.z), cubeMapArrayIndex0, R0f.w).xyz);
R11f.xyz = (zmCube(textureUnitPS0, R5f.xy, floatBitsToInt(R5f.z), cubeMapArrayIndex0, R5f.w).xyz);
R12f.xyz = (zmCube(textureUnitPS0, R6f.xy, floatBitsToInt(R6f.z), cubeMapArrayIndex0, R6f.w).xyz);
R13f.xyz = (zmCube(textureUnitPS0, R7f.xy, floatBitsToInt(R7f.z), cubeMapArrayIndex0, R7f.w).xyz);
// 0
backupReg0f = R8f.x;
R8f.x = R2f.x + R3f.x;
R7f.y = R8f.w;
R123f.z = mul_nonIEEE(R9f.y,backupReg0f) + 1.5;
R7f.w = 3.0;
R126f.z = 1.0 / abs(R10f.z);
// 1
redcCUBE(vec4(-(1.0),-(1.0),1.0,-(1.0)),vec4(-(1.0),1.0,-(1.0),-(1.0)),cubeMapSTM,cubeMapFaceId);
R125f.x = cubeMapSTM.x;
R125f.y = cubeMapSTM.y;
R125f.z = cubeMapSTM.z;
R125f.w = intBitsToFloat(cubeMapFaceId);
R7f.x = R123f.z;
// 2
R5f.x = R2f.y + R3f.y;
R126f.y = mul_nonIEEE(R10f.x,R126f.z) + 1.5;
R7f.z = R9f.w;
R123f.w = mul_nonIEEE(R10f.y,R126f.z) + 1.5;
R127f.y = 1.0 / abs(R125f.z);
// 3
redcCUBE(vec4(1.0,1.0,1.0,-(1.0)),vec4(-(1.0),1.0,1.0,1.0),cubeMapSTM,cubeMapFaceId);
R124f.x = cubeMapSTM.x;
R124f.y = cubeMapSTM.y;
R124f.z = cubeMapSTM.z;
R124f.w = intBitsToFloat(cubeMapFaceId);
R9f.x = R123f.w;
// 4
R126f.x = mul_nonIEEE(R125f.x,R127f.y) + 1.5;
R9f.y = R126f.y;
R9f.z = R10f.w;
R9f.w = 3.0;
R126f.w = mul_nonIEEE(R125f.y,R127f.y) + 1.5;
// 5
redcCUBE(vec4(-(1.0),-(1.0),1.0,1.0),vec4(1.0,1.0,-(1.0),-(1.0)),cubeMapSTM,cubeMapFaceId);
R10f.x = cubeMapSTM.x;
R10f.y = cubeMapSTM.y;
R10f.z = cubeMapSTM.z;
R10f.w = intBitsToFloat(cubeMapFaceId);
R127f.w = 1.0 / abs(R124f.z);
// 6
R6f.x = R126f.w;
R6f.y = R126f.x;
R6f.z = R125f.w;
R6f.w = 3.0;
R122f.x = mul_nonIEEE(R124f.x,R127f.w) + 1.5;
// 7
R3f.x = R2f.z + R3f.z;
R2f.y = R122f.x;
R2f.z = R124f.w;
R123f.w = mul_nonIEEE(R124f.y,R127f.w) + 1.5;
R124f.z = 1.0 / abs(R10f.z);
// 8
redcCUBE(vec4(1.0,1.0,1.0,1.0),vec4(1.0,1.0,1.0,1.0),cubeMapSTM,cubeMapFaceId);
R127f.x = cubeMapSTM.x;
R127f.y = cubeMapSTM.y;
R127f.z = cubeMapSTM.z;
R127f.w = intBitsToFloat(cubeMapFaceId);
R2f.x = R123f.w;
// 9
R123f.x = mul_nonIEEE(R10f.y,R124f.z) + 1.5;
R123f.y = mul_nonIEEE(R10f.x,R124f.z) + 1.5;
R10f.z = R10f.w;
R2f.w = 3.0;
PS1f = 1.0 / abs(R127f.z);
// 10
R10f.x = R123f.x;
R10f.y = R123f.y;
R123f.z = mul_nonIEEE(R127f.x,PS1f) + 1.5;
R10f.w = 3.0;
R122f.x = mul_nonIEEE(R127f.y,PS1f) + 1.5;
// 11
backupReg0f = R8f.x;
R8f.x = R122f.x;
R8f.y = R123f.z;
R8f.z = R127f.w;
R8f.w = 3.0;
R3f.z = backupReg0f + R4f.x;
R7f.xyz = (zmCube(textureUnitPS0, R7f.xy, floatBitsToInt(R7f.z), cubeMapArrayIndex0, R7f.w).xyz);
R9f.xyz = (zmCube(textureUnitPS0, R9f.xy, floatBitsToInt(R9f.z), cubeMapArrayIndex0, R9f.w).xyz);
R6f.xyz = (zmCube(textureUnitPS0, R6f.xy, floatBitsToInt(R6f.z), cubeMapArrayIndex0, R6f.w).xyz);
R2f.xyz = (zmCube(textureUnitPS0, R2f.xy, floatBitsToInt(R2f.z), cubeMapArrayIndex0, R2f.w).xyz);
R10f.xyz = (zmCube(textureUnitPS0, R10f.xy, floatBitsToInt(R10f.z), cubeMapArrayIndex0, R10f.w).xyz);
R8f.xyz = (zmCube(textureUnitPS0, R8f.xy, floatBitsToInt(R8f.z), cubeMapArrayIndex0, R8f.w).xyz);
// 0
PV0fx = R3f.x + R4f.z;
PV0fy = R5f.x + R4f.y;
PV0fz = R3f.z + R1f.x;
R3f.w = 1.0;
// 1
PV1fx = PV0fy + R1f.y;
PV1fy = PV0fz + R0f.x;
PV1fw = PV0fx + R1f.z;
// 2
PV0fx = PV1fy + R11f.x;
PV0fy = PV1fw + R0f.z;
PV0fz = PV1fx + R0f.y;
// 3
PV1fx = PV0fy + R11f.z;
PV1fy = PV0fz + R11f.y;
PV1fz = PV0fx + R12f.x;
// 4
PV0fx = PV1fz + R13f.x;
PV0fz = PV1fx + R12f.z;
PV0fw = PV1fy + R12f.y;
// 5
PV1fx = PV0fx + R7f.x;
PV1fy = PV0fz + R13f.z;
PV1fz = PV0fw + R13f.y;
// 6
PV0fx = PV1fz + R7f.y;
PV0fy = PV1fx + R9f.x;
PV0fw = PV1fy + R7f.z;
// 7
PV1fx = PV0fy + R6f.x;
PV1fz = PV0fw + R9f.z;
PV1fw = PV0fx + R9f.y;
// 8
PV0fx = PV1fz + R6f.z;
PV0fy = PV1fw + R6f.y;
PV0fz = PV1fx + R2f.x;
// 9
PV1fx = PV0fy + R2f.y;
PV1fy = PV0fz + R10f.x;
PV1fw = PV0fx + R2f.z;
// 10
PV0fx = PV1fy + R8f.x;
PV0fy = PV1fw + R10f.z;
PV0fz = PV1fx + R10f.y;
// 11
PV1fx = PV0fy + R8f.z;
PV1fy = PV0fz + R8f.y;
R3f.x = PV0fx * intBitsToFloat(0x3d924925);
// 12
R3f.y = PV1fy * intBitsToFloat(0x3d924925);
R3f.z = PV1fx * intBitsToFloat(0x3d924925);
// export
passPixelColor0 = vec4(R3f.x, R3f.y, R3f.z, R3f.w);
}
