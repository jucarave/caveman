// Macros definitions
#macro MDL_MODEL 0
#macro MDL_MATRIX 1
#macro MDL_OFFSET 2
#macro MDL_CAST_SHADOW 3

// Collisions
#macro CS_MESH_INDEX 0
#macro CS_MESH_POSITION 1
#macro CS_LAST_ELLIPSE 2
#macro CS_PLANES 3

// Quad tree
#macro QDT_DEPTH					0
#macro QDT_INSTANCES				1
#macro QDT_NODES					2
#macro QDT_PARENT					3
#macro QDT_SIZE						4

#macro QDT_MAX_INSTANCES			5
#macro QDT_MAX_DEPTH				4

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
global.POSITION_OFFSET = shader_get_uniform(shd_main, "uPosition");
global.PLAYER_POSITION = shader_get_uniform(shd_main, "uPlayerPosition");

global.LIGHT_POSITION_OFFSET = shader_get_uniform(shd_shadow, "uPosition");

// Commons
global.NO_OFFSET = [0, 0, 0];
global.GRID_SIZE = 8;

// ELLIPSES
global.ELLIPSES_INDICES = [];