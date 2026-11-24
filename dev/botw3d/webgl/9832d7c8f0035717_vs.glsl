#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 9832d7c8f0035717
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

out vec4 passParameterSem1;
out vec4 passParameterSem0;
out vec4 passParameterSem3;
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
PV0ix = floatBitsToInt(intBitsToFloat(R1i.x) * 1000.0);
R127i.y = floatBitsToInt(intBitsToFloat(R1i.w) * intBitsToFloat(0x477fff00));
PV0iz = floatBitsToInt(intBitsToFloat(R1i.z) * 1000.0);
R0i.w = floatBitsToInt(intBitsToFloat(R4i.z) * 128.0);
R127i.x = R4i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 4.0);
// 1
R125i.x = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(0x49742400));
R0i.y = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(uf_remappedVS[0].x));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R0i.w)));
R8i.w = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(uf_remappedVS[0].z));
PS1i = floatBitsToInt(intBitsToFloat(R3i.x) * 3.0);
// 2
R126i.x = floatBitsToInt(intBitsToFloat(R0i.y) + -(intBitsToFloat(uf_remappedVS[1].x)));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.x) + -(1.0));
R127i.z = floatBitsToInt(intBitsToFloat(R8i.w) + -(intBitsToFloat(uf_remappedVS[1].z)));
R127i.w = R4i.y;
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 4.0);
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(R0i.y) + -(intBitsToFloat(uf_remappedVS[2].x)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.z)));
PV1iz = floatBitsToInt(intBitsToFloat(R8i.w) + -(intBitsToFloat(uf_remappedVS[2].z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R126i.x)));
R0i.x = floatBitsToInt(intBitsToFloat(PV0iy) + -(0.5));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(PV1iw));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(PV1iz)));
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R127i.x)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(uf_remappedVS[3].y)));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R6i.w)));
R126i.z = floatBitsToInt(intBitsToFloat(R2i.x) + -(0.5));
R12i.w = floatBitsToInt(intBitsToFloat(R127i.w) + -(1.0));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 6
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(R2i.y) + -(0.5));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R12i.w)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS1i)));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R125i.x)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(uf_remappedVS[4].y)));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), intBitsToFloat(PV0iz)));
R127i.w = floatBitsToInt(intBitsToFloat(R1i.y) * 1000.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 8
R125i.x = ((1.0 > intBitsToFloat(PV1iy))?-1:0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(uf_remappedVS[3].y)));
PV0iw = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(0x49742400));
PV0iw = clampFI32(PV0iw);
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R126i.z)));
// 9
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].w)) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R126i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PV0iw)));
R126i.w = floatBitsToInt(-(intBitsToFloat(R124i.z)) + intBitsToFloat(PV0iz));
R126i.w = clampFI32(R126i.w);
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(PS0i)));
// 10
PV0ix = floatBitsToInt(max(intBitsToFloat(PV1ix), 0.0));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(PV1iy)));
R6i.z = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(uf_remappedVS[0].y));
R123i.w = ((R125i.x == 0)?(PV1iz):(0));
R9i.w = 0x3f800000;
// 11
R13i.x = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R126i.w));
R13i.x = clampFI32(R13i.x);
PV1iy = floatBitsToInt(intBitsToFloat(R6i.z) + intBitsToFloat(R5i.z));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R0i.x)));
R11i.w = 0x3f800000;
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R124i.w));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV1iz)));
PV0iy = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.w)), intBitsToFloat(PV1iz)));
R2i.z = floatBitsToInt(-(intBitsToFloat(R13i.x)) + 1.0);
R2i.z = floatBitsToInt(intBitsToFloat(R2i.z) * 2.0);
R2i.z = clampFI32(R2i.z);
R1i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].y)) + intBitsToFloat(PV1iy));
PS0i = R13i.x;
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 13
R5i.x = floatBitsToInt(intBitsToFloat(PS0i) + -(1.0));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R127i.y)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].x), intBitsToFloat(PV0ix)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(uf_remappedVS[5].x)));
R124i.z = floatBitsToInt((intBitsToFloat(R125i.y) > 0.0)?1.0:0.0);
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].w), intBitsToFloat(R125i.z)));
R127i.y = floatBitsToInt(max(intBitsToFloat(PV1iy), -(intBitsToFloat(PV1iy))));
PV0iz = floatBitsToInt((intBitsToFloat(PV1iy) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].w), intBitsToFloat(R126i.w)));
PS0i = floatBitsToInt((0.0 > intBitsToFloat(PV1iy))?1.0:0.0);
// 15
R125i.x = ((intBitsToFloat(R127i.y) > 1.0)?-1:0);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 16
PV0ix = floatBitsToInt(intBitsToFloat(R125i.z) + -(intBitsToFloat(PV1iy)));
R123i.y = ((R125i.x == 0)?(R127i.y):(PS1i));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3fc90fdb));
PV0iw = floatBitsToInt(intBitsToFloat(R126i.w) + -(intBitsToFloat(PV1iz)));
R2i.w = floatBitsToInt(((R125i.x == 0)?(intBitsToFloat(PV1iw)):(-(intBitsToFloat(PV1iw)))));
// 17
PV1ix = floatBitsToInt(min(intBitsToFloat(R123i.y), 1.0));
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R126i.y));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R125i.w));
R5i.w = ((R125i.x == 0)?(0):(PV0iz));
PS1i = floatBitsToInt((0.0 > intBitsToFloat(R125i.y))?1.0:0.0);
// 18
R6i.x = PV1iy;
R2i.y = floatBitsToInt(max(intBitsToFloat(PV1ix), -(1.0)));
R7i.z = floatBitsToInt(intBitsToFloat(R124i.z) + -(intBitsToFloat(PS1i)));
R7i.w = PV1iz;
R125i.x = ((intBitsToFloat(R125i.y) == 0.0)?-1:0);
// 19
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R2i.y)));
PV1iy = ((0.0 > intBitsToFloat(R124i.w))?-1:0);
PV1iz = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(R7i.w));
PV1iw = floatBitsToInt(intBitsToFloat(R8i.w) + intBitsToFloat(R6i.x));
R10i.w = ((intBitsToFloat(R124i.w) == 0.0)?-1:0);
// 20
R1i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].x)) + intBitsToFloat(PV1iz));
R1i.y = floatBitsToInt(intBitsToFloat(0x3edcf805) * intBitsToFloat(R126i.x) + 1.0);
R0i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[1].z)) + intBitsToFloat(PV1iw));
R123i.w = floatBitsToInt(intBitsToFloat(0x3d6ee04d) * intBitsToFloat(R126i.x) + intBitsToFloat(0x3f43b24e));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PV1iy)));
// 21
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.w),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.w),intBitsToFloat(R0i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R1i.z = tempi.x;
PV1iw = tempi.x;
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R123i.w)) + 1.0);
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[5].w)));
R125i.y = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R2i.y)), intBitsToFloat(R1i.y)));
R125i.z = floatBitsToInt(intBitsToFloat(R3i.z) * 255.0);
R124i.w = floatBitsToInt(intBitsToFloat(R7i.z) * intBitsToFloat(0x3fc90fdb));
tempResultf = 1.0 / sqrt(intBitsToFloat(R1i.z));
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PS0i)));
R1i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.z)),intBitsToFloat(PV0ix)) + intBitsToFloat(R0i.x));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R2i.x));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), -(intBitsToFloat(PV1iw))));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), -(intBitsToFloat(PV1ix))));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), -(intBitsToFloat(PV1iz))));
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(R125i.z));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) / 2.0);
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3f19999a));
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3f19999a));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3f19999a));
R123i.w = ((intBitsToFloat(R2i.y) > 0.0)?(PV0iz):(floatBitsToInt(-(intBitsToFloat(PV0iz)))));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(uf_remappedVS[5].x)));
// 4
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R123i.w)) + intBitsToFloat(R5i.w));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PV1iz)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(uf_remappedVS[5].y)));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R7i.w) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt((intBitsToFloat(R126i.x) > 0.0)?1.0:0.0);
PV1iz = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt((0.0 > intBitsToFloat(R126i.x))?1.0:0.0);
// 6
backupReg0i = R124i.z;
R125i.x = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(PV1ix));
R125i.y = floatBitsToInt(intBitsToFloat(R6i.z) + intBitsToFloat(PV1iw));
R124i.z = floatBitsToInt(intBitsToFloat(R8i.w) + intBitsToFloat(PV1iz));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + -(intBitsToFloat(PS1i)));
R125i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3f19999a));
// 7
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R125i.y),intBitsToFloat(R124i.z),intBitsToFloat(R9i.w)),vec4(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[6].y),intBitsToFloat(uf_remappedVS[6].z),intBitsToFloat(uf_remappedVS[6].w))));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
PS1i = floatBitsToInt(-(intBitsToFloat(R7i.z)) + intBitsToFloat(PV0iw));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R125i.y),intBitsToFloat(R124i.z),intBitsToFloat(R9i.w)),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w))));
PV0ix = tempi.x;
R126i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(-(intBitsToFloat(PS1i)) * intBitsToFloat(0x3fc90fdb) + intBitsToFloat(R126i.x));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R125i.y),intBitsToFloat(R124i.z),intBitsToFloat(R9i.w)),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R124i.z = tempi.x;
PV1iw = tempi.x;
R122i.x = ((R5i.y == 0)?(R122i.x):(0x40490fdb));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(PV1ix),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w))));
PV0ix = tempi.x;
R10i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = ((R10i.w == 0)?(R122i.x):(R124i.w));
// 11
R10i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R124i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w))));
PV1iy = R10i.x;
PV1iz = R10i.x;
PV1iw = R10i.x;
R122i.x = floatBitsToInt(intBitsToFloat(R122i.x) * intBitsToFloat(0x3e22f983) + 0.5);
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R124i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R10i.z = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(intBitsToFloat(R3i.y) + -(intBitsToFloat(R122i.x)));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R124i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R10i.w = tempi.x;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PS0i));
// 14
PV0ix = floatBitsToInt(intBitsToFloat(R124i.y) * intBitsToFloat(0x3f19999a));
R12i.y = floatBitsToInt(-(intBitsToFloat(R12i.w)) + 1.0);
PV0iz = floatBitsToInt(floor(intBitsToFloat(R127i.x)));
PV0iw = floatBitsToInt(-(intBitsToFloat(R10i.y)));
R12i.x = floatBitsToInt(intBitsToFloat(R1i.y) + 0.5);
// 15
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R12i.y)));
PV1iy = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(PV0iz)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R12i.x)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].z),-(intBitsToFloat(R13i.x))) + intBitsToFloat(uf_remappedVS[5].z));
R1i.y = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R10i.w));
R1i.y = floatBitsToInt(intBitsToFloat(R1i.y) / 2.0);
// 16
R1i.x = floatBitsToInt(intBitsToFloat(R10i.x) + intBitsToFloat(R10i.w));
R1i.x = floatBitsToInt(intBitsToFloat(R1i.x) / 2.0);
R3i.y = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3dcccccd) + intBitsToFloat(0x3dcccccd));
R1i.z = R10i.z;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(PV1iy)) + -(0.5));
R1i.w = R10i.w;
// 17
PV1ix = floatBitsToInt(intBitsToFloat(R123i.w) + 1.0);
R13i.y = floatBitsToInt(intBitsToFloat(R4i.w) * 255.0 + -(0.5));
R13i.z = R125i.z;
R12i.w = R127i.x;
R12i.z = R124i.z;
// 18
R13i.w = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(R12i.x)));
// export
SET_POSITION(vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w)));
// export
passParameterSem1 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
// export
// skipped export to semanticId 255
// export
passParameterSem0 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R3i.y), intBitsToFloat(R3i.y), intBitsToFloat(R3i.y), intBitsToFloat(R3i.y));
}
