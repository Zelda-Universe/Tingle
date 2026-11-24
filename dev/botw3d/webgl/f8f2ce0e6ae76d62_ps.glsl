#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader f8f2ce0e6ae76d62
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[11];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 2) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(3, 1, 3) uniform sampler2D textureUnitPS3;
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
vec4 R8f = vec4(0.0);
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
R7f.x = R0f.x + -(R2f.x);
PV0fy = R0f.x + -(R2f.z);
R0f.z = R0f.y + -(R2f.y);
PV0fw = R0f.y + -(R2f.w);
PS0f = 1.0 / intBitsToFloat(uf_remappedPS[0].w);
// 1
R125f.y = PV0fw * PS0f;
R126f.z = PV0fy * PS0f;
R127f.y = 1.0 / intBitsToFloat(uf_remappedPS[1].w);
// 2
PV0fw = mul_nonIEEE(R126f.z, R126f.z);
R126f.y = 1.0 / intBitsToFloat(uf_remappedPS[2].w);
// 3
R127f.x = mul_nonIEEE(R125f.y,R125f.y) + PV0fw;
R127f.z = intBitsToFloat(uf_remappedPS[3].y) + intBitsToFloat(uf_remappedPS[3].z);
// 4
R1f.z = sqrt(R127f.x);
// 5
PV1fx = R1f.z + -(intBitsToFloat(uf_remappedPS[2].z));
PV1fz = R1f.z + -(intBitsToFloat(uf_remappedPS[1].z));
tempResultf = max(0.0, R127f.x);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1f = tempResultf;
// 6
PV0fx = PV1fx * R126f.y;
PV0fx = clamp(PV0fx, 0.0, 1.0);
PV0fy = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].x), PS1f);
PV0fw = PV1fz * R127f.y;
PV0fw = clamp(PV0fw, 0.0, 1.0);
R1f.y = 1.0 / R127f.z;
// 7
R2f.x = mul_nonIEEE(PV0fw, intBitsToFloat(uf_remappedPS[4].x));
R7f.y = mul_nonIEEE(PV0fx,intBitsToFloat(uf_remappedPS[5].x)) + 1.0;
PS1f = exp2(PV0fy);
// 8
PV0fy = mul_nonIEEE(R125f.y, PS1f);
PV0fz = mul_nonIEEE(R126f.z, PS1f);
R0f.w = R2f.x + intBitsToFloat(uf_remappedPS[6].z);
// 9
R6f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].y),PV0fy) + R0f.y;
R2f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].y),PV0fz) + R0f.x;
// 10
PV0fx = mul_nonIEEE(R2f.w, intBitsToFloat(uf_remappedPS[3].x));
R125f.y = mul_nonIEEE(R6f.x, intBitsToFloat(uf_remappedPS[3].x));
PV0fz = mul_nonIEEE(R2f.w, intBitsToFloat(uf_remappedPS[7].w));
PV0fw = mul_nonIEEE(R6f.x, intBitsToFloat(uf_remappedPS[7].w));
// 11
R0f.x = PV0fz + intBitsToFloat(uf_remappedPS[6].w);
R0f.y = intBitsToFloat(uf_remappedPS[7].x) + PV0fw;
R2f.z = intBitsToFloat(uf_remappedPS[7].y) + PV0fx;
// 12
R8f.x = mul_nonIEEE(R7f.x,-(intBitsToFloat(uf_remappedPS[3].w))) + R2f.w;
R2f.y = intBitsToFloat(uf_remappedPS[7].z) + R125f.y;
R4f.z = mul_nonIEEE(R0f.z,-(intBitsToFloat(uf_remappedPS[3].w))) + R6f.x;
R3f.xy = (texture(textureUnitPS2, vec2(R0f.x,R0f.y)).xw);
R0f.xy = (texture(textureUnitPS3, vec2(R0f.x,R0f.y)).xw);
R5f.xy = (texture(textureUnitPS2, vec2(R2f.y,R2f.z)).xw);
R4f.xy = (texture(textureUnitPS3, vec2(R2f.y,R2f.z)).xw);
// 0
R127f.x = -(intBitsToFloat(uf_remappedPS[8].x)) * 4.0 + R2f.x;
PV0fy = -(R3f.y) + R0f.y;
PV0fz = -(R3f.x) + R0f.x;
PV0fw = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].w), R4f.z);
// 1
R123f.x = mul_nonIEEE(PV0fy,intBitsToFloat(uf_remappedPS[9].x)) + R3f.y;
PV1fy = -(R5f.y) + R4f.y;
PV1fz = -(R5f.x) + R4f.x;
R123f.w = mul_nonIEEE(PV0fz,intBitsToFloat(uf_remappedPS[9].x)) + R3f.x;
R3f.y = intBitsToFloat(uf_remappedPS[7].x) + PV0fw;
// 2
backupReg0f = R123f.x;
R123f.x = mul_nonIEEE(PV1fy,intBitsToFloat(uf_remappedPS[9].x)) + R5f.y;
R125f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].y), backupReg0f);
R126f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].y), R123f.w);
R123f.w = mul_nonIEEE(PV1fz,intBitsToFloat(uf_remappedPS[9].x)) + R5f.x;
R127f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x), R8f.x);
// 3
PV1fy = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].z), R123f.x);
PV1fz = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].z), R123f.w);
PV1fw = mul_nonIEEE(intBitsToFloat(uf_remappedPS[7].w), R8f.x);
// 4
PV0fx = R125f.y + PV1fy;
PV0fy = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x), R4f.z);
R3f.z = intBitsToFloat(uf_remappedPS[6].w) + PV1fw;
PV0fw = R126f.z + PV1fz;
// 5
PV1fx = PV0fx * R1f.y;
R5f.y = intBitsToFloat(uf_remappedPS[7].z) + PV0fy;
R5f.z = intBitsToFloat(uf_remappedPS[7].y) + R127f.w;
PV1fw = PV0fw * R1f.y;
// 6
PV0fy = PV1fx + -(0.5);
PV0fz = PV1fw + -(0.5);
R1f.w = intBitsToFloat(uf_remappedPS[6].z) + R127f.x;
// 7
PV1fx = mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].y), PV0fy);
PV1fw = mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].y), PV0fz);
// 8
backupReg0f = R6f.x;
R6f.x = mul_nonIEEE(R7f.y,PV1fw) + R2f.w;
R6f.y = mul_nonIEEE(R7f.y,PV1fx) + backupReg0f;
R2f.w = (texture(textureUnitPS0, vec2(R6f.x,R6f.y)).x);
R2f.z = (texture(textureUnitPS1, vec2(R6f.x,R6f.y)).x);
R6f.xy = (texture(textureUnitPS2, vec2(R3f.z,R3f.y)).xw);
R3f.xy = (texture(textureUnitPS3, vec2(R3f.z,R3f.y)).xw);
R4f.xy = (texture(textureUnitPS2, vec2(R5f.y,R5f.z)).xw);
R5f.xy = (texture(textureUnitPS3, vec2(R5f.y,R5f.z)).xw);
// 0
PV0fx = -(R6f.y) + R3f.y;
PV0fy = mul_nonIEEE(R7f.x, R7f.x);
PV0fz = -(R2f.w) + R2f.z;
PV0fw = -(R6f.x) + R3f.x;
// 1
R123f.x = mul_nonIEEE(PV0fx,intBitsToFloat(uf_remappedPS[9].x)) + R6f.y;
R123f.y = mul_nonIEEE(PV0fz,intBitsToFloat(uf_remappedPS[9].x)) + R2f.w;
R123f.z = mul_nonIEEE(PV0fw,intBitsToFloat(uf_remappedPS[9].x)) + R6f.x;
R127f.w = mul_nonIEEE(R0f.z,R0f.z) + PV0fy;
PS1f = -(R4f.x) + R5f.x;
// 2
backupReg0f = R123f.z;
PV0fx = R123f.y + R0f.w;
R125f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].y), R123f.x);
R123f.z = mul_nonIEEE(PS1f,intBitsToFloat(uf_remappedPS[9].x)) + R4f.x;
R126f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].y), backupReg0f);
PS0f = -(R4f.y) + R5f.y;
// 3
R123f.y = mul_nonIEEE(PS0f,intBitsToFloat(uf_remappedPS[9].x)) + R4f.y;
PV1fz = mul_nonIEEE(R1f.x, PV0fx);
PV1fz = clamp(PV1fz, 0.0, 1.0);
PV1fw = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].z), R123f.z);
R127f.x = sqrt(R127f.w);
// 4
PV0fx = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].z), R123f.y);
PV0fy = PV1fz + -(intBitsToFloat(uf_remappedPS[10].z));
PV0fz = R126f.w + PV1fw;
// 5
PV1fx = R1f.y * PV0fz;
PV1fy = R125f.y + PV0fx;
PV1fz = intBitsToFloat(uf_remappedPS[0].x) + -(R127f.x);
R2f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].y), PV0fy);
R2f.w = clamp(R2f.w, 0.0, 1.0);
// 6
PV0fx = R1f.y * PV1fy;
PV0fy = max(PV1fz, 0.0);
PV0fz = PV1fx + -(0.5);
PV0fw = R1f.z + -(intBitsToFloat(uf_remappedPS[4].y));
PS0f = 1.0 / intBitsToFloat(uf_remappedPS[4].z);
// 7
PV1fx = PV0fx + -(0.5);
R1f.y = PV0fw * PS0f;
R1f.y = clamp(R1f.y, 0.0, 1.0);
PV1fz = min(PV0fy, 0.5);
PV1fw = mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].y), PV0fz);
R4f.x = intBitsToFloat(uf_remappedPS[9].y) * 1.0;
// 8
R8f.x = mul_nonIEEE(R7f.y,PV1fw) + R8f.x;
PV0fy = mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].y), PV1fx);
PV0fz = mul_nonIEEE(PV1fz, PV1fz);
// 9
R8f.y = mul_nonIEEE(R7f.y,PV0fy) + R4f.z;
R1f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].w), PV0fz);
R4f.z = (texture(textureUnitPS0, vec2(R8f.x,R8f.y)).x);
R0f.w = (texture(textureUnitPS1, vec2(R8f.x,R8f.y)).x);
// 0
PV0fz = -(R4f.z) + R0f.w;
// 1
R123f.y = mul_nonIEEE(PV0fz,intBitsToFloat(uf_remappedPS[9].x)) + R4f.z;
// 2
PV0fx = R123f.y + R1f.w;
// 3
PV1fz = mul_nonIEEE(R1f.x, PV0fx);
PV1fz = clamp(PV1fz, 0.0, 1.0);
// 4
PV0fy = -(intBitsToFloat(uf_remappedPS[10].z)) + PV1fz;
// 5
PV1fw = max(PV0fy, 0.0);
// 6
PV0fx = min(PV1fw, intBitsToFloat(0x3f733333));
// 7
R126f.z = PV0fx * intBitsToFloat(0x3e4ccccd) + R2f.w;
// 8
PV0fy = mul_nonIEEE(R126f.z, R1f.z);
// 9
R123f.w = PV0fy * 6.0 + R126f.z;
// 10
R4f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].w),R1f.y) + R123f.w;
R4f.w = clamp(R4f.w, 0.0, 1.0);
// export
passPixelColor0 = vec4(R4f.x, R4f.x, R4f.x, R4f.w);
}
