#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;

vec4 zmCube(sampler2DArray s, vec2 st, int face, float cubeIndex, float lod) {
	return textureLod(s, vec3(st - 1.0, float(face) + cubeIndex * 6.0), lod);
}
// shader a6db02a86e7c2c25
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[6];
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
R11f.xyzw = (texture(textureUnitPS1, vec2(R4f.z,R4f.w)).xyzw);
R4f.x = (texture(textureUnitPS2, vec2(R5f.x,R5f.y)).w);
// 0
R127f.x = mul_nonIEEE(R10f.x, R10f.x);
R125f.y = mul_nonIEEE(R10f.y, R10f.y);
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
R125f.x = mul_nonIEEE(R10f.z, R10f.z);
R6f.y = mul_nonIEEE(R2f.y, R127f.y);
R5f.z = R126f.w;
PV0fw = mul_nonIEEE(R11f.x, R11f.x);
PS0f = 1.0 / abs(R126f.z);
// 3
PV1fx = mul_nonIEEE(R11f.y, R11f.y);
PV1fy = mul_nonIEEE(R11f.z, R11f.z);
R123f.z = mul_nonIEEE(R126f.y,PS0f) + 1.5;
R123f.w = mul_nonIEEE(R126f.x,PS0f) + 1.5;
PS1f = mul_nonIEEE(R127f.x, PV0fw);
// 4
R5f.x = R123f.z;
R5f.y = R123f.w;
R6f.z = mul_nonIEEE(R125f.y, PV1fx);
R4f.w = mul_nonIEEE(R125f.x, PV1fy);
R4f.z = PS1f * 1.0;
R5f.xyz = (zmCube(textureUnitPS10, R5f.xy, floatBitsToInt(R5f.z), cubeMapArrayIndex10, R5f.w).xyz);
R6f.x = (texture(textureUnitPS4, vec2(R6f.x,R6f.y)).x);
// 0
R125f.x = R5f.y * 1.0;
R125f.y = R5f.x * 1.0;
R127f.z = R6f.z * 1.0;
R126f.w = R5f.z * 1.0;
R126f.x = R4f.w * 1.0;
// 1
R127f.x = R0f.z + -(R1f.z);
R126f.y = R0f.y + -(R1f.y);
R126f.z = R0f.x + -(R1f.x);
R127f.w = R7f.x + 0.0;
R125f.w = 1.0 / R2f.w;
// 2
R123f.x = mul_nonIEEE(R125f.y,intBitsToFloat(uf_remappedPS[1].y)) + 0.0;
PV0fy = R7f.z + 0.0;
PV0fz = R7f.y + 0.0;
R123f.w = mul_nonIEEE(R125f.x,intBitsToFloat(uf_remappedPS[1].y)) + 0.0;
R122f.x = mul_nonIEEE(R126f.w,intBitsToFloat(uf_remappedPS[1].y)) + 0.0;
// 3
R123f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w),R123f.x) + R127f.w;
R123f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w),R123f.w) + PV0fz;
R123f.z = mul_nonIEEE(R126f.y,R127f.z) + R1f.y;
R123f.w = mul_nonIEEE(R126f.z,R4f.z) + R1f.x;
R126f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w),R122f.x) + PV0fy;
// 4
backupReg0f = R127f.x;
backupReg1f = R123f.y;
R127f.x = mul_nonIEEE(R123f.w, R123f.x);
R123f.y = mul_nonIEEE(backupReg0f,R126f.x) + R1f.z;
R1f.z = R2f.z * R125f.w;
R125f.w = mul_nonIEEE(R123f.z, backupReg1f);
PS0f = R10f.w + R11f.w;
// 5
PV1fx = -(R125f.w) + intBitsToFloat(uf_remappedPS[2].y);
PV1fy = -(R127f.x) + intBitsToFloat(uf_remappedPS[2].x);
R127f.z = mul_nonIEEE(R123f.y, R126f.y);
PV1fw = mul_nonIEEE(PS0f, R4f.x);
// 6
R0f.x = mul_nonIEEE(R0f.w, PV1fw);
R0f.x = clamp(R0f.x, 0.0, 1.0);
R126f.y = mul_nonIEEE(PV1fx,R9f.y) + R125f.w;
R126f.z = mul_nonIEEE(PV1fy,R9f.y) + R127f.x;
PV0fw = -(R127f.z) + intBitsToFloat(uf_remappedPS[2].z);
// 7
R127f.x = mul_nonIEEE(PV0fw,R9f.y) + R127f.z;
PV1fz = R8f.y + -(R126f.y);
PV1fw = R8f.x + -(R126f.z);
// 8
R126f.x = mul_nonIEEE(PV1fw,R8f.w) + R126f.z;
PV0fy = R8f.z + -(R127f.x);
R125f.w = mul_nonIEEE(PV1fz,R8f.w) + R126f.y;
// 9
PV1fx = -(R125f.w) + intBitsToFloat(uf_remappedPS[3].y);
PV1fy = -(R126f.x) + intBitsToFloat(uf_remappedPS[3].x);
R126f.z = mul_nonIEEE(PV0fy,R8f.w) + R127f.x;
// 10
R8f.x = mul_nonIEEE(PV1fy,R9f.x) + R126f.x;
R8f.y = mul_nonIEEE(PV1fx,R9f.x) + R125f.w;
PV0fw = -(R126f.z) + intBitsToFloat(uf_remappedPS[3].z);
// 11
R8f.z = mul_nonIEEE(PV0fw,R9f.x) + R126f.z;
// 0
R126f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].w),R6f.x) + intBitsToFloat(uf_remappedPS[4].x);
R123f.y = mul_nonIEEE(R1f.z,intBitsToFloat(uf_remappedPS[4].w)) + -(intBitsToFloat(uf_remappedPS[4].y));
// 1
PS1f = 1.0 / R123f.y;
// 2
PV0fz = -(intBitsToFloat(uf_remappedPS[4].z)) * PS1f;
R126f.z = 1.0 / intBitsToFloat(uf_remappedPS[5].y);
// 3
PV1fw = -(PV0fz) + R126f.x;
// 4
PV0fy = PV1fw * R126f.z;
PV0fy = clamp(PV0fy, 0.0, 1.0);
// 5
PV1fx = mul_nonIEEE(R0f.x, PV0fy);
// 6
R8f.w = mul_nonIEEE(R3f.x, PV1fx);
// export
if( ((vec4(R8f.x, R8f.y, R8f.z, R8f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R8f.x, R8f.y, R8f.z, R8f.w);
}
