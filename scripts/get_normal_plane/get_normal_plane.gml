/// @description Returns a plane based on a position and a normal
/// @param position
/// @param normal

var position = argument[0],
	normal = argument[1];

var origin = position,
	plane = -(normal[0]*origin[0]+normal[1]*origin[1]+normal[2]*origin[2]);
	
return [
	normal,
	plane
];