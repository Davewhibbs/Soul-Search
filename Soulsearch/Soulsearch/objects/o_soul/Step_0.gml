/// @description State Machine


if state == "Neutral"{
	// Set state sprites
	idle_sprite = s_soul_idle;
	move_sprite = s_soul_move;
	
	player_movement();
	
	// Check if in Range
	if distance_to_object(o_body) <= jump_range{
		state = "In Range";
		// Change the closest body to ready
		host = instance_nearest(x, y, o_body);
		host.ready = true;
	}
}

// Glow when in range of a body
else if state == "In Range" {
	// Set state sprites
	idle_sprite = s_soul_idle_active;
	move_sprite = s_soul_move_active;
	
	player_movement();
	
	// Check if out of range
	if distance_to_object(o_body) > jump_range{
		state = "Neutral";
	}
	
	
	// Check if jumping
	if input.jump {
		state = "Transfer-In";	
	}
}

#region Transfer-In
else if state == "Transfer-In" {
	state_set_sprite(s_soul_transfer_in, 1, 0);
	xSpeed = 0;
	ySpeed = 0;
	if animation_end(){
		state = "Inhabiting";
	}
}
#endregion

#region Transfer-Out
else if state == "Transfer-Out" {
	state_set_sprite(s_soul_transfer_out, 1, 0);
	if animation_end(){
		
		// Move flush to a wall or 32 pixels
		for(var i = 0; i < 16; i++){
			if!place_meeting(x+1*image_xscale, y, o_wall){
				x += 1 * image_xscale;
			}
		}
		
		
		visible = true;
		image_speed *= -1; 
		state = "Neutral";
	}
}
#endregion

#region Inhabiting
else if state == "Inhabiting" {
	visible = false;
	x = host.x;
	y = host.y;
	image_xscale = host.image_xscale;
	
	// Transfer out
	if input.jump{
		state = "Transfer-Out";
	}
}
#endregion

// Move this object
move_and_collide();

show_debug_message(state);