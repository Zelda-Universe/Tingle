#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 1ea67b0ef250849e
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[27];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2DArray textureUnitVS0;
TEXTURE_LAYOUT(33, 0, 1) uniform sampler2DArray textureUnitVS1;
TEXTURE_LAYOUT(34, 0, 2) uniform sampler2DArray textureUnitVS2;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem5;
out vec4 passParameterSem3;
out vec4 passParameterSem4;
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
ivec4 R8i = ivec4(0);
ivec4 R123i = ivec4(0);
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
bool activeMaskStack[2];
bool activeMaskStackC[3];
activeMaskStack[0] = false;
activeMaskStackC[0] = false;
activeMaskStackC[1] = false;
activeMaskStack[0] = true;
activeMaskStackC[0] = true;
activeMaskStackC[1] = true;
R0i = ivec4(gl_VertexID, 0, 0, gl_InstanceID);
attrDecoder.xy = attrDataSem0.xy;
attrDecoder.xy = uvec2((attrDecoder.xy>>24)|((attrDecoder.xy>>8)&0xFF00u)|((attrDecoder.xy<<8)&0xFF0000u)|((attrDecoder.xy<<24)));
attrDecoder.z = uint(0);
attrDecoder.w = uint(0);
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), 0, 0x3f800000);
if( activeMaskStackC[1] == true ) {
// 0
PV0ix = uf_remappedVS[0].x;
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[1].y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(uf_remappedVS[1].x)));
R1i.w = uf_remappedVS[0].y;
// 1
R3i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].z) + intBitsToFloat(PV0iw));
R3i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].w) + intBitsToFloat(PV0iz));
R1i.z = floatBitsToInt(roundEven(intBitsToFloat(PV0ix)));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R3i.x) + -(0.5));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(uf_remappedVS[2].y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(uf_remappedVS[2].x)));
PV0iw = floatBitsToInt(intBitsToFloat(R3i.y) + -(0.5));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(uf_remappedVS[3].x)));
// 3
R1i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[2].z) + intBitsToFloat(PV0iz));
R1i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[2].w) + intBitsToFloat(PV0iy));
R0i.z = floatBitsToInt(max(intBitsToFloat(PV0ix), -(intBitsToFloat(PV0ix))));
R0i.w = floatBitsToInt(max(intBitsToFloat(PV0iw), -(intBitsToFloat(PV0iw))));
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(uf_remappedVS[3].y)));
}
if( activeMaskStackC[1] == true ) {
R1i.w = floatBitsToInt(textureLod(textureUnitVS0, vec3(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z)),intBitsToFloat(R1i.w)).x);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(uf_remappedVS[4].x)));
PV0iy = floatBitsToInt(max(intBitsToFloat(R0i.z), intBitsToFloat(R0i.w)));
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[3].z) + intBitsToFloat(R0i.y));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(uf_remappedVS[4].x)));
PS0i = floatBitsToInt(intBitsToFloat(uf_remappedVS[3].w) + intBitsToFloat(R0i.x));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].z), intBitsToFloat(PV0iy)));
R1i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].w) + intBitsToFloat(PV0iw));
R3i.z = PV0iz;
R3i.w = PS0i;
R1i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[4].z) + intBitsToFloat(PV0ix));
// 2
R4i.x = R1i.x;
R4i.z = R1i.y;
R5i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[5].w) + intBitsToFloat(PV1ix));
R5i.w = clampFI32(R5i.w);
// 3
R2i.z = ((intBitsToFloat(R5i.w) > intBitsToFloat(0x3c23d70a))?-1:0);
// 4
predResult = (R2i.z != 0);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
PV0iy = uf_remappedVS[6].x;
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(uf_remappedVS[7].y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(uf_remappedVS[7].x)));
// 1
R0i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].z) + intBitsToFloat(PV0iw));
R0i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[7].w) + intBitsToFloat(PV0iz));
R0i.z = floatBitsToInt(roundEven(intBitsToFloat(PV0iy)));
R0i.w = uf_remappedVS[6].y;
}
if( activeMaskStackC[2] == true ) {
R0i.z = floatBitsToInt(textureLod(textureUnitVS0, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z)),intBitsToFloat(R0i.w)).x);
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R1i.w)) + intBitsToFloat(R0i.z));
// 1
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R5i.w)) + intBitsToFloat(R1i.w));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
PV0ix = uf_remappedVS[8].w;
PV0iz = uf_remappedVS[9].w;
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(uf_remappedVS[10].y)));
PV1iy = floatBitsToInt(intBitsToFloat(R4i.x) + -(intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[11].w) + intBitsToFloat(0xbe4ccccd));
PV1iw = floatBitsToInt(intBitsToFloat(R4i.z) + -(intBitsToFloat(PV0ix)));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(PV1iy)));
R127i.y = floatBitsToInt(min(intBitsToFloat(R127i.x), intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(PV1iw)));
// 3
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0ix));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.x) + -(intBitsToFloat(R127i.y)));
// 4
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(0xbdcccccd));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
PV0iw = clampFI32(PV0iw);
// 5
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV0iw)) + intBitsToFloat(R127i.y));
// 6
R4i.y = R6i.x;
R0i.w = 0x3f800000;
// 7
R7i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w))));
PV1iy = R7i.x;
PV1iz = R7i.x;
PV1iw = R7i.x;
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),intBitsToFloat(uf_remappedVS[13].w))));
PV0ix = tempi.x;
R7i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[14].x),intBitsToFloat(uf_remappedVS[14].y),intBitsToFloat(uf_remappedVS[14].z),intBitsToFloat(uf_remappedVS[14].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R7i.z = tempi.x;
PV1iw = tempi.x;
R0i.w = 0x3f800000;
// 10
R8i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(PV1ix),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[15].x),intBitsToFloat(uf_remappedVS[15].y),intBitsToFloat(uf_remappedVS[15].z),intBitsToFloat(uf_remappedVS[15].w))));
PV0iy = R8i.x;
PV0iz = R8i.x;
PV0iw = R8i.x;
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),intBitsToFloat(uf_remappedVS[16].w))));
PV1ix = tempi.x;
R8i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[17].x),intBitsToFloat(uf_remappedVS[17].y),intBitsToFloat(uf_remappedVS[17].z),intBitsToFloat(uf_remappedVS[17].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R8i.z = tempi.x;
PV0iw = tempi.x;
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[18].x),intBitsToFloat(uf_remappedVS[18].y),intBitsToFloat(uf_remappedVS[18].z),intBitsToFloat(uf_remappedVS[18].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R8i.w = tempi.x;
}
if( activeMaskStackC[1] == true ) {
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R1i.y) + -(intBitsToFloat(uf_remappedVS[19].w)));
R127i.y = floatBitsToInt(intBitsToFloat(R1i.x) + -(intBitsToFloat(uf_remappedVS[19].z)));
PV0iw = uf_remappedVS[20].x;
// 1
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(uf_remappedVS[21].x)) + intBitsToFloat(uf_remappedVS[21].z));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(uf_remappedVS[21].y)) + intBitsToFloat(uf_remappedVS[21].w));
R0i.z = floatBitsToInt(roundEven(intBitsToFloat(PV0iw)));
// 2
PV0ix = uf_remappedVS[22].x;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[19].x));
// 3
R2i.x = floatBitsToInt(intBitsToFloat(R4i.x) + -(intBitsToFloat(uf_remappedVS[23].z)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R1i.w = floatBitsToInt(roundEven(intBitsToFloat(PV0ix)));
R1i.z = floatBitsToInt(intBitsToFloat(R4i.z) + -(intBitsToFloat(uf_remappedVS[23].w)));
// 4
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),intBitsToFloat(uf_remappedVS[24].x)) + intBitsToFloat(uf_remappedVS[24].z));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(uf_remappedVS[24].y)) + intBitsToFloat(uf_remappedVS[24].w));
}
if( activeMaskStackC[1] == true ) {
R0i.xy = floatBitsToInt(texture(textureUnitVS1, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z))).xy);
R1i.y = floatBitsToInt(texture(textureUnitVS2, vec3(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.w))).x);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R5i.x = floatBitsToInt(intBitsToFloat(R0i.x) * 2.0 + -(1.0));
R0i.y = floatBitsToInt(intBitsToFloat(R0i.y) * 2.0 + -(1.0));
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[23].x));
// 1
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R5i.x)));
R5i.z = R0i.y;
// 2
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R127i.w)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(PV1iz));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R127i.w)));
// 3
PV1ix = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
PV1ix = clampFI32(PV1ix);
// 4
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 5
R5i.y = floatBitsToInt(intBitsToFloat(PS0i) * 0.125);
// 6
predResult = (R2i.z != 0);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
PV0iw = uf_remappedVS[25].x;
// 1
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(uf_remappedVS[26].x)) + intBitsToFloat(uf_remappedVS[26].z));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(uf_remappedVS[26].y)) + intBitsToFloat(uf_remappedVS[26].w));
R0i.z = floatBitsToInt(roundEven(intBitsToFloat(PV0iw)));
}
if( activeMaskStackC[2] == true ) {
R0i.x = floatBitsToInt(texture(textureUnitVS2, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z))).x);
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R1i.y)) + intBitsToFloat(R0i.x));
// 1
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R5i.w)) + intBitsToFloat(R1i.y));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].y), intBitsToFloat(R1i.y)));
R0i.y = floatBitsToInt(-(intBitsToFloat(R8i.y)));
R0i.z = R8i.z;
R0i.w = R8i.w;
R0i.x = floatBitsToInt(intBitsToFloat(R8i.x) + intBitsToFloat(R8i.w));
R0i.x = floatBitsToInt(intBitsToFloat(R0i.x) / 2.0);
// 1
R0i.y = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(R8i.w));
R0i.y = floatBitsToInt(intBitsToFloat(R0i.y) / 2.0);
PV1iw = floatBitsToInt(min(intBitsToFloat(PV0ix), intBitsToFloat(0x42d3cccd)));
// 2
PV0iy = floatBitsToInt(intBitsToFloat(R6i.x) + -(intBitsToFloat(PV1iw)));
// 3
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * 5.0);
PV1iz = clampFI32(PV1iz);
// 4
R1i.x = floatBitsToInt(intBitsToFloat(0x3ee66666) * intBitsToFloat(PV1iz) + intBitsToFloat(0x3f0ccccd));
}
// export
SET_POSITION(vec4(intBitsToFloat(R8i.x), intBitsToFloat(R8i.y), intBitsToFloat(R8i.z), intBitsToFloat(R8i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.z), intBitsToFloat(R5i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
// export
passParameterSem5 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
passParameterSem3 = vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.y), intBitsToFloat(R7i.z), intBitsToFloat(R7i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.z), intBitsToFloat(R4i.w));
// export
passParameterSem2 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.x), intBitsToFloat(R1i.x), intBitsToFloat(R1i.x));
}
