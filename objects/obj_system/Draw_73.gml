/// @description Draws all the models on the screen

// Render shadow map
if (!surface_exists(light_surface)) {
	light_surface = surface_create(2048, 2048);
}

surface_set_target(light_surface);
draw_clear_alpha(c_black, 1.0);

shader_set(shd_shadow);

matrix_set(matrix_projection, light_ortho);

for (var i=1,len=array_length_1d(draw_models);i<len;i++) {
	var mdl = draw_models[i];
	if (!mdl[MDL_CAST_SHADOW]){ continue; }
	
	var m_view = matrix_multiply(mdl[MDL_MATRIX], light_view);
	
	matrix_set(matrix_view, m_view);

	vertex_submit(mdl[MDL_MODEL], pr_trianglelist, -1);
}

surface_reset_target();

// Render scene
shader_set(shd_main);

matrix_set(matrix_projection, obj_camera.m_projection);

shader_set_uniform_f_array(global.LIGHT_DIRECTION, light_direction);
texture_set_stage(global.SHADOW_MAP, surface_get_texture(light_surface));

for (var i=1,len=array_length_1d(draw_models);i<len;i++) {
	var mdl = draw_models[i],
		m_view = matrix_multiply(mdl[MDL_MATRIX], obj_camera.m_view);
	
	matrix_set(matrix_view, m_view);
	
	shader_set_uniform_matrix_array(global.MODEL_MATRIX, mdl[MDL_MATRIX]);
	
	m_view = matrix_multiply(mdl[MDL_MATRIX], light_view);
	shader_set_uniform_matrix_array(global.LIGHT_VIEW, m_view);
	shader_set_uniform_matrix_array(global.LIGHT_PROJECTION, light_ortho);

	vertex_submit(mdl[MDL_MODEL], pr_trianglelist, -1);
}

shader_reset();

/*matrix_set(matrix_projection, m_projection_ortho);
matrix_set(matrix_view, m_view_ortho);

if (!surface_exists(light_surface)) {
	light_surface = surface_create(1024, 512);
}

surface_set_target(light_surface);
draw_clear_alpha(c_black, 0);
draw_surface(application_surface, 0, 0);
surface_reset_target();

draw_surface(light_surface, 0, 0);*/