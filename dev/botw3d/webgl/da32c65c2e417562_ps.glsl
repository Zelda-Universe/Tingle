#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader da32c65c2e417562
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
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
float backupReg0f, backupReg1f, backupReg2f, backupReg3f, backupReg4f;
float PV0fx = 0.0, PV0fy = 0.0, PV0fz = 0.0, PV0fw = 0.0, PV1fx = 0.0, PV1fy = 0.0, PV1fz = 0.0, PV1fw = 0.0;
float PS0f = 0.0, PS1f = 0.0;
vec4 tempf = vec4(0.0);
float tempResultf;
int tempResulti;
ivec4 ARi = ivec4(0);
bool predResult = true;
R0f = passParameterSem2;
R1f.xyzw = (texture(textureUnitPS0, vec2(R0f.x,R0f.y)).xyzw);
R2f.xyzw = (texture(textureUnitPS0, vec2(R0f.x,R0f.w)).xyzw);
R3f.xyzw = (texture(textureUnitPS0, vec2(R0f.z,R0f.y)).xyzw);
R0f.xyzw = (texture(textureUnitPS0, vec2(R0f.z,R0f.w)).xyzw);
// 0
PV0fx = R1f.w + 0.0;
PV0fy = R1f.z + 0.0;
PV0fz = R1f.y + 0.0;
PV0fw = R1f.x + 0.0;
// 1
PV1fx = PV0fx + R2f.w;
PV1fy = PV0fy + R2f.z;
PV1fz = PV0fz + R2f.y;
PV1fw = PV0fw + R2f.x;
// 2
PV0fx = PV1fx + R3f.w;
PV0fy = PV1fy + R3f.z;
PV0fz = PV1fz + R3f.y;
PV0fw = PV1fw + R3f.x;
// 3
PV1fx = PV0fx + R0f.w;
PV1fy = PV0fy + R0f.z;
PV1fz = PV0fz + R0f.y;
PV1fw = PV0fw + R0f.x;
// 4
R0f.x = PV1fw * 0.25;
R0f.y = PV1fz * 0.25;
R0f.z = PV1fy * 0.25;
R0f.w = PV1fx * 0.25;
// export
passPixelColor0 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
}
