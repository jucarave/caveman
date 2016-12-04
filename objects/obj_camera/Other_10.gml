/// @description Updates the camera lookat matrix
var p = obj_player,
	_x = p.x + cos(degtorad(direction)) * 15,
	_y = p.y - sin(degtorad(direction)) * 15,
	base_z = sys_get_height(obj_world.height_map, _x, _y) + 5,
	_z = max(p.z+10, base_z);
	
m_view = matrix_build_lookat(_x, _y, _z, p.x, p.y, p.z, 0, 0, 1);

requires_update = false;

with (obj_system) {
	event_user(0);
}