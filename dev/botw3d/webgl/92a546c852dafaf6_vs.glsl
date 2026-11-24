#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 92a546c852dafaf6
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_uniformRegisterVS[256];
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
ivec4 R0i = ivec4(0);
ivec4 R1i = ivec4(0);
ivec4 R2i = ivec4(0);
ivec4 R3i = ivec4(0);
ivec4 R4i = ivec4(0);
ivec4 R126i = ivec4(0);
ivec4 R127i = ivec4(0);
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
attrDecoder.xy = attrDataSem1.xy;
attrDecoder.xy = uvec2((attrDecoder.xy>>24)|((attrDecoder.xy>>8)&0xFF00u)|((attrDecoder.xy<<8)&0xFF0000u)|((attrDecoder.xy<<24)));
attrDecoder.z = uint(0);
attrDecoder.w = uint(0);
R2i = ivec4(int(attrDecoder.x), int(attrDecoder.y), 0, 0x3f800000);
if( activeMaskStackC[1] == true ) {
// 0
PV0ix = R1i.y;
PV0ix = floatBitsToInt(intBitsToFloat(PV0ix) * 2.0);
PV0iy = R1i.x;
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 2.0);
R0i.z = 0x3;
R0i.w = 0;
// 1
R1i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iy), intBitsToFloat(uf_uniformRegisterVS[15].x)));
R1i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(uf_uniformRegisterVS[15].y)));
R1i.z = floatBitsToInt(-(intBitsToFloat(uf_uniformRegisterVS[15].z)));
R1i.w = 0x3f800000;
// 2
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_uniformRegisterVS[16].x),intBitsToFloat(uf_uniformRegisterVS[16].y),intBitsToFloat(uf_uniformRegisterVS[16].z),intBitsToFloat(uf_uniformRegisterVS[16].w))));
PV0iy = R0i.x;
PV0iz = R0i.x;
PV0iw = R0i.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_uniformRegisterVS[17].x),intBitsToFloat(uf_uniformRegisterVS[17].y),intBitsToFloat(uf_uniformRegisterVS[17].z),intBitsToFloat(uf_uniformRegisterVS[17].w))));
PV1ix = tempi.x;
R0i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_uniformRegisterVS[18].x),intBitsToFloat(uf_uniformRegisterVS[18].y),intBitsToFloat(uf_uniformRegisterVS[18].z),intBitsToFloat(uf_uniformRegisterVS[18].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R2i.z = tempi.x;
PV0iw = tempi.x;
R2i.w = 0x3f800000;
// 5
R3i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(PV0ix),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_uniformRegisterVS[3].x),intBitsToFloat(uf_uniformRegisterVS[3].y),intBitsToFloat(uf_uniformRegisterVS[3].z),intBitsToFloat(uf_uniformRegisterVS[3].w))));
PV1iy = R3i.x;
PV1iz = R3i.x;
PV1iw = R3i.x;
// 6
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_uniformRegisterVS[4].x),intBitsToFloat(uf_uniformRegisterVS[4].y),intBitsToFloat(uf_uniformRegisterVS[4].z),intBitsToFloat(uf_uniformRegisterVS[4].w))));
PV0ix = tempi.x;
R3i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_uniformRegisterVS[5].x),intBitsToFloat(uf_uniformRegisterVS[5].y),intBitsToFloat(uf_uniformRegisterVS[5].z),intBitsToFloat(uf_uniformRegisterVS[5].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R3i.z = tempi.x;
PV1iw = tempi.x;
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_uniformRegisterVS[6].x),intBitsToFloat(uf_uniformRegisterVS[6].y),intBitsToFloat(uf_uniformRegisterVS[6].z),intBitsToFloat(uf_uniformRegisterVS[6].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
R3i.w = tempi.x;
}
while( activeMaskStackC[1] == true )
{
if( activeMaskStackC[1] == true ) {
// 0
backupReg0i = R0i.z;
R0i.z = int(-1) + backupReg0i;
R4i.w = (backupReg0i > int(1))?-1:0;
// 1
predResult = (R4i.w != 0);
if( predResult == false ) break;
}
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R127i.x = floatBitsToInt(float(R0i.z));
// 1
tempResultf = intBitsToFloat(R127i.x);
tempResultf = floor(tempResultf);
tempResultf = clamp(tempResultf, -256.0, 255.0);
ARi.x = int(tempResultf);
PV1ix = floatBitsToInt(tempResultf);
// 2
R2i.y = ((intBitsToFloat(uf_uniformRegisterVS[15].z) > intBitsToFloat(uf_uniformRegisterVS[ARi.x+0].x))?-1:0);
// 3
predResult = (R2i.y != 0);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
PV0iy = R0i.z << 0x2;
R0i.w = floatBitsToInt(float(R0i.z));
// 1
R127i.x = PV0iy + 0x2;
R127i.y = PV0iy + 0x3;
PV1iw = PV0iy + int(1);
R127i.z = floatBitsToInt(float(PV0iy));
// 2
tempResultf = intBitsToFloat(R127i.z);
tempResultf = floor(tempResultf);
tempResultf = clamp(tempResultf, -256.0, 255.0);
ARi.x = int(tempResultf);
PV0ix = floatBitsToInt(tempResultf);
R126i.x = floatBitsToInt(float(PV1iw));
// 3
tempResultf = intBitsToFloat(R126i.x);
tempResultf = floor(tempResultf);
tempResultf = clamp(tempResultf, -256.0, 255.0);
ARi.y = int(tempResultf);
PV1iy = floatBitsToInt(tempResultf);
R126i.z = floatBitsToInt(float(R127i.x));
// 4
tempResultf = intBitsToFloat(R126i.z);
tempResultf = floor(tempResultf);
tempResultf = clamp(tempResultf, -256.0, 255.0);
ARi.z = int(tempResultf);
PV0iz = floatBitsToInt(tempResultf);
R127i.x = floatBitsToInt(float(R127i.y));
// 5
tempResultf = intBitsToFloat(R127i.x);
tempResultf = floor(tempResultf);
tempResultf = clamp(tempResultf, -256.0, 255.0);
ARi.w = int(tempResultf);
PV1iw = floatBitsToInt(tempResultf);
// 6
R3i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_uniformRegisterVS[ARi.x+3].x),intBitsToFloat(uf_uniformRegisterVS[ARi.x+3].y),intBitsToFloat(uf_uniformRegisterVS[ARi.x+3].z),intBitsToFloat(uf_uniformRegisterVS[ARi.x+3].w))));
PV0iy = R3i.x;
PV0iz = R3i.x;
PV0iw = R3i.x;
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_uniformRegisterVS[ARi.y+3].x),intBitsToFloat(uf_uniformRegisterVS[ARi.y+3].y),intBitsToFloat(uf_uniformRegisterVS[ARi.y+3].z),intBitsToFloat(uf_uniformRegisterVS[ARi.y+3].w))));
PV1ix = tempi.x;
R3i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_uniformRegisterVS[ARi.z+3].x),intBitsToFloat(uf_uniformRegisterVS[ARi.z+3].y),intBitsToFloat(uf_uniformRegisterVS[ARi.z+3].z),intBitsToFloat(uf_uniformRegisterVS[ARi.z+3].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R3i.z = tempi.x;
PV0iw = tempi.x;
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R2i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_uniformRegisterVS[ARi.w+3].x),intBitsToFloat(uf_uniformRegisterVS[ARi.w+3].y),intBitsToFloat(uf_uniformRegisterVS[ARi.w+3].z),intBitsToFloat(uf_uniformRegisterVS[ARi.w+3].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R3i.w = tempi.x;
}
if( activeMaskStackC[2] == true ) {
break;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
}
if( activeMaskStackC[1] == true ) {
// 0
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_uniformRegisterVS[19].x),intBitsToFloat(uf_uniformRegisterVS[19].y),intBitsToFloat(uf_uniformRegisterVS[19].z),intBitsToFloat(uf_uniformRegisterVS[19].w))));
PV0iy = R0i.x;
PV0iz = R0i.x;
PV0iw = R0i.x;
R2i.x = R0i.w;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_uniformRegisterVS[20].x),intBitsToFloat(uf_uniformRegisterVS[20].y),intBitsToFloat(uf_uniformRegisterVS[20].z),intBitsToFloat(uf_uniformRegisterVS[20].w))));
PV1ix = tempi.x;
R0i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_uniformRegisterVS[21].x),intBitsToFloat(uf_uniformRegisterVS[21].y),intBitsToFloat(uf_uniformRegisterVS[21].z),intBitsToFloat(uf_uniformRegisterVS[21].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R0i.z = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_uniformRegisterVS[22].x),intBitsToFloat(uf_uniformRegisterVS[22].y),intBitsToFloat(uf_uniformRegisterVS[22].z),intBitsToFloat(uf_uniformRegisterVS[22].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R0i.w = tempi.x;
}
// export
SET_POSITION(vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.y), intBitsToFloat(R2i.y));
}
