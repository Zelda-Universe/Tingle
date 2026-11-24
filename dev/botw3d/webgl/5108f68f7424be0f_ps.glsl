#version 300 es
precision highp float;
precision highp int;
precision highp sampler2DArray;
precision highp sampler2DArrayShadow;
precision highp sampler3D;
// shader 5108f68f7424be0f
// start of shader inputs/outputs, predetermined by Cemu. Do not touch
#define ATTR_LAYOUT(a, b)
#define UNIFORM_BUFFER_LAYOUT(a, b, c)
#define TEXTURE_LAYOUT(a, b, c)
#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)
uniform ivec4 uf_remappedPS[14];
uniform vec2 uf_fragCoordScale;
TEXTURE_LAYOUT(0, 1, 0) uniform sampler2D textureUnitPS0;
TEXTURE_LAYOUT(2, 1, 1) uniform sampler2DArray textureUnitPS2;
TEXTURE_LAYOUT(3, 1, 2) uniform sampler2D textureUnitPS3;
TEXTURE_LAYOUT(7, 1, 3) uniform sampler2D textureUnitPS7;
TEXTURE_LAYOUT(8, 1, 4) uniform sampler2D textureUnitPS8;
TEXTURE_LAYOUT(9, 1, 5) uniform sampler2D textureUnitPS9;
TEXTURE_LAYOUT(10, 1, 6) uniform sampler2D textureUnitPS10;
in vec4 passParameterSem0;
in vec4 passParameterSem1;
in vec4 passParameterSem7;
in vec4 passParameterSem3;
in vec4 passParameterSem4;
in vec4 passParameterSem6;
layout(location = 0) out vec4 passPixelColor0;
layout(location = 1) out vec4 passPixelColor1;
layout(location = 3) out vec4 passPixelColor3;
layout(location = 5) out vec4 passPixelColor5;
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
ivec4 R8i = ivec4(0);
ivec4 R9i = ivec4(0);
ivec4 R10i = ivec4(0);
ivec4 R11i = ivec4(0);
ivec4 R123i = ivec4(0);
ivec4 R124i = ivec4(0);
ivec4 R125i = ivec4(0);
ivec4 R126i = ivec4(0);
ivec4 R127i = ivec4(0);
int backupReg0i, backupReg1i, backupReg2i, backupReg3i, backupReg4i;
int PV0ix = 0, PV0iy = 0, PV0iz = 0, PV0iw = 0, PV1ix = 0, PV1iy = 0, PV1iz = 0, PV1iw = 0;
int PS0i = 0, PS1i = 0;
ivec4 tempi = ivec4(0);
float tempResultf;
int tempResulti;
ivec4 ARi = ivec4(0);
bool predResult = true;
R0i = floatBitsToInt(passParameterSem0);
R1i = floatBitsToInt(passParameterSem1);
R2i = floatBitsToInt(passParameterSem7);
R3i = floatBitsToInt(passParameterSem3);
R4i = floatBitsToInt(passParameterSem4);
R5i = floatBitsToInt(passParameterSem6);
R1i.xy = floatBitsToInt(texture(textureUnitPS7, vec2(intBitsToFloat(R0i.x),intBitsToFloat(R0i.y))).xy);
R5i.xy = floatBitsToInt(texture(textureUnitPS10, vec2(intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))).xy);
R0i.xy = floatBitsToInt(texture(textureUnitPS8, vec2(intBitsToFloat(R0i.z),intBitsToFloat(R0i.w))).xy);
// 0
backupReg0i = R1i.x;
R1i.x = floatBitsToInt(intBitsToFloat(R1i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R1i.y = floatBitsToInt(intBitsToFloat(backupReg0i) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PV0iz = floatBitsToInt(intBitsToFloat(R5i.z) + intBitsToFloat(uf_remappedPS[0].x));
PV0iw = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R5i.z)), intBitsToFloat(uf_remappedPS[1].y)));
PS0i = floatBitsToInt(1.0 / intBitsToFloat(R2i.w));
// 1
R6i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.x), intBitsToFloat(PS0i)));
R6i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.y), intBitsToFloat(PS0i)));
R2i.z = floatBitsToInt(intBitsToFloat(R5i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R0i.w = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(PV0iz)), intBitsToFloat(uf_remappedPS[2].x)));
R0i.z = floatBitsToInt(1.0 / intBitsToFloat(PV0iw));
R2i.w = floatBitsToInt(texture(textureUnitPS0, vec2(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y))).x);
R2i.x = floatBitsToInt(texture(textureUnitPS3, vec2(intBitsToFloat(R6i.x),intBitsToFloat(R6i.y))).y);
// 0
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R2i.w),intBitsToFloat(uf_remappedPS[3].x)) + intBitsToFloat(uf_remappedPS[0].x));
R123i.y = floatBitsToInt(intBitsToFloat(R5i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
PV0iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R1i.y)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(R1i.x)));
R7i.z = floatBitsToInt(roundEven(1.0));
// 1
backupReg0i = R123i.y;
R5i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].x),intBitsToFloat(R2i.z)) + intBitsToFloat(R1i.z));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].x),intBitsToFloat(PV0iz)) + intBitsToFloat(R6i.x));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[5].y),intBitsToFloat(PV0iw)) + intBitsToFloat(R6i.y));
PV1iw = floatBitsToInt(-(intBitsToFloat(R5i.z)) + -(intBitsToFloat(R123i.x)));
PV1iw = floatBitsToInt(intBitsToFloat(PV1iw) / 2.0);
R5i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[4].y),intBitsToFloat(backupReg0i)) + intBitsToFloat(R1i.w));
// 2
PV0ix = floatBitsToInt(max(-(intBitsToFloat(PV1iw)), 0.0));
R127i.y = floatBitsToInt(-(intBitsToFloat(R6i.y)) + intBitsToFloat(R123i.z));
R127i.z = floatBitsToInt(-(intBitsToFloat(R6i.x)) + intBitsToFloat(R123i.y));
R123i.w = floatBitsToInt(intBitsToFloat(R0i.x) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
R126i.y = floatBitsToInt(intBitsToFloat(R0i.y) * intBitsToFloat(0x40008102) + intBitsToFloat(0xbf810204));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R123i.w), intBitsToFloat(R123i.w)));
R0i.y = floatBitsToInt(intBitsToFloat(R1i.y) + intBitsToFloat(R123i.w));
R0i.z = floatBitsToInt(intBitsToFloat(R1i.x) + intBitsToFloat(R126i.y));
PV1iw = floatBitsToInt(min(intBitsToFloat(PV0ix), 1.0));
R125i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.y), intBitsToFloat(R4i.z)));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R126i.y),intBitsToFloat(R126i.y)) + intBitsToFloat(PV1ix));
R123i.x = clampFI32(R123i.x);
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.y),intBitsToFloat(PV1iw)) + intBitsToFloat(R6i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R127i.z),intBitsToFloat(PV1iw)) + intBitsToFloat(R6i.x));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.z), intBitsToFloat(R4i.x)));
R127i.x = floatBitsToInt(intBitsToFloat(R2i.x) * 255.0);
// 5
R0i.x = floatBitsToInt(-(intBitsToFloat(R6i.x)) + intBitsToFloat(R123i.z));
R1i.y = floatBitsToInt(-(intBitsToFloat(R6i.y)) + intBitsToFloat(R123i.y));
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].x), intBitsToFloat(R123i.z)));
PV1iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].y), intBitsToFloat(R123i.y)));
PS1i = floatBitsToInt(-(intBitsToFloat(R123i.x)) + 1.0);
// 6
R1i.x = floatBitsToInt(intBitsToFloat(uf_remappedPS[7].z) * 255.0);
PV0iy = floatBitsToInt(floor(intBitsToFloat(PV1iz)));
PV0iz = floatBitsToInt(floor(intBitsToFloat(PV1iw)));
PV0iw = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R3i.x), intBitsToFloat(R4i.y)));
R6i.z = floatBitsToInt(sqrt(intBitsToFloat(PS1i)));
// 7
PV1ix = floatBitsToInt(intBitsToFloat(PV0iy) + 0.5);
R8i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.z)),intBitsToFloat(R3i.x)) + intBitsToFloat(R127i.w));
R8i.z = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.y)),intBitsToFloat(R3i.z)) + intBitsToFloat(R125i.y));
PV1iw = floatBitsToInt(intBitsToFloat(PV0iz) + 0.5);
R8i.x = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(R4i.x)),intBitsToFloat(R3i.y)) + intBitsToFloat(PV0iw));
// 8
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].z), intBitsToFloat(PV1ix)));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[6].w), intBitsToFloat(PV1iw)));
R2i.z = 0x3db0b0b1;
R11i.w = 0x3f800000;
R1i.w = int(uint(intBitsToFloat(R127i.x)));
R1i.z = floatBitsToInt(texture(textureUnitPS0, vec2(intBitsToFloat(R2i.x),intBitsToFloat(R2i.y))).x);
R9i.xyz = floatBitsToInt(texture(textureUnitPS9, vec2(intBitsToFloat(R5i.x),intBitsToFloat(R5i.y))).xyz);
// 0
PV0ix = ((intBitsToFloat(R0i.w) > intBitsToFloat(R1i.z))?-1:0);
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(R6i.z)));
R11i.z = R2i.z;
R2i.w = 0x3f800000;
PS0i = int(uint(intBitsToFloat(R1i.x)));
// 1
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z),intBitsToFloat(R0i.z)) + intBitsToFloat(PV0iy));
PV1iy = R1i.w | PS0i;
R123i.w = ((PV0ix == 0)?(0x3f800000):(0));
R10i.w = 0x3b808081;
// 2
R7i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.x),intBitsToFloat(R123i.w)) + intBitsToFloat(R6i.x));
R7i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R1i.y),intBitsToFloat(R123i.w)) + intBitsToFloat(R6i.y));
R1i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y),intBitsToFloat(R0i.y)) + intBitsToFloat(R123i.x));
R0i.w = floatBitsToInt(float(uint(PV1iy)));
R1i.y = floatBitsToInt(texture(textureUnitPS0, vec2(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y))).x);
R7i.xyz = floatBitsToInt(texture(textureUnitPS2, vec3(intBitsToFloat(R7i.x),intBitsToFloat(R7i.y),intBitsToFloat(R7i.z))).xyz);
// 0
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[3].x),intBitsToFloat(R1i.y)) + intBitsToFloat(uf_remappedPS[0].x));
PV0iz = floatBitsToInt(intBitsToFloat(R0i.w) * intBitsToFloat(0x3b808081));
tempResultf = 1.0 / sqrt(intBitsToFloat(R1i.w));
PS0i = floatBitsToInt(tempResultf);
// 1
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.z), intBitsToFloat(PS0i)));
R126i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R6i.z), intBitsToFloat(PS0i)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R0i.y), intBitsToFloat(PS0i)));
PV1iw = floatBitsToInt(-(intBitsToFloat(R5i.z)) + -(intBitsToFloat(R123i.y)));
R11i.y = PV0iz;
// 2
PV0ix = floatBitsToInt(intBitsToFloat(uf_remappedPS[8].y) + -(intBitsToFloat(PV1iw)));
PV0iy = floatBitsToInt(intBitsToFloat(uf_remappedPS[8].z) + -(intBitsToFloat(PV1iw)));
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedPS[8].x) + -(intBitsToFloat(PV1iw)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.w), intBitsToFloat(PV1ix)));
R124i.w = floatBitsToInt(intBitsToFloat(uf_remappedPS[8].w) + -(intBitsToFloat(PV1iw)));
// 3
PV1ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].y), intBitsToFloat(PV0ix)));
PV1ix = clampFI32(PV1ix);
PV1iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].z), intBitsToFloat(PV0iy)));
PV1iy = clampFI32(PV1iy);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].x), intBitsToFloat(PV0iz)));
PV1iz = clampFI32(PV1iz);
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.z), intBitsToFloat(R127i.w)));
R127i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.y), intBitsToFloat(R127i.w)));
// 4
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.x),-(intBitsToFloat(PV1ix))) + intBitsToFloat(R9i.x));
R123i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.y),-(intBitsToFloat(PV1ix))) + intBitsToFloat(R9i.y));
R123i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].x),-(intBitsToFloat(PV1iy))) + intBitsToFloat(uf_remappedPS[10].x));
R123i.z = clampFI32(R123i.z);
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R9i.z),-(intBitsToFloat(PV1ix))) + intBitsToFloat(R9i.z));
tempResultf = max(0.0, intBitsToFloat(PV1iz));
tempResultf = log2(tempResultf);
if( isinf(tempResultf) == true ) tempResultf = -3.40282347E+38;
PS0i = floatBitsToInt(tempResultf);
// 5
backupReg0i = R127i.w;
R126i.x = floatBitsToInt(intBitsToFloat(R123i.z) + intBitsToFloat(R123i.x));
R126i.x = clampFI32(R126i.x);
R125i.y = floatBitsToInt(intBitsToFloat(R123i.z) + intBitsToFloat(R123i.y));
R125i.y = clampFI32(R125i.y);
PV1iz = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[10].w), intBitsToFloat(PS0i)));
R127i.w = floatBitsToInt(intBitsToFloat(R123i.z) + intBitsToFloat(R123i.w));
R127i.w = clampFI32(R127i.w);
PS1i = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R8i.x), intBitsToFloat(backupReg0i)));
// 6
backupReg0i = R127i.z;
R123i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.x),intBitsToFloat(backupReg0i)) + intBitsToFloat(R126i.w));
R123i.y = floatBitsToInt(mul_nonIEEE(-(intBitsToFloat(uf_remappedPS[10].y)),intBitsToFloat(R126i.x)) + intBitsToFloat(uf_remappedPS[10].y));
R123i.y = clampFI32(R123i.y);
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.y),intBitsToFloat(backupReg0i)) + intBitsToFloat(R127i.x));
R125i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R4i.z),intBitsToFloat(backupReg0i)) + intBitsToFloat(PS1i));
R125i.x = floatBitsToInt(exp2(intBitsToFloat(PV1iz)));
R125i.x = clampFI32(R125i.x);
// 7
R127i.x = floatBitsToInt(intBitsToFloat(R123i.y) * 63.75);
R127i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[11].x), intBitsToFloat(R125i.x)));
R126i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[11].z), intBitsToFloat(R125i.x)));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[11].y), intBitsToFloat(R125i.x)));
R4i.w = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R3i.x),intBitsToFloat(R126i.y)) + intBitsToFloat(R123i.x))/2.0);
// 8
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[12].z), intBitsToFloat(R126i.x)));
PV0iy = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[12].z), intBitsToFloat(R125i.y)));
PV0iz = floatBitsToInt(intBitsToFloat(uf_remappedPS[13].x) + -(intBitsToFloat(R127i.y)));
R127i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[12].z), intBitsToFloat(R127i.w)));
PS0i = floatBitsToInt(intBitsToFloat(uf_remappedPS[13].y) + -(intBitsToFloat(R126i.w)));
// 9
R126i.x = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R3i.y),intBitsToFloat(R126i.y)) + intBitsToFloat(R127i.z))/2.0);
PV1iy = floatBitsToInt(intBitsToFloat(uf_remappedPS[13].z) + -(intBitsToFloat(R126i.z)));
R127i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PS0i),intBitsToFloat(PV0iy)) + intBitsToFloat(R126i.w));
R126i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0iz),intBitsToFloat(PV0ix)) + intBitsToFloat(R127i.y));
R125i.z = floatBitsToInt((mul_nonIEEE(intBitsToFloat(R3i.z),intBitsToFloat(R126i.y)) + intBitsToFloat(R125i.w))/2.0);
// 10
PV0ix = floatBitsToInt(mul_nonIEEE(intBitsToFloat(uf_remappedPS[9].w), intBitsToFloat(R124i.w)));
PV0ix = clampFI32(PV0ix);
PV0iy = floatBitsToInt(floor(intBitsToFloat(R127i.x)));
PV0iy = floatBitsToInt(intBitsToFloat(PV0iy) * 4.0);
R2i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.z),-(intBitsToFloat(R125i.x))) + intBitsToFloat(R7i.z));
R123i.w = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV1iy),intBitsToFloat(R127i.w)) + intBitsToFloat(R126i.z));
R2i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.x),-(intBitsToFloat(R125i.x))) + intBitsToFloat(R7i.x));
// 11
R10i.x = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R126i.w)));
R10i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R127i.z)));
R10i.z = floatBitsToInt(mul_nonIEEE(intBitsToFloat(PV0ix), intBitsToFloat(R123i.w)));
R7i.w = floatBitsToInt(intBitsToFloat(PV0iy) * intBitsToFloat(0x3b808081) + intBitsToFloat(0x3b808081));
R2i.y = floatBitsToInt(mul_nonIEEE(intBitsToFloat(R7i.y),-(intBitsToFloat(R125i.x))) + intBitsToFloat(R7i.y));
// 12
R7i.x = floatBitsToInt(intBitsToFloat(R4i.w) + 0.5);
R7i.y = floatBitsToInt(intBitsToFloat(R126i.x) + 0.5);
R7i.z = floatBitsToInt(intBitsToFloat(R125i.z) + 0.5);
// 13
R3i.x = R2i.x;
R3i.y = R2i.y;
R3i.z = R2i.z;
R3i.w = R2i.w;
// 14
R2i.x = R7i.x;
R2i.y = R7i.y;
R2i.z = R7i.z;
R2i.w = R7i.w;
// 15
R1i.x = R10i.x;
R1i.y = R10i.y;
R1i.z = R10i.z;
R1i.w = R10i.w;
// 16
R0i.x = R11i.z;
R0i.y = R11i.y;
R0i.z = R11i.z;
R0i.w = R11i.w;
// export
passPixelColor0 = vec4(intBitsToFloat(R0i.x), intBitsToFloat(R0i.y), intBitsToFloat(R0i.z), intBitsToFloat(R0i.w));
passPixelColor1 = vec4(intBitsToFloat(R1i.x), intBitsToFloat(R1i.y), intBitsToFloat(R1i.z), intBitsToFloat(R1i.w));
passPixelColor3 = vec4(intBitsToFloat(R2i.x), intBitsToFloat(R2i.y), intBitsToFloat(R2i.z), intBitsToFloat(R2i.w));
passPixelColor5 = vec4(intBitsToFloat(R3i.x), intBitsToFloat(R3i.y), intBitsToFloat(R3i.z), intBitsToFloat(R3i.w));
}
