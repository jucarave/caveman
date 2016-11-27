/// @description Inits the global systems

sys_init();

draw_models = array_1d(noone);

room_goto_next();

// Default GMS matrices
m_projection_ortho = matrix_get(matrix_projection);
m_view_ortho = matrix_get(matrix_view);

// Sun Light
light_surface = surface_create(2048, 2048);
light_direction = normalize(-1, -1, -1);
light_view = matrix_build_lookat(20, 20, 20, 0, 0, 0, 0, 0, 1);
light_ortho = matrix_build_projection_ortho(64.0, 64.0, 0.01, 100.0);