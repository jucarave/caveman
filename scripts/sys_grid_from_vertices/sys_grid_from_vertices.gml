/// @description Converts an array of vertices to a height grid
/// @param vertices
/// @param width
/// @param height

var vertices = argument[0],
	w = argument[1],
	h = argument[2],
	grid = ds_grid_create(w + 1, h + 1),
	v, _x, _y, _z;
	
ds_grid_clear(grid, 0);

for (var i=1,len=array_length_1d(vertices);i<len;i++) {
	v = vertices[i];
	
	_x = round(v[0]) / global.GRID_SIZE;
	_y = round(v[1]) / global.GRID_SIZE;
	_z = v[2];
	
	grid[# _x, _y] = _z;
}

return grid;