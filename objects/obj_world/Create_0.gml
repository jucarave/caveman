/// @description Creates the world model

//plane = pb_plane(160.0, 160.0, c_green);
//plane = obj_system.terrain;
plane = mdl_load_obj("landscape/landscape.obj");
height_map = sys_grid_from_vertices(plane[1], 26, 25);
plane = plane[0];

// Trees
tree_model = mdl_load_obj("models/tree.obj");
tree_model = tree_model[0];
trees[0] = array_1d(4.0, 1.0, 0.0);
trees[1] = array_1d(20.0, 8.0, 0.0);
trees[2] = array_1d(2.0, 24.0, 0.0);

// Animals
instance_create_layer(10, 10, "Instances", obj_animal);

m_world = matrix_build_identity();