// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_binChickenStanding(){
	
	// handle state behaviour
	var sps = game_get_speed(gamespeed_fps);
	if (irandom(CALL_PROBABILITY * sps) <= 0) {
		audio_play_sound(
			scr_arrayChoose(ds_map_find_value(SOUND_EFFECTS, sfxTypes.call))
			, SFX_PRIORITY, false
		);
	}
	
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
		audio_play_sound(
			scr_arrayChoose(ds_map_find_value(SOUND_EFFECTS, sfxTypes.binHit))
			, SFX_PRIORITY, false
		);
		audio_play_sound(sfx_BinEat_LOOP, SFX_PRIORITY, true);
		nextState = states.eating;	
		binInside = bin;
	}
	else if (keyboard_check_pressed(vk_space)) {
		nextState = states.flying;
	}
}