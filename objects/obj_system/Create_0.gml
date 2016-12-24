/// @description Inits the global systems

sys_init();
sys_load_collision_meshes();

// Models to draw
draw_models = [];

// Collision meshes
collisions = [];

// Collision count
collisions_count = 0;

// Default GMS matrices
m_projection_ortho = matrix_get(matrix_projection);
m_view_ortho = matrix_get(matrix_view);

// Sun Light
light_surface = surface_create(2048, 2048);
light_direction = normalize(0, -1, -1);
light_view = matrix_build_lookat(5, 5, 5, 0, 0, 0, 0, 0, 1);
//light_ortho = matrix_build_projection_ortho(200.0, 200.0, -100.0, 300.0);
light_ortho = create_ortho(200.0, 200.0, -50.0, 50.0);

// Map Terrain
terrain = pb_terrain(spr_heightmap, 5);

//show_debug_overlay(true);

room_goto_next();