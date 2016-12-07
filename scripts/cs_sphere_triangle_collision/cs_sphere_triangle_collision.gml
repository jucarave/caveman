/// @description checks if there is a collision between a sweep unit sphere and a triangle
/// @param base_position
/// @param velocity
/// @param triangle

var position = argument[0],
	velocity = argument[1],
	triangle = argument[2];
	
// Get the plane equation and the signed distance from the sphere to the plane
var plane = get_triangle_plane(triangle),
	normal = plane[0],
	n_dot_vel = dot_product_3d(velocity[0], velocity[1], velocity[2], normal[0], normal[1], normal[2]),
	psd = plane_signed_distance(position, normal, plane[1]),
	t0 = 0, t1 = 1;
	
// If the triangle is not front facing the velocity then return
if (n_dot_vel > 0) { return noone; }
	
// If we are not traveling parallel to the plane
if (n_dot_vel != 0) {
	var t0 = (1 - psd) / n_dot_vel,
		t1 = (-1 - psd) / n_dot_vel;
			
	// Swap values so t0 < t1
	if (t1 < t0) {
		var temp = t1;
		t1 = t0;
		t0 = temp;
	}
			
	if (t0 > 1.0 || t1 < 0.0){
		// If the times of collision are outside the rank [0, 1] then we won't hit the triangle
		return noone;
	}
		
	t0 = clamp(t0, 0.0, 1.0);
	t1 = clamp(t1, 0.0, 1.0);
		
	// Check if we collide with the inside of the triangle
	var intersection_point = vectors_sum(vectors_difference(position, normal), vector_multiply_scalar(velocity, t0));
	if (cs_point_in_triangle(intersection_point, triangle)) {
		return [
			intersection_point,
			t0
		];
	}
} else if (abs(psd) >= 1) {
	// If the signature distance to the plane is greater than the sphere size then we won't hit the triangle
	return noone;
}
	
// Check for collision against vertices
// Quadratic helper
var velocity_squared_length = dot_product_3d(velocity[0], velocity[1], velocity[2], velocity[0], velocity[1], velocity[2]),
	a, b, c, t = 1,
	found_collision = false,
	intersection_point = noone;

// Check against points
a = velocity_squared_length;

for (var j=0;j<3;j++) {
	var vp = triangle[j],
		base_p = (vectors_difference(position, vp)),
		p_base = (vectors_difference(vp, position));
		
	b = 2 * dot_product_3d(velocity[0], velocity[1], velocity[2], base_p[0], base_p[1], base_p[2]);
	c = dot_product_3d(p_base[0], p_base[1], p_base[2], p_base[0], p_base[1], p_base[2]) - 1;
			
	var root = get_lowest_root(a, b, c, t);
	if (is_array(root)) {
		found_collision = true;
		t = root[0];
		intersection_point = vp;
	}
}

// Check for collision against edges
var edges = [
	vectors_difference(triangle[1], triangle[0]),
	vectors_difference(triangle[2], triangle[1]),
	vectors_difference(triangle[2], triangle[0])
];

// Check against edges
for (var j=0;j<3;j++) {
	var edge = edges[j],
		vp = triangle[j],
		p_base = vectors_difference(vp, position),
		edge_squared_length = dot_product_3d(edge[0], edge[1], edge[2], edge[0], edge[1], edge[2]),
		edge_dot_velocity = dot_product_3d(edge[0], edge[1], edge[2], velocity[0], velocity[1], velocity[2]),
		edge_dot_pbase = dot_product_3d(edge[0], edge[1], edge[2], p_base[0], p_base[1], p_base[2]);
		
	// Calculate parameters for the equation
	a = edge_squared_length * (-velocity_squared_length) + edge_dot_velocity * edge_dot_velocity;
	b = edge_squared_length * (2*dot_product_3d(velocity[0],velocity[1],velocity[2],p_base[0],p_base[1],p_base[2])) - 2*edge_dot_velocity*edge_dot_pbase;
	c = edge_squared_length * (1-dot_product_3d(p_base[0],p_base[1],p_base[2],p_base[0],p_base[1],p_base[2])) + edge_dot_pbase*edge_dot_pbase;
	
	// Does the sphere collides against an infinite edge?
	var root = get_lowest_root(a, b, c, t);
	if (is_array(root)) {
		// Check if intersection is between line segment
		var f = (edge_dot_velocity*root[0]-edge_dot_pbase) / edge_squared_length;
		if (f >= 0.0 && f <= 1.0) {
			// Intersection took place within segment
			found_collision = true;
			t = root[0];
			intersection_point = vectors_sum(vp, vector_multiply_scalar(edge, f));
		}
	}
}

// Set the result
if (found_collision) {
	return [
		intersection_point,
		t
	];
}

return noone;