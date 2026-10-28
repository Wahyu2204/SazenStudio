// Pause pergerakan game di belakang
global.game_paused = true;

// Posisikan UI tepat di tengah layar kamera
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cam_w = camera_get_view_width(view_camera[0]);
var cam_h = camera_get_view_height(view_camera[0]);

x = cam_x + (cam_w / 2);
y = cam_y + (cam_h / 2);