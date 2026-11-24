#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 88107bbdc63f5927
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[19];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
TEXTURE_LAYOUT(33, 0, 1) uniform sampler2D textureUnitVS1;
TEXTURE_LAYOUT(34, 0, 2) uniform sampler2D textureUnitVS2;
TEXTURE_LAYOUT(35, 0, 3) uniform sampler2D textureUnitVS3;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;

out vec4 passParameterSem0;
out vec4 passParameterSem1;
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
bool activeMaskStack[2];
bool activeMaskStackC[3];
activeMaskStack[0] = false;
activeMaskStackC[0] = false;
activeMaskStackC[1] = false;
activeMaskStack[0] = true;
activeMaskStackC[0] = true;
activeMaskStackC[1] = true;
R0f = vec4(floatBitsToInt(vec4(ivec4(gl_VertexID, 0, 0, gl_InstanceID))));
attrDecoder.xyzw = uvec4(floatBitsToUint(vec4(attrDataSem0.xyzw)/255.0));
R2f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(int(attrDecoder.w)));
attrDecoder.xyzw = attrDataSem1.xyzw;
if( (attrDecoder.x&0x80u) != 0u ) attrDecoder.x |= 0xFFFFFF00u;
if( (attrDecoder.y&0x80u) != 0u ) attrDecoder.y |= 0xFFFFFF00u;
if( (attrDecoder.z&0x80u) != 0u ) attrDecoder.z |= 0xFFFFFF00u;
if( (attrDecoder.w&0x80u) != 0u ) attrDecoder.w |= 0xFFFFFF00u;
attrDecoder.x = uint(floatBitsToUint(max(float(int(attrDecoder.x))/127.0,-1.0)));
attrDecoder.y = uint(floatBitsToUint(max(float(int(attrDecoder.y))/127.0,-1.0)));
attrDecoder.z = uint(floatBitsToUint(max(float(int(attrDecoder.z))/127.0,-1.0)));
attrDecoder.w = uint(floatBitsToUint(max(float(int(attrDecoder.w))/127.0,-1.0)));
R1f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(int(attrDecoder.z)), intBitsToFloat(int(attrDecoder.w)));
if( activeMaskStackC[1] == true ) {
// 0
PV0fx = R2f.y;
PV0fx *= 2.0;
PV0fy = R2f.x;
PV0fy *= 2.0;
PV0fz = intBitsToFloat(uf_remappedVS[0].w) * intBitsToFloat(0x43c9d6c7);
PV0fw = R2f.z * intBitsToFloat(0x3e65a5dd);
R3f.y = intBitsToFloat(uf_remappedVS[0].x);
// 1
PV1fx = R2f.z + intBitsToFloat(uf_remappedVS[0].w);
R127f.y = PV0fw + PV0fz;
PV1fz = PV0fx + -(0.5);
PV1fw = PV0fy + -(0.5);
R4f.y = intBitsToFloat(uf_remappedVS[0].x);
// 2
PV0fx = mul_nonIEEE(PV1fz, intBitsToFloat(uf_remappedVS[1].y));
PV0fy = mul_nonIEEE(PV1fw, intBitsToFloat(uf_remappedVS[1].x));
PV0fz = mul_nonIEEE(PV1fz, intBitsToFloat(uf_remappedVS[2].y));
PV0fw = mul_nonIEEE(PV1fw, intBitsToFloat(uf_remappedVS[2].x));
R127f.x = PV1fx * intBitsToFloat(0x439d1463);
// 3
R5f.x = intBitsToFloat(uf_remappedVS[2].z) + PV0fw;
R5f.y = intBitsToFloat(uf_remappedVS[2].w) + PV0fz;
R0f.z = intBitsToFloat(uf_remappedVS[1].w) + PV0fx;
R5f.w = intBitsToFloat(uf_remappedVS[1].z) + PV0fy;
PS1f = R127f.x;
PS1f *= 4.0;
// 4
PV0fx = mul_nonIEEE(R5f.w, intBitsToFloat(uf_remappedVS[0].y));
R123f.y = PS1f * intBitsToFloat(0x3e22f983) + 0.5;
PV0fz = mul_nonIEEE(R5f.w, intBitsToFloat(uf_remappedVS[3].x));
PV0fw = mul_nonIEEE(R0f.z, intBitsToFloat(uf_remappedVS[3].y));
R127f.x = R127f.x * intBitsToFloat(0x3e22f983) + 0.5;
// 5
R0f.x = intBitsToFloat(uf_remappedVS[3].z) + PV0fz;
R0f.y = intBitsToFloat(uf_remappedVS[3].w) + PV0fw;
R127f.z = -(PV0fx) + R127f.y;
PV1fw = mul_nonIEEE(R5f.w, intBitsToFloat(uf_remappedVS[4].y));
PS1f = fract(R123f.y);
// 6
PV0fx = mul_nonIEEE(R0f.z, intBitsToFloat(uf_remappedVS[4].z));
PV0fy = mul_nonIEEE(R0f.z, intBitsToFloat(uf_remappedVS[0].z));
PV0fz = R127f.y + -(PV1fw);
R3f.w = fract(R127f.x);
R6f.x = PS1f * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
// 7
PV1fx = -(PV0fx) + PV0fz;
PV1fy = mul_nonIEEE(R5f.w, intBitsToFloat(uf_remappedVS[5].x));
PV1fz = -(PV0fy) + R127f.z;
PV1fw = mul_nonIEEE(R0f.z, intBitsToFloat(uf_remappedVS[5].y));
R4f.x = R2f.x + -(intBitsToFloat(uf_remappedVS[6].z));
// 8
R3f.x = PV1fz * intBitsToFloat(0x3cb6a401);
R6f.y = intBitsToFloat(uf_remappedVS[5].w) + PV1fw;
R4f.z = PV1fx * intBitsToFloat(0x3cb6a401);
R6f.w = intBitsToFloat(uf_remappedVS[5].z) + PV1fy;
R0f.w = R2f.y + -(intBitsToFloat(uf_remappedVS[6].w));
}
if( activeMaskStackC[1] == true ) {
R0f.xy = (texture(textureUnitVS0, vec2(R0f.x,R0f.y)).xy);
R4f.w = (texture(textureUnitVS3, vec2(R3f.x,R3f.y)).x);
R3f.x = (texture(textureUnitVS3, vec2(R4f.z,R4f.y)).x);
R5f.xyz = (texture(textureUnitVS2, vec2(R5f.x,R5f.y)).xyz);
R7f.xy = (texture(textureUnitVS1, vec2(R6f.w,R6f.y)).zw);
}
if( activeMaskStackC[1] == true ) {
// 0
PV0fx = -(intBitsToFloat(uf_remappedVS[0].x)) + 1.0;
PV0fy = mul_nonIEEE(R4f.x, R4f.x);
PV0fz = mul_nonIEEE(R0f.w, R0f.w);
R123f.w = R3f.w * intBitsToFloat(0x40c90fdb) + intBitsToFloat(0xc0490fdb);
R127f.x = R0f.y;
R127f.x *= 2.0;
// 1
PV1fx = PV0fz + PV0fy;
PV1fy = min(intBitsToFloat(uf_remappedVS[0].x), PV0fx);
PV1fy *= 2.0;
PV1fy = clamp(PV1fy, 0.0, 1.0);
R127f.z = R6f.x * intBitsToFloat(0x3e22f983);
PV1fw = intBitsToFloat(uf_remappedVS[0].x) + intBitsToFloat(0xbe99999a);
PV1fw = clamp(PV1fw, 0.0, 1.0);
R127f.y = R123f.w * intBitsToFloat(0x3e22f983);
// 2
backupReg0f = R127f.x;
R127f.x = PV1fy * intBitsToFloat(0x3c23d70a);
PV0fy = R0f.x;
PV0fy *= 2.0;
PV0fz = backupReg0f + -(1.0);
PV0fw = PV1fx * 2.5;
R126f.z = PV1fw * intBitsToFloat(0x3cea0fd3);
// 3
R125f.x = R4f.w * 5.0;
R126f.y = -(PV0fz);
PV1fz = -(PV0fw) + 3.0;
R126f.w = PV0fy + -(1.0);
PS1f = sin((R127f.z)/0.1591549367);
// 4
R126f.x = mul_nonIEEE(R126f.z, PS1f);
PV0fy = max(PV1fz, 1.0);
R4f.z = R5f.w;
R127f.w = R3f.x * 5.0;
PS0f = sin((R127f.y)/0.1591549367);
// 5
PV1fx = mul_nonIEEE(intBitsToFloat(uf_remappedVS[6].y), PV0fy);
R0f.y = R0f.z;
PV1fz = mul_nonIEEE(R126f.y, R126f.y);
PV1fw = mul_nonIEEE(R127f.x, PS0f);
PS1f = mul_nonIEEE(R126f.w, R126f.w);
// 6
R3f.x = R5f.z * 800.0;
R127f.y = PV1fz + PS1f;
R126f.z = R126f.x + PV1fw;
R125f.w = mul_nonIEEE(R2f.w, PV1fx);
R4f.x = R5f.x;
R4f.x *= 2.0;
// 7
PV1fx = R1f.x;
PV1fx *= 2.0;
PV1fy = mul_nonIEEE(R125f.w, R125f.x);
PV1fz = mul_nonIEEE(R125f.w, R127f.w);
PV1fw = R1f.y;
PV1fw *= 2.0;
R3f.y = R5f.y;
R3f.y *= 2.0;
// 8
backupReg0f = R126f.y;
R125f.x = R126f.w + PV1fx;
R126f.y = R126f.z + PV1fz;
R126f.z = R126f.z + PV1fy;
R126f.w = backupReg0f + PV1fw;
R127f.z = R4f.x + -(1.0);
// 9
R127f.x = R125f.w;
R127f.x /= 2.0;
PV1fy = R3f.y + -(1.0);
PV1fz = mul_nonIEEE(R126f.z, intBitsToFloat(uf_remappedVS[7].x));
PV1fw = mul_nonIEEE(R126f.y, intBitsToFloat(uf_remappedVS[7].z));
R126f.x = -(R127f.y) + 1.0;
// 10
R124f.x = PV1fw + PV1fz;
PV0fy = mul_nonIEEE(R126f.z, intBitsToFloat(uf_remappedVS[7].y));
PV0fz = mul_nonIEEE(R126f.y, intBitsToFloat(uf_remappedVS[7].w));
PV0fw = mul_nonIEEE(PV1fy, PV1fy);
PS0f = mul_nonIEEE(R127f.z, R127f.z);
// 11
PV1fx = PV0fz + PV0fy;
PV1fy = mul_nonIEEE(R125f.x, R127f.x);
PV1fz = mul_nonIEEE(R126f.w, R127f.x);
PV1fw = max(R126f.x, intBitsToFloat(0x3e4ccccd));
PS1f = PV0fw + PS0f;
PS1f = clamp(PS1f, 0.0, 1.0);
// 12
R2f.x = R124f.x + PV1fy;
R2f.y = mul_nonIEEE(R125f.w, PV1fw);
R5f.z = PV1fx + PV1fz;
R126f.w = -(PS1f) + 1.0;
R127f.z = -(R7f.y) + 1.0;
// 13
tempf.x = dot(vec4(R2f.x,R2f.y,R5f.z,intBitsToFloat(0x80000000)),vec4(R2f.x,R2f.y,R5f.z,0.0));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
R127f.w = tempf.x;
PS1f = -(intBitsToFloat(uf_remappedVS[6].x)) + intBitsToFloat(0x3cf5c28f);
// 14
backupReg0f = R126f.w;
R124f.x = mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].x),-(R127f.z)) + intBitsToFloat(uf_remappedVS[8].x);
R5f.y = mul_nonIEEE(PS1f,R127f.z) + intBitsToFloat(uf_remappedVS[6].x);
R126f.z = -(R7f.y) * intBitsToFloat(0x3c1374bd) + intBitsToFloat(0x3c1374bd);
R126f.w = mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].y),-(R127f.z)) + intBitsToFloat(uf_remappedVS[8].y);
R0f.w = sqrt(backupReg0f);
// 15
PV1fx = R0f.w * 10.0;
R123f.y = -(R7f.y) * intBitsToFloat(0x3bc49ba6) + intBitsToFloat(0x3bc49ba6);
R123f.z = mul_nonIEEE(intBitsToFloat(uf_remappedVS[8].z),-(R127f.z)) + intBitsToFloat(uf_remappedVS[8].z);
R123f.w = -(R7f.y) * intBitsToFloat(0xbc75c290) + intBitsToFloat(0xbc75c290);
tempResultf = 1.0 / sqrt(R127f.w);
PS1f = tempResultf;
// 16
R0f.x = R124f.x + R126f.z;
PV0fy = mul_nonIEEE(R125f.w, PS1f);
R2f.z = R123f.z + R123f.w;
R2f.w = PV1fx + -6.0;
R2f.w = clamp(R2f.w, 0.0, 1.0);
R1f.y = R126f.w + R123f.y;
// 17
R5f.x = mul_nonIEEE(R1f.w, PV0fy);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R127f.x = R0f.y + -(intBitsToFloat(uf_remappedVS[9].z));
PV0fy = R3f.x + -(intBitsToFloat(uf_remappedVS[9].y));
R126f.z = R4f.z + -(intBitsToFloat(uf_remappedVS[9].x));
// 1
R124f.x = mul_nonIEEE(PV0fy, PV0fy);
PV1fz = mul_nonIEEE(R127f.x, R127f.x);
PV1fw = mul_nonIEEE(R126f.z, R126f.z);
// 2
PV0fy = PV1fw + PV1fz;
// 3
PV1fw = PV0fy + R124f.x;
tempResultf = 1.0 / sqrt(PV0fy);
PS1f = tempResultf;
// 4
PV0fz = mul_nonIEEE(PV1fw, intBitsToFloat(uf_remappedVS[10].w));
PV0fw = mul_nonIEEE(R5f.y, PS1f);
// 5
PV1fy = PV0fz + intBitsToFloat(0x3dcccccd);
PV1fz = mul_nonIEEE(R1f.z, PV0fw);
// 6
PV0fx = max(PV1fy, 0.0);
PV0fy = mul_nonIEEE(R2f.w, PV1fz);
// 7
PV1fx = mul_nonIEEE(-(R127f.x), PV0fy);
PV1fz = mul_nonIEEE(R126f.z, PV0fy);
PV1fw = min(PV0fx, intBitsToFloat(0x3f8ccccd));
// 8
R127f.x = R5f.w + PV1fx;
R126f.y = R0f.z + PV1fz;
PV0fw = mul_nonIEEE(PV1fw, R5f.x);
// 9
PV1fz = mul_nonIEEE(R2f.w, PV0fw);
// 10
PV0fx = mul_nonIEEE(R2f.y, PV1fz);
PV0fy = mul_nonIEEE(R2f.x, PV1fz);
PV0fw = mul_nonIEEE(R5f.z, PV1fz);
// 11
R1f.x = PV0fy + R127f.x;
R0f.y = PV0fx + R3f.x;
R0f.z = PV0fw + R126f.y;
// 12
predResult = (R1f.w == 0.0);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R123f.w = R7f.x * 4.0 + -(1.0);
R123f.w = clamp(R123f.w, 0.0, 1.0);
// 1
R2f.x = mul_nonIEEE(R123f.w, intBitsToFloat(uf_remappedVS[11].x));
R2f.y = mul_nonIEEE(R123f.w, intBitsToFloat(uf_remappedVS[11].y));
R2f.z = mul_nonIEEE(R123f.w, intBitsToFloat(uf_remappedVS[11].z));
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R123f.w = R7f.x * 4.0 + -(1.0);
R123f.w = clamp(R123f.w, 0.0, 1.0);
// 1
R2f.x = mul_nonIEEE(R0f.x, R123f.w);
R2f.y = mul_nonIEEE(R1f.y, R123f.w);
R2f.z = mul_nonIEEE(R2f.z, R123f.w);
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
backupReg0f = R1f.w;
R127f.x = mul_nonIEEE(R4f.x,intBitsToFloat(uf_remappedVS[12].x)) + -(intBitsToFloat(uf_remappedVS[12].x));
R127f.y = mul_nonIEEE(R4f.x,intBitsToFloat(uf_remappedVS[13].x)) + -(intBitsToFloat(uf_remappedVS[13].x));
R1f.w = 1.0;
R2f.w = backupReg0f;
// 1
R5f.x = dot(vec4(R1f.x,R0f.y,R0f.z,R1f.w),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w)));
PV1fy = R5f.x;
PV1fz = R5f.x;
PV1fw = R5f.x;
R126f.x = mul_nonIEEE(R3f.y,intBitsToFloat(uf_remappedVS[12].z)) + -(intBitsToFloat(uf_remappedVS[12].z));
// 2
tempf.x = dot(vec4(R1f.x,R0f.y,R0f.z,R1f.w),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),intBitsToFloat(uf_remappedVS[13].w)));
PV0fx = tempf.x;
R5f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R125f.y = mul_nonIEEE(R3f.y,intBitsToFloat(uf_remappedVS[13].z)) + -(intBitsToFloat(uf_remappedVS[13].z));
// 3
tempf.x = dot(vec4(R1f.x,R0f.y,R0f.z,R1f.w),vec4(intBitsToFloat(uf_remappedVS[14].x),intBitsToFloat(uf_remappedVS[14].y),intBitsToFloat(uf_remappedVS[14].z),intBitsToFloat(uf_remappedVS[14].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
R5f.z = tempf.x;
PV1fw = tempf.x;
R1f.w = 1.0;
// 4
backupReg0f = R1f.w;
R1f.x = dot(vec4(R5f.x,R5f.y,PV1fx,backupReg0f),vec4(intBitsToFloat(uf_remappedVS[15].x),intBitsToFloat(uf_remappedVS[15].y),intBitsToFloat(uf_remappedVS[15].z),intBitsToFloat(uf_remappedVS[15].w)));
PV0fy = R1f.x;
PV0fz = R1f.x;
PV0fw = R1f.x;
// 5
tempf.x = dot(vec4(R5f.x,R5f.y,R5f.z,R1f.w),vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),intBitsToFloat(uf_remappedVS[16].w)));
PV1fx = tempf.x;
R1f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
// 6
tempf.x = dot(vec4(R5f.x,R5f.y,R5f.z,R1f.w),vec4(intBitsToFloat(uf_remappedVS[17].x),intBitsToFloat(uf_remappedVS[17].y),intBitsToFloat(uf_remappedVS[17].z),intBitsToFloat(uf_remappedVS[17].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
R1f.z = tempf.x;
PV0fw = tempf.x;
// 7
tempf.x = dot(vec4(R5f.x,R5f.y,R5f.z,R1f.w),vec4(intBitsToFloat(uf_remappedVS[18].x),intBitsToFloat(uf_remappedVS[18].y),intBitsToFloat(uf_remappedVS[18].z),intBitsToFloat(uf_remappedVS[18].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
PV1fz = tempf.x;
R1f.w = tempf.x;
// 8
R126f.y = mul_nonIEEE(R4f.x,intBitsToFloat(uf_remappedVS[14].x)) + -(intBitsToFloat(uf_remappedVS[14].x));
R123f.z = mul_nonIEEE(R0f.w,intBitsToFloat(uf_remappedVS[12].y)) + R127f.x;
// 9
R0f.x = R126f.x + R123f.z;
R127f.z = mul_nonIEEE(R3f.y,intBitsToFloat(uf_remappedVS[14].z)) + -(intBitsToFloat(uf_remappedVS[14].z));
R123f.w = mul_nonIEEE(R0f.w,intBitsToFloat(uf_remappedVS[13].y)) + R127f.y;
// 10
R123f.x = mul_nonIEEE(R0f.w,intBitsToFloat(uf_remappedVS[14].y)) + R126f.y;
R0f.y = R125f.y + R123f.w;
// 11
R0f.z = R127f.z + R123f.x;
}
// export
SET_POSITION(vec4(R1f.x, R1f.y, R1f.z, R1f.w));
// export
passParameterSem0 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
// export
passParameterSem1 = vec4(R0f.x, R0f.y, R0f.z, R0f.w);
// export
// skipped export to semanticId 255
}
