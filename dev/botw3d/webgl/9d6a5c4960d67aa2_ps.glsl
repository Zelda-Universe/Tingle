#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;

vec4 zmCube(sampler2DArray s, vec2 st, int face, float cubeIndex, float lod) {
	return textureLod(s, vec3(st - 1.0, float(face) + cubeIndex * 6.0), lod);
}
// shader 9d6a5c4960d67aa2
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[7];
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
R11f.xw = (texture(textureUnitPS0, vec2(R5f.x,R5f.y)).xw);
R6f.x = (texture(textureUnitPS2, vec2(R6f.x,R6f.y)).w);
// 0
R123f.x = R11f.x * 2.0 + -(1.0);
R127f.y = mul_nonIEEE(R3f.y, intBitsToFloat(uf_remappedPS[0].y));
R7f.z = -(R7f.z);
PV0fw = mul_nonIEEE(R3f.y, intBitsToFloat(uf_remappedPS[0].x));
R127f.w = R11f.w * 2.0 + -(1.0);
// 1
redcCUBE(vec4(R7f.z,R7f.z,R7f.x,R7f.y),vec4(R7f.y,R7f.x,R7f.z,R7f.z),cubeMapSTM,cubeMapFaceId);
R126f.x = cubeMapSTM.x;
R126f.y = cubeMapSTM.y;
R126f.z = cubeMapSTM.z;
R126f.w = intBitsToFloat(cubeMapFaceId);
R7f.x = mul_nonIEEE(PV0fw,R123f.x) + R5f.z;
// 2
R11f.x = -(R10f.w) + 1.0;
R7f.y = mul_nonIEEE(R127f.y,R127f.w) + R5f.w;
R5f.z = R126f.w;
R5f.w = intBitsToFloat(uf_remappedPS[1].x);
PS0f = 1.0 / abs(R126f.z);
// 3
R123f.x = mul_nonIEEE(R126f.x,PS0f) + 1.5;
R6f.y = R0f.x + -(R1f.x);
R3f.z = R0f.y + -(R1f.y);
R123f.w = mul_nonIEEE(R126f.y,PS0f) + 1.5;
PS1f = 1.0 / R2f.w;
// 4
R5f.x = R123f.w;
R5f.y = R123f.x;
R7f.z = mul_nonIEEE(R2f.x, PS1f);
R7f.w = mul_nonIEEE(R2f.y, PS1f);
R11f.y = R0f.z + -(R1f.z);
R12f.xyzw = (texture(textureUnitPS1, vec2(R7f.x,R7f.y)).xyzw);
R5f.xyz = (zmCube(textureUnitPS10, R5f.xy, floatBitsToInt(R5f.z), cubeMapArrayIndex10, R5f.w).xyz);
R7f.x = (texture(textureUnitPS4, vec2(R7f.z,R7f.w)).x);
// 0
PV0fx = mul_nonIEEE(R12f.z, R12f.z);
PV0fy = mul_nonIEEE(R12f.y, R12f.y);
PV0fz = mul_nonIEEE(R12f.x, R12f.x);
R126f.w = mul_nonIEEE(R5f.x, R11f.x);
R126f.x = mul_nonIEEE(R5f.y, R11f.x);
// 1
R127f.x = mul_nonIEEE(R5f.z, R11f.x);
PV1fy = PV0fx * 1.0;
PV1fz = PV0fy * 1.0;
PV1fw = PV0fz * 1.0;
R125f.x = 1.0 / R2f.w;
// 2
R123f.x = mul_nonIEEE(R6f.y,PV1fw) + R1f.x;
R126f.y = R8f.x + 0.0;
R126f.z = mul_nonIEEE(R11f.y,PV1fy) + R1f.z;
R127f.w = mul_nonIEEE(R3f.z,PV1fz) + R1f.y;
R127f.z = R8f.z + 0.0;
// 3
R127f.x = mul_nonIEEE(R127f.x,intBitsToFloat(uf_remappedPS[2].y)) + 0.0;
R123f.y = mul_nonIEEE(R126f.x,intBitsToFloat(uf_remappedPS[2].y)) + 0.0;
R123f.z = mul_nonIEEE(R126f.w,intBitsToFloat(uf_remappedPS[2].y)) + 0.0;
PV1fw = R8f.y + 0.0;
R127f.y = mul_nonIEEE(R4f.x, R123f.x);
// 4
PV0fx = mul_nonIEEE(R4f.y, R127f.w);
R2f.y = R2f.z * R125f.x;
R123f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].w),R123f.z) + R126f.y;
R127f.w = mul_nonIEEE(R4f.z, R126f.z);
R122f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].w),R123f.y) + PV1fw;
// 5
backupReg0f = R127f.x;
R127f.x = mul_nonIEEE(R127f.y, R123f.z);
R123f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].w),backupReg0f) + R127f.z;
PV1fz = mul_nonIEEE(R12f.w, R6f.x);
R126f.w = mul_nonIEEE(PV0fx, R122f.x);
// 6
PV0fx = -(R126f.w) + intBitsToFloat(uf_remappedPS[3].y);
PV0fy = -(R127f.x) + intBitsToFloat(uf_remappedPS[3].x);
R127f.z = mul_nonIEEE(R127f.w, R123f.y);
R123f.w = (mul_nonIEEE(R4f.w,PV1fz) + -(R0f.w))*4.0;
R123f.w = clamp(R123f.w, 0.0, 1.0);
// 7
R1f.x = mul_nonIEEE(R1f.w, R123f.w);
R1f.x = clamp(R1f.x, 0.0, 1.0);
R127f.y = mul_nonIEEE(PV0fx,R10f.y) + R126f.w;
R126f.z = mul_nonIEEE(PV0fy,R10f.y) + R127f.x;
PV1fw = -(R127f.z) + intBitsToFloat(uf_remappedPS[3].z);
// 8
R127f.x = mul_nonIEEE(PV1fw,R10f.y) + R127f.z;
PV0fz = R9f.y + -(R127f.y);
PV0fw = R9f.x + -(R126f.z);
// 9
R125f.x = mul_nonIEEE(PV0fw,R9f.w) + R126f.z;
PV1fy = R9f.z + -(R127f.x);
R126f.w = mul_nonIEEE(PV0fz,R9f.w) + R127f.y;
// 10
PV0fx = -(R126f.w) + intBitsToFloat(uf_remappedPS[4].y);
PV0fy = -(R125f.x) + intBitsToFloat(uf_remappedPS[4].x);
R126f.z = mul_nonIEEE(PV1fy,R9f.w) + R127f.x;
// 11
R9f.x = mul_nonIEEE(PV0fy,R10f.x) + R125f.x;
R9f.y = mul_nonIEEE(PV0fx,R10f.x) + R126f.w;
PV1fw = -(R126f.z) + intBitsToFloat(uf_remappedPS[4].z);
// 12
R9f.z = mul_nonIEEE(PV1fw,R10f.x) + R126f.z;
// 0
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].w),R7f.x) + intBitsToFloat(uf_remappedPS[5].x);
R123f.z = mul_nonIEEE(R2f.y,intBitsToFloat(uf_remappedPS[5].w)) + -(intBitsToFloat(uf_remappedPS[5].y));
// 1
PS1f = 1.0 / R123f.z;
// 2
PV0fw = -(intBitsToFloat(uf_remappedPS[5].z)) * PS1f;
R126f.w = 1.0 / intBitsToFloat(uf_remappedPS[6].y);
// 3
PV1fx = -(PV0fw) + R127f.y;
// 4
PV0fz = PV1fx * R126f.w;
PV0fz = clamp(PV0fz, 0.0, 1.0);
// 5
PV1fy = mul_nonIEEE(R1f.x, PV0fz);
// 6
R9f.w = mul_nonIEEE(R3f.x, PV1fy);
// export
if( ((vec4(R9f.x, R9f.y, R9f.z, R9f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R9f.x, R9f.y, R9f.z, R9f.w);
}
