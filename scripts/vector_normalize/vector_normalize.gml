/// @description normalizes a 3d Vector
/// @param vector

var vector = argument[0],
	
	l = sqrt(vector[0] * vector[0] + vector[1] * vector[1] + vector[2] * vector[2]);
	
return [vector[0] / l, vector[1] / l, vector[2] / l];