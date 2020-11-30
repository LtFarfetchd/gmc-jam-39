timeSinceThrow++;

if (timeSinceThrow >= THROW_FREQUENCY * sps) {
	var sps = game_get_speed(gamespeed_fps);
	var bicken = collision_circle(x, y, THROW_RADIUS, obj_binChicken, false, true);
	if (bicken != noone) {
		// throw book if recharged	
		timeSinceThrow = 0;
		instance_create_layer(x, y, layer, obj_book);	
	}
}
