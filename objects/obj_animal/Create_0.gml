/// @description Creates the animal model and transformation matrix

var model = mdl_load_obj("models/animal.obj");
buffer = model[0];
solid_mesh = model[2];
solid_base = model[2];
bounding_box = cs_calculate_bbox(solid_mesh);
ellipse_collision = [3, 3, 1.5];

m_world = matrix_build_identity();

previous_direction = 0;
requires_update = true;

// 3D model variables
base_z = 0.0;
z = 0.0;
z_speed = 0.0;
z_gravity = 0.0;

// Debug movement
x_vel = 0.1;