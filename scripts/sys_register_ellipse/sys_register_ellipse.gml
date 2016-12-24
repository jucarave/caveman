/// @description Register an ellipse for collision
/// @param ellipse

var ellipse = argument[0],
	len = array_length_1d(global.ELLIPSES_INDICES),
	ellipse_str = string(ellipse[0]) + "_" + string(ellipse[1]) + "_" + string(ellipse[2]);

for (var i=0;i<len;i++) {
	if (global.ELLIPSES_INDICES[i] == ellipse_str) {
		return i;
	}
}

global.ELLIPSES_INDICES[len] = ellipse_str;

return len;