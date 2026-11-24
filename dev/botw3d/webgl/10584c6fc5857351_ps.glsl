#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 10584c6fc5857351
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[2];
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
R0f = passParameterSem0;
R1f = passParameterSem1;
R2f.xyzw = (texture(textureUnitPS0, vec2(R0f.x,R0f.y)).xyzw);
R0f.xyzw = (texture(textureUnitPS0, vec2(R0f.z,R0f.w)).xyzw);
R3f.xyzw = (texture(textureUnitPS0, vec2(R1f.x,R1f.y)).xyzw);
R1f.xyzw = (texture(textureUnitPS0, vec2(R1f.z,R1f.w)).xyzw);
// 0
PV0fx = R2f.y + R0f.y;
PV0fx /= 2.0;
PV0fy = R2f.x + R0f.x;
PV0fy /= 2.0;
PV0fz = R2f.w + R0f.w;
PV0fz /= 2.0;
PV0fw = R2f.z + R0f.z;
PV0fw /= 2.0;
// 1
R123f.x = R3f.y * 0.5 + PV0fx;
R123f.y = R3f.x * 0.5 + PV0fy;
R123f.z = R3f.w * 0.5 + PV0fz;
R123f.w = R3f.z * 0.5 + PV0fw;
// 2
R127f.x = (R1f.x * 0.5 + R123f.y)/2.0;
R126f.y = (R1f.y * 0.5 + R123f.x)/2.0;
R127f.z = (R1f.z * 0.5 + R123f.w)/2.0;
R127f.w = (R1f.w * 0.5 + R123f.z)/2.0;
// 3
tempf.x = dot(vec4(R127f.x,R126f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[0].x),intBitsToFloat(uf_remappedPS[0].y),intBitsToFloat(uf_remappedPS[0].z),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
PS1f = mul_nonIEEE(R127f.w, intBitsToFloat(uf_remappedPS[0].w));
// 4
tempf.x = dot(vec4(R127f.x,R126f.y,R127f.z,PS1f),vec4(intBitsToFloat(uf_remappedPS[0].x),intBitsToFloat(uf_remappedPS[0].y),intBitsToFloat(uf_remappedPS[0].z),1.0));
tempf.x = clamp(tempf.x, 0.0, 1.0);
PV0fx = tempf.x;
R127f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = 1.0 / PV1fx;
// 5
PV1fz = PS0f * intBitsToFloat(uf_remappedPS[1].x);
PV1fz = clamp(PV1fz, 0.0, 1.0);
// 6
PV0fy = mul_nonIEEE(R127f.y, PV1fz);
// 7
PV1fx = mul_nonIEEE(PV0fy, intBitsToFloat(uf_remappedPS[1].z));
// 8
R1f.x = mul_nonIEEE(R127f.x, PV1fx);
R1f.y = mul_nonIEEE(R126f.y, PV1fx);
R1f.z = mul_nonIEEE(R127f.z, PV1fx);
R1f.w = mul_nonIEEE(R127f.w, PV1fx);
// export
passPixelColor0 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
}
