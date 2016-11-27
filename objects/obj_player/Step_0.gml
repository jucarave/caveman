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
	
	x += vec[0] * mv_spd;
	y += vec[1] * mv_spd;
	
	rotate_to = direction_from_vector(vec[0], vec[1]);
	rotate_spd = 15 * sign(angle_difference(rotate_to, direction));
	
	requires_update = true;
}