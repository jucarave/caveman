/// @description Moves the current entity through the world checking for collisions
/// @param velocity vector
/// @param recursion_depth
/// @param is_gravity

var velocity = argument[0],
	recursion_depth = argument[1],
	is_gravity = argument[2],
	box_entities = [],
	xp = x, yp = y, zp = z,
	found_collision = false,
	collision = noone,
	ellipse = ellipse_collision,
	ellipse_index = sys_register_ellipse(ellipse);
	
// After 5 iterations it doesn't matter much if the instance is still colliding
if (recursion_depth > 5) {
	x += velocity[0];
	y += velocity[1];
	z += velocity[2];

	return false;
}

// Check for box collisions against entities nearby
x += velocity[0];
y += velocity[1];
z += velocity[2];

var bbox = bbox_move_to_position(bounding_box, [x, y, z]);

// Perform collisions with subscribed collisions on the current quadtree
//var cm_indices = qdt_get_instance_by_area(obj_world.quadtree, [x-1.3,y-1.3,x+1.3,y+1.3]),
var cm_indices = obj_dungeon.instances,
	cm_count = array_length_1d(cm_indices);

if (id == obj_player.id) {
	obj_system.collisions_count = cm_count;
}
	
for (var i=0;i<cm_count;i++) {
	var col_ind = cm_indices[i],
		collision_ins = obj_system.collisions[col_ind[4]],
		collision_mesh = global.COLLISION_MESHES[@collision_ins[CS_MESH_INDEX]],
		collision_position = collision_ins[@CS_MESH_POSITION],
		collision_bbox = bbox_move_to_position(collision_mesh[0], collision_position);
		
	if (bbox_check(bbox, collision_bbox)) {
		if (collision_ins[@CS_LAST_ELLIPSE] != ellipse_index) {
			collision_ins[@CS_LAST_ELLIPSE] = -1;
		}
	
		collision_ins[CS_MESH_INDEX] = collision_mesh[@1];
		box_entities[array_length_1d(box_entities)] = collision_ins;
	}
}

// Check for collisions against dynamic instances
var solid_count = instance_number(obj_dynamic_entity);
for (var i=0;i<solid_count;i++) {
	var ins = instance_find(obj_dynamic_entity, i);
	if (ins == id) { continue; }
	
	if (cs_test_boxes(id, ins)) {
		var collision_ins = ins.collision_data;
	
		//if (collision_ins[@CS_LAST_ELLIPSE] != ellipse_index) {
			collision_ins[@CS_LAST_ELLIPSE] = -1;
		//}
		
		box_entities[array_length_1d(box_entities)] = collision_ins;
	}
}

if (array_length_1d(box_entities) == 0) {
	return false; 
}

// Move the entity to its previous location
x = xp;
y = yp;
z = zp;

// Collision utils
var position = [x, y, z];

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
	var ins = box_entities[i];
	
	var hit = cs_test_ellipse_mesh(es_position, ellipse, es_velocity, ins);
	if (is_array(hit)) {
		if (!found_collision || hit[2] < collision[2]) {
			collision = hit;
			found_collision = true;
			
			ins[@CS_LAST_ELLIPSE] = ellipse_index;
		}
	}
}

// If it didn't collide then move it along its velocity
if (!found_collision) {
	x += velocity[0];
	y += velocity[1];
	z += velocity[2];
	
	return false;
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
var len = vector_length(new_velocity);
if (len < close_distance) {
	x = new_position[0] * ellipse[0];
	y = new_position[1] * ellipse[1];
	z = (new_position[2] * ellipse[2]) - ellipse[2];
	
	if (len == 0) { 
		return true;
	}
	
	return false;
}

// Velocity back to R3
velocity[0] = new_velocity[0] * ellipse[0];
velocity[1] = new_velocity[1] * ellipse[1];
velocity[2] = new_velocity[2] * ellipse[2];

// Check if the slide is too steep for gravity 
if (is_gravity) {
	var v1 = vector_normalize(velocity),
		v2 = [0, 0, 1 * sign(v1[2])],
		dp = dot(v1, v2);
	
	if (dp <= 0.70) {
		return true;
	} 
}

return oc_apply_force(velocity, recursion_depth + 1, is_gravity);