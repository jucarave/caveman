/// @description Update the light view to follow the player
var p = obj_player;
light_view = matrix_build_lookat(p.x + 20, p.y + 20, p.z + 20, p.x, p.y, p.z, 0, 0, 1);

light_update = true;