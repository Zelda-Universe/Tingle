#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader a035c008d32de254
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[3];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
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
R2i.w = floatBitsToInt(texture(textureUnitPS0, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
}
if( activeMaskStackC[1] == true ) {
// 0
R127i.y = ((intBitsToFloat(R2i.w) >= intBitsToFloat(0x3f733333))?-1:0);
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R2i.w)),intBitsToFloat(uf_remappedPS[0].x)) + -(intBitsToFloat(uf_remappedPS[1].z)));
// 1
R2i.y = floatBitsToInt(max(intBitsToFloat(R123i.z), -(intBitsToFloat(R123i.z))));
// 2
PV0ix = ((intBitsToFloat(R2i.y) >= intBitsToFloat(uf_remappedPS[2].x))?-1:0);
// 3
R0i.w = ((R127i.y == 0)?(PV0ix):(int(-1)));
// 4
if(  (R0i.w != 0)) discard;
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R0i.w == 0);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
R0i.xyz = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xyz);
}
if( activeMaskStackC[1] == true ) {
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R0i.x) * 2.0 + -(1.0));
R127i.y = floatBitsToInt(intBitsToFloat(R0i.y) * 2.0 + -(1.0));
R127i.z = floatBitsToInt(intBitsToFloat(R0i.z) * 2.0 + -(1.0));
R127i.w = floatBitsToInt(-(intBitsToFloat(R2i.y)));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), -(intBitsToFloat(R2i.y))));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), -(intBitsToFloat(R2i.y))));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R127i.w),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 3
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS0i)));
R1i.w = floatBitsToInt(1.0);
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
R126i.w = floatBitsToInt(tempResultf);
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(R126i.w)));
// 5
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y), intBitsToFloat(R126i.w)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R126i.w)));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 6
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(PS1i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS1i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(PS1i)));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R126i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 8
PV0ix = floatBitsToInt(max(-(intBitsToFloat(PV1ix)), 0.0));
PV0iy = PV1ix;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
// 9
PV1ix = floatBitsToInt(min(intBitsToFloat(PV0ix), 1.0));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.x)),intBitsToFloat(PV0iy)) + intBitsToFloat(R126i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.z)),intBitsToFloat(PV0iy)) + intBitsToFloat(R126i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R127i.y)),intBitsToFloat(PV0iy)) + intBitsToFloat(R126i.y));
// 10
if(  (intBitsToFloat(R123i.z) > intBitsToFloat(uf_remappedPS[2].w))) discard;
R1i.y = floatBitsToInt(intBitsToFloat(R123i.w) * 0.5 + 0.5);
R0i.w = floatBitsToInt(-(intBitsToFloat(PV1ix)) + 1.0);
R1i.x = floatBitsToInt(intBitsToFloat(R123i.y) * 0.5 + 0.5);
}
if( activeMaskStackC[1] == true ) {
// 0
tempResultf = max(0.0, intBitsToFloat(R0i.w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1iy = floatBitsToInt(intBitsToFloat(PS0i) * 5.0);
// 2
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iy)));
// 3
R1i.z = floatBitsToInt(intBitsToFloat(PS0i) * 25.0);
R1i.z = clampFI32(R1i.z);
}
// export
passPixelColor0 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
}
