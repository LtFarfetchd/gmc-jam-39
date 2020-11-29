enum states {
	standing,
	eating,
	flying,
	dead
}

enum sfxTypes {
	honk,
	call,
	scream,
	flap,
	hit,
	binHit,
	burp
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

SOUND_EFFECTS = scr_build_map(
	sfxTypes.binHit, scr_array(sfx_BinHit_1, sfx_BinHit_2)
	, sfxTypes.burp, scr_array(sfx_Burp_1, sfx_Burp_2, sfx_Burp_3)
	, sfxTypes.call, scr_array(sfx_IbisCall_1, sfx_IbisCall_2, sfx_IbisCall_3)
	, sfxTypes.flap, scr_array(sfx_Flap_1, sfx_Flap_2, sfx_Flap_3)
	, sfxTypes.hit, scr_array(sfx_Hit_1, sfx_Hit_2, sfx_Hit_3)
	, sfxTypes.honk, scr_array(sfx_IbisHonk_1, sfx_IbisHonk_2, sfx_IbisHonk_3)
	, sfxTypes.scream, scr_array(sfx_IbisScream_1, sfx_IbisScream_2, sfx_IbisScream_3)
);

global.STARTING_ENERGY = 500;

FLAP_COOLDOWN_TIME = 0.3; // in seconds
STUN_FLAP_LAG_VALUE = -FLAP_COOLDOWN_TIME; // in seconds, timeSinceLastFlap is set to this on stun
FLAP_SPEED_BOOST = -500; // in pixels per second
GRAVITY = 15; // in pixels per second
ROTATION_SPEED = 135; // in degrees per second;
DEATH_SPEED = 600; // in pixels per second
STUN_SPEED = 350; // in pixels per second
HIT_SPEED = 100; // in pixels per second, speed at which the hit effect plays
LANDING_ANGLE_MARGIN = 45; // degrees either direction from upright within which the bicken can land
ENERGY_DEPLETION_RATE = 5; // per second while in flight
HUD = instance_find(obj_hud, 0);
TRASH_SPAWN_RATE = 3; // number of trash particles per second
SFX_PRIORITY = 50;
CALL_PROBABILITY = 5; // how many seconds are expected between calls when stationary

state = states.standing;
previousState = states.standing;
nextState = undefined;
hSpeed = 0;
vSpeed = 0;
facingDirection = 0;
timeSinceLastFlap = 0; // in seconds
energy = global.STARTING_ENERGY;
binInside = noone; // current bin the bicken is in
consumptionRate = 10; // energy gain per second
trashSpawnTimer = 0;

// handle music
audio_play_sound(mus_Atmos_LOOP, 99, true);
audio_play_sound(mus_MOTBC_LOOP, 100, true);

randomize();
