/// @description returns the normal al plane equation of a triangle
/// @param triangle

var triangle = argument[0];

var edge_1 = vectors_difference(triangle[1], triangle[0]),
	edge_2 = vectors_difference(triangle[2], triangle[0]),
	origin = triangle[0],
	
	normal = vector_normalize(cross(edge_1, edge_2)),
	plane = -(normal[0]*origin[0]+normal[1]*origin[1]+normal[2]*origin[2]);
	
return [
	normal,
	plane
];