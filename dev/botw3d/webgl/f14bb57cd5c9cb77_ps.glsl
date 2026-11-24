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
// shader f14bb57cd5c9cb77
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[4];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
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
bool activeMaskStack[2];
bool activeMaskStackC[3];
activeMaskStack[0] = false;
activeMaskStackC[0] = false;
activeMaskStackC[1] = false;
activeMaskStack[0] = true;
activeMaskStackC[0] = true;
activeMaskStackC[1] = true;
R0f = passParameterSem2;
if( activeMaskStackC[1] == true ) {
R1f.xyzw = (zmGather(textureUnitPS1, vec2(0.0001) + vec2(R0f.x,R0f.y), 0).wzxy);
R2f.xyzw = (texture(textureUnitPS0, vec2(R0f.x,R0f.y)).xyzw);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
PV0fx = R1f.w + -(R1f.x);
PV0fy = R1f.z + -(R1f.y);
PV0fz = mul_nonIEEE(R2f.x, intBitsToFloat(uf_remappedPS[0].x));
R127f.w = min(R1f.z, R1f.x);
R127f.x = min(R1f.w, R1f.y);
// 1
R123f.x = mul_nonIEEE(R2f.y,intBitsToFloat(uf_remappedPS[0].y)) + PV0fz;
PV1fy = max(R1f.z, R1f.x);
R127f.z = PV0fy + -(PV0fx);
R126f.w = PV0fy + PV0fx;
PS1f = max(R1f.w, R1f.y);
// 2
PV0fx = max(R127f.z, -(R127f.z));
PV0fy = max(R126f.w, -(R126f.w));
R123f.z = mul_nonIEEE(R2f.z,intBitsToFloat(uf_remappedPS[0].z)) + R123f.x;
PV0fw = min(R127f.w, R127f.x);
PS0f = max(PV1fy, PS1f);
// 3
PV1fx = mul_nonIEEE(PS0f, intBitsToFloat(uf_remappedPS[1].x));
PV1fy = max(R123f.z, PS0f);
PV1fz = min(R123f.z, PV0fw);
PV1fw = min(PV0fy, PV0fx);
// 4
R1f.x = -(PV1fz) + PV1fy;
R0f.z = max(PV1fx, intBitsToFloat(uf_remappedPS[1].y));
PS0f = 1.0 / PV1fw;
// 5
PV1fx = mul_nonIEEE(R127f.z, PS0f);
PV1fy = mul_nonIEEE(R126f.w, PS0f);
// 6
PV0fz = max(PV1fx, -(intBitsToFloat(uf_remappedPS[2].y)));
PV0fw = max(PV1fy, -(intBitsToFloat(uf_remappedPS[2].y)));
// 7
R3f.x = min(PV0fw, intBitsToFloat(uf_remappedPS[2].y));
R1f.y = min(PV0fz, intBitsToFloat(uf_remappedPS[2].y));
// 8
predResult = (R1f.x > R0f.z);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
backupReg0f = R3f.x;
R3f.x = mul_nonIEEE(backupReg0f,intBitsToFloat(uf_remappedPS[3].x)) + R0f.x;
R3f.y = mul_nonIEEE(R1f.y,intBitsToFloat(uf_remappedPS[3].y)) + R0f.y;
R1f.x = mul_nonIEEE(backupReg0f,-(intBitsToFloat(uf_remappedPS[3].x))) + R0f.x;
// 1
R1f.y = mul_nonIEEE(R1f.y,-(intBitsToFloat(uf_remappedPS[3].y))) + R0f.y;
}
if( activeMaskStackC[2] == true ) {
R0f.xyzw = (texture(textureUnitPS0, vec2(R3f.x,R3f.y)).xyzw);
R1f.xyzw = (texture(textureUnitPS0, vec2(R1f.x,R1f.y)).xyzw);
}
if( activeMaskStackC[2] == true ) {
// 0
R127f.x = R0f.w + R1f.w;
R127f.x /= 2.0;
R127f.y = R0f.z + R1f.z;
R127f.y /= 2.0;
R127f.z = R0f.y + R1f.y;
R127f.z /= 2.0;
R127f.w = R0f.x + R1f.x;
R127f.w /= 2.0;
// 1
PV1fx = R2f.w + -(R127f.x);
PV1fy = R2f.z + -(R127f.y);
PV1fz = R2f.y + -(R127f.z);
PV1fw = R2f.x + -(R127f.w);
// 2
R2f.x = PV1fw * intBitsToFloat(0x3eb33333) + R127f.w;
R2f.y = PV1fz * intBitsToFloat(0x3eb33333) + R127f.z;
R2f.z = PV1fy * intBitsToFloat(0x3eb33333) + R127f.y;
R2f.w = PV1fx * intBitsToFloat(0x3eb33333) + R127f.x;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
// export
passPixelColor0 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
}
