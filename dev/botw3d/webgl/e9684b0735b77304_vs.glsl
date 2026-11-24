#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader e9684b0735b77304
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[19];
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2DArray textureUnitVS0;
TEXTURE_LAYOUT(33, 0, 1) uniform sampler2DArray textureUnitVS1;
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;

out vec4 passParameterSem1;
out vec4 passParameterSem4;
out vec4 passParameterSem0;
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
vec4 R122f = vec4(0.0);
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
attrDecoder.xy = attrDataSem0.xy;
attrDecoder.xy = uvec2((attrDecoder.xy>>24)|((attrDecoder.xy>>8)&0xFF00u)|((attrDecoder.xy<<8)&0xFF0000u)|((attrDecoder.xy<<24)));
attrDecoder.z = uint(0);
attrDecoder.w = uint(0);
R1f = vec4(intBitsToFloat(int(attrDecoder.x)), intBitsToFloat(int(attrDecoder.y)), intBitsToFloat(0), intBitsToFloat(0x3f800000));
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
PV0fx = mul_nonIEEE(R1f.y, intBitsToFloat(uf_remappedVS[0].y));
PV0fy = mul_nonIEEE(R1f.x, intBitsToFloat(uf_remappedVS[0].x));
R1f.w = 1.0;
R2f.x = 1.0;
// 1
R3f.x = intBitsToFloat(uf_remappedVS[0].z) + PV0fy;
R3f.y = intBitsToFloat(uf_remappedVS[0].w) + PV0fx;
// 2
PV0fz = mul_nonIEEE(R3f.y, intBitsToFloat(uf_remappedVS[1].y));
PV0fw = mul_nonIEEE(R3f.x, intBitsToFloat(uf_remappedVS[1].x));
// 3
R0f.x = intBitsToFloat(uf_remappedVS[1].z) + PV0fw;
R0f.y = intBitsToFloat(uf_remappedVS[1].w) + PV0fz;
// 4
predResult = (R1f.x > 0.5);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
PV0fx = mul_nonIEEE(R0f.y, intBitsToFloat(uf_remappedVS[2].x));
PV0fz = mul_nonIEEE(R0f.x, intBitsToFloat(uf_remappedVS[2].x));
// 1
PV1fy = intBitsToFloat(uf_remappedVS[2].w) + PV0fx;
PV1fw = intBitsToFloat(uf_remappedVS[2].z) + PV0fz;
// 2
R4f.x = PV1fw;
R4f.z = PV1fy;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
PV0fx = R3f.y + -(0.5);
PV0fy = R3f.x + -(0.5);
PV0fz = mul_nonIEEE(R3f.x, intBitsToFloat(uf_remappedVS[3].x));
PV0fw = mul_nonIEEE(R3f.y, intBitsToFloat(uf_remappedVS[3].x));
// 1
PV1fx = intBitsToFloat(uf_remappedVS[3].z) + PV0fz;
PV1fy = intBitsToFloat(uf_remappedVS[3].w) + PV0fw;
PV1fz = max(PV0fx, -(PV0fx));
PV1fw = max(PV0fy, -(PV0fy));
// 2
R4f.x = PV1fx;
PV0fy = max(PV1fw, PV1fz);
R4f.z = PV1fy;
// 3
PV1fx = mul_nonIEEE(intBitsToFloat(uf_remappedVS[4].z), PV0fy);
// 4
R1f.w = intBitsToFloat(uf_remappedVS[4].w) + PV1fx;
R1f.w = clamp(R1f.w, 0.0, 1.0);
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
PV0fx = intBitsToFloat(uf_remappedVS[5].x);
PV0fy = mul_nonIEEE(R3f.y, intBitsToFloat(uf_remappedVS[6].y));
PV0fz = mul_nonIEEE(R3f.x, intBitsToFloat(uf_remappedVS[6].x));
R3f.w = R0f.y;
R3f.z = R0f.x;
// 1
R0f.x = intBitsToFloat(uf_remappedVS[6].z) + PV0fz;
R0f.y = intBitsToFloat(uf_remappedVS[6].w) + PV0fy;
R0f.z = roundEven(PV0fx);
R0f.w = intBitsToFloat(uf_remappedVS[5].y);
}
if( activeMaskStackC[1] == true ) {
R2f.w = (textureLod(textureUnitVS0, vec3(R0f.x,R0f.y,R0f.z),R0f.w).x);
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (R1f.w > intBitsToFloat(0x3c23d70a));
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
PV0fy = intBitsToFloat(uf_remappedVS[7].x);
PV0fz = mul_nonIEEE(R3f.w, intBitsToFloat(uf_remappedVS[8].y));
PV0fw = mul_nonIEEE(R3f.z, intBitsToFloat(uf_remappedVS[8].x));
// 1
R0f.x = intBitsToFloat(uf_remappedVS[8].z) + PV0fw;
R0f.y = intBitsToFloat(uf_remappedVS[8].w) + PV0fz;
R0f.z = roundEven(PV0fy);
R0f.w = intBitsToFloat(uf_remappedVS[7].y);
}
if( activeMaskStackC[2] == true ) {
R0f.z = (textureLod(textureUnitVS0, vec3(R0f.x,R0f.y,R0f.z),R0f.w).x);
}
if( activeMaskStackC[2] == true ) {
// 0
PV0fx = -(R2f.w) + R0f.z;
// 1
R2f.w = mul_nonIEEE(PV0fx,R1f.w) + R2f.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R4f.y = mul_nonIEEE(R2f.w, intBitsToFloat(uf_remappedVS[9].y));
PV0fz = intBitsToFloat(uf_remappedVS[10].x);
R0f.w = 1.0;
// 1
R0f.x = mul_nonIEEE(R3f.x,intBitsToFloat(uf_remappedVS[11].x)) + intBitsToFloat(uf_remappedVS[11].z);
R0f.y = mul_nonIEEE(R3f.y,intBitsToFloat(uf_remappedVS[11].y)) + intBitsToFloat(uf_remappedVS[11].w);
R0f.z = roundEven(PV0fz);
}
if( activeMaskStackC[1] == true ) {
R0f.xy = (texture(textureUnitVS1, vec3(R0f.x,R0f.y,R0f.z)).xy);
}
// export
passParameterSem1 = vec4(R3f.x, R3f.y, R3f.z, R3f.w);
// export
// skipped export to semanticId 255
// export
passParameterSem4 = vec4(R4f.x, R4f.y, R4f.z, R4f.w);
if( activeMaskStackC[1] == true ) {
// 0
R2f.x = dot(vec4(R4f.x,R4f.y,R4f.z,R0f.w),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w)));
PV0fy = R2f.x;
PV0fz = R2f.x;
PV0fw = R2f.x;
R127f.y = R0f.x * 2.0 + -(1.0);
// 1
tempf.x = dot(vec4(R4f.x,R4f.y,R4f.z,R0f.w),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),intBitsToFloat(uf_remappedVS[13].w)));
PV1fx = tempf.x;
R2f.y = tempf.x;
PV1fz = tempf.x;
PV1fw = tempf.x;
R127f.w = R0f.y * 2.0 + -(1.0);
// 2
tempf.x = dot(vec4(R4f.x,R4f.y,R4f.z,R0f.w),vec4(intBitsToFloat(uf_remappedVS[14].x),intBitsToFloat(uf_remappedVS[14].y),intBitsToFloat(uf_remappedVS[14].z),intBitsToFloat(uf_remappedVS[14].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
R2f.z = tempf.x;
PV0fw = tempf.x;
R0f.w = 1.0;
// 3
backupReg0f = R0f.w;
R0f.x = dot(vec4(R2f.x,R2f.y,PV0fx,backupReg0f),vec4(intBitsToFloat(uf_remappedVS[15].x),intBitsToFloat(uf_remappedVS[15].y),intBitsToFloat(uf_remappedVS[15].z),intBitsToFloat(uf_remappedVS[15].w)));
PV1fy = R0f.x;
PV1fz = R0f.x;
PV1fw = R0f.x;
PS1f = mul_nonIEEE(R127f.y, R127f.y);
// 4
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,R0f.w),vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),intBitsToFloat(uf_remappedVS[16].w)));
PV0fx = tempf.x;
R0f.y = tempf.x;
PV0fz = tempf.x;
PV0fw = tempf.x;
R122f.x = mul_nonIEEE(R127f.w,R127f.w) + PS1f;
// 5
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,R0f.w),vec4(intBitsToFloat(uf_remappedVS[17].x),intBitsToFloat(uf_remappedVS[17].y),intBitsToFloat(uf_remappedVS[17].z),intBitsToFloat(uf_remappedVS[17].w)));
PV1fx = tempf.x;
PV1fy = tempf.x;
R0f.z = tempf.x;
PV1fw = tempf.x;
R127f.z = -(R122f.x) + 1.0;
R127f.z = clamp(R127f.z, 0.0, 1.0);
// 6
tempf.x = dot(vec4(R2f.x,R2f.y,R2f.z,R0f.w),vec4(intBitsToFloat(uf_remappedVS[18].x),intBitsToFloat(uf_remappedVS[18].y),intBitsToFloat(uf_remappedVS[18].z),intBitsToFloat(uf_remappedVS[18].w)));
PV0fx = tempf.x;
PV0fy = tempf.x;
PV0fz = tempf.x;
R0f.w = tempf.x;
R1f.x = R127f.y;
// 7
R1f.z = R127f.w;
PS1f = sqrt(R127f.z);
// 8
R1f.y = PS1f * 0.125;
}
// export
SET_POSITION(vec4(R0f.x, R0f.y, R0f.z, R0f.w));
// export
passParameterSem0 = vec4(R1f.x, R1f.y, R1f.z, R1f.w);
// export
// skipped export to semanticId 255
}
