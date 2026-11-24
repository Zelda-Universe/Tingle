#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 3d21e85710e90e7e
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[59];
TEXTURE_LAYOUT(39, 0, 0) uniform sampler2D textureUnitVS7;
TEXTURE_LAYOUT(40, 0, 1) uniform sampler2D textureUnitVS8;
TEXTURE_LAYOUT(44, 0, 2) uniform sampler2DArrayShadow textureUnitVS12;
TEXTURE_LAYOUT(45, 0, 3) uniform sampler2D textureUnitVS13;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem2;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem3;

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem7;
out vec4 passParameterSem13;
out vec4 passParameterSem10;
out vec4 passParameterSem4;
out vec4 passParameterSem8;
out vec4 passParameterSem14;
out vec4 passParameterSem15;
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
ivec4 R16i = ivec4(0);
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
bool activeMaskStack[3];
bool activeMaskStackC[4];
activeMaskStack[0] = false;
activeMaskStack[1] = false;
activeMaskStackC[0] = false;
activeMaskStackC[1] = false;
activeMaskStackC[2] = false;
activeMaskStack[0] = true;
activeMaskStackC[0] = true;
activeMaskStackC[1] = true;
R0i = ivec4(gl_VertexID, 0, 0, gl_InstanceID);
attrDecoder = attrDataSem3;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem1;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem2;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R4i.x = uf_remappedVS[0].w;
R0i.y = uf_remappedVS[1].w;
R0i.w = 0;
R2i.w = floatBitsToInt(1.0);
// 1
R4i.y = uf_remappedVS[2].x & 0x40000000;
R0i.z = uf_remappedVS[3].w;
// 2
predResult = (R4i.y == 0x40000000);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R127i.x = floatBitsToInt(-(intBitsToFloat(R4i.x)) + intBitsToFloat(uf_remappedVS[4].x));
R127i.y = floatBitsToInt(-(intBitsToFloat(R0i.y)) + intBitsToFloat(uf_remappedVS[4].y));
R127i.z = floatBitsToInt(-(intBitsToFloat(R0i.z)) + intBitsToFloat(uf_remappedVS[4].z));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
// 4
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(uf_remappedVS[5].z)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(uf_remappedVS[5].z)));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(uf_remappedVS[5].z)));
// 5
R0i.w = R2i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R4i.x = ((R0i.w == 0)?(0):(R5i.x));
R0i.y = ((R0i.w == 0)?(0):(R5i.y));
R0i.z = ((R0i.w == 0)?(0):(R5i.z));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 3
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(PS0i)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(PS0i)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(PS0i)));
// 4
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R1i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R1i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R1i.z)));
// 5
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.y)),intBitsToFloat(R2i.z)) + intBitsToFloat(PV0iw));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.z)),intBitsToFloat(R2i.x)) + intBitsToFloat(PV0iz));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.x)),intBitsToFloat(R2i.y)) + intBitsToFloat(PV0iy));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 7
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 8
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS1i)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS1i)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS1i)));
// 9
predResult = (intBitsToFloat(uf_remappedVS[6].z) == 1.0);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R2i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R2i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R2i.y)));
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.y)),intBitsToFloat(R2i.z)) + intBitsToFloat(PV0iw));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.z)),intBitsToFloat(R2i.x)) + intBitsToFloat(PV0iz));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.x)),intBitsToFloat(R2i.y)) + intBitsToFloat(PV0iy));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 4
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS1i)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS1i)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS1i)));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R2i.x)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].x), intBitsToFloat(uf_remappedVS[8].x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R2i.z)));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R2i.y)));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
R0i.w = 0x3f800000;
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R3i.y) + -(intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(intBitsToFloat(R3i.x) + -(intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt(intBitsToFloat(R3i.z) + -(intBitsToFloat(PV0iz)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].x), intBitsToFloat(uf_remappedVS[8].y)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R2i.z)));
// 2
R9i.x = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV1iy));
R0i.y = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(PV1ix));
R9i.z = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV1iz));
R126i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].w) * 1.0);
R0i.z = uf_remappedVS[2].x & 0x20000000;
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(uf_remappedVS[8].z)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R2i.y)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(uf_remappedVS[8].z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R2i.x)));
R8i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.y)),intBitsToFloat(R1i.z)) + intBitsToFloat(R127i.y));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R126i.y));
R12i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.z)),intBitsToFloat(R1i.x)) + intBitsToFloat(PV1iw));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R127i.w));
R8i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.x)),intBitsToFloat(R1i.y)) + intBitsToFloat(PV1iy));
// 5
R123i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e22f983) + 0.5);
// 6
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV0iw = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
// 7
R123i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.z = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 8
R126i.y = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
PV0iz = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 9
R127i.y = floatBitsToInt(sin((intBitsToFloat(PV0iz))/0.1591549367));
// 10
PS0i = floatBitsToInt(cos((intBitsToFloat(R126i.y))/0.1591549367));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
// 12
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(R126i.w)));
// 13
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(0xbccccccd));
// 14
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].y), intBitsToFloat(PV1iw)));
// 15
R11i.y = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(PV0ix));
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R13i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R11i.y),intBitsToFloat(R9i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[9].x),intBitsToFloat(uf_remappedVS[9].y),intBitsToFloat(uf_remappedVS[9].z),intBitsToFloat(uf_remappedVS[9].w))));
PV0iy = R13i.x;
PV0iz = R13i.x;
PV0iw = R13i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R11i.y),intBitsToFloat(R9i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w))));
PV1ix = tempi.x;
R13i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R11i.y),intBitsToFloat(R9i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R13i.z = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R11i.y),intBitsToFloat(R9i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R13i.w = tempi.x;
// 4
predResult = (R0i.z == 0x20000000);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R13i.w));
// 1
PV1iw = floatBitsToInt(intBitsToFloat(R13i.z) * intBitsToFloat(PS0i));
// 2
PV0iy = floatBitsToInt(-(intBitsToFloat(PV1iw)) + 1.0);
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(uf_remappedVS[5].z)));
// 4
R13i.z = floatBitsToInt(intBitsToFloat(R13i.z) + -(intBitsToFloat(PV1ix)));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R14i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].x), intBitsToFloat(uf_remappedVS[14].x)));
R14i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].y), intBitsToFloat(uf_remappedVS[14].y)));
PV0iw = ((intBitsToFloat(R3i.w) > 0.0)?-1:0);
R1i.y = floatBitsToInt(-(intBitsToFloat(R1i.w)));
// 1
R14i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].z), intBitsToFloat(uf_remappedVS[14].z)));
R14i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].w), intBitsToFloat(uf_remappedVS[14].w)));
R0i.z = ((PV0iw == 0)?(0x3f800000):(0));
// 2
R15i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[15].x), intBitsToFloat(uf_remappedVS[16].x)));
R15i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[15].y), intBitsToFloat(uf_remappedVS[16].y)));
// 3
R15i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[15].z), intBitsToFloat(uf_remappedVS[16].z)));
R15i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[15].w), intBitsToFloat(uf_remappedVS[16].w)));
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R1i.x = uf_remappedVS[2].x & 0x80000;
// 1
predResult = (R1i.x == 0x80000);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = ((intBitsToFloat(uf_remappedVS[17].x) > 0.5)?-1:0);
// 1
R1i.z = floatBitsToInt(((PV0ix == 0)?(intBitsToFloat(R0i.z)):(-(intBitsToFloat(R0i.z)))));
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R1i.z = R0i.z;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R1i.x = uf_remappedVS[2].x & 0x100000;
// 1
predResult = (R1i.x == 0x100000);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = ((intBitsToFloat(uf_remappedVS[17].y) > 0.5)?-1:0);
// 1
R6i.y = floatBitsToInt(((PV0ix == 0)?(-(intBitsToFloat(R1i.w))):(intBitsToFloat(R1i.w))));
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R6i.y = R1i.y;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R2i.z = uf_remappedVS[2].x & 0x200000;
// 1
predResult = (R2i.z == 0x200000);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = ((intBitsToFloat(uf_remappedVS[17].z) > 0.5)?-1:0);
// 1
R4i.z = floatBitsToInt(((PV0ix == 0)?(intBitsToFloat(R0i.z)):(-(intBitsToFloat(R0i.z)))));
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R4i.z = R0i.z;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R2i.z = uf_remappedVS[2].x & 0x400000;
// 1
predResult = (R2i.z == 0x400000);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = ((intBitsToFloat(uf_remappedVS[17].w) > 0.5)?-1:0);
// 1
R5i.y = floatBitsToInt(((PV0ix == 0)?(-(intBitsToFloat(R1i.w))):(intBitsToFloat(R1i.w))));
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R5i.y = R1i.y;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R1i.x = uf_remappedVS[2].x & 0x800000;
// 1
predResult = (R1i.x == 0x800000);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = ((intBitsToFloat(uf_remappedVS[17].y) > 0.5)?-1:0);
// 1
R0i.z = floatBitsToInt(((PV0ix == 0)?(intBitsToFloat(R0i.z)):(-(intBitsToFloat(R0i.z)))));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R1i.x = uf_remappedVS[2].x & 0x1000000;
// 1
predResult = (R1i.x == 0x1000000);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = ((intBitsToFloat(uf_remappedVS[17].z) > 0.5)?-1:0);
// 1
R1i.y = floatBitsToInt(((PV0ix == 0)?(-(intBitsToFloat(R1i.w))):(intBitsToFloat(R1i.w))));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
PV0ix = uf_remappedVS[2].y & int(1);
R2i.y = floatBitsToInt(intBitsToFloat(R1i.z) + -(0.5));
PV0iz = R13i.w;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
R127i.w = floatBitsToInt(intBitsToFloat(R13i.w) * 1.0);
PS0i = int(intBitsToFloat(uf_remappedVS[18].z));
// 1
R2i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[19].y) + intBitsToFloat(uf_remappedVS[19].z));
R4i.y = floatBitsToInt(intBitsToFloat(R0i.z) + -(0.5));
PV1iz = (int(1) != PV0ix)?-1:0;
R126i.w = floatBitsToInt(intBitsToFloat(R13i.z) * 0.5 + intBitsToFloat(PV0iz));
R125i.w = floatBitsToInt(float(PS0i));
// 2
R1i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[20].y) + intBitsToFloat(uf_remappedVS[20].z));
R123i.y = ((PV1iz == 0)?(0):(0x2));
PV0iz = floatBitsToInt(-(abs(intBitsToFloat(R125i.w))) + 0.0);
PV0iw = floatBitsToInt((0.0 >= abs(intBitsToFloat(R125i.w)))?1.0:0.0);
R126i.y = floatBitsToInt(float(R0i.x));
// 3
R0i.x = (R123i.y == 0x2)?-1:0;
R127i.y = ((intBitsToFloat(PV0iw) == 0.0)?(0):(PV0iz));
R127i.z = floatBitsToInt((intBitsToFloat(R126i.y) > 0.0)?1.0:0.0);
R0i.w = (R123i.y == int(1))?-1:0;
PS1i = int(intBitsToFloat(uf_remappedVS[21].z));
// 4
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(R126i.y))?1.0:0.0);
R0i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[22].z) + intBitsToFloat(uf_remappedVS[23].x));
R1i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[22].w) + intBitsToFloat(uf_remappedVS[23].y));
PV0iw = floatBitsToInt(abs(intBitsToFloat(R125i.w)) + intBitsToFloat(R127i.y));
R125i.y = floatBitsToInt(float(PS1i));
// 5
PV1ix = floatBitsToInt((0.0 >= abs(intBitsToFloat(R125i.y)))?1.0:0.0);
PV1iy = floatBitsToInt(intBitsToFloat(R127i.z) + -(intBitsToFloat(PV0ix)));
R123i.z = ((-(intBitsToFloat(R127i.y)) > 0.0)?(PV0iw):(R127i.y));
PV1iw = floatBitsToInt(-(abs(intBitsToFloat(R125i.y))) + 0.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 6
R127i.x = floatBitsToInt(intBitsToFloat(PV1iy) * 0.5 + intBitsToFloat(R126i.y));
R10i.y = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS1i));
R127i.z = ((intBitsToFloat(PV1ix) == 0.0)?(0):(PV1iw));
R126i.w = ((intBitsToFloat(R125i.w) == 0.0)?(0):(R123i.z));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R125i.w));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) * 0.0);
PV1iy = floatBitsToInt(abs(intBitsToFloat(R125i.y)) + intBitsToFloat(R127i.z));
R0i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[24].w) + intBitsToFloat(uf_remappedVS[25].y));
R1i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[24].z) + intBitsToFloat(uf_remappedVS[25].x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R125i.y));
// 8
PV0ix = floatBitsToInt(intBitsToFloat(PS1i) * 0.0);
R126i.y = floatBitsToInt(intBitsToFloat(R127i.x) * 0.5);
PV0iz = floatBitsToInt(trunc(intBitsToFloat(PV1ix)));
R123i.w = ((-(intBitsToFloat(R127i.z)) > 0.0)?(PV1iy):(R127i.z));
R127i.y = int(intBitsToFloat(R126i.w));
// 9
R127i.x = ((intBitsToFloat(R125i.y) == 0.0)?(0):(R123i.w));
R125i.y = floatBitsToInt(trunc(intBitsToFloat(PV0ix)));
R2i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[26].y) + intBitsToFloat(uf_remappedVS[26].w));
R2i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[26].x) + intBitsToFloat(uf_remappedVS[26].z));
R124i.y = int(intBitsToFloat(PV0iz));
// 10
backupReg0i = R4i.z;
R5i.x = floatBitsToInt(intBitsToFloat(R1i.y) + 0.5);
R126i.y = floatBitsToInt(trunc(intBitsToFloat(R126i.y)));
R4i.z = floatBitsToInt(intBitsToFloat(R6i.y) + 0.5);
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedVS[27].x)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[18].z));
// 11
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].x), intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[18].w));
// 12
R4i.x = floatBitsToInt(intBitsToFloat(uf_remappedVS[28].y) + intBitsToFloat(uf_remappedVS[28].w));
R1i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[28].x) + intBitsToFloat(uf_remappedVS[28].z));
R126i.z = int(intBitsToFloat(R127i.x));
// 13
R16i.x = floatBitsToInt(intBitsToFloat(R3i.x) + 0.0);
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].y), intBitsToFloat(R127i.z)));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), -(intBitsToFloat(uf_remappedVS[27].y))));
R127i.z = int(intBitsToFloat(R125i.y));
// 14
R16i.y = floatBitsToInt(intBitsToFloat(R3i.y) + intBitsToFloat(0x3f8ccccd));
R3i.z = floatBitsToInt(intBitsToFloat(R3i.z) + 0.0);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[21].z));
// 15
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[21].x), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[21].w));
// 16
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[21].y), intBitsToFloat(PS1i)));
R4i.w = floatBitsToInt(float(R127i.y));
// 17
R5i.y = floatBitsToInt(float(R124i.y));
// 18
R6i.y = floatBitsToInt(float(R126i.z));
// 19
R5i.z = floatBitsToInt(float(R127i.z));
// 20
PS0i = int(intBitsToFloat(R126i.y));
// 21
R8i.y = floatBitsToInt(float(PS0i));
// 22
R9i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[27].z));
// 23
R7i.x = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[27].w));
}
if( activeMaskStackC[1] == true ) {
// 0
R127i.x = ((R0i.w == 0)?(uf_remappedVS[17].x):(uf_remappedVS[17].y));
R123i.y = ((R0i.x == 0)?(uf_remappedVS[17].y):(uf_remappedVS[17].x));
R123i.z = ((R0i.x == 0)?(uf_remappedVS[17].x):(uf_remappedVS[17].z));
R123i.w = ((R0i.x == 0)?(uf_remappedVS[17].z):(uf_remappedVS[17].y));
R126i.x = ((R0i.w == 0)?(uf_remappedVS[17].y):(uf_remappedVS[17].z));
// 1
backupReg0i = R123i.y;
R123i.x = ((R0i.w == 0)?(R123i.z):(uf_remappedVS[17].y));
R123i.y = ((R0i.w == 0)?(R123i.w):(uf_remappedVS[17].x));
R123i.z = ((R0i.w == 0)?(backupReg0i):(uf_remappedVS[17].z));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[25].y), intBitsToFloat(R123i.z)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[25].x), intBitsToFloat(R123i.x)));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(R123i.y)) + intBitsToFloat(R1i.x));
// 3
R125i.x = floatBitsToInt(-(intBitsToFloat(PV0iy)) + intBitsToFloat(R1i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[17].z),intBitsToFloat(uf_remappedVS[19].z)) + intBitsToFloat(R2i.x));
R125i.w = floatBitsToInt(-(intBitsToFloat(PV0ix)) + intBitsToFloat(R0i.z));
// 4
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[19].x)) + intBitsToFloat(R123i.y));
// 5
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[20].x)) + intBitsToFloat(R127i.z));
R123i.y = floatBitsToInt(-(intBitsToFloat(R123i.z)) * intBitsToFloat(0x3e22f983) + 0.5);
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[17].x), intBitsToFloat(uf_remappedVS[23].x)));
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[17].y), intBitsToFloat(uf_remappedVS[23].y)));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
R123i.z = floatBitsToInt(-(intBitsToFloat(R123i.x)) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iw = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
// 7
R123i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
R126i.z = floatBitsToInt(-(intBitsToFloat(PV0ix)) + intBitsToFloat(R0i.y));
R126i.w = floatBitsToInt(-(intBitsToFloat(PV0iy)) + intBitsToFloat(R1i.z));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[28].z),intBitsToFloat(R127i.x)) + intBitsToFloat(R1i.y));
// 8
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[28].w),intBitsToFloat(R126i.x)) + intBitsToFloat(R4i.x));
R127i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].y) + -(1.0));
R127i.z = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
R123i.w = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 9
R126i.x = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[17].x),intBitsToFloat(uf_remappedVS[26].z)) + intBitsToFloat(R2i.w));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[17].y),intBitsToFloat(uf_remappedVS[26].w)) + intBitsToFloat(R2i.z));
R126i.y = floatBitsToInt(sin((intBitsToFloat(R127i.z))/0.1591549367));
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[22].x)) + -(intBitsToFloat(R126i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(R126i.y)));
PS0i = floatBitsToInt(cos((intBitsToFloat(R127i.z))/0.1591549367));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PS0i)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(PS0i)) + intBitsToFloat(PV0iy));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R4i.w)) + intBitsToFloat(R123i.x));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[22].y)) + intBitsToFloat(R126i.w));
R127i.z = floatBitsToInt(sin((intBitsToFloat(R126i.x))/0.1591549367));
// 12
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.z)),intBitsToFloat(R126i.y)) + intBitsToFloat(PV1ix));
R126i.y = floatBitsToInt(intBitsToFloat(R125i.y) + -(0.5));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R127i.z)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[24].x)) + -(intBitsToFloat(R125i.x)));
PS0i = floatBitsToInt(cos((intBitsToFloat(backupReg0i))/0.1591549367));
// 13
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x),intBitsToFloat(PS0i)) + intBitsToFloat(PV0iz));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[24].y)) + intBitsToFloat(R125i.w));
R4i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.y)),intBitsToFloat(R5i.y)) + intBitsToFloat(R126i.w));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(PS0i)));
R126i.z = floatBitsToInt(intBitsToFloat(R126i.x) + 0.5);
// 14
backupReg0i = R124i.y;
R124i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.x)),intBitsToFloat(R127i.z)) + intBitsToFloat(PV1iw));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),intBitsToFloat(R6i.y)) + intBitsToFloat(R127i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[23].z)) + intBitsToFloat(backupReg0i));
R126i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.z)),intBitsToFloat(R5i.z)) + intBitsToFloat(R123i.y));
R127i.w = floatBitsToInt(intBitsToFloat(R4i.x) + -(0.5));
// 15
PV1ix = floatBitsToInt(intBitsToFloat(R124i.x) + 0.5);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x),intBitsToFloat(R126i.z)) + intBitsToFloat(R124i.z));
PV1iz = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[23].w)) + intBitsToFloat(R125i.z));
R125i.x = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 16
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.y)),intBitsToFloat(R126i.y)) + -(intBitsToFloat(R4i.z)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),intBitsToFloat(PV1ix)) + intBitsToFloat(R124i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[25].z)) + intBitsToFloat(R124i.w));
PV0iw = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
R6i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.x)),intBitsToFloat(PV1iz)) + intBitsToFloat(R123i.y));
// 17
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.z)),intBitsToFloat(R127i.w)) + -(intBitsToFloat(R126i.w)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[25].w)) + intBitsToFloat(backupReg0i));
PV1iz = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
R127i.w = floatBitsToInt(intBitsToFloat(R8i.y) * intBitsToFloat(R125i.x));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y),intBitsToFloat(PV0iw)) + intBitsToFloat(R123i.x));
// 18
PV0ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[29].x)) + intBitsToFloat(uf_remappedVS[29].y));
PV0iy = floatBitsToInt(-(intBitsToFloat(R123i.y)) + 1.0);
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(R6i.w)));
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(R7i.z)));
R7i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.x)),intBitsToFloat(PV1iz)) + intBitsToFloat(R126i.y));
// 19
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(PV0iy)) + intBitsToFloat(R127i.x));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w),intBitsToFloat(PV0ix)) + intBitsToFloat(uf_remappedVS[29].x));
}
if( activeMaskStackC[1] == true ) {
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[30].w),intBitsToFloat(R10i.y)) + -(intBitsToFloat(uf_remappedVS[30].y)));
// 1
R2i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[31].x) * 1.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.x));
// 2
R1i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[30].z)) * intBitsToFloat(PS1i));
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
PV0ix = ((intBitsToFloat(R1i.w) > intBitsToFloat(uf_remappedVS[32].x))?-1:0);
R126i.y = ((intBitsToFloat(R1i.w) > intBitsToFloat(uf_remappedVS[32].y))?-1:0);
R126i.z = ((intBitsToFloat(R1i.w) > intBitsToFloat(uf_remappedVS[32].z))?-1:0);
// 1
R9i.y = uf_remappedVS[33].x;
PV1iw = PV0ix & int(1);
// 2
PV0iz = PV1iw - R126i.y;
// 3
PV1iy = PV0iz - R126i.z;
// 4
R1i.x = floatBitsToInt(float(PV1iy));
// 5
predResult = (intBitsToFloat(R1i.x) == 0.0);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R16i.y = R16i.y;
R16i.z = R3i.z;
R16i.w = 0x3f800000;
// 1
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R16i.w)),vec4(intBitsToFloat(uf_remappedVS[34].x),intBitsToFloat(uf_remappedVS[34].y),intBitsToFloat(uf_remappedVS[34].z),intBitsToFloat(uf_remappedVS[34].w))));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R16i.w)),vec4(intBitsToFloat(uf_remappedVS[35].x),intBitsToFloat(uf_remappedVS[35].y),intBitsToFloat(uf_remappedVS[35].z),intBitsToFloat(uf_remappedVS[35].w))));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R16i.w)),vec4(intBitsToFloat(uf_remappedVS[36].x),intBitsToFloat(uf_remappedVS[36].y),intBitsToFloat(uf_remappedVS[36].z),intBitsToFloat(uf_remappedVS[36].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R16i.w)),vec4(intBitsToFloat(uf_remappedVS[37].x),intBitsToFloat(uf_remappedVS[37].y),intBitsToFloat(uf_remappedVS[37].z),intBitsToFloat(uf_remappedVS[37].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R0i.w = tempi.x;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (intBitsToFloat(R1i.x) == 1.0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R16i.y = R16i.y;
R16i.z = R3i.z;
R16i.w = 0x3f800000;
// 1
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R16i.w)),vec4(intBitsToFloat(uf_remappedVS[38].x),intBitsToFloat(uf_remappedVS[38].y),intBitsToFloat(uf_remappedVS[38].z),intBitsToFloat(uf_remappedVS[38].w))));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R16i.w)),vec4(intBitsToFloat(uf_remappedVS[39].x),intBitsToFloat(uf_remappedVS[39].y),intBitsToFloat(uf_remappedVS[39].z),intBitsToFloat(uf_remappedVS[39].w))));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R16i.w)),vec4(intBitsToFloat(uf_remappedVS[40].x),intBitsToFloat(uf_remappedVS[40].y),intBitsToFloat(uf_remappedVS[40].z),intBitsToFloat(uf_remappedVS[40].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R16i.w)),vec4(intBitsToFloat(uf_remappedVS[41].x),intBitsToFloat(uf_remappedVS[41].y),intBitsToFloat(uf_remappedVS[41].z),intBitsToFloat(uf_remappedVS[41].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R0i.w = tempi.x;
}
activeMaskStack[2] = activeMaskStack[2] == false;
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R16i.y = R16i.y;
R16i.z = R3i.z;
R16i.w = 0x3f800000;
// 1
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R16i.w)),vec4(intBitsToFloat(uf_remappedVS[42].x),intBitsToFloat(uf_remappedVS[42].y),intBitsToFloat(uf_remappedVS[42].z),intBitsToFloat(uf_remappedVS[42].w))));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R16i.w)),vec4(intBitsToFloat(uf_remappedVS[43].x),intBitsToFloat(uf_remappedVS[43].y),intBitsToFloat(uf_remappedVS[43].z),intBitsToFloat(uf_remappedVS[43].w))));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R16i.w)),vec4(intBitsToFloat(uf_remappedVS[44].x),intBitsToFloat(uf_remappedVS[44].y),intBitsToFloat(uf_remappedVS[44].z),intBitsToFloat(uf_remappedVS[44].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R16i.w)),vec4(intBitsToFloat(uf_remappedVS[45].x),intBitsToFloat(uf_remappedVS[45].y),intBitsToFloat(uf_remappedVS[45].z),intBitsToFloat(uf_remappedVS[45].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R0i.w = tempi.x;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R127i.x = floatBitsToInt(-(intBitsToFloat(R9i.x)) + intBitsToFloat(uf_remappedVS[4].x));
R127i.y = floatBitsToInt(-(intBitsToFloat(R11i.y)) + intBitsToFloat(uf_remappedVS[4].y));
R127i.z = floatBitsToInt(-(intBitsToFloat(R9i.z)) + intBitsToFloat(uf_remappedVS[4].z));
R4i.w = 0;
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(R0i.w));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.x = floatBitsToInt(intBitsToFloat(R0i.z) * intBitsToFloat(R126i.y));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R16i.w)),vec4(intBitsToFloat(uf_remappedVS[46].x),intBitsToFloat(uf_remappedVS[46].y),intBitsToFloat(uf_remappedVS[46].z),intBitsToFloat(uf_remappedVS[46].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
R126i.x = floatBitsToInt(tempResultf);
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R16i.w)),vec4(intBitsToFloat(uf_remappedVS[47].x),intBitsToFloat(uf_remappedVS[47].y),intBitsToFloat(uf_remappedVS[47].z),intBitsToFloat(uf_remappedVS[47].w))));
PV1ix = tempi.x;
R125i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R16i.x),intBitsToFloat(R16i.y),intBitsToFloat(R16i.z),intBitsToFloat(R16i.w)),vec4(intBitsToFloat(uf_remappedVS[48].x),intBitsToFloat(uf_remappedVS[48].y),intBitsToFloat(uf_remappedVS[48].z),intBitsToFloat(uf_remappedVS[48].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R127i.w = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R126i.x)));
// 5
R0i.x = floatBitsToInt(intBitsToFloat(R0i.x) * intBitsToFloat(R126i.y));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R126i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R126i.x)));
R0i.w = R125i.x;
R0i.w = clampFI32(R0i.w);
R0i.y = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(R126i.y));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(PV1iy),intBitsToFloat(PV1iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedVS[49].x),intBitsToFloat(uf_remappedVS[49].y),intBitsToFloat(uf_remappedVS[49].z),0.0)));
tempi.x = floatBitsToInt(intBitsToFloat(tempi.x) / 2.0);
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R125i.w = tempi.x;
R0i.z = floatBitsToInt(roundEven(intBitsToFloat(R1i.x)));
// 7
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R126i.w)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R126i.w)));
PV1iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[49].y) + 1.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(uf_remappedVS[50].x)) + -(intBitsToFloat(uf_remappedVS[50].y)));
R123i.w = clampFI32(R123i.w);
R125i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[49].y) * 1.0 + intBitsToFloat(R1i.w));
// 8
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w),intBitsToFloat(uf_remappedVS[51].x)) + -(intBitsToFloat(uf_remappedVS[51].y)));
R123i.x = clampFI32(R123i.x);
PV0iy = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
R127i.z = floatBitsToInt(intBitsToFloat(R125i.w) + 0.5);
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) * 1.5);
PV0iw = clampFI32(PV0iw);
R9i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z),intBitsToFloat(R2i.y)) + 0.0);
// 9
PV1ix = floatBitsToInt(-(intBitsToFloat(R127i.z)) + 1.0);
R123i.y = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626));
R126i.z = floatBitsToInt(intBitsToFloat(PV0iw) * 15.0);
R125i.w = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
tempResultf = max(0.0, intBitsToFloat(PV0iy));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[52].y), intBitsToFloat(PS1i)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R123i.y)) + intBitsToFloat(0xbe593484));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[52].x), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 11
PV1ix = floatBitsToInt(min(intBitsToFloat(uf_remappedVS[4].y), intBitsToFloat(uf_remappedVS[53].z)));
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3f22f983));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R123i.y)) + intBitsToFloat(0x3fc90da4));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 12
backupReg0i = R3i.y;
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz),-(intBitsToFloat(R123i.w))) + 1.0);
R3i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
PV0iz = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.z));
// 13
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[53].y),intBitsToFloat(PV0iz)) + intBitsToFloat(uf_remappedVS[53].x));
R127i.x = clampFI32(R127i.x);
PV1iw = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(PS0i));
tempResultf = max(0.0, intBitsToFloat(R125i.w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 14
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[51].w), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(max(intBitsToFloat(PV1iw), intBitsToFloat(0x3e4ccccd)));
PS0i = floatBitsToInt(exp2(intBitsToFloat(R127i.w)));
// 15
R2i.x = floatBitsToInt(min(intBitsToFloat(PV0iz), 1.0));
R2i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[52].z)),intBitsToFloat(PS0i)) + intBitsToFloat(uf_remappedVS[52].z));
R2i.y = clampFI32(R2i.y);
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iy)));
// 16
R5i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PS1i)),intBitsToFloat(uf_remappedVS[54].w)) + intBitsToFloat(uf_remappedVS[54].w));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedVS[55].w)));
R8i.y = R12i.y;
}
if( activeMaskStackC[1] == true ) {
R0i.w = floatBitsToInt(texture(textureUnitVS12, vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))));
R0i.z = floatBitsToInt(texture(textureUnitVS7, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y))).x);
R3i.xyz = floatBitsToInt(texture(textureUnitVS8, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y))).xyz);
}
if( activeMaskStackC[1] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[56].y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.y), intBitsToFloat(uf_remappedVS[57].x)));
PV0iz = floatBitsToInt(-(intBitsToFloat(R0i.w)) + 1.0);
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R2i.x)));
// 1
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * 0.25 + 0.5);
R123i.x = clampFI32(R123i.x);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R127i.x)) + 1.0);
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R2i.x)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R2i.x)));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(R123i.y));
PV0iz = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
// 3
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + 8.5);
R5i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedVS[58].z)));
// 4
R4i.x = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3daaaaab));
R0i.w = floatBitsToInt(-(intBitsToFloat(R5i.w)) + intBitsToFloat(R2i.y));
R0i.w = clampFI32(R0i.w);
}
if( activeMaskStackC[1] == true ) {
R4i.xyzw = floatBitsToInt(texture(textureUnitVS13, vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.w))).xyzw);
}
// export
SET_POSITION(vec4(intBitsToFloat(R13i.x), intBitsToFloat(R13i.y), intBitsToFloat(R13i.z), intBitsToFloat(R13i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R14i.x), intBitsToFloat(R14i.y), intBitsToFloat(R14i.z), intBitsToFloat(R14i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R15i.x), intBitsToFloat(R15i.y), intBitsToFloat(R15i.z), intBitsToFloat(R15i.w));
// export
passParameterSem7 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.z), intBitsToFloat(R6i.w));
// export
passParameterSem13 = vec4(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y), intBitsToFloat(R4i.z), intBitsToFloat(R4i.w));
// export
passParameterSem10 = vec4(intBitsToFloat(R8i.x), intBitsToFloat(R8i.y), intBitsToFloat(R8i.z), intBitsToFloat(R8i.w));
// export
passParameterSem4 = vec4(intBitsToFloat(R9i.x), intBitsToFloat(R9i.y), intBitsToFloat(R9i.z), intBitsToFloat(R9i.z));
// export
passParameterSem8 = vec4(intBitsToFloat(R7i.x), intBitsToFloat(R7i.y), intBitsToFloat(R7i.z), intBitsToFloat(R7i.z));
if( activeMaskStackC[1] == true ) {
// 0
R5i.z = R0i.w;
R1i.w = R0i.w;
}
// export
passParameterSem14 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
// export
passParameterSem15 = vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.z), intBitsToFloat(R5i.w));
}
