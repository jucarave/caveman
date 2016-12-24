/// @description Checks for a collision between a ellipsoid and a mesh
/// @param position
/// @param ellipse_size
/// @param velocity
/// @param collision_data

var es_position = argument[0],
	ellipse_size = argument[1],
	es_velocity = argument[2],
	collision_data = argument[3],
	mp = collision_data[@CS_MESH_POSITION],
	collision_mesh = global.COLLISION_MESHES[collision_data[CS_MESH_INDEX]],
	planes = collision_data[@CS_PLANES],
	triangles = collision_mesh[@1],
	len,
	ret = noone, min_distance = 10000,
	velocity_length = vector_length(es_velocity);
	
for (var i=0,len=array_length_1d(triangles);i<len;i+=3) {
	var t1 = triangles[i],
		t2 = triangles[i + 1],
		t3 = triangles[i + 2];
		
	// Move the triangle to the mesh position and transform it into eSpace
	var es_triangle = [
		[(mp[0] + t1[0]) / ellipse_size[0], (mp[1] + t1[1]) / ellipse_size[1], (mp[2] + t1[2]) / ellipse_size[2]],
		[(mp[0] + t2[0]) / ellipse_size[0], (mp[1] + t2[1]) / ellipse_size[1], (mp[2] + t2[2]) / ellipse_size[2]],
		[(mp[0] + t3[0]) / ellipse_size[0], (mp[1] + t3[1]) / ellipse_size[1], (mp[2] + t3[2]) / ellipse_size[2]]
	];
	
	var plane_index = i / 3;
	if (collision_data[@CS_LAST_ELLIPSE] == -1) {
		planes[@plane_index] = get_triangle_plane(es_triangle);
	}
	
	var plane = planes[plane_index];
	
	var hit = cs_sphere_triangle_collision(es_position, es_velocity, es_triangle, plane);
	if (is_array(hit)) {
		var dist_to_col = hit[1] * velocity_length;
		if (dist_to_col < min_distance) {
			ret = hit;
			min_distance = dist_to_col;
		}
	}
}

return ret;