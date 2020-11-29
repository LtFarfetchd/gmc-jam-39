image_alpha -= ALPHA_CHANGE;

if (image_alpha <= 0) {
	instance_destroy();
}