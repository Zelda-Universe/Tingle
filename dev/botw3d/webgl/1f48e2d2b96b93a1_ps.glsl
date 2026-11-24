#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 1f48e2d2b96b93a1
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(2, 1, 1) uniform sampler2D textureUnitPS2;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem4;
in vec4 passParameterSem8;
in vec4 passParameterSem9;
layout(location = 0) out vec4 passPixelColor0;
layout(location = 1) out vec4 passPixelColor1;
layout(location = 3) out vec4 passPixelColor3;
layout(location = 5) out vec4 passPixelColor5;
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
R2f = passParameterSem4;
R3f = passParameterSem8;
R4f = passParameterSem9;
R4f.x = (texture(textureUnitPS2, vec2(R4f.x,R4f.y)).w);
R3f.xyzw = (texture(textureUnitPS0, vec2(R3f.x,R3f.y)).xyzw);
// 0
R127f.x = R3f.x * 1.0;
PV0fy = -(R4f.x) + 1.0;
R127f.z = R3f.z * 1.0;
PV0fw = R3f.y * 1.0;
PS0f = R0f.y + -(R1f.y);
// 1
PV1fx = R0f.x + -(R1f.x);
PV1fy = R3f.w + -(PV0fy);
PV1fz = R0f.z + -(R1f.z);
R3f.y = mul_nonIEEE(PS0f,PV0fw) + R1f.y;
// 2
R3f.x = mul_nonIEEE(PV1fx,R127f.x) + R1f.x;
PV0fy = -(R0f.w) + PV1fy;
R3f.z = mul_nonIEEE(PV1fz,R127f.z) + R1f.z;
// 3
PV1fx = mul_nonIEEE(R1f.w, PV0fy);
PV1fx = clamp(PV1fx, 0.0, 1.0);
// 4
R3f.w = mul_nonIEEE(R2f.x, PV1fx);
// export
if( ((vec4(R3f.x, R3f.y, R3f.z, R3f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R3f.x, R3f.y, R3f.z, R3f.w);
// 0
PV0fx = 0.0;
PV0fy = 0.0;
PV0fz = 0.0;
PV0fw = 0.0;
// 1
PV1fx = 0.0;
PV1fy = 0.0;
PV1fz = 0.0;
PV1fw = 0.0;
// 2
PV0fx = 0.0;
PV0fy = 0.0;
PV0fz = 0.0;
PV0fw = 0.0;
// export
passPixelColor1 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
passPixelColor3 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
passPixelColor5 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
}
