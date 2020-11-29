// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_binChickenDead(){
	if (abs(vSpeed) > 0 || abs(hSpeed) > 0) {
		scr_binChickenFlying();
	}
	// handle state transition
}