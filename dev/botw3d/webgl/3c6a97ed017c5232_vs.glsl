#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 3c6a97ed017c5232
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[10];
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;

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
ivec4 R0i = ivec4(0);
ivec4 R1i = ivec4(0);
uvec4 attrDecoder;
int backupReg0i, backupReg1i, backupReg2i, backupReg3i, backupReg4i;
int PV0ix = 0, PV0iy = 0, PV0iz = 0, PV0iw = 0, PV1ix = 0, PV1iy = 0, PV1iz = 0, PV1iw = 0;
int PS0i = 0, PS1i = 0;
ivec4 tempi = ivec4(0);
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
R0i = ivec4(gl_VertexID, 0, 0, gl_InstanceID);
attrDecoder.xyz = attrDataSem0.xyz;
attrDecoder.xyz = uvec3((attrDecoder.xyz>>24)|((attrDecoder.xyz>>8)&0xFF00u)|((attrDecoder.xyz<<8)&0xFF0000u)|((attrDecoder.xyz<<24)));
attrDecoder.w = uint(0);
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), 0x3f800000);
// skipped unused attribute for r2
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
PV0ix = ((-(0.5) >= intBitsToFloat(R1i.y))?-1:0);
PV0iz = ((intBitsToFloat(R1i.y) >= 0.5)?-1:0);
R0i.w = 0x3f800000;
// 1
R0i.y = ((PV0iz == 0)?(PV0ix):(int(-1)));
// 2
predResult = (R0i.y != 0);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
PV0iy = floatBitsToInt((intBitsToFloat(R1i.y) > 0.0)?1.0:0.0);
PV0iw = floatBitsToInt((0.0 > intBitsToFloat(R1i.y))?1.0:0.0);
// 1
PV1iz = floatBitsToInt(intBitsToFloat(PV0iy) + -(intBitsToFloat(PV0iw)));
// 2
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iz), intBitsToFloat(uf_remappedVS[0].z)));
// 3
R1i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(PV0ix));
// 4
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[1].x),intBitsToFloat(uf_remappedVS[1].y),intBitsToFloat(uf_remappedVS[1].z),intBitsToFloat(uf_remappedVS[1].w))));
PV0iy = R0i.x;
PV0iz = R0i.x;
PV0iw = R0i.x;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[2].x),intBitsToFloat(uf_remappedVS[2].y),intBitsToFloat(uf_remappedVS[2].z),intBitsToFloat(uf_remappedVS[2].w))));
PV1ix = tempi.x;
R0i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),intBitsToFloat(uf_remappedVS[3].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R0i.z = tempi.x;
PV0iw = tempi.x;
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[4].x),intBitsToFloat(uf_remappedVS[4].y),intBitsToFloat(uf_remappedVS[4].z),intBitsToFloat(uf_remappedVS[4].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R0i.w = tempi.x;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
// 0
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[5].x),intBitsToFloat(uf_remappedVS[5].y),intBitsToFloat(uf_remappedVS[5].z),intBitsToFloat(uf_remappedVS[5].w))));
PV0iy = R0i.x;
PV0iz = R0i.x;
PV0iw = R0i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[6].y),intBitsToFloat(uf_remappedVS[6].z),intBitsToFloat(uf_remappedVS[6].w))));
PV1ix = tempi.x;
R0i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R0i.z = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R0i.w)),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R0i.w = tempi.x;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
R1i.z = 0x3f800000;
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R0i.w));
// 1
PV1ix = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(PS0i));
PV1iy = floatBitsToInt(intBitsToFloat(R0i.x) * intBitsToFloat(PS0i));
// 2
R1i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[9].x)),intBitsToFloat(PV1iy)) + -(intBitsToFloat(uf_remappedVS[9].z)));
PV0iw = floatBitsToInt(intBitsToFloat(PV1ix) * -(1.0));
// 3
R1i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedVS[9].y)),intBitsToFloat(PV0iw)) + -(intBitsToFloat(uf_remappedVS[9].w)));
}
// export
SET_POSITION(vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
}
