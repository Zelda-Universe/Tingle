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
// shader 260662afc2c27387
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[5];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2DArray textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem2;
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
ivec4 R123i = ivec4(0);
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
R2i = floatBitsToInt(passParameterSem2);
R6i.xyzw = floatBitsToInt(texture(textureUnitPS1, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y))).xyzw);
// 0
PV0ix = uf_remappedPS[0].x;
PV0iy = floatBitsToInt(intBitsToFloat(R0i.y) + -(intBitsToFloat(uf_remappedPS[1].w)));
PV0iz = floatBitsToInt(intBitsToFloat(R0i.x) + -(intBitsToFloat(uf_remappedPS[1].z)));
// 1
PV1ix = floatBitsToInt(fract(intBitsToFloat(PV0iz)));
PV1iy = floatBitsToInt(intBitsToFloat(R1i.z) + intBitsToFloat(PV0ix));
R5i.z = floatBitsToInt(intBitsToFloat(R6i.x) + intBitsToFloat(uf_remappedPS[2].x));
PV1iw = floatBitsToInt(fract(intBitsToFloat(PV0iy)));
// 2
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw),intBitsToFloat(uf_remappedPS[3].x)) + intBitsToFloat(uf_remappedPS[3].w));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix),intBitsToFloat(uf_remappedPS[3].x)) + intBitsToFloat(uf_remappedPS[3].z));
R4i.w = floatBitsToInt(roundEven(intBitsToFloat(PV1iy)));
// 3
PV1ix = floatBitsToInt(intBitsToFloat(R123i.z) + -(intBitsToFloat(uf_remappedPS[4].z)));
R0i.z = R4i.w;
PV1iw = floatBitsToInt(intBitsToFloat(R123i.y) + -(intBitsToFloat(uf_remappedPS[4].w)));
R2i.z = R4i.w;
// 4
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iw), intBitsToFloat(uf_remappedPS[4].y)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1ix), intBitsToFloat(uf_remappedPS[4].y)));
R3i.w = R4i.w;
// 5
R0i.x = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(R127i.z));
R0i.y = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(R127i.y));
R3i.z = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(R127i.z));
R2i.w = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(R127i.z));
R2i.y = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(R127i.y));
// 6
R4i.x = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(R127i.z));
R3i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(R127i.y));
R4i.z = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(R127i.y));
R0i.xyzw = floatBitsToInt(zmGather(textureUnitPS0, vec3(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z)), 0).xyzw);
R2i.xyzw = floatBitsToInt(zmGather(textureUnitPS0, vec3(intBitsToFloat(R2i.w),intBitsToFloat(R2i.y),intBitsToFloat(R2i.z)), 0).xyzw);
R3i.xyzw = floatBitsToInt(zmGather(textureUnitPS0, vec3(intBitsToFloat(R3i.z),intBitsToFloat(R3i.y),intBitsToFloat(R3i.w)), 0).xyzw);
R4i.xyzw = floatBitsToInt(zmGather(textureUnitPS0, vec3(intBitsToFloat(R4i.x),intBitsToFloat(R4i.z),intBitsToFloat(R4i.w)), 0).xyzw);
// 0
PV0ix = floatBitsToInt(min(intBitsToFloat(R0i.z), intBitsToFloat(R0i.w)));
PV0iy = floatBitsToInt(min(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y)));
PV0iz = floatBitsToInt(min(intBitsToFloat(R2i.z), intBitsToFloat(R2i.w)));
PV0iw = floatBitsToInt(min(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y)));
R127i.x = floatBitsToInt(min(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y)));
// 1
PV1ix = floatBitsToInt(min(intBitsToFloat(PV0iy), intBitsToFloat(PV0ix)));
PV1iy = floatBitsToInt(min(intBitsToFloat(PV0iw), intBitsToFloat(PV0iz)));
PV1iz = floatBitsToInt(min(intBitsToFloat(R4i.x), intBitsToFloat(R4i.y)));
PV1iw = floatBitsToInt(min(intBitsToFloat(R3i.z), intBitsToFloat(R3i.w)));
PS1i = floatBitsToInt(min(intBitsToFloat(R4i.z), intBitsToFloat(R4i.w)));
// 2
PV0ix = floatBitsToInt(min(intBitsToFloat(PV1ix), intBitsToFloat(PV1iy)));
PV0iz = floatBitsToInt(min(intBitsToFloat(R127i.x), intBitsToFloat(PV1iw)));
R127i.w = floatBitsToInt(min(intBitsToFloat(PV1iz), intBitsToFloat(PS1i)));
// 3
PV1iw = floatBitsToInt(min(intBitsToFloat(PV0ix), intBitsToFloat(PV0iz)));
// 4
PV0iz = floatBitsToInt(min(intBitsToFloat(R127i.w), intBitsToFloat(PV1iw)));
// 5
PV1iy = ((intBitsToFloat(PV0iz) > intBitsToFloat(R6i.x))?-1:0);
// 6
R5i.x = ((PV1iy == 0)?(R6i.x):(R5i.z));
R5i.y = R6i.y;
R5i.z = R6i.z;
R5i.w = R6i.w;
// export
passPixelColor0 = vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.z), intBitsToFloat(R5i.w));
}
