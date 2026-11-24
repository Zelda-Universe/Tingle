#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 989d0f4a86424baa
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[29];
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;

out vec4 passParameterSem0;
out vec4 passParameterSem1;
out vec4 passParameterSem2;
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
ivec4 R5i = ivec4(0);
ivec4 R6i = ivec4(0);
ivec4 R7i = ivec4(0);
ivec4 R122i = ivec4(0);
ivec4 R123i = ivec4(0);
ivec4 R124i = ivec4(0);
ivec4 R125i = ivec4(0);
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
bool activeMaskStack[4];
bool activeMaskStackC[5];
activeMaskStack[0] = false;
activeMaskStack[1] = false;
activeMaskStack[2] = false;
activeMaskStackC[0] = false;
activeMaskStackC[1] = false;
activeMaskStackC[2] = false;
activeMaskStackC[3] = false;
activeMaskStack[0] = true;
activeMaskStackC[0] = true;
activeMaskStackC[1] = true;
R0i = ivec4(gl_VertexID, 0, 0, gl_InstanceID);
attrDecoder.xy = attrDataSem0.xy;
attrDecoder.xy = uvec2((attrDecoder.xy>>24)|((attrDecoder.xy>>8)&0xFF00u)|((attrDecoder.xy<<8)&0xFF0000u)|((attrDecoder.xy<<24)));
attrDecoder.z = uint(0);
attrDecoder.w = uint(0);
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), 0, 0x3f800000);
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(uf_remappedVS[0].x)));
R0i.y = floatBitsToInt(-(intBitsToFloat(R1i.y)));
R0i.z = 0;
R2i.w = 0x3f800000;
R127i.w = floatBitsToInt(1.0);
// 1
R0i.x = floatBitsToInt(intBitsToFloat(PV0ix) + intBitsToFloat(uf_remappedVS[0].z));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(uf_remappedVS[0].y)));
// 2
R0i.y = floatBitsToInt(intBitsToFloat(PV1iz) + intBitsToFloat(uf_remappedVS[0].w));
R0i.w = uf_remappedVS[1].x & 0x40000000;
// 3
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[2].x),intBitsToFloat(uf_remappedVS[2].y),intBitsToFloat(uf_remappedVS[2].z),intBitsToFloat(uf_remappedVS[2].w))));
PV1iy = R127i.x;
PV1iz = R127i.x;
PV1iw = R127i.x;
// 4
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[3].x),intBitsToFloat(uf_remappedVS[3].y),intBitsToFloat(uf_remappedVS[3].z),intBitsToFloat(uf_remappedVS[3].w))));
PV0ix = tempi.x;
R127i.y = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 5
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[4].x),intBitsToFloat(uf_remappedVS[4].y),intBitsToFloat(uf_remappedVS[4].z),intBitsToFloat(uf_remappedVS[4].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
R127i.z = tempi.x;
PV1iw = tempi.x;
// 6
R5i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(PV1ix),intBitsToFloat(R127i.w)),vec4(intBitsToFloat(uf_remappedVS[5].x),intBitsToFloat(uf_remappedVS[5].y),intBitsToFloat(uf_remappedVS[5].z),intBitsToFloat(uf_remappedVS[5].w))));
PV0iy = R5i.x;
PV0iz = R5i.x;
PV0iw = R5i.x;
// 7
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w)),vec4(intBitsToFloat(uf_remappedVS[6].x),intBitsToFloat(uf_remappedVS[6].y),intBitsToFloat(uf_remappedVS[6].z),intBitsToFloat(uf_remappedVS[6].w))));
PV1ix = tempi.x;
R5i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 8
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w)),vec4(intBitsToFloat(uf_remappedVS[7].x),intBitsToFloat(uf_remappedVS[7].y),intBitsToFloat(uf_remappedVS[7].z),intBitsToFloat(uf_remappedVS[7].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R5i.z = tempi.x;
PV0iw = tempi.x;
// 9
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R127i.x),intBitsToFloat(R127i.y),intBitsToFloat(R127i.z),intBitsToFloat(R127i.w)),vec4(intBitsToFloat(uf_remappedVS[8].x),intBitsToFloat(uf_remappedVS[8].y),intBitsToFloat(uf_remappedVS[8].z),intBitsToFloat(uf_remappedVS[8].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R5i.w = tempi.x;
// 10
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), intBitsToFloat(uf_remappedVS[9].x)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].y), intBitsToFloat(uf_remappedVS[9].y)));
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].x), intBitsToFloat(uf_remappedVS[9].y)));
// 11
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedVS[0].y), intBitsToFloat(uf_remappedVS[9].x)));
// 12
predResult = (0 != R0i.w);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
R1i.z = uf_remappedVS[1].x & 0x2;
// 1
predResult = (0 != R1i.z);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R1i.y = R1i.y;
R1i.z = 0;
R1i.w = 0x3f800000;
// 1
R3i.x = R1i.x;
R3i.y = R1i.y;
R3i.z = R1i.z;
R3i.w = R1i.w;
// 2
R4i.x = R3i.x;
R4i.y = R3i.y;
R4i.z = R3i.z;
R4i.w = R3i.w;
}
activeMaskStack[2] = activeMaskStack[2] == false;
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PS0i = int(intBitsToFloat(R1i.y));
// 1
PV1ix = PS0i << int(1);
PS1i = int(intBitsToFloat(R1i.x));
// 2
R124i.z = PV1ix + PS1i;
// 3
R127i.x = (R124i.z == 0x2)?-1:0;
R127i.y = (R124i.z == 0x2)?-1:0;
R127i.z = (R124i.z == 0x2)?-1:0;
R126i.w = (R124i.z == int(1))?-1:0;
R124i.w = (R124i.z == int(1))?-1:0;
// 4
R124i.y = (R124i.z == int(1))?-1:0;
R126i.z = ((R127i.x == 0)?(uf_remappedVS[10].y):(uf_remappedVS[11].y));
R127i.w = ((R127i.x == 0)?(uf_remappedVS[10].x):(uf_remappedVS[11].x));
// 5
backupReg0i = R127i.x;
R127i.x = ((backupReg0i == 0)?(uf_remappedVS[10].w):(uf_remappedVS[11].w));
R126i.y = ((backupReg0i == 0)?(uf_remappedVS[10].z):(uf_remappedVS[11].z));
// 6
R126i.x = ((R127i.z == 0)?(uf_remappedVS[12].y):(uf_remappedVS[13].y));
R125i.y = ((R127i.z == 0)?(uf_remappedVS[12].x):(uf_remappedVS[13].x));
// 7
backupReg0i = R127i.z;
R127i.z = ((backupReg0i == 0)?(uf_remappedVS[12].w):(uf_remappedVS[13].w));
R125i.w = ((backupReg0i == 0)?(uf_remappedVS[12].z):(uf_remappedVS[13].z));
// 8
R125i.z = ((R127i.y == 0)?(uf_remappedVS[14].y):(uf_remappedVS[15].y));
R0i.w = ((R127i.y == 0)?(uf_remappedVS[14].x):(uf_remappedVS[15].x));
// 9
R125i.x = ((R127i.y == 0)?(uf_remappedVS[14].w):(uf_remappedVS[15].w));
R127i.y = ((R127i.y == 0)?(uf_remappedVS[14].z):(uf_remappedVS[15].z));
// 10
R127i.x = ((R126i.w == 0)?(R127i.x):(uf_remappedVS[16].w));
R126i.y = ((R126i.w == 0)?(R126i.y):(uf_remappedVS[16].z));
R126i.z = ((R126i.w == 0)?(R126i.z):(uf_remappedVS[16].y));
R127i.w = ((R126i.w == 0)?(R127i.w):(uf_remappedVS[16].x));
// 11
R126i.x = ((R124i.w == 0)?(R126i.x):(uf_remappedVS[17].y));
R125i.y = ((R124i.w == 0)?(R125i.y):(uf_remappedVS[17].x));
R127i.z = ((R124i.w == 0)?(R127i.z):(uf_remappedVS[17].w));
R125i.w = ((R124i.w == 0)?(R125i.w):(uf_remappedVS[17].z));
// 12
R125i.x = ((R124i.y == 0)?(R125i.x):(uf_remappedVS[18].w));
R127i.y = ((R124i.y == 0)?(R127i.y):(uf_remappedVS[18].z));
R125i.z = ((R124i.y == 0)?(R125i.z):(uf_remappedVS[18].y));
R124i.w = ((R124i.y == 0)?(R0i.w):(uf_remappedVS[18].x));
// 13
R1i.x = ((R124i.z == 0)?(uf_remappedVS[19].x):(R127i.w));
R1i.y = ((R124i.z == 0)?(uf_remappedVS[19].y):(R126i.z));
R1i.z = ((R124i.z == 0)?(uf_remappedVS[19].z):(R126i.y));
R1i.w = ((R124i.z == 0)?(uf_remappedVS[19].w):(R127i.x));
// 14
R3i.x = ((R124i.z == 0)?(uf_remappedVS[20].x):(R125i.y));
R3i.y = ((R124i.z == 0)?(uf_remappedVS[20].y):(R126i.x));
R3i.z = ((R124i.z == 0)?(uf_remappedVS[20].z):(R125i.w));
R3i.w = ((R124i.z == 0)?(uf_remappedVS[20].w):(R127i.z));
// 15
R4i.x = ((R124i.z == 0)?(uf_remappedVS[21].x):(R124i.w));
R4i.y = ((R124i.z == 0)?(uf_remappedVS[21].y):(R125i.z));
R4i.z = ((R124i.z == 0)?(uf_remappedVS[21].z):(R127i.y));
R4i.w = ((R124i.z == 0)?(uf_remappedVS[21].w):(R125i.x));
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
R0i.w = uf_remappedVS[1].x & 0x2;
// 1
predResult = (0 != R0i.w);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
// 0
R1i.y = R1i.y;
R1i.z = 0;
R1i.w = 0x3f800000;
// 1
R3i.x = R1i.x;
R3i.y = R1i.y;
R3i.z = R1i.z;
R3i.w = R1i.w;
// 2
R4i.x = R3i.x;
R4i.y = R3i.y;
R4i.z = R3i.z;
R4i.w = R3i.w;
}
activeMaskStack[2] = activeMaskStack[2] == false;
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
PS0i = int(intBitsToFloat(R1i.y));
// 1
PV1ix = PS0i << int(1);
PS1i = int(intBitsToFloat(R1i.x));
// 2
R124i.z = PV1ix + PS1i;
// 3
R127i.x = (R124i.z == 0x2)?-1:0;
R127i.y = (R124i.z == 0x2)?-1:0;
R127i.z = (R124i.z == 0x2)?-1:0;
R126i.w = (R124i.z == int(1))?-1:0;
R124i.w = (R124i.z == int(1))?-1:0;
// 4
R124i.y = (R124i.z == int(1))?-1:0;
R126i.z = ((R127i.x == 0)?(uf_remappedVS[10].y):(uf_remappedVS[11].y));
R127i.w = ((R127i.x == 0)?(uf_remappedVS[10].x):(uf_remappedVS[11].x));
// 5
backupReg0i = R127i.x;
R127i.x = ((backupReg0i == 0)?(uf_remappedVS[10].w):(uf_remappedVS[11].w));
R126i.y = ((backupReg0i == 0)?(uf_remappedVS[10].z):(uf_remappedVS[11].z));
// 6
R126i.x = ((R127i.z == 0)?(uf_remappedVS[12].y):(uf_remappedVS[13].y));
R125i.y = ((R127i.z == 0)?(uf_remappedVS[12].x):(uf_remappedVS[13].x));
// 7
backupReg0i = R127i.z;
R127i.z = ((backupReg0i == 0)?(uf_remappedVS[12].w):(uf_remappedVS[13].w));
R125i.w = ((backupReg0i == 0)?(uf_remappedVS[12].z):(uf_remappedVS[13].z));
// 8
R125i.z = ((R127i.y == 0)?(uf_remappedVS[14].y):(uf_remappedVS[15].y));
R0i.w = ((R127i.y == 0)?(uf_remappedVS[14].x):(uf_remappedVS[15].x));
// 9
R125i.x = ((R127i.y == 0)?(uf_remappedVS[14].w):(uf_remappedVS[15].w));
R127i.y = ((R127i.y == 0)?(uf_remappedVS[14].z):(uf_remappedVS[15].z));
// 10
R127i.x = ((R126i.w == 0)?(R127i.x):(uf_remappedVS[16].w));
R126i.y = ((R126i.w == 0)?(R126i.y):(uf_remappedVS[16].z));
R126i.z = ((R126i.w == 0)?(R126i.z):(uf_remappedVS[16].y));
R127i.w = ((R126i.w == 0)?(R127i.w):(uf_remappedVS[16].x));
// 11
R126i.x = ((R124i.w == 0)?(R126i.x):(uf_remappedVS[17].y));
R125i.y = ((R124i.w == 0)?(R125i.y):(uf_remappedVS[17].x));
R127i.z = ((R124i.w == 0)?(R127i.z):(uf_remappedVS[17].w));
R125i.w = ((R124i.w == 0)?(R125i.w):(uf_remappedVS[17].z));
// 12
R125i.x = ((R124i.y == 0)?(R125i.x):(uf_remappedVS[18].w));
R127i.y = ((R124i.y == 0)?(R127i.y):(uf_remappedVS[18].z));
R125i.z = ((R124i.y == 0)?(R125i.z):(uf_remappedVS[18].y));
R124i.w = ((R124i.y == 0)?(R0i.w):(uf_remappedVS[18].x));
// 13
R1i.x = ((R124i.z == 0)?(uf_remappedVS[19].x):(R127i.w));
R1i.y = ((R124i.z == 0)?(uf_remappedVS[19].y):(R126i.z));
R1i.z = ((R124i.z == 0)?(uf_remappedVS[19].z):(R126i.y));
R1i.w = ((R124i.z == 0)?(uf_remappedVS[19].w):(R127i.x));
// 14
R3i.x = ((R124i.z == 0)?(uf_remappedVS[20].x):(R125i.y));
R3i.y = ((R124i.z == 0)?(uf_remappedVS[20].y):(R126i.x));
R3i.z = ((R124i.z == 0)?(uf_remappedVS[20].z):(R125i.w));
R3i.w = ((R124i.z == 0)?(uf_remappedVS[20].w):(R127i.z));
// 15
R4i.x = ((R124i.z == 0)?(uf_remappedVS[21].x):(R124i.w));
R4i.y = ((R124i.z == 0)?(uf_remappedVS[21].y):(R125i.z));
R4i.z = ((R124i.z == 0)?(uf_remappedVS[21].z):(R127i.y));
R4i.w = ((R124i.z == 0)?(uf_remappedVS[21].w):(R125i.x));
}
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
predResult = (0 != uf_remappedVS[22].x);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R1i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[19].x),intBitsToFloat(uf_remappedVS[19].y),intBitsToFloat(uf_remappedVS[19].z),intBitsToFloat(uf_remappedVS[19].w))));
PV0iy = R1i.x;
PV0iz = R1i.x;
PV0iw = R1i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[16].x),intBitsToFloat(uf_remappedVS[16].y),intBitsToFloat(uf_remappedVS[16].z),intBitsToFloat(uf_remappedVS[16].w))));
PV1ix = tempi.x;
R1i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[11].x),intBitsToFloat(uf_remappedVS[11].y),intBitsToFloat(uf_remappedVS[11].z),intBitsToFloat(uf_remappedVS[11].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R1i.z = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[10].x),intBitsToFloat(uf_remappedVS[10].y),intBitsToFloat(uf_remappedVS[10].z),intBitsToFloat(uf_remappedVS[10].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R1i.w = tempi.x;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
R7i.x = uf_remappedVS[1].x & int(1);
// 1
predResult = (0 != R7i.x);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R0i.w = uf_remappedVS[1].x & 0x2;
// 1
predResult = (0 != R0i.w);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
PV0ix = uf_remappedVS[1].x & 0x10000;
R127i.y = uf_remappedVS[1].x & 0x10;
R125i.z = uf_remappedVS[1].x & 0x4;
R127i.w = uf_remappedVS[1].x & 0x20;
// 1
R123i.x = R1i.w;
R123i.y = R1i.z;
R126i.z = ((PV0ix == 0)?(R2i.y):(R6i.y));
R123i.w = ((PV0ix == 0)?(R2i.x):(R6i.x));
R127i.z = R1i.y;
// 2
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.x), intBitsToFloat(R123i.w)));
R126i.y = floatBitsToInt(-(intBitsToFloat(R123i.w)) + 1.0);
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R126i.z)));
R123i.w = ((R127i.w == 0)?(R123i.y):(R123i.y));
R122i.x = ((R127i.w == 0)?(R123i.x):(R123i.x));
// 3
backupReg0i = R127i.y;
R123i.x = ((R127i.w == 0)?(R127i.z):(PV0iz));
R127i.y = floatBitsToInt(-(intBitsToFloat(R126i.z)) + 1.0);
R127i.z = ((R125i.z == 0)?(R123i.w):(R123i.w));
R123i.w = ((backupReg0i == 0)?(R1i.x):(R7i.x));
R124i.z = ((R125i.z == 0)?(R122i.x):(R122i.x));
// 4
R127i.x = ((R125i.z == 0)?(R123i.x):(R123i.x));
R125i.y = ((R127i.w == 0)?(R123i.w):(R123i.w));
R126i.z = uf_remappedVS[1].x & 0x8;
// 5
R126i.x = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(R127i.y));
PV1iz = floatBitsToInt(intBitsToFloat(R125i.y) + intBitsToFloat(R126i.y));
// 6
R123i.y = ((R125i.z == 0)?(R125i.y):(PV1iz));
// 7
R1i.x = ((R126i.z == 0)?(R123i.y):(R123i.y));
R1i.y = ((R126i.z == 0)?(R127i.x):(R126i.x));
R1i.z = R127i.z;
// 8
R1i.w = R124i.z;
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R7i.x = floatBitsToInt(-(intBitsToFloat(R1i.x)) + 1.0);
R126i.y = uf_remappedVS[1].x & 0x10000;
R127i.z = uf_remappedVS[1].x & 0x40000;
PV0iw = uf_remappedVS[1].x & 0x20000;
// 1
R123i.x = R1i.z;
R127i.y = R1i.y;
R123i.z = ((PV0iw == 0)?(R1i.x):(R7i.x));
R123i.w = R1i.w;
// 2
R127i.x = ((R127i.z == 0)?(R123i.z):(R123i.z));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.y)) + 1.0);
R126i.z = ((R127i.z == 0)?(R123i.x):(R123i.x));
R127i.w = ((R127i.z == 0)?(R123i.w):(R123i.w));
// 3
R123i.w = ((R127i.z == 0)?(R127i.y):(PV0iy));
// 4
R1i.x = ((R126i.y == 0)?(R127i.x):(R123i.w));
R1i.y = ((R126i.y == 0)?(R123i.w):(R127i.x));
R1i.z = R126i.z;
R1i.w = R127i.w;
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[23].x),intBitsToFloat(uf_remappedVS[23].y),intBitsToFloat(uf_remappedVS[23].z),intBitsToFloat(uf_remappedVS[23].w))));
PV0iy = R127i.x;
PV0iz = R127i.x;
PV0iw = R127i.x;
// 1
R1i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y),intBitsToFloat(R1i.z),intBitsToFloat(R1i.w)),vec4(intBitsToFloat(uf_remappedVS[24].x),intBitsToFloat(uf_remappedVS[24].y),intBitsToFloat(uf_remappedVS[24].z),intBitsToFloat(uf_remappedVS[24].w))));
PV1iy = R1i.x;
PV1iz = R1i.x;
PV1iw = R1i.x;
R1i.y = R127i.x;
// 2
R1i.y = floatBitsToInt(-(intBitsToFloat(R1i.y)) + 1.0);
R1i.w = R127i.x;
// 3
predResult = (0 != uf_remappedVS[22].y);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R3i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[20].x),intBitsToFloat(uf_remappedVS[20].y),intBitsToFloat(uf_remappedVS[20].z),intBitsToFloat(uf_remappedVS[20].w))));
PV0iy = R3i.x;
PV0iz = R3i.x;
PV0iw = R3i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[17].x),intBitsToFloat(uf_remappedVS[17].y),intBitsToFloat(uf_remappedVS[17].z),intBitsToFloat(uf_remappedVS[17].w))));
PV1ix = tempi.x;
R3i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[13].x),intBitsToFloat(uf_remappedVS[13].y),intBitsToFloat(uf_remappedVS[13].z),intBitsToFloat(uf_remappedVS[13].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R3i.z = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[12].x),intBitsToFloat(uf_remappedVS[12].y),intBitsToFloat(uf_remappedVS[12].z),intBitsToFloat(uf_remappedVS[12].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R3i.w = tempi.x;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
R7i.y = uf_remappedVS[1].x & int(1);
// 1
predResult = (0 != R7i.y);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R7i.x = uf_remappedVS[1].x & 0x2;
// 1
predResult = (0 != R7i.x);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.x = uf_remappedVS[1].x & 0x20;
R127i.y = uf_remappedVS[1].x & 0x10;
R125i.z = uf_remappedVS[1].x & 0x4;
PV0iw = uf_remappedVS[1].x & 0x10000;
// 1
R123i.x = ((PV0iw == 0)?(R2i.y):(R6i.y));
R123i.z = ((PV0iw == 0)?(R2i.x):(R6i.x));
R125i.w = uf_remappedVS[1].x & 0x8;
R127i.z = R3i.y;
// 2
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R123i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R123i.x)));
R126i.z = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
R127i.w = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
// 3
R123i.z = ((R127i.x == 0)?(R127i.z):(PV0iy));
R123i.w = ((R127i.y == 0)?(R3i.x):(R7i.x));
// 4
backupReg0i = R127i.x;
R127i.x = ((R125i.z == 0)?(R123i.z):(R123i.z));
R126i.w = ((backupReg0i == 0)?(R123i.w):(R123i.w));
// 5
R126i.x = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(R127i.w));
PV1iz = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(R126i.z));
// 6
R123i.y = ((R125i.z == 0)?(R126i.w):(PV1iz));
// 7
R3i.x = ((R125i.w == 0)?(R123i.y):(R123i.y));
R3i.y = ((R125i.w == 0)?(R127i.x):(R126i.x));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R7i.x = floatBitsToInt(-(intBitsToFloat(R3i.x)) + 1.0);
PV0iy = uf_remappedVS[1].x & 0x20000;
R127i.z = uf_remappedVS[1].x & 0x40000;
R126i.w = uf_remappedVS[1].x & 0x10000;
// 1
R123i.x = ((PV0iy == 0)?(R3i.x):(R7i.x));
R127i.w = R3i.y;
// 2
R127i.x = ((R127i.z == 0)?(R123i.x):(R123i.x));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
// 3
R123i.w = ((R127i.z == 0)?(R127i.w):(PV0iy));
// 4
R3i.x = ((R126i.w == 0)?(R127i.x):(R123i.w));
R3i.y = ((R126i.w == 0)?(R123i.w):(R127i.x));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
activeMaskStack[1] = activeMaskStack[0];
activeMaskStackC[2] = activeMaskStackC[1];
// 0
R127i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[25].x),intBitsToFloat(uf_remappedVS[25].y),intBitsToFloat(uf_remappedVS[25].z),intBitsToFloat(uf_remappedVS[25].w))));
PV0iy = R127i.x;
PV0iz = R127i.x;
PV0iw = R127i.x;
// 1
R3i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R3i.x),intBitsToFloat(R3i.y),intBitsToFloat(R3i.z),intBitsToFloat(R3i.w)),vec4(intBitsToFloat(uf_remappedVS[26].x),intBitsToFloat(uf_remappedVS[26].y),intBitsToFloat(uf_remappedVS[26].z),intBitsToFloat(uf_remappedVS[26].w))));
PV1iy = R3i.x;
PV1iz = R3i.x;
PV1iw = R3i.x;
R3i.y = R127i.x;
// 2
R3i.y = floatBitsToInt(-(intBitsToFloat(R3i.y)) + 1.0);
R3i.w = R127i.x;
// 3
predResult = (0 != uf_remappedVS[22].z);
activeMaskStack[1] = predResult;
activeMaskStackC[2] = predResult == true && activeMaskStackC[1] == true;
}
else {
activeMaskStack[1] = false;
activeMaskStackC[2] = false;
}
if( activeMaskStackC[2] == true ) {
// 0
R4i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[21].x),intBitsToFloat(uf_remappedVS[21].y),intBitsToFloat(uf_remappedVS[21].z),intBitsToFloat(uf_remappedVS[21].w))));
PV0iy = R4i.x;
PV0iz = R4i.x;
PV0iw = R4i.x;
// 1
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[18].x),intBitsToFloat(uf_remappedVS[18].y),intBitsToFloat(uf_remappedVS[18].z),intBitsToFloat(uf_remappedVS[18].w))));
PV1ix = tempi.x;
R4i.y = tempi.x;
PV1iz = tempi.x;
PV1iw = tempi.x;
// 2
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[15].x),intBitsToFloat(uf_remappedVS[15].y),intBitsToFloat(uf_remappedVS[15].z),intBitsToFloat(uf_remappedVS[15].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
R4i.z = tempi.x;
PV0iw = tempi.x;
// 3
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y),intBitsToFloat(R0i.z),intBitsToFloat(R2i.w)),vec4(intBitsToFloat(uf_remappedVS[14].x),intBitsToFloat(uf_remappedVS[14].y),intBitsToFloat(uf_remappedVS[14].z),intBitsToFloat(uf_remappedVS[14].w))));
PV1ix = tempi.x;
PV1iy = tempi.x;
PV1iz = tempi.x;
R4i.w = tempi.x;
}
activeMaskStack[1] = activeMaskStack[1] == false;
activeMaskStackC[2] = activeMaskStack[1] == true && activeMaskStackC[1] == true;
if( activeMaskStackC[2] == true ) {
activeMaskStack[2] = activeMaskStack[1];
activeMaskStackC[3] = activeMaskStackC[2];
// 0
R0i.z = uf_remappedVS[1].x & int(1);
// 1
predResult = (0 != R0i.z);
activeMaskStack[2] = predResult;
activeMaskStackC[3] = predResult == true && activeMaskStackC[2] == true;
}
else {
activeMaskStack[2] = false;
activeMaskStackC[3] = false;
}
if( activeMaskStackC[3] == true ) {
activeMaskStack[3] = activeMaskStack[2];
activeMaskStackC[4] = activeMaskStackC[3];
// 0
R0i.y = uf_remappedVS[1].x & 0x2;
// 1
predResult = (0 != R0i.y);
activeMaskStack[3] = predResult;
activeMaskStackC[4] = predResult == true && activeMaskStackC[3] == true;
}
else {
activeMaskStack[3] = false;
activeMaskStackC[4] = false;
}
if( activeMaskStackC[4] == true ) {
// 0
R127i.x = uf_remappedVS[1].x & 0x20;
R127i.y = uf_remappedVS[1].x & 0x10;
R125i.z = uf_remappedVS[1].x & 0x4;
PV0iw = uf_remappedVS[1].x & 0x10000;
// 1
R123i.x = ((PV0iw == 0)?(R2i.y):(R6i.y));
R123i.z = ((PV0iw == 0)?(R2i.x):(R6i.x));
R125i.w = uf_remappedVS[1].x & 0x8;
R127i.z = R4i.y;
// 2
R0i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x), intBitsToFloat(R123i.z)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z), intBitsToFloat(R123i.x)));
R126i.z = floatBitsToInt(-(intBitsToFloat(R123i.z)) + 1.0);
R127i.w = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
// 3
R123i.z = ((R127i.x == 0)?(R127i.z):(PV0iy));
R123i.w = ((R127i.y == 0)?(R4i.x):(R0i.x));
// 4
backupReg0i = R127i.x;
R127i.x = ((R125i.z == 0)?(R123i.z):(R123i.z));
R126i.w = ((backupReg0i == 0)?(R123i.w):(R123i.w));
// 5
R126i.x = floatBitsToInt(intBitsToFloat(R127i.x) + intBitsToFloat(R127i.w));
PV1iz = floatBitsToInt(intBitsToFloat(R126i.w) + intBitsToFloat(R126i.z));
// 6
R123i.y = ((R125i.z == 0)?(R126i.w):(PV1iz));
// 7
R4i.x = ((R125i.w == 0)?(R123i.y):(R123i.y));
R4i.y = ((R125i.w == 0)?(R127i.x):(R126i.x));
}
activeMaskStackC[3] = activeMaskStack[2] == true && activeMaskStackC[2] == true;
if( activeMaskStackC[3] == true ) {
// 0
R0i.x = floatBitsToInt(-(intBitsToFloat(R4i.x)) + 1.0);
PV0iy = uf_remappedVS[1].x & 0x20000;
R127i.z = uf_remappedVS[1].x & 0x40000;
R126i.w = uf_remappedVS[1].x & 0x10000;
// 1
R123i.x = ((PV0iy == 0)?(R4i.x):(R0i.x));
R127i.w = R4i.y;
// 2
R127i.x = ((R127i.z == 0)?(R123i.x):(R123i.x));
PV0iy = floatBitsToInt(-(intBitsToFloat(R127i.w)) + 1.0);
// 3
R123i.w = ((R127i.z == 0)?(R127i.w):(PV0iy));
// 4
R4i.x = ((R126i.w == 0)?(R127i.x):(R123i.w));
R4i.y = ((R126i.w == 0)?(R123i.w):(R127i.x));
}
activeMaskStackC[1] = activeMaskStack[0] == true && activeMaskStackC[0] == true;
if( activeMaskStackC[1] == true ) {
// 0
tempi.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(R4i.w)),vec4(intBitsToFloat(uf_remappedVS[27].x),intBitsToFloat(uf_remappedVS[27].y),intBitsToFloat(uf_remappedVS[27].z),intBitsToFloat(uf_remappedVS[27].w))));
PV0ix = tempi.x;
PV0iy = tempi.x;
PV0iz = tempi.x;
PV0iw = tempi.x;
// 1
PV1ix = PV0ix;
R0i.w = PV0ix;
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(uf_remappedVS[28].w)));
// 2
R0i.x = floatBitsToInt(dot(vec4(intBitsToFloat(R4i.x),intBitsToFloat(R4i.y),intBitsToFloat(R4i.z),intBitsToFloat(PS1i)),vec4(intBitsToFloat(uf_remappedVS[28].x),intBitsToFloat(uf_remappedVS[28].y),intBitsToFloat(uf_remappedVS[28].z),1.0)));
PV0iy = R0i.x;
PV0iz = R0i.x;
PV0iw = R0i.x;
R0i.y = floatBitsToInt(-(intBitsToFloat(PV1ix)) + 1.0);
}
// export
SET_POSITION(vec4(intBitsToFloat(R5i.x), intBitsToFloat(R5i.y), intBitsToFloat(R5i.z), intBitsToFloat(R5i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.x), intBitsToFloat(R1i.w));
// export
passParameterSem1 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.x), intBitsToFloat(R3i.w));
// export
passParameterSem2 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.x), intBitsToFloat(R0i.w));
}
