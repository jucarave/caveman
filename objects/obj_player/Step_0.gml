/// @description Controls the player actions and responses

// Player movement
var xTo = 0,
	yTo = 0;
	
if (keyboard_check(ord("D"))){ xTo = 1.0; }else 
if (keyboard_check(ord("A"))){ xTo = -1.0; }

if (keyboard_check(ord("W"))){ yTo = -1.0; }else 
if (keyboard_check(ord("S"))){ yTo = 1.0; }

if (xTo != 0 || yTo != 0) {
	var vec = normalize(xTo, yTo, 0.0);
	var dir = round((direction_from_vector(vec[0], vec[1]) + (obj_camera.direction + 90)) mod 360);
	
	rotate_to = dir;
	rotate_spd = 15 * sign(angle_difference(rotate_to, direction));
	
	x += cos(degtorad(dir)) * mv_spd;
	y += -sin(degtorad(dir)) * mv_spd;
	
	requires_update = true;
}

// Player Jump control
if (keyboard_check_pressed(vk_space) && jump == 0) {
	jump = 1;
	z_speed = 1;
	z_gravity = 0.1;
}

// Place Tree
if (keyboard_check_pressed(ord("U"))) {
	obj_world.trees[array_length_1d(obj_world.trees)] = [x, y, z];
}