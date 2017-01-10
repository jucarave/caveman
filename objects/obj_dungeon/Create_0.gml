/// @description Loads the dungeon

tileset = mdl_load_tileset("dungeon");
m_world = matrix_build_identity();

// Dunegon instances
instances = [];

// Build dummy room
d_room = vertex_create_buffer();
vertex_begin(d_room, global.VERTEX_FORMAT);

for (var _x=0;_x<5;_x++) {
	for (var _y=0;_y<5;_y++) {
		mdl_create_tileset(d_room, tileset, "floor", [_x * 6 + 3, _y * 6 + 3, 0], 0);
	}
}

mdl_create_tileset(d_room, tileset, "wall", [3, 0, 0], 0);
mdl_create_tileset(d_room, tileset, "wall", [27, 0, 0], 0);

mdl_create_tileset(d_room, tileset, "wall", [0, 3, 0], 90);
mdl_create_tileset(d_room, tileset, "wall", [0, 27, 0], 90);

mdl_create_tileset(d_room, tileset, "wall", [30, 3, 0], 270);
mdl_create_tileset(d_room, tileset, "wall", [30, 27, 0], 270);

mdl_create_tileset(d_room, tileset, "wall", [3, 30, 0], 180);
mdl_create_tileset(d_room, tileset, "wall", [27, 30, 0], 180);

mdl_create_tileset(d_room, tileset, "wallColumn", [0, 0, 0], 0);
mdl_create_tileset(d_room, tileset, "wallColumn", [30, 0, 0], 0);
mdl_create_tileset(d_room, tileset, "wallColumn", [0, 30, 0], 0);
mdl_create_tileset(d_room, tileset, "wallColumn", [30, 30, 0], 0);

mdl_create_tileset(d_room, tileset, "torch", [3, 0, 0], 0);
mdl_create_tileset(d_room, tileset, "torch", [0, 27, 0], 90);
mdl_create_tileset(d_room, tileset, "torch", [30, 3, 0], 270);
mdl_create_tileset(d_room, tileset, "torch", [27, 30, 0], 180);

vertex_end(d_room);