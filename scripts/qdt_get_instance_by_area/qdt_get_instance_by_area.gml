/// @description Returns all the instances in a rectangular area
/// @param quadtree
/// @param area

var quadtree = argument[0],
	area = argument[1],
	
	ret = [],
	indices,
	cc = 0;
	
var quad_area = quadtree[QDT_SIZE],
	_x = area[0] - quad_area[0],
	_y = area[1] - quad_area[1],
	_w = area[2] - quad_area[0],
	_h = area[3] - quad_area[1];
	
if (_w < 0 || _h < 0){ return ret; }
if (_x >= quad_area[2] || _y >= quad_area[3]){ return ret; }

if (array_length_1d(quadtree[QDT_NODES]) > 0) {
	indices = ds_list_create();
	
	var nodes = quadtree[@QDT_NODES];
	for (var i=0;i<4;i++) {
		var leaf = nodes[@i],
			ins = qdt_get_instance_by_area(leaf, area),
			len = array_length_1d(ins);
			
		for (var j=0;j<len;j++) {
			var det_ins = ins[j];
			
			if (ds_list_find_index(indices, det_ins[4]) == -1) {
				ds_list_add(indices, det_ins[4]);
				ret[cc++] = det_ins;
			}
		}
	}
	
	ds_list_destroy(indices);
} else {
	ret = quadtree[QDT_INSTANCES];
}

return ret;