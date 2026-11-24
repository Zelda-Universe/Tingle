#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 616104995c681afa
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[13];
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem2;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem8;

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem4;
out vec4 passParameterSem3;
out vec4 passParameterSem5;
// end of shader inputs/outputs
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
ivec4 R11i = ivec4(0);
ivec4 R12i = ivec4(0);
ivec4 R13i = ivec4(0);
ivec4 R122i = ivec4(0);
ivec4 R123i = ivec4(0);
ivec4 R124i = ivec4(0);
ivec4 R125i = ivec4(0);
ivec4 R126i = ivec4(0);
ivec4 R127i = ivec4(0);
uvec4 attrDecoder;
int backupReg0i, backupReg1i, backupReg2i, backupReg3i, backupReg4i;
int PV0ix = 0, PV0iy = 0, PV0iz = 0, PV0iw = 0, PV1ix = 0, PV1iy = 0, PV1iz = 0, PV1iw = 0;
int PS0i = 0, PS1i = 0;
ivec4 tempi = ivec4(0);
float tempResultf;
int tempResulti;
ivec4 ARi = ivec4(0);
bool predResult = true;
R0i = ivec4(gl_VertexID, 0, 0, gl_InstanceID);
attrDecoder.xyzw = attrDataSem0.xyzw;
attrDecoder = uvec4(((attrDecoder>>8)&0xFFu)|((attrDecoder<<8)&0xFF00u));
attrDecoder.x = uint(floatBitsToUint(float(int(attrDecoder.x))/65535.0));
attrDecoder.y = uint(floatBitsToUint(float(int(attrDecoder.y))/65535.0));
attrDecoder.z = uint(floatBitsToUint(float(int(attrDecoder.z))/65535.0));
attrDecoder.w = uint(floatBitsToUint(float(int(attrDecoder.w))/65535.0));
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem1.xyzw)/255.0));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem2.xyzw)/255.0));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem8.xyzw)/255.0));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R1i.w) * intBitsToFloat(0x477fff00));
PV0iy = floatBitsToInt(intBitsToFloat(R1i.z) * 1000.0);
R5i.z = floatBitsToInt(intBitsToFloat(R4i.z) * 128.0);
PV0iw = floatBitsToInt(intBitsToFloat(R1i.x) * 1000.0);
R127i.z = R4i.x;
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 4.0);
// 1
R5i.x = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(uf_remappedVS[0].x));
R126i.y = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0x49742400));
R7i.z = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(uf_remappedVS[0].z));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R5i.z)));
PS1i = floatBitsToInt(intBitsToFloat(R3i.x) * 3.0);
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R127i.z) + -(1.0));
R127i.y = floatBitsToInt(intBitsToFloat(R7i.z) + -(intBitsToFloat(uf_remappedVS[1].z)));
R127i.z = floatBitsToInt(intBitsToFloat(R5i.x) + -(intBitsToFloat(uf_remappedVS[1].x)));
R126i.w = R4i.y;
R126i.w = floatBitsToInt(intBitsToFloat(R126i.w) * 4.0);
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R127i.y)));
PV1iy = floatBitsToInt(intBitsToFloat(R5i.x) + -(intBitsToFloat(uf_remappedVS[2].x)));
PV1iz = floatBitsToInt(intBitsToFloat(R7i.z) + -(intBitsToFloat(uf_remappedVS[2].z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.z)));
R2i.z = floatBitsToInt(intBitsToFloat(PV0ix) + -(0.5));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PV1iw));
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R127i.w)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[3].y)));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R6i.w)));
R6i.y = floatBitsToInt(intBitsToFloat(R126i.w) + -(1.0));
R126i.z = floatBitsToInt(intBitsToFloat(R2i.x) + -(0.5));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PV0ix));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(tempResultf);
// 6
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R6i.y)));
R127i.z = floatBitsToInt(intBitsToFloat(R2i.y) + -(0.5));
R12i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS1i)));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1iw));
PS0i = floatBitsToInt(tempResultf);
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(uf_remappedVS[4].y)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), intBitsToFloat(PV0iy)));
R125i.z = floatBitsToInt(intBitsToFloat(R1i.y) * 1000.0);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R126i.y)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(uf_remappedVS[3].y)));
PV0iz = floatBitsToInt(-(intBitsToFloat(PV1iw)) + intBitsToFloat(0x49742400));
PV0iz = clampFI32(PV0iz);
R126i.w = ((1.0 > intBitsToFloat(PV1ix))?-1:0);
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R126i.z)));
// 9
R127i.x = floatBitsToInt(-(intBitsToFloat(R125i.y)) + intBitsToFloat(PV0iy));
R127i.x = clampFI32(R127i.x);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R127i.z)));
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].w)) + intBitsToFloat(PV0ix));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(PS0i)));
// 10
PV0ix = floatBitsToInt(max(intBitsToFloat(PV1iw), 0.0));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(PV1iz)));
R123i.z = ((R126i.w == 0)?(PV1iy):(0));
R8i.w = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(uf_remappedVS[0].y));
R9i.w = 0x3f800000;
// 11
R13i.x = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R127i.x));
R13i.x = clampFI32(R13i.x);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(R2i.z)));
PV1iz = floatBitsToInt(intBitsToFloat(R8i.w) + intBitsToFloat(R0i.y));
R11i.w = 0x3f800000;
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(R12i.w));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.w)), intBitsToFloat(PV1iy)));
R2i.y = floatBitsToInt(-(intBitsToFloat(R13i.x)) + 1.0);
R2i.y = floatBitsToInt(intBitsToFloat(R2i.y) * 2.0);
R2i.y = clampFI32(R2i.y);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(PV1iy)));
R0i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].y)) + intBitsToFloat(PV1iz));
PS0i = R13i.x;
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 13
R0i.x = floatBitsToInt(intBitsToFloat(PS0i) + -(1.0));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].x), intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(R127i.x)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedVS[5].x)));
R127i.y = floatBitsToInt((intBitsToFloat(R7i.x) > 0.0)?1.0:0.0);
// 14
R127i.x = floatBitsToInt(max(intBitsToFloat(PV1iz), -(intBitsToFloat(PV1iz))));
PV0iy = floatBitsToInt((intBitsToFloat(PV1iz) > 0.0)?1.0:0.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].w), intBitsToFloat(R125i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].w), intBitsToFloat(R126i.w)));
PS0i = floatBitsToInt((0.0 > intBitsToFloat(PV1iz))?1.0:0.0);
// 15
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV0iw)));
R125i.z = ((intBitsToFloat(R127i.x) > 1.0)?-1:0);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 16
R123i.x = ((R125i.z == 0)?(R127i.x):(PS1i));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3fc90fdb));
PV0iz = floatBitsToInt(intBitsToFloat(R125i.y) + -(intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(intBitsToFloat(R126i.w) + -(intBitsToFloat(PV1iy)));
R2i.w = floatBitsToInt(((R125i.z == 0)?(intBitsToFloat(PV1iw)):(-(intBitsToFloat(PV1iw)))));
// 17
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(R126i.y));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R125i.w));
PV1iz = floatBitsToInt(min(intBitsToFloat(R123i.x), 1.0));
R5i.w = ((R125i.z == 0)?(0):(PV0iy));
PS1i = floatBitsToInt((0.0 > intBitsToFloat(R7i.x))?1.0:0.0);
// 18
R2i.x = floatBitsToInt(max(intBitsToFloat(PV1iz), -(1.0)));
R5i.y = floatBitsToInt(intBitsToFloat(R127i.y) + -(intBitsToFloat(PS1i)));
R6i.z = PV1ix;
R7i.w = PV1iy;
R125i.z = ((intBitsToFloat(R7i.x) == 0.0)?-1:0);
// 19
PV1ix = ((0.0 > intBitsToFloat(R12i.w))?-1:0);
PV1iy = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(R7i.w));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R2i.x)));
PV1iw = floatBitsToInt(intBitsToFloat(R7i.z) + intBitsToFloat(R6i.z));
R10i.w = ((intBitsToFloat(R12i.w) == 0.0)?-1:0);
// 20
R1i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].x)) + intBitsToFloat(PV1iy));
R1i.y = floatBitsToInt(intBitsToFloat(0x3edcf805) * intBitsToFloat(R127i.z) + 1.0);
R1i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) + intBitsToFloat(PV1iw));
R123i.w = floatBitsToInt(intBitsToFloat(0x3d6ee04d) * intBitsToFloat(R127i.z) + intBitsToFloat(0x3f43b24e));
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PV1ix)));
// 21
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R0i.w),intBitsToFloat(R1i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R0i.w),intBitsToFloat(R1i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R1i.w = tempi.x;
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R123i.w)) + 1.0);
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R2i.x)), intBitsToFloat(R1i.y)));
R126i.y = floatBitsToInt(intBitsToFloat(R3i.z) * 255.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(uf_remappedVS[5].w)));
R125i.w = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(0x3fc90fdb));
tempResultf = 1.0 / sqrt(intBitsToFloat(R1i.w));
PS0i = floatBitsToInt(tempResultf);
// 1
R124i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.y)),intBitsToFloat(PV0iz)) + intBitsToFloat(R2i.z));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R0i.z));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), -(intBitsToFloat(PV1iz))));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), -(intBitsToFloat(PV1iw))));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), -(intBitsToFloat(PV1iy))));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS1i)));
R126i.x = floatBitsToInt(1.0 / intBitsToFloat(R126i.y));
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) / 2.0);
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3f19999a));
R123i.y = ((intBitsToFloat(R2i.x) > 0.0)?(PV0iw):(floatBitsToInt(-(intBitsToFloat(PV0iw)))));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3f19999a));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3f19999a));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(uf_remappedVS[5].x)));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1iz)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1iw)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R123i.y)) + intBitsToFloat(R5i.w));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1ix)));
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(uf_remappedVS[5].y)));
// 5
PV1ix = floatBitsToInt((intBitsToFloat(R127i.z) > 0.0)?1.0:0.0);
PV1iy = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(intBitsToFloat(R7i.w) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(intBitsToFloat(R6i.z) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt((0.0 > intBitsToFloat(R127i.z))?1.0:0.0);
// 6
backupReg0i = R127i.y;
R127i.x = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV1iz));
R127i.y = floatBitsToInt(intBitsToFloat(R8i.w) + intBitsToFloat(PV1iy));
R125i.z = floatBitsToInt(intBitsToFloat(R7i.z) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(PS1i)));
R126i.z = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3f19999a));
// 7
R5i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R125i.z),intBitsToFloat(R9i.w)),vec4(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[6].y),intBitsToFloat(uf_remappedVS[6].z),intBitsToFloat(uf_remappedVS[6].w))));
PV1iy = R5i.x;
PV1iz = R5i.x;
PV1iw = R5i.x;
PS1i = floatBitsToInt(-(intBitsToFloat(R5i.y)) + intBitsToFloat(PV0iw));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R125i.z),intBitsToFloat(R9i.w)),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w))));
PV0ix = tempi.x;
R5i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(-(intBitsToFloat(PS1i)) * intBitsToFloat(0x3fc90fdb) + intBitsToFloat(R127i.z));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R125i.z),intBitsToFloat(R9i.w)),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R5i.z = tempi.x;
PV1iw = tempi.x;
R122i.x = ((R6i.x == 0)?(R122i.x):(0x40490fdb));
// 10
R10i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(PV1ix),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w))));
PV0iy = R10i.x;
PV0iz = R10i.x;
PV0iw = R10i.x;
R122i.x = ((R10i.w == 0)?(R122i.x):(R125i.w));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w))));
PV1ix = tempi.x;
R10i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R122i.x = floatBitsToInt(intBitsToFloat(R122i.x) * intBitsToFloat(0x3e22f983) + 0.5);
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R10i.z = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(intBitsToFloat(R3i.y) + -(intBitsToFloat(R122i.x)));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R10i.w = tempi.x;
R125i.z = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PS0i));
// 14
backupReg0i = R125i.z;
R125i.x = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(0x3f19999a));
PV0iy = floatBitsToInt(floor(intBitsToFloat(backupReg0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.x)), intBitsToFloat(uf_remappedVS[7].x)));
R125i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.x)), intBitsToFloat(uf_remappedVS[6].x)));
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.w)), intBitsToFloat(uf_remappedVS[6].x)));
// 15
PV1ix = floatBitsToInt(intBitsToFloat(R125i.z) + -(intBitsToFloat(PV0iy)));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.w)), intBitsToFloat(uf_remappedVS[7].x)));
R125i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.w)), intBitsToFloat(uf_remappedVS[8].x)));
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.x)), intBitsToFloat(uf_remappedVS[8].x)));
R11i.x = floatBitsToInt(intBitsToFloat(R124i.x) + 0.5);
// 16
R124i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].y) * intBitsToFloat(0xbc23d70a) + intBitsToFloat(R125i.w));
R11i.y = floatBitsToInt(-(intBitsToFloat(R6i.y)) + 1.0);
R127i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].y) * intBitsToFloat(0xbc23d70a) + intBitsToFloat(R127i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(PV1ix)) + -(0.5));
R124i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].y) * intBitsToFloat(0x3c23d70a) + intBitsToFloat(R126i.w));
// 17
backupReg0i = R126i.z;
R126i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].y) * intBitsToFloat(0xbc23d70a) + intBitsToFloat(R127i.w));
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].y) * intBitsToFloat(0x3c23d70a) + intBitsToFloat(R127i.y));
R126i.z = floatBitsToInt(intBitsToFloat(R123i.w) + 1.0);
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].y) * intBitsToFloat(0x3c23d70a) + intBitsToFloat(R125i.z));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R11i.x)));
// 18
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R11i.y)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].z),-(intBitsToFloat(R13i.x))) + intBitsToFloat(uf_remappedVS[5].z));
R13i.z = R126i.y;
R3i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.w)),intBitsToFloat(uf_remappedVS[6].z)) + intBitsToFloat(R124i.x));
R6i.w = 0x3f800000;
// 19
R3i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3dcccccd) + intBitsToFloat(0x3dcccccd));
R3i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.w)),intBitsToFloat(uf_remappedVS[7].z)) + intBitsToFloat(R127i.z));
R3i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R12i.w)),intBitsToFloat(uf_remappedVS[8].z)) + intBitsToFloat(R126i.x));
R13i.w = floatBitsToInt(intBitsToFloat(R126i.z) + -(intBitsToFloat(R11i.x)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(uf_remappedVS[7].z)) + intBitsToFloat(R127i.y));
// 20
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(uf_remappedVS[6].z)) + intBitsToFloat(R124i.z));
R13i.y = floatBitsToInt(intBitsToFloat(R4i.w) * 255.0 + -(0.5));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(uf_remappedVS[8].z)) + intBitsToFloat(R127i.w));
R11i.w = R125i.x;
R11i.z = R125i.z;
// export
SET_POSITION(vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.z), intBitsToFloat(R6i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R3i.w), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
// export
passParameterSem5 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.y), intBitsToFloat(R3i.y));
// export
// skipped export to semanticId 255
}
