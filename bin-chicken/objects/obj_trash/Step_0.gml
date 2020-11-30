if (bbox_top > room_height) {
	instance_destroy();	
}

timeSinceSpawn++;

if (timeSinceSpawn % MOTE_SPAWN_STEPS == 0)
{
	instance_create_layer(x, y, layer, obj_mote);
}

var xChange = x - X_START;

var newY = Y_START - (A * sqr(xChange) + B * xChange) / 8;
var xEnd = -B / A;
var newX = X_START + (xEnd * timeSinceSpawn / (ARC_TIME * game_get_speed(gamespeed_fps)));

x = newX;
y = newY;
image_angle += ROTATION;