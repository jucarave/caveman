/// @description Calculates the bounding box of a list of vertices
/// @param lits_of_vertices

var vertices = argument[0],
	v, x1, y1, z1, x2, y2, z2;

for (var i=1,len=array_length_1d(vertices);i<len;i++) {
	v = vertices[i];
	
	if (i == 1) {
		x1 = v[0];
		x2 = v[0];
		
		y1 = v[1];
		y2 = v[1];
		
		z1 = v[2];
		z2 = v[2];
	} else {
		x1 = min(v[0], x1);
		x2 = max(v[0], x2);
		
		y1 = min(v[1], y1);
		y2 = max(v[1], y2);
		
		z1 = min(v[2], z1);
		z2 = max(v[2], z2);
	}
}

return [x1, y1, z1, x2, y2, z2];