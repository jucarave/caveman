/// @descrition Creates a 3D plane pointing up with the origin at its center
/// @param width
/// @param height
/// @param repeatH
/// @param repeatV

var w = argument[0] / 2.0,
	h = argument[1] / 2.0,
	tx = argument[2],
	ty = argument[3];
	
buffer = vertex_create_buffer();

vertex_begin(buffer, global.VERTEX_FORMAT);

pb_position_normal_color(buffer,	-w, -h,  0,		0,  0,  1,		c_white, 1.0);
pb_position_normal_color(buffer,	 w,  h,  0,		0,  0,  1,		c_white, 1.0);
pb_position_normal_color(buffer,	-w,  h,  0,		0,  0,  1,		c_white, 1.0);
pb_position_normal_color(buffer,	-w, -h,  0,		0,  0,  1,		c_white, 1.0);
pb_position_normal_color(buffer,	 w, -h,  0,		0,  0,  1,		c_white, 1.0);
pb_position_normal_color(buffer,	 w,  h,  0,		0,  0,  1,		c_white, 1.0);

vertex_end(buffer);

return buffer;