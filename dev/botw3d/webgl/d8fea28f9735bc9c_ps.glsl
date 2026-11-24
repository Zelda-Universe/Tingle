#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;

vec4 zmCube(sampler2DArray s, vec2 st, int face, float cubeIndex, float lod) {
	return textureLod(s, vec3(st - 1.0, float(face) + cubeIndex * 6.0), lod);
}
// shader d8fea28f9735bc9c
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[4];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(10, 1, 2) uniform sampler2DArray textureUnitPS10;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem4;
in vec4 passParameterSem8;
in vec4 passParameterSem10;
in vec4 passParameterSem11;
in vec4 passParameterSem13;
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
R2f = passParameterSem4;
R3f = passParameterSem8;
R4f = passParameterSem10;
R5f = passParameterSem11;
R6f = passParameterSem13;
R7f = passParameterSem14;
R8f = passParameterSem15;
R9f = passParameterSem16;
R1f.xy = (texture(textureUnitPS1, vec2(R3f.z,R3f.w)).xy);
R3f.w = (texture(textureUnitPS0, vec2(R3f.x,R3f.y)).w);
// 0
PV0fx = mul_nonIEEE(R6f.z, R1f.x);
R127f.y = mul_nonIEEE(R6f.x, R1f.x);
PV0fz = 0.0;
R127f.w = mul_nonIEEE(R6f.y, R1f.x);
R6f.w = intBitsToFloat(uf_remappedPS[0].x);
// 1
tempf.x = dot(vec4(R1f.x,R1f.y,PV0fz,intBitsToFloat(0x80000000)),vec4(R1f.x,R1f.y,R1f.y,0.0));
tempf.x = clamp(tempf.x, 0.0, 1.0);
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R126f.w = mul_nonIEEE(R4f.z,R1f.y) + PV0fx;
// 2
PV0fx = -(PV1fx) + 1.0;
R126f.y = mul_nonIEEE(R4f.y,R1f.y) + R127f.w;
R3f.z = -(R9f.w) + 1.0;
R2f.w = R7f.x + 0.0;
R1f.z = R7f.z + 0.0;
// 3
PV1fx = mul_nonIEEE(R0f.w, R3f.w);
R123f.y = mul_nonIEEE(R4f.x,R1f.y) + R127f.y;
R3f.w = R7f.y + 0.0;
PS1f = sqrt(PV0fx);
// 4
R126f.x = mul_nonIEEE(R5f.x,PS1f) + R123f.y;
R123f.y = mul_nonIEEE(R5f.z,PS1f) + R126f.w;
PV0fz = mul_nonIEEE(R1f.w, PV1fx);
PV0fz = clamp(PV0fz, 0.0, 1.0);
R126f.w = mul_nonIEEE(R5f.y,PS1f) + R126f.y;
// 5
R126f.z = -(R123f.y);
R5f.w = mul_nonIEEE(R2f.x, PV0fz);
// 6
backupReg0f = R126f.x;
backupReg1f = R126f.z;
redcCUBE(vec4(backupReg1f,backupReg1f,backupReg0f,R126f.w),vec4(R126f.w,backupReg0f,backupReg1f,backupReg1f),cubeMapSTM,cubeMapFaceId);
R126f.x = cubeMapSTM.x;
R126f.y = cubeMapSTM.y;
R126f.z = cubeMapSTM.z;
R126f.w = intBitsToFloat(cubeMapFaceId);
// 7
R6f.z = R126f.w;
PS1f = 1.0 / abs(R126f.z);
// 8
R123f.x = mul_nonIEEE(R126f.x,PS1f) + 1.5;
R123f.w = mul_nonIEEE(R126f.y,PS1f) + 1.5;
// 9
R6f.x = R123f.w;
R6f.y = R123f.x;
R6f.xyz = (zmCube(textureUnitPS10, R6f.xy, floatBitsToInt(R6f.z), cubeMapArrayIndex10, R6f.w).xyz);
// 0
PV0fx = mul_nonIEEE(R6f.y, R3f.z);
PV0fy = mul_nonIEEE(R6f.x, R3f.z);
PV0fw = mul_nonIEEE(R6f.z, R3f.z);
// 1
R123f.x = mul_nonIEEE(PV0fw,intBitsToFloat(uf_remappedPS[1].y)) + 0.0;
R123f.y = mul_nonIEEE(PV0fx,intBitsToFloat(uf_remappedPS[1].y)) + 0.0;
R123f.z = mul_nonIEEE(PV0fy,intBitsToFloat(uf_remappedPS[1].y)) + 0.0;
// 2
backupReg0f = R123f.y;
backupReg1f = R123f.z;
R123f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w),R123f.x) + R1f.z;
R123f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w),backupReg0f) + R3f.w;
R123f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w),backupReg1f) + R2f.w;
// 3
R126f.x = mul_nonIEEE(R0f.x, R123f.w);
R126f.z = mul_nonIEEE(R0f.z, R123f.y);
R126f.w = mul_nonIEEE(R0f.y, R123f.z);
// 4
PV0fx = -(R126f.w) + intBitsToFloat(uf_remappedPS[2].y);
PV0fy = -(R126f.x) + intBitsToFloat(uf_remappedPS[2].x);
PV0fw = -(R126f.z) + intBitsToFloat(uf_remappedPS[2].z);
// 5
backupReg0f = R126f.x;
R126f.x = mul_nonIEEE(PV0fw,R9f.y) + R126f.z;
R126f.y = mul_nonIEEE(PV0fx,R9f.y) + R126f.w;
R126f.z = mul_nonIEEE(PV0fy,R9f.y) + backupReg0f;
// 6
PV0fy = R8f.z + -(R126f.x);
PV0fz = R8f.y + -(R126f.y);
PV0fw = R8f.x + -(R126f.z);
// 7
backupReg0f = R126f.x;
R126f.x = mul_nonIEEE(PV0fw,R8f.w) + R126f.z;
R126f.z = mul_nonIEEE(PV0fy,R8f.w) + backupReg0f;
R126f.w = mul_nonIEEE(PV0fz,R8f.w) + R126f.y;
// 8
PV0fx = -(R126f.w) + intBitsToFloat(uf_remappedPS[3].y);
PV0fy = -(R126f.x) + intBitsToFloat(uf_remappedPS[3].x);
PV0fw = -(R126f.z) + intBitsToFloat(uf_remappedPS[3].z);
// 9
R5f.x = mul_nonIEEE(PV0fy,R9f.x) + R126f.x;
R5f.y = mul_nonIEEE(PV0fx,R9f.x) + R126f.w;
R5f.z = mul_nonIEEE(PV0fw,R9f.x) + R126f.z;
// export
if( ((vec4(R5f.x, R5f.y, R5f.z, R5f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R5f.x, R5f.y, R5f.z, R5f.w);
}
