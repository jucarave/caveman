/// @description Loads a tileset for building dungeons
/// @param tileset_code

var tileset_code = argument[0],
	filename = "tilesets/" + tileset_code + ".json",
	json_string = "";
	
if (!file_exists(filename)) {
	show_message("Tileset [" + tileset_code + "] doesn't exists!");
	game_end();
	exit;
}

var file = file_text_open_read(filename);
while (!file_text_eof(file)) {
	json_string += file_text_read_string(file);
	file_text_readln(file);
}

file_text_close(file);

var json_object = json_decode(json_string),
	floats = json_object[? "floats"],
	materials = json_object[? "materials"],
	
	objects = json_object[? "objects"],
	objects_length = ds_list_size(objects);
	
for (var i=0;i<objects_length;i++) {
	var obj = objects[| i];
	
	
}

ds_map_destroy(json_object);