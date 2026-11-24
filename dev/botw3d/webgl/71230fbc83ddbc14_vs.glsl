#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;

vec4 zmGather(sampler2D s, vec2 uv, int c) {
	vec2 sz = vec2(textureSize(s, 0)); vec2 p = uv * sz - 0.5; ivec2 i = ivec2(floor(p));
	ivec2 m = textureSize(s, 0) - 1;
	vec4 a = texelFetch(s, clamp(i + ivec2(0, 1), ivec2(0), m), 0), b = texelFetch(s, clamp(i + ivec2(1, 1), ivec2(0), m), 0);
	vec4 d = texelFetch(s, clamp(i + ivec2(1, 0), ivec2(0), m), 0), e = texelFetch(s, clamp(i, ivec2(0), m), 0);
	return vec4(a[c], b[c], d[c], e[c]);
}
vec4 zmGather(sampler2DArray s, vec3 uv, int c) {
	ivec3 t = textureSize(s, 0); vec2 p = uv.xy * vec2(t.xy) - 0.5; ivec2 i = ivec2(floor(p)); ivec2 m = t.xy - 1; int l = int(uv.z + 0.5);
	vec4 a = texelFetch(s, ivec3(clamp(i + ivec2(0, 1), ivec2(0), m), l), 0), b = texelFetch(s, ivec3(clamp(i + ivec2(1, 1), ivec2(0), m), l), 0);
	vec4 d = texelFetch(s, ivec3(clamp(i + ivec2(1, 0), ivec2(0), m), l), 0), e = texelFetch(s, ivec3(clamp(i, ivec2(0), m), l), 0);
	return vec4(a[c], b[c], d[c], e[c]);
}
// shader 71230fbc83ddbc14
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define XFB_BLOCK_LAYOUT(__bufferIndex, __stride, __location) layout(xfb_buffer = __bufferIndex, xfb_stride = __stride)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[57];
uniform float uf_pointSize;
uniform int uf_verticesPerInstance;
uniform int uf_streamoutBufferBase0;
uniform int uf_streamoutBufferBase1;
TEXTURE_LAYOUT(37, 0, 0) uniform sampler3D textureUnitVS5;
TEXTURE_LAYOUT(38, 0, 1) uniform sampler2D textureUnitVS6;
TEXTURE_LAYOUT(39, 0, 2) uniform sampler2D textureUnitVS7;
TEXTURE_LAYOUT(44, 0, 3) uniform sampler2DArrayShadow textureUnitVS12;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;
ATTR_LAYOUT(0, 2) in uvec4 attrDataSem2;
ATTR_LAYOUT(0, 3) in uvec4 attrDataSem3;
ATTR_LAYOUT(0, 4) in uvec4 attrDataSem4;
ATTR_LAYOUT(0, 5) in uvec4 attrDataSem5;
ATTR_LAYOUT(0, 6) in uvec4 attrDataSem6;
ATTR_LAYOUT(0, 7) in uvec4 attrDataSem7;
ATTR_LAYOUT(0, 8) in uvec4 attrDataSem8;
ATTR_LAYOUT(0, 9) in uvec4 attrDataSem9;
ATTR_LAYOUT(0, 10) in uvec4 attrDataSem10;
ATTR_LAYOUT(0, 11) in uvec4 attrDataSem11;

