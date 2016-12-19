/// @description multiplies all the vertices of a solid mesh with a transformation matrix
/// @param solid_mesh
/// @param transformation_matrix

var sm = argument[0],
	tm = argument[1],
	
	len = array_length_1d(sm),
	ret = array_create(len);
	
for (var i=0;i<len;i++) {
	var v = sm[i],
		nv = array_create(3);
	
	nv[0] = v[0] * tm[0] + v[1] * tm[4] + v[2] * tm[8];
	nv[1] = v[0] * tm[1] + v[1] * tm[5] + v[2] * tm[9];
	nv[2] = v[0] * tm[2] + v[1] * tm[6] + v[2] * tm[10];
	
	ret[i] = nv;
}

return ret;