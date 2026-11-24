#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 12d8627fe9906695
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
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
vec4 R0f = vec4(0.0);
vec4 R1f = vec4(0.0);
vec4 R2f = vec4(0.0);
vec4 R3f = vec4(0.0);
vec4 R4f = vec4(0.0);
vec4 R123f = vec4(0.0);
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
R2f.xyzw = (texture(textureUnitPS0, vec2(R1f.x,R1f.y)).xyzw);
R3f.xyzw = (texture(textureUnitPS0, vec2(R0f.x,R0f.y)).xyzw);
R4f.xyzw = (texture(textureUnitPS0, vec2(R0f.x,R0f.w)).xyzw);
R0f.xyzw = (texture(textureUnitPS0, vec2(R0f.x,R0f.z)).xyzw);
R1f.xyzw = (texture(textureUnitPS0, vec2(R1f.x,R1f.z)).xyzw);
// 0
R123f.x = R2f.w * intBitsToFloat(0x3d8fe9dc) + 0.0;
R123f.y = R2f.z * intBitsToFloat(0x3d8fe9dc) + 0.0;
R123f.z = R2f.y * intBitsToFloat(0x3d8fe9dc) + 0.0;
R123f.w = R2f.x * intBitsToFloat(0x3d8fe9dc) + 0.0;
// 1
R123f.x = R3f.w * intBitsToFloat(0x3ea1e718) + R123f.x;
R123f.y = R3f.z * intBitsToFloat(0x3ea1e718) + R123f.y;
R123f.z = R3f.y * intBitsToFloat(0x3ea1e718) + R123f.z;
R123f.w = R3f.x * intBitsToFloat(0x3ea1e718) + R123f.w;
// 2
R123f.x = R4f.w * intBitsToFloat(0x3e6879c6) + R123f.x;
R123f.y = R4f.z * intBitsToFloat(0x3e6879c6) + R123f.y;
R123f.z = R4f.y * intBitsToFloat(0x3e6879c6) + R123f.z;
R123f.w = R4f.x * intBitsToFloat(0x3e6879c6) + R123f.w;
// 3
R123f.x = R0f.w * intBitsToFloat(0x3ea1e718) + R123f.x;
R123f.y = R0f.z * intBitsToFloat(0x3ea1e718) + R123f.y;
R123f.z = R0f.y * intBitsToFloat(0x3ea1e718) + R123f.z;
R123f.w = R0f.x * intBitsToFloat(0x3ea1e718) + R123f.w;
// 4
R1f.x = R1f.x * intBitsToFloat(0x3d8fe9dc) + R123f.w;
R1f.y = R1f.y * intBitsToFloat(0x3d8fe9dc) + R123f.z;
R1f.z = R1f.z * intBitsToFloat(0x3d8fe9dc) + R123f.y;
R1f.w = R1f.w * intBitsToFloat(0x3d8fe9dc) + R123f.x;
// export
passPixelColor0 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
}
