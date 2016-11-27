/// @description Checks if the model requires to update its transformation matrix

// Rotate tween animation
if (rotate_to != direction) {
	direction += rotate_spd;
	requires_update = true;
	if (abs(direction - rotate_to) < abs(rotate_spd)){
		direction = rotate_to;
	}
}

// Fall for gravity
if (z_gravity > 0) {
	z += z_speed;
	z_speed -= z_gravity;
	requires_update = true;
	
	if (z_speed < 0 && z < 0) {
		z = 0.0;
		z_speed = 0.0;
		z_gravity = 0.0;
		jump = 0;
	}
}

if (requires_update) {
	event_user(0);
	with (obj_camera) { event_user(0); } 
	requires_update = false;
}