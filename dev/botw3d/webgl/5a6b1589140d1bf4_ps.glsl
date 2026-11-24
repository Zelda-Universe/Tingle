#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;

vec4 zmCube(sampler2DArray s, vec2 st, int face, float cubeIndex, float lod) {
	return textureLod(s, vec3(st - 1.0, float(face) + cubeIndex * 6.0), lod);
}
// shader 5a6b1589140d1bf4
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[8];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(4, 1, 1) uniform sampler2D textureUnitPS4;
TEXTURE_LAYOUT(10, 1, 2) uniform sampler2DArray textureUnitPS10;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem2;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem7;
in vec4 passParameterSem8;
in vec4 passParameterSem11;
in vec4 passParameterSem12;
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
R2f = passParameterSem2;
R3f = passParameterSem3;
R4f = passParameterSem4;
R5f = passParameterSem7;
R6f = passParameterSem8;
R7f = passParameterSem11;
R8f = passParameterSem12;
R9f = passParameterSem14;
R10f = passParameterSem15;
R11f = passParameterSem16;
R6f.xyz = (texture(textureUnitPS0, vec2(R6f.x,R6f.y)).xyz);
// 0
R127f.x = mul_nonIEEE(R6f.x, R6f.x);
R127f.y = mul_nonIEEE(R6f.z, R6f.z);
R126f.z = mul_nonIEEE(R6f.y, R6f.y);
R6f.w = intBitsToFloat(uf_remappedPS[0].x);
PS0f = 1.0 / R3f.w;
// 1
R5f.x = mul_nonIEEE(R3f.x, PS0f);
R5f.y = mul_nonIEEE(R3f.y, PS0f);
R127f.z = R0f.x + -(R1f.x);
R127f.w = R0f.y + -(R1f.y);
PS1f = 1.0 / R3f.w;
// 2
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(R2f.x,R2f.y,R2f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = R3f.z * PS1f;
// 3
R3f.x = R9f.y + 0.0;
R126f.y = mul_nonIEEE(PS0f,intBitsToFloat(uf_remappedPS[1].w)) + -(intBitsToFloat(uf_remappedPS[1].y));
R125f.z = R0f.z + -(R1f.z);
R3f.w = R9f.x + 0.0;
tempResultf = 1.0 / sqrt(PV0fx);
PS1f = tempResultf;
// 4
backupReg0f = R127f.z;
backupReg1f = R127f.x;
R127f.x = mul_nonIEEE(R2f.x, PS1f);
R125f.y = mul_nonIEEE(R2f.y, PS1f);
R127f.z = mul_nonIEEE(R2f.z, PS1f);
R2f.w = R9f.z + 0.0;
R2f.y = mul_nonIEEE(backupReg0f,backupReg1f) + R1f.x;
// 5
backupReg0f = R127f.y;
R9f.x = mul_nonIEEE(R127f.w,R126f.z) + R1f.y;
R127f.y = 1.0;
R0f.z = mul_nonIEEE(R0f.w, R5f.w);
R5f.w = mul_nonIEEE(R125f.z,backupReg0f) + R1f.z;
R127f.w = 1.0 / R126f.y;
// 6
tempf.x = dot(vec4(R7f.x,R7f.y,R7f.z,intBitsToFloat(0x80000000)),vec4(R127f.x,R125f.y,R127f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R7f.z = -(R7f.z);
// 7
redcCUBE(vec4(R7f.z,R7f.z,R7f.x,R7f.y),vec4(R7f.y,R7f.x,R7f.z,R7f.z),cubeMapSTM,cubeMapFaceId);
R125f.x = cubeMapSTM.x;
R125f.y = cubeMapSTM.y;
R125f.z = cubeMapSTM.z;
R125f.w = intBitsToFloat(cubeMapFaceId);
R0f.x = max(PV0fx, -(PV0fx));
// 8
R2f.x = -(intBitsToFloat(uf_remappedPS[1].z)) * R127f.w;
PV0fy = mul_nonIEEE(R127f.y, intBitsToFloat(uf_remappedPS[2].w));
R6f.z = R125f.w;
PS0f = 1.0 / abs(R125f.z);
// 9
R123f.x = mul_nonIEEE(R8f.z,intBitsToFloat(uf_remappedPS[2].z)) + PV0fy;
R123f.z = mul_nonIEEE(R125f.y,PS0f) + 1.5;
R123f.w = mul_nonIEEE(R125f.x,PS0f) + 1.5;
// 10
R6f.x = R123f.z;
R6f.y = R123f.w;
R7f.x = mul_nonIEEE(R8f.y,intBitsToFloat(uf_remappedPS[2].y)) + R123f.x;
R6f.xyz = (zmCube(textureUnitPS10, R6f.xy, floatBitsToInt(R6f.z), cubeMapArrayIndex10, R6f.w).xyz);
R6f.w = (texture(textureUnitPS4, vec2(R5f.x,R5f.y)).x);
// 0
backupReg0f = R6f.x;
R6f.x = R6f.y * 1.0;
R6f.y = backupReg0f * 1.0;
PV0fz = -(intBitsToFloat(uf_remappedPS[3].z)) + intBitsToFloat(uf_remappedPS[3].w);
R0f.w = R6f.z * 1.0;
R122f.x = mul_nonIEEE(R8f.x,intBitsToFloat(uf_remappedPS[2].x)) + R7f.x;
// 1
R123f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].w),R6f.w) + intBitsToFloat(uf_remappedPS[1].x);
R123f.y = mul_nonIEEE(-(R1f.w),R122f.x) + R4f.y;
R123f.y = clamp(R123f.y, 0.0, 1.0);
R125f.y = 1.0 / PV0fz;
// 2
R125f.x = mul_nonIEEE(R0f.z, R123f.y);
R125f.x = clamp(R125f.x, 0.0, 1.0);
PV0fz = -(R2f.x) + R123f.x;
PV0fw = R0f.x + -(intBitsToFloat(uf_remappedPS[3].z));
PS0f = 1.0 / intBitsToFloat(uf_remappedPS[4].y);
// 3
PV1fx = PV0fw * R125f.y;
PV1fx = clamp(PV1fx, 0.0, 1.0);
PV1fy = PV0fz * PS0f;
PV1fy = clamp(PV1fy, 0.0, 1.0);
// 4
R125f.x = mul_nonIEEE(R125f.x, PV1fy);
R123f.z = -2.0 * PV1fx + 3.0;
PV0fw = mul_nonIEEE(PV1fx, PV1fx);
// 5
PV1fy = mul_nonIEEE(PV0fw, R123f.z);
// 6
PV0fx = mul_nonIEEE(R125f.x, PV1fy);
// 7
R4f.w = mul_nonIEEE(R4f.x, PV0fx);
// 0
R123f.x = mul_nonIEEE(R0f.w,intBitsToFloat(uf_remappedPS[5].y)) + 0.0;
R123f.y = mul_nonIEEE(R6f.x,intBitsToFloat(uf_remappedPS[5].y)) + 0.0;
R123f.z = mul_nonIEEE(R6f.y,intBitsToFloat(uf_remappedPS[5].y)) + 0.0;
// 1
backupReg0f = R123f.y;
backupReg1f = R123f.z;
R123f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w),R123f.x) + R2f.w;
R123f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w),backupReg0f) + R3f.x;
R123f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w),backupReg1f) + R3f.w;
// 2
R125f.x = mul_nonIEEE(R2f.y, R123f.w);
R125f.z = mul_nonIEEE(R5f.w, R123f.y);
R125f.w = mul_nonIEEE(R9f.x, R123f.z);
// 3
PV1fx = -(R125f.w) + intBitsToFloat(uf_remappedPS[6].y);
PV1fy = -(R125f.x) + intBitsToFloat(uf_remappedPS[6].x);
PV1fw = -(R125f.z) + intBitsToFloat(uf_remappedPS[6].z);
// 4
backupReg0f = R125f.x;
R125f.x = mul_nonIEEE(PV1fw,R11f.y) + R125f.z;
R125f.y = mul_nonIEEE(PV1fx,R11f.y) + R125f.w;
R125f.z = mul_nonIEEE(PV1fy,R11f.y) + backupReg0f;
// 5
PV1fy = R10f.z + -(R125f.x);
PV1fz = R10f.y + -(R125f.y);
PV1fw = R10f.x + -(R125f.z);
// 6
backupReg0f = R125f.x;
R125f.x = mul_nonIEEE(PV1fw,R10f.w) + R125f.z;
R125f.z = mul_nonIEEE(PV1fy,R10f.w) + backupReg0f;
R125f.w = mul_nonIEEE(PV1fz,R10f.w) + R125f.y;
// 7
PV1fx = -(R125f.w) + intBitsToFloat(uf_remappedPS[7].y);
PV1fy = -(R125f.x) + intBitsToFloat(uf_remappedPS[7].x);
PV1fw = -(R125f.z) + intBitsToFloat(uf_remappedPS[7].z);
// 8
R4f.x = mul_nonIEEE(PV1fy,R11f.x) + R125f.x;
R4f.y = mul_nonIEEE(PV1fx,R11f.x) + R125f.w;
R4f.z = mul_nonIEEE(PV1fw,R11f.x) + R125f.z;
// export
if( ((vec4(R4f.x, R4f.y, R4f.z, R4f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R4f.x, R4f.y, R4f.z, R4f.w);
}
