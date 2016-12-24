/// @description Draws all the models on the screen

// Render shadow map
sys_shadow_pass();

// Render scene
shader_set(shd_main);

matrix_set(matrix_projection, obj_camera.m_projection);

shader_set_uniform_matrix_array(global.LIGHT_PROJECTION, light_ortho);

shader_set_uniform_f_array(global.LIGHT_DIRECTION, light_direction);
shader_set_uniform_f(global.PLAYER_POSITION, obj_player.x, obj_player.y, obj_player.z);
texture_set_stage(global.SHADOW_MAP, surface_get_texture(light_surface));

for (var i=0,len=array_length_1d(draw_models);i<len;i++) {
	var mdl = draw_models[i],
		m_view = matrix_multiply(mdl[MDL_MATRIX], obj_camera.m_view);
	
	matrix_set(matrix_view, m_view);
	
	shader_set_uniform_matrix_array(global.MODEL_MATRIX, mdl[MDL_MATRIX]);
	
	m_view = matrix_multiply(mdl[MDL_MATRIX], light_view);
	shader_set_uniform_matrix_array(global.LIGHT_VIEW, m_view);
	
	var os = mdl[MDL_OFFSET];
	shader_set_uniform_f(global.POSITION_OFFSET, os[0], os[1], os[2]);

	vertex_submit(mdl[MDL_MODEL], pr_trianglelist, -1);
}

shader_reset();

matrix_set(matrix_projection, m_projection_ortho);
matrix_set(matrix_view, m_view_ortho);

draw_surface_ext(light_surface, 0, 0, 128/2048, 128/2048, 0, c_white, 1);

draw_set_color(c_black);
draw_text(32, 480 - 48, "CIC = " + string(collisions_count));
draw_text(32, 480 - 32, "FPS = " + string(fps_real));
draw_set_color(c_white);

dbg_draw_quadtree(obj_world.quadtree);