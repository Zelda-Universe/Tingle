#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 74316e470307edba
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[14];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2DArray textureUnitPS0;
TEXTURE_LAYOUT(1, 1, 1) uniform sampler2DArray textureUnitPS1;
TEXTURE_LAYOUT(2, 1, 2) uniform sampler2DArray textureUnitPS2;
in vec4 passParameterSem0;
layout(location = 0) out vec4 passPixelColor0;
layout(location = 1) out vec4 passPixelColor1;
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
bool activeMaskStack[2];
bool activeMaskStackC[3];
activeMaskStack[0] = false;
activeMaskStackC[0] = false;
activeMaskStackC[1] = false;
activeMaskStack[0] = true;
activeMaskStackC[0] = true;
activeMaskStackC[1] = true;
R0f = passParameterSem0;
if( activeMaskStackC[1] == true ) {
// 0
R1f.x = mul_nonIEEE(R0f.x,intBitsToFloat(uf_remappedPS[0].x)) + intBitsToFloat(uf_remappedPS[0].z);
R1f.y = mul_nonIEEE(R0f.y,intBitsToFloat(uf_remappedPS[0].y)) + intBitsToFloat(uf_remappedPS[0].w);
// 1
PV1fx = intBitsToFloat(uf_remappedPS[1].x);
PV1fy = R1f.x + -(0.5);
PV1fz = R1f.y + -(0.5);
R0f.w = intBitsToFloat(uf_remappedPS[1].y);
// 2
R0f.x = mul_nonIEEE(R1f.x,intBitsToFloat(uf_remappedPS[2].x)) + intBitsToFloat(uf_remappedPS[2].z);
R0f.y = mul_nonIEEE(R1f.y,intBitsToFloat(uf_remappedPS[2].y)) + intBitsToFloat(uf_remappedPS[2].w);
R0f.z = roundEven(PV1fx);
R1f.w = max(PV1fy, -(PV1fy));
R1f.z = max(PV1fz, -(PV1fz));
}
if( activeMaskStackC[1] == true ) {
R4f.w = (textureLod(textureUnitPS1, vec3(R0f.x,R0f.y,R0f.z),R0f.w).x);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R2f.x = mul_nonIEEE(R1f.x,intBitsToFloat(uf_remappedPS[3].x)) + intBitsToFloat(uf_remappedPS[3].z);
PV0fy = max(R1f.w, R1f.z);
R2f.y = mul_nonIEEE(R1f.y,intBitsToFloat(uf_remappedPS[3].y)) + intBitsToFloat(uf_remappedPS[3].w);
// 1
R3f.z = mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].z),PV0fy) + intBitsToFloat(uf_remappedPS[4].w);
R3f.z = clamp(R3f.z, 0.0, 1.0);
// 2
predResult = (R3f.z > intBitsToFloat(0x3c23d70a));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
PV0fy = intBitsToFloat(uf_remappedPS[5].x);
R0f.w = intBitsToFloat(uf_remappedPS[5].y);
// 1
R0f.x = mul_nonIEEE(R2f.x,intBitsToFloat(uf_remappedPS[6].x)) + intBitsToFloat(uf_remappedPS[6].z);
R0f.y = mul_nonIEEE(R2f.y,intBitsToFloat(uf_remappedPS[6].y)) + intBitsToFloat(uf_remappedPS[6].w);
R0f.z = roundEven(PV0fy);
}
if( activeMaskStackC[2] == true ) {
R0f.z = (textureLod(textureUnitPS1, vec3(R0f.x,R0f.y,R0f.z),R0f.w).x);
}
if( activeMaskStackC[2] == true ) {
// 0
PV0fx = -(R4f.w) + R0f.z;
// 1
R4f.w = mul_nonIEEE(PV0fx,R3f.z) + R4f.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
PV0fy = intBitsToFloat(uf_remappedPS[7].x);
PV0fw = intBitsToFloat(uf_remappedPS[8].x);
R3f.w = 1.0;
// 1
R0f.x = mul_nonIEEE(R1f.x,intBitsToFloat(uf_remappedPS[9].x)) + intBitsToFloat(uf_remappedPS[9].z);
R0f.y = mul_nonIEEE(R1f.y,intBitsToFloat(uf_remappedPS[9].y)) + intBitsToFloat(uf_remappedPS[9].w);
R0f.z = roundEven(PV0fy);
R1f.w = roundEven(PV0fw);
// 2
PV0fz = intBitsToFloat(uf_remappedPS[10].x);
// 3
R1f.x = mul_nonIEEE(R1f.x,intBitsToFloat(uf_remappedPS[11].x)) + intBitsToFloat(uf_remappedPS[11].z);
R1f.y = mul_nonIEEE(R1f.y,intBitsToFloat(uf_remappedPS[11].y)) + intBitsToFloat(uf_remappedPS[11].w);
R2f.z = roundEven(PV0fz);
// 4
R2f.x = mul_nonIEEE(R2f.x,intBitsToFloat(uf_remappedPS[12].x)) + intBitsToFloat(uf_remappedPS[12].z);
R2f.y = mul_nonIEEE(R2f.y,intBitsToFloat(uf_remappedPS[12].y)) + intBitsToFloat(uf_remappedPS[12].w);
}
if( activeMaskStackC[1] == true ) {
R0f.xy = (texture(textureUnitPS2, vec3(R0f.x,R0f.y,R0f.z)).xy);
R1f.xyzw = (texture(textureUnitPS0, vec3(R1f.x,R1f.y,R1f.w)).xyzw);
R2f.xyzw = (texture(textureUnitPS0, vec3(R2f.x,R2f.y,R2f.z)).xyzw);
}
if( activeMaskStackC[1] == true ) {
// 0
R127f.x = R0f.x * 2.0 + -(1.0);
PV0fy = -(R1f.x) + R2f.x;
PV0fz = -(R1f.y) + R2f.y;
R127f.w = R0f.y * 2.0 + -(1.0);
PS0f = -(R1f.z) + R2f.z;
// 1
PV1fx = -(R1f.w) + R2f.w;
R123f.y = mul_nonIEEE(PV0fy,R3f.z) + R1f.x;
PV1fz = mul_nonIEEE(R127f.x, R127f.x);
R126f.w = mul_nonIEEE(PV0fz,R3f.z) + R1f.y;
R125f.w = mul_nonIEEE(PS0f,R3f.z) + R1f.z;
// 2
backupReg0f = R123f.y;
backupReg1f = R127f.x;
R127f.x = mul_nonIEEE(R4f.w, intBitsToFloat(uf_remappedPS[13].y));
R123f.y = mul_nonIEEE(R127f.w,R127f.w) + PV1fz;
R127f.z = mul_nonIEEE(PV1fx,R3f.z) + R1f.w;
PV0fw = backupReg0f * 10.0;
R1f.x = backupReg1f * 0.5 + 0.5;
// 3
R126f.x = -(R123f.y) + 1.0;
R126f.x = clamp(R126f.x, 0.0, 1.0);
PV1fy = PV0fw + -4.5;
PV1fy = clamp(PV1fy, 0.0, 1.0);
PV1fz = PV0fw + -6.5;
PV1fz = clamp(PV1fz, 0.0, 1.0);
PV1fw = PV0fw + -8.5;
PV1fw = clamp(PV1fw, 0.0, 1.0);
R1f.y = R127f.w * 0.5 + 0.5;
// 4
tempf.x = dot(vec4(PV1fy,PV1fz,PV1fw,intBitsToFloat(0x80000000)),vec4(intBitsToFloat(0x3e99999a),intBitsToFloat(0x3e99999a),intBitsToFloat(0x3ecccccd),0.0));
PV0fx = tempf.x;
R127f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R1f.z = R127f.x * intBitsToFloat(0x3aa3d70a);
R1f.z = clamp(R1f.z, 0.0, 1.0);
// 5
R3f.x = R126f.w;
R3f.y = R125f.w;
R3f.z = R127f.z;
PS1f = sqrt(R126f.x);
// 6
R123f.x = PS1f * 10.0 + intBitsToFloat(0xc0c66666);
R123f.x = clamp(R123f.x, 0.0, 1.0);
// 7
R1f.w = mul_nonIEEE(R127f.y, R123f.x);
// 8
R3f.x = R3f.x;
R3f.y = R3f.y;
R3f.z = R3f.z;
R3f.w = R3f.w;
// 9
R2f.x = R1f.x;
R2f.y = R1f.y;
R2f.z = R1f.z;
R2f.w = R1f.w;
}
// export
passPixelColor0 = vec4(R2f.x, R2f.y, R2f.z, R2f.w);
passPixelColor1 = vec4(R3f.x, R3f.y, R3f.z, R3f.w);
}
