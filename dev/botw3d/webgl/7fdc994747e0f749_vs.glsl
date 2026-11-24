#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 7fdc994747e0f749
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[13];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
TEXTURE_LAYOUT(33, 0, 1) uniform sampler2D textureUnitVS1;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem8;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem12;

out vec4 passParameterSem2;
out vec4 passParameterSem5;
out vec4 passParameterSem0;
out vec4 passParameterSem7;
out vec4 passParameterSem4;
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
ivec4 R122i = ivec4(0);
ivec4 R123i = ivec4(0);
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
attrDecoder.xy = attrDataSem8.xy;
attrDecoder.xy = uvec2(((attrDecoder.xy>>8)&0xFFu)|((attrDecoder.xy<<8)&0xFF00u));
attrDecoder.z = uint(0);
attrDecoder.w = uint(0);
attrDecoder.xy = uvec2(floatBitsToUint(unpackHalf2x16(attrDecoder.x|(attrDecoder.y<<16))));
attrDecoder.zw = uvec2(uvec2(0));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), 0, 0x3f800000);
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem12.xyzw)/255.0));
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
// 0
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) * intBitsToFloat(0x3ed413cd));
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].w) * intBitsToFloat(0x43c9d6c7));
R7i.z = floatBitsToInt(-(intBitsToFloat(R1i.w)) + 1.0);
R4i.w = 0x3f800000;
R8i.w = 0x3f800000;
// 1
PV1ix = R7i.z;
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) / 2.0);
R0i.y = uf_remappedVS[1].x;
R0i.z = uf_remappedVS[1].x;
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].x) + intBitsToFloat(PV0ix));
R7i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].x) + -(0.5));
R7i.y = clampFI32(R7i.y);
// 2
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].w) + intBitsToFloat(PV1ix));
R5i.y = 0;
R126i.z = floatBitsToInt(fract(intBitsToFloat(PV1iw)));
R9i.w = 0x3f800000;
R5i.x = 0x3d2aaaab;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(uf_remappedVS[0].x),intBitsToFloat(uf_remappedVS[0].y),intBitsToFloat(uf_remappedVS[0].z),intBitsToFloat(uf_remappedVS[0].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R8i.z = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0x3e65a5dd));
// 4
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(uf_remappedVS[2].y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(uf_remappedVS[1].y)));
R127i.z = floatBitsToInt(intBitsToFloat(PS1i) + intBitsToFloat(R127i.y));
R127i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * 100.0);
R6i.x = 0x3e000000;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),intBitsToFloat(uf_remappedVS[3].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R7i.w = tempi.x;
R127i.y = floatBitsToInt(-(intBitsToFloat(PV0iy)) + intBitsToFloat(R127i.z));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].w) + intBitsToFloat(R126i.z));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(R127i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(uf_remappedVS[1].z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(uf_remappedVS[2].z)));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x40490e56));
// 7
PV1ix = floatBitsToInt(-(intBitsToFloat(PV0iz)) + intBitsToFloat(R127i.y));
R127i.y = floatBitsToInt(intBitsToFloat(PV0ix) * 3.0);
PV1iz = floatBitsToInt(-(intBitsToFloat(PV0iw)) + intBitsToFloat(PV0iy));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.z) * 5.0);
R127i.x = floatBitsToInt(intBitsToFloat(R127i.z) * 3.0);
// 8
R0i.x = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3cb6a401));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R127i.y)));
PV0iz = floatBitsToInt(intBitsToFloat(R127i.z) * 7.0);
R0i.w = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3cb6a401));
R122i.x = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
// 9
R123i.x = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e22f983) + 0.5);
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(0x431d1463));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) + -(0.5));
R123i.w = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0x3e22f983) + 0.5);
PS1i = floatBitsToInt(fract(intBitsToFloat(R122i.x)));
// 10
PV0ix = R127i.y;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 4.0);
PV0iy = floatBitsToInt(max(intBitsToFloat(PV1iz), -(intBitsToFloat(PV1iz))));
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV0iw = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
R127i.w = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.z = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e22f983) + 0.5);
R127i.y = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 12
R127i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV0iz = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x3e22f983));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].x), intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
// 13
R126i.x = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(0x3e22f983));
R123i.y = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iz = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
R123i.w = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.y = floatBitsToInt(sin((intBitsToFloat(PV0iz))/0.1591549367));
// 14
R7i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(min(intBitsToFloat(R127i.w), intBitsToFloat(PV1iz)));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
PV0iy = clampFI32(PV0iy);
R6i.z = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(0xbe99999a));
PV0iw = clampFI32(PV0iw);
PS0i = floatBitsToInt(sin((intBitsToFloat(R127i.x))/0.1591549367));
// 15
R8i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3ca3d70a));
R6i.y = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3d6a0fd3));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R6i.w = 0;
R2i.w = floatBitsToInt(sin((intBitsToFloat(R126i.x))/0.1591549367));
R3i.w = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R0i.z = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R0i.w),intBitsToFloat(R0i.z))).x);
R5i.w = floatBitsToInt(texture(textureUnitVS1, vec2(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y))).x);
R5i.xyz = floatBitsToInt(texture(textureUnitVS1, vec2(intBitsToFloat(R6i.x),intBitsToFloat(R6i.w))).xyz);
// export
passParameterSem2 = vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.z), intBitsToFloat(R5i.w));
// export
passParameterSem5 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
// export
passParameterSem0 = vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.x), intBitsToFloat(R4i.y));
// 0
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(uf_remappedVS[4].x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R4i.z)));
PS0i = floatBitsToInt(sin((intBitsToFloat(R7i.x))/0.1591549367));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3d4ccccd));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(sin((intBitsToFloat(R6i.z))/0.1591549367));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PV1ix)));
// 3
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0ix));
// 4
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R0i.z));
PV0iy = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV1iz));
R127i.w = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R3i.w));
// 5
R127i.x = floatBitsToInt(intBitsToFloat(PV0iy) * 20.0);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].y), intBitsToFloat(R126i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].y), intBitsToFloat(R127i.w)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R127i.w)) + intBitsToFloat(R126i.x));
// 6
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.z)) + intBitsToFloat(PV1iy));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(uf_remappedVS[2].x)) + intBitsToFloat(R127i.w));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].z), intBitsToFloat(R127i.w)));
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(uf_remappedVS[2].x)) + intBitsToFloat(R127i.z));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].z), intBitsToFloat(R126i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(R127i.x)));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R127i.w)));
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.w)) + intBitsToFloat(PV1iz));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R123i.x)));
// 9
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(uf_remappedVS[2].x)) + intBitsToFloat(R126i.w));
R7i.y = PV0iz;
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0ix)));
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R123i.x)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e23d70a));
// 11
R8i.x = PV0ix;
PV1iz = floatBitsToInt(max(intBitsToFloat(PV0iy), 0.0));
// 12
R6i.y = floatBitsToInt(-(intBitsToFloat(PV1iz)));
// 0
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[0].x),intBitsToFloat(uf_remappedVS[0].y),intBitsToFloat(uf_remappedVS[0].z),0.0)));
PV0iy = R127i.x;
PV0iz = R127i.x;
PV0iw = R127i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[5].x),intBitsToFloat(uf_remappedVS[5].y),intBitsToFloat(uf_remappedVS[5].z),0.0)));
PV1ix = tempi.x;
R127i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R127i.z = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV0ix),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV0ix),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(uf_remappedVS[5].x),intBitsToFloat(uf_remappedVS[5].y),intBitsToFloat(uf_remappedVS[5].z),intBitsToFloat(uf_remappedVS[5].w))));
PV0ix = tempi.x;
R126i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 5
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
// 6
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R7i.y),intBitsToFloat(R6i.y),intBitsToFloat(R8i.x),0.0)));
PV0iy = R127i.x;
PV0iz = R127i.x;
PV0iw = R127i.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(uf_remappedVS[6].z)));
// 7
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(uf_remappedVS[6].y)) + intBitsToFloat(PS0i));
PV1iw = ((0.0 > intBitsToFloat(R127i.x))?-1:0);
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(uf_remappedVS[7].z)));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(uf_remappedVS[6].x)) + intBitsToFloat(R123i.x));
R123i.z = ((PV1iw == 0)?(0):(R127i.x));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(uf_remappedVS[7].y)) + intBitsToFloat(PS1i));
// 9
backupReg0i = R123i.z;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(backupReg0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(backupReg0i)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(uf_remappedVS[7].x)) + intBitsToFloat(R122i.x));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(backupReg0i)));
R3i.x = R123i.x;
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(uf_remappedVS[8].z)));
PV0iy = floatBitsToInt(intBitsToFloat(R6i.y) + -(intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(intBitsToFloat(R7i.y) + -(intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(intBitsToFloat(R8i.x) + -(intBitsToFloat(PV1iw)));
R3i.y = R123i.z;
// 11
backupReg0i = R127i.y;
R127i.x = floatBitsToInt(intBitsToFloat(R8i.z) + intBitsToFloat(PV0iz));
R127i.y = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV0iy));
R127i.z = floatBitsToInt(intBitsToFloat(R7i.w) + intBitsToFloat(PV0iw));
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(uf_remappedVS[8].y)) + intBitsToFloat(PV0ix));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R8i.w)),vec4(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[6].y),intBitsToFloat(uf_remappedVS[6].z),intBitsToFloat(uf_remappedVS[6].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R8i.w)),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R6i.x = PV0ix;
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R8i.w)),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R6i.y = PV1ix;
// 15
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(uf_remappedVS[8].x)) + intBitsToFloat(R125i.x));
R6i.z = PV0ix;
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z),intBitsToFloat(R9i.w)),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w))));
PV0ix = tempi.x;
R8i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R3i.z = R123i.y;
// 17
R8i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z),intBitsToFloat(R9i.w)),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w))));
PV1iy = R8i.x;
PV1iz = R8i.x;
PV1iw = R8i.x;
R127i.z = floatBitsToInt(-(intBitsToFloat(PV0ix)));
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z),intBitsToFloat(R9i.w)),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R8i.z = tempi.x;
PV0iw = tempi.x;
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z),intBitsToFloat(R9i.w)),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R8i.w = tempi.x;
R9i.z = PV0ix;
// 20
R9i.x = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(PV1ix));
R9i.x = floatBitsToInt(intBitsToFloat(R9i.x) / 2.0);
R9i.y = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1ix));
R9i.y = floatBitsToInt(intBitsToFloat(R9i.y) / 2.0);
R9i.w = PV1ix;
// export
SET_POSITION(vec4(intBitsToFloat(R8i.x), intBitsToFloat(R8i.y), intBitsToFloat(R8i.z), intBitsToFloat(R8i.w)));
// export
passParameterSem7 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
// export
passParameterSem6 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.z), intBitsToFloat(R6i.w));
}
