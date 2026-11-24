#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader e7bae847390e8d69
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[14];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
TEXTURE_LAYOUT(33, 0, 1) uniform sampler2D textureUnitVS1;
TEXTURE_LAYOUT(34, 0, 2) uniform sampler2D textureUnitVS2;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;

out vec4 passParameterSem2;
out vec4 passParameterSem0;
out vec4 passParameterSem1;
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
attrDecoder.xy = attrDataSem0.xy;
attrDecoder.xy = uvec2((attrDecoder.xy>>24)|((attrDecoder.xy>>8)&0xFF00u)|((attrDecoder.xy<<8)&0xFF0000u)|((attrDecoder.xy<<24)));
attrDecoder.z = uint(0);
attrDecoder.w = uint(0);
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), 0, 0x3f800000);
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[0].y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[1].y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(uf_remappedVS[0].x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(uf_remappedVS[1].x)));
R1i.w = 0x3f800000;
// 1
R0i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].z) + intBitsToFloat(PV0iw));
R0i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(PV0ix));
R0i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].w) + intBitsToFloat(PV0iy));
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].z) + intBitsToFloat(PV0iz));
R5i.w = 0x3f800000;
// 2
R6i.x = R127i.w;
R6i.y = R0i.y;
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(uf_remappedVS[2].x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[2].y)));
R5i.z = 0x4b189680;
// 3
R1i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[2].z) + intBitsToFloat(PV0iz));
R1i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[2].w) + intBitsToFloat(PV0iw));
R1i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[3].x)) * intBitsToFloat(0x3e50e560) + intBitsToFloat(0x3e50e560));
R0i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[3].x)) * intBitsToFloat(0x3dc0b780) + intBitsToFloat(0x3dc0b780));
R5i.x = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x3e851eb8));
R2i.xyzw = floatBitsToInt(texture(textureUnitVS1, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.z))).xyzw);
R4i.xyzw = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y))).xyzw);
R3i.yzw = floatBitsToInt(texture(textureUnitVS2, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.z))).xyz);
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R4i.x)));
R126i.y = floatBitsToInt(intBitsToFloat(R2i.z) * 800.0);
R127i.z = floatBitsToInt(intBitsToFloat(R6i.x) + -(intBitsToFloat(uf_remappedVS[4].x)));
R127i.w = floatBitsToInt(intBitsToFloat(R6i.y) + -(intBitsToFloat(uf_remappedVS[4].z)));
R0i.x = floatBitsToInt(intBitsToFloat(R2i.x) * 2.0 + -(1.0));
// 1
R2i.x = floatBitsToInt(intBitsToFloat(R2i.y) * 2.0 + -(1.0));
PV1iy = floatBitsToInt(intBitsToFloat(R126i.y) + -(intBitsToFloat(uf_remappedVS[4].y)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R0i.x)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + -(1.0));
R125i.z = floatBitsToInt(intBitsToFloat(R4i.z) * 4.0 + -(1.0));
R125i.z = clampFI32(R125i.z);
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.z),intBitsToFloat(PV1iy),intBitsToFloat(R127i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.z),intBitsToFloat(PV1iy),intBitsToFloat(R127i.w),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(R4i.w)) + 1.0);
// 3
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),-(intBitsToFloat(uf_remappedVS[3].x))) + intBitsToFloat(R125i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(R2i.x)) + intBitsToFloat(R126i.z));
R123i.y = clampFI32(R123i.y);
PV1iz = floatBitsToInt(intBitsToFloat(R122i.x) * intBitsToFloat(0x3f51eb85));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[3].x)) * intBitsToFloat(0x3d009d49) + intBitsToFloat(0x3d009d49));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 4
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(PV1iz)));
PV0iy = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)), intBitsToFloat(uf_remappedVS[5].y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(uf_remappedVS[5].w)));
PV0iw = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R126i.w = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(0x3db851ec));
// 5
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3e19999a));
R127i.y = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3d23d70a));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[5].z)) + intBitsToFloat(PV0iz));
R126i.z = clampFI32(R126i.z);
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].x) + intBitsToFloat(PV0iy));
PV1iw = clampFI32(PV1iw);
R2i.w = floatBitsToInt(sqrt(intBitsToFloat(PV0iw)));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R4i.w) + -(1.0));
R125i.y = floatBitsToInt(intBitsToFloat(R3i.z) + -(intBitsToFloat(R1i.z)));
R127i.z = floatBitsToInt(intBitsToFloat(R3i.y) + -(intBitsToFloat(R0i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R126i.x)));
R126i.x = floatBitsToInt(-(intBitsToFloat(R4i.w)) * intBitsToFloat(0x3cac0831) + intBitsToFloat(0x3cac0831));
// 7
backupReg0i = R127i.y;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(PV0iw)));
R127i.y = floatBitsToInt(intBitsToFloat(R3i.w) + -(intBitsToFloat(R127i.w)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PV0ix)) + intBitsToFloat(R127i.x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i),intBitsToFloat(PV0ix)) + intBitsToFloat(backupReg0i));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w),intBitsToFloat(PV0ix)) + intBitsToFloat(R126i.w));
// 8
R123i.x = floatBitsToInt(-(intBitsToFloat(R4i.w)) * intBitsToFloat(0xbda1cac1) + intBitsToFloat(0xbda1cac1));
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3f6147ae));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3fa3d70a));
PV0iz = clampFI32(PV0iz);
R123i.w = floatBitsToInt(-(intBitsToFloat(R4i.w)) * intBitsToFloat(0x3cbc6a7f) + intBitsToFloat(0x3cbc6a7f));
R4i.x = floatBitsToInt(intBitsToFloat(R122i.x) + intBitsToFloat(R126i.x));
// 9
R126i.x = floatBitsToInt(-(intBitsToFloat(PV0iy)) + 1.0);
R126i.x = clampFI32(R126i.x);
R4i.y = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(R123i.w));
R4i.z = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R123i.x));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(uf_remappedVS[6].y)));
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R127i.z)));
// 10
R2i.y = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(PV1iw));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R127i.y)));
R3i.w = ((intBitsToFloat(R126i.x) > intBitsToFloat(0x3ef5c28f))?-1:0);
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R125i.y)));
// 11
R5i.y = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(0x3e851eb8));
R4i.w = R126i.x;
// export
passParameterSem2 = vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.z), intBitsToFloat(R4i.w));
// export
passParameterSem0 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.z), intBitsToFloat(R5i.z));
// 0
R3i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R2i.y),intBitsToFloat(R6i.y),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w))));
PV0iy = R3i.x;
PV0iz = R3i.x;
PV0iw = R3i.x;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[7].x)));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R2i.y),intBitsToFloat(R6i.y),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w))));
PV1ix = tempi.x;
R3i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[8].x)));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R2i.y),intBitsToFloat(R6i.y),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R3i.z = tempi.x;
PV0iw = tempi.x;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[9].x)));
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(PV0ix),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.x = ((R3i.w == 0)?(PV1ix):(PV1ix));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R0i.y = ((R3i.w == 0)?(PV0ix):(PV0ix));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),intBitsToFloat(uf_remappedVS[13].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.z = ((R3i.w == 0)?(PV1ix):(R5i.z));
// 7
R0i.w = ((R3i.w == 0)?(PV0ix):(PV0ix));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(uf_remappedVS[7].y)) + intBitsToFloat(R127i.y));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(uf_remappedVS[8].y)) + intBitsToFloat(R125i.z));
// 9
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(uf_remappedVS[9].y)) + intBitsToFloat(R126i.y));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(uf_remappedVS[7].z)) + intBitsToFloat(backupReg0i));
// 10
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(uf_remappedVS[8].z)) + intBitsToFloat(R127i.w));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(uf_remappedVS[9].z)) + intBitsToFloat(R123i.x));
// export
SET_POSITION(vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w)));
// export
passParameterSem3 = vec4(intBitsToFloat(R2i.w), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
// export
// skipped export to semanticId 255
}
