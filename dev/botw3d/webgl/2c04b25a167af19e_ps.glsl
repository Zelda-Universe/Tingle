#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;

vec4 zmCube(sampler2DArray s, vec2 st, int face, float cubeIndex, float lod) {
	return textureLod(s, vec3(st - 1.0, float(face) + cubeIndex * 6.0), lod);
}
// shader 2c04b25a167af19e
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[10];
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
R10f.xw = (texture(textureUnitPS0, vec2(R4f.x,R4f.y)).xw);
R10f.y = (texture(textureUnitPS2, vec2(R5f.x,R5f.y)).w);
// 0
R11f.x = R0f.x + -(R1f.x);
R123f.y = R10f.w * 2.0 + -(1.0);
R123f.z = R10f.x * 2.0 + -(1.0);
R127f.w = R10f.y * 1.0;
R127f.z = 1.0 / R2f.w;
// 1
PV1fx = mul_nonIEEE(R3f.y, R123f.z);
PV1fy = mul_nonIEEE(R3f.y, R123f.y);
R11f.z = mul_nonIEEE(R2f.x, R127f.z);
R10f.w = intBitsToFloat(uf_remappedPS[0].x);
R11f.y = mul_nonIEEE(R2f.y, R127f.z);
// 2
PV0fx = R2f.z * R127f.z;
R2f.y = R0f.y + -(R1f.y);
PV0fz = mul_nonIEEE(PV1fx, R127f.w);
PV0fw = mul_nonIEEE(R127f.w, PV1fy);
R2f.w = R7f.x + 0.0;
// 3
R4f.x = R4f.z + PV0fz;
R4f.y = R4f.w + PV0fw;
R4f.z = R5f.x + PV0fz;
R4f.w = R5f.y + PV0fw;
R122f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].w),PV0fx) + -(intBitsToFloat(uf_remappedPS[1].y));
// 4
R5f.x = dot(vec4(R6f.x,R6f.y,R6f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[2].x),intBitsToFloat(uf_remappedPS[2].y),intBitsToFloat(uf_remappedPS[2].z),0.0));
PV0fy = R5f.x;
PV0fz = R5f.x;
PV0fw = R5f.x;
R127f.z = 1.0 / R122f.x;
// 5
tempf.x = dot(vec4(R6f.x,R6f.y,R6f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(uf_remappedPS[3].y),intBitsToFloat(uf_remappedPS[3].z),0.0));
PV1fx = tempf.x;
R127f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R5f.y = R0f.z + -(R1f.z);
// 6
tempf.x = dot(vec4(R6f.x,R6f.y,R6f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[4].x),intBitsToFloat(uf_remappedPS[4].y),intBitsToFloat(uf_remappedPS[4].z),0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
R2f.z = tempf.x;
PV0fw = tempf.x;
R3f.z = R7f.y + 0.0;
// 7
tempf.x = dot(vec4(R6f.x,R6f.y,R6f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[5].x),intBitsToFloat(uf_remappedPS[5].y),intBitsToFloat(uf_remappedPS[5].z),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
R127f.w = tempf.x;
R6f.z = -(R6f.z);
// 8
redcCUBE(vec4(R6f.z,R6f.z,R6f.x,R6f.y),vec4(R6f.y,R6f.x,R6f.z,R6f.z),cubeMapSTM,cubeMapFaceId);
R126f.x = cubeMapSTM.x;
R126f.y = cubeMapSTM.y;
R126f.z = cubeMapSTM.z;
R126f.w = intBitsToFloat(cubeMapFaceId);
R6f.y = -(intBitsToFloat(uf_remappedPS[1].z)) * R127f.z;
// 9
PV1fx = R127f.w * R127f.w;
R0f.y = R7f.z + 0.0;
R10f.z = R126f.w;
R0f.w = R0f.w * 2.0 + -(1.0);
PS1f = 1.0 / abs(R126f.z);
// 10
R123f.x = (R2f.z * R2f.z + PV1fx);
R123f.z = mul_nonIEEE(R126f.y,PS1f) + 1.5;
R123f.w = mul_nonIEEE(R126f.x,PS1f) + 1.5;
// 11
R10f.x = R123f.z;
R10f.y = R123f.w;
R0f.x = (R127f.y * R127f.y + R123f.x);
R10f.xyz = (zmCube(textureUnitPS10, R10f.xy, floatBitsToInt(R10f.z), cubeMapArrayIndex10, R10f.w).xyz);
R7f.xyzw = (texture(textureUnitPS1, vec2(R4f.x,R4f.y)).xyzw);
R11f.y = (texture(textureUnitPS4, vec2(R11f.z,R11f.y)).x);
R4f.y = (texture(textureUnitPS0, vec2(R4f.z,R4f.w)).w);
// 0
R123f.x = (R5f.x * R5f.x + R0f.x);
PV0fy = R10f.x * 1.0;
PV0fz = R10f.y * 1.0;
PV0fw = R10f.z * 1.0;
R127f.y = mul_nonIEEE(R7f.y, R7f.y);
// 1
R0f.x = mul_nonIEEE(PV0fw,intBitsToFloat(uf_remappedPS[6].y)) + 0.0;
R10f.y = mul_nonIEEE(PV0fz,intBitsToFloat(uf_remappedPS[6].y)) + 0.0;
R10f.z = mul_nonIEEE(PV0fy,intBitsToFloat(uf_remappedPS[6].y)) + 0.0;
PV1fw = mul_nonIEEE(R7f.x, R7f.x);
tempResultf = 1.0 / sqrt(R123f.x);
PS1f = tempResultf;
// 2
backupReg0f = R0f.w;
R126f.x = mul_nonIEEE(R7f.z, R7f.z);
R126f.y = mul_nonIEEE(R11f.y,intBitsToFloat(uf_remappedPS[1].w)) + intBitsToFloat(uf_remappedPS[1].x);
PV0fz = mul_nonIEEE(R2f.z, PS1f);
R0f.w = mul_nonIEEE(R11f.x,PV1fw) + R1f.x;
PS0f = R4f.y + backupReg0f;
PS0f = clamp(PS0f, 0.0, 1.0);
// 3
PV1fx = mul_nonIEEE(R7f.w, PS0f);
PV1fy = max(PV0fz, -(PV0fz));
R7f.w = mul_nonIEEE(R2f.y,R127f.y) + R1f.y;
// 4
PV0fx = max(PV1fy, intBitsToFloat(0x3e99999a));
R127f.y = mul_nonIEEE(R1f.w, PV1fx);
R1f.z = mul_nonIEEE(R5f.y,R126f.x) + R1f.z;
R1f.w = R126f.y + -(R6f.y);
// 5
PV1fw = min(PV0fx, 1.0);
// 6
PV0fz = PV1fw + intBitsToFloat(0xbe99999a);
// 7
PV1fy = PV0fz * intBitsToFloat(0x3fb6db6e);
// 8
PV0fx = -(PV1fy) + 1.0;
// 9
PV1fw = mul_nonIEEE(PV0fx, PV0fx);
// 10
R123f.z = PV1fw * 100.0 + R6f.y;
// 11
PV1fy = R126f.y + -(R123f.z);
// 12
PV0fx = max(PV1fy, 0.0);
// 13
PV1fw = min(PV0fx, 100.0);
// 14
PV0fz = PV1fw + intBitsToFloat(0x80000000);
// 15
PV1fy = PV0fz * intBitsToFloat(0x3c23d70a);
PV1fy = clamp(PV1fy, 0.0, 1.0);
// 16
R1f.x = mul_nonIEEE(R127f.y, PV1fy);
R1f.x = clamp(R1f.x, 0.0, 1.0);
// 0
R123f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w),R0f.x) + R0f.y;
R123f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w),R10f.y) + R3f.z;
R123f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w),R10f.z) + R2f.w;
PS0f = 1.0 / intBitsToFloat(uf_remappedPS[7].y);
// 1
R126f.x = mul_nonIEEE(R0f.w, R123f.w);
PV1fy = R1f.w * PS0f;
PV1fy = clamp(PV1fy, 0.0, 1.0);
R126f.z = mul_nonIEEE(R1f.z, R123f.y);
R126f.w = mul_nonIEEE(R7f.w, R123f.z);
// 2
PV0fx = -(R126f.w) + intBitsToFloat(uf_remappedPS[8].y);
PV0fy = -(R126f.x) + intBitsToFloat(uf_remappedPS[8].x);
PV0fz = mul_nonIEEE(R1f.x, PV1fy);
PV0fw = -(R126f.z) + intBitsToFloat(uf_remappedPS[8].z);
// 3
backupReg0f = R126f.x;
R126f.x = mul_nonIEEE(PV0fw,R9f.y) + R126f.z;
R127f.y = mul_nonIEEE(PV0fx,R9f.y) + R126f.w;
R126f.z = mul_nonIEEE(PV0fy,R9f.y) + backupReg0f;
R3f.w = mul_nonIEEE(R3f.x, PV0fz);
// 4
PV0fy = R8f.z + -(R126f.x);
PV0fz = R8f.y + -(R127f.y);
PV0fw = R8f.x + -(R126f.z);
// 5
backupReg0f = R126f.x;
R126f.x = mul_nonIEEE(PV0fw,R8f.w) + R126f.z;
R126f.z = mul_nonIEEE(PV0fy,R8f.w) + backupReg0f;
R126f.w = mul_nonIEEE(PV0fz,R8f.w) + R127f.y;
// 6
PV0fx = -(R126f.w) + intBitsToFloat(uf_remappedPS[9].y);
PV0fy = -(R126f.x) + intBitsToFloat(uf_remappedPS[9].x);
PV0fw = -(R126f.z) + intBitsToFloat(uf_remappedPS[9].z);
// 7
R3f.x = mul_nonIEEE(PV0fy,R9f.x) + R126f.x;
R3f.y = mul_nonIEEE(PV0fx,R9f.x) + R126f.w;
R3f.z = mul_nonIEEE(PV0fw,R9f.x) + R126f.z;
// export
if( ((vec4(R3f.x, R3f.y, R3f.z, R3f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R3f.x, R3f.y, R3f.z, R3f.w);
}
