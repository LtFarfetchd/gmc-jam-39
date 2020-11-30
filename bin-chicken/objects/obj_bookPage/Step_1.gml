if (!trajectoryComputed) {
	var sps = game_get_speed(gamespeed_fps);
	hSpeed = (x - X_START) * (MOVE_SPEED / sps);
	vSpeed = (y - Y_START) * (MOVE_SPEED / sps);
	trajectoryComputed = true;
}

x += hSpeed;
y += vSpeed;

image_alpha -= ALPHA_CHANGE;

if (image_alpha <= 0) {
	instance_destroy();	
}