/// @description creates a new empty QuadTree
/// @param depth
/// @param size

var ret = array_create(5);

ret[QDT_SIZE] = argument[1];
ret[QDT_PARENT] = -1;
ret[QDT_NODES] = [];
ret[QDT_INSTANCES] = [];
ret[QDT_DEPTH] = argument[0];

return ret;