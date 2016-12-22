/// @description Loads all the collision meshes as global objects

#macro CM_TREE			0
#macro CM_TREE_2		1
#macro CM_CAPSULE		2
#macro CM_RAMP			3

global.COLLISION_MESHES[CM_TREE]		= mdl_load_cm_obj("collision_mesh/tree_cm.obj");
global.COLLISION_MESHES[CM_TREE_2]		= mdl_load_cm_obj("collision_mesh/tree_2_cm.obj");
global.COLLISION_MESHES[CM_CAPSULE]		= mdl_load_cm_obj("collision_mesh/casule_cm.obj");