#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 4b5c4bcd7b5babb5
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[2];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(1, 1, 0) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 1) uniform sampler2D textureUnitPS2;
TEXTURE_LAYOUT(3, 1, 2) uniform sampler2D textureUnitPS3;
in vec4 passParameterSem0;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem7;
layout(location = 0) out vec4 passPixelColor0;
layout(location = 1) out vec4 passPixelColor1;
layout(location = 3) out vec4 passPixelColor3;
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
R1f = passParameterSem3;
R2f = passParameterSem4;
R3f = passParameterSem7;
R4f.xy = (texture(textureUnitPS3, vec2(R0f.x,R0f.y)).xy);
R0f.w = (texture(textureUnitPS2, vec2(R0f.x,R0f.y)).x);
R5f.xyzw = (texture(textureUnitPS1, vec2(R0f.x,R0f.y)).xyzw);
// 0
PV0fx = fract(R3f.y);
PV0fy = fract(R3f.x);
R126f.z = R4f.x * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
R127f.w = mul_nonIEEE(R1f.y, R2f.z);
R127f.x = mul_nonIEEE(R1f.z, R2f.x);
// 1
PV1fx = mul_nonIEEE(R1f.x, R2f.y);
R127f.y = R4f.y * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204);
PV1fz = PV0fy + -(0.5);
PV1fw = PV0fx + -(0.5);
R126f.w = mul_nonIEEE(R126f.z, R126f.z);
// 2
R123f.x = mul_nonIEEE(-(PV1fw),PV1fw) + 1.0;
R123f.x = clamp(R123f.x, 0.0, 1.0);
R123f.y = mul_nonIEEE(-(PV1fz),PV1fz) + 1.0;
R123f.y = clamp(R123f.y, 0.0, 1.0);
R127f.z = mul_nonIEEE(-(R2f.y),R1f.z) + R127f.w;
R127f.w = mul_nonIEEE(-(R2f.z),R1f.x) + R127f.x;
R125f.w = mul_nonIEEE(-(R2f.x),R1f.y) + PV1fx;
// 3
backupReg0f = R123f.y;
R127f.x = intBitsToFloat(0x3d008081);
R123f.y = mul_nonIEEE(R127f.y,R127f.y) + R126f.w;
R123f.y = clamp(R123f.y, 0.0, 1.0);
PV1fz = mul_nonIEEE(backupReg0f, R123f.x);
PV1fw = mul_nonIEEE(R2f.w, R127f.y);
R125f.z = intBitsToFloat(uf_remappedPS[0].z);
// 4
PV0fx = -(R123f.y) + 1.0;
PV0fy = mul_nonIEEE(R127f.z, PV1fw);
PV0fz = mul_nonIEEE(R127f.w, PV1fw);
PV0fw = mul_nonIEEE(PV1fz, PV1fz);
PS0f = mul_nonIEEE(R125f.w, PV1fw);
// 5
R123f.x = mul_nonIEEE(R2f.y,R126f.z) + PV0fz;
PV1fy = mul_nonIEEE(R0f.w, PV0fw);
R123f.z = mul_nonIEEE(R2f.z,R126f.z) + PS0f;
R123f.w = mul_nonIEEE(R2f.x,R126f.z) + PV0fy;
PS1f = sqrt(PV0fx);
// 6
backupReg0f = R123f.x;
R123f.x = mul_nonIEEE(PV1fy,-(intBitsToFloat(uf_remappedPS[1].w))) + PV1fy;
R127f.y = mul_nonIEEE(R1f.x,PS1f) + R123f.w;
R126f.z = mul_nonIEEE(R1f.y,PS1f) + backupReg0f;
R125f.w = mul_nonIEEE(R1f.z,PS1f) + R123f.z;
R0f.x = mul_nonIEEE(R5f.x,-(intBitsToFloat(uf_remappedPS[1].w))) + R5f.x;
// 7
R5f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].x), intBitsToFloat(uf_remappedPS[1].w));
R0f.y = mul_nonIEEE(R5f.y,-(intBitsToFloat(uf_remappedPS[1].w))) + R5f.y;
PV1fz = R123f.x * 63.75;
R2f.w = R5f.w;
R0f.z = mul_nonIEEE(R5f.z,-(intBitsToFloat(uf_remappedPS[1].w))) + R5f.z;
// 8
tempf.x = dot(vec4(R127f.y,R126f.z,R125f.w,intBitsToFloat(0x80000000)),vec4(R127f.y,R126f.z,R125f.w,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
R127f.w = tempf.x;
PS0f = floor(PV1fz);
PS0f *= 4.0;
// 9
PV1fx = PS0f + 2.0;
R5f.y = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].y), intBitsToFloat(uf_remappedPS[1].w));
R5f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].z), intBitsToFloat(uf_remappedPS[1].w));
R5f.w = 1.0;
R2f.x = R127f.x;
// 10
R2f.y = R125f.z;
R1f.w = PV1fx * intBitsToFloat(0x3b808081);
R0f.w = intBitsToFloat(0x3e828283);
// 11
tempResultf = 1.0 / sqrt(R127f.w);
PS1f = tempResultf;
PS1f /= 2.0;
// 12
R1f.x = mul_nonIEEE(R127f.y,PS1f) + 0.5;
R1f.y = mul_nonIEEE(R126f.z,PS1f) + 0.5;
R1f.z = mul_nonIEEE(R125f.w,PS1f) + 0.5;
// 13
R6f.x = R5f.x;
R6f.y = R5f.y;
R6f.z = R5f.z;
R6f.w = R5f.w;
// 14
R5f.x = R1f.x;
R5f.y = R1f.y;
R5f.z = R1f.z;
R5f.w = R1f.w;
// 15
R4f.x = R0f.x;
R4f.y = R0f.y;
R4f.z = R0f.z;
R4f.w = R0f.w;
// 16
R3f.x = R2f.x;
R3f.y = R2f.y;
R3f.z = R2f.z;
R3f.w = R2f.w;
// export
if( ((vec4(R3f.x, R3f.y, R3f.z, R3f.w)).a >= uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R3f.x, R3f.y, R3f.z, R3f.w);
passPixelColor1 = vec4(R4f.x, R4f.y, R4f.z, R4f.w);
passPixelColor3 = vec4(R5f.x, R5f.y, R5f.z, R5f.w);
passPixelColor5 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
}
