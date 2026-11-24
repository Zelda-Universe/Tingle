#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 69ce21ae784ffad2
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[19];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;

out vec4 passParameterSem1;
out vec4 passParameterSem4;
out vec4 passParameterSem0;
out vec4 passParameterSem2;
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
attrDecoder.xyz = attrDataSem0.xyz;
attrDecoder.xyz = uvec3((attrDecoder.xyz>>24)|((attrDecoder.xyz>>8)&0xFF00u)|((attrDecoder.xyz<<8)&0xFF0000u)|((attrDecoder.xyz<<24)));
attrDecoder.w = uint(0);
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), 0x3f800000);
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R1i.z) * intBitsToFloat(0x3f866666));
PV0iy = floatBitsToInt(intBitsToFloat(R1i.x) * intBitsToFloat(0x3f866666));
PV0iz = 0x3f800000;
R127i.w = ((intBitsToFloat(0x3dcccccd) > intBitsToFloat(R1i.y))?-1:0);
PS0i = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(0xbbe56042));
// 1
R127i.x = ((R127i.w == 0)?(PV0iz):(PV0iz));
R127i.y = ((R127i.w == 0)?(R1i.y):(PS0i));
PV1iz = PV0ix;
PV1iw = PV0iy;
R126i.w = 0;
// 2
R0i.x = ((R127i.w == 0)?(R1i.x):(PV1iw));
R4i.y = 0;
R126i.z = ((R127i.w == 0)?(R1i.z):(PV1iz));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[0].z)) + 0.5);
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
R7i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[1].z));
// 3
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R127i.x)),vec4(intBitsToFloat(uf_remappedVS[2].x),intBitsToFloat(uf_remappedVS[2].y),intBitsToFloat(uf_remappedVS[2].z),intBitsToFloat(uf_remappedVS[2].w))));
PV1iy = R126i.x;
PV1iz = R126i.x;
PV1iw = R126i.x;
R125i.y = floatBitsToInt(intBitsToFloat(R0i.x) + -(0.5));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R127i.x)),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),intBitsToFloat(uf_remappedVS[3].w))));
PV0ix = tempi.x;
R126i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.x = floatBitsToInt(intBitsToFloat(R126i.z) + -(0.5));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R127i.x)),vec4(intBitsToFloat(uf_remappedVS[4].x),intBitsToFloat(uf_remappedVS[4].y),intBitsToFloat(uf_remappedVS[4].z),intBitsToFloat(uf_remappedVS[4].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R127i.z = tempi.x;
PV1iw = tempi.x;
R6i.y = floatBitsToInt(intBitsToFloat(R127i.w) + -(0.5));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(R127i.x)),vec4(intBitsToFloat(uf_remappedVS[5].x),intBitsToFloat(uf_remappedVS[5].y),intBitsToFloat(uf_remappedVS[5].z),intBitsToFloat(uf_remappedVS[5].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R127i.w = tempi.x;
R12i.w = 0x3f800000;
// 7
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(PV0ix)),vec4(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[6].y),intBitsToFloat(uf_remappedVS[6].z),intBitsToFloat(uf_remappedVS[6].w))));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w)),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w))));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R2i.w = R127i.x;
// 9
R2i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w)),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w))));
PV1iy = R2i.x;
PV1iz = R2i.x;
PV1iw = R2i.x;
R0i.y = R127i.x;
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w)),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w))));
PV0ix = tempi.x;
R2i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(uf_remappedVS[10].x)) + -(intBitsToFloat(uf_remappedVS[10].y)));
R123i.x = clampFI32(R123i.x);
R2i.z = floatBitsToInt(intBitsToFloat(R127i.y) + -(intBitsToFloat(uf_remappedVS[11].x)));
// 12
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),0.0)));
PV0iy = R127i.x;
PV0iz = R127i.x;
PV0iw = R127i.x;
PS0i = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),0.0)));
PV1ix = tempi.x;
R127i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
tempResultf = max(0.0, intBitsToFloat(PS0i));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R125i.z = floatBitsToInt(tempResultf);
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[14].x),intBitsToFloat(uf_remappedVS[14].y),intBitsToFloat(uf_remappedVS[14].z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R127i.z = tempi.x;
PV0iw = tempi.x;
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV0ix),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV0ix),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[15].y), intBitsToFloat(R125i.z)));
// 16
R124i.x = uf_remappedVS[16].x;
R124i.y = uf_remappedVS[16].y;
R124i.z = uf_remappedVS[16].z;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 17
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
R11i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
R127i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].x) + intBitsToFloat(R125i.y));
PS1i = floatBitsToInt(exp2(intBitsToFloat(R126i.y)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(PV1ix),intBitsToFloat(R11i.y),intBitsToFloat(PV1iz),intBitsToFloat(PV1iz)),vec4(-(intBitsToFloat(R124i.x)),-(intBitsToFloat(R124i.y)),-(intBitsToFloat(R124i.z)),-(intBitsToFloat(R126i.w)))));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R1i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
// 19
PV1ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].y) + intBitsToFloat(R125i.x));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[17].w), intBitsToFloat(R127i.w)));
R124i.z = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
R3i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].x) + -(0.5));
R3i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].y) + -(0.5));
// 20
PV0ix = floatBitsToInt(-(intBitsToFloat(R124i.z)) + 1.0);
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[17].w), intBitsToFloat(PV1ix)));
R123i.z = floatBitsToInt(intBitsToFloat(R124i.z) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
R0i.w = floatBitsToInt(intBitsToFloat(R0i.x) + -(intBitsToFloat(uf_remappedVS[1].x)));
R3i.y = floatBitsToInt(intBitsToFloat(R126i.z) + -(intBitsToFloat(uf_remappedVS[1].y)));
// 21
R123i.x = floatBitsToInt(intBitsToFloat(R8i.y) * 10.0 + -(intBitsToFloat(uf_remappedVS[0].y)));
R123i.y = floatBitsToInt(intBitsToFloat(R9i.y) * 10.0 + -(intBitsToFloat(uf_remappedVS[0].x)));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[0].w)) + 0.5);
R126i.z = floatBitsToInt(intBitsToFloat(R126i.z) * 2.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R123i.z)) + intBitsToFloat(0xbe593484));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 22
backupReg0i = R123i.y;
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3f22f983));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z),intBitsToFloat(R123i.w)) + intBitsToFloat(0x3fc90da4));
R123i.z = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x3e22f983) + 0.5);
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[15].x), intBitsToFloat(R125i.z)));
// 23
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),-(intBitsToFloat(R123i.y))) + 1.0);
R5i.y = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
R1i.z = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R1i.w = floatBitsToInt(intBitsToFloat(R126i.z) + -(0.5));
R4i.w = floatBitsToInt(exp2(intBitsToFloat(PS0i)));
R10i.xyz = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y))).xyz);
// export
SET_POSITION(vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w)));
// export
// skipped export to semanticId 255
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.w),intBitsToFloat(R3i.y),intBitsToFloat(R4i.y),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.w),intBitsToFloat(R3i.y),intBitsToFloat(R4i.y),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R122i.x = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 1
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y),intBitsToFloat(uf_remappedVS[17].w)) + 0.0);
R123i.y = floatBitsToInt(intBitsToFloat(R1i.z) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(uf_remappedVS[17].w)) + 0.0);
PV1iw = floatBitsToInt(intBitsToFloat(R122i.x) * intBitsToFloat(0x3e22f983));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(R7i.y));
PV0iy = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R125i.z = ((intBitsToFloat(uf_remappedVS[1].z) > intBitsToFloat(PS1i))?-1:0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[17].w), intBitsToFloat(R3i.w)));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1iw))/0.1591549367));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[17].w), intBitsToFloat(R3i.x)));
R124i.y = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3d0f5c29) + intBitsToFloat(R8i.y));
R124i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[15].z)),intBitsToFloat(R4i.w)) + intBitsToFloat(uf_remappedVS[15].z));
R124i.z = clampFI32(R124i.z);
PV1iw = floatBitsToInt(-(intBitsToFloat(PV0ix)) + 1.0);
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0iy))/0.1591549367));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 4
R124i.x = floatBitsToInt(-(intBitsToFloat(PS1i)) * intBitsToFloat(0x3d0f5c29) + intBitsToFloat(R9i.y));
R9i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].y),intBitsToFloat(uf_remappedVS[17].w)) + intBitsToFloat(R126i.z));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(PV1iw)));
R9i.w = PV1ix;
R9i.z = R127i.w;
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].w),intBitsToFloat(PV0iz)) + 1.0);
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(uf_remappedVS[18].z)));
R12i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(uf_remappedVS[18].z)));
R10i.w = R124i.y;
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(uf_remappedVS[18].z)));
// 6
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x),intBitsToFloat(uf_remappedVS[17].w)) + intBitsToFloat(R125i.x));
R10i.y = R124i.x;
R1i.z = R11i.y;
R4i.w = ((R125i.z == 0)?(0x3f800000):(R123i.x));
// 7
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(uf_remappedVS[18].w)));
// export
passParameterSem1 = vec4(intBitsToFloat(R12i.x), intBitsToFloat(R12i.y), intBitsToFloat(R12i.z), intBitsToFloat(R12i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.w));
// export
passParameterSem0 = vec4(intBitsToFloat(R10i.w), intBitsToFloat(R10i.y), intBitsToFloat(R10i.z), intBitsToFloat(R10i.z));
// export
passParameterSem2 = vec4(intBitsToFloat(R4i.w), intBitsToFloat(R4i.y), intBitsToFloat(R4i.y), intBitsToFloat(R4i.y));
// export
passParameterSem3 = vec4(intBitsToFloat(R10i.z), intBitsToFloat(R10i.y), intBitsToFloat(R10i.y), intBitsToFloat(R10i.y));
// export
passParameterSem6 = vec4(intBitsToFloat(R1i.z), intBitsToFloat(R1i.y), intBitsToFloat(R1i.y), intBitsToFloat(R1i.y));
}
