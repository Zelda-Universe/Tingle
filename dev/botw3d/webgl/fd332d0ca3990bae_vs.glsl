#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader fd332d0ca3990bae
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


TEXTURE_LAYOUT(32, 0, 0) uniform sampler2DArray textureUnitVS0;
TEXTURE_LAYOUT(33, 0, 1) uniform sampler2D textureUnitVS1;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem4;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem6;
ATTR_LAYOUT(0, 4) in uvec4 attrDataSem8;
ATTR_LAYOUT(0, 5) in uvec4 attrDataSem12;

out vec4 passParameterSem0;
out vec4 passParameterSem5;
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
ivec4 R14i = ivec4(0);
ivec4 R15i = ivec4(0);
ivec4 R16i = ivec4(0);
ivec4 R17i = ivec4(0);
ivec4 R18i = ivec4(0);
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
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.x = attrDataSem1.x;
attrDecoder.x = uint((attrDecoder.x>>24)|((attrDecoder.x>>8)&0xFF00u)|((attrDecoder.x<<8)&0xFF0000u)|((attrDecoder.x<<24)));
attrDecoder.y = uint(0);
attrDecoder.z = uint(0);
attrDecoder.w = uint(0);
attrDecoder.xyzw = uvec4(uvec4((attrDecoder.x>>0)&0x3FFu,(attrDecoder.x>>10)&0x3FFu,(attrDecoder.x>>20)&0x3FFu,(attrDecoder.x>>30)&0x3u));
if( (attrDecoder.x&0x200u) != 0u ) attrDecoder.x |= 0xFFFFFC00u;
if( (attrDecoder.y&0x200u) != 0u ) attrDecoder.y |= 0xFFFFFC00u;
if( (attrDecoder.z&0x200u) != 0u ) attrDecoder.z |= 0xFFFFFC00u;
attrDecoder.x = uint(floatBitsToUint(max(float(int(attrDecoder.x))/511.0,-1.0)));
attrDecoder.y = uint(floatBitsToUint(max(float(int(attrDecoder.y))/511.0,-1.0)));
attrDecoder.z = uint(floatBitsToUint(max(float(int(attrDecoder.z))/511.0,-1.0)));
attrDecoder.w = uint(floatBitsToUint(float(attrDecoder.w)));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xy = attrDataSem8.xy;
attrDecoder.xy = uvec2(((attrDecoder.xy>>8)&0xFFu)|((attrDecoder.xy<<8)&0xFF00u));
attrDecoder.z = uint(0);
attrDecoder.w = uint(0);
attrDecoder.xy = uvec2(floatBitsToUint(unpackHalf2x16(attrDecoder.x|(attrDecoder.y<<16))));
attrDecoder.zw = uvec2(uvec2(0));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), 0, 0x3f800000);
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem12.xyzw)/255.0));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem4.xyzw)/255.0));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyzw = attrDataSem6.xyzw;
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
// 0
R8i.x = floatBitsToInt(uf_blockVS6[32].w * intBitsToFloat(0x43c9d6c7));
R8i.y = floatBitsToInt(-(intBitsToFloat(R3i.w)) + 1.0);
PV0iz = floatBitsToInt(uf_blockVS4[0].w * intBitsToFloat(0x3ed413cd));
R5i.w = 0x3f800000;
R0i.y = R1i.x * 0x3;
// 1
backupReg0i = R0i.y;
R0i.x = backupReg0i + int(1);
PV1iy = floatBitsToInt(uf_blockVS4[0].x + intBitsToFloat(PV0iz));
R9i.z = floatBitsToInt(uf_blockVS6[32].x);
R0i.w = backupReg0i + 0x2;
R0i.z = R1i.y * 0x3;
// 2
R1i.x = R0i.z + 0x2;
PV0iy = floatBitsToInt(fract(intBitsToFloat(PV1iy)));
R8i.z = floatBitsToInt(uf_blockVS6[32].x);
R2i.w = R0i.z + int(1);
R1i.w = R1i.z * 0x3;
// 3
R7i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3e65a5dd));
R1i.y = R1i.w + 0x2;
R1i.z = R1i.w + int(1);
R4i.w = R8i.y;
R4i.w = floatBitsToInt(intBitsToFloat(R4i.w) / 2.0);
R7i.z = floatBitsToInt(uf_blockVS6[32].w + intBitsToFloat(PV0iy));
R10i.xyzw = floatBitsToInt(uf_blockVS2[R0i.y].xyzw);
R13i.xyzw = floatBitsToInt(uf_blockVS2[R0i.z].xyzw);
R11i.xyzw = floatBitsToInt(uf_blockVS2[R0i.w].xyzw);
R15i.xyzw = floatBitsToInt(uf_blockVS2[R1i.x].xyzw);
R16i.xyzw = floatBitsToInt(uf_blockVS2[R1i.w].xyzw);
R18i.xyzw = floatBitsToInt(uf_blockVS2[R1i.y].xyzw);
R12i.xyzw = floatBitsToInt(uf_blockVS2[R0i.x].xyzw);
R14i.xyzw = floatBitsToInt(uf_blockVS2[R2i.w].xyzw);
R17i.xyzw = floatBitsToInt(uf_blockVS2[R1i.z].xyzw);
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R13i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.y = floatBitsToInt(uf_blockVS6[32].w + intBitsToFloat(R4i.w));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(R10i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV0ix)));
// 2
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R16i.w))));
PV0iy = R127i.x;
PV0iz = R127i.x;
PV0iw = R127i.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV1ix)));
// 3
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),intBitsToFloat(R15i.z),intBitsToFloat(R15i.w))));
PV1iy = R126i.x;
PV1iz = R126i.x;
PV1iw = R126i.x;
R126i.z = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PS0i));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R127i.z = tempi.x;
PV0iw = tempi.x;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R127i.x)));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(R18i.x),intBitsToFloat(R18i.y),intBitsToFloat(R18i.z),intBitsToFloat(R18i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R125i.z = tempi.x;
PV1iw = tempi.x;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R126i.x)));
// 6
R126i.x = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(R8i.x));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R127i.z)));
PV0iz = floatBitsToInt(intBitsToFloat(R126i.y) * 100.0);
R0i.w = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R126i.z));
R0i.y = floatBitsToInt(intBitsToFloat(R7i.z) * 3.0);
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R125i.z)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), uf_blockVS6[32].y));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), uf_blockVS6[33].y));
R126i.w = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40490e56));
// 8
backupReg0i = R126i.x;
backupReg1i = R126i.w;
R126i.x = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(PV1iw)));
R9i.y = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(PV1ix));
R125i.z = floatBitsToInt(-(intBitsToFloat(PV1iz)) + intBitsToFloat(backupReg0i));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), uf_blockVS6[34].x));
R125i.w = floatBitsToInt(intBitsToFloat(backupReg1i) * 5.0);
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), uf_blockVS6[33].z));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.w) * 3.0);
R127i.z = floatBitsToInt(fract(intBitsToFloat(R0i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), uf_blockVS6[32].z));
R7i.y = floatBitsToInt(intBitsToFloat(R126i.w) * 7.0);
// 10
PV0ix = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(R126i.x));
PV0iy = floatBitsToInt(-(intBitsToFloat(PV1iw)) + intBitsToFloat(R125i.z));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), uf_blockVS6[34].y));
R1i.w = floatBitsToInt(uf_blockVS6[34].z + intBitsToFloat(R127i.w));
R7i.z = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(0x3e22f983) + 0.5);
// 11
R9i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3cb6a401));
R1i.y = floatBitsToInt(uf_blockVS6[34].w + intBitsToFloat(PV0iz));
R1i.z = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(0x3e22f983) + 0.5);
R8i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3cb6a401));
R4i.w = floatBitsToInt(intBitsToFloat(R127i.z) + -(0.5));
R2i.w = floatBitsToInt(texture(textureUnitVS1, vec2(intBitsToFloat(R9i.x),intBitsToFloat(R9i.z))).x);
R8i.z = floatBitsToInt(texture(textureUnitVS1, vec2(intBitsToFloat(R8i.w),intBitsToFloat(R8i.z))).x);
R1i.xy = floatBitsToInt(texture(textureUnitVS0, vec3(intBitsToFloat(R1i.w),intBitsToFloat(R1i.y),0.0)).xy);
// export
// skipped export to semanticId 255
// 0
R123i.x = floatBitsToInt(intBitsToFloat(R7i.y) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iy = floatBitsToInt(fract(intBitsToFloat(R7i.z)));
R127i.z = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(0x431d1463));
PV0iw = floatBitsToInt(fract(intBitsToFloat(R1i.z)));
PS0i = floatBitsToInt(max(intBitsToFloat(R4i.w), -(intBitsToFloat(R4i.w))));
// 1
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iy = R127i.z;
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) * 4.0);
R123i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iw = floatBitsToInt(fract(intBitsToFloat(backupReg0i)));
R126i.y = floatBitsToInt(intBitsToFloat(PS0i) + 0.5);
// 2
backupReg0i = R123i.x;
backupReg1i = R123i.z;
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.z = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iw = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3e22f983));
R127i.y = floatBitsToInt(intBitsToFloat(backupReg1i) * intBitsToFloat(0x3e22f983));
// 3
R126i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS6[32].x, intBitsToFloat(R126i.y)));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
R125i.z = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PV1iw = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
R127i.z = floatBitsToInt(sin((intBitsToFloat(PV0iw))/0.1591549367));
// 4
backupReg0i = R127i.y;
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.y = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(0xbe99999a));
R127i.y = clampFI32(R127i.y);
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV0iw = floatBitsToInt(-(intBitsToFloat(R126i.x)) + 1.0);
PS0i = floatBitsToInt(sin((intBitsToFloat(backupReg0i))/0.1591549367));
// 5
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
PV1iy = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
PV1iz = floatBitsToInt(min(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iw)));
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 2.0);
PV1iz = clampFI32(PV1iz);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(sin((intBitsToFloat(R125i.z))/0.1591549367));
// 6
backupReg0i = R127i.y;
R127i.x = floatBitsToInt(uf_blockVS6[32].x + -(0.5));
R127i.x = clampFI32(R127i.x);
R127i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3ca3d70a));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3d6a0fd3));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1iy))/0.1591549367));
// 7
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(R8i.y) + -(uf_blockVS8[0].z));
R126i.x = clampFI32(R126i.x);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3d4ccccd));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), uf_blockVS8[0].x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(sin((intBitsToFloat(backupReg0i))/0.1591549367));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS1i)));
PV0iz = R1i.y;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
PV0iw = R1i.x;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
R125i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS8[0].y, intBitsToFloat(R127i.z)));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(1.0));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iz) + -(1.0));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV0ix)));
R125i.z = 0;
// 10
R126i.x = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R2i.w));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1iw));
PV0iz = floatBitsToInt(-(intBitsToFloat(PV1iz)));
R127i.w = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R8i.z));
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R125i.w)));
// 11
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS6[32].y, intBitsToFloat(R126i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(R125i.w)));
PV1iz = floatBitsToInt(-(intBitsToFloat(R126i.x)) + intBitsToFloat(R127i.w));
R126i.w = floatBitsToInt(intBitsToFloat(PV0iy) * 20.0);
PS1i = floatBitsToInt(mul_nonIEEE(uf_blockVS6[33].y, intBitsToFloat(R127i.w)));
// 12
R3i.x = R127i.y;
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),uf_blockVS6[33].x) + intBitsToFloat(R126i.x));
R126i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS6[32].z, intBitsToFloat(R126i.x)));
R125i.w = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(PS1i));
R2i.w = 0x3f800000;
// 13
R126i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS8[0].z, uf_blockVS8[0].z));
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockVS6[33].z, intBitsToFloat(R127i.w)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y), intBitsToFloat(R126i.w)));
R4i.w = 0x3f800000;
R7i.z = R6i.x;
// 14
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(R126i.z)) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.z)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R10i.z)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),uf_blockVS6[33].x) + intBitsToFloat(backupReg0i));
R7i.w = R6i.y;
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R127i.y),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.y),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iy)));
// 16
backupReg0i = R127i.x;
backupReg1i = R124i.z;
R127i.x = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3e23d70a));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R125i.w)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),uf_blockVS6[33].x) + intBitsToFloat(R126i.z));
PV0iw = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(R126i.x));
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R10i.y)) + intBitsToFloat(backupReg1i));
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(R14i.z),intBitsToFloat(R14i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.y = floatBitsToInt(max(intBitsToFloat(PV0iw), 0.0));
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),intBitsToFloat(R12i.z),intBitsToFloat(R12i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV1ix)));
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(R17i.x),intBitsToFloat(R17i.y),intBitsToFloat(R17i.z),intBitsToFloat(R17i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV0ix)));
// 20
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R124i.z)));
PV0iz = floatBitsToInt(max(intBitsToFloat(R127i.x), 0.0));
PV0iw = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PS1i));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(R127i.y)));
// 21
R5i.x = PV0iy;
R5i.y = floatBitsToInt(-(intBitsToFloat(PV0iz)));
R5i.z = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iw));
R5i.w = R126i.y;
R8i.z = floatBitsToInt(uf_blockVS8[0].z + -(intBitsToFloat(PS0i)));
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R0i.w) + intBitsToFloat(R5i.w));
PV0iy = floatBitsToInt(-(intBitsToFloat(R8i.z)));
PV0iz = floatBitsToInt(intBitsToFloat(R9i.y) + intBitsToFloat(R5i.x));
PV0iw = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(R5i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),uf_blockVS8[9].x) + uf_blockVS8[10].x);
// 1
R127i.x = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R1i.x));
R126i.y = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0iy));
R126i.z = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(R3i.x));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),uf_blockVS8[9].y) + uf_blockVS8[10].y);
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R12i.z)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R126i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS1[0].x,uf_blockVS1[0].y,uf_blockVS1[0].z,uf_blockVS1[0].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R12i.y)) + intBitsToFloat(PS1i));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R126i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS1[1].x,uf_blockVS1[1].y,uf_blockVS1[1].z,uf_blockVS1[1].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R1i.x = PV0ix;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R126i.z),intBitsToFloat(R2i.w)),vec4(uf_blockVS1[2].x,uf_blockVS1[2].y,uf_blockVS1[2].z,uf_blockVS1[2].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R1i.y = PV1ix;
// 5
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R10i.x)) + intBitsToFloat(R9i.x));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),uf_blockVS8[9].w) + intBitsToFloat(R126i.w));
R1i.z = PV0ix;
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),uf_blockVS8[9].z) + intBitsToFloat(R127i.y));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R11i.z)));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R4i.w)),vec4(uf_blockVS1[8].x,uf_blockVS1[8].y,uf_blockVS1[8].z,uf_blockVS1[8].w)));
PV0ix = tempi.x;
R9i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R11i.y)) + intBitsToFloat(PS1i));
// 7
R9i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R4i.w)),vec4(uf_blockVS1[7].x,uf_blockVS1[7].y,uf_blockVS1[7].z,uf_blockVS1[7].w)));
PV1iy = R9i.x;
PV1iz = R9i.x;
PV1iw = R9i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R11i.x)) + intBitsToFloat(R122i.x));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R4i.w)),vec4(uf_blockVS1[9].x,uf_blockVS1[9].y,uf_blockVS1[9].z,uf_blockVS1[9].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R9i.z = tempi.x;
PV0iw = tempi.x;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R127i.x)));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R4i.w)),vec4(uf_blockVS1[10].x,uf_blockVS1[10].y,uf_blockVS1[10].z,uf_blockVS1[10].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R9i.w = tempi.x;
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R126i.x)));
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R13i.z)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R12i.x)) + intBitsToFloat(R125i.x));
R126i.z = floatBitsToInt(-(intBitsToFloat(R9i.y)));
R12i.w = PV1ix;
R12i.z = R9i.z;
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(PV0ix),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R126i.w = tempi.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R123i.y)));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(R14i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),uf_blockVS8[11].x) + uf_blockVS8[12].x);
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R15i.x),intBitsToFloat(R15i.y),intBitsToFloat(R15i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(PV0ix)) + intBitsToFloat(R125i.x));
// 14
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R126i.w)) + intBitsToFloat(R127i.y));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),uf_blockVS8[11].y) + uf_blockVS8[12].y);
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(PV1ix)) + intBitsToFloat(R125i.w));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R16i.z)));
R12i.x = floatBitsToInt(intBitsToFloat(R9i.x) + intBitsToFloat(R9i.w));
R12i.x = floatBitsToInt(intBitsToFloat(R12i.x) / 2.0);
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(PV0iw),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R12i.y = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(R9i.w));
R12i.y = floatBitsToInt(intBitsToFloat(R12i.y) / 2.0);
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R17i.x),intBitsToFloat(R17i.y),intBitsToFloat(R17i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(PV1ix)) + intBitsToFloat(R125i.x));
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R18i.x),intBitsToFloat(R18i.y),intBitsToFloat(R18i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(PV0ix)) + intBitsToFloat(R127i.w));
// 18
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),uf_blockVS8[11].z) + intBitsToFloat(R126i.y));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),uf_blockVS8[11].w) + intBitsToFloat(R127i.y));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(PV1ix)) + intBitsToFloat(R124i.z));
R6i.z = R124i.w;
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R124i.y),intBitsToFloat(R124i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R124i.y),intBitsToFloat(R124i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R6i.w = R125i.y;
// 20
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 21
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PS0i)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PS0i)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(PS0i)));
// 22
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[0].x,uf_blockVS1[0].y,uf_blockVS1[0].z,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 23
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[1].x,uf_blockVS1[1].y,uf_blockVS1[1].z,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R18i.w = tempi.x;
R4i.x = PV0ix;
// export
SET_POSITION(vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.z), intBitsToFloat(R6i.w));
// export
// skipped export to semanticId 255
// export
// skipped export to semanticId 255
// export
passParameterSem5 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[2].x,uf_blockVS1[2].y,uf_blockVS1[2].z,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R4i.y = R18i.w;
// 1
R4i.z = PV0ix;
// export
passParameterSem3 = vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.z), intBitsToFloat(R4i.w));
}
