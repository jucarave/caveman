/// @description Builds a terrain from a heightmap
/// @param heightmap
/// @param max_height

var heightMap = argument[0],
	max_height = argument[1],
	w = sprite_get_width(heightMap),
	h = sprite_get_height(heightMap),
	surf = surface_create(w, h * 2),
	grid = ds_grid_create(w, h),
	gridCol = ds_grid_create(w, h),
	c = c_white,
	res = 4;
	
surface_set_target(surf);

draw_clear_alpha(c_black, 1.0);
draw_sprite(heightMap, 0, 0, 0);
draw_sprite(heightMap, 1, 0, h);

ds_grid_clear(grid, 0);

surface_reset_target();

for (var _x=0;_x<w;_x++) {
	for (var _y=0;_y<h;_y++) {
		var gray = surface_getpixel(surf, _x, _y);
		var r = (gray & 255) / 255;
		
		var color = surface_getpixel(surf, _x, _y + h);
		color = color | (255 << 24);
		
		grid[# _x, _y] = r * max_height;
		gridCol[# _x, _y] = color;
	}
}

surface_free(surf);

buffer = vertex_create_buffer();
vertex_begin(buffer, global.VERTEX_FORMAT);

for (var _x=0;_x<w;_x++) {
	for (var _y=0;_y<h;_y++) {
		var th = grid[# _x, _y];
		var l = (_x > 0)? grid[# _x - 1, _y] : 0;
		var t = (_y > 0)? grid[# _x, _y - 1] : 0;
		var r = (_x < w - 1)? grid[# _x + 1, _y] : 0;
		var b = (_y < h - 1)? grid[# _x, _y + 1] : 0;
		
		var tl = (_x > 0 && _y > 0)? grid[# _x - 1, _y - 1] : 0;
		var tr = (_x < w - 1 && _y > 0)? grid[# _x + 1, _y - 1] : 0;
		var bl = (_x > 0 && _y < h - 1)? grid[# _x - 1, _y + 1] : 0;
		var br = (_x < w - 1 && _y < h - 1)? grid[# _x + 1, _y + 1] : 0;
		
		var px = _x * res;
		var py = _y * res;
		
		var v1 = normalize(res, 0, max(th,r,t,tr) - max(th,l,t,tl));
		var v2 = normalize(0, res, max(th,l,b,bl) - max(th,l,t,tl));
		var n = cross(v1, v2);
		
		c = gridCol[# _x, _y];
	
		pb_position_normal_color(buffer,	px,  py,  max(th,l,t,tl),				n[0],  n[1],  n[2],		c, 1.0);
		pb_position_normal_color(buffer,	px+res,  py+res,  max(th,r,b,br),		n[0],  n[1],  n[2],		c, 1.0);
		pb_position_normal_color(buffer,	px,  py+res,  max(th,l,b,bl),			n[0],  n[1],  n[2],		c, 1.0);
		
		pb_position_normal_color(buffer,	px,  py,  max(th,l,t,tl),				n[0],  n[1],  n[2],		c, 1.0);
		pb_position_normal_color(buffer,	px+res,  py,  max(th,r,t,tr),			n[0],  n[1],  n[2],		c, 1.0);
		pb_position_normal_color(buffer,	px+res,  py+res,  max(th,r,b,br),		n[0],  n[1],  n[2],		c, 1.0);
	}
}

ds_grid_destroy(grid);
ds_grid_destroy(gridCol);

vertex_end(buffer);

return buffer;