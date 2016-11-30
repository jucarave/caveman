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
light_view = matrix_build_lookat(40, 40, 40, 0, 0, 0, 0, 0, 1);
light_ortho = matrix_build_projection_ortho(96.0, 96.0, 0.01, 300.0);
light_update = true;

// Map Terrain
terrain = pb_terrain(spr_heightmap, 5);