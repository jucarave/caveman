/// @description Returns all the instances in a rectangular area
/// @param quadtree
/// @param area

var quadtree = argument[0],
	area = argument[1],
	
	ret = [],
	cc = 0;
	
if (array_length_1d(quadtree[QDT_NODES]) > 0) {
	var nodes = quadtree[@QDT_NODES];
	for (var i=0;i<4;i++) {
		var leaf = nodes[@i],
			ins = qdt_get_instance_by_area(leaf, area),
			len = array_length_1d(ins);
			
		for (var j=0;j<len;j++) {
			ret[cc++] = ins[j];
		}
	}
} else {
	var quad_area = quadtree[QDT_SIZE],
		_x = area[0] - quad_area[0],
		_y = area[1] - quad_area[1],
		_w = area[2] - quad_area[0],
		_h = area[3] - quad_area[1];
	
	if (_w < 0 || _h < 0){ return ret; }
	if (_x >= quad_area[2] || _y >= quad_area[3]){ return ret; }
	
	ret = quadtree[QDT_INSTANCES];
}

return ret;