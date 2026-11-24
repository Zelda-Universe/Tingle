#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader b9a3f51adde4b2b3
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[1];
uniform vec2 uf_fragCoordScale;
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
float backupReg0f, backupReg1f, backupReg2f, backupReg3f, backupReg4f;
float PV0fx = 0.0, PV0fy = 0.0, PV0fz = 0.0, PV0fw = 0.0, PV1fx = 0.0, PV1fy = 0.0, PV1fz = 0.0, PV1fw = 0.0;
float PS0f = 0.0, PS1f = 0.0;
vec4 tempf = vec4(0.0);
float tempResultf;
int tempResulti;
ivec4 ARi = ivec4(0);
bool predResult = true;
R0f = passParameterSem0;
// 0
PV0fz = 0.0;
// 1
tempf.x = dot(vec4(R0f.x,R0f.y,PV0fz,intBitsToFloat(0x80000000)),vec4(R0f.x,R0f.y,R0f.y,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
PS1f = PV0fz * PV0fz;
// 2
tempf.x = dot(vec4(R0f.x,R0f.y,PS1f,intBitsToFloat(0x80000000)),vec4(R0f.x,R0f.y,1.0,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = sqrt(PV1fx);
// 3
PV1fw = -(PS0f) + 1.0;
tempResultf = 1.0 / sqrt(PV0fx);
PS1f = tempResultf;
// 4
PV0fx = mul_nonIEEE(R0f.y, PS1f);
PV0fz = mul_nonIEEE(PV1fw, intBitsToFloat(uf_remappedPS[0].x));
PV0fz = clamp(PV0fz, 0.0, 1.0);
PV0fw = mul_nonIEEE(R0f.x, PS1f);
// 5
PV1fx = mul_nonIEEE(PV0fz, PV0fx);
PV1fy = mul_nonIEEE(PV0fz, PV0fw);
// 6
R0f.x = PV1fy;
R0f.x = clamp(R0f.x, 0.0, 1.0);
R0f.y = PV1fx;
R0f.y = clamp(R0f.y, 0.0, 1.0);
PV0fz = max(-(PV1fx), 0.0);
PV0fw = max(-(PV1fy), 0.0);
// 7
PV1fx = min(PV0fz, 1.0);
PV1fy = min(PV0fw, 1.0);
// 8
R0f.z = PV1fy;
R0f.w = PV1fx;
// export
passPixelColor0 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
}
