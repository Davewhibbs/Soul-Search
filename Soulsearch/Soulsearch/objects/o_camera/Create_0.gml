/// @description Setup Camera

camera = camera_create();
cam = view_camera[0];
follow = o_soul;
view_w_half = camera_get_view_width(cam) / 2;
view_h_half = camera_get_view_height(cam) / 2;
xTo = xstart;
yTo = ystart;


// Screen shake variables
shake_length = 60;
shake_magnitude = 0;
shake_remain = 0;
buff = 32;			// Make sure this is as big as the biggest screenshake
