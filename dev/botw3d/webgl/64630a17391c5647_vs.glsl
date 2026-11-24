#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 64630a17391c5647
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


ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem4;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem6;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem8;

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
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem4.xyzw)/255.0));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyzw = attrDataSem6.xyzw;
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xy = uvec2(floatBitsToUint(vec2(attrDataSem8.xy)/255.0));
attrDecoder.zw = uvec2(uvec2(0));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), 0, 0x3f800000);
// 0
R15i.x = 0x3f800000;
R15i.y = 0x3f800000;
R3i.w = 0x3f800000;
R0i.z = R1i.x * 0x3;
// 1
backupReg0i = R0i.z;
R0i.x = backupReg0i + 0x2;
R0i.y = backupReg0i + int(1);
R0i.w = R1i.y * 0x3;
// 2
R5i.y = R0i.w + 0x2;
R4i.z = R0i.w + int(1);
R5i.x = R1i.z * 0x3;
// 3
backupReg0i = R1i.w;
R1i.z = R5i.x + 0x2;
R1i.w = R5i.x + int(1);
R1i.y = backupReg0i * 0x3;
R6i.xyzw = floatBitsToInt(uf_blockVS2[R0i.z].xyzw);
R8i.xyzw = floatBitsToInt(uf_blockVS2[R0i.y].xyzw);
R10i.xyzw = floatBitsToInt(uf_blockVS2[R0i.x].xyzw);
R0i.xyzw = floatBitsToInt(uf_blockVS2[R0i.w].xyzw);
R7i.xyzw = floatBitsToInt(uf_blockVS2[R4i.z].xyzw);
R9i.xyzw = floatBitsToInt(uf_blockVS2[R5i.y].xyzw);
R11i.xyzw = floatBitsToInt(uf_blockVS2[R5i.x].xyzw);
R12i.xyzw = floatBitsToInt(uf_blockVS2[R1i.w].xyzw);
R13i.xyzw = floatBitsToInt(uf_blockVS2[R1i.z].xyzw);
// 0
R5i.x = R1i.y + int(1);
R1i.w = R1i.y + 0x2;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
R14i.xyzw = floatBitsToInt(uf_blockVS2[R1i.y].xyzw);
R5i.xyzw = floatBitsToInt(uf_blockVS2[R5i.x].xyzw);
R1i.xyzw = floatBitsToInt(uf_blockVS2[R1i.w].xyzw);
// export
passParameterSem0 = vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.x), intBitsToFloat(R4i.y));
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.z),intBitsToFloat(R6i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R0i.z)));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z),intBitsToFloat(R7i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV0ix)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z),intBitsToFloat(R8i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV1ix)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(R9i.z),intBitsToFloat(R9i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV0ix)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R10i.x),intBitsToFloat(R10i.y),intBitsToFloat(R10i.z),intBitsToFloat(R10i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV1ix)));
// 5
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R11i.x),intBitsToFloat(R11i.y),intBitsToFloat(R11i.z),intBitsToFloat(R11i.w))));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PV0ix)));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R12i.x),intBitsToFloat(R12i.y),intBitsToFloat(R12i.z),intBitsToFloat(R12i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R127i.z = tempi.x;
PV0iw = tempi.x;
R126i.z = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(R127i.w));
// 7
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R13i.x),intBitsToFloat(R13i.y),intBitsToFloat(R13i.z),intBitsToFloat(R13i.w))));
PV1iy = R126i.x;
PV1iz = R126i.x;
PV1iw = R126i.x;
R125i.x = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(R126i.y));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R14i.x),intBitsToFloat(R14i.y),intBitsToFloat(R14i.z),intBitsToFloat(R14i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R124i.z = tempi.x;
PV0iw = tempi.x;
R125i.z = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(R125i.w));
// 9
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R5i.w))));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(backupReg0i)));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R1i.z = tempi.x;
PV0iw = tempi.x;
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R126i.x)));
// 11
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(R126i.z));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R127i.z)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(backupReg0i)));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R124i.z)));
PV0iy = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(R125i.z));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R1i.z)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R125i.x));
// 13
R127i.x = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R127i.x));
R125i.y = floatBitsToInt(intBitsToFloat(R125i.w) + intBitsToFloat(PV0iw));
R125i.z = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0iy));
// 14
R125i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R125i.z),intBitsToFloat(R15i.x)),vec4(uf_blockVS1[0].x,uf_blockVS1[0].y,uf_blockVS1[0].z,uf_blockVS1[0].w)));
PV0iy = R125i.x;
PV0iz = R125i.x;
PV0iw = R125i.x;
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R125i.z),intBitsToFloat(R15i.x)),vec4(uf_blockVS1[1].x,uf_blockVS1[1].y,uf_blockVS1[1].z,uf_blockVS1[1].w)));
PV1ix = tempi.x;
R126i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),intBitsToFloat(R125i.z),intBitsToFloat(R15i.x)),vec4(uf_blockVS1[2].x,uf_blockVS1[2].y,uf_blockVS1[2].z,uf_blockVS1[2].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R125i.z = tempi.x;
PV0iw = tempi.x;
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.y),intBitsToFloat(PV0ix),intBitsToFloat(R15i.y)),vec4(uf_blockVS1[8].x,uf_blockVS1[8].y,uf_blockVS1[8].z,uf_blockVS1[8].w)));
PV1ix = tempi.x;
R1i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 18
R1i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),intBitsToFloat(R15i.y)),vec4(uf_blockVS1[7].x,uf_blockVS1[7].y,uf_blockVS1[7].z,uf_blockVS1[7].w)));
PV0iy = R1i.x;
PV0iz = R1i.x;
PV0iw = R1i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(PV1ix)));
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),intBitsToFloat(R15i.y)),vec4(uf_blockVS1[9].x,uf_blockVS1[9].y,uf_blockVS1[9].z,uf_blockVS1[9].w)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R1i.z = tempi.x;
PV1iw = tempi.x;
// 20
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R126i.y),intBitsToFloat(R125i.z),intBitsToFloat(R15i.y)),vec4(uf_blockVS1[10].x,uf_blockVS1[10].y,uf_blockVS1[10].z,uf_blockVS1[10].w)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R1i.w = tempi.x;
R15i.z = PV1ix;
// 21
R15i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(PV0ix));
R15i.x = floatBitsToInt(intBitsToFloat(R15i.x) / 2.0);
R15i.y = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV0ix));
R15i.y = floatBitsToInt(intBitsToFloat(R15i.y) / 2.0);
R15i.w = PV0ix;
// export
SET_POSITION(vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w)));
// export
// skipped export to semanticId 255
}
