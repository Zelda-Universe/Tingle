#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 37040a485a29d54e
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[1];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
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
vec4 R123f = vec4(0.0);
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
R1f.xyz = (texture(textureUnitPS0, vec2(R0f.x,R0f.y)).xyz);
R0f.xyz = (texture(textureUnitPS1, vec2(R0f.x,R0f.y)).xyz);
// 0
R126f.x = R1f.x + R0f.x;
R127f.y = R1f.y + R0f.y;
R126f.z = R1f.z + R0f.z;
R125f.w = 1.0;
// 1
tempf.x = dot(vec4(R126f.x,R127f.y,R126f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99096c),intBitsToFloat(0x3f162b6b),intBitsToFloat(0x3dea4a8c),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
// 2
R127f.x = -(R127f.y) * intBitsToFloat(0x3fb8aa3b);
PV0fy = -(PV1fx) * intBitsToFloat(0x3fb8aa3b);
R127f.z = -(R126f.x) * intBitsToFloat(0x3fb8aa3b);
R127f.w = -(R126f.z) * intBitsToFloat(0x3fb8aa3b);
R126f.w = 1.0 / PV1fx;
// 3
PS1f = exp2(PV0fy);
// 4
PV0fx = -(PS1f) + 1.0;
PS0f = exp2(R127f.x);
// 5
R127f.x = -(PS0f) + 1.0;
R126f.y = mul_nonIEEE(PV0fx, PV0fx);
PV1fz = PV0fx * R126f.w;
PS1f = exp2(R127f.w);
// 6
backupReg0f = R127f.z;
R126f.x = mul_nonIEEE(R126f.x, PV1fz);
PV0fy = -(PS1f) + 1.0;
R127f.z = mul_nonIEEE(R126f.z, PV1fz);
R127f.w = mul_nonIEEE(R127f.y, PV1fz);
PS0f = exp2(backupReg0f);
// 7
PV1fx = R127f.x + -(R127f.w);
PV1fy = PV0fy + -(R127f.z);
PV1fw = -(PS0f) + 1.0;
// 8
R127f.x = mul_nonIEEE(PV1fx,R126f.y) + R127f.w;
R127f.x = clamp(R127f.x, 0.0, 1.0);
PV0fy = PV1fw + -(R126f.x);
R127f.z = mul_nonIEEE(PV1fy,R126f.y) + R127f.z;
R127f.z = clamp(R127f.z, 0.0, 1.0);
// 9
R126f.x = mul_nonIEEE(PV0fy,R126f.y) + R126f.x;
R126f.x = clamp(R126f.x, 0.0, 1.0);
PV1fw = max(R127f.x, R127f.z);
// 10
tempf.x = dot(vec4(R126f.x,R127f.x,R127f.z,R125f.w),vec4(intBitsToFloat(0x3f2aaaab),intBitsToFloat(0x3f2aaaab),intBitsToFloat(0x3f2aaaab),-(1.0)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R126f.z = max(R126f.x, PV1fw);
// 11
backupReg0f = R127f.x;
backupReg1f = R127f.z;
R127f.x = R126f.x + -(R126f.z);
R123f.y = mul_nonIEEE(-(PV0fx),PV0fx) + 1.0;
R127f.z = backupReg0f + -(R126f.z);
R125f.w = backupReg1f + -(R126f.z);
// 12
R123f.x = mul_nonIEEE(R123f.y,intBitsToFloat(uf_remappedPS[0].y)) + intBitsToFloat(uf_remappedPS[0].x);
// 13
R0f.x = mul_nonIEEE(R127f.x,R123f.x) + R126f.z;
R0f.y = mul_nonIEEE(R127f.z,R123f.x) + R126f.z;
R0f.z = mul_nonIEEE(R125f.w,R123f.x) + R126f.z;
// export
passPixelColor0 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
}
