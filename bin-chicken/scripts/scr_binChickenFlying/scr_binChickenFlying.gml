
function scr_binChickenFlying() {
	vSpeed += GRAVITY;
	timeSinceLastFlap += 1 / fps_real;
	
	if (keyboard_check_pressed(vk_space) && 
		timeSinceLastFlap >= flapCooldownTime) {
		vSpeed -= flapSpeedBoost;	
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
			nextState = states.standing;
		}
	}
	
	x += hSpeed / fps_real;
	y += vSpeed / fps_real;
	
}