#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 53422d4f43914447
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[5];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
in vec4 passParameterSem0;
in vec4 passParameterSem6;
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
R1f = passParameterSem6;
// 0
tempf.x = dot(vec4(R1f.x,R1f.y,R1f.z,intBitsToFloat(0x80000000)),vec4(R1f.x,R1f.y,R1f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R126f.x = intBitsToFloat(uf_remappedPS[0].z) + -(intBitsToFloat(uf_remappedPS[0].w));
// 1
R2f.w = 1.0;
tempResultf = 1.0 / sqrt(PV0fx);
PS1f = tempResultf;
// 2
PV0fx = mul_nonIEEE(R1f.x, PS1f);
R127f.y = mul_nonIEEE(R1f.y, PS1f);
PV0fz = mul_nonIEEE(R1f.z, PS1f);
// 3
tempf.x = dot(vec4(intBitsToFloat(uf_remappedPS[1].x),intBitsToFloat(uf_remappedPS[1].y),intBitsToFloat(uf_remappedPS[1].z),intBitsToFloat(0x80000000)),vec4(PV0fx,R127f.y,PV0fz,0.0));
tempf.x /= 2.0;
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
PS1f = R127f.y;
PS1f /= 2.0;
// 4
R127f.x = PV1fx + 0.5;
PV0fy = R127f.y;
PV0fy = clamp(PV0fy, 0.0, 1.0);
R1f.z = PS1f + 0.5;
// 5
R123f.x = R127f.x * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626);
PV1fw = -(R127f.x) + 1.0;
tempResultf = max(0.0, PV0fy);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS1f = tempResultf;
// 6
PV0fx = mul_nonIEEE(PS1f, intBitsToFloat(uf_remappedPS[0].y));
R123f.z = mul_nonIEEE(R127f.x,R123f.x) + intBitsToFloat(0xbe593484);
PS0f = sqrt(PV1fw);
// 7
PV1fx = PS0f * intBitsToFloat(0x3f22f983);
R123f.y = mul_nonIEEE(R127f.x,R123f.z) + intBitsToFloat(0x3fc90da4);
PS1f = exp2(PV0fx);
// 8
R1f.x = mul_nonIEEE(PV1fx,-(R123f.y)) + 1.0;
R0f.w = mul_nonIEEE(R126f.x,PS1f) + intBitsToFloat(uf_remappedPS[0].w);
R1f.xyzw = (texture(textureUnitPS0, vec2(R1f.x,R1f.z)).xyzw);
// 0
R126f.x = R1f.w + intBitsToFloat(uf_remappedPS[2].w);
R126f.x = clamp(R126f.x, 0.0, 1.0);
R127f.y = mul_nonIEEE(R1f.z,intBitsToFloat(uf_remappedPS[3].x)) + -(intBitsToFloat(uf_remappedPS[2].z));
R126f.z = mul_nonIEEE(R0f.x, R0f.w);
// 1
R123f.z = mul_nonIEEE(R1f.y,intBitsToFloat(uf_remappedPS[3].x)) + -(intBitsToFloat(uf_remappedPS[2].y));
R123f.w = mul_nonIEEE(R1f.x,intBitsToFloat(uf_remappedPS[3].x)) + -(intBitsToFloat(uf_remappedPS[2].x));
// 2
backupReg0f = R126f.x;
R126f.x = mul_nonIEEE(R123f.w,backupReg0f) + intBitsToFloat(uf_remappedPS[2].x);
R127f.y = mul_nonIEEE(R127f.y,backupReg0f) + intBitsToFloat(uf_remappedPS[2].z);
R127f.z = mul_nonIEEE(R123f.z,backupReg0f) + intBitsToFloat(uf_remappedPS[2].y);
// 3
PV1fx = -(R127f.z) + intBitsToFloat(uf_remappedPS[4].y);
PV1fy = -(R126f.x) + intBitsToFloat(uf_remappedPS[4].x);
PV1fw = -(R127f.y) + intBitsToFloat(uf_remappedPS[4].z);
// 4
R2f.x = mul_nonIEEE(PV1fy,R126f.z) + R126f.x;
R2f.y = mul_nonIEEE(PV1fx,R126f.z) + R127f.z;
R2f.z = mul_nonIEEE(PV1fw,R126f.z) + R127f.y;
// export
passPixelColor0 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
}
