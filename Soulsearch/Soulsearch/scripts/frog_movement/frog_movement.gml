// Move left, right, or idle
if input.right {
	sprite_index = move_sprite;
	image_xscale = 1;
	xSpeed = lerp(xSpeed, move_speed, acceleration);
}
else if input.left {
	// Left move sprite
	sprite_index = move_sprite;
	image_xscale = -1;
	xSpeed = lerp(xSpeed, -move_speed, acceleration);
}
else if (input.left and input.right) or (!input.left and !input.right){
	// Idle sprite
	sprite_index = idle_sprite;
	xSpeed = lerp(xSpeed, 0, acceleration);
}

// check if we're on the ground or in the air
if place_meeting(x, y+1, o_wall){
	// Jump!
	if input.up{
		bounce(jump_height);
	}
} else {
	//Fall
	ySpeed = approach(ySpeed, fall_speed, grav);
}