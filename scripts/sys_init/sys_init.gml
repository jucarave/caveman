// Macros definitions
#macro MDL_MODEL 0
#macro MDL_MATRIX 1
#macro MDL_CAST_SHADOW 2

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

global.MODEL_MATRIX = shader_get_uniform(shd_main, "uMMatrix");
global.LIGHT_DIRECTION = shader_get_uniform(shd_main, "uLightDirection");
global.SHADOW_MAP = shader_get_sampler_index(shd_main, "uShadowMap");
global.LIGHT_VIEW = shader_get_uniform(shd_main, "uLightView");
global.LIGHT_PROJECTION = shader_get_uniform(shd_main, "uLightProj");