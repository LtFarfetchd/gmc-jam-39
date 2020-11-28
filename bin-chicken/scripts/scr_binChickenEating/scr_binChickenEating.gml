// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_binChickenEating(){
	
	// handle state behaviour
	
	// handle state transition testing
	if (keyboard_check_released(vk_down)) {
		nextState = states.standing;
	}
}