#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 34813b8eaf2126c2
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
UNIFORM_BUFFER_LAYOUT(1, 0, 4) uniform uniformBlockVS1
{
vec4 uf_blockVS1[11];
};


UNIFORM_BUFFER_LAYOUT(4, 0, 5) uniform uniformBlockVS4
{
vec4 uf_blockVS4[4];
};


UNIFORM_BUFFER_LAYOUT(5, 0, 6) uniform uniformBlockVS5
{
vec4 uf_blockVS5[4096];
};


UNIFORM_BUFFER_LAYOUT(6, 0, 7) uniform uniformBlockVS6
{
vec4 uf_blockVS6[58];
};


TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
TEXTURE_LAYOUT(33, 0, 1) uniform sampler2D textureUnitVS1;
TEXTURE_LAYOUT(34, 0, 2) uniform sampler2D textureUnitVS2;
TEXTURE_LAYOUT(35, 0, 3) uniform sampler2D textureUnitVS3;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem2;

out vec4 passParameterSem0;
out vec4 passParameterSem3;
out vec4 passParameterSem2;
out vec4 passParameterSem1;
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
PV0ix = R2i.y;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
PV0iy = floatBitsToInt(intBitsToFloat(R2i.z) * intBitsToFloat(0x3e65a5dd));
PV0iz = R2i.x;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
PV0iw = floatBitsToInt(uf_blockVS6[32].w * intBitsToFloat(0x43c9d6c7));
PS0i = floatBitsToInt(intBitsToFloat(R3i.x) * 255.0);
// 1
R127i.x = floatBitsToInt(intBitsToFloat(R2i.z) + uf_blockVS6[32].w);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + -(0.5));
R126i.z = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + -(0.5));
R127i.z = int(intBitsToFloat(PS0i));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), uf_blockVS5[0].y));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), uf_blockVS5[1].y));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), uf_blockVS5[0].x));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), uf_blockVS5[1].x));
R0i.y = R127i.z + 0xf;
// 3
R0i.x = floatBitsToInt(uf_blockVS5[1].z + intBitsToFloat(PV0iw));
R7i.y = floatBitsToInt(uf_blockVS5[0].z + intBitsToFloat(PV0iz));
R0i.z = floatBitsToInt(uf_blockVS5[1].w + intBitsToFloat(PV0iy));
R4i.w = floatBitsToInt(uf_blockVS5[0].w + intBitsToFloat(PV0ix));
R0i.w = R127i.z + 0x1b;
// 4
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), uf_blockVS6[34].x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), uf_blockVS6[34].y));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), uf_blockVS6[35].x));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), uf_blockVS6[35].y));
R126i.y = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x439d1463));
// 5
R3i.x = floatBitsToInt(uf_blockVS6[35].z + intBitsToFloat(PV0iz));
R3i.y = floatBitsToInt(uf_blockVS6[35].w + intBitsToFloat(PV0iw));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), uf_blockVS6[32].y));
R5i.w = floatBitsToInt(uf_blockVS6[32].x);
R5i.y = floatBitsToInt(uf_blockVS6[32].x);
// 6
R4i.x = floatBitsToInt(uf_blockVS6[34].z + intBitsToFloat(R127i.x));
R4i.y = floatBitsToInt(uf_blockVS6[34].w + intBitsToFloat(R127i.y));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), uf_blockVS6[33].y));
R127i.w = floatBitsToInt(-(intBitsToFloat(PV1iz)) + intBitsToFloat(R126i.z));
PS0i = R126i.y;
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 4.0);
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R126i.z) + -(intBitsToFloat(PV0iz)));
R123i.y = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), uf_blockVS6[32].z));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), uf_blockVS6[33].z));
R122i.x = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(0x3e22f983) + 0.5);
// 8
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R122i.x)));
PV0iz = floatBitsToInt(-(intBitsToFloat(PV1iw)) + intBitsToFloat(PV1ix));
PV0iw = floatBitsToInt(-(intBitsToFloat(PV1iz)) + intBitsToFloat(R127i.w));
PS0i = floatBitsToInt(-(uf_blockVS6[32].x) + 1.0);
// 9
R5i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3cb6a401));
R6i.y = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R5i.z = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3cb6a401));
R3i.w = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R3i.z = floatBitsToInt(min(uf_blockVS6[32].x, intBitsToFloat(PS0i)));
R3i.z = floatBitsToInt(intBitsToFloat(R3i.z) * 2.0);
R3i.z = clampFI32(R3i.z);
R3i.xy = floatBitsToInt(texture(textureUnitVS1, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y))).xy);
R8i.xyzw = floatBitsToInt(texture(textureUnitVS2, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.z))).xyzw);
R4i.xy = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y))).xy);
R5i.x = floatBitsToInt(texture(textureUnitVS3, vec2(intBitsToFloat(R5i.x),intBitsToFloat(R5i.w))).x);
R0i.x = floatBitsToInt(texture(textureUnitVS3, vec2(intBitsToFloat(R5i.z),intBitsToFloat(R5i.y))).x);
R10i.xyzw = floatBitsToInt(uf_blockVS5[R0i.y].xyzw);
R9i.xyz = floatBitsToInt(uf_blockVS5[R0i.w].xyz);
// 0
PV0ix = R4i.y;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
R126i.y = floatBitsToInt(max(intBitsToFloat(R8i.w), uf_blockVS5[6].y));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y)));
R127i.w = floatBitsToInt(uf_blockVS6[32].x + intBitsToFloat(0xbe99999a));
R127i.w = clampFI32(R127i.w);
R127i.x = floatBitsToInt(intBitsToFloat(R6i.y) * intBitsToFloat(0x3e22f983));
// 1
PV1ix = R4i.x;
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
R127i.y = floatBitsToInt(intBitsToFloat(PV0ix) + -(1.0));
R126i.z = floatBitsToInt(intBitsToFloat(R3i.w) * intBitsToFloat(0x3e22f983));
PV1iw = floatBitsToInt(intBitsToFloat(R125i.z) * 256.0);
R125i.y = R2i.w;
R125i.y = floatBitsToInt(intBitsToFloat(R125i.y) / 2.0);
// 2
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(0xc34ccccd));
PV0ix = clampFI32(PV0ix);
R124i.y = floatBitsToInt(intBitsToFloat(R3i.z) * intBitsToFloat(0x3ca3d70a));
R127i.z = floatBitsToInt(intBitsToFloat(PV1ix) + -(1.0));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x3d6a0fd3));
PS0i = floatBitsToInt(sin((intBitsToFloat(R127i.x))/0.1591549367));
// 3
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(-(intBitsToFloat(R127i.y)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV0ix)));
R127i.w = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(0x3f333333));
PS1i = floatBitsToInt(sin((intBitsToFloat(R126i.z))/0.1591549367));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PS1i)));
PV0iy = R0i.x;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
PV0iz = R5i.x;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(R10i.w)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R127i.y)));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.z)));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.w), intBitsToFloat(PV0iy)));
// 6
R127i.x = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PV1ix)));
R126i.w = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(PS1i));
R124i.y = R1i.x;
R124i.y = floatBitsToInt(intBitsToFloat(R124i.y) * 2.0);
// 7
R126i.x = floatBitsToInt(-(intBitsToFloat(PV0iy)) + 1.0);
R126i.y = floatBitsToInt(max(intBitsToFloat(PV0iz), intBitsToFloat(R9i.y)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), uf_blockVS6[57].z));
PV1iw = R1i.y;
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 2.0);
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), uf_blockVS6[57].x));
// 8
backupReg0i = R127i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), uf_blockVS6[57].w));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
R127i.y = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(R124i.y));
R127i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), uf_blockVS6[57].y));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
PS0i = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PS1i));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 9
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iw));
PV1iy = R126i.y;
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) / 2.0);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), -(intBitsToFloat(R126i.y))));
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 2.0);
PV1iw = floatBitsToInt(max(intBitsToFloat(R126i.x), intBitsToFloat(0x3e4ccccd)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS0i)));
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV1iz)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV1ix)));
// 11
R126i.x = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(R126i.w));
R127i.y = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PV0iw));
R127i.z = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PS0i));
R2i.w = R7i.y;
R0i.x = R4i.w;
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R7i.y = floatBitsToInt(intBitsToFloat(R8i.z) * 800.0);
// 13
R8i.x = R8i.x;
R8i.x = floatBitsToInt(intBitsToFloat(R8i.x) * 2.0);
R124i.y = floatBitsToInt(intBitsToFloat(R1i.w) + 0.5);
R125i.z = floatBitsToInt(intBitsToFloat(R125i.z) + -(uf_blockVS5[2].y));
R3i.w = R8i.y;
R3i.w = floatBitsToInt(intBitsToFloat(R3i.w) * 2.0);
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 14
PV0ix = floatBitsToInt(intBitsToFloat(R8i.x) + -(1.0));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS1i)));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS1i)));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(intBitsToFloat(R3i.w) + -(1.0));
// 15
backupReg0i = R124i.y;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(PS0i)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(backupReg0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(backupReg0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(PV0ix)));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(backupReg0i)));
// 16
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R8i.y)));
PV0iy = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(0x3c23d70a));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PV1iw));
PV0iz = clampFI32(PV0iz);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R8i.z)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R4i.w)));
// 17
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(R126i.x)));
PV1iy = floatBitsToInt(-(intBitsToFloat(PV0iz)) + 1.0);
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(R124i.y)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(R127i.z)));
R4i.x = floatBitsToInt(intBitsToFloat(PV0iy) * 256.0);
R4i.x = clampFI32(R4i.x);
// 18
R3i.x = 0x3f800000;
R123i.y = floatBitsToInt(intBitsToFloat(R1i.w) * 0.5 + 0.5);
R5i.z = floatBitsToInt(intBitsToFloat(R1i.w) * 0.5 + 0.5);
R7i.w = 0x3f800000;
R5i.w = floatBitsToInt(sqrt(intBitsToFloat(PV1iy)));
// 19
PV1ix = floatBitsToInt(intBitsToFloat(R5i.w) * 10.0);
R124i.y = floatBitsToInt(uf_blockVS5[5].x + -(uf_blockVS5[4].x));
R127i.z = floatBitsToInt(uf_blockVS5[5].y + -(uf_blockVS5[4].y));
R123i.w = floatBitsToInt(intBitsToFloat(R1i.z) * 0.5 + 0.5);
R5i.x = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
// 20
R6i.x = floatBitsToInt(uf_blockVS5[5].z + -(uf_blockVS5[4].z));
R11i.y = R9i.z;
R11i.z = R10i.x;
R6i.w = floatBitsToInt(intBitsToFloat(PV1ix) + -6.0);
R6i.w = clampFI32(R6i.w);
R12i.z = R123i.w;
// 21
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(R126i.w)));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R5i.z)) + uf_blockVS5[4].y);
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(R126i.y)));
R8i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(R127i.x)));
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(R5i.z)) + uf_blockVS5[4].x);
// 0
R125i.x = floatBitsToInt(intBitsToFloat(R2i.w) + -(uf_blockVS4[0].x));
R126i.y = floatBitsToInt(intBitsToFloat(R7i.y) + -(uf_blockVS4[0].y));
R127i.z = floatBitsToInt(intBitsToFloat(R0i.x) + -(uf_blockVS4[0].z));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R9i.x)));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R8i.w)));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R8i.y)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R4i.w)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R4i.w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R8i.z)));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R8i.z)));
// 2
R124i.x = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(PV1iz));
R124i.y = floatBitsToInt(-(intBitsToFloat(PV1iy)) + intBitsToFloat(PV1iw));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R9i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R8i.y)));
R126i.z = floatBitsToInt(intBitsToFloat(R2i.w) + intBitsToFloat(R126i.w));
// 3
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV0iz));
R125i.y = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(R126i.x));
R125i.z = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + intBitsToFloat(PV0iw));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),uf_blockVS1[0].z) + -(uf_blockVS1[0].z));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),uf_blockVS1[1].z) + -(uf_blockVS1[1].z));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R124i.y),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R124i.y),intBitsToFloat(R125i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),uf_blockVS1[0].x) + -(uf_blockVS1[0].x));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(PS1i)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),uf_blockVS1[1].x) + -(uf_blockVS1[1].x));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),uf_blockVS1[2].x) + -(uf_blockVS1[2].x));
R12i.w = R5i.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 7
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),uf_blockVS1[0].y) + intBitsToFloat(R126i.w));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PV0ix)));
R124i.y = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PV1iw)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),uf_blockVS1[1].y) + intBitsToFloat(R126i.y));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PV1iz)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w),uf_blockVS1[2].z) + -(uf_blockVS1[2].z));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R3i.z) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(PV0ix));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),uf_blockVS1[2].y) + intBitsToFloat(R127i.z));
PV1iw = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(PV0iz));
R2i.x = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R124i.x));
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PV1iy)));
R11i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS4[3].w,intBitsToFloat(R124i.y)) + -(uf_blockVS4[3].z));
R11i.w = clampFI32(R11i.w);
R2i.y = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(R126i.y));
// 11
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PV0iz)));
R2i.z = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(R127i.z));
// 12
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV1iw));
R125i.y = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(PV1iz));
R126i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV1iy));
// 13
R4i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),intBitsToFloat(R7i.w)),vec4(uf_blockVS1[0].x,uf_blockVS1[0].y,uf_blockVS1[0].z,uf_blockVS1[0].w)));
PV1iy = R4i.x;
PV1iz = R4i.x;
PV1iw = R4i.x;
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),intBitsToFloat(R7i.w)),vec4(uf_blockVS1[1].x,uf_blockVS1[1].y,uf_blockVS1[1].z,uf_blockVS1[1].w)));
PV0ix = tempi.x;
R4i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),intBitsToFloat(R7i.w)),vec4(uf_blockVS1[2].x,uf_blockVS1[2].y,uf_blockVS1[2].z,uf_blockVS1[2].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R4i.z = tempi.x;
PV1iw = tempi.x;
// 16
R7i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(PV1ix),intBitsToFloat(R3i.x)),vec4(uf_blockVS1[7].x,uf_blockVS1[7].y,uf_blockVS1[7].z,uf_blockVS1[7].w)));
PV0iy = R7i.x;
PV0iz = R7i.x;
PV0iw = R7i.x;
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R3i.x)),vec4(uf_blockVS1[8].x,uf_blockVS1[8].y,uf_blockVS1[8].z,uf_blockVS1[8].w)));
PV1ix = tempi.x;
R7i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R3i.x)),vec4(uf_blockVS1[9].x,uf_blockVS1[9].y,uf_blockVS1[9].z,uf_blockVS1[9].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R7i.z = tempi.x;
PV0iw = tempi.x;
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R3i.x)),vec4(uf_blockVS1[10].x,uf_blockVS1[10].y,uf_blockVS1[10].z,uf_blockVS1[10].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R7i.w = tempi.x;
// export
SET_POSITION(vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.y), intBitsToFloat(R7i.z), intBitsToFloat(R7i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R11i.w), intBitsToFloat(R11i.y), intBitsToFloat(R11i.z), intBitsToFloat(R11i.y));
// export
passParameterSem3 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
// export
passParameterSem2 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.x), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
// export
// skipped export to semanticId 255
// 0
R13i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R5i.z)) + uf_blockVS5[4].z);
// export
passParameterSem1 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
}
