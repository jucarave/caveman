/// @description Move the instance in the world
base_z = sys_get_height(obj_world.height_map, x, y);

if (x_vel == 0) { exit; }
exit;

var hit = oc_apply_force([x_vel, 0, 0], 1, false);

// Activate gravity each time the instance moves if it didn't hit a surface
if (!hit) {
	z_gravity = 0.1;
}

requires_update = true;

if (x >= 208 || x < 0) {
	x_vel *= -1;
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