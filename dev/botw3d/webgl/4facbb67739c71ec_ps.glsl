#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 4facbb67739c71ec
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[6];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
in vec4 passParameterSem1;
layout(location = 0) out vec4 passPixelColor0;
layout(location = 1) out vec4 passPixelColor1;
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
vec4 R122f = vec4(0.0);
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
R0f = GET_FRAGCOORD();
R1f = passParameterSem1;
// 0
R3f.x = 0.0;
PV0fz = R0f.y + intBitsToFloat(0xbc23d70a);
PV0fw = R0f.x + intBitsToFloat(0xbc23d70a);
R2f.w = 0.0;
// 1
R0f.x = mul_nonIEEE(PV0fw, intBitsToFloat(uf_remappedPS[0].z));
R0f.y = mul_nonIEEE(PV0fz, intBitsToFloat(uf_remappedPS[0].w));
R0f.w = (texture(textureUnitPS0, vec2(R0f.x,R0f.y)).x);
R0f.xyz = (texture(textureUnitPS1, vec2(R0f.x,R0f.y)).xyz);
// 0
R126f.x = R0f.x * 2.0 + -(1.0);
R126f.y = R0f.y * 2.0 + -(1.0);
R125f.z = R0f.z * 2.0 + -(1.0);
R123f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].y),R0f.w) + intBitsToFloat(uf_remappedPS[1].x);
// 1
R127f.x = mul_nonIEEE(R1f.x,-(R123f.w)) + -(intBitsToFloat(uf_remappedPS[2].x));
R127f.y = mul_nonIEEE(R1f.y,-(R123f.w)) + -(intBitsToFloat(uf_remappedPS[2].y));
R127f.z = mul_nonIEEE(R1f.z,-(R123f.w)) + -(intBitsToFloat(uf_remappedPS[2].z));
PS1f = R125f.z * R125f.z;
// 2
tempf.x = dot(vec4(R127f.x,R127f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(R127f.x,R127f.y,R127f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R122f.x = (R126f.y * R126f.y + PS1f);
// 3
R126f.z = (R126f.x * R126f.x + R122f.x);
tempResultf = 1.0 / sqrt(PV0fx);
PS1f = tempResultf;
// 4
R127f.x = mul_nonIEEE(R127f.x, PS1f);
R127f.y = mul_nonIEEE(R127f.y, PS1f);
R127f.z = mul_nonIEEE(R127f.z, PS1f);
PS0f = 1.0 / PS1f;
// 5
PV1fx = mul_nonIEEE(R127f.z, intBitsToFloat(uf_remappedPS[3].z));
PV1fw = intBitsToFloat(uf_remappedPS[4].w) * PS0f;
PV1fw = clamp(PV1fw, 0.0, 1.0);
tempResultf = 1.0 / sqrt(R126f.z);
PS1f = tempResultf;
// 6
R126f.x = mul_nonIEEE(R126f.x, PS1f);
R126f.y = mul_nonIEEE(R126f.y, PS1f);
PV0fz = mul_nonIEEE(R125f.z, PS1f);
PV0fw = -(PV1fw) + 1.0;
R122f.x = mul_nonIEEE(R127f.y,intBitsToFloat(uf_remappedPS[3].y)) + PV1fx;
// 7
PV1fx = mul_nonIEEE(PV0fz, R127f.z);
R123f.w = mul_nonIEEE(R127f.x,intBitsToFloat(uf_remappedPS[3].x)) + R122f.x;
tempResultf = max(0.0, PV0fw);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R125f.y = tempResultf;
// 8
tempf.x = dot(vec4(R126f.x,R126f.y,PV1fx,intBitsToFloat(0x80000000)),vec4(R127f.x,R127f.y,1.0,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R122f.x = mul_nonIEEE(R123f.w,intBitsToFloat(uf_remappedPS[5].y)) + -(intBitsToFloat(uf_remappedPS[5].z));
R122f.x = clamp(R122f.x, 0.0, 1.0);
// 9
PV1fx = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].w), R125f.y);
PV1fy = max(-(PV0fx), 0.0);
tempResultf = max(0.0, R122f.x);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1f = tempResultf;
// 10
PV0fx = min(PV1fy, 1.0);
PV0fy = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].w), PS1f);
PS0f = exp2(PV1fx);
// 11
PV1fz = mul_nonIEEE(PS0f, PV0fx);
PS1f = exp2(PV0fy);
// 12
PV0fy = mul_nonIEEE(PS1f, PV1fz);
PV0fy = clamp(PV0fy, 0.0, 1.0);
// 13
R2f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].x), PV0fy);
R2f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].y), PV0fy);
R2f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].z), PV0fy);
// 14
R0f.x = R2f.x;
R0f.y = R2f.y;
R0f.z = R2f.z;
R0f.w = R2f.w;
// 15
R1f.x = R3f.x;
R1f.y = R3f.x;
R1f.z = R3f.x;
R1f.w = R3f.w;
// export
passPixelColor0 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
passPixelColor1 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
}
