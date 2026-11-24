#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;

vec4 zmCube(sampler2DArray s, vec2 st, int face, float cubeIndex, float lod) {
	return textureLod(s, vec3(st - 1.0, float(face) + cubeIndex * 6.0), lod);
}
// shader f2199aac6e1a1351
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[6];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(2, 1, 1) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(4, 1, 2) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(10, 1, 3) uniform sampler2DArray textureUnitPS10;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem8;
in vec4 passParameterSem9;
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
vec4 R10f = vec4(0.0);
vec4 R11f = vec4(0.0);
vec4 R122f = vec4(0.0);
vec4 R123f = vec4(0.0);
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
float cubeMapArrayIndex10 = 0.0;
R0f = passParameterSem0;
R1f = passParameterSem1;
R2f = passParameterSem3;
R3f = passParameterSem4;
R4f = passParameterSem8;
R5f = passParameterSem9;
R6f = passParameterSem11;
R7f = passParameterSem14;
R8f = passParameterSem15;
R9f = passParameterSem16;
R10f.xyzw = (texture(textureUnitPS0, vec2(R4f.x,R4f.y)).xyzw);
R4f.x = (texture(textureUnitPS2, vec2(R5f.x,R5f.y)).w);
// 0
R127f.x = mul_nonIEEE(R10f.y, R10f.y);
R125f.y = mul_nonIEEE(R10f.x, R10f.x);
R6f.z = -(R6f.z);
R5f.w = intBitsToFloat(uf_remappedPS[0].x);
R127f.y = 1.0 / R2f.w;
// 1
redcCUBE(vec4(R6f.z,R6f.z,R6f.x,R6f.y),vec4(R6f.y,R6f.x,R6f.z,R6f.z),cubeMapSTM,cubeMapFaceId);
R126f.x = cubeMapSTM.x;
R126f.y = cubeMapSTM.y;
R126f.z = cubeMapSTM.z;
R126f.w = intBitsToFloat(cubeMapFaceId);
R6f.x = mul_nonIEEE(R2f.x, R127f.y);
// 2
R1f.x = R7f.x + 0.0;
R6f.y = mul_nonIEEE(R2f.y, R127f.y);
R5f.z = R126f.w;
R127f.w = mul_nonIEEE(R10f.z, R10f.z);
PS0f = 1.0 / abs(R126f.z);
// 3
R7f.x = R7f.y + 0.0;
R7f.y = R7f.z + 0.0;
R123f.z = mul_nonIEEE(R126f.y,PS0f) + 1.5;
R123f.w = mul_nonIEEE(R126f.x,PS0f) + 1.5;
R3f.w = 1.0 / R2f.w;
// 4
R5f.x = R123f.z;
R5f.y = R123f.w;
R7f.z = mul_nonIEEE(R0f.x, R125f.y);
R4f.w = mul_nonIEEE(R0f.y, R127f.x);
R11f.x = mul_nonIEEE(R0f.z, R127f.w);
R5f.xyz = (zmCube(textureUnitPS10, R5f.xy, floatBitsToInt(R5f.z), cubeMapArrayIndex10, R5f.w).xyz);
R6f.x = (texture(textureUnitPS4, vec2(R6f.x,R6f.y)).x);
// 0
PV0fx = R5f.y * 1.0;
PV0fy = R5f.x * 1.0;
R2f.z = R2f.z * R3f.w;
PV0fw = R5f.z * 1.0;
R122f.x = R0f.w * 2.0 + -(1.0);
// 1
backupReg0f = R4f.x;
R4f.x = mul_nonIEEE(PV0fw,intBitsToFloat(uf_remappedPS[1].y)) + 0.0;
R0f.y = mul_nonIEEE(PV0fx,intBitsToFloat(uf_remappedPS[1].y)) + 0.0;
R0f.z = mul_nonIEEE(PV0fy,intBitsToFloat(uf_remappedPS[1].y)) + 0.0;
PV1fw = backupReg0f + R122f.x;
R5f.z = 1.0 / intBitsToFloat(uf_remappedPS[2].y);
// 2
PV0fy = mul_nonIEEE(R10f.w, PV1fw);
// 3
R10f.x = mul_nonIEEE(R1f.w, PV0fy);
R10f.x = clamp(R10f.x, 0.0, 1.0);
// 0
R123f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w),R4f.x) + R7f.y;
R123f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w),R0f.y) + R7f.x;
R123f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w),R0f.z) + R1f.x;
// 1
backupReg0f = R123f.y;
R127f.x = mul_nonIEEE(R7f.z, R123f.w);
R123f.y = mul_nonIEEE(R2f.z,intBitsToFloat(uf_remappedPS[3].w)) + -(intBitsToFloat(uf_remappedPS[3].y));
R126f.z = mul_nonIEEE(R11f.x, backupReg0f);
R127f.w = mul_nonIEEE(R4f.w, R123f.z);
R126f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].w),R6f.x) + intBitsToFloat(uf_remappedPS[3].x);
// 2
PV0fx = -(R127f.w) + intBitsToFloat(uf_remappedPS[4].y);
PV0fy = -(R127f.x) + intBitsToFloat(uf_remappedPS[4].x);
PV0fw = -(R126f.z) + intBitsToFloat(uf_remappedPS[4].z);
PS0f = 1.0 / R123f.y;
// 3
backupReg0f = R127f.x;
R127f.x = mul_nonIEEE(PV0fw,R9f.y) + R126f.z;
R125f.y = mul_nonIEEE(PV0fx,R9f.y) + R127f.w;
R126f.z = mul_nonIEEE(PV0fy,R9f.y) + backupReg0f;
PV1fw = -(intBitsToFloat(uf_remappedPS[3].z)) * PS0f;
// 4
PV0fx = R8f.x + -(R126f.z);
PV0fy = R8f.z + -(R127f.x);
PV0fz = R8f.y + -(R125f.y);
PV0fw = -(PV1fw) + R126f.x;
// 5
backupReg0f = R127f.x;
R127f.x = mul_nonIEEE(PV0fx,R8f.w) + R126f.z;
PV1fy = PV0fw * R5f.z;
PV1fy = clamp(PV1fy, 0.0, 1.0);
R126f.z = mul_nonIEEE(PV0fy,R8f.w) + backupReg0f;
R127f.w = mul_nonIEEE(PV0fz,R8f.w) + R125f.y;
// 6
PV0fx = mul_nonIEEE(R10f.x, PV1fy);
PV0fy = -(R127f.x) + intBitsToFloat(uf_remappedPS[5].x);
PV0fz = -(R127f.w) + intBitsToFloat(uf_remappedPS[5].y);
PV0fw = -(R126f.z) + intBitsToFloat(uf_remappedPS[5].z);
// 7
backupReg0f = R3f.x;
R3f.x = mul_nonIEEE(PV0fy,R9f.x) + R127f.x;
R3f.y = mul_nonIEEE(PV0fz,R9f.x) + R127f.w;
R3f.z = mul_nonIEEE(PV0fw,R9f.x) + R126f.z;
R3f.w = mul_nonIEEE(backupReg0f, PV0fx);
// export
if( ((vec4(R3f.x, R3f.y, R3f.z, R3f.w)).a >= uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R3f.x, R3f.y, R3f.z, R3f.w);
}
