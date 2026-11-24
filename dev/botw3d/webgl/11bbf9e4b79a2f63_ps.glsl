#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 11bbf9e4b79a2f63
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[1];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler3D textureUnitPS0;
in vec4 passParameterSem0;
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
ivec4 R10i = ivec4(0);
ivec4 R11i = ivec4(0);
ivec4 R12i = ivec4(0);
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
if( activeMaskStackC[1] == true ) {
// 0
R0i.w = uf_remappedPS[0].x;
}
if( activeMaskStackC[1] == true ) {
R1i.w = floatBitsToInt(textureLod(textureUnitPS0, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z)),intBitsToFloat(R0i.w)).x);
R1i.z = floatBitsToInt(textureLodOffset(textureUnitPS0, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z)),intBitsToFloat(R0i.w),ivec3(1,0,0)).x);
R1i.y = floatBitsToInt(textureLodOffset(textureUnitPS0, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z)),intBitsToFloat(R0i.w),ivec3(2,0,0)).x);
R1i.x = floatBitsToInt(textureLodOffset(textureUnitPS0, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z)),intBitsToFloat(R0i.w),ivec3(3,0,0)).x);
R2i.w = floatBitsToInt(textureLodOffset(textureUnitPS0, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z)),intBitsToFloat(R0i.w),ivec3(0,1,0)).x);
R2i.z = floatBitsToInt(textureLodOffset(textureUnitPS0, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z)),intBitsToFloat(R0i.w),ivec3(1,1,0)).x);
R2i.y = floatBitsToInt(textureLodOffset(textureUnitPS0, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z)),intBitsToFloat(R0i.w),ivec3(2,1,0)).x);
R2i.x = floatBitsToInt(textureLodOffset(textureUnitPS0, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z)),intBitsToFloat(R0i.w),ivec3(3,1,0)).x);
}
if( activeMaskStackC[1] == true ) {
R3i.w = floatBitsToInt(textureLodOffset(textureUnitPS0, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z)),intBitsToFloat(R0i.w),ivec3(0,2,0)).x);
R3i.z = floatBitsToInt(textureLodOffset(textureUnitPS0, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z)),intBitsToFloat(R0i.w),ivec3(1,2,0)).x);
R3i.y = floatBitsToInt(textureLodOffset(textureUnitPS0, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z)),intBitsToFloat(R0i.w),ivec3(2,2,0)).x);
R3i.x = floatBitsToInt(textureLodOffset(textureUnitPS0, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z)),intBitsToFloat(R0i.w),ivec3(3,2,0)).x);
R4i.w = floatBitsToInt(textureLodOffset(textureUnitPS0, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z)),intBitsToFloat(R0i.w),ivec3(0,3,0)).x);
R4i.z = floatBitsToInt(textureLodOffset(textureUnitPS0, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z)),intBitsToFloat(R0i.w),ivec3(1,3,0)).x);
R4i.y = floatBitsToInt(textureLodOffset(textureUnitPS0, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z)),intBitsToFloat(R0i.w),ivec3(2,3,0)).x);
R4i.x = floatBitsToInt(textureLodOffset(textureUnitPS0, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z)),intBitsToFloat(R0i.w),ivec3(3,3,0)).x);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
PV0ix = floatBitsToInt(min(intBitsToFloat(R1i.y), intBitsToFloat(R1i.x)));
PV0iy = floatBitsToInt(min(intBitsToFloat(R1i.w), intBitsToFloat(R1i.z)));
PV0iz = floatBitsToInt(max(intBitsToFloat(R1i.y), intBitsToFloat(R1i.x)));
PV0iw = floatBitsToInt(max(intBitsToFloat(R1i.w), intBitsToFloat(R1i.z)));
R127i.w = floatBitsToInt(max(intBitsToFloat(R2i.w), intBitsToFloat(R2i.z)));
// 1
PV1ix = floatBitsToInt(min(intBitsToFloat(R2i.w), intBitsToFloat(R2i.z)));
PV1iy = floatBitsToInt(max(intBitsToFloat(PV0iw), intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(max(intBitsToFloat(R2i.y), intBitsToFloat(R2i.x)));
PV1iw = floatBitsToInt(min(intBitsToFloat(PV0iy), intBitsToFloat(PV0ix)));
PS1i = floatBitsToInt(min(intBitsToFloat(R2i.y), intBitsToFloat(R2i.x)));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) + 0.0);
PV0iy = floatBitsToInt(max(intBitsToFloat(R127i.w), intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) + 0.0);
PV0iw = floatBitsToInt(min(intBitsToFloat(PV1ix), intBitsToFloat(PS1i)));
R127i.w = floatBitsToInt(max(intBitsToFloat(R3i.w), intBitsToFloat(R3i.z)));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) + 0.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) + 0.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) + 0.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV0ix) + 0.0);
PS1i = floatBitsToInt(max(intBitsToFloat(R3i.y), intBitsToFloat(R3i.x)));
// 4
R127i.x = floatBitsToInt(intBitsToFloat(PV1iy) + 0.0);
PV0iy = floatBitsToInt(max(intBitsToFloat(R127i.w), intBitsToFloat(PS1i)));
R127i.z = floatBitsToInt(intBitsToFloat(PV1iw) + 0.0);
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + 0.0);
PS0i = floatBitsToInt(intBitsToFloat(PV1iz) + 0.0);
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PS0i) + 0.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iy) + 0.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) + 0.0);
PV1iw = floatBitsToInt(min(intBitsToFloat(R3i.w), intBitsToFloat(R3i.z)));
PS1i = floatBitsToInt(min(intBitsToFloat(R3i.y), intBitsToFloat(R3i.x)));
// 6
R126i.x = floatBitsToInt(min(intBitsToFloat(R127i.x), intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iy) + 0.0);
R126i.z = floatBitsToInt(max(intBitsToFloat(R127i.z), intBitsToFloat(PV1iz)));
PV0iw = floatBitsToInt(min(intBitsToFloat(PV1iw), intBitsToFloat(PS1i)));
R127i.w = floatBitsToInt(max(intBitsToFloat(R4i.w), intBitsToFloat(R4i.z)));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) + 0.0);
PV1iy = floatBitsToInt(max(intBitsToFloat(R4i.y), intBitsToFloat(R4i.x)));
R127i.z = floatBitsToInt(intBitsToFloat(PV0iy) + 0.0);
PV1iw = floatBitsToInt(min(intBitsToFloat(R4i.w), intBitsToFloat(R4i.z)));
PS1i = floatBitsToInt(min(intBitsToFloat(R4i.y), intBitsToFloat(R4i.x)));
// 8
PV0ix = floatBitsToInt(intBitsToFloat(PV1ix) + 0.0);
PV0iy = floatBitsToInt(max(intBitsToFloat(R127i.w), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(min(intBitsToFloat(PV1iw), intBitsToFloat(PS1i)));
// 9
R127i.x = floatBitsToInt(intBitsToFloat(PV0ix) + 0.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0iy) + 0.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) + 0.0);
// 10
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + 0.0);
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + 0.0);
// 11
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) + 0.0);
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) + 0.0);
// 12
PV0ix = floatBitsToInt(min(intBitsToFloat(R127i.x), intBitsToFloat(PV1ix)));
PV0iy = floatBitsToInt(max(intBitsToFloat(R127i.z), intBitsToFloat(PV1iz)));
// 13
R5i.z = floatBitsToInt(min(intBitsToFloat(R126i.x), intBitsToFloat(PV0ix)));
R5i.w = floatBitsToInt(max(intBitsToFloat(R126i.z), intBitsToFloat(PV0iy)));
// 14
PV0iy = floatBitsToInt(intBitsToFloat(R5i.w) * 255.0);
R126i.z = floatBitsToInt(intBitsToFloat(R5i.z) * 255.0);
// 15
R127i.w = int(uint(intBitsToFloat(PV0iy)));
// 16
R127i.y = R127i.w & 0xff;
PS0i = int(uint(intBitsToFloat(R126i.z)));
// 17
R126i.x = (uint(PS0i) >= uint(R127i.w))?int(0xFFFFFFFFu):int(0x0);
PV1iw = PS0i << 0x8;
// 18
R5i.y = ((R126i.x == 0)?(0):(0x3f800000));
PV0iz = PV1iw & 0xff00;
// 19
R12i.x = R127i.y | PV0iz;
R0i.y = 0;
R0i.z = 0;
R0i.w = 0;
// 20
R0i.x = ((R126i.x == 0)?(0):(R12i.x));
R0i.y = ((R126i.x == 0)?(0):(R0i.y));
R0i.z = ((R126i.x == 0)?(0):(R0i.z));
R0i.w = ((R126i.x == 0)?(0):(R0i.w));
// 21
predResult = (R5i.y == 0);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R3i.z) + 0.0);
R127i.y = floatBitsToInt(intBitsToFloat(R3i.y) + 0.0);
R125i.z = floatBitsToInt(intBitsToFloat(R5i.w) + -(intBitsToFloat(R5i.z)));
R127i.w = floatBitsToInt(intBitsToFloat(R4i.w) + 0.0);
R127i.x = floatBitsToInt(intBitsToFloat(R1i.z) + 0.0);
// 1
R126i.x = floatBitsToInt(intBitsToFloat(R1i.y) + 0.0);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R125i.z)));
R127i.z = floatBitsToInt(intBitsToFloat(R2i.w) + 0.0);
R126i.w = floatBitsToInt(intBitsToFloat(R3i.w) + 0.0);
R126i.y = floatBitsToInt(intBitsToFloat(PV0ix) + 0.0);
// 2
R125i.x = floatBitsToInt(intBitsToFloat(R4i.y) + 0.0);
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) + 0.0);
R126i.z = floatBitsToInt(intBitsToFloat(R127i.w) + 0.0);
R127i.w = floatBitsToInt(intBitsToFloat(R3i.x) + 0.0);
R124i.x = floatBitsToInt(1.0 / intBitsToFloat(PV1iy));
// 3
backupReg0i = R127i.x;
backupReg1i = R127i.z;
R127i.x = floatBitsToInt(intBitsToFloat(R126i.x) + 0.0);
R125i.y = floatBitsToInt(intBitsToFloat(R1i.x) + 0.0);
R127i.z = floatBitsToInt(intBitsToFloat(R1i.w) + 0.0);
R125i.w = floatBitsToInt(intBitsToFloat(backupReg0i) + 0.0);
R126i.x = floatBitsToInt(intBitsToFloat(backupReg1i) + 0.0);
// 4
backupReg0i = R127i.w;
R0i.x = floatBitsToInt(intBitsToFloat(R126i.y) + 0.0);
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) + 0.0);
R124i.z = floatBitsToInt(intBitsToFloat(R2i.y) + 0.0);
R127i.w = floatBitsToInt(intBitsToFloat(R126i.w) + 0.0);
R0i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + 0.0);
// 5
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(intBitsToFloat(R4i.z) + 0.0);
R126i.y = floatBitsToInt(intBitsToFloat(R126i.z) + 0.0);
R126i.z = floatBitsToInt(intBitsToFloat(R4i.x) + 0.0);
R126i.w = floatBitsToInt(intBitsToFloat(backupReg0i) + 0.0);
R3i.w = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(R124i.x));
// 6
backupReg0i = R125i.y;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) + 0.0);
R125i.y = floatBitsToInt(intBitsToFloat(R127i.z) + 0.0);
R127i.z = floatBitsToInt(intBitsToFloat(R125i.w) + 0.0);
R125i.w = floatBitsToInt(intBitsToFloat(backupReg0i) + 0.0);
R124i.w = floatBitsToInt(intBitsToFloat(R126i.x) + 0.0);
// 7
R126i.x = floatBitsToInt(intBitsToFloat(R127i.w) + 0.0);
R124i.y = floatBitsToInt(intBitsToFloat(R124i.z) + 0.0);
R124i.z = floatBitsToInt(intBitsToFloat(R2i.z) + 0.0);
R127i.w = floatBitsToInt(intBitsToFloat(R2i.x) + 0.0);
R0i.w = floatBitsToInt(-(intBitsToFloat(R5i.z)) + intBitsToFloat(R0i.x));
// 8
backupReg0i = R125i.x;
backupReg1i = R127i.y;
backupReg2i = R126i.w;
R125i.x = floatBitsToInt(-(intBitsToFloat(R5i.z)) + intBitsToFloat(R126i.y));
R127i.y = floatBitsToInt(intBitsToFloat(R0i.z) + 0.0);
R125i.z = floatBitsToInt(intBitsToFloat(backupReg0i) + 0.0);
R126i.w = floatBitsToInt(-(intBitsToFloat(R5i.z)) + intBitsToFloat(backupReg1i));
R0i.z = floatBitsToInt(intBitsToFloat(backupReg2i) + 0.0);
// 9
backupReg0i = R127i.x;
backupReg1i = R125i.w;
R127i.x = floatBitsToInt(intBitsToFloat(R126i.z) + 0.0);
R125i.y = floatBitsToInt(intBitsToFloat(R125i.y) + 0.0);
R127i.z = floatBitsToInt(-(intBitsToFloat(R5i.z)) + intBitsToFloat(R127i.z));
R125i.w = floatBitsToInt(-(intBitsToFloat(R5i.z)) + intBitsToFloat(backupReg0i));
R1i.w = floatBitsToInt(intBitsToFloat(backupReg1i) + 0.0);
// 10
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(intBitsToFloat(R124i.y) + 0.0);
R124i.y = floatBitsToInt(intBitsToFloat(R124i.z) + 0.0);
R124i.z = floatBitsToInt(-(intBitsToFloat(R5i.z)) + intBitsToFloat(R124i.w));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) + 0.0);
R126i.y = floatBitsToInt(-(intBitsToFloat(R5i.z)) + intBitsToFloat(backupReg0i));
// 11
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.w)),intBitsToFloat(R126i.w)) + 1.0);
R127i.y = floatBitsToInt(-(intBitsToFloat(R5i.z)) + intBitsToFloat(R127i.y));
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.w)),intBitsToFloat(R0i.w)) + 1.0);
R124i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.w)),intBitsToFloat(backupReg0i)) + 1.0);
R125i.z = floatBitsToInt(intBitsToFloat(R125i.z) + 0.0);
// 12
backupReg0i = R127i.x;
backupReg1i = R125i.w;
R127i.x = floatBitsToInt(-(intBitsToFloat(R5i.z)) + intBitsToFloat(R125i.y));
R125i.y = floatBitsToInt(-(intBitsToFloat(R5i.z)) + intBitsToFloat(R0i.z));
R1i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.w)),intBitsToFloat(R127i.z)) + 1.0);
R125i.w = floatBitsToInt(intBitsToFloat(backupReg0i) + 0.0);
R1i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.w)),intBitsToFloat(backupReg1i)) + 1.0);
// 13
backupReg0i = R126i.x;
backupReg1i = R127i.w;
R126i.x = floatBitsToInt(intBitsToFloat(R124i.y) + 0.0);
R0i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.w)),intBitsToFloat(R124i.z)) + 1.0);
R124i.z = floatBitsToInt(-(intBitsToFloat(R5i.z)) + intBitsToFloat(R1i.w));
R127i.w = floatBitsToInt(-(intBitsToFloat(R5i.z)) + intBitsToFloat(backupReg0i));
R124i.y = floatBitsToInt(intBitsToFloat(backupReg1i) + 0.0);
// 14
R4i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.w)),intBitsToFloat(R126i.y)) + 1.0);
R126i.y = floatBitsToInt(intBitsToFloat(R126i.z) + -(0.5));
R127i.z = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0x40fffffe));
R126i.w = floatBitsToInt(intBitsToFloat(R125i.x) + -(0.5));
R124i.x = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(0x40fffffe));
// 15
backupReg0i = R127i.y;
R0i.x = floatBitsToInt(-(intBitsToFloat(R5i.z)) + intBitsToFloat(R125i.z));
R127i.y = floatBitsToInt(intBitsToFloat(R124i.w) * intBitsToFloat(0x40fffffe));
R125i.z = floatBitsToInt(intBitsToFloat(R124i.w) + -(0.5));
R8i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.w)),intBitsToFloat(backupReg0i)) + 1.0);
R8i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.w)),intBitsToFloat(R125i.y)) + 1.0);
// 16
R10i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.w)),intBitsToFloat(R127i.x)) + 1.0);
R125i.y = floatBitsToInt(intBitsToFloat(R1i.z) * intBitsToFloat(0x40fffffe));
R0i.z = floatBitsToInt(-(intBitsToFloat(R5i.z)) + intBitsToFloat(R125i.w));
R125i.w = floatBitsToInt(intBitsToFloat(R1i.z) + -(0.5));
R1i.w = floatBitsToInt(intBitsToFloat(R1i.x) + -(0.5));
// 17
R2i.x = floatBitsToInt(intBitsToFloat(R0i.y) + -(0.5));
R7i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.w)),intBitsToFloat(R124i.z)) + 1.0);
R2i.z = floatBitsToInt(intBitsToFloat(R1i.x) * intBitsToFloat(0x40fffffe));
R0i.w = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(0x40fffffe));
R2i.w = floatBitsToInt(-(intBitsToFloat(R5i.z)) + intBitsToFloat(R126i.x));
// 18
R3i.x = floatBitsToInt(-(intBitsToFloat(R5i.z)) + intBitsToFloat(R124i.y));
R1i.y = floatBitsToInt(intBitsToFloat(R4i.x) * intBitsToFloat(0x40fffffe));
R4i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.w)),intBitsToFloat(R127i.w)) + 1.0);
R4i.w = floatBitsToInt(intBitsToFloat(R4i.x) + -(0.5));
R5i.x = floatBitsToInt(max(intBitsToFloat(R126i.y), -(intBitsToFloat(R126i.y))));
// 19
R6i.x = floatBitsToInt(max(intBitsToFloat(R126i.w), -(intBitsToFloat(R126i.w))));
R2i.y = floatBitsToInt(intBitsToFloat(R125i.x) * intBitsToFloat(0x3ffffff8));
R3i.z = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(0x3ffffff8));
R7i.w = floatBitsToInt(intBitsToFloat(R8i.w) + -(0.5));
R5i.w = int(uint(intBitsToFloat(R127i.z)));
// 20
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(max(intBitsToFloat(R125i.z), -(intBitsToFloat(R125i.z))));
R3i.y = floatBitsToInt(intBitsToFloat(R8i.w) * intBitsToFloat(0x40fffffe));
R5i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.w)),intBitsToFloat(backupReg0i)) + 1.0);
R10i.w = floatBitsToInt(intBitsToFloat(R124i.w) * intBitsToFloat(0x3ffffff8));
R6i.w = int(uint(intBitsToFloat(R124i.x)));
// 21
R9i.x = floatBitsToInt(intBitsToFloat(R10i.x) + -(0.5));
R10i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.w)),intBitsToFloat(R0i.z)) + 1.0);
R0i.z = floatBitsToInt(intBitsToFloat(R8i.x) * intBitsToFloat(0x40fffffe));
R9i.w = floatBitsToInt(intBitsToFloat(R8i.x) + -(0.5));
R7i.x = int(uint(intBitsToFloat(R127i.y)));
// 22
R11i.x = floatBitsToInt(intBitsToFloat(R10i.x) * intBitsToFloat(0x40fffffe));
R8i.y = floatBitsToInt(intBitsToFloat(R1i.z) * intBitsToFloat(0x3ffffff8));
R1i.z = floatBitsToInt(max(intBitsToFloat(R125i.w), -(intBitsToFloat(R125i.w))));
R1i.w = floatBitsToInt(max(intBitsToFloat(R1i.w), -(intBitsToFloat(R1i.w))));
R4i.y = int(uint(intBitsToFloat(R125i.y)));
}
if( activeMaskStackC[2] == true ) {
// 0
R126i.x = floatBitsToInt(intBitsToFloat(R1i.x) * intBitsToFloat(0x3ffffff8));
R6i.y = floatBitsToInt(intBitsToFloat(R7i.y) + -(0.5));
R127i.z = floatBitsToInt(max(intBitsToFloat(R2i.x), -(intBitsToFloat(R2i.x))));
R124i.w = floatBitsToInt(intBitsToFloat(R7i.y) * intBitsToFloat(0x40fffffe));
R5i.y = int(uint(intBitsToFloat(R2i.z)));
// 1
R127i.x = floatBitsToInt(intBitsToFloat(R4i.z) + -(0.5));
R9i.y = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(0x3ffffff8));
R2i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.w)),intBitsToFloat(R2i.w)) + 1.0);
R126i.w = floatBitsToInt(intBitsToFloat(R4i.z) * intBitsToFloat(0x40fffffe));
R126i.z = int(uint(intBitsToFloat(R0i.w)));
// 2
backupReg0i = R3i.x;
R3i.x = floatBitsToInt(intBitsToFloat(R4i.x) * intBitsToFloat(0x3ffffff8));
R125i.y = ((intBitsToFloat(R5i.x) >= 0.375)?-1:0);
R124i.z = floatBitsToInt(max(intBitsToFloat(R4i.w), -(intBitsToFloat(R4i.w))));
R3i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R3i.w)),intBitsToFloat(backupReg0i)) + 1.0);
R1i.y = int(uint(intBitsToFloat(R1i.y)));
// 3
R124i.x = R6i.w + int(1);
R0i.y = floatBitsToInt(max(intBitsToFloat(R7i.w), -(intBitsToFloat(R7i.w))));
R125i.z = R5i.w + int(1);
R125i.w = ((intBitsToFloat(R6i.x) >= 0.375)?-1:0);
R127i.y = int(uint(intBitsToFloat(R3i.z)));
// 4
R125i.x = ((intBitsToFloat(R0i.x) >= 0.375)?-1:0);
R124i.y = R7i.x + int(1);
R3i.z = floatBitsToInt(intBitsToFloat(R5i.z) + -(0.5));
R8i.w = floatBitsToInt(intBitsToFloat(R8i.w) * intBitsToFloat(0x3ffffff8));
R126i.y = int(uint(intBitsToFloat(R2i.y)));
// 5
backupReg0i = R3i.y;
R0i.x = floatBitsToInt(max(intBitsToFloat(R9i.w), -(intBitsToFloat(R9i.w))));
R3i.y = floatBitsToInt(intBitsToFloat(R8i.x) * intBitsToFloat(0x3ffffff8));
R6i.z = floatBitsToInt(intBitsToFloat(R5i.z) * intBitsToFloat(0x40fffffe));
R127i.w = floatBitsToInt(intBitsToFloat(R10i.y) + -(0.5));
R8i.x = int(uint(intBitsToFloat(backupReg0i)));
// 6
R9i.x = floatBitsToInt(max(intBitsToFloat(R9i.x), -(intBitsToFloat(R9i.x))));
R2i.y = ((R125i.y == 0)?(R125i.z):(R127i.y));
R7i.z = floatBitsToInt(intBitsToFloat(R10i.x) * intBitsToFloat(0x3ffffff8));
R6i.w = floatBitsToInt(intBitsToFloat(R10i.y) * intBitsToFloat(0x40fffffe));
PS0i = int(uint(intBitsToFloat(R10i.w)));
// 7
backupReg0i = R124i.x;
backupReg1i = R4i.y;
R124i.x = ((intBitsToFloat(R1i.z) >= 0.375)?-1:0);
R4i.y = ((R125i.w == 0)?(backupReg0i):(R126i.y));
R125i.z = ((R125i.x == 0)?(R124i.y):(PS0i));
R10i.w = backupReg1i + int(1);
R126i.y = int(uint(intBitsToFloat(R0i.z)));
// 8
R125i.x = R5i.y + int(1);
R124i.y = ((intBitsToFloat(R1i.w) >= 0.375)?-1:0);
R0i.z = floatBitsToInt(intBitsToFloat(R7i.y) * intBitsToFloat(0x3ffffff8));
R5i.w = floatBitsToInt(max(intBitsToFloat(R6i.y), -(intBitsToFloat(R6i.y))));
R9i.w = int(uint(intBitsToFloat(R11i.x)));
// 9
R11i.x = floatBitsToInt(intBitsToFloat(R2i.z) + -(0.5));
R127i.y = R126i.z + int(1);
R127i.z = ((intBitsToFloat(R127i.z) >= 0.375)?-1:0);
R4i.w = floatBitsToInt(intBitsToFloat(R2i.z) * intBitsToFloat(0x40fffffe));
R1i.w = int(uint(intBitsToFloat(R8i.y)));
// 10
backupReg0i = R126i.x;
R126i.x = floatBitsToInt(max(intBitsToFloat(R127i.x), -(intBitsToFloat(R127i.x))));
R8i.y = floatBitsToInt(intBitsToFloat(R3i.w) + -(0.5));
R1i.z = floatBitsToInt(intBitsToFloat(R4i.z) * intBitsToFloat(0x3ffffff8));
R0i.w = floatBitsToInt(intBitsToFloat(R3i.w) * intBitsToFloat(0x40fffffe));
R125i.w = int(uint(intBitsToFloat(backupReg0i)));
// 11
backupReg0i = R124i.w;
R127i.x = R1i.y + int(1);
R125i.y = ((intBitsToFloat(R124i.z) >= 0.375)?-1:0);
R126i.z = ((intBitsToFloat(R0i.y) >= 0.375)?-1:0);
R124i.w = R8i.x + int(1);
R124i.z = int(uint(intBitsToFloat(backupReg0i)));
// 12
backupReg0i = R126i.y;
R10i.x = floatBitsToInt(intBitsToFloat(R5i.z) * intBitsToFloat(0x3ffffff8));
R126i.y = ((intBitsToFloat(R0i.x) >= 0.375)?-1:0);
R3i.z = floatBitsToInt(max(intBitsToFloat(R3i.z), -(intBitsToFloat(R3i.z))));
R7i.w = backupReg0i + int(1);
PS0i = int(uint(intBitsToFloat(R9i.y)));
// 13
backupReg0i = R126i.w;
R0i.x = ((R124i.y == 0)?(R125i.x):(R125i.w));
R9i.y = floatBitsToInt(intBitsToFloat(R10i.y) * intBitsToFloat(0x3ffffff8));
R4i.z = ((R127i.z == 0)?(R127i.y):(PS0i));
R126i.w = floatBitsToInt(max(intBitsToFloat(R127i.w), -(intBitsToFloat(R127i.w))));
R127i.w = int(uint(intBitsToFloat(backupReg0i)));
// 14
backupReg0i = R3i.x;
R3i.x = ((intBitsToFloat(R9i.x) >= 0.375)?-1:0);
R10i.y = R124i.z + int(1);
R5i.z = R9i.w + int(1);
R1i.w = ((R124i.x == 0)?(R10i.w):(R1i.w));
PS0i = int(uint(intBitsToFloat(backupReg0i)));
// 15
R11i.x = floatBitsToInt(max(intBitsToFloat(R11i.x), -(intBitsToFloat(R11i.x))));
R0i.y = floatBitsToInt(intBitsToFloat(R2i.z) * intBitsToFloat(0x3ffffff8));
R2i.z = ((intBitsToFloat(R5i.w) >= 0.375)?-1:0);
R125i.w = ((R125i.y == 0)?(R127i.x):(PS0i));
PS1i = int(uint(intBitsToFloat(R8i.w)));
// 16
backupReg0i = R6i.z;
R8i.x = R127i.w + int(1);
R8i.y = floatBitsToInt(max(intBitsToFloat(R8i.y), -(intBitsToFloat(R8i.y))));
R6i.z = ((R126i.z == 0)?(R124i.w):(PS1i));
R5i.w = ((intBitsToFloat(R126i.x) >= 0.375)?-1:0);
R125i.y = int(uint(intBitsToFloat(backupReg0i)));
// 17
R126i.x = R2i.y << 0x3;
R127i.y = R4i.y << 0x6;
R125i.z = R125i.z << 0xc;
R3i.w = floatBitsToInt(intBitsToFloat(R3i.w) * intBitsToFloat(0x3ffffff8));
PS1i = int(uint(intBitsToFloat(R3i.y)));
// 18
backupReg0i = R6i.w;
R7i.x = R125i.y + int(1);
R4i.y = ((intBitsToFloat(R3i.z) >= 0.375)?-1:0);
R3i.z = ((intBitsToFloat(R126i.w) >= 0.375)?-1:0);
R6i.w = ((R126i.y == 0)?(R7i.w):(PS1i));
PS0i = int(uint(intBitsToFloat(backupReg0i)));
// 19
backupReg0i = R7i.z;
R9i.x = R1i.w << 0x3;
R3i.y = PS0i + int(1);
R7i.z = R125i.z | R127i.y;
R1i.w = R125i.w | R126i.x;
R2i.y = int(uint(intBitsToFloat(backupReg0i)));
}
if( activeMaskStackC[2] == true ) {
// 0
R124i.x = ((intBitsToFloat(R11i.x) >= 0.375)?-1:0);
R127i.y = ((R3i.x == 0)?(R5i.z):(R2i.y));
R125i.z = R0i.x << 0x6;
R125i.w = R4i.z << 0xc;
PS0i = int(uint(intBitsToFloat(R0i.z)));
// 1
R126i.x = ((R2i.z == 0)?(R10i.y):(PS0i));
R126i.y = ((intBitsToFloat(R8i.y) >= 0.375)?-1:0);
PV1iz = R6i.z << 0x9;
R126i.w = R6i.w << 0x12;
PS1i = int(uint(intBitsToFloat(R4i.w)));
// 2
R127i.x = R125i.w | R125i.z;
R127i.y = R127i.y | R9i.x;
R125i.z = PS1i + int(1);
R125i.w = R1i.w | PV1iz;
PS0i = int(uint(intBitsToFloat(R1i.z)));
// 3
backupReg0i = R126i.x;
R126i.x = R126i.w | R7i.z;
R123i.y = ((R5i.w == 0)?(R8i.x):(PS0i));
PV1iw = backupReg0i << 0x9;
PS1i = int(uint(intBitsToFloat(R0i.w)));
// 4
PV0ix = R123i.y << 0x12;
R126i.z = R127i.y | PV1iw;
R126i.w = PS1i + int(1);
PS0i = int(uint(intBitsToFloat(R9i.y)));
// 5
R123i.x = ((R3i.z == 0)?(R3i.y):(PS0i));
R127i.w = PV0ix | R127i.x;
PS1i = int(uint(intBitsToFloat(R10i.x)));
// 6
PV0ix = R123i.x << 0x15;
R123i.w = ((R4i.y == 0)?(R7i.x):(PS1i));
PS0i = int(uint(intBitsToFloat(R0i.y)));
// 7
R126i.x = PV0ix | R126i.x;
R123i.y = ((R124i.x == 0)?(R125i.z):(PS0i));
PV1iz = R123i.w << 0xf;
PS1i = int(uint(intBitsToFloat(R3i.w)));
// 8
PV0ix = R123i.y << 0xf;
PV0iy = R125i.w | PV1iz;
R123i.z = ((R126i.y == 0)?(R126i.w):(PS1i));
// 9
backupReg0i = R126i.x;
R126i.x = R126i.z | PV0ix;
PV1iy = R123i.z << 0x15;
R126i.w = PV0iy | backupReg0i;
// 10
PV0iy = R126i.w << 0x8;
PV0iz = PV1iy | R127i.w;
// 11
backupReg0i = R126i.x;
R126i.x = PV0iy & 0xff00;
PV1iy = backupReg0i | PV0iz;
// 12
R0i.y = PV1iy & 0xffff;
PV0iz = PV1iy >> 0x10;
// 13
R0i.z = PV0iz | R126i.x;
R0i.w = R126i.w >> 0x8;
// 14
R0i.x = R12i.x;
R0i.y = R0i.y;
R0i.z = R0i.z;
R0i.w = R0i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
passPixelColor0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
}
