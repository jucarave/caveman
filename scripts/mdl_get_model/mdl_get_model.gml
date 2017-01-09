/// @description Loads or return a loaded model from memory
/// @param model_id

var model_id = argument[0],
	models = obj_system.models;
	
if (ds_map_exists(models, model_id)) {
	return ds_map_find_value(models, model_id);
}

var path = "models/" + model_id + ".obj",
	mdl = mdl_load_obj(path);
	
ds_map_add(models, model_id, mdl);

return mdl;