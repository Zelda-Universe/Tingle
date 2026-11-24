#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;

vec4 zmCube(sampler2DArray s, vec2 st, int face, float cubeIndex, float lod) {
	return textureLod(s, vec3(st - 1.0, float(face) + cubeIndex * 6.0), lod);
}
// shader e19c7f1c0d92666c
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
TEXTURE_LAYOUT(4, 1, 2) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(10, 1, 3) uniform sampler2DArray textureUnitPS10;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem2;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem7;
in vec4 passParameterSem8;
in vec4 passParameterSem11;
in vec4 passParameterSem14;
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
float cubeMapArrayIndex10 = 0.0;
R0f = passParameterSem0;
R1f = passParameterSem1;
R2f = passParameterSem2;
R3f = passParameterSem3;
R4f = passParameterSem4;
R5f = passParameterSem7;
R6f = passParameterSem8;
R7f = passParameterSem11;
R8f = passParameterSem14;
R9f.xyzw = (texture(textureUnitPS0, vec2(R6f.x,R6f.y)).xyzw);
R6f.xyzw = (texture(textureUnitPS1, vec2(R6f.z,R6f.w)).xyzw);
// 0
R127f.x = -(intBitsToFloat(uf_remappedPS[0].z)) + intBitsToFloat(uf_remappedPS[0].w);
PV0fy = mul_nonIEEE(R9f.w, R6f.w);
R127f.z = mul_nonIEEE(R9f.x, R9f.x);
R11f.w = intBitsToFloat(uf_remappedPS[1].x);
PS0f = 1.0 / R3f.w;
// 1
R10f.x = mul_nonIEEE(R3f.x, PS0f);
R10f.y = mul_nonIEEE(R3f.y, PS0f);
R126f.z = mul_nonIEEE(R5f.w, PV0fy);
R127f.w = mul_nonIEEE(R9f.y, R9f.y);
PS1f = 1.0 / R3f.w;
// 2
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(R2f.x,R2f.y,R2f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R3f.x = R3f.z * PS1f;
// 3
R126f.x = mul_nonIEEE(R9f.z, R9f.z);
R127f.y = mul_nonIEEE(R6f.y, R6f.y);
PV1fz = mul_nonIEEE(R6f.x, R6f.x);
R126f.w = mul_nonIEEE(R6f.z, R6f.z);
tempResultf = 1.0 / sqrt(PV0fx);
PS1f = tempResultf;
// 4
PV0fx = mul_nonIEEE(R2f.x, PS1f);
PV0fy = mul_nonIEEE(R2f.y, PS1f);
PV0fz = mul_nonIEEE(R2f.z, PS1f);
R6f.w = mul_nonIEEE(R127f.z, PV1fz);
R124f.w = 1.0 / R127f.x;
// 5
tempf.x = dot(vec4(R7f.x,R7f.y,R7f.z,intBitsToFloat(0x80000000)),vec4(PV0fx,PV0fy,PV0fz,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R7f.z = -(R7f.z);
// 6
redcCUBE(vec4(R7f.z,R7f.z,R7f.x,R7f.y),vec4(R7f.y,R7f.x,R7f.z,R7f.z),cubeMapSTM,cubeMapFaceId);
R125f.x = cubeMapSTM.x;
R125f.y = cubeMapSTM.y;
R125f.z = cubeMapSTM.z;
R125f.w = intBitsToFloat(cubeMapFaceId);
PS0f = max(PV1fx, -(PV1fx));
// 7
R7f.x = mul_nonIEEE(R127f.w, R127f.y);
PV1fy = PS0f + -(intBitsToFloat(uf_remappedPS[0].z));
R11f.z = R125f.w;
R9f.w = mul_nonIEEE(R126f.x, R126f.w);
PS1f = 1.0 / abs(R125f.z);
// 8
R123f.x = mul_nonIEEE(R125f.y,PS1f) + 1.5;
R123f.y = mul_nonIEEE(R125f.x,PS1f) + 1.5;
R7f.z = PV1fy * R124f.w;
R7f.z = clamp(R7f.z, 0.0, 1.0);
R3f.w = mul_nonIEEE(R0f.w, R126f.z);
R3f.w = clamp(R3f.w, 0.0, 1.0);
R2f.x = 1.0 / intBitsToFloat(uf_remappedPS[2].y);
// 9
backupReg0f = R0f.z;
R11f.x = R123f.x;
R11f.y = R123f.y;
R0f.z = R0f.x + -(R1f.x);
R0f.w = R0f.y + -(R1f.y);
R0f.y = backupReg0f + -(R1f.z);
R10f.x = (texture(textureUnitPS4, vec2(R10f.x,R10f.y)).x);
R11f.xyz = (zmCube(textureUnitPS10, R11f.xy, floatBitsToInt(R11f.z), cubeMapArrayIndex10, R11f.w).xyz);
// 0
R125f.x = -2.0 * R7f.z + 3.0;
R125f.y = mul_nonIEEE(R7f.z, R7f.z);
R123f.z = mul_nonIEEE(R3f.x,intBitsToFloat(uf_remappedPS[3].w)) + -(intBitsToFloat(uf_remappedPS[3].y));
R125f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].w),R10f.x) + intBitsToFloat(uf_remappedPS[3].x);
R124f.w = R11f.x * 1.0;
// 1
R126f.x = mul_nonIEEE(R0f.w,R7f.x) + R1f.y;
R127f.y = R11f.z * 1.0;
R126f.z = R11f.y * 1.0;
R127f.w = mul_nonIEEE(R0f.z,R6f.w) + R1f.x;
PS1f = 1.0 / R123f.z;
// 2
backupReg0f = R0f.y;
R125f.x = mul_nonIEEE(R125f.y, R125f.x);
R0f.y = R8f.x + 0.0;
R125f.z = mul_nonIEEE(backupReg0f,R9f.w) + R1f.z;
PV0fw = -(intBitsToFloat(uf_remappedPS[3].z)) * PS1f;
R1f.x = R8f.y + 0.0;
// 3
backupReg0f = R8f.z;
R8f.x = mul_nonIEEE(R124f.w,intBitsToFloat(uf_remappedPS[4].y)) + 0.0;
PV1fy = -(PV0fw) + R125f.w;
R8f.z = mul_nonIEEE(R126f.z,intBitsToFloat(uf_remappedPS[4].y)) + 0.0;
R9f.w = backupReg0f + 0.0;
R1f.z = mul_nonIEEE(R127f.y,intBitsToFloat(uf_remappedPS[4].y)) + 0.0;
// 4
backupReg0f = R2f.x;
backupReg1f = R5f.y;
R2f.x = mul_nonIEEE(R5f.z, R125f.z);
R5f.y = mul_nonIEEE(R5f.x, R127f.w);
PV0fz = PV1fy * backupReg0f;
PV0fz = clamp(PV0fz, 0.0, 1.0);
R5f.w = mul_nonIEEE(backupReg1f, R126f.x);
// 5
PV1fw = mul_nonIEEE(R3f.w, PV0fz);
// 6
PV0fz = mul_nonIEEE(PV1fw, R125f.x);
// 7
R4f.w = mul_nonIEEE(R4f.x, PV0fz);
// 0
R123f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].w),R8f.z) + R1f.x;
R123f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].w),R8f.x) + R0f.y;
R123f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].w),R1f.z) + R9f.w;
// 1
R4f.x = mul_nonIEEE(R5f.y, R123f.y);
R4f.y = mul_nonIEEE(R5f.w, R123f.x);
R4f.z = mul_nonIEEE(R2f.x, R123f.w);
// export
if( ((vec4(R4f.x, R4f.y, R4f.z, R4f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R4f.x, R4f.y, R4f.z, R4f.w);
}
