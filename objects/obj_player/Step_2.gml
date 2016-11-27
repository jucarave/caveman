/// @description Checks if the model requires to update its transformation matrix

if (rotate_to != direction) {
	direction += rotate_spd;
	requires_update = true;
	
	/*if (rotate_spd > 0 && direction > rotate_to) {
		direction = rotate_to;
		rotate_spd = 0;
	}else if (rotate_spd < 0 && direction < rotate_to) {
		direction = rotate_to;
		rotate_spd = 0;
	}*/
}

if (requires_update) {
	event_user(0);
	requires_update = false;
}