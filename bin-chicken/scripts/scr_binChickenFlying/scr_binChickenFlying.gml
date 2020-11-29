
function scr_binChickenFlying() {
	var sps = game_get_speed(gamespeed_fps); // steps per second
	
	if (previousState != states.flying && state != states.dead) {
		// perform initial flap
		vSpeed = FLAP_SPEED_BOOST;
	}
	
	// update step-relevant variables
	vSpeed += GRAVITY;
	timeSinceLastFlap += 1 / sps;
	
	if (state != states.dead) {
		// handle input
		if (keyboard_check_pressed(vk_space)
			&& timeSinceLastFlap >= FLAP_COOLDOWN_TIME) 
		{
			var trajectory = (facingDirection + 90) % 360;

			vSpeed += dsin(trajectory) * FLAP_SPEED_BOOST;
			hSpeed += dcos(trajectory) * abs(FLAP_SPEED_BOOST);
			timeSinceLastFlap = 0;
		}
		
		var rotationChange = ROTATION_SPEED / sps *
			(keyboard_check(vk_left) - keyboard_check(vk_right));
		
		// handle energy depletion
		energy = max(0, energy - ENERGY_DEPLETION_RATE / sps);
	}
	
	var xChange = hSpeed / sps;
	var yChange = vSpeed / sps;
	
	// horizontal bouncing off borders and transition handling
	if (place_meeting(x + xChange, y, obj_wall)) {
		while (!place_meeting(x + sign(xChange), y, obj_wall)) {
			x += sign(xChange);
			y += sign(yChange);
		}
		// bounce
		hSpeed = -hSpeed / 2;
		xChange = -xChange / 2;
		if (abs(hSpeed) >= DEATH_SPEED) { // die
			timeSinceLastFlap = 0;
			nextState = states.dead;
		}
		else if (abs(hSpeed) >= STUN_SPEED) { // stun
			timeSinceLastFlap = STUN_FLAP_LAG_VALUE;	
		}
	}
	
	// vertical bouncing off objects and transition handling 
	// TODO: merge common code
	if (place_meeting(x, y + yChange, obj_wall)) {
		if (yChange < 0) {
			while (!place_meeting(x, y, obj_wall)) {
				x += sign(xChange);
				y--;
			}
			// bounce
			vSpeed = -vSpeed / 2;
			yChange = -yChange / 2;	
			if (abs(vSpeed) >= DEATH_SPEED) { // die
				timeSinceLastFlap = 0;
				nextState = states.dead;
			}
			else if (abs(vSpeed) >= STUN_SPEED) { // stun
				timeSinceLastFlap = STUN_FLAP_LAG_VALUE;	
			}
		}
		else if (yChange > 0) {
			while (!place_meeting(x, y, obj_wall)) {
				x += sign(xChange);
				y++;	
			}	
			if (abs(vSpeed) < STUN_SPEED
				&& (facingDirection < LANDING_ANGLE_MARGIN
				|| facingDirection > 360 - LANDING_ANGLE_MARGIN)) 
			{ // transition to standing 
				vSpeed = 0;
				yChange = 0;
				hSpeed = 0;
				facingDirection = 0;
				timeSinceLastFlap = 0;
				nextState = (state == states.dead) ? states.dead : states.standing;
			}
			else {
				// bounce
				vSpeed = -vSpeed / 2;
				yChange = -yChange / 2;
				if (abs(vSpeed) >= DEATH_SPEED) { // die
					timeSinceLastFlap = 0;
					nextState = states.dead;
				}
				else if (abs(vSpeed) >= STUN_SPEED) { // stun
					timeSinceLastFlap = STUN_FLAP_LAG_VALUE;
				}
			}
		}
	}
	
	// final movement
	x += xChange;
	y += yChange;
	var newDirection = facingDirection + rotationChange;
	facingDirection = newDirection < 0 ? newDirection + 360 : newDirection % 360;
}