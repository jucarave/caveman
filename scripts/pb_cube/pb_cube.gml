/// @descrition Creates a 3D cube with the origin at its center
/// @param width
/// @param length
/// @param height
/// @param color

var w = argument[0] / 2.0,
	l = argument[1] / 2.0,
	h = argument[2] / 2.0,
	c = argument[3];
	
buffer = vertex_create_buffer();

vertex_begin(buffer, global.VERTEX_FORMAT);

// Front face
pb_position_normal_color(buffer,	-w,  l,  h,		0,  1,  0,		c, 1.0);
pb_position_normal_color(buffer,	 w,  l, -h,		0,  1,  0,		c, 1.0);
pb_position_normal_color(buffer,	-w,  l, -h,		0,  1,  0,		c, 1.0);
pb_position_normal_color(buffer,	-w,  l,  h,		0,  1,  0,		c, 1.0);
pb_position_normal_color(buffer,	 w,  l,  h,		0,  1,  0,		c, 1.0);
pb_position_normal_color(buffer,	 w,  l, -h,		0,  1,  0,		c, 1.0);

// Back face
pb_position_normal_color(buffer,	 w, -l,  h,		0, -1,  0,		c, 1.0);
pb_position_normal_color(buffer,	-w, -l, -h,		0, -1,  0,		c, 1.0);
pb_position_normal_color(buffer,	 w, -l, -h,		0, -1,  0,		c, 1.0);
pb_position_normal_color(buffer,	 w, -l,  h,		0, -1,  0,		c, 1.0);
pb_position_normal_color(buffer,	-w, -l,  h,		0, -1,  0,		c, 1.0);
pb_position_normal_color(buffer,	-w, -l, -h,		0, -1,  0,		c, 1.0);

// Left face
pb_position_normal_color(buffer,	-w, -l,  h,		-1,  0,  0,		c, 1.0);
pb_position_normal_color(buffer,	-w,  l, -h,		-1,  0,  0,		c, 1.0);
pb_position_normal_color(buffer,	-w, -l, -h,		-1,  0,  0,		c, 1.0);
pb_position_normal_color(buffer,	-w, -l,  h,		-1,  0,  0,		c, 1.0);
pb_position_normal_color(buffer,	-w,  l,  h,		-1,  0,  0,		c, 1.0);
pb_position_normal_color(buffer,	-w,  l, -h,		-1,  0,  0,		c, 1.0);

// Right face
pb_position_normal_color(buffer,	 w,  l,  h,		1,  0,  0,		c, 1.0);
pb_position_normal_color(buffer,	 w, -l, -h,		1,  0,  0,		c, 1.0);
pb_position_normal_color(buffer,	 w,  l, -h,		1,  0,  0,		c, 1.0);
pb_position_normal_color(buffer,	 w,  l,  h,		1,  0,  0,		c, 1.0);
pb_position_normal_color(buffer,	 w, -l,  h,		1,  0,  0,		c, 1.0);
pb_position_normal_color(buffer,	 w, -l, -h,		1,  0,  0,		c, 1.0);

// Top face
pb_position_normal_color(buffer,	-w, -l,  h,		0,  0,  1,		c, 1.0);
pb_position_normal_color(buffer,	 w,  l,  h,		0,  0,  1,		c, 1.0);
pb_position_normal_color(buffer,	-w,  l,  h,		0,  0,  1,		c, 1.0);
pb_position_normal_color(buffer,	-w, -l,  h,		0,  0,  1,		c, 1.0);
pb_position_normal_color(buffer,	 w, -l,  h,		0,  0,  1,		c, 1.0);
pb_position_normal_color(buffer,	 w,  l,  h,		0,  0,  1,		c, 1.0);

// Bottom face
pb_position_normal_color(buffer,	-w,  l, -h,		0,  0, -1,		c, 1.0);
pb_position_normal_color(buffer,	 w, -l, -h,		0,  0, -1,		c, 1.0);
pb_position_normal_color(buffer,	-w, -l, -h,		0,  0, -1,		c, 1.0);
pb_position_normal_color(buffer,	-w,  l, -h,		0,  0, -1,		c, 1.0);
pb_position_normal_color(buffer,	 w,  l, -h,		0,  0, -1,		c, 1.0);
pb_position_normal_color(buffer,	 w, -l, -h,		0,  0, -1,		c, 1.0);

vertex_end(buffer);

return buffer;