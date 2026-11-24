#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 912b0d7e11c952a0
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
PV0ix = floatBitsToInt(intBitsToFloat(R2i.z) * intBitsToFloat(0x3e65a5dd));
PV0iy = floatBitsToInt(uf_blockVS6[32].w * intBitsToFloat(0x43c9d6c7));
PV0iz = R2i.y;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
PV0iw = R2i.x;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
PS0i = floatBitsToInt(intBitsToFloat(R3i.x) * 255.0);
// 1
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) + -(0.5));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + -(0.5));
R126i.z = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iy));
R4i.w = floatBitsToInt(uf_blockVS6[32].x);
R127i.z = int(intBitsToFloat(PS0i));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), uf_blockVS5[1].x));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), uf_blockVS5[1].y));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), uf_blockVS5[0].y));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), uf_blockVS5[0].x));
R0i.y = R127i.z + 0xf;
// 3
R7i.x = floatBitsToInt(uf_blockVS5[0].z + intBitsToFloat(PV0iw));
R7i.y = floatBitsToInt(uf_blockVS5[0].w + intBitsToFloat(PV0iz));
R0i.z = floatBitsToInt(uf_blockVS5[1].z + intBitsToFloat(PV0ix));
R0i.w = floatBitsToInt(uf_blockVS5[1].w + intBitsToFloat(PV0iy));
R3i.w = R127i.z + 0x1b;
// 4
R0i.x = floatBitsToInt(-(uf_blockVS6[32].x) + 1.0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), uf_blockVS6[32].y));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), uf_blockVS6[34].y));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), uf_blockVS6[34].x));
R4i.y = floatBitsToInt(uf_blockVS6[32].x);
// 5
R3i.x = floatBitsToInt(uf_blockVS6[34].z + intBitsToFloat(PV0iw));
R3i.y = floatBitsToInt(uf_blockVS6[34].w + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), uf_blockVS6[33].y));
R127i.w = floatBitsToInt(-(intBitsToFloat(PV0iy)) + intBitsToFloat(R126i.z));
PS1i = floatBitsToInt(intBitsToFloat(R2i.w) * intBitsToFloat(0x3e4ccccd));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R126i.z) + -(intBitsToFloat(PV1iz)));
PV0iy = floatBitsToInt(intBitsToFloat(R2i.z) + uf_blockVS6[32].w);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), uf_blockVS6[32].z));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), uf_blockVS6[33].z));
R5i.w = floatBitsToInt(intBitsToFloat(PS1i) + intBitsToFloat(0x3f666666));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), uf_blockVS6[35].x));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), uf_blockVS6[35].y));
PV1iz = floatBitsToInt(-(intBitsToFloat(PV0iw)) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(-(intBitsToFloat(PV0iz)) + intBitsToFloat(R127i.w));
R5i.y = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x439d1463));
// 8
R4i.x = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3cb6a401));
R2i.y = floatBitsToInt(uf_blockVS6[35].w + intBitsToFloat(PV1iy));
R4i.z = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3cb6a401));
R2i.w = floatBitsToInt(uf_blockVS6[35].z + intBitsToFloat(PV1ix));
R2i.x = R5i.y;
R2i.x = floatBitsToInt(intBitsToFloat(R2i.x) * 4.0);
R3i.xy = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y))).xy);
R8i.xyzw = floatBitsToInt(texture(textureUnitVS2, vec2(intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))).xyzw);
R4i.x = floatBitsToInt(texture(textureUnitVS3, vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.w))).x);
R5i.x = floatBitsToInt(texture(textureUnitVS3, vec2(intBitsToFloat(R4i.z),intBitsToFloat(R4i.y))).x);
R9i.xyzw = floatBitsToInt(uf_blockVS5[R0i.y].xyzw);
R6i.xy = floatBitsToInt(texture(textureUnitVS1, vec2(intBitsToFloat(R2i.w),intBitsToFloat(R2i.y))).xy);
R10i.xyz = floatBitsToInt(uf_blockVS5[R3i.w].xyz);
// 0
PV0ix = R3i.y;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
R123i.y = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(0x3e22f983) + 0.5);
R126i.z = floatBitsToInt(min(uf_blockVS6[32].x, intBitsToFloat(R0i.x)));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) * 2.0);
R126i.z = clampFI32(R126i.z);
R123i.w = floatBitsToInt(intBitsToFloat(R2i.x) * intBitsToFloat(0x3e22f983) + 0.5);
R127i.x = floatBitsToInt(uf_blockVS6[32].x + intBitsToFloat(0xbe99999a));
R127i.x = clampFI32(R127i.x);
// 1
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R127i.y = floatBitsToInt(intBitsToFloat(PV0ix) + -(1.0));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV1iw = R3i.x;
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 2.0);
R127i.z = floatBitsToInt(max(intBitsToFloat(R8i.w), uf_blockVS5[6].y));
// 2
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0x3ca3d70a));
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R126i.z = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3d6a0fd3));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R124i.z = floatBitsToInt(intBitsToFloat(PV1iw) + -(1.0));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R9i.w)));
R127i.z = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R126i.w = floatBitsToInt(-(intBitsToFloat(R127i.y)));
R125i.z = R4i.x;
R125i.z = floatBitsToInt(intBitsToFloat(R125i.z) * 2.0);
// 4
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y)));
PV0iy = R5i.x;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(PV1iy)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R126i.w)));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1ix))/0.1591549367));
// 5
backupReg0i = R127i.z;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R124i.z)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(PV0iy)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(sin((intBitsToFloat(backupReg0i))/0.1591549367));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS1i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.w), intBitsToFloat(R125i.z)));
PV0iz = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1ix));
R127i.w = floatBitsToInt(max(intBitsToFloat(PV1iw), intBitsToFloat(R10i.y)));
PS0i = R1i.x;
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 7
backupReg0i = R127i.z;
PV1ix = R1i.y;
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
PV1iy = floatBitsToInt(-(intBitsToFloat(PV0iz)) + 1.0);
R127i.z = floatBitsToInt(intBitsToFloat(R124i.z) + intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV0ix));
R127i.x = R127i.w;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) / 2.0);
// 8
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R127i.y));
R127i.y = floatBitsToInt(max(intBitsToFloat(PV1iy), intBitsToFloat(0x3e4ccccd)));
R124i.z = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV1ix));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R126i.y));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), -(intBitsToFloat(R127i.w))));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) * 2.0);
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), uf_blockVS6[57].w));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) * 2.0);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), uf_blockVS6[57].x));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), uf_blockVS6[57].z));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), uf_blockVS6[57].y));
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 2.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.x)));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PV1iw));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R127i.y)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PV1iy));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R127i.x)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R126i.y)));
// 11
R125i.x = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0ix)));
R124i.z = 0;
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0iz)));
R3i.y = R8i.x;
R3i.y = floatBitsToInt(intBitsToFloat(R3i.y) * 2.0);
// 12
R127i.x = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1iw));
R5i.y = R8i.y;
R5i.y = floatBitsToInt(intBitsToFloat(R5i.y) * 2.0);
R127i.z = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV1iy));
R126i.w = floatBitsToInt(intBitsToFloat(R3i.y) + -(1.0));
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) + -(uf_blockVS5[2].y));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.x),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.x),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(intBitsToFloat(R5i.y) + -(1.0));
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R126i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(max(intBitsToFloat(R1i.z), -(intBitsToFloat(R1i.z))));
R3i.w = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(0x3c23d70a));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 15
backupReg0i = R127i.z;
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PV0ix));
PV1ix = clampFI32(PV1ix);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PS0i)));
R4i.x = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3fb504f3));
// 16
R127i.x = floatBitsToInt(-(intBitsToFloat(R126i.y)));
R127i.y = R127i.z;
PV0iz = floatBitsToInt(-(intBitsToFloat(PV1ix)) + 1.0);
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(R127i.z)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(R126i.y)));
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R124i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R124i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R2i.y = floatBitsToInt(sqrt(intBitsToFloat(PV0iz)));
// 18
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R127i.z)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(R126i.w)));
PV0iz = floatBitsToInt(intBitsToFloat(R2i.y) * 10.0);
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R126i.y)));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 19
R3i.x = floatBitsToInt(intBitsToFloat(PV0iz) + -6.0);
R3i.x = clampFI32(R3i.x);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R126i.w)));
R6i.w = R7i.x;
// 20
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), -(intBitsToFloat(PV1iz))));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R127i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV1iz)));
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PV1iz)));
// 21
backupReg0i = R7i.y;
R5i.x = floatBitsToInt(-(intBitsToFloat(PV0ix)) + intBitsToFloat(PV0iw));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R127i.y)));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PV0iy)));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(PV0iz)));
R2i.z = backupReg0i;
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(R5i.x)));
PV0iy = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(R7i.y));
PV0iz = floatBitsToInt(intBitsToFloat(R5i.w) + intBitsToFloat(R7i.x));
R125i.w = floatBitsToInt(intBitsToFloat(R8i.z) * 800.0);
R127i.z = floatBitsToInt(intBitsToFloat(R3i.w) * 256.0);
R127i.z = clampFI32(R127i.z);
// 1
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3f3504f3));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R6i.x)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3f3504f3));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3f3504f3));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R2i.w)));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R4i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(PV1iz)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV1iy)));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(R0i.w));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.y)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R6i.y));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R0i.z));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iz)));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PV1ix)));
R124i.z = floatBitsToInt(intBitsToFloat(R6i.w) + intBitsToFloat(R126i.w));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PV1iz)));
R126i.w = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(PV1iy));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PV0iy)));
R127i.w = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(R127i.y));
R124i.w = 0x3f800000;
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV1ix)));
R126i.y = 0x3f800000;
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV1iz)));
R125i.x = floatBitsToInt(intBitsToFloat(R6i.w) + -(uf_blockVS4[0].x));
// 7
R127i.x = floatBitsToInt(intBitsToFloat(R124i.z) + intBitsToFloat(PV0iw));
R127i.y = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV0iz));
R124i.z = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0ix));
R127i.w = floatBitsToInt(intBitsToFloat(R125i.w) + -(uf_blockVS4[0].y));
R127i.z = floatBitsToInt(intBitsToFloat(R2i.z) + -(uf_blockVS4[0].z));
// 8
R4i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R124i.z),intBitsToFloat(R124i.w)),vec4(uf_blockVS1[0].x,uf_blockVS1[0].y,uf_blockVS1[0].z,uf_blockVS1[0].w)));
PV0iy = R4i.x;
PV0iz = R4i.x;
PV0iw = R4i.x;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),uf_blockVS1[0].x) + -(uf_blockVS1[0].x));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R124i.z),intBitsToFloat(R124i.w)),vec4(uf_blockVS1[1].x,uf_blockVS1[1].y,uf_blockVS1[1].z,uf_blockVS1[1].w)));
PV1ix = tempi.x;
R4i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),uf_blockVS1[1].x) + -(uf_blockVS1[1].x));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R124i.z),intBitsToFloat(R124i.w)),vec4(uf_blockVS1[2].x,uf_blockVS1[2].y,uf_blockVS1[2].z,uf_blockVS1[2].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R4i.z = tempi.x;
PV0iw = tempi.x;
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),uf_blockVS1[2].x) + -(uf_blockVS1[2].x));
// 11
R3i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(PV0ix),intBitsToFloat(R126i.y)),vec4(uf_blockVS1[7].x,uf_blockVS1[7].y,uf_blockVS1[7].z,uf_blockVS1[7].w)));
PV1iy = R3i.x;
PV1iz = R3i.x;
PV1iw = R3i.x;
R127i.y = floatBitsToInt(intBitsToFloat(R1i.w) * 0.5 + 0.5);
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R126i.y)),vec4(uf_blockVS1[8].x,uf_blockVS1[8].y,uf_blockVS1[8].z,uf_blockVS1[8].w)));
PV0ix = tempi.x;
R3i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(intBitsToFloat(R1i.z) * 0.5 + 0.5);
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R126i.y)),vec4(uf_blockVS1[9].x,uf_blockVS1[9].y,uf_blockVS1[9].z,uf_blockVS1[9].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R3i.z = tempi.x;
PV1iw = tempi.x;
R124i.x = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R126i.y)),vec4(uf_blockVS1[10].x,uf_blockVS1[10].y,uf_blockVS1[10].z,uf_blockVS1[10].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R3i.w = tempi.x;
R9i.z = R9i.x;
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.w),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.w),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),uf_blockVS1[0].z) + -(uf_blockVS1[0].z));
// 16
R10i.x = R127i.x;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),uf_blockVS1[1].z) + -(uf_blockVS1[1].z));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),uf_blockVS1[0].y) + intBitsToFloat(R126i.w));
R9i.w = R10i.z;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 17
R5i.x = floatBitsToInt(intBitsToFloat(R125i.x) + intBitsToFloat(R123i.z));
R10i.y = R124i.x;
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),uf_blockVS1[2].z) + -(uf_blockVS1[2].z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),uf_blockVS1[1].y) + intBitsToFloat(R126i.x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 18
R9i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS4[3].w,intBitsToFloat(PS1i)) + -(uf_blockVS4[3].z));
R9i.x = clampFI32(R9i.x);
R5i.y = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(R123i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),uf_blockVS1[2].y) + intBitsToFloat(R125i.y));
// 19
R5i.z = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(R123i.w));
// export
SET_POSITION(vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.z), intBitsToFloat(R5i.w));
// export
passParameterSem2 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.x), intBitsToFloat(R10i.x), intBitsToFloat(R10i.y));
// export
// skipped export to semanticId 255
// 0
R4i.x = floatBitsToInt(uf_blockVS5[5].x);
R4i.y = floatBitsToInt(uf_blockVS5[5].y);
R4i.z = floatBitsToInt(uf_blockVS5[5].z);
// export
passParameterSem1 = vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.z), intBitsToFloat(R4i.w));
}
