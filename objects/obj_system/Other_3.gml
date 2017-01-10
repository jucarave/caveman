/// @description Clear any dynamic data

if (surface_exists(light_surface)) {
	surface_free(light_surface);
}

if (instance_exists(obj_world)) {
	ds_grid_destroy(obj_world.height_map);
}

// Clear models memory
var size = ds_map_size(models),
	key = ds_map_find_first(models);

for (var i=0;i<size;i++) {
	var mdl = ds_map_find_value(models, key);
	vertex_delete_buffer(mdl[0]);
	
	key = ds_map_find_next(models, key);
	ds_map_delete(models, key);
}

ds_map_destroy(models);

// Clear current tileset
if (tileset != noone) {
	ds_map_destroy(tileset);
}