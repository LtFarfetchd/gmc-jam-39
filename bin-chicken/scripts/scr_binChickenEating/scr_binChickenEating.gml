function scr_binChickenEating(){
	
	// handle state behaviour
	var sps = game_get_speed(gamespeed_fps); // steps per second
	var energyChange = min(
		consumptionRate / sps // if the normal amount can be consumed
		, global.STARTING_ENERGY - energy // if the limiting factor is energy maximum
		, binInside.energy // if the limiting factor is bin's remaining energy
	);
	
	binInside.energy -= energyChange;
	energy += energyChange;
	trashSpawnTimer++;
	
	if (trashSpawnTimer >= sps / TRASH_SPAWN_RATE) {// ~ three trash / second
		instance_create_layer(x, y, layer, obj_trash);
		trashSpawnTimer = 0;
	}
	
	// handle state transition testing
	if (energyChange <= 0) {
		audio_play_sound(
			scr_arrayChoose(ds_map_find_value(SOUND_EFFECTS, sfxTypes.burp))
			, SFX_PRIORITY, false
		);
		audio_stop_sound(sfx_BinEat_LOOP);
		nextState = states.standing;
		binInside = noone;
		trashSpawnTimer = 0;
	}
}