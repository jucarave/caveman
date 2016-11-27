/// @description Draws all the models on the screen

shader_set(shd_main);

matrix_set(matrix_projection, obj_camera.m_projection);

for (var i=1,len=array_length_1d(draw_models);i<len;i++) {
	var mdl = draw_models[i],
		m_view = matrix_multiply(mdl[MDL_MATRIX], obj_camera.m_view);
	
	matrix_set(matrix_view, m_view);

	shader_set_uniform_matrix_array(global.MODEL_MATRIX, mdl[MDL_MATRIX]);

	vertex_submit(mdl[MDL_MODEL], pr_trianglelist, -1);
}

shader_reset();

/*if (!surface_exists(surface)) {
	surface = surface_create(1024, 1024);
}

surface_set_target(surface);
//draw_surface(application_surface, 0, 0);
draw_rectangle(0, 0, 32, 32, false);
surface_reset_target();*/