/// @description Clear any dynamic data

if (surface_exists(light_surface)) {
	surface_free(light_surface);
}

ds_grid_destroy(obj_world.height_map);