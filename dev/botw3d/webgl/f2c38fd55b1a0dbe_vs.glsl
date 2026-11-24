#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader f2c38fd55b1a0dbe
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[17];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
TEXTURE_LAYOUT(33, 0, 1) uniform sampler2D textureUnitVS1;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem2;

out vec4 passParameterSem1;
out vec4 passParameterSem3;
out vec4 passParameterSem0;
out vec4 passParameterSem2;
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
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem0.xyzw)/255.0));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyzw = attrDataSem1.xyzw;
if( (attrDecoder.x&0x80u) != 0u ) attrDecoder.x |= 0xFFFFFF00u;
if( (attrDecoder.y&0x80u) != 0u ) attrDecoder.y |= 0xFFFFFF00u;
if( (attrDecoder.z&0x80u) != 0u ) attrDecoder.z |= 0xFFFFFF00u;
if( (attrDecoder.w&0x80u) != 0u ) attrDecoder.w |= 0xFFFFFF00u;
attrDecoder.x = uint(floatBitsToUint(max(float(int(attrDecoder.x))/127.0,-1.0)));
attrDecoder.y = uint(floatBitsToUint(max(float(int(attrDecoder.y))/127.0,-1.0)));
attrDecoder.z = uint(floatBitsToUint(max(float(int(attrDecoder.z))/127.0,-1.0)));
attrDecoder.w = uint(floatBitsToUint(max(float(int(attrDecoder.w))/127.0,-1.0)));
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem2.xyzw)/255.0));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R1i.z)) + 1.0);
PV0iy = R2i.y;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
PV0iz = R2i.x;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
PV0iw = floatBitsToInt(max(intBitsToFloat(R1i.w), -(intBitsToFloat(R1i.w))));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].y), intBitsToFloat(uf_remappedVS[1].z)));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + -(0.5));
R5i.y = floatBitsToInt(intBitsToFloat(PV0ix) * 100.0);
R5i.y = clampFI32(R5i.y);
R4i.z = floatBitsToInt(intBitsToFloat(PV0iw) + -(0.5));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + -(0.5));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].y), intBitsToFloat(uf_remappedVS[1].x)));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(uf_remappedVS[3].x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(uf_remappedVS[3].y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(uf_remappedVS[4].x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(uf_remappedVS[4].y)));
R8i.w = R2i.w;
R8i.w = floatBitsToInt(intBitsToFloat(R8i.w) * 2.0);
// 3
R0i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].z) + intBitsToFloat(PV0iz));
R0i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].w) + intBitsToFloat(PV0iw));
R6i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[3].z) + intBitsToFloat(PV0ix));
R7i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[3].w) + intBitsToFloat(PV0iy));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(R127i.y));
// 4
R3i.x = floatBitsToInt(intBitsToFloat(R8i.w) + -(1.0));
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].z) + intBitsToFloat(0xbe19999a));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(uf_remappedVS[6].y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(uf_remappedVS[6].x)));
PS0i = R3i.z;
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 5
R4i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].z) + intBitsToFloat(PV0iw));
R4i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].w) + intBitsToFloat(PV0iz));
R7i.z = floatBitsToInt(intBitsToFloat(PV0iy) * 100.0);
R7i.z = clampFI32(R7i.z);
R4i.w = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0x3e4ccccd));
R6i.y = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(0x3f333333));
R0i.xyz = floatBitsToInt(texture(textureUnitVS1, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
R4i.xy = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y))).xy);
// 0
PV0ix = R0i.y;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
PV0iy = R0i.x;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
R5i.z = floatBitsToInt(intBitsToFloat(R0i.z) * 800.0);
PV0iw = R4i.y;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
R127i.w = R4i.x;
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
// 1
R126i.x = ((intBitsToFloat(uf_remappedVS[7].z) > intBitsToFloat(R5i.z))?-1:0);
R127i.y = floatBitsToInt(intBitsToFloat(PV0iw) + -(1.0));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(1.0));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + -(1.0));
R6i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].z) + intBitsToFloat(uf_remappedVS[8].x));
// 2
PV0ix = PV1iz;
PV0iy = PV1iw;
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(PV1iz)));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].z), intBitsToFloat(uf_remappedVS[1].w)));
// 3
R4i.x = ((R126i.x == 0)?(PV0iy):(0));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0iz));
PV1iy = clampFI32(PV1iy);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].z), intBitsToFloat(uf_remappedVS[1].y)));
R10i.w = ((R126i.x == 0)?(PV0ix):(0));
R125i.y = floatBitsToInt(intBitsToFloat(R127i.w) + -(1.0));
// 4
PV0ix = floatBitsToInt(-(intBitsToFloat(PV1iy)) + 1.0);
R126i.y = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R4i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R10i.w)));
R127i.w = floatBitsToInt(-(intBitsToFloat(R127i.y)));
// 5
R7i.x = floatBitsToInt(-(intBitsToFloat(PV0iw)) + intBitsToFloat(PV0iz));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(R5i.y)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R5i.y)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R4i.z)));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 6
R5i.x = ((R126i.x == 0)?(PS1i):(0x3f800000));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R7i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(R7i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R7i.x)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(R4i.z)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y)));
R0i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.y)), intBitsToFloat(R5i.x)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R4i.z)));
R11i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R5i.x)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].x), intBitsToFloat(PV0iw)));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R11i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R11i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R0i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(R0i.y)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].z), intBitsToFloat(PV1ix)));
// 9
backupReg0i = R127i.y;
R0i.x = floatBitsToInt(-(intBitsToFloat(R127i.z)) + intBitsToFloat(PV0iy));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].z), intBitsToFloat(R126i.z)));
R4i.z = floatBitsToInt(-(intBitsToFloat(PV0iz)) + intBitsToFloat(backupReg0i));
R9i.w = floatBitsToInt(-(intBitsToFloat(PV0ix)) + intBitsToFloat(PV0iw));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R0i.y)));
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(R9i.w)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R11i.w)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(R0i.x)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(R4i.z)));
R126i.z = floatBitsToInt(-(intBitsToFloat(R5i.z)) + intBitsToFloat(R6i.w));
// 11
backupReg0i = R125i.z;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].y), intBitsToFloat(R127i.w)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), intBitsToFloat(PV0ix)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].y), intBitsToFloat(R125i.y)));
R127i.w = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(0x3e4ccccd));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(backupReg0i)));
// 12
backupReg0i = R124i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(uf_remappedVS[5].z)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].z), intBitsToFloat(R124i.y)));
R124i.z = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV1iy));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].z), intBitsToFloat(backupReg0i)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].z), intBitsToFloat(R125i.w)));
// 13
backupReg0i = R127i.z;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].x), intBitsToFloat(R124i.w)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].x), intBitsToFloat(R5i.y)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].z), intBitsToFloat(R0i.z)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), intBitsToFloat(backupReg0i)));
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), intBitsToFloat(R0i.w)));
R125i.y = floatBitsToInt(intBitsToFloat(R4i.w) + intBitsToFloat(R125i.z));
R125i.z = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PS1i));
R125i.w = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R126i.x));
R127i.w = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R124i.z));
// 15
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R126i.z) * 10.0);
R127i.x = clampFI32(R127i.x);
R127i.y = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0ix));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(uf_remappedVS[5].z)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(uf_remappedVS[5].z)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(backupReg0i)));
// 16
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R126i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R5i.w)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R124i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R126i.y)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R124i.w)));
// 17
backupReg0i = R127i.y;
R124i.x = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R125i.z));
R127i.y = floatBitsToInt(-(intBitsToFloat(PV0iy)) + intBitsToFloat(R127i.w));
R125i.z = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(backupReg0i));
R127i.w = floatBitsToInt(intBitsToFloat(R6i.y) * intBitsToFloat(0x3d4ccccd));
R125i.x = floatBitsToInt(max(intBitsToFloat(R5i.z), intBitsToFloat(R6i.w)));
// 18
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R127i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R125i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R125i.y)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R0i.w)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R5i.y)));
// 19
backupReg0i = R126i.x;
backupReg1i = R126i.z;
R126i.x = floatBitsToInt(intBitsToFloat(R3i.w) * intBitsToFloat(0x3ca3d70a));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(backupReg0i)));
R126i.z = floatBitsToInt(intBitsToFloat(R6i.z) + intBitsToFloat(PV0iz));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(backupReg1i)));
R126i.w = floatBitsToInt(intBitsToFloat(R7i.w) + intBitsToFloat(PV0iy));
// 20
PV0ix = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R125i.x));
PV0iy = floatBitsToInt(-(intBitsToFloat(PV1iy)) + intBitsToFloat(R124i.x));
PV0iz = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(R127i.y));
R127i.w = floatBitsToInt(-(intBitsToFloat(PV1iw)) + intBitsToFloat(R125i.z));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R127i.x)));
// 21
R3i.x = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R125i.w)));
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].z) + intBitsToFloat(R126i.x));
PS1i = R126i.z;
// 22
R6i.x = floatBitsToInt(intBitsToFloat(PS1i) + intBitsToFloat(PV1iz));
R5i.y = R126i.w;
R7i.z = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(0xbc23d70a));
R7i.w = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R127i.w));
R0i.w = 0x3f800000;
// 0
R126i.x = R1i.z;
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) / 2.0);
R127i.y = floatBitsToInt(max(intBitsToFloat(R3i.x), intBitsToFloat(R7i.z)));
R126i.z = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(R7i.w));
R126i.w = 0x3f800000;
R127i.w = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R1i.w),-(intBitsToFloat(R8i.w))) + intBitsToFloat(R1i.w))/2.0);
// 1
R8i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w))));
PV1iy = R8i.x;
PV1iz = R8i.x;
PV1iw = R8i.x;
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R127i.w)) + intBitsToFloat(R4i.x));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w))));
PV0ix = tempi.x;
R8i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w),intBitsToFloat(R127i.w)) + intBitsToFloat(R5i.x));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R8i.z = tempi.x;
PV1iw = tempi.x;
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R126i.x)) + intBitsToFloat(R127i.z));
// 4
R4i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(PV1ix),intBitsToFloat(R126i.w)),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w))));
PV0iy = R4i.x;
PV0iz = R4i.x;
PV0iw = R4i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R127i.w)) + intBitsToFloat(R10i.w));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R126i.w)),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),intBitsToFloat(uf_remappedVS[13].w))));
PV1ix = tempi.x;
R4i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(R126i.x)) + intBitsToFloat(R125i.y));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R126i.w)),vec4(intBitsToFloat(uf_remappedVS[14].x),intBitsToFloat(uf_remappedVS[14].y),intBitsToFloat(uf_remappedVS[14].z),intBitsToFloat(uf_remappedVS[14].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R4i.z = tempi.x;
PV0iw = tempi.x;
R125i.y = floatBitsToInt(intBitsToFloat(R1i.w) * 0.5 + 0.5);
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R126i.w)),vec4(intBitsToFloat(uf_remappedVS[15].x),intBitsToFloat(uf_remappedVS[15].y),intBitsToFloat(uf_remappedVS[15].z),intBitsToFloat(uf_remappedVS[15].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R4i.w = tempi.x;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.w),intBitsToFloat(R126i.x)) + intBitsToFloat(R127i.x));
// 8
R123i.x = floatBitsToInt(intBitsToFloat(R1i.z) * 0.5 + 0.5);
PV0iy = floatBitsToInt(-(intBitsToFloat(R125i.y)) + 1.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(uf_remappedVS[9].x)));
R1i.w = floatBitsToInt(intBitsToFloat(R1i.w) * 0.5 + 0.5);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[16].w));
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(uf_remappedVS[10].x)));
R11i.y = R123i.x;
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(uf_remappedVS[11].x)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(PS0i)) + -(intBitsToFloat(PS0i)));
R11i.w = PV0iy;
// 10
R7i.x = floatBitsToInt(intBitsToFloat(R123i.w) + 1.0);
R7i.x = clampFI32(R7i.x);
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(uf_remappedVS[9].y)) + intBitsToFloat(R127i.z));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(uf_remappedVS[10].y)) + intBitsToFloat(PV1ix));
// 11
R1i.x = uf_remappedVS[16].x;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(uf_remappedVS[11].y)) + intBitsToFloat(R125i.z));
R1i.y = uf_remappedVS[16].y;
// 12
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(uf_remappedVS[9].z)) + intBitsToFloat(R125i.y));
R1i.z = uf_remappedVS[16].z;
// 13
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(uf_remappedVS[10].z)) + intBitsToFloat(R125i.w));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(uf_remappedVS[11].z)) + intBitsToFloat(R126i.y));
// 14
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(uf_remappedVS[8].w)) + intBitsToFloat(uf_remappedVS[5].w));
// export
SET_POSITION(vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.z), intBitsToFloat(R4i.w)));
// export
passParameterSem1 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
// export
passParameterSem0 = vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.x), intBitsToFloat(R7i.z), intBitsToFloat(R7i.x));
// export
passParameterSem2 = vec4(intBitsToFloat(R11i.x), intBitsToFloat(R11i.x), intBitsToFloat(R11i.y), intBitsToFloat(R11i.w));
// export
// skipped export to semanticId 255
}
