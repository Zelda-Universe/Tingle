#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 78857a40f920f6b5
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[16];
uniform float uf_pointSize;
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;

out vec4 passParameterSem4;
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
attrDecoder.xyz = attrDataSem0.xyz;
attrDecoder.xyz = uvec3((attrDecoder.xyz>>24)|((attrDecoder.xyz>>8)&0xFF00u)|((attrDecoder.xyz<<8)&0xFF0000u)|((attrDecoder.xyz<<24)));
attrDecoder.w = uint(0);
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), 0x3f800000);
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R1i.x) * intBitsToFloat(0x3f866666));
PV0iy = 0x3f800000;
R127i.z = ((intBitsToFloat(0x3dcccccd) > intBitsToFloat(R1i.y))?-1:0);
PV0iw = floatBitsToInt(intBitsToFloat(R1i.z) * intBitsToFloat(0x3f866666));
PS0i = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(0xbbe56042));
// 1
R124i.x = ((R127i.z == 0)?(R1i.y):(PS0i));
PV1iy = PV0iw;
PV1iz = PV0ix;
R126i.w = ((R127i.z == 0)?(PV0iy):(PV0iy));
R3i.z = 0x3f800000;
// 2
R125i.x = ((R127i.z == 0)?(R1i.x):(PV1iz));
R125i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[0].z)) + 0.5);
R125i.y = floatBitsToInt(intBitsToFloat(R125i.y) * 2.0);
R127i.z = ((R127i.z == 0)?(R1i.z):(PV1iy));
R125i.w = 0;
R2i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[0].w)) + 0.5);
R2i.z = floatBitsToInt(intBitsToFloat(R2i.z) * 2.0);
// 3
PV1ix = floatBitsToInt(intBitsToFloat(R125i.x) + -(0.5));
R3i.y = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0x3f666666));
PV1iz = floatBitsToInt(intBitsToFloat(R127i.z) + -(0.5));
PV1iw = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(0x3f4ccccd));
R0i.x = floatBitsToInt(intBitsToFloat(R125i.y) + -(intBitsToFloat(uf_remappedVS[1].x)));
// 4
R3i.x = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(0x3dcccccd));
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].z) * 2.0 + -(0.5));
R0i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) * 2.0 + -(0.5));
PV0iw = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(PV1ix));
R127i.x = floatBitsToInt(intBitsToFloat(R2i.z) + intBitsToFloat(PV1iz));
// 5
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[2].x),intBitsToFloat(uf_remappedVS[2].y),intBitsToFloat(uf_remappedVS[2].z),0.0)));
PV1iy = R126i.x;
PV1iz = R126i.x;
PV1iw = R126i.x;
R127i.w = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV0iw));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),0.0)));
PV0ix = tempi.x;
R126i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R124i.z = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(R127i.x));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[4].x),intBitsToFloat(uf_remappedVS[4].y),intBitsToFloat(uf_remappedVS[4].z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R126i.z = tempi.x;
PV1iw = tempi.x;
R1i.z = 0;
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(PV1ix),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(PV1ix),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(uf_remappedVS[5].y)) + -(intBitsToFloat(R127i.y)));
// 9
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R124i.x),intBitsToFloat(R127i.z),intBitsToFloat(R126i.w)),vec4(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[6].y),intBitsToFloat(uf_remappedVS[6].z),intBitsToFloat(uf_remappedVS[6].w))));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
R127i.w = floatBitsToInt(tempResultf);
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R124i.x),intBitsToFloat(R127i.z),intBitsToFloat(R126i.w)),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w))));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R127i.w)));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R124i.x),intBitsToFloat(R127i.z),intBitsToFloat(R126i.w)),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R125i.z = tempi.x;
PV1iw = tempi.x;
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R127i.w)));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R124i.x),intBitsToFloat(R127i.z),intBitsToFloat(R126i.w)),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R127i.w)));
// 13
R4i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R125i.z),intBitsToFloat(PV0ix)),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w))));
PV1iy = R4i.x;
PV1iz = R4i.x;
PV1iw = R4i.x;
R0i.y = floatBitsToInt(intBitsToFloat(R125i.y) + -(0.5));
// 14
PV0ix = uf_remappedVS[11].x;
PV0iy = uf_remappedVS[11].y;
PV0iz = uf_remappedVS[11].z;
R2i.w = floatBitsToInt(intBitsToFloat(R2i.z) + -(0.5));
R7i.w = 0x3f800000;
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R6i.y),intBitsToFloat(R127i.z),intBitsToFloat(R127i.z)),vec4(-(intBitsToFloat(PV0ix)),-(intBitsToFloat(PV0iy)),-(intBitsToFloat(PV0iz)),-(intBitsToFloat(R125i.w)))));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(uf_remappedVS[12].x)) + -(intBitsToFloat(uf_remappedVS[12].y)));
R122i.x = clampFI32(R122i.x);
// 16
PV0ix = floatBitsToInt(-(intBitsToFloat(R122i.x)) + 1.0);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(uf_remappedVS[5].y)) + -(intBitsToFloat(R0i.z)));
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].x) + intBitsToFloat(R124i.y));
R125i.w = floatBitsToInt(intBitsToFloat(PV1ix) + 0.5);
R4i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].x) + -(0.5));
// 17
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].y) + intBitsToFloat(R123i.y));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].w), intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(-(intBitsToFloat(R125i.w)) + 1.0);
R123i.w = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
tempResultf = max(0.0, intBitsToFloat(PV0ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 18
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R123i.w)) + intBitsToFloat(0xbe593484));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].w), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[14].y), intBitsToFloat(PS1i)));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[14].x), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1iz)));
// 19
R2i.x = floatBitsToInt(intBitsToFloat(R2i.z) + -(intBitsToFloat(uf_remappedVS[1].y)));
PV1iy = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f22f983));
R123i.z = floatBitsToInt(intBitsToFloat(R2i.y) * 10.0 + -(intBitsToFloat(uf_remappedVS[0].y)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w),intBitsToFloat(R123i.x)) + intBitsToFloat(0x3fc90da4));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 20
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),-(intBitsToFloat(R123i.w))) + 1.0);
R1i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
R2i.z = floatBitsToInt(intBitsToFloat(R4i.y) * 10.0 + -(intBitsToFloat(uf_remappedVS[0].x)));
R0i.w = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983) + 0.5);
R0i.z = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[1].z));
R5i.xyz = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y))).xyz);
// export
SET_POSITION(vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.z)));
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R2i.x),intBitsToFloat(R1i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R2i.x),intBitsToFloat(R1i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(intBitsToFloat(R2i.z) * intBitsToFloat(0x3e22f983) + 0.5);
// 1
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(uf_remappedVS[13].w)) + 0.0);
R124i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].y) + -(0.5));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R0i.w)));
PV1iw = floatBitsToInt(fract(intBitsToFloat(R122i.x)));
R125i.w = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 2
R123i.x = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV0iy = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(R0i.z));
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(uf_remappedVS[13].w)) + 0.0);
R126i.x = floatBitsToInt(exp2(intBitsToFloat(R1i.w)));
// 3
PV1ix = floatBitsToInt(-(intBitsToFloat(PV0iy)) + 1.0);
PV1iy = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
R124i.z = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
R125i.w = ((intBitsToFloat(uf_remappedVS[1].z) > intBitsToFloat(R125i.w))?-1:0);
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].w), intBitsToFloat(R4i.z)));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].w), intBitsToFloat(R124i.y)));
R0i.y = R4i.x;
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[14].z)),intBitsToFloat(R126i.x)) + intBitsToFloat(uf_remappedVS[14].z));
R127i.z = clampFI32(R127i.z);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(PV1ix)));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1iy))/0.1591549367));
// 5
backupReg0i = R124i.z;
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(uf_remappedVS[15].z)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].w),intBitsToFloat(PV0iw)) + 1.0);
R124i.z = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3d0f5c29) + intBitsToFloat(R2i.y));
R2i.w = PV0ix;
PS1i = floatBitsToInt(sin((intBitsToFloat(backupReg0i))/0.1591549367));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 6
R4i.x = ((R125i.w == 0)?(0x3f800000):(R123i.y));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].y),intBitsToFloat(uf_remappedVS[13].w)) + intBitsToFloat(R127i.w));
R2i.z = R127i.x;
R123i.w = floatBitsToInt(-(intBitsToFloat(PS1i)) * intBitsToFloat(0x3d0f5c29) + intBitsToFloat(R4i.y));
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x),intBitsToFloat(uf_remappedVS[13].w)) + intBitsToFloat(R125i.x));
// 7
R5i.x = R124i.z;
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(uf_remappedVS[15].z)));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(uf_remappedVS[15].z)));
R5i.w = R123i.w;
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(uf_remappedVS[15].w)));
// 8
R0i.x = R6i.y;
// export
// skipped export to semanticId 255
// export
passParameterSem4 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
// export
passParameterSem0 = vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.w), intBitsToFloat(R5i.z), intBitsToFloat(R5i.z));
// export
passParameterSem2 = vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.y), intBitsToFloat(R4i.y));
// export
// skipped export to semanticId 255
// export
// skipped export to semanticId 255
// export
// skipped export to semanticId 255
gl_PointSize = uf_pointSize;
}
