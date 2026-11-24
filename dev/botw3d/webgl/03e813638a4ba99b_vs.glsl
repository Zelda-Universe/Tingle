#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 03e813638a4ba99b
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
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem6;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem8;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem12;

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
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyzw = uvec4(uvec4(attrDataSem6.x,0,0,0));
R1i = ivec4(int(attrDecoder.x), 0, 0, 1);
attrDecoder.xy = attrDataSem8.xy;
attrDecoder.xy = uvec2(((attrDecoder.xy>>8)&0xFFu)|((attrDecoder.xy<<8)&0xFF00u));
attrDecoder.z = uint(0);
attrDecoder.w = uint(0);
attrDecoder.xy = uvec2(floatBitsToUint(unpackHalf2x16(attrDecoder.x|(attrDecoder.y<<16))));
attrDecoder.zw = uvec2(uvec2(0));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), 0, 0x3f800000);
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem12.xyzw)/255.0));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
// 0
R127i.x = floatBitsToInt(uf_blockVS6[32].w * intBitsToFloat(0x43c9d6c7));
R6i.y = floatBitsToInt(-(intBitsToFloat(R2i.w)) + 1.0);
PV0iz = floatBitsToInt(uf_blockVS4[0].w * intBitsToFloat(0x3ed413cd));
R7i.w = 0x3f800000;
R0i.z = R1i.x * 0x3;
// 1
R1i.x = R0i.z + 0x2;
PV1iy = floatBitsToInt(uf_blockVS4[0].x + intBitsToFloat(PV0iz));
R5i.z = floatBitsToInt(uf_blockVS6[32].x);
R6i.w = floatBitsToInt(uf_blockVS6[32].x);
R0i.y = R0i.z + int(1);
// 2
PV0ix = floatBitsToInt(fract(intBitsToFloat(PV1iy)));
R7i.y = floatBitsToInt(uf_blockVS6[32].x + -(0.5));
R7i.y = clampFI32(R7i.y);
PV0iz = R6i.y;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
R3i.w = 0;
R9i.w = 0x3f800000;
// 3
PV1ix = floatBitsToInt(uf_blockVS6[32].w + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e65a5dd));
PV1iz = floatBitsToInt(uf_blockVS6[32].w + intBitsToFloat(PV0ix));
R10i.w = 0x3f800000;
// 4
R0i.x = floatBitsToInt(intBitsToFloat(PV1ix) * 100.0);
R5i.y = floatBitsToInt(intBitsToFloat(PV1iz) * 3.0);
R0i.w = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R127i.x));
R2i.xyzw = floatBitsToInt(uf_blockVS2[R0i.z].xyzw);
R1i.xyzw = floatBitsToInt(uf_blockVS2[R1i.x].xyzw);
R8i.xyzw = floatBitsToInt(uf_blockVS2[R0i.y].xyzw);
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R7i.w)),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R5i.w = tempi.x;
R127i.w = floatBitsToInt(intBitsToFloat(R0i.x) * intBitsToFloat(0x40490e56));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R7i.w)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w))));
PV1ix = tempi.x;
R2i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), uf_blockVS6[32].y));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), uf_blockVS6[32].z));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.w) * 5.0);
PV0iz = floatBitsToInt(-(intBitsToFloat(PS1i)) + intBitsToFloat(R0i.w));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), uf_blockVS6[33].y));
R126i.y = floatBitsToInt(intBitsToFloat(R127i.w) * 3.0);
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), uf_blockVS6[33].z));
PV1iy = floatBitsToInt(-(intBitsToFloat(PV0ix)) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(intBitsToFloat(R0i.w) + -(intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), uf_blockVS6[34].x));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), uf_blockVS6[34].y));
// 4
R5i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3cb6a401));
PV0iy = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(PV1iz));
R0i.z = floatBitsToInt(uf_blockVS6[34].z + intBitsToFloat(PV1iw));
R0i.w = floatBitsToInt(uf_blockVS6[34].w + intBitsToFloat(PS1i));
PS0i = floatBitsToInt(fract(intBitsToFloat(R5i.y)));
// 5
R6i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3cb6a401));
PV1iy = floatBitsToInt(intBitsToFloat(R127i.w) * 7.0);
R123i.z = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.w = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(0x3e22f983) + 0.5);
PS1i = floatBitsToInt(intBitsToFloat(PS0i) + -(0.5));
// 6
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
R1i.z = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(0x431d1463));
PV0iw = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PS0i = floatBitsToInt(max(intBitsToFloat(PS1i), -(intBitsToFloat(PS1i))));
// 7
R1i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R5i.y = R1i.z;
R5i.y = floatBitsToInt(intBitsToFloat(R5i.y) * 4.0);
R2i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R1i.w = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
R1i.y = floatBitsToInt(intBitsToFloat(PS0i) + 0.5);
R2i.w = floatBitsToInt(texture(textureUnitVS1, vec2(intBitsToFloat(R5i.x),intBitsToFloat(R5i.z))).x);
R5i.z = floatBitsToInt(texture(textureUnitVS1, vec2(intBitsToFloat(R6i.x),intBitsToFloat(R6i.w))).x);
R0i.xy = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))).xy);
// 0
R123i.x = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(R1i.w) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.z = floatBitsToInt(intBitsToFloat(R1i.z) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iw = floatBitsToInt(intBitsToFloat(R1i.x) * intBitsToFloat(0x3e22f983));
R127i.y = floatBitsToInt(intBitsToFloat(R2i.z) * intBitsToFloat(0x3e22f983));
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(uf_blockVS6[32].x, intBitsToFloat(R1i.y)));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
R126i.z = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PV1iw = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
R127i.z = floatBitsToInt(sin((intBitsToFloat(PV0iw))/0.1591549367));
// 2
backupReg0i = R127i.y;
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(0xbe99999a));
R127i.y = clampFI32(R127i.y);
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV0iw = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
PS0i = floatBitsToInt(sin((intBitsToFloat(backupReg0i))/0.1591549367));
// 3
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
PV1iy = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
PV1iz = floatBitsToInt(min(intBitsToFloat(backupReg0i), intBitsToFloat(PV0iw)));
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 2.0);
PV1iz = clampFI32(PV1iz);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(sin((intBitsToFloat(R126i.z))/0.1591549367));
// 4
backupReg0i = R127i.y;
R126i.x = floatBitsToInt(intBitsToFloat(R6i.y) + -(uf_blockVS8[0].z));
R126i.x = clampFI32(R126i.x);
R127i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3ca3d70a));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3d6a0fd3));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1iy))/0.1591549367));
// 5
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), uf_blockVS8[0].x));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3d4ccccd));
PV1iz = R0i.y;
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 2.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(sin((intBitsToFloat(backupReg0i))/0.1591549367));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iz) + -(1.0));
PV0iw = R0i.x;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
R127i.y = floatBitsToInt(mul_nonIEEE(uf_blockVS8[0].y, intBitsToFloat(R127i.x)));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + -(1.0));
PV1iz = floatBitsToInt(-(intBitsToFloat(PV0iz)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV0ix)));
R125i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS8[0].z, uf_blockVS8[0].z));
// 8
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R5i.z));
PV0iy = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV1iw));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R127i.y)));
R127i.w = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R2i.w));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(R127i.y)));
// 9
R126i.x = floatBitsToInt(intBitsToFloat(PV0iy) * 20.0);
PV1iy = floatBitsToInt(mul_nonIEEE(uf_blockVS6[33].y, intBitsToFloat(R127i.x)));
PV1iz = floatBitsToInt(-(intBitsToFloat(R127i.w)) + intBitsToFloat(R127i.x));
R126i.w = floatBitsToInt(mul_nonIEEE(uf_blockVS6[32].y, intBitsToFloat(R127i.w)));
R125i.y = R127i.y;
// 10
PV0ix = floatBitsToInt(-(intBitsToFloat(R126i.w)) + intBitsToFloat(PV1iy));
R126i.z = floatBitsToInt(mul_nonIEEE(uf_blockVS6[32].z, intBitsToFloat(R127i.w)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),uf_blockVS6[33].x) + intBitsToFloat(R127i.w));
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),uf_blockVS6[33].x) + intBitsToFloat(R126i.w));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R126i.x)));
PV1iw = floatBitsToInt(mul_nonIEEE(uf_blockVS6[33].z, intBitsToFloat(R127i.x)));
// 12
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R123i.x)));
R126i.y = floatBitsToInt(-(intBitsToFloat(R126i.z)) + intBitsToFloat(PV1iw));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),uf_blockVS8[5].x) + uf_blockVS8[6].x);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.z)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),uf_blockVS8[5].y) + uf_blockVS8[6].y);
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.z),intBitsToFloat(R127i.y),intBitsToFloat(R3i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R5i.z),intBitsToFloat(R127i.y),intBitsToFloat(R127i.y),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PV0iw)));
// 14
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),uf_blockVS6[33].x) + intBitsToFloat(R126i.z));
PV0iy = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3e23d70a));
PV0iz = floatBitsToInt(-(intBitsToFloat(PV1ix)) + intBitsToFloat(R125i.w));
PV0iw = R127i.x;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),uf_blockVS8[5].z) + intBitsToFloat(R125i.z));
// 15
backupReg0i = R124i.z;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R123i.x)));
R126i.y = floatBitsToInt(max(intBitsToFloat(PV0iz), 0.0));
R124i.z = floatBitsToInt(max(intBitsToFloat(PV0iy), 0.0));
R125i.w = floatBitsToInt(intBitsToFloat(R5i.w) + intBitsToFloat(PV0iw));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),uf_blockVS8[5].w) + intBitsToFloat(backupReg0i));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R7i.w)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R8i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R126i.z = tempi.x;
PV0iw = tempi.x;
PS0i = PV1ix;
// 17
R3i.x = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(R5i.z));
PV1iz = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(-(intBitsToFloat(R124i.z)));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(R126i.y)));
// 18
R127i.x = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV1iw));
R5i.z = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R125i.y));
PV0iw = floatBitsToInt(uf_blockVS8[0].z + -(intBitsToFloat(PS1i)));
R4i.z = R127i.y;
// 19
PV1iz = floatBitsToInt(-(intBitsToFloat(PV0iw)));
R4i.w = R126i.x;
// 20
R2i.y = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV1iz));
// export
passParameterSem0 = vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.z), intBitsToFloat(R4i.w));
// 0
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R2i.y),intBitsToFloat(R5i.z),intBitsToFloat(R9i.w)),vec4(uf_blockVS1[0].x,uf_blockVS1[0].y,uf_blockVS1[0].z,uf_blockVS1[0].w)));
PV0iy = R127i.x;
PV0iz = R127i.x;
PV0iw = R127i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R2i.y),intBitsToFloat(R5i.z),intBitsToFloat(R9i.w)),vec4(uf_blockVS1[1].x,uf_blockVS1[1].y,uf_blockVS1[1].z,uf_blockVS1[1].w)));
PV1ix = tempi.x;
R127i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R2i.y),intBitsToFloat(R5i.z),intBitsToFloat(R9i.w)),vec4(uf_blockVS1[2].x,uf_blockVS1[2].y,uf_blockVS1[2].z,uf_blockVS1[2].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R126i.z = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV0ix),intBitsToFloat(R10i.w)),vec4(uf_blockVS1[8].x,uf_blockVS1[8].y,uf_blockVS1[8].z,uf_blockVS1[8].w)));
PV1ix = tempi.x;
R2i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
R2i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R10i.w)),vec4(uf_blockVS1[7].x,uf_blockVS1[7].y,uf_blockVS1[7].z,uf_blockVS1[7].w)));
PV0iy = R2i.x;
PV0iz = R2i.x;
PV0iw = R2i.x;
R126i.x = floatBitsToInt(-(intBitsToFloat(PV1ix)));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R10i.w)),vec4(uf_blockVS1[9].x,uf_blockVS1[9].y,uf_blockVS1[9].z,uf_blockVS1[9].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R2i.z = tempi.x;
PV1iw = tempi.x;
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R10i.w)),vec4(uf_blockVS1[10].x,uf_blockVS1[10].y,uf_blockVS1[10].z,uf_blockVS1[10].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R2i.w = tempi.x;
R10i.z = PV1ix;
// 7
R10i.x = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(PV0ix));
R10i.x = floatBitsToInt(intBitsToFloat(R10i.x) / 2.0);
R10i.y = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV0ix));
R10i.y = floatBitsToInt(intBitsToFloat(R10i.y) / 2.0);
R10i.w = PV0ix;
// export
SET_POSITION(vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w)));
// export
// skipped export to semanticId 255
}
