
var sps = game_get_speed(gamespeed_fps);
vSpeed += GRAVITY / sps;

if (place_meeting(x, y, obj_binChicken)) {
	// destroy self and spawn pages
	instance_destroy();
	{
		repeat(PAGE_SPAWN_NUMBER)
		instance_create_layer(
			x + sprite_width * choose(0.5, 1, 1.5)
			, y + sprite_height * choose (0.5, 1, 1.5)
			, layer
			, obj_bookPage
		);
	}
}

x += hSpeed;
y += vSpeed;