/// @description Creates a model using the json information and adds it to a room
/// @param room
/// @param tileset
/// @param tile_code
/// @param position
/// @param rotation

var mdl = argument[0],
	tileset = argument[1],
	tile_code = argument[2],
	pos = argument[3],
	rot_z = argument[4],
	
	tiles = tileset[? "objects"],
	tile = tiles[? tile_code],
	
	f = tileset[? "floats"],
	m = tileset[? "materials"],
	vertices = tile[? "vertices"],
	normals = tile[? "normals"],
	groups = tile[? "groups"],
	
	size = ds_list_size(groups),
	order = [0, 2, 1],
	
	t_m = matrix_build(pos[0], pos[1], pos[2], 0, 0, rot_z, 1, 1, 1);
	
for (var i=0;i<size;i++) {
	var obj = groups[| i],
		mat = obj[? "material"],
		triangles = obj[? "triangles"],
		
		c_raw = m[? mat],
		color = make_color_rgb(
			round(f[| c_raw[| 0]] * 255), 
			round(f[| c_raw[| 1]] * 255), 
			round(f[| c_raw[| 2]] * 255)),
		alpha = c_raw[| 3],
		
		t_size = ds_list_size(triangles);
	
	for (var j=0;j<t_size;j++) {
		var t = triangles[| j];
		
		for (var k=0;k<3;k++) {
			var ind = t[| order[k]],
				v = vertices[| ind[| 0]],
				n = normals[| ind[| 1]],
				
				p = matrix_vec4_mult(t_m, [f[| v[| 0]], -f[| v[| 1]], f[| v[| 2]], 1]),
				n = matrix_vec4_mult(t_m, [f[| n[| 0]], -f[| n[| 1]], f[| n[| 2]], 0]);
				
			pb_position_normal_color(mdl,	
					p[0], p[1], p[2],
					n[0], n[1], n[2],
					color, alpha
			);
		}
	}
}

return mdl;