/// @description Draw the world on the screen

mdl_draw(plane, m_world, global.NO_OFFSET, true);

for (var i=0,len=array_length_1d(trees);i<len;i++) {
	var t = trees[i];
	mdl_draw(t[3], m_world, t, t[4]);
}