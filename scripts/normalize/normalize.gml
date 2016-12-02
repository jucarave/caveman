/// @description normalizes a 3d Vector
/// @param x
/// @param y
/// @param z

var _x = argument[0],
	_y = argument[1],
	_z = argument[2],
	
	l = sqrt(_x * _x + _y * _y + _z * _z);
	
return [_x / l, _y / l, _z / l];