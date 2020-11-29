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
previousState = states.standing;
nextState = undefined;
hSpeed = 0;
vSpeed = 0;
facingDirection = 0;
timeSinceLastFlap = 0; // in seconds
FLAP_COOLDOWN_TIME = 0.3; // in seconds
STUN_FLAP_LAG_VALUE = -FLAP_COOLDOWN_TIME; // in seconds, timeSinceLastFlap is set to this on stun
FLAP_SPEED_BOOST = -500; // in pixels per second
GRAVITY = 15; // in pixels per second
ROTATION_SPEED = 135; // in degrees per second;
DEATH_SPEED = 600; // in pixels per second
STUN_SPEED = 350; // in pixels per second
LANDING_ANGLE_MARGIN = 45; // degrees either direction from upright within which the bicken can land