#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader f90c0008b31de315
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
in vec4 passParameterSem8;
in vec4 passParameterSem10;
in vec4 passParameterSem11;
in vec4 passParameterSem13;
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
R2f = passParameterSem4;
R3f = passParameterSem8;
R4f = passParameterSem10;
R5f = passParameterSem11;
R6f = passParameterSem13;
R7f.xy = (texture(textureUnitPS1, vec2(R3f.z,R3f.w)).xy);
R3f.xyzw = (texture(textureUnitPS0, vec2(R3f.x,R3f.y)).xyzw);
// 0
R127f.x = mul_nonIEEE(R6f.x, R7f.x);
PV0fy = mul_nonIEEE(R6f.z, R7f.x);
PV0fz = 0.0;
R127f.w = mul_nonIEEE(R6f.y, R7f.x);
R126f.w = intBitsToFloat(uf_remappedPS[0].y) * 64.0;
// 1
tempf.x = dot(vec4(R7f.x,R7f.y,PV0fz,intBitsToFloat(0x80000000)),vec4(R7f.x,R7f.y,R7f.y,0.0));
tempf.x = clamp(tempf.x, 0.0, 1.0);
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R126f.x = mul_nonIEEE(R4f.z,R7f.y) + PV0fy;
// 2
backupReg0f = R127f.x;
R127f.x = mul_nonIEEE(R4f.y,R7f.y) + R127f.w;
PV0fy = R126f.w * 0.99609375;
R127f.z = -(PV1fx) + 1.0;
R127f.w = mul_nonIEEE(R4f.x,R7f.y) + backupReg0f;
PS0f = R0f.z + -(R1f.z);
// 3
PV1fx = mul_nonIEEE(R0f.w, R3f.w);
PV1fx = clamp(PV1fx, 0.0, 1.0);
PV1fy = R0f.x + -(R1f.x);
PV1fz = floor(PV0fy);
PV1fz *= 4.0;
PV1fw = R0f.y + -(R1f.y);
R0f.z = mul_nonIEEE(PS0f,R3f.z) + R1f.z;
// 4
R0f.x = mul_nonIEEE(PV1fy,R3f.x) + R1f.x;
PV0fy = PV1fz + 0.0;
R3f.z = 0.0;
R2f.w = mul_nonIEEE(R2f.x, PV1fx);
R0f.y = mul_nonIEEE(PV1fw,R3f.y) + R1f.y;
// 5
PV1fx = PV0fy + 0.0;
R2f.y = intBitsToFloat(0x3ec0c0c1);
R2f.z = 0.0;
R0f.w = 0.0;
R2f.x = intBitsToFloat(0x3dc0c0c1);
// 6
R1f.w = PV1fx * intBitsToFloat(0x3b808081);
PS0f = sqrt(R127f.z);
// 7
backupReg0f = R127f.x;
R127f.x = mul_nonIEEE(R5f.x,PS0f) + R127f.w;
R127f.y = mul_nonIEEE(R5f.y,PS0f) + backupReg0f;
R123f.w = mul_nonIEEE(R5f.z,PS0f) + R126f.x;
// 8
R127f.z = -(R123f.w) * -(1.0);
// 9
R126f.x = dot(vec4(R127f.x,R127f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[1].x),intBitsToFloat(uf_remappedPS[1].y),intBitsToFloat(uf_remappedPS[1].z),0.0));
PV1fy = R126f.x;
PV1fz = R126f.x;
PV1fw = R126f.x;
// 10
tempf.x = dot(vec4(R127f.x,R127f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[2].x),intBitsToFloat(uf_remappedPS[2].y),intBitsToFloat(uf_remappedPS[2].z),0.0));
PV0fx = tempf.x;
R126f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 11
tempf.x = dot(vec4(R127f.x,R127f.y,R127f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(uf_remappedPS[3].y),intBitsToFloat(uf_remappedPS[3].z),0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
R127f.z = tempf.x;
PV1fw = tempf.x;
// 12
tempf.x = dot(vec4(R126f.x,R126f.y,PV1fx,intBitsToFloat(0x80000000)),vec4(R126f.x,R126f.y,PV1fx,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
// 13
tempResultf = 1.0 / sqrt(PV0fx);
PS1f = tempResultf;
PS1f /= 2.0;
// 14
R1f.x = mul_nonIEEE(R126f.x,PS1f) + 0.5;
R1f.y = mul_nonIEEE(R126f.y,PS1f) + 0.5;
R1f.z = mul_nonIEEE(R127f.z,PS1f) + 0.5;
// 15
R6f.x = R1f.x;
R6f.y = R1f.y;
R6f.z = R1f.z;
R6f.w = R1f.w;
// 16
R5f.x = R0f.x;
R5f.y = R0f.y;
R5f.z = R0f.z;
R5f.w = R0f.w;
// 17
R4f.x = R2f.x;
R4f.y = R2f.y;
R4f.z = R2f.z;
R4f.w = R2f.w;
// 18
R7f.x = R3f.z;
R7f.y = R3f.z;
R7f.z = R3f.z;
R7f.w = R3f.z;
// export
if( ((vec4(R4f.x, R4f.y, R4f.z, R4f.w)).a > uf_alphaTestRef) == false) discard;
passPixelColor0 = vec4(R4f.x, R4f.y, R4f.z, R4f.w);
passPixelColor1 = vec4(R5f.x, R5f.y, R5f.z, R5f.w);
passPixelColor3 = vec4(R6f.x, R6f.y, R6f.z, R6f.w);
passPixelColor5 = vec4(R7f.x, R7f.y, R7f.z, R7f.w);
}
