#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 60f7e82a4410e862
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[4];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(1, 1, 0) uniform sampler3D textureUnitPS1;
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
R0i = floatBitsToInt(GET_FRAGCOORD());
R1i = floatBitsToInt(passParameterSem0);
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
backupReg0i = R1i.x;
R1i.x = floatBitsToInt(1.0);
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedPS[0].x)));
R1i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(uf_remappedPS[0].x)));
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedPS[1].w)) + intBitsToFloat(0x3f59999a));
R3i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(uf_remappedPS[0].x)));
// 1
R0i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3f969696));
R0i.z = clampFI32(R0i.z);
// 2
predResult = (1.0 > intBitsToFloat(uf_remappedPS[1].w));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(uf_remappedPS[2].z)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedPS[2].z)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(uf_remappedPS[2].z)));
R3i.y = R1i.z;
R3i.y = floatBitsToInt(intBitsToFloat(R3i.y) / 2.0);
}
if( activeMaskStackC[2] == true ) {
R0i.w = floatBitsToInt(texture(textureUnitPS1, vec3(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z))).x);
}
if( activeMaskStackC[2] == true ) {
// 0
R2i.x = R3i.x;
R2i.x = floatBitsToInt(intBitsToFloat(R2i.x) / 2.0);
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedPS[2].y)));
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].w),intBitsToFloat(R0i.w)) + intBitsToFloat(R3i.y));
}
if( activeMaskStackC[2] == true ) {
R1i.z = floatBitsToInt(texture(textureUnitPS1, vec3(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z))).x);
}
if( activeMaskStackC[2] == true ) {
// 0
if(  (intBitsToFloat(R0i.z) > intBitsToFloat(R1i.z))) discard;
R2i.x = ((intBitsToFloat(R0i.z) > intBitsToFloat(R1i.z))?-1:0);
}
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R2i.x != 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (intBitsToFloat(uf_remappedPS[1].w) >= 1.0);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R0i.x) * 0.25);
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedPS[1].z) + intBitsToFloat(uf_remappedPS[3].w));
PV0iy = clampFI32(PV0iy);
PV0iw = floatBitsToInt(intBitsToFloat(R0i.y) * 0.25);
// 1
PV1iy = floatBitsToInt(fract(intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) * 4.0);
PV1iz = floatBitsToInt(fract(intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt(intBitsToFloat(PV1iz) * 4.0);
R123i.w = floatBitsToInt(intBitsToFloat(PV0iy) * 7.0 + 1.0);
// 2
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PV1iy));
R127i.z = int(intBitsToFloat(R123i.w));
// 3
R127i.x = int(intBitsToFloat(PV0iy));
// 4
R127i.w = floatBitsToInt(float(R127i.z));
// 5
R127i.z = floatBitsToInt(abs(intBitsToFloat(R127i.w)));
R126i.z = floatBitsToInt(float(R127i.x));
// 6
R127i.y = floatBitsToInt(abs(intBitsToFloat(R126i.z)));
PS0i = floatBitsToInt(1.0 / abs(intBitsToFloat(R127i.w)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R126i.z)), intBitsToFloat(PS0i)));
// 8
PV0iw = floatBitsToInt(trunc(intBitsToFloat(PV1ix)));
// 9
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iw)),intBitsToFloat(R127i.z)) + intBitsToFloat(R127i.y));
// 10
PV0iz = floatBitsToInt((intBitsToFloat(R127i.x) >= abs(intBitsToFloat(R127i.w)))?1.0:0.0);
PV0iw = floatBitsToInt(-(abs(intBitsToFloat(R127i.w))) + intBitsToFloat(R127i.x));
// 11
R127i.y = ((intBitsToFloat(PV0iz) == 0.0)?(R127i.x):(PV0iw));
// 12
PV0ix = floatBitsToInt(abs(intBitsToFloat(R127i.w)) + intBitsToFloat(R127i.y));
// 13
R123i.w = ((-(intBitsToFloat(R127i.y)) > 0.0)?(PV0ix):(R127i.y));
// 14
R123i.z = ((-(intBitsToFloat(R126i.z)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.w)))):(R123i.w));
// 15
R123i.y = ((intBitsToFloat(R127i.w) == 0.0)?(R126i.z):(R123i.z));
// 16
PS0i = int(intBitsToFloat(R123i.y));
// 17
if(  (PS0i == 0)) discard;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
passPixelColor0 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.x), intBitsToFloat(R1i.x), intBitsToFloat(R1i.x));
}
