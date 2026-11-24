#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader bc00346ba12c3783
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 2) uniform sampler2D textureUnitPS2;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem4;
in vec4 passParameterSem7;
in vec4 passParameterSem8;
in vec4 passParameterSem9;
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
vec4 R5f = vec4(0.0);
vec4 R6f = vec4(0.0);
vec4 R122f = vec4(0.0);
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
R1f = passParameterSem1;
R2f = passParameterSem4;
R3f = passParameterSem7;
R4f = passParameterSem8;
R5f = passParameterSem9;
R6f.xyzw = (texture(textureUnitPS1, vec2(R4f.z,R4f.w)).xyzw);
R4f.xyzw = (texture(textureUnitPS0, vec2(R4f.x,R4f.y)).xyzw);
R5f.x = (texture(textureUnitPS2, vec2(R5f.x,R5f.y)).w);
// 0
PV0fx = -(R6f.w) + 1.0;
R127f.y = mul_nonIEEE(R4f.z, R4f.z);
R127f.z = mul_nonIEEE(R4f.y, R4f.y);
PV0fw = mul_nonIEEE(R4f.x, R4f.x);
R122f.x = mul_nonIEEE(-(R6f.x),R6f.x) + 1.0;
// 1
R123f.x = mul_nonIEEE(-(R6f.z),R6f.z) + 1.0;
PV1fy = R4f.w + -(PV0fx);
R123f.z = mul_nonIEEE(-(R6f.y),R6f.y) + 1.0;
PV1fw = mul_nonIEEE(PV0fw, R122f.x);
R127f.w = R0f.x + -(R1f.x);
// 2
PV0fx = mul_nonIEEE(PV1fy, R5f.x);
PV0fy = PV1fw * 1.0;
PV0fz = mul_nonIEEE(R127f.y, R123f.x);
PV0fw = mul_nonIEEE(R127f.z, R123f.z);
R127f.z = R0f.y + -(R1f.y);
// 3
PV1fx = PV0fz * 1.0;
R123f.y = mul_nonIEEE(R3f.w,PV0fx) + -(R0f.w);
PV1fz = PV0fw * 1.0;
PV1fw = R0f.z + -(R1f.z);
R122f.x = mul_nonIEEE(R127f.w,PV0fy) + R1f.x;
// 4
PV0fx = mul_nonIEEE(R1f.w, R123f.y);
PV0fx = clamp(PV0fx, 0.0, 1.0);
R123f.z = mul_nonIEEE(PV1fw,PV1fx) + R1f.z;
R123f.w = mul_nonIEEE(R127f.z,PV1fz) + R1f.y;
R1f.x = mul_nonIEEE(R3f.x, R122f.x);
// 5
R1f.y = mul_nonIEEE(R3f.y, R123f.w);
R1f.z = mul_nonIEEE(R3f.z, R123f.z);
R1f.w = mul_nonIEEE(R2f.x, PV0fx);
// export
if( ((vec4(R1f.x, R1f.y, R1f.z, R1f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
}
