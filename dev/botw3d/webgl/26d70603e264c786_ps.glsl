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
// shader 26d70603e264c786
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
vec4 R0f = vec4(0.0);
vec4 R1f = vec4(0.0);
vec4 R2f = vec4(0.0);
vec4 R3f = vec4(0.0);
vec4 R123f = vec4(0.0);
vec4 R126f = vec4(0.0);
vec4 R127f = vec4(0.0);
float backupReg0f, backupReg1f, backupReg2f, backupReg3f, backupReg4f;
float PV0fx = 0.0, PV0fy = 0.0, PV0fz = 0.0, PV0fw = 0.0, PV1fx = 0.0, PV1fy = 0.0, PV1fz = 0.0, PV1fw = 0.0;
float PS0f = 0.0, PS1f = 0.0;
vec4 tempf = vec4(0.0);
float tempResultf;
int tempResulti;
ivec4 ARi = ivec4(0);
bool predResult = true;
R0f = passParameterSem0;
R1f = passParameterSem1;
R2f = passParameterSem2;
R3f = passParameterSem3;
R0f.xzw = (zmGather(textureUnitPS0, vec2(0.0001) + vec2(R0f.x,R0f.y), 0).xzw);
// 0
R127f.x = mul_nonIEEE(R0f.z,intBitsToFloat(uf_remappedPS[0].x)) + intBitsToFloat(uf_remappedPS[1].z);
R127f.y = mul_nonIEEE(R0f.x,intBitsToFloat(uf_remappedPS[0].x)) + intBitsToFloat(uf_remappedPS[1].z);
R123f.z = mul_nonIEEE(R0f.w,intBitsToFloat(uf_remappedPS[0].x)) + intBitsToFloat(uf_remappedPS[1].z);
R0f.w = 1.0;
// 1
R126f.x = mul_nonIEEE(R1f.x, -(R123f.z));
R126f.y = -(R123f.z);
R127f.z = -(R127f.x);
R127f.w = mul_nonIEEE(R1f.y, -(R123f.z));
PS1f = mul_nonIEEE(R2f.x, -(R127f.x));
// 2
PV0fx = mul_nonIEEE(R3f.x, -(R127f.y));
PV0fy = -(R127f.y);
PV0fz = mul_nonIEEE(R3f.y, -(R127f.y));
PV0fw = mul_nonIEEE(R2f.y, -(R127f.x));
R126f.z = -(R126f.x) + PS1f;
// 3
backupReg0f = R126f.x;
backupReg1f = R126f.y;
R126f.x = -(backupReg1f) + R127f.z;
R126f.y = -(R127f.w) + PV0fw;
R127f.z = -(R127f.w) + PV0fz;
R127f.w = -(backupReg0f) + PV0fx;
R127f.y = -(backupReg1f) + PV0fy;
// 4
PV0fx = mul_nonIEEE(R126f.x, R127f.z);
PV0fy = mul_nonIEEE(R126f.y, R127f.w);
PV0fw = mul_nonIEEE(R126f.z, R127f.y);
// 5
backupReg0f = R126f.x;
R126f.x = mul_nonIEEE(-(R126f.y),R127f.y) + PV0fx;
R127f.y = mul_nonIEEE(-(backupReg0f),R127f.w) + PV0fw;
R127f.z = mul_nonIEEE(-(R126f.z),R127f.z) + PV0fy;
// 6
tempf.x = dot(vec4(R126f.x,R127f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(R126f.x,R127f.y,R127f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 7
tempResultf = 1.0 / sqrt(PV0fx);
PS1f = tempResultf;
// 8
PV0fx = mul_nonIEEE(R126f.x, PS1f);
PV0fz = mul_nonIEEE(R127f.z, PS1f);
PV0fw = mul_nonIEEE(R127f.y, PS1f);
// 9
PV1fx = -(PV0fz);
PV1fy = -(PV0fx);
R0f.y = PV0fw * 0.5 + 0.5;
// 10
R0f.x = PV1fy * 0.5 + 0.5;
R0f.z = PV1fx * 0.5 + 0.5;
// export
passPixelColor0 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
}
