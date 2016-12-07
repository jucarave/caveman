/// @description returns the signed distance from a point to a plane
/// @param point
/// @param plane_normal
/// @param plane_constant

var point = argument[0],
	normal = argument[1],
	pc = argument[2];

return dot_product_3d(point[0], point[1], point[2], normal[0], normal[1], normal[2]) + pc;