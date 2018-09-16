/// @description 

#region Controlled
if state = "Inhabited" {
	idle_sprite = s_frog_idle_active;
	move_sprite = s_frog_idle_active;
	
	frog_movement();
	
	// Transfer-Out
	if o_soul.state == "Transfer-Out"{
		state = "Transfer-Out";
	}
}
#endregion

#region AI behavior
else if state = "Roam" {
	if ready == false{
		state_set_sprite(s_frog_idle, 1, 0);
	}
	
	// Check if in range and being jumped on
	else if ready == true{
		state_set_sprite(s_frog_idle_ready, 1, 0);
		
		if o_soul.state == "Inhabiting"{
			xSpeed = 0;
			//Transfer soul in
			state = "Transfer-In";
		}
		
		// make sure we're still in range
		if distance_to_object(o_soul) > o_soul.jump_range {
			ready =false;
		}
	}
	
	// Every time the alarm goes off, randomly choose an action
	if alarm[0] <= 0 {
		action = irandom(4);
		alarm[0] = action_timer;
	}
	
	#region Random action selection
		switch action {
			// Idle
			case 0 :	
				sprite_index = s_frog_idle;
				xSpeed = 0;
				break;
				
			// Move Right
			case 1 :	
				image_xscale = 1;
				xSpeed = walk_speed;
				break;
			
			// Move Left
			case 2 :	
				image_xscale = -1;
				xSpeed = -walk_speed;
				break;
				
			// Jump
			case 3 :	
				xSpeed = 0;
				break;
				
			// Default 
			default :
				xSpeed = 0;
				break;
		}
		#endregion
}
#endregion

#region Transfer-In
else if state == "Transfer-In"{
	state_set_sprite(s_frog_transfer, 1, 0);
	if animation_end(){
		state = "Inhabited";
	}
}
#endregion

#region Transfer-Out
else if state == "Transfer-Out"{
	state_set_sprite(s_frog_transfer_out, 1, 0);
	if animation_end(){
		state = "Roam";
	}
}
#endregion



move_and_collide();