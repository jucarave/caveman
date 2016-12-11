/// @description Creates the ramp object buffer

var model = mdl_load_obj("models/ramp.obj");
buffer = model[0];
bounding_box = cs_calculate_bbox(model[1]);
solid_mesh = model[2];

// 3D model variables
z = 6.57;

m_world = matrix_build(x, y, z, 0, 0, 0, 1, 1, 1);

// For testing the collision system
debug_mat = false;