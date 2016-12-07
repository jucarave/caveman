/// @description Creates the model and 3D variables

// Player model
var model = mdl_load_obj("models/capsule.obj");
buffer = model[0];
bounding_box = cs_calculate_bbox(model[1]);
ellipse_collision = [1, 1, 2.5];

show_debug_message(bounding_box);

// Player transform matrix
m_world = matrix_build_identity();

// 3D variables
base_z = 0.0;
z = 0.0;
z_speed = 0.0;
z_gravity = 0.0;

// Requires an update of the transformation matrix
requires_update = true;

// Movement speed
mv_spd = 0.7;

// is Jumping
jump = 0;

// Rotate tween control
direction = 270;
rotate_to = 270;
rotate_spd = 0;