buffer StreamoutBuffer
{
int sb_buffer[];
};
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
ivec4 R17i = ivec4(0);
ivec4 R18i = ivec4(0);
ivec4 R19i = ivec4(0);
ivec4 R20i = ivec4(0);
ivec4 R21i = ivec4(0);
ivec4 R22i = ivec4(0);
ivec4 R23i = ivec4(0);
ivec4 R24i = ivec4(0);
ivec4 R25i = ivec4(0);
ivec4 R26i = ivec4(0);
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
int sbBase0 = uf_streamoutBufferBase0/4 + (gl_VertexID + uf_verticesPerInstance * gl_InstanceID)*4;
int sbBase1 = uf_streamoutBufferBase1/4 + (gl_VertexID + uf_verticesPerInstance * gl_InstanceID)*4;
R0i = ivec4(gl_VertexID, 0, 0, gl_InstanceID);
attrDecoder = attrDataSem6;
R7i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem7;
R8i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem8;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R9i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem9;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R10i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem11;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R12i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem10;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R11i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem0;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem1;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem2;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R3i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem3;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R4i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem4;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R5i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
attrDecoder = attrDataSem5;
attrDecoder = uvec4((attrDecoder>>24)|((attrDecoder>>8)&0xFF00u)|((attrDecoder<<8)&0xFF0000u)|((attrDecoder<<24)));
R6i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), int(attrDecoder.w));
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R23i.x = floatBitsToInt(-(intBitsToFloat(R10i.w)) + intBitsToFloat(uf_remappedVS[0].x));
R127i.y = uf_remappedVS[1].y & 0x200;
R15i.z = floatBitsToInt(intBitsToFloat(R11i.y) + -(0.5));
R4i.w = floatBitsToInt(intBitsToFloat(R11i.x) + -(0.5));
R12i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R2i.x)));
// 1
R13i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R2i.y)));
R12i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R2i.x)));
R22i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(R2i.x)));
R18i.w = floatBitsToInt(max(intBitsToFloat(R23i.x), 0.0));
R13i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(R2i.y)));
// 2
R24i.x = 0;
R0i.y = 0;
R24i.z = ((intBitsToFloat(0x3a83126f) >= intBitsToFloat(R18i.w))?-1:0);
R5i.w = floatBitsToInt(intBitsToFloat(R11i.z) + -(0.5));
R23i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.w), intBitsToFloat(R2i.z)));
// 3
R8i.x = ((R24i.z == 0)?(R8i.x):(R10i.x));
R8i.y = ((R24i.z == 0)?(R8i.y):(R10i.y));
R8i.z = ((R24i.z == 0)?(R8i.z):(R10i.z));
R0i.z = 0;
// 4
R123i.x = ((R24i.z == 0)?(R7i.y):(R9i.y));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(R8i.x)));
R123i.z = ((R24i.z == 0)?(R7i.x):(R9i.x));
R127i.w = ((R24i.z == 0)?(R7i.z):(R9i.z));
PS0i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(R8i.y)));
// 5
R7i.x = floatBitsToInt(intBitsToFloat(R123i.z) + intBitsToFloat(PV0iy));
R7i.y = floatBitsToInt(intBitsToFloat(R123i.x) + intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(R8i.z)));
R25i.x = floatBitsToInt(1.0);
// 6
R22i.x = 0;
R10i.y = floatBitsToInt(intBitsToFloat(R3i.y) * 1.0);
R7i.z = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1iw));
R9i.x = 0;
// 7
R22i.y = floatBitsToInt(intBitsToFloat(R3i.y) * 1.0);
R9i.z = floatBitsToInt(intBitsToFloat(R3i.z) * 1.0);
R14i.y = (R127i.y == 0x200)?-1:0;
// 8
predResult = (R14i.y != 0);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R17i.x = uf_remappedVS[2].x;
R17i.y = uf_remappedVS[2].y;
R17i.z = uf_remappedVS[2].z;
R0i.w = uf_remappedVS[2].w;
// 1
R16i.x = uf_remappedVS[3].x;
R16i.y = uf_remappedVS[3].y;
R16i.z = uf_remappedVS[3].z;
R0i.w = uf_remappedVS[3].w;
// 2
R18i.x = uf_remappedVS[4].x;
R18i.y = uf_remappedVS[4].y;
R18i.z = uf_remappedVS[4].z;
R0i.w = uf_remappedVS[4].w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
PV0ix = uf_remappedVS[1].y & 0x800;
PV0iw = uf_remappedVS[1].y & 0x400;
// 1
R26i.x = (PV0ix == 0x800)?-1:0;
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].y), intBitsToFloat(uf_remappedVS[5].w)));
R25i.z = (PV0iw == 0x400)?-1:0;
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].x), intBitsToFloat(uf_remappedVS[5].w)));
// 2
R127i.x = ((R25i.z == 0)?(R18i.z):(R6i.z));
R127i.y = ((R25i.z == 0)?(R18i.y):(R6i.y));
R127i.z = ((R25i.z == 0)?(R18i.x):(R6i.x));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].z), intBitsToFloat(uf_remappedVS[5].w)));
// 3
R10i.x = uf_remappedVS[1].x & 0x8;
R126i.y = ((R25i.z == 0)?(R16i.z):(R5i.z));
R126i.z = ((R25i.z == 0)?(R16i.y):(R5i.y));
R127i.w = ((R25i.z == 0)?(R16i.x):(R5i.x));
tempResultf = max(0.0, intBitsToFloat(uf_remappedVS[6].x));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1i = floatBitsToInt(tempResultf);
// 4
R126i.x = ((R25i.z == 0)?(R17i.x):(R4i.x));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(PS1i)));
R125i.z = ((R25i.z == 0)?(R17i.z):(R4i.z));
R126i.w = ((R25i.z == 0)?(R17i.y):(R4i.y));
// 5
R17i.x = ((R26i.x == 0)?(R127i.z):(R6i.x));
R16i.y = ((R26i.x == 0)?(R127i.y):(R6i.y));
R12i.z = ((R26i.x == 0)?(R127i.x):(R6i.z));
R125i.w = floatBitsToInt(exp2(intBitsToFloat(PV0iy)));
// 6
R16i.x = ((R26i.x == 0)?(R127i.w):(R5i.x));
R17i.y = ((R26i.x == 0)?(R126i.z):(R5i.y));
R13i.z = ((R26i.x == 0)?(R126i.y):(R5i.z));
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(R125i.w)));
// 7
R15i.x = ((R26i.x == 0)?(R126i.x):(R4i.x));
R23i.y = ((R26i.x == 0)?(R126i.w):(R4i.y));
R14i.z = ((R26i.x == 0)?(R125i.z):(R4i.z));
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(R125i.w)));
// 8
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R125i.w)));
// 9
predResult = (R10i.x == 0x8);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.x), intBitsToFloat(R0i.x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.x), intBitsToFloat(R0i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.y), intBitsToFloat(R0i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R23i.y), intBitsToFloat(R0i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.z), intBitsToFloat(R0i.y)));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R14i.z), intBitsToFloat(R0i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R17i.x), intBitsToFloat(R0i.z)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R16i.y), intBitsToFloat(R0i.z)));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1iy));
R0i.y = floatBitsToInt(intBitsToFloat(PS1i) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.z), intBitsToFloat(R0i.z)));
R0i.x = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PV1iw));
// 3
R0i.z = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0ix));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(R0i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(R0i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(R0i.x)));
R0i.w = uf_remappedVS[1].y & 0x2;
// 1
R18i.x = floatBitsToInt(intBitsToFloat(R5i.x) + intBitsToFloat(PV0iz));
R18i.y = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV0iy));
R18i.z = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(PV0ix));
// 2
predResult = (R0i.w == 0x2);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
PV0iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[6].x)) + 1.0);
PV0iz = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[0].w)) + 1.0);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz), intBitsToFloat(PV0iy)));
// 2
R0i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[6].x) + intBitsToFloat(PV1ix));
}
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (intBitsToFloat(uf_remappedVS[7].w) == 1.0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R0i.z = ((intBitsToFloat(R0i.w) == 1.0)?-1:0);
// 1
predResult = (R0i.z == 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0iy = floatBitsToInt(-(intBitsToFloat(R0i.w)) + 1.0);
tempResultf = max(0.0, intBitsToFloat(R0i.w));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.w), intBitsToFloat(PS0i)));
R127i.x = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 2
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1ix)));
// 3
PV1iz = floatBitsToInt(-(intBitsToFloat(PS0i)) + 1.0);
// 4
R8i.w = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(R127i.x));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R8i.w = R18i.w;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
activeMaskStack[2] = activeMaskStack[2] == false;
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R8i.w = R18i.w;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
R4i.x = ((intBitsToFloat(uf_remappedVS[7].x) == 1.0)?-1:0);
R0i.y = 0x3ea0d845;
R0i.z = 0x3f6d3112;
PV0iw = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].x) * intBitsToFloat(0x3c23d70a));
// 1
R123i.y = ((R4i.x == 0)?(R11i.y):(R0i.y));
R123i.z = ((R4i.x == 0)?(R11i.x):(R22i.x));
R123i.w = ((R4i.x == 0)?(R11i.z):(R0i.z));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(PV0iw)));
// 2
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R123i.z)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R123i.y)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R123i.w)));
// 3
predResult = (R4i.x != 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = R4i.w;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) * 2.0);
R127i.y = R5i.w;
R127i.y = floatBitsToInt(intBitsToFloat(R127i.y) * 2.0);
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[8].y) * intBitsToFloat(0x3c23d70a));
R127i.w = R15i.z;
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) * 2.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), intBitsToFloat(R4i.z)));
// 1
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(PV0iz)));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R127i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R127i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy), intBitsToFloat(R127i.x)));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0iy));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R127i.z));
PV1iz = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV0ix));
// 4
R0i.x = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(PV1iy));
R0i.y = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(PV1iz));
R0i.z = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(PV1ix));
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(R4i.z)));
R4i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[0].w) * 1.0);
R8i.z = floatBitsToInt(intBitsToFloat(R8i.w) + intBitsToFloat(R0i.x));
// 1
PV1iy = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(R8i.z));
R9i.w = ((R4i.x == 0)?(0):(PV0ix));
// 2
R4i.x = floatBitsToInt(intBitsToFloat(R9i.w) + intBitsToFloat(PV1iy));
R10i.w = ((intBitsToFloat(R9i.w) == 0.0)?-1:0);
// 3
predResult = (R10i.w != 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R4i.z = ((intBitsToFloat(uf_remappedVS[7].y) == 1.0)?-1:0);
// 1
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R0i.x = uf_remappedVS[10].x;
R5i.y = uf_remappedVS[10].y;
R0i.w = uf_remappedVS[10].w;
R5i.x = uf_remappedVS[10].z;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R0i.x = 0x40800000;
R5i.y = 0x40400000;
R0i.w = 0x3fc00000;
R5i.x = 0x40000000;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R6i.x = uf_remappedVS[11].x;
R6i.y = uf_remappedVS[11].z;
R5i.z = uf_remappedVS[11].y;
R8i.x = uf_remappedVS[11].w;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R6i.x = 0x3f19999a;
R6i.y = 0x3e6b851f;
R5i.z = 0x3ed70a3d;
R8i.x = 0x3e19999a;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R5i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.x)));
// 1
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R8i.x)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 2
PV0iy = floatBitsToInt(intBitsToFloat(R8i.z) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 3
PV1iz = floatBitsToInt(intBitsToFloat(R8i.z) * intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fd8));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fd8));
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iw = floatBitsToInt(intBitsToFloat(R8i.z) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R8i.z) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x40c90fd8));
R123i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e22f983) + 0.5);
// 6
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fd8));
// 7
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R123i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iw = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 8
PV0ix = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
R123i.z = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1iw))/0.1591549367));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PS0i)));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + 0.0);
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1ix))/0.1591549367));
// 11
PV1iz = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(PV1iz));
// 13
R0i.x = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iy));
// 14
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = uf_remappedVS[10].x;
R5i.y = uf_remappedVS[10].w;
R5i.z = uf_remappedVS[10].z;
R0i.w = uf_remappedVS[10].y;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = 0x40800000;
R5i.y = 0x3fc00000;
R5i.z = 0x40000000;
R0i.w = 0x40400000;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R6i.x = uf_remappedVS[11].x;
R6i.y = uf_remappedVS[11].z;
R6i.z = uf_remappedVS[11].y;
R8i.x = uf_remappedVS[11].w;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R6i.x = 0x3f19999a;
R6i.y = 0x3e6b851f;
R6i.z = 0x3ed70a3d;
R8i.x = 0x3e19999a;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.x)));
// 1
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R8i.x)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 2
PV0iy = floatBitsToInt(intBitsToFloat(R4i.x) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 3
PV1iz = floatBitsToInt(intBitsToFloat(R4i.x) * intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fd8));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fd8));
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iw = floatBitsToInt(intBitsToFloat(R4i.x) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x40c90fd8));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV1iz = floatBitsToInt(intBitsToFloat(R4i.x) * intBitsToFloat(PS0i));
R123i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e22f983) + 0.5);
// 6
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fd8));
// 7
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R123i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iw = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 8
PV0ix = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
R123i.z = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1iw))/0.1591549367));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PS0i)));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + 0.0);
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1ix))/0.1591549367));
// 11
PV1iz = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(PV1iz));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iy));
// 14
R11i.w = floatBitsToInt(-(intBitsToFloat(R0i.x)) + intBitsToFloat(PV1ix));
}
activeMaskStack[2] = activeMaskStack[2] == false;
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R4i.z = ((intBitsToFloat(uf_remappedVS[7].y) == 1.0)?-1:0);
// 1
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = uf_remappedVS[10].x;
R5i.y = uf_remappedVS[10].y;
R0i.w = uf_remappedVS[10].w;
R6i.x = uf_remappedVS[10].z;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = 0x40800000;
R5i.y = 0x40400000;
R0i.w = 0x3fc00000;
R6i.x = 0x40000000;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R8i.x = uf_remappedVS[11].x;
R6i.y = uf_remappedVS[11].z;
R5i.z = uf_remappedVS[11].y;
R10i.x = uf_remappedVS[11].w;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R8i.x = 0x3f19999a;
R6i.y = 0x3e6b851f;
R5i.z = 0x3ed70a3d;
R10i.x = 0x3e19999a;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R8i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R5i.z)));
R6i.w = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(R9i.w));
// 1
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R10i.x)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 2
PV0iy = floatBitsToInt(intBitsToFloat(R0i.x) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fd8));
PV1iz = floatBitsToInt(intBitsToFloat(R0i.x) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R0i.x) * intBitsToFloat(PS1i));
R123i.z = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fd8));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 5
R123i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fd8));
PV1iw = floatBitsToInt(intBitsToFloat(R0i.x) * intBitsToFloat(PS0i));
// 6
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fd8));
PV0iz = floatBitsToInt(fract(intBitsToFloat(backupReg0i)));
R123i.w = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R123i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3e22f983) + 0.5);
// 8
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R123i.z = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV0iw = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1ix))/0.1591549367));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PS0i)));
R123i.z = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0iw))/0.1591549367));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iy) + 0.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1ix))/0.1591549367));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0iy));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 12
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PV1iz));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PS1i)));
// 13
R0i.x = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0iy));
// 14
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = uf_remappedVS[10].x;
R5i.y = uf_remappedVS[10].z;
R5i.z = uf_remappedVS[10].y;
R6i.x = uf_remappedVS[10].w;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = 0x40800000;
R5i.y = 0x40000000;
R5i.z = 0x40400000;
R6i.x = 0x3fc00000;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R8i.x = uf_remappedVS[11].x;
R6i.y = uf_remappedVS[11].w;
R6i.z = uf_remappedVS[11].z;
R0i.w = uf_remappedVS[11].y;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R8i.x = 0x3f19999a;
R6i.y = 0x3e19999a;
R6i.z = 0x3e6b851f;
R0i.w = 0x3ed70a3d;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R0i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R8i.x)));
// 1
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.z)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.y)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 2
PV0iy = floatBitsToInt(intBitsToFloat(R6i.w) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 3
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fd8));
PV1iw = floatBitsToInt(intBitsToFloat(R6i.w) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fd8));
PV0iz = floatBitsToInt(intBitsToFloat(R6i.w) * intBitsToFloat(PS1i));
R123i.w = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fd8));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R123i.z = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iw = floatBitsToInt(intBitsToFloat(R6i.w) * intBitsToFloat(PS0i));
// 6
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fd8));
PV0iw = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
// 7
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R123i.y = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iz = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e22f983) + 0.5);
// 8
PV0ix = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1iz))/0.1591549367));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PS0i)));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) + 0.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1ix))/0.1591549367));
// 11
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PV1iw));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iy));
// 14
R6i.z = floatBitsToInt(-(intBitsToFloat(R0i.x)) + intBitsToFloat(PV1ix));
// 15
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R0i.x = uf_remappedVS[10].x;
R5i.y = uf_remappedVS[10].y;
R0i.w = uf_remappedVS[10].w;
R5i.x = uf_remappedVS[10].z;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R0i.x = 0x40800000;
R5i.y = 0x40400000;
R0i.w = 0x3fc00000;
R5i.x = 0x40000000;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R6i.x = uf_remappedVS[11].x;
R6i.y = uf_remappedVS[11].z;
R5i.z = uf_remappedVS[11].y;
R8i.x = uf_remappedVS[11].w;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R6i.x = 0x3f19999a;
R6i.y = 0x3e6b851f;
R5i.z = 0x3ed70a3d;
R8i.x = 0x3e19999a;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R5i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.x)));
// 1
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R8i.x)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 2
PV0iy = floatBitsToInt(intBitsToFloat(R8i.z) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 3
PV1iz = floatBitsToInt(intBitsToFloat(R8i.z) * intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fd8));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fd8));
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iw = floatBitsToInt(intBitsToFloat(R8i.z) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R8i.z) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x40c90fd8));
R123i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e22f983) + 0.5);
// 6
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fd8));
// 7
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R123i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iw = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 8
PV0ix = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
R123i.z = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1iw))/0.1591549367));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PS0i)));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + 0.0);
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1ix))/0.1591549367));
// 11
PV1iz = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(PV1iz));
// 13
R0i.x = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iy));
// 14
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = uf_remappedVS[10].x;
R5i.y = uf_remappedVS[10].w;
R5i.z = uf_remappedVS[10].z;
R0i.w = uf_remappedVS[10].y;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = 0x40800000;
R5i.y = 0x3fc00000;
R5i.z = 0x40000000;
R0i.w = 0x40400000;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R6i.x = uf_remappedVS[11].x;
R6i.y = uf_remappedVS[11].z;
R8i.z = uf_remappedVS[11].y;
R8i.x = uf_remappedVS[11].w;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R6i.x = 0x3f19999a;
R6i.y = 0x3e6b851f;
R8i.z = 0x3ed70a3d;
R8i.x = 0x3e19999a;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R8i.z)));
// 1
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.y)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R8i.x)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 2
PV0iz = floatBitsToInt(intBitsToFloat(R4i.x) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fd8));
PV1iw = floatBitsToInt(intBitsToFloat(R4i.x) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R4i.x) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fd8));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 5
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fd8));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV1iw = floatBitsToInt(intBitsToFloat(R4i.x) * intBitsToFloat(PS0i));
// 6
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fd8));
PV0iw = floatBitsToInt(fract(intBitsToFloat(backupReg0i)));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e22f983) + 0.5);
// 8
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV0iy = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
R123i.w = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1ix))/0.1591549367));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R123i.y = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0iy))/0.1591549367));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + 0.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1ix))/0.1591549367));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0iy));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 12
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.y), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PV1iw));
// 13
PV1iy = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PV0iz));
// 14
PV0ix = floatBitsToInt(-(intBitsToFloat(R0i.x)) + intBitsToFloat(PV1iy));
// 15
R11i.w = floatBitsToInt(-(intBitsToFloat(R6i.z)) + intBitsToFloat(PV0ix));
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
R13i.w = floatBitsToInt(intBitsToFloat(R8i.w) + intBitsToFloat(R0i.y));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(R13i.w));
// 2
R5i.y = floatBitsToInt(intBitsToFloat(R9i.w) + intBitsToFloat(PV1ix));
// 3
predResult = (R10i.w != 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R0i.x = uf_remappedVS[10].x;
R5i.z = uf_remappedVS[10].w;
R0i.w = uf_remappedVS[10].z;
R4i.x = uf_remappedVS[10].y;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R0i.x = 0x40800000;
R5i.z = 0x3fc00000;
R0i.w = 0x40000000;
R4i.x = 0x40400000;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = uf_remappedVS[11].x;
R0i.y = uf_remappedVS[11].y;
R6i.w = uf_remappedVS[11].w;
R6i.x = uf_remappedVS[11].z;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = 0x3f19999a;
R0i.y = 0x3ed70a3d;
R6i.w = 0x3e19999a;
R6i.x = 0x3e6b851f;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R5i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R0i.y)));
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.w)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R13i.w) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 3
PV1iy = floatBitsToInt(intBitsToFloat(R13i.w) * intBitsToFloat(PS0i));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fd8));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 4
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iz = floatBitsToInt(intBitsToFloat(R13i.w) * intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fd8));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fd8));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iw = floatBitsToInt(intBitsToFloat(R13i.w) * intBitsToFloat(PS0i));
// 6
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fd8));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 7
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iy = floatBitsToInt(fract(intBitsToFloat(backupReg0i)));
PV1iz = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e22f983) + 0.5);
// 8
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R123i.y = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV0iw = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1iz))/0.1591549367));
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R123i.z = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0iw))/0.1591549367));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + 0.0);
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1iy))/0.1591549367));
// 11
PV1iy = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PS1i)));
// 13
R0i.w = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0ix));
// 14
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R0i.x = uf_remappedVS[10].x;
R0i.y = uf_remappedVS[10].z;
R5i.z = uf_remappedVS[10].y;
R4i.x = uf_remappedVS[10].w;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R0i.x = 0x40800000;
R0i.y = 0x40000000;
R5i.z = 0x40400000;
R4i.x = 0x3fc00000;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = uf_remappedVS[11].x;
R6i.y = uf_remappedVS[11].w;
R6i.z = uf_remappedVS[11].z;
R6i.w = uf_remappedVS[11].y;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = 0x3f19999a;
R6i.y = 0x3e19999a;
R6i.z = 0x3e6b851f;
R6i.w = 0x3ed70a3d;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R5i.x)));
// 1
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.z)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.y)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 2
PV0iy = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 3
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fd8));
PV1iw = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fd8));
PV0iz = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(PS1i));
R123i.w = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fd8));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R123i.z = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iw = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(PS0i));
// 6
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fd8));
PV0iw = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
// 7
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R123i.y = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iz = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e22f983) + 0.5);
// 8
PV0ix = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1iz))/0.1591549367));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PS0i)));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) + 0.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1ix))/0.1591549367));
// 11
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PV1iw));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iy));
// 14
R5i.z = floatBitsToInt(-(intBitsToFloat(R0i.w)) + intBitsToFloat(PV1ix));
}
activeMaskStack[2] = activeMaskStack[2] == false;
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R0i.x = uf_remappedVS[10].x;
R6i.y = uf_remappedVS[10].y;
R0i.w = uf_remappedVS[10].w;
R4i.x = uf_remappedVS[10].z;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R0i.x = 0x40800000;
R6i.y = 0x40400000;
R0i.w = 0x3fc00000;
R4i.x = 0x40000000;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = uf_remappedVS[11].x;
R8i.y = uf_remappedVS[11].z;
R5i.z = uf_remappedVS[11].y;
R6i.x = uf_remappedVS[11].w;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = 0x3f19999a;
R8i.y = 0x3e6b851f;
R5i.z = 0x3ed70a3d;
R6i.x = 0x3e19999a;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R5i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R5i.z)));
R6i.w = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(R9i.w));
// 1
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R8i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.x)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 2
PV0iy = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fd8));
PV1iz = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(PS1i));
R123i.z = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fd8));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 5
R123i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fd8));
PV1iw = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(PS0i));
// 6
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fd8));
PV0iz = floatBitsToInt(fract(intBitsToFloat(backupReg0i)));
R123i.w = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R123i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3e22f983) + 0.5);
// 8
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R123i.z = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV0iw = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1ix))/0.1591549367));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PS0i)));
R123i.z = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0iw))/0.1591549367));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iy) + 0.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1ix))/0.1591549367));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0iy));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 12
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PV1iz));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PS1i)));
// 13
R0i.x = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0iy));
// 14
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R4i.x = uf_remappedVS[10].x;
R0i.y = uf_remappedVS[10].z;
R5i.z = uf_remappedVS[10].y;
R5i.x = uf_remappedVS[10].w;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R4i.x = 0x40800000;
R0i.y = 0x40000000;
R5i.z = 0x40400000;
R5i.x = 0x3fc00000;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R6i.x = uf_remappedVS[11].x;
R6i.y = uf_remappedVS[11].w;
R6i.z = uf_remappedVS[11].z;
R0i.w = uf_remappedVS[11].y;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R6i.x = 0x3f19999a;
R6i.y = 0x3e19999a;
R6i.z = 0x3e6b851f;
R0i.w = 0x3ed70a3d;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R0i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.x)));
// 1
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.z)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.y)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 2
PV0iy = floatBitsToInt(intBitsToFloat(R6i.w) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 3
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fd8));
PV1iw = floatBitsToInt(intBitsToFloat(R6i.w) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fd8));
PV0iz = floatBitsToInt(intBitsToFloat(R6i.w) * intBitsToFloat(PS1i));
R123i.w = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fd8));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R123i.z = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iw = floatBitsToInt(intBitsToFloat(R6i.w) * intBitsToFloat(PS0i));
// 6
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fd8));
PV0iw = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
// 7
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R123i.y = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iz = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e22f983) + 0.5);
// 8
PV0ix = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1iz))/0.1591549367));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PS0i)));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iy) + 0.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1ix))/0.1591549367));
// 11
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0iz));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PV1iw));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iy));
// 14
R5i.z = floatBitsToInt(-(intBitsToFloat(R0i.x)) + intBitsToFloat(PV1ix));
// 15
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R0i.x = uf_remappedVS[10].x;
R0i.y = uf_remappedVS[10].y;
R0i.w = uf_remappedVS[10].w;
R4i.x = uf_remappedVS[10].z;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R0i.x = 0x40800000;
R0i.y = 0x40400000;
R0i.w = 0x3fc00000;
R4i.x = 0x40000000;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = uf_remappedVS[11].x;
R6i.y = uf_remappedVS[11].z;
R6i.z = uf_remappedVS[11].y;
R6i.x = uf_remappedVS[11].w;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = 0x3f19999a;
R6i.y = 0x3e6b851f;
R6i.z = 0x3ed70a3d;
R6i.x = 0x3e19999a;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R5i.x)));
// 1
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.x)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 2
PV0iy = floatBitsToInt(intBitsToFloat(R13i.w) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 3
PV1iz = floatBitsToInt(intBitsToFloat(R13i.w) * intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fd8));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fd8));
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iw = floatBitsToInt(intBitsToFloat(R13i.w) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R13i.w) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x40c90fd8));
R123i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e22f983) + 0.5);
// 6
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fd8));
// 7
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R123i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iw = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 8
PV0ix = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
R123i.z = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1iw))/0.1591549367));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PS0i)));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + 0.0);
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1ix))/0.1591549367));
// 11
PV1iz = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(PV1iz));
// 13
R0i.x = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iy));
// 14
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R4i.x = uf_remappedVS[10].x;
R0i.y = uf_remappedVS[10].w;
R6i.z = uf_remappedVS[10].z;
R0i.w = uf_remappedVS[10].y;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R4i.x = 0x40800000;
R0i.y = 0x3fc00000;
R6i.z = 0x40000000;
R0i.w = 0x40400000;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = uf_remappedVS[11].x;
R6i.y = uf_remappedVS[11].z;
R8i.z = uf_remappedVS[11].y;
R6i.x = uf_remappedVS[11].w;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = 0x3f19999a;
R6i.y = 0x3e6b851f;
R8i.z = 0x3ed70a3d;
R6i.x = 0x3e19999a;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R5i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R8i.z)));
// 1
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.y)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 2
PV0iw = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x40c90fd8));
PV1iz = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fd8));
R123i.z = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 5
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fd8));
PV1iz = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
// 6
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV0iz = floatBitsToInt(fract(intBitsToFloat(backupReg0i)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fd8));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.w = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 8
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV0iy = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R123i.z = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1ix))/0.1591549367));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
R123i.y = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0iy))/0.1591549367));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + 0.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1ix))/0.1591549367));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(PS0i)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0iy));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 12
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PV1iz));
// 13
PV1iy = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PV0iw));
// 14
PV0ix = floatBitsToInt(-(intBitsToFloat(R0i.x)) + intBitsToFloat(PV1iy));
// 15
R5i.z = floatBitsToInt(-(intBitsToFloat(R5i.z)) + intBitsToFloat(PV0ix));
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
R8i.x = floatBitsToInt(intBitsToFloat(R8i.w) + intBitsToFloat(R0i.z));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(R8i.x));
// 2
R6i.z = floatBitsToInt(intBitsToFloat(R9i.w) + intBitsToFloat(PV1ix));
// 3
predResult = (R10i.w != 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R0i.x = uf_remappedVS[10].x;
R0i.y = uf_remappedVS[10].y;
R0i.w = uf_remappedVS[10].w;
R4i.x = uf_remappedVS[10].z;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R0i.x = 0x40800000;
R0i.y = 0x40400000;
R0i.w = 0x3fc00000;
R4i.x = 0x40000000;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = uf_remappedVS[11].x;
R4i.y = uf_remappedVS[11].z;
R0i.z = uf_remappedVS[11].y;
R6i.x = uf_remappedVS[11].w;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = 0x3f19999a;
R4i.y = 0x3e6b851f;
R0i.z = 0x3ed70a3d;
R6i.x = 0x3e19999a;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R0i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R5i.x)));
// 1
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R4i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.x)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 2
PV0iy = floatBitsToInt(intBitsToFloat(R8i.x) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 3
PV1iz = floatBitsToInt(intBitsToFloat(R8i.x) * intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fd8));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fd8));
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iw = floatBitsToInt(intBitsToFloat(R8i.x) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(R8i.x) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x40c90fd8));
R123i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e22f983) + 0.5);
// 6
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fd8));
// 7
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R123i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iw = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 8
PV0ix = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
R123i.z = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1iw))/0.1591549367));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PS0i)));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + 0.0);
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1ix))/0.1591549367));
// 11
PV1iz = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(PV1iz));
// 13
R0i.x = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iy));
// 14
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R4i.x = uf_remappedVS[10].x;
R0i.y = uf_remappedVS[10].w;
R0i.z = uf_remappedVS[10].z;
R0i.w = uf_remappedVS[10].y;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R4i.x = 0x40800000;
R0i.y = 0x3fc00000;
R0i.z = 0x40000000;
R0i.w = 0x40400000;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = uf_remappedVS[11].x;
R4i.y = uf_remappedVS[11].z;
R4i.z = uf_remappedVS[11].y;
R6i.x = uf_remappedVS[11].w;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = 0x3f19999a;
R4i.y = 0x3e6b851f;
R4i.z = 0x3ed70a3d;
R6i.x = 0x3e19999a;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R4i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R5i.x)));
// 1
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R4i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.x)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 2
PV0iy = floatBitsToInt(intBitsToFloat(R6i.z) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 3
PV1iz = floatBitsToInt(intBitsToFloat(R6i.z) * intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fd8));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fd8));
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iw = floatBitsToInt(intBitsToFloat(R6i.z) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x40c90fd8));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV1iz = floatBitsToInt(intBitsToFloat(R6i.z) * intBitsToFloat(PS0i));
R123i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e22f983) + 0.5);
// 6
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fd8));
// 7
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R123i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iw = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 8
PV0ix = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
R123i.z = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1iw))/0.1591549367));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PS0i)));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + 0.0);
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1ix))/0.1591549367));
// 11
PV1iz = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(PV1iz));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iy));
// 14
R0i.w = floatBitsToInt(-(intBitsToFloat(R0i.x)) + intBitsToFloat(PV1ix));
}
activeMaskStack[2] = activeMaskStack[2] == false;
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R0i.x = uf_remappedVS[10].x;
R0i.y = uf_remappedVS[10].z;
R8i.z = uf_remappedVS[10].y;
R4i.x = uf_remappedVS[10].w;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R0i.x = 0x40800000;
R0i.y = 0x40000000;
R8i.z = 0x40400000;
R4i.x = 0x3fc00000;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = uf_remappedVS[11].x;
R4i.y = uf_remappedVS[11].w;
R10i.z = uf_remappedVS[11].z;
R0i.w = uf_remappedVS[11].y;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = 0x3f19999a;
R4i.y = 0x3e19999a;
R10i.z = 0x3e6b851f;
R0i.w = 0x3ed70a3d;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R5i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R0i.w)));
R16i.z = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(R9i.w));
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R10i.z)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R4i.y)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R0i.z) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 3
PV1iy = floatBitsToInt(intBitsToFloat(R0i.z) * intBitsToFloat(PS0i));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fd8));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 4
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iz = floatBitsToInt(intBitsToFloat(R0i.z) * intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fd8));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fd8));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iw = floatBitsToInt(intBitsToFloat(R0i.z) * intBitsToFloat(PS0i));
// 6
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fd8));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 7
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iy = floatBitsToInt(fract(intBitsToFloat(backupReg0i)));
PV1iz = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e22f983) + 0.5);
// 8
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R123i.y = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV0iw = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1iz))/0.1591549367));
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R123i.z = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0iw))/0.1591549367));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + 0.0);
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1iy))/0.1591549367));
// 11
PV1iy = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PS1i)));
// 13
R0i.w = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0ix));
// 14
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R0i.x = uf_remappedVS[10].x;
R0i.y = uf_remappedVS[10].y;
R6i.w = uf_remappedVS[10].w;
R4i.x = uf_remappedVS[10].z;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R0i.x = 0x40800000;
R0i.y = 0x40400000;
R6i.w = 0x3fc00000;
R4i.x = 0x40000000;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = uf_remappedVS[11].x;
R4i.y = uf_remappedVS[11].z;
R0i.z = uf_remappedVS[11].y;
R6i.x = uf_remappedVS[11].w;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = 0x3f19999a;
R4i.y = 0x3e6b851f;
R0i.z = 0x3ed70a3d;
R6i.x = 0x3e19999a;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R0i.z)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R5i.x)));
// 1
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R4i.y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.x)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
// 2
PV0iy = floatBitsToInt(intBitsToFloat(R16i.z) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 3
PV1iz = floatBitsToInt(intBitsToFloat(R16i.z) * intBitsToFloat(PS0i));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fd8));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fd8));
R123i.z = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iw = floatBitsToInt(intBitsToFloat(R16i.z) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x40c90fd8));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV1iz = floatBitsToInt(intBitsToFloat(R16i.z) * intBitsToFloat(PS0i));
R123i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e22f983) + 0.5);
// 6
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fd8));
// 7
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
R123i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iw = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 8
PV0ix = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
R123i.z = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1iw))/0.1591549367));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PS0i)));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) + 0.0);
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1ix))/0.1591549367));
// 11
PV1iz = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0iw));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 12
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(PS1i)));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(PV1iz));
// 13
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iy));
// 14
R0i.w = floatBitsToInt(-(intBitsToFloat(R0i.w)) + intBitsToFloat(PV1ix));
// 15
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R0i.x = uf_remappedVS[10].x;
R0i.y = uf_remappedVS[10].z;
R0i.z = uf_remappedVS[10].y;
R4i.x = uf_remappedVS[10].w;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R0i.x = 0x40800000;
R0i.y = 0x40000000;
R0i.z = 0x40400000;
R4i.x = 0x3fc00000;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = uf_remappedVS[11].x;
R4i.y = uf_remappedVS[11].w;
R8i.z = uf_remappedVS[11].z;
R6i.w = uf_remappedVS[11].y;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = 0x3f19999a;
R4i.y = 0x3e19999a;
R8i.z = 0x3e6b851f;
R6i.w = 0x3ed70a3d;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R5i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R6i.w)));
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R8i.z)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R4i.y)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R8i.x) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 3
PV1iy = floatBitsToInt(intBitsToFloat(R8i.x) * intBitsToFloat(PS0i));
PV1iz = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fd8));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.x));
// 4
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iz = floatBitsToInt(intBitsToFloat(R8i.x) * intBitsToFloat(PS1i));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fd8));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 5
PV1ix = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fd8));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iw = floatBitsToInt(intBitsToFloat(R8i.x) * intBitsToFloat(PS0i));
// 6
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.z)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fd8));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 7
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iy = floatBitsToInt(fract(intBitsToFloat(backupReg0i)));
PV1iz = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e22f983) + 0.5);
// 8
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
R123i.y = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV0iw = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1iz))/0.1591549367));
// 9
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PS0i)));
PV1iy = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R123i.z = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0iw))/0.1591549367));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + 0.0);
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1iy))/0.1591549367));
// 11
PV1iy = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PV0iz));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 12
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(PV1iy));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PS1i)));
// 13
R6i.w = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0ix));
// 14
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R0i.x = uf_remappedVS[10].x;
R0i.y = uf_remappedVS[10].z;
R0i.z = uf_remappedVS[10].y;
R4i.x = uf_remappedVS[10].w;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R0i.x = 0x40800000;
R0i.y = 0x40000000;
R0i.z = 0x40400000;
R4i.x = 0x3fc00000;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (R4i.z != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = uf_remappedVS[11].x;
R4i.y = uf_remappedVS[11].w;
R4i.z = uf_remappedVS[11].z;
R8i.w = uf_remappedVS[11].y;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R5i.x = 0x3f19999a;
R4i.y = 0x3e19999a;
R4i.z = 0x3e6b851f;
R8i.w = 0x3ed70a3d;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R5i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R8i.w)));
// 1
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R4i.z)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].w), intBitsToFloat(R4i.y)));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 2
PV0iz = floatBitsToInt(intBitsToFloat(R6i.z) * intBitsToFloat(PS1i));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fd8));
PV1iw = floatBitsToInt(intBitsToFloat(R6i.z) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(R6i.z) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fd8));
R123i.w = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e22f983) + 0.5);
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.w));
// 5
R123i.x = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3e22f983) + 0.5);
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fd8));
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV1iw = floatBitsToInt(intBitsToFloat(R6i.z) * intBitsToFloat(PS0i));
// 6
backupReg0i = R123i.x;
R123i.x = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fd8));
PV0iw = floatBitsToInt(fract(intBitsToFloat(backupReg0i)));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PV1iy = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
R123i.z = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x3e22f983) + 0.5);
// 8
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
PV0iy = floatBitsToInt(intBitsToFloat(R123i.z) * intBitsToFloat(0x3e22f983));
R123i.w = floatBitsToInt(intBitsToFloat(PV1iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1ix))/0.1591549367));
// 9
PV1ix = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R123i.y = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0iy))/0.1591549367));
// 10
PV0ix = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
PV0iy = floatBitsToInt(intBitsToFloat(PV1iz) + 0.0);
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(sin((intBitsToFloat(PV1ix))/0.1591549367));
// 11
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0iy));
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 12
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(PV1iw));
// 13
PV1iy = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PV0iz));
// 14
PV0ix = floatBitsToInt(-(intBitsToFloat(R6i.w)) + intBitsToFloat(PV1iy));
// 15
R0i.w = floatBitsToInt(-(intBitsToFloat(R0i.w)) + intBitsToFloat(PV0ix));
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].y), intBitsToFloat(R5i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].x), intBitsToFloat(R11i.w)));
// 1
R7i.x = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(PV0iy));
R7i.y = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].z), intBitsToFloat(R0i.w)));
// 2
R7i.z = floatBitsToInt(intBitsToFloat(R7i.z) + intBitsToFloat(PV1iw));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R0i.w = uf_remappedVS[1].y & 0x100;
// 1
predResult = (R0i.w == 0x100);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
R0i.x = 0;
R0i.y = 0;
R0i.z = 0;
R127i.x = int(intBitsToFloat(uf_remappedVS[12].w));
// 1
R127i.w = int(intBitsToFloat(R18i.w));
// 2
R127i.z = floatBitsToInt(float(R127i.x));
// 3
R127i.y = floatBitsToInt(abs(intBitsToFloat(R127i.z)));
R126i.y = floatBitsToInt(float(R127i.w));
// 4
R127i.x = floatBitsToInt(abs(intBitsToFloat(R126i.y)));
PS0i = floatBitsToInt(1.0 / abs(intBitsToFloat(R127i.z)));
// 5
PV1iw = floatBitsToInt(mul_nonIEEE(abs(intBitsToFloat(R126i.y)), intBitsToFloat(PS0i)));
// 6
PV0iz = floatBitsToInt(trunc(intBitsToFloat(PV1iw)));
// 7
R127i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iz)),intBitsToFloat(R127i.y)) + intBitsToFloat(R127i.x));
// 8
PV0iy = floatBitsToInt((intBitsToFloat(R127i.w) >= abs(intBitsToFloat(R127i.z)))?1.0:0.0);
PV0iz = floatBitsToInt(-(abs(intBitsToFloat(R127i.z))) + intBitsToFloat(R127i.w));
// 9
R127i.x = ((intBitsToFloat(PV0iy) == 0.0)?(R127i.w):(PV0iz));
// 10
PV0iw = floatBitsToInt(abs(intBitsToFloat(R127i.z)) + intBitsToFloat(R127i.x));
// 11
R123i.z = ((-(intBitsToFloat(R127i.x)) > 0.0)?(PV0iw):(R127i.x));
// 12
R123i.y = ((-(intBitsToFloat(R126i.y)) > 0.0)?(floatBitsToInt(-(intBitsToFloat(R123i.z)))):(R123i.z));
// 13
R123i.x = ((intBitsToFloat(R127i.z) == 0.0)?(R126i.y):(R123i.y));
// 14
R0i.w = int(intBitsToFloat(R123i.x));
// 15
predResult = (R0i.w == 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(intBitsToFloat(R4i.w) * intBitsToFloat(0x40c90fd8));
R127i.y = floatBitsToInt(intBitsToFloat(R15i.z) * intBitsToFloat(0x40c90fd8));
R127i.z = floatBitsToInt(intBitsToFloat(R5i.w) * intBitsToFloat(0x40c90fd8));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.w), intBitsToFloat(R18i.w)));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(PV0iw)));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(PV1iy));
PV0iy = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV1iw));
PV0iw = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(PV1ix));
// 3
R123i.x = floatBitsToInt(intBitsToFloat(PV0iw) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.y = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3e22f983) + 0.5);
R123i.w = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x3e22f983) + 0.5);
// 4
PV0ix = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
PV0iy = floatBitsToInt(fract(intBitsToFloat(R123i.y)));
PV0iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
// 5
R123i.x = floatBitsToInt(intBitsToFloat(PV0ix) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.y = floatBitsToInt(intBitsToFloat(PV0iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
R123i.w = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
R127i.y = floatBitsToInt(intBitsToFloat(R123i.w) * intBitsToFloat(0x3e22f983));
R127i.w = floatBitsToInt(intBitsToFloat(R123i.x) * intBitsToFloat(0x3e22f983));
// 7
PS1i = floatBitsToInt(sin((intBitsToFloat(PV0ix))/0.1591549367));
// 8
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].x), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(sin((intBitsToFloat(R127i.w))/0.1591549367));
// 9
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].y), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(sin((intBitsToFloat(R127i.y))/0.1591549367));
// 10
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].z), intBitsToFloat(PS1i)));
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R18i.x = floatBitsToInt(intBitsToFloat(R18i.x) + intBitsToFloat(R0i.x));
R18i.y = floatBitsToInt(intBitsToFloat(R18i.y) + intBitsToFloat(R0i.y));
R18i.z = floatBitsToInt(intBitsToFloat(R18i.z) + intBitsToFloat(R0i.z));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R0i.y = uf_remappedVS[1].y & 0x4;
// 1
predResult = (R0i.y == 0x4);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.w), intBitsToFloat(uf_remappedVS[13].y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.w), intBitsToFloat(uf_remappedVS[13].x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.w), intBitsToFloat(uf_remappedVS[13].z)));
R4i.x = int(intBitsToFloat(uf_remappedVS[13].w));
// 1
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(PV0iy)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(PV0ix)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(PV0iw)));
// 2
predResult = (R4i.x == int(1));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (R14i.y != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.x = uf_remappedVS[14].x;
R127i.y = uf_remappedVS[15].x;
R126i.z = uf_remappedVS[14].y;
R127i.w = uf_remappedVS[15].y;
// 1
R126i.x = uf_remappedVS[16].y;
R126i.y = uf_remappedVS[14].z;
R127i.z = uf_remappedVS[16].x;
// 2
R125i.y = uf_remappedVS[15].z;
R125i.z = uf_remappedVS[16].z;
// 3
R4i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1iy = R4i.x;
PV1iz = R4i.x;
PV1iw = R4i.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.z),intBitsToFloat(R127i.w),intBitsToFloat(R126i.x),0.0)));
PV0ix = tempi.x;
R4i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.y),intBitsToFloat(R125i.y),intBitsToFloat(R125i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
// 6
R0i.x = R4i.x;
R0i.y = R4i.y;
R0i.z = PV1ix;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R127i.x = R23i.y;
R4i.y = R16i.x;
R4i.z = R17i.x;
R127i.w = R17i.y;
R127i.z = R16i.y;
// 1
R126i.x = R14i.z;
R127i.y = R13i.z;
R126i.z = R12i.z;
// 2
R4i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R15i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),0.0)));
PV0iy = R4i.x;
PV0iz = R4i.x;
PV0iw = R4i.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.w),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),0.0)));
PV1ix = tempi.x;
R4i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R0i.z = tempi.x;
PV0iw = tempi.x;
// 5
R0i.x = R4i.x;
R0i.y = R4i.y;
R0i.z = PV0ix;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R7i.x = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(R0i.x));
R7i.y = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(R0i.y));
R7i.z = floatBitsToInt(intBitsToFloat(R7i.z) + intBitsToFloat(R0i.z));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R0i.w = uf_remappedVS[1].y & 0x8;
// 1
predResult = (R0i.w == 0x8);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
R0i.x = 0;
R0i.y = 0;
R0i.z = 0;
R4i.z = int(intBitsToFloat(uf_remappedVS[17].x));
// 1
predResult = (0 != R4i.z);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (R26i.x != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.x = 0;
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R1i.x)) + -(intBitsToFloat(R12i.x)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R1i.x)) + -(intBitsToFloat(R12i.y)));
R126i.w = floatBitsToInt(intBitsToFloat(R3i.x) * 1.0);
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R1i.x)) + -(intBitsToFloat(R22i.z)));
// 1
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R1i.y)) + -(intBitsToFloat(R13i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R1i.y)) + -(intBitsToFloat(R13i.y)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R1i.z)) + -(intBitsToFloat(R23i.z)));
R127i.w = R126i.w;
R127i.z = R127i.x;
// 2
R8i.x = R9i.z;
PV0iy = 0x80000000;
R8i.z = R9i.x;
R0i.w = floatBitsToInt(-(intBitsToFloat(R10i.y)));
R125i.z = 0;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.w),intBitsToFloat(PV0iy),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R127i.w = tempi.x;
R126i.y = R9i.z;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.y),intBitsToFloat(R0i.z),intBitsToFloat(R124i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R0i.w),intBitsToFloat(R8i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.z = R10i.y;
// 5
R126i.x = R127i.y;
R124i.y = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0ix));
R4i.z = R22i.y;
R127i.w = R126i.z;
R124i.x = floatBitsToInt(-(intBitsToFloat(R9i.z)));
// 6
R0i.x = floatBitsToInt(-(intBitsToFloat(R126i.z)));
R126i.z = floatBitsToInt(-(intBitsToFloat(R9i.x)));
R125i.w = floatBitsToInt(-(intBitsToFloat(R125i.x)));
R4i.x = R126i.y;
// 7
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(R126i.y)));
R126i.y = R126i.w;
R5i.z = backupReg0i;
R124i.w = floatBitsToInt(-(intBitsToFloat(backupReg0i)));
R0i.y = floatBitsToInt(-(intBitsToFloat(R126i.w)));
// 8
R5i.x = R127i.w;
R4i.y = floatBitsToInt(-(intBitsToFloat(R124i.z)));
R6i.z = R0i.z;
R127i.w = R127i.z;
R6i.y = R126i.w;
// 9
R6i.x = floatBitsToInt(-(intBitsToFloat(R127i.z)));
R5i.y = floatBitsToInt(-(intBitsToFloat(R126i.w)));
R127i.z = R125i.z;
R126i.w = floatBitsToInt(-(intBitsToFloat(R125i.z)));
R8i.y = R124i.z;
// 10
backupReg0i = R125i.y;
R126i.x = floatBitsToInt(-(intBitsToFloat(R126i.x)));
R125i.y = R125i.x;
R125i.z = floatBitsToInt(-(intBitsToFloat(backupReg0i)));
R4i.w = floatBitsToInt(-(intBitsToFloat(R0i.z)));
R0i.z = backupReg0i;
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R4i.z),intBitsToFloat(R126i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R126i.z = tempi.x;
PV1iw = tempi.x;
R6i.w = floatBitsToInt(1.0 / intBitsToFloat(R124i.y));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R127i.y),intBitsToFloat(R125i.w),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R125i.w = tempi.x;
R0i.x = uf_remappedVS[14].w;
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R124i.w),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R124i.z = tempi.x;
PV1iw = tempi.x;
R9i.y = uf_remappedVS[15].w;
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R0i.y),intBitsToFloat(R5i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R124i.w = tempi.x;
R5i.z = uf_remappedVS[16].w;
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R5i.x),intBitsToFloat(R4i.y),intBitsToFloat(R6i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R5i.w = tempi.x;
R8i.w = 0x3f800000;
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.w),intBitsToFloat(R5i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
R126i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.y = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(R6i.w));
// 17
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R126i.w),0.0)));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
R127i.z = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(R6i.w));
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R8i.y),intBitsToFloat(R125i.z),0.0)));
PV0ix = tempi.x;
R125i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(R6i.w));
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R0i.w),intBitsToFloat(R8i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R8i.x = floatBitsToInt(intBitsToFloat(R124i.z) * intBitsToFloat(R6i.w));
// 20
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(R6i.w));
R8i.y = floatBitsToInt(intBitsToFloat(R124i.w) * intBitsToFloat(R6i.w));
R8i.z = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(R6i.w));
R0i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(R6i.w));
R6i.z = floatBitsToInt(intBitsToFloat(R0i.z) * intBitsToFloat(R6i.w));
// 21
R6i.x = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(R6i.w));
R0i.z = floatBitsToInt(intBitsToFloat(R4i.w) * intBitsToFloat(R6i.w));
R4i.w = floatBitsToInt(intBitsToFloat(R5i.w) * intBitsToFloat(R6i.w));
// 22
R20i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R9i.y),intBitsToFloat(R5i.z),intBitsToFloat(R8i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R125i.w))));
PV0iy = R20i.x;
PV0iz = R20i.x;
PV0iw = R20i.x;
}
if( activeMaskStackC[4] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R9i.y),intBitsToFloat(R5i.z),intBitsToFloat(R8i.w)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R0i.z),intBitsToFloat(R4i.w))));
PV0ix = tempi.x;
R20i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R9i.y),intBitsToFloat(R5i.z),intBitsToFloat(R8i.w)),vec4(intBitsToFloat(R8i.z),intBitsToFloat(R0i.w),intBitsToFloat(R6i.z),intBitsToFloat(R6i.x))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R20i.z = tempi.x;
PV1iw = tempi.x;
// 2
R0i.x = R25i.x;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R0i.x = R24i.x;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R0i.x;
R0i.x = ((backupReg0i == 0)?(0):(R20i.x));
R0i.y = ((backupReg0i == 0)?(0):(R20i.y));
R0i.z = ((backupReg0i == 0)?(0):(R20i.z));
// 1
R20i.x = R0i.x;
R20i.y = R0i.y;
R20i.z = R0i.z;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(uf_remappedVS[18].x));
PV0iz = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(uf_remappedVS[18].z));
PV0iw = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(uf_remappedVS[18].y));
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(R7i.y)) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(-(intBitsToFloat(R7i.x)) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(-(intBitsToFloat(R7i.z)) + intBitsToFloat(PV0iz));
// 2
PV0ix = floatBitsToInt(-(intBitsToFloat(R18i.z)) + intBitsToFloat(PV1iw));
PV0iy = floatBitsToInt(-(intBitsToFloat(R18i.y)) + intBitsToFloat(PV1ix));
PV0iz = floatBitsToInt(-(intBitsToFloat(R18i.x)) + intBitsToFloat(PV1iy));
// 3
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].w), intBitsToFloat(PV0ix)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].w), intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[18].w), intBitsToFloat(PV0iz)));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.w), intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.w), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.w), intBitsToFloat(PV1iz)));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(PV0iw)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(PV0iz)));
// 6
R18i.x = floatBitsToInt(intBitsToFloat(R18i.x) + intBitsToFloat(PV1iy));
R18i.y = floatBitsToInt(intBitsToFloat(R18i.y) + intBitsToFloat(PV1ix));
R18i.z = floatBitsToInt(intBitsToFloat(R18i.z) + intBitsToFloat(PV1iw));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R0i.y = uf_remappedVS[1].y & 0x10;
// 1
predResult = (R0i.y == 0x10);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
R0i.x = 0;
R0i.y = 0;
R0i.z = 0;
R4i.x = int(intBitsToFloat(uf_remappedVS[19].x));
// 1
predResult = (R4i.x > 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (R26i.x != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.x = 0;
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R1i.x)) + -(intBitsToFloat(R12i.x)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R1i.x)) + -(intBitsToFloat(R12i.y)));
R126i.w = floatBitsToInt(intBitsToFloat(R3i.x) * 1.0);
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R1i.x)) + -(intBitsToFloat(R22i.z)));
// 1
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R1i.y)) + -(intBitsToFloat(R13i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R1i.y)) + -(intBitsToFloat(R13i.y)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(R1i.z)) + -(intBitsToFloat(R23i.z)));
R127i.w = R126i.w;
R127i.z = R127i.x;
// 2
R8i.x = R9i.z;
PV0iy = 0x80000000;
R8i.z = R9i.x;
R0i.w = floatBitsToInt(-(intBitsToFloat(R10i.y)));
R125i.z = 0;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.w),intBitsToFloat(PV0iy),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R127i.w = tempi.x;
R126i.y = R9i.z;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.y),intBitsToFloat(R0i.z),intBitsToFloat(R124i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R0i.w),intBitsToFloat(R8i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.z = R10i.y;
// 5
R126i.x = R127i.y;
R124i.y = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV0ix));
R4i.z = R22i.y;
R127i.w = R126i.z;
R124i.x = floatBitsToInt(-(intBitsToFloat(R9i.z)));
// 6
R0i.x = floatBitsToInt(-(intBitsToFloat(R126i.z)));
R126i.z = floatBitsToInt(-(intBitsToFloat(R9i.x)));
R125i.w = floatBitsToInt(-(intBitsToFloat(R125i.x)));
R4i.x = R126i.y;
// 7
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(-(intBitsToFloat(R126i.y)));
R126i.y = R126i.w;
R5i.z = backupReg0i;
R124i.w = floatBitsToInt(-(intBitsToFloat(backupReg0i)));
R0i.y = floatBitsToInt(-(intBitsToFloat(R126i.w)));
// 8
R5i.x = R127i.w;
R4i.y = floatBitsToInt(-(intBitsToFloat(R124i.z)));
R6i.z = R0i.z;
R127i.w = R127i.z;
R6i.y = R126i.w;
// 9
R6i.x = floatBitsToInt(-(intBitsToFloat(R127i.z)));
R5i.y = floatBitsToInt(-(intBitsToFloat(R126i.w)));
R127i.z = R125i.z;
R126i.w = floatBitsToInt(-(intBitsToFloat(R125i.z)));
R8i.y = R124i.z;
// 10
backupReg0i = R125i.y;
R126i.x = floatBitsToInt(-(intBitsToFloat(R126i.x)));
R125i.y = R125i.x;
R125i.z = floatBitsToInt(-(intBitsToFloat(backupReg0i)));
R4i.w = floatBitsToInt(-(intBitsToFloat(R0i.z)));
R0i.z = backupReg0i;
// 11
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R4i.z),intBitsToFloat(R126i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R126i.z = tempi.x;
PV1iw = tempi.x;
R6i.w = floatBitsToInt(1.0 / intBitsToFloat(R124i.y));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R127i.y),intBitsToFloat(R125i.w),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R125i.w = tempi.x;
R0i.x = uf_remappedVS[14].w;
// 13
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.y),intBitsToFloat(R124i.w),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R124i.z = tempi.x;
PV1iw = tempi.x;
R9i.y = uf_remappedVS[15].w;
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R0i.y),intBitsToFloat(R5i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R124i.w = tempi.x;
R5i.z = uf_remappedVS[16].w;
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R5i.x),intBitsToFloat(R4i.y),intBitsToFloat(R6i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R5i.w = tempi.x;
R8i.w = 0x3f800000;
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.w),intBitsToFloat(R5i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
R126i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.y = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(R6i.w));
// 17
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R126i.w),0.0)));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
R127i.z = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(R6i.w));
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R8i.y),intBitsToFloat(R125i.z),0.0)));
PV0ix = tempi.x;
R125i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R125i.w = floatBitsToInt(intBitsToFloat(R125i.w) * intBitsToFloat(R6i.w));
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R0i.w),intBitsToFloat(R8i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R8i.x = floatBitsToInt(intBitsToFloat(R124i.z) * intBitsToFloat(R6i.w));
// 20
backupReg0i = R127i.x;
R127i.x = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(R6i.w));
R8i.y = floatBitsToInt(intBitsToFloat(R124i.w) * intBitsToFloat(R6i.w));
R8i.z = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(R6i.w));
R0i.w = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(R6i.w));
R6i.z = floatBitsToInt(intBitsToFloat(R0i.z) * intBitsToFloat(R6i.w));
// 21
R6i.x = floatBitsToInt(intBitsToFloat(R125i.y) * intBitsToFloat(R6i.w));
R0i.z = floatBitsToInt(intBitsToFloat(R4i.w) * intBitsToFloat(R6i.w));
R4i.w = floatBitsToInt(intBitsToFloat(R5i.w) * intBitsToFloat(R6i.w));
// 22
R20i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R9i.y),intBitsToFloat(R5i.z),intBitsToFloat(R8i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R125i.w))));
PV0iy = R20i.x;
PV0iz = R20i.x;
PV0iw = R20i.x;
}
if( activeMaskStackC[4] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R9i.y),intBitsToFloat(R5i.z),intBitsToFloat(R8i.w)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R8i.y),intBitsToFloat(R0i.z),intBitsToFloat(R4i.w))));
PV0ix = tempi.x;
R20i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R9i.y),intBitsToFloat(R5i.z),intBitsToFloat(R8i.w)),vec4(intBitsToFloat(R8i.z),intBitsToFloat(R0i.w),intBitsToFloat(R6i.z),intBitsToFloat(R6i.x))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R20i.z = tempi.x;
PV1iw = tempi.x;
// 2
R0i.x = R25i.x;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R0i.x = R24i.x;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
backupReg0i = R0i.x;
R0i.x = ((backupReg0i == 0)?(0):(R20i.x));
R0i.y = ((backupReg0i == 0)?(0):(R20i.y));
R0i.z = ((backupReg0i == 0)?(0):(R20i.z));
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(uf_remappedVS[20].y));
PV0iy = floatBitsToInt(intBitsToFloat(R0i.x) + intBitsToFloat(uf_remappedVS[20].x));
PV0iw = floatBitsToInt(intBitsToFloat(R0i.z) + intBitsToFloat(uf_remappedVS[20].z));
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(R7i.z)) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(-(intBitsToFloat(R7i.y)) + intBitsToFloat(PV0ix));
PV1iz = floatBitsToInt(-(intBitsToFloat(R7i.x)) + intBitsToFloat(PV0iy));
// 2
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[20].w), intBitsToFloat(PV1ix)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[20].w), intBitsToFloat(PV1iy)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[20].w), intBitsToFloat(PV1iz)));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.w), intBitsToFloat(PV0iw)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.w), intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.w), intBitsToFloat(PV0iz)));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(PV1ix)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(PV1iz)));
// 5
R7i.x = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(PV0iy));
R7i.y = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(PV0ix));
R7i.z = floatBitsToInt(intBitsToFloat(R7i.z) + intBitsToFloat(PV0iw));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R0i.w = uf_remappedVS[1].y & 0x20;
// 1
predResult = (R0i.w == 0x20);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.w), intBitsToFloat(uf_remappedVS[21].x)));
R0i.x = int(intBitsToFloat(uf_remappedVS[21].z));
// 1
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(PV0iz)));
// 2
predResult = (R0i.x == 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R123i.x = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(0x3e22f983) + 0.5);
// 1
PV1iw = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
// 2
R123i.y = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 3
R127i.z = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
// 4
PS0i = floatBitsToInt(sin((intBitsToFloat(R127i.z))/0.1591549367));
// 5
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(PS0i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), -(intBitsToFloat(PS0i))));
PS1i = floatBitsToInt(cos((intBitsToFloat(R127i.z))/0.1591549367));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(PS1i)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PS1i)));
// 7
R4i.x = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R127i.w));
R4i.y = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV0iz));
// 8
R7i.y = R4i.y;
R7i.z = R4i.x;
// 9
predResult = (intBitsToFloat(uf_remappedVS[21].y) != 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
activeMaskStack[4] = activeMaskStack[3];
activeMaskStackC[5] = activeMaskStackC[4];
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R4i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R4i.x)));
// 1
R5i.y = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0ix));
// 2
predResult = (intBitsToFloat(R5i.y) > 0.0);
activeMaskStack[4] = predResult;
activeMaskStackC[5] = predResult == true && activeMaskStackC[4] == true;
}
else {
activeMaskStack[4] = false;
activeMaskStackC[5] = false;
}
if( activeMaskStackC[5] == true ) {
// 0
PS0i = floatBitsToInt(sqrt(intBitsToFloat(R5i.y)));
// 1
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[21].y), intBitsToFloat(PS1i)));
// 3
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.w), intBitsToFloat(PV0ix)));
// 4
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(PV1iz)));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PV0iy)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(PV0iy)));
// 6
R7i.y = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(PV1iw));
R7i.z = floatBitsToInt(intBitsToFloat(R7i.z) + intBitsToFloat(PV1ix));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R0i.x == int(1));
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R123i.x = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(0x3e22f983) + 0.5);
// 1
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.x)));
// 2
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 3
R127i.w = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
// 4
PS0i = floatBitsToInt(sin((intBitsToFloat(R127i.w))/0.1591549367));
// 5
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), -(intBitsToFloat(PS0i))));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(PS0i)));
PS1i = floatBitsToInt(cos((intBitsToFloat(R127i.w))/0.1591549367));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(PS1i)));
// 7
R0i.z = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R127i.x));
R0i.w = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV0ix));
// 8
R7i.x = R0i.z;
R7i.z = R0i.w;
// 9
predResult = (intBitsToFloat(uf_remappedVS[21].y) != 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
activeMaskStack[4] = activeMaskStack[3];
activeMaskStackC[5] = activeMaskStackC[4];
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R0i.w)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R0i.z)));
// 1
R4i.w = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(PV0ix));
// 2
predResult = (intBitsToFloat(R4i.w) > 0.0);
activeMaskStack[4] = predResult;
activeMaskStackC[5] = predResult == true && activeMaskStackC[4] == true;
}
else {
activeMaskStack[4] = false;
activeMaskStackC[5] = false;
}
if( activeMaskStackC[5] == true ) {
// 0
PS0i = floatBitsToInt(sqrt(intBitsToFloat(R4i.w)));
// 1
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 2
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[21].y), intBitsToFloat(PS1i)));
// 3
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.w), intBitsToFloat(PV0iy)));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(PV1iz)));
// 5
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PV0ix)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV0ix)));
// 6
R7i.x = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(PV1iy));
R7i.z = floatBitsToInt(intBitsToFloat(R7i.z) + intBitsToFloat(PV1iw));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R0i.x == 0x2);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R123i.w = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(0x3e22f983) + 0.5);
// 1
PV1iz = floatBitsToInt(fract(intBitsToFloat(R123i.w)));
// 2
R123i.y = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb));
// 3
R127i.x = floatBitsToInt(intBitsToFloat(R123i.y) * intBitsToFloat(0x3e22f983));
// 4
PS0i = floatBitsToInt(sin((intBitsToFloat(R127i.x))/0.1591549367));
// 5
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), -(intBitsToFloat(PS0i))));
PS1i = floatBitsToInt(cos((intBitsToFloat(R127i.x))/0.1591549367));
// 6
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(PS1i)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(PS1i)));
// 7
R0i.x = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R127i.z));
R0i.y = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV0ix));
// 8
R7i.x = R0i.y;
R7i.y = R0i.x;
// 9
predResult = (intBitsToFloat(uf_remappedVS[21].y) != 0.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
activeMaskStack[4] = activeMaskStack[3];
activeMaskStackC[5] = activeMaskStackC[4];
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R0i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(R0i.x)));
// 1
R4i.y = floatBitsToInt(intBitsToFloat(PV0iz) + intBitsToFloat(PV0ix));
// 2
predResult = (intBitsToFloat(R4i.y) > 0.0);
activeMaskStack[4] = predResult;
activeMaskStackC[5] = predResult == true && activeMaskStackC[4] == true;
}
else {
activeMaskStack[4] = false;
activeMaskStackC[5] = false;
}
if( activeMaskStackC[5] == true ) {
// 0
PS0i = floatBitsToInt(sqrt(intBitsToFloat(R4i.y)));
// 1
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PS0i));
// 2
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[21].y), intBitsToFloat(PS1i)));
// 3
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.w), intBitsToFloat(PV0iz)));
// 4
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(PV1iy)));
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(PV0iw)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PV0iw)));
// 6
R7i.x = floatBitsToInt(intBitsToFloat(R7i.x) + intBitsToFloat(PV1iz));
R7i.y = floatBitsToInt(intBitsToFloat(R7i.y) + intBitsToFloat(PV1ix));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R0i.y = uf_remappedVS[1].y & 0x80;
// 1
predResult = (R0i.y == 0x80);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
R5i.x = ((intBitsToFloat(uf_remappedVS[22].y) > 0.0)?-1:0);
// 1
predResult = (R5i.x != 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (R14i.y != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R0i.w = 0x3f800000;
// 1
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[14].x),intBitsToFloat(uf_remappedVS[14].y),intBitsToFloat(uf_remappedVS[14].z),intBitsToFloat(uf_remappedVS[14].w))));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[15].x),intBitsToFloat(uf_remappedVS[15].y),intBitsToFloat(uf_remappedVS[15].z),intBitsToFloat(uf_remappedVS[15].w))));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),intBitsToFloat(uf_remappedVS[16].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
// 4
R8i.x = R25i.x;
// 5
R6i.x = R24i.x;
// 6
R4i.x = R24i.x;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
activeMaskStack[4] = activeMaskStack[3];
activeMaskStackC[5] = activeMaskStackC[4];
// 0
predResult = (R25i.z != 0);
activeMaskStack[4] = predResult;
activeMaskStackC[5] = predResult == true && activeMaskStackC[4] == true;
}
else {
activeMaskStack[4] = false;
activeMaskStackC[5] = false;
}
if( activeMaskStackC[5] == true ) {
// 0
R0i.w = uf_remappedVS[14].w;
R4i.w = uf_remappedVS[15].w;
// 1
R5i.w = uf_remappedVS[16].w;
R6i.w = 0x3f800000;
// 2
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z),intBitsToFloat(R6i.w))));
PV0iy = R0i.x;
PV0iz = R0i.x;
PV0iw = R0i.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z),intBitsToFloat(R6i.w))));
PV1ix = tempi.x;
R0i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z),intBitsToFloat(R6i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R0i.z = tempi.x;
PV0iw = tempi.x;
// 5
R6i.x = R25i.x;
// 6
R4i.x = R24i.x;
}
activeMaskStack[4] = activeMaskStack[4] == false;
activeMaskStackC[5] = activeMaskStack[4] == true && activeMaskStackC[4] == true;
if( activeMaskStackC[5] == true ) {
// 0
R4i.x = ((R26i.x == 0)?(0):(0x3f800000));
R0i.w = 0x3f800000;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z),intBitsToFloat(R0i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R127i.z = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z),intBitsToFloat(R0i.w))));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z),intBitsToFloat(R0i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
R0i.x = ((R26i.x == 0)?(0):(R127i.z));
R0i.y = ((R26i.x == 0)?(0):(R127i.y));
R0i.z = ((R26i.x == 0)?(0):(PV1ix));
// 5
R6i.x = R24i.x;
}
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R8i.x = R24i.x;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R123i.x = ((R4i.x == 0)?(R7i.x):(R0i.x));
R123i.z = ((R4i.x == 0)?(R7i.z):(R0i.z));
R123i.w = ((R4i.x == 0)?(R7i.y):(R0i.y));
// 1
backupReg0i = R123i.x;
R123i.x = ((R6i.x == 0)?(R123i.w):(R0i.y));
R123i.y = ((R6i.x == 0)?(backupReg0i):(R0i.x));
R123i.w = ((R6i.x == 0)?(R123i.z):(R0i.z));
// 2
R0i.x = ((R8i.x == 0)?(R123i.y):(R0i.x));
R0i.y = ((R8i.x == 0)?(R123i.x):(R0i.y));
R0i.z = ((R8i.x == 0)?(R123i.w):(R0i.z));
}
activeMaskStack[2] = activeMaskStack[2] == false;
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = R7i.x;
R0i.y = R7i.y;
R0i.z = R7i.z;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R127i.x = ((intBitsToFloat(uf_remappedVS[22].x) != 0.0)?-1:0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(uf_remappedVS[23].w)));
// 1
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), intBitsToFloat(uf_remappedVS[23].x)));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(uf_remappedVS[24].w)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[24].w)));
R127i.z = ((R127i.x == 0)?(uf_remappedVS[23].w):(R127i.w));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(uf_remappedVS[24].w)));
// 3
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), intBitsToFloat(uf_remappedVS[23].y)));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.y) + intBitsToFloat(PV0ix));
// 4
PV0ix = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R126i.y));
R126i.y = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R127i.z));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), intBitsToFloat(uf_remappedVS[23].z)));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R127i.z));
PV1iy = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(R127i.w));
R126i.z = ((0.0 > intBitsToFloat(R126i.y))?-1:0);
PV1iw = floatBitsToInt(-(intBitsToFloat(R126i.y)));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) + intBitsToFloat(R127i.z));
R126i.y = ((R126i.z == 0)?(R126i.y):(PV1iw));
R127i.w = ((R126i.z == 0)?(PV1ix):(PV1ix));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(R127i.w) * -(1.0));
PV1iy = ((0.0 > intBitsToFloat(R127i.w))?-1:0);
R123i.z = ((R126i.z == 0)?(PV0ix):(PV0ix));
// 8
backupReg0i = R126i.y;
R126i.y = ((PV1iy == 0)?(R123i.z):(R123i.z));
R126i.z = ((PV1iy == 0)?(R127i.w):(PV1ix));
R127i.w = backupReg0i;
// 9
PV1ix = ((0.0 > intBitsToFloat(R126i.y))?-1:0);
PV1iw = floatBitsToInt(intBitsToFloat(R126i.y) * -(1.0));
// 10
R123i.y = R126i.z;
R123i.z = R127i.w;
R123i.w = ((PV1ix == 0)?(R126i.y):(PV1iw));
// 11
R0i.x = floatBitsToInt(intBitsToFloat(R123i.z) * 0.03125);
R0i.y = floatBitsToInt(intBitsToFloat(R123i.y) * 0.03125);
R0i.z = floatBitsToInt(intBitsToFloat(R123i.w) * 0.03125);
}
if( activeMaskStackC[2] == true ) {
R0i.xyz = floatBitsToInt(texture(textureUnitVS5, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z))).xyz);
}
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
PV0ix = R0i.x;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
PV0iz = R0i.z;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
PV0iw = R0i.y;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
// 1
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) + -(1.0));
PV1ix = floatBitsToInt(intBitsToFloat(PV1ix) / 2.0);
PV1iy = floatBitsToInt(intBitsToFloat(PV0ix) + -(1.0));
PV1iy = floatBitsToInt(intBitsToFloat(PV1iy) / 2.0);
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + -(1.0));
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) / 2.0);
// 2
R20i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[24].x), intBitsToFloat(PV1iy)));
R20i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[24].y), intBitsToFloat(PV1ix)));
R20i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[24].z), intBitsToFloat(PV1iw)));
// 3
predResult = (R5i.x != 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (R14i.y != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R126i.x = 0;
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[14].y), intBitsToFloat(uf_remappedVS[15].x)));
R126i.z = 0x80000000;
R126i.w = 0x80000000;
R126i.y = 0x80000000;
// 1
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[14].z), intBitsToFloat(uf_remappedVS[15].y)));
R124i.y = R9i.x;
R127i.z = R126i.x;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[14].z), intBitsToFloat(uf_remappedVS[15].x)));
R125i.w = 0x80000000;
// 2
R125i.x = 0;
R0i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[16].y) * 1.0);
R4i.z = floatBitsToInt(intBitsToFloat(uf_remappedVS[16].z) * 1.0);
R124i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[16].x) * 1.0);
R4i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[16].y) * 1.0);
// 3
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[15].y),intBitsToFloat(uf_remappedVS[14].x)) + -(intBitsToFloat(R127i.y)));
R127i.y = R124i.w;
R124i.z = R4i.z;
R0i.w = floatBitsToInt(-(intBitsToFloat(R0i.y)));
R125i.y = R4i.z;
// 4
backupReg0i = R0i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[15].z),intBitsToFloat(uf_remappedVS[14].y)) + -(intBitsToFloat(R127i.x)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[15].z),intBitsToFloat(uf_remappedVS[14].x)) + -(intBitsToFloat(R127i.w)));
R125i.z = backupReg0i;
R127i.w = 0x80000000;
R10i.x = uf_remappedVS[14].x;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R126i.w),intBitsToFloat(R126i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.y),intBitsToFloat(R126i.y),intBitsToFloat(R127i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R126i.w = tempi.x;
R6i.y = uf_remappedVS[14].y;
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.z),intBitsToFloat(R0i.w),intBitsToFloat(R124i.y),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R5i.z = uf_remappedVS[14].z;
// 7
R5i.x = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV0ix));
R5i.y = uf_remappedVS[15].x;
R8i.z = uf_remappedVS[15].y;
R6i.w = 0;
R0i.z = uf_remappedVS[15].z;
// 8
R14i.x = uf_remappedVS[16].x;
R10i.y = uf_remappedVS[16].y;
R6i.z = uf_remappedVS[16].z;
R5i.w = 0;
R9i.w = 0;
// 9
R124i.x = floatBitsToInt(-(intBitsToFloat(R4i.z)));
R127i.y = R4i.y;
R126i.z = floatBitsToInt(-(intBitsToFloat(R9i.x)));
R4i.x = floatBitsToInt(-(intBitsToFloat(R125i.w)));
// 10
backupReg0i = R125i.y;
R8i.x = backupReg0i;
R125i.y = R124i.w;
R127i.z = floatBitsToInt(-(intBitsToFloat(R127i.x)));
R126i.w = R126i.x;
R6i.x = floatBitsToInt(-(intBitsToFloat(backupReg0i)));
// 11
backupReg0i = R126i.x;
R126i.x = R127i.w;
R126i.y = floatBitsToInt(-(intBitsToFloat(R124i.w)));
R4i.z = floatBitsToInt(-(intBitsToFloat(backupReg0i)));
R4i.w = R0i.y;
R4i.y = 0;
// 12
backupReg0i = R125i.z;
R9i.x = backupReg0i;
R8i.y = R124i.w;
R125i.z = R125i.x;
R124i.w = floatBitsToInt(-(intBitsToFloat(R124i.w)));
R12i.x = floatBitsToInt(-(intBitsToFloat(backupReg0i)));
// 13
R13i.x = floatBitsToInt(-(intBitsToFloat(R127i.w)));
R9i.y = R127i.w;
R9i.z = floatBitsToInt(-(intBitsToFloat(R125i.x)));
R8i.w = floatBitsToInt(-(intBitsToFloat(R0i.x)));
R10i.w = R127i.x;
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R8i.z),intBitsToFloat(R0i.z),intBitsToFloat(R5i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.z),intBitsToFloat(R0i.w),intBitsToFloat(R124i.y),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R127i.w = tempi.x;
R12i.w = floatBitsToInt(-(intBitsToFloat(R0i.y)));
// 15
R124i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.y),intBitsToFloat(R5i.z),intBitsToFloat(R6i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),0.0)));
PV1iy = R124i.x;
PV1iz = R124i.x;
PV1iw = R124i.x;
R10i.z = R0i.x;
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R125i.w),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R10i.y),intBitsToFloat(R6i.z),intBitsToFloat(R9i.w),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R127i.z = tempi.x;
PV0iw = tempi.x;
R13i.w = floatBitsToInt(1.0 / intBitsToFloat(R5i.x));
// 17
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.y),intBitsToFloat(R0i.z),intBitsToFloat(R5i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R6i.x),intBitsToFloat(R125i.y),intBitsToFloat(R4i.z),0.0)));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
R11i.w = 0x3f800000;
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R5i.z),intBitsToFloat(R6i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R8i.x),intBitsToFloat(R126i.y),intBitsToFloat(R126i.w),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R0i.w = tempi.x;
R0i.y = floatBitsToInt(intBitsToFloat(R124i.x) * intBitsToFloat(R13i.w));
// 19
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R14i.x),intBitsToFloat(R6i.z),intBitsToFloat(R9i.w),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R6i.z = tempi.x;
PV1iw = tempi.x;
R4i.w = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(R13i.w));
// 20
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.y),intBitsToFloat(R8i.z),intBitsToFloat(R5i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R9i.x),intBitsToFloat(R124i.w),intBitsToFloat(R125i.z),0.0)));
PV0ix = tempi.x;
R5i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R9i.x = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(R13i.w));
// 21
R10i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R6i.y),intBitsToFloat(R6i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R12i.x),intBitsToFloat(R8i.y),intBitsToFloat(R9i.z),0.0)));
PV1iy = R10i.x;
PV1iz = R10i.x;
PV1iw = R10i.x;
R12i.x = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(R13i.w));
}
if( activeMaskStackC[4] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R13i.x),intBitsToFloat(R9i.y),intBitsToFloat(R8i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R14i.x),intBitsToFloat(R10i.y),intBitsToFloat(R9i.w),0.0)));
PV0ix = tempi.x;
R126i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.w = floatBitsToInt(intBitsToFloat(R6i.z) * intBitsToFloat(R13i.w));
// 1
R127i.x = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(R13i.w));
R125i.y = floatBitsToInt(intBitsToFloat(R0i.w) * intBitsToFloat(R13i.w));
R125i.z = floatBitsToInt(intBitsToFloat(R10i.w) * intBitsToFloat(R13i.w));
R124i.w = floatBitsToInt(intBitsToFloat(R10i.x) * intBitsToFloat(R13i.w));
R126i.z = floatBitsToInt(intBitsToFloat(R10i.z) * intBitsToFloat(R13i.w));
// 2
R127i.z = floatBitsToInt(intBitsToFloat(R12i.w) * intBitsToFloat(R13i.w));
R126i.w = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(R13i.w));
// 3
R21i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(R12i.x),intBitsToFloat(R0i.y),intBitsToFloat(R125i.z),intBitsToFloat(R4i.w))));
PV1iy = R21i.x;
PV1iz = R21i.x;
PV1iw = R21i.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(R9i.x),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w))));
PV0ix = tempi.x;
R21i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R124i.w),intBitsToFloat(R126i.z),intBitsToFloat(R126i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R21i.z = tempi.x;
PV1iw = tempi.x;
// 6
R0i.x = R24i.x;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
activeMaskStack[4] = activeMaskStack[3];
activeMaskStackC[5] = activeMaskStackC[4];
// 0
R0i.x = ((R25i.z == 0)?(R26i.x):(int(-1)));
// 1
predResult = (R0i.x != 0);
activeMaskStack[4] = predResult;
activeMaskStackC[5] = predResult == true && activeMaskStackC[4] == true;
}
else {
activeMaskStack[4] = false;
activeMaskStackC[5] = false;
}
if( activeMaskStackC[5] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R2i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(R2i.x)));
R126i.z = 0;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.z), intBitsToFloat(R2i.x)));
R125i.w = floatBitsToInt(intBitsToFloat(R3i.x) * 1.0);
// 1
R126i.x = 0x80000000;
R0i.y = floatBitsToInt(intBitsToFloat(R3i.y) * 1.0);
R4i.z = floatBitsToInt(intBitsToFloat(R3i.z) * 1.0);
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y),intBitsToFloat(R1i.x)) + -(intBitsToFloat(PV0iy)));
R4i.y = floatBitsToInt(intBitsToFloat(R3i.y) * 1.0);
// 2
backupReg0i = R127i.x;
R127i.x = 0x80000000;
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R1i.x)) + -(intBitsToFloat(R127i.w)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.z),intBitsToFloat(R1i.y)) + -(intBitsToFloat(backupReg0i)));
R127i.w = R125i.w;
R127i.z = R126i.z;
// 3
R125i.x = R4i.z;
PV1iy = 0x80000000;
R125i.z = R9i.x;
R124i.w = floatBitsToInt(-(intBitsToFloat(R0i.y)));
R126i.w = 0x80000000;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.z),intBitsToFloat(R127i.x),intBitsToFloat(R127i.x),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.w),intBitsToFloat(PV1iy),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R127i.w = tempi.x;
R127i.z = 0;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.w),intBitsToFloat(R126i.y),intBitsToFloat(R126i.x),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R124i.w),intBitsToFloat(R125i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.y = R4i.z;
// 6
R126i.x = R0i.y;
R124i.y = floatBitsToInt(intBitsToFloat(R127i.w) + intBitsToFloat(PV1ix));
R0i.z = R4i.y;
R127i.w = 0x80000000;
R8i.w = 0;
// 7
R127i.x = floatBitsToInt(-(intBitsToFloat(R4i.z)));
R125i.y = R126i.w;
R4i.z = floatBitsToInt(-(intBitsToFloat(R9i.x)));
R9i.w = 0;
R10i.w = 0;
// 8
R124i.x = floatBitsToInt(-(intBitsToFloat(R126i.w)));
R0i.y = R127i.y;
R5i.z = floatBitsToInt(-(intBitsToFloat(R124i.z)));
R126i.w = R125i.w;
R6i.z = R126i.z;
// 9
R0i.x = floatBitsToInt(-(intBitsToFloat(R127i.y)));
R127i.y = floatBitsToInt(-(intBitsToFloat(R125i.w)));
R126i.z = floatBitsToInt(-(intBitsToFloat(R126i.z)));
R4i.w = R127i.w;
R8i.z = R126i.y;
// 10
backupReg0i = R125i.w;
R4i.x = R126i.x;
R4i.y = 0;
R9i.z = backupReg0i;
R125i.w = R127i.z;
R5i.y = floatBitsToInt(-(intBitsToFloat(backupReg0i)));
// 11
R126i.x = floatBitsToInt(-(intBitsToFloat(R126i.x)));
R6i.y = R127i.w;
R127i.z = floatBitsToInt(-(intBitsToFloat(R127i.z)));
R127i.w = floatBitsToInt(-(intBitsToFloat(R127i.w)));
R10i.z = floatBitsToInt(-(intBitsToFloat(R0i.w)));
// 12
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R9i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R124i.w),intBitsToFloat(R125i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R124i.w = tempi.x;
R5i.w = R124i.z;
// 13
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R8i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R0i.z),intBitsToFloat(R4i.z),0.0)));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
R6i.w = floatBitsToInt(-(intBitsToFloat(R126i.y)));
// 14
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R125i.y),intBitsToFloat(R5i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R10i.w),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R125i.z = tempi.x;
PV0iw = tempi.x;
R5i.z = R0i.w;
// 15
R124i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.z),intBitsToFloat(R9i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R126i.w),intBitsToFloat(R126i.z),0.0)));
PV1iy = R124i.x;
PV1iz = R124i.x;
PV1iw = R124i.x;
R0i.w = floatBitsToInt(1.0 / intBitsToFloat(R124i.y));
// 16
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.z),intBitsToFloat(R8i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.y),intBitsToFloat(R127i.y),intBitsToFloat(R6i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R126i.w = tempi.x;
R11i.w = 0x3f800000;
// 17
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.w),intBitsToFloat(R4i.y),intBitsToFloat(R8i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.z),intBitsToFloat(R10i.w),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R126i.z = tempi.x;
PV1iw = tempi.x;
R4i.y = floatBitsToInt(intBitsToFloat(R127i.x) * intBitsToFloat(R0i.w));
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R9i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R5i.y),intBitsToFloat(R125i.w),0.0)));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R4i.w = floatBitsToInt(intBitsToFloat(R125i.z) * intBitsToFloat(R0i.w));
// 19
R126i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R8i.w),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.x),intBitsToFloat(R9i.z),intBitsToFloat(R127i.z),0.0)));
PV1iy = R126i.x;
PV1iz = R126i.x;
PV1iw = R126i.x;
R4i.x = floatBitsToInt(intBitsToFloat(R124i.w) * intBitsToFloat(R0i.w));
// 20
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.w),intBitsToFloat(R6i.y),intBitsToFloat(R10i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R10i.w),0.0)));
PV0ix = tempi.x;
R6i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.x = floatBitsToInt(intBitsToFloat(R124i.x) * intBitsToFloat(R0i.w));
// 21
R5i.x = floatBitsToInt(intBitsToFloat(R127i.y) * intBitsToFloat(R0i.w));
R5i.y = floatBitsToInt(intBitsToFloat(R126i.w) * intBitsToFloat(R0i.w));
R10i.z = floatBitsToInt(intBitsToFloat(R5i.w) * intBitsToFloat(R0i.w));
R5i.w = floatBitsToInt(intBitsToFloat(R126i.z) * intBitsToFloat(R0i.w));
R0i.y = floatBitsToInt(intBitsToFloat(R126i.x) * intBitsToFloat(R0i.w));
}
if( activeMaskStackC[5] == true ) {
// 0
R126i.x = floatBitsToInt(intBitsToFloat(R5i.z) * intBitsToFloat(R0i.w));
R126i.z = floatBitsToInt(intBitsToFloat(R6i.w) * intBitsToFloat(R0i.w));
R126i.w = floatBitsToInt(intBitsToFloat(R6i.y) * intBitsToFloat(R0i.w));
// 1
R21i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R10i.z),intBitsToFloat(R4i.w))));
PV1iy = R21i.x;
PV1iz = R21i.x;
PV1iw = R21i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R5i.y),intBitsToFloat(R126i.z),intBitsToFloat(R5i.w))));
PV0ix = tempi.x;
R21i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(R11i.w)),vec4(intBitsToFloat(R5i.x),intBitsToFloat(R0i.y),intBitsToFloat(R126i.x),intBitsToFloat(R126i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R21i.z = tempi.x;
PV1iw = tempi.x;
// 4
R0i.x = R25i.x;
}
activeMaskStack[4] = activeMaskStack[4] == false;
activeMaskStackC[5] = activeMaskStack[4] == true && activeMaskStackC[4] == true;
if( activeMaskStackC[5] == true ) {
// 0
R0i.x = R24i.x;
}
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R25i.x = R24i.x;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R123i.x = ((R0i.x == 0)?(R20i.y):(R21i.y));
R123i.y = ((R0i.x == 0)?(R20i.x):(R21i.x));
R123i.w = ((R0i.x == 0)?(R20i.z):(R21i.z));
// 1
R20i.x = ((R25i.x == 0)?(R123i.y):(R21i.x));
R20i.y = ((R25i.x == 0)?(R123i.x):(R21i.y));
R20i.z = ((R25i.x == 0)?(R123i.w):(R21i.z));
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(R20i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(R20i.x)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(R20i.z)));
// 1
R18i.x = floatBitsToInt(intBitsToFloat(R18i.x) + intBitsToFloat(PV0iy));
R18i.y = floatBitsToInt(intBitsToFloat(R18i.y) + intBitsToFloat(PV0ix));
R18i.z = floatBitsToInt(intBitsToFloat(R18i.z) + intBitsToFloat(PV0iw));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R0i.z = uf_remappedVS[1].y & 0x40;
// 1
predResult = (R0i.z == 0x40);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
R0i.w = 0x3f800000;
// 1
predResult = (R14i.y != 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[15].x),intBitsToFloat(uf_remappedVS[15].y),intBitsToFloat(uf_remappedVS[15].z),intBitsToFloat(uf_remappedVS[15].w))));
PV0ix = tempi.x;
R15i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R25i.z != 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R4i.w = uf_remappedVS[15].w;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z),intBitsToFloat(R0i.w))));
PV1ix = tempi.x;
R15i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.x), intBitsToFloat(uf_remappedVS[25].z)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.y), -(intBitsToFloat(uf_remappedVS[25].y))));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R18i.z), intBitsToFloat(uf_remappedVS[25].z)));
PV0iw = ((intBitsToFloat(uf_remappedVS[25].w) > intBitsToFloat(R7i.y))?-1:0);
R126i.x = int(intBitsToFloat(uf_remappedVS[25].x));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z),intBitsToFloat(R0i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R126i.z = ((R126i.x == 0)?(PV0iw):(0));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[25].z)));
R0i.y = uf_remappedVS[25].w;
R123i.z = ((R26i.x == 0)?(R15i.y):(PV1ix));
R127i.w = ((R126i.z == 0)?(R18i.x):(R127i.x));
R125i.x = ((R126i.z == 0)?(R18i.z):(R127i.z));
// 3
R127i.x = ((R126i.z == 0)?(R7i.y):(R0i.y));
R127i.y = ((R126i.z == 0)?(R18i.y):(PV0ix));
PV1iz = ((intBitsToFloat(uf_remappedVS[25].w) > intBitsToFloat(R123i.z))?-1:0);
PV1iw = (R126i.x == int(1))?-1:0;
R126i.x = floatBitsToInt(-(intBitsToFloat(R123i.z)) + intBitsToFloat(uf_remappedVS[25].w));
// 4
R123i.x = R7i.x;
R126i.y = ((PV1iw == 0)?(0):(PV1iz));
PV0iz = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[25].y)), intBitsToFloat(R127i.y)));
R126i.w = R7i.z;
R125i.w = R7i.w;
// 5
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[25].z), intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[25].z), intBitsToFloat(R127i.w)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[25].z), intBitsToFloat(R125i.x)));
PV1iw = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(R126i.x));
R20i.x = ((R126i.y == 0)?(R123i.x):(R123i.x));
// 6
R18i.x = ((R126i.y == 0)?(R127i.w):(PV1iy));
R20i.y = ((R126i.y == 0)?(R127i.x):(PV1iw));
R18i.z = ((R126i.y == 0)?(R125i.x):(PV1iz));
R18i.y = ((R126i.y == 0)?(R127i.y):(PV1ix));
// 7
R20i.z = R126i.w;
R20i.w = R125i.w;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R20i.x = R7i.x;
R20i.y = R7i.y;
R20i.z = R7i.z;
R20i.w = R7i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R0i.x = uf_remappedVS[1].w & int(1);
// 1
predResult = (0 != R0i.x);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedVS[26].y) + 1.0);
R0i.w = uf_remappedVS[1].w & 0x8;
// 1
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iz));
// 2
R0i.x = floatBitsToInt(intBitsToFloat(R23i.x) * intBitsToFloat(PS1i));
R0i.x = clampFI32(R0i.x);
}
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
R5i.z = ((R0i.w == 0)?(uf_remappedVS[27].w):(uf_remappedVS[28].z));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R5i.z) * 0.125);
R127i.y = ((8.0 > intBitsToFloat(R5i.z))?-1:0);
R4i.x = uf_remappedVS[27].x;
// 2
R4i.y = 0;
R0i.z = uf_remappedVS[27].z;
tempResultf = max(0.0, intBitsToFloat(PV1ix));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 3
PV1iz = floatBitsToInt(intBitsToFloat(PS0i) * 1.5);
// 4
PS0i = floatBitsToInt(exp2(intBitsToFloat(PV1iz)));
// 5
R123i.x = ((R127i.y == 0)?(0x3f800000):(PS0i));
// 6
PV0iw = R123i.x;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) / 2.0);
// 7
R0i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(R0i.x)));
// 8
predResult = (R14i.y != 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = uf_remappedVS[14].x;
R127i.y = uf_remappedVS[15].x;
R126i.z = uf_remappedVS[14].y;
R127i.w = uf_remappedVS[15].y;
// 1
R126i.x = uf_remappedVS[16].y;
R126i.y = uf_remappedVS[14].z;
R127i.z = uf_remappedVS[16].x;
// 2
R125i.y = uf_remappedVS[15].z;
R125i.z = uf_remappedVS[16].z;
// 3
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1iy = R0i.x;
PV1iz = R0i.x;
PV1iw = R0i.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.z),intBitsToFloat(R127i.w),intBitsToFloat(R126i.x),0.0)));
PV0ix = tempi.x;
R0i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.y),intBitsToFloat(R125i.y),intBitsToFloat(R125i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R0i.z = tempi.x;
PV1iw = tempi.x;
}
activeMaskStack[2] = activeMaskStack[2] == false;
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = R23i.y;
R0i.y = R16i.x;
R4i.z = R17i.x;
R127i.w = R17i.y;
R127i.z = R16i.y;
// 1
R126i.x = R14i.z;
R127i.y = R13i.z;
R126i.z = R12i.z;
// 2
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R15i.x),intBitsToFloat(R0i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R0i.z),0.0)));
PV0iy = R0i.x;
PV0iz = R0i.x;
PV0iw = R0i.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.w),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R0i.z),0.0)));
PV1ix = tempi.x;
R0i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R0i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R0i.z = tempi.x;
PV0iw = tempi.x;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
R127i.x = uf_remappedVS[14].y;
R127i.y = uf_remappedVS[15].y;
// 1
PV1iz = uf_remappedVS[16].y;
R4i.w = uf_remappedVS[1].w & 0x10;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV1iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV1iz),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 4
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS1i), intBitsToFloat(PS1i)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 5
R127i.x = floatBitsToInt(intBitsToFloat(R0i.z) * intBitsToFloat(PS0i));
R127i.y = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(PS0i));
R127i.z = floatBitsToInt(intBitsToFloat(R0i.x) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 6
PV0ix = floatBitsToInt(intBitsToFloat(R0i.z) * intBitsToFloat(PS1i));
PV0iy = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(PS1i));
PV0iz = floatBitsToInt(intBitsToFloat(R0i.x) * intBitsToFloat(PS1i));
// 7
R4i.x = ((R14i.y == 0)?(R127i.z):(PV0iz));
R4i.y = ((R14i.y == 0)?(R127i.y):(PV0iy));
R4i.z = ((R14i.y == 0)?(R127i.x):(PV0ix));
// 8
predResult = (0 != R4i.w);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = floatBitsToInt(intBitsToFloat(R20i.x) * intBitsToFloat(0x3cf5c28f));
R0i.y = floatBitsToInt(intBitsToFloat(R20i.y) * intBitsToFloat(0x3cf5c28f));
R0i.z = floatBitsToInt(intBitsToFloat(R20i.z) * intBitsToFloat(0x3cf5c28f));
}
if( activeMaskStackC[3] == true ) {
R0i.xyz = floatBitsToInt(texture(textureUnitVS5, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z))).xyz);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0iy = R0i.z;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
PV0iz = R0i.y;
PV0iz = floatBitsToInt(intBitsToFloat(PV0iz) * 2.0);
PV0iw = R0i.x;
PV0iw = floatBitsToInt(intBitsToFloat(PV0iw) * 2.0);
// 1
PV1ix = floatBitsToInt(intBitsToFloat(PV0iw) + -(1.0));
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) + -(1.0));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + -(1.0));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(PV1iw) * intBitsToFloat(0x3e99999a));
PV0iy = floatBitsToInt(intBitsToFloat(PV1ix) * intBitsToFloat(0x3e99999a));
PV0iw = floatBitsToInt(intBitsToFloat(PV1iz) * intBitsToFloat(0x3e99999a));
// 3
R4i.x = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(PV0iy));
R4i.y = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(PV0ix));
R4i.z = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(PV0iw));
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[29].y), intBitsToFloat(R5i.z)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[29].x), intBitsToFloat(R5i.z)));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.x), intBitsToFloat(uf_remappedVS[29].z)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(PV0iz)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PV0iz)));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R127i.y)));
// 2
R126i.x = floatBitsToInt(-(intBitsToFloat(PV1ix)) + 1.0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV1iy)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(R127i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R127i.y)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV1iz)));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R127i.w)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(R127i.x)));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV0iw)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.w), intBitsToFloat(PV0iz)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV0iy)));
// 4
backupReg0i = R127i.y;
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV1iy)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(backupReg0i)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV1ix)));
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.x), intBitsToFloat(PV1iw)));
// 5
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(R127i.w)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(PV0iz)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(PV0iw)));
R4i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(PV0ix)));
// 6
R4i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(R127i.y)));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].w), intBitsToFloat(R126i.x)));
}
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
R0i.w = uf_remappedVS[1].w & 0x40;
// 1
predResult = (0 != R0i.w);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedVS[26].z) * intBitsToFloat(0xbdcccccd));
// 1
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedVS[30].z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_remappedVS[30].x)));
// 2
R18i.x = PV1iw;
R18i.z = PV1iy;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R20i.x = floatBitsToInt(intBitsToFloat(R20i.x) + intBitsToFloat(R0i.x));
R20i.y = floatBitsToInt(intBitsToFloat(R20i.y) + intBitsToFloat(R0i.y));
R20i.z = floatBitsToInt(intBitsToFloat(R20i.z) + intBitsToFloat(R0i.z));
// 1
R18i.x = floatBitsToInt(intBitsToFloat(R4i.x) + intBitsToFloat(R18i.x));
R18i.y = floatBitsToInt(intBitsToFloat(R4i.y) + intBitsToFloat(R18i.y));
R18i.z = floatBitsToInt(intBitsToFloat(R4i.z) + intBitsToFloat(R18i.z));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R0i.z = uf_remappedVS[1].w & 0x4;
// 1
predResult = (0 != R0i.z);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
R0i.w = 0x3f800000;
// 1
predResult = (R14i.y != 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R19i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[14].x),intBitsToFloat(uf_remappedVS[14].y),intBitsToFloat(uf_remappedVS[14].z),intBitsToFloat(uf_remappedVS[14].w))));
PV0iy = R19i.x;
PV0iz = R19i.x;
PV0iw = R19i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[15].x),intBitsToFloat(uf_remappedVS[15].y),intBitsToFloat(uf_remappedVS[15].z),intBitsToFloat(uf_remappedVS[15].w))));
PV1ix = tempi.x;
R19i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),intBitsToFloat(uf_remappedVS[16].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R19i.z = tempi.x;
PV0iw = tempi.x;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R25i.z != 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R4i.w = uf_remappedVS[14].w;
R5i.w = uf_remappedVS[15].w;
// 1
R6i.w = uf_remappedVS[16].w;
// 2
R19i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(R0i.w))));
PV0iy = R19i.x;
PV0iz = R19i.x;
PV0iw = R19i.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(R0i.w))));
PV1ix = tempi.x;
R19i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(R0i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R19i.z = tempi.x;
PV0iw = tempi.x;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(R0i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R127i.w = tempi.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(R0i.w))));
PV1ix = tempi.x;
R127i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(R0i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
R19i.x = ((R26i.x == 0)?(R19i.x):(R127i.w));
R19i.y = ((R26i.x == 0)?(R19i.y):(R127i.y));
R19i.z = ((R26i.x == 0)?(R19i.z):(PV0ix));
R0i.w = 0x3f800000;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R19i.x),intBitsToFloat(R19i.y),intBitsToFloat(R19i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[31].x),intBitsToFloat(uf_remappedVS[31].y),intBitsToFloat(uf_remappedVS[31].z),intBitsToFloat(uf_remappedVS[31].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R127i.z = tempi.x;
PV0iw = tempi.x;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R19i.x),intBitsToFloat(R19i.y),intBitsToFloat(R19i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[32].x),intBitsToFloat(uf_remappedVS[32].y),intBitsToFloat(uf_remappedVS[32].z),intBitsToFloat(uf_remappedVS[32].w))));
PV1ix = tempi.x;
R127i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.x = PV0ix;
R127i.x = floatBitsToInt(intBitsToFloat(R127i.x) / 2.0);
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R19i.x),intBitsToFloat(R19i.y),intBitsToFloat(R19i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[33].x),intBitsToFloat(uf_remappedVS[33].y),intBitsToFloat(uf_remappedVS[33].z),intBitsToFloat(uf_remappedVS[33].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R127i.w = tempi.x;
R126i.w = floatBitsToInt(intBitsToFloat(PV1ix) * 0.0 + intBitsToFloat(R127i.x));
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R19i.x),intBitsToFloat(R19i.y),intBitsToFloat(R19i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[34].x),intBitsToFloat(uf_remappedVS[34].y),intBitsToFloat(uf_remappedVS[34].z),intBitsToFloat(uf_remappedVS[34].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.z = floatBitsToInt(intBitsToFloat(R127i.y) * 0.0 + intBitsToFloat(R127i.z));
// 8
R4i.x = floatBitsToInt(intBitsToFloat(PV1ix) * 0.5 + intBitsToFloat(R126i.w));
R4i.y = floatBitsToInt(intBitsToFloat(R127i.w) * -(0.5) + intBitsToFloat(R126i.w));
R0i.z = floatBitsToInt(intBitsToFloat(R127i.y) * 0.5 + intBitsToFloat(R127i.x));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 9
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PS0i)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(PS0i)));
R5i.x = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
}
if( activeMaskStackC[2] == true ) {
R0i.w = floatBitsToInt(texture(textureUnitVS6, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).x);
}
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].w), intBitsToFloat(R0i.w)));
PV0iw = floatBitsToInt(intBitsToFloat(R0i.z) * intBitsToFloat(R5i.x));
// 1
PV1ix = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].y)) + intBitsToFloat(PV0iy));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iw), intBitsToFloat(uf_remappedVS[35].w)));
// 2
PV0iy = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].y)) + intBitsToFloat(PV1iz));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(PV1ix));
// 3
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].z)) * intBitsToFloat(PS0i));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(PV0iy));
// 4
PV0iw = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].z)) * intBitsToFloat(PS1i));
// 5
R15i.z = floatBitsToInt(intBitsToFloat(PV0iw) + -(intBitsToFloat(R127i.z)));
// 6
PV0ix = ((1.0 > intBitsToFloat(R15i.z))?-1:0);
PV0iy = ((intBitsToFloat(R15i.z) > 0.0)?-1:0);
// 7
R0i.w = ((PV0iy == 0)?(0):(PV0ix));
// 8
predResult = (R0i.w != 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R12i.x = uf_remappedVS[36].x;
R6i.y = floatBitsToInt(intBitsToFloat(R4i.y) * intBitsToFloat(R5i.x));
R7i.z = floatBitsToInt(intBitsToFloat(R4i.x) * intBitsToFloat(R5i.x));
R14i.w = uf_remappedVS[37].x;
R13i.x = uf_remappedVS[36].y;
// 1
R0i.x = floatBitsToInt(intBitsToFloat(R7i.z) + 0.0);
R0i.y = floatBitsToInt(intBitsToFloat(R6i.y) + 0.0);
R0i.z = floatBitsToInt(intBitsToFloat(R7i.z) + intBitsToFloat(0xbb19999a));
R0i.w = floatBitsToInt(intBitsToFloat(R6i.y) + 0.0);
R4i.x = floatBitsToInt(intBitsToFloat(R7i.z) + intBitsToFloat(0x3b19999a));
// 2
R5i.x = floatBitsToInt(intBitsToFloat(R7i.z) + 0.0);
R4i.y = floatBitsToInt(intBitsToFloat(R6i.y) + 0.0);
R5i.z = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(0x3b888889));
R5i.w = floatBitsToInt(intBitsToFloat(R7i.z) + 0.0);
R5i.y = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(0xbb888889));
}
if( activeMaskStackC[3] == true ) {
R6i.xzw = floatBitsToInt(zmGather(textureUnitVS6, vec2(0.0001) + vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y)), 0).xzw);
R0i.xzw = floatBitsToInt(zmGather(textureUnitVS6, vec2(0.0001) + vec2(intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)), 0).xzw);
R4i.xzw = floatBitsToInt(zmGather(textureUnitVS6, vec2(0.0001) + vec2(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y)), 0).xzw);
R8i.xzw = floatBitsToInt(zmGather(textureUnitVS6, vec2(0.0001) + vec2(intBitsToFloat(R5i.x),intBitsToFloat(R5i.z)), 0).xzw);
R5i.xzw = floatBitsToInt(zmGather(textureUnitVS6, vec2(0.0001) + vec2(intBitsToFloat(R5i.w),intBitsToFloat(R5i.y)), 0).xzw);
}
if( activeMaskStackC[3] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].w), intBitsToFloat(R6i.x)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].w), intBitsToFloat(R0i.x)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].w), intBitsToFloat(R6i.w)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].w), intBitsToFloat(R6i.z)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].w), intBitsToFloat(R0i.z)));
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].w), intBitsToFloat(R0i.w)));
R125i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].y)) + intBitsToFloat(PV0ix));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].y)) + intBitsToFloat(PV0iw));
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].y)) + intBitsToFloat(PV0iz));
R127i.x = floatBitsToInt(intBitsToFloat(R7i.z) + intBitsToFloat(0x3acccccd));
// 2
R125i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].y)) + intBitsToFloat(R127i.y));
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].y)) + intBitsToFloat(R126i.y));
R126i.z = floatBitsToInt(intBitsToFloat(R6i.y) + intBitsToFloat(0x3b360b61));
R127i.w = R6i.y;
R124i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].y)) + intBitsToFloat(PV1ix));
// 3
backupReg0i = R125i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].w), intBitsToFloat(R4i.z)));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].w), intBitsToFloat(R4i.x)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), -(intBitsToFloat(uf_remappedVS[38].x))));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].w), intBitsToFloat(R4i.w)));
R125i.z = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 4
backupReg0i = R127i.x;
backupReg1i = R6i.y;
backupReg2i = R127i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z), -(intBitsToFloat(uf_remappedVS[38].x))));
R6i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[38].y)), intBitsToFloat(R127i.w)));
R127i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[38].x)), intBitsToFloat(backupReg0i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg1i), -(intBitsToFloat(uf_remappedVS[38].y))));
R126i.y = floatBitsToInt(1.0 / intBitsToFloat(backupReg2i));
// 5
backupReg0i = R125i.y;
backupReg1i = R126i.w;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), -(intBitsToFloat(uf_remappedVS[38].y))));
R125i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].y)) + intBitsToFloat(R126i.x));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].y)) + intBitsToFloat(backupReg0i));
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].y)) + intBitsToFloat(R125i.w));
R126i.x = floatBitsToInt(1.0 / intBitsToFloat(backupReg1i));
// 6
backupReg0i = R8i.x;
backupReg1i = R125i.z;
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].w), intBitsToFloat(R8i.w)));
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].w), intBitsToFloat(R8i.z)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].w), intBitsToFloat(backupReg0i)));
R125i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].z)) * intBitsToFloat(backupReg1i));
R125i.x = floatBitsToInt(1.0 / intBitsToFloat(R125i.x));
// 7
backupReg0i = R127i.y;
R7i.x = floatBitsToInt(intBitsToFloat(R124i.z) + -(intBitsToFloat(uf_remappedVS[39].x)));
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].z)) * intBitsToFloat(R126i.x));
R8i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].z)) * intBitsToFloat(R126i.y));
R12i.w = floatBitsToInt(intBitsToFloat(R127i.w) + -(intBitsToFloat(uf_remappedVS[39].y)));
R127i.w = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 8
R9i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[39].x)) + intBitsToFloat(R127i.z));
R10i.y = floatBitsToInt(intBitsToFloat(R127i.x) + -(intBitsToFloat(uf_remappedVS[39].x)));
R10i.z = floatBitsToInt(intBitsToFloat(R124i.x) + -(intBitsToFloat(uf_remappedVS[39].y)));
R13i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[39].y)) + intBitsToFloat(R6i.y));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R124i.y));
// 9
R4i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].z)) * intBitsToFloat(R127i.w));
R124i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].z)) * intBitsToFloat(R125i.x));
R125i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].y)) + intBitsToFloat(R125i.z));
R127i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].z)) * intBitsToFloat(PS0i));
R124i.w = floatBitsToInt(1.0 / intBitsToFloat(R126i.z));
// 10
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].w), intBitsToFloat(R5i.x)));
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].y)) + intBitsToFloat(R8i.x));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].y)) + intBitsToFloat(R5i.y));
R8i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].w), intBitsToFloat(R5i.z)));
R126i.z = floatBitsToInt(1.0 / intBitsToFloat(R125i.y));
// 11
backupReg0i = R126i.w;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R7i.x)));
R5i.y = R127i.y;
R5i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R12i.w)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[35].w), intBitsToFloat(R5i.w)));
R127i.y = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 12
backupReg0i = R125i.w;
R124i.x = backupReg0i;
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R13i.w)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R9i.x)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R10i.y)));
R7i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R10i.z)));
// 13
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.w), intBitsToFloat(R127i.w)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(R127i.w)));
R0i.z = R127i.w;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(R4i.x)));
R4i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.w), intBitsToFloat(R4i.x)));
// 14
backupReg0i = R126i.z;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(R124i.y)));
R126i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].z)) * intBitsToFloat(R124i.w));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(R124i.y)));
R5i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].z)) * intBitsToFloat(backupReg0i));
// 15
backupReg0i = R127i.y;
backupReg1i = R125i.z;
R8i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].y)) + intBitsToFloat(R125i.x));
R127i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].y)) + intBitsToFloat(R8i.w));
R125i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].z)) * intBitsToFloat(backupReg0i));
R126i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].y)) + intBitsToFloat(R126i.w));
R125i.x = floatBitsToInt(1.0 / intBitsToFloat(backupReg1i));
// 16
R6i.x = floatBitsToInt(-(intBitsToFloat(R5i.z)) + intBitsToFloat(R125i.y));
R4i.y = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(R124i.z));
R6i.z = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(R125i.w));
R9i.w = floatBitsToInt(-(intBitsToFloat(R5i.y)) + intBitsToFloat(R124i.x));
R125i.w = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 17
R0i.x = floatBitsToInt(-(intBitsToFloat(R6i.y)) + intBitsToFloat(R126i.x));
R0i.y = floatBitsToInt(-(intBitsToFloat(R5i.z)) + intBitsToFloat(R7i.z));
R5i.z = floatBitsToInt(-(intBitsToFloat(R6i.y)) + intBitsToFloat(R127i.w));
R7i.w = floatBitsToInt(-(intBitsToFloat(R5i.y)) + intBitsToFloat(R8i.z));
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R126i.y));
// 18
R4i.x = floatBitsToInt(-(intBitsToFloat(R0i.z)) + intBitsToFloat(R4i.x));
R7i.y = floatBitsToInt(-(intBitsToFloat(R5i.x)) + intBitsToFloat(R4i.z));
R7i.z = floatBitsToInt(-(intBitsToFloat(R5i.x)) + intBitsToFloat(R124i.w));
R11i.w = floatBitsToInt(-(intBitsToFloat(R0i.z)) + intBitsToFloat(R124i.y));
R126i.y = R125i.z;
// 19
backupReg0i = R125i.z;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(backupReg0i)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.w), intBitsToFloat(R5i.w)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(R5i.w)));
R8i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.w), intBitsToFloat(backupReg0i)));
R127i.x = R126i.z;
// 20
R5i.x = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].z)) * intBitsToFloat(R125i.w));
R5i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].z)) * intBitsToFloat(R125i.x));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(R126i.z)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(R126i.z)));
R4i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].z)) * intBitsToFloat(R127i.z));
// 21
backupReg0i = R8i.x;
R8i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(R6i.z)));
R8i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R7i.z)));
R9i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R9i.w)));
R10i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.w), intBitsToFloat(R0i.y)));
R0i.w = floatBitsToInt(1.0 / intBitsToFloat(backupReg0i));
// 22
R10i.x = floatBitsToInt(-(intBitsToFloat(R8i.w)) + intBitsToFloat(R124i.y));
R11i.y = floatBitsToInt(-(intBitsToFloat(R126i.x)) + intBitsToFloat(R125i.z));
R8i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y), intBitsToFloat(R0i.x)));
R6i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.z), intBitsToFloat(R11i.w)));
R4i.z = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 23
R11i.x = floatBitsToInt(-(intBitsToFloat(R126i.y)) + intBitsToFloat(R127i.x));
R9i.y = R5i.y;
R11i.z = floatBitsToInt(-(intBitsToFloat(R126i.x)) + intBitsToFloat(R125i.w));
R5i.w = floatBitsToInt(-(intBitsToFloat(R126i.y)) + intBitsToFloat(R5i.w));
R6i.y = floatBitsToInt(1.0 / intBitsToFloat(R126i.w));
}
if( activeMaskStackC[3] == true ) {
// 0
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(R4i.w)));
R127i.y = floatBitsToInt(-(intBitsToFloat(R8i.w)) + intBitsToFloat(R0i.z));
R125i.z = R4i.w;
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.w), intBitsToFloat(R4i.w)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(R5i.x)));
// 1
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(R5i.y)));
R126i.y = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].z)) * intBitsToFloat(R0i.w));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.w), intBitsToFloat(R5i.x)));
R124i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(R5i.y)));
R0i.w = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].z)) * intBitsToFloat(R4i.z));
// 2
backupReg0i = R0i.x;
R0i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.y)),intBitsToFloat(R0i.y)) + intBitsToFloat(R8i.x));
R4i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.z)),intBitsToFloat(R7i.z)) + intBitsToFloat(R8i.z));
R127i.z = floatBitsToInt(-(intBitsToFloat(uf_remappedVS[35].z)) * intBitsToFloat(R6i.y));
R6i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.x)),intBitsToFloat(backupReg0i)) + intBitsToFloat(R6i.w));
R0i.y = floatBitsToInt(-(intBitsToFloat(R125i.w)) + intBitsToFloat(PV1iz));
// 3
R6i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R6i.x)),intBitsToFloat(R9i.w)) + intBitsToFloat(R10i.w));
R6i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.w)),intBitsToFloat(R6i.z)) + intBitsToFloat(R9i.z));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(R11i.x)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(R11i.z)));
R124i.y = R127i.z;
// 4
backupReg0i = R5i.x;
R5i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R7i.y)),intBitsToFloat(R11i.w)) + intBitsToFloat(R8i.y));
R125i.y = floatBitsToInt(-(intBitsToFloat(R125i.z)) + intBitsToFloat(backupReg0i));
R124i.z = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(R126i.w));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.w), intBitsToFloat(R127i.y)));
R11i.w = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(R126i.x));
// 5
backupReg0i = R127i.z;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x), intBitsToFloat(backupReg0i)));
R9i.y = floatBitsToInt(-(intBitsToFloat(R125i.z)) + intBitsToFloat(R9i.y));
R127i.z = floatBitsToInt(-(intBitsToFloat(R125i.w)) + intBitsToFloat(R124i.w));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R12i.w), intBitsToFloat(backupReg0i)));
R125i.x = R126i.y;
// 6
backupReg0i = R126i.w;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.z), intBitsToFloat(R126i.y)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R13i.w), intBitsToFloat(R0i.w)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(R0i.w)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.y), intBitsToFloat(R126i.y)));
R10i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R10i.x)),intBitsToFloat(R11i.x)) + intBitsToFloat(backupReg0i));
// 7
backupReg0i = R11i.y;
R124i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R127i.z)));
R11i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.w)),intBitsToFloat(R11i.z)) + intBitsToFloat(R126i.z));
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(backupReg0i)),intBitsToFloat(R127i.y)) + intBitsToFloat(R127i.w));
R124i.w = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(PV0iz));
R9i.x = floatBitsToInt(-(intBitsToFloat(R125i.w)) + intBitsToFloat(PV0iy));
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R0i.x),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y),intBitsToFloat(R0i.x),0.0)));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.z), intBitsToFloat(R9i.y)));
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R5i.x),intBitsToFloat(R6i.w),intBitsToFloat(R4i.y),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R5i.x),intBitsToFloat(R6i.w),intBitsToFloat(R4i.y),0.0)));
PV1ix = tempi.x;
R126i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(R11i.w)));
// 10
backupReg0i = R124i.y;
backupReg1i = R127i.z;
R125i.x = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + intBitsToFloat(R125i.x));
R124i.y = floatBitsToInt(-(intBitsToFloat(R125i.w)) + intBitsToFloat(R126i.x));
R127i.z = floatBitsToInt(-(intBitsToFloat(R127i.x)) + intBitsToFloat(R126i.w));
R126i.w = floatBitsToInt(-(intBitsToFloat(backupReg0i)) + intBitsToFloat(R0i.w));
R125i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.z)),intBitsToFloat(backupReg1i)) + intBitsToFloat(PS1i));
// 11
backupReg0i = R127i.y;
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x), intBitsToFloat(R127i.z)));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R125i.y)),intBitsToFloat(R11i.w)) + intBitsToFloat(R127i.w));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.w), intBitsToFloat(R125i.x)));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.w), intBitsToFloat(R124i.y)));
tempResultf = 1.0 / sqrt(intBitsToFloat(backupReg0i));
R126i.x = floatBitsToInt(tempResultf);
// 12
backupReg0i = R126i.y;
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R10i.x),intBitsToFloat(R11i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R10i.x),intBitsToFloat(R11i.y),intBitsToFloat(R126i.z),0.0)));
PV0ix = tempi.x;
R126i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
tempResultf = 1.0 / sqrt(intBitsToFloat(backupReg0i));
R127i.w = floatBitsToInt(tempResultf);
// 13
R124i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.y)),intBitsToFloat(R9i.y)) + intBitsToFloat(R124i.x));
R125i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R126i.w)),intBitsToFloat(R127i.z)) + intBitsToFloat(R124i.z));
R11i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R124i.w)),intBitsToFloat(R124i.y)) + intBitsToFloat(R127i.x));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R5i.x), intBitsToFloat(R127i.w)));
R124i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.w), intBitsToFloat(R127i.w)));
// 14
backupReg0i = R126i.x;
backupReg1i = R126i.y;
R126i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(R127i.w)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x), intBitsToFloat(backupReg0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.y), intBitsToFloat(backupReg0i)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.x), intBitsToFloat(backupReg0i)));
tempResultf = 1.0 / sqrt(intBitsToFloat(backupReg1i));
R127i.x = floatBitsToInt(tempResultf);
// 15
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R124i.x),intBitsToFloat(R127i.y),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R124i.x),intBitsToFloat(R127i.y),intBitsToFloat(R125i.z),0.0)));
PV1ix = tempi.x;
R124i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R125i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R9i.x)),intBitsToFloat(R125i.x)) + intBitsToFloat(R125i.w));
// 16
PV0ix = floatBitsToInt(-(intBitsToFloat(R127i.w)));
PV0iy = floatBitsToInt(-(intBitsToFloat(R126i.w)));
PV0iz = floatBitsToInt(-(intBitsToFloat(R126i.x)));
PV0iw = floatBitsToInt(-(intBitsToFloat(R126i.y)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R10i.x), intBitsToFloat(R127i.x)));
// 17
backupReg0i = R124i.y;
R126i.x = floatBitsToInt(intBitsToFloat(R127i.z) + intBitsToFloat(R124i.z));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.z), intBitsToFloat(R127i.x)));
R127i.z = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iy));
R126i.w = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0iz));
tempResultf = 1.0 / sqrt(intBitsToFloat(backupReg0i));
R125i.w = floatBitsToInt(tempResultf);
// 18
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R125i.y),intBitsToFloat(R11i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R125i.y),intBitsToFloat(R11i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.y), intBitsToFloat(R127i.x)));
// 19
PV1ix = floatBitsToInt(-(intBitsToFloat(R127i.w)));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R124i.x), intBitsToFloat(R125i.w)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(R125i.w)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R124i.y)));
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
R124i.x = floatBitsToInt(tempResultf);
// 20
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(R125i.w)));
R127i.y = floatBitsToInt(intBitsToFloat(PV1iw) + intBitsToFloat(R126i.w));
PV0iz = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(R126i.x));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) + intBitsToFloat(R127i.z));
PS0i = floatBitsToInt(-(intBitsToFloat(PV1iy)));
// 21
backupReg0i = R125i.x;
R125i.x = floatBitsToInt(intBitsToFloat(PS0i) + intBitsToFloat(PV0iw));
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R11i.z), intBitsToFloat(R124i.x)));
PV1iz = floatBitsToInt(-(intBitsToFloat(R125i.z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(backupReg0i), intBitsToFloat(R124i.x)));
R126i.w = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(PV0iz));
// 22
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.y), intBitsToFloat(R124i.x)));
PV0iy = floatBitsToInt(-(intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(R127i.y));
PV0iw = floatBitsToInt(-(intBitsToFloat(PV1iy)));
R11i.z = uf_remappedVS[40].x;
// 23
R10i.x = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(R126i.w));
R11i.y = floatBitsToInt(intBitsToFloat(PV0iy) + intBitsToFloat(R125i.x));
R10i.z = uf_remappedVS[37].y;
R6i.w = floatBitsToInt(intBitsToFloat(PV0iw) + intBitsToFloat(PV0iz));
R6i.z = uf_remappedVS[40].y;
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R125i.x = floatBitsToInt(intBitsToFloat(R11i.y) * intBitsToFloat(0x3e4ccccd));
R127i.y = floatBitsToInt(intBitsToFloat(R10i.x) * intBitsToFloat(0x3e4ccccd));
R125i.z = floatBitsToInt(intBitsToFloat(R6i.w) * intBitsToFloat(0x3e4ccccd));
R126i.w = uf_remappedVS[36].z;
R125i.y = uf_remappedVS[37].z;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R125i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R127i.z = uf_remappedVS[40].z;
// 2
tempResultf = 1.0 / sqrt(intBitsToFloat(PV1ix));
PS0i = floatBitsToInt(tempResultf);
// 3
R125i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.x), intBitsToFloat(PS0i)));
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y), intBitsToFloat(PS0i)));
R125i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R125i.z), intBitsToFloat(PS0i)));
// 4
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R12i.x),intBitsToFloat(R14i.w),intBitsToFloat(R11i.z),0.0)));
PV0iy = R0i.x;
PV0iz = R0i.x;
PV0iw = R0i.x;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R13i.x),intBitsToFloat(R10i.z),intBitsToFloat(R6i.z),0.0)));
PV1ix = tempi.x;
R0i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R125i.x),intBitsToFloat(R127i.y),intBitsToFloat(R125i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.w),intBitsToFloat(R125i.y),intBitsToFloat(R127i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R0i.z = tempi.x;
PV0iw = tempi.x;
// 7
predResult = (R14i.y != 0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.x = uf_remappedVS[14].x;
R127i.y = uf_remappedVS[15].x;
R126i.z = uf_remappedVS[14].y;
R127i.w = uf_remappedVS[15].y;
// 1
R126i.x = uf_remappedVS[16].y;
R126i.y = uf_remappedVS[14].z;
R127i.z = uf_remappedVS[16].x;
// 2
R125i.y = uf_remappedVS[15].z;
R125i.z = uf_remappedVS[16].z;
// 3
R4i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),0.0)));
PV1iy = R4i.x;
PV1iz = R4i.x;
PV1iw = R4i.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.z),intBitsToFloat(R127i.w),intBitsToFloat(R126i.x),0.0)));
PV0ix = tempi.x;
R4i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R126i.y),intBitsToFloat(R125i.y),intBitsToFloat(R125i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
R4i.z = tempi.x;
PV1iw = tempi.x;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R127i.x = R23i.y;
R4i.y = R16i.x;
R4i.z = R17i.x;
R127i.w = R17i.y;
R127i.z = R16i.y;
// 1
R126i.x = R14i.z;
R127i.y = R13i.z;
R126i.z = R12i.z;
// 2
R4i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R15i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),0.0)));
PV0iy = R4i.x;
PV0iz = R4i.x;
PV0iw = R4i.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.w),intBitsToFloat(R127i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),0.0)));
PV1ix = tempi.x;
R4i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R126i.x),intBitsToFloat(R127i.y),intBitsToFloat(R126i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
R4i.z = tempi.x;
PV0iw = tempi.x;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R0i.w = uf_remappedVS[1].w & 0x20;
// 1
tempResultf = 1.0 / sqrt(intBitsToFloat(PV0ix));
PS1i = floatBitsToInt(tempResultf);
// 2
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(PS1i)));
R0i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y), intBitsToFloat(PS1i)));
R0i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z), intBitsToFloat(PS1i)));
// 3
predResult = (0 != R0i.w);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[26].x), intBitsToFloat(R0i.y)));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[29].w), intBitsToFloat(R0i.y)));
// 1
R20i.y = floatBitsToInt(intBitsToFloat(R20i.y) + intBitsToFloat(PV0iz));
R18i.y = floatBitsToInt(intBitsToFloat(R18i.y) + intBitsToFloat(PV0ix));
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R127i.x = uf_remappedVS[14].y;
R127i.y = uf_remappedVS[15].y;
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.z), intBitsToFloat(R0i.y)));
R127i.z = floatBitsToInt(intBitsToFloat(R127i.z) / 2.0);
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.z), intBitsToFloat(R0i.x)));
R127i.w = floatBitsToInt(intBitsToFloat(R127i.w) / 2.0);
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R15i.z), intBitsToFloat(R0i.z)));
R126i.y = floatBitsToInt(intBitsToFloat(R126i.y) / 2.0);
// 1
PV1iz = uf_remappedVS[16].y;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV1iz),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV1iz),0.0)));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R18i.x),intBitsToFloat(R18i.y),intBitsToFloat(R18i.z),intBitsToFloat(0x80000000)),vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),0.0)));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
PS1i = floatBitsToInt(sqrt(intBitsToFloat(PV0ix)));
// 4
R127i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.z)), intBitsToFloat(PV1ix)));
R127i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.y)), intBitsToFloat(PV1ix)));
R126i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R0i.x)), intBitsToFloat(PV1ix)));
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(PS1i));
// 5
backupReg0i = R126i.w;
R126i.x = floatBitsToInt(intBitsToFloat(R127i.w) * intBitsToFloat(backupReg0i));
PV1iy = floatBitsToInt(intBitsToFloat(R18i.z) + intBitsToFloat(R127i.x));
PV1iz = floatBitsToInt(intBitsToFloat(R18i.y) + intBitsToFloat(R127i.y));
PV1iw = floatBitsToInt(intBitsToFloat(R18i.x) + intBitsToFloat(R126i.z));
R125i.y = floatBitsToInt(intBitsToFloat(R127i.z) * intBitsToFloat(backupReg0i));
// 6
backupReg0i = R126i.z;
PV0ix = floatBitsToInt(intBitsToFloat(R126i.y) * intBitsToFloat(R126i.w));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[26].x), intBitsToFloat(PV1iw)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[26].x), intBitsToFloat(PV1iy)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[26].x), intBitsToFloat(PV1iz)));
R124i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[29].w), intBitsToFloat(backupReg0i)));
// 7
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[29].w), intBitsToFloat(R127i.y)));
R20i.y = floatBitsToInt(intBitsToFloat(R20i.y) + intBitsToFloat(R125i.y));
R20i.z = floatBitsToInt(intBitsToFloat(R20i.z) + intBitsToFloat(PV0ix));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[29].w), intBitsToFloat(R127i.x)));
R20i.x = floatBitsToInt(intBitsToFloat(R20i.x) + intBitsToFloat(R126i.x));
// 8
R18i.x = floatBitsToInt(intBitsToFloat(R126i.y) + intBitsToFloat(R124i.y));
R18i.y = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(PV1ix));
R18i.z = floatBitsToInt(intBitsToFloat(R126i.z) + intBitsToFloat(PV1iw));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R0i.y = uf_remappedVS[1].w & 0x2;
// 1
predResult = (0 != R0i.y);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
R0i.w = 0x3f800000;
// 1
predResult = (R14i.y != 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R19i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[14].x),intBitsToFloat(uf_remappedVS[14].y),intBitsToFloat(uf_remappedVS[14].z),intBitsToFloat(uf_remappedVS[14].w))));
PV0iy = R19i.x;
PV0iz = R19i.x;
PV0iw = R19i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[15].x),intBitsToFloat(uf_remappedVS[15].y),intBitsToFloat(uf_remappedVS[15].z),intBitsToFloat(uf_remappedVS[15].w))));
PV1ix = tempi.x;
R19i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),intBitsToFloat(uf_remappedVS[16].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R19i.z = tempi.x;
PV0iw = tempi.x;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
predResult = (R25i.z != 0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R4i.w = uf_remappedVS[14].w;
R5i.w = uf_remappedVS[15].w;
// 1
R6i.w = uf_remappedVS[16].w;
// 2
R19i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(R0i.w))));
PV0iy = R19i.x;
PV0iz = R19i.x;
PV0iw = R19i.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R5i.w)),vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(R0i.w))));
PV1ix = tempi.x;
R19i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R6i.w)),vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(R0i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R19i.z = tempi.x;
PV0iw = tempi.x;
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(R0i.w))));
PV0iy = R127i.x;
PV0iz = R127i.x;
PV0iw = R127i.x;
R1i.w = 0x3f800000;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(R0i.w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
R2i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[26].w) + intBitsToFloat(uf_remappedVS[41].x));
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(R20i.x),intBitsToFloat(R20i.y),intBitsToFloat(R20i.z),intBitsToFloat(R0i.w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R3i.y = ((R26i.x == 0)?(R19i.y):(PV1ix));
// 3
R3i.x = ((R26i.x == 0)?(R19i.x):(R127i.x));
R0i.y = floatBitsToInt(intBitsToFloat(uf_remappedVS[26].w) + 1.0);
R3i.z = ((R26i.x == 0)?(R19i.z):(PV0ix));
// 4
R0i.x = floatBitsToInt(intBitsToFloat(R22i.x) + intBitsToFloat(R3i.x));
R0i.y = floatBitsToInt(intBitsToFloat(R0i.y) + intBitsToFloat(R3i.y));
R0i.z = floatBitsToInt(intBitsToFloat(R22i.x) + intBitsToFloat(R3i.z));
}
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[40].x),intBitsToFloat(uf_remappedVS[40].y),intBitsToFloat(uf_remappedVS[40].z),intBitsToFloat(uf_remappedVS[40].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
PV1ix = ((-(intBitsToFloat(PV0ix)) > intBitsToFloat(R2i.y))?-1:0);
R127i.z = ((-(intBitsToFloat(PV0ix)) > intBitsToFloat(uf_remappedVS[41].y))?-1:0);
R127i.w = ((-(intBitsToFloat(PV0ix)) > intBitsToFloat(uf_remappedVS[41].z))?-1:0);
// 2
PV0iw = PV1ix & int(1);
// 3
PV1iz = PV0iw - R127i.z;
// 4
PV0iy = PV1iz - R127i.w;
// 5
R1i.x = floatBitsToInt(float(PV0iy));
// 6
predResult = (intBitsToFloat(R1i.x) == 0.0);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R0i.y = R0i.y;
R0i.z = R0i.z;
R0i.w = 0x3f800000;
// 1
R2i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[42].x),intBitsToFloat(uf_remappedVS[42].y),intBitsToFloat(uf_remappedVS[42].z),intBitsToFloat(uf_remappedVS[42].w))));
PV1iy = R2i.x;
PV1iz = R2i.x;
PV1iw = R2i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[43].x),intBitsToFloat(uf_remappedVS[43].y),intBitsToFloat(uf_remappedVS[43].z),intBitsToFloat(uf_remappedVS[43].w))));
PV0ix = tempi.x;
R2i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[44].x),intBitsToFloat(uf_remappedVS[44].y),intBitsToFloat(uf_remappedVS[44].z),intBitsToFloat(uf_remappedVS[44].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R2i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[45].x),intBitsToFloat(uf_remappedVS[45].y),intBitsToFloat(uf_remappedVS[45].z),intBitsToFloat(uf_remappedVS[45].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R1i.w = tempi.x;
}
activeMaskStack[2] = activeMaskStack[2] == false;
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
predResult = (intBitsToFloat(R1i.x) == 1.0);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R0i.y = R0i.y;
R0i.z = R0i.z;
R0i.w = 0x3f800000;
// 1
R2i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[46].x),intBitsToFloat(uf_remappedVS[46].y),intBitsToFloat(uf_remappedVS[46].z),intBitsToFloat(uf_remappedVS[46].w))));
PV1iy = R2i.x;
PV1iz = R2i.x;
PV1iw = R2i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[47].x),intBitsToFloat(uf_remappedVS[47].y),intBitsToFloat(uf_remappedVS[47].z),intBitsToFloat(uf_remappedVS[47].w))));
PV0ix = tempi.x;
R2i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[48].x),intBitsToFloat(uf_remappedVS[48].y),intBitsToFloat(uf_remappedVS[48].z),intBitsToFloat(uf_remappedVS[48].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R2i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[49].x),intBitsToFloat(uf_remappedVS[49].y),intBitsToFloat(uf_remappedVS[49].z),intBitsToFloat(uf_remappedVS[49].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R1i.w = tempi.x;
}
activeMaskStack[3] = activeMaskStack[3] == false;
activeMaskStackC[4] = activeMaskStack[3] == true && activeMaskStackC[3] == true;
if( activeMaskStackC[4] == true ) {
// 0
R0i.y = R0i.y;
R0i.z = R0i.z;
R0i.w = 0x3f800000;
// 1
R2i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[50].x),intBitsToFloat(uf_remappedVS[50].y),intBitsToFloat(uf_remappedVS[50].z),intBitsToFloat(uf_remappedVS[50].w))));
PV1iy = R2i.x;
PV1iz = R2i.x;
PV1iw = R2i.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[51].x),intBitsToFloat(uf_remappedVS[51].y),intBitsToFloat(uf_remappedVS[51].z),intBitsToFloat(uf_remappedVS[51].w))));
PV0ix = tempi.x;
R2i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[52].x),intBitsToFloat(uf_remappedVS[52].y),intBitsToFloat(uf_remappedVS[52].z),intBitsToFloat(uf_remappedVS[52].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R2i.z = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[53].x),intBitsToFloat(uf_remappedVS[53].y),intBitsToFloat(uf_remappedVS[53].z),intBitsToFloat(uf_remappedVS[53].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R1i.w = tempi.x;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[54].x),intBitsToFloat(uf_remappedVS[54].y),intBitsToFloat(uf_remappedVS[54].z),intBitsToFloat(uf_remappedVS[54].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
R127i.z = floatBitsToInt(1.0 / intBitsToFloat(R1i.w));
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[55].x),intBitsToFloat(uf_remappedVS[55].y),intBitsToFloat(uf_remappedVS[55].z),intBitsToFloat(uf_remappedVS[55].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R127i.w = tempi.x;
R126i.w = floatBitsToInt(1.0 / intBitsToFloat(PV0ix));
// 2
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[56].x),intBitsToFloat(uf_remappedVS[56].y),intBitsToFloat(uf_remappedVS[56].z),intBitsToFloat(uf_remappedVS[56].w))));
PV0iy = R127i.x;
PV0iz = R127i.x;
PV0iw = R127i.x;
PS0i = floatBitsToInt(intBitsToFloat(R2i.z) * intBitsToFloat(R127i.z));
// 3
R0i.x = floatBitsToInt(intBitsToFloat(R2i.x) * intBitsToFloat(R127i.z));
R0i.y = floatBitsToInt(intBitsToFloat(R2i.y) * intBitsToFloat(R127i.z));
R0i.z = floatBitsToInt(roundEven(intBitsToFloat(R1i.x)));
R0i.w = PS0i;
R0i.w = clampFI32(R0i.w);
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.w), intBitsToFloat(R126i.w)));
// 4
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.x), intBitsToFloat(R126i.w)));
R1i.z = floatBitsToInt(fract(intBitsToFloat(R20i.w)));
R2i.y = int(intBitsToFloat(R20i.w));
}
if( activeMaskStackC[2] == true ) {
R0i.z = floatBitsToInt(texture(textureUnitVS12, vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))));
R1i.y = floatBitsToInt(texture(textureUnitVS7, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y))).x);
}
if( activeMaskStackC[2] == true ) {
// 0
PV0iy = floatBitsToInt(-(intBitsToFloat(R0i.z)) + 1.0);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y), intBitsToFloat(uf_remappedVS[28].y)));
R126i.x = floatBitsToInt(float(R2i.y));
// 1
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(R127i.z)));
// 2
PV0ix = floatBitsToInt(intBitsToFloat(PV1iy) + 1.0);
// 3
R126i.w = floatBitsToInt(-(intBitsToFloat(R127i.z)) + intBitsToFloat(PV0ix));
// 4
PV0iy = floatBitsToInt(intBitsToFloat(R126i.w) + -(intBitsToFloat(R1i.z)));
// 5
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3d4ccccd));
// 6
PV0iw = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV1ix));
// 7
R127i.z = ((R24i.z == 0)?(PV0iw):(R126i.w));
// 8
PV0iy = ((0.0 > intBitsToFloat(R127i.z))?-1:0);
// 9
R127i.x = ((PV0iy == 0)?(R127i.z):(0));
// 10
PV0iw = ((intBitsToFloat(R127i.x) > intBitsToFloat(0x3f7fbe77))?-1:0);
// 11
R123i.z = ((PV0iw == 0)?(R127i.x):(0x3f7fbe77));
// 12
R20i.w = floatBitsToInt(intBitsToFloat(R123i.z) + intBitsToFloat(R126i.x));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R0i.x = 0;
R0i.y = floatBitsToInt(1.0);
}
// export
// skipped export to semanticId 255
sb_buffer[sbBase0 + 0] = R20i.x;
sb_buffer[sbBase0 + 1] = R20i.y;
sb_buffer[sbBase0 + 2] = R20i.z;
sb_buffer[sbBase0 + 3] = R20i.w;
// export
// skipped export to semanticId 255
sb_buffer[sbBase1 + 0] = R18i.x;
sb_buffer[sbBase1 + 1] = R18i.y;
sb_buffer[sbBase1 + 2] = R18i.z;
sb_buffer[sbBase1 + 3] = R18i.w;
// export
SET_POSITION(vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.x), intBitsToFloat(R0i.x), intBitsToFloat(R0i.y)));
gl_PointSize = uf_pointSize;
}
