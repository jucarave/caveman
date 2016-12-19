/// @description Updates the animal transformation matrix

m_world = matrix_build(
	x, y, z,
	0, 0, direction,
	1, 1, 1
);

// Transform solid mesh
if (direction != previous_direction) {
	solid_mesh = transform_solid_mesh(solid_base, m_world);
	bounding_box = cs_calculate_bbox(solid_mesh);
	
	previous_direction = direction;
}