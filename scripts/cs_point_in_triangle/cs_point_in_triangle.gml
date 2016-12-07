/// @description Returns whenever a point is inside a triangle
/// @param point
/// @param triangle

var point = argument[0],
	triangle = argument[1];
	
var v0 = vectors_difference(triangle[1], triangle[0]),
	v1 = vectors_difference(triangle[2], triangle[0]),
	v2 = vectors_difference(point, triangle[0]);
	
var dot00 = dot_product_3d(v0[0], v0[1], v0[2], v0[0], v0[1], v0[2]),
	dot01 = dot_product_3d(v0[0], v0[1], v0[2], v1[0], v1[1], v1[2]),
	dot02 = dot_product_3d(v0[0], v0[1], v0[2], v2[0], v2[1], v2[2]),
	dot11 = dot_product_3d(v1[0], v1[1], v1[2], v1[0], v1[1], v1[2]),
	dot12 = dot_product_3d(v1[0], v1[1], v1[2], v2[0], v2[1], v2[2]);
	
var invDenom = 1 / (dot00 * dot11 - dot01 * dot01);

var u = (dot11 * dot02 - dot01 * dot12) * invDenom,
	v = (dot00 * dot12 - dot01 * dot02) * invDenom;
	
return (u >= 0 && v >= 0 && u + v < 1);