#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 4e66ff555828e41b
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[2];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
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
R0i = floatBitsToInt(passParameterSem0);
R1i = floatBitsToInt(passParameterSem1);
R2i.w = floatBitsToInt(texture(textureUnitPS0, vec2(intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))).x);
R2i.z = floatBitsToInt(texture(textureUnitPS0, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y))).x);
R1i.y = floatBitsToInt(texture(textureUnitPS0, vec2(intBitsToFloat(R1i.z),intBitsToFloat(R1i.w))).x);
R0i.x = floatBitsToInt(texture(textureUnitPS0, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
// 0
R127i.x = R1i.y;
R127i.y = R2i.z;
R127i.z = R2i.w;
PV0iw = ((intBitsToFloat(R0i.x) > intBitsToFloat(uf_remappedPS[0].x))?-1:0);
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.x)),intBitsToFloat(uf_remappedPS[1].y)) + 1.0);
// 1
PV1ix = ((intBitsToFloat(R127i.x) > intBitsToFloat(uf_remappedPS[0].x))?-1:0);
PV1iy = ((intBitsToFloat(R127i.y) > intBitsToFloat(uf_remappedPS[0].x))?-1:0);
PV1iz = ((intBitsToFloat(R127i.z) > intBitsToFloat(uf_remappedPS[0].x))?-1:0);
R123i.w = ((PV0iw == 0)?(R0i.x):(uf_remappedPS[0].y));
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.z)),intBitsToFloat(uf_remappedPS[1].y)) + 1.0);
// 2
R123i.x = ((PV1ix == 0)?(R127i.x):(uf_remappedPS[0].y));
R123i.y = ((PV1iy == 0)?(R127i.y):(uf_remappedPS[0].y));
R123i.z = ((PV1iz == 0)?(R127i.z):(uf_remappedPS[0].y));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R123i.w)),intBitsToFloat(uf_remappedPS[1].y)) + 1.0);
R126i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)),intBitsToFloat(uf_remappedPS[1].y)) + 1.0);
// 3
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R123i.x)),intBitsToFloat(uf_remappedPS[1].y)) + 1.0);
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R123i.y)),intBitsToFloat(uf_remappedPS[1].y)) + 1.0);
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R123i.z)),intBitsToFloat(uf_remappedPS[1].y)) + 1.0);
R125i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)),intBitsToFloat(uf_remappedPS[1].y)) + 1.0);
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.w));
// 4
R126i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[1].x)) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R123i.z));
// 5
backupReg0i = R127i.y;
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[1].x)) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 6
R125i.y = floatBitsToInt(max(intBitsToFloat(R126i.x), intBitsToFloat(R127i.y)));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[1].x)) * intBitsToFloat(PS1i));
R126i.w = floatBitsToInt(min(intBitsToFloat(R126i.x), intBitsToFloat(R127i.y)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 7
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[1].x)) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 8
R127i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[1].x)) * intBitsToFloat(PS1i));
R124i.y = floatBitsToInt(max(intBitsToFloat(R127i.z), intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(min(intBitsToFloat(R127i.z), intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iw) * 0.25);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R126i.z));
// 9
backupReg0i = R126i.y;
R0i.x = floatBitsToInt(min(intBitsToFloat(R126i.w), intBitsToFloat(PV0iz)));
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[1].x)) * intBitsToFloat(PS0i));
R123i.z = floatBitsToInt(intBitsToFloat(R127i.z) * 0.25 + intBitsToFloat(PV0iw));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 10
R123i.x = floatBitsToInt(intBitsToFloat(R127i.y) * 0.25 + intBitsToFloat(R123i.z));
R0i.y = floatBitsToInt(max(intBitsToFloat(R125i.y), intBitsToFloat(R124i.y)));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[1].x)) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R125i.w));
// 11
PV1iw = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[1].x)) * intBitsToFloat(PS0i));
R0i.w = floatBitsToInt(intBitsToFloat(R126i.x) * 0.25 + intBitsToFloat(R123i.x));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),intBitsToFloat(PV1iw)),vec4(0.25,0.25,0.25,0.25)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R0i.z = tempi.x;
PV0iw = tempi.x;
// export
passPixelColor0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
}
