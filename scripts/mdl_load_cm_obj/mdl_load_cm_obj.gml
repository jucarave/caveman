/// @description loads a collision mesh obj file
/// @param filename

var filename = argument[0],
	file, line, type, face, vertex, 
	v, order,
	vertices = [0], 
	triangles = [];

if (!file_exists(filename)){
	show_message("Collision mesh [" + filename + "] was not found!");
	game_end();
	return noone;
}

file = file_text_open_read(filename);

while (!file_text_eof(file)) {
	line = file_text_read_string(file);
	file_text_readln(file);
	
	if (string_char_at(line, 1) == "#"){ continue; }
	
	type = string_copy(line, 1, 2);
	line = string_replace_all(line, type, "");
	
	if (type == "v ") {
		vertices[array_length_1d(vertices)] = string_explode_real(line, " ");
	}else if (type == "f ") {
		face = string_explode(line, " ");
		
		for (var i=0;i<3;i++) {
			vertex = string_explode_real(face[i], "/");
			v = vertices[vertex[0]];
			
			triangles[array_length_1d(triangles)] = v;
		}
	}
}

file_text_close(file);

var bbox = cs_calculate_bbox(vertices);

return [bbox, triangles];