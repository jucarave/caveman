/// @description Updates the player transformation matrix

// Builds the transformation matrix
m_world = matrix_build(
	x, y, z,
	0, 0, direction,
	1, 1, 1
);