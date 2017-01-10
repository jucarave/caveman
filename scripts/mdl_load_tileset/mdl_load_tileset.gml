/// @description Loads a tileset for building dungeons
/// @param tileset_code

var tileset_code = argument[0],
	filename = "tilesets/" + tileset_code + ".json",
	json_string = "";
	
if (obj_system.tileset != noone && obj_system.tileset[? "name"] == tileset_code) {
	return obj_system.tileset;
}
	
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

var json_object = json_decode(json_string);

if (obj_system.tileset != noone) {
	ds_map_destroy(obj_system.tileset);
	obj_system.tileset = json_object;
}

return json_object;