/// @description Loads an .obj model
/// @param filename

var filename = argument[0],
	mdl = vertex_create_buffer(),
	file, line, type, face, vertex, mat, color, alpha,
	v, n, order,
	vertices = [0], 
	normals = [0],
	materials = [0],
	triangles = [],
	order = [0, 2, 1];

if (!file_exists(filename)){
	show_message("Model [" + filename + "] was not found!");
	game_end();
	return mdl;
}

vertex_begin(mdl, global.VERTEX_FORMAT);

file = file_text_open_read(filename);

while (!file_text_eof(file)) {
	line = file_text_read_string(file);
	file_text_readln(file);
	
	if (string_char_at(line, 1) == "#"){ continue; }
	
	type = string_copy(line, 1, 2);
	line = string_replace_all(line, type, "");
	
	if (type == "v ") {
		var args = string_explode_real(line, " ");
		args[1] *= -1; // Blender LH to gms2 RH
		
		vertices[array_length_1d(vertices)] = args;
	}else if (type == "vn") {
		var args = string_explode_real(line, " ");;
		args[1] *= -1; // Blender LH to gms2 RH
		
		normals[array_length_1d(normals)] = args;
	}else if (type == "mt") {
		mat = string_explode(line, " ");
		
		mat[1] = real(mat[1]);
		mat[2] = real(mat[2]);
		mat[3] = real(mat[3]);
		mat[4] = real(mat[4]);
		
		materials[array_length_1d(materials)] = mat;
	}else if (type == "gm") {
		line = string_replace_all(line, " ", "");
		mat = noone;
		for (var i=1,len=array_length_1d(materials);i<len;i++) {
			mat = materials[i];
			if (mat[0] == line){
				color = make_color_rgb(floor(mat[1] * 255), floor(mat[2] * 255), floor(mat[3] * 255));
				alpha = mat[4];
				i = len;
			}
		}
	}else if (type == "f ") {
		if (mat == noone){
			show_message("Face doesn't have a material assigned");
			game_end();
			return;
		}
		
		face = string_explode(line, " ");
		
		for (var i=0;i<3;i++) {
			vertex = string_explode_real(face[order[i]], "/");
			v = vertices[vertex[0]];
			n = normals[vertex[1]];
			
			triangles[array_length_1d(triangles)] = v;
		
			pb_position_normal_color(mdl,	v[0], v[1], v[2],		n[0], n[1], n[2],		color, alpha);
		}
	}
}

file_text_close(file);

vertex_end(mdl);

return [mdl, vertices, triangles];