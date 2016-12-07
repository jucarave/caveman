/// @description Multiplies a scalar to a vector
/// @param vector3
/// @param scalar

var vector = argument[0],
	scalar = argument[1];

return [
	vector[0] * scalar,
	vector[1] * scalar,
	vector[2] * scalar
];