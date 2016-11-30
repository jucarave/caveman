/// @description Returns the Z height of a grid map
/// @param grid
/// @param x
/// @param y

var grid = argument[0],
	_x = (argument[1] / global.GRID_SIZE),
	_y = (argument[2] / global.GRID_SIZE),
	cx = floor(_x),
	cy = floor(_y),
	bx, by;
	
if (cx < 0 || cy < 0 || cx >= ds_grid_width(grid) - 1 || cy >= ds_grid_height(grid) - 1) { 
	return 0; 
}

var tl = grid[# cx, cy],
	tr = grid[# cx + 1, cy],
	bl = grid[# cx, cy + 1],
	br = grid[# cx + 1, cy + 1];
	
if (frac(_y) > frac(_x)) {
	bx = frac(_x);
	by = 1.0 - frac(_y);
	
	return bl + (br - bl) * bx + (tl - bl) * by;
}else {
	bx = 1.0 - frac(_x);
	by = frac(_y);
	
	return tr + (tl - tr) * bx + (br - tr) * by;
}