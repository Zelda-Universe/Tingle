#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;

vec4 zmCube(sampler2DArray s, vec2 st, int face, float cubeIndex, float lod) {
	return textureLod(s, vec3(st - 1.0, float(face) + cubeIndex * 6.0), lod);
}
// shader 0afd94a56b92c3d6
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[4];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(10, 1, 1) uniform sampler2DArray textureUnitPS10;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem4;
in vec4 passParameterSem7;
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
vec4 R123f = vec4(0.0);
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
R1f = passParameterSem1;
R2f = passParameterSem4;
R3f = passParameterSem7;
R4f = passParameterSem8;
R5f = passParameterSem11;
R6f = passParameterSem14;
R7f = passParameterSem15;
R8f = passParameterSem16;
R2f.w = (texture(textureUnitPS0, vec2(R4f.x,R4f.y)).w);
// 0
R1f.x = -(R8f.w) + 1.0;
R1f.y = R6f.x + 0.0;
R5f.z = -(R5f.z);
R4f.w = intBitsToFloat(uf_remappedPS[0].x);
R5f.w = R6f.y + 0.0;
// 1
redcCUBE(vec4(R5f.z,R5f.z,R5f.x,R5f.y),vec4(R5f.y,R5f.x,R5f.z,R5f.z),cubeMapSTM,cubeMapFaceId);
R127f.x = cubeMapSTM.x;
R127f.y = cubeMapSTM.y;
R127f.z = cubeMapSTM.z;
R127f.w = intBitsToFloat(cubeMapFaceId);
R5f.z = R6f.z + 0.0;
// 2
R5f.x = mul_nonIEEE(R0f.z, R3f.z);
R5f.y = mul_nonIEEE(R0f.y, R3f.y);
R4f.z = R127f.w;
R6f.w = mul_nonIEEE(R0f.x, R3f.x);
PS0f = 1.0 / abs(R127f.z);
// 3
R123f.x = mul_nonIEEE(R127f.x,PS0f) + 1.5;
R123f.z = mul_nonIEEE(R3f.w,R2f.w) + -(R0f.w);
R123f.w = mul_nonIEEE(R127f.y,PS0f) + 1.5;
// 4
R4f.x = R123f.w;
R4f.y = R123f.x;
R0f.z = mul_nonIEEE(R1f.w, R123f.z);
R0f.z = clamp(R0f.z, 0.0, 1.0);
R4f.xyz = (zmCube(textureUnitPS10, R4f.xy, floatBitsToInt(R4f.z), cubeMapArrayIndex10, R4f.w).xyz);
// 0
PV0fx = mul_nonIEEE(R4f.y, R1f.x);
PV0fy = mul_nonIEEE(R4f.x, R1f.x);
PV0fw = mul_nonIEEE(R4f.z, R1f.x);
R0f.w = mul_nonIEEE(R2f.x, R0f.z);
// 1
R123f.x = mul_nonIEEE(PV0fw,intBitsToFloat(uf_remappedPS[1].y)) + 0.0;
R123f.y = mul_nonIEEE(PV0fx,intBitsToFloat(uf_remappedPS[1].y)) + 0.0;
R123f.z = mul_nonIEEE(PV0fy,intBitsToFloat(uf_remappedPS[1].y)) + 0.0;
// 2
backupReg0f = R123f.y;
backupReg1f = R123f.z;
R123f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w),R123f.x) + R5f.z;
R123f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w),backupReg0f) + R5f.w;
R123f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w),backupReg1f) + R1f.y;
// 3
R127f.x = mul_nonIEEE(R6f.w, R123f.w);
R127f.z = mul_nonIEEE(R5f.x, R123f.y);
R127f.w = mul_nonIEEE(R5f.y, R123f.z);
// 4
PV0fx = -(R127f.w) + intBitsToFloat(uf_remappedPS[2].y);
PV0fy = -(R127f.x) + intBitsToFloat(uf_remappedPS[2].x);
PV0fw = -(R127f.z) + intBitsToFloat(uf_remappedPS[2].z);
// 5
backupReg0f = R127f.x;
R127f.x = mul_nonIEEE(PV0fw,R8f.y) + R127f.z;
R127f.y = mul_nonIEEE(PV0fx,R8f.y) + R127f.w;
R127f.z = mul_nonIEEE(PV0fy,R8f.y) + backupReg0f;
// 6
PV0fy = R7f.z + -(R127f.x);
PV0fz = R7f.y + -(R127f.y);
PV0fw = R7f.x + -(R127f.z);
// 7
backupReg0f = R127f.x;
R127f.x = mul_nonIEEE(PV0fw,R7f.w) + R127f.z;
R127f.z = mul_nonIEEE(PV0fy,R7f.w) + backupReg0f;
R127f.w = mul_nonIEEE(PV0fz,R7f.w) + R127f.y;
// 8
PV0fx = -(R127f.w) + intBitsToFloat(uf_remappedPS[3].y);
PV0fy = -(R127f.x) + intBitsToFloat(uf_remappedPS[3].x);
PV0fw = -(R127f.z) + intBitsToFloat(uf_remappedPS[3].z);
// 9
R0f.x = mul_nonIEEE(PV0fy,R8f.x) + R127f.x;
R0f.y = mul_nonIEEE(PV0fx,R8f.x) + R127f.w;
R0f.z = mul_nonIEEE(PV0fw,R8f.x) + R127f.z;
// export
if( ((vec4(R0f.x, R0f.y, R0f.z, R0f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
}
