/// @description Returns a bounding box moved to a position
/// @param bounding_box
/// @param position

var bb = argument[0],
	p = argument[1];
	
return [
	bb[0] + p[0],
	bb[1] + p[1],
	bb[2] + p[2],
	bb[3] + p[0],
	bb[4] + p[1],
	bb[5] + p[2]
];