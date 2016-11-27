/// @description Renders a collection of meshes using a shader and a view
/// @param shader
/// @param projection
/// @param view
/// @param models

shader_set(shd_main);

matrix_set(matrix_projection, obj_camera.m_projection);

shader_set_uniform_f_array(global.LIGHT_DIRECTION, light_direction);

for (var i=1,len=array_length_1d(draw_models);i<len;i++) {
	var mdl = draw_models[i],
		m_view = matrix_multiply(mdl[MDL_MATRIX], obj_camera.m_view);
	
	matrix_set(matrix_view, m_view);

	shader_set_uniform_matrix_array(global.MODEL_MATRIX, mdl[MDL_MATRIX]);

	vertex_submit(mdl[MDL_MODEL], pr_trianglelist, -1);
}

shader_reset();