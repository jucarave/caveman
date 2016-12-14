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
	
	var velocity = [
		cos(degtorad(dir)) * mv_spd,
		-sin(degtorad(dir)) * mv_spd,
		0
	];
	
	// Apply movement force
	var hit = oc_apply_force(velocity, 1, false);
	
	// Sets the minimum position the player can be
	base_z = sys_get_height(obj_world.height_map, x, y);
	
	// Activate gravity each time the player moves if it didn't hit a surface
	if (!hit) {
		z_gravity = 0.1;
	}
	
	requires_update = true;
}

// Player Jump control
if (keyboard_check_pressed(vk_space) && jump == 0 && z_speed > -0.3) {
	jump = 1;
	z_speed = 1;
	z_gravity = 0.1;
}

// Gravity force
if (z_gravity != 0.0) {
	z_speed -= z_gravity;
	requires_update = true
	var hit = oc_apply_force([0, 0, z_speed], 1, true);
	
	if (hit) {
		if (z_speed < 0) {
			z_gravity = 0;
			jump = 0;
		}
		
		z_speed = 0;
	}
}

// Place Tree
if (keyboard_check_pressed(ord("U"))) {
	var model = obj_world.tree_model;
	/*if (irandom(10) < 4) {
		model = obj_world.tree_model_2;
	}*/
	
	obj_world.trees[array_length_1d(obj_world.trees)] = [x, y, base_z, model, true];
	sys_subscribe_collision(global.COLLISION_MESHES[CM_TREE], [x, y, base_z]);
}

// Place Fern
if (keyboard_check_pressed(ord("I"))) {
	obj_world.trees[array_length_1d(obj_world.trees)] = [x, y, z, obj_world.fern, true];
}