image_speed = 0;
image_index = choose(0, 1, 2);

THROW_TIME = 3; // in seconds
PAGE_SPAWN_NUMBER = 3;

var sps = game_get_speed(gamespeed_fps);
var bicken = instance_find(obj_binChicken, 0);

GRAVITY = bicken.GRAVITY; // in pixels per second

var aimingPointX = bicken.x;
var aimingPointY = bicken.y 
	- (sprite_get_height(bicken.sprite_index) * bicken.image_yscale)
	* choose(1, 2, 3);
	
// derive a h and vspeed from aiming point vector and throw time
hSpeed = (x - aimingPointX) / (THROW_TIME * sps); // pixels per step
vSpeed = (aimingPointY - y) / (THROW_TIME * sps); // pixels per step
	