#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 57e18383750e6c10
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[12];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
TEXTURE_LAYOUT(33, 0, 1) uniform sampler2D textureUnitVS1;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem2;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem8;
ATTR_LAYOUT(0, 4) in uvec4 attrDataSem12;

out vec4 passParameterSem3;
out vec4 passParameterSem7;
out vec4 passParameterSem0;
out vec4 passParameterSem8;
out vec4 passParameterSem6;
out vec4 passParameterSem9;
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
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
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
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyzw = attrDataSem2.xyzw;
if( (attrDecoder.x&0x80u) != 0u ) attrDecoder.x |= 0xFFFFFF00u;
if( (attrDecoder.y&0x80u) != 0u ) attrDecoder.y |= 0xFFFFFF00u;
if( (attrDecoder.z&0x80u) != 0u ) attrDecoder.z |= 0xFFFFFF00u;
if( (attrDecoder.w&0x80u) != 0u ) attrDecoder.w |= 0xFFFFFF00u;
attrDecoder.x = uint(floatBitsToUint(max(float(int(attrDecoder.x))/127.0,-1.0)));
attrDecoder.y = uint(floatBitsToUint(max(float(int(attrDecoder.y))/127.0,-1.0)));
attrDecoder.z = uint(floatBitsToUint(max(float(int(attrDecoder.z))/127.0,-1.0)));
attrDecoder.w = uint(floatBitsToUint(max(float(int(attrDecoder.w))/127.0,-1.0)));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xy = attrDataSem8.xy;
attrDecoder.xy = uvec2(((attrDecoder.xy>>8)&0xFFu)|((attrDecoder.xy<<8)&0xFF00u));
attrDecoder.z = uint(0);
attrDecoder.w = uint(0);
attrDecoder.xy = uvec2(floatBitsToUint(vec2(float(attrDecoder.x), float(attrDecoder.y))/65535.0));
attrDecoder.zw = uvec2(uvec2(0));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), 0, 0x3f800000);
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem12.xyzw)/255.0));
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
// 0
R125i.x = R3i.x;
R126i.y = R3i.z;
PV0iz = floatBitsToInt((0.0 > intBitsToFloat(R3i.x))?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(R3i.x) > 0.0)?1.0:0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R3i.z));
// 1
R124i.x = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PS0i)));
R127i.z = 0;
PV1iw = ((intBitsToFloat(R3i.x) == 0.0)?-1:0);
PS1i = ((0.0 > intBitsToFloat(R3i.z))?-1:0);
// 2
PV0ix = floatBitsToInt((intBitsToFloat(PV1iy) > 0.0)?1.0:0.0);
R127i.y = floatBitsToInt(max(intBitsToFloat(PV1iy), -(intBitsToFloat(PV1iy))));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(PV1iy))?1.0:0.0);
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), intBitsToFloat(uf_remappedVS[1].z)));
// 3
R126i.x = ((intBitsToFloat(R127i.y) > 1.0)?-1:0);
R0i.y = ((intBitsToFloat(R3i.z) == 0.0)?-1:0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
R126i.w = floatBitsToInt(intBitsToFloat(R124i.x) * intBitsToFloat(0x3fc90fdb));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 4
R123i.x = ((R126i.x == 0)?(R127i.y):(PS1i));
R125i.y = floatBitsToInt(((R126i.x == 0)?(intBitsToFloat(PV1iz)):(-(intBitsToFloat(PV1iz)))));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3fc90fdb));
R6i.w = 0x3e000000;
R124i.y = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(0xbf8ccccd));
R11i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].z) + -(1.0));
PV1iz = floatBitsToInt(min(intBitsToFloat(R123i.x), 1.0));
R127i.w = ((R126i.x == 0)?(0):(PV0iz));
R9i.x = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[1].z));
// 6
PV0ix = floatBitsToInt(max(intBitsToFloat(PV1ix), -(intBitsToFloat(PV1ix))));
R127i.y = floatBitsToInt(max(intBitsToFloat(PV1iz), -(1.0)));
PV0iz = floatBitsToInt(abs(intBitsToFloat(PV1ix)) * abs(2.5));
R2i.w = 0x3f800000;
R3i.w = 0x3f800000;
// 7
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R127i.y)));
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x402aaaab));
PV1iz = floatBitsToInt(min(intBitsToFloat(PV0iz), 1.0));
R5i.w = 0x3f800000;
R7i.x = 0x3d2aaaab;
// 8
R10i.x = floatBitsToInt(-(intBitsToFloat(PV1iz)) + 1.0);
R123i.y = floatBitsToInt(intBitsToFloat(0x3d6ee04d) * intBitsToFloat(R126i.x) + intBitsToFloat(0x3f43b24e));
PV0iz = floatBitsToInt(-(intBitsToFloat(PV1iy)) + 1.0);
PV0iz = clampFI32(PV0iz);
R123i.w = floatBitsToInt(intBitsToFloat(0x3edcf805) * intBitsToFloat(R126i.x) + 1.0);
R7i.y = 0;
// 9
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R123i.y)) + 1.0);
R8i.y = 0;
R126i.z = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R127i.y)), intBitsToFloat(R123i.w)));
R0i.w = floatBitsToInt(intBitsToFloat(PV0iz) * 0.375);
R8i.x = 0x3e000000;
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.z),intBitsToFloat(R3i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R123i.x));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(0x3c23d70a));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PS0i)));
R12i.w = R4i.w;
// 12
R123i.y = ((intBitsToFloat(R127i.y) > 0.0)?(PV1iz):(floatBitsToInt(-(intBitsToFloat(PV1iz)))));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 13
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(R123i.y)) + intBitsToFloat(R127i.w));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PS0i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 14
PV0ix = floatBitsToInt((intBitsToFloat(R125i.x) > 0.0)?1.0:0.0);
PV0iy = R127i.w;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y), intBitsToFloat(PS1i)));
R5i.z = clampFI32(R5i.z);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(R125i.x))?1.0:0.0);
R11i.x = PV1iy;
// 15
PV1ix = R5i.z;
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) / 2.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iy) + 0.5);
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R5i.z)));
R9i.y = floatBitsToInt(1.0 / intBitsToFloat(R5i.z));
// 16
PV0ix = floatBitsToInt(-(intBitsToFloat(R124i.x)) + intBitsToFloat(PV1iz));
R6i.y = floatBitsToInt(intBitsToFloat(PV1ix) + 0.375);
R11i.z = R127i.w;
PV0iw = floatBitsToInt(-(intBitsToFloat(PV1iw)) + 1.0);
tempResultf = max(0.0, intBitsToFloat(PV1iy));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 17
R10i.y = floatBitsToInt(intBitsToFloat(PV0iw) + -(1.0));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3fc90fdb));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 18
R0i.x = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
PV0iz = floatBitsToInt(intBitsToFloat(R125i.x) + -(intBitsToFloat(PV1iw)));
// 19
R123i.y = ((R125i.z == 0)?(PV0iz):(0x40490fdb));
// 20
R123i.x = ((R0i.y == 0)?(R123i.y):(R126i.w));
// 21
PV1iz = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 22
R6i.x = floatBitsToInt(intBitsToFloat(PV1iz) + 0.5);
R0i.z = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y))).x);
R6i.w = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R6i.x),intBitsToFloat(R6i.w))).x);
R7i.w = floatBitsToInt(texture(textureUnitVS1, vec2(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y))).x);
R7i.xyz = floatBitsToInt(texture(textureUnitVS1, vec2(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y))).xyz);
// export
passParameterSem3 = vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.y), intBitsToFloat(R7i.z), intBitsToFloat(R7i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
// export
passParameterSem0 = vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.x), intBitsToFloat(R5i.y));
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R6i.w)) + 1.0);
PV0iy = R0i.z;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
PV0iz = floatBitsToInt(min(intBitsToFloat(R6i.w), intBitsToFloat(R5i.z)));
R126i.w = floatBitsToInt(intBitsToFloat(R0i.z) * intBitsToFloat(0x461c4000));
R126i.w = clampFI32(R126i.w);
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(uf_remappedVS[2].z)));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) + -(1.0));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(R9i.y)));
R125i.z = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x461c4000));
R125i.z = clampFI32(R125i.z);
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(uf_remappedVS[3].z)));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(uf_remappedVS[2].y)) + intBitsToFloat(PS0i));
// 2
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y),intBitsToFloat(R125i.z)) + 1.0);
PV0iy = floatBitsToInt(intBitsToFloat(PV1iy) + -(1.0));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(PV1ix)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(uf_remappedVS[2].x)) + intBitsToFloat(R122i.x));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(uf_remappedVS[3].y)) + intBitsToFloat(PV1iw));
// 3
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R125i.z)) + 1.0);
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(uf_remappedVS[3].x)) + intBitsToFloat(R122i.x));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(uf_remappedVS[3].y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(uf_remappedVS[4].z)));
// 4
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R123i.x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PV1iw)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R123i.x)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(uf_remappedVS[3].z)) + intBitsToFloat(PV1iz));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(uf_remappedVS[4].y)) + intBitsToFloat(PS1i));
// 5
PV1ix = floatBitsToInt(max(-(intBitsToFloat(PV0iy)), 0.0));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R0i.w)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(uf_remappedVS[4].x)) + intBitsToFloat(R122i.x));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(uf_remappedVS[3].x)) + intBitsToFloat(R123i.w));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(uf_remappedVS[4].y)));
// 6
PV0ix = floatBitsToInt(min(intBitsToFloat(PV1ix), 1.0));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(uf_remappedVS[2].z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R125i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R127i.z)));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(uf_remappedVS[4].z)) + intBitsToFloat(PS1i));
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(uf_remappedVS[2].y)) + intBitsToFloat(PV0iy));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(uf_remappedVS[4].x)) + intBitsToFloat(R122i.x));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3dcccccd));
R127i.w = floatBitsToInt(intBitsToFloat(R3i.y) + -(intBitsToFloat(PV0iz)));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.y),intBitsToFloat(R124i.y)) + intBitsToFloat(PV0iw));
// 8
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(uf_remappedVS[2].x)) + intBitsToFloat(R123i.x));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R11i.y)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(R126i.w)) + intBitsToFloat(R122i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iz)),intBitsToFloat(R125i.z)) + intBitsToFloat(PV1iz));
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R123i.w)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R123i.w)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R127i.y)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R9i.x)));
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.z));
R125i.w = floatBitsToInt(tempResultf);
// 10
backupReg0i = R124i.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(PV1iw)));
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R125i.w)));
PV0iz = floatBitsToInt(intBitsToFloat(backupReg0i) + -(intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(intBitsToFloat(R126i.z) + -(intBitsToFloat(PV1ix)));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w),intBitsToFloat(R124i.w)) + intBitsToFloat(PV1iz));
// 11
backupReg0i = R124i.y;
R125i.x = PV0iz;
R124i.y = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(R124i.x)));
R126i.z = PV0iw;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R126i.x)) + intBitsToFloat(R122i.x));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R125i.w)));
// 12
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R124i.y),intBitsToFloat(R126i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[2].x),intBitsToFloat(uf_remappedVS[2].y),intBitsToFloat(uf_remappedVS[2].z),intBitsToFloat(uf_remappedVS[2].w))));
PV0iy = R127i.x;
PV0iz = R127i.x;
PV0iw = R127i.x;
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R125i.w)));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R124i.y),intBitsToFloat(R126i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),intBitsToFloat(uf_remappedVS[3].w))));
PV1ix = tempi.x;
R125i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R4i.w = R124i.x;
R4i.w = floatBitsToInt(intBitsToFloat(R4i.w) / 2.0);
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R124i.y),intBitsToFloat(R126i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[4].x),intBitsToFloat(uf_remappedVS[4].y),intBitsToFloat(uf_remappedVS[4].z),intBitsToFloat(uf_remappedVS[4].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R126i.z = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(R127i.w));
R127i.w = floatBitsToInt(tempResultf);
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(PV0ix),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[5].x),intBitsToFloat(uf_remappedVS[5].y),intBitsToFloat(uf_remappedVS[5].z),intBitsToFloat(uf_remappedVS[5].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R127i.w)));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[6].y),intBitsToFloat(uf_remappedVS[6].z),intBitsToFloat(uf_remappedVS[6].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R10i.x = PV1ix;
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R10i.y = PV0ix;
// 18
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R127i.w)));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R127i.w)));
R10i.z = PV1ix;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(uf_remappedVS[6].z)));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(uf_remappedVS[5].z)));
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w))));
PV1ix = tempi.x;
R2i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 20
R2i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w))));
PV0iy = R2i.x;
PV0iz = R2i.x;
PV0iw = R2i.x;
R3i.z = floatBitsToInt(-(intBitsToFloat(PV1ix)));
// 21
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R2i.z = tempi.x;
PV1iw = tempi.x;
// 22
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R2i.w = tempi.x;
R5i.z = PV1ix;
// 23
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.y),intBitsToFloat(R4i.y),intBitsToFloat(R127i.x),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[5].x),intBitsToFloat(uf_remappedVS[5].y),1.0,0.0)));
PV1ix = tempi.x;
R11i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(uf_remappedVS[6].y)) + intBitsToFloat(R127i.w));
// export
SET_POSITION(vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w)));
// export
passParameterSem8 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w));
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.y),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R10i.x = R11i.y;
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(uf_remappedVS[6].x)) + intBitsToFloat(R9i.x));
R5i.y = floatBitsToInt(intBitsToFloat(R3i.z) + intBitsToFloat(R2i.w));
R5i.y = floatBitsToInt(intBitsToFloat(R5i.y) / 2.0);
R10i.z = PV0ix;
R5i.w = R2i.w;
R5i.x = floatBitsToInt(intBitsToFloat(R2i.x) + intBitsToFloat(R2i.w));
R5i.x = floatBitsToInt(intBitsToFloat(R5i.x) / 2.0);
// 2
R12i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R9i.y),intBitsToFloat(R3i.x),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[5].x),intBitsToFloat(uf_remappedVS[5].y),intBitsToFloat(uf_remappedVS[5].z),0.0)));
PV0iy = R12i.x;
PV0iz = R12i.x;
PV0iw = R12i.x;
R10i.y = R123i.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R9i.y),intBitsToFloat(R3i.x),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[6].y),intBitsToFloat(uf_remappedVS[6].z),0.0)));
PV1ix = tempi.x;
R12i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R9i.y),intBitsToFloat(R3i.x),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R12i.z = tempi.x;
PV0iw = tempi.x;
// 5
R11i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].y), intBitsToFloat(R4i.w)));
// export
passParameterSem6 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
// export
passParameterSem9 = vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.z), intBitsToFloat(R5i.w));
// export
// skipped export to semanticId 255
// export
passParameterSem5 = vec4(intBitsToFloat(R10i.x), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.w));
}
