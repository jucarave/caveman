/// @description Adds a model to be drawn at the end of the cycle
/// @param model
/// @param model_matriz
/// @param castShadow

var ind = array_length_1d(obj_system.draw_models),
	mdl = array_1d(0);

mdl[MDL_MODEL]			= argument[0];
mdl[MDL_MATRIX]			= argument[1];
mdl[MDL_CAST_SHADOW]	= argument[2];

obj_system.draw_models[ind] = mdl;