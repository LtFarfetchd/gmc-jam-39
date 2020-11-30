
var sps = game_get_speed(gamespeed_fps);

if (place_meeting(x, y, obj_binChicken)) {
	// destroy self and spawn pages
	repeat(choose(PAGE_SPAWN_NUMBER - 1, PAGE_SPAWN_NUMBER, PAGE_SPAWN_NUMBER + 1)) {
		var page = instance_create_layer(
			x + sprite_width * choose(0.5, 1, 1.5) * choose(-1, 1)
			, y + sprite_height * choose (0.5, 1, 1.5) * choose (-1, 1)
			, layer
			, obj_bookPage
		);
		with (page) {
			X_START = other.x;
			Y_START = other.y;
		}
	}
	instance_destroy();
}

vSpeed += GRAVITY / sps;
x += hSpeed;
y += vSpeed

image_angle += ROTATION;