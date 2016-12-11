/// @description Moves the current entity through the world checking for collisions
/// @param velocity vector
/// @param recursion_depth

var velocity = argument[0],
	recursion_depth = argument[1],
	box_entities = [],
	xp = x, yp = y, zp = z,
	found_collision = false,
	collision = noone;
	
// After 5 iterations it doesn't matter much if the instance is still colliding
if (recursion_depth > 5) {
	x += velocity[0];
	y += velocity[1];
	z += velocity[2];

	exit;
}

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

// Center the ellipse in the instance
position[2] += ellipse[2];	

// Set position and velocity from R3 to eSpace
var es_position = [
	position[0] / ellipse[0],
	position[1] / ellipse[1],
	position[2] / ellipse[2]
];

var es_velocity = [
	velocity[0] / ellipse[0],
	velocity[1] / ellipse[1],
	velocity[2] / ellipse[2]
];

// Check for collision detection with all the triangles of each possible collider
var length = array_length_1d(box_entities);
for (var i=0;i<length;i++) {
	var ins = box_entities[i],
		ins_position = [ins.x, ins.y, ins.z];
	
	var hit = cs_test_ellipse_mesh(es_position, ellipse, es_velocity, ins_position, ins.solid_mesh);
	if (is_array(hit)) {
		if (!found_collision || hit[2] < collision[2]) {
			collision = hit;
			found_collision = true;
		}
	}
}

// If it didn't collide then move it along its velocity
if (!found_collision) {
	x += velocity[0];
	y += velocity[1];
	z += velocity[2];
	
	exit;
}

// If a collision occured
var destination_point = vectors_sum(es_position, es_velocity);
var new_position = es_position;
var close_distance = 0.005;

// Only move the instance if it's not already very close to the surface
if (collision[2] >= close_distance) {
	var V = vector_multiply_scalar(vector_normalize(es_velocity), collision[2] - close_distance);
	new_position = vectors_sum(es_position, V);
	
	var diff = vector_multiply_scalar(vector_normalize(V), close_distance);
	
	collision[0] = vectors_difference(collision[0], diff);
}

// Determine the sliding plane
var slide_plane_origin = collision[0],
	slide_plane_normal = vector_normalize(vectors_difference(new_position, collision[0])),
	sliding_plane = get_normal_plane(slide_plane_origin, slide_plane_normal);

var new_destination_point = vectors_difference(destination_point, vector_multiply_scalar(slide_plane_normal, plane_signed_distance(destination_point, sliding_plane[0], sliding_plane[1])));

// Generate the slide vector which will become the new velocity vector
var new_velocity = vectors_difference(new_destination_point, collision[0]);

// Recurse:

// Don't recurse if the new velocity is very small
if (vector_length(new_velocity) < close_distance) {
	x = new_position[0] * ellipse[0];
	y = new_position[1] * ellipse[1];
	z = (new_position[2] * ellipse[2]) - ellipse[2];
	
	exit;
}

// Velocity back to R3
velocity[0] = new_velocity[0] * ellipse[0];
velocity[1] = new_velocity[1] * ellipse[1];
velocity[2] = new_velocity[2] * ellipse[2];

oc_apply_force(velocity, recursion_depth + 1);