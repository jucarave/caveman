/// @description Returns the bounding box of a 3d triangle
/// @param triangle

var triangle = argument[0],
	xmin, ymin, zmin, 
	xmax, ymax, zmax;
	
for (var i=0;i<3;i++) {
	var v = triangle[i];
	
	if (i == 0) {
		xmin = v[0];
		ymin = v[1];
		zmin = v[2];
		xmax = v[0];
		ymax = v[1];
		zmax = v[2];
	} else {
		xmin = min(xmin, v[0]);
		ymin = min(ymin, v[1]);
		zmin = min(zmin, v[2]);
		xmax = max(xmax, v[0]);
		ymax = max(ymax, v[1]);
		zmax = max(zmax, v[2]);
	}
}

return [
	xmin,
	ymin,
	zmin,
	xmax,
	ymax,
	zmax
];