/// @description Controls the camera rotation

var dx = display_mouse_get_x() - mx;

if (dx != 0) {
	direction += dx / 10;

	display_mouse_set(mx, my);
	
	requires_update = true;
}