#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;

vec4 zmCube(sampler2DArray s, vec2 st, int face, float cubeIndex, float lod) {
	return textureLod(s, vec3(st - 1.0, float(face) + cubeIndex * 6.0), lod);
}
// shader ab0a485b9ae1bb1e
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[13];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 2) uniform sampler2DArray textureUnitPS2;
TEXTURE_LAYOUT(3, 1, 3) uniform sampler2D textureUnitPS3;
in vec4 passParameterSem0;
layout(location = 0) out vec4 passPixelColor0;
layout(location = 1) out vec4 passPixelColor1;
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
ivec4 R0i = ivec4(0);
ivec4 R1i = ivec4(0);
ivec4 R2i = ivec4(0);
ivec4 R3i = ivec4(0);
ivec4 R4i = ivec4(0);
ivec4 R5i = ivec4(0);
ivec4 R6i = ivec4(0);
ivec4 R7i = ivec4(0);
ivec4 R8i = ivec4(0);
ivec4 R9i = ivec4(0);
ivec4 R10i = ivec4(0);
ivec4 R123i = ivec4(0);
ivec4 R124i = ivec4(0);
ivec4 R125i = ivec4(0);
ivec4 R126i = ivec4(0);
ivec4 R127i = ivec4(0);
int backupReg0i, backupReg1i, backupReg2i, backupReg3i, backupReg4i;
int PV0ix = 0, PV0iy = 0, PV0iz = 0, PV0iw = 0, PV1ix = 0, PV1iy = 0, PV1iz = 0, PV1iw = 0;
int PS0i = 0, PS1i = 0;
ivec4 tempi = ivec4(0);
float tempResultf;
int tempResulti;
ivec4 ARi = ivec4(0);
bool predResult = true;
vec3 cubeMapSTM;
int cubeMapFaceId;
float cubeMapArrayIndex2 = 0.0;
R0i = floatBitsToInt(GET_FRAGCOORD());
R1i = floatBitsToInt(passParameterSem0);
// 0
R6i.x = 0x3f800000;
PV0iy = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(0xbc23d70a));
PV0iz = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(0xbc23d70a));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R1i.x)) + 1.0);
PS0i = floatBitsToInt(intBitsToFloat(R1i.x) + -(intBitsToFloat(uf_remappedPS[0].x)));
// 1
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(uf_remappedPS[1].z)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(uf_remappedPS[1].w)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R1i.y)) + intBitsToFloat(R123i.w));
R1i.w = floatBitsToInt(intBitsToFloat(R1i.y) + -(intBitsToFloat(uf_remappedPS[0].y)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(PS0i)));
R2i.xyzw = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyzw);
R0i.x = floatBitsToInt(texture(textureUnitPS0, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R2i.x) * 2.0 + -(1.0));
R127i.y = floatBitsToInt(intBitsToFloat(R2i.y) * 2.0 + -(1.0));
R127i.z = floatBitsToInt(intBitsToFloat(R2i.z) * 2.0 + -(1.0));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].y),intBitsToFloat(R0i.x)) + intBitsToFloat(uf_remappedPS[2].x));
R127i.w = floatBitsToInt(intBitsToFloat(R2i.w) * 255.0);
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),-(intBitsToFloat(R126i.w))) + -(intBitsToFloat(uf_remappedPS[3].x)));
// 2
R3i.x = floatBitsToInt(-(intBitsToFloat(R2i.w)) + 1.0);
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),-(intBitsToFloat(R126i.w))) + -(intBitsToFloat(uf_remappedPS[3].y)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),-(intBitsToFloat(R126i.w))) + -(intBitsToFloat(uf_remappedPS[3].z)));
R4i.w = floatBitsToInt(-(intBitsToFloat(R126i.w)));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 3
backupReg0i = R127i.w;
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R3i.x)) + intBitsToFloat(0x3d4ccccd));
R127i.w = clampFI32(R127i.w);
PS1i = int(intBitsToFloat(backupReg0i));
// 4
tempi.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R5i.x)),-(intBitsToFloat(R3i.y)),-(intBitsToFloat(R2i.z)),intBitsToFloat(0x80000000)),vec4(-(intBitsToFloat(R5i.x)),-(intBitsToFloat(R3i.y)),-(intBitsToFloat(R2i.z)),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.x = PS1i & 0x2;
// 5
R126i.x = floatBitsToInt(max(intBitsToFloat(PV0ix), intBitsToFloat(0x3a83126f)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R127i.w)));
R126i.z = floatBitsToInt(intBitsToFloat(R3i.x) * 0.5 + 0.5);
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), -(intBitsToFloat(R126i.w))));
tempResultf = 1.0 / sqrt(intBitsToFloat(R0i.z));
R126i.y = floatBitsToInt(tempResultf);
// 6
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R3i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[4].x),intBitsToFloat(uf_remappedPS[4].y),intBitsToFloat(uf_remappedPS[4].z),0.0)));
PV0iy = R127i.x;
PV0iz = R127i.x;
PV0iw = R127i.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(R126i.x));
R125i.w = floatBitsToInt(tempResultf);
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.x)), intBitsToFloat(R125i.w)));
PV1iy = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.y)), intBitsToFloat(R125i.w)));
R5i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.z)), intBitsToFloat(R125i.w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].w), intBitsToFloat(R125i.w)));
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R126i.y)));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R5i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(PV1ix),intBitsToFloat(PV1iy),intBitsToFloat(R5i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.z = floatBitsToInt(min(intBitsToFloat(PV1iw), 1.0));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R3i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[6].x),intBitsToFloat(uf_remappedPS[6].y),intBitsToFloat(uf_remappedPS[6].z),0.0)));
PV1ix = tempi.x;
R127i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(max(intBitsToFloat(PV0ix), -(1.0)));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R3i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[7].x),intBitsToFloat(uf_remappedPS[7].y),intBitsToFloat(uf_remappedPS[7].z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R127i.z = tempi.x;
PV0iw = tempi.x;
R127i.w = floatBitsToInt(min(intBitsToFloat(PS1i), 1.0));
// 11
redcCUBE(vec4(intBitsToFloat(PV0ix),intBitsToFloat(PV0ix),intBitsToFloat(R127i.x),intBitsToFloat(R127i.y)),vec4(intBitsToFloat(R127i.y),intBitsToFloat(R127i.x),intBitsToFloat(PV0ix),intBitsToFloat(PV0ix)),cubeMapSTM,cubeMapFaceId);
R0i.x = floatBitsToInt(cubeMapSTM.x);
R0i.y = floatBitsToInt(cubeMapSTM.y);
R0i.z = floatBitsToInt(cubeMapSTM.z);
R0i.w = cubeMapFaceId;
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R125i.z));
// 12
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(uf_remappedPS[8].x)) + intBitsToFloat(uf_remappedPS[8].y));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R126i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(uf_remappedPS[8].z)) + intBitsToFloat(uf_remappedPS[8].w));
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R126i.y)));
PS0i = floatBitsToInt(1.0 / abs(intBitsToFloat(R0i.z)));
// 13
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(PS0i)) + 1.5);
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(PS0i)) + 1.5);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.z)));
R127i.w = ((intBitsToFloat(R127i.z) > 0.0)?-1:0);
R9i.x = floatBitsToInt(intBitsToFloat(R125i.y) + -(1.0));
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV1iz)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R126i.z)));
R4i.y = floatBitsToInt(intBitsToFloat(R4i.y) / 2.0);
R6i.z = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(0x3ea2f983));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.x) * 3.0);
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), -(intBitsToFloat(R126i.w))));
// 15
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R125i.z)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(uf_remappedPS[9].y)));
PV1iy = clampFI32(PV1iy);
R123i.z = ((R127i.w == 0)?(0):(PV0ix));
R5i.w = floatBitsToInt(-(intBitsToFloat(R4i.y)) + 1.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 16
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(uf_remappedPS[10].y)));
R2i.y = ((R125i.x == 0)?(R127i.z):(R123i.z));
R1i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iy)),intBitsToFloat(PV1iy)) + 1.0);
R2i.w = floatBitsToInt(intBitsToFloat(R3i.x) + intBitsToFloat(PS1i));
R2i.w = clampFI32(R2i.w);
R1i.x = floatBitsToInt(1.0 / intBitsToFloat(R125i.w));
R1i.x = floatBitsToInt(intBitsToFloat(R1i.x) / 2.0);
R0i.w = floatBitsToInt(zmCube(textureUnitPS2, intBitsToFloat(R0i.yx), R0i.w, cubeMapArrayIndex2, 0.0).x);
R0i.y = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y))).x);
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R5i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.w),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = ((intBitsToFloat(R0i.w) > intBitsToFloat(0x3f7ae148))?-1:0);
// 1
R126i.x = ((PS0i == 0)?(R0i.w):(0x42c80000));
PV1iy = PV0ix;
PV1iy = clampFI32(PV1iy);
R126i.z = ((intBitsToFloat(R2i.x) > intBitsToFloat(uf_remappedPS[10].x))?-1:0);
PV1iw = PV0ix;
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 2.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R2i.w));
// 2
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(PV1iw)) + -(intBitsToFloat(R8i.x)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(PV1iw)) + -(intBitsToFloat(R6i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(PV1iw)) + -(intBitsToFloat(R6i.w)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R5i.w)) + intBitsToFloat(R4i.y));
R126i.y = floatBitsToInt(intBitsToFloat(R3i.x) * intBitsToFloat(PS1i));
// 3
tempi.x = floatBitsToInt(dot(vec4(-(intBitsToFloat(R5i.x)),-(intBitsToFloat(R3i.y)),-(intBitsToFloat(R2i.z)),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R124i.y = floatBitsToInt(1.0 / intBitsToFloat(R123i.w));
// 4
backupReg0i = R126i.x;
backupReg1i = R126i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(PV1ix)) + intBitsToFloat(R5i.x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(PV1ix)) + intBitsToFloat(R3i.y));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV1ix)) + intBitsToFloat(R2i.z));
R123i.w = floatBitsToInt((mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].z),intBitsToFloat(backupReg0i)) + 4.0)/2.0);
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), intBitsToFloat(backupReg1i)));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R124i.z = floatBitsToInt(intBitsToFloat(R123i.w) + -(intBitsToFloat(R1i.x)));
R124i.z = clampFI32(R124i.z);
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.w),intBitsToFloat(R1i.y),intBitsToFloat(R4i.w),intBitsToFloat(R6i.x)),vec4(intBitsToFloat(uf_remappedPS[4].x),intBitsToFloat(uf_remappedPS[4].y),intBitsToFloat(uf_remappedPS[4].z),intBitsToFloat(uf_remappedPS[4].w))));
PV0ix = tempi.x;
R125i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 7
R125i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.w),intBitsToFloat(R1i.y),intBitsToFloat(R4i.w),intBitsToFloat(R6i.x)),vec4(intBitsToFloat(uf_remappedPS[6].x),intBitsToFloat(uf_remappedPS[6].y),intBitsToFloat(uf_remappedPS[6].z),intBitsToFloat(uf_remappedPS[6].w))));
PV1iy = R125i.x;
PV1iz = R125i.x;
PV1iw = R125i.x;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 8
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R4i.x)));
R127i.y = floatBitsToInt(-(intBitsToFloat(R125i.x)) + intBitsToFloat(uf_remappedPS[11].y));
R127i.y = clampFI32(R127i.y);
R125i.z = floatBitsToInt(-(intBitsToFloat(R125i.y)) + intBitsToFloat(uf_remappedPS[11].x));
R125i.z = clampFI32(R125i.z);
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedPS[5].w) * intBitsToFloat(PS1i));
PV0iw = clampFI32(PV0iw);
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(R1i.w)) + intBitsToFloat(R3i.z));
// 9
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(PV0iw)) + -(intBitsToFloat(R5i.x)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(PV0iw)) + -(intBitsToFloat(R3i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV0iw)) + -(intBitsToFloat(R2i.z)));
PV1iw = floatBitsToInt(intBitsToFloat(R125i.y) + -(intBitsToFloat(uf_remappedPS[12].x)));
PV1iw = clampFI32(PV1iw);
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) + -(intBitsToFloat(uf_remappedPS[12].y)));
R125i.x = clampFI32(R125i.x);
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(max(intBitsToFloat(R125i.z), intBitsToFloat(PV1iw)));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.w),intBitsToFloat(R1i.y),intBitsToFloat(R4i.w),intBitsToFloat(R6i.x)),vec4(intBitsToFloat(uf_remappedPS[7].x),intBitsToFloat(uf_remappedPS[7].y),intBitsToFloat(uf_remappedPS[7].z),intBitsToFloat(uf_remappedPS[7].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R125i.w = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 12
backupReg0i = R127i.y;
backupReg1i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS1i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS1i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS1i)));
R124i.w = floatBitsToInt(max(intBitsToFloat(backupReg0i), intBitsToFloat(R125i.x)));
R127i.w = floatBitsToInt(-(intBitsToFloat(backupReg1i)) + 1.0);
// 13
backupReg0i = R125i.w;
R126i.x = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(R127i.x));
R126i.y = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(R127i.y));
R125i.z = floatBitsToInt(intBitsToFloat(R6i.w) + intBitsToFloat(R127i.z));
R125i.w = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + intBitsToFloat(uf_remappedPS[11].z));
R125i.w = clampFI32(R125i.w);
R126i.w = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(uf_remappedPS[12].z)));
R126i.w = clampFI32(R126i.w);
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R2i.z = ((R126i.z == 0)?(R0i.y):(R124i.x));
// 15
R5i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R5i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
R5i.x = clampFI32(R5i.x);
PV1iy = R5i.x;
PV1iz = R5i.x;
PV1iw = R5i.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 16
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS1i)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS1i)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PS1i)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R5i.w)) + intBitsToFloat(R4i.y));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R127i.w)));
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R5i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),0.0)));
tempi.x = clampFI32(tempi.x);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(R123i.w));
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),0.0)));
tempi.x = clampFI32(tempi.x);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(PV1ix)));
// 19
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R127i.w)));
R124i.y = floatBitsToInt(-(intBitsToFloat(PV0ix)) + 1.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),intBitsToFloat(PS0i)) + 1.0);
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R1i.z)));
R127i.w = floatBitsToInt(max(-(intBitsToFloat(R5i.z)), 0.0));
// 20
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R124i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(R123i.z)));
PV0iz = floatBitsToInt(max(intBitsToFloat(R125i.w), intBitsToFloat(R126i.w)));
R126i.w = floatBitsToInt(-(intBitsToFloat(R124i.w)) + 1.0);
R4i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[0].z)),intBitsToFloat(R2i.y)) + 1.0);
R4i.x = clampFI32(R4i.x);
// 21
R9i.x = floatBitsToInt(-(intBitsToFloat(PV0iz)) + 1.0);
R2i.y = floatBitsToInt(-(intBitsToFloat(R5i.w)) + 1.0);
R1i.z = floatBitsToInt(min(intBitsToFloat(R127i.w), 1.0));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(R126i.x)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 22
R8i.x = floatBitsToInt(intBitsToFloat(R6i.z) * intBitsToFloat(PS1i));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R126i.w)));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV1iw)));
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].x), intBitsToFloat(R2i.z)));
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].y), intBitsToFloat(R2i.z)));
// 0
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(R2i.y)) + intBitsToFloat(R5i.w));
R123i.y = floatBitsToInt(intBitsToFloat(R6i.z) * intBitsToFloat(0x3f75c28f) + intBitsToFloat(0x3d23d70a));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R9i.x)) + -(1.0));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].z), intBitsToFloat(R2i.z)));
PS0i = floatBitsToInt(intBitsToFloat(R6i.w) * intBitsToFloat(0x3ea2f983));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(R123i.y)));
PV1iy = floatBitsToInt(intBitsToFloat(R7i.x) * intBitsToFloat(0x3ea2f983));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3ea2f983));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z),intBitsToFloat(uf_remappedPS[9].w)) + 1.0);
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PS0i)));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(PV1ix)));
R6i.w = 0;
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV0iy)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) * 0.25);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV0iz)));
R6i.x = floatBitsToInt(min(intBitsToFloat(PV0ix), 32.0));
// 4
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PV1iz)));
R6i.z = floatBitsToInt(min(intBitsToFloat(PV1ix), 32.0));
R6i.y = floatBitsToInt(min(intBitsToFloat(PV1iw), 32.0));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(PV0iy)));
// 6
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV1ix)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].z), intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].y), intBitsToFloat(PV0iw)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].x), intBitsToFloat(PV0iw)));
// 8
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PV1iz)));
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV0iw)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV0iz)));
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV1iz)));
// 11
R4i.x = floatBitsToInt(min(intBitsToFloat(PV0iy), 32.0));
R4i.y = floatBitsToInt(min(intBitsToFloat(PV0ix), 32.0));
R4i.z = floatBitsToInt(min(intBitsToFloat(PV0iw), 32.0));
// 12
R0i.x = R6i.x;
R0i.y = R6i.y;
R0i.z = R6i.z;
R0i.w = R6i.w;
// 13
R1i.x = R4i.x;
R1i.y = R4i.y;
R1i.z = R4i.z;
R1i.w = R4i.w;
// export
passPixelColor0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
passPixelColor1 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
}
