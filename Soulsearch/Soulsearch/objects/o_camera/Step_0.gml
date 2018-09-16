/// @description Update Camera

// Update destination
if instance_exists(follow){
	xTo = follow.x + 20 * follow.image_xscale;
	yTo = follow.y - 16 + follow.ySpeed * 2;
}

// Update object position
x += (xTo - x) / 7;
y += (yTo - y) / 10;

// Keep it in the room - buff accomodates screenshake
x = clamp(x, view_w_half + buff, room_width - view_w_half - buff);
y = clamp(y, view_h_half + buff, room_height - view_h_half - buff);

// Screen shake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain - 1/shake_length * shake_magnitude);

// Update camera view
camera_set_view_pos(cam, x - view_w_half, y - view_h_half);
