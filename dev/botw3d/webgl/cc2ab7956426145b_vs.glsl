#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader cc2ab7956426145b
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[4];
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;

out vec4 passParameterSem3;
out vec4 passParameterSem7;
out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem4;
out vec4 passParameterSem5;
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
bool activeMaskStack[5];
bool activeMaskStackC[6];
activeMaskStack[0] = false;
activeMaskStack[1] = false;
activeMaskStack[2] = false;
activeMaskStack[3] = false;
activeMaskStackC[0] = false;
activeMaskStackC[1] = false;
activeMaskStackC[2] = false;
activeMaskStackC[3] = false;
activeMaskStackC[4] = false;
activeMaskStack[0] = true;
activeMaskStackC[0] = true;
activeMaskStackC[1] = true;
R0i = ivec4(gl_VertexID, 0, 0, gl_InstanceID);
attrDecoder.xyz = attrDataSem0.xyz;
attrDecoder.xyz = uvec3((attrDecoder.xyz>>24)|((attrDecoder.xyz>>8)&0xFF00u)|((attrDecoder.xyz<<8)&0xFF0000u)|((attrDecoder.xyz<<24)));
attrDecoder.w = uint(0);
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), 0x3f800000);
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
PV0ix = floatBitsToInt((0.0 > intBitsToFloat(R1i.x))?1.0:0.0);
PV0iy = floatBitsToInt((0.0 > intBitsToFloat(R1i.y))?1.0:0.0);
PV0iz = floatBitsToInt((intBitsToFloat(R1i.y) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((intBitsToFloat(R1i.x) > 0.0)?1.0:0.0);
R0i.x = 0;
// 1
R8i.x = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(PV0ix)));
R8i.y = floatBitsToInt(intBitsToFloat(PV0iz) + -(intBitsToFloat(PV0iy)));
R8i.z = 0;
R8i.w = 0x3f800000;
R0i.z = 0x3f800000;
// 2
R0i.w = (uf_remappedVS[0].x != 0)?-1:0;
// 3
predResult = (R0i.w == 0);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R9i.x = 0;
R9i.y = 0;
R9i.z = 0x3f800000;
R7i.x = 0;
// 1
R5i.x = 0xbf800000;
R7i.y = 0x3f800000;
R7i.z = 0;
R5i.y = 0;
// 2
R5i.z = 0;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
R1i.z = (uf_remappedVS[0].x != int(1))?-1:0;
// 1
predResult = (R1i.z == 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R9i.x = 0;
R9i.y = 0;
R9i.z = 0xbf800000;
R7i.x = 0;
// 1
R5i.x = 0x3f800000;
R7i.y = 0x3f800000;
R7i.z = 0;
R5i.y = 0;
// 2
R5i.z = 0;
}
activeMaskStack[2] = activeMaskStack[2] == false;
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R0i.y = (uf_remappedVS[0].x != 0x2)?-1:0;
// 1
predResult = (R0i.y == 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R9i.x = 0x3f800000;
R9i.y = 0;
R9i.z = 0;
R7i.x = 0;
// 1
R5i.x = 0;
R7i.y = 0;
R7i.z = 0x3f800000;
R5i.y = 0xbf800000;
// 2
R5i.z = 0;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
activeMaskStack[4] = activeMaskStack[3];
activeMaskStackC[5] = activeMaskStackC[4];
// 0
R1i.x = (uf_remappedVS[0].x != 0x3)?-1:0;
// 1
predResult = (R1i.x == 0);
activeMaskStack[4] = predResult;
activeMaskStackC[5] = predResult == true && activeMaskStackC[4] == true;
}
else {
activeMaskStack[4] = false;
activeMaskStackC[5] = false;
}
if( activeMaskStackC[5] == true ) {
// 0
R9i.x = 0x3f800000;
R9i.y = 0;
R9i.z = 0;
R7i.x = 0;
// 1
R5i.x = 0;
R7i.y = 0;
R7i.z = 0xbf800000;
R5i.y = 0x3f800000;
// 2
R5i.z = 0;
}
activeMaskStack[4] = activeMaskStack[4] == false;
activeMaskStackC[5] = activeMaskStack[4] == true && activeMaskStackC[4] == true;
if( activeMaskStackC[5] == true ) {
// 0
R125i.x = (uf_remappedVS[0].x != 0x4)?-1:0;
R127i.w = (uf_remappedVS[0].x != 0x5)?-1:0;
// 1
R127i.x = ((R127i.w == 0)?(0):(0));
R127i.y = ((R127i.w == 0)?(0):(0));
R123i.z = ((R127i.w == 0)?(0xbf800000):(0));
R126i.w = ((R127i.w == 0)?(0):(0));
R127i.z = ((R127i.w == 0)?(0x3f800000):(0));
// 2
R126i.x = ((R127i.w == 0)?(0):(0));
R126i.y = ((R127i.w == 0)?(0):(0));
R126i.z = ((R127i.w == 0)?(0xbf800000):(0));
R127i.w = ((R127i.w == 0)?(0):(0));
R9i.x = ((R125i.x == 0)?(0x3f800000):(R123i.z));
// 3
R7i.x = ((R125i.x == 0)?(0):(R126i.w));
R9i.y = ((R125i.x == 0)?(0):(R127i.y));
R9i.z = ((R125i.x == 0)?(0):(R127i.x));
R7i.y = ((R125i.x == 0)?(0x3f800000):(R127i.z));
// 4
R5i.x = ((R125i.x == 0)?(0):(R126i.x));
R5i.y = ((R125i.x == 0)?(0):(R127i.w));
R7i.z = ((R125i.x == 0)?(0):(R126i.y));
R5i.z = ((R125i.x == 0)?(0x3f800000):(R126i.z));
}
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R125i.x = 0;
R125i.y = 0;
R3i.z = 0;
R5i.w = 0x80000000;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedVS[1].x));
// 1
R6i.x = R9i.z;
R6i.y = R7i.z;
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3fc90fdb));
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) / 2.0);
R6i.w = 0;
R6i.z = R5i.z;
// 2
R123i.x = floatBitsToInt((0.0 * 0.0 + 1.0));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R7i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(R5i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(uf_remappedVS[2].x)));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R9i.z)));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x400923a3));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3f19999a));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R5i.z)) + intBitsToFloat(PV0iz));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R9i.y)) + intBitsToFloat(PS0i));
R122i.x = floatBitsToInt((0.0 * 0.0 + intBitsToFloat(R123i.x)));
// 4
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt((0.0 * 0.0 + intBitsToFloat(R122i.x)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R9i.x)) + intBitsToFloat(R123i.w));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R7i.y)) + intBitsToFloat(R127i.y));
// 5
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R7i.x)) + intBitsToFloat(R122i.x));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
R3i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x),intBitsToFloat(R5i.x)) + intBitsToFloat(R127i.z));
tempResultf = 1.0 / sqrt(intBitsToFloat(R123i.y));
PS1i = floatBitsToInt(tempResultf);
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R3i.w) * intBitsToFloat(R3i.w));
R127i.y = floatBitsToInt(intBitsToFloat(PS1i) * 1.0);
R123i.z = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.w = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 7
R127i.x = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
R126i.y = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
PV1iz = floatBitsToInt(intBitsToFloat(R127i.y) + 0.0);
R122i.x = floatBitsToInt((intBitsToFloat(R2i.x) * intBitsToFloat(R2i.x) + intBitsToFloat(PV0ix)));
// 8
R126i.x = floatBitsToInt((intBitsToFloat(R2i.z) * intBitsToFloat(R2i.z) + intBitsToFloat(R122i.x)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PV1iz)) + 0.0);
R127i.z = floatBitsToInt(cos((intBitsToFloat(R126i.y))/0.1591549367));
// 9
R4i.z = floatBitsToInt(intBitsToFloat(R123i.w) + 0.0);
R126i.w = R127i.z;
R124i.x = floatBitsToInt(sin((intBitsToFloat(R126i.y))/0.1591549367));
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R9i.z)));
R0i.y = R124i.x;
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R9i.z)));
R1i.w = R127i.z;
R127i.w = floatBitsToInt(cos((intBitsToFloat(R127i.x))/0.1591549367));
// 11
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R9i.y)) + intBitsToFloat(PV0ix));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),intBitsToFloat(R9i.y)) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(R126i.w));
R125i.w = R127i.w;
R127i.x = floatBitsToInt(sin((intBitsToFloat(R127i.x))/0.1591549367));
// 12
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R9i.x)) + intBitsToFloat(R123i.x));
R1i.y = R127i.x;
R123i.z = floatBitsToInt((intBitsToFloat(R125i.y) * intBitsToFloat(R125i.y) + intBitsToFloat(PV1iz)));
R2i.w = R127i.w;
tempResultf = 1.0 / sqrt(intBitsToFloat(R126i.x));
R4i.w = floatBitsToInt(tempResultf);
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R123i.z),0.0),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w),intBitsToFloat(R9i.x)) + intBitsToFloat(R126i.y));
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.x),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.x),intBitsToFloat(R1i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
R126i.y = floatBitsToInt(tempResultf);
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.x),intBitsToFloat(R125i.x),intBitsToFloat(R125i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.x),intBitsToFloat(R125i.x),intBitsToFloat(R125i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
R125i.y = floatBitsToInt(tempResultf);
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R1i.y),intBitsToFloat(R0i.x),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R1i.y),intBitsToFloat(R0i.x),intBitsToFloat(R2i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
R127i.w = floatBitsToInt(tempResultf);
// 17
backupReg0i = R126i.y;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(backupReg0i)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R125i.y)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R127i.w)));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(backupReg0i)));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
R127i.z = floatBitsToInt(tempResultf);
// 18
backupReg0i = R125i.y;
PV0ix = floatBitsToInt(-(intBitsToFloat(R125i.x)) + 0.0);
R125i.y = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(0x80000000));
PV0iz = floatBitsToInt(-(intBitsToFloat(R125i.z)) + 0.0);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R127i.z)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(backupReg0i)));
// 19
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(R127i.z)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(R127i.w)));
PV1iz = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(0x80000000));
R127i.w = floatBitsToInt(intBitsToFloat(PV0ix) + 0.0);
R127i.y = floatBitsToInt(intBitsToFloat(PV0iz) + 0.0);
// 20
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R127i.w)) + 0.0);
PV0iy = floatBitsToInt(intBitsToFloat(R125i.y) + 0.0);
R0i.z = floatBitsToInt(intBitsToFloat(R0i.w) + 0.0);
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) + 0.0);
R0i.x = floatBitsToInt(intBitsToFloat(R1i.y) + 0.0);
// 21
PV1ix = floatBitsToInt(intBitsToFloat(R126i.z) + 0.0);
PV1iy = floatBitsToInt(intBitsToFloat(R127i.x) + 0.0);
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(PV0iy)) + 0.0);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R127i.y)) + 0.0);
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PV0iw)) + 0.0);
// 22
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.x)),intBitsToFloat(R0i.z)) + intBitsToFloat(R124i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1ix)),-(intBitsToFloat(R126i.y))) + intBitsToFloat(R123i.z));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.z)),intBitsToFloat(R0i.x)) + intBitsToFloat(R123i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV1iy)),-(intBitsToFloat(R126i.w))) + intBitsToFloat(R122i.x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(R127i.w)) + 0.0);
// 23
R1i.x = floatBitsToInt(intBitsToFloat(R123i.z) + 0.0);
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R127i.y)) + 0.0);
R1i.z = floatBitsToInt(intBitsToFloat(R123i.y) + 0.0);
R1i.w = floatBitsToInt(intBitsToFloat(R123i.x) + 0.0);
R2i.w = floatBitsToInt(intBitsToFloat(R123i.w) + 0.0);
}
// export
SET_POSITION(vec4(intBitsToFloat(R8i.x), intBitsToFloat(R8i.y), intBitsToFloat(R8i.z), intBitsToFloat(R8i.w)));
// export
passParameterSem3 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.z), intBitsToFloat(R6i.w));
if( activeMaskStackC[1] == true ) {
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(R0i.z)) + intBitsToFloat(R0i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R0i.x)) + intBitsToFloat(R2i.y));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(uf_remappedVS[3].x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(uf_remappedVS[3].y)));
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(uf_remappedVS[3].x)));
// 1
R124i.x = floatBitsToInt(intBitsToFloat(R123i.y) + 0.0);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(uf_remappedVS[3].y)));
R126i.z = floatBitsToInt(intBitsToFloat(R123i.x) + 0.0);
R126i.w = floatBitsToInt(-(intBitsToFloat(R125i.z)));
R126i.y = floatBitsToInt(-(intBitsToFloat(R127i.w)));
// 2
R127i.x = floatBitsToInt(-(intBitsToFloat(R125i.x)));
R125i.y = floatBitsToInt(-(intBitsToFloat(R127i.y)));
R6i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.w), intBitsToFloat(R4i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(R126i.z)));
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z), intBitsToFloat(R4i.w)));
// 3
R1i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(PV0iw),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.z),intBitsToFloat(R127i.w),1.0,0.0)));
PV1iy = R1i.x;
PV1iz = R1i.x;
PV1iw = R1i.x;
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(R4i.w)));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.z),intBitsToFloat(R127i.w),intBitsToFloat(R126i.z),0.0)));
PV0ix = tempi.x;
R1i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(R127i.w)));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.z),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.z),intBitsToFloat(R126i.z),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R1i.z = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y), intBitsToFloat(R127i.y)));
// 6
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.z),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R124i.x),1.0,0.0)));
PV0iy = R0i.x;
PV0iz = R0i.x;
PV0iw = R0i.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R124i.x)));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),1.0,0.0)));
PV1ix = tempi.x;
R0i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R124i.x)));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R0i.z = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R7i.z)));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.z),intBitsToFloat(R3i.z),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),1.0,0.0)));
PV1ix = tempi.x;
R3i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R5i.z)));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.z),intBitsToFloat(R3i.z),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R3i.z = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(R126i.z)));
// 11
R2i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.w),intBitsToFloat(R126i.y),1.0,0.0)));
PV1iy = R2i.x;
PV1iz = R2i.x;
PV1iw = R2i.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R126i.z)));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.w),intBitsToFloat(R126i.y),1.0,0.0)));
PV0ix = tempi.x;
R2i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R126i.z)));
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.w),intBitsToFloat(R126i.y),1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R2i.z = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z), intBitsToFloat(R124i.x)));
// 14
R8i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R9i.x),intBitsToFloat(R9i.y),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),1.0,0.0)));
PV0iy = R8i.x;
PV0iz = R8i.x;
PV0iw = R8i.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(R124i.x)));
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),1.0,0.0)));
PV1ix = tempi.x;
R8i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R124i.x)));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R125i.y),1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R8i.z = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R7i.z)));
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.w),intBitsToFloat(R5i.w),intBitsToFloat(PS0i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),1.0,0.0)));
PV1ix = tempi.x;
R4i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R5i.z)));
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.w),intBitsToFloat(R5i.w),intBitsToFloat(PS1i),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y),1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R4i.z = tempi.x;
PV0iw = tempi.x;
}
// export
passParameterSem7 = vec4(intBitsToFloat(R6i.x), intBitsToFloat(R6i.y), intBitsToFloat(R6i.z), intBitsToFloat(R6i.w));
// export
passParameterSem0 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R8i.x), intBitsToFloat(R8i.y), intBitsToFloat(R8i.z), intBitsToFloat(R8i.w));
// export
// skipped export to semanticId 255
// export
passParameterSem4 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
// export
passParameterSem5 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
// export
// skipped export to semanticId 255
}
