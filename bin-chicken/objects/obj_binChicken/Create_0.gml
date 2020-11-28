enum states {
	standing,
	eating,
	flying,
	dead
}

// initialising variables

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
hSpeed = 0;
vSpeed = 0;
timeSinceLastFlap = 0; // in seconds
flapCooldownTime = 1; // in seconds
flapSpeedBoost = -20; // in pixels per second
GRAVITY = 3; // in pixels per second