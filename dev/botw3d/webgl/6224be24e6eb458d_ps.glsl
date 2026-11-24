#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 6224be24e6eb458d
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[2];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(1, 1, 0) uniform sampler2D textureUnitPS1;
in vec4 passParameterSem0;
layout(location = 0) out vec4 passPixelColor0;
layout(location = 1) out vec4 passPixelColor1;
layout(location = 2) out vec4 passPixelColor2;
layout(location = 3) out vec4 passPixelColor3;
layout(location = 4) out vec4 passPixelColor4;
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
float backupReg0f, backupReg1f, backupReg2f, backupReg3f, backupReg4f;
float PV0fx = 0.0, PV0fy = 0.0, PV0fz = 0.0, PV0fw = 0.0, PV1fx = 0.0, PV1fy = 0.0, PV1fz = 0.0, PV1fw = 0.0;
float PS0f = 0.0, PS1f = 0.0;
vec4 tempf = vec4(0.0);
float tempResultf;
int tempResulti;
ivec4 ARi = ivec4(0);
bool predResult = true;
R0f = passParameterSem0;
R0f.xyz = (texture(textureUnitPS1, vec2(R0f.x,R0f.y)).xyz);
// 0
PV0fy = max(R0f.z, -(R0f.z));
// 1
PV1fx = -(PV0fy) + 1.0;
// 2
PV0fw = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedPS[0].y));
PV0fw = clamp(PV0fw, 0.0, 1.0);
// 3
tempResultf = max(0.0, PV0fw);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1f = tempResultf;
// 4
PV0fy = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), PS1f);
// 5
PS1f = exp2(PV0fy);
// 6
PV0fx = mul_nonIEEE(PS1f, intBitsToFloat(uf_remappedPS[1].w));
PV0fy = mul_nonIEEE(PS1f, intBitsToFloat(uf_remappedPS[1].z));
PV0fz = mul_nonIEEE(PS1f, intBitsToFloat(uf_remappedPS[1].y));
PV0fw = mul_nonIEEE(PS1f, intBitsToFloat(uf_remappedPS[1].x));
// 7
R0f.x = 0.0 + PV0fw;
R0f.y = 0.0 + PV0fz;
R0f.z = 0.0 + PV0fy;
R0f.w = 0.0 + PV0fx;
// 8
PV0fx = 0.0;
PV0fy = 0.0;
PV0fz = 0.0;
PV0fw = 0.0;
// 9
PV1fx = 0.0;
PV1fy = 0.0;
PV1fz = 0.0;
PV1fw = 0.0;
// 10
PV0fx = 0.0;
PV0fy = 0.0;
PV0fz = 0.0;
PV0fw = 0.0;
// 11
PV1fx = 0.0;
PV1fy = 0.0;
PV1fz = 0.0;
PV1fw = 0.0;
// 12
R2f.x = R0f.x;
R2f.y = R0f.y;
R2f.z = R0f.z;
R2f.w = R0f.w;
// 13
R1f.x = R0f.x;
R1f.y = R0f.y;
R1f.z = R0f.z;
R1f.w = R0f.w;
// export
passPixelColor2 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
passPixelColor3 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
passPixelColor4 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
passPixelColor5 = vec4(R3f.x, R3f.y, R3f.z, R3f.w);
// export
passPixelColor0 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
passPixelColor1 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
}
