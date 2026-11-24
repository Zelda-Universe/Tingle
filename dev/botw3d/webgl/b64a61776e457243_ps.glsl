#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader b64a61776e457243
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[4];
uniform float uf_alphaTestRef;
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2D textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 2) uniform sampler2D textureUnitPS2;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem4;
in vec4 passParameterSem8;
in vec4 passParameterSem9;
in vec4 passParameterSem11;
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
R1f = passParameterSem1;
R2f = passParameterSem4;
R3f = passParameterSem8;
R4f = passParameterSem9;
R5f = passParameterSem11;
R2f.w = (texture(textureUnitPS0, vec2(R3f.x,R3f.y)).w);
R3f.z = (texture(textureUnitPS1, vec2(R3f.z,R3f.w)).w);
R4f.y = (texture(textureUnitPS2, vec2(R4f.x,R4f.y)).w);
// 0
PV0fx = intBitsToFloat(uf_remappedPS[0].z) * 0.99609375;
PV0fy = R2f.w + R3f.z;
R126f.z = -(R5f.z) * -(1.0);
PV0fw = intBitsToFloat(uf_remappedPS[0].y) * 64.0;
R3f.x = 0.0;
// 1
PV1fx = PV0fw * 0.99609375;
R123f.y = mul_nonIEEE(PV0fy,R4f.y) + -(R0f.w);
R4f.z = 0.0;
PV1fw = PV0fx * 64.0;
R4f.x = intBitsToFloat(0x3d008081);
// 2
R126f.x = mul_nonIEEE(R1f.w, R123f.y);
R126f.x = clamp(R126f.x, 0.0, 1.0);
PV0fy = floor(PV1fw);
PV0fy *= 4.0;
R127f.z = floor(PV1fx);
R127f.z *= 4.0;
PV0fw = mul_nonIEEE(R126f.z, intBitsToFloat(uf_remappedPS[1].z));
R4f.y = intBitsToFloat(0x3ec0c0c1);
// 3
R125f.x = dot(vec4(R5f.x,R5f.y,PV0fw,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[1].x),intBitsToFloat(uf_remappedPS[1].y),1.0,0.0));
PV1fy = R125f.x;
PV1fz = R125f.x;
PV1fw = R125f.x;
R127f.x = PV0fy + 0.0;
// 4
tempf.x = dot(vec4(R5f.x,R5f.y,R126f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[2].x),intBitsToFloat(uf_remappedPS[2].y),intBitsToFloat(uf_remappedPS[2].z),0.0));
PV0fx = tempf.x;
R126f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R127f.y = R127f.z + 0.0;
// 5
tempf.x = dot(vec4(R5f.x,R5f.y,R126f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(uf_remappedPS[3].y),intBitsToFloat(uf_remappedPS[3].z),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
R127f.z = tempf.x;
PV1fw = tempf.x;
R127f.w = R127f.x + 0.0;
// 6
tempf.x = dot(vec4(R125f.x,R126f.y,PV1fx,intBitsToFloat(0x80000000)),vec4(R125f.x,R126f.y,PV1fx,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
R126f.z = tempf.x;
PV0fw = tempf.x;
R127f.x = R127f.y + 0.0;
// 7
R4f.w = mul_nonIEEE(R2f.x, R126f.x);
R0f.w = R127f.w * intBitsToFloat(0x3b808081);
// 8
R2f.w = R127f.x * intBitsToFloat(0x3b808081);
tempResultf = 1.0 / sqrt(R126f.z);
PS0f = tempResultf;
PS0f /= 2.0;
// 9
R2f.x = mul_nonIEEE(R125f.x,PS0f) + 0.5;
R2f.y = mul_nonIEEE(R126f.y,PS0f) + 0.5;
R2f.z = mul_nonIEEE(R127f.z,PS0f) + 0.5;
// 10
R7f.x = R2f.x;
R7f.y = R2f.y;
R7f.z = R2f.z;
R7f.w = R2f.w;
// 11
R6f.x = R0f.x;
R6f.y = R0f.y;
R6f.z = R0f.z;
R6f.w = R0f.w;
// 12
R5f.x = R4f.x;
R5f.y = R4f.y;
R5f.z = R4f.z;
R5f.w = R4f.w;
// 13
R8f.x = R3f.x;
R8f.y = R3f.x;
R8f.z = R3f.x;
R8f.w = R3f.x;
// export
if( ((vec4(R5f.x, R5f.y, R5f.z, R5f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R5f.x, R5f.y, R5f.z, R5f.w);
passPixelColor1 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
passPixelColor3 = vec4(R7f.x, R7f.y, R7f.z, R7f.w);
passPixelColor5 = vec4(R8f.x, R8f.y, R8f.z, R8f.w);
}
