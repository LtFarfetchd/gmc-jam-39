
function scr_binChickenFlying() {
	var sps = game_get_speed(gamespeed_fps); // steps per second
	
	if (previousState != states.flying && state != states.dead) {
		// perform initial flap
		vSpeed = FLAP_SPEED_BOOST;
	}
	
	// update step-relevant variables
	vSpeed += GRAVITY;
	timeSinceLastFlap += 1 / sps;
	
	if (state != states.dead 
		&& keyboard_check_pressed(vk_space)
		&& timeSinceLastFlap >= FLAP_COOLDOWN_TIME) 
	{
		vSpeed += FLAP_SPEED_BOOST;	
		timeSinceLastFlap = 0;
	}
	
	var xChange = hSpeed / sps;
	var yChange = vSpeed / sps;
	
	// bounce off walls - need to revise this code
	// TODO: kill at a particular hSpeed
	if (instance_place(x + xChange, y, obj_wall)) {
		while (!instance_place(x + sign(xChange), y, obj_wall)) {
			x += sign(xChange);
		}
		hSpeed = -hSpeed;	
		xChange = -xChange;
	}
	if (instance_place(x, y + yChange, obj_wall)){
		while (instance_place(x, y + sign(yChange), obj_wall)) {
			y += sign(yChange);
		}
		if (yChange < 0) { // if hitting the roof
			vSpeed = -vSpeed;
			yChange = -yChange;
		}
		else {
			vSpeed = 0;
			yChange = 0;
			timeSinceLastFlap = 0;
			nextState = (state == states.dead) ? states.dead : states.standing;
		}
	}
	
	// TODO: horizontal bouncing off borders and transition handling
	if (x - sprite_width / 2 + xChange < 0) {
		xChange = - (x - sprite_width / 2);	
	}
	else if (x + sprite_width / 2 + xChange > room_width) {
		xChange = room_width - (x + sprite_width / 2);	
	}
	
	// vertical bouncing off borders and transition handling
	if (y - sprite_height / 2 + yChange < 0) {
		while (y - sprite_height / 2 > 0) {
			y--;	
		}
		vSpeed = -vSpeed;
		yChange = -yChange;	
		if (abs(vSpeed) > DEATH_SPEED) {
			timeSinceLastFlap = 0;
			nextState = states.dead;
		}
	}
	else if (y + sprite_height / 2 + yChange > room_height) {
		if (abs(vSpeed) < DEATH_SPEED) { // transition to standing
			while (y + sprite_height / 2 < room_height) {
				y++;	
			}
			vSpeed = 0;
			yChange = 0;
			timeSinceLastFlap = 0;
			nextState = (state == states.dead) ? states.dead : states.standing;
		}
		else { // bounce and die
			vSpeed = yChange;
			yChange = -yChange;
			timeSinceLastFlap = 0;
			nextState = states.dead;
		}
	}
	
	// final movement
	x += xChange;
	y += yChange;
}