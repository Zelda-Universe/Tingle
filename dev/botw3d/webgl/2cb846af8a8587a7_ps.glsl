#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 2cb846af8a8587a7
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[2];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2DArrayShadow textureUnitPS0;
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
// 0
R1f.y = 0.0;
PV0fz = R1f.x;
R1f.w = intBitsToFloat(uf_remappedPS[0].x);
PS0f = 1.0 / R0f.w;
// 1
backupReg0f = R0f.z;
PV1fx = R0f.y * PS0f;
PV1fy = R0f.x * PS0f;
R0f.z = roundEven(PV0fz);
PV1fw = backupReg0f * PS0f;
// 2
PV0fy = PV1fy + 0.0;
PV0fz = PV1fx + 0.0;
R0f.w = PV1fw;
R0f.w = clamp(R0f.w, 0.0, 1.0);
// 3
R0f.x = PV0fy;
R0f.y = PV0fz;
R0f.w = (texture(textureUnitPS0, vec4(R0f.x,R0f.y,R0f.z,R0f.w)));
// 0
R1f.x = mul_nonIEEE(R0f.w,intBitsToFloat(uf_remappedPS[1].x)) + intBitsToFloat(uf_remappedPS[1].y);
// export
passPixelColor0 = vec4(R1f.x, R1f.y, R1f.y, R1f.w);
}
