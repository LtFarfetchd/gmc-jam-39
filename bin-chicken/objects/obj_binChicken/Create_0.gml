enum states {
	standing,
	eating,
	flying,
	dead
}

STATE_SPRITES = scr_build_map(
	states.standing, spr_binChickenStand
	, states.eating, spr_binChickenEat
	, states.dead, spr_binChickenDie
	, states.flying, spr_binChickenFly
);

STATE_SCRIPTS = scr_build_map(
	states.standing, scr_binChickenStanding
	, states.eating, scr_binChickenEating
	, states.dead, scr_binChickenDead
	, states.flying, scr_binChickenFlying
);

state = states.standing;
nextState = undefined;