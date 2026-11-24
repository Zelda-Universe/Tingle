#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 682a45e345823e02
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[3];
uniform vec2 uf_fragCoordScale;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem2;
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
R2f = passParameterSem2;
// 0
PV0fx = R0f.x + -(intBitsToFloat(uf_remappedPS[0].x));
R127f.y = max(R2f.y, -(R2f.y));
PV0fz = max(R2f.x, -(R2f.x));
PV0fw = R0f.y + -(intBitsToFloat(uf_remappedPS[0].y));
PV0fw *= 2.0;
R127f.x = 1.0 / intBitsToFloat(uf_remappedPS[1].x);
// 1
R126f.x = mul_nonIEEE(intBitsToFloat(uf_remappedPS[1].y), PV0fw);
PV1fy = -(PV0fz) + 1.0;
PV1fz = 0.0;
R127f.w = mul_nonIEEE(PV0fx, intBitsToFloat(uf_remappedPS[1].x));
R127f.w *= 2.0;
R126f.y = 1.0 / intBitsToFloat(uf_remappedPS[1].y);
// 2
tempf.x = dot(vec4(R127f.w,R126f.x,PV1fz,intBitsToFloat(0x80000000)),vec4(R127f.w,R126f.x,PV1fz,0.0));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = PV1fy * R127f.x;
// 3
PV1fx = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].z), PS0f);
PV1fy = R1f.x;
PV1fy = clamp(PV1fy, 0.0, 1.0);
PV1fz = -(R127f.y) + 1.0;
PS1f = sqrt(PV0fx);
// 4
PV0fx = PV1fz * R126f.y;
PV0fy = PV1fx * 16.0;
PV0fy = clamp(PV0fy, 0.0, 1.0);
R126f.w = -(PV1fy) + 1.0;
PS0f = 1.0 / PS1f;
// 5
PV1fx = R127f.w * PS0f;
R126f.y = min(PV0fy, 1.0);
R127f.z = R126f.x * PS0f;
PV1fw = mul_nonIEEE(intBitsToFloat(uf_remappedPS[0].w), PV0fx);
// 6
PV0fx = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedPS[2].x));
PV0fy = mul_nonIEEE(PV1fx, intBitsToFloat(uf_remappedPS[2].y));
PV0fz = PV1fw * 16.0;
PV0fz = clamp(PV0fz, 0.0, 1.0);
// 7
R126f.x = mul_nonIEEE(R127f.z,intBitsToFloat(uf_remappedPS[2].z)) + PV0fx;
PV1fy = min(R126f.y, PV0fz);
R127f.w = mul_nonIEEE(R127f.z,intBitsToFloat(uf_remappedPS[2].w)) + PV0fy;
// 8
PV0fz = mul_nonIEEE(PV1fy, R126f.w);
// 9
PV1fx = mul_nonIEEE(R127f.w, PV0fz);
PV1fy = mul_nonIEEE(R126f.x, PV0fz);
// 10
R1f.x = PV1fy;
R1f.x = clamp(R1f.x, 0.0, 1.0);
R1f.y = PV1fx;
R1f.y = clamp(R1f.y, 0.0, 1.0);
PV0fz = max(-(PV1fx), 0.0);
PV0fw = max(-(PV1fy), 0.0);
// 11
PV1fx = min(PV0fz, 1.0);
PV1fy = min(PV0fw, 1.0);
// 12
R1f.z = PV1fy;
R1f.w = PV1fx;
// export
passPixelColor0 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
}
