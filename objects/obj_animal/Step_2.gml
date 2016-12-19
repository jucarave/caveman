/// @description Checks if the animal needs update

if (base_z > z) { 
	z = base_z; 
	z_speed = 0.0;
	z_gravity = 0.0;
	jump = 0;
}

if (requires_update) {
	event_user(0);
	requires_update = false;
}