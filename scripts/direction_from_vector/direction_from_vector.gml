/// @description returns a character direction from a 2D vector
/// @param x
/// @param y

var _x = argument[0],
	_y = argument[1];
	
if (_x > 0 && _y == 0) {
	return 0;
}else if (_x > 0 && _y < 0) {
	return 45;
}else if (_x == 0 && _y < 0) {
	return 90;
}else if (_x < 0 && _y < 0) {
	return 135;
}else if (_x < 0 && _y == 0) {
	return 180;
}else if (_x < 0 && _y > 0) {
	return 225;
}else if (_x == 0 && _y > 0) {
	return 270;
}else {
	return 315;
}