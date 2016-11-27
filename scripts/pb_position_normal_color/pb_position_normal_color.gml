/// @description Adds a 3d vertex position a 2d normal and a color
/// @param buffer
/// @param x
/// @param y
/// @param z
/// @param nx
/// @param ny
/// @param nz
/// @param color
/// @param alpha

var buffer		= argument[0],
	_x			= argument[1],
	_y			= argument[2],
	_z			= argument[3],
	nx			= argument[4],
	ny			= argument[5],
	nz			= argument[6],
	color		= argument[7],
	alpha		= argument[8];

vertex_position_3d(buffer, _x, _y, _z);
vertex_normal(buffer, nx, ny, nz);
vertex_color(buffer, color, alpha);