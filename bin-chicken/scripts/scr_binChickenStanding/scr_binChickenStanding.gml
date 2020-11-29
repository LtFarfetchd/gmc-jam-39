// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_binChickenStanding(){
	
	// handle state behaviour
	
	// handle state transition testing
	if (keyboard_check_pressed(vk_space)) {
		nextState = states.flying;
	}
	else if (keyboard_check_pressed(vk_down)) {
		// TODO: perform a test for whether you're in a bin
		nextState = states.eating;
	}
}