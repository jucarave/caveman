/// @description This function solves a quadratic function of type A*x^2 + B*x + C = 0 and returns the lowest root
/// @param A
/// @param B
/// @param C
/// @param maxR

var a = argument[0],
	b = argument[1],
	c = argument[2],
	maxR = argument[3];
	
var determinant = b * b  - 4 * a * c;

// If determinant is negative then there is no solution
if (determinant == -0.0) { determinant = 0.0; }
if (determinant < 0.0) { return noone; }

// Calculate the two roots

var sqrtD = sqrt(determinant),
	r1 = (-b - sqrtD) / (2 * a),
	r2 = (-b + sqrtD) / (2 * a);
	
// Sort so x1 < x2
if (r1 > r2) {
	var temp = r2;
	r2 = r1;
	r1 = temp;
}

// Get lowest root
if (r1 > 0 && r1 < maxR) {
	return [r1];
}

// It is possible that we want r2 in case that r1 < 0
if (r2 > 0 && r2 < maxR) {
	return [r2];
}

// No (valid) solution
return noone;