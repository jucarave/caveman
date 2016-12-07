/// @description Moves the current entity through the world checking for collisions
/// @param velocity vector

var velocity = argument[0],
	box_entities = [],
	xp = x, yp = y, zp = z;

// Check for box collisions against entities nearby
// TODO: Perform this check by area to save memory
var solid_count = instance_number(obj_solid_entity);
x += velocity[0];
y += velocity[1];
z += velocity[2];

for (var i=0;i<solid_count;i++) {
	var ins = instance_find(obj_solid_entity, i);
	
	if (cs_test_boxes(id, ins)) {
		box_entities[array_length_1d(box_entities)] = ins;
	}
}

// TODO: also perform box detection with non instances collisions

// Move the entity to its previous location
x = xp;
y = yp;
z = zp;

// Collision utils
var position = [x, y, z];
var ellipse = ellipse_collision;

// Check for collision detection with all the triangles of each possible collider
var length = array_length_1d(box_entities);
for (var i=0;i<length;i++) {
	var ins = box_entities[i],
		ins_position = [ins.x, ins.y, ins.z];
	
	var hit = cs_test_ellipse_mesh(position, ellipse, velocity, ins_position, ins.solid_mesh);
	if (is_array(hit)) {
		ins.debug_mat = true;
	} else {
		ins.debug_mat = false;
	}
}

// For testing now, move the instance to its velocity
x += velocity[0];
y += velocity[1];
z += velocity[2];