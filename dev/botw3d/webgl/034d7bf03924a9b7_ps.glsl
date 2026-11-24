#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;

vec4 zmCube(sampler2DArray s, vec2 st, int face, float cubeIndex, float lod) {
	return textureLod(s, vec3(st - 1.0, float(face) + cubeIndex * 6.0), lod);
}
// shader 034d7bf03924a9b7
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
in vec4 passParameterSem7;
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
vec4 R12f = vec4(0.0);
vec4 R13f = vec4(0.0);
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
R4f = passParameterSem7;
R5f = passParameterSem8;
R6f = passParameterSem9;
R7f = passParameterSem11;
R8f = passParameterSem14;
R9f = passParameterSem15;
R10f = passParameterSem16;
R11f.xyzw = (texture(textureUnitPS1, vec2(R5f.z,R5f.w)).xyzw);
R12f.xyzw = (texture(textureUnitPS0, vec2(R5f.x,R5f.y)).xyzw);
R13f.xyzw = (texture(textureUnitPS2, vec2(R6f.x,R6f.y)).xyzw);
// 0
R127f.x = mul_nonIEEE(R11f.x, R11f.x);
R127f.y = mul_nonIEEE(R11f.y, R11f.y);
R7f.z = -(R7f.z);
R6f.w = intBitsToFloat(uf_remappedPS[0].x);
R127f.z = 1.0 / R2f.w;
// 1
redcCUBE(vec4(R7f.z,R7f.z,R7f.x,R7f.y),vec4(R7f.y,R7f.x,R7f.z,R7f.z),cubeMapSTM,cubeMapFaceId);
R126f.x = cubeMapSTM.x;
R126f.y = cubeMapSTM.y;
R126f.z = cubeMapSTM.z;
R126f.w = intBitsToFloat(cubeMapFaceId);
R7f.x = mul_nonIEEE(R2f.x, R127f.z);
// 2
R127f.x = R127f.x * intBitsToFloat(0x3f666666);
R7f.y = mul_nonIEEE(R2f.y, R127f.z);
R6f.z = R126f.w;
PV0fw = mul_nonIEEE(R11f.z, R11f.z);
PS0f = 1.0 / abs(R126f.z);
// 3
R5f.x = R127f.y * intBitsToFloat(0x3f666666);
R5f.y = PV0fw * intBitsToFloat(0x3f666666);
R123f.z = mul_nonIEEE(R126f.y,PS0f) + 1.5;
R123f.w = mul_nonIEEE(R126f.x,PS0f) + 1.5;
R122f.x = mul_nonIEEE(R12f.x,R12f.x) + -(R127f.x);
// 4
R6f.x = R123f.z;
R6f.y = R123f.w;
R7f.z = mul_nonIEEE(R12f.y,R12f.y) + -(R5f.x);
R5f.w = mul_nonIEEE(R12f.z,R12f.z) + -(R5f.y);
R3f.y = mul_nonIEEE(R122f.x,R12f.w) + R127f.x;
R6f.xyz = (zmCube(textureUnitPS10, R6f.xy, floatBitsToInt(R6f.z), cubeMapArrayIndex10, R6f.w).xyz);
R7f.y = (texture(textureUnitPS4, vec2(R7f.x,R7f.y)).x);
// 0
PV0fx = mul_nonIEEE(R13f.x, R13f.x);
PV0fy = mul_nonIEEE(R13f.y, R13f.y);
R126f.z = mul_nonIEEE(R5f.w,R12f.w) + R5f.y;
R123f.w = mul_nonIEEE(R7f.z,R12f.w) + R5f.x;
R126f.w = mul_nonIEEE(R13f.z, R13f.z);
// 1
R127f.x = R6f.y * 1.0;
R127f.y = R6f.x * 1.0;
R127f.z = mul_nonIEEE(R3f.y, PV0fx);
R127f.w = R6f.z * 1.0;
R126f.x = mul_nonIEEE(R123f.w, PV0fy);
// 2
R125f.x = R0f.z + -(R1f.z);
R126f.y = mul_nonIEEE(R126f.z, R126f.w);
R126f.z = R0f.y + -(R1f.y);
R126f.w = R0f.x + -(R1f.x);
R125f.w = 1.0 / R2f.w;
// 3
R123f.x = mul_nonIEEE(R127f.y,intBitsToFloat(uf_remappedPS[1].y)) + 0.0;
R125f.y = R8f.z + 0.0;
R125f.z = R8f.y + 0.0;
PV1fw = R8f.x + 0.0;
R127f.y = mul_nonIEEE(R127f.x,intBitsToFloat(uf_remappedPS[1].y)) + 0.0;
// 4
backupReg0f = R123f.x;
R123f.x = mul_nonIEEE(R127f.w,intBitsToFloat(uf_remappedPS[1].y)) + 0.0;
R123f.y = mul_nonIEEE(R126f.w,R127f.z) + R1f.x;
R127f.z = mul_nonIEEE(R125f.x,R126f.y) + R1f.z;
R127f.w = mul_nonIEEE(R126f.z,R126f.x) + R1f.y;
R122f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w),backupReg0f) + PV1fw;
// 5
backupReg0f = R123f.x;
backupReg1f = R123f.y;
R123f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w),R127f.y) + R125f.z;
R123f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w),backupReg0f) + R125f.y;
R2f.z = R2f.z * R125f.w;
R125f.w = mul_nonIEEE(backupReg1f, R122f.x);
PS1f = R11f.w + R12f.w;
// 6
PV0fx = -(R125f.w) + intBitsToFloat(uf_remappedPS[2].x);
PV0fy = mul_nonIEEE(R13f.w, PS1f);
R127f.z = mul_nonIEEE(R127f.z, R123f.y);
R127f.w = mul_nonIEEE(R127f.w, R123f.x);
R126f.x = mul_nonIEEE(R4f.w, R4f.w);
// 7
PV1fx = -(R127f.w) + intBitsToFloat(uf_remappedPS[2].y);
PV1fy = mul_nonIEEE(R0f.w, PV0fy);
R125f.z = mul_nonIEEE(PV0fx,R10f.y) + R125f.w;
PV1fw = -(R127f.z) + intBitsToFloat(uf_remappedPS[2].z);
// 8
R125f.x = mul_nonIEEE(PV1fw,R10f.y) + R127f.z;
R127f.y = mul_nonIEEE(PV1fx,R10f.y) + R127f.w;
PV0fz = mul_nonIEEE(R1f.w, PV1fy);
PV0fw = R9f.x + -(R125f.z);
// 9
R1f.x = mul_nonIEEE(PV0fz, R126f.x);
R1f.x = clamp(R1f.x, 0.0, 1.0);
PV1fy = R9f.z + -(R125f.x);
PV1fz = R9f.y + -(R127f.y);
R127f.w = mul_nonIEEE(PV0fw,R9f.w) + R125f.z;
// 10
PV0fy = -(R127f.w) + intBitsToFloat(uf_remappedPS[3].x);
R125f.z = mul_nonIEEE(PV1fy,R9f.w) + R125f.x;
R125f.w = mul_nonIEEE(PV1fz,R9f.w) + R127f.y;
// 11
PV1fx = -(R125f.w) + intBitsToFloat(uf_remappedPS[3].y);
PV1fw = -(R125f.z) + intBitsToFloat(uf_remappedPS[3].z);
R9f.x = mul_nonIEEE(PV0fy,R10f.x) + R127f.w;
// 12
R9f.y = mul_nonIEEE(PV1fx,R10f.x) + R125f.w;
R9f.z = mul_nonIEEE(PV1fw,R10f.x) + R125f.z;
// 0
R123f.x = mul_nonIEEE(R2f.z,intBitsToFloat(uf_remappedPS[4].w)) + -(intBitsToFloat(uf_remappedPS[4].y));
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].w),R7f.y) + intBitsToFloat(uf_remappedPS[4].x);
// 1
PS1f = 1.0 / R123f.x;
// 2
PV0fw = -(intBitsToFloat(uf_remappedPS[4].z)) * PS1f;
R125f.z = 1.0 / intBitsToFloat(uf_remappedPS[5].y);
// 3
PV1fw = -(PV0fw) + R127f.y;
// 4
PV0fy = PV1fw * R125f.z;
PV0fy = clamp(PV0fy, 0.0, 1.0);
// 5
PV1fx = mul_nonIEEE(R1f.x, PV0fy);
// 6
R9f.w = mul_nonIEEE(R3f.x, PV1fx);
// export
if( ((vec4(R9f.x, R9f.y, R9f.z, R9f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R9f.x, R9f.y, R9f.z, R9f.w);
}
