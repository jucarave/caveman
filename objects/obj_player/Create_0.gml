/// @description Creates the model and 3D variables

// Player model
buffer = mdl_load_obj("models/capsule.obj");

// Player transform matrix
m_world = matrix_build_identity();

// 3D variables
z = 0;

// Requires an update of the transformation matrix
requires_update = true;

// Movement speed
mv_spd = 0.3;

// Rotate tween control
direction = 270;
rotate_to = 270;
rotate_spd = 0;