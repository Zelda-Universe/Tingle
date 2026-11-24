#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 99302557303746f4
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
vec4 uf_blockVS8[7];
};


TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
TEXTURE_LAYOUT(33, 0, 1) uniform sampler2D textureUnitVS1;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem2;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem6;
ATTR_LAYOUT(0, 4) in uvec4 attrDataSem8;
ATTR_LAYOUT(0, 5) in uvec4 attrDataSem12;

out vec4 passParameterSem5;
out vec4 passParameterSem0;
out vec4 passParameterSem4;
out vec4 passParameterSem3;
out vec4 passParameterSem6;
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
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyzw = attrDataSem2.xyzw;
if( (attrDecoder.x&0x80u) != 0u ) attrDecoder.x |= 0xFFFFFF00u;
if( (attrDecoder.y&0x80u) != 0u ) attrDecoder.y |= 0xFFFFFF00u;
if( (attrDecoder.z&0x80u) != 0u ) attrDecoder.z |= 0xFFFFFF00u;
if( (attrDecoder.w&0x80u) != 0u ) attrDecoder.w |= 0xFFFFFF00u;
attrDecoder.x = uint(floatBitsToUint(max(float(int(attrDecoder.x))/127.0,-1.0)));
attrDecoder.y = uint(floatBitsToUint(max(float(int(attrDecoder.y))/127.0,-1.0)));
attrDecoder.z = uint(floatBitsToUint(max(float(int(attrDecoder.z))/127.0,-1.0)));
attrDecoder.w = uint(floatBitsToUint(max(float(int(attrDecoder.w))/127.0,-1.0)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xy = attrDataSem8.xy;
attrDecoder.xy = uvec2(((attrDecoder.xy>>8)&0xFFu)|((attrDecoder.xy<<8)&0xFF00u));
attrDecoder.z = uint(0);
attrDecoder.w = uint(0);
attrDecoder.xy = uvec2(floatBitsToUint(unpackHalf2x16(attrDecoder.x|(attrDecoder.y<<16))));
attrDecoder.zw = uvec2(uvec2(0));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), 0, 0x3f800000);
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem12.xyzw)/255.0));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyzw = uvec4(uvec4(attrDataSem6.x,0,0,0));
R1i = ivec4(int(attrDecoder.x), 0, 0, 1);
// 0
R10i.x = 0x3f800000;
R127i.y = floatBitsToInt(uf_blockVS6[32].w * intBitsToFloat(0x43c9d6c7));
R7i.z = floatBitsToInt(-(intBitsToFloat(R2i.w)) + 1.0);
PV0iw = floatBitsToInt(uf_blockVS4[0].w * intBitsToFloat(0x3ed413cd));
R0i.y = R1i.x * 0x3;
// 1
R1i.x = R0i.y + int(1);
R7i.y = floatBitsToInt(uf_blockVS6[32].x);
PV1iz = floatBitsToInt(uf_blockVS4[0].x + intBitsToFloat(PV0iw));
R0i.w = R0i.y + 0x2;
R8i.y = floatBitsToInt(uf_blockVS6[32].x);
// 2
R9i.x = floatBitsToInt(uf_blockVS6[32].x + -(0.5));
R9i.x = clampFI32(R9i.x);
PV0iy = floatBitsToInt(fract(intBitsToFloat(PV1iz)));
R9i.z = 0;
PV0iw = R7i.z;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
R8i.w = 0x3f800000;
// 3
PV1ix = floatBitsToInt(uf_blockVS6[32].w + intBitsToFloat(PV0iw));
R9i.y = 0x3f800000;
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3e65a5dd));
PV1iw = floatBitsToInt(uf_blockVS6[32].w + intBitsToFloat(PV0iy));
R14i.w = R5i.w;
// 4
R0i.x = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R127i.y));
R1i.y = floatBitsToInt(intBitsToFloat(PV1ix) * 100.0);
R0i.z = floatBitsToInt(intBitsToFloat(PV1iw) * 3.0);
R11i.xyzw = floatBitsToInt(uf_blockVS2[R0i.y].xyzw);
R13i.xyzw = floatBitsToInt(uf_blockVS2[R0i.w].xyzw);
R12i.xyzw = floatBitsToInt(uf_blockVS2[R1i.x].xyzw);
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R10i.x)),vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R10i.z = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(intBitsToFloat(R1i.y) * intBitsToFloat(0x40490e56));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R10i.x)),vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R13i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R7i.w = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), uf_blockVS6[32].y));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), uf_blockVS6[33].y));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), uf_blockVS6[32].z));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.x) * 5.0);
PV0iw = floatBitsToInt(-(intBitsToFloat(PS1i)) + intBitsToFloat(R0i.x));
R126i.z = floatBitsToInt(intBitsToFloat(R127i.x) * 3.0);
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), uf_blockVS6[34].x));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), uf_blockVS6[33].z));
PV1iz = floatBitsToInt(-(intBitsToFloat(PV0iy)) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(R0i.x) + -(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), uf_blockVS6[34].y));
// 4
R7i.x = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3cb6a401));
R1i.y = floatBitsToInt(uf_blockVS6[34].w + intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(-(intBitsToFloat(PV1iy)) + intBitsToFloat(PV1iw));
R1i.w = floatBitsToInt(uf_blockVS6[34].z + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(fract(intBitsToFloat(R0i.z)));
// 5
R8i.x = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3cb6a401));
R123i.y = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iz = floatBitsToInt(intBitsToFloat(R127i.x) * 7.0);
R123i.w = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0x3e22f983) + 0.5);
PS1i = floatBitsToInt(intBitsToFloat(PS0i) + -(0.5));
// 6
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R0i.w = floatBitsToInt(intBitsToFloat(R0i.z) * intBitsToFloat(0x431d1463));
PS0i = floatBitsToInt(max(intBitsToFloat(PS1i), -(intBitsToFloat(PS1i))));
// 7
R0i.x = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R0i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R0i.z = R0i.w;
R0i.z = floatBitsToInt(intBitsToFloat(R0i.z) * 4.0);
R3i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R1i.z = floatBitsToInt(intBitsToFloat(PS0i) + 0.5);
R4i.w = floatBitsToInt(texture(textureUnitVS1, vec2(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y))).x);
R8i.z = floatBitsToInt(texture(textureUnitVS1, vec2(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y))).x);
R1i.xy = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R1i.w),intBitsToFloat(R1i.y))).xy);
// export
passParameterSem5 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
// 0
R123i.x = floatBitsToInt(intBitsToFloat(R0i.x) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(R0i.z) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iz = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(0x3e22f983));
R123i.w = floatBitsToInt(intBitsToFloat(R0i.w) * intBitsToFloat(0x3e22f983) + 0.5);
R127i.z = floatBitsToInt(intBitsToFloat(R3i.w) * intBitsToFloat(0x3e22f983));
// 1
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS6[32].x, intBitsToFloat(R1i.z)));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R126i.w = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
R127i.w = floatBitsToInt(sin((intBitsToFloat(PV0iz))/0.1591549367));
// 2
backupReg0i = R127i.z;
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(0xbe99999a));
R127i.z = clampFI32(R127i.z);
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS0i = floatBitsToInt(sin((intBitsToFloat(backupReg0i))/0.1591549367));
// 3
backupReg0i = R127i.y;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PV1iz = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
PV1iw = floatBitsToInt(min(intBitsToFloat(backupReg0i), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 2.0);
PV1iw = clampFI32(PV1iw);
PS1i = floatBitsToInt(sin((intBitsToFloat(R126i.w))/0.1591549367));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0x3d6a0fd3));
R126i.y = floatBitsToInt(intBitsToFloat(R7i.z) + -(uf_blockVS8[0].z));
R126i.y = clampFI32(R126i.y);
R127i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3ca3d70a));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1iz))/0.1591549367));
// 5
backupReg0i = R127i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), uf_blockVS8[0].x));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3d4ccccd));
PV1iw = R1i.y;
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 2.0);
PS1i = floatBitsToInt(sin((intBitsToFloat(backupReg0i))/0.1591549367));
// 6
PV0ix = R1i.x;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iw) + -(1.0));
R127i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS8[0].y, intBitsToFloat(R127i.y)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(1.0));
PV1iw = floatBitsToInt(-(intBitsToFloat(PV0iw)));
R126i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS8[0].z, uf_blockVS8[0].z));
// 8
backupReg0i = R127i.y;
R127i.x = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R8i.z));
R127i.y = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R4i.w));
PV0iz = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV1ix));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(R127i.w)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R127i.w)));
// 9
R125i.x = floatBitsToInt(intBitsToFloat(PV0iz) * 20.0);
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockVS6[33].y, intBitsToFloat(R127i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS6[32].y, intBitsToFloat(R127i.y)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R127i.y)) + intBitsToFloat(R127i.x));
R124i.w = R126i.y;
// 10
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.z)) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R12i.z)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),uf_blockVS6[33].x) + intBitsToFloat(R127i.y));
R126i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS6[32].z, intBitsToFloat(R127i.y)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R11i.z)));
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),uf_blockVS6[33].x) + intBitsToFloat(R127i.z));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R12i.y)) + intBitsToFloat(PV0iy));
PV1iz = floatBitsToInt(mul_nonIEEE(uf_blockVS6[33].z, intBitsToFloat(R127i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(R125i.x)));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R11i.y)) + intBitsToFloat(PS0i));
// 12
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R123i.x)));
R127i.y = floatBitsToInt(-(intBitsToFloat(R126i.w)) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R127i.w)));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R11i.x)) + intBitsToFloat(R122i.x));
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R13i.z)));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.w),intBitsToFloat(R126i.y),intBitsToFloat(R9i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.w),intBitsToFloat(R126i.y),intBitsToFloat(R126i.y),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0iz)));
// 14
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3e23d70a));
PV0iy = R127i.x;
PV0iz = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(R126i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),uf_blockVS6[33].x) + intBitsToFloat(R126i.w));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R11i.z)));
// 15
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(max(intBitsToFloat(PV0ix), 0.0));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R123i.w)));
R127i.z = floatBitsToInt(intBitsToFloat(R10i.z) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(max(intBitsToFloat(PV0iz), 0.0));
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R13i.y)) + intBitsToFloat(R124i.x));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R10i.x)),vec4(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),intBitsToFloat(R12i.z),intBitsToFloat(R12i.w))));
PV0ix = tempi.x;
R126i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1iw)));
// 17
PV1ix = floatBitsToInt(uf_blockVS8[0].z + -(intBitsToFloat(PS0i)));
R4i.y = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(R125i.w));
PV1iz = floatBitsToInt(-(intBitsToFloat(R125i.x)));
PV1iw = R127i.y;
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R12i.x)) + intBitsToFloat(R125i.y));
// 18
PV0ix = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV1iz));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R13i.x)) + intBitsToFloat(R124i.x));
PV0iz = floatBitsToInt(-(intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(intBitsToFloat(R7i.w) + intBitsToFloat(PV1iw));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R12i.z)));
// 19
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R11i.y)) + intBitsToFloat(R127i.x));
R3i.y = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iz));
R3i.z = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R124i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),uf_blockVS8[5].x) + uf_blockVS8[6].x);
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R12i.y)) + intBitsToFloat(PS0i));
// 20
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R11i.x)) + intBitsToFloat(R123i.x));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R12i.x)) + intBitsToFloat(R122i.x));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),uf_blockVS8[5].z) + intBitsToFloat(R123i.w));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R0i.y)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R13i.z)));
// 21
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R5i.z = tempi.x;
PV1iw = tempi.x;
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R1i.y)) + intBitsToFloat(PV0iw));
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.y),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R8i.w)),vec4(uf_blockVS1[0].x,uf_blockVS1[0].y,uf_blockVS1[0].z,uf_blockVS1[0].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w),intBitsToFloat(R4i.w)) + intBitsToFloat(R5i.x));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.y),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R8i.w)),vec4(uf_blockVS1[1].x,uf_blockVS1[1].y,uf_blockVS1[1].z,uf_blockVS1[1].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R13i.x = PV0ix;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.y),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R8i.w)),vec4(uf_blockVS1[2].x,uf_blockVS1[2].y,uf_blockVS1[2].z,uf_blockVS1[2].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R13i.y = PV1ix;
// 3
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),uf_blockVS8[5].y) + uf_blockVS8[6].y);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R5i.z)));
R13i.z = PV0ix;
tempResultf = 1.0 / sqrt(intBitsToFloat(backupReg0i));
R124i.w = floatBitsToInt(tempResultf);
// 4
R3i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R9i.y)),vec4(uf_blockVS1[7].x,uf_blockVS1[7].y,uf_blockVS1[7].z,uf_blockVS1[7].w)));
PV0iy = R3i.x;
PV0iz = R3i.x;
PV0iw = R3i.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y),intBitsToFloat(R11i.y)) + intBitsToFloat(PV1iy));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R9i.y)),vec4(uf_blockVS1[8].x,uf_blockVS1[8].y,uf_blockVS1[8].z,uf_blockVS1[8].w)));
PV1ix = tempi.x;
R3i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x),intBitsToFloat(R11i.x)) + intBitsToFloat(R122i.x));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R9i.y)),vec4(uf_blockVS1[9].x,uf_blockVS1[9].y,uf_blockVS1[9].z,uf_blockVS1[9].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R3i.z = tempi.x;
PV0iw = tempi.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(R124i.w)));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R9i.y)),vec4(uf_blockVS1[10].x,uf_blockVS1[10].y,uf_blockVS1[10].z,uf_blockVS1[10].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R3i.w = tempi.x;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R124i.w)));
// 8
backupReg0i = R127i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),uf_blockVS8[5].w) + intBitsToFloat(R127i.x));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R124i.w)));
tempResultf = 1.0 / sqrt(intBitsToFloat(backupReg0i));
PS0i = floatBitsToInt(tempResultf);
// 9
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(PS0i)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PS0i)));
R6i.w = R123i.x;
R6i.z = R11i.z;
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[0].x,uf_blockVS1[0].y,uf_blockVS1[0].z,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), uf_blockVS1[0].z));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[1].x,uf_blockVS1[1].y,uf_blockVS1[1].z,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R5i.x = PV0ix;
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[2].x,uf_blockVS1[2].y,uf_blockVS1[2].z,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R5i.y = PV1ix;
// 13
R14i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.x),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[0].x,uf_blockVS1[0].y,1.0,0.0)));
PV1iy = R14i.x;
PV1iz = R14i.x;
PV1iw = R14i.x;
R5i.z = PV0ix;
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[1].x,uf_blockVS1[1].y,uf_blockVS1[1].z,0.0)));
PV0ix = tempi.x;
R14i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[2].x,uf_blockVS1[2].y,uf_blockVS1[2].z,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R14i.z = tempi.x;
PV1iw = tempi.x;
// export
SET_POSITION(vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.z), intBitsToFloat(R6i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.z), intBitsToFloat(R5i.w));
// export
passParameterSem6 = vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w));
}
