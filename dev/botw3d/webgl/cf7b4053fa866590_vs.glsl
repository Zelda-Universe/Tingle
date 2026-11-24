#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader cf7b4053fa866590
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[15];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
TEXTURE_LAYOUT(33, 0, 1) uniform sampler2D textureUnitVS1;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem12;

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
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem12.xyzw)/255.0));
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
// 0
R125i.x = R2i.x;
R126i.y = R2i.z;
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(R2i.x))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(R2i.x) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R2i.z));
// 1
R124i.x = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PS0i)));
R126i.z = 0;
PV1iw = ((intBitsToFloat(R2i.x) == 0.0)?-1:0);
PS1i = ((0.0 > intBitsToFloat(R2i.z))?-1:0);
// 2
PV0ix = floatBitsToInt((intBitsToFloat(PV1iy) > 0.0)?1.0:0.0);
R127i.y = floatBitsToInt(max(intBitsToFloat(PV1iy), -(intBitsToFloat(PV1iy))));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), intBitsToFloat(uf_remappedVS[1].z)));
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PV1iy))?1.0:0.0);
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(PS1i)));
// 3
R127i.x = ((intBitsToFloat(R127i.y) > 1.0)?-1:0);
R0i.y = floatBitsToInt(intBitsToFloat(R124i.x) * intBitsToFloat(0x3fc90fdb));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
R125i.w = ((intBitsToFloat(R2i.z) == 0.0)?-1:0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 4
R123i.x = ((R127i.x == 0)?(R127i.y):(PS1i));
R124i.y = floatBitsToInt(((R127i.x == 0)?(intBitsToFloat(PV1iz)):(-(intBitsToFloat(PV1iz)))));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3fc90fdb));
R127i.w = floatBitsToInt(intBitsToFloat(R2i.y) + intBitsToFloat(0xbf8ccccd));
R125i.z = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 5
PV1ix = floatBitsToInt(max(intBitsToFloat(R127i.w), -(intBitsToFloat(R127i.w))));
R3i.y = 0x3e000000;
PV1iz = floatBitsToInt(min(intBitsToFloat(R123i.x), 1.0));
R126i.w = ((R127i.x == 0)?(0):(PV0iz));
R5i.y = R1i.z;
R5i.y = floatBitsToInt(intBitsToFloat(R5i.y) / 2.0);
// 6
PV0ix = floatBitsToInt(intBitsToFloat(PV1ix) + -(intBitsToFloat(uf_remappedVS[2].w)));
R125i.y = floatBitsToInt(max(intBitsToFloat(PV1iz), -(1.0)));
PV0iz = floatBitsToInt(intBitsToFloat(R127i.w) + -0.375);
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x402aaaab));
R126i.x = floatBitsToInt(abs(intBitsToFloat(R127i.w)) * abs(2.5));
// 7
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R125i.y)));
PV1iy = floatBitsToInt(-(intBitsToFloat(PV0iw)) + 1.0);
PV1iy = clampFI32(PV1iy);
R3i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].z) + -(1.0));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x461c4000));
PV1iw = clampFI32(PV1iw);
R127i.y = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x461c4000));
R127i.y = clampFI32(R127i.y);
// 8
R0i.x = floatBitsToInt(intBitsToFloat(PV1iy) * 0.375);
R123i.y = floatBitsToInt(intBitsToFloat(0x3d6ee04d) * intBitsToFloat(R127i.x) + intBitsToFloat(0x3f43b24e));
R4i.z = floatBitsToInt(-(intBitsToFloat(PV1iw)) + 1.0);
R123i.w = floatBitsToInt(intBitsToFloat(0x3edcf805) * intBitsToFloat(R127i.x) + 1.0);
R1i.w = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[1].z));
// 9
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(R123i.y)) + 1.0);
R4i.y = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
R127i.z = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R125i.y)), intBitsToFloat(R123i.w)));
R127i.w = floatBitsToInt(min(intBitsToFloat(R126i.x), 1.0));
R4i.w = 0x3f800000;
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.z),intBitsToFloat(R2i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R123i.x));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(0x3c23d70a));
R8i.y = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(uf_remappedVS[2].x)));
R5i.w = 0x3f800000;
// 12
R123i.y = ((intBitsToFloat(R125i.y) > 0.0)?(PV1iz):(floatBitsToInt(-(intBitsToFloat(PV1iz)))));
R6i.w = 0x3f800000;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 13
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(R123i.y)) + intBitsToFloat(R126i.w));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) / 2.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 14
PV0ix = floatBitsToInt((intBitsToFloat(R125i.x) > 0.0)?1.0:0.0);
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PS1i)));
R7i.y = clampFI32(R7i.y);
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) + 0.5);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(R125i.x))?1.0:0.0);
// 15
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
PV1iw = R7i.y;
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) / 2.0);
tempResultf = max(0.0, intBitsToFloat(PV0iz));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 16
PV0ix = floatBitsToInt(-(intBitsToFloat(R124i.x)) + intBitsToFloat(PV1iz));
R1i.y = floatBitsToInt(intBitsToFloat(PV1iw) + 0.375);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 17
R6i.y = floatBitsToInt(intBitsToFloat(PS0i) + 0.5);
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3fc90fdb));
// 18
PV0iz = floatBitsToInt(intBitsToFloat(R125i.x) + -(intBitsToFloat(PV1iw)));
// 19
R123i.y = ((R124i.z == 0)?(PV0iz):(0x40490fdb));
// 20
R123i.x = ((R125i.w == 0)?(R123i.y):(R0i.y));
// 21
PV1iz = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 22
R3i.x = floatBitsToInt(intBitsToFloat(PV1iz) + 0.5);
// 23
R1i.x = R3i.x;
R0i.z = floatBitsToInt(texture(textureUnitVS1, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y))).x);
R0i.w = floatBitsToInt(texture(textureUnitVS1, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y))).x);
// 0
R125i.x = floatBitsToInt(intBitsToFloat(R0i.z) * intBitsToFloat(0x461c4000));
R125i.x = clampFI32(R125i.x);
PV0iy = floatBitsToInt(-(intBitsToFloat(R0i.w)) + 1.0);
PV0iz = R0i.z;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[3].w) * intBitsToFloat(0x3ed413cd));
PS0i = floatBitsToInt(intBitsToFloat(R0i.w) + -(1.0));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[3].x) + intBitsToFloat(PV0iw));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i),intBitsToFloat(R4i.y)) + 1.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x461c4000));
PV1iz = clampFI32(PV1iz);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + -(1.0));
R125i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].w) * intBitsToFloat(0x43c9d6c7));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].w) + intBitsToFloat(R5i.y));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(fract(intBitsToFloat(PV1ix)));
R124i.w = floatBitsToInt(-(intBitsToFloat(PV1iz)) + 1.0);
R5i.y = uf_remappedVS[4].x;
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e65a5dd));
R6i.z = uf_remappedVS[4].x;
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) * 100.0);
PS1i = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].w) + intBitsToFloat(PV0iz));
// 4
R126i.x = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R125i.w));
R124i.y = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40490e56));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PV1ix)));
R126i.w = floatBitsToInt(intBitsToFloat(PS1i) * 3.0);
R7i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].x) + -(0.5));
R7i.y = clampFI32(R7i.y);
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(R0i.x)));
PV1iy = floatBitsToInt(intBitsToFloat(R124i.y) * 5.0);
PV1iz = floatBitsToInt(max(-(intBitsToFloat(PV0iz)), 0.0));
PV1iw = floatBitsToInt(intBitsToFloat(R124i.y) * 3.0);
R125i.w = floatBitsToInt(fract(intBitsToFloat(R126i.w)));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R124i.y) * 7.0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R124i.w)));
R124i.z = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iw = floatBitsToInt(min(intBitsToFloat(PV1iz), 1.0));
R127i.w = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
// 7
R125i.x = floatBitsToInt(intBitsToFloat(R2i.y) + -(intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3dcccccd));
R125i.z = floatBitsToInt(intBitsToFloat(R125i.w) + -(0.5));
R125i.w = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0x431d1463));
R126i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e22f983) + 0.5);
// 8
backupReg0i = R127i.w;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV1iy)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(R3i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(PV1iy)));
R127i.w = floatBitsToInt(fract(intBitsToFloat(R124i.z)));
R124i.z = floatBitsToInt(fract(intBitsToFloat(backupReg0i)));
// 9
R124i.x = floatBitsToInt(max(intBitsToFloat(R125i.z), -(intBitsToFloat(R125i.z))));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R1i.w)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PV0ix)));
R127i.x = R125i.w;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 4.0);
// 10
backupReg0i = R127i.w;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(PV1iy)));
R127i.w = floatBitsToInt(fract(intBitsToFloat(R126i.w)));
R126i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 11
R3i.x = floatBitsToInt(intBitsToFloat(R125i.x) + -(intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(intBitsToFloat(R2i.z) + -(intBitsToFloat(PV0iz)));
R124i.z = floatBitsToInt(intBitsToFloat(R124i.z) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iw = floatBitsToInt(intBitsToFloat(R2i.x) + -(intBitsToFloat(PV0ix)));
R125i.x = floatBitsToInt(intBitsToFloat(R124i.x) + 0.5);
// 12
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R125i.y)));
R125i.z = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R125i.y)));
R125i.y = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 13
R0i.x = PV0iw;
R124i.y = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(0x3e22f983));
R3i.z = PV0iy;
R126i.w = floatBitsToInt(intBitsToFloat(R124i.z) * intBitsToFloat(0x3e22f983));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].x), intBitsToFloat(R125i.x)));
// 14
R2i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R3i.x),intBitsToFloat(R3i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),intBitsToFloat(uf_remappedVS[3].w))));
PV0iy = R2i.x;
PV0iz = R2i.x;
PV0iw = R2i.x;
R124i.z = floatBitsToInt(fract(intBitsToFloat(R127i.x)));
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R3i.x),intBitsToFloat(R3i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(uf_remappedVS[5].x),intBitsToFloat(uf_remappedVS[5].y),intBitsToFloat(uf_remappedVS[5].z),intBitsToFloat(uf_remappedVS[5].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
R127i.x = floatBitsToInt(fract(intBitsToFloat(R125i.z)));
// 16
R125i.x = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(uf_remappedVS[4].y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(uf_remappedVS[6].y)));
R127i.w = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
R125i.y = floatBitsToInt(sin((intBitsToFloat(R124i.y))/0.1591549367));
// 17
PV1ix = floatBitsToInt(intBitsToFloat(R126i.x) + -(intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt(-(intBitsToFloat(PV0iy)) + intBitsToFloat(R126i.x));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[4].z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[6].z)));
PS1i = floatBitsToInt(sin((intBitsToFloat(R126i.w))/0.1591549367));
// 18
PV0ix = floatBitsToInt(-(intBitsToFloat(PV1iz)) + intBitsToFloat(PV1iy));
R2i.y = floatBitsToInt(intBitsToFloat(R124i.z) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV0iz = floatBitsToInt(-(intBitsToFloat(PV1iw)) + intBitsToFloat(PV1ix));
R1i.w = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PS1i)));
// 19
R5i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3cb6a401));
R6i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3cb6a401));
R4i.z = floatBitsToInt(min(intBitsToFloat(R125i.w), intBitsToFloat(R127i.w)));
R4i.z = floatBitsToInt(intBitsToFloat(R4i.z) * 2.0);
R4i.z = clampFI32(R4i.z);
R2i.w = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(0xbe99999a));
R2i.w = clampFI32(R2i.w);
R0i.w = floatBitsToInt(sin((intBitsToFloat(R125i.x))/0.1591549367));
R5i.y = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y))).x);
R5i.x = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R6i.y),intBitsToFloat(R6i.z))).x);
// 0
R125i.x = floatBitsToInt(intBitsToFloat(R2i.y) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R2i.z)));
PV0iz = floatBitsToInt(intBitsToFloat(R1i.w) * intBitsToFloat(0x3e22f983));
R127i.w = floatBitsToInt(intBitsToFloat(R4i.z) * intBitsToFloat(0x3ca3d70a));
R124i.z = floatBitsToInt(intBitsToFloat(R2i.w) * intBitsToFloat(0x3d6a0fd3));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3d4ccccd));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0iz))/0.1591549367));
// 2
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(sin((intBitsToFloat(backupReg0i))/0.1591549367));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PV0iw)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(PS0i)));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R3i.w) + intBitsToFloat(PV1ix));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R125i.x));
// 5
R127i.x = floatBitsToInt(intBitsToFloat(PV0ix) * 20.0);
R124i.z = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R5i.x));
R127i.w = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R5i.y));
// 6
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].y), intBitsToFloat(R127i.w)));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.w)) + intBitsToFloat(R124i.z));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].y), intBitsToFloat(R124i.z)));
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(uf_remappedVS[6].x)) + intBitsToFloat(R127i.w));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), intBitsToFloat(R127i.w)));
PV1iz = floatBitsToInt(-(intBitsToFloat(R125i.x)) + intBitsToFloat(PV0iw));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].z), intBitsToFloat(R124i.z)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x), intBitsToFloat(R127i.x)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(uf_remappedVS[6].x)) + intBitsToFloat(R125i.x));
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R125i.y)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R123i.z)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R124i.y)) + intBitsToFloat(PV0ix));
// 10
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(uf_remappedVS[6].x)) + intBitsToFloat(R124i.y));
PV0iz = PV1iy;
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(PV1ix)));
// 11
R2i.x = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e23d70a));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R123i.y)));
// 12
R127i.x = PV1iw;
PV0iy = floatBitsToInt(max(intBitsToFloat(PV1iz), 0.0));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R3i.x),intBitsToFloat(R3i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(-(intBitsToFloat(PV0iy)));
// 14
R5i.y = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PS1i));
R0i.z = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(R127i.x));
// 0
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R5i.y),intBitsToFloat(R0i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w))));
PV0iy = R127i.x;
PV0iz = R127i.x;
PV0iw = R127i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R5i.y),intBitsToFloat(R0i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w))));
PV1ix = tempi.x;
R125i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R5i.y),intBitsToFloat(R0i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R124i.z = tempi.x;
PV0iw = tempi.x;
// 3
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(PV0ix),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w))));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R124i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w))));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R124i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),intBitsToFloat(uf_remappedVS[13].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R124i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(uf_remappedVS[14].x),intBitsToFloat(uf_remappedVS[14].y),intBitsToFloat(uf_remappedVS[14].z),intBitsToFloat(uf_remappedVS[14].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R0i.w = tempi.x;
// export
SET_POSITION(vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w)));
// export
// skipped export to semanticId 255
}
