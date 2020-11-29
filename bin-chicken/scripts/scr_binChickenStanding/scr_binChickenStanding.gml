// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_binChickenStanding(){
	
	// handle state behaviour
	
	// handle state transition testing
	var bin = instance_place(x, y, obj_bin);
	if (energy < global.STARTING_ENERGY
		&& bin != noone
		&& bin.energy > 0
		&& bin.bbox_left < x - sprite_width / 2
		&& bin.bbox_right > x + sprite_width / 2
		&& bin.bbox_top < y - sprite_height / 2
		&& bin.bbox_bottom > y + sprite_height / 2) 
	{
		nextState = states.eating;	
		binInside = bin;
	}
	else if (keyboard_check_pressed(vk_space)) {
		nextState = states.flying;
	}
}