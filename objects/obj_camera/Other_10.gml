/// @description Updates the camera lookat matrix
var p = obj_player,
	_x = p.x + cos(degtorad(direction)) * 15,
	_y = p.y - sin(degtorad(direction)) * 15;
	
m_view = matrix_build_lookat(_x, _y, p.z+15, p.x, p.y, p.z, 0, 0, 1);

requires_update = false;

with (obj_system) {
	event_user(0);
}