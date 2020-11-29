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
	
	// handle state transition testing
	if (energyChange <= 0) {
		nextState = states.standing;
		binInside = noone;
	}
}