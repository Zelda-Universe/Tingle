#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 0a6d118589bca0f9
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[5];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
in vec4 passParameterSem1;
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
R0i = floatBitsToInt(passParameterSem1);
R1i = floatBitsToInt(passParameterSem0);
if( activeMaskStackC[1] == true ) {
R2i.xyzw = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyzw);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R0i.w = uf_remappedPS[0].x & 0x1f;
R1i.w = 0x3f800000;
// 1
predResult = (R0i.w >= 0xe);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedPS[1].x),intBitsToFloat(uf_remappedPS[1].y),intBitsToFloat(uf_remappedPS[1].z),intBitsToFloat(uf_remappedPS[1].w))));
PV0iy = R0i.x;
PV0iz = R0i.x;
PV0iw = R0i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedPS[2].x),intBitsToFloat(uf_remappedPS[2].y),intBitsToFloat(uf_remappedPS[2].z),intBitsToFloat(uf_remappedPS[2].w))));
PV1ix = tempi.x;
R0i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R0i.x = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(R0i.x));
// 2
R0i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV1ix));
}
if( activeMaskStackC[2] == true ) {
R0i.xyzw = floatBitsToInt(texture(textureUnitPS0, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyzw);
}
if( activeMaskStackC[2] == true ) {
// 0
R0i.w = floatBitsToInt(min(intBitsToFloat(R2i.w), intBitsToFloat(R0i.w)));
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
R0i.xyzw = floatBitsToInt(texture(textureUnitPS0, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y))).xyzw);
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(uf_remappedPS[3].x)) + intBitsToFloat(uf_remappedPS[4].x));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(uf_remappedPS[3].y)) + intBitsToFloat(uf_remappedPS[4].y));
// 1
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(uf_remappedPS[3].z)) + intBitsToFloat(uf_remappedPS[4].z));
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w),intBitsToFloat(uf_remappedPS[3].w)) + intBitsToFloat(uf_remappedPS[4].w));
}
// export
passPixelColor0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
}
