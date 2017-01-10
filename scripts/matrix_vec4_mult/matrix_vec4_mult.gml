/// @description Multiplies a matrix4 with a vector4 and returns a vector4
/// @param matrix4
/// @param vector4

var m4 = argument[0],
	v4 = argument[1];
	
return [
	v4[0] * m4[0] + v4[1] * m4[4] + v4[2] * m4[8]  + v4[3] * m4[12],
	v4[0] * m4[1] + v4[1] * m4[5] + v4[2] * m4[9]  + v4[3] * m4[13],
	v4[0] * m4[2] + v4[1] * m4[6] + v4[2] * m4[10] + v4[3] * m4[14],
	v4[0] * m4[3] + v4[1] * m4[7] + v4[2] * m4[11] + v4[3] * m4[15]
];