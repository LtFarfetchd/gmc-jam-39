
function scr_binChickenFlying() {
	var sps = game_get_speed(gamespeed_fps);
	
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
	
	// bounce off walls
	// TODO: kill at a particular hSpeed
	if (instance_place(x + hSpeed, y, obj_wall)) {
		while (!instance_place(x + sign(hSpeed), y, obj_wall)) {
			x += sign(hSpeed);
		}
		hSpeed = -hSpeed;	
	}
	if (instance_place(x, y + vSpeed, obj_wall)){
		while (instance_place(x, y + sign(vSpeed), obj_wall)) {
			y += sign(vSpeed);
		}
		if (vSpeed < 0) { // if hitting the roof
			vSpeed = -vSpeed;
		}
		else {
			vSpeed = 0;
			timeSinceLastFlap = 0;
			nextState = states.standing;
		}
	}
	
	x += hSpeed / sps;
	y += vSpeed / sps;
	
}