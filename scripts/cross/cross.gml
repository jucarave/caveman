/// @description Returns the cross product between 2 (array) vectors
/// @param vector1
/// @param vector2

var v1 = argument[0],
	v2 = argument[1];

return [
	v1[1] * v2[2] - v1[2] * v2[1],
	v1[2] * v2[0] - v1[0] * v2[2],
	v1[0] * v2[1] - v1[1] * v2[0]
];