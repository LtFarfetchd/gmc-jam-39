
// handle state actions
script_execute(ds_map_find_value(STATE_SCRIPTS, state))

// handle state transition
if (nextState != undefined) {
	sprite_index = ds_map_find_value(STATE_SPRITES, state);
	state = nextState;
	nextState = undefined;
}