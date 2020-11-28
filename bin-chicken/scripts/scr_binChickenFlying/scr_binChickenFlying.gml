
function scr_binChickenFlying() {
	var sps = game_get_speed(gamespeed_fps); // steps per second
	
	if (previousState != states.flying) {
		// perform initial flap
		vSpeed = FLAP_SPEED_BOOST;
	}
	
	// update step-relevant variables
	vSpeed += GRAVITY;
	timeSinceLastFlap += 1 / sps;
	
	if (keyboard_check_pressed(vk_space) && 
		timeSinceLastFlap >= FLAP_COOLDOWN_TIME) {
		vSpeed += FLAP_SPEED_BOOST;	
		timeSinceLastFlap = 0;
	}
	
	var xChange = hSpeed / sps;
	var yChange = vSpeed / sps;
	
	// bounce off walls
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
			nextState = states.standing;
		}
	}
	
	if (x + xChange < 0) {
		xChange = -x;	
	}
	
	x += xChange;
	y += yChange;
	
}