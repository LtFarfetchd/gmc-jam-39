if (bbox_top > room_height) {
	instance_destroy();	
}

timeSinceSpawn++;

var xChange = x - X_START;

var newY = Y_START - (A * sqr(xChange) + B * xChange) / 2;
var xEnd = -B / A;
var newX = X_START + (xEnd * timeSinceSpawn / (ARC_TIME * game_get_speed(gamespeed_fps)));

x = newX;
y = newY;