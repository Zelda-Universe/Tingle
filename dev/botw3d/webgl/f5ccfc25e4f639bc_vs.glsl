#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader f5ccfc25e4f639bc
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[13];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem8;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem12;

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
ivec4 R123i = ivec4(0);
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
attrDecoder.xy = attrDataSem8.xy;
attrDecoder.xy = uvec2(((attrDecoder.xy>>8)&0xFFu)|((attrDecoder.xy<<8)&0xFF00u));
attrDecoder.z = uint(0);
attrDecoder.w = uint(0);
attrDecoder.xy = uvec2(floatBitsToUint(vec2(float(attrDecoder.x), float(attrDecoder.y))/65535.0));
attrDecoder.zw = uvec2(uvec2(0));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), 0, 0x3f800000);
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem12.xyzw)/255.0));
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
// 0
R127i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) * intBitsToFloat(0x43c9d6c7));
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].w) * intBitsToFloat(0x3ed413cd));
R3i.z = floatBitsToInt(-(intBitsToFloat(R1i.w)) + 1.0);
R4i.w = 0x3f800000;
R4i.x = uf_remappedVS[1].z;
// 1
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].x) + intBitsToFloat(PV0iy));
R0i.y = uf_remappedVS[0].x;
R1i.z = uf_remappedVS[0].x;
PV1iw = R3i.z;
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) / 2.0);
R2i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].x) + -(0.5));
R2i.w = clampFI32(R2i.w);
// 2
R5i.x = uf_remappedVS[2].z;
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(PV1iw));
R126i.z = floatBitsToInt(fract(intBitsToFloat(PV1ix)));
R5i.w = 0x3f800000;
R6i.w = 0x3f800000;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(uf_remappedVS[1].x),intBitsToFloat(uf_remappedVS[1].y),intBitsToFloat(uf_remappedVS[1].z),intBitsToFloat(uf_remappedVS[1].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R4i.z = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0x3e65a5dd));
// 4
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(uf_remappedVS[3].y)));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 100.0);
R127i.z = floatBitsToInt(intBitsToFloat(PS1i) + intBitsToFloat(backupReg0i));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(uf_remappedVS[0].y)));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(uf_remappedVS[4].x),intBitsToFloat(uf_remappedVS[4].y),intBitsToFloat(uf_remappedVS[4].z),intBitsToFloat(uf_remappedVS[4].w))));
PV1ix = tempi.x;
R5i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.w = floatBitsToInt(-(intBitsToFloat(PV0iw)) + intBitsToFloat(R127i.z));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(uf_remappedVS[3].z)));
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) + intBitsToFloat(R126i.z));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(uf_remappedVS[0].z)));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(R127i.x)));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(0x40490e56));
// 7
R1i.x = floatBitsToInt(intBitsToFloat(PV0iy) * 3.0);
PV1iy = floatBitsToInt(-(intBitsToFloat(PV0iz)) + intBitsToFloat(R127i.w));
PV1iz = floatBitsToInt(-(intBitsToFloat(PV0ix)) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.z) * 5.0);
R1i.y = floatBitsToInt(intBitsToFloat(R127i.z) * 3.0);
// 8
R0i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3cb6a401));
R4i.y = floatBitsToInt(fract(intBitsToFloat(R1i.x)));
R0i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 7.0);
R1i.w = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3cb6a401));
R0i.w = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
R3i.w = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
R1i.z = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R1i.w),intBitsToFloat(R1i.z))).x);
// export
passParameterSem0 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.x), intBitsToFloat(R3i.y));
// 0
R123i.x = floatBitsToInt(intBitsToFloat(R1i.y) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(R0i.z) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iz = floatBitsToInt(intBitsToFloat(R4i.y) + -(0.5));
R127i.w = floatBitsToInt(intBitsToFloat(R1i.x) * intBitsToFloat(0x431d1463));
PS0i = floatBitsToInt(fract(intBitsToFloat(R0i.w)));
// 1
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iy = R127i.w;
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) * 4.0);
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
PV1iw = floatBitsToInt(max(intBitsToFloat(PV0iz), -(intBitsToFloat(PV0iz))));
R127i.x = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 2
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + 0.5);
R123i.z = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.w = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 3
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), intBitsToFloat(PV0iy)));
R127i.y = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
PV1iz = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3e22f983));
PV1iw = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
PS1i = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
// 4
R123i.x = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R126i.y = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x3e22f983));
PV0iz = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
R123i.w = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.w = floatBitsToInt(sin((intBitsToFloat(PV1iz))/0.1591549367));
// 5
backupReg0i = R127i.y;
PV1ix = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(0xbe99999a));
PV1ix = clampFI32(PV1ix);
R127i.y = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R127i.z = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
PV1iw = floatBitsToInt(min(intBitsToFloat(R127i.x), intBitsToFloat(PV0iz)));
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) * 2.0);
PV1iw = clampFI32(PV1iw);
PS1i = floatBitsToInt(sin((intBitsToFloat(backupReg0i))/0.1591549367));
// 6
backupReg0i = R126i.y;
R127i.x = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3d6a0fd3));
R126i.y = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3ca3d70a));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PS1i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(uf_remappedVS[5].x)));
PS0i = floatBitsToInt(sin((intBitsToFloat(backupReg0i))/0.1591549367));
// 7
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(sin((intBitsToFloat(R127i.y))/0.1591549367));
// 8
backupReg0i = R127i.z;
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3d4ccccd));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(sin((intBitsToFloat(backupReg0i))/0.1591549367));
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(PV0iy)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PS0i)));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1iy));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(PV1ix)));
// 11
R127i.x = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R1i.z));
R126i.y = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R3i.w));
PV1iz = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0iz));
// 12
R126i.x = floatBitsToInt(intBitsToFloat(PV1iz) * 20.0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].y), intBitsToFloat(R127i.x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].y), intBitsToFloat(R126i.y)));
PV0iw = floatBitsToInt(-(intBitsToFloat(R126i.y)) + intBitsToFloat(R127i.x));
// 13
PV1ix = floatBitsToInt(-(intBitsToFloat(R127i.z)) + intBitsToFloat(PV0iy));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(uf_remappedVS[3].x)) + intBitsToFloat(R126i.y));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].z), intBitsToFloat(R126i.y)));
// 14
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(uf_remappedVS[3].x)) + intBitsToFloat(R127i.z));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].z), intBitsToFloat(R127i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(R126i.x)));
// 15
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R123i.x)));
PV1iy = floatBitsToInt(-(intBitsToFloat(R126i.w)) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R127i.w)));
// 16
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV1iz)));
R1i.y = PV1ix;
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(uf_remappedVS[3].x)) + intBitsToFloat(R126i.w));
// 17
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R123i.w)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e23d70a));
// 18
R1i.x = PV1ix;
PV0iz = floatBitsToInt(max(intBitsToFloat(PV1iw), 0.0));
// 19
R4i.y = floatBitsToInt(-(intBitsToFloat(PV0iz)));
// 0
R127i.z = uf_remappedVS[4].z;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R5i.x),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R5i.x),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(uf_remappedVS[2].x),intBitsToFloat(uf_remappedVS[2].y),intBitsToFloat(uf_remappedVS[2].z),intBitsToFloat(uf_remappedVS[2].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R127i.w = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 3
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.y),intBitsToFloat(R4i.y),intBitsToFloat(R1i.x),0.0)));
PV0ix = tempi.x;
R126i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 5
PV1ix = ((0.0 > intBitsToFloat(PV0ix))?-1:0);
// 6
R123i.w = ((PV1ix == 0)?(0):(R126i.y));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R123i.w)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R123i.w)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R123i.w)));
// 8
PV0iy = floatBitsToInt(intBitsToFloat(R1i.x) + -(intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(intBitsToFloat(R4i.y) + -(intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(intBitsToFloat(R1i.y) + -(intBitsToFloat(PV1iz)));
// 9
R126i.x = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(PV0iw));
R127i.y = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0iz));
R127i.z = floatBitsToInt(intBitsToFloat(R5i.y) + intBitsToFloat(PV0iy));
// 10
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[6].y),intBitsToFloat(uf_remappedVS[6].z),intBitsToFloat(uf_remappedVS[6].w))));
PV0iy = R127i.x;
PV0iz = R127i.x;
PV0iw = R127i.x;
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w))));
PV1ix = tempi.x;
R126i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R127i.z = tempi.x;
PV0iw = tempi.x;
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(PV0ix),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w))));
PV1ix = tempi.x;
R5i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 14
R5i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w))));
PV0iy = R5i.x;
PV0iz = R5i.x;
PV0iw = R5i.x;
R126i.x = floatBitsToInt(-(intBitsToFloat(PV1ix)));
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R5i.z = tempi.x;
PV1iw = tempi.x;
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R5i.w = tempi.x;
R6i.z = PV1ix;
// 17
R6i.x = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV0ix));
R6i.x = floatBitsToInt(intBitsToFloat(R6i.x) / 2.0);
R6i.y = floatBitsToInt(intBitsToFloat(R126i.x) + intBitsToFloat(PV0ix));
R6i.y = floatBitsToInt(intBitsToFloat(R6i.y) / 2.0);
R6i.w = PV0ix;
// export
SET_POSITION(vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.z), intBitsToFloat(R5i.w)));
// export
// skipped export to semanticId 255
}
