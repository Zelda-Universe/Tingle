#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader ccdba0e390064149
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[14];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem2;

out vec4 passParameterSem1;
out vec4 passParameterSem0;
out vec4 passParameterSem2;
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
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem0.xyzw)/255.0));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem1.xyzw)/255.0));
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder.xyzw = attrDataSem2.xyzw;
if( (attrDecoder.x&0x80u) != 0u ) attrDecoder.x |= 0xFFFFFF00u;
if( (attrDecoder.y&0x80u) != 0u ) attrDecoder.y |= 0xFFFFFF00u;
if( (attrDecoder.z&0x80u) != 0u ) attrDecoder.z |= 0xFFFFFF00u;
if( (attrDecoder.w&0x80u) != 0u ) attrDecoder.w |= 0xFFFFFF00u;
attrDecoder.x = uint(floatBitsToUint(max(float(int(attrDecoder.x))/127.0,-1.0)));
attrDecoder.y = uint(floatBitsToUint(max(float(int(attrDecoder.y))/127.0,-1.0)));
attrDecoder.z = uint(floatBitsToUint(max(float(int(attrDecoder.z))/127.0,-1.0)));
attrDecoder.w = uint(floatBitsToUint(max(float(int(attrDecoder.w))/127.0,-1.0)));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(uf_remappedVS[0].z)));
PV0iy = R2i.x;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(uf_remappedVS[1].y)));
PV0iw = R2i.y;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(uf_remappedVS[1].x)));
// 1
R4i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[2].x) * intBitsToFloat(0x3e19999a));
R127i.y = floatBitsToInt(intBitsToFloat(PV0iw) + -(0.5));
R125i.z = floatBitsToInt(intBitsToFloat(PV0iy) + -(0.5));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + 1.0);
R4i.w = 0x3f800000;
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R126i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R127i.z)));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(uf_remappedVS[0].y)));
R5i.w = 0x3f800000;
R5i.y = ((0.0 >= intBitsToFloat(R3i.y))?-1:0);
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3eaaaaab));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].z), intBitsToFloat(PV0ix)));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(PV0ix)));
R3i.w = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(uf_remappedVS[0].x));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R3i.x)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R3i.z)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
R126i.y = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(intBitsToFloat(R3i.y) * intBitsToFloat(0x3fcf1aa0));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV0iz));
PV1iy = floatBitsToInt(intBitsToFloat(R125i.z) + intBitsToFloat(PV0iw));
R125i.z = floatBitsToInt(intBitsToFloat(R1i.w) + intBitsToFloat(PV0ix));
R7i.w = floatBitsToInt(intBitsToFloat(PS0i) + 0.5);
R7i.w = clampFI32(R7i.w);
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(uf_remappedVS[3].x)) + intBitsToFloat(uf_remappedVS[4].x));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(uf_remappedVS[5].y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(uf_remappedVS[6].x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(uf_remappedVS[6].y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(uf_remappedVS[5].x)));
R2i.z = R126i.y;
// 7
R2i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].z) + intBitsToFloat(PV0iw));
R2i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].w) + intBitsToFloat(PV0ix));
R4i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].z) + intBitsToFloat(PV0iy));
R0i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].w) + intBitsToFloat(PV0iz));
R2i.w = R125i.z;
R0i.xyz = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y))).xyz);
// export
passParameterSem1 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.x), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
// 0
PV0ix = R0i.y;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
PV0iy = R0i.x;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
PV0iz = floatBitsToInt(intBitsToFloat(R0i.z) * 800.0);
R125i.w = R4i.z;
R126i.z = R0i.w;
// 1
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(R5i.z));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + -(1.0));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + -(1.0));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(uf_remappedVS[3].y)) + intBitsToFloat(uf_remappedVS[4].y));
// 2
R126i.x = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R4i.y));
PV0iy = PV1iw;
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(PV1iz)));
PS0i = PV1iz;
// 3
PV1ix = floatBitsToInt(-(intBitsToFloat(R3i.z)) + intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0iz));
PV1iy = clampFI32(PV1iy);
PV1iz = floatBitsToInt(-(intBitsToFloat(R3i.x)) + intBitsToFloat(PV0iy));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(uf_remappedVS[3].z)) + intBitsToFloat(uf_remappedVS[4].z));
// 4
PV0ix = floatBitsToInt(-(intBitsToFloat(PV1iy)) + 1.0);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(R6i.z)) + intBitsToFloat(R3i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(R6i.z)) + intBitsToFloat(R3i.x));
// 5
R127i.x = ((R5i.y == 0)?(R123i.w):(R3i.x));
R127i.z = ((R5i.y == 0)?(R123i.y):(R3i.z));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) * 5.0);
PV0iy = floatBitsToInt(-(intBitsToFloat(R3i.y)) + intBitsToFloat(PS1i));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[7].x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[8].x)));
// 7
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[9].x)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R6i.z)) + intBitsToFloat(R3i.y));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + -3.0);
PV1iw = clampFI32(PV1iw);
// 8
PV0iz = floatBitsToInt(-(intBitsToFloat(PV1iw)) + 1.0);
R126i.w = ((R5i.y == 0)?(R123i.z):(R3i.w));
// 9
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(uf_remappedVS[7].y)) + intBitsToFloat(R125i.z));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) * 10.0);
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(uf_remappedVS[8].y)) + intBitsToFloat(R127i.w));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R126i.x) + -(intBitsToFloat(PV1iy)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(uf_remappedVS[9].y)) + intBitsToFloat(R126i.y));
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(uf_remappedVS[7].z)) + intBitsToFloat(R123i.x));
// 11
R126i.y = floatBitsToInt(intBitsToFloat(PV0ix) + -(intBitsToFloat(R4i.x)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(uf_remappedVS[9].z)) + intBitsToFloat(R123i.w));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(uf_remappedVS[8].z)) + intBitsToFloat(R125i.z));
// 12
R5i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.w),intBitsToFloat(R126i.y),intBitsToFloat(R126i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w))));
PV0iy = R5i.x;
PV0iz = R5i.x;
PV0iw = R5i.x;
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.w),intBitsToFloat(R126i.y),intBitsToFloat(R126i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w))));
PV1ix = tempi.x;
R5i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.w),intBitsToFloat(R126i.y),intBitsToFloat(R126i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R5i.z = tempi.x;
PV0iw = tempi.x;
// 15
R4i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(PV0ix),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w))));
PV1iy = R4i.x;
PV1iz = R4i.x;
PV1iw = R4i.x;
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w))));
PV0ix = tempi.x;
R4i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R4i.z = tempi.x;
PV1iw = tempi.x;
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(R5i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),intBitsToFloat(uf_remappedVS[13].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R4i.w = tempi.x;
// export
SET_POSITION(vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.z), intBitsToFloat(R4i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.y), intBitsToFloat(R7i.z), intBitsToFloat(R7i.w));
// export
passParameterSem2 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.w), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
// export
// skipped export to semanticId 255
}
