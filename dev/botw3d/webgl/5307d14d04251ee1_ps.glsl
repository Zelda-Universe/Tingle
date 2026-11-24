#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 5307d14d04251ee1
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[4];
uniform vec2 uf_fragCoordScale;
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
R2f = gl_PointCoord.xyxy;
R0f = passParameterSem1;
R1f = passParameterSem2;
// 0
tempf.x = dot(vec4(R1f.x,R1f.y,R1f.z,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(uf_remappedPS[0].x),intBitsToFloat(uf_remappedPS[0].y),intBitsToFloat(uf_remappedPS[0].z),0.0));
PV0fx = tempf.x;
R127f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
PS0f = abs(R2f.z);
// 1
R123f.x = PS0f * 2.0 + -(1.0);
PV1fy = PV0fx;
PV1fy = clamp(PV1fy, 0.0, 1.0);
R127f.z = mul_nonIEEE(R0f.x, intBitsToFloat(uf_remappedPS[1].w));
PV1fw = abs(R2f.w);
R125f.w = mul_nonIEEE(R0f.y, intBitsToFloat(uf_remappedPS[1].w));
// 2
backupReg0f = R127f.y;
PV0fx = mul_nonIEEE(R123f.x, R123f.x);
R127f.y = mul_nonIEEE(R0f.z, intBitsToFloat(uf_remappedPS[1].w));
R123f.z = PV1fw * 2.0 + -(1.0);
R127f.w = mul_nonIEEE(backupReg0f,intBitsToFloat(uf_remappedPS[1].x)) + intBitsToFloat(uf_remappedPS[1].y);
R127f.w = clamp(R127f.w, 0.0, 1.0);
tempResultf = max(0.0, PV1fy);
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0f = tempResultf;
// 3
R126f.x = -(R127f.y) + intBitsToFloat(uf_remappedPS[2].z);
PV1fy = mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].y), PS0f);
R123f.z = mul_nonIEEE(R123f.z,R123f.z) + PV0fx;
R126f.w = -(intBitsToFloat(uf_remappedPS[2].w)) + 0.0;
// 4
R127f.x = -(R127f.z) + intBitsToFloat(uf_remappedPS[2].x);
PV0fy = -(R123f.z) + 1.0;
PV0fy = clamp(PV0fy, 0.0, 1.0);
R126f.z = -(R125f.w) + intBitsToFloat(uf_remappedPS[2].y);
PS0f = exp2(PV1fy);
// 5
PV1fx = mul_nonIEEE(R127f.w, PV0fy);
R123f.z = mul_nonIEEE(R126f.w,PS0f) + intBitsToFloat(uf_remappedPS[2].w);
// 6
R0f.x = mul_nonIEEE(R127f.x,R123f.z) + R127f.z;
R0f.y = mul_nonIEEE(R126f.z,R123f.z) + R125f.w;
R0f.z = mul_nonIEEE(R126f.x,R123f.z) + R127f.y;
R0f.w = mul_nonIEEE(R0f.w, PV1fx);
// export
passPixelColor0 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
}
