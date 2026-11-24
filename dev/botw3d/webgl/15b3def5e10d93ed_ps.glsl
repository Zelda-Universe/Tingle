#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 15b3def5e10d93ed
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
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem4;
in vec4 passParameterSem7;
in vec4 passParameterSem8;
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
vec4 R122f = vec4(0.0);
vec4 R123f = vec4(0.0);
vec4 R124f = vec4(0.0);
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
R3f = passParameterSem7;
R4f = passParameterSem8;
R5f = passParameterSem11;
R1f.w = (texture(textureUnitPS1, vec2(R4f.z,R4f.w)).w);
R4f.xyzw = (texture(textureUnitPS0, vec2(R4f.x,R4f.y)).xyzw);
// 0
PV0fx = intBitsToFloat(uf_remappedPS[0].z) * 0.99609375;
PV0fy = mul_nonIEEE(R4f.w, R1f.w);
R126f.z = -(R5f.z) * -(1.0);
PV0fw = intBitsToFloat(uf_remappedPS[0].y) * 64.0;
R125f.z = R4f.x * 1.0;
// 1
PV1fx = PV0fw * 0.99609375;
R127f.y = mul_nonIEEE(R3f.w, PV0fy);
R124f.z = R4f.y * 1.0;
PV1fw = PV0fx * 64.0;
R125f.x = R4f.z * 1.0;
// 2
R127f.x = R0f.x + -(R1f.x);
PV0fy = floor(PV1fw);
PV0fy *= 4.0;
R127f.z = floor(PV1fx);
R127f.z *= 4.0;
R127f.w = R0f.y + -(R1f.y);
R126f.x = R0f.z + -(R1f.z);
// 3
R4f.x = dot(vec4(R5f.x,R5f.y,R126f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[1].x),intBitsToFloat(uf_remappedPS[1].y),intBitsToFloat(uf_remappedPS[1].z),0.0));
PV1fy = R4f.x;
PV1fz = R4f.x;
PV1fw = R4f.x;
R124f.x = PV0fy + 0.0;
// 4
tempf.x = dot(vec4(R5f.x,R5f.y,R126f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[2].x),intBitsToFloat(uf_remappedPS[2].y),intBitsToFloat(uf_remappedPS[2].z),0.0));
PV0fx = tempf.x;
R125f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R126f.y = R127f.z + 0.0;
// 5
tempf.x = dot(vec4(R5f.x,R5f.y,R126f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(uf_remappedPS[3].y),intBitsToFloat(uf_remappedPS[3].z),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
R126f.z = tempf.x;
PV1fw = tempf.x;
R126f.w = mul_nonIEEE(R127f.x,R125f.z) + R1f.x;
// 6
backupReg0f = R124f.z;
tempf.x = dot(vec4(R4f.x,R125f.y,PV1fx,intBitsToFloat(0x80000000)),vec4(R4f.x,R125f.y,PV1fx,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
R124f.z = tempf.x;
PV0fw = tempf.x;
R122f.x = mul_nonIEEE(R127f.w,backupReg0f) + R1f.y;
// 7
backupReg0f = R127f.y;
backupReg1f = R126f.x;
R126f.x = R124f.x + 0.0;
R127f.y = R126f.y + 0.0;
PV1fz = mul_nonIEEE(R0f.w, backupReg0f);
PV1fz = clamp(PV1fz, 0.0, 1.0);
R123f.w = mul_nonIEEE(backupReg1f,R125f.x) + R1f.z;
R0f.y = mul_nonIEEE(R3f.y, R122f.x);
// 8
R0f.x = mul_nonIEEE(R3f.x, R126f.w);
R1f.y = 0.0;
R0f.z = mul_nonIEEE(R3f.z, R123f.w);
R3f.w = mul_nonIEEE(R2f.x, PV1fz);
R3f.x = intBitsToFloat(0x3d008081);
// 9
R3f.y = intBitsToFloat(0x3ec0c0c1);
R3f.z = 0.0;
R0f.w = R126f.x * intBitsToFloat(0x3b808081);
R2f.w = R127f.y * intBitsToFloat(0x3b808081);
// 10
tempResultf = 1.0 / sqrt(R124f.z);
PS0f = tempResultf;
PS0f /= 2.0;
// 11
R2f.x = mul_nonIEEE(R4f.x,PS0f) + 0.5;
R2f.y = mul_nonIEEE(R125f.y,PS0f) + 0.5;
R2f.z = mul_nonIEEE(R126f.z,PS0f) + 0.5;
// 12
R6f.x = R2f.x;
R6f.y = R2f.y;
R6f.z = R2f.z;
R6f.w = R2f.w;
// 13
R5f.x = R0f.x;
R5f.y = R0f.y;
R5f.z = R0f.z;
R5f.w = R0f.w;
// 14
R4f.x = R3f.x;
R4f.y = R3f.y;
R4f.z = R3f.z;
R4f.w = R3f.w;
// 15
R7f.x = R1f.y;
R7f.y = R1f.y;
R7f.z = R1f.y;
R7f.w = R1f.y;
// export
if( ((vec4(R4f.x, R4f.y, R4f.z, R4f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R4f.x, R4f.y, R4f.z, R4f.w);
passPixelColor1 = vec4(R5f.x, R5f.y, R5f.z, R5f.w);
passPixelColor3 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
passPixelColor5 = vec4(R7f.x, R7f.y, R7f.z, R7f.w);
}
