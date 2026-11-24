#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 60598a59a4c1dee9
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
vec4 R125f = vec4(0.0);
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
R2f.xyzw = (texture(textureUnitPS0, vec2(R0f.x,R0f.y)).xyzw);
R0f.xyzw = (texture(textureUnitPS0, vec2(R0f.z,R0f.w)).xyzw);
R3f.xyzw = (texture(textureUnitPS0, vec2(R1f.x,R1f.y)).xyzw);
R1f.xyzw = (texture(textureUnitPS0, vec2(R1f.z,R1f.w)).xyzw);
// 0
R127f.x = R2f.z;
R127f.y = max(R2f.y, R0f.y);
R127f.z = R0f.z;
R127f.w = min(R2f.x, R0f.x);
R126f.z = R3f.z;
// 1
PV1fx = max(R3f.y, R1f.y);
R126f.y = R2f.w;
PV1fz = min(R3f.x, R1f.x);
PV1fw = R1f.z;
R125f.y = R0f.w;
// 2
R1f.x = min(R127f.w, PV1fz);
R1f.y = max(R127f.y, PV1fx);
R125f.z = R3f.w;
PV0fw = R1f.w;
PS0f = PV1fw * 0.25;
// 3
tempf.x = dot(vec4(R127f.x,R127f.z,R126f.z,PS0f),vec4(0.25,0.25,0.25,1.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
R1f.z = tempf.x;
PV1fw = tempf.x;
PS1f = PV0fw * 0.25;
// 4
tempf.x = dot(vec4(R126f.y,R125f.y,R125f.z,PS1f),vec4(0.25,0.25,0.25,1.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
R1f.w = tempf.x;
// export
passPixelColor0 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
}
