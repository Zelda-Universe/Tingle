#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 0bcd653c18367d59
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[5];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;

out vec4 passParameterSem4;
out vec4 passParameterSem0;
out vec4 passParameterSem1;
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
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
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
// 0
PV0ix = (R0i.x == int(1))?-1:0;
R127i.y = 0x3f800000;
PV0iz = 0x3f800000;
PV0iw = 0x40400000;
R127i.z = 0xbf800000;
// 1
R123i.x = ((PV0ix == 0)?(PV0iz):(0xc0400000));
R123i.y = ((PV0ix == 0)?(PV0iw):(0xbf800000));
R0i.z = 0;
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].z) * intBitsToFloat(0x3b808081));
R2i.w = 0x3f800000;
// 2
R2i.x = ((R0i.x == 0)?(R127i.z):(R123i.y));
R2i.y = ((R0i.x == 0)?(R127i.y):(R123i.x));
R2i.z = floatBitsToInt(intBitsToFloat(PV1iw) + -(0.5));
R2i.z = floatBitsToInt(intBitsToFloat(R2i.z) * 2.0);
R0i.w = 0x3d2aaaab;
R0i.x = 0x3e000000;
// 3
R5i.x = floatBitsToInt(intBitsToFloat(R2i.x) * 0.5 + 0.5);
R0i.y = 0;
PV1iz = floatBitsToInt(-(intBitsToFloat(R2i.y)));
R4i.w = uf_remappedVS[1].z;
R4i.w = floatBitsToInt(intBitsToFloat(R4i.w) / 2.0);
R3i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[2].z)));
R3i.x = floatBitsToInt(intBitsToFloat(R3i.x) / 2.0);
// 4
R6i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[3].x)));
R6i.x = floatBitsToInt(intBitsToFloat(R6i.x) * 2.0);
R5i.y = floatBitsToInt(intBitsToFloat(PV1iz) * 0.5 + 0.5);
R7i.z = R5i.x;
R3i.w = R2i.x;
R3i.w = floatBitsToInt(intBitsToFloat(R3i.w) / 2.0);
R6i.y = uf_remappedVS[3].y;
R6i.y = floatBitsToInt(intBitsToFloat(R6i.y) * 2.0);
R1i.w = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R0i.w),intBitsToFloat(R0i.z))).x);
R1i.xyz = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
// export
SET_POSITION(vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w)));
// export
// skipped export to semanticId 255
// 0
R126i.x = floatBitsToInt(intBitsToFloat(R3i.x) + -(0.5));
R125i.y = floatBitsToInt(intBitsToFloat(R4i.w) + -(0.5));
PV0iz = floatBitsToInt(-(intBitsToFloat(R2i.y)));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
R7i.w = R5i.y;
R127i.y = floatBitsToInt(-(intBitsToFloat(R6i.x)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) / 2.0);
// 1
R127i.x = floatBitsToInt(-(intBitsToFloat(R6i.y)));
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) / 2.0);
R126i.y = floatBitsToInt(intBitsToFloat(R3i.w) + intBitsToFloat(R4i.w));
PV1iz = floatBitsToInt(intBitsToFloat(R7i.w) + intBitsToFloat(uf_remappedVS[4].w));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(R3i.x));
R127i.w = floatBitsToInt(intBitsToFloat(R7i.z) + intBitsToFloat(uf_remappedVS[4].z));
// 2
backupReg0i = R127i.y;
R125i.x = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R126i.x));
R127i.y = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(R125i.y));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(PV1iw)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R4i.w)) + intBitsToFloat(backupReg0i));
R125i.w = uf_remappedVS[4].z;
// 3
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[4].w)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R126i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(R3i.x)) + intBitsToFloat(backupReg0i));
R124i.w = uf_remappedVS[4].x;
R124i.w = floatBitsToInt(intBitsToFloat(R124i.w) / 2.0);
R125i.z = uf_remappedVS[4].y;
R125i.z = floatBitsToInt(intBitsToFloat(R125i.z) / 2.0);
// 4
backupReg0i = R126i.x;
backupReg1i = R127i.y;
R126i.x = uf_remappedVS[4].w;
R126i.x = floatBitsToInt(intBitsToFloat(R126i.x) * 2.0);
R127i.y = uf_remappedVS[4].z;
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
R124i.z = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(backupReg0i));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(R125i.y));
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(backupReg1i)));
// 5
backupReg0i = R127i.z;
R2i.x = floatBitsToInt(intBitsToFloat(R125i.w) * 1.5);
R2i.y = floatBitsToInt(intBitsToFloat(R127i.x) * 1.5);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R125i.x)));
R6i.w = backupReg0i;
R6i.z = R126i.w;
// 6
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(R124i.w)) + 0.5);
R3i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y),intBitsToFloat(R125i.z)) + 0.5);
R5i.z = R126i.y;
R5i.w = R126i.z;
R3i.z = R127i.y;
// 7
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R127i.w)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(R124i.z)));
R4i.z = R4i.w;
R3i.w = R126i.x;
R4i.w = R127i.z;
// export
passParameterSem4 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
// export
// skipped export to semanticId 255
// export
passParameterSem0 = vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.z), intBitsToFloat(R5i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.z), intBitsToFloat(R6i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.z));
// export
passParameterSem6 = vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.x), intBitsToFloat(R7i.z), intBitsToFloat(R7i.w));
}
