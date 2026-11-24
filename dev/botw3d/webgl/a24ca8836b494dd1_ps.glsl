#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;

vec4 zmCube(sampler2DArray s, vec2 st, int face, float cubeIndex, float lod) {
	return textureLod(s, vec3(st - 1.0, float(face) + cubeIndex * 6.0), lod);
}
// shader a24ca8836b494dd1
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[3];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 2) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(4, 1, 3) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(10, 1, 4) uniform sampler2DArray textureUnitPS10;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem5;
in vec4 passParameterSem8;
in vec4 passParameterSem9;
in vec4 passParameterSem11;
in vec4 passParameterSem14;
in vec4 passParameterSem15;
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
vec4 R122f = vec4(0.0);
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
R1f = passParameterSem1;
R2f = passParameterSem3;
R3f = passParameterSem4;
R4f = passParameterSem5;
R5f = passParameterSem8;
R6f = passParameterSem9;
R7f = passParameterSem11;
R8f = passParameterSem14;
R9f = passParameterSem15;
R10f.xw = (texture(textureUnitPS0, vec2(R5f.x,R5f.y)).xw);
// 0
R127f.x = 1.5 * R4f.x + 0.5;
R123f.y = R10f.x * 2.0 + -(1.0);
R7f.z = -(R7f.z);
R123f.w = R10f.w * 2.0 + -(1.0);
R127f.y = 1.0 / R2f.w;
// 1
PV1fx = mul_nonIEEE(R3f.y, R123f.w);
R10f.y = mul_nonIEEE(R2f.y, R127f.y);
PV1fz = mul_nonIEEE(R3f.y, R123f.y);
R10f.w = mul_nonIEEE(R2f.x, R127f.y);
R4f.w = intBitsToFloat(uf_remappedPS[0].x);
// 2
R2f.x = R6f.x + PV1fz;
R2f.y = R6f.y + PV1fx;
PV0fz = mul_nonIEEE(PV1fx, R127f.x);
PV0fw = mul_nonIEEE(PV1fz, R127f.x);
PS0f = R2f.z * R127f.y;
// 3
R5f.x = R5f.z + PV0fw;
R5f.y = R5f.w + PV0fz;
R123f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].w),PS0f) + -(intBitsToFloat(uf_remappedPS[1].y));
R5f.w = R0f.w * 2.0 + -(1.0);
R6f.y = R0f.x * 1.5 + -(R0f.x);
// 4
redcCUBE(vec4(R7f.z,R7f.z,R7f.x,R7f.y),vec4(R7f.y,R7f.x,R7f.z,R7f.z),cubeMapSTM,cubeMapFaceId);
R127f.x = cubeMapSTM.x;
R127f.y = cubeMapSTM.y;
R127f.z = cubeMapSTM.z;
R127f.w = intBitsToFloat(cubeMapFaceId);
PS0f = 1.0 / R123f.z;
// 5
R7f.x = -(intBitsToFloat(uf_remappedPS[1].z)) * PS0f;
R7f.y = R0f.y * 1.5 + -(R0f.y);
R4f.z = R127f.w;
R2f.w = R0f.z * 1.5 + -(R0f.z);
PS1f = 1.0 / abs(R127f.z);
// 6
R6f.x = -(R9f.w) + 1.0;
R123f.y = mul_nonIEEE(R127f.y,PS1f) + 1.5;
R123f.z = mul_nonIEEE(R127f.x,PS1f) + 1.5;
R9f.w = R8f.x + 0.0;
R9f.y = R8f.y + 0.0;
// 7
R4f.x = R123f.y;
R4f.y = R123f.z;
R7f.z = R8f.z + 0.0;
R8f.xzw = (texture(textureUnitPS1, vec2(R5f.x,R5f.y)).xzw);
R2f.x = (texture(textureUnitPS2, vec2(R2f.x,R2f.y)).w);
R5f.x = (texture(textureUnitPS4, vec2(R10f.w,R10f.y)).x);
R4f.xyz = (zmCube(textureUnitPS10, R4f.xy, floatBitsToInt(R4f.z), cubeMapArrayIndex10, R4f.w).xyz);
// 0
R127f.x = mul_nonIEEE(R5f.x,intBitsToFloat(uf_remappedPS[1].w)) + intBitsToFloat(uf_remappedPS[1].x);
PV0fy = R2f.x + R5f.w;
R123f.z = mul_nonIEEE(R7f.y,R8f.x) + R0f.y;
PV0fw = -(R8f.z) + 1.0;
R122f.x = mul_nonIEEE(R2f.w,R8f.x) + R0f.z;
// 1
R126f.x = mul_nonIEEE(R6f.y,R8f.x) + R0f.x;
R127f.y = mul_nonIEEE(R1f.y, R123f.z);
PV1fz = R7f.x + PV0fw;
PV1fw = mul_nonIEEE(R8f.w, PV0fy);
R126f.w = mul_nonIEEE(R1f.z, R122f.x);
// 2
PV0fx = mul_nonIEEE(R4f.y, R6f.x);
PV0fy = R127f.x + -(PV1fz);
PV0fy = clamp(PV0fy, 0.0, 1.0);
R127f.z = mul_nonIEEE(R1f.w, PV1fw);
R127f.z = clamp(R127f.z, 0.0, 1.0);
PV0fw = mul_nonIEEE(R4f.x, R6f.x);
PS0f = mul_nonIEEE(R4f.z, R6f.x);
// 3
PV1fx = PV0fy * 20.0;
PV1fx = clamp(PV1fx, 0.0, 1.0);
R1f.y = mul_nonIEEE(PV0fw,intBitsToFloat(uf_remappedPS[2].y)) + 0.0;
R1f.z = mul_nonIEEE(PV0fx,intBitsToFloat(uf_remappedPS[2].y)) + 0.0;
R127f.w = mul_nonIEEE(R1f.x, R126f.x);
R4f.z = mul_nonIEEE(PS0f,intBitsToFloat(uf_remappedPS[2].y)) + 0.0;
// 4
PV0fw = mul_nonIEEE(R127f.z, PV1fx);
PV0fw = clamp(PV0fw, 0.0, 1.0);
// 5
R1f.x = mul_nonIEEE(R126f.w, PV0fw);
R4f.y = mul_nonIEEE(R127f.y, PV0fw);
R0f.z = mul_nonIEEE(R127f.w, PV0fw);
PV1fw = PV0fw;
PV1fw = clamp(PV1fw, 0.0, 1.0);
// 6
R3f.w = mul_nonIEEE(R3f.x, PV1fw);
// 0
R123f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w),R1f.z) + R9f.y;
R123f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w),R1f.y) + R9f.w;
R123f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w),R4f.z) + R7f.z;
// 1
R3f.x = mul_nonIEEE(R0f.z, R123f.y);
R3f.y = mul_nonIEEE(R4f.y, R123f.x);
R3f.z = mul_nonIEEE(R1f.x, R123f.w);
// export
if( ((vec4(R3f.x, R3f.y, R3f.z, R3f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R3f.x, R3f.y, R3f.z, R3f.w);
}
