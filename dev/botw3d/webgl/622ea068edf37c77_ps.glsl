#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;

vec4 zmCube(sampler2DArray s, vec2 st, int face, float cubeIndex, float lod) {
	return textureLod(s, vec3(st - 1.0, float(face) + cubeIndex * 6.0), lod);
}
// shader 622ea068edf37c77
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[5];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 2) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(10, 1, 3) uniform sampler2DArray textureUnitPS10;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
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
R2f = passParameterSem4;
R3f = passParameterSem8;
R4f = passParameterSem9;
R5f = passParameterSem11;
R6f = passParameterSem14;
R7f = passParameterSem15;
R8f = passParameterSem16;
R9f.xw = (texture(textureUnitPS0, vec2(R3f.x,R3f.y)).xw);
R4f.x = (texture(textureUnitPS2, vec2(R4f.x,R4f.y)).w);
// 0
PV0fx = mul_nonIEEE(R2f.y, intBitsToFloat(uf_remappedPS[0].x));
R127f.y = mul_nonIEEE(R2f.y, intBitsToFloat(uf_remappedPS[0].y));
R5f.z = -(R5f.z);
R123f.w = R9f.x * 2.0 + -(1.0);
R127f.w = R9f.w * 2.0 + -(1.0);
// 1
redcCUBE(vec4(R5f.z,R5f.z,R5f.x,R5f.y),vec4(R5f.y,R5f.x,R5f.z,R5f.z),cubeMapSTM,cubeMapFaceId);
R126f.x = cubeMapSTM.x;
R126f.y = cubeMapSTM.y;
R126f.z = cubeMapSTM.z;
R126f.w = intBitsToFloat(cubeMapFaceId);
R5f.x = mul_nonIEEE(PV0fx,R123f.w) + R3f.z;
// 2
R9f.x = -(R8f.w) + 1.0;
R5f.y = mul_nonIEEE(R127f.y,R127f.w) + R3f.w;
R3f.z = R126f.w;
R3f.w = intBitsToFloat(uf_remappedPS[1].x);
PS0f = 1.0 / abs(R126f.z);
// 3
R123f.x = mul_nonIEEE(R126f.x,PS0f) + 1.5;
R4f.y = R0f.x + -(R1f.x);
R4f.z = R0f.y + -(R1f.y);
R123f.w = mul_nonIEEE(R126f.y,PS0f) + 1.5;
R9f.y = R0f.z + -(R1f.z);
// 4
backupReg0f = R6f.z;
R3f.x = R123f.w;
R3f.y = R123f.x;
R6f.z = R6f.x + 0.0;
R9f.w = R6f.y + 0.0;
R2f.z = backupReg0f + 0.0;
R3f.xyz = (zmCube(textureUnitPS10, R3f.xy, floatBitsToInt(R3f.z), cubeMapArrayIndex10, R3f.w).xyz);
R5f.xyz = (texture(textureUnitPS1, vec2(R5f.x,R5f.y)).xyz);
// 0
PV0fx = mul_nonIEEE(R5f.y, R5f.y);
R126f.y = mul_nonIEEE(R5f.z, R5f.z);
R125f.z = mul_nonIEEE(R5f.x, R5f.x);
PV0fw = mul_nonIEEE(R3f.x, R9f.x);
PS0f = mul_nonIEEE(R3f.y, R9f.x);
// 1
PV1fx = R125f.z * 1.0;
R123f.y = mul_nonIEEE(PS0f,intBitsToFloat(uf_remappedPS[2].y)) + 0.0;
R123f.z = mul_nonIEEE(PV0fw,intBitsToFloat(uf_remappedPS[2].y)) + 0.0;
PV1fw = mul_nonIEEE(R3f.z, R9f.x);
R126f.z = PV0fx * 1.0;
// 2
R123f.x = mul_nonIEEE(PV1fw,intBitsToFloat(uf_remappedPS[2].y)) + 0.0;
R126f.y = R126f.y * 1.0;
R127f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].w),R123f.y) + R9f.w;
R123f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].w),R123f.z) + R6f.z;
R122f.x = mul_nonIEEE(R4f.y,PV1fx) + R1f.x;
// 3
R126f.x = mul_nonIEEE(R122f.x, R123f.w);
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].w),R123f.x) + R2f.z;
R123f.w = mul_nonIEEE(R4f.z,R126f.z) + R1f.y;
// 4
PV0fx = mul_nonIEEE(R125f.z, R4f.x);
PV0fy = -(R126f.x) + intBitsToFloat(uf_remappedPS[3].x);
R123f.z = mul_nonIEEE(R9f.y,R126f.y) + R1f.z;
R126f.w = mul_nonIEEE(R123f.w, R127f.z);
// 5
backupReg0f = R127f.y;
PV1fx = -(R126f.w) + intBitsToFloat(uf_remappedPS[3].y);
R127f.y = mul_nonIEEE(PV0fy,R8f.y) + R126f.x;
R127f.z = mul_nonIEEE(R123f.z, backupReg0f);
PV1fw = mul_nonIEEE(R0f.w, PV0fx);
PV1fw = clamp(PV1fw, 0.0, 1.0);
// 6
PV0fx = R7f.x + -(R127f.y);
R126f.y = mul_nonIEEE(PV1fx,R8f.y) + R126f.w;
PV0fw = -(R127f.z) + intBitsToFloat(uf_remappedPS[3].z);
R2f.w = mul_nonIEEE(R2f.x, PV1fw);
// 7
R126f.x = mul_nonIEEE(PV0fw,R8f.y) + R127f.z;
R127f.y = mul_nonIEEE(PV0fx,R7f.w) + R127f.y;
PV1fz = R7f.y + -(R126f.y);
// 8
PV0fx = -(R127f.y) + intBitsToFloat(uf_remappedPS[4].x);
PV0fy = R7f.z + -(R126f.x);
R126f.w = mul_nonIEEE(PV1fz,R7f.w) + R126f.y;
// 9
PV1fx = -(R126f.w) + intBitsToFloat(uf_remappedPS[4].y);
R127f.z = mul_nonIEEE(PV0fy,R7f.w) + R126f.x;
R2f.x = mul_nonIEEE(PV0fx,R8f.x) + R127f.y;
// 10
R2f.y = mul_nonIEEE(PV1fx,R8f.x) + R126f.w;
PV0fw = -(R127f.z) + intBitsToFloat(uf_remappedPS[4].z);
// 11
R2f.z = mul_nonIEEE(PV0fw,R8f.x) + R127f.z;
// export
if( ((vec4(R2f.x, R2f.y, R2f.z, R2f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
}
