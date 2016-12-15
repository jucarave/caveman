/// @description adds an instance to the quadtree
/// @param quadtree
/// @param instance
/// @param area

var quadtree = argument[0],
	instance = argument[1],
	area	 = argument[2],
	
	size = quadtree[@QDT_SIZE],
	
	_x = area[0] - size[0],
	_y = area[1] - size[1],
	_w = area[2] - size[0],
	_h = area[3] - size[1];
	
if (_w < 0 || _h < 0) { return false; }
if (_x >= size[2] || _y >= size[3]) { return false; }

if (array_length_1d(quadtree[@QDT_NODES]) == 0) {
	var instances = quadtree[@QDT_INSTANCES],
		len = array_length_1d(instances);
	
	instances[@ len] = [
		area[0], 
		area[1], 
		area[2], 
		area[3], 
		instance
	];
	
	if (len + 1 == QDT_MAX_INSTANCES && quadtree[QDT_DEPTH] < QDT_MAX_DEPTH) {
		qdt_split_node(quadtree);
	}
	
	return true;
} else {
	var nodes = quadtree[@QDT_NODES];
		
	for (var i=0;i<4;i++) {
		var leaf = nodes[@i];
		if (qdt_add_instance(leaf, instance, area)) {
			i = 4;
		}
	}
}