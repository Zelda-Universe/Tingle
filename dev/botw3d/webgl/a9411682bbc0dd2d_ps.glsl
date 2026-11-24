#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader a9411682bbc0dd2d
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[11];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
in vec4 passParameterSem0;
in vec4 passParameterSem2;
in vec4 passParameterSem4;
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
vec4 R7f = vec4(0.0);
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
R0f = passParameterSem0;
R1f = passParameterSem2;
R2f = passParameterSem4;
// 0
PV0fx = R0f.y + -(R2f.w);
R125f.y = R0f.y + -(R2f.y);
PV0fz = R0f.x + -(R2f.z);
R125f.w = R0f.x + -(R2f.x);
PS0f = 1.0 / intBitsToFloat(uf_remappedPS[0].w);
// 1
PV1fx = intBitsToFloat(uf_remappedPS[1].y) + intBitsToFloat(uf_remappedPS[1].z);
R127f.y = PV0fz * PS0f;
R127f.z = PV0fx * PS0f;
PV1fw = mul_nonIEEE(R125f.w, R125f.w);
// 2
PV0fx = mul_nonIEEE(R127f.y, R127f.y);
R7f.y = intBitsToFloat(uf_remappedPS[2].y) * 1.0;
R126f.w = mul_nonIEEE(R125f.y,R125f.y) + PV1fw;
R2f.w = 1.0 / PV1fx;
// 3
R127f.w = mul_nonIEEE(R127f.z,R127f.z) + PV0fx;
R126f.z = 1.0 / intBitsToFloat(uf_remappedPS[3].w);
// 4
tempResultf = max(0.0, R127f.w);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0f = tempResultf;
// 5
PV1fx = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x), PS0f);
R126f.y = sqrt(R127f.w);
// 6
R127f.x = R126f.y + -(intBitsToFloat(uf_remappedPS[4].z));
PV0fy = R126f.y + -(intBitsToFloat(uf_remappedPS[3].z));
PS0f = exp2(PV1fx);
// 7
PV1fx = PV0fy * R126f.z;
PV1fx = clamp(PV1fx, 0.0, 1.0);
PV1fy = mul_nonIEEE(R127f.y, PS0f);
PV1fz = mul_nonIEEE(R127f.z, PS0f);
R6f.w = R126f.y + -(intBitsToFloat(uf_remappedPS[5].y));
PS1f = 1.0 / intBitsToFloat(uf_remappedPS[4].w);
// 8
R6f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].y),PV1fy) + R0f.x;
R126f.y = R127f.x * PS1f;
R126f.y = clamp(R126f.y, 0.0, 1.0);
R2f.z = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedPS[5].x));
R5f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].y),PV1fz) + R0f.y;
R5f.x = sqrt(R126f.w);
// 9
backupReg0f = R125f.y;
R126f.x = mul_nonIEEE(R5f.w, intBitsToFloat(uf_remappedPS[6].w));
R125f.y = mul_nonIEEE(R6f.x, intBitsToFloat(uf_remappedPS[6].w));
R1f.z = mul_nonIEEE(backupReg0f,-(intBitsToFloat(uf_remappedPS[1].w))) + R5f.w;
R3f.w = mul_nonIEEE(R125f.w,-(intBitsToFloat(uf_remappedPS[1].w))) + R6f.x;
// 10
R127f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].x), R3f.w);
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].x), R1f.z);
R127f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].w), R1f.z);
PV0fw = mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].w), R3f.w);
R125f.w = mul_nonIEEE(R6f.x, intBitsToFloat(uf_remappedPS[1].x));
// 11
R2f.x = intBitsToFloat(uf_remappedPS[7].w) + PV0fw;
R5f.y = R2f.z + intBitsToFloat(uf_remappedPS[7].z);
R126f.z = mul_nonIEEE(R5f.w, intBitsToFloat(uf_remappedPS[1].x));
R0f.w = R125f.y + intBitsToFloat(uf_remappedPS[7].w);
// 12
R0f.x = intBitsToFloat(uf_remappedPS[6].y) + R127f.x;
R2f.y = intBitsToFloat(uf_remappedPS[6].x) + R127f.z;
R0f.z = intBitsToFloat(uf_remappedPS[6].z) + R127f.y;
R1f.w = intBitsToFloat(uf_remappedPS[6].y) + R125f.w;
R0f.y = intBitsToFloat(uf_remappedPS[6].x) + R126f.x;
// 13
R1f.y = intBitsToFloat(uf_remappedPS[6].z) + R126f.z;
R4f.w = mul_nonIEEE(R126f.y,intBitsToFloat(uf_remappedPS[8].x)) + 1.0;
R3f.xy = (texture(textureUnitPS1, vec2(R0f.z,R0f.x)).xw);
R2f.xy = (texture(textureUnitPS1, vec2(R2f.x,R2f.y)).xw);
R0f.xy = (texture(textureUnitPS1, vec2(R0f.w,R0f.y)).xw);
R4f.xy = (texture(textureUnitPS1, vec2(R1f.y,R1f.w)).xw);
// 0
PV0fx = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].y), R2f.x);
PV0fy = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z), R3f.y);
PV0fz = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z), R3f.x);
PV0fw = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].y), R2f.y);
R125f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].y), R0f.x);
// 1
PV1fx = PV0fx + PV0fz;
PV1fy = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z), R4f.x);
PV1fz = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].y), R0f.y);
PV1fw = PV0fw + PV0fy;
PS1f = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z), R4f.y);
// 2
PV0fx = R2f.w * PV1fx;
PV0fy = R125f.w + PV1fy;
PV0fz = PV1fz + PS1f;
PV0fw = R2f.w * PV1fw;
R122f.x = -(intBitsToFloat(uf_remappedPS[9].x)) * 4.0 + R2f.z;
// 3
PV1fx = PV0fx + -(0.5);
PV1fy = PV0fy * R2f.w;
PV1fz = PV0fz * R2f.w;
PV1fw = PV0fw + -(0.5);
R2f.w = intBitsToFloat(uf_remappedPS[7].z) + R122f.x;
// 4
PV0fx = PV1fy + -(0.5);
PV0fy = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].y), PV1fw);
PV0fz = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].y), PV1fx);
PV0fw = PV1fz + -(0.5);
PS0f = intBitsToFloat(uf_remappedPS[0].x) + -(R5f.x);
// 5
R3f.x = mul_nonIEEE(R4f.w,PV0fz) + R3f.w;
PV1fy = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].y), PV0fx);
PV1fz = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].y), PV0fw);
R3f.w = mul_nonIEEE(R4f.w,PV0fy) + R1f.z;
PS1f = max(PS0f, 0.0);
// 6
R6f.x = mul_nonIEEE(R4f.w,PV1fy) + R6f.x;
R6f.y = mul_nonIEEE(R4f.w,PV1fz) + R5f.w;
R4f.w = min(PS1f, 0.5);
R2f.z = 1.0 / intBitsToFloat(uf_remappedPS[5].z);
R1f.z = (texture(textureUnitPS0, vec2(R3f.x,R3f.w)).x);
R3f.w = (texture(textureUnitPS0, vec2(R6f.x,R6f.y)).x);
// 0
PV0fx = R1f.z + R2f.w;
PV0fy = mul_nonIEEE(R4f.w, R4f.w);
PV0fw = R3f.w + R5f.y;
// 1
PV1fx = mul_nonIEEE(R1f.x, PV0fw);
PV1fx = clamp(PV1fx, 0.0, 1.0);
R126f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].w), PV0fy);
PV1fz = mul_nonIEEE(R1f.x, PV0fx);
PV1fz = clamp(PV1fz, 0.0, 1.0);
R125f.w = R6f.w * R2f.z;
R125f.w = clamp(R125f.w, 0.0, 1.0);
// 2
PV0fx = PV1fx + -(intBitsToFloat(uf_remappedPS[10].z));
PV0fy = -(intBitsToFloat(uf_remappedPS[10].z)) + PV1fz;
// 3
R127f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].y), PV0fx);
R127f.x = clamp(R127f.x, 0.0, 1.0);
PV1fw = max(PV0fy, 0.0);
// 4
PV0fx = min(PV1fw, intBitsToFloat(0x3f733333));
// 5
R126f.z = PV0fx * intBitsToFloat(0x3e4ccccd) + R127f.x;
// 6
PV0fy = mul_nonIEEE(R126f.z, R126f.y);
// 7
R123f.w = PV0fy * 6.0 + R126f.z;
// 8
R7f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].w),R125f.w) + R123f.w;
R7f.w = clamp(R7f.w, 0.0, 1.0);
// export
passPixelColor0 = vec4(R7f.y, R7f.y, R7f.y, R7f.w);
}
