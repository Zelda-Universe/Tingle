#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader ab8a58d8240ef04a
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
UNIFORM_BUFFER_LAYOUT(1, 0, 0) uniform uniformBlockVS1
{
vec4 uf_blockVS1[11];
};


UNIFORM_BUFFER_LAYOUT(2, 0, 1) uniform uniformBlockVS2
{
vec4 uf_blockVS2[4096];
};


UNIFORM_BUFFER_LAYOUT(8, 0, 2) uniform uniformBlockVS8
{
vec4 uf_blockVS8[13];
};


ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem2;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem4;
ATTR_LAYOUT(0, 4) in uvec4 attrDataSem6;
ATTR_LAYOUT(0, 5) in uvec4 attrDataSem8;

out vec4 passParameterSem7;
out vec4 passParameterSem0;
out vec4 passParameterSem4;
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
attrDecoder.xyzw = attrDataSem2.xyzw;
if( (attrDecoder.x&0x80u) != 0u ) attrDecoder.x |= 0xFFFFFF00u;
if( (attrDecoder.y&0x80u) != 0u ) attrDecoder.y |= 0xFFFFFF00u;
if( (attrDecoder.z&0x80u) != 0u ) attrDecoder.z |= 0xFFFFFF00u;
if( (attrDecoder.w&0x80u) != 0u ) attrDecoder.w |= 0xFFFFFF00u;
attrDecoder.x = uint(floatBitsToUint(max(float(int(attrDecoder.x))/127.0,-1.0)));
attrDecoder.y = uint(floatBitsToUint(max(float(int(attrDecoder.y))/127.0,-1.0)));
attrDecoder.z = uint(floatBitsToUint(max(float(int(attrDecoder.z))/127.0,-1.0)));
attrDecoder.w = uint(floatBitsToUint(max(float(int(attrDecoder.w))/127.0,-1.0)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xy = attrDataSem8.xy;
attrDecoder.xy = uvec2(((attrDecoder.xy>>8)&0xFFu)|((attrDecoder.xy<<8)&0xFF00u));
attrDecoder.z = uint(0);
attrDecoder.w = uint(0);
attrDecoder.xy = uvec2(floatBitsToUint(vec2(float(attrDecoder.x), float(attrDecoder.y))/65535.0));
attrDecoder.zw = uvec2(uvec2(0));
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), 0, 0x3f800000);
attrDecoder.xy = uvec2(floatBitsToUint(vec2(attrDataSem4.xy)/255.0));
attrDecoder.zw = uvec2(uvec2(0));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), 0, 0x3f800000);
attrDecoder.xyzw = uvec4(uvec4(attrDataSem6.xy,0,0));
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), 0, 1);
// 0
R9i.x = 0x3f800000;
R0i.y = 0x3f800000;
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),uf_blockVS8[11].x) + uf_blockVS8[12].x);
R2i.w = 0x3f800000;
R0i.x = R1i.x * 0x3;
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),uf_blockVS8[11].z) + intBitsToFloat(R123i.z));
R0i.z = R0i.x + 0x2;
R0i.w = R0i.x + int(1);
R1i.y = R1i.y * 0x3;
// 2
backupReg0i = R1i.y;
R1i.x = backupReg0i + int(1);
R9i.y = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3f333333));
R9i.z = R123i.x;
R1i.w = backupReg0i + 0x2;
R15i.w = R6i.w;
R10i.xyzw = floatBitsToInt(uf_blockVS2[R0i.x].xyzw);
R11i.xyzw = floatBitsToInt(uf_blockVS2[R0i.w].xyzw);
R12i.xyzw = floatBitsToInt(uf_blockVS2[R0i.z].xyzw);
R13i.xyzw = floatBitsToInt(uf_blockVS2[R1i.y].xyzw);
R14i.xyzw = floatBitsToInt(uf_blockVS2[R1i.x].xyzw);
R1i.xyzw = floatBitsToInt(uf_blockVS2[R1i.w].xyzw);
// export
// skipped export to semanticId 255
// export
passParameterSem7 = vec4(intBitsToFloat(R9i.z), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.z));
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R13i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R7i.z = R8i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(R10i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV0ix)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(R14i.z),intBitsToFloat(R14i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV1ix)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV0ix)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV1ix)));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),intBitsToFloat(R12i.z),intBitsToFloat(R12i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV0ix)));
// 6
R127i.x = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(R127i.w));
R127i.y = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(R126i.w));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R10i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV1ix)));
R7i.w = R8i.y;
// 7
backupReg0i = R125i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R10i.y)) + intBitsToFloat(PV0iz));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R12i.z)));
R127i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(PV0iw));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R13i.x)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R11i.z)));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R9i.x)),vec4(uf_blockVS1[0].x,uf_blockVS1[0].y,uf_blockVS1[0].z,uf_blockVS1[0].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R11i.y)) + intBitsToFloat(PS1i));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R9i.x)),vec4(uf_blockVS1[1].x,uf_blockVS1[1].y,uf_blockVS1[1].z,uf_blockVS1[1].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R8i.x = PV0ix;
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R9i.x)),vec4(uf_blockVS1[2].x,uf_blockVS1[2].y,uf_blockVS1[2].z,uf_blockVS1[2].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R8i.y = PV1ix;
// 11
backupReg0i = R125i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R10i.x)) + intBitsToFloat(R126i.x));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(R13i.z)) + intBitsToFloat(R127i.w));
R8i.z = PV0ix;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R12i.y)) + intBitsToFloat(backupReg0i));
// 12
R9i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R0i.y)),vec4(uf_blockVS1[7].x,uf_blockVS1[7].y,uf_blockVS1[7].z,uf_blockVS1[7].w)));
PV0iy = R9i.x;
PV0iz = R9i.x;
PV0iw = R9i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R12i.x)) + intBitsToFloat(R122i.x));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R0i.y)),vec4(uf_blockVS1[8].x,uf_blockVS1[8].y,uf_blockVS1[8].z,uf_blockVS1[8].w)));
PV1ix = tempi.x;
R9i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R126i.x)));
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R0i.y)),vec4(uf_blockVS1[9].x,uf_blockVS1[9].y,uf_blockVS1[9].z,uf_blockVS1[9].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R9i.z = tempi.x;
PV0iw = tempi.x;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R127i.x)));
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R0i.y)),vec4(uf_blockVS1[10].x,uf_blockVS1[10].y,uf_blockVS1[10].z,uf_blockVS1[10].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R9i.w = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R14i.z)));
// 16
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R13i.y)) + intBitsToFloat(R125i.y));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R1i.z)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R11i.x)) + intBitsToFloat(backupReg0i));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R1i.z)));
// 17
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(backupReg0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),1.0,0.0)));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(R1i.y)) + intBitsToFloat(PS0i));
// 18
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R1i.y)) + intBitsToFloat(R125i.y));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(R1i.x)) + intBitsToFloat(R122i.x));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R127i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R11i.z)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R10i.z)));
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),1.0,0.0)));
PV1ix = tempi.x;
R126i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R11i.y)) + intBitsToFloat(PV0iw));
// 20
backupReg0i = R11i.x;
R11i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R125i.x)) + intBitsToFloat(R127i.y));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R125i.y)) + intBitsToFloat(R126i.w));
R11i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(backupReg0i)) + intBitsToFloat(R122i.x));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R13i.z)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R12i.z)));
// 21
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R12i.w = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R13i.y)) + intBitsToFloat(PV0iw));
// 22
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R14i.z)));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R127i.x)) + intBitsToFloat(R127i.z));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R13i.x)) + intBitsToFloat(R122i.x));
// 23
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(PV0ix),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R14i.w = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R126i.y)));
// 24
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R1i.x)) + intBitsToFloat(R126i.x));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R127i.z)) + intBitsToFloat(PS1i));
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(R11i.y)));
// export
SET_POSITION(vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.y), intBitsToFloat(R7i.z), intBitsToFloat(R7i.w));
// export
// skipped export to semanticId 255
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y),intBitsToFloat(R13i.y)) + intBitsToFloat(R1i.x));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R11i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R12i.w)));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x),intBitsToFloat(R11i.x)) + intBitsToFloat(R123i.x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R14i.w)) + intBitsToFloat(PV0iy));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R6i.x)) + intBitsToFloat(PV0iw));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.y),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.y),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.x));
PS0i = floatBitsToInt(tempResultf);
// 3
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.y), intBitsToFloat(PS0i)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(PS0i)));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 4
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PS1i)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS1i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), uf_blockVS1[1].z));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), uf_blockVS1[0].z));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[0].x,uf_blockVS1[0].y,1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),uf_blockVS1[1].y) + intBitsToFloat(PV0iw));
// 6
backupReg0i = R126i.z;
R1i.x = PV1ix;
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), uf_blockVS1[1].y));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),uf_blockVS1[1].x) + intBitsToFloat(R122i.x));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), uf_blockVS1[2].z));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), uf_blockVS1[2].z));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[2].x,uf_blockVS1[2].y,1.0,0.0)));
PV1ix = tempi.x;
R127i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),uf_blockVS1[1].z) + intBitsToFloat(PV0iy));
// 8
R15i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[0].x,uf_blockVS1[0].y,uf_blockVS1[0].z,0.0)));
PV0iy = R15i.x;
PV0iz = R15i.x;
PV0iw = R15i.x;
R1i.y = R126i.z;
// 9
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),uf_blockVS1[2].y) + intBitsToFloat(R126i.w));
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),uf_blockVS1[1].x) + intBitsToFloat(R126i.x));
R1i.z = R127i.y;
// 10
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),uf_blockVS1[2].x) + intBitsToFloat(R123i.x));
// export
passParameterSem4 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
}
