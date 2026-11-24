#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 340382e6fbbb3951
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[11];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2DArray textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 2) uniform sampler2D textureUnitPS2;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
layout(location = 0) out vec4 passPixelColor0;
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
R0i = floatBitsToInt(passParameterSem0);
R1i = floatBitsToInt(passParameterSem1);
if( activeMaskStackC[1] == true ) {
R7i.xyz = floatBitsToInt(texture(textureUnitPS2, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
R1i.w = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
}
if( activeMaskStackC[1] == true ) {
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R7i.x) * 2.0 + -(1.0));
R127i.y = floatBitsToInt(intBitsToFloat(R7i.y) * 2.0 + -(1.0));
PV0iz = 0;
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R1i.w)),intBitsToFloat(uf_remappedPS[0].x)) + -(intBitsToFloat(uf_remappedPS[1].z)));
R126i.w = 0x3f800000;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV0iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.y),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R127i.w)));
// 2
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R127i.w)));
PV0iy = floatBitsToInt(-(intBitsToFloat(PV1ix)) + 1.0);
R126i.z = R127i.w;
R3i.w = floatBitsToInt(max(intBitsToFloat(R127i.w), -(intBitsToFloat(R127i.w))));
R125i.w = 0x3f800000;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R125i.x),intBitsToFloat(R126i.z),intBitsToFloat(R126i.w)),vec4(intBitsToFloat(uf_remappedPS[2].x),intBitsToFloat(uf_remappedPS[2].y),intBitsToFloat(uf_remappedPS[2].z),intBitsToFloat(uf_remappedPS[2].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0iy)));
// 4
R126i.x = 0;
R5i.y = 0;
R127i.z = floatBitsToInt(-(intBitsToFloat(PS1i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(uf_remappedPS[3].w)));
R124i.w = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R6i.z = 0;
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R125i.x),intBitsToFloat(R126i.z),intBitsToFloat(R127i.w)),vec4(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(uf_remappedPS[3].y),intBitsToFloat(uf_remappedPS[3].z),1.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 7
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R3i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(uf_remappedPS[4].w)));
R6i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(R124i.w));
// 8
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R3i.w)) + intBitsToFloat(R2i.x));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R3i.w)) + intBitsToFloat(R125i.x));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)) + intBitsToFloat(R126i.z));
PV0iw = floatBitsToInt(max(intBitsToFloat(R1i.y), -(intBitsToFloat(R1i.y))));
tempResultf = max(0.0, intBitsToFloat(uf_remappedPS[5].w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R4i.w = floatBitsToInt(tempResultf);
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R125i.w)),vec4(intBitsToFloat(uf_remappedPS[2].x),intBitsToFloat(uf_remappedPS[2].y),intBitsToFloat(uf_remappedPS[2].z),intBitsToFloat(uf_remappedPS[2].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R6i.y = floatBitsToInt(-(intBitsToFloat(PV0iw)) + 1.0);
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R125i.x),intBitsToFloat(R126i.z),intBitsToFloat(R127i.w)),vec4(intBitsToFloat(uf_remappedPS[4].x),intBitsToFloat(uf_remappedPS[4].y),intBitsToFloat(uf_remappedPS[4].z),1.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R1i.x = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R125i.w)),vec4(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(uf_remappedPS[3].y),intBitsToFloat(uf_remappedPS[3].z),intBitsToFloat(uf_remappedPS[3].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R7i.y = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(R124i.w));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R125i.w)),vec4(intBitsToFloat(uf_remappedPS[4].x),intBitsToFloat(uf_remappedPS[4].y),intBitsToFloat(uf_remappedPS[4].z),intBitsToFloat(uf_remappedPS[4].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(R1i.x));
// 13
R127i.x = floatBitsToInt(-(intBitsToFloat(R6i.x)) + intBitsToFloat(PS0i));
R126i.y = floatBitsToInt(-(intBitsToFloat(R6i.x)) + intBitsToFloat(PS0i));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(R1i.x));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.w), intBitsToFloat(uf_remappedPS[6].w)));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(uf_remappedPS[6].w)));
// 14
R3i.x = floatBitsToInt(-(intBitsToFloat(R7i.y)) + intBitsToFloat(PV1iz));
PV0iy = floatBitsToInt(-(intBitsToFloat(R7i.y)) + intBitsToFloat(PV1iz));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(uf_remappedPS[6].z)) + intBitsToFloat(PV1iw));
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z),intBitsToFloat(uf_remappedPS[6].z)) + intBitsToFloat(PS1i));
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(PV0iy),intBitsToFloat(R126i.x),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(PV0iy),intBitsToFloat(R126i.x),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x),intBitsToFloat(uf_remappedPS[6].y)) + intBitsToFloat(R122i.x));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0),vec4(intBitsToFloat(uf_remappedPS[6].x),intBitsToFloat(uf_remappedPS[6].y),1.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
PS0i = floatBitsToInt(sqrt(intBitsToFloat(PV1ix)));
// 17
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x),intBitsToFloat(uf_remappedPS[6].x)) + intBitsToFloat(R127i.x));
R126i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(R1i.x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 18
R4i.z = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(R124i.w));
PV0iw = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3db4b4b5));
// 19
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedPS[5].y)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R4i.z)) + intBitsToFloat(R126i.w));
// 20
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(PV1ix)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(PV1ix)));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(PV1ix)));
}
while( activeMaskStackC[1] == true )
{
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R1i.y = ((4.0 > intBitsToFloat(R6i.z))?-1:0);
// 1
predResult = (R1i.y == 0);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R1i.y = R5i.y;
}
if( activeMaskStackC[2] == true ) {
break;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R123i.w = floatBitsToInt(intBitsToFloat(R6i.z) * 4.0 + 0.0);
// 1
R8i.x = floatBitsToInt(intBitsToFloat(R123i.w) + 1.0);
R9i.y = floatBitsToInt(intBitsToFloat(R123i.w) + 2.0);
R8i.z = floatBitsToInt(intBitsToFloat(R123i.w) + 3.0);
R5i.w = floatBitsToInt(intBitsToFloat(R123i.w) + 4.0);
// 2
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(R8i.x)) + intBitsToFloat(R6i.x));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R8i.x)) + intBitsToFloat(R7i.y));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(R9i.y)) + intBitsToFloat(R6i.x));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R9i.y)) + intBitsToFloat(R7i.y));
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(R8i.z)) + intBitsToFloat(R6i.x));
// 3
PV1ix = floatBitsToInt(max(intBitsToFloat(R1i.y), -(1.0)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R8i.z)) + intBitsToFloat(R7i.y));
PV1iz = floatBitsToInt(max(intBitsToFloat(R1i.x), -(1.0)));
PV1iw = floatBitsToInt(max(intBitsToFloat(R1i.z), -(1.0)));
R127i.w = floatBitsToInt(max(intBitsToFloat(R1i.w), -(1.0)));
// 4
PV0ix = floatBitsToInt(min(intBitsToFloat(PV1iz), 1.0));
PV0iy = floatBitsToInt(min(intBitsToFloat(PV1ix), 1.0));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(R5i.w)) + intBitsToFloat(R6i.x));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R5i.w)) + intBitsToFloat(R7i.y));
R127i.y = floatBitsToInt(min(intBitsToFloat(PV1iw), 1.0));
// 5
R127i.x = floatBitsToInt(max(intBitsToFloat(R2i.y), -(1.0)));
R126i.y = floatBitsToInt(intBitsToFloat(R1i.x) + -(intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt(max(intBitsToFloat(R2i.x), -(1.0)));
PV1iw = floatBitsToInt(min(intBitsToFloat(R127i.w), 1.0));
R125i.y = floatBitsToInt(intBitsToFloat(R1i.y) + -(intBitsToFloat(PV0iy)));
// 6
PV0ix = floatBitsToInt(max(intBitsToFloat(R2i.w), -(1.0)));
PV0iy = floatBitsToInt(max(intBitsToFloat(R2i.z), -(1.0)));
R127i.z = floatBitsToInt(intBitsToFloat(R1i.z) + -(intBitsToFloat(R127i.y)));
R127i.w = floatBitsToInt(intBitsToFloat(R1i.w) + -(intBitsToFloat(PV1iw)));
PS0i = floatBitsToInt(min(intBitsToFloat(PV1iz), 1.0));
// 7
PV1ix = floatBitsToInt(min(intBitsToFloat(R127i.x), 1.0));
R127i.y = floatBitsToInt(intBitsToFloat(R2i.x) + -(intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(min(intBitsToFloat(PV0iy), 1.0));
PV1iw = floatBitsToInt(min(intBitsToFloat(PV0ix), 1.0));
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R8i.x)) + intBitsToFloat(R4i.z));
// 8
PV0ix = floatBitsToInt(0.0);
R124i.y = floatBitsToInt(intBitsToFloat(R2i.y) + -(intBitsToFloat(PV1ix)));
R126i.z = floatBitsToInt(intBitsToFloat(R2i.z) + -(intBitsToFloat(PV1iz)));
R126i.w = floatBitsToInt(intBitsToFloat(R2i.w) + -(intBitsToFloat(PV1iw)));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R9i.y)) + intBitsToFloat(R4i.z));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.y),intBitsToFloat(R125i.y),intBitsToFloat(PV0ix),intBitsToFloat(0x80000000)),vec4(1.0,1.0,1.0,0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R8i.z)) + intBitsToFloat(R4i.z));
// 10
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.z),intBitsToFloat(R127i.w),intBitsToFloat(R127i.w),intBitsToFloat(0x80000000)),vec4(1.0,1.0,0.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.z = ((intBitsToFloat(PV1ix) != 0.0)?-1:0);
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.y),intBitsToFloat(R124i.y),intBitsToFloat(R124i.y),intBitsToFloat(0x80000000)),vec4(1.0,1.0,0.0,0.0)));
PV1ix = tempi.x;
R127i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = ((intBitsToFloat(PV0ix) != 0.0)?-1:0);
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.z),intBitsToFloat(R126i.w),intBitsToFloat(R126i.w),intBitsToFloat(0x80000000)),vec4(1.0,1.0,0.0,0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.z = R127i.z | PS1i;
// 13
PV1iy = ((intBitsToFloat(R127i.y) != 0.0)?-1:0);
R126i.w = ((intBitsToFloat(PV0ix) != 0.0)?-1:0);
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z),intBitsToFloat(R5i.w)) + intBitsToFloat(R4i.z));
// 14
PV0ix = PV1iy | R127i.z;
// 15
R3i.y = R126i.w | PV0ix;
// 16
predResult = (R3i.y != 0);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R1i.y = R5i.y;
}
if( activeMaskStackC[2] == true ) {
break;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
PV0ix = R1i.z;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
PV0iy = floatBitsToInt(-(intBitsToFloat(R1i.w)));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) / 2.0);
PV0iz = R1i.x;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
PV0iw = floatBitsToInt(-(intBitsToFloat(R1i.y)));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
R127i.y = R2i.x;
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) / 2.0);
// 1
R1i.x = floatBitsToInt(intBitsToFloat(PV0iz) + 0.5);
R1i.y = floatBitsToInt(intBitsToFloat(PV0iw) + 0.5);
R1i.z = floatBitsToInt(intBitsToFloat(PV0ix) + 0.5);
R1i.w = floatBitsToInt(intBitsToFloat(PV0iy) + 0.5);
PS1i = floatBitsToInt(-(intBitsToFloat(R2i.y)));
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 2
R2i.x = floatBitsToInt(intBitsToFloat(R127i.y) + 0.5);
R2i.y = floatBitsToInt(intBitsToFloat(PS1i) + 0.5);
PV0iz = floatBitsToInt(-(intBitsToFloat(R2i.w)));
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) / 2.0);
PV0iw = R2i.z;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
R4i.x = 0;
// 3
backupReg0i = R3i.x;
R3i.x = floatBitsToInt(intBitsToFloat(PV0iw) + 0.5);
R3i.y = floatBitsToInt(intBitsToFloat(PV0iz) + 0.5);
R2i.z = backupReg0i;
R2i.w = 0x3f800000;
R5i.x = 0;
}
if( activeMaskStackC[1] == true ) {
R1i.x = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y))).x);
R1i.y = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R1i.z),intBitsToFloat(R1i.w))).x);
R1i.z = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y))).x);
R1i.w = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y))).x);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R126i.x = 0;
R125i.y = R0i.z;
R127i.z = R4i.y;
R127i.w = 0x3f800000;
R125i.w = 0x3f800000;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.x),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedPS[7].x),intBitsToFloat(uf_remappedPS[7].y),intBitsToFloat(uf_remappedPS[7].z),intBitsToFloat(uf_remappedPS[7].w))));
PV1ix = tempi.x;
R127i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.x = 0;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.x),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w)),vec4(intBitsToFloat(uf_remappedPS[7].x),intBitsToFloat(uf_remappedPS[7].y),intBitsToFloat(uf_remappedPS[7].z),intBitsToFloat(uf_remappedPS[7].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R126i.w = tempi.x;
R126i.z = R0i.w;
// 3
backupReg0i = R127i.y;
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w), intBitsToFloat(uf_remappedPS[8].w)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(uf_remappedPS[8].w)));
R127i.w = 0x3f800000;
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.x),intBitsToFloat(R2i.z),intBitsToFloat(PV1ix)),vec4(intBitsToFloat(uf_remappedPS[8].x),intBitsToFloat(uf_remappedPS[8].y),intBitsToFloat(uf_remappedPS[8].z),1.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(R126i.w));
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R5i.x),intBitsToFloat(R127i.z),intBitsToFloat(R127i.y)),vec4(intBitsToFloat(uf_remappedPS[8].x),intBitsToFloat(uf_remappedPS[8].y),intBitsToFloat(uf_remappedPS[8].z),1.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.z = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(R127i.x));
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.x),intBitsToFloat(R125i.y),intBitsToFloat(R125i.w)),vec4(intBitsToFloat(uf_remappedPS[7].x),intBitsToFloat(uf_remappedPS[7].y),intBitsToFloat(uf_remappedPS[7].z),intBitsToFloat(uf_remappedPS[7].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.x = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(R126i.y));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.x),intBitsToFloat(R125i.y),intBitsToFloat(R125i.w)),vec4(intBitsToFloat(uf_remappedPS[8].x),intBitsToFloat(uf_remappedPS[8].y),intBitsToFloat(uf_remappedPS[8].z),intBitsToFloat(uf_remappedPS[8].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R125i.x),intBitsToFloat(R126i.z),intBitsToFloat(R127i.w)),vec4(intBitsToFloat(uf_remappedPS[7].x),intBitsToFloat(uf_remappedPS[7].y),intBitsToFloat(uf_remappedPS[7].z),intBitsToFloat(uf_remappedPS[7].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(PS1i));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R125i.x),intBitsToFloat(R126i.z),intBitsToFloat(R127i.w)),vec4(intBitsToFloat(uf_remappedPS[8].x),intBitsToFloat(uf_remappedPS[8].y),intBitsToFloat(uf_remappedPS[8].z),intBitsToFloat(uf_remappedPS[8].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 10
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].y),-(intBitsToFloat(R127i.x))) + -(intBitsToFloat(uf_remappedPS[0].z)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].y),-(intBitsToFloat(R127i.z))) + -(intBitsToFloat(uf_remappedPS[0].z)));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].y),-(intBitsToFloat(R125i.y))) + -(intBitsToFloat(uf_remappedPS[0].z)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(PS1i));
// 11
R1i.x = floatBitsToInt(intBitsToFloat(R1i.x) + -(intBitsToFloat(R123i.y)));
R1i.y = floatBitsToInt(intBitsToFloat(R1i.y) + -(intBitsToFloat(R123i.x)));
R0i.z = floatBitsToInt(intBitsToFloat(R1i.z) + -(intBitsToFloat(R123i.z)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].y),-(intBitsToFloat(PV0iw))) + -(intBitsToFloat(uf_remappedPS[0].z)));
// 12
R2i.x = ((0.0 > intBitsToFloat(R1i.x))?-1:0);
R1i.z = ((0.0 > intBitsToFloat(R0i.z))?-1:0);
R0i.w = ((0.0 > intBitsToFloat(R1i.y))?-1:0);
R1i.w = floatBitsToInt(intBitsToFloat(R1i.w) + -(intBitsToFloat(R123i.w)));
// 13
PV1iy = R2i.x | R0i.w;
R2i.y = ((0.0 > intBitsToFloat(R1i.w))?-1:0);
// 14
PV0ix = R1i.z | PV1iy;
// 15
R2i.z = R2i.y | PV0ix;
// 16
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
R127i.x = ((R0i.w == 0)?(0x41800000):(R9i.y));
R127i.y = ((R2i.x == 0)?(0x41800000):(R8i.x));
R127i.z = ((R2i.y == 0)?(0x41800000):(R5i.w));
R127i.w = ((R1i.z == 0)?(0x41800000):(R8i.z));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedPS[9].x));
// 1
R126i.x = floatBitsToInt(intBitsToFloat(R3i.w) * intBitsToFloat(PS0i));
R126i.x = clampFI32(R126i.x);
PV1iy = floatBitsToInt(min(intBitsToFloat(R127i.y), intBitsToFloat(R127i.x)));
R126i.z = floatBitsToInt(max(intBitsToFloat(R1i.x), -(intBitsToFloat(R1i.x))));
R126i.w = floatBitsToInt(max(intBitsToFloat(R1i.y), -(intBitsToFloat(R1i.y))));
R125i.z = floatBitsToInt(max(intBitsToFloat(R0i.z), -(intBitsToFloat(R0i.z))));
// 2
PV0ix = floatBitsToInt(min(intBitsToFloat(R127i.w), intBitsToFloat(PV1iy)));
R126i.y = floatBitsToInt(max(intBitsToFloat(R1i.w), -(intBitsToFloat(R1i.w))));
// 3
R5i.y = floatBitsToInt(min(intBitsToFloat(R127i.z), intBitsToFloat(PV0ix)));
// 4
backupReg0i = R127i.x;
backupReg1i = R127i.z;
R127i.x = ((intBitsToFloat(R127i.y) == intBitsToFloat(R5i.y))?-1:0);
R127i.y = ((intBitsToFloat(R127i.w) == intBitsToFloat(R5i.y))?-1:0);
R127i.z = ((intBitsToFloat(backupReg0i) == intBitsToFloat(R5i.y))?-1:0);
PV0iw = floatBitsToInt(intBitsToFloat(R5i.y) * 0.0625);
R125i.y = ((intBitsToFloat(backupReg1i) == intBitsToFloat(R5i.y))?-1:0);
// 5
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R6i.y)));
// 6
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV1iy)));
PV0iw = clampFI32(PV0iw);
// 7
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].z), intBitsToFloat(PV0iw)));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(R4i.w)));
// 9
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0ix)));
// 10
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].x), intBitsToFloat(PS1i)));
// 11
PV1ix = ((intBitsToFloat(PV0iw) > intBitsToFloat(R126i.z))?-1:0);
PV1iy = ((intBitsToFloat(PV0iw) > intBitsToFloat(R125i.z))?-1:0);
PV1iz = ((intBitsToFloat(PV0iw) > intBitsToFloat(R126i.y))?-1:0);
PV1iw = ((intBitsToFloat(PV0iw) > intBitsToFloat(R126i.w))?-1:0);
// 12
R123i.x = ((R127i.z == 0)?(0):(PV1iw));
R127i.y = ((R127i.y == 0)?(0):(PV1iy));
R123i.z = ((R127i.x == 0)?(0):(PV1ix));
R126i.w = ((R125i.y == 0)?(0):(PV1iz));
// 13
PV1iz = R123i.z | R123i.x;
// 14
PV0ix = R127i.y | PV1iz;
// 15
R1i.y = R126i.w | PV0ix;
}
if( activeMaskStackC[2] == true ) {
break;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R6i.z = floatBitsToInt(intBitsToFloat(R6i.z) + 1.0);
}
}
if( activeMaskStackC[1] == true ) {
// 0
R123i.x = floatBitsToInt(intBitsToFloat(R0i.x) * 2.0 + -(1.0));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),intBitsToFloat(R5i.y)) + intBitsToFloat(R6i.x));
PV0iz = floatBitsToInt(intBitsToFloat(R5i.y) * 0.0625);
R123i.w = floatBitsToInt(intBitsToFloat(R0i.y) * 2.0 + -(1.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R3i.z));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R123i.x)),intBitsToFloat(R123i.x)) + 1.0);
PV1iy = floatBitsToInt(-(intBitsToFloat(PV0iz)) + 1.0);
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R123i.w)),intBitsToFloat(R123i.w)) + 1.0);
PV1iw = floatBitsToInt(intBitsToFloat(uf_remappedPS[9].w) * intBitsToFloat(PS0i));
PV1iw = clampFI32(PV1iw);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y),intBitsToFloat(R5i.y)) + intBitsToFloat(R7i.y));
// 2
backupReg0i = R1i.y;
PV0ix = floatBitsToInt(max(intBitsToFloat(PV1iy), intBitsToFloat(0x3dcccccd)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.z), intBitsToFloat(R123i.x)));
R2i.z = floatBitsToInt(-(intBitsToFloat(PV1iw)) + 1.0);
R0i.w = ((backupReg0i == 0)?(0):(0x3f800000));
PS0i = R127i.y;
PS0i = floatBitsToInt(intBitsToFloat(PS0i) / 2.0);
// 3
PV1ix = floatBitsToInt(-(intBitsToFloat(R126i.y)));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) / 2.0);
R0i.z = floatBitsToInt(roundEven(1.0));
PV1iw = floatBitsToInt(min(intBitsToFloat(PV0ix), 1.0));
R0i.x = floatBitsToInt(intBitsToFloat(PS0i) + 0.5);
// 4
R0i.y = floatBitsToInt(intBitsToFloat(PV1ix) + 0.5);
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(PV1iw)));
}
if( activeMaskStackC[1] == true ) {
R0i.xyz = floatBitsToInt(texture(textureUnitPS0, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z))).xyz);
}
if( activeMaskStackC[1] == true ) {
// 0
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(uf_remappedPS[10].w)));
PV0iw = clampFI32(PV0iw);
// 1
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(PV0iw)));
// 2
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R1i.y)));
// 3
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R2i.z)));
// 4
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(R0i.w)));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].x), intBitsToFloat(PV0iy)));
R2i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].y), intBitsToFloat(PV0iy)));
// 6
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV1ix)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PV1ix)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PV1ix)));
}
// export
passPixelColor0 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
}
