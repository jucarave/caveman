// Macros definitions
#macro MDL_MODEL 0
#macro MDL_MATRIX 1

// Vertex format
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_color();
global.VERTEX_FORMAT = vertex_format_end();

// 3D GPU properties
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
gpu_set_cullmode(cull_counterclockwise);
/*gpu_set_texfilter(true);*/

global.MODEL_MATRIX = shader_get_uniform(shd_main, "uMMatrix");