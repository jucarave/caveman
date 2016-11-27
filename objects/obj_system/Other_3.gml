/// @description Clear any dynamic data

if (surface_exists(light_surface)) {
	surface_free(light_surface);
}