
if place_meeting(x + xSpeed, y, o_wall){
	// move one pixel at a time until flush with wall
	repeat(abs(xSpeed)){
		if(not place_meeting(x + sign(xSpeed), y, o_wall)){
			x += sign(xSpeed);
		}
		else {
			break;
		}
	}
	xSpeed = 0;
}

if place_meeting(x, y + ySpeed, o_wall){
	// move one pixel at a time until flush with wall
	repeat(abs(ySpeed)){
		if not place_meeting(x, y + sign(ySpeed), o_wall){
			y += sign(ySpeed);
		} else {
			break;
		}
	}
	ySpeed = 0;
}

x += xSpeed;
y += ySpeed;
