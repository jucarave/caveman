/// @description Creates the world model

plane = pb_plane(160.0, 160.0, c_green);

// Trees
tree_model = mdl_load_obj("models/tree.obj");
trees[0] = array_1d(4.0, 1.0, 0.0);
trees[1] = array_1d(20.0, 8.0, 0.0);
trees[2] = array_1d(2.0, 24.0, 0.0);

// Animals
instance_create_layer(10, 10, "Instances", obj_animal);

m_world = matrix_build_identity();