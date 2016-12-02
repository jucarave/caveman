/// @description Creates the world model

//plane = pb_plane(160.0, 160.0, c_green);
//plane = obj_system.terrain;
plane = mdl_load_obj("landscape/landscape.obj");
height_map = sys_grid_from_vertices(plane[1], 26, 25);
plane = plane[0];

// Trees
tree_model = mdl_load_obj("models/tree.obj");
tree_model = tree_model[0];

tree_model_2 = mdl_load_obj("models/tree_2.obj");
tree_model_2 = tree_model_2[0];

fern = mdl_load_obj("models/fern.obj");
fern = fern[0];

trees = [];

// Animals
instance_create_layer(10, 10, "Instances", obj_animal);

m_world = matrix_build_identity();