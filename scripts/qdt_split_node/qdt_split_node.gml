/// @description Splits a node into 4 and move the instances to its childs
/// @param quadtree

var quadtree = argument[0],
	
	node_depth = quadtree[@QDT_DEPTH],
	size = quadtree[@QDT_SIZE ],
	child_nodes = quadtree[@QDT_NODES],
	instances = quadtree[@QDT_INSTANCES],
	
	hw = size[2] / 2,
	hh = size[3] / 2;
	
var i = 0;
for (var _x=0;_x<2;_x++) {
	for (var _y=0;_y<2;_y++) {
		var pos = [
			size[0] + _x * hw,
			size[1] + _y * hh,
			hw,
			hh
		];
		
		var leaf = qdt_create(node_depth + 1, pos);
		child_nodes[@i++] = leaf;
	}
}

var ins_len = array_length_1d(instances),
	left_overs = [];
	
for (var j=0;j<ins_len;j++) {
	var ins = instances[@j],
		added = false;
		
	for (var i=0;i<4;i++) {
		var leaf = child_nodes[@i];
		qdt_add_instance(leaf, ins[4], ins);
	}
}

quadtree[@QDT_INSTANCES] = -1;