/// @description Only used from the obj_system, updates the shadow map

var p = obj_player,
	d = degtorad(obj_camera.direction + 180),
	xf = p.x,
	yf = p.y - sin(d) * 50,
	zf = p.z + 10,
	xt = xf + light_direction[0],
	yt = yf + light_direction[1],
	zt = zf + light_direction[2];
	
light_view = matrix_build_lookat(xf, yf, zf, xt, yt, zt, 0, 0, 1);
	
if (!surface_exists(light_surface)) {
	light_surface = surface_create(2048, 2048);
}

surface_set_target(light_surface);
draw_clear_alpha(c_black, 1.0);

shader_set(shd_shadow);

matrix_set(matrix_projection, light_ortho);

for (var i=0,len=array_length_1d(draw_models);i<len;i++) {
	var mdl = draw_models[i];
	if (!mdl[MDL_CAST_SHADOW]){ continue; }
	
	var m_view = matrix_multiply(mdl[MDL_MATRIX], light_view);
	
	matrix_set(matrix_view, m_view);
		
	var os = mdl[MDL_OFFSET];
	shader_set_uniform_f(global.LIGHT_POSITION_OFFSET, os[0], os[1], os[2]);

	vertex_submit(mdl[MDL_MODEL], pr_trianglelist, -1);
}

surface_reset_target();