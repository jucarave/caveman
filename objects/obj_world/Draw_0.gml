/// @description Draw the world on the screen

mdl_draw(plane, m_world, global.NO_OFFSET, false);

for (var i=0,len=array_length_1d(trees);i<len;i++) {
	mdl_draw(tree_model, m_world, trees[i], true);
}