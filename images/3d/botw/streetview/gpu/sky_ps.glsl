#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 4e21d093c6136a15
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[3];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
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
vec4 R123f = vec4(0.0);
vec4 R127f = vec4(0.0);
float backupReg0f, backupReg1f, backupReg2f, backupReg3f, backupReg4f;
float PV0fx = 0.0, PV0fy = 0.0, PV0fz = 0.0, PV0fw = 0.0, PV1fx = 0.0, PV1fy = 0.0, PV1fz = 0.0, PV1fw = 0.0;
float PS0f = 0.0, PS1f = 0.0;
vec4 tempf = vec4(0.0);
float tempResultf;
int tempResulti;
ivec4 ARi = ivec4(0);
bool predResult = true;
R0f = passParameterSem6;
// 0
tempf.x = dot(vec4(R0f.x,R0f.y,R0f.z,intBitsToFloat(0x80000000)),vec4(R0f.x,R0f.y,R0f.z,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R1f.w = 1.0;
// 1
tempResultf = 1.0 / sqrt(PV0fx);
PS1f = tempResultf;
// 2
PV0fx = mul_nonIEEE(R0f.x, PS1f);
PV0fy = mul_nonIEEE(R0f.y, PS1f);
PV0fz = mul_nonIEEE(R0f.z, PS1f);
// 3
tempf.x = dot(vec4(intBitsToFloat(uf_remappedPS[0].x),intBitsToFloat(uf_remappedPS[0].y),intBitsToFloat(uf_remappedPS[0].z),intBitsToFloat(0x80000000)),vec4(PV0fx,PV0fy,PV0fz,0.0));
tempf.x /= 2.0;
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
PS1f = PV0fy;
PS1f /= 2.0;
// 4
R0f.y = PS1f + 0.5;
R127f.w = PV1fx + 0.5;
// 5
PV1fz = -(R127f.w) + 1.0;
R123f.w = R127f.w * intBitsToFloat(0xbc996e30) + intBitsToFloat(0x3d981626);
// 6
R123f.z = mul_nonIEEE(R127f.w,R123f.w) + intBitsToFloat(0xbe593484);
PS0f = sqrt(PV1fz);
// 7
PV1fx = PS0f * intBitsToFloat(0x3f22f983);
R123f.y = mul_nonIEEE(R127f.w,R123f.z) + intBitsToFloat(0x3fc90da4);
// 8
R0f.x = mul_nonIEEE(PV1fx,-(R123f.y)) + 1.0;
R0f.xyzw = (texture(textureUnitPS0, vec2(R0f.x,R0f.y)).xyzw);
// 0
R127f.x = mul_nonIEEE(R0f.z,intBitsToFloat(uf_remappedPS[1].x)) + -(intBitsToFloat(uf_remappedPS[2].z));
R127f.w = R0f.w + intBitsToFloat(uf_remappedPS[2].w);
R127f.w = clamp(R127f.w, 0.0, 1.0);
// 1
R123f.y = mul_nonIEEE(R0f.y,intBitsToFloat(uf_remappedPS[1].x)) + -(intBitsToFloat(uf_remappedPS[2].y));
R123f.z = mul_nonIEEE(R0f.x,intBitsToFloat(uf_remappedPS[1].x)) + -(intBitsToFloat(uf_remappedPS[2].x));
// 2
R1f.x = mul_nonIEEE(R123f.z,R127f.w) + intBitsToFloat(uf_remappedPS[2].x);
R1f.y = mul_nonIEEE(R123f.y,R127f.w) + intBitsToFloat(uf_remappedPS[2].y);
R1f.z = mul_nonIEEE(R127f.x,R127f.w) + intBitsToFloat(uf_remappedPS[2].z);
// export
passPixelColor0 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
}
