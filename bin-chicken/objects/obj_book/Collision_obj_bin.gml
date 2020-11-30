if (place_meeting(x, y + sign(vSpeed), obj_bin)) {
	hSpeed *= -1;
}
if (place_meeting(x + sign(hSpeed), y, obj_bin)) {
	vSpeed *= -1;
}

hasCollidedWithBin = true;