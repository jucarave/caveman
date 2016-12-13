/// @description Returns the bounding box of a sphere
/// @param position

var p = argument[0];

return [
	p[0] - 1.3,
	p[1] - 1.3,
	p[2] - 1.3,
	p[0] + 1.3,
	p[1] + 1.3,
	p[2] + 1.3
];