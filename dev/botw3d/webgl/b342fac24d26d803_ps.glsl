#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;

vec4 zmCube(sampler2DArray s, vec2 st, int face, float cubeIndex, float lod) {
	return textureLod(s, vec3(st - 1.0, float(face) + cubeIndex * 6.0), lod);
}
// shader b342fac24d26d803
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[5];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(4, 1, 1) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(9, 1, 2) uniform sampler2D textureUnitPS9;
TEXTURE_LAYOUT(10, 1, 3) uniform sampler2DArray textureUnitPS10;
in vec4 passParameterSem0;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem5;
in vec4 passParameterSem8;
in vec4 passParameterSem11;
in vec4 passParameterSem14;
in vec4 passParameterSem15;
in vec4 passParameterSem16;
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
vec4 R123f = vec4(0.0);
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
float cubeMapArrayIndex10 = 0.0;
R0f = passParameterSem0;
R1f = passParameterSem3;
R2f = passParameterSem4;
R3f = passParameterSem5;
R4f = passParameterSem8;
R5f = passParameterSem11;
R6f = passParameterSem14;
R7f = passParameterSem15;
R8f = passParameterSem16;
R2f.z = (texture(textureUnitPS0, vec2(R4f.x,R4f.y)).w);
// 0
R3f.x = R6f.x + 0.0;
R9f.y = R6f.y + 0.0;
R5f.z = -(R5f.z);
R4f.w = intBitsToFloat(uf_remappedPS[0].x);
R127f.z = 1.0 / R1f.w;
// 1
redcCUBE(vec4(R5f.z,R5f.z,R5f.x,R5f.y),vec4(R5f.y,R5f.x,R5f.z,R5f.z),cubeMapSTM,cubeMapFaceId);
R126f.x = cubeMapSTM.x;
R126f.y = cubeMapSTM.y;
R126f.z = cubeMapSTM.z;
R126f.w = intBitsToFloat(cubeMapFaceId);
R5f.x = mul_nonIEEE(R1f.x, R127f.z);
// 2
R5f.y = mul_nonIEEE(R1f.y, R127f.z);
R4f.z = R126f.w;
R2f.w = R6f.z + 0.0;
PS0f = 1.0 / abs(R126f.z);
// 3
R123f.x = mul_nonIEEE(R126f.x,PS0f) + 1.5;
R123f.w = mul_nonIEEE(R126f.y,PS0f) + 1.5;
PS1f = 1.0 / R1f.w;
// 4
R4f.x = R123f.w;
R4f.y = R123f.x;
R1f.z = R1f.z * PS1f;
R1f.w = 1.0 / R3f.z;
R4f.xyz = (zmCube(textureUnitPS10, R4f.xy, floatBitsToInt(R4f.z), cubeMapArrayIndex10, R4f.w).xyz);
R4f.w = (texture(textureUnitPS4, vec2(R5f.x,R5f.y)).x);
R5f.y = (texture(textureUnitPS9, vec2(R5f.x,R5f.y)).x);
// 0
PV0fx = R4f.z * 1.0;
PV0fy = R4f.x * 1.0;
PV0fz = R4f.y * 1.0;
R123f.w = mul_nonIEEE(R1f.z,intBitsToFloat(uf_remappedPS[1].w)) + -(intBitsToFloat(uf_remappedPS[1].y));
R126f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].w),R4f.w) + intBitsToFloat(uf_remappedPS[1].x);
// 1
R4f.x = mul_nonIEEE(R7f.w, R5f.y);
R5f.y = mul_nonIEEE(PV0fz,intBitsToFloat(uf_remappedPS[2].y)) + 0.0;
R1f.z = mul_nonIEEE(PV0fx,intBitsToFloat(uf_remappedPS[2].y)) + 0.0;
R4f.w = mul_nonIEEE(PV0fy,intBitsToFloat(uf_remappedPS[2].y)) + 0.0;
PS1f = 1.0 / R123f.w;
// 2
PV0fy = -(intBitsToFloat(uf_remappedPS[1].z)) * PS1f;
R126f.y = 1.0 / R2f.y;
// 3
PV1fw = -(PV0fy) + R126f.x;
// 4
PV0fx = -(R3f.y) + PV1fw;
R126f.z = mul_nonIEEE(PV1fw, R126f.y);
R126f.z = clamp(R126f.z, 0.0, 1.0);
// 5
PV1fy = mul_nonIEEE(PV0fx, R1f.w);
PV1fy = clamp(PV1fy, 0.0, 1.0);
// 6
PV0fx = -(PV1fy) + 1.0;
// 7
PV1fw = mul_nonIEEE(R126f.z, PV0fx);
// 8
PV0fz = mul_nonIEEE(R2f.z, PV1fw);
// 9
PV1fy = mul_nonIEEE(R0f.w, PV0fz);
PV1fy = clamp(PV1fy, 0.0, 1.0);
// 10
R6f.w = mul_nonIEEE(R2f.x, PV1fy);
// 0
R123f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w),R4f.w) + R3f.x;
R123f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w),R1f.z) + R2f.w;
R123f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w),R5f.y) + R9f.y;
// 1
R126f.x = mul_nonIEEE(R0f.y, R123f.w);
R126f.z = mul_nonIEEE(R0f.x, R123f.x);
R126f.w = mul_nonIEEE(R0f.z, R123f.y);
// 2
PV0fx = -(R126f.w) + intBitsToFloat(uf_remappedPS[3].z);
PV0fy = -(R126f.x) + intBitsToFloat(uf_remappedPS[3].y);
PV0fz = -(R126f.z) + intBitsToFloat(uf_remappedPS[3].x);
// 3
backupReg0f = R126f.z;
R126f.y = mul_nonIEEE(PV0fx,R8f.y) + R126f.w;
R126f.z = mul_nonIEEE(PV0fy,R8f.y) + R126f.x;
R126f.w = mul_nonIEEE(PV0fz,R8f.y) + backupReg0f;
// 4
PV0fy = R7f.z + -(R126f.y);
PV0fz = R7f.y + -(R126f.z);
PV0fw = R7f.x + -(R126f.w);
// 5
backupReg0f = R126f.z;
R126f.x = mul_nonIEEE(PV0fw,R4f.x) + R126f.w;
R126f.z = mul_nonIEEE(PV0fy,R4f.x) + R126f.y;
R126f.w = mul_nonIEEE(PV0fz,R4f.x) + backupReg0f;
// 6
PV0fx = -(R126f.w) + intBitsToFloat(uf_remappedPS[4].y);
PV0fy = -(R126f.x) + intBitsToFloat(uf_remappedPS[4].x);
PV0fw = -(R126f.z) + intBitsToFloat(uf_remappedPS[4].z);
// 7
R6f.x = mul_nonIEEE(PV0fy,R8f.x) + R126f.x;
R6f.y = mul_nonIEEE(PV0fx,R8f.x) + R126f.w;
R6f.z = mul_nonIEEE(PV0fw,R8f.x) + R126f.z;
// export
if( ((vec4(R6f.x, R6f.y, R6f.z, R6f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
}
