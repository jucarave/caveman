/// @description Draws the quadtree distribution
/// @param quadtree

var quadtree = argument[0],
	node_depth = quadtree[@QDT_DEPTH],
	size = quadtree[@QDT_SIZE],
	nodes = quadtree[@QDT_NODES],
	instances = quadtree[@QDT_INSTANCES],
	
	_x = 704 + (size[0] / 208) * 150,
	_y = 0 + (size[1] / 200) * 150,
	_w = _x + (size[2] / 208) * 150,
	_h = _y + (size[3] / 200) * 150;
	
if (node_depth == 0) {
	draw_set_color(c_white);
	draw_rectangle(704, 0, 854, 150, false);
}

draw_set_color(c_red);
draw_rectangle(_x, _y, _w, _h, true);

var len = array_length_1d(nodes);
for (var i=0;i<len;i++) {
	dbg_draw_quadtree(nodes[@i]);
}

if (len == 0) {
	len = array_length_1d(instances);
	
	draw_set_color(c_blue);
	for (var i=0;i<len;i++) {
		var ins = instances[@i];
		_x = 704 + (ins[0] / 208) * 150;
		_y = 0 + (ins[1] / 200) * 150;
		_w = 704 + (ins[2] / 208) * 150;
		_h = 0 + (ins[3] / 200) * 150;
		
		draw_rectangle(_x, _y, _w, _h, false);
	}
}