#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 7720fddac4ee60bd
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
UNIFORM_BUFFER_LAYOUT(1, 0, 2) uniform uniformBlockVS1
{
vec4 uf_blockVS1[11];
};


UNIFORM_BUFFER_LAYOUT(2, 0, 3) uniform uniformBlockVS2
{
vec4 uf_blockVS2[4096];
};


UNIFORM_BUFFER_LAYOUT(4, 0, 4) uniform uniformBlockVS4
{
vec4 uf_blockVS4[1];
};


UNIFORM_BUFFER_LAYOUT(6, 0, 5) uniform uniformBlockVS6
{
vec4 uf_blockVS6[35];
};


UNIFORM_BUFFER_LAYOUT(8, 0, 6) uniform uniformBlockVS8
{
vec4 uf_blockVS8[13];
};


TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
TEXTURE_LAYOUT(33, 0, 1) uniform sampler2D textureUnitVS1;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem4;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem6;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem8;
ATTR_LAYOUT(0, 4) in uvec4 attrDataSem12;

out vec4 passParameterSem0;
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
ivec4 R14i = ivec4(0);
ivec4 R15i = ivec4(0);
ivec4 R16i = ivec4(0);
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
attrDecoder.xyzw = uvec4(floatBitsToInt(vec4(unpackHalf2x16(attrDecoder.x|(attrDecoder.y<<16)),unpackHalf2x16(attrDecoder.z|(attrDecoder.w<<16)))));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem4.xyzw)/255.0));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyzw = attrDataSem6.xyzw;
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xy = attrDataSem8.xy;
attrDecoder.xy = uvec2(((attrDecoder.xy>>8)&0xFFu)|((attrDecoder.xy<<8)&0xFF00u));
attrDecoder.z = uint(0);
attrDecoder.w = uint(0);
attrDecoder.xy = uvec2(floatBitsToUint(unpackHalf2x16(attrDecoder.x|(attrDecoder.y<<16))));
attrDecoder.zw = uvec2(uvec2(0));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), 0, 0x3f800000);
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem12.xyzw)/255.0));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
// 0
PV0ix = floatBitsToInt(uf_blockVS4[0].w * intBitsToFloat(0x3ed413cd));
R13i.y = floatBitsToInt(-(intBitsToFloat(R3i.w)) + 1.0);
R0i.z = floatBitsToInt(uf_blockVS6[32].w * intBitsToFloat(0x43c9d6c7));
R2i.w = 0x3f800000;
R3i.w = R1i.x * 0x3;
// 1
backupReg0i = R3i.w;
R3i.x = backupReg0i + int(1);
R0i.y = backupReg0i + 0x2;
R13i.z = floatBitsToInt(uf_blockVS6[32].x);
PV1iw = floatBitsToInt(uf_blockVS4[0].x + intBitsToFloat(PV0ix));
R0i.x = R1i.y * 0x3;
// 2
backupReg0i = R1i.z;
PV0ix = floatBitsToInt(fract(intBitsToFloat(PV1iw)));
R12i.y = floatBitsToInt(uf_blockVS6[32].x);
R1i.z = R0i.x + 0x2;
R1i.w = R0i.x + int(1);
R1i.y = backupReg0i * 0x3;
// 3
backupReg0i = R1i.y;
R1i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e65a5dd));
R3i.y = backupReg0i + int(1);
R3i.z = R13i.y;
R3i.z = floatBitsToInt(intBitsToFloat(R3i.z) / 2.0);
R0i.w = backupReg0i + 0x2;
R12i.x = floatBitsToInt(uf_blockVS6[32].w + intBitsToFloat(PV0ix));
R7i.xyzw = floatBitsToInt(uf_blockVS2[R3i.w].xyzw);
R6i.xyzw = floatBitsToInt(uf_blockVS2[R0i.x].xyzw);
R10i.xyzw = floatBitsToInt(uf_blockVS2[R0i.y].xyzw);
R9i.xyzw = floatBitsToInt(uf_blockVS2[R1i.z].xyzw);
R8i.xyzw = floatBitsToInt(uf_blockVS2[R1i.y].xyzw);
R11i.xyzw = floatBitsToInt(uf_blockVS2[R0i.w].xyzw);
R15i.xyzw = floatBitsToInt(uf_blockVS2[R3i.x].xyzw);
R14i.xyzw = floatBitsToInt(uf_blockVS2[R1i.w].xyzw);
R16i.xyzw = floatBitsToInt(uf_blockVS2[R3i.y].xyzw);
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z),intBitsToFloat(R6i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.y = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(R0i.z));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z),intBitsToFloat(R7i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV0ix)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R8i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R127i.z = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV1ix)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R9i.z),intBitsToFloat(R9i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PS0i));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(R10i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV1ix)));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV0ix)));
// 6
PV0ix = floatBitsToInt(uf_blockVS6[32].w + intBitsToFloat(R3i.z));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R127i.z)));
PV0iz = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(intBitsToFloat(R12i.x) * 3.0);
// 7
PV1ix = floatBitsToInt(fract(intBitsToFloat(PS0i)));
R9i.y = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(R127i.x));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) * 100.0);
R1i.w = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0iz));
R12i.x = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x431d1463));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), uf_blockVS6[32].y));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), uf_blockVS6[33].y));
R127i.z = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40490e56));
R8i.w = floatBitsToInt(intBitsToFloat(PV1ix) + -(0.5));
R7i.w = R12i.x;
R7i.w = floatBitsToInt(intBitsToFloat(R7i.w) * 4.0);
// 9
PV1ix = floatBitsToInt(-(intBitsToFloat(PV0ix)) + intBitsToFloat(R126i.y));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), uf_blockVS6[32].z));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), uf_blockVS6[33].z));
PV1iw = floatBitsToInt(intBitsToFloat(R126i.y) + -(intBitsToFloat(PV0iy)));
R10i.y = floatBitsToInt(intBitsToFloat(R127i.z) * 5.0);
// 10
PV0ix = floatBitsToInt(-(intBitsToFloat(PV1iz)) + intBitsToFloat(PV1iw));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), uf_blockVS6[34].y));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), uf_blockVS6[34].x));
PV0iw = floatBitsToInt(-(intBitsToFloat(PV1iy)) + intBitsToFloat(PV1ix));
R10i.w = floatBitsToInt(intBitsToFloat(R127i.z) * 3.0);
// 11
R13i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3cb6a401));
R11i.y = floatBitsToInt(uf_blockVS6[34].w + intBitsToFloat(PV0iy));
R12i.z = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3cb6a401));
R11i.w = floatBitsToInt(uf_blockVS6[34].z + intBitsToFloat(PV0iz));
R9i.w = floatBitsToInt(intBitsToFloat(R127i.z) * 7.0);
R6i.w = floatBitsToInt(texture(textureUnitVS1, vec2(intBitsToFloat(R13i.x),intBitsToFloat(R13i.z))).x);
R12i.z = floatBitsToInt(texture(textureUnitVS1, vec2(intBitsToFloat(R12i.z),intBitsToFloat(R12i.y))).x);
R11i.xy = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R11i.w),intBitsToFloat(R11i.y))).xy);
// 0
R123i.x = floatBitsToInt(intBitsToFloat(R10i.y) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(R9i.w) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.z = floatBitsToInt(intBitsToFloat(R10i.w) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iw = floatBitsToInt(max(intBitsToFloat(R8i.w), -(intBitsToFloat(R8i.w))));
R127i.x = floatBitsToInt(intBitsToFloat(R12i.x) * intBitsToFloat(0x3e22f983) + 0.5);
// 1
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) + 0.5);
PV1iw = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
R122i.x = floatBitsToInt(intBitsToFloat(R7i.w) * intBitsToFloat(0x3e22f983) + 0.5);
// 2
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS6[32].x, intBitsToFloat(PV1iz)));
R126i.y = floatBitsToInt(fract(intBitsToFloat(R122i.x)));
// 3
PV1ix = floatBitsToInt(fract(intBitsToFloat(R127i.x)));
PV1iy = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
R127i.z = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R126i.w = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
PS1i = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
// 4
R123i.x = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV0iy = floatBitsToInt(min(intBitsToFloat(R127i.w), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
PV0iy = clampFI32(PV0iy);
R123i.z = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(0xbe99999a));
PV0iw = clampFI32(PV0iw);
R127i.x = floatBitsToInt(sin((intBitsToFloat(PV1iy))/0.1591549367));
// 5
backupReg0i = R126i.w;
R126i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3ca3d70a));
R126i.y = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
R126i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3d6a0fd3));
R126i.w = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
PS1i = floatBitsToInt(sin((intBitsToFloat(backupReg0i))/0.1591549367));
// 6
backupReg0i = R127i.x;
backupReg1i = R127i.z;
R127i.x = floatBitsToInt(uf_blockVS6[32].x + -(0.5));
R127i.x = clampFI32(R127i.x);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(PS1i)));
R127i.z = floatBitsToInt(intBitsToFloat(R13i.y) + -(uf_blockVS8[0].z));
R127i.z = clampFI32(R127i.z);
PV0iw = R11i.y;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
PS0i = floatBitsToInt(sin((intBitsToFloat(backupReg1i))/0.1591549367));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(PV0iy)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y), uf_blockVS8[0].x));
PV1iz = R11i.x;
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 2.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iw) + -(1.0));
PS1i = floatBitsToInt(sin((intBitsToFloat(R126i.w))/0.1591549367));
// 8
backupReg0i = R126i.y;
R125i.x = floatBitsToInt(intBitsToFloat(PV1iz) + -(1.0));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS1i)));
R126i.z = floatBitsToInt(-(intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3d4ccccd));
PS0i = floatBitsToInt(sin((intBitsToFloat(backupReg0i))/0.1591549367));
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(uf_blockVS8[0].y, intBitsToFloat(R127i.y)));
R125i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS8[0].z, uf_blockVS8[0].z));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PS0i)));
R125i.z = 0;
// 10
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV1iw));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV1ix)));
R7i.w = 0x3f800000;
// 11
PV1ix = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV0iy));
R11i.y = R127i.w;
R127i.z = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(R6i.w));
R126i.w = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(R12i.z));
R8i.w = 0x3f800000;
// 12
R125i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS6[32].y, intBitsToFloat(R127i.z)));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.z)) + intBitsToFloat(R126i.w));
PV0iz = floatBitsToInt(mul_nonIEEE(uf_blockVS6[33].y, intBitsToFloat(R126i.w)));
R125i.w = floatBitsToInt(intBitsToFloat(PV1ix) * 20.0);
R13i.z = R5i.x;
// 13
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),uf_blockVS6[33].x) + intBitsToFloat(R127i.z));
R126i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS6[32].z, intBitsToFloat(R127i.z)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R125i.x)) + intBitsToFloat(PV0iz));
R13i.w = R5i.y;
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(uf_blockVS6[33].z, intBitsToFloat(R126i.w)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(R125i.w)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),uf_blockVS6[33].x) + intBitsToFloat(R125i.x));
// 15
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R127i.y)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R123i.w)));
R127i.z = floatBitsToInt(-(intBitsToFloat(R126i.y)) + intBitsToFloat(PV0ix));
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),uf_blockVS8[9].x) + uf_blockVS8[10].x);
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),uf_blockVS8[9].y) + uf_blockVS8[10].y);
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R11i.x),intBitsToFloat(R127i.w),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R11i.x),intBitsToFloat(R127i.w),intBitsToFloat(R127i.w),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV1ix)));
// 17
backupReg0i = R125i.y;
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(R14i.z),intBitsToFloat(R14i.w))));
PV1ix = tempi.x;
R125i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.x = floatBitsToInt(-(intBitsToFloat(PV0ix)) + intBitsToFloat(backupReg0i));
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),intBitsToFloat(R15i.z),intBitsToFloat(R15i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),uf_blockVS6[33].x) + intBitsToFloat(R126i.y));
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R16i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV0ix)));
// 20
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R125i.y)));
PV0iy = floatBitsToInt(max(intBitsToFloat(R125i.x), 0.0));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(0x3e23d70a));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R126i.y)));
// 21
R2i.x = floatBitsToInt(max(intBitsToFloat(PV0iw), 0.0));
R2i.y = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R127i.z));
R16i.z = PS0i;
R2i.w = R124i.y;
R4i.z = floatBitsToInt(sqrt(intBitsToFloat(PV0iy)));
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(R2i.y));
PV0iy = floatBitsToInt(-(intBitsToFloat(R2i.x)));
PV0iz = floatBitsToInt(uf_blockVS8[0].z + -(intBitsToFloat(R4i.z)));
PV0iw = floatBitsToInt(intBitsToFloat(R9i.y) + intBitsToFloat(R2i.w));
PS0i = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(R16i.z));
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(PV0iz)));
R124i.y = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R11i.x));
R127i.z = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(R11i.y));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iy));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),uf_blockVS8[9].z) + intBitsToFloat(R6i.w));
// 2
R126i.y = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(PV1ix));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),uf_blockVS8[9].w) + intBitsToFloat(R12i.x));
R5i.z = R122i.x;
// 3
R125i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.y),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R7i.w)),vec4(uf_blockVS1[0].x,uf_blockVS1[0].y,uf_blockVS1[0].z,uf_blockVS1[0].w)));
PV1iy = R125i.x;
PV1iz = R125i.x;
PV1iw = R125i.x;
R5i.w = R123i.z;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.y),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R7i.w)),vec4(uf_blockVS1[1].x,uf_blockVS1[1].y,uf_blockVS1[1].z,uf_blockVS1[1].w)));
PV0ix = tempi.x;
R125i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.y),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R7i.w)),vec4(uf_blockVS1[2].x,uf_blockVS1[2].y,uf_blockVS1[2].z,uf_blockVS1[2].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R127i.z = tempi.x;
PV1iw = tempi.x;
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R125i.y),intBitsToFloat(PV1ix),intBitsToFloat(R8i.w)),vec4(uf_blockVS1[8].x,uf_blockVS1[8].y,uf_blockVS1[8].z,uf_blockVS1[8].w)));
PV0ix = tempi.x;
R7i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 7
R7i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),intBitsToFloat(R8i.w)),vec4(uf_blockVS1[7].x,uf_blockVS1[7].y,uf_blockVS1[7].z,uf_blockVS1[7].w)));
PV1iy = R7i.x;
PV1iz = R7i.x;
PV1iw = R7i.x;
R125i.z = floatBitsToInt(-(intBitsToFloat(PV0ix)));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),intBitsToFloat(R8i.w)),vec4(uf_blockVS1[9].x,uf_blockVS1[9].y,uf_blockVS1[9].z,uf_blockVS1[9].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R7i.z = tempi.x;
PV0iw = tempi.x;
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),intBitsToFloat(R8i.w)),vec4(uf_blockVS1[10].x,uf_blockVS1[10].y,uf_blockVS1[10].z,uf_blockVS1[10].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R7i.w = tempi.x;
R8i.z = PV0ix;
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),uf_blockVS8[11].y) + uf_blockVS8[12].y);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),uf_blockVS8[11].x) + uf_blockVS8[12].x);
R8i.w = PV1ix;
R8i.x = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(PV1ix));
R8i.x = floatBitsToInt(intBitsToFloat(R8i.x) / 2.0);
// 11
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),uf_blockVS8[11].z) + intBitsToFloat(R123i.y));
R8i.y = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(R7i.w));
R8i.y = floatBitsToInt(intBitsToFloat(R8i.y) / 2.0);
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),uf_blockVS8[11].w) + intBitsToFloat(R123i.x));
// export
SET_POSITION(vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.y), intBitsToFloat(R7i.z), intBitsToFloat(R7i.w)));
// export
// skipped export to semanticId 255
// export
// skipped export to semanticId 255
// export
passParameterSem0 = vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.z), intBitsToFloat(R5i.w));
}
