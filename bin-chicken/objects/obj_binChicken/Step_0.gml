
// handle game exiting
if (keyboard_check_pressed(vk_escape)) {
	game_end();	
}

// handle state actions
script_execute(ds_map_find_value(STATE_SCRIPTS, state))

// handle energy reporting
HUD.energy = energy;
HUD.hp = hp;

// handle death by book
if (hp <= 0) {
	nextState = states.dead;	
}

if (previousState != state) {
	// happens before transitions and after state execution in the following step	
	previousState = state; 
}

// handle state transition
if (nextState != undefined) {
	sprite_index = ds_map_find_value(STATE_SPRITES, nextState);
	previousState = state;
	state = nextState;
	nextState = undefined;
}