/// @description Returns an array for the values passed by (max 16)
/// @param n0...n15

var ret;
for (var i=0;i<argument_count;i++) {
	ret[i] = argument[i];
}

return ret;