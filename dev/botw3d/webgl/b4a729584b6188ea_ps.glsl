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
// shader b4a729584b6188ea
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[3];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 2) uniform sampler2D textureUnitPS2;
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
vec4 R0f = vec4(0.0);
vec4 R1f = vec4(0.0);
vec4 R2f = vec4(0.0);
vec4 R123f = vec4(0.0);
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
R2f.w = (texture(textureUnitPS1, vec2(R0f.x,R0f.y)).x);
R1f.xyzw = (zmGather(textureUnitPS2, vec2(0.0001) + vec2(R0f.x,R0f.y), 0).xyzw);
// 0
PV0fx = -(R2f.w) + R1f.y;
PV0fy = -(R2f.w) + R1f.x;
PV0fz = -(R2f.w) + R1f.w;
PV0fw = -(R2f.w) + R1f.z;
PS0f = R2f.w + intBitsToFloat(uf_remappedPS[0].x);
// 1
PV1fx = max(PV0fx, -(PV0fx));
PV1fy = max(PV0fy, -(PV0fy));
PV1fz = max(PV0fz, -(PV0fz));
PV1fw = max(PV0fw, -(PV0fw));
PS1f = 1.0 / PS0f;
// 2
PV0fx = PV1fy + -(PV1fw);
PV0fy = -(PV1fx) + PV1fz;
R127f.z = intBitsToFloat(uf_remappedPS[1].w) * PS1f;
R127f.w = fract(R0f.z);
R127f.y = fract(R0f.w);
// 3
PV1fz = PV0fy + -(PV0fx);
PV1fw = PV0fy + PV0fx;
// 4
R123f.x = mul_nonIEEE(R127f.z,PV1fz) + R127f.y;
R123f.x = clamp(R123f.x, 0.0, 1.0);
R123f.y = mul_nonIEEE(R127f.z,PV1fw) + R127f.w;
R123f.y = clamp(R123f.y, 0.0, 1.0);
// 5
PV1fz = -(R127f.y) + R123f.x;
PV1fw = -(R127f.w) + R123f.y;
// 6
R0f.x = mul_nonIEEE(PV1fw,intBitsToFloat(uf_remappedPS[2].z)) + R0f.x;
R0f.y = mul_nonIEEE(PV1fz,intBitsToFloat(uf_remappedPS[2].w)) + R0f.y;
R0f.xyzw = (texture(textureUnitPS0, vec2(R0f.x,R0f.y)).xyzw);
// export
passPixelColor0 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
}
