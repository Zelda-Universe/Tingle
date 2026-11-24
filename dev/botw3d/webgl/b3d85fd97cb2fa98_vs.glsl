#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader b3d85fd97cb2fa98
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define SET_POSITION(_v) gl_Position = _v
TEXTURE_LAYOUT(32, 0, 0) uniform sampler2D textureUnitVS0;
TEXTURE_LAYOUT(33, 0, 1) uniform sampler2D textureUnitVS1;
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
ivec4 R2i = ivec4(0);
ivec4 R3i = ivec4(0);
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
// 0
R3i.x = R1i.x;
R3i.x = floatBitsToInt(intBitsToFloat(R3i.x) * 2.0);
R3i.y = R1i.y;
R3i.y = floatBitsToInt(intBitsToFloat(R3i.y) * 2.0);
R3i.z = 0xbf5fdfe0;
R3i.w = 0x3f800000;
R0i.w = 0;
// 1
R1i.x = 0x3f755555;
R1i.y = 0;
R1i.z = floatBitsToInt(roundEven(0.0));
R0i.xy = ivec4(textureSize(textureUnitVS1, 0),1,1).xy;
R1i.zw = floatBitsToInt(texture(textureUnitVS0, vec2(intBitsToFloat(R1i.x),intBitsToFloat(R1i.y))).xy);
// export
SET_POSITION(vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w)));
// 0
R127i.z = floatBitsToInt(float(R0i.x));
// 1
R127i.y = floatBitsToInt(float(R0i.y));
// 2
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R127i.z));
// 3
R1i.x = floatBitsToInt(-(intBitsToFloat(PS0i)) * intBitsToFloat(0x3c23d70a) + intBitsToFloat(R2i.x));
PS1i = floatBitsToInt(1.0 / intBitsToFloat(R127i.y));
// 4
R1i.y = floatBitsToInt(-(intBitsToFloat(PS1i)) * intBitsToFloat(0x3c23d70a) + intBitsToFloat(R2i.y));
// export
passParameterSem0 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
}
