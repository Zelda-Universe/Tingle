#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 2e5c98a2551212eb
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
uniform ivec4 uf_remappedVS[3];
ATTR_LAYOUT(0, 0) in uvec4 attrDataSem0;
ATTR_LAYOUT(0, 1) in uvec4 attrDataSem1;

out vec4 passParameterSem0;
out vec4 passParameterSem2;
out vec4 passParameterSem3;
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
ivec4 R123i = ivec4(0);
uvec4 attrDecoder;
int backupReg0i, backupReg1i, backupReg2i, backupReg3i, backupReg4i;
int PV0ix = 0, PV0iy = 0, PV0iz = 0, PV0iw = 0, PV1ix = 0, PV1iy = 0, PV1iz = 0, PV1iw = 0;
int PS0i = 0, PS1i = 0;
ivec4 tempi = ivec4(0);
float tempResultf;
int tempResulti;
ivec4 ARi = ivec4(0);
bool predResult = true;
R0i = ivec4(gl_VertexID, 0, 0, gl_InstanceID);
attrDecoder.xyz = attrDataSem0.xyz;
attrDecoder.xyz = uvec3((attrDecoder.xyz>>24)|((attrDecoder.xyz>>8)&0xFF00u)|((attrDecoder.xyz<<8)&0xFF0000u)|((attrDecoder.xyz<<24)));
attrDecoder.w = uint(0);
R1i = ivec4(int(attrDecoder.x), int(attrDecoder.y), int(attrDecoder.z), 0x3f800000);
// skipped unused attribute for r2
// 0
R1i.x = R1i.x;
R1i.x = floatBitsToInt(intBitsToFloat(R1i.x) * 2.0);
R1i.y = R1i.y;
R1i.y = floatBitsToInt(intBitsToFloat(R1i.y) * 2.0);
R1i.z = 0;
R1i.w = 0x3f800000;
PS0i = floatBitsToInt(max(intBitsToFloat(uf_remappedVS[0].x), intBitsToFloat(0x38d1b717)));
// 1
PV1iy = floatBitsToInt(min(intBitsToFloat(PS0i), intBitsToFloat(0x3f7ff972)));
// 2
R123i.x = floatBitsToInt(60.0 * intBitsToFloat(PV1iy) + intBitsToFloat(0x45c6c000));
// 3
R0i.z = R123i.x;
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R123i.x));
// 4
PV0iz = floatBitsToInt(intBitsToFloat(PS1i) * intBitsToFloat(0x45c6c000));
// 5
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iz)),intBitsToFloat(PV0iz)) + 1.0);
R123i.y = clampFI32(R123i.y);
// 6
PS0i = floatBitsToInt(sqrt(intBitsToFloat(R123i.y)));
// 7
R0i.y = floatBitsToInt(-(intBitsToFloat(PS0i)));
R123i.w = floatBitsToInt(intBitsToFloat(uf_remappedVS[1].w) * 1.0 + -(intBitsToFloat(PS0i)));
// 8
R0i.x = ((uf_remappedVS[2].x == 0)?(R123i.w):(0xbf800000));
// export
SET_POSITION(vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w)));
// export
passParameterSem0 = vec4(intBitsToFloat(R0i.z), intBitsToFloat(R0i.y), intBitsToFloat(R0i.y), intBitsToFloat(R0i.y));
// export
passParameterSem2 = vec4(intBitsToFloat(R0i.y), intBitsToFloat(R0i.y), intBitsToFloat(R0i.y), intBitsToFloat(R0i.y));
// export
passParameterSem3 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.y), intBitsToFloat(R0i.y));
}
