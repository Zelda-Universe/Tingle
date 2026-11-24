#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader d4d90e8ab191cde2
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

out vec4 passParameterSem0;
out vec4 passParameterSem7;
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
attrDecoder.xy = uvec2(floatBitsToUint(vec2(float(attrDecoder.x), float(attrDecoder.y))/65535.0));
attrDecoder.zw = uvec2(uvec2(0));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), 0, 0x3f800000);
attrDecoder.xy = uvec2(floatBitsToUint(vec2(attrDataSem4.xy)/255.0));
attrDecoder.zw = uvec2(uvec2(0));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), 0, 0x3f800000);
attrDecoder.xyzw = uvec4(uvec4(attrDataSem6.xy,0,0));
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), 0, 1);
// 0
R8i.x = 0x3f800000;
R7i.y = 0x3f800000;
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),uf_blockVS8[11].x) + uf_blockVS8[12].x);
R2i.w = 0x3f800000;
R0i.z = R1i.x * 0x3;
// 1
backupReg0i = R1i.y;
R7i.x = floatBitsToInt(1.0);
R1i.y = R0i.z + 0x2;
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),uf_blockVS8[11].z) + intBitsToFloat(R123i.z));
R0i.w = R0i.z + int(1);
R1i.x = backupReg0i * 0x3;
// 2
R0i.x = R123i.z;
R0i.y = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3f333333));
R1i.z = R1i.x + int(1);
R1i.w = R1i.x + 0x2;
R14i.w = R5i.w;
R9i.xyzw = floatBitsToInt(uf_blockVS2[R0i.z].xyzw);
R10i.xyzw = floatBitsToInt(uf_blockVS2[R0i.w].xyzw);
R11i.xyzw = floatBitsToInt(uf_blockVS2[R1i.y].xyzw);
R13i.xyzw = floatBitsToInt(uf_blockVS2[R1i.x].xyzw);
R12i.xyzw = floatBitsToInt(uf_blockVS2[R1i.z].xyzw);
R1i.xyzw = floatBitsToInt(uf_blockVS2[R1i.w].xyzw);
// export
passParameterSem0 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.x), intBitsToFloat(R6i.y));
// export
passParameterSem7 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.z));
// export
// skipped export to semanticId 255
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R13i.w))));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R13i.z)));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R9i.z),intBitsToFloat(R9i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R9i.z)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),intBitsToFloat(R12i.z),intBitsToFloat(R12i.w))));
PV0ix = tempi.x;
R126i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV1ix)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(R10i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R10i.z)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w))));
PV0ix = tempi.x;
R125i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV1ix)));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R11i.z)));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R127i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R126i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R12i.z)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV1ix)));
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R11i.x)) + intBitsToFloat(PS1i));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R125i.y)));
R125i.y = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R127i.w));
R126i.z = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(R126i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R1i.z)));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R9i.x)) + intBitsToFloat(R127i.x));
// 8
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R9i.y)) + intBitsToFloat(R122i.x));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R12i.x)) + intBitsToFloat(R127i.z));
R127i.z = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R125i.w));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R9i.z)));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R10i.y)) + intBitsToFloat(backupReg0i));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),intBitsToFloat(R127i.z),intBitsToFloat(R8i.x)),vec4(uf_blockVS1[0].x,uf_blockVS1[0].y,uf_blockVS1[0].z,uf_blockVS1[0].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R10i.x)) + intBitsToFloat(R122i.x));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),intBitsToFloat(R127i.z),intBitsToFloat(R8i.x)),vec4(uf_blockVS1[1].x,uf_blockVS1[1].y,uf_blockVS1[1].z,uf_blockVS1[1].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.x = PV1ix;
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),intBitsToFloat(R127i.z),intBitsToFloat(R8i.x)),vec4(uf_blockVS1[2].x,uf_blockVS1[2].y,uf_blockVS1[2].z,uf_blockVS1[2].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R0i.y = PV0ix;
// 12
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R11i.y)) + intBitsToFloat(R125i.x));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R1i.y)) + intBitsToFloat(R127i.w));
R0i.z = PV1ix;
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R10i.z)));
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R9i.x)) + intBitsToFloat(R125i.w));
// 13
R4i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R7i.y)),vec4(uf_blockVS1[7].x,uf_blockVS1[7].y,uf_blockVS1[7].z,uf_blockVS1[7].w)));
PV1iy = R4i.x;
PV1iz = R4i.x;
PV1iw = R4i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R10i.x)) + intBitsToFloat(PV0iw));
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R7i.y)),vec4(uf_blockVS1[8].x,uf_blockVS1[8].y,uf_blockVS1[8].z,uf_blockVS1[8].w)));
PV0ix = tempi.x;
R4i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R126i.x)));
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R7i.y)),vec4(uf_blockVS1[9].x,uf_blockVS1[9].y,uf_blockVS1[9].z,uf_blockVS1[9].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R4i.z = tempi.x;
PV1iw = tempi.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R127i.y)));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R7i.y)),vec4(uf_blockVS1[10].x,uf_blockVS1[10].y,uf_blockVS1[10].z,uf_blockVS1[10].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R4i.w = tempi.x;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R1i.x)) + intBitsToFloat(R125i.y));
// 17
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R9i.y)) + intBitsToFloat(R125i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R10i.y)) + intBitsToFloat(backupReg0i));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R13i.z)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R11i.z)));
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R127i.w = tempi.x;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R13i.y)) + intBitsToFloat(PV1iz));
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R124i.x),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),1.0,0.0)));
PV1ix = tempi.x;
R125i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R12i.z)));
// 20
backupReg0i = R126i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R127i.x)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R127i.w)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R12i.y)) + intBitsToFloat(backupReg0i));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R8i.x)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R1i.z)));
// 21
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R127i.z = tempi.x;
PV1iw = tempi.x;
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R123i.z)) + intBitsToFloat(R126i.x));
// 22
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R125i.y)) + intBitsToFloat(R125i.w));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R126i.w)) + intBitsToFloat(R127i.w));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R12i.x)) + intBitsToFloat(R124i.x));
// 23
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R1i.z)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R13i.x)) + intBitsToFloat(R125i.x));
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R12i.y)) + intBitsToFloat(R122i.x));
// 24
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R127i.y)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R123i.y)) + intBitsToFloat(R127i.x));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R127i.z)) + intBitsToFloat(R126i.y));
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R1i.x)) + intBitsToFloat(PV1ix));
// export
SET_POSITION(vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.z), intBitsToFloat(R4i.w)));
// export
// skipped export to semanticId 255
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R1i.y)) + intBitsToFloat(R12i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R5i.w)) + intBitsToFloat(R5i.x));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.y),intBitsToFloat(R127i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R5i.y),intBitsToFloat(R127i.y),intBitsToFloat(R5i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.x));
PS1i = floatBitsToInt(tempResultf);
// 2
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PS1i)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PS1i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PS1i)));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 3
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PS0i)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), uf_blockVS1[1].z));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), uf_blockVS1[0].z));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[0].x,uf_blockVS1[0].y,1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),uf_blockVS1[1].y) + intBitsToFloat(PV1iw));
// 5
R5i.x = PV0ix;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),uf_blockVS1[1].x) + intBitsToFloat(R122i.x));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), uf_blockVS1[1].y));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), uf_blockVS1[2].z));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), uf_blockVS1[2].z));
// 6
R125i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[2].x,uf_blockVS1[2].y,1.0,0.0)));
PV0iy = R125i.x;
PV0iz = R125i.x;
PV0iw = R125i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),uf_blockVS1[1].z) + intBitsToFloat(PV1iz));
// 7
R14i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(uf_blockVS1[0].x,uf_blockVS1[0].y,uf_blockVS1[0].z,0.0)));
PV1iy = R14i.x;
PV1iz = R14i.x;
PV1iw = R14i.x;
R5i.y = R127i.y;
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),uf_blockVS1[2].y) + intBitsToFloat(R127i.w));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),uf_blockVS1[1].x) + intBitsToFloat(R127i.x));
R5i.z = R125i.x;
// 9
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x),uf_blockVS1[2].x) + intBitsToFloat(R123i.x));
// export
passParameterSem4 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.z), intBitsToFloat(R5i.w));
}
