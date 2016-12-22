/// @description Subscribe a new collision to a position
/// @param collision mesh
/// @param position

var ind = array_length_1d(obj_system.collisions),
	mesh_index = argument[0],
	mesh = global.COLLISION_MESHES[@mesh_index],
	position = argument[1];
	
obj_system.collisions[ind] = [
	mesh_index,
	position
];

var bbox = mesh[@0],
	area = [
		position[0] + bbox[0],
		position[1] + bbox[1],
		position[0] + bbox[3],
		position[1] + bbox[4],
	];

qdt_add_instance(obj_world.quadtree, ind, area);