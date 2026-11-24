#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader e0040ae7a592b7a3
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[4];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(3, 1, 0) uniform sampler2D textureUnitPS3;
in vec4 passParameterSem0;
in vec4 passParameterSem4;
in vec4 passParameterSem3;
in vec4 passParameterSem5;
layout(location = 0) out vec4 passPixelColor0;
layout(location = 1) out vec4 passPixelColor1;
layout(location = 3) out vec4 passPixelColor3;
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
R1f = passParameterSem4;
R2f = passParameterSem3;
R3f = passParameterSem5;
R4f.xyzw = (texture(textureUnitPS3, vec2(R0f.x,R0f.y)).xyzw);
// 0
tempf.x = dot(vec4(R3f.x,R3f.y,R3f.z,intBitsToFloat(0x80000000)),vec4(R3f.x,R3f.y,R3f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R125f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].x), intBitsToFloat(uf_remappedPS[1].w));
// 1
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,intBitsToFloat(0x80000000)),vec4(R2f.x,R2f.y,R2f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R127f.z = sqrt(PV0fx);
// 2
R6f.x = intBitsToFloat(0x3ce0e0e1);
R125f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].y), intBitsToFloat(uf_remappedPS[1].w));
R6f.z = 0.0;
R6f.w = R4f.w;
tempResultf = 1.0 / sqrt(PV1fx);
PS0f = tempResultf;
// 3
R127f.x = mul_nonIEEE(R2f.x, PS0f);
R127f.y = mul_nonIEEE(R2f.y, PS0f);
R126f.z = mul_nonIEEE(R2f.z, PS0f);
R127f.w = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].z), intBitsToFloat(uf_remappedPS[1].w));
PS1f = 1.0 / R127f.z;
// 4
R126f.x = mul_nonIEEE(R3f.x, PS1f);
R126f.y = mul_nonIEEE(R3f.y, PS1f);
R127f.z = mul_nonIEEE(R3f.z, PS1f);
R5f.w = 0.0;
R2f.x = R127f.x * 0.5 + 0.5;
// 5
tempf.x = dot(vec4(R127f.x,R127f.y,R126f.z,intBitsToFloat(0x80000000)),vec4(R126f.x,R126f.y,R127f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R2f.y = R127f.y * 0.5 + 0.5;
// 6
tempf.x = dot(vec4(R126f.x,R126f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(R125f.x,R125f.y,R127f.w,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = PV1fx + 1.0;
PS0f = clamp(PS0f, 0.0, 1.0);
// 7
PV1fx = max(-(PV0fx), 0.0);
R2f.z = R126f.z * 0.5 + 0.5;
R2f.w = 0.0;
tempResultf = max(0.0, PS0f);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
R3f.z = tempResultf;
// 8
PV0fz = min(PV1fx, 1.0);
// 9
R0f.w = mul_nonIEEE(PV0fz, PV0fz);
// 0
R126f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].w), R4f.x);
R126f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].w), R4f.z);
R126f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[2].w), R4f.y);
PV0fw = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].y), R3f.z);
// 1
PS1f = exp2(PV0fw);
PS1f = clamp(PS1f, 0.0, 1.0);
// 2
PV0fy = mul_nonIEEE(PS1f, R0f.w);
// 3
R123f.x = mul_nonIEEE(R126f.z,PV0fy) + R4f.y;
R123f.y = mul_nonIEEE(R126f.x,PV0fy) + R4f.x;
R123f.z = mul_nonIEEE(R126f.y,PV0fy) + R4f.z;
// 4
R5f.x = mul_nonIEEE(R1f.x, R123f.y);
R5f.y = mul_nonIEEE(R1f.x, R123f.x);
R5f.z = mul_nonIEEE(R1f.x, R123f.z);
// 5
R2f.x = R2f.x;
R2f.y = R2f.y;
R2f.z = R2f.z;
R2f.w = R2f.w;
// 6
R1f.x = R5f.x;
R1f.y = R5f.y;
R1f.z = R5f.z;
R1f.w = R5f.w;
// 7
R0f.x = R6f.x;
R0f.y = R6f.z;
R0f.z = R6f.z;
R0f.w = R6f.w;
// export
if( ((vec4(R0f.x, R0f.y, R0f.z, R0f.w)).a >= uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
passPixelColor1 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
passPixelColor3 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
}
