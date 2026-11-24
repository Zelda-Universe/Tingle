#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 250cb5a06cab6534
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[12];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler3D textureUnitPS0;
in vec4 passParameterSem0;
in vec4 passParameterSem2;
in vec4 passParameterSem3;
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
R0i = floatBitsToInt(GET_FRAGCOORD());
R1i = floatBitsToInt(passParameterSem0);
R2i = floatBitsToInt(passParameterSem2);
R3i = floatBitsToInt(passParameterSem3);
if( activeMaskStackC[1] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R1i.x)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedPS[0].z)));
R123i.z = floatBitsToInt(intBitsToFloat(uf_remappedPS[1].x) * -3.0 + intBitsToFloat(0xbf19999a));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedPS[0].w)));
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
R122i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x),intBitsToFloat(R1i.x)) + intBitsToFloat(0xcc1a4d90));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3fb8aa3b));
R2i.y = floatBitsToInt(intBitsToFloat(uf_remappedPS[2].x) + -(1.0));
R1i.z = floatBitsToInt(intBitsToFloat(PV0iw) + -(1.0));
PV1iw = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(0x3fc90fdb));
R124i.w = floatBitsToInt(sqrt(intBitsToFloat(R122i.x)));
// 2
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[3].y)) + 1.0);
PV0iy = ((intBitsToFloat(R3i.x) > intBitsToFloat(R1i.z))?-1:0);
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
R127i.w = uf_remappedPS[3].y;
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) / 2.0);
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
// 3
R123i.x = ((PV0iy == 0)?(R1i.z):(R3i.x));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV1iz = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
R125i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[4].y)) * 0.5 + 0.5);
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[5].y)) + 1.0);
// 4
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3f83987f));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(backupReg0i)));
R126i.w = floatBitsToInt(intBitsToFloat(uf_remappedPS[4].y) * 0.5 + 0.5);
R127i.y = floatBitsToInt(intBitsToFloat(R124i.w) * intBitsToFloat(0x3a95ae88));
// 5
backupReg0i = R127i.x;
R127i.x = ((0.0 > intBitsToFloat(R125i.z))?-1:0);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R125i.z)) + -(intBitsToFloat(backupReg0i)));
R126i.z = floatBitsToInt(max(intBitsToFloat(PV0iy), 0.0));
PV1iw = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
PS1i = uf_remappedPS[5].y;
PS1i = floatBitsToInt(intBitsToFloat(PS1i) / 2.0);
// 6
R125i.x = floatBitsToInt(intBitsToFloat(R123i.y) + intBitsToFloat(0x4c1a4d90));
R123i.y = floatBitsToInt(intBitsToFloat(R126i.y) * 2.0 + -(1.0));
R0i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[4].y)) + 0.5);
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(R127i.y)) + intBitsToFloat(PS1i));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1iw))/0.1591549367));
PS0i = floatBitsToInt(intBitsToFloat(PS0i) * 2.0);
// 7
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x),intBitsToFloat(R126i.z)) + intBitsToFloat(R127i.w));
R127i.y = floatBitsToInt(intBitsToFloat(PS0i) + -(1.0));
PV1iz = ((intBitsToFloat(R125i.x) > 0.0)?-1:0);
PV1iw = floatBitsToInt(intBitsToFloat(R123i.y) + 0.75);
PV1iw = clampFI32(PV1iw);
PS1i = floatBitsToInt(intBitsToFloat(R1i.z) + 0.75);
PS1i = clampFI32(PS1i);
// 8
PV0ix = floatBitsToInt(intBitsToFloat(R127i.y) + 1.0);
R123i.y = ((R127i.x == 0)?(0):(PV1iz));
R126i.z = floatBitsToInt(max(intBitsToFloat(PV1iw), intBitsToFloat(PS1i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(R127i.y)) + 1.0);
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedPS[6].x));
// 9
backupReg0i = R123i.y;
R123i.x = ((backupReg0i == 0)?(0x445aeaf4):(0));
R123i.y = ((backupReg0i == 0)?(0x493b34ff):(0));
R127i.z = ((backupReg0i == 0)?(0xbf800000):(0x3f800000));
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) * 0.5);
R126i.w = ((backupReg0i == 0)?(R126i.w):(R125i.w));
// 10
backupReg0i = R125i.x;
backupReg1i = R126i.z;
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(intBitsToFloat(backupReg0i) + intBitsToFloat(R123i.y));
R126i.z = floatBitsToInt(intBitsToFloat(R124i.w) + intBitsToFloat(R123i.x));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), intBitsToFloat(uf_remappedPS[7].x)));
PS0i = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(0x3d747645));
// 11
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(floor(intBitsToFloat(R125i.x)));
R124i.z = PV0iw;
R124i.z = floatBitsToInt(intBitsToFloat(R124i.z) * 2.0);
R4i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(uf_remappedPS[8].x)));
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0iy)));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.x) + 1.0);
R2i.z = floatBitsToInt(intBitsToFloat(R125i.x) + -(intBitsToFloat(PV1iy)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z),intBitsToFloat(R127i.z)) + intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.z));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(PS0i));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)),intBitsToFloat(R124i.z)) + intBitsToFloat(PV0iy));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) + 0.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + 1.0);
PS1i = floatBitsToInt(-(intBitsToFloat(R127i.x)) + 1.0);
// 14
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(uf_remappedPS[2].y)));
R0i.y = floatBitsToInt(intBitsToFloat(R127i.x) + 2.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PS1i)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(PV1ix)) + intBitsToFloat(R126i.w));
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(uf_remappedPS[2].y)));
// 15
R6i.x = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(uf_remappedPS[6].x));
R7i.y = R123i.w;
R7i.z = R0i.w;
R2i.w = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3df47645));
R8i.y = R123i.w;
// 16
R4i.x = ((intBitsToFloat(R2i.x) > intBitsToFloat(R1i.z))?-1:0);
R8i.z = R0i.w;
tempResultf = max(0.0, intBitsToFloat(R127i.y));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R0i.w = floatBitsToInt(tempResultf);
}
if( activeMaskStackC[1] == true ) {
R3i.xyzw = floatBitsToInt(texture(textureUnitPS0, vec3(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z))).xyzw);
R1i.xyzw = floatBitsToInt(texture(textureUnitPS0, vec3(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z))).xyzw);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R3i.y)) + intBitsToFloat(R1i.y));
PV0iy = floatBitsToInt(-(intBitsToFloat(R3i.x)) + intBitsToFloat(R1i.x));
PV0iz = floatBitsToInt(intBitsToFloat(R0i.w) * 1.5);
PV0iw = floatBitsToInt(-(intBitsToFloat(R3i.z)) + intBitsToFloat(R1i.z));
PS0i = floatBitsToInt(-(intBitsToFloat(R3i.w)) + intBitsToFloat(R1i.w));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R2i.z)) + intBitsToFloat(R3i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R2i.z)) + intBitsToFloat(R3i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i),intBitsToFloat(R2i.z)) + intBitsToFloat(R3i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R2i.z)) + intBitsToFloat(R3i.z));
PS1i = floatBitsToInt(exp2(intBitsToFloat(PV0iz)));
// 2
R127i.x = floatBitsToInt(max(intBitsToFloat(R123i.x), 0.0));
R127i.y = floatBitsToInt(max(intBitsToFloat(R123i.y), 0.0));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(R0i.y)));
R127i.w = floatBitsToInt(max(intBitsToFloat(R123i.w), 0.0));
PS0i = floatBitsToInt(max(intBitsToFloat(R123i.z), 0.0));
// 3
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PS0i)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R126i.w = floatBitsToInt(max(intBitsToFloat(R127i.y), intBitsToFloat(0x38d1b717)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 4
backupReg0i = R127i.x;
backupReg1i = R127i.y;
R127i.x = floatBitsToInt(intBitsToFloat(R2i.w) * intBitsToFloat(PS1i));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(R127i.w)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(backupReg0i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(backupReg1i)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedPS[6].y));
// 5
R6i.y = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(uf_remappedPS[6].x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(uf_remappedPS[6].z));
// 6
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(uf_remappedPS[9].x)));
R3i.z = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(uf_remappedPS[6].x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.w));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(intBitsToFloat(R124i.z) * intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(PS0i));
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(PV1iy)));
// 9
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PV0iz)) + intBitsToFloat(R127i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PV0ix)) + intBitsToFloat(R127i.y));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x),intBitsToFloat(PV0iy)) + intBitsToFloat(R127i.z));
// 10
PV0ix = floatBitsToInt(max(intBitsToFloat(R123i.w), 0.0));
PV0iy = floatBitsToInt(max(intBitsToFloat(R123i.x), 0.0));
PV0iw = floatBitsToInt(max(intBitsToFloat(R123i.z), 0.0));
// 11
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(uf_remappedPS[10].x)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedPS[10].y)));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedPS[10].z)));
// 12
predResult = (intBitsToFloat(uf_remappedPS[11].x) > 0.0);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = R2i.y;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) / 2.0);
R4i.y = floatBitsToInt(intBitsToFloat(uf_remappedPS[8].x) * intBitsToFloat(0x3d747645));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].x), intBitsToFloat(uf_remappedPS[7].x)));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + 1.0);
R3i.y = floatBitsToInt(intBitsToFloat(PV0iz) + 2.0);
PV1iz = floatBitsToInt(-(intBitsToFloat(PV0iz)) + 1.0);
PV1iw = floatBitsToInt(floor(intBitsToFloat(PV0ix)));
// 2
R1i.x = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3df47645));
PV0iy = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV1iw));
R1i.z = floatBitsToInt(intBitsToFloat(R2i.y) * 0.5 + -(intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(0x80000000));
// 3
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) + 1.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + 0.0);
tempResultf = max(0.0, intBitsToFloat(PV0iw));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 4
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(uf_remappedPS[2].y)));
R1i.y = floatBitsToInt(intBitsToFloat(PS1i) * 1.5);
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(uf_remappedPS[2].y)));
}
if( activeMaskStackC[2] == true ) {
R2i.xyzw = floatBitsToInt(texture(textureUnitPS0, vec3(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z))).xyzw);
R0i.xyzw = floatBitsToInt(texture(textureUnitPS0, vec3(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R8i.z))).xyzw);
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(-(intBitsToFloat(R2i.y)) + intBitsToFloat(R0i.y));
PV0iy = floatBitsToInt(-(intBitsToFloat(R2i.x)) + intBitsToFloat(R0i.x));
PV0iz = floatBitsToInt(-(intBitsToFloat(R2i.w)) + intBitsToFloat(R0i.w));
PV0iw = floatBitsToInt(-(intBitsToFloat(R2i.z)) + intBitsToFloat(R0i.z));
PS0i = floatBitsToInt(exp2(intBitsToFloat(R1i.y)));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(R1i.z)) + intBitsToFloat(R2i.y));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy),intBitsToFloat(R1i.z)) + intBitsToFloat(R2i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(R1i.z)) + intBitsToFloat(R2i.w));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(R1i.z)) + intBitsToFloat(R2i.z));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i), intBitsToFloat(R3i.y)));
// 2
R127i.x = floatBitsToInt(max(intBitsToFloat(R123i.x), 0.0));
R127i.y = floatBitsToInt(max(intBitsToFloat(R123i.y), 0.0));
PV0iz = floatBitsToInt(max(intBitsToFloat(R123i.z), 0.0));
R127i.w = floatBitsToInt(max(intBitsToFloat(R123i.w), 0.0));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 3
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PV0iz)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(max(intBitsToFloat(R127i.y), intBitsToFloat(0x38d1b717)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(PV0iz)));
PS1i = floatBitsToInt(intBitsToFloat(R1i.x) * intBitsToFloat(PS0i));
// 4
backupReg0i = R127i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R127i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(uf_remappedPS[9].x)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(backupReg0i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R127i.w)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1iz));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(PS0i));
PV1iz = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(PS0i));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(PV1iz)));
// 7
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PV0iw)) + intBitsToFloat(R127i.w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PV0ix)) + intBitsToFloat(R127i.x));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PV0iy)) + intBitsToFloat(R127i.z));
// 8
PV0ix = floatBitsToInt(max(intBitsToFloat(R123i.w), 0.0));
PV0iz = floatBitsToInt(max(intBitsToFloat(R123i.y), 0.0));
PV0iw = floatBitsToInt(max(intBitsToFloat(R123i.z), 0.0));
// 9
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw),intBitsToFloat(uf_remappedPS[10].y)) + -(intBitsToFloat(R5i.y)));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix),intBitsToFloat(uf_remappedPS[10].x)) + -(intBitsToFloat(R5i.x)));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(uf_remappedPS[10].z)) + -(intBitsToFloat(R5i.z)));
// 10
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.y),intBitsToFloat(uf_remappedPS[11].x)) + intBitsToFloat(R5i.x));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.x),intBitsToFloat(uf_remappedPS[11].x)) + intBitsToFloat(R5i.y));
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w),intBitsToFloat(uf_remappedPS[11].x)) + intBitsToFloat(R5i.z));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R5i.w = ((R4i.x == 0)?(0x3f800000):(0));
}
// export
passPixelColor0 = vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.z), intBitsToFloat(R5i.w));
}
