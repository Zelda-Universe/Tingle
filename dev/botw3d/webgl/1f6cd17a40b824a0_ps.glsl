#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 1f6cd17a40b824a0
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[1];
uniform vec2 uf_fragCoordScale;
layout(location = 0) out vec4 passPixelColor0;
layout(location = 1) out vec4 passPixelColor1;
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
ivec4 R127i = ivec4(0);
int backupReg0i, backupReg1i, backupReg2i, backupReg3i, backupReg4i;
int PV0ix = 0, PV0iy = 0, PV0iz = 0, PV0iw = 0, PV1ix = 0, PV1iy = 0, PV1iz = 0, PV1iw = 0;
int PS0i = 0, PS1i = 0;
ivec4 tempi = ivec4(0);
float tempResultf;
int tempResulti;
ivec4 ARi = ivec4(0);
bool predResult = true;
// 0
PV0ix = uf_remappedPS[0].x & 0xff;
PV0iy = uf_remappedPS[0].x & 0xff00;
PV0iz = uf_remappedPS[0].x & 0xff000000;
PV0iw = uf_remappedPS[0].x & 0xff0000;
R1i.w = floatBitsToInt(1.0);
// 1
R127i.x = PV0iy >> 0x8;
PV1iy = PV0iz >> 0x18;
R127i.z = PV0iw >> 0x10;
PS1i = floatBitsToInt(float(uint(PV0ix)));
// 2
R0i.w = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3b808081));
PS0i = floatBitsToInt(float(uint(PV1iy)));
// 3
R0i.x = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3b808081));
PS1i = floatBitsToInt(float(uint(R127i.z)));
// 4
R0i.y = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x3b808081));
PS0i = floatBitsToInt(float(uint(R127i.x)));
// 5
R0i.z = floatBitsToInt(intBitsToFloat(PS0i) * intBitsToFloat(0x3b808081));
// 6
R3i.x = R0i.x;
R3i.y = R0i.y;
R3i.z = R0i.z;
R3i.w = R0i.w;
// 7
R2i.x = R1i.x;
R2i.y = R1i.x;
R2i.z = R1i.x;
R2i.w = R1i.w;
// export
passPixelColor0 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
passPixelColor1 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
}
