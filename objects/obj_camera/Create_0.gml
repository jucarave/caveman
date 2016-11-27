/// @description Initializes the camera properties and matrices

// Camera properties
fov = 60;
near = 0.01;
far = 100.0;
ratio = window_get_width() / window_get_height();

// Creates projection matriz
m_projection = matrix_build_projection_perspective_fov(fov, ratio, near, far);

// View matriz
m_view = matrix_build_lookat(0, 15, 15, 0, 0, 0, 0, 0, 1);