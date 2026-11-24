#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader f8858ec3a8c1b4fd
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[17];
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;

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
vec4 R124f = vec4(0.0);
vec4 R125f = vec4(0.0);
vec4 R126f = vec4(0.0);
vec4 R127f = vec4(0.0);
uvec4 attrDecoder;
float backupReg0f, backupReg1f, backupReg2f, backupReg3f, backupReg4f;
float PV0fx = 0.0, PV0fy = 0.0, PV0fz = 0.0, PV0fw = 0.0, PV1fx = 0.0, PV1fy = 0.0, PV1fz = 0.0, PV1fw = 0.0;
float PS0f = 0.0, PS1f = 0.0;
vec4 tempf = vec4(0.0);
float tempResultf;
int tempResulti;
ivec4 ARi = ivec4(0);
bool predResult = true;
R0f = vec4(floatBitsToInt(vec4(ivec4(gl_VertexID, 0, 0, gl_InstanceID))));
attrDecoder.x = uint(floatBitsToUint(float(attrDataSem0.x)/255.0));
attrDecoder.yzw = uvec3(uvec3(0));
R1f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(0), intBitsToFloat(0), intBitsToFloat(0x3f800000));
// 0
PV0fx = intBitsToFloat(uf_remappedVS[0].y) * 30.0;
R2f.y = R1f.x * intBitsToFloat(0x40c90fd8);
R5f.z = R1f.x;
R5f.z *= 2.0;
PV0fw = intBitsToFloat(uf_remappedVS[0].y) * 30.0;
R6f.z = 0.0;
// 1
PV1fx = PV0fx + 1.0;
R127f.y = 1.0 * intBitsToFloat(uf_remappedVS[0].z);
PV1fz = PV0fw + 0.0;
PV1fw = intBitsToFloat(uf_remappedVS[0].y) * 30.0;
R127f.x = R2f.y;
R127f.x /= 2.0;
// 2
PV0fx = intBitsToFloat(uf_remappedVS[0].y) * 30.0;
PV0fy = mul_nonIEEE(R2f.y, PV1fz);
PV0fz = PV1fw + 2.0;
PV0fw = mul_nonIEEE(R2f.y, PV1fx);
R127f.z = 2.0 * intBitsToFloat(uf_remappedVS[0].z);
// 3
PV1fx = PV0fy + intBitsToFloat(uf_remappedVS[1].y);
R126f.y = mul_nonIEEE(R2f.y, PV0fz);
PV1fz = PV0fw + intBitsToFloat(uf_remappedVS[2].y);
PV1fw = PV0fx + 3.0;
R3f.w = R127f.x * intBitsToFloat(0x3e22f983) + 0.5;
// 4
PV0fx = intBitsToFloat(uf_remappedVS[0].y) * 30.0;
PV0fy = R127f.z + PV1fz;
R127f.z = 3.0 * intBitsToFloat(uf_remappedVS[0].z);
PV0fw = R127f.y + PV1fx;
R127f.w = mul_nonIEEE(R2f.y, PV1fw);
// 5
PV1fx = R126f.y + intBitsToFloat(uf_remappedVS[3].y);
PV1fy = PV0fx + 4.0;
R123f.z = PV0fw * intBitsToFloat(0x3e22f983) + 0.5;
R126f.w = intBitsToFloat(uf_remappedVS[0].y) * 30.0;
R127f.x = PV0fy * intBitsToFloat(0x3e22f983) + 0.5;
// 6
PV0fx = R127f.w + intBitsToFloat(uf_remappedVS[4].y);
PV0fy = fract(R123f.z);
PV0fz = 4.0 * intBitsToFloat(uf_remappedVS[0].z);
R127f.w = R127f.z + PV1fx;
R126f.y = mul_nonIEEE(R2f.y, PV1fy);
// 7
PV1fx = R126f.w + 5.0;
R127f.y = PV0fz + PV0fx;
R127f.z = PV0fy * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PV1fw = intBitsToFloat(uf_remappedVS[0].y) * 30.0;
R126f.w = fract(R127f.x);
// 8
PV0fx = 5.0 * intBitsToFloat(uf_remappedVS[0].z);
PV0fy = R126f.y + intBitsToFloat(uf_remappedVS[5].y);
R123f.z = R127f.w * intBitsToFloat(0x3e22f983) + 0.5;
R127f.w = mul_nonIEEE(R2f.y, PV1fx);
R126f.z = PV1fw + 6.0;
// 9
R127f.x = R127f.z * intBitsToFloat(0x3e22f983);
PV1fy = intBitsToFloat(uf_remappedVS[0].y) * 30.0;
R127f.z = R126f.w * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R126f.w = PV0fx + PV0fy;
R126f.y = fract(R123f.z);
// 10
R126f.x = R127f.y * intBitsToFloat(0x3e22f983) + 0.5;
PV0fy = R127f.w + intBitsToFloat(uf_remappedVS[6].y);
PV0fz = 6.0 * intBitsToFloat(uf_remappedVS[0].z);
R127f.w = mul_nonIEEE(R2f.y, R126f.z);
R125f.x = PV1fy + 7.0;
// 11
backupReg0f = R126f.y;
backupReg1f = R127f.x;
R127f.x = R127f.z * intBitsToFloat(0x3e22f983);
R126f.y = PV0fz + PV0fy;
R126f.z = backupReg0f * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R125f.w = intBitsToFloat(uf_remappedVS[0].y) * 30.0;
R127f.z = sin((backupReg1f)/0.1591549367);
// 12
PV0fx = 7.0 * intBitsToFloat(uf_remappedVS[0].z);
PV0fy = R127f.w + intBitsToFloat(uf_remappedVS[7].y);
R125f.z = R126f.w * intBitsToFloat(0x3e22f983) + 0.5;
R127f.w = fract(R126f.x);
R126f.w = mul_nonIEEE(R2f.y, R125f.x);
// 13
backupReg0f = R127f.x;
R127f.x = mul_nonIEEE(intBitsToFloat(uf_remappedVS[1].x), R127f.z);
R127f.y = intBitsToFloat(uf_remappedVS[0].y) * 30.0;
R127f.z = R125f.w + 8.0;
R125f.w = PV0fx + PV0fy;
R126f.x = sin((backupReg0f)/0.1591549367);
// 14
R125f.x = R126f.y * intBitsToFloat(0x3e22f983) + 0.5;
R126f.y = fract(R125f.z);
R125f.z = R127f.w * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R127f.w = R126f.z * intBitsToFloat(0x3e22f983);
R126f.z = 8.0 * intBitsToFloat(uf_remappedVS[0].z);
// 15
backupReg0f = R127f.x;
R127f.x = R127f.y + 9.0;
R127f.y = mul_nonIEEE(R2f.y, R127f.z);
PV1fz = R126f.w + intBitsToFloat(uf_remappedVS[8].y);
R126f.w = intBitsToFloat(uf_remappedVS[0].y) * 30.0;
R124f.x = backupReg0f * intBitsToFloat(0x3e19999a);
// 16
backupReg0f = R127f.w;
R1f.x = R125f.z * intBitsToFloat(0x3e22f983);
R0f.y = R126f.z + PV1fz;
R1f.z = R126f.y * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R127f.w = mul_nonIEEE(intBitsToFloat(uf_remappedVS[2].x), R126f.x);
R0f.z = sin((backupReg0f)/0.1591549367);
// 17
PV1fx = 9.0 * intBitsToFloat(uf_remappedVS[0].z);
PV1fy = R127f.y + intBitsToFloat(uf_remappedVS[9].y);
R2f.z = R125f.w * intBitsToFloat(0x3e22f983) + 0.5;
R0f.w = fract(R125f.x);
R1f.w = mul_nonIEEE(R2f.y, R127f.x);
// 18
R0f.x = 0.0 + R124f.x;
R1f.y = intBitsToFloat(uf_remappedVS[0].y) * 30.0;
R3f.z = R126f.w + 10.0;
R2f.w = PV1fx + PV1fy;
R4f.z = R127f.w * intBitsToFloat(0x3e19999a);
// 0
R127f.x = fract(R2f.z);
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedVS[3].x), R0f.z);
R126f.z = R0f.w * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R127f.w = R1f.z * intBitsToFloat(0x3e22f983);
R124f.x = sin((R1f.x)/0.1591549367);
// 1
R125f.x = R0f.y * intBitsToFloat(0x3e22f983) + 0.5;
PV1fy = R1f.w + intBitsToFloat(uf_remappedVS[10].y);
PV1fz = 10.0 * intBitsToFloat(uf_remappedVS[0].z);
R126f.w = mul_nonIEEE(R2f.y, R3f.z);
R126f.x = R1f.y + 11.0;
// 2
backupReg0f = R127f.y;
backupReg1f = R124f.x;
R124f.x = PV1fz + PV1fy;
R127f.y = R0f.x + R4f.z;
R125f.z = backupReg0f * intBitsToFloat(0x3e19999a);
R125f.w = intBitsToFloat(uf_remappedVS[0].y) * 30.0;
R124f.w = mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].x), backupReg1f);
// 3
backupReg0f = R127f.w;
R127f.x = R127f.x * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R126f.y = R126f.z * intBitsToFloat(0x3e22f983);
R127f.z = R2f.w * intBitsToFloat(0x3e22f983) + 0.5;
R127f.w = fract(R125f.x);
R126f.z = sin((backupReg0f)/0.1591549367);
// 4
backupReg0f = R125f.z;
PV0fx = 11.0 * intBitsToFloat(uf_remappedVS[0].z);
PV0fy = R126f.w + intBitsToFloat(uf_remappedVS[11].y);
R125f.z = R125f.w + 12.0;
R126f.w = mul_nonIEEE(R2f.y, R126f.x);
R125f.w = R127f.y + backupReg0f;
// 5
backupReg0f = R126f.y;
R126f.x = mul_nonIEEE(intBitsToFloat(uf_remappedVS[5].x), R126f.z);
R126f.y = intBitsToFloat(uf_remappedVS[0].y) * 30.0;
R126f.z = R124f.w * intBitsToFloat(0x3e19999a);
R124f.w = PV0fx + PV0fy;
R125f.x = sin((backupReg0f)/0.1591549367);
// 6
backupReg0f = R127f.x;
R127f.x = R124f.x * intBitsToFloat(0x3e22f983) + 0.5;
R127f.y = fract(R127f.z);
R124f.z = R127f.w * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R127f.w = backupReg0f * intBitsToFloat(0x3e22f983);
R127f.z = 12.0 * intBitsToFloat(uf_remappedVS[0].z);
// 7
R124f.x = R126f.y + 13.0;
R126f.y = mul_nonIEEE(R2f.y, R125f.z);
PV1fz = R126f.w + intBitsToFloat(uf_remappedVS[12].y);
R126f.w = intBitsToFloat(uf_remappedVS[0].y) * 30.0;
R125f.y = R125f.w + R126f.z;
// 8
backupReg0f = R127f.w;
R126f.x = R126f.x * intBitsToFloat(0x3e19999a);
R124f.y = R127f.z + PV1fz;
R124f.z = R124f.z * intBitsToFloat(0x3e22f983);
R127f.w = mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].x), R125f.x);
R127f.z = sin((backupReg0f)/0.1591549367);
// 9
backupReg0f = R127f.x;
R127f.x = R127f.y * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PV1fy = 13.0 * intBitsToFloat(uf_remappedVS[0].z);
R126f.z = R124f.w * intBitsToFloat(0x3e22f983) + 0.5;
R124f.w = fract(backupReg0f);
PS1f = R126f.y + intBitsToFloat(uf_remappedVS[13].y);
// 10
R126f.x = R125f.y + R126f.x;
R125f.y = intBitsToFloat(uf_remappedVS[0].y) * 30.0;
R125f.z = R126f.w + 14.0;
R126f.w = mul_nonIEEE(R2f.y, R124f.x);
R125f.w = PV1fy + PS1f;
// 11
R124f.x = R124f.w * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedVS[7].x), R127f.z);
R127f.z = R127f.w * intBitsToFloat(0x3e19999a);
R127f.w = R127f.x * intBitsToFloat(0x3e22f983);
R127f.x = sin((R124f.z)/0.1591549367);
// 12
R125f.x = R124f.y * intBitsToFloat(0x3e22f983) + 0.5;
R124f.y = fract(R126f.z);
PV0fz = 14.0 * intBitsToFloat(uf_remappedVS[0].z);
PV0fw = R126f.w + intBitsToFloat(uf_remappedVS[14].y);
R126f.y = mul_nonIEEE(R2f.y, R125f.z);
// 13
backupReg0f = R127f.y;
PV1fx = R125f.y + 15.0;
R127f.y = R126f.x + R127f.z;
R124f.z = PV0fz + PV0fw;
R126f.w = backupReg0f * intBitsToFloat(0x3e19999a);
R124f.w = mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x), R127f.x);
// 14
backupReg0f = R125f.x;
backupReg1f = R127f.w;
R125f.x = R124f.y * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R124f.y = R124f.x * intBitsToFloat(0x3e22f983);
R126f.z = fract(backupReg0f);
R127f.w = mul_nonIEEE(R2f.y, PV1fx);
R127f.z = sin((backupReg1f)/0.1591549367);
// 15
PV1fx = 15.0 * intBitsToFloat(uf_remappedVS[0].z);
PV1fy = R126f.y + intBitsToFloat(uf_remappedVS[15].y);
R125f.z = R125f.w * intBitsToFloat(0x3e22f983) + 0.5;
R126f.w = R127f.y + R126f.w;
R4f.z = R124f.w * intBitsToFloat(0x3e19999a);
// 16
backupReg0f = R124f.y;
R124f.x = R125f.x * intBitsToFloat(0x3e22f983);
R124f.y = mul_nonIEEE(intBitsToFloat(uf_remappedVS[9].x), R127f.z);
R127f.z = R126f.z * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R2f.w = PV1fx + PV1fy;
R125f.x = sin((backupReg0f)/0.1591549367);
// 17
R0f.x = R124f.z * intBitsToFloat(0x3e22f983) + 0.5;
R2f.y = fract(R125f.z);
PV1fz = 16.0 * intBitsToFloat(uf_remappedVS[0].z);
PV1fw = R127f.w + intBitsToFloat(uf_remappedVS[16].y);
R0f.y = R126f.w + R4f.z;
// 18
R1f.x = R124f.y * intBitsToFloat(0x3e19999a);
R1f.y = PV1fz + PV1fw;
R3f.z = R127f.z * intBitsToFloat(0x3e22f983);
R1f.w = mul_nonIEEE(intBitsToFloat(uf_remappedVS[10].x), R125f.x);
R4f.z = sin((R124f.x)/0.1591549367);
// 0
R123f.x = R2f.y * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R124f.y = R0f.y + R1f.x;
R123f.z = R2f.w * intBitsToFloat(0x3e22f983) + 0.5;
PV0fw = fract(R0f.x);
R127f.z = R1f.w * intBitsToFloat(0x3e19999a);
// 1
PV1fx = fract(R123f.z);
R127f.y = mul_nonIEEE(intBitsToFloat(uf_remappedVS[11].x), R4f.z);
R123f.z = PV0fw * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PV1fw = R123f.x * intBitsToFloat(0x3e22f983);
R125f.x = sin((R3f.z)/0.1591549367);
// 2
R123f.x = R1f.y * intBitsToFloat(0x3e22f983) + 0.5;
PV0fy = R123f.z * intBitsToFloat(0x3e22f983);
R123f.z = PV1fx * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R127f.w = R124f.y + R127f.z;
R127f.z = sin((PV1fw)/0.1591549367);
// 3
PV1fx = R127f.y * intBitsToFloat(0x3e19999a);
PV1fy = mul_nonIEEE(intBitsToFloat(uf_remappedVS[12].x), R125f.x);
PV1fz = R123f.z * intBitsToFloat(0x3e22f983);
PV1fw = fract(R123f.x);
R125f.x = sin((PV0fy)/0.1591549367);
// 4
PV0fx = PV1fy * intBitsToFloat(0x3e19999a);
PV0fy = mul_nonIEEE(intBitsToFloat(uf_remappedVS[13].x), R127f.z);
R123f.z = PV1fw * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PV0fw = R127f.w + PV1fx;
PS0f = sin((PV1fz)/0.1591549367);
// 5
PV1fx = PV0fw + PV0fx;
PV1fy = R123f.z * intBitsToFloat(0x3e22f983);
PV1fz = PV0fy * intBitsToFloat(0x3e19999a);
PV1fw = mul_nonIEEE(intBitsToFloat(uf_remappedVS[14].x), R125f.x);
PS1f = mul_nonIEEE(intBitsToFloat(uf_remappedVS[15].x), PS0f);
// 6
R125f.x = PS1f * intBitsToFloat(0x3e19999a);
PV0fy = fract(R3f.w);
PV0fz = PV1fw * intBitsToFloat(0x3e19999a);
PV0fw = PV1fx + PV1fz;
PS0f = sin((PV1fy)/0.1591549367);
// 7
R123f.x = PV0fy * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
PV1fy = PV0fw + PV0fz;
R127f.z = intBitsToFloat(uf_remappedVS[0].y) + intBitsToFloat(0x3d4ccccd);
PV1fw = mul_nonIEEE(intBitsToFloat(uf_remappedVS[16].x), PS0f);
R6f.x = R5f.z + -(1.0);
// 8
PV0fx = R123f.x * intBitsToFloat(0x3e22f983);
PV0fz = PV1fw * intBitsToFloat(0x3e19999a);
PV0fw = PV1fy + R125f.x;
R6f.w = 1.0;
// 9
PV1fy = PV0fw + PV0fz;
R127f.w = sin((PV0fx)/0.1591549367);
// 10
PV0fx = mul_nonIEEE(PV1fy, R127f.z);
// 11
R6f.y = mul_nonIEEE(R127f.w, PV0fx);
// export
SET_POSITION(vec4(R6f.x, R6f.y, R6f.z, R6f.w));
// export
// skipped export to semanticId 255
}
