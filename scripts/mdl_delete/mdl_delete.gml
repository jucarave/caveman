/// Deletes a model from memory
/// @param model_id

var model_id = argument[0],
	models = obj_system.models;
	
if (!ds_map_exists(models, model_id)) {
	show_debug_message("Trying to delete non existing model: [" + model_id + "]");
	exit;
}

var mdl = ds_map_find_value(models, model_id);

vertex_delete_buffer(mdl[0]);

ds_map_delete(models, model_id